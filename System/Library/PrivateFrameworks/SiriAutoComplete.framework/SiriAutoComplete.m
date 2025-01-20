uint64_t sub_25C5AC1A4(double a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_source;
  v4 = *MEMORY[0x263F6CCE8];
  sub_25C5EE330();
  OUTLINED_FUNCTION_68();
  (*(void (**)(uint64_t, uint64_t))(v5 + 104))(v3, v4);
  *(double *)(v1 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_fetchPhrasesTimeoutSeconds) = a1;
  type metadata accessor for SiriAutoCompleteHistogram();
  v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v6 + 24) = 1;
  *(void *)(v1 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_histogram) = v6;
  return v1;
}

id sub_25C5AC268(void *a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_error);
  if (result)
  {
    v7 = result;
    sub_25C5EE490();
    id v8 = v7;
    v9 = sub_25C5EE4A0();
    os_log_type_t v10 = sub_25C5EE790();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v16 = v12;
      *(_DWORD *)v11 = 136315138;
      v15[1] = v11 + 4;
      swift_getErrorValue();
      uint64_t v13 = sub_25C5EEAD0();
      v15[2] = sub_25C5CD724(v13, v14, &v16);
      sub_25C5EE7F0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v9, v10, "Error encountered while fetching app intents from Biome: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v12, -1, -1);
      MEMORY[0x26118BA70](v11, -1, -1);
    }
    else
    {
    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

void sub_25C5AC4A4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

BOOL sub_25C5AC50C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a6;
  uint64_t v28 = a5;
  uint64_t v10 = sub_25C5EE4B0();
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v26 = sub_25C5EE940();
  uint64_t v14 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_25C5AC9E0(a1, a3, (void *)(a4 + 16));
  swift_endAccess();
  sub_25C5EE920();
  sub_25C5EE930();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v26);
  double v17 = (double)sub_25C5EEB30();
  sub_25C5EEB30();
  double v19 = (double)v18 * 1.0e-18 + v17;
  double v20 = *(double *)(a2 + OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_fetchPhrasesTimeoutSeconds);
  if (v20 < v19)
  {
    sub_25C5EE490();
    v21 = sub_25C5EE4A0();
    os_log_type_t v22 = sub_25C5EE780();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v23 = 134217984;
      double v30 = v19;
      sub_25C5EE7F0();
      _os_log_impl(&dword_25C5AA000, v21, v22, "%f seconds have passed since requesting SiriKitIntentTranscript events, which is passed our threshold. Not continuing to process more events", v23, 0xCu);
      MEMORY[0x26118BA70](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v10);
  }
  return v20 >= v19;
}

uint64_t sub_25C5AC988(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

void sub_25C5AC9E0(void *a1, void *a2, void *a3)
{
  v165 = a3;
  v159 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  uint64_t v7 = OUTLINED_FUNCTION_58(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8();
  uint64_t v163 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  uint64_t v10 = OUTLINED_FUNCTION_58(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8();
  uint64_t v162 = v11;
  OUTLINED_FUNCTION_40();
  uint64_t v161 = sub_25C5EE330();
  OUTLINED_FUNCTION_0();
  uint64_t v158 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_8();
  uint64_t v160 = v14;
  OUTLINED_FUNCTION_40();
  uint64_t v15 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v17 = v16;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v21 = (char *)&v148 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_57();
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v148 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v148 - v27;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_23();
  v157 = v29;
  MEMORY[0x270FA5388](v30);
  v32 = (char *)&v148 - v31;
  id v33 = objc_msgSend(a1, sel_eventBody);
  if (v33)
  {
    v34 = v33;
    uint64_t v35 = sub_25C5B08A0(v33);
    if (v36 >> 60 == 15)
    {
      sub_25C5EE490();
      v37 = (void *)sub_25C5EE4A0();
      os_log_type_t v38 = sub_25C5EE790();
      if (OUTLINED_FUNCTION_51(v38))
      {
        *(_WORD *)OUTLINED_FUNCTION_69() = 0;
        OUTLINED_FUNCTION_28(&dword_25C5AA000, v39, v40, "nil interaction");
        OUTLINED_FUNCTION_3();
      }

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v4, v15);
      return;
    }
    uint64_t v155 = v15;
    uint64_t v44 = v17;
    unint64_t v45 = v36;
    uint64_t v46 = v35;
    sub_25C5B4790(0, &qword_26A5B9228);
    sub_25C5B4790(0, &qword_26A5B9230);
    v47 = (void *)sub_25C5EE7B0();
    if (v3)
    {
      sub_25C5B467C(v46, v45);

      return;
    }
    uint64_t v149 = v46;
    unint64_t v150 = v45;
    uint64_t v151 = 0;
    if (v47)
    {
      id v152 = v47;
      sub_25C5B0904(v34, (SEL *)&selRef_bundleID);
      uint64_t v48 = v44;
      if (v49)
      {
        v156 = v34;
        swift_bridgeObjectRetain();
        id v50 = objc_msgSend(v152, sel_intent);
        __swift_project_boxed_opaque_existential_1(v159, v159[3]);
        uint64_t v51 = OUTLINED_FUNCTION_47();
        uint64_t v54 = sub_25C5B2B9C(v51, v52, v50, v53);
        uint64_t v56 = v55;
        swift_bridgeObjectRelease_n();

        uint64_t v169 = v54;
        uint64_t v170 = v56;
        uint64_t v57 = v155;
        if (v54 == 0xD000000000000017 && v56 == 0x800000025C5F0940)
        {
          sub_25C5B4254((uint64_t)v159, (uint64_t)v168);
        }
        else
        {
          char v67 = sub_25C5EEA80();
          sub_25C5B4254((uint64_t)v159, (uint64_t)v168);
          if ((v67 & 1) == 0)
          {
            __swift_project_boxed_opaque_existential_1(v168, v168[3]);
            swift_bridgeObjectRetain();
            char v127 = sub_25C5C4D44(v54, v56);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v168);
            if ((v127 & 1) == 0)
            {
              sub_25C5EE490();
              v128 = sub_25C5EE4A0();
              os_log_type_t v129 = sub_25C5EE790();
              if (os_log_type_enabled(v128, v129))
              {
                v130 = (uint8_t *)swift_slowAlloc();
                v166 = (void *)swift_slowAlloc();
                *(_DWORD *)v130 = 136315138;
                OUTLINED_FUNCTION_60();
                uint64_t v131 = v169;
                unint64_t v132 = v170;
                swift_bridgeObjectRetain();
                uint64_t v133 = sub_25C5CD724(v131, v132, (uint64_t *)&v166);
                OUTLINED_FUNCTION_59(v133);
                sub_25C5EE7F0();
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25C5AA000, v128, v129, "Skipping INIntent since app is not installed: %s", v130, 0xCu);
                swift_arrayDestroy();
                OUTLINED_FUNCTION_3();
                OUTLINED_FUNCTION_3();
                sub_25C5B467C(v149, v150);
                OUTLINED_FUNCTION_44();

                (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v155);
              }
              else
              {
                OUTLINED_FUNCTION_44();
                OUTLINED_FUNCTION_26();

                (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v57);
              }
              goto LABEL_61;
            }
LABEL_23:
            id v68 = objc_msgSend(v152, sel_intent);
            id v69 = objc_msgSend(v68, sel__type);

            if (v69 == (id)1
              || (uint64_t v71 = v169,
                  uint64_t v70 = v170,
                  swift_bridgeObjectRetain(),
                  char v72 = sub_25C5AD8DC(v71, v70),
                  swift_bridgeObjectRelease(),
                  (v72 & 1) != 0))
            {
              uint64_t v171 = MEMORY[0x263F8EE78];
              id v73 = v152;
              id v74 = objc_msgSend(v152, sel_intent);
              unsigned int v75 = objc_msgSend(v74, sel_isGenericIntent);

              if (v75)
              {
                id v76 = objc_msgSend(v73, sel_intent);
                uint64_t v77 = v169;
                unint64_t v78 = v170;
                uint64_t v79 = *__swift_project_boxed_opaque_existential_1(v159, v159[3]);
                swift_bridgeObjectRetain();
                unint64_t v80 = sub_25C5B2C98(v76, v156, v77, v78, v79);
                v82 = v81;

                swift_bridgeObjectRelease();
                v83 = v165;
                uint64_t v84 = MEMORY[0x263F8EE78];
                if (v82)
                {
                  sub_25C5E9A5C(0, 1, 1, MEMORY[0x263F8EE78]);
                  uint64_t v84 = v85;
                  unint64_t v87 = *(void *)(v85 + 16);
                  unint64_t v86 = *(void *)(v85 + 24);
                  uint64_t v88 = v87 + 1;
                  if (v87 >= v86 >> 1)
                  {
LABEL_64:
                    sub_25C5E9A5C(v86 > 1, v88, 1, v84);
                    uint64_t v84 = v147;
                  }
                  *(void *)(v84 + 16) = v88;
                  unint64_t v89 = v84 + 16 * v87;
                  *(void *)(v89 + 32) = v80;
                  *(void *)(v89 + 40) = v82;
                  uint64_t v171 = v84;
                }
              }
              else
              {
                swift_bridgeObjectRetain();
                id v90 = objc_msgSend(v73, sel_intent);
                __swift_project_boxed_opaque_existential_1(v159, v159[3]);
                uint64_t v91 = OUTLINED_FUNCTION_47();
                sub_25C5B2FF4(v91, v92, v156, v90, v93, v164);
                uint64_t v95 = v94;
                swift_bridgeObjectRelease();

                sub_25C5C5280(v95);
                uint64_t v84 = v171;
                v83 = v165;
              }
              uint64_t v148 = v84;
              uint64_t v96 = *(void *)(v84 + 16);
              v97 = v156;
              if (v96)
              {
                uint64_t v155 = OBJC_IVAR____TtC16SiriAutoComplete19SiriKitIntentSource_histogram;
                v154 = (void (**)(uint64_t, void, uint64_t))(v158 + 104);
                v98 = (unint64_t *)(v148 + 40);
                unsigned int v153 = *MEMORY[0x263F6CCE8];
                do
                {
                  uint64_t v99 = *(v98 - 1);
                  unint64_t v87 = *v98;
                  swift_bridgeObjectRetain();
                  swift_retain();
                  sub_25C5BDEDC();
                  swift_release();
                  if (*(void *)(*v83 + 16)
                    && (swift_bridgeObjectRetain(),
                        sub_25C5B0114(v99, v87),
                        char v101 = v100,
                        swift_bridgeObjectRelease(),
                        (v101 & 1) != 0))
                  {
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    v157 = v98;
                    uint64_t v158 = v96;
                    uint64_t v102 = sub_25C5B0904(v97, (SEL *)&selRef_intentClass);
                    if (v103) {
                      v104 = (void *)v102;
                    }
                    else {
                      v104 = 0;
                    }
                    if (v103) {
                      unint64_t v105 = v103;
                    }
                    else {
                      unint64_t v105 = 0xE000000000000000;
                    }
                    v166 = v104;
                    unint64_t v167 = v105;
                    swift_bridgeObjectRetain();
                    sub_25C5EE5F0();
                    swift_bridgeObjectRelease();
                    v107 = v166;
                    unint64_t v106 = v167;
                    id v108 = objc_msgSend(v97, sel_identifier);
                    sub_25C5EE580();

                    v166 = v107;
                    unint64_t v167 = v106;
                    swift_bridgeObjectRetain();
                    sub_25C5EE5F0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    v159 = v166;
                    uint64_t v88 = sub_25C5EE410();
                    (*v154)(v160, v153, v161);
                    uint64_t v109 = sub_25C5EE1D0();
                    unint64_t v80 = v99;
                    __swift_storeEnumTagSinglePayload(v162, 1, 1, v109);
                    uint64_t v110 = sub_25C5EDF30();
                    __swift_storeEnumTagSinglePayload(v163, 1, 1, v110);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    uint64_t v111 = sub_25C5EE3B0();
                    uint64_t v112 = sub_25C5B0904(v156, (SEL *)&selRef_intentClass);
                    v159 = v113;
                    swift_retain();
                    v114 = v165;
                    swift_isUniquelyReferenced_nonNull_native();
                    v115 = v114;
                    v82 = (void *)*v114;
                    v166 = v82;
                    void *v115 = 0x8000000000000000;
                    unint64_t v116 = sub_25C5B0114(v99, v87);
                    unint64_t v86 = v82[2];
                    BOOL v118 = (v117 & 1) == 0;
                    v83 = (void *)(v86 + v118);
                    if (__OFADD__(v86, v118))
                    {
                      __break(1u);
LABEL_63:
                      __break(1u);
                      goto LABEL_64;
                    }
                    unint64_t v80 = v116;
                    uint64_t v88 = v117;
                    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9238);
                    char v119 = sub_25C5EE970();
                    v83 = v165;
                    if (v119)
                    {
                      unint64_t v120 = sub_25C5B0114(v99, v87);
                      if ((v88 & 1) != (v121 & 1))
                      {
                        sub_25C5EEAC0();
                        __break(1u);
                        return;
                      }
                      unint64_t v80 = v120;
                    }
                    v82 = v166;
                    if (v88)
                    {
                      v122 = (uint64_t *)(v166[7] + 24 * v80);
                      swift_release();
                      swift_bridgeObjectRelease();
                      uint64_t *v122 = v111;
                      v122[1] = v112;
                      v122[2] = (uint64_t)v159;
                    }
                    else
                    {
                      v166[(v80 >> 6) + 8] |= 1 << v80;
                      v123 = (uint64_t *)(v82[6] + 16 * v80);
                      uint64_t *v123 = v99;
                      v123[1] = v87;
                      v124 = (uint64_t *)(v82[7] + 24 * v80);
                      uint64_t *v124 = v111;
                      v124[1] = v112;
                      v124[2] = (uint64_t)v159;
                      uint64_t v125 = v82[2];
                      BOOL v126 = __OFADD__(v125, 1);
                      unint64_t v86 = v125 + 1;
                      if (v126) {
                        goto LABEL_63;
                      }
                      v82[2] = v86;
                      swift_bridgeObjectRetain();
                    }
                    v97 = v156;
                    uint64_t v96 = v158;
                    void *v83 = v82;
                    swift_release();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    v98 = v157;
                  }
                  v98 += 2;
                  --v96;
                }
                while (v96);
              }
              OUTLINED_FUNCTION_44();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_25();
            }
            else
            {
              v134 = v157;
              sub_25C5EE490();
              id v135 = v152;
              v136 = sub_25C5EE4A0();
              os_log_type_t v137 = sub_25C5EE790();
              if (os_log_type_enabled(v136, v137))
              {
                uint64_t v138 = swift_slowAlloc();
                v165 = (void *)swift_slowAlloc();
                v166 = v165;
                *(_DWORD *)uint64_t v138 = 136315394;
                uint64_t v164 = v138 + 4;
                id v139 = objc_msgSend(v135, sel_intent);
                id v140 = objc_msgSend(v139, sel__title);

                uint64_t v141 = sub_25C5EE580();
                unint64_t v143 = v142;

                v168[0] = sub_25C5CD724(v141, v143, (uint64_t *)&v166);
                sub_25C5EE7F0();

                swift_bridgeObjectRelease();
                *(_WORD *)(v138 + 12) = 2080;
                OUTLINED_FUNCTION_60();
                uint64_t v144 = v169;
                unint64_t v145 = v170;
                swift_bridgeObjectRetain();
                uint64_t v146 = sub_25C5CD724(v144, v145, (uint64_t *)&v166);
                OUTLINED_FUNCTION_59(v146);
                sub_25C5EE7F0();
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25C5AA000, v136, v137, "Skipping INIntent that is not supported: %s from bundleId: %s", (uint8_t *)v138, 0x16u);
                swift_arrayDestroy();
                OUTLINED_FUNCTION_3();
                OUTLINED_FUNCTION_3();
                OUTLINED_FUNCTION_26();

                (*(void (**)(unint64_t *, uint64_t))(v48 + 8))(v157, v57);
              }
              else
              {

                OUTLINED_FUNCTION_25();
                (*(void (**)(unint64_t *, uint64_t))(v48 + 8))(v134, v57);
              }
            }
LABEL_61:
            swift_bridgeObjectRelease();
            return;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v168);
        goto LABEL_23;
      }
      sub_25C5EE490();
      v61 = (void *)sub_25C5EE4A0();
      os_log_type_t v62 = sub_25C5EE790();
      BOOL v63 = OUTLINED_FUNCTION_51(v62);
      uint64_t v64 = v155;
      if (v63)
      {
        *(_WORD *)OUTLINED_FUNCTION_69() = 0;
        OUTLINED_FUNCTION_28(&dword_25C5AA000, v65, v66, "nil bundleId");
        OUTLINED_FUNCTION_3();
        sub_25C5B467C(v149, v150);
        OUTLINED_FUNCTION_44();
      }
      else
      {
        OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_25();
      }

      (*(void (**)(char *, uint64_t))(v44 + 8))(v28, v64);
    }
    else
    {
      sub_25C5EE490();
      sub_25C5EE4A0();
      os_log_type_t v58 = sub_25C5EE790();
      if (OUTLINED_FUNCTION_51(v58))
      {
        *(_WORD *)OUTLINED_FUNCTION_69() = 0;
        OUTLINED_FUNCTION_28(&dword_25C5AA000, v59, v60, "Unable to unarchive INInteraction from Biome event");
        OUTLINED_FUNCTION_3();
      }
      OUTLINED_FUNCTION_26();

      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v155);
    }
  }
  else
  {
    sub_25C5EE490();
    v41 = sub_25C5EE4A0();
    os_log_type_t v42 = sub_25C5EE790();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_69();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_25C5AA000, v41, v42, "nil eventBody", v43, 2u);
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v15);
  }
}

uint64_t sub_25C5AD8DC(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351370);
  *(_OWORD *)(swift_initStackObject() + 16) = xmmword_25C5EF240;
  OUTLINED_FUNCTION_67();
  v4[4] = v6;
  v4[5] = v5;
  v4[6] = v7;
  v4[7] = 0x800000025C5F0AE0;
  v4[8] = v7 | 7;
  v4[9] = 0x800000025C5F0940;
  OUTLINED_FUNCTION_67();
  *(void *)(v8 + 80) = v9;
  *(void *)(v8 + 88) = v10;
  strcpy((char *)(v8 + 96), "com.apple.Maps");
  *(unsigned char *)(v8 + 111) = -18;
  uint64_t v11 = sub_25C5BE7E8(v8);
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (v12)
  {
    uint64_t v35 = a1;
    uint64_t v36 = a2;
    uint64_t v39 = MEMORY[0x263F8EE78];
    sub_25C5C06AC(0, v12, 0);
    uint64_t v13 = v39;
    uint64_t result = sub_25C5B25E4(v11);
    int64_t v15 = result;
    int v17 = v16;
    char v19 = v18 & 1;
    uint64_t v37 = v11;
    uint64_t v38 = v11 + 56;
    while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(v11 + 32))
    {
      if (((*(void *)(v38 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
        goto LABEL_17;
      }
      if (*(_DWORD *)(v11 + 36) != v17) {
        goto LABEL_18;
      }
      uint64_t v20 = (uint64_t *)(*(void *)(v11 + 48) + 16 * v15);
      uint64_t v22 = *v20;
      uint64_t v21 = v20[1];
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_25C5EE1A0();
      uint64_t v24 = *(void *)(v23 + 16);
      swift_bridgeObjectRetain();
      if (v24)
      {
        unint64_t v25 = sub_25C5B0114(v22, v21);
        uint64_t v26 = v21;
        if (v27)
        {
          uint64_t v28 = (uint64_t *)(*(void *)(v23 + 56) + 16 * v25);
          uint64_t v22 = *v28;
          uint64_t v26 = v28[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        uint64_t v26 = v21;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v30 = *(void *)(v39 + 16);
      unint64_t v29 = *(void *)(v39 + 24);
      if (v30 >= v29 >> 1) {
        sub_25C5C06AC(v29 > 1, v30 + 1, 1);
      }
      *(void *)(v39 + 16) = v30 + 1;
      unint64_t v31 = v39 + 16 * v30;
      *(void *)(v31 + 32) = v22;
      *(void *)(v31 + 40) = v26;
      uint64_t v11 = v37;
      uint64_t result = sub_25C5B2500(v15, v17, v19 & 1, v37);
      int64_t v15 = result;
      int v17 = v32;
      char v19 = v33 & 1;
      if (!--v12)
      {
        sub_25C5B4784(result, v32, v33 & 1);
        a1 = v35;
        a2 = v36;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  else
  {
LABEL_15:
    uint64_t v34 = sub_25C5DFE24(v13, v11);
    sub_25C5DFBDC(a1, a2, v34);
    OUTLINED_FUNCTION_35();
    return a2 & 1;
  }
  return result;
}

uint64_t sub_25C5ADB88(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v31 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v30 = (unint64_t)(63 - v5) >> 6;
  uint64_t v32 = a1 + 56;
  uint64_t result = swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      goto LABEL_23;
    }
    int64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v13 >= v30) {
      goto LABEL_40;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_40;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v30) {
          goto LABEL_40;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_23:
    if (!*(void *)(v4 + 16))
    {
      uint64_t v2 = 0;
      goto LABEL_41;
    }
    uint64_t v16 = v3;
    int v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_25C5EEAE0();
    swift_bridgeObjectRetain();
    sub_25C5EE5C0();
    uint64_t v20 = sub_25C5EEB00();
    uint64_t v21 = v4;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_38;
    }
    uint64_t v24 = *(void *)(v21 + 48);
    unint64_t v25 = (void *)(v24 + 16 * v23);
    BOOL v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_25C5EEA80() & 1) == 0)
    {
      uint64_t v27 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v27;
        if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v24 + 16 * v23);
        BOOL v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_25C5EEA80() & 1) != 0) {
          goto LABEL_37;
        }
      }
LABEL_38:
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
LABEL_41:
      sub_25C5B45A0();
      return v2;
    }
LABEL_37:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    uint64_t v4 = v21;
  }
  int64_t v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_40:
    uint64_t v2 = 1;
    goto LABEL_41;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
  if (v14)
  {
    int64_t v12 = i + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      goto LABEL_40;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_25C5ADE70(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel__emptyCopy);
  uint64_t v18 = a2 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  uint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  for (v7 &= v7 - 1; ; uint64_t v7 = (v11 - 1) & v11)
  {
    swift_bridgeObjectRetain();
    int64_t v13 = (void *)sub_25C5EE570();
    id v14 = objc_msgSend(a1, sel_valueForKey_, v13);

    int64_t v15 = (void *)sub_25C5EE570();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setValue_forKey_, v14, v15);
    swift_unknownObjectRelease();

    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v10 >= v8) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void *)(v18 + 8 * v10);
    ++v9;
    if (!v11)
    {
      int64_t v9 = v10 + 1;
      if (v10 + 1 >= v8) {
        goto LABEL_21;
      }
      uint64_t v11 = *(void *)(v18 + 8 * v9);
      if (!v11)
      {
        int64_t v9 = v10 + 2;
        if (v10 + 2 >= v8) {
          goto LABEL_21;
        }
        uint64_t v11 = *(void *)(v18 + 8 * v9);
        if (!v11) {
          break;
        }
      }
    }
LABEL_18:
    ;
  }
  int64_t v12 = v10 + 3;
  if (v12 >= v8)
  {
LABEL_21:
    swift_release();
    type metadata accessor for DefaultLocaleProvider();
    swift_initStaticObject();
    sub_25C5DB464();
    uint64_t v16 = (void *)sub_25C5EE570();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v4, sel__titleForLanguage_, v16);

    sub_25C5EE580();
    return;
  }
  uint64_t v11 = *(void *)(v18 + 8 * v12);
  if (v11)
  {
    int64_t v9 = v12;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v9 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void *)(v18 + 8 * v9);
    ++v12;
    if (v11) {
      goto LABEL_18;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_25C5AE0E4(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_25C5EE150();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  int64_t v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x263F74C28], v8);
  uint64_t v14 = sub_25C5EE140();
  uint64_t v16 = v15;
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v13, v8);
  if (v14 == a1 && v16 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      return 0;
    }
  }
  type metadata accessor for MapsGenericIntentTitleProvider();
  swift_initStackObject();
  return sub_25C5BD34C(a1, a2, a3, a4);
}

uint64_t sub_25C5AE248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25C5B0114(a1, a2);
    if (v3)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  return OUTLINED_FUNCTION_47();
}

uint64_t sub_25C5AE2BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_25C5B0114(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 8 * v4);
  }
  else {
    return 0;
  }
}

double sub_25C5AE304@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_25C5B0114(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_25C5B45D4(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_25C5AE368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_25C5B0114(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_25C5AE3AC(unint64_t a1)
{
  uint64_t v3 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_41();
  sub_25C5EE490();
  char v7 = sub_25C5EE4A0();
  os_log_type_t v8 = sub_25C5EE770();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25C5AA000, v7, v8, "Ranking SiriKit Intent phrases", v9, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  swift_retain();
  sub_25C5BE05C(a1);
  return swift_release();
}

uint64_t sub_25C5AE4D4(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v161 = a3;
  uint64_t v158 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91D8);
  uint64_t v10 = OUTLINED_FUNCTION_58(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8();
  uint64_t v152 = v11;
  OUTLINED_FUNCTION_40();
  uint64_t v155 = sub_25C5EDE50();
  OUTLINED_FUNCTION_0();
  uint64_t v154 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_8();
  uint64_t v153 = v14;
  OUTLINED_FUNCTION_40();
  sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v159 = v15;
  uint64_t v160 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (_DWORD *)((char *)&v150 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_57();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  MEMORY[0x270FA5388](v26);
  v156 = (char *)&v150 - v27;
  OUTLINED_FUNCTION_40();
  uint64_t v28 = sub_25C5EE150();
  OUTLINED_FUNCTION_0();
  uint64_t v30 = v29;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_41();
  (*(void (**)(unint64_t, void, uint64_t))(v30 + 104))(v5, *MEMORY[0x263F74C38], v28);
  uint64_t v32 = sub_25C5EE140();
  uint64_t v34 = v33;
  (*(void (**)(unint64_t, uint64_t))(v30 + 8))(v5, v28);
  if (v32 == a4 && v34 == a5)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_66();
    char v36 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if ((v36 & 1) == 0)
    {
      sub_25C5EE490();
      unint64_t v37 = v161;
      OUTLINED_FUNCTION_15();
      uint64_t v38 = (void *)sub_25C5EE4A0();
      os_log_type_t v39 = sub_25C5EE780();
      if (OUTLINED_FUNCTION_9(v39))
      {
        OUTLINED_FUNCTION_12();
        unint64_t v162 = OUTLINED_FUNCTION_10();
        *uint64_t v19 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v40 = v158;
        uint64_t v168 = sub_25C5CD724(v158, v37, (uint64_t *)&v162);
        sub_25C5EE7F0();
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_14(&dword_25C5AA000, v41, v42, "SiriKitIntentSource: processPlayMediaIntent - returning third party app title as is '%s'");
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();

        OUTLINED_FUNCTION_34();
        v43();
      }
      else
      {

        OUTLINED_FUNCTION_21();
        OUTLINED_FUNCTION_34();
        v71();
        uint64_t v40 = v158;
      }
      swift_bridgeObjectRetain();
      return v40;
    }
  }
  self;
  uint64_t v44 = swift_dynamicCastObjCClass();
  if (!v44)
  {
    sub_25C5EE490();
    OUTLINED_FUNCTION_15();
    uint64_t v65 = (void *)sub_25C5EE4A0();
    os_log_type_t v66 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_9(v66))
    {
      OUTLINED_FUNCTION_12();
      uint64_t v67 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_32(v67);
      OUTLINED_FUNCTION_7(4.8149e-34);
      uint64_t v68 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_5(v68);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_14(&dword_25C5AA000, v69, v70, "SiriKitIntentSource: processPlayMediaIntent - ERROR: cannot convert intent, skipping this title '%s'");
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      OUTLINED_FUNCTION_21();
    }
    goto LABEL_74;
  }
  unint64_t v45 = (void *)v44;
  id v46 = a1;
  unint64_t v47 = sub_25C5B0798(v45);
  if (v47)
  {
    unint64_t v5 = v47;
    id v151 = v46;
    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_25C5EE9B0();
      if (v48) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v48)
      {
LABEL_13:
        uint64_t v49 = 4;
        id v50 = &selRef_title;
        while (1)
        {
          id v46 = (id)(v49 - 4);
          id v51 = (v5 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x26118B200](v49 - 4, v5)
              : *(id *)(v5 + 8 * v49);
          id v52 = v51;
          uint64_t v53 = v49 - 3;
          if (__OFADD__(v46, 1)) {
            break;
          }
          uint64_t v54 = sub_25C5B0904(v51, (SEL *)&selRef_title);
          if (v55)
          {
            uint64_t v56 = v54;
            unint64_t v57 = v55;
            swift_bridgeObjectRelease();
            uint64_t v58 = HIBYTE(v57) & 0xF;
            if ((v57 & 0x2000000000000000) == 0) {
              uint64_t v58 = v56 & 0xFFFFFFFFFFFFLL;
            }
            if (v58)
            {
              swift_bridgeObjectRelease_n();
              id v46 = v151;
              goto LABEL_35;
            }
          }

          ++v49;
          if (v53 == v48) {
            goto LABEL_23;
          }
        }
        __break(1u);
LABEL_78:
        sub_25C5EE590();
        swift_bridgeObjectRelease();
        char v122 = sub_25C5EE650();
        swift_bridgeObjectRelease();
        if ((v122 & 1) == 0) {
          sub_25C5EE5F0();
        }
LABEL_80:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B351370);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25C5EF250;
        OUTLINED_FUNCTION_67();
        v124[4] = v125;
        v124[5] = v126;
        v124[6] = v125;
        v124[7] = 0x800000025C5F08E0;
        v124[8] = v125 - 2;
        v124[9] = 0x800000025C5F0900;
        unint64_t v162 = (unint64_t)v50;
        unint64_t v163 = (unint64_t)v45;
        uint64_t v166 = v125;
        unint64_t v167 = v126;
        char v127 = sub_25C5EE850();
        unint64_t v128 = v161;
        if ((v127 & 1) != 0
          || (uint64_t v129 = *(void *)(inited + 48),
              unint64_t v130 = *(void *)(inited + 56),
              unint64_t v162 = (unint64_t)v50,
              unint64_t v163 = (unint64_t)v45,
              uint64_t v166 = v129,
              unint64_t v167 = v130,
              (OUTLINED_FUNCTION_61() & 1) != 0))
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v148 = *(void *)(inited + 64);
          unint64_t v149 = *(void *)(inited + 72);
          unint64_t v162 = (unint64_t)v50;
          unint64_t v163 = (unint64_t)v45;
          uint64_t v166 = v148;
          unint64_t v167 = v149;
          OUTLINED_FUNCTION_61();
          OUTLINED_FUNCTION_35();
          if ((&v162 & 1) == 0)
          {
            swift_setDeallocating();
            sub_25C5AFBCC();
            goto LABEL_88;
          }
        }
        swift_setDeallocating();
        sub_25C5AFBCC();
        sub_25C5EE590();
        sub_25C5EE640();
        OUTLINED_FUNCTION_35();
        if ((inited & 1) == 0)
        {
          unint64_t v162 = v168;
          unint64_t v163 = v169;
          uint64_t v166 = v53;
          unint64_t v167 = v128;
          uint64_t v131 = sub_25C5EDF70();
          uint64_t v132 = v152;
          __swift_storeEnumTagSinglePayload(v152, 1, 1, v131);
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_24();
          unint64_t v133 = sub_25C5EE840();
          char v135 = v134;
          sub_25C5B4540(v132);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v135 & 1) == 0)
          {
            uint64_t v137 = v168;
            unint64_t v136 = v169;
            swift_bridgeObjectRetain();
            sub_25C5EE660();
            swift_bridgeObjectRelease();
            uint64_t v138 = sub_25C5AF548();
            unint64_t v140 = v139;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            unint64_t v141 = sub_25C5AF4FC(v133, v137, v136);
            unint64_t v143 = v142;
            uint64_t v145 = v144;
            uint64_t v147 = v146;
            swift_bridgeObjectRelease();
            uint64_t v166 = v138;
            unint64_t v167 = v140;
            unint64_t v162 = v141;
            unint64_t v163 = v143;
            uint64_t v164 = v145;
            uint64_t v165 = v147;
            sub_25C5B4630();
            swift_bridgeObjectRetain();
            sub_25C5EE5E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            return v166;
          }
LABEL_89:

          return v168;
        }
LABEL_88:
        swift_bridgeObjectRelease();
        goto LABEL_89;
      }
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
    id v46 = v151;
  }
  id v52 = objc_msgSend(v45, sel_mediaContainer);
  if (!v52)
  {
    uint64_t v59 = v157;
    sub_25C5EE490();
    OUTLINED_FUNCTION_15();
    uint64_t v60 = (void *)sub_25C5EE4A0();
    os_log_type_t v61 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_9(v61))
    {
      swift_slowAlloc();
      uint64_t v62 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_32(v62);
      *uint64_t v59 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v168 = OUTLINED_FUNCTION_4();
      sub_25C5EE7F0();
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_14(&dword_25C5AA000, v63, v64, "SiriKitIntentSource: processPlayMediaIntent - ERROR: cannot get media item, skipping this title '%s'");
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      OUTLINED_FUNCTION_21();
    }

    OUTLINED_FUNCTION_62();
    goto LABEL_75;
  }
LABEL_35:
  uint64_t v72 = sub_25C5B0904(v52, (SEL *)&selRef_title);
  if (!v73)
  {
LABEL_45:
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_15();
    uint64_t v84 = (void *)sub_25C5EE4A0();
    os_log_type_t v85 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_9(v85))
    {
      OUTLINED_FUNCTION_12();
      uint64_t v86 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_32(v86);
      OUTLINED_FUNCTION_7(4.8149e-34);
      uint64_t v87 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_5(v87);
      OUTLINED_FUNCTION_16();
      id v90 = "SiriKitIntentSource: processPlayMediaIntent - title does not have proper media item title, skipping this title '%s'";
LABEL_47:
      OUTLINED_FUNCTION_14(&dword_25C5AA000, v88, v89, v90);
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

LABEL_48:
      goto LABEL_74;
    }
LABEL_73:

    OUTLINED_FUNCTION_21();
LABEL_74:
    OUTLINED_FUNCTION_62();
LABEL_75:
    OUTLINED_FUNCTION_34();
    v120();
    return 0;
  }
  uint64_t v53 = v72;
  unint64_t v74 = v73;
  uint64_t v75 = HIBYTE(v73) & 0xF;
  if ((v73 & 0x2000000000000000) == 0) {
    uint64_t v75 = v72 & 0xFFFFFFFFFFFFLL;
  }
  if (!v75 || (OUTLINED_FUNCTION_48(), v168 = v53, unint64_t v169 = v74, sub_25C5B44F4(), (OUTLINED_FUNCTION_43() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  uint64_t v76 = sub_25C5EE7A0();
  sub_25C5E7FE8((uint64_t)objc_msgSend(v52, sel_type), v76);
  OUTLINED_FUNCTION_35();
  if ((v5 & 1) != 0 || !objc_msgSend(v52, sel_type))
  {
    id v91 = objc_msgSend(v52, sel_type);
    switch((unint64_t)v91)
    {
      case 1uLL:
      case 2uLL:
        swift_bridgeObjectRelease();
        sub_25C5B0904(v52, (SEL *)&selRef_artist);
        if (!v92)
        {
          OUTLINED_FUNCTION_33();
          OUTLINED_FUNCTION_15();
          uint64_t v84 = (void *)sub_25C5EE4A0();
          os_log_type_t v114 = sub_25C5EE780();
          if (!OUTLINED_FUNCTION_9(v114)) {
            goto LABEL_73;
          }
          OUTLINED_FUNCTION_12();
          uint64_t v115 = OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_32(v115);
          OUTLINED_FUNCTION_7(4.8149e-34);
          uint64_t v116 = OUTLINED_FUNCTION_4();
          OUTLINED_FUNCTION_5(v116);
          OUTLINED_FUNCTION_16();
          id v90 = "SiriKitIntentSource: processPlayMediaIntent - item does not have artist, skipping this title '%s'";
          goto LABEL_47;
        }
        OUTLINED_FUNCTION_48();
        swift_bridgeObjectRetain();
        sub_25C5EE5F0();
        sub_25C5EE5F0();

        swift_bridgeObjectRelease();
        return v162;
      case 3uLL:
      case 9uLL:
        goto LABEL_54;
      case 4uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
        goto LABEL_58;
      case 5uLL:
        uint64_t v100 = sub_25C5B0904(v52, (SEL *)&selRef_identifier);
        if (v101)
        {
          id v50 = (char **)v100;
          unint64_t v45 = v101;
          unint64_t v161 = v74;
          OUTLINED_FUNCTION_48();
          sub_25C5EDE40();
          uint64_t v102 = sub_25C5EE810();
          unint64_t v104 = v103;
          OUTLINED_FUNCTION_34();
          v105();
          uint64_t v168 = v102;
          unint64_t v169 = v104;
          sub_25C5EE590();
          swift_bridgeObjectRetain();
          char v106 = sub_25C5EE650();
          swift_bridgeObjectRelease();
          if ((v106 & 1) == 0) {
            goto LABEL_78;
          }
          swift_bridgeObjectRelease();
          goto LABEL_80;
        }
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_33();
        OUTLINED_FUNCTION_15();
        uint64_t v84 = (void *)sub_25C5EE4A0();
        os_log_type_t v117 = sub_25C5EE780();
        if (!OUTLINED_FUNCTION_9(v117)) {
          goto LABEL_73;
        }
        OUTLINED_FUNCTION_12();
        uint64_t v118 = OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_32(v118);
        OUTLINED_FUNCTION_7(4.8149e-34);
        uint64_t v119 = OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_5(v119);
        OUTLINED_FUNCTION_16();
        id v90 = "SiriKitIntentSource: processPlayMediaIntent - playlist does not have identifier, skipping this title '%s'";
        goto LABEL_47;
      default:
        if (v91 != (id)16)
        {
          if (v91 == (id)19)
          {
LABEL_54:

            swift_bridgeObjectRelease();
            goto LABEL_57;
          }
LABEL_58:
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_33();
          OUTLINED_FUNCTION_15();
          id v93 = v52;
          uint64_t v94 = sub_25C5EE4A0();
          os_log_type_t v95 = sub_25C5EE770();
          if (os_log_type_enabled(v94, v95))
          {
            OUTLINED_FUNCTION_31();
            unint64_t v162 = OUTLINED_FUNCTION_11();
            id v96 = OUTLINED_FUNCTION_52(3.8521e-34);
            OUTLINED_FUNCTION_20((uint64_t)v96);

            OUTLINED_FUNCTION_53();
            uint64_t v97 = OUTLINED_FUNCTION_4();
            OUTLINED_FUNCTION_50(v97);
            OUTLINED_FUNCTION_16();
            OUTLINED_FUNCTION_56(&dword_25C5AA000, v98, v99, "SiriKitIntentSource: processPlayMediaIntent - item is %ld, not a music type we are including, skipping this title '%s'");
            OUTLINED_FUNCTION_38();
            OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_3();

            goto LABEL_48;
          }

          OUTLINED_FUNCTION_21();
          goto LABEL_74;
        }
        swift_bridgeObjectRelease();
        uint64_t v107 = sub_25C5B0904(v52, (SEL *)&selRef_identifier);
        if (!v108
          || (unint64_t v162 = v107,
              unint64_t v163 = v108,
              OUTLINED_FUNCTION_67(),
              uint64_t v168 = v109,
              unint64_t v169 = v110,
              OUTLINED_FUNCTION_43(),
              OUTLINED_FUNCTION_35(),
              (v5 & 1) == 0))
        {

          goto LABEL_57;
        }
        OUTLINED_FUNCTION_33();
        OUTLINED_FUNCTION_15();
        uint64_t v84 = (void *)sub_25C5EE4A0();
        os_log_type_t v111 = sub_25C5EE780();
        if (!OUTLINED_FUNCTION_9(v111)) {
          goto LABEL_73;
        }
        OUTLINED_FUNCTION_12();
        uint64_t v112 = OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_32(v112);
        OUTLINED_FUNCTION_7(4.8149e-34);
        uint64_t v113 = OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_5(v113);
        OUTLINED_FUNCTION_16();
        id v90 = "SiriKitIntentSource: processPlayMediaIntent - user radio station in Apple Music, skipping this title '%s'";
        break;
    }
    goto LABEL_47;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_15();
  id v77 = v52;
  unint64_t v78 = sub_25C5EE4A0();
  os_log_type_t v79 = sub_25C5EE780();
  if (os_log_type_enabled(v78, v79))
  {
    OUTLINED_FUNCTION_31();
    unint64_t v162 = OUTLINED_FUNCTION_11();
    id v80 = OUTLINED_FUNCTION_52(3.8521e-34);
    OUTLINED_FUNCTION_20((uint64_t)v80);

    OUTLINED_FUNCTION_53();
    uint64_t v81 = OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_50(v81);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_56(&dword_25C5AA000, v82, v83, "SiriKitIntentSource: processPlayMediaIntent - item is %ld not music type, not modifying title '%s'");
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {

    OUTLINED_FUNCTION_21();
  }
  (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v53, v159);
LABEL_57:
  swift_bridgeObjectRetain();
  return v158;
}

unint64_t sub_25C5AF4FC(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_25C5EE660();
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5AF548()
{
  uint64_t v0 = sub_25C5EE5D0();
  uint64_t v1 = sub_25C5EE7E0();
  BOOL v2 = __OFADD__(v0, v1);
  uint64_t result = v0 + v1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x26118AF10](result);
    sub_25C5B4630();
    sub_25C5EE5E0();
    sub_25C5EE5E0();
    return 0;
  }
  return result;
}

uint64_t sub_25C5AF62C()
{
  sub_25C5EE330();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_34();
  v1();
  swift_release();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_25C5AF6D4()
{
  return type metadata accessor for SiriKitIntentSource();
}

uint64_t type metadata accessor for SiriKitIntentSource()
{
  uint64_t result = qword_26A5B91B0;
  if (!qword_26A5B91B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5AF724()
{
  uint64_t result = sub_25C5EE330();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C5AF7D0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_26A5B91C8 + dword_26A5B91C8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25C5AF888;
  uint64_t v3 = OUTLINED_FUNCTION_47();
  return v5(v3);
}

uint64_t sub_25C5AF888()
{
  OUTLINED_FUNCTION_65();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_6();
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id sub_25C5AF9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = sub_25C5EDF30();
  uint64_t v13 = 0;
  if (__swift_getEnumTagSinglePayload(a1, 1, v12) != 1)
  {
    uint64_t v13 = (void *)sub_25C5EDF00();
    OUTLINED_FUNCTION_68();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v12);
  }
  if (__swift_getEnumTagSinglePayload(a2, 1, v12) == 1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = (void *)sub_25C5EDF00();
    OUTLINED_FUNCTION_68();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a2, v12);
  }
  id v17 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v15, a3, a4, a5 & 1);

  return v17;
}

BOOL sub_25C5AFAD4(uint64_t *a1, uint64_t *a2)
{
  return sub_25C5BDBE4(*a1, *a2);
}

uint64_t sub_25C5AFAE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25C5AFB0C@<X0>(_WORD *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_25C5AFB38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5C5128();
  *a1 = result;
  return result;
}

void *sub_25C5AFB60@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25C5AFB6C(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25C5AFBA4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C5AFBCC()
{
  swift_arrayDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

void *sub_25C5AFC10(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_18();
LABEL_11:
    uint64_t result = (void *)OUTLINED_FUNCTION_49();
    __break(1u);
    return result;
  }
  if (&__dst[8 * a2] > __src && &__src[8 * a2] > __dst)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_17();
    goto LABEL_11;
  }

  return memcpy(__dst, __src, 8 * a2);
}

uint64_t sub_25C5AFCBC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_18();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_49();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_17();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

uint64_t sub_25C5AFD6C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C5AFD84(a1, a2, a3, &qword_26A5B9210);
}

uint64_t sub_25C5AFD78(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25C5AFD84(a1, a2, a3, &qword_26A5B9208);
}

uint64_t sub_25C5AFD84(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_18();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_49();
    __break(1u);
    return result;
  }
  if (a3 + 32 * a2 > a1 && a1 + 32 * a2 > a3)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_17();
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(a4);
  OUTLINED_FUNCTION_27();

  return swift_arrayInitWithCopy();
}

uint64_t sub_25C5AFE44(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_18();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_49();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_30();
  if (!v5 & v4) {
    BOOL v6 = v3 > v2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_17();
    goto LABEL_11;
  }
  sub_25C5B4790(0, (unint64_t *)&qword_26B3510B0);
  OUTLINED_FUNCTION_27();

  return swift_arrayInitWithCopy();
}

uint64_t sub_25C5AFF00(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_18();
LABEL_11:
    uint64_t result = OUTLINED_FUNCTION_49();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_30();
  if (!v5 & v4) {
    BOOL v6 = v3 > v2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_17();
    goto LABEL_11;
  }
  sub_25C5EE410();
  OUTLINED_FUNCTION_27();

  return swift_arrayInitWithCopy();
}

uint64_t sub_25C5AFFAC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_25C5AFFDC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C5B0004(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_25C5EE7F0();
  *a1 = v5;
  return result;
}

void sub_25C5B005C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  BOOL v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25C5EE7F0();
  *a1 = v7;
  os_log_type_t v8 = *a2;
  if (*a2)
  {
    *os_log_type_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_25C5B0114(uint64_t a1, uint64_t a2)
{
  sub_25C5EEAE0();
  sub_25C5EE5C0();
  uint64_t v4 = sub_25C5EEB00();

  return sub_25C5B024C(a1, a2, v4);
}

unint64_t sub_25C5B018C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25C5EEAE0();
  swift_bridgeObjectRetain();
  sub_25C5EE5C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C5EE5C0();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_25C5EEB00();

  return sub_25C5B0330(a1, a2, a3, a4, v8);
}

unint64_t sub_25C5B024C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C5EEA80() & 1) == 0)
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
      while (!v14 && (sub_25C5EEA80() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25C5B0330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = a5 & ~v7;
  if ((*(void *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = *(void *)(v5 + 48);
    do
    {
      uint64_t v15 = (void *)(v14 + 32 * v8);
      uint64_t v16 = v15[2];
      uint64_t v17 = v15[3];
      BOOL v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_25C5EEA80() & 1) != 0)
      {
        BOOL v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_25C5EEA80() & 1) != 0) {
          break;
        }
      }
      unint64_t v8 = (v8 + 1) & v13;
    }
    while (((*(void *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

void *sub_25C5B042C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91E8);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_25C5B0960(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25C5B45A0();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_25C5B0510(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      unint64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9200);
      unint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 32);
    }
    if (v4 != a3)
    {
      sub_25C5AFD84(a2 + 32 * a3, v5, (unint64_t)(v8 + 4), &qword_26A5B9208);
      return;
    }
    goto LABEL_10;
  }
}

const void *sub_25C5B05D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return (const void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91F8);
  uint64_t v1 = (const void *)swift_allocObject();
  size_t v2 = _swift_stdlib_malloc_size(v1);
  OUTLINED_FUNCTION_45((2 * ((uint64_t)(v2 - 32) / 8)) | 1);
  sub_25C5B0B80(v3, v4, v5, v6);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_63();
  if (!v7)
  {
    __break(1u);
    return (const void *)MEMORY[0x263F8EE78];
  }
  return v1;
}

const void *sub_25C5B0684(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return (const void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351370);
  uint64_t v1 = (const void *)swift_allocObject();
  size_t v2 = _swift_stdlib_malloc_size(v1);
  OUTLINED_FUNCTION_45(2 * ((uint64_t)(v2 - 32) / 16));
  sub_25C5B0D7C(v3, v4, v5, v6);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_63();
  if (!v7)
  {
    __break(1u);
    return (const void *)MEMORY[0x263F8EE78];
  }
  return v1;
}

uint64_t sub_25C5B072C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_parametersByName);
  if (!v1) {
    return 0;
  }
  size_t v2 = v1;
  uint64_t v3 = sub_25C5EE550();

  return v3;
}

uint64_t sub_25C5B0798(void *a1)
{
  id v1 = objc_msgSend(a1, sel_mediaItems);
  if (!v1) {
    return 0;
  }
  size_t v2 = v1;
  sub_25C5B4790(0, &qword_26A5B9220);
  uint64_t v3 = sub_25C5EE6B0();

  return v3;
}

uint64_t sub_25C5B0808(void *a1)
{
  id v1 = objc_msgSend(a1, sel__validParameterCombinations);
  if (!v1) {
    return 0;
  }
  size_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
  sub_25C5B4790(0, &qword_26A5B9240);
  sub_25C5B46E8();
  uint64_t v3 = sub_25C5EE550();

  return v3;
}

uint64_t sub_25C5B08A0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_interaction);
  if (!v1) {
    return 0;
  }
  size_t v2 = v1;
  uint64_t v3 = sub_25C5EDEF0();

  return v3;
}

uint64_t sub_25C5B0904(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_25C5EE580();
  }
  return OUTLINED_FUNCTION_47();
}

void *sub_25C5B0960(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v9 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v10 = a2;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v23 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    BOOL v19 = (void *)(*(void *)(a4 + 56) + 24 * v15);
    uint64_t v20 = v19[1];
    uint64_t v21 = v19[2];
    *uint64_t v10 = *v19;
    v10[1] = v20;
    v10[2] = v21;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_38;
    }
    v10 += 3;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        unint64_t v8 = 0;
        int64_t v11 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          unint64_t v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v11;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            unint64_t v8 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                unint64_t v8 = 0;
                int64_t v11 = v13 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v8 = 0;
        int64_t v11 = v16 + 2;
      }
LABEL_37:
      uint64_t v9 = v12;
LABEL_38:
      uint64_t v6 = v22;
      uint64_t result = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_25C5B0B80(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
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
    void *v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25C5B0D7C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
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
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25C5B0F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  v4[27] = a1;
  v4[28] = v7;
  uint64_t v8 = sub_25C5EE4B0();
  v4[29] = v8;
  v4[30] = *(void *)(v8 - 8);
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91D8);
  v4[35] = swift_task_alloc();
  v4[5] = type metadata accessor for DefaultEligibilityCriteria();
  v4[6] = &off_2709C32F0;
  v4[2] = a2;
  v4[10] = type metadata accessor for DefaultAppFinderForIntentProvider();
  v4[11] = &off_2709C34F8;
  v4[7] = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5B110C, 0, 0);
}

uint64_t sub_25C5B110C()
{
  uint64_t v34 = v0;
  uint64_t v2 = (uint64_t)(v0 + 7);
  uint64_t v3 = *(void *)(v0[27] + 16);
  v0[36] = v3;
  if (!v3)
  {
LABEL_15:
    OUTLINED_FUNCTION_64();
    __swift_destroy_boxed_opaque_existential_1(v2);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = (uint64_t (*)(void))v0[1];
    return v29();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  while (1)
  {
    v0[37] = v4;
    uint64_t v5 = (void *)(v0[27] + 24 * v4);
    v0[38] = v5[4];
    uint64_t v6 = v5[5];
    v0[39] = v6;
    uint64_t v7 = v5[6];
    v0[40] = v7;
    OUTLINED_FUNCTION_36();
    uint64_t v9 = *(void *)(v8 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain_n();
    uint64_t v10 = sub_25C5EE3E0();
    if (*(void *)(v9 + 16))
    {
      unint64_t v12 = sub_25C5B0114(v10, v11);
      if (v13) {
        break;
      }
    }
    OUTLINED_FUNCTION_55();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_12:
    OUTLINED_FUNCTION_46();
    if (v28)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = (uint64_t)(v0 + 7);
      goto LABEL_15;
    }
  }
  OUTLINED_FUNCTION_29(v12, *(void *)(v9 + 56));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v7)
  {
    OUTLINED_FUNCTION_55();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t v14 = v0[35];
  swift_bridgeObjectRetain();
  v0[12] = sub_25C5EE3C0();
  v0[13] = v15;
  v0[14] = 24;
  v0[15] = v1;
  uint64_t v16 = sub_25C5EDF70();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v16);
  sub_25C5B44F4();
  OUTLINED_FUNCTION_24();
  sub_25C5EE840();
  char v18 = v17;
  sub_25C5B4540(v14);
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_retain_n();
    swift_bridgeObjectRetain();
    int64_t v19 = sub_25C5EE4A0();
    os_log_type_t v20 = sub_25C5EE780();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = v0[34];
    uint64_t v24 = v0[29];
    uint64_t v23 = v0[30];
    if (v21)
    {
      uint64_t v32 = v0[29];
      uint64_t v25 = OUTLINED_FUNCTION_31();
      uint64_t v33 = OUTLINED_FUNCTION_37();
      *(_DWORD *)uint64_t v25 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v25 + 4) = sub_25C5CD724(24, v1, &v33);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v26 = sub_25C5EE3C0();
      *(void *)(v25 + 14) = sub_25C5CD724(v26, v27, &v33);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_55();
      _os_log_impl(&dword_25C5AA000, v19, v20, "SiriKitIntentSource: %s already in \"%s\", not adding app mention suffix", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      OUTLINED_FUNCTION_55();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v32);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
  uint64_t v31 = (void *)swift_task_alloc();
  v0[43] = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_25C5B154C;
  return sub_25C5DBB30(v6, v7);
}

uint64_t sub_25C5B154C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  *(void *)(v1 + 352) = v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25C5B1624, 0, 0);
}

uint64_t sub_25C5B1624()
{
  unint64_t v73 = v0;
  unint64_t v1 = (unint64_t)(v0 + 24);
  unint64_t v2 = v0[44];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = v0[42];
  uint64_t v70 = v0 + 7;
  if (v3 == 1)
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C5EE4A0();
    os_log_type_t v6 = sub_25C5EE780();
    BOOL v7 = os_log_type_enabled(v5, v6);
    unint64_t v8 = v0[40];
    if (!v7)
    {
      uint64_t v22 = v0[33];
      uint64_t v23 = v0[29];
      uint64_t v24 = v0[30];
      OUTLINED_FUNCTION_21();
      swift_release_n();

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
      goto LABEL_17;
    }
    uint64_t v67 = v0[39];
    unint64_t v1 = OUTLINED_FUNCTION_11();
    uint64_t v72 = OUTLINED_FUNCTION_37();
    *(_DWORD *)unint64_t v1 = 136315650;
    uint64_t v9 = sub_25C5EEB60();
    v0[24] = sub_25C5CD724(v9, v10, &v72);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v1 + 12) = 2048;
    swift_bridgeObjectRelease();
    v0[25] = 1;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v1 + 22) = 2080;
    swift_bridgeObjectRetain();
    v0[26] = sub_25C5CD724(v67, v8, &v72);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C5AA000, v5, v6, "%s: %ld app detected for %s, not adding app mention suffix", (uint8_t *)v1, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    swift_release_n();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v11 = v0[41];
  swift_bridgeObjectRelease();
  uint64_t v12 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v12 = v11 & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    unint64_t v1 = v0[38];
    uint64_t v13 = sub_25C5EE3C0();
    uint64_t v15 = v14;
    v0[16] = 0x20676E69737520;
    v0[17] = 0xE700000000000000;
    sub_25C5EE5F0();
    swift_bridgeObjectRelease();
    v0[18] = v13;
    v0[19] = v15;
    swift_bridgeObjectRetain();
    sub_25C5EE5F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C5EE350();
    sub_25C5EE490();
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25C5EE4A0();
    os_log_type_t v17 = sub_25C5EE780();
    BOOL v18 = os_log_type_enabled(v16, v17);
    unint64_t v19 = v0[40];
    if (v18)
    {
      uint64_t v69 = v0[39];
      unint64_t v1 = OUTLINED_FUNCTION_31();
      uint64_t v72 = OUTLINED_FUNCTION_37();
      *(_DWORD *)unint64_t v1 = 136315394;
      uint64_t v20 = sub_25C5EE340();
      v0[20] = sub_25C5CD724(v20, v21, &v72);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v1 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[21] = sub_25C5CD724(v69, v19, &v72);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v16, v17, "SiriKitIntentSource: Constructed invocation phrase of \"%s\" for intent %s", (uint8_t *)v1, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      swift_release_n();
      swift_bridgeObjectRelease();
LABEL_14:
      OUTLINED_FUNCTION_34();
      v32();
      goto LABEL_17;
    }
    uint64_t v34 = v0[30];
    uint64_t v33 = v0[31];
    uint64_t v35 = v0[29];
    swift_release_n();

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_25C5EE4A0();
    os_log_type_t v26 = sub_25C5EE780();
    unint64_t v1 = v26;
    BOOL v27 = os_log_type_enabled(v25, v26);
    unint64_t v28 = v0[42];
    if (v27)
    {
      uint64_t v68 = v0[41];
      uint64_t v29 = OUTLINED_FUNCTION_31();
      uint64_t v72 = OUTLINED_FUNCTION_37();
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v30 = sub_25C5EEB60();
      v0[22] = sub_25C5CD724(v30, v31, &v72);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[23] = sub_25C5CD724(v68, v28, &v72);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v25, (os_log_type_t)v1, "%s: app name '%s' is empty, not adding app mention suffix", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      swift_release_n();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v36 = v0[32];
    uint64_t v37 = v0[29];
    uint64_t v38 = v0[30];
    swift_release_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
  }
LABEL_17:
  OUTLINED_FUNCTION_46();
  if (v40)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_64();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v64 = (uint64_t (*)(void))v0[1];
    return v64();
  }
  while (1)
  {
    v0[37] = v39;
    uint64_t v41 = (void *)(v0[27] + 24 * v39);
    v0[38] = v41[4];
    uint64_t v42 = v41[5];
    v0[39] = v42;
    uint64_t v43 = v41[6];
    v0[40] = v43;
    OUTLINED_FUNCTION_36();
    uint64_t v45 = *(void *)(v44 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain_n();
    uint64_t v46 = sub_25C5EE3E0();
    if (*(void *)(v45 + 16))
    {
      unint64_t v48 = sub_25C5B0114(v46, v47);
      if (v49) {
        break;
      }
    }
    OUTLINED_FUNCTION_54();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_27:
    OUTLINED_FUNCTION_46();
    if (v40) {
      goto LABEL_29;
    }
  }
  OUTLINED_FUNCTION_29(v48, *(void *)(v45 + 56));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v43)
  {
    OUTLINED_FUNCTION_54();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v50 = v0[35];
  swift_bridgeObjectRetain();
  v0[12] = sub_25C5EE3C0();
  v0[13] = v51;
  v0[14] = 24;
  v0[15] = v1;
  uint64_t v52 = sub_25C5EDF70();
  __swift_storeEnumTagSinglePayload(v50, 1, 1, v52);
  sub_25C5B44F4();
  OUTLINED_FUNCTION_24();
  sub_25C5EE840();
  char v54 = v53;
  sub_25C5B4540(v50);
  swift_bridgeObjectRelease();
  if ((v54 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_retain_n();
    swift_bridgeObjectRetain();
    unint64_t v55 = sub_25C5EE4A0();
    os_log_type_t v56 = sub_25C5EE780();
    BOOL v57 = os_log_type_enabled(v55, v56);
    uint64_t v58 = v0[34];
    uint64_t v60 = v0[29];
    uint64_t v59 = v0[30];
    if (v57)
    {
      uint64_t v71 = v0[29];
      uint64_t v61 = OUTLINED_FUNCTION_31();
      uint64_t v72 = OUTLINED_FUNCTION_37();
      *(_DWORD *)uint64_t v61 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v61 + 4) = sub_25C5CD724(24, v1, &v72);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v61 + 12) = 2080;
      uint64_t v62 = sub_25C5EE3C0();
      *(void *)(v61 + 14) = sub_25C5CD724(v62, v63, &v72);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_54();
      _os_log_impl(&dword_25C5AA000, v55, v56, "SiriKitIntentSource: %s already in \"%s\", not adding app mention suffix", (uint8_t *)v61, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      OUTLINED_FUNCTION_54();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v71);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
    }
    goto LABEL_27;
  }
  __swift_project_boxed_opaque_existential_1(v70, v0[10]);
  os_log_type_t v66 = (void *)swift_task_alloc();
  v0[43] = v66;
  *os_log_type_t v66 = v0;
  v66[1] = sub_25C5B154C;
  return sub_25C5DBB30(v42, v43);
}

uint64_t sub_25C5B2128(void *a1, uint64_t a2)
{
  uint64_t v4 = 0xD000000000000017;
  uint64_t v5 = sub_25C5EE4B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v34 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C5EE150();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DefaultEligibilityCriteria();
  v35[3] = v12;
  v35[4] = &off_2709C32F0;
  v35[0] = a2;
  self;
  uint64_t v13 = (void *)swift_dynamicCastObjCClass();
  swift_retain();
  if (v13)
  {
    unint64_t v31 = "x-sampradio://store/ra.u-";
    uint64_t v32 = v6;
    uint64_t v33 = v5;
    id v14 = a1;
    unint64_t v15 = 0x2654B4000uLL;
    if (objc_msgSend(v13, sel_preferredCallProvider) != (id)1) {
      goto LABEL_5;
    }
    uint64_t v30 = __swift_project_boxed_opaque_existential_1(v35, v12);
    uint64_t v16 = *(void (**)(void))(v9 + 104);
    unsigned int v28 = *MEMORY[0x263F74C48];
    BOOL v27 = (void (*)(char *, void, uint64_t))v16;
    v16(v11);
    uint64_t v17 = sub_25C5EE140();
    BOOL v18 = v14;
    uint64_t v20 = v19;
    uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
    v29(v11, v8);
    unint64_t v15 = 0x2654B4000;
    LOBYTE(v17) = sub_25C5C4D44(v17, v20);
    id v14 = v18;
    swift_bridgeObjectRelease();
    if (v17)
    {
      v27(v11, v28, v8);
      uint64_t v4 = sub_25C5EE140();

      v29(v11, v8);
    }
    else
    {
LABEL_5:
      if ([v13 *(SEL *)(v15 + 3672)] == (id)2)
      {
        (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F74C58], v8);
        uint64_t v4 = sub_25C5EE140();

        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      }
      else
      {
        unint64_t v21 = v34;
        sub_25C5EE490();
        uint64_t v22 = sub_25C5EE4A0();
        os_log_type_t v23 = sub_25C5EE780();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_25C5AA000, v22, v23, "SiriKitIntentSource: Can't map com.apple.InCallService to appropriate bundleId", v24, 2u);
          MEMORY[0x26118BA70](v24, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v32 + 8))(v21, v33);
        uint64_t v4 = 0xD000000000000017;
      }
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return v4;
}

int64_t sub_25C5B2500(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
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

uint64_t sub_25C5B25E4(uint64_t a1)
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

uint64_t sub_25C5B2664(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_25C5EE4B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DefaultEligibilityCriteria();
  v49[3] = v16;
  v49[4] = &off_2709C32F0;
  v49[0] = a6;
  swift_retain();
  uint64_t v17 = sub_25C5B0904(a3, (SEL *)&selRef_intentClass);
  if (!v18)
  {
    sub_25C5EE490();
    unint64_t v31 = sub_25C5EE4A0();
    os_log_type_t v32 = sub_25C5EE780();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v48 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      v47[1] = sub_25C5CD724(0xD000000000000069, 0x800000025C5F09A0, &v48);
      sub_25C5EE7F0();
      _os_log_impl(&dword_25C5AA000, v31, v32, "Function: %s > Unable to fetch intent class for BMAppIntent", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v34, -1, -1);
      MEMORY[0x26118BA70](v33, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_16;
  }
  uint64_t v19 = v17;
  unint64_t v20 = v18;
  if (qword_26A5B9168 != -1) {
    swift_once();
  }
  if ((sub_25C5E2D38(v19, v20, a4) & 1) == 0)
  {
    uint64_t v21 = 0x6C7070612E6D6F63;
    if (sub_25C5EE640()) {
      goto LABEL_8;
    }
    uint64_t v22 = __swift_project_boxed_opaque_existential_1(v49, v16);
    uint64_t v23 = *(void *)(*__swift_project_boxed_opaque_existential_1((void *)(*v22 + 16), *(void *)(*v22 + 40))
                    + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C5AE248(a1, a2, v23);
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v25
      || (sub_25C5DFBDC(v19, v20, v27),
          char v29 = v28,
          swift_bridgeObjectRelease(),
          swift_bridgeObjectRelease(),
          (v29 & 1) != 0))
    {
LABEL_8:
      sub_25C5DFBDC(0xD00000000000001ALL, 0x800000025C5F0A10, a5);
      if ((v30 & 1) == 0 && (v19 != 0xD000000000000013 || v20 != 0x800000025C5F0A30) && (sub_25C5EEA80() & 1) == 0)
      {
        unint64_t v37 = 0xEE007377656E2E65;
        BOOL v38 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEE007377656E2E65;
        if (!v38 && (sub_25C5EEA80() & 1) == 0)
        {
          uint64_t v39 = sub_25C5EE1A0();
          if (*(void *)(v39 + 16))
          {
            unint64_t v40 = sub_25C5B0114(0x6C7070612E6D6F63, 0xEE007377656E2E65);
            if (v41)
            {
              uint64_t v42 = (uint64_t *)(*(void *)(v39 + 56) + 16 * v40);
              uint64_t v21 = *v42;
              unint64_t v37 = v42[1];
              swift_bridgeObjectRetain();
            }
          }
          swift_bridgeObjectRelease();
          if (v21 == a1 && v37 == a2)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v44 = sub_25C5EEA80();
            swift_bridgeObjectRelease();
            if ((v44 & 1) == 0)
            {
              swift_bridgeObjectRelease();
LABEL_38:
              char v35 = 1;
              goto LABEL_17;
            }
          }
        }
        if (v19 == 0xD000000000000011 && v20 == 0x800000025C5F0A50)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v45 = sub_25C5EEA80();
          swift_bridgeObjectRelease();
          if ((v45 & 1) == 0) {
            goto LABEL_38;
          }
        }
        sub_25C5DFBDC(0x657449616964656DLL, 0xEA0000000000736DLL, a4);
        char v35 = v46 ^ 1;
        goto LABEL_17;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  char v35 = 0;
LABEL_17:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  return v35 & 1;
}

uint64_t sub_25C5B2B9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DefaultEligibilityCriteria();
  v11[3] = v8;
  v11[4] = &off_2709C32F0;
  v11[0] = a4;
  if (a1 == 0xD000000000000017 && a2 == 0x800000025C5F0940 || (sub_25C5EEA80() & 1) != 0)
  {
    uint64_t v9 = *__swift_project_boxed_opaque_existential_1(v11, v8);
    swift_retain();
    a1 = sub_25C5B2128(a3, v9);
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return a1;
}

uint64_t sub_25C5B2C98(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_25C5EE4B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DefaultEligibilityCriteria();
  v33[3] = v14;
  v33[4] = &off_2709C32F0;
  v33[0] = a5;
  swift_retain();
  uint64_t v15 = sub_25C5B072C(a1);
  if (!v15)
  {
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v25 = sub_25C5EE4A0();
    os_log_type_t v26 = sub_25C5EE790();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v32 = v30;
      *(_DWORD *)uint64_t v27 = 136315394;
      uint64_t v31 = sub_25C5CD724(0xD00000000000003ELL, 0x800000025C5F0960, &v32);
      sub_25C5EE7F0();
      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25C5CD724(a3, a4, &v32);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v25, v26, "Function: %s > parametersByName was unexpectedly empty for generic intent from bundleId: %s", (uint8_t *)v27, 0x16u);
      uint64_t v28 = v30;
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v28, -1, -1);
      MEMORY[0x26118BA70](v27, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_13;
  }
  uint64_t v16 = v15;
  uint64_t v17 = swift_bridgeObjectRetain();
  uint64_t v18 = sub_25C5BE89C(v17);
  uint64_t v19 = __swift_project_boxed_opaque_existential_1(v33, v14);
  char v20 = sub_25C5B2664(a3, a4, a2, v18, v18, *v19);
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v21 = sub_25C5AE0E4(a3, a4, v16, a1);
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  if (!v23)
  {
    uint64_t v21 = 0;
    goto LABEL_14;
  }
  uint64_t v24 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0) {
    uint64_t v24 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (!v24)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v21 = 0;
  }
LABEL_14:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return v21;
}

void sub_25C5B2FF4(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v61 = a6;
  uint64_t v62 = a3;
  uint64_t v63 = a1;
  uint64_t v9 = sub_25C5EE4B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for DefaultEligibilityCriteria();
  uint64_t v68 = &off_2709C32F0;
  v66[0] = a5;
  swift_retain();
  id v13 = objc_msgSend(a4, sel__nonNilParameters);
  uint64_t v14 = sub_25C5EE730();

  uint64_t v60 = a4;
  uint64_t v15 = sub_25C5B0808(a4);
  if (!v15) {
    goto LABEL_48;
  }
  uint64_t v16 = v15;
  if (!*(void *)(v15 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_48:
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    char v49 = sub_25C5EE4A0();
    unint64_t v50 = a2;
    os_log_type_t v51 = sub_25C5EE790();
    if (os_log_type_enabled(v49, v51))
    {
      uint64_t v52 = swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v65 = v53;
      *(_DWORD *)uint64_t v52 = 136315394;
      uint64_t v64 = sub_25C5CD724(0xD00000000000004ALL, 0x800000025C5F0A70, &v65);
      sub_25C5EE7F0();
      *(_WORD *)(v52 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_25C5CD724(v63, v50, &v65);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v49, v51, "Function: %s > _validParameterCombinations not present or empty for non-generic intent from %s", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v53, -1, -1);
      MEMORY[0x26118BA70](v52, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
LABEL_52:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    return;
  }
  int64_t v17 = 0;
  uint64_t v18 = v15 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(v15 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & *(void *)(v15 + 64);
  int64_t v22 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v56 = MEMORY[0x263F8EE78];
  BOOL v57 = "INRunWorkflowIntent";
  unint64_t v58 = 0x800000025C5F0A50;
  uint64_t v59 = a2;
  while (v21)
  {
    unint64_t v23 = __clz(__rbit64(v21));
    v21 &= v21 - 1;
    unint64_t v24 = v23 | (v17 << 6);
LABEL_26:
    uint64_t v28 = *(void *)(*(void *)(v16 + 48) + 8 * v24);
    swift_bridgeObjectRetain();
    if ((sub_25C5ADB88(v14, v28) & 1) == 0) {
      goto LABEL_32;
    }
    char v29 = __swift_project_boxed_opaque_existential_1(v66, v67);
    if ((sub_25C5B2664(v63, a2, v62, v28, v14, *v29) & 1) == 0) {
      goto LABEL_32;
    }
    sub_25C5ADE70(v60, v28);
    uint64_t v31 = v30;
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    unint64_t v34 = v33;
    uint64_t v35 = HIBYTE(v33) & 0xF;
    if ((v33 & 0x2000000000000000) == 0) {
      uint64_t v35 = v31 & 0xFFFFFFFFFFFFLL;
    }
    if (v35 && (__swift_project_boxed_opaque_existential_1(v66, v67), !sub_25C5C4E88()))
    {
      uint64_t v36 = sub_25C5B0904(v62, (SEL *)&selRef_intentClass);
      if (!v37) {
        goto LABEL_40;
      }
      if (v36 == 0xD000000000000011 && v37 == v58)
      {
        swift_bridgeObjectRelease();
LABEL_38:
        a2 = v59;
        uint64_t v39 = sub_25C5AE4D4(v60, v31, v33, v63, v59);
        uint64_t v41 = v40;
        swift_bridgeObjectRelease();
        if (v41)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B351370);
          uint64_t v54 = swift_allocObject();
          *(_OWORD *)(v54 + 16) = xmmword_25C5EF260;
          *(void *)(v54 + 32) = v39;
          *(void *)(v54 + 40) = v41;
          swift_release();
          goto LABEL_52;
        }
      }
      else
      {
        char v38 = sub_25C5EEA80();
        swift_bridgeObjectRelease();
        if (v38) {
          goto LABEL_38;
        }
LABEL_40:
        uint64_t v42 = v56;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C5E9A5C(0, *(void *)(v42 + 16) + 1, 1, v42);
          uint64_t v42 = v47;
        }
        unint64_t v44 = *(void *)(v42 + 16);
        unint64_t v43 = *(void *)(v42 + 24);
        uint64_t v56 = v42;
        if (v44 >= v43 >> 1)
        {
          sub_25C5E9A5C(v43 > 1, v44 + 1, 1, v56);
          uint64_t v56 = v48;
        }
        uint64_t v45 = v56;
        *(void *)(v56 + 16) = v44 + 1;
        uint64_t v46 = v45 + 16 * v44;
        *(void *)(v46 + 32) = v31;
        *(void *)(v46 + 40) = v34;
        a2 = v59;
      }
    }
    else
    {
LABEL_32:
      swift_bridgeObjectRelease();
    }
  }
  int64_t v25 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
    goto LABEL_54;
  }
  if (v25 >= v22) {
    goto LABEL_46;
  }
  unint64_t v26 = *(void *)(v18 + 8 * v25);
  ++v17;
  if (v26) {
    goto LABEL_25;
  }
  int64_t v17 = v25 + 1;
  if (v25 + 1 >= v22) {
    goto LABEL_46;
  }
  unint64_t v26 = *(void *)(v18 + 8 * v17);
  if (v26) {
    goto LABEL_25;
  }
  int64_t v17 = v25 + 2;
  if (v25 + 2 >= v22) {
    goto LABEL_46;
  }
  unint64_t v26 = *(void *)(v18 + 8 * v17);
  if (v26) {
    goto LABEL_25;
  }
  int64_t v17 = v25 + 3;
  if (v25 + 3 >= v22) {
    goto LABEL_46;
  }
  unint64_t v26 = *(void *)(v18 + 8 * v17);
  if (v26) {
    goto LABEL_25;
  }
  int64_t v17 = v25 + 4;
  if (v25 + 4 >= v22) {
    goto LABEL_46;
  }
  unint64_t v26 = *(void *)(v18 + 8 * v17);
  if (v26)
  {
LABEL_25:
    unint64_t v21 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v17 << 6);
    goto LABEL_26;
  }
  int64_t v27 = v25 + 5;
  if (v27 >= v22)
  {
LABEL_46:
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_52;
  }
  unint64_t v26 = *(void *)(v18 + 8 * v27);
  if (v26)
  {
    int64_t v17 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v17 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v17 >= v22) {
      goto LABEL_46;
    }
    unint64_t v26 = *(void *)(v18 + 8 * v17);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_54:
  __break(1u);
}

uint64_t sub_25C5B363C()
{
  OUTLINED_FUNCTION_65();
  uint64_t v2 = v1;
  v0[32] = v3;
  v0[33] = *v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  OUTLINED_FUNCTION_58(v4);
  v0[34] = OUTLINED_FUNCTION_22();
  v0[35] = swift_task_alloc();
  uint64_t v5 = sub_25C5EE940();
  v0[36] = v5;
  OUTLINED_FUNCTION_2(v5);
  v0[37] = v6;
  v0[38] = *(void *)(v7 + 64);
  v0[39] = OUTLINED_FUNCTION_22();
  v0[40] = swift_task_alloc();
  uint64_t v8 = sub_25C5EE960();
  v0[41] = v8;
  OUTLINED_FUNCTION_2(v8);
  v0[42] = v9;
  v0[43] = *(void *)(v10 + 64);
  v0[44] = OUTLINED_FUNCTION_22();
  v0[45] = swift_task_alloc();
  uint64_t v11 = sub_25C5EE4B0();
  v0[46] = v11;
  OUTLINED_FUNCTION_2(v11);
  v0[47] = v12;
  v0[48] = OUTLINED_FUNCTION_22();
  v0[49] = swift_task_alloc();
  v0[17] = type metadata accessor for DefaultEligibilityCriteria();
  v0[18] = &off_2709C32F0;
  v0[14] = v2;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5B37E0, 0, 0);
}

uint64_t sub_25C5B37E0()
{
  unint64_t v50 = v0;
  uint64_t v47 = v0 + 14;
  uint64_t v46 = (long long *)(v0 + 19);
  sub_25C5EE490();
  uint64_t v1 = sub_25C5EE4A0();
  os_log_type_t v2 = sub_25C5EE770();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v45 = v0[49];
    uint64_t v4 = v0[46];
    uint64_t v3 = v0[47];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = OUTLINED_FUNCTION_11();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v6 = sub_25C5EEB60();
    v0[31] = sub_25C5CD724(v6, v7, &v49);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v1, v2, "%s: Fetching phrases", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v45, v4);
  }
  else
  {

    uint64_t v8 = OUTLINED_FUNCTION_66();
    v9(v8);
  }
  uint64_t v10 = v0[45];
  uint64_t v39 = v0[42];
  uint64_t v11 = v0[40];
  uint64_t v40 = v0[41];
  uint64_t v41 = v0[44];
  uint64_t v37 = v0[39];
  uint64_t v12 = v0[37];
  uint64_t v42 = v0[38];
  uint64_t v13 = v0[35];
  uint64_t v14 = v0[36];
  uint64_t v15 = v0[34];
  uint64_t v43 = v0[32];
  uint64_t v16 = swift_allocObject();
  v0[50] = v16;
  uint64_t v38 = v16;
  *(void *)(v16 + 16) = sub_25C5EE560();
  sub_25C5EE950();
  sub_25C5EE920();
  id v17 = [(id)BiomeLibrary() App];
  swift_unknownObjectRelease();
  id v18 = objc_msgSend(v17, sel_Intent);
  swift_unknownObjectRelease();
  uint64_t v19 = sub_25C5EDF30();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v19);
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v19);
  id v20 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  uint64_t v21 = OUTLINED_FUNCTION_66();
  id v23 = sub_25C5AF9A0(v21, v22, 1000, 1000, 1);
  id v36 = objc_msgSend(v18, sel_publisherWithOptions_, v23);

  v0[6] = sub_25C5AC268;
  v0[7] = 0;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_25C5AC4A4;
  v0[5] = &block_descriptor_1;
  aBlock = _Block_copy(v0 + 2);
  sub_25C5B4254((uint64_t)v47, (uint64_t)v46);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v37, v11, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v41, v10, v40);
  unint64_t v24 = (*(unsigned __int8 *)(v12 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v25 = (v42 + *(unsigned __int8 *)(v39 + 80) + v24) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v43;
  sub_25C5B4420(v46, v26 + 24);
  *(void *)(v26 + 64) = v38;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v26 + v24, v37, v14);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v39 + 32))(v26 + v25, v41, v40);
  v0[12] = sub_25C5B4438;
  v0[13] = v26;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_25C5AC988;
  v0[11] = &block_descriptor_23;
  int64_t v27 = _Block_copy(v0 + 8);
  swift_retain();
  swift_retain();
  swift_release();
  id v28 = objc_msgSend(v36, sel_sinkWithCompletion_shouldContinue_, aBlock, v27);
  _Block_release(v27);
  _Block_release(aBlock);

  sub_25C5EE490();
  swift_retain();
  char v29 = sub_25C5EE4A0();
  os_log_type_t v30 = sub_25C5EE770();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 134217984;
    swift_beginAccess();
    v0[30] = *(void *)(*(void *)(v38 + 16) + 16);
    sub_25C5EE7F0();
    swift_release();
    _os_log_impl(&dword_25C5AA000, v29, v30, "%ld phrase(s) created from the SiriKit Intents Biome stream", v31, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    swift_release();
  }

  (*(void (**)(void, void))(v0[47] + 8))(v0[48], v0[46]);
  swift_beginAccess();
  uint64_t v32 = swift_bridgeObjectRetain();
  v0[51] = sub_25C5B042C(v32);
  swift_bridgeObjectRelease();
  type metadata accessor for DefaultAppFinderForIntentProvider();
  swift_initStaticObject();
  __swift_project_boxed_opaque_existential_1(v47, v0[17]);
  uint64_t v48 = (uint64_t (*)(uint64_t))((char *)&dword_26A5B91D0 + dword_26A5B91D0);
  unint64_t v33 = (void *)swift_task_alloc();
  v0[52] = v33;
  *unint64_t v33 = v0;
  v33[1] = sub_25C5B3EF8;
  uint64_t v34 = OUTLINED_FUNCTION_66();
  return v48(v34);
}

uint64_t sub_25C5B3EF8()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25C5B3FCC, 0, 0);
}

uint64_t sub_25C5B3FCC()
{
  uint64_t v1 = v0[51];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    unint64_t v13 = MEMORY[0x263F8EE78];
    sub_25C5EE8F0();
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 24;
      swift_retain();
      sub_25C5EE8D0();
      sub_25C5EE900();
      sub_25C5EE910();
      sub_25C5EE8E0();
      --v2;
    }
    while (v2);
    unint64_t v4 = v13;
    swift_release();
  }
  else
  {
    swift_release();
    unint64_t v4 = MEMORY[0x263F8EE78];
  }
  uint64_t v5 = v0[45];
  uint64_t v7 = v0[41];
  uint64_t v6 = v0[42];
  uint64_t v8 = v0[40];
  uint64_t v10 = v0[36];
  uint64_t v9 = v0[37];
  sub_25C5AE3AC(v4);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 14));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(unint64_t))v0[1];
  return v11(v4);
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

uint64_t sub_25C5B41DC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
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

uint64_t sub_25C5B4254(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C5B42B8()
{
  uint64_t v1 = sub_25C5EE940();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 72) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_25C5EE960();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v5 + v7 + v13) & ~v13;
  uint64_t v15 = v14 + *(void *)(v12 + 64);
  uint64_t v16 = v4 | v13 | 7;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);

  return MEMORY[0x270FA0238](v0, v15, v16);
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

uint64_t sub_25C5B4420(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

BOOL sub_25C5B4438(void *a1)
{
  uint64_t v3 = sub_25C5EE940();
  OUTLINED_FUNCTION_2(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(sub_25C5EE960() - 8);
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[8];
  uint64_t v11 = (uint64_t)v1 + ((v5 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_25C5AC50C(a1, v9, v1 + 3, v10, (uint64_t)v1 + v5, v11);
}

unint64_t sub_25C5B44F4()
{
  unint64_t result = qword_26A5B91E0;
  if (!qword_26A5B91E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B91E0);
  }
  return result;
}

uint64_t sub_25C5B4540(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C5B45A0()
{
  return swift_release();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25C5B45D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25C5B4630()
{
  unint64_t result = qword_26A5B9218;
  if (!qword_26A5B9218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9218);
  }
  return result;
}

uint64_t sub_25C5B467C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C5B4690(a1, a2);
  }
  return a1;
}

uint64_t sub_25C5B4690(uint64_t a1, unint64_t a2)
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

unint64_t sub_25C5B46E8()
{
  unint64_t result = qword_26A5B9248;
  if (!qword_26A5B9248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3510A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9248);
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

uint64_t sub_25C5B4784(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C5B4790(uint64_t a1, unint64_t *a2)
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

uint64_t destroy for SKIntentAutoCompletePhrase()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

void *_s16SiriAutoComplete26SKIntentAutoCompletePhraseVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SKIntentAutoCompletePhrase(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for SKIntentAutoCompletePhrase(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SKIntentAutoCompletePhrase(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t storeEnumTagSinglePayload for SKIntentAutoCompletePhrase(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SKIntentAutoCompletePhrase()
{
  return &type metadata for SKIntentAutoCompletePhrase;
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  return a1 - 8;
}

void OUTLINED_FUNCTION_3()
{
  JUMPOUT(0x26118BA70);
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v3 = *(void *)(v1 - 264);
  return sub_25C5CD724(v3, v0, (uint64_t *)(v1 - 232));
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_7(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_9(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_13()
{
  *(void *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v2 = *(void *)(v0 - 296);
  unint64_t v3 = *(void *)(v0 - 288);
  return sub_25C5B467C(v2, v3);
}

void OUTLINED_FUNCTION_26()
{
  sub_25C5B467C(*(void *)(v1 - 296), *(void *)(v1 - 288));
}

uint64_t OUTLINED_FUNCTION_27()
{
  return v0;
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_29@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  os_log_type_t v5 = (void *)(a2 + a1 * v3);
  *(void *)(v2 + 328) = *v5;
  *(void *)(v2 + 336) = v5[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_32(uint64_t result)
{
  *(void *)(v1 - 232) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_25C5EE490();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_36()
{
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 40));
  return __swift_project_boxed_opaque_existential_1((void *)(*v2 + 16), *(void *)(*v2 + 40));
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_25C5EE850();
}

void OUTLINED_FUNCTION_44()
{
  uint64_t v2 = *(void **)(v0 - 272);
}

void OUTLINED_FUNCTION_45(uint64_t a1@<X8>)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = a1;
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

void OUTLINED_FUNCTION_48()
{
  *(void *)(v1 - 232) = *(void *)(v1 - 264);
  *(void *)(v1 - 224) = v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_25C5EE9D0();
}

uint64_t OUTLINED_FUNCTION_50(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return sub_25C5EE7F0();
}

BOOL OUTLINED_FUNCTION_51(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_52(float a1)
{
  *uint64_t v2 = a1;
  return [v1 (SEL)(v3 + 2200)];
}

uint64_t OUTLINED_FUNCTION_53()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_release_n();
}

void OUTLINED_FUNCTION_56(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_58(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_25C5EE850();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_25C5B45A0();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_66()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_slowAlloc();
}

void *sub_25C5B507C()
{
  return &unk_2709C2B18;
}

unint64_t sub_25C5B5088(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6449656C646E7562;
      break;
    case 2:
      unint64_t result = 0x657361726870;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C5B511C()
{
  type metadata accessor for DenyListManager();
  swift_allocObject();
  uint64_t result = sub_25C5B5230();
  qword_26B3513A8 = result;
  return result;
}

void sub_25C5B5158()
{
  qword_26B351038 = 0x7473694C796E6544;
  unk_26B351040 = 0xE800000000000000;
}

void sub_25C5B517C()
{
  qword_26B351018 = 0x7473696C70;
  unk_26B351020 = 0xE500000000000000;
}

uint64_t sub_25C5B519C()
{
  if (qword_26B351048 != -1) {
    swift_once();
  }
  if (qword_26B351028 != -1) {
    swift_once();
  }
  return 0x7473694C796E6544;
}

uint64_t sub_25C5B5230()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C5B5330();
  uint64_t v3 = sub_25C5B581C();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = v2;
  sub_25C5B7634(v3, (uint64_t)sub_25C5B8524, 0, isUniquelyReferenced_nonNull_native, &v7);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  sub_25C5EE040();
  swift_allocObject();
  uint64_t v5 = sub_25C5EE030();
  sub_25C5B8088((uint64_t)&v8, v5);
  swift_release();
  *(void *)(v1 + 16) = v8;
  return v1;
}

uint64_t sub_25C5B5330()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FE8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C5EDED0();
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v39 = (char *)&v38 - v9;
  uint64_t v10 = sub_25C5EE4B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v43 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - v14;
  sub_25C5EE490();
  uint64_t v16 = sub_25C5EE4A0();
  os_log_type_t v17 = sub_25C5EE780();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_25C5AA000, v16, v17, "DenyListManager: loading deny list from project resources.", v18, 2u);
    MEMORY[0x26118BA70](v18, -1, -1);
  }

  uint64_t v42 = *(void (**)(char *, uint64_t))(v11 + 8);
  v42(v15, v10);
  uint64_t v40 = v1;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v20 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  if (qword_26B351048 != -1) {
    swift_once();
  }
  uint64_t v21 = v10;
  uint64_t v23 = qword_26B351038;
  uint64_t v22 = unk_26B351040;
  uint64_t v24 = qword_26B351028;
  swift_bridgeObjectRetain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_26B351018;
  uint64_t v26 = unk_26B351020;
  swift_bridgeObjectRetain();
  id v27 = sub_25C5B8010(v23, v22, v25, v26, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27)
  {
    sub_25C5EDEC0();

    uint64_t v28 = v41;
    char v29 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
    v29(v4, v8, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v5);
    uint64_t v30 = v21;
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
    {
      uint64_t v31 = v39;
      v29(v39, v4, v5);
      uint64_t v32 = sub_25C5B6268();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v5);
      return (uint64_t)v32;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
    uint64_t v30 = v21;
  }
  sub_25C5B8650((uint64_t)v4, &qword_26B350FE8);
  unint64_t v33 = v43;
  sub_25C5EE490();
  uint64_t v34 = sub_25C5EE4A0();
  os_log_type_t v35 = sub_25C5EE790();
  if (os_log_type_enabled(v34, v35))
  {
    id v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v36 = 0;
    _os_log_impl(&dword_25C5AA000, v34, v35, "DenyListManager: unable to get path to the deny list file", v36, 2u);
    MEMORY[0x26118BA70](v36, -1, -1);
  }

  v42(v33, v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
  return sub_25C5EE560();
}

uint64_t sub_25C5B581C()
{
  uint64_t v0 = sub_25C5EDED0();
  uint64_t v43 = *(void *)(v0 - 8);
  uint64_t v44 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v41 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v42 = (char *)&v39 - v3;
  uint64_t v4 = sub_25C5EE010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C5EE4B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v40 = (char *)&v39 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v39 - v13;
  id v15 = objc_msgSend(self, sel_clientWithIdentifier_, 134);
  sub_25C5EE490();
  uint64_t v16 = sub_25C5EE4A0();
  os_log_type_t v17 = sub_25C5EE780();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = (void (*)(char *, uint64_t))v4;
    uint64_t v19 = v8;
    id v20 = v15;
    uint64_t v21 = v18;
    *(_WORD *)id v18 = 0;
    _os_log_impl(&dword_25C5AA000, v16, v17, "DenyListManager: looking for deny list on Trial.", v18, 2u);
    uint64_t v22 = v21;
    id v15 = v20;
    uint64_t v8 = v19;
    uint64_t v4 = (uint64_t)v45;
    MEMORY[0x26118BA70](v22, -1, -1);
  }

  uint64_t v45 = *(void (**)(char *, uint64_t))(v9 + 8);
  v45(v14, v8);
  sub_25C5EDFE0();
  uint64_t v23 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F74760], v4);
  sub_25C5EE000();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v24 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v15, sel_levelForFactor_withNamespaceName_, v23, v24);

  uint64_t v26 = sub_25C5EDFD0();
  if (v27)
  {
    uint64_t v46 = v26;
    uint64_t v47 = v27;
    swift_bridgeObjectRetain();
    sub_25C5EE5F0();
    swift_bridgeObjectRelease();
    uint64_t v28 = v41;
    sub_25C5EDEA0();
    swift_bridgeObjectRelease();
    sub_25C5B519C();
    char v29 = v42;
    sub_25C5EDEB0();
    swift_bridgeObjectRelease();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v43 + 8);
    uint64_t v31 = v28;
    uint64_t v32 = v44;
    v30(v31, v44);
    uint64_t v33 = (uint64_t)sub_25C5B6268();

    v30(v29, v32);
  }
  else
  {
    os_log_type_t v35 = v40;
    sub_25C5EE490();
    id v36 = sub_25C5EE4A0();
    os_log_type_t v37 = sub_25C5EE780();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_25C5AA000, v36, v37, "DenyListManager: No deny list on Trial.", v38, 2u);
      MEMORY[0x26118BA70](v38, -1, -1);
    }

    v45(v35, v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
    uint64_t v33 = sub_25C5EE560();
  }
  return v33;
}

void (*sub_25C5B5F20(void *a1, uint64_t a2, uint64_t a3))(void **a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_25C5B7854(v6, a2, a3);
  return sub_25C5B5FA0;
}

void sub_25C5B5FA0(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = OUTLINED_FUNCTION_3_0();
  v3(v2);
  swift_bridgeObjectRelease();

  free(v1);
}

void (*sub_25C5B5FE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(void **a1)
{
  uint64_t v10 = malloc(0x38uLL);
  *a1 = v10;
  v10[4] = a3;
  v10[5] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10[6] = sub_25C5B7968(v10, a2, a3, a4, a5);
  return sub_25C5B6088;
}

void sub_25C5B6088(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = OUTLINED_FUNCTION_3_0();
  v3(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t sub_25C5B60E4(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v8 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v2 << 6))
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    swift_bridgeObjectRetain();
    sub_25C5E3E00(&v16, v14, v15);
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v6 = (v11 - 1) & v11;
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_20;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_20;
  }
LABEL_23:

  return swift_release();
}

void *sub_25C5B6268()
{
  uint64_t v0 = sub_25C5EE4B0();
  uint64_t v82 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  id v80 = (char *)&v69 - v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v69 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
  unint64_t v6 = (void *)sub_25C5EE560();
  sub_25C5EDE80();
  swift_allocObject();
  uint64_t v7 = sub_25C5EDE70();
  uint64_t v8 = sub_25C5EDEE0();
  unint64_t v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351080);
  sub_25C5B8568();
  sub_25C5EDE60();
  uint64_t v69 = v8;
  unint64_t v70 = v10;
  uint64_t v71 = v7;
  uint64_t v73 = 0;
  uint64_t v32 = (uint64_t)v85;
  uint64_t v81 = qword_2709C2B28;
  if (qword_2709C2B28)
  {
    unint64_t v33 = 0;
    os_log_type_t v79 = (void (**)(char *, uint64_t))(v82 + 8);
    unint64_t v83 = (unint64_t)"bundleIdAndActionIdentifier";
    *(void *)&long long v11 = 136315138;
    long long v75 = v11;
    uint64_t v74 = MEMORY[0x263F8EE58] + 8;
    unint64_t v76 = (unint64_t)"Manager";
    uint64_t v77 = v0;
    uint64_t v78 = (uint64_t)v85;
    uint64_t v72 = v5;
    while (1)
    {
      if (v33 >= qword_2709C2B28) {
        goto LABEL_67;
      }
      uint64_t v34 = *((unsigned __int8 *)&unk_2709C2B18 + v33++ + 32);
      unint64_t v35 = v83 | 0x8000000000000000;
      uint64_t v36 = 0xD000000000000010;
      switch(v34)
      {
        case 1:
          unint64_t v35 = 0xE800000000000000;
          uint64_t v36 = 0x6449656C646E7562;
          break;
        case 2:
          unint64_t v35 = 0xE600000000000000;
          uint64_t v36 = 0x657361726870;
          break;
        case 3:
          uint64_t v36 = 0xD00000000000001BLL;
          unint64_t v35 = v76 | 0x8000000000000000;
          break;
        default:
          break;
      }
      if (*(void *)(v32 + 16))
      {
        unint64_t v37 = sub_25C5B0114(v36, v35);
        if (v38) {
          break;
        }
      }
      swift_bridgeObjectRelease();
      sub_25C5EE490();
      uint64_t v43 = sub_25C5EE4A0();
      os_log_type_t v44 = sub_25C5EE790();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        os_log_type_t v85 = (void *)v46;
        *(_DWORD *)uint64_t v45 = v75;
        unint64_t v47 = v83 | 0x8000000000000000;
        uint64_t v48 = v46;
        uint64_t v49 = 0xD000000000000010;
        switch((int)v34)
        {
          case 0:
            break;
          case 1:
            unint64_t v47 = 0xE800000000000000;
            uint64_t v49 = 0x6449656C646E7562;
            break;
          case 2:
            unint64_t v47 = 0xE600000000000000;
            uint64_t v49 = 0x657361726870;
            break;
          case 3:
            uint64_t v49 = 0xD00000000000001BLL;
            unint64_t v47 = v76 | 0x8000000000000000;
            break;
          default:
LABEL_71:
            JUMPOUT(0);
        }
        *(void *)(v45 + 4) = sub_25C5CD724(v49, v47, (uint64_t *)&v85);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C5AA000, v43, v44, "DenyListManager: Unable to find attribute in the deny list: %s", (uint8_t *)v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v48, -1, -1);
        MEMORY[0x26118BA70](v45, -1, -1);

        (*v79)(v5, v0);
LABEL_63:
        uint64_t v32 = v78;
        goto LABEL_64;
      }

      (*v79)(v5, v0);
LABEL_64:
      if (v33 == v81) {
        goto LABEL_65;
      }
    }
    uint64_t v39 = *(void *)(*(void *)(v32 + 56) + 8 * v37);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v40 = v83 | 0x8000000000000000;
    uint64_t v41 = v34;
    uint64_t v42 = 0xD000000000000010;
    switch(v41)
    {
      case 0:
        goto LABEL_49;
      case 1:
        unint64_t v40 = 0xE800000000000000;
        uint64_t v42 = 0x6449656C646E7562;
        goto LABEL_49;
      case 2:
        unint64_t v40 = 0xE600000000000000;
        uint64_t v42 = 0x657361726870;
        goto LABEL_49;
      case 3:
        uint64_t v42 = 0xD00000000000001BLL;
        unint64_t v40 = v76 | 0x8000000000000000;
LABEL_49:
        uint64_t v50 = sub_25C5EE750();
        uint64_t v84 = v50;
        uint64_t v51 = *(void *)(v39 + 16);
        if (v51)
        {
          uint64_t v52 = v6;
          uint64_t v53 = (uint64_t *)(v39 + 40);
          do
          {
            uint64_t v54 = *(v53 - 1);
            uint64_t v55 = *v53;
            swift_bridgeObjectRetain();
            sub_25C5E3E00((uint64_t *)&v85, v54, v55);
            swift_bridgeObjectRelease();
            v53 += 2;
            --v51;
          }
          while (v51);
          swift_bridgeObjectRelease();
          uint64_t v56 = v84;
          unint64_t v6 = v52;
          uint64_t v5 = v72;
        }
        else
        {
          uint64_t v56 = v50;
          swift_bridgeObjectRelease();
        }
        swift_isUniquelyReferenced_nonNull_native();
        os_log_type_t v85 = v6;
        unint64_t v57 = sub_25C5B0114(v42, v40);
        if (__OFADD__(v6[2], (v58 & 1) == 0)) {
          goto LABEL_68;
        }
        unint64_t v59 = v57;
        char v60 = v58;
        __swift_instantiateConcreteTypeFromMangledName(qword_26B3510C0);
        char v61 = sub_25C5EE970();
        uint64_t v0 = v77;
        if ((v61 & 1) == 0) {
          goto LABEL_58;
        }
        unint64_t v62 = sub_25C5B0114(v42, v40);
        if ((v60 & 1) != (v63 & 1)) {
          goto LABEL_70;
        }
        unint64_t v59 = v62;
LABEL_58:
        unint64_t v6 = v85;
        if (v60)
        {
          uint64_t v64 = (uint64_t)v85;
          uint64_t v65 = v85[7];
          swift_bridgeObjectRelease();
          *(void *)(v65 + 8 * v59) = v56;
          unint64_t v6 = (void *)v64;
        }
        else
        {
          v85[(v59 >> 6) + 8] |= 1 << v59;
          os_log_type_t v66 = (uint64_t *)(v6[6] + 16 * v59);
          *os_log_type_t v66 = v42;
          v66[1] = v40;
          *(void *)(v6[7] + 8 * v59) = v56;
          uint64_t v67 = v6[2];
          BOOL v23 = __OFADD__(v67, 1);
          uint64_t v68 = v67 + 1;
          if (v23) {
            goto LABEL_69;
          }
          v6[2] = v68;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      default:
        goto LABEL_71;
    }
    goto LABEL_63;
  }
LABEL_65:
  swift_bridgeObjectRelease();
  sub_25C5B4690(v69, v70);
  swift_bridgeObjectRelease();
  swift_release();
  sub_25C5C074C(&v85, v6);
  uint64_t v24 = 0;
  int64_t v21 = v88;
  unint64_t v15 = v89;
  int64_t v12 = (unint64_t)(v87 + 64) >> 6;
  uint64_t v13 = v80;
  while (v15)
  {
    unint64_t v14 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v16 = v14 | (v21 << 6);
LABEL_17:
    uint64_t v22 = *(void *)(*(void *)(v85[7] + 8 * v16) + 16);
    BOOL v23 = __OFADD__(v24, v22);
    v24 += v22;
    if (v23)
    {
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      sub_25C5EEAC0();
      __break(1u);
      JUMPOUT(0x25C5B6D18);
    }
  }
  int64_t v17 = v21 + 1;
  if (__OFADD__(v21, 1)) {
    goto LABEL_66;
  }
  if (v17 < v12)
  {
    unint64_t v18 = *(void *)(v86 + 8 * v17);
    if (!v18)
    {
      int64_t v19 = v21 + 2;
      if (v21 + 2 >= v12) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v86 + 8 * v19);
      if (v18) {
        goto LABEL_15;
      }
      int64_t v19 = v21 + 3;
      if (v21 + 3 >= v12) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v86 + 8 * v19);
      if (v18) {
        goto LABEL_15;
      }
      int64_t v19 = v21 + 4;
      if (v21 + 4 >= v12) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v86 + 8 * v19);
      if (v18) {
        goto LABEL_15;
      }
      int64_t v19 = v21 + 5;
      if (v21 + 5 >= v12) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v86 + 8 * v19);
      if (v18)
      {
LABEL_15:
        int64_t v17 = v19;
      }
      else
      {
        int64_t v17 = v21 + 6;
        if (v21 + 6 >= v12) {
          goto LABEL_26;
        }
        unint64_t v18 = *(void *)(v86 + 8 * v17);
        if (!v18)
        {
          int64_t v25 = v21 + 7;
          do
          {
            if (v25 >= v12) {
              goto LABEL_26;
            }
            unint64_t v18 = *(void *)(v86 + 8 * v25++);
          }
          while (!v18);
          int64_t v17 = v25 - 1;
        }
      }
    }
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v15 = (v18 - 1) & v18;
    unint64_t v16 = v20 + (v17 << 6);
    int64_t v21 = v17;
    goto LABEL_17;
  }
LABEL_26:
  swift_bridgeObjectRetain();
  swift_release();
  sub_25C5EE490();
  uint64_t v26 = sub_25C5EE4A0();
  os_log_type_t v27 = sub_25C5EE780();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = v6;
    char v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v29 = 134217984;
    uint64_t v84 = v24;
    sub_25C5EE7F0();
    _os_log_impl(&dword_25C5AA000, v26, v27, "DenyListManager: loaded %ld records", v29, 0xCu);
    uint64_t v30 = v29;
    unint64_t v6 = v28;
    MEMORY[0x26118BA70](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v82 + 8))(v13, v0);
  return v6;
}

uint64_t sub_25C5B6D48()
{
  uint64_t v0 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v9 = (char *)&v56 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  int64_t v12 = (char *)&v56 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v56 - v13;
  unint64_t v15 = (uint8_t *)sub_25C5EE380();
  char v17 = sub_25C5B72F0(v15, v16, 0);
  swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v26 = (uint8_t *)sub_25C5EE3E0();
    char v28 = sub_25C5B72F0(v26, v27, 1);
    swift_bridgeObjectRelease();
    if (v28)
    {
      sub_25C5EE490();
      OUTLINED_FUNCTION_12_0();
      unint64_t v18 = v12;
      char v29 = sub_25C5EE4A0();
      os_log_type_t v30 = sub_25C5EE780();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_6_0();
        uint64_t v32 = swift_slowAlloc();
        OUTLINED_FUNCTION_11_0(v32);
        OUTLINED_FUNCTION_8_0(4.8149e-34);
        uint64_t v33 = sub_25C5EE3E0();
        uint64_t v35 = OUTLINED_FUNCTION_10_0(v33, v34);
        OUTLINED_FUNCTION_0_0(v35);
        OUTLINED_FUNCTION_5_0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C5AA000, v29, v30, "Phrase is not being added to the index since the bundleId is in the deny list: %s", v31, 0xCu);
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();

        (*(void (**)(char *, uint64_t))(v2 + 8))(v12, v57);
        return (uint64_t)v18;
      }

      OUTLINED_FUNCTION_5_0();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v12, v0);
    }
    else
    {
      uint64_t v36 = (uint8_t *)sub_25C5EE3C0();
      char v38 = (uint8_t *)v37;
      char v39 = sub_25C5B72F0(v36, v37, 2);
      swift_bridgeObjectRelease();
      if (v39)
      {
        sub_25C5EE490();
        OUTLINED_FUNCTION_12_0();
        unint64_t v18 = v9;
        unint64_t v40 = sub_25C5EE4A0();
        os_log_type_t v41 = sub_25C5EE780();
        if (os_log_type_enabled(v40, v41))
        {
          OUTLINED_FUNCTION_6_0();
          uint64_t v42 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_11_0(v42);
          OUTLINED_FUNCTION_7_0(4.8149e-34);
          uint64_t v43 = sub_25C5EE3C0();
          uint64_t v45 = OUTLINED_FUNCTION_10_0(v43, v44);
          OUTLINED_FUNCTION_0_0(v45);
          OUTLINED_FUNCTION_5_0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25C5AA000, v40, v41, "Phrase is not being added to the index since the phrase is in the deny list: %s", v38, 0xCu);
          OUTLINED_FUNCTION_2_0();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();

          (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v57);
          return (uint64_t)v18;
        }

        OUTLINED_FUNCTION_5_0();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v0);
      }
      else
      {
        uint64_t v46 = (uint8_t *)sub_25C5B7248();
        char v48 = sub_25C5B72F0(v46, v47, 3);
        swift_bridgeObjectRelease();
        if ((v48 & 1) == 0) {
          return 0;
        }
        sub_25C5EE490();
        OUTLINED_FUNCTION_12_0();
        unint64_t v18 = v6;
        uint64_t v49 = sub_25C5EE4A0();
        os_log_type_t v50 = sub_25C5EE780();
        if (os_log_type_enabled(v49, v50))
        {
          OUTLINED_FUNCTION_6_0();
          uint64_t v51 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_11_0(v51);
          OUTLINED_FUNCTION_7_0(4.8149e-34);
          uint64_t v52 = sub_25C5B7248();
          uint64_t v54 = OUTLINED_FUNCTION_10_0(v52, v53);
          OUTLINED_FUNCTION_0_0(v54);
          OUTLINED_FUNCTION_5_0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25C5AA000, v49, v50, "Phrase is not being added to the index since the bundleId and ActionIdentifier pair is in the deny list: %s)", v38, 0xCu);
          OUTLINED_FUNCTION_2_0();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();

          (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v57);
          return (uint64_t)v18;
        }

        OUTLINED_FUNCTION_5_0();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v0);
      }
    }
    return 1;
  }
  sub_25C5EE490();
  OUTLINED_FUNCTION_12_0();
  unint64_t v18 = v14;
  int64_t v19 = sub_25C5EE4A0();
  os_log_type_t v20 = sub_25C5EE780();
  if (!os_log_type_enabled(v19, v20))
  {

    OUTLINED_FUNCTION_5_0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v14, v0);
    return 1;
  }
  int64_t v21 = (uint8_t *)OUTLINED_FUNCTION_6_0();
  uint64_t v22 = swift_slowAlloc();
  OUTLINED_FUNCTION_11_0(v22);
  OUTLINED_FUNCTION_8_0(4.8149e-34);
  uint64_t v23 = sub_25C5EE380();
  uint64_t v25 = OUTLINED_FUNCTION_10_0(v23, v24);
  OUTLINED_FUNCTION_0_0(v25);
  OUTLINED_FUNCTION_5_0();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25C5AA000, v19, v20, "Phrase is not being added to the index since the actionIdentifier is in the deny list: %s", v21, 0xCu);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();

  (*(void (**)(char *, uint64_t))(v2 + 8))(v14, v57);
  return (uint64_t)v18;
}

uint64_t sub_25C5B7248()
{
  uint64_t v1 = sub_25C5EE3E0();
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRelease();
  sub_25C5EE380();
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25C5B72F0(uint8_t *a1, uint64_t a2, char a3)
{
  uint64_t v7 = 0xD000000000000010;
  uint64_t v8 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v9;
  MEMORY[0x270FA5388](v10);
  int64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = 0x800000025C5F0B80;
  uint64_t v14 = 0xD000000000000010;
  switch(a3)
  {
    case 1:
      uint64_t v13 = 0xE800000000000000;
      uint64_t v14 = 0x6449656C646E7562;
      break;
    case 2:
      uint64_t v13 = 0xE600000000000000;
      uint64_t v14 = 0x657361726870;
      break;
    case 3:
      uint64_t v14 = 0xD00000000000001BLL;
      uint64_t v13 = 0x800000025C5F0B60;
      break;
    default:
      break;
  }
  uint64_t v15 = sub_25C5AE368(v14, v13, *(void *)(v3 + 16));
  swift_bridgeObjectRelease();
  if (v15)
  {
    sub_25C5DFBDC((uint64_t)a1, a2, v15);
    char v17 = v16;
    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  else
  {
    sub_25C5EE490();
    int64_t v19 = sub_25C5EE4A0();
    os_log_type_t v20 = sub_25C5EE790();
    if (os_log_type_enabled(v19, v20))
    {
      swift_slowAlloc();
      uint64_t v25 = OUTLINED_FUNCTION_9_0();
      *(_DWORD *)a1 = 136315138;
      unint64_t v21 = 0x800000025C5F0B80;
      switch(a3)
      {
        case 0:
          break;
        case 1:
          unint64_t v21 = 0xE800000000000000;
          uint64_t v7 = 0x6449656C646E7562;
          break;
        case 2:
          unint64_t v21 = 0xE600000000000000;
          uint64_t v7 = 0x657361726870;
          break;
        case 3:
          uint64_t v7 = 0xD00000000000001BLL;
          unint64_t v21 = 0x800000025C5F0B60;
          break;
        default:
          JUMPOUT(0);
      }
      uint64_t v24 = sub_25C5CD724(v7, v21, &v25);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v19, v20, "DenyListManager: Unable to find attribute in the deny list: %s", a1, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v8);
    return 0;
  }
}

uint64_t sub_25C5B75D8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DenyListManager()
{
  return self;
}

uint64_t sub_25C5B7634(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_25C5E548C(&v33);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25C5E5664();
  if (v8)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    while (1)
    {
      uint64_t v13 = (void *)*a5;
      unint64_t v15 = sub_25C5B0114(v10, v11);
      uint64_t v16 = v13[2];
      BOOL v17 = (v14 & 1) == 0;
      uint64_t v18 = v16 + v17;
      if (__OFADD__(v16, v17)) {
        break;
      }
      char v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(qword_26B3510C0);
          sub_25C5EE980();
        }
      }
      else
      {
        sub_25C5E3ADC(v18, a4 & 1);
        unint64_t v20 = sub_25C5B0114(v10, v11);
        if ((v19 & 1) != (v21 & 1)) {
          goto LABEL_17;
        }
        unint64_t v15 = v20;
      }
      uint64_t v22 = (void *)*a5;
      if (v19)
      {
        uint64_t v23 = *(void *)(v22[7] + 8 * v15);
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_25C5DFEB0(v12, v23);
        swift_bridgeObjectRelease();
        uint64_t v25 = v22[7];
        swift_bridgeObjectRelease();
        *(void *)(v25 + 8 * v15) = v24;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        uint64_t v26 = (uint64_t *)(v22[6] + 16 * v15);
        *uint64_t v26 = v10;
        v26[1] = v11;
        *(void *)(v22[7] + 8 * v15) = v12;
        uint64_t v27 = v22[2];
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_16;
        }
        v22[2] = v29;
      }
      uint64_t v10 = sub_25C5E5664();
      uint64_t v11 = v30;
      uint64_t v12 = v31;
      a4 = 1;
      if (!v30) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C5EEAC0();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_25C5B45A0();
    return swift_release();
  }
  return result;
}

void (*sub_25C5B7854(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_25C5B7DDC(v6);
  v6[10] = sub_25C5B7AA4(v6 + 4, a2, a3);
  return sub_25C5B7900;
}

void sub_25C5B7900(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_3_0();
  v2(v3);

  free(v1);
}

void (*sub_25C5B7968(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1)
{
  uint64_t v10 = malloc(0x60uLL);
  *a1 = v10;
  v10[8] = a3;
  v10[9] = a5;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10[10] = sub_25C5B7E0C(v10);
  v10[11] = sub_25C5B7C28(v10 + 4, a2, a3, a4, a5);
  return sub_25C5B7A34;
}

void sub_25C5B7A34(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 80);
  (*(void (**)(void))(*(void *)a1 + 88))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = OUTLINED_FUNCTION_3_0();
  v2(v3);

  free(v1);
}

void (*sub_25C5B7AA4(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[2] = a3;
  v8[3] = v3;
  v8[1] = a2;
  uint64_t v9 = *v3;
  unint64_t v10 = sub_25C5B0114(a2, a3);
  *((unsigned char *)v8 + 40) = v11 & 1;
  if (__OFADD__(*(void *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B3510C0);
  if (sub_25C5EE970())
  {
    unint64_t v14 = sub_25C5B0114(a2, a3);
    if ((v13 & 1) == (v15 & 1))
    {
      unint64_t v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    uint64_t result = (void (*)(uint64_t **))sub_25C5EEAC0();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[4] = v12;
  if (v13) {
    uint64_t v16 = *(void *)(*(void *)(*v4 + 56) + 8 * v12);
  }
  else {
    uint64_t v16 = 0;
  }
  *uint64_t v8 = v16;
  return sub_25C5B7BD8;
}

void sub_25C5B7BD8(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_25C5B7E48(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();

  free(v1);
}

void (*sub_25C5B7C28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t **a1)
{
  unint64_t v6 = v5;
  unint64_t v12 = malloc(0x40uLL);
  *a1 = v12;
  v12[4] = a5;
  v12[5] = v6;
  v12[2] = a3;
  v12[3] = a4;
  v12[1] = a2;
  uint64_t v13 = *v6;
  unint64_t v14 = sub_25C5B018C(a2, a3, a4, a5);
  *((unsigned char *)v12 + 56) = v15 & 1;
  if (__OFADD__(*(void *)(v13 + 16), (v15 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v16 = v14;
  char v17 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9250);
  if (sub_25C5EE970())
  {
    unint64_t v18 = sub_25C5B018C(a2, a3, a4, a5);
    if ((v17 & 1) == (v19 & 1))
    {
      unint64_t v16 = v18;
      goto LABEL_5;
    }
LABEL_10:
    uint64_t result = (void (*)(uint64_t **))sub_25C5EEAC0();
    __break(1u);
    return result;
  }
LABEL_5:
  v12[6] = v16;
  if (v17) {
    uint64_t v20 = *(void *)(*(void *)(*v6 + 56) + 8 * v16);
  }
  else {
    uint64_t v20 = 0;
  }
  *unint64_t v12 = v20;
  return sub_25C5B7D88;
}

void sub_25C5B7D88(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_25C5B7F1C(*a1, *((unsigned char *)*a1 + 56), (void **)(*a1)[5], (*a1)[6], (*a1)[1], (*a1)[2], (*a1)[3], (*a1)[4]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_25C5B7DDC(void *a1))()
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25C5B86F8;
}

uint64_t (*sub_25C5B7E0C(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_25C5B7E3C;
}

uint64_t sub_25C5B7E3C(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_25C5B7E48(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v6;
    }
    else
    {
      sub_25C5B92F8(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
    sub_25C5EE990();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_25C5B7F1C(uint64_t *a1, char a2, void **a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)((*a3)[7] + 8 * a4) = v8;
    }
    else
    {
      sub_25C5B9314(a4, a5, a6, a7, a8, v8, *a3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B351090);
    sub_25C5B86AC();
    sub_25C5EE990();
  }

  return swift_bridgeObjectRetain();
}

id sub_25C5B8010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (void *)sub_25C5EE570();
  uint64_t v7 = (void *)sub_25C5EE570();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_25C5B8088(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25C5EE4B0();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v28 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C5EE090();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32[5] = a2;
  swift_retain();
  sub_25C5EE020();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
  uint64_t v14 = *(void *)(sub_25C5EE070() + 16);
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(sub_25C5EE080() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v17 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    uint64_t v29 = v11;
    sub_25C5EE490();
    unint64_t v18 = sub_25C5EE4A0();
    os_log_type_t v19 = sub_25C5EE780();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 134217984;
      v32[0] = v17;
      sub_25C5EE7F0();
      _os_log_impl(&dword_25C5AA000, v18, v19, "DenyListManager: loaded %ld records from suggestions deny list.", v20, 0xCu);
      MEMORY[0x26118BA70](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
    char v21 = sub_25C5B5F20(v32, 0xD000000000000010, 0x800000025C5F0B80);
    if (*v22)
    {
      uint64_t v23 = sub_25C5EE070();
      sub_25C5B60E4(v23);
    }
    ((void (*)(void *, void))v21)(v32, 0);
    uint64_t v24 = sub_25C5B5F20(v32, 0xD000000000000010, 0x800000025C5F0B80);
    uint64_t v26 = v29;
    if (*v25)
    {
      uint64_t v27 = sub_25C5EE080();
      sub_25C5B60E4(v27);
    }
    ((void (*)(void *, void))v24)(v32, 0);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_25C5B8524@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C5E51D0(&v6, *a1, a1[1], a1[2]);
  uint64_t v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

unint64_t sub_25C5B8568()
{
  unint64_t result = qword_26B351088;
  if (!qword_26B351088)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B351080);
    sub_25C5B85E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351088);
  }
  return result;
}

unint64_t sub_25C5B85E4()
{
  unint64_t result = qword_26B351098;
  if (!qword_26B351098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B351090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B351098);
  }
  return result;
}

uint64_t sub_25C5B8650(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25C5B86AC()
{
  unint64_t result = qword_26A5B9258;
  if (!qword_26A5B9258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9258);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_7_0(float a1)
{
  *uint64_t v1 = a1;
  *(void *)(v3 - 104) = v2;
}

void OUTLINED_FUNCTION_8_0(float a1)
{
  *uint64_t v1 = a1;
  *(void *)(v3 - 104) = v2;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1, unint64_t a2)
{
  return sub_25C5CD724(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_retain_n();
}

uint64_t sub_25C5B8814(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_25C5EEA90();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v11 = *(void *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_25C5B0510(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_25C5B88FC(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t result = sub_25C5B93B4(0, result, v3);
  if (v4) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = result;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
  if (v3 >= v5) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_25C5B896C(unint64_t a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C5EE490();
  uint64_t v6 = sub_25C5EE4A0();
  os_log_type_t v7 = sub_25C5EE770();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_25C5AA000, v6, v7, "Ranking Assistant Intent example phrases", v8, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_retain();
  sub_25C5BE05C(a1);
  return swift_release();
}

uint64_t sub_25C5B8ACC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete35AssistantIntentExamplePhrasesSource_source;
  uint64_t v2 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C5B8B7C()
{
  return type metadata accessor for AssistantIntentExamplePhrasesSource();
}

uint64_t type metadata accessor for AssistantIntentExamplePhrasesSource()
{
  uint64_t result = qword_26A5B9268;
  if (!qword_26A5B9268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5B8BCC()
{
  uint64_t result = sub_25C5EE330();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C5B8C68(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  os_log_type_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A5B9280 + dword_26A5B9280);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25C5B8D24;
  return v7(v4, v3);
}

uint64_t sub_25C5B8D24(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25C5B8E20(uint64_t a1, uint64_t a2, double a3)
{
  sub_25C5B0114(a1, a2);
  OUTLINED_FUNCTION_0_1();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9290);
  uint64_t result = sub_25C5EE970();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_25C5B0114(a1, a2);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    uint64_t result = sub_25C5EEAC0();
    __break(1u);
    return result;
  }
  unint64_t v10 = result;
LABEL_5:
  uint64_t v14 = *v3;
  if (v11)
  {
    *(double *)(v14[7] + 8 * v10) = a3;
  }
  else
  {
    sub_25C5B92B0(v10, a1, a2, v14, a3);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25C5B8F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25C5B0114(a2, a3);
  OUTLINED_FUNCTION_0_1();
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9288);
  if ((sub_25C5EE970() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_25C5B0114(a2, a3);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    uint64_t result = sub_25C5EEAC0();
    __break(1u);
    return result;
  }
  unint64_t v10 = v12;
LABEL_5:
  uint64_t v14 = *v3;
  if (v11)
  {
    uint64_t v15 = *(void *)(v14 + 56);
    uint64_t result = swift_release();
    *(void *)(v15 + 8 * v10) = a1;
  }
  else
  {
    sub_25C5B92F8(v10, a2, a3, a1, v14);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_25C5B9054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25C5B018C(a2, a3, a4, a5);
  OUTLINED_FUNCTION_0_1();
  if (v13)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v11;
  char v15 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9250);
  if ((OUTLINED_FUNCTION_4_0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_25C5B018C(a2, a3, a4, a5);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    sub_25C5EEAC0();
    __break(1u);
    return;
  }
  unint64_t v14 = v16;
LABEL_5:
  unint64_t v18 = *v5;
  if (v15)
  {
    uint64_t v19 = v18[7];
    swift_bridgeObjectRelease();
    *(void *)(v19 + 8 * v14) = a1;
    OUTLINED_FUNCTION_2_1();
  }
  else
  {
    sub_25C5B9314(v14, a2, a3, a4, a5, a1, v18);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_1();
    swift_bridgeObjectRetain();
  }
}

void sub_25C5B9184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25C5B0114(a4, a5);
  OUTLINED_FUNCTION_0_1();
  if (v13)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v11;
  char v15 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351360);
  if ((OUTLINED_FUNCTION_4_0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_25C5B0114(a4, a5);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    sub_25C5EEAC0();
    __break(1u);
    return;
  }
  unint64_t v14 = v16;
LABEL_5:
  unint64_t v18 = *v5;
  if (v15)
  {
    uint64_t v19 = (uint64_t *)(v18[7] + 24 * v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v19 = a1;
    v19[1] = a2;
    v19[2] = a3;
    OUTLINED_FUNCTION_2_1();
  }
  else
  {
    sub_25C5B9360(v14, a4, a5, a1, a2, a3, v18);
    OUTLINED_FUNCTION_2_1();
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_25C5B92B0(unint64_t result, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a4[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(double *)(a4[7] + 8 * result) = a5;
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_25C5B92F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result = OUTLINED_FUNCTION_1_0(a1, a2, a3, a4, a5);
  if (v8) {
    __break(1u);
  }
  else {
    *(void *)(v6 + 16) = v7;
  }
  return result;
}

unint64_t sub_25C5B9314(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = (void *)(a7[6] + 32 * result);
  void *v7 = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  *(void *)(a7[7] + 8 * result) = a6;
  uint64_t v8 = a7[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a7[2] = v10;
  }
  return result;
}

unint64_t sub_25C5B9360(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = (void *)(a7[6] + 16 * result);
  void *v7 = a2;
  v7[1] = a3;
  uint64_t v8 = (void *)(a7[7] + 24 * result);
  *uint64_t v8 = a4;
  v8[1] = a5;
  v8[2] = a6;
  uint64_t v9 = a7[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a7[2] = v11;
  }
  return result;
}

uint64_t sub_25C5B93B4(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_25C5B9400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v57 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v54 = (uint64_t)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v53 = (uint64_t)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_25C5EE330();
  uint64_t v14 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v51 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8);
  uint64_t v55 = a1;
  uint64_t v56 = a2;
  uint64_t v17 = v16(a1, a2, a4, a5);
  uint64_t v18 = sub_25C5B88FC(500, v17);
  uint64_t v22 = sub_25C5B8814(v18, v19, v20, v21);
  uint64_t v23 = *(void *)(v22 + 16);
  if (!v23)
  {
    return swift_bridgeObjectRelease();
  }
  uint64_t v50 = sub_25C5EE410();
  uint64_t v49 = *(void (**)(char *, void, uint64_t))(v14 + 104);
  unsigned int v48 = *MEMORY[0x263F6CCF0];
  v47[1] = v22;
  void v47[2] = v14 + 104;
  for (uint64_t i = v22 + 56; ; i += 32)
  {
    uint64_t v26 = *(void *)(i - 24);
    uint64_t v25 = *(void *)(i - 16);
    v49(v51, v48, v52);
    uint64_t v27 = sub_25C5EE1D0();
    __swift_storeEnumTagSinglePayload(v53, 1, 1, v27);
    uint64_t v28 = sub_25C5EDF30();
    __swift_storeEnumTagSinglePayload(v54, 1, 1, v28);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_25C5EE3B0();
    if (*(void *)(*v57 + 16))
    {
      swift_bridgeObjectRetain();
      sub_25C5B0114(v26, v25);
      char v31 = v30;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v31)
      {
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_16;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_retain();
    uint64_t v32 = v57;
    swift_isUniquelyReferenced_nonNull_native();
    char v58 = (void *)*v32;
    long long v33 = v58;
    void *v32 = 0x8000000000000000;
    unint64_t v34 = sub_25C5B0114(v26, v25);
    if (__OFADD__(v33[2], (v35 & 1) == 0)) {
      break;
    }
    unint64_t v36 = v34;
    char v37 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9288);
    if (sub_25C5EE970())
    {
      unint64_t v38 = sub_25C5B0114(v26, v25);
      if ((v37 & 1) != (v39 & 1)) {
        goto LABEL_23;
      }
      unint64_t v36 = v38;
    }
    unint64_t v40 = v58;
    if (v37)
    {
      uint64_t v41 = v58[7];
      swift_release();
      *(void *)(v41 + 8 * v36) = v29;
    }
    else
    {
      v58[(v36 >> 6) + 8] |= 1 << v36;
      uint64_t v42 = (uint64_t *)(v40[6] + 16 * v36);
      *uint64_t v42 = v26;
      v42[1] = v25;
      *(void *)(v40[7] + 8 * v36) = v29;
      uint64_t v43 = v40[2];
      BOOL v44 = __OFADD__(v43, 1);
      uint64_t v45 = v43 + 1;
      if (v44) {
        goto LABEL_22;
      }
      v40[2] = v45;
      swift_bridgeObjectRetain();
    }
    *uint64_t v57 = v40;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_16:
    if (!--v23) {
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  uint64_t result = sub_25C5EEAC0();
  __break(1u);
  return result;
}

uint64_t sub_25C5B9888(uint64_t a1, void *a2)
{
  v2[16] = a2;
  v2[17] = *a2;
  uint64_t v4 = sub_25C5EE4B0();
  v2[18] = v4;
  v2[19] = *(void *)(v4 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[5] = type metadata accessor for DefaultEligibilityCriteria();
  v2[6] = &off_2709C32F0;
  v2[2] = a1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5B99A8, 0, 0);
}

uint64_t sub_25C5B99A8()
{
  uint64_t v43 = v0;
  uint64_t v41 = v0 + 2;
  sub_25C5EE490();
  unint64_t v1 = sub_25C5EE4A0();
  os_log_type_t v2 = sub_25C5EE770();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v39 = v0[21];
    uint64_t v3 = v0[19];
    uint64_t v38 = v0[18];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = sub_25C5EEB60();
    v0[15] = sub_25C5CD724(v5, v6, &v42);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v1, v2, "%s: Fetching phrases", v4, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    uint64_t v8 = v39;
    uint64_t v9 = v38;
  }
  else
  {
    uint64_t v10 = v0[21];
    uint64_t v12 = v0[18];
    uint64_t v11 = v0[19];

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    uint64_t v8 = v10;
    uint64_t v9 = v12;
  }
  unint64_t v40 = v7;
  v7(v8, v9);
  sub_25C5EE410();
  v0[13] = sub_25C5EE560();
  uint64_t v13 = *(void *)(*__swift_project_boxed_opaque_existential_1(v41, v0[5]) + 64);
  uint64_t v14 = v13 + 56;
  uint64_t v15 = -1;
  uint64_t v16 = -1 << *(unsigned char *)(v13 + 32);
  if (-v16 < 64) {
    uint64_t v15 = ~(-1 << -(char)v16);
  }
  unint64_t v17 = v15 & *(void *)(v13 + 56);
  int64_t v18 = (unint64_t)(63 - v16) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  if (!v17) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v21 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v21 | (v20 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v20 << 6))
  {
    uint64_t v26 = (uint64_t *)(*(void *)(v13 + 48) + 16 * i);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = *__swift_project_boxed_opaque_existential_1(v41, v0[5]);
    swift_bridgeObjectRetain();
    sub_25C5B9400(v27, v28, v29, (uint64_t)&type metadata for DefaultExamplePhrasesProvider, (uint64_t)&off_2709C3278, v0 + 13);
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_34:
      __break(1u);
      return result;
    }
    if (v23 >= v18) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v14 + 8 * v23);
    ++v20;
    if (!v24)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v18) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v14 + 8 * v20);
      if (!v24)
      {
        int64_t v20 = v23 + 2;
        if (v23 + 2 >= v18) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v14 + 8 * v20);
        if (!v24)
        {
          int64_t v20 = v23 + 3;
          if (v23 + 3 >= v18) {
            goto LABEL_28;
          }
          unint64_t v24 = *(void *)(v14 + 8 * v20);
          if (!v24)
          {
            int64_t v20 = v23 + 4;
            if (v23 + 4 >= v18) {
              goto LABEL_28;
            }
            unint64_t v24 = *(void *)(v14 + 8 * v20);
            if (!v24) {
              break;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v17 = (v24 - 1) & v24;
  }
  int64_t v25 = v23 + 5;
  if (v25 < v18)
  {
    unint64_t v24 = *(void *)(v14 + 8 * v25);
    if (!v24)
    {
      while (1)
      {
        int64_t v20 = v25 + 1;
        if (__OFADD__(v25, 1)) {
          goto LABEL_34;
        }
        if (v20 >= v18) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v14 + 8 * v20);
        ++v25;
        if (v24) {
          goto LABEL_25;
        }
      }
    }
    int64_t v20 = v25;
    goto LABEL_25;
  }
LABEL_28:
  swift_release();
  sub_25C5EE490();
  char v30 = sub_25C5EE4A0();
  os_log_type_t v31 = sub_25C5EE770();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 134217984;
    swift_beginAccess();
    v0[14] = *(void *)(v0[13] + 16);
    sub_25C5EE7F0();
    _os_log_impl(&dword_25C5AA000, v30, v31, "%ld phrase(s) created from Assistant Intent example phrases", v32, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v33 = v0[20];
  uint64_t v34 = v0[18];

  v40(v33, v34);
  swift_beginAccess();
  uint64_t v35 = swift_bridgeObjectRetain();
  unint64_t v36 = sub_25C5B05D8(v35);
  swift_bridgeObjectRelease();
  sub_25C5B896C((unint64_t)v36);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  swift_task_dealloc();
  swift_task_dealloc();
  char v37 = (uint64_t (*)(const void *))v0[1];
  return v37(v36);
}

unint64_t OUTLINED_FUNCTION_1_0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a5 + 8 * (result >> 6) + 64) |= 1 << result;
  uint64_t v5 = (void *)(*(void *)(a5 + 48) + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(*(void *)(a5 + 56) + 8 * result) = a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_25C5EE970();
}

uint64_t sub_25C5B9F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

uint64_t sub_25C5B9F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 16))();
}

BOOL sub_25C5B9F30(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_25C5B9F40()
{
  return sub_25C5EEAF0();
}

uint64_t sub_25C5B9F68(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025C5F0B80 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v5 || (sub_25C5EEA80() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x657361726870 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_25C5EEA80();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_25C5BA0A4()
{
  return 3;
}

uint64_t sub_25C5BA0AC()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5BA0F4(char a1)
{
  if (!a1) {
    return 0xD000000000000010;
  }
  if (a1 == 1) {
    return 0x6449656C646E7562;
  }
  return 0x657361726870;
}

BOOL sub_25C5BA14C(char *a1, char *a2)
{
  return sub_25C5B9F30(*a1, *a2);
}

uint64_t sub_25C5BA158()
{
  return sub_25C5BA0AC();
}

uint64_t sub_25C5BA160()
{
  return sub_25C5B9F40();
}

uint64_t sub_25C5BA168()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5BA1AC()
{
  return sub_25C5BA0F4(*v0);
}

uint64_t sub_25C5BA1B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5B9F68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5BA1DC()
{
  return sub_25C5BA728();
}

uint64_t sub_25C5BA1FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5BA0A4();
  *a1 = result;
  return result;
}

uint64_t sub_25C5BA224(uint64_t a1)
{
  unint64_t v2 = sub_25C5BCBB0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5BA260(uint64_t a1)
{
  unint64_t v2 = sub_25C5BCBB0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25C5BA29C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9348);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5BCBB0();
  sub_25C5EEB20();
  OUTLINED_FUNCTION_3_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_3_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void sub_25C5BA3C8()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9328);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25C5BCBB0();
  sub_25C5EEB10();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_25C5EEA00();
    uint64_t v8 = v7;
    uint64_t v20 = v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25C5EEA00();
    uint64_t v11 = v10;
    uint64_t v18 = v9;
    swift_bridgeObjectRetain();
    uint64_t v19 = v11;
    uint64_t v12 = sub_25C5EEA00();
    uint64_t v14 = v13;
    uint64_t v15 = v12;
    uint64_t v16 = OUTLINED_FUNCTION_1_1();
    v17(v16);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v4 = v20;
    v4[1] = v8;
    v4[2] = v18;
    v4[3] = v19;
    v4[4] = v15;
    v4[5] = v14;
  }
  OUTLINED_FUNCTION_4_1();
}

BOOL sub_25C5BA5FC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25C5BA60C()
{
  return sub_25C5EEAF0();
}

uint64_t sub_25C5BA634(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000025C5F0B80 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25C5BA720()
{
  return 2;
}

uint64_t sub_25C5BA728()
{
  return 0;
}

uint64_t sub_25C5BA734(char a1)
{
  if (a1) {
    return 0x6449656C646E7562;
  }
  else {
    return 0xD000000000000010;
  }
}

void sub_25C5BA770()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9350);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7_1();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25C5BCBFC();
  sub_25C5EEB20();
  sub_25C5EEA40();
  if (!v0) {
    sub_25C5EEA40();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_4_1();
}

void sub_25C5BA89C()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9338);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_1();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25C5BCBFC();
  sub_25C5EEB10();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    sub_25C5EEA00();
    swift_bridgeObjectRetain();
    sub_25C5EEA00();
    uint64_t v4 = OUTLINED_FUNCTION_5_1();
    v5(v4);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_25C5BAA44(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6465766F72707061 && a2 == 0xEF73657361726850;
  if (v3 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000025C5F0C60)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25C5BAB44()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5BAB8C(char a1)
{
  if (a1) {
    return 0xD000000000000019;
  }
  else {
    return 0x6465766F72707061;
  }
}

void sub_25C5BABD4()
{
  OUTLINED_FUNCTION_9_1();
  BOOL v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B92E8);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8_1();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25C5BC48C();
  sub_25C5EEB20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B92B8);
  sub_25C5BC5BC(&qword_26A5B92F0, &qword_26A5B92B8, (void (*)(void))sub_25C5BC570);
  OUTLINED_FUNCTION_12_1();
  sub_25C5EEA60();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B92D0);
    sub_25C5BC5BC(&qword_26A5B9300, &qword_26A5B92D0, (void (*)(void))sub_25C5BC628);
    OUTLINED_FUNCTION_12_1();
    sub_25C5EEA60();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_4_1();
}

uint64_t sub_25C5BAD90(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B92A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7_1();
  uint64_t v4 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_25C5BC48C();
  sub_25C5EEB10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B92B8);
    sub_25C5BC5BC(&qword_26A5B92C0, &qword_26A5B92B8, (void (*)(void))sub_25C5BC4D8);
    sub_25C5EEA20();
    uint64_t v4 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B92D0);
    sub_25C5BC5BC(&qword_26A5B92D8, &qword_26A5B92D0, (void (*)(void))sub_25C5BC524);
    swift_bridgeObjectRetain();
    sub_25C5EEA20();
    uint64_t v6 = OUTLINED_FUNCTION_13_0();
    v7(v6);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_25C5BAFD8()
{
  swift_bridgeObjectRetain();
  sub_25C5EE5C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C5EE5C0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C5BB064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v12 = a1 == a5 && a2 == a6;
  if (v12 || (v13 = sub_25C5EEA80(), uint64_t result = 0, (v13 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_25C5EEA80();
    }
  }
  return result;
}

uint64_t sub_25C5BB104()
{
  return sub_25C5EEB00();
}

double sub_25C5BB194@<D0>(_OWORD *a1@<X8>)
{
  sub_25C5BA3C8();
  if (!v1)
  {
    *a1 = v4;
    a1[1] = v5;
    double result = *(double *)&v6;
    a1[2] = v6;
  }
  return result;
}

uint64_t sub_25C5BB1D8(void *a1)
{
  return sub_25C5BA29C(a1);
}

BOOL sub_25C5BB1F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C5BA5FC(*a1, *a2);
}

uint64_t sub_25C5BB1FC()
{
  return sub_25C5BAB44();
}

uint64_t sub_25C5BB218()
{
  return sub_25C5BA60C();
}

uint64_t sub_25C5BB224()
{
  return sub_25C5BA734(*v0);
}

uint64_t sub_25C5BB22C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5BA634(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5BB254@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5BA720();
  *a1 = result;
  return result;
}

uint64_t sub_25C5BB27C(uint64_t a1)
{
  unint64_t v2 = sub_25C5BCBFC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5BB2B8(uint64_t a1)
{
  unint64_t v2 = sub_25C5BCBFC();

  return MEMORY[0x270FA00B8](a1, v2);
}

void sub_25C5BB2F4(void *a1@<X8>)
{
  sub_25C5BA89C();
  if (!v1)
  {
    *a1 = v3;
    a1[1] = v4;
    a1[2] = v5;
    a1[3] = v6;
  }
}

void sub_25C5BB324()
{
}

uint64_t sub_25C5BB344()
{
  return sub_25C5BAB8C(*v0);
}

uint64_t sub_25C5BB34C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5BAA44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5BB374(uint64_t a1)
{
  unint64_t v2 = sub_25C5BC48C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5BB3B0(uint64_t a1)
{
  unint64_t v2 = sub_25C5BC48C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25C5BB3EC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C5BAD90(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

void sub_25C5BB418()
{
}

uint64_t sub_25C5BB434()
{
  return sub_25C5BB104();
}

uint64_t sub_25C5BB440()
{
  return sub_25C5BAFD8();
}

uint64_t sub_25C5BB44C()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5BB4D0(uint64_t *a1, uint64_t *a2)
{
  return sub_25C5BB064(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_25C5BB4EC()
{
  type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider();
  swift_allocObject();
  uint64_t result = sub_25C5BB528();
  qword_26A5B98A0 = result;
  return result;
}

uint64_t sub_25C5BB528()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351090);
  sub_25C5B86AC();
  *(void *)(v0 + 16) = sub_25C5EE560();
  *(void *)(v0 + 16) = sub_25C5BB5C4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C5BB5C4()
{
  uint64_t v35 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = v0;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v32 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FE8);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_6_1();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_25C5EDED0();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v32 - v18;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v21 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v22 = sub_25C5EAE40(0xD00000000000001ELL, 0x800000025C5F0C40, 0x7473696C70, 0xE500000000000000, v21);

  if (v22)
  {
    sub_25C5EDEC0();

    int64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
    v23(v10, v17, v11);
    __swift_storeEnumTagSinglePayload(v10, 0, 1, v11);
    if (__swift_getEnumTagSinglePayload(v10, 1, v11) != 1)
    {
      uint64_t v33 = v13;
      v23((uint64_t)v19, (char *)v10, v11);
      sub_25C5EDE80();
      swift_allocObject();
      sub_25C5EDE70();
      uint64_t v27 = sub_25C5EDEE0();
      unint64_t v29 = v28;
      sub_25C5BC294();
      sub_25C5EDE60();
      uint64_t v31 = sub_25C5BBBB4(v36, v37);
      sub_25C5B4690(v27, v29);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v11);
      return v31;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  }
  sub_25C5BC234(v10);
  sub_25C5EE490();
  unint64_t v24 = sub_25C5EE4A0();
  os_log_type_t v25 = sub_25C5EE780();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_25C5AA000, v24, v25, "ApprovedPhrasesForAppShortcuts: unable to get a path to the list of approved phrases for App Shortcuts", v26, 2u);
    MEMORY[0x26118BA70](v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351090);
  sub_25C5B86AC();
  return sub_25C5EE560();
}

uint64_t sub_25C5BBBB4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351090);
  sub_25C5B86AC();
  uint64_t v37 = sub_25C5EE560();
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v33 = a2;
    swift_bridgeObjectRetain();
    uint64_t v5 = (uint64_t *)(a1 + 72);
    do
    {
      uint64_t v6 = *(v5 - 5);
      uint64_t v7 = *(v5 - 4);
      uint64_t v8 = *(v5 - 3);
      uint64_t v9 = *(v5 - 2);
      uint64_t v10 = *v5;
      uint64_t v35 = *(v5 - 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_25C5BBE70(v8, v9, v6, v7, (uint64_t)&v37);
      uint64_t v15 = sub_25C5B5FE8(v36, v11, v12, v13, v14);
      unint64_t v17 = v15;
      uint64_t v18 = *v16;
      if (*v16)
      {
        uint64_t v19 = v16;
        uint64_t v34 = v15;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v19 = v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_25C5E9A5C(0, *(void *)(v18 + 16) + 1, 1, v18);
          uint64_t v18 = v24;
          *uint64_t v19 = v24;
        }
        unint64_t v22 = *(void *)(v18 + 16);
        unint64_t v21 = *(void *)(v18 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_25C5E9A5C(v21 > 1, v22 + 1, 1, v18);
          uint64_t v18 = v25;
          *uint64_t v19 = v25;
        }
        *(void *)(v18 + 16) = v22 + 1;
        uint64_t v23 = v18 + 16 * v22;
        *(void *)(v23 + 32) = v35;
        *(void *)(v23 + 40) = v10;
        ((void (*)(void *, void))v34)(v36, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ((void (*)(void *, void))v17)(v36, 0);
      }
      v5 += 6;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    a2 = v33;
  }
  uint64_t v26 = *(void *)(a2 + 16);
  if (v26)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = (uint64_t *)(a2 + 56);
    do
    {
      uint64_t v28 = *(v27 - 3);
      uint64_t v29 = *(v27 - 2);
      uint64_t v30 = *(v27 - 1);
      uint64_t v31 = *v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25C5BBE70(v30, v31, v28, v29, (uint64_t)&v37);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v27 += 4;
      --v26;
    }
    while (v26);
    swift_bridgeObjectRelease();
  }
  return v37;
}

uint64_t sub_25C5BBE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(*(void *)a5 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v9 || (uint64_t v10 = OUTLINED_FUNCTION_11_1(), sub_25C5B018C(v10, v11, v12, v13), (v14 & 1) == 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C5CE04C(MEMORY[0x263F8EE78], a1, a2, a3, a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_11_1();
}

uint64_t sub_25C5BBF24()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  OUTLINED_FUNCTION_2_2();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_14_0();
  if ((v3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    sub_25C5B44F4();
    swift_bridgeObjectRetain();
    uint64_t v6 = v4 + 40;
    while (sub_25C5EE830())
    {
      v6 += 16;
      if (!--v5)
      {
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 1;
}

uint64_t sub_25C5BC058()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  OUTLINED_FUNCTION_2_2();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v2 = OUTLINED_FUNCTION_14_0();
  if ((v3 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = *(void *)(*(void *)(v1 + 56) + 8 * v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    goto LABEL_9;
  }
  sub_25C5B44F4();
  uint64_t v6 = v4 + 40;
  while (1)
  {
    uint64_t v7 = *(void *)(v6 - 8);
    swift_bridgeObjectRetain();
    if (!sub_25C5EE830()) {
      break;
    }
    v6 += 16;
    swift_bridgeObjectRelease();
    if (!--v5) {
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider()
{
  return self;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for ApprovedPhrasesMappingKey()
{
}

unint64_t sub_25C5BC1E4()
{
  unint64_t result = qword_26A5B9298;
  if (!qword_26A5B9298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9298);
  }
  return result;
}

uint64_t sub_25C5BC234(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25C5BC294()
{
  unint64_t result = qword_26A5B92A0;
  if (!qword_26A5B92A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B92A0);
  }
  return result;
}

uint64_t sub_25C5BC2E4()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_25C5BC320(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25C5BC358(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_25C5BC3C4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C5BC404(uint64_t *a1, int a2)
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

uint64_t sub_25C5BC444(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ApprovedPhraseList()
{
}

unint64_t sub_25C5BC48C()
{
  unint64_t result = qword_26A5B92B0;
  if (!qword_26A5B92B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B92B0);
  }
  return result;
}

unint64_t sub_25C5BC4D8()
{
  unint64_t result = qword_26A5B92C8;
  if (!qword_26A5B92C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B92C8);
  }
  return result;
}

unint64_t sub_25C5BC524()
{
  unint64_t result = qword_26A5B92E0;
  if (!qword_26A5B92E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B92E0);
  }
  return result;
}

unint64_t sub_25C5BC570()
{
  unint64_t result = qword_26A5B92F8;
  if (!qword_26A5B92F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B92F8);
  }
  return result;
}

uint64_t sub_25C5BC5BC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25C5BC628()
{
  unint64_t result = qword_26A5B9308;
  if (!qword_26A5B9308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9308);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovedPhraseList.CodingKeys()
{
  return &type metadata for ApprovedPhraseList.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for StaticSuggestionApprovedPhrase(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_25C5BC6D0()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_25C5BC70C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25C5BC74C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_25C5BC7BC(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C5BC804(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t sub_25C5BC844(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ApprovedAction()
{
}

uint64_t sub_25C5BC890()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_25C5BC8D4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_25C5BC92C(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *sub_25C5BC9D0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25C5BCA28(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t sub_25C5BCA68(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ApprovedPhrase()
{
}

unint64_t sub_25C5BCAC4()
{
  unint64_t result = qword_26A5B9310;
  if (!qword_26A5B9310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9310);
  }
  return result;
}

unint64_t sub_25C5BCB14()
{
  unint64_t result = qword_26A5B9318;
  if (!qword_26A5B9318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9318);
  }
  return result;
}

unint64_t sub_25C5BCB64()
{
  unint64_t result = qword_26A5B9320;
  if (!qword_26A5B9320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9320);
  }
  return result;
}

unint64_t sub_25C5BCBB0()
{
  unint64_t result = qword_26A5B9330;
  if (!qword_26A5B9330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9330);
  }
  return result;
}

unint64_t sub_25C5BCBFC()
{
  unint64_t result = qword_26A5B9340;
  if (!qword_26A5B9340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9340);
  }
  return result;
}

uint64_t _s16SiriAutoComplete18ApprovedPhraseListV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16SiriAutoComplete18ApprovedPhraseListV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C5BCD9CLL);
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

uint64_t sub_25C5BCDC4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C5BCDCC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ApprovedAction.CodingKeys()
{
  return &type metadata for ApprovedAction.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriAutoCompleteHistogramType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ApprovedPhrase.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C5BCF3CLL);
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

unsigned char *sub_25C5BCF64(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ApprovedPhrase.CodingKeys()
{
  return &type metadata for ApprovedPhrase.CodingKeys;
}

unint64_t sub_25C5BCF80()
{
  unint64_t result = qword_26A5B9358;
  if (!qword_26A5B9358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9358);
  }
  return result;
}

unint64_t sub_25C5BCFD0()
{
  unint64_t result = qword_26A5B9360;
  if (!qword_26A5B9360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9360);
  }
  return result;
}

unint64_t sub_25C5BD020()
{
  unint64_t result = qword_26A5B9368;
  if (!qword_26A5B9368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9368);
  }
  return result;
}

unint64_t sub_25C5BD070()
{
  unint64_t result = qword_26A5B9370;
  if (!qword_26A5B9370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9370);
  }
  return result;
}

unint64_t sub_25C5BD0C0()
{
  unint64_t result = qword_26A5B9378;
  if (!qword_26A5B9378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9378);
  }
  return result;
}

unint64_t sub_25C5BD110()
{
  unint64_t result = qword_26A5B9380;
  if (!qword_26A5B9380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9380);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_25C5EEA40();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_25C5B018C(v3, v1, v0, v2);
}

uint64_t sub_25C5BD2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

void sub_25C5BD2D8()
{
  unk_26A5B9397 = -18;
}

void sub_25C5BD308()
{
  qword_26A5B9398 = 0x414E5F5452415453;
  unk_26A5B93A0 = 0xE900000000000056;
}

void sub_25C5BD330()
{
  qword_26A5B93A8 = 1936744781;
  unk_26A5B93B0 = 0xE400000000000000;
}

uint64_t sub_25C5BD34C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_25C5EE4B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v42 - v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v42 - v16;
  sub_25C5AE304(0x656C746974, 0xE500000000000000, a3, v46);
  if (!v47)
  {
    sub_25C5BDAD8((uint64_t)v46);
LABEL_18:
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_25C5EE4A0();
    os_log_type_t v28 = sub_25C5EE790();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v43 = v8;
      uint64_t v30 = a1;
      uint64_t v31 = (uint8_t *)v29;
      v46[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315394;
      double v44 = COERCE_DOUBLE(OUTLINED_FUNCTION_1_2((uint64_t)"extractTitle(bundleId:parametersByName:intent:)"));
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_5_2();
      double v44 = COERCE_DOUBLE(sub_25C5CD724(v30, a2, v46));
      OUTLINED_FUNCTION_0_2();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v27, v28, "Function: %s > parametersByName does not contain 'title' attribute; no phrase generated for generic intent from: %s",
        v31,
        0x16u);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v43);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    goto LABEL_33;
  }
  if ((OUTLINED_FUNCTION_3_2() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v43 = a1;
  double v18 = v44;
  sub_25C5AE304(0x746E656D656C65, 0xE700000000000000, a3, v46);
  if (!v47)
  {
    swift_bridgeObjectRelease();
    sub_25C5BDAD8((uint64_t)v46);
LABEL_23:
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v32 = sub_25C5EE4A0();
    os_log_type_t v33 = sub_25C5EE790();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      v46[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315394;
      double v44 = COERCE_DOUBLE(OUTLINED_FUNCTION_1_2((uint64_t)"extractTitle(bundleId:parametersByName:intent:)"));
      OUTLINED_FUNCTION_0_2();
      *(_WORD *)(v34 + 12) = 2080;
      swift_bridgeObjectRetain();
      double v44 = COERCE_DOUBLE(sub_25C5CD724(v43, a2, v46));
      OUTLINED_FUNCTION_0_2();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v32, v33, "Function: %s > parametersByName does not contain the 'element' attribute; no phrase generated for generic intent from: %s",
        (uint8_t *)v34,
        0x16u);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    goto LABEL_33;
  }
  if ((OUTLINED_FUNCTION_3_2() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  double v20 = v44;
  uint64_t v19 = v45;
  sub_25C5AE304(0xD000000000000014, 0x800000025C5F0CF0, a3, v46);
  if (!v47)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C5BDAD8((uint64_t)v46);
LABEL_29:
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_25C5EE4A0();
    os_log_type_t v36 = sub_25C5EE790();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v46[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315394;
      double v44 = COERCE_DOUBLE(OUTLINED_FUNCTION_1_2((uint64_t)"extractTitle(bundleId:parametersByName:intent:)"));
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_5_2();
      double v44 = COERCE_DOUBLE(sub_25C5CD724(v43, a2, v46));
      OUTLINED_FUNCTION_0_2();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v35, v36, "Function: %s > parametersByName does not contain the 'compatibilityVersion' attribute; no phrase generated for g"
        "eneric intent from: %s",
        v37,
        0x16u);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
    goto LABEL_33;
  }
  if ((OUTLINED_FUNCTION_3_2() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  if (v44 < 1.0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_33:
    double v18 = 0.0;
    return *(void *)&v18;
  }
  id v21 = objc_msgSend(a4, sel_domain, v44);
  uint64_t v22 = sub_25C5EE580();
  uint64_t v24 = v23;

  if (qword_26A5B9138 != -1) {
    swift_once();
  }
  if (v22 == qword_26A5B93A8 && v24 == unk_26A5B93B0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v26 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      goto LABEL_15;
    }
  }
  if (qword_26A5B9128 != -1) {
    swift_once();
  }
  BOOL v39 = *(void *)&v20 == qword_26A5B9388 && v19 == unk_26A5B9390;
  if (v39 || (sub_25C5EEA80() & 1) != 0) {
    goto LABEL_51;
  }
  if (qword_26A5B9130 != -1) {
    swift_once();
  }
  if (*(void *)&v20 == qword_26A5B9398 && v19 == unk_26A5B93A0)
  {
LABEL_51:
    swift_bridgeObjectRelease();
    return *(void *)&v18;
  }
  char v41 = sub_25C5EEA80();
  swift_bridgeObjectRelease();
  if ((v41 & 1) == 0) {
    goto LABEL_16;
  }
  return *(void *)&v18;
}

uint64_t sub_25C5BDAA4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for MapsGenericIntentTitleProvider()
{
  return self;
}

uint64_t sub_25C5BDAD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B93B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_1_2@<X0>(uint64_t a1@<X8>)
{
  return sub_25C5CD724(0xD00000000000002FLL, (a1 - 32) | 0x8000000000000000, (uint64_t *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25C5BDBD0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

BOOL sub_25C5BDBE4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_25C5BDBF0(char a1, char a2)
{
  if (*(void *)&aApplauncsiriki[8 * a1] == *(void *)&aApplauncsiriki[8 * a2]
    && *(void *)&aApplauncsiriki[8 * a1 + 24] == *(void *)&aApplauncsiriki[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25C5EEA80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25C5BDC78()
{
  return sub_25C5BDCD8();
}

uint64_t sub_25C5BDC84()
{
  sub_25C5EE5C0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C5BDCD8()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5BDD40()
{
  unint64_t v0 = sub_25C5EE9E0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25C5BDD8C(char a1)
{
  return *(void *)&aApplauncsiriki[8 * a1];
}

uint64_t sub_25C5BDDAC(char *a1, char *a2)
{
  return sub_25C5BDBF0(*a1, *a2);
}

uint64_t sub_25C5BDDB8()
{
  return sub_25C5BDC78();
}

uint64_t sub_25C5BDDC0()
{
  return sub_25C5BDC84();
}

uint64_t sub_25C5BDDC8()
{
  return sub_25C5BDCD8();
}

uint64_t sub_25C5BDDD0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5BDD40();
  *a1 = result;
  return result;
}

uint64_t sub_25C5BDE00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5BDD8C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25C5BDE2C()
{
  return sub_25C5EE690();
}

uint64_t sub_25C5BDE8C()
{
  return sub_25C5EE680();
}

uint64_t sub_25C5BDEDC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_0_3();
  sub_25C5AE2BC(v2, v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v4 = OUTLINED_FUNCTION_0_3();
  sub_25C5CDF4C(v4, v5, v6);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

double sub_25C5BDFBC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  if (!*(void *)(v1 + 16)) {
    return 0.0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_0_3();
  unint64_t v4 = sub_25C5B0114(v2, v3);
  double v5 = 0.0;
  if (v6) {
    double v5 = *(double *)(*(void *)(v1 + 56) + 8 * v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25C5BE05C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C5EE9B0();
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v4 = MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_15;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = OUTLINED_FUNCTION_0_3();
      MEMORY[0x26118B200](v5);
    }
    else
    {
      swift_retain();
    }
    sub_25C5BE300();
    double v6 = sub_25C5BDFBC();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25C5E9998(0, *(void *)(v4 + 16) + 1, 1, v4);
      uint64_t v4 = v9;
    }
    unint64_t v8 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v4 + 24);
    if (v8 >= v7 >> 1)
    {
      sub_25C5E9998(v7 > 1, v8 + 1, 1, v4);
      uint64_t v4 = v10;
    }
    ++v3;
    *(void *)(v4 + 16) = v8 + 1;
    *(double *)(v4 + 8 * v8 + 32) = v6;
    swift_release();
  }
  while (v2 != v3);
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v15 = (char *)v4;
  swift_bridgeObjectRetain();
  sub_25C5EA510(&v15);
  swift_bridgeObjectRelease();
  uint64_t v11 = v15;
  if (v2)
  {
    if (v2 >= 1)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          MEMORY[0x26118B200](v12, a1);
        }
        else {
          swift_retain();
        }
        ++v12;
        sub_25C5BE300();
        double v13 = sub_25C5BDFBC();
        swift_bridgeObjectRelease();
        sub_25C5ED85C((uint64_t)v11, v13);
        sub_25C5EE370();
        swift_release();
      }
      while (v2 != v12);
      swift_release();
      return swift_bridgeObjectRelease();
    }
LABEL_30:
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }

  return swift_release();
}

uint64_t sub_25C5BE300()
{
  uint64_t v1 = sub_25C5EE330();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)&v16 - v6;
  if (!*(unsigned char *)(v0 + 24))
  {
    swift_bridgeObjectRelease();
    return sub_25C5EE3E0();
  }
  char v8 = sub_25C5EEA80();
  swift_bridgeObjectRelease();
  if (v8) {
    return sub_25C5EE3E0();
  }
  sub_25C5EE3D0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F6CCC0], v1);
  sub_25C5BE78C();
  sub_25C5EE670();
  sub_25C5EE670();
  uint64_t v9 = v17;
  uint64_t v10 = v19;
  uint64_t v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v5, v1);
  v11(v7, v1);
  if (v9 != v10) {
    return sub_25C5EE3C0();
  }
  uint64_t v12 = sub_25C5EE3E0();
  uint64_t v14 = v13;
  sub_25C5EE380();
  uint64_t v17 = v12;
  uint64_t v18 = v14;
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_25C5BE590()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 25, 7);
}

uint64_t type metadata accessor for SiriAutoCompleteHistogram()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SiriAutoCompleteHistogramType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C5BE6B8);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriAutoCompleteHistogramType()
{
  return &type metadata for SiriAutoCompleteHistogramType;
}

unint64_t sub_25C5BE6F4()
{
  unint64_t result = qword_26A5B93C0;
  if (!qword_26A5B93C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B93C0);
  }
  return result;
}

unint64_t sub_25C5BE740()
{
  unint64_t result = qword_26A5B93C8;
  if (!qword_26A5B93C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B93C8);
  }
  return result;
}

unint64_t sub_25C5BE78C()
{
  unint64_t result = qword_26A5B93D0;
  if (!qword_26A5B93D0)
  {
    sub_25C5EE330();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B93D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return v0;
}

uint64_t sub_25C5BE7E8(uint64_t a1)
{
  uint64_t v2 = sub_25C5EE750();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    unsigned int v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25C5E3E00(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_25C5BE89C(uint64_t a1)
{
  uint64_t v18 = sub_25C5EE750();
  uint64_t result = sub_25C5C0750(a1, v19);
  uint64_t v3 = v19[0];
  uint64_t v4 = v19[1];
  int64_t v5 = v19[3];
  unint64_t v6 = v20;
  int64_t v7 = (unint64_t)(v19[2] + 64) >> 6;
  if (!v20) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v9 = v8 | (v5 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain();
    sub_25C5E3E00(&v17, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v4 + 8 * v10);
    int64_t v12 = v5 + 1;
    if (!v11)
    {
      int64_t v12 = v5 + 2;
      if (v5 + 2 >= v7) {
        goto LABEL_21;
      }
      unint64_t v11 = *(void *)(v4 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v5 + 3;
        if (v5 + 3 >= v7) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(v4 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v5 + 4;
          if (v5 + 4 >= v7) {
            goto LABEL_21;
          }
          unint64_t v11 = *(void *)(v4 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v5 + 5;
            if (v5 + 5 >= v7) {
              goto LABEL_21;
            }
            unint64_t v11 = *(void *)(v4 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v5 + 6;
              while (v13 < v7)
              {
                unint64_t v11 = *(void *)(v4 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v5 = v12;
  }
  __break(1u);
  return result;
}

void sub_25C5BEA1C()
{
  qword_26A5B93D8 = 0x74756374726F6853;
  unk_26A5B93E0 = 0xE900000000000073;
}

uint64_t sub_25C5BEA44()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_source;
  uint64_t v2 = *MEMORY[0x263F6CCD8];
  uint64_t v3 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(v1, v2, v3);
  type metadata accessor for SiriAutoCompleteHistogram();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v4 + 24) = 2;
  *(void *)(v0 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram) = v4;
  return v0;
}

id sub_25C5BEAF4(void *a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_error);
  if (result)
  {
    int64_t v7 = result;
    sub_25C5EE490();
    id v8 = v7;
    unint64_t v9 = sub_25C5EE4A0();
    os_log_type_t v10 = sub_25C5EE790();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v16 = v12;
      *(_DWORD *)unint64_t v11 = 136315138;
      v15[1] = v11 + 4;
      swift_getErrorValue();
      uint64_t v13 = sub_25C5EEAD0();
      v15[2] = sub_25C5CD724(v13, v14, &v16);
      sub_25C5EE7F0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v9, v10, "Error encountered while fetching the link transcript for phrases %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v12, -1, -1);
      MEMORY[0x26118BA70](v11, -1, -1);
    }
    else
    {
    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_25C5BED30(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  int64_t v7 = (uint64_t *)(a4 + 16);
  swift_beginAccess();
  id v8 = __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  sub_25C5C0CD0(a1, *v8, v7, a2);
  return swift_endAccess();
}

uint64_t sub_25C5BEDA8(void *a1)
{
  uint64_t v3 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_41();
  unsigned int v7 = objc_msgSend(a1, sel_source);
  if (v7 < 0xB) {
    return (0x5BEu >> v7) & 1;
  }
  sub_25C5EE490();
  unint64_t v9 = a1;
  os_log_type_t v10 = sub_25C5EE4A0();
  os_log_type_t v11 = sub_25C5EE790();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 33554688;
    [v9 source];
    sub_25C5EE7F0();

    _os_log_impl(&dword_25C5AA000, v10, v11, "Unexpected source not covered by switch statement: %hu", v12, 6u);
    OUTLINED_FUNCTION_3();
  }
  else
  {

    os_log_type_t v10 = v9;
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  return 0;
}

void sub_25C5BEF34(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v112 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v111 = v5;
  uint64_t v6 = sub_25C5EE330();
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8();
  uint64_t v110 = v9;
  uint64_t v117 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v122 = (char *)v106 - v16;
  uint64_t v17 = sub_25C5C06EC(a1, (SEL *)&selRef_bundleIdentifier);
  if (v18)
  {
    id v124 = a1;
    uint64_t v107 = v17;
    unint64_t v108 = v18;
    uint64_t v19 = sub_25C5C22E8(v17, v18);
    uint64_t v21 = v19;
    uint64_t v120 = *(void *)(v19 + 16);
    if (v120)
    {
      v106[1] = v6;
      uint64_t v121 = 0;
      uint64_t v119 = v19 + 32;
      uint64_t v116 = (void (**)(char *, uint64_t))(v11 + 8);
      unint64_t v22 = 0;
      *(void *)&long long v20 = 136315138;
      long long v115 = v20;
      unint64_t v114 = 0x800000025C5F0DE0;
      uint64_t v113 = MEMORY[0x263F8EE58] + 8;
      uint64_t v23 = v122;
      uint64_t v118 = v19;
      while (v22 < *(void *)(v21 + 16))
      {
        uint64_t v24 = v119 + 32 * v22;
        char v26 = *(void **)v24;
        uint64_t v25 = *(void *)(v24 + 8);
        unint64_t v27 = *(void *)(v24 + 24);
        uint64_t v28 = qword_26A5B9148;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v28 != -1) {
          swift_once();
        }
        unint64_t v125 = v22;
        unint64_t v128 = v27;
        if (qword_26A5B9430)
        {
          id v29 = (id)qword_26A5B9430;
          uint64_t v30 = (void *)sub_25C5EE570();
          if ((v25 & 0x1000000000000000) != 0) {
            uint64_t v31 = sub_25C5EE610();
          }
          else {
            uint64_t v31 = sub_25C5EE620();
          }
          id v32 = objc_msgSend(v29, sel_matchesInString_options_range_, v30, 0, 0, v31);

          sub_25C5B4790(0, (unint64_t *)&qword_26A5B9428);
          unint64_t v33 = sub_25C5EE6B0();

          swift_bridgeObjectRetain();
          uint64_t v34 = v121;
          uint64_t v35 = sub_25C5C0448(v33, (uint64_t)v26, v25);
          uint64_t v121 = v34;
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_25C5EE490();
          os_log_type_t v36 = sub_25C5EE4A0();
          os_log_type_t v37 = sub_25C5EE790();
          if (os_log_type_enabled(v36, v37))
          {
            OUTLINED_FUNCTION_3_3();
            uint64_t v134 = OUTLINED_FUNCTION_5_3();
            *(_DWORD *)unint64_t v27 = v115;
            *(void *)(v27 + 4) = sub_25C5CD724(0xD000000000000021, v114, &v134);
            _os_log_impl(&dword_25C5AA000, v36, v37, "Function: %s > Unable to get variable names since variable name regex could not be initialized", (uint8_t *)v27, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_3();

            (*v116)(v122, v117);
          }
          else
          {

            (*v116)(v23, v117);
          }
          uint64_t v35 = MEMORY[0x263F8EE78];
        }
        uint64_t v38 = sub_25C5EE750();
        uint64_t v132 = v38;
        uint64_t v39 = *(void *)(v35 + 16);
        if (v39)
        {
          unint64_t v40 = (uint64_t *)(v35 + 40);
          do
          {
            uint64_t v41 = *(v40 - 1);
            uint64_t v42 = *v40;
            swift_bridgeObjectRetain();
            sub_25C5E3E00(&v134, v41, v42);
            swift_bridgeObjectRelease();
            v40 += 2;
            --v39;
          }
          while (v39);
          swift_bridgeObjectRelease();
          uint64_t v127 = v132;
        }
        else
        {
          uint64_t v127 = v38;
          swift_bridgeObjectRelease();
        }
        id v43 = objc_msgSend(v124, sel_action);
        id v44 = objc_msgSend(v43, sel_parameters);

        uint64_t v45 = sub_25C5B4790(0, &qword_26A5B9420);
        unint64_t v46 = sub_25C5EE6B0();

        if (v46 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v47 = sub_25C5EE9B0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v47 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        uint64_t v126 = v25;
        uint64_t v129 = v26;
        uint64_t v123 = v45;
        if (v47)
        {
          uint64_t v134 = MEMORY[0x263F8EE78];
          sub_25C5C06AC(0, v47 & ~(v47 >> 63), 0);
          if (v47 < 0) {
            goto LABEL_68;
          }
          uint64_t v48 = 0;
          uint64_t v49 = v134;
          do
          {
            if ((v46 & 0xC000000000000001) != 0) {
              id v50 = (id)MEMORY[0x26118B200](v48, v46);
            }
            else {
              id v50 = *(id *)(v46 + 8 * v48 + 32);
            }
            uint64_t v51 = v50;
            id v52 = objc_msgSend(v50, sel_identifier);
            uint64_t v53 = sub_25C5EE580();
            uint64_t v55 = v54;

            uint64_t v134 = v49;
            unint64_t v57 = *(void *)(v49 + 16);
            unint64_t v56 = *(void *)(v49 + 24);
            if (v57 >= v56 >> 1)
            {
              sub_25C5C06AC(v56 > 1, v57 + 1, 1);
              uint64_t v49 = v134;
            }
            ++v48;
            *(void *)(v49 + 16) = v57 + 1;
            uint64_t v58 = v49 + 16 * v57;
            *(void *)(v58 + 32) = v53;
            *(void *)(v58 + 40) = v55;
          }
          while (v47 != v48);
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v49 = MEMORY[0x263F8EE78];
        }
        uint64_t v59 = v127;
        uint64_t v132 = sub_25C5EE750();
        uint64_t v60 = *(void *)(v49 + 16);
        if (v60)
        {
          char v61 = (uint64_t *)(v49 + 40);
          do
          {
            uint64_t v62 = *(v61 - 1);
            uint64_t v63 = *v61;
            swift_bridgeObjectRetain();
            sub_25C5E3E00(&v134, v62, v63);
            swift_bridgeObjectRelease();
            v61 += 2;
            --v60;
          }
          while (v60);
        }
        swift_bridgeObjectRelease();
        sub_25C5E01A0(v59, v132);
        char v65 = v64;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v65)
        {
          id v66 = objc_msgSend(v124, sel_action);
          id v67 = objc_msgSend(v66, sel_parameters);

          unint64_t v68 = sub_25C5EE6B0();
          uint64_t v69 = v126;
          if (v68 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v70 = sub_25C5EE9B0();
            swift_bridgeObjectRelease();
            if (v70)
            {
LABEL_39:
              uint64_t v127 = v68;
              unint64_t v128 = v68 & 0xC000000000000001;
              uint64_t v71 = 4;
              while (1)
              {
                id v72 = v128 ? (id)MEMORY[0x26118B200](v71 - 4, v68) : *(id *)(v68 + 8 * v71);
                uint64_t v73 = v72;
                uint64_t v74 = v71 - 3;
                if (__OFADD__(v71 - 4, 1)) {
                  break;
                }
                id v75 = objc_msgSend(v72, sel_value);
                if (!v75
                  || (unint64_t v76 = v75,
                      id v77 = objc_msgSend(v75, sel_displayRepresentation),
                      v76,
                      !v77))
                {
                  swift_bridgeObjectRelease();

                  goto LABEL_50;
                }
                id v78 = objc_msgSend(v77, sel_title);

                type metadata accessor for DefaultLocaleProvider();
                swift_initStaticObject();
                sub_25C5DB464();
                os_log_type_t v79 = (void *)sub_25C5EE570();
                swift_bridgeObjectRelease();
                id v80 = objc_msgSend(v78, sel_localizedStringForLocaleIdentifier_, v79);

                uint64_t v81 = sub_25C5EE580();
                uint64_t v83 = v82;

                id v84 = objc_msgSend(v73, sel_identifier);
                sub_25C5EE580();

                uint64_t v134 = 31524;
                unint64_t v135 = 0xE200000000000000;
                sub_25C5EE5F0();
                sub_25C5EE5F0();
                uint64_t v85 = v134;
                unint64_t v86 = v135;
                uint64_t v134 = (uint64_t)v129;
                unint64_t v135 = v69;
                uint64_t v132 = v85;
                unint64_t v133 = v86;
                uint64_t v130 = v81;
                uint64_t v131 = v83;
                sub_25C5B44F4();
                uint64_t v129 = (void *)sub_25C5EE820();
                uint64_t v88 = v87;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                unint64_t v68 = v127;
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease();
                uint64_t v69 = v88;
                ++v71;
                if (v74 == v70) {
                  goto LABEL_47;
                }
              }
              __break(1u);
              break;
            }
          }
          else
          {
            uint64_t v70 = *(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v70) {
              goto LABEL_39;
            }
          }
LABEL_47:
          swift_bridgeObjectRelease();
LABEL_50:
          uint64_t v23 = v122;
          uint64_t v21 = v118;
          unint64_t v89 = v125;
          uint64_t v90 = *(void *)(sub_25C5C27AC((uint64_t)v129, v69) + 16);
          swift_bridgeObjectRelease();
          if (!v90)
          {
            swift_bridgeObjectRelease();
            sub_25C5EE410();
            id v100 = objc_msgSend(v124, sel_action);
            id v101 = objc_msgSend(v100, sel_identifier);

            sub_25C5EE580();
            OUTLINED_FUNCTION_7_2();
            v103(*(void *)(v102 - 256));
            uint64_t v104 = sub_25C5EE1D0();
            __swift_storeEnumTagSinglePayload(v111, 1, 1, v104);
            uint64_t v105 = sub_25C5EDF30();
            __swift_storeEnumTagSinglePayload(v112, 1, 1, v105);
            goto LABEL_65;
          }
        }
        else
        {
          uint64_t v23 = v122;
          uint64_t v21 = v118;
          unint64_t v89 = v125;
        }
        unint64_t v22 = v89 + 1;
        swift_bridgeObjectRelease();
        if (v22 == v120) {
          goto LABEL_59;
        }
      }
      __break(1u);
LABEL_68:
      __break(1u);
    }
    else
    {
LABEL_59:
      swift_bridgeObjectRelease();
      if (*(void *)(sub_25C5C2A54(v107, v108) + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_25C5EE410();
        OUTLINED_FUNCTION_7_2();
        v97(*(void *)(v96 - 256));
        uint64_t v98 = sub_25C5EE1D0();
        __swift_storeEnumTagSinglePayload(v111, 1, 1, v98);
        uint64_t v99 = sub_25C5EDF30();
        __swift_storeEnumTagSinglePayload(v112, 1, 1, v99);
LABEL_65:
        sub_25C5EE3B0();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    sub_25C5EE490();
    id v91 = a1;
    uint64_t v92 = sub_25C5EE4A0();
    os_log_type_t v93 = sub_25C5EE790();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      uint64_t v129 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v94 = 138412290;
      uint64_t v134 = (uint64_t)v91;
      os_log_type_t v95 = v91;
      sub_25C5EE7F0();
      *uint64_t v129 = v91;

      _os_log_impl(&dword_25C5AA000, v92, v93, "Missing bundleId from LNTranscriptActionRecord: %@", v94, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91F0);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      uint64_t v92 = v91;
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v117);
  }
}

uint64_t sub_25C5BFCC8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  v42[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F520A8]), sel_init);
  uint64_t v15 = (void *)sub_25C5EE570();
  uint64_t v16 = (void *)sub_25C5EE570();
  v42[0] = 0;
  id v40 = v14;
  id v17 = objc_msgSend(v14, sel_actionsForBundleIdentifier_andActionIdentifier_error_, v15, v16, v42);

  id v18 = v42[0];
  if (v17)
  {
    sub_25C5B4790(0, &qword_26A5B9418);
    unint64_t v19 = sub_25C5EE6B0();
    id v20 = v18;

    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_25C5EE9B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    id v22 = v40;
    if (v21)
    {
      sub_25C5EA294(0, (v19 & 0xC000000000000001) == 0, v19);
      if ((v19 & 0xC000000000000001) != 0) {
        id v23 = (id)MEMORY[0x26118B200](0, v19);
      }
      else {
        id v23 = *(id *)(v19 + 32);
      }
      uint64_t v21 = (uint64_t)v23;
      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v38 = v10;
    uint64_t v39 = v8;
    id v24 = v42[0];
    uint64_t v25 = (void *)sub_25C5EDE90();

    swift_willThrow();
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v26 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v27 = v25;
    uint64_t v28 = sub_25C5EE4A0();
    os_log_type_t v29 = sub_25C5EE790();
    int v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v31 = swift_slowAlloc();
      os_log_type_t v37 = (void *)swift_slowAlloc();
      v42[0] = v37;
      *(_DWORD *)uint64_t v31 = 136315906;
      int v36 = v30;
      uint64_t v41 = sub_25C5CD724(0xD00000000000002ALL, 0x800000025C5F0DB0, (uint64_t *)v42);
      OUTLINED_FUNCTION_4_3();
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_25C5CD724(a1, a2, (uint64_t *)v42);
      OUTLINED_FUNCTION_4_3();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v31 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_25C5CD724(a3, a4, (uint64_t *)v42);
      OUTLINED_FUNCTION_4_3();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v31 + 32) = 2080;
      swift_getErrorValue();
      uint64_t v32 = sub_25C5EEAD0();
      uint64_t v41 = sub_25C5CD724(v32, v33, (uint64_t *)v42);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C5AA000, v28, (os_log_type_t)v36, "Function: %s > Unable to fetch LNActionMetadata for: %s actionIdentifier: %s with error: %s", (uint8_t *)v31, 0x2Au);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v39);
    return 0;
  }
  return v21;
}

uint64_t sub_25C5C0164(unint64_t a1)
{
  uint64_t v3 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_41();
  sub_25C5EE490();
  uint64_t v7 = sub_25C5EE4A0();
  os_log_type_t v8 = sub_25C5EE770();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25C5AA000, v7, v8, "Ranking App Intent transcript phrases", v9, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  swift_retain();
  sub_25C5BE05C(a1);
  return swift_release();
}

uint64_t sub_25C5C028C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_source;
  uint64_t v2 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C5C033C()
{
  return type metadata accessor for AppIntentTranscriptSource();
}

uint64_t type metadata accessor for AppIntentTranscriptSource()
{
  uint64_t result = qword_26A5B93F0;
  if (!qword_26A5B93F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5C038C(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A5B9408 + dword_26A5B9408);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25C5B8D24;
  return v7(v4, v3);
}

uint64_t sub_25C5C0448(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_25C5EE9B0())
  {
    unint64_t v27 = v5 & 0xC000000000000001;
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v8 = 4;
    uint64_t v25 = v6;
    unint64_t v26 = v5;
    while (1)
    {
      id v9 = v27 ? (id)MEMORY[0x26118B200](v8 - 4, v5) : *(id *)(v5 + 8 * v8);
      uint64_t v10 = v9;
      uint64_t v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1)) {
        break;
      }
      objc_msgSend(v9, sel_rangeAtIndex_, 1);
      sub_25C5EE760();
      if (v12)
      {
      }
      else
      {
        uint64_t v13 = a2;
        uint64_t v14 = a3;
        uint64_t v15 = sub_25C5EE660();
        uint64_t v16 = MEMORY[0x26118AF00](v15);
        uint64_t v18 = v17;

        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C5E9A5C(0, *(void *)(v7 + 16) + 1, 1, v7);
          uint64_t v7 = v22;
        }
        unint64_t v20 = *(void *)(v7 + 16);
        unint64_t v19 = *(void *)(v7 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_25C5E9A5C(v19 > 1, v20 + 1, 1, v7);
          uint64_t v7 = v23;
        }
        *(void *)(v7 + 16) = v20 + 1;
        uint64_t v21 = v7 + 16 * v20;
        *(void *)(v21 + 32) = v16;
        *(void *)(v21 + 40) = v18;
        a3 = v14;
        a2 = v13;
        uint64_t v6 = v25;
        unint64_t v5 = v26;
      }
      ++v8;
      if (v11 == v6) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_25C5C0628(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_25C5C0654(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C5C067C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void sub_25C5C06AC(char a1, uint64_t a2, char a3)
{
  sub_25C5EA3A0(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

void sub_25C5C06CC(char a1, uint64_t a2, char a3)
{
  sub_25C5EA458(a1, a2, a3, *v3);
  *uint64_t v3 = v4;
}

uint64_t sub_25C5C06EC(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_25C5EE580();

  return v4;
}

uint64_t sub_25C5C0750@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_25C5C0788(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = sub_25C5EE4B0();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v36[-v12];
  uint64_t v14 = type metadata accessor for DefaultEligibilityCriteria();
  uint64_t v46 = v14;
  uint64_t v47 = &off_2709C32F0;
  v45[0] = a4;
  swift_retain();
  id v15 = objc_msgSend(a3, sel_action);
  id v16 = objc_msgSend(v15, sel_identifier);

  uint64_t v40 = sub_25C5EE580();
  unint64_t v18 = v17;

  uint64_t v19 = sub_25C5C06EC(a3, (SEL *)&selRef_bundleIdentifier);
  uint64_t v21 = v20;
  if (v20)
  {
    uint64_t v22 = v19;
    if (objc_msgSend(a5, sel_visibleForUse_, 1))
    {
      __swift_project_boxed_opaque_existential_1(v45, v14);
      LODWORD(v23) = sub_25C5C4D44(v22, v21);
      swift_bridgeObjectRelease();
      char v24 = sub_25C5BEDA8(a3);
      __swift_project_boxed_opaque_existential_1(v45, v46);
      BOOL v25 = !sub_25C5C4E88();
      LODWORD(v21) = objc_msgSend(a3, sel_source);
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      unint64_t v26 = sub_25C5EE4A0();
      os_log_type_t v27 = sub_25C5EE780();
      if (os_log_type_enabled(v26, v27))
      {
        BOOL v37 = v21 == 3;
        uint64_t v28 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        int v39 = v23;
        uint64_t v23 = v29;
        uint64_t v44 = v29;
        *(_DWORD *)uint64_t v28 = 136316162;
        int v38 = v21;
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_25C5CD724(v40, v18, &v44);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 1024;
        LODWORD(v43) = v39 & 1;
        sub_25C5EE7F0();
        *(_WORD *)(v28 + 18) = 1024;
        LODWORD(v43) = v37;
        sub_25C5EE7F0();
        *(_WORD *)(v28 + 24) = 1024;
        LODWORD(v43) = v24 & 1;
        sub_25C5EE7F0();
        *(_WORD *)(v28 + 30) = 1024;
        LODWORD(v43) = v25;
        LODWORD(v21) = v38;
        sub_25C5EE7F0();
        _os_log_impl(&dword_25C5AA000, v26, v27, "AppIntentTranscript %s autocomplete eligibility evaluation:\nappBundleIsInstalled: %{BOOL}d\nwasExecutedBySiri: %{BOOL}d\nhasValidSource: %{BOOL}d\nnotContainsPhoneNumber: %{BOOL}d", (uint8_t *)v28, 0x24u);
        swift_arrayDestroy();
        uint64_t v30 = v23;
        LOBYTE(v23) = v39;
        MEMORY[0x26118BA70](v30, -1, -1);
        MEMORY[0x26118BA70](v28, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(unsigned char *, uint64_t))(v41 + 8))(v13, v42);
      LOBYTE(v21) = (v23 | (v21 == 3)) & v24 & v25;
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25C5EE4A0();
      os_log_type_t v32 = sub_25C5EE780();
      if (os_log_type_enabled(v31, v32))
      {
        unint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v44 = v34;
        *(_DWORD *)unint64_t v33 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_25C5CD724(v40, v18, &v44);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v31, v32, "AppIntentTranscript %s: Not eligible for autocomplete. AppIntent is not discoverable", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v34, -1, -1);
        MEMORY[0x26118BA70](v33, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(unsigned char *, uint64_t))(v41 + 8))(v11, v42);
      LOBYTE(v21) = 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  return v21 & 1;
}

uint64_t sub_25C5C0CD0(void *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v95 = a4;
  id v91 = a3;
  uint64_t v6 = sub_25C5EE4B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v92 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v88 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  id v15 = (char *)&v88 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v88 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v88 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v88 - v22;
  uint64_t v24 = type metadata accessor for DefaultEligibilityCriteria();
  uint64_t v99 = v24;
  id v100 = &off_2709C32F0;
  v98[0] = a2;
  swift_retain();
  id v25 = objc_msgSend(a1, sel_eventBody);
  if (!v25)
  {
    sub_25C5EE490();
    uint64_t v41 = sub_25C5EE4A0();
    os_log_type_t v42 = sub_25C5EE790();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_25C5AA000, v41, v42, "nil eventBody for lnTranscriptActionRecord", v43, 2u);
      MEMORY[0x26118BA70](v43, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v23, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  unint64_t v26 = v25;
  unint64_t v89 = v12;
  uint64_t v93 = v6;
  uint64_t v94 = v7;
  id v27 = objc_msgSend(v25, sel_action);
  id v28 = objc_msgSend(v27, sel_identifier);

  uint64_t v29 = sub_25C5EE580();
  unint64_t v31 = v30;

  uint64_t v32 = sub_25C5C06EC(v26, (SEL *)&selRef_bundleIdentifier);
  if (!v33)
  {
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_25C5EE4A0();
    os_log_type_t v45 = sub_25C5EE790();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v96[0] = v47;
      *(_DWORD *)uint64_t v46 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_25C5CD724(v29, v31, v96);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v44, v45, "AppIntentTranscript %s: nil bundleId for lnTranscriptActionRecord. Skipping processing.", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v47, -1, -1);
      MEMORY[0x26118BA70](v46, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v94 + 8))(v21, v93);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  uint64_t v34 = v32;
  uint64_t v35 = v33;
  uint64_t v88 = v29;
  uint64_t v90 = (void *)sub_25C5BFCC8(v32, v33, v29, v31);
  if (!v90)
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_25C5EE4A0();
    os_log_type_t v49 = sub_25C5EE780();
    if (os_log_type_enabled(v48, v49))
    {
      id v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      v96[0] = v51;
      *(_DWORD *)id v50 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_25C5CD724(v88, v31, v96);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v48, v49, "AppIntentTranscript %s: no metadata. Skipping processing.", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v51, -1, -1);
      MEMORY[0x26118BA70](v50, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v94 + 8))(v18, v93);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  uint64_t v36 = sub_25C5C06EC(v26, (SEL *)&selRef_clientLabel);
  uint64_t v38 = v37;
  if (qword_26A5B9140 != -1) {
    swift_once();
  }
  if (v38)
  {
    if (v36 == qword_26A5B93D8 && v38 == unk_26A5B93E0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v40 = sub_25C5EEA80();
      swift_bridgeObjectRelease();
      if ((v40 & 1) == 0) {
        goto LABEL_24;
      }
    }
    id v52 = objc_msgSend(v90, sel_identifier);
    sub_25C5EE580();

    v96[0] = v34;
    v96[1] = v35;
    swift_bridgeObjectRetain();
    sub_25C5EE5F0();
    swift_bridgeObjectRetain();
    sub_25C5EE5F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_25C5BDEDC();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v24 = v99;
  }
LABEL_24:
  __swift_project_boxed_opaque_existential_1(v98, v24);
  uint64_t v53 = v34;
  uint64_t v54 = v88;
  char v55 = sub_25C5C4DE4(v53, v35);
  swift_bridgeObjectRelease();
  if ((v55 & 1) != 0 || objc_msgSend(v26, sel_source) == 3)
  {
    sub_25C5BEF34(v26);
    if (v56)
    {
      swift_retain();
      sub_25C5EE3C0();
      sub_25C5BDEDC();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v57 = sub_25C5EE3C0();
      uint64_t v59 = v58;
      uint64_t v60 = __swift_project_boxed_opaque_existential_1(v98, v99);
      LOBYTE(v57) = sub_25C5C0788(v57, v59, v26, *v60, v90);
      swift_bridgeObjectRelease();
      if (v57)
      {
        swift_bridgeObjectRelease();
        uint64_t v61 = *v91;
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_25C5EE3C0();
        if (*(void *)(v61 + 16))
        {
          sub_25C5B0114(v62, v63);
          char v65 = v64;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v65)
          {

            swift_release();
            return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        uint64_t v84 = sub_25C5EE3C0();
        uint64_t v86 = v85;
        uint64_t v87 = swift_retain();
        sub_25C5CDFCC(v87, v84, v86);

        swift_release();
        swift_bridgeObjectRelease();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
      }
      id v77 = v89;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      id v78 = sub_25C5EE4A0();
      os_log_type_t v79 = sub_25C5EE780();
      if (os_log_type_enabled(v78, v79))
      {
        id v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = v54;
        uint64_t v82 = swift_slowAlloc();
        v96[0] = v82;
        *(_DWORD *)id v80 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v97 = sub_25C5CD724(v81, v31, v96);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v78, v79, "AppIntentTranscript %s: not eligible for auto complete criteria. Skipping processing", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v82, -1, -1);
        MEMORY[0x26118BA70](v80, -1, -1);
        swift_release();

        (*(void (**)(char *, uint64_t))(v94 + 8))(v89, v93);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release();
        (*(void (**)(char *, uint64_t))(v94 + 8))(v77, v93);
      }
    }
    else
    {
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      id v66 = sub_25C5EE4A0();
      os_log_type_t v67 = sub_25C5EE780();
      if (os_log_type_enabled(v66, v67))
      {
        unint64_t v68 = (uint8_t *)swift_slowAlloc();
        uint64_t v69 = v54;
        uint64_t v70 = swift_slowAlloc();
        v96[0] = v70;
        *(_DWORD *)unint64_t v68 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v97 = sub_25C5CD724(v69, v31, v96);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v66, v67, "AppIntentTranscript %s: could not get the autocomplete phrase. Skipping processing", v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v70, -1, -1);
        MEMORY[0x26118BA70](v68, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v94 + 8))(v15, v93);
    }
  }
  else
  {
    uint64_t v71 = v92;
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    id v72 = sub_25C5EE4A0();
    os_log_type_t v73 = sub_25C5EE780();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = (uint8_t *)swift_slowAlloc();
      uint64_t v75 = v54;
      uint64_t v76 = swift_slowAlloc();
      v96[0] = v76;
      *(_DWORD *)uint64_t v74 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_25C5CD724(v75, v31, v96);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v72, v73, "AppIntentTranscript %s: not supported by Siri. Skipping processing.", v74, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v76, -1, -1);
      MEMORY[0x26118BA70](v74, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v94 + 8))(v71, v93);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
}

uint64_t sub_25C5C190C(uint64_t a1, void *a2)
{
  v2[38] = a2;
  v2[39] = *a2;
  uint64_t v4 = sub_25C5EE4B0();
  v2[40] = v4;
  v2[41] = *(void *)(v4 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[17] = type metadata accessor for DefaultEligibilityCriteria();
  v2[18] = &off_2709C32F0;
  v2[14] = a1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5C1A6C, 0, 0);
}

uint64_t sub_25C5C1A6C()
{
  os_log_type_t v49 = v0;
  v48[1] = *MEMORY[0x263EF8340];
  uint64_t v46 = (void **)(v0 + 36);
  uint64_t v47 = (uint64_t)(v0 + 14);
  sub_25C5EE490();
  uint64_t v2 = sub_25C5EE4A0();
  os_log_type_t v3 = sub_25C5EE770();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[41];
    uint64_t v42 = v0[40];
    uint64_t v44 = v0[44];
    OUTLINED_FUNCTION_3_3();
    v48[0] = OUTLINED_FUNCTION_5_3();
    *(_DWORD *)uint64_t v1 = 136315138;
    uint64_t v5 = sub_25C5EEB60();
    v0[37] = sub_25C5CD724(v5, v6, v48);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v2, v3, "%s: Fetching phrases", v1, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v7 = v44;
    os_log_type_t v45 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v45(v7, v42);
  }
  else
  {
    uint64_t v8 = v0[44];
    uint64_t v9 = v0[40];
    uint64_t v10 = v0[41];

    os_log_type_t v45 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v45(v8, v9);
  }
  uint64_t v11 = swift_allocObject();
  sub_25C5EE410();
  *(void *)(v11 + 16) = sub_25C5EE560();
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F52180]), sel_init);
  uint64_t v13 = (void *)sub_25C5EE570();
  sub_25C5B4790(0, &qword_26A5B9410);
  uint64_t v14 = (void *)sub_25C5EE7C0();
  *uint64_t v46 = 0;
  id v15 = objc_msgSend(v12, sel_transcriptPublisherWithStreamName_fromDate_toDate_maxEvents_reversed_error_, v13, 0, 0, v14, 1, v46);

  uint64_t v16 = *v46;
  if (v15)
  {
    uint64_t v17 = v0[38];
    v0[12] = sub_25C5BEAF4;
    v0[13] = 0;
    v0[8] = MEMORY[0x263EF8330];
    v0[9] = 1107296256;
    v0[10] = sub_25C5AC4A4;
    v0[11] = &block_descriptor_2;
    unint64_t v18 = _Block_copy(v0 + 8);
    sub_25C5B4254(v47, (uint64_t)(v0 + 19));
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v17;
    sub_25C5B4420((long long *)(v0 + 19), v19 + 24);
    *(void *)(v19 + 64) = v11;
    v0[6] = sub_25C5C2244;
    v0[7] = v19;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_25C5AC4A4;
    v0[5] = &block_descriptor_18;
    uint64_t v20 = _Block_copy(v0 + 2);
    id v21 = v16;
    swift_retain();
    swift_retain();
    swift_release();

    _Block_release(v20);
    _Block_release(v18);
  }
  else
  {
    id v22 = v16;
    uint64_t v23 = (void *)sub_25C5EDE90();

    swift_willThrow();
    sub_25C5EE490();
    id v24 = v23;
    id v25 = v23;
    unint64_t v26 = sub_25C5EE4A0();
    os_log_type_t v27 = sub_25C5EE790();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v29 = v0[43];
    unint64_t v30 = (uint8_t *)v0[40];
    if (v28)
    {
      uint64_t v43 = v0[43];
      OUTLINED_FUNCTION_3_3();
      v48[0] = OUTLINED_FUNCTION_5_3();
      *(_DWORD *)unint64_t v30 = 136315138;
      swift_getErrorValue();
      uint64_t v31 = sub_25C5EEAD0();
      v0[33] = sub_25C5CD724(v31, v32, v48);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C5AA000, v26, v27, "Unexpected error while attempting to read the App Intent Transcript: %s", v30, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      unint64_t v33 = v30;
      uint64_t v34 = v43;
    }
    else
    {

      uint64_t v34 = v29;
      unint64_t v33 = v30;
    }
    v45(v34, (uint64_t)v33);
  }
  sub_25C5EE490();
  swift_retain();
  uint64_t v35 = sub_25C5EE4A0();
  os_log_type_t v36 = sub_25C5EE770();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_DWORD *)uint64_t v37 = 134217984;
    swift_beginAccess();
    v0[35] = *(void *)(*(void *)(v11 + 16) + 16);
    sub_25C5EE7F0();
    swift_release();
    _os_log_impl(&dword_25C5AA000, v35, v36, "%ld phrase(s) created from the App Intent transcript", v37, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    swift_release();
  }

  v45(v0[42], v0[40]);
  swift_beginAccess();
  uint64_t v38 = swift_bridgeObjectRetain();
  int v39 = sub_25C5B05D8(v38);
  swift_bridgeObjectRelease();
  sub_25C5C0164((unint64_t)v39);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v47);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v40 = (uint64_t (*)(const void *))v0[1];
  return v40(v39);
}

uint64_t sub_25C5C21AC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_25C5C21FC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25C5C2244(void *a1)
{
  return sub_25C5BED30(a1, v1[2], v1 + 3, v1[8]);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_slowAlloc();
}

uint64_t sub_25C5C22C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_25C5C22D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_25C5C22E8(uint64_t a1, unint64_t a2)
{
  v35[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_1();
  uint64_t v10 = v9 - v8;
  uint64_t v34 = MEMORY[0x263F8EE88];
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F520A8]), sel_init);
  id v12 = (void *)sub_25C5EE570();
  v35[0] = 0;
  id v13 = objc_msgSend(v11, sel_examplePhrasesForBundleIdentifier_error_, v12, v35);

  id v14 = v35[0];
  if (v13)
  {
    sub_25C5B4790(0, (unint64_t *)&unk_26A5B9440);
    unint64_t v15 = sub_25C5EE6B0();
    id v16 = v14;

    v35[0] = (id)MEMORY[0x263F8EE78];
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_25C5EE9B0();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v17)
      {
LABEL_4:
        if (v17 < 1) {
          __break(1u);
        }
        for (uint64_t i = 0; i != v17; ++i)
        {
          if ((v15 & 0xC000000000000001) != 0) {
            id v19 = (id)MEMORY[0x26118B200](i, v15);
          }
          else {
            id v19 = *(id *)(v15 + 8 * i + 32);
          }
          uint64_t v20 = v19;
          if (objc_msgSend(v19, sel_kind))
          {
          }
          else
          {
            sub_25C5EE8D0();
            sub_25C5EE900();
            sub_25C5EE910();
            sub_25C5EE8E0();
          }
        }
        swift_bridgeObjectRelease();
        id v21 = v35[0];
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    id v21 = (id)MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRetain();
    sub_25C5C3464((unint64_t)v21, a1, a2, &v34);
    uint64_t v31 = v32;
    swift_release();
    goto LABEL_21;
  }
  id v22 = v35[0];
  uint64_t v23 = (void *)sub_25C5EDE90();

  swift_willThrow();
  sub_25C5EE490();
  swift_bridgeObjectRetain();
  id v24 = v23;
  swift_bridgeObjectRetain();
  id v25 = v23;
  unint64_t v26 = sub_25C5EE4A0();
  os_log_type_t v27 = sub_25C5EE790();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    v35[0] = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315650;
    sub_25C5CD724(0xD000000000000024, 0x800000025C5F0E10, (uint64_t *)v35);
    sub_25C5EE7F0();
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_25C5CD724(a1, a2, (uint64_t *)v35);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 22) = 2080;
    swift_getErrorValue();
    uint64_t v29 = sub_25C5EEAD0();
    sub_25C5CD724(v29, v30, (uint64_t *)v35);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C5AA000, v26, v27, "Function: %s > Error encountered while attempting to get phrase templates for bundleIdentifier '%s': %s", (uint8_t *)v28, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  uint64_t v31 = MEMORY[0x263F8EE78];
LABEL_21:
  swift_bridgeObjectRelease();
  return v31;
}

uint64_t sub_25C5C27AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_1();
  uint64_t v10 = v9 - v8;
  if (qword_26A5B9148 != -1) {
    swift_once();
  }
  if (qword_26A5B9430)
  {
    id v11 = (id)qword_26A5B9430;
    id v12 = (void *)sub_25C5EE570();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25C5EE630();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_matchesInString_options_range_, v12, 0, 0, v13);

    sub_25C5B4790(0, (unint64_t *)&qword_26A5B9428);
    unint64_t v15 = sub_25C5EE6B0();

    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25C5C0448(v15, a1, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C5EE490();
    uint64_t v17 = sub_25C5EE4A0();
    os_log_type_t v18 = sub_25C5EE790();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)id v19 = 136315138;
      sub_25C5CD724(0xD000000000000021, 0x800000025C5F0DE0, &v21);
      sub_25C5EE7F0();
      _os_log_impl(&dword_25C5AA000, v17, v18, "Function: %s > Unable to get variable names since variable name regex could not be initialized", v19, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
    return MEMORY[0x263F8EE78];
  }
  return v16;
}

uint64_t sub_25C5C2A54(uint64_t a1, unint64_t a2)
{
  uint64_t v65 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_25C5C22E8(a1, a2);
  id v11 = (void *)sub_25C5EE560();
  uint64_t v12 = *(void *)(v10 + 16);
  if (v12)
  {
    uint64_t v63 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    uint64_t v64 = v9;
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    id v14 = (uint64_t *)(v10 + 56);
    while (1)
    {
      uint64_t v15 = *(v14 - 2);
      uint64_t v69 = *(v14 - 3);
      uint64_t v16 = *v14;
      uint64_t v66 = *(v14 - 1);
      uint64_t v17 = qword_26A5B9148;
      swift_bridgeObjectRetain();
      uint64_t v67 = v16;
      swift_bridgeObjectRetain();
      if (v17 != -1) {
        swift_once();
      }
      if (!qword_26A5B9430) {
        break;
      }
      id v18 = (id)qword_26A5B9430;
      id v19 = (void *)sub_25C5EE570();
      if ((v15 & 0x1000000000000000) != 0) {
        uint64_t v20 = sub_25C5EE610();
      }
      else {
        uint64_t v20 = sub_25C5EE620();
      }
      id v21 = objc_msgSend(v18, sel_matchesInString_options_range_, v19, 0, 0, v20);

      sub_25C5B4790(0, (unint64_t *)&qword_26A5B9428);
      unint64_t v22 = sub_25C5EE6B0();

      swift_bridgeObjectRetain();
      uint64_t v23 = sub_25C5C0448(v22, v69, v15);
      swift_bridgeObjectRelease();

      uint64_t v24 = *(void *)(v23 + 16);
      swift_bridgeObjectRelease();
      if (!v24) {
        goto LABEL_13;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_18:
      v14 += 4;
      if (!--v12)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    sub_25C5EE490();
    id v25 = sub_25C5EE4A0();
    os_log_type_t v26 = sub_25C5EE790();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      *(void *)(v27 + 4) = sub_25C5CD724(0xD000000000000021, 0x800000025C5F0DE0, &v71);
      _os_log_impl(&dword_25C5AA000, v25, v26, "Function: %s > Unable to get variable names since variable name regex could not be initialized", (uint8_t *)v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }

    (*v63)(v64, v65);
LABEL_13:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v72 = v13;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25C5C06CC(0, v13[2] + 1, 1);
      uint64_t v13 = v72;
    }
    unint64_t v30 = v13[2];
    unint64_t v29 = v13[3];
    if (v30 >= v29 >> 1)
    {
      sub_25C5C06CC(v29 > 1, v30 + 1, 1);
      uint64_t v13 = v72;
    }
    v13[2] = v30 + 1;
    uint64_t v31 = &v13[4 * v30];
    v31[4] = v69;
    v31[5] = v15;
    v31[6] = v66;
    v31[7] = v67;
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
LABEL_22:
  uint64_t v32 = v13[2];
  unint64_t v33 = 0;
  if (!v32)
  {
    uint64_t v35 = MEMORY[0x263F8EE78];
LABEL_48:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25C5C37C4((uint64_t)v33);
    return v35;
  }
  uint64_t v34 = v13 + 7;
  uint64_t v35 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v70 = v32;
    uint64_t v36 = *(v34 - 2);
    uint64_t v68 = *(v34 - 3);
    uint64_t v38 = *(v34 - 1);
    uint64_t v37 = *v34;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25C5C37C4((uint64_t)v33);
    swift_isUniquelyReferenced_nonNull_native();
    id v72 = v11;
    unint64_t v39 = OUTLINED_FUNCTION_3_4();
    if (__OFADD__(v11[2], (v40 & 1) == 0)) {
      break;
    }
    unint64_t v41 = v39;
    char v42 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9438);
    char v43 = sub_25C5EE970();
    id v11 = v72;
    if (v43)
    {
      unint64_t v44 = OUTLINED_FUNCTION_3_4();
      if ((v42 & 1) != (v45 & 1)) {
        goto LABEL_52;
      }
      unint64_t v41 = v44;
    }
    swift_bridgeObjectRelease();
    if ((v42 & 1) == 0)
    {
      v11[(v41 >> 6) + 8] |= 1 << v41;
      uint64_t v46 = (void *)(v11[6] + 16 * v41);
      *uint64_t v46 = v38;
      v46[1] = v37;
      *(void *)(v11[7] + 8 * v41) = 0;
      uint64_t v47 = v11[2];
      uint64_t v48 = v47 + 1;
      BOOL v49 = __OFADD__(v47, 1);
      swift_bridgeObjectRetain();
      if (v49) {
        goto LABEL_51;
      }
      v11[2] = v48;
    }
    swift_bridgeObjectRetain();
    uint64_t v50 = v11[7];
    swift_bridgeObjectRelease();
    uint64_t v51 = *(void *)(v50 + 8 * v41);
    BOOL v52 = __OFADD__(v51, 1);
    uint64_t v53 = v51 + 1;
    if (v52) {
      goto LABEL_50;
    }
    *(void *)(v50 + 8 * v41) = v53;
    swift_bridgeObjectRelease();
    if (!v11[2]) {
      goto LABEL_40;
    }
    swift_bridgeObjectRetain();
    unint64_t v54 = OUTLINED_FUNCTION_3_4();
    if ((v55 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_40:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C5E9AA4(0, *(void *)(v35 + 16) + 1, 1, v35);
        uint64_t v35 = v60;
      }
      unint64_t v58 = *(void *)(v35 + 16);
      unint64_t v57 = *(void *)(v35 + 24);
      if (v58 >= v57 >> 1)
      {
        sub_25C5E9AA4(v57 > 1, v58 + 1, 1, v35);
        uint64_t v35 = v61;
      }
      *(void *)(v35 + 16) = v58 + 1;
      uint64_t v59 = (void *)(v35 + 32 * v58);
      v59[4] = v68;
      v59[5] = v36;
      v59[6] = v38;
      v59[7] = v37;
      goto LABEL_45;
    }
    uint64_t v56 = *(void *)(v11[7] + 8 * v54);
    swift_bridgeObjectRelease();
    if (v56 <= 1) {
      goto LABEL_40;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_45:
    v34 += 4;
    unint64_t v33 = sub_25C5C30C4;
    uint64_t v32 = v70 - 1;
    if (v70 == 1) {
      goto LABEL_48;
    }
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  uint64_t result = sub_25C5EEAC0();
  __break(1u);
  return result;
}

void sub_25C5C30C4(void *a1@<X8>)
{
  *a1 = 0;
}

double sub_25C5C30CC@<D0>(id *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  unint64_t v39 = a3;
  uint64_t v9 = sub_25C5EE4B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = *a1;
  id v14 = objc_msgSend(*a1, sel_parentIdentifier);
  uint64_t v38 = sub_25C5EE580();
  unint64_t v16 = v15;

  uint64_t v17 = sub_25C5C37D4(v13);
  if (v18)
  {
    uint64_t v19 = v17;
    uint64_t v20 = v18;
    uint64_t v21 = *a4;
    swift_bridgeObjectRetain();
    sub_25C5DFBDC(v19, v20, v21);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_25C5E3E00(&v40, v19, v20);
      swift_bridgeObjectRelease();
      *a5 = v19;
      a5[1] = v20;
      a5[2] = v38;
      a5[3] = v16;
      return result;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = a2;
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25C5EE4A0();
    os_log_type_t v25 = sub_25C5EE790();
    uint64_t v26 = v10;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v27 = swift_slowAlloc();
      os_log_t v34 = v24;
      uint64_t v28 = v27;
      uint64_t v35 = swift_slowAlloc();
      uint64_t v40 = v35;
      *(_DWORD *)uint64_t v28 = 136315650;
      uint64_t v41 = sub_25C5CD724(0xD000000000000024, 0x800000025C5F0E10, &v40);
      uint64_t v36 = v9;
      sub_25C5EE7F0();
      *(_WORD *)(v28 + 12) = 2080;
      unint64_t v29 = v39;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_25C5CD724(v37, v29, &v40);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_25C5CD724(v38, v16, &v40);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      os_log_t v30 = v34;
      _os_log_impl(&dword_25C5AA000, v34, v25, "Function: %s > No phrase template found for bundleId: %s, actionIdentifier: %s", (uint8_t *)v28, 0x20u);
      uint64_t v31 = v35;
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v31, -1, -1);
      MEMORY[0x26118BA70](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v36);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
  }
  double result = 0.0;
  *(_OWORD *)a5 = 0u;
  *((_OWORD *)a5 + 1) = 0u;
  return result;
}

void sub_25C5C3464(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  unint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_25C5EE9B0())
  {
    unint64_t v24 = v5 & 0xC000000000000001;
    uint64_t v28 = MEMORY[0x263F8EE78];
    uint64_t v7 = 4;
    uint64_t v22 = v6;
    unint64_t v23 = v5;
    while (1)
    {
      id v8 = v24 ? (id)MEMORY[0x26118B200](v7 - 4, v5) : *(id *)(v5 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v33 = v8;
      sub_25C5C30CC(&v33, a2, a3, a4, &v29);
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }

      uint64_t v11 = v30;
      if (v30)
      {
        uint64_t v12 = v28;
        uint64_t v13 = v29;
        uint64_t v15 = v31;
        uint64_t v14 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C5E9A90(0, *(void *)(v28 + 16) + 1, 1, v28);
          uint64_t v12 = v20;
        }
        uint64_t v16 = v12;
        unint64_t v17 = *(void *)(v12 + 16);
        uint64_t v28 = v16;
        unint64_t v18 = *(void *)(v16 + 24);
        if (v17 >= v18 >> 1)
        {
          sub_25C5E9A90(v18 > 1, v17 + 1, 1, v28);
          uint64_t v28 = v21;
        }
        *(void *)(v28 + 16) = v17 + 1;
        uint64_t v19 = (void *)(v28 + 32 * v17);
        void v19[4] = v13;
        v19[5] = v11;
        v19[6] = v15;
        v19[7] = v14;
        uint64_t v6 = v22;
        unint64_t v5 = v23;
      }
      ++v7;
      if (v10 == v6) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_25C5C3668()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id result = sub_25C5C36E8(0x775C5B287B5C245CLL, 0xEE007D5C292B5D2ELL, 0);
  qword_26A5B9430 = (uint64_t)result;
  return result;
}

id sub_25C5C36E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v5 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_25C5EDE90();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_25C5C37C4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C5C37D4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_phraseTemplate);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C5EE580();

  return v3;
}

ValueMetadata *type metadata accessor for DefaultExamplePhrasesProvider()
{
  return &type metadata for DefaultExamplePhrasesProvider;
}

unint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_25C5B0114(v1, v0);
}

uint64_t sub_25C5C3864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_25C5C3970;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25C5C3970(uint64_t a1)
{
  OUTLINED_FUNCTION_6();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25C5C3A48(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  uint64_t v3 = sub_25C5EE4B0();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C5C3B18, 0, 0);
}

uint64_t sub_25C5C3B18()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = swift_task_alloc();
  v0[15] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[16] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25C5C3C14;
  uint64_t v5 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2360]((char *)v0 + 148, 0, 0, 0xD000000000000021, 0x800000025C5F0E80, sub_25C5C44CC, v3, v5);
}

uint64_t sub_25C5C3C14()
{
  OUTLINED_FUNCTION_6();
  *(void *)(v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25C5C3F1C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_25C5C3D0C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25C5C3D0C()
{
  uint64_t v16 = v0;
  uint64_t v1 = *(unsigned __int8 *)(v0 + 148);
  sub_25C5EE490();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_25C5EE4A0();
  os_log_type_t v3 = sub_25C5EE780();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v13 = *(void *)(v0 + 88);
    uint64_t v5 = *(void *)(v0 + 72);
    unint64_t v6 = *(void *)(v0 + 80);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_25C5CD724(v5, v6, &v15);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 1024;
    *(_DWORD *)(v0 + 144) = v1;
    sub_25C5EE7F0();
    _os_log_impl(&dword_25C5AA000, v2, v3, "DefaultSiriShortcutsEnablementProvider: %s enabled for siri: %{BOOL}d", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v13);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 96);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v11(v1);
}

uint64_t sub_25C5C3F1C()
{
  uint64_t v22 = v0;
  uint64_t v1 = (void *)v0[17];
  swift_task_dealloc();
  sub_25C5EE490();
  swift_bridgeObjectRetain();
  id v2 = v1;
  swift_bridgeObjectRetain();
  id v3 = v1;
  uint64_t v4 = sub_25C5EE4A0();
  os_log_type_t v5 = sub_25C5EE790();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v17 = (void *)v0[17];
    uint64_t v18 = v0[12];
    unint64_t v6 = v0[10];
    uint64_t v19 = v0[11];
    uint64_t v20 = v0[13];
    uint64_t v7 = v0[9];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    v0[5] = sub_25C5CD724(v7, v6, &v21);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v9 = sub_25C5EEAD0();
    v0[8] = sub_25C5CD724(v9, v10, &v21);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C5AA000, v4, v5, "DefaultSiriShortcutsEnablementProvider: Could not determine if App Shortcuts for %s are enabled %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v11 = (void *)v0[17];
    uint64_t v13 = v0[12];
    uint64_t v12 = v0[13];
    uint64_t v14 = v0[11];

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15(0);
}

void sub_25C5C41D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9458);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  id v5 = objc_msgSend(self, sel_standardClient);
  unint64_t v6 = (void *)sub_25C5EE570();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_25C5C4568;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C5C4430;
  aBlock[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v5, sel_getSiriAutoShortcutsEnablementForBundleIdentifier_completion_, v6, v9);
  _Block_release(v9);
}

uint64_t sub_25C5C43BC(int a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9458);
    return sub_25C5EE710();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9458);
    return sub_25C5EE720();
  }
}

void sub_25C5C4430(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t type metadata accessor for DefaultSiriShortcutsEnablementProvider()
{
  return self;
}

void sub_25C5C44CC(uint64_t a1)
{
}

uint64_t sub_25C5C44D4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9458);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_25C5C4568(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9458);

  return sub_25C5C43BC(a1, a2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25C5C4604(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C5C4618(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25C5C462C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_25C5C4640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_25C5C4654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t sub_25C5C4668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_25C5C467C()
{
  uint64_t v1 = sub_25C5EE540();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8_1();
  uint64_t v5 = sub_25C5EE4F0();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v66 = v12;
  uint64_t v67 = v11;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v61 - v14;
  sub_25C5EE520();
  uint64_t v16 = sub_25C5EE510();
  uint64_t v63 = v3;
  uint64_t v64 = v7;
  uint64_t v70 = v10;
  uint64_t v71 = v5;
  uint64_t v68 = v0;
  uint64_t v69 = v1;
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9460);
  uint64_t v18 = sub_25C5EE4C0();
  OUTLINED_FUNCTION_0();
  uint64_t v20 = v19;
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_25C5EF260;
  (*(void (**)(unint64_t, void, uint64_t))(v20 + 104))(v22 + v21, *MEMORY[0x263F7FDF0], v18);
  uint64_t v24 = sub_25C5EE500();
  uint64_t v61 = v17;
  swift_bridgeObjectRelease();
  sub_25C5EE490();
  swift_bridgeObjectRetain();
  os_log_type_t v25 = sub_25C5EE4A0();
  uint64_t v26 = sub_25C5EE780();
  if (os_log_type_enabled(v25, (os_log_type_t)v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 134217984;
    uint64_t v72 = *(void *)(v24 + 16);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v25, (os_log_type_t)v26, "Number of assistantInvocable tools: %ld", v27, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v29 = v70;
  uint64_t v28 = v71;
  uint64_t v31 = v63;
  uint64_t v30 = v64;
  (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v66 + 8))(v15, v67);
  uint64_t v32 = *(void *)(v24 + 16);
  uint64_t v62 = v24;
  if (v32)
  {
    OUTLINED_FUNCTION_3_5();
    OUTLINED_FUNCTION_5_4();
    uint64_t v34 = v24 + v33;
    uint64_t v65 = *(void (***)(uint64_t, uint64_t))(v30 + 56);
    uint64_t v66 = v35;
    uint64_t v67 = (void (*)(char *, uint64_t, uint64_t))v30;
    uint64_t v36 = (void (**)(char *, uint64_t))(v30 - 8);
    uint64_t v37 = v32;
    do
    {
      uint64_t v38 = v71;
      ((void (*)(char *, uint64_t, uint64_t))v66)(v29, v34, v71);
      uint64_t v39 = sub_25C5EE4E0();
      uint64_t v41 = v40;
      (*v36)(v29, v38);
      uint64_t v42 = v72;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_2_3();
        uint64_t v42 = v72;
      }
      unint64_t v44 = *(void *)(v42 + 16);
      unint64_t v43 = *(void *)(v42 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_25C5C06AC(v43 > 1, v44 + 1, 1);
        uint64_t v42 = v72;
      }
      *(void *)(v42 + 16) = v44 + 1;
      uint64_t v45 = v42 + 16 * v44;
      *(void *)(v45 + 32) = v39;
      *(void *)(v45 + 40) = v41;
      v34 += (uint64_t)v65;
      --v37;
    }
    while (v37);
    uint64_t v28 = v71;
    uint64_t v31 = v63;
    uint64_t v30 = v64;
    uint64_t v24 = v62;
  }
  else
  {
    uint64_t v42 = MEMORY[0x263F8EE78];
  }
  uint64_t v46 = sub_25C5BE7E8(v42);
  uint64_t v47 = v46;
  if (v32)
  {
    uint64_t v64 = v46;
    OUTLINED_FUNCTION_3_5();
    OUTLINED_FUNCTION_5_4();
    uint64_t v49 = v24 + v48;
    uint64_t v66 = *(void *)(v30 + 56);
    uint64_t v67 = v50;
    uint64_t v65 = (void (**)(uint64_t, uint64_t))(v31 + 8);
    uint64_t v51 = (void (**)(char *, uint64_t))(v30 - 8);
    do
    {
      uint64_t v52 = v30;
      v67(v29, v49, v28);
      uint64_t v53 = v68;
      sub_25C5EE4D0();
      uint64_t v54 = sub_25C5EE530();
      uint64_t v56 = v55;
      (*v65)(v53, v69);
      (*v51)(v29, v28);
      uint64_t v57 = v72;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_2_3();
        uint64_t v57 = v72;
      }
      unint64_t v59 = *(void *)(v57 + 16);
      unint64_t v58 = *(void *)(v57 + 24);
      if (v59 >= v58 >> 1)
      {
        sub_25C5C06AC(v58 > 1, v59 + 1, 1);
        uint64_t v57 = v72;
      }
      *(void *)(v57 + 16) = v59 + 1;
      uint64_t v60 = v57 + 16 * v59;
      *(void *)(v60 + 32) = v54;
      *(void *)(v60 + 40) = v56;
      v49 += v66;
      --v32;
      uint64_t v29 = v70;
      uint64_t v28 = v71;
      uint64_t v30 = v52;
    }
    while (v32);
    swift_bridgeObjectRelease();
    uint64_t v47 = v64;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v57 = MEMORY[0x263F8EE78];
  }
  sub_25C5BE7E8(v57);
  swift_release();
  return v47;
}

uint64_t sub_25C5C4D44(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*__swift_project_boxed_opaque_existential_1((void *)(v2 + 16), *(void *)(v2 + 40))
                             + 16)
                 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C5B0114(a1, a2);
    char v6 = v5;
    if (v5)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_25C5C4DE4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRelease();
  sub_25C5DFBDC(a1, a2, *(void *)(v2 + 56));
  char v4 = v3;
  swift_bridgeObjectRelease();
  return v4 & 1;
}

BOOL sub_25C5C4E88()
{
  uint64_t v1 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8_1();
  id v5 = objc_allocWithZone(MEMORY[0x263F08770]);
  id v6 = sub_25C5C5130(2048);
  uint64_t v11 = v6;
  if (v6)
  {
    uint64_t v12 = (void *)sub_25C5EE570();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25C5EE630();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_matchesInString_options_range_, v12, 0, 0, v13);

    sub_25C5C51E4();
    unint64_t v15 = sub_25C5EE6B0();

    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_25C5EE9B0();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();
    }
    return v16 != 0;
  }
  else
  {
    sub_25C5EE490();
    uint64_t v7 = sub_25C5EE4A0();
    os_log_type_t v8 = sub_25C5EE790();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25C5AA000, v7, v8, "Unable to initialize an NSDataDetector with checking type 'phoneNumber'", v9, 2u);
      OUTLINED_FUNCTION_3();
    }

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
    return 0;
  }
}

uint64_t sub_25C5C50A0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C5C50D0()
{
  sub_25C5C50A0();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for DefaultEligibilityCriteria()
{
  return self;
}

uint64_t sub_25C5C5128()
{
  return 0;
}

id sub_25C5C5130(uint64_t a1)
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  v6[0] = 0;
  id v2 = objc_msgSend(v1, sel_initWithTypes_error_, a1, v6);
  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_25C5EDE90();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_25C5C51E4()
{
  unint64_t result = qword_26A5B9428;
  if (!qword_26A5B9428)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5B9428);
  }
  return result;
}

void OUTLINED_FUNCTION_2_3()
{
  uint64_t v2 = *(void *)(v0 + 16) + 1;
  sub_25C5C06AC(0, v2, 1);
}

void OUTLINED_FUNCTION_3_5()
{
  *(void *)(v2 - 96) = v1;
  sub_25C5C06AC(0, v0, 0);
}

void sub_25C5C5280(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
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
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      uint64_t v8 = v4 + v2;
    }
    else {
      uint64_t v8 = v4;
    }
    sub_25C5E9A5C(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    uint64_t v3 = v9;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_25C5AFCBC(a1 + 32, v2, v3 + 16 * v10 + 32);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v11 = *(void *)(v3 + 16);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *(void *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_25C5C535C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C5EE9B0();
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
    uint64_t v5 = sub_25C5EE9B0();
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
  *uint64_t v1 = v4;
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
    unint64_t v4 = MEMORY[0x26118B210](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_25C5CE344(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25C5EE9B0();
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

  return sub_25C5EE6D0();
}

uint64_t sub_25C5C5524(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C5EE9B0();
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
    uint64_t v5 = sub_25C5EE9B0();
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
  *uint64_t v1 = v4;
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
    unint64_t v4 = MEMORY[0x26118B210](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_25C5CE4E0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25C5EE9B0();
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

  return sub_25C5EE6D0();
}

uint64_t sub_25C5C56EC@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  sub_25C5D2430(v1 + 112, (uint64_t)&v4, &qword_26B351368);
  if (v5) {
    return sub_25C5B4420(&v4, (uint64_t)a1);
  }
  sub_25C5D23DC((uint64_t)&v4, &qword_26B351368);
  sub_25C5C57B0(v1, a1);
  sub_25C5B4254((uint64_t)a1, (uint64_t)&v4);
  swift_beginAccess();
  sub_25C5D1184((uint64_t)&v4, v1 + 112);
  return swift_endAccess();
}

uint64_t sub_25C5C57B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for DefaultInstalledAppProvider();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_25C5D9BB8();
  sub_25C5B4254(a1 + 72, (uint64_t)v8);
  uint64_t v5 = swift_retain();
  uint64_t v6 = sub_25C5CE73C(v5, v8);
  a2[3] = type metadata accessor for DefaultEligibilityCriteria();
  a2[4] = (uint64_t)&off_2709C32F0;
  uint64_t result = swift_release();
  *a2 = v6;
  return result;
}

uint64_t sub_25C5C5848()
{
  uint64_t result = sub_25C5EE220();
  qword_26A5B98B8 = result;
  return result;
}

uint64_t sub_25C5C5868()
{
  uint64_t result = sub_25C5C588C();
  qword_26A5B9468 = result;
  unk_26A5B9470 = v1;
  return result;
}

uint64_t sub_25C5C588C()
{
  uint64_t v0 = sub_25C5EE130();
  if (v1) {
    uint64_t v2 = v0;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v4 = v2;
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25C5EE5F0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static SiriAutoCompleteIndexBuilder.currentIndexVersion.getter()
{
  if (qword_26A5B9158 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A5B9468;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t SiriAutoCompleteIndexBuilder.__allocating_init()()
{
  sub_25C5EE1F0();
  OUTLINED_FUNCTION_144();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  sub_25C5EE1E0();
  sub_25C5EE210();
  *((void *)&v18 + 1) = v0;
  uint64_t v19 = MEMORY[0x263F6CC78];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v17);
  sub_25C5EE1E0();
  uint64_t v9 = sub_25C5EE200();
  uint64_t v10 = sub_25C5EE190();
  uint64_t v12 = v11;
  type metadata accessor for SiriAutoCompleteIndexBuilder();
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v19 = 0;
  uint64_t v13 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v8, v0);
  uint64_t v14 = sub_25C5CE8D4(v9, v10, v12, (uint64_t)v6, (uint64_t)&v17, v13, 90.0);
  OUTLINED_FUNCTION_102();
  v15();
  return v14;
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

uint64_t type metadata accessor for SiriAutoCompleteIndexBuilder()
{
  return self;
}

uint64_t sub_25C5C5B74()
{
  OUTLINED_FUNCTION_65();
  v1[10] = v2;
  v1[11] = v0;
  OUTLINED_FUNCTION_71();
  v1[12] = v3;
  uint64_t v4 = sub_25C5EE480();
  v1[13] = v4;
  OUTLINED_FUNCTION_2(v4);
  v1[14] = v5;
  v1[15] = OUTLINED_FUNCTION_192();
  uint64_t v6 = sub_25C5EE4B0();
  v1[16] = v6;
  OUTLINED_FUNCTION_2(v6);
  v1[17] = v7;
  v1[18] = OUTLINED_FUNCTION_146();
  v1[19] = swift_task_alloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

void sub_25C5C5C44()
{
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = v1[13];
  __swift_project_boxed_opaque_existential_1(v1 + 9, v1[12]);
  if (sub_25C5EE230())
  {
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_25C5EE4A0();
    os_log_type_t v4 = sub_25C5EE780();
    BOOL v5 = OUTLINED_FUNCTION_219(v4);
    uint64_t v6 = v0[17];
    uint64_t v7 = v0[16];
    if (v5)
    {
      uint64_t v34 = v0[18];
      uint64_t v8 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315394;
      os_log_type_t type = v2;
      uint64_t v9 = OUTLINED_FUNCTION_64_0();
      v0[8] = sub_25C5CD724(v9, v10, &v35);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      uint64_t v11 = swift_bridgeObjectRetain();
      uint64_t v12 = MEMORY[0x26118B020](v11, MEMORY[0x263F8D310]);
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      v0[9] = sub_25C5CD724(v12, v14, &v35);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v3, type, "%s updateIndexForAppInstall with %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v34, v7);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v20 = OUTLINED_FUNCTION_121();
      v22(v20, v21);
    }
    uint64_t v23 = v0[10];
    type metadata accessor for DefaultInstalledAppProvider();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_25C5D9BB8();
    OUTLINED_FUNCTION_178();
    uint64_t v25 = sub_25C5CE73C(v24, v0 + 2);
    v0[20] = v25;
    uint64_t v26 = type metadata accessor for AppLaunchSource();
    swift_retain();
    v0[21] = sub_25C5CFA88(v23, v25, v26);
    swift_release();
    type metadata accessor for AppShortcutsSource();
    swift_retain();
    uint64_t v27 = (void *)swift_task_alloc();
    v0[22] = v27;
    *uint64_t v27 = v0;
    v27[1] = sub_25C5C60C0;
    OUTLINED_FUNCTION_161();
    __asm { BR              X3 }
  }
  sub_25C5EE490();
  unint64_t v15 = sub_25C5EE4A0();
  os_log_type_t v16 = sub_25C5EE780();
  if (OUTLINED_FUNCTION_219(v16))
  {
    long long v17 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    uint64_t v35 = OUTLINED_FUNCTION_11();
    *(_DWORD *)long long v17 = 136315138;
    uint64_t v18 = sub_25C5EEB60();
    v0[7] = sub_25C5CD724(v18, v19, &v35);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v15, (os_log_type_t)v2, "%s: index build is not enabled. Not running updateIndexForAppInstall", v17, 0xCu);
    OUTLINED_FUNCTION_46_0();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
  }
  OUTLINED_FUNCTION_218();
  v30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_161();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_25C5C60C0()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_10_2();
  *os_log_type_t v4 = v3;
  *(void *)(v6 + 184) = v5;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5C61AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_217();
  unint64_t v27 = v12[21];
  uint64_t v13 = sub_25C5C5524(v12[23]);
  unint64_t v21 = v27;
  uint64_t v28 = MEMORY[0x263F8EE78];
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_25C5EE9B0();
    uint64_t v13 = swift_bridgeObjectRelease();
    if (!v22) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v22) {
      goto LABEL_16;
    }
  }
  if (v22 < 1)
  {
    __break(1u);
    return MEMORY[0x270F642B0](v13, v14, v15, v16, v17, v18, v19, v20, v28, a10, a11, a12);
  }
  do
  {
    if ((v21 & 0xC000000000000001) != 0) {
      OUTLINED_FUNCTION_56_0();
    }
    else {
      OUTLINED_FUNCTION_81();
    }
    OUTLINED_FUNCTION_123();
    if (!v23) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      sub_25C5EE900();
      OUTLINED_FUNCTION_79();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_159();
  }
  while (!v23);
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v24 = v12[11];
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  __swift_project_boxed_opaque_existential_1((void *)(v24 + 16), *(void *)(v24 + 40));
  uint64_t v25 = (void *)swift_task_alloc();
  v12[24] = v25;
  *uint64_t v25 = v12;
  v25[1] = sub_25C5C63B4;
  OUTLINED_FUNCTION_26_0(v12[15]);
  OUTLINED_FUNCTION_54_0();
  return MEMORY[0x270F642B0](v13, v14, v15, v16, v17, v18, v19, v20, v28, a10, a11, a12);
}

uint64_t sub_25C5C63B4()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 200) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5C6484()
{
  OUTLINED_FUNCTION_76();
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = OUTLINED_FUNCTION_204();
  return v5(v4);
}

uint64_t sub_25C5C6524(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5C653C);
}

uint64_t sub_25C5C653C()
{
  OUTLINED_FUNCTION_76();
  __swift_project_boxed_opaque_existential_1((void *)(v0[3] + 16), *(void *)(v0[3] + 40));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C5C65EC;
  uint64_t v2 = OUTLINED_FUNCTION_26_0(v0[2]);
  return MEMORY[0x270F642A8](v2);
}

uint64_t sub_25C5C65EC()
{
  OUTLINED_FUNCTION_65();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_6();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_25C5C66BC()
{
  OUTLINED_FUNCTION_65();
  v1[9] = v2;
  v1[10] = v0;
  OUTLINED_FUNCTION_71();
  v1[11] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9498);
  v1[12] = OUTLINED_FUNCTION_192();
  uint64_t v4 = sub_25C5EE330();
  v1[13] = v4;
  OUTLINED_FUNCTION_2(v4);
  v1[14] = v5;
  v1[15] = OUTLINED_FUNCTION_146();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  uint64_t v6 = sub_25C5EE4B0();
  v1[18] = v6;
  OUTLINED_FUNCTION_2(v6);
  v1[19] = v7;
  v1[20] = OUTLINED_FUNCTION_146();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25C5C67F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_25_0();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_110();
  a20 = v22;
  __swift_project_boxed_opaque_existential_1((void *)(v22[10] + 72), *(void *)(v22[10] + 96));
  OUTLINED_FUNCTION_66();
  if (sub_25C5EE230())
  {
    uint64_t v25 = (void *)swift_task_alloc();
    v22[25] = v25;
    *uint64_t v25 = v22;
    v25[1] = sub_25C5C6A08;
    OUTLINED_FUNCTION_17_0();
    return sub_25C5CCC8C();
  }
  else
  {
    sub_25C5EE490();
    uint64_t v28 = (void *)sub_25C5EE4A0();
    os_log_type_t v29 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_157(v29))
    {
      a9 = v22 + 8;
      a10 = v22[24];
      OUTLINED_FUNCTION_3_3();
      a11 = OUTLINED_FUNCTION_11();
      uint64_t v30 = OUTLINED_FUNCTION_226(4.8149e-34);
      v22[8] = sub_25C5CD724(v30, v31, &a11);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_196(&dword_25C5AA000, v32, v33, "%s: index build is not enabled. Not running");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_218();
    v34();
    OUTLINED_FUNCTION_40_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_17_0();
    return v37(v35, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_25C5C6A08()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 208) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5C6AD8()
{
  uint64_t v2 = *(void *)(*(void *)(v0 + 72) + 16);
  *(void *)(v0 + 216) = v2;
  if (!v2) {
    goto LABEL_30;
  }
  *(_DWORD *)(v0 + 376) = *MEMORY[0x263F6CCE0];
  uint64_t v3 = (_DWORD *)MEMORY[0x263F6CCD8];
  *(_DWORD *)(v0 + 380) = *MEMORY[0x263F6CCE8];
  *(_DWORD *)(v0 + 384) = *v3;
  *(_DWORD *)(v0 + 388) = *MEMORY[0x263F6CCF8];
  uint64_t v4 = (_DWORD *)MEMORY[0x263F6CCC8];
  *(_DWORD *)(v0 + 392) = *MEMORY[0x263F6CCC0];
  *(_DWORD *)(v0 + 396) = *v4;
  *(_DWORD *)(v0 + 400) = *MEMORY[0x263F6CCF0];
  *(_DWORD *)(v0 + 404) = *MEMORY[0x263F6CCD0];
  uint64_t v5 = (void *)(v0 + 224);
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  *(void *)&long long v7 = 136315394;
  long long v127 = v7;
  uint64_t v121 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v7 = 136315138;
  long long v120 = v7;
  uint64_t v126 = v0 + 224;
  while (1)
  {
    *(void *)(v0 + 248) = v6;
    v5[1] = 0;
    v5[2] = 0;
    void *v5 = 0;
    uint64_t v8 = *(void *)(*(void *)(v0 + 72) + 8 * v6 + 32);
    sub_25C5EE310();
    OUTLINED_FUNCTION_63_0();
    if (v9)
    {
      uint64_t v10 = OUTLINED_FUNCTION_177();
      sub_25C5D23DC(v10, &qword_26A5B9498);
      sub_25C5EE490();
      uint64_t v11 = (void *)sub_25C5EE4A0();
      os_log_type_t v12 = sub_25C5EE790();
      BOOL v13 = OUTLINED_FUNCTION_24_0(v12);
      uint64_t v1 = *(void *)(v0 + 144);
      if (v13)
      {
        uint64_t v14 = OUTLINED_FUNCTION_53_0();
        OUTLINED_FUNCTION_11();
        *(_DWORD *)uint64_t v14 = v127;
        uint64_t v15 = OUTLINED_FUNCTION_64_0();
        *(void *)(v14 + 4) = OUTLINED_FUNCTION_68_0(v15, v16);
        uint64_t v17 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_235(v17, v18, v19, v20, v21, v22, v23, v24, v120, *((uint64_t *)&v120 + 1), v121, v122, (uint64_t)v123, v124, v125, v126, v127, *((uint64_t *)&v127 + 1), (uint64_t)v128,
          v8);
        OUTLINED_FUNCTION_62_0();
        _os_log_impl(v25, v26, v27, "%s: buildIndividualSources cannot convert %lld to case in AutoCompletePhraseSource", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_74();
      v28();
      goto LABEL_27;
    }
    uint64_t v30 = *(void *)(v0 + 128);
    uint64_t v29 = *(void *)(v0 + 136);
    uint64_t v31 = *(void *)(v0 + 104);
    uint64_t v32 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t, void, uint64_t))(v32 + 32))(v29, *(void *)(v0 + 96), v31);
    sub_25C5EE490();
    unint64_t v128 = *(void (**)(void))(v32 + 16);
    ((void (*)(uint64_t, uint64_t, uint64_t))v128)(v30, v29, v31);
    uint64_t v33 = sub_25C5EE4A0();
    os_log_type_t v34 = sub_25C5EE780();
    BOOL v35 = OUTLINED_FUNCTION_124(v34);
    uint64_t v36 = *(void *)(v0 + 152);
    uint64_t v37 = *(void *)(v0 + 112);
    uint64_t v130 = v8;
    if (v35)
    {
      uint64_t v124 = *(void *)(v0 + 184);
      uint64_t v125 = *(void *)(v0 + 144);
      uint64_t v122 = *(void *)(v0 + 104);
      uint64_t v123 = v33;
      uint64_t v38 = swift_slowAlloc();
      OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v38 = v127;
      uint64_t v39 = OUTLINED_FUNCTION_64_0();
      *(void *)(v38 + 4) = OUTLINED_FUNCTION_68_0(v39, v40);
      swift_bridgeObjectRelease();
      uint64_t v41 = OUTLINED_FUNCTION_176();
      uint64_t v42 = *(void (**)(void))(v37 + 8);
      OUTLINED_FUNCTION_74();
      v42();
      *(void *)(v38 + 14) = v41;
      OUTLINED_FUNCTION_174(&dword_25C5AA000, v123, (os_log_type_t)v1, "%s: buildIndividualSources %lld");
      OUTLINED_FUNCTION_46_0();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      uint64_t v42 = *(void (**)(void))(v37 + 8);
      OUTLINED_FUNCTION_74();
      v42();
    }
    unint64_t v43 = *(void (**)(void))(v36 + 8);
    OUTLINED_FUNCTION_233();
    v43();
    *(void *)(v0 + 256) = v42;
    int v44 = *(_DWORD *)(v0 + 376);
    ((void (*)(void, void, void))v128)(*(void *)(v0 + 120), *(void *)(v0 + 136), *(void *)(v0 + 104));
    uint64_t v45 = OUTLINED_FUNCTION_55_0();
    if (v46(v45) == v44)
    {
      sub_25C5EE490();
      uint64_t v47 = (void *)sub_25C5EE4A0();
      os_log_type_t v48 = sub_25C5EE780();
      BOOL v49 = OUTLINED_FUNCTION_24_0(v48);
      uint64_t v1 = *(void *)(v0 + 176);
      uint64_t v50 = *(void *)(v0 + 136);
      if (v49)
      {
        uint64_t v124 = *(void *)(v0 + 104);
        unint64_t v128 = v42;
        uint64_t v51 = swift_slowAlloc();
        uint64_t v125 = (uint64_t)v43;
        OUTLINED_FUNCTION_11();
        *(_DWORD *)uint64_t v51 = v120;
        uint64_t v52 = OUTLINED_FUNCTION_64_0();
        *(void *)(v51 + 4) = OUTLINED_FUNCTION_68_0(v52, v53);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_62_0();
        _os_log_impl(v54, v55, v56, "%s: buildIndividualSources AssistantSuggestions source does not support individual rebuild", (uint8_t *)v51, 0xCu);
        OUTLINED_FUNCTION_46_0();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();

        OUTLINED_FUNCTION_102();
        v57();
        OUTLINED_FUNCTION_233();
        v58();
      }
      else
      {
        uint64_t v78 = *(void *)(v0 + 104);

        uint64_t v79 = OUTLINED_FUNCTION_80();
        ((void (*)(uint64_t))v43)(v79);
        ((void (*)(uint64_t, uint64_t))v42)(v50, v78);
      }
      uint64_t v5 = (void *)v126;
      goto LABEL_27;
    }
    OUTLINED_FUNCTION_173();
    if (v9) {
      break;
    }
    OUTLINED_FUNCTION_172();
    if (v9)
    {
      uint64_t v89 = swift_task_alloc();
      uint64_t v90 = (void *)OUTLINED_FUNCTION_163(v89);
      *uint64_t v90 = v91;
      v90[1] = sub_25C5C7C00;
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_61_0();
      return sub_25C5CB7D8();
    }
    OUTLINED_FUNCTION_171();
    if (v9)
    {
      uint64_t v93 = swift_task_alloc();
      uint64_t v94 = (void *)OUTLINED_FUNCTION_162(v93);
      *uint64_t v94 = v95;
      v94[1] = sub_25C5C7424;
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_61_0();
      return sub_25C5CB520(v96);
    }
    OUTLINED_FUNCTION_170();
    if (v9)
    {
      uint64_t v98 = swift_task_alloc();
      uint64_t v99 = (void *)OUTLINED_FUNCTION_165(v98);
      *uint64_t v99 = v100;
      v99[1] = sub_25C5C8B94;
      OUTLINED_FUNCTION_220();
      OUTLINED_FUNCTION_61_0();
      return sub_25C5CC0A4(v101, v102);
    }
    OUTLINED_FUNCTION_169();
    if (v9)
    {
      uint64_t v104 = swift_task_alloc();
      uint64_t v105 = (void *)OUTLINED_FUNCTION_153(v104);
      *uint64_t v105 = v106;
      v105[1] = sub_25C5C9350;
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_61_0();
      return sub_25C5CC5C0(v107);
    }
    OUTLINED_FUNCTION_168();
    if (v9)
    {
      uint64_t v109 = swift_task_alloc();
      uint64_t v110 = (void *)OUTLINED_FUNCTION_164(v109);
      *uint64_t v110 = v111;
      v110[1] = sub_25C5C83D8;
      OUTLINED_FUNCTION_220();
      OUTLINED_FUNCTION_61_0();
      return sub_25C5CBDF8(v112, v113);
    }
    OUTLINED_FUNCTION_167();
    if (v9)
    {
      uint64_t v115 = swift_task_alloc();
      uint64_t v116 = (void *)OUTLINED_FUNCTION_152(v115);
      *uint64_t v116 = v117;
      v116[1] = sub_25C5C9B0C;
      OUTLINED_FUNCTION_3_6();
      OUTLINED_FUNCTION_61_0();
      return sub_25C5CC6EC(v118);
    }
    sub_25C5EE490();
    unint64_t v59 = (void *)sub_25C5EE4A0();
    os_log_type_t v60 = sub_25C5EE790();
    BOOL v61 = OUTLINED_FUNCTION_24_0(v60);
    uint64_t v1 = *(void *)(v0 + 144);
    uint64_t v62 = *(void *)(v0 + 136);
    uint64_t v124 = *(void *)(v0 + 104);
    if (v61)
    {
      uint64_t v129 = (uint64_t)v42;
      uint64_t v63 = OUTLINED_FUNCTION_53_0();
      OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v63 = v127;
      uint64_t v64 = OUTLINED_FUNCTION_64_0();
      *(void *)(v63 + 4) = OUTLINED_FUNCTION_68_0(v64, v65);
      uint64_t v66 = swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_235(v66, v67, v68, v69, v70, v71, v72, v73, v120, *((uint64_t *)&v120 + 1), v121, v122, v62, v124, (uint64_t)v43, v126, v127, *((uint64_t *)&v127 + 1), v129,
        v130);
      OUTLINED_FUNCTION_62_0();
      _os_log_impl(v74, v75, v76, "%s: buildIndividualSources %lld is an unknown source", (uint8_t *)v63, 0x16u);
      OUTLINED_FUNCTION_46_0();
      OUTLINED_FUNCTION_3();
      uint64_t v42 = v128;
      OUTLINED_FUNCTION_3();

      OUTLINED_FUNCTION_102();
      v77();
    }
    else
    {

      OUTLINED_FUNCTION_102();
      v43();
    }
    OUTLINED_FUNCTION_233();
    v42();
    uint64_t v5 = (void *)v126;
    uint64_t v80 = OUTLINED_FUNCTION_82();
    ((void (*)(uint64_t))v42)(v80);
LABEL_27:
    OUTLINED_FUNCTION_30_0();
    if (v9)
    {
      swift_bridgeObjectRelease();
LABEL_30:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_40_0();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_156();
      OUTLINED_FUNCTION_61_0();
      __asm { BRAA            X2, X16 }
    }
  }
  uint64_t v83 = swift_task_alloc();
  uint64_t v84 = (void *)OUTLINED_FUNCTION_166(v83);
  *uint64_t v84 = v85;
  v84[1] = sub_25C5CA2C8;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_61_0();
  return sub_25C5CC86C(v86);
}

uint64_t sub_25C5C7424()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  v1[2] = v0;
  v1[3] = v3;
  v1[4] = v4;
  OUTLINED_FUNCTION_214();
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v8 + 272) = v7;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "25C5C75D8: call analysis failed (funcsize=435)"

uint64_t sub_25C5C7C00()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  v1[5] = v0;
  v1[6] = v3;
  v1[7] = v4;
  OUTLINED_FUNCTION_214();
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v8 + 288) = v7;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

#error "25C5C7DB0: call analysis failed (funcsize=434)"

uint64_t sub_25C5C83D8()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 304) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "25C5C8568: call analysis failed (funcsize=427)"

uint64_t sub_25C5C8B94()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 320) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "25C5C8D24: call analysis failed (funcsize=427)"

uint64_t sub_25C5C9350()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 336) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "25C5C94E0: call analysis failed (funcsize=427)"

uint64_t sub_25C5C9B0C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 352) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "25C5C9C9C: call analysis failed (funcsize=427)"

uint64_t sub_25C5CA2C8()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 368) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

#error "25C5CA458: call analysis failed (funcsize=427)"

uint64_t sub_25C5CAA84()
{
  OUTLINED_FUNCTION_65();
  *(void *)(v1 + 152) = v0;
  *(unsigned char *)(v1 + 360) = v2;
  OUTLINED_FUNCTION_71();
  *(void *)(v1 + 160) = v3;
  uint64_t v4 = sub_25C5EDF30();
  *(void *)(v1 + 168) = v4;
  OUTLINED_FUNCTION_2(v4);
  *(void *)(v1 + 176) = v5;
  *(void *)(v1 + 184) = OUTLINED_FUNCTION_192();
  uint64_t v6 = sub_25C5EE330();
  *(void *)(v1 + 192) = v6;
  OUTLINED_FUNCTION_2(v6);
  *(void *)(v1 + 200) = v7;
  *(void *)(v1 + 208) = OUTLINED_FUNCTION_146();
  *(void *)(v1 + 216) = swift_task_alloc();
  *(void *)(v1 + 224) = swift_task_alloc();
  *(void *)(v1 + 232) = swift_task_alloc();
  *(void *)(v1 + 240) = swift_task_alloc();
  *(void *)(v1 + 248) = swift_task_alloc();
  *(void *)(v1 + 256) = swift_task_alloc();
  uint64_t v8 = sub_25C5EE4B0();
  *(void *)(v1 + 264) = v8;
  OUTLINED_FUNCTION_2(v8);
  *(void *)(v1 + 272) = v9;
  *(void *)(v1 + 280) = OUTLINED_FUNCTION_146();
  *(void *)(v1 + 288) = swift_task_alloc();
  *(void *)(v1 + 296) = swift_task_alloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_25C5CABDC()
{
  uint64_t v68 = v0;
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 152) + 72), *(void *)(*(void *)(v0 + 152) + 96));
  if ((sub_25C5EE230() & 1) == 0)
  {
    sub_25C5EE490();
    uint64_t v14 = (void *)sub_25C5EE4A0();
    os_log_type_t v15 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_24_0(v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      OUTLINED_FUNCTION_62_0();
      _os_log_impl(v17, v18, v19, v20, v16, 2u);
      OUTLINED_FUNCTION_3();
    }

    uint64_t v21 = OUTLINED_FUNCTION_66();
    v22(v21);
LABEL_18:
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
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_161();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v2 = *(void *)(v0 + 152);
  *(void *)(v0 + 304) = *(void *)(v2 + 56);
  *(void *)(v0 + 312) = *(void *)(v2 + 64);
  *(void *)(v0 + 320) = swift_getObjectType();
  if (sub_25C5EE180())
  {
    sub_25C5EE490();
    uint64_t v3 = (void *)sub_25C5EE4A0();
    os_log_type_t v4 = sub_25C5EE780();
    BOOL v5 = OUTLINED_FUNCTION_116(v4);
    uint64_t v6 = *(void *)(v0 + 288);
    uint64_t v8 = *(void *)(v0 + 264);
    uint64_t v7 = *(void *)(v0 + 272);
    if (v5)
    {
      uint64_t v65 = *(void *)(v0 + 288);
      uint64_t v9 = (_DWORD *)OUTLINED_FUNCTION_3_3();
      uint64_t v67 = OUTLINED_FUNCTION_11();
      _DWORD *v9 = 136315138;
      uint64_t v10 = sub_25C5EEB60();
      *(void *)(v0 + 144) = sub_25C5CD724(v10, v11, &v67);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_85(&dword_25C5AA000, v12, v13, "%s: automatic index building is disabled");
      OUTLINED_FUNCTION_46_0();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v65, v8);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
    goto LABEL_18;
  }
  if (*(unsigned char *)(v0 + 360) == 1 && sub_25C5CD3C8())
  {
    sub_25C5EE490();
    uint64_t v23 = sub_25C5EE4A0();
    os_log_type_t v24 = sub_25C5EE780();
    BOOL v25 = OUTLINED_FUNCTION_116(v24);
    uint64_t v26 = *(void *)(v0 + 272);
    uint64_t v27 = *(void *)(v0 + 280);
    if (v25)
    {
      uint64_t v28 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      uint64_t v67 = OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v29 = sub_25C5EEB60();
      *(void *)(v0 + 136) = sub_25C5CD724(v29, v30, &v67);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v23, v1, "%s already built index on a start up event like GM Available or Suggestions startup recently. Not building again", v28, 0xCu);
      OUTLINED_FUNCTION_112();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t))(v26 + 8))(v27);
    }
    else
    {

      (*(void (**)(uint64_t))(v26 + 8))(v27);
    }
    goto LABEL_18;
  }
  *(void *)(v0 + 328) = sub_25C5EE440();
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  uint64_t v31 = *(void *)(v0 + 248);
  uint64_t v61 = *(void *)(v0 + 240);
  uint64_t v62 = *(void *)(v0 + 232);
  uint64_t v63 = *(void *)(v0 + 224);
  uint64_t v64 = *(void *)(v0 + 216);
  uint64_t v32 = *(void *)(v0 + 200);
  uint64_t v66 = *(void *)(v0 + 208);
  uint64_t v33 = *(void *)(v0 + 192);
  uint64_t v34 = qword_26A5B98B8;
  uint64_t v35 = sub_25C5EE290();
  OUTLINED_FUNCTION_160(v34, v35, v36, v37, (uint64_t)"enableTelemetry=YES");
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B94E8);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 336) = inited;
  *(_OWORD *)(inited + 16) = xmmword_25C5EFD40;
  uint64_t v39 = *(void (**)(uint64_t))(v32 + 104);
  uint64_t v40 = OUTLINED_FUNCTION_119();
  v39(v40);
  uint64_t v41 = sub_25C5EE320();
  uint64_t v42 = *(void (**)(void))(v32 + 8);
  OUTLINED_FUNCTION_154();
  v42();
  *(void *)(inited + 32) = v41;
  ((void (*)(uint64_t, void, uint64_t))v39)(v31, *MEMORY[0x263F6CCD8], v33);
  uint64_t v43 = sub_25C5EE320();
  OUTLINED_FUNCTION_154();
  v42();
  *(void *)(inited + 40) = v43;
  uint64_t v44 = OUTLINED_FUNCTION_119();
  v39(v44);
  sub_25C5EE320();
  uint64_t v45 = OUTLINED_FUNCTION_115();
  ((void (*)(uint64_t))v42)(v45);
  *(void *)(inited + 48) = v61;
  uint64_t v46 = OUTLINED_FUNCTION_119();
  v39(v46);
  sub_25C5EE320();
  uint64_t v47 = OUTLINED_FUNCTION_115();
  ((void (*)(uint64_t))v42)(v47);
  *(void *)(inited + 56) = v62;
  uint64_t v48 = OUTLINED_FUNCTION_119();
  v39(v48);
  sub_25C5EE320();
  uint64_t v49 = OUTLINED_FUNCTION_115();
  ((void (*)(uint64_t))v42)(v49);
  *(void *)(inited + 64) = v63;
  uint64_t v50 = OUTLINED_FUNCTION_119();
  v39(v50);
  sub_25C5EE320();
  uint64_t v51 = OUTLINED_FUNCTION_115();
  ((void (*)(uint64_t))v42)(v51);
  *(void *)(inited + 72) = v64;
  uint64_t v52 = OUTLINED_FUNCTION_119();
  v39(v52);
  sub_25C5EE320();
  uint64_t v53 = OUTLINED_FUNCTION_115();
  ((void (*)(uint64_t))v42)(v53);
  *(void *)(inited + 80) = v66;
  uint64_t v54 = swift_task_alloc();
  os_log_t v55 = (void *)OUTLINED_FUNCTION_152(v54);
  *os_log_t v55 = v56;
  v55[1] = sub_25C5CB238;
  OUTLINED_FUNCTION_161();
  return sub_25C5C66BC();
}

uint64_t sub_25C5CB238()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_10_2();
  *os_log_type_t v4 = v3;
  *(void *)(v6 + 352) = v5;
  swift_task_dealloc();
  swift_setDeallocating();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5CB324()
{
  OUTLINED_FUNCTION_110();
  if (qword_26A5B9158 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A5B9468;
  uint64_t v2 = unk_26A5B9470;
  swift_bridgeObjectRetain();
  sub_25C5EDF20();
  sub_25C5EDF10();
  double v4 = v3;
  OUTLINED_FUNCTION_218();
  v5();
  uint64_t v6 = (void (*)(uint64_t, void))sub_25C5EE160();
  sub_25C5CDF4C(v1, v2, v4);
  swift_bridgeObjectRelease();
  v6(v0 + 104, 0);
  sub_25C5EE290();
  sub_25C5EE420();
  uint64_t v9 = *(void *)(v0 + 352);
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
  OUTLINED_FUNCTION_240();
  return v7(v9);
}

uint64_t sub_25C5CB520(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5CB538);
}

uint64_t sub_25C5CB538()
{
  OUTLINED_FUNCTION_151();
  uint64_t v1 = v0[8];
  type metadata accessor for AppLaunchHistogramBuilder();
  uint64_t v2 = sub_25C5DF03C();
  v0[9] = v2;
  type metadata accessor for AppLaunchSource();
  uint64_t v3 = OUTLINED_FUNCTION_158();
  v0[10] = v3;
  uint64_t v4 = v3 + OBJC_IVAR____TtC16SiriAutoComplete15AppLaunchSource_source;
  uint64_t v5 = *MEMORY[0x263F6CCF8];
  sub_25C5EE330();
  OUTLINED_FUNCTION_23_0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 104))(v4, v5);
  *(void *)(v3 + OBJC_IVAR____TtC16SiriAutoComplete15AppLaunchSource_histogram) = v2;
  swift_retain();
  sub_25C5C56EC(v0 + 2);
  sub_25C5EE2A0();
  OUTLINED_FUNCTION_149();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_58_0();
  v0[11] = (uint64_t)v7;
  void *v7 = v0;
  v7[1] = sub_25C5CB69C;
  uint64_t v8 = v0[7];
  uint64_t v9 = v0[8];
  return v11(v3, v8, v0 + 2, v1, v1, v4, v9);
}

void sub_25C5CB69C()
{
  OUTLINED_FUNCTION_215();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_10_2();
  void *v5 = v4;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  swift_release();
  OUTLINED_FUNCTION_237();
  __asm { BRAA            X3, X16 }
}

uint64_t sub_25C5CB7D8()
{
  OUTLINED_FUNCTION_65();
  v1[13] = v2;
  v1[14] = v0;
  OUTLINED_FUNCTION_71();
  v1[15] = v3;
  uint64_t v4 = sub_25C5EE4B0();
  v1[16] = v4;
  OUTLINED_FUNCTION_2(v4);
  v1[17] = v5;
  v1[18] = OUTLINED_FUNCTION_192();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C5CB86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t *a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_25_0();
  a21 = v23;
  a22 = v24;
  OUTLINED_FUNCTION_110();
  a20 = v22;
  if (OUTLINED_FUNCTION_228(v22[14]))
  {
    type metadata accessor for AppIntentTranscriptSource();
    OUTLINED_FUNCTION_158();
    uint64_t v25 = sub_25C5BEA44();
    OUTLINED_FUNCTION_199(v25);
    sub_25C5EE2F0();
    OUTLINED_FUNCTION_150();
    uint64_t v26 = (void *)OUTLINED_FUNCTION_58_0();
    v22[20] = (uint64_t)v26;
    *uint64_t v26 = v22;
    v26[1] = sub_25C5CBB18;
    OUTLINED_FUNCTION_17_0();
    return v34(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12, a13, a14);
  }
  else
  {
    sub_25C5EE490();
    uint64_t v37 = (void *)sub_25C5EE4A0();
    os_log_type_t v38 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_157(v38))
    {
      a9 = v22 + 12;
      OUTLINED_FUNCTION_3_3();
      a11 = OUTLINED_FUNCTION_11();
      uint64_t v39 = OUTLINED_FUNCTION_226(4.8149e-34);
      v22[12] = sub_25C5CD724(v39, v40, &a11);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_196(&dword_25C5AA000, v41, v42, "%s: appIntentSources feature flag is not enabled. Not indexing phrases from the App Intent sources");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_218();
    v43();
    type metadata accessor for AppIntentTranscriptSource();
    OUTLINED_FUNCTION_158();
    v22[22] = sub_25C5BEA44();
    sub_25C5C56EC(v22 + 2);
    sub_25C5EE2F0();
    v22[23] = *__swift_project_boxed_opaque_existential_1(v22 + 2, v22[5]);
    uint64_t v53 = (char *)&dword_26A5B9408 + dword_26A5B9408;
    swift_retain();
    swift_retain();
    uint64_t v44 = (void *)swift_task_alloc();
    v22[24] = (uint64_t)v44;
    *uint64_t v44 = v22;
    v44[1] = sub_25C5CBC78;
    OUTLINED_FUNCTION_17_0();
    return v47(v45, v46, v47, v48, v49, v50, v51, v52, a9, v53, a11, a12, a13, a14);
  }
}

uint64_t sub_25C5CBB18()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 56;
  OUTLINED_FUNCTION_214();
  *uint64_t v4 = *v0;
  *(void *)(v6 + 168) = v5;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5CBBF0()
{
  OUTLINED_FUNCTION_65();
  uint64_t v1 = *(void *)(v0[19] + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram);
  swift_retain();
  swift_release();
  uint64_t v2 = v0[21];
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_25C5CBC78()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C5CBD50()
{
  OUTLINED_FUNCTION_76();
  uint64_t v1 = *(void *)(*(void *)(v0 + 176) + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram);
  swift_retain();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
  return v2(v1, 0);
}

uint64_t sub_25C5CBDF8(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5CBE14);
}

uint64_t sub_25C5CBE14()
{
  OUTLINED_FUNCTION_151();
  if (OUTLINED_FUNCTION_228(v0[9]))
  {
    if (v0[8])
    {
      uint64_t v1 = v0[8];
    }
    else
    {
      type metadata accessor for AppLaunchHistogramBuilder();
      uint64_t v1 = sub_25C5DF03C();
    }
    type metadata accessor for AssistantIntentExamplePhrasesSource();
    uint64_t v5 = OUTLINED_FUNCTION_158();
    v0[10] = v5;
    uint64_t v6 = v5 + OBJC_IVAR____TtC16SiriAutoComplete35AssistantIntentExamplePhrasesSource_source;
    uint64_t v7 = *MEMORY[0x263F6CCF0];
    sub_25C5EE330();
    OUTLINED_FUNCTION_23_0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 104))(v6, v7);
    *(void *)(v5 + OBJC_IVAR____TtC16SiriAutoComplete35AssistantIntentExamplePhrasesSource_histogram) = v1;
    swift_retain();
    sub_25C5C56EC(v0 + 2);
    sub_25C5EE300();
    OUTLINED_FUNCTION_149();
    uint64_t v9 = (void *)OUTLINED_FUNCTION_120();
    v0[11] = (uint64_t)v9;
    void *v9 = v0;
    v9[1] = sub_25C5CBFB4;
    uint64_t v10 = OUTLINED_FUNCTION_201();
    return v11(v10);
  }
  else
  {
    uint64_t v2 = OUTLINED_FUNCTION_156();
    return v3(v2);
  }
}

uint64_t sub_25C5CBFB4()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  OUTLINED_FUNCTION_214();
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_10_2();
  void *v5 = v4;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_204();
  return v7(v6);
}

uint64_t sub_25C5CC0A4(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5CC0C0);
}

void sub_25C5CC0C0()
{
  OUTLINED_FUNCTION_215();
  uint64_t v1 = v0[13];
  if (v1)
  {
    v0[18] = v1;
    type metadata accessor for AppShortcutsSource();
    OUTLINED_FUNCTION_158();
    uint64_t v2 = swift_retain_n();
    uint64_t v3 = sub_25C5E6294(v2);
    OUTLINED_FUNCTION_199(v3);
    sub_25C5EE2B0();
    OUTLINED_FUNCTION_150();
    uint64_t v4 = (void *)OUTLINED_FUNCTION_120();
    v0[20] = (uint64_t)v4;
    *uint64_t v4 = v0;
    v4[1] = sub_25C5CC470;
    OUTLINED_FUNCTION_175();
    OUTLINED_FUNCTION_237();
    __asm { BR              X7 }
  }
  type metadata accessor for AppIntentTranscriptSource();
  OUTLINED_FUNCTION_158();
  v0[15] = sub_25C5BEA44();
  sub_25C5C56EC(v0 + 2);
  sub_25C5EE2F0();
  v0[16] = *__swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[17] = (uint64_t)v7;
  void *v7 = v0;
  v7[1] = sub_25C5CC27C;
  OUTLINED_FUNCTION_237();
  __asm { BR              X2 }
}

uint64_t sub_25C5CC27C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C5CC354()
{
  OUTLINED_FUNCTION_151();
  uint64_t v1 = *(void *)(v0[15] + OBJC_IVAR____TtC16SiriAutoComplete25AppIntentTranscriptSource_histogram);
  swift_retain();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_release();
  v0[18] = v1;
  type metadata accessor for AppShortcutsSource();
  OUTLINED_FUNCTION_158();
  swift_retain();
  uint64_t v2 = swift_retain();
  uint64_t v3 = sub_25C5E6294(v2);
  OUTLINED_FUNCTION_199(v3);
  sub_25C5EE2B0();
  OUTLINED_FUNCTION_150();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_58_0();
  v0[20] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25C5CC470;
  uint64_t v5 = OUTLINED_FUNCTION_175();
  return v7(v5);
}

uint64_t sub_25C5CC470()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 56;
  OUTLINED_FUNCTION_214();
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_10_2();
  void *v5 = v4;
  *(void *)(v7 + 168) = v6;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  swift_release();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_25C5CC564()
{
  OUTLINED_FUNCTION_65();
  swift_release();
  OUTLINED_FUNCTION_240();
  uint64_t v2 = *(void *)(v0 + 168);
  return v1(v2);
}

uint64_t sub_25C5CC5C0(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5CC5D8);
}

void sub_25C5CC5D8()
{
  OUTLINED_FUNCTION_215();
  type metadata accessor for VoiceShortcutSource();
  uint64_t v1 = OUTLINED_FUNCTION_158();
  v0[9] = v1;
  uint64_t v2 = v1 + OBJC_IVAR____TtC16SiriAutoComplete19VoiceShortcutSource_source;
  uint64_t v3 = *MEMORY[0x263F6CCC8];
  sub_25C5EE330();
  OUTLINED_FUNCTION_23_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 104))(v2, v3);
  sub_25C5C56EC(v0 + 2);
  sub_25C5EE2D0();
  OUTLINED_FUNCTION_149();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_120();
  v0[10] = (uint64_t)v5;
  void *v5 = v0;
  v5[1] = sub_25C5D85D4;
  OUTLINED_FUNCTION_201();
  OUTLINED_FUNCTION_237();
  __asm { BR              X7 }
}

uint64_t sub_25C5CC6EC(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5CC704);
}

void sub_25C5CC704()
{
  OUTLINED_FUNCTION_215();
  type metadata accessor for DefaultLocaleProvider();
  swift_initStaticObject();
  if (qword_26A5B9160 != -1) {
    swift_once();
  }
  type metadata accessor for DefaultAppFinderForIntentProvider();
  swift_retain();
  swift_initStaticObject();
  uint64_t v1 = OUTLINED_FUNCTION_121();
  v0[9] = sub_25C5D7958(v1, v2, v3);
  sub_25C5C56EC(v0 + 2);
  sub_25C5EE2E0();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  uint64_t v4 = (void *)OUTLINED_FUNCTION_120();
  v0[10] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25C5D85D4;
  OUTLINED_FUNCTION_237();
  __asm { BR              X7 }
}

uint64_t sub_25C5CC86C(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return OUTLINED_FUNCTION_48_0((uint64_t)sub_25C5CC884);
}

void sub_25C5CC884()
{
  OUTLINED_FUNCTION_215();
  type metadata accessor for SiriKitIntentSource();
  OUTLINED_FUNCTION_158();
  v0[9] = sub_25C5AC1A4(300.0);
  sub_25C5C56EC(v0 + 2);
  sub_25C5EE2C0();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_120();
  v0[10] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25C5CC98C;
  OUTLINED_FUNCTION_237();
  __asm { BR              X7 }
}

uint64_t sub_25C5CC98C()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  uint64_t v3 = v1 + 16;
  OUTLINED_FUNCTION_214();
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_10_2();
  void *v5 = v4;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_204();
  return v7(v6);
}

uint64_t sub_25C5CCA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25C5CCAA0, 0, 0);
}

uint64_t sub_25C5CCAA0()
{
  OUTLINED_FUNCTION_215();
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25C5CCB98;
  uint64_t v4 = OUTLINED_FUNCTION_26_0(v0[4]);
  return v6(v4);
}

uint64_t sub_25C5CCB98()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 48) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5CCC68()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 48);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25C5CCC8C()
{
  OUTLINED_FUNCTION_65();
  v1[2] = v0;
  uint64_t v2 = sub_25C5EE4B0();
  v1[3] = v2;
  OUTLINED_FUNCTION_2(v2);
  v1[4] = v3;
  v1[5] = OUTLINED_FUNCTION_192();
  uint64_t v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  v1[6] = v4;
  OUTLINED_FUNCTION_2(v4);
  v1[7] = v5;
  v1[8] = OUTLINED_FUNCTION_146();
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  v1[10] = OUTLINED_FUNCTION_192();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_25C5CCD7C()
{
  OUTLINED_FUNCTION_76();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[11] = sub_25C5EE560();
  uint64_t v3 = v1 + 2;
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[12] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_25C5CCE60;
  return MEMORY[0x270F642B8](v2, v4, v5);
}

uint64_t sub_25C5CCE60()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 104) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5CCF30()
{
  uint64_t v51 = v0;
  unint64_t v1 = v0[13];
  if (v1 >> 62) {
    goto LABEL_34;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_225();
    OUTLINED_FUNCTION_61_0();
    __asm { BRAA            X2, X16 }
  }
LABEL_3:
  uint64_t v3 = 0;
  uint64_t v47 = v0[7];
  unint64_t v48 = v1 & 0xC000000000000001;
  uint64_t v45 = (void (**)(uint64_t *, uint64_t))(v0[4] + 8);
  uint64_t v4 = (uint64_t *)v0[11];
  uint64_t v46 = v2;
  while (1)
  {
    if (v48) {
      MEMORY[0x26118B200](v3, v0[13]);
    }
    else {
      swift_retain();
    }
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      OUTLINED_FUNCTION_84();
      uint64_t v2 = sub_25C5EE9B0();
      swift_bridgeObjectRelease();
      if (!v2) {
        goto LABEL_35;
      }
      goto LABEL_3;
    }
    uint64_t v49 = v3 + 1;
    uint64_t v5 = sub_25C5EE3C0();
    if (v4[2] && (unint64_t v7 = sub_25C5B0114(v5, v6), (v8 & 1) != 0))
    {
      sub_25C5D24E8(v4[7] + *(void *)(v47 + 72) * v7, v0[10]);
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 1;
    }
    uint64_t v10 = v0[10];
    uint64_t v11 = v0[6];
    __swift_storeEnumTagSinglePayload(v10, v9, 1, v11);
    swift_bridgeObjectRelease();
    LODWORD(v11) = __swift_getEnumTagSinglePayload(v10, 1, v11);
    sub_25C5D23DC(v10, &qword_26A5B9518);
    if (v11 == 1) {
      break;
    }
    sub_25C5EE490();
    swift_retain_n();
    uint64_t v27 = sub_25C5EE4A0();
    os_log_type_t v28 = sub_25C5EE790();
    BOOL v29 = os_log_type_enabled(v27, v28);
    unint64_t v1 = v0[5];
    uint64_t v30 = v0[3];
    if (v29)
    {
      uint64_t v31 = OUTLINED_FUNCTION_3_3();
      uint64_t v50 = (uint64_t *)OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v31 = 136315138;
      unint64_t v44 = v1;
      uint64_t v32 = sub_25C5EE3C0();
      unint64_t v1 = v33;
      *(void *)(v31 + 4) = sub_25C5CD724(v32, v33, (uint64_t *)&v50);
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v27, v28, "[warning] Duplicates in index, phrase: %s", (uint8_t *)v31, 0xCu);
      swift_arrayDestroy();
      uint64_t v2 = v46;
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      swift_release();

      (*v45)((uint64_t *)v44, v30);
    }
    else
    {

      swift_release_n();
      (*v45)((uint64_t *)v1, v30);
    }
LABEL_26:
    ++v3;
    if (v49 == v2) {
      goto LABEL_35;
    }
  }
  uint64_t v13 = v0[8];
  uint64_t v12 = (uint64_t *)v0[9];
  uint64_t v14 = sub_25C5EE3C0();
  uint64_t v16 = v15;
  uint64_t v17 = sub_25C5EE3F0();
  sub_25C5EE390();
  *uint64_t v12 = v17;
  sub_25C5D7C4C((uint64_t)v12, v13);
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v50 = v4;
  unint64_t v1 = (unint64_t)v4;
  unint64_t v18 = sub_25C5B0114(v14, v16);
  if (__OFADD__(v4[2], (v19 & 1) == 0)) {
    goto LABEL_32;
  }
  unint64_t v20 = v18;
  char v21 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B95A0);
  unint64_t v1 = (unint64_t)&v50;
  char v22 = sub_25C5EE970();
  uint64_t v4 = v50;
  if ((v22 & 1) == 0)
  {
LABEL_17:
    if (v21)
    {
      OUTLINED_FUNCTION_232();
      sub_25C5D7CB0(v25, v26);
    }
    else
    {
      v4[(v20 >> 6) + 8] |= 1 << v20;
      uint64_t v34 = (uint64_t *)(v4[6] + 16 * v20);
      uint64_t *v34 = v14;
      v34[1] = v16;
      OUTLINED_FUNCTION_232();
      sub_25C5D7C4C(v35, v36);
      uint64_t v37 = v4[2];
      BOOL v38 = __OFADD__(v37, 1);
      uint64_t v39 = v37 + 1;
      if (v38) {
        goto LABEL_33;
      }
      v4[2] = v39;
      swift_bridgeObjectRetain();
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v46;
    goto LABEL_26;
  }
  unint64_t v1 = (unint64_t)v50;
  unint64_t v23 = sub_25C5B0114(v14, v16);
  if ((v21 & 1) == (v24 & 1))
  {
    unint64_t v20 = v23;
    goto LABEL_17;
  }
  OUTLINED_FUNCTION_61_0();
  return sub_25C5EEAC0();
}

BOOL sub_25C5CD3C8()
{
  sub_25C5EDF30();
  OUTLINED_FUNCTION_144();
  MEMORY[0x270FA5388](v0);
  if (qword_26A5B9158 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26A5B9468;
  uint64_t v2 = unk_26A5B9470;
  swift_getObjectType();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_25C5EE170();
  double v4 = COERCE_DOUBLE(sub_25C5AE2BC(v1, v2, v3));
  LOBYTE(v1) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v1) {
    return 0;
  }
  sub_25C5EDF20();
  sub_25C5EDF10();
  double v7 = v6;
  OUTLINED_FUNCTION_74();
  v8();
  return v7 - v4 < 604800.0;
}

uint64_t SiriAutoCompleteIndexBuilder.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 72);
  sub_25C5D23DC(v0 + 112, &qword_26B351368);
  return v0;
}

uint64_t SiriAutoCompleteIndexBuilder.__deallocating_deinit()
{
  SiriAutoCompleteIndexBuilder.deinit();

  return MEMORY[0x270FA0228](v0, 160, 7);
}

uint64_t sub_25C5CD5AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_25C5DC1E8(v3, v4);
  }
  else
  {
    sub_25C5D7D64();
    uint64_t v6 = sub_25C5EE6B0();
    return sub_25C5DC250(v3, v6);
  }
}

void sub_25C5CD628(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t sub_25C5CD638(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25C5CD648(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C5CD684(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C5CD6AC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C5CD724(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C5EE7F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C5CD724(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_20_0();
  uint64_t v9 = sub_25C5CD7F4(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_25C5B45D4((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_25C5B45D4((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  return v10;
}

uint64_t sub_25C5CD7F4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C5CD94C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C5EE800();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C5CDA24(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C5EE8C0();
    if (!v8)
    {
      uint64_t result = sub_25C5EE9A0();
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

void *sub_25C5CD94C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C5EE9D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C5CDA24(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C5CDABC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C5CDC98(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C5CDC98((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C5CDABC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C5EE600();
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
  unint64_t v3 = sub_25C5CDC30(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C5EE890();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C5EE9D0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C5EE9A0();
  __break(1u);
  return result;
}

void *sub_25C5CDC30(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B95C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C5CDC98(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B95C8);
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
    sub_25C5CDE48(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C5CDD70(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C5CDD70(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C5EE9D0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C5CDE48(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C5EE9D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_25C5CDED8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25C5CDEE8()
{
  return sub_25C5EE7F0();
}

uint64_t sub_25C5CDF10(void (*a1)(void))
{
  a1();

  return sub_25C5EEB60();
}

uint64_t sub_25C5CDF4C(uint64_t a1, uint64_t a2, double a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_155();
  sub_25C5B8E20(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C5CDFCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_155();
  sub_25C5B8F38(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25C5CE04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25C5CE07C(a1, a2, a3, a4, a5, sub_25C5B9054);
}

uint64_t sub_25C5CE064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25C5CE07C(a1, a2, a3, a4, a5, sub_25C5B9184);
}

uint64_t sub_25C5CE07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_155();
  a6(a1, a2, a3, a4, a5);
  *unint64_t v6 = v14;

  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C5CE11C(uint64_t **a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_25C5CE238(v6, a2, a3);
  return sub_25C5CE184;
}

uint64_t (*sub_25C5CE188(void *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_25C5CE2BC(v6, a2, a3);
  return sub_25C5CE184;
}

void sub_25C5CE1F0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_25C5CE238(uint64_t *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_25C5EA294(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x26118B200](a2, a3);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *a1 = v7;
  return j__OUTLINED_FUNCTION_208;
}

void (*sub_25C5CE2BC(void *a1, uint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_25C5EA294(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x26118B200](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_25C5CE33C;
}

void sub_25C5CE33C(id *a1)
{
}

uint64_t sub_25C5CE344(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25C5EE9B0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25C5EE9B0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_25C5D7D14(&qword_26A5B95C0, &qword_26B3510A0);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A0);
            uint64_t v10 = sub_25C5CE188(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_25C5AFE44((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10));
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5CE4E0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25C5EE9B0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_25C5EE9B0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_25C5D7D14(&qword_26A5B95A8, &qword_26A5B9538);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
            uint64_t v10 = sub_25C5CE11C(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_25C5AFF00((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10));
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5CE67C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = type metadata accessor for DefaultInstalledAppProvider();
  uint64_t v12 = &off_2709C34C0;
  *(void *)&long long v10 = a1;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  if (sub_25C5EE240())
  {
    type metadata accessor for DefaultEligibilityCriteria();
    uint64_t v6 = sub_25C5C467C();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
    uint64_t v6 = MEMORY[0x263F8EE88];
  }
  sub_25C5B4420(&v10, a3 + 16);
  *(void *)(a3 + 56) = v6;
  *(void *)(a3 + 64) = v8;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a2);
  return a3;
}

uint64_t sub_25C5CE73C(uint64_t a1, void *a2)
{
  uint64_t v13 = type metadata accessor for DefaultInstalledAppProvider();
  uint64_t v14 = &off_2709C34C0;
  v12[0] = a1;
  type metadata accessor for DefaultEligibilityCriteria();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void *)((char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  uint64_t v9 = sub_25C5CE67C(*v7, a2, v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v9;
}

uint64_t sub_25C5CE858(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = type metadata accessor for DefaultEligibilityCriteria();
  uint64_t v8 = &off_2709C32F0;
  *(void *)&long long v6 = a1;
  sub_25C5B4420(&v6, (uint64_t)v5);
  swift_beginAccess();
  sub_25C5D1184((uint64_t)v5, a2 + 112);
  return swift_endAccess();
}

uint64_t sub_25C5CE8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  v26[3] = sub_25C5EE210();
  v26[4] = MEMORY[0x263F6CC80];
  v26[0] = a1;
  uint64_t v14 = sub_25C5EE1F0();
  v25[3] = v14;
  v25[4] = MEMORY[0x263F6CC78];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(boxed_opaque_existential_1, a4, v14);
  *(_OWORD *)(a6 + 112) = 0u;
  *(_OWORD *)(a6 + 128) = 0u;
  *(void *)(a6 + 144) = 0;
  sub_25C5B4254((uint64_t)v26, a6 + 16);
  *(void *)(a6 + 56) = a2;
  *(void *)(a6 + 64) = a3;
  sub_25C5B4254((uint64_t)v25, a6 + 72);
  *(double *)(a6 + 152) = a7;
  sub_25C5D2430(a5, (uint64_t)&v22, &qword_26B351368);
  if (v23)
  {
    sub_25C5B4420(&v22, (uint64_t)v24);
    sub_25C5B4254((uint64_t)v24, (uint64_t)&v22);
    uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v22, v23);
    MEMORY[0x270FA5388](v16);
    unint64_t v18 = (uint64_t *)((char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v19 + 16))(v18);
    uint64_t v20 = *v18;
    swift_unknownObjectRetain();
    sub_25C5CE858(v20, a6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v22);
    swift_unknownObjectRelease();
    sub_25C5D23DC(a5, &qword_26B351368);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  else
  {
    sub_25C5D23DC(a5, &qword_26B351368);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
    sub_25C5D23DC((uint64_t)&v22, &qword_26B351368);
  }
  return a6;
}

uint64_t sub_25C5CEB1C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  v17[3] = type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider();
  v17[4] = &off_2709C2D98;
  v17[0] = a4;
  uint64_t v16 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_retain();
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = sub_25C5EE9B0())
  {
    uint64_t v9 = 4;
    while (1)
    {
      id v10 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x26118B200](v9 - 4, a3) : *(id *)(a3 + 8 * v9);
      uint64_t v11 = v10;
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      uint64_t v13 = (void *)MEMORY[0x26118B520]();
      sub_25C5E6344(v11, a1, a2, v17);

      ++v9;
      if (v12 == v8)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = v16;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_11:
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_13:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return v14;
}

uint64_t sub_25C5CEC8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a1;
  uint64_t v10 = sub_25C5EE4B0();
  v6[21] = v10;
  v6[22] = *(void *)(v10 - 8);
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[5] = type metadata accessor for DefaultEligibilityCriteria();
  v6[6] = &off_2709C32F0;
  id v6[2] = a2;
  v6[10] = type metadata accessor for DefaultAppShortcutsApprovedPhrasesProvider();
  v6[11] = &off_2709C2D98;
  v6[7] = a3;
  v6[15] = type metadata accessor for DefaultSiriShortcutsEnablementProvider();
  v6[16] = &off_2709C3290;
  v6[12] = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5CEDE4, 0, 0);
}

uint64_t sub_25C5CEDE4()
{
  uint64_t v45 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v41 = (void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 144);
  if (v3)
  {
    char v4 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v0 + 256) = v4;
    uint64_t v5 = 1 << v4;
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v3 + 64);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v9 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    uint64_t v11 = v10 | (v9 << 6);
    uint64_t result = *(void *)(v0 + 144);
    while (1)
    {
      *(void *)(v0 + 208) = v9;
      *(void *)(v0 + 216) = v7;
      uint64_t v20 = (uint64_t *)(*(void *)(result + 48) + 16 * v11);
      uint64_t v21 = *v20;
      *(void *)(v0 + 224) = *v20;
      unint64_t v22 = v20[1];
      *(void *)(v0 + 232) = v22;
      OUTLINED_FUNCTION_229(result, v11);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (sub_25C5C4D44(v21, v22)) {
        break;
      }
      swift_bridgeObjectRelease();
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_25C5EE4A0();
      os_log_type_t v24 = sub_25C5EE780();
      BOOL v25 = OUTLINED_FUNCTION_157(v24);
      uint64_t v43 = *(void *)(v0 + 192);
      uint64_t v26 = *(void *)(v0 + 168);
      uint64_t v27 = *(void *)(v0 + 176);
      if (v25)
      {
        uint64_t v42 = v9;
        uint64_t v28 = OUTLINED_FUNCTION_3_3();
        uint64_t v44 = OUTLINED_FUNCTION_11();
        *(_DWORD *)uint64_t v28 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v28 + 4) = sub_25C5CD724(v21, v22, &v44);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v23, v1, "Skipping App Shortcut since it is associated with an app that is not installed: %s", (uint8_t *)v28, 0xCu);
        swift_arrayDestroy();
        uint64_t v2 = v0 + 16;
        OUTLINED_FUNCTION_3();
        uint64_t v9 = v42;
        OUTLINED_FUNCTION_3();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v43, v26);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      if (__OFADD__(v9, 1))
      {
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      uint64_t result = OUTLINED_FUNCTION_207();
      if (v14 == v15) {
        goto LABEL_38;
      }
      uint64_t v16 = result + 64;
      unint64_t v17 = *(void *)(result + 64 + 8 * v13);
      uint64_t v9 = v13;
      if (!v17)
      {
        int64_t v18 = v12 >> 6;
        uint64_t v9 = v13 + 1;
        if (v13 + 1 >= v18) {
          goto LABEL_38;
        }
        unint64_t v17 = *(void *)(v16 + 8 * v9);
        if (!v17)
        {
          uint64_t v9 = v13 + 2;
          if (v13 + 2 >= v18) {
            goto LABEL_38;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v9);
          if (!v17)
          {
            uint64_t v9 = v13 + 3;
            if (v13 + 3 >= v18) {
              goto LABEL_38;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v9);
            if (!v17)
            {
              uint64_t v9 = v13 + 4;
              if (v13 + 4 >= v18) {
                goto LABEL_38;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v9);
              if (!v17)
              {
                uint64_t v19 = v13 + 5;
                if (v19 >= v18)
                {
LABEL_38:
                  swift_release();
                  goto LABEL_39;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v19);
                if (!v17)
                {
                  while (1)
                  {
                    uint64_t v9 = v19 + 1;
                    if (__OFADD__(v19, 1)) {
                      goto LABEL_43;
                    }
                    if (v9 >= v18) {
                      goto LABEL_38;
                    }
                    unint64_t v17 = *(void *)(v16 + 8 * v9);
                    ++v19;
                    if (v17) {
                      goto LABEL_25;
                    }
                  }
                }
                uint64_t v9 = v19;
              }
            }
          }
        }
      }
LABEL_25:
      unint64_t v7 = (v17 - 1) & v17;
      uint64_t v11 = __clz(__rbit64(v17)) + (v9 << 6);
    }
    __swift_project_boxed_opaque_existential_1(v41, *(void *)(v0 + 120));
    BOOL v29 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v29;
    *BOOL v29 = v0;
    v29[1] = sub_25C5CF23C;
    return sub_25C5C3A48(v21, v22);
  }
  else
  {
    sub_25C5EE490();
    uint64_t v30 = (void *)sub_25C5EE4A0();
    os_log_type_t v31 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_24_0(v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      OUTLINED_FUNCTION_62_0();
      _os_log_impl(v33, v34, v35, v36, v32, 2u);
      OUTLINED_FUNCTION_3();
    }
    uint64_t v37 = *(void *)(v0 + 200);
    uint64_t v39 = *(void *)(v0 + 168);
    uint64_t v38 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
LABEL_39:
    __swift_destroy_boxed_opaque_existential_1Tm(v2);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v40 = *(uint64_t (**)(void))(v0 + 8);
    return v40();
  }
}

uint64_t sub_25C5CF23C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 257) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5CF30C()
{
  os_log_type_t v76 = v0;
  unint64_t v2 = v0[29];
  unint64_t v1 = v0[30];
  LOBYTE(v3) = MEMORY[0x263F8EE58];
  uint64_t v67 = (uint64_t)(v0 + 7);
  if (*((unsigned char *)v0 + 257))
  {
    uint64_t v4 = v0[28];
    uint64_t v5 = __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    unint64_t v6 = sub_25C5CEB1C(v4, v2, v1, *v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v6 >> 62)
    {
LABEL_33:
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25C5EE9B0();
      swift_bridgeObjectRelease();
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v7)
      {
LABEL_4:
        uint64_t v3 = 0;
        uint64_t v72 = v0 + 17;
        unint64_t v74 = v6 & 0xC000000000000001;
        uint64_t v69 = v7;
        unint64_t v70 = v6;
        while (1)
        {
          if (v74)
          {
            uint64_t v8 = MEMORY[0x26118B200](v3, v6);
          }
          else
          {
            uint64_t v8 = *(void *)(v6 + 8 * v3 + 32);
            swift_retain();
          }
          uint64_t v9 = v3 + 1;
          if (__OFADD__(v3, 1))
          {
            __break(1u);
LABEL_31:
            __break(1u);
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
          uint64_t v10 = *(void *)v0[19];
          swift_bridgeObjectRetain();
          uint64_t v11 = sub_25C5EE3C0();
          if (*(void *)(v10 + 16))
          {
            sub_25C5B0114(v11, v12);
            char v14 = v13;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v14)
            {
              swift_release();
              goto LABEL_22;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          unint64_t v6 = v0[19];
          uint64_t v15 = sub_25C5EE3C0();
          uint64_t v17 = v16;
          swift_retain();
          swift_isUniquelyReferenced_nonNull_native();
          uint64_t v18 = *(void *)v6;
          v0[17] = *(void *)v6;
          *(void *)unint64_t v6 = 0x8000000000000000;
          unint64_t v19 = sub_25C5B0114(v15, v17);
          if (__OFADD__(*(void *)(v18 + 16), (v20 & 1) == 0)) {
            goto LABEL_31;
          }
          unint64_t v21 = v19;
          unint64_t v6 = v20;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9288);
          uint64_t v0 = v72;
          if (sub_25C5EE970())
          {
            unint64_t v22 = sub_25C5B0114(v15, v17);
            if ((v6 & 1) != (v23 & 1))
            {
              OUTLINED_FUNCTION_223();
              return sub_25C5EEAC0();
            }
            unint64_t v21 = v22;
          }
          os_log_type_t v24 = (void *)*v72;
          if (v6)
          {
            uint64_t v25 = v24[7];
            swift_release();
            *(void *)(v25 + 8 * v21) = v8;
          }
          else
          {
            v24[(v21 >> 6) + 8] |= 1 << v21;
            uint64_t v26 = (uint64_t *)(v24[6] + 16 * v21);
            *uint64_t v26 = v15;
            v26[1] = v17;
            *(void *)(v24[7] + 8 * v21) = v8;
            uint64_t v27 = v24[2];
            BOOL v28 = __OFADD__(v27, 1);
            uint64_t v29 = v27 + 1;
            if (v28) {
              goto LABEL_32;
            }
            v24[2] = v29;
            swift_bridgeObjectRetain();
          }
          uint64_t v0 = (void *)v71;
          **(void **)(v71 + 152) = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v7 = v69;
          unint64_t v6 = v70;
LABEL_22:
          ++v3;
          if (v9 == v7)
          {
            uint64_t result = swift_bridgeObjectRelease();
            LOBYTE(v3) = MEMORY[0x263F8EE58];
            goto LABEL_35;
          }
        }
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    os_log_type_t v31 = (void *)sub_25C5EE4A0();
    os_log_type_t v32 = sub_25C5EE780();
    BOOL v33 = OUTLINED_FUNCTION_157(v32);
    unint64_t v34 = v0[29];
    if (v33)
    {
      uint64_t v35 = *(void *)(v71 + 224);
      uint64_t v3 = OUTLINED_FUNCTION_3_3();
      uint64_t v75 = OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v3 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v0 = (void *)v71;
      *(void *)(v3 + 4) = sub_25C5CD724(v35, v34, &v75);
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_196(&dword_25C5AA000, v36, v37, "Skipping App Shortcut since it is associated with an app that is not enabled for Siri: %s");
      OUTLINED_FUNCTION_112();
      OUTLINED_FUNCTION_3();
      LOBYTE(v3) = MEMORY[0x263F8EE58];
      OUTLINED_FUNCTION_3();

      uint64_t v38 = OUTLINED_FUNCTION_66();
      uint64_t result = v39(v38);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_233();
      uint64_t result = v40();
    }
  }
LABEL_35:
  uint64_t v42 = (uint64_t)(v0 + 2);
  uint64_t v68 = v0 + 12;
  uint64_t v44 = v0[26];
  unint64_t v43 = v0[27];
  if (!v43) {
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v45 = __clz(__rbit64(v43));
  v43 &= v43 - 1;
  uint64_t v46 = v45 | (v44 << 6);
  uint64_t result = v0[18];
  while (1)
  {
    v0[26] = v44;
    v0[27] = v43;
    uint64_t v54 = (uint64_t *)(*(void *)(result + 48) + 16 * v46);
    uint64_t v55 = *v54;
    v0[28] = *v54;
    unint64_t v56 = v54[1];
    v0[29] = v56;
    OUTLINED_FUNCTION_229(result, v46);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_25C5C4D44(v55, v56)) {
      break;
    }
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_25C5EE4A0();
    os_log_type_t v58 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_219(v58))
    {
      uint64_t v73 = v44;
      uint64_t v59 = OUTLINED_FUNCTION_3_3();
      uint64_t v75 = OUTLINED_FUNCTION_11();
      *(_DWORD *)uint64_t v59 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v59 + 4) = sub_25C5CD724(v55, v56, &v75);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v57, (os_log_type_t)v3, "Skipping App Shortcut since it is associated with an app that is not installed: %s", (uint8_t *)v59, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      uint64_t v0 = (void *)v71;
      uint64_t v44 = v73;
      OUTLINED_FUNCTION_3();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    OUTLINED_FUNCTION_218();
    uint64_t result = v60();
    if (v43) {
      goto LABEL_36;
    }
LABEL_37:
    if (__OFADD__(v44, 1))
    {
      __break(1u);
LABEL_69:
      __break(1u);
      return result;
    }
    uint64_t result = OUTLINED_FUNCTION_207();
    if (v49 == v28) {
      goto LABEL_65;
    }
    uint64_t v50 = result + 64;
    unint64_t v51 = *(void *)(result + 64 + 8 * v48);
    uint64_t v44 = v48;
    if (!v51)
    {
      int64_t v52 = v47 >> 6;
      uint64_t v44 = v48 + 1;
      if (v48 + 1 >= v52) {
        goto LABEL_65;
      }
      unint64_t v51 = *(void *)(v50 + 8 * v44);
      if (!v51)
      {
        uint64_t v44 = v48 + 2;
        if (v48 + 2 >= v52) {
          goto LABEL_65;
        }
        unint64_t v51 = *(void *)(v50 + 8 * v44);
        if (!v51)
        {
          uint64_t v44 = v48 + 3;
          if (v48 + 3 >= v52) {
            goto LABEL_65;
          }
          unint64_t v51 = *(void *)(v50 + 8 * v44);
          if (!v51)
          {
            uint64_t v44 = v48 + 4;
            if (v48 + 4 >= v52) {
              goto LABEL_65;
            }
            unint64_t v51 = *(void *)(v50 + 8 * v44);
            if (!v51)
            {
              uint64_t v53 = v48 + 5;
              if (v53 >= v52)
              {
LABEL_65:
                swift_release();
                __swift_destroy_boxed_opaque_existential_1Tm(v42);
                __swift_destroy_boxed_opaque_existential_1Tm(v67);
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                OUTLINED_FUNCTION_223();
                __asm { BRAA            X1, X16 }
              }
              unint64_t v51 = *(void *)(v50 + 8 * v53);
              if (!v51)
              {
                while (1)
                {
                  uint64_t v44 = v53 + 1;
                  if (__OFADD__(v53, 1)) {
                    goto LABEL_69;
                  }
                  if (v44 >= v52) {
                    goto LABEL_65;
                  }
                  unint64_t v51 = *(void *)(v50 + 8 * v44);
                  ++v53;
                  if (v51) {
                    goto LABEL_55;
                  }
                }
              }
              uint64_t v44 = v53;
            }
          }
        }
      }
    }
LABEL_55:
    unint64_t v43 = (v51 - 1) & v51;
    uint64_t v46 = __clz(__rbit64(v51)) + (v44 << 6);
  }
  __swift_project_boxed_opaque_existential_1(v68, v0[15]);
  uint64_t v61 = (void *)swift_task_alloc();
  v0[31] = v61;
  void *v61 = v0;
  v61[1] = sub_25C5CF23C;
  OUTLINED_FUNCTION_223();
  return sub_25C5C3A48(v62, v63);
}

uint64_t sub_25C5CFA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v24[2] = a3;
  uint64_t v26 = sub_25C5EE4B0();
  uint64_t v5 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for DefaultEligibilityCriteria();
  os_log_type_t v31 = &off_2709C32F0;
  v29[0] = a2;
  uint64_t v28 = MEMORY[0x263F8EE78];
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    swift_retain();
    uint64_t v22 = MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v9 = (void (**)(char *, uint64_t))(v5 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  v24[1] = a1;
  uint64_t v10 = (unint64_t *)(a1 + 40);
  *(void *)&long long v11 = 136315138;
  long long v25 = v11;
  v24[3] = MEMORY[0x263F8EE58] + 8;
  do
  {
    uint64_t v13 = *(v10 - 1);
    unint64_t v12 = *v10;
    char v14 = __swift_project_boxed_opaque_existential_1(v29, v30);
    uint64_t v15 = *(void *)(*(void *)(*__swift_project_boxed_opaque_existential_1((void *)(*v14 + 16), *(void *)(*v14 + 40))+ 16)+ 16);
    swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C5B0114(v13, v12);
    if ((v16 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_9:
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_25C5EE4A0();
      os_log_type_t v19 = sub_25C5EE780();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        uint64_t v27 = v21;
        *(_DWORD *)uint64_t v20 = v25;
        swift_bridgeObjectRetain();
        *(void *)(v20 + 4) = sub_25C5CD724(v13, v12, &v27);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v18, v19, "SiriAutoCompleteIndexBuilder updateIndexForAppInstall:%s not able to get app metadata. Not updating index", (uint8_t *)v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v21, -1, -1);
        MEMORY[0x26118BA70](v20, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*v9)(v7, v26);
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25C5DE498();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = swift_retain();
    MEMORY[0x26118B000](v17);
    if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25C5EE6E0();
    }
    sub_25C5EE700();
    sub_25C5EE6D0();
    swift_release();
LABEL_13:
    v10 += 2;
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  uint64_t v22 = v28;
LABEL_16:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  return v22;
}

uint64_t sub_25C5CFE24()
{
  OUTLINED_FUNCTION_65();
  uint64_t v2 = v1;
  v0[23] = v3;
  v0[24] = v4;
  uint64_t v5 = sub_25C5EE4B0();
  v0[25] = v5;
  OUTLINED_FUNCTION_2(v5);
  v0[26] = v6;
  v0[27] = OUTLINED_FUNCTION_192();
  v0[13] = type metadata accessor for DefaultEligibilityCriteria();
  v0[14] = &off_2709C32F0;
  v0[10] = v2;
  swift_retain();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5CFED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_217();
  uint64_t v13 = v12[23];
  v12[28] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51F48]), sel_init);
  sub_25C5EE410();
  v12[20] = sub_25C5EE560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A0);
  uint64_t v14 = sub_25C5EE560();
  uint64_t v15 = *(void *)(v13 + 16);
  v12[29] = v15;
  if (v15)
  {
    type metadata accessor for DefaultLocaleProvider();
    swift_bridgeObjectRetain();
    uint64_t inited = swift_initStaticObject();
    v12[32] = 0;
    v12[33] = 0;
    v12[30] = inited;
    v12[31] = v14;
    uint64_t v17 = (void *)v12[28];
    uint64_t v18 = v12[23];
    v12[34] = *(void *)(v18 + 32);
    v12[35] = *(void *)(v18 + 40);
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_25C5EE570();
    v12[36] = v19;
    sub_25C5DB464();
    uint64_t v20 = sub_25C5EE570();
    v12[37] = v20;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_231();
    v12[2] = v21;
    v12[7] = v12 + 21;
    void v12[3] = sub_25C5D014C;
    uint64_t v22 = OUTLINED_FUNCTION_238();
    v12[15] = MEMORY[0x263EF8330];
    v12[16] = 0x40000000;
    v12[17] = sub_25C5CD5AC;
    v12[18] = &block_descriptor;
    v12[19] = v22;
    objc_msgSend(v17, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_, v19, v20, v12 + 15);
    OUTLINED_FUNCTION_54_0();
    return MEMORY[0x270FA23F0](v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12);
  }
  else
  {
    os_log_type_t v31 = (void *)v12[28];
    swift_bridgeObjectRelease();
    uint64_t v32 = OUTLINED_FUNCTION_236();
    sub_25C5B05D8(v32);
    OUTLINED_FUNCTION_234();

    sub_25C5C37C4(0);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v12 + 10));
    swift_task_dealloc();
    OUTLINED_FUNCTION_225();
    OUTLINED_FUNCTION_54_0();
    return v35(v33, v34, v35, v36, v37, v38, v39, v40, a9, a10, a11, a12);
  }
}

uint64_t sub_25C5D014C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 304) = v4;
  if (v4) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C5D0258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_217();
  unint64_t v13 = *(void *)(v12 + 168);
  uint64_t v14 = *(void **)(v12 + 288);

  if (v13 >> 62)
  {
    OUTLINED_FUNCTION_31_0();
    uint64_t v15 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v16 = *(void *)(v12 + 280);
  if (v15)
  {
    uint64_t v17 = *(void *)(v12 + 272);
    uint64_t v18 = *(void *)(v12 + 248);
    sub_25C5C37C4(*(void *)(v12 + 256));
    swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v12 + 176) = v18;
    unint64_t v19 = sub_25C5B0114(v17, v16);
    if (__OFADD__(*(void *)(v18 + 16), (v20 & 1) == 0))
    {
      __break(1u);
      goto LABEL_31;
    }
    unint64_t v21 = v19;
    char v22 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B95B0);
    char v23 = sub_25C5EE970();
    uint64_t v24 = *(void **)(v12 + 176);
    *(void *)(v12 + 312) = v24;
    if (v23)
    {
      unint64_t v25 = sub_25C5B0114(*(void *)(v12 + 272), *(void *)(v12 + 280));
      if ((v22 & 1) != (v26 & 1))
      {
        OUTLINED_FUNCTION_54_0();
        return sub_25C5EEAC0();
      }
      unint64_t v21 = v25;
    }
    swift_bridgeObjectRelease();
    uint64_t v53 = *(void *)(v12 + 280);
    if (v22)
    {
LABEL_25:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_25C5C535C(v13);
      swift_bridgeObjectRelease();
      uint64_t v59 = qword_26A5B9120;
      swift_bridgeObjectRetain();
      if (v59 == -1)
      {
LABEL_26:
        *(void *)(v12 + 320) = qword_26A5B98A0;
        type metadata accessor for DefaultSiriShortcutsEnablementProvider();
        swift_retain();
        swift_initStaticObject();
        __swift_project_boxed_opaque_existential_1((void *)(v12 + 80), *(void *)(v12 + 104));
        uint64_t v60 = OUTLINED_FUNCTION_120();
        uint64_t v61 = (void *)OUTLINED_FUNCTION_153(v60);
        void *v61 = v62;
        v61[1] = sub_25C5D0964;
        OUTLINED_FUNCTION_54_0();
        return v69(v63, v64, v65, v66, v67, v68, v69, v70, a9, a10, a11, a12);
      }
LABEL_31:
      swift_once();
      goto LABEL_26;
    }
    uint64_t v54 = *(void *)(v12 + 272);
    v24[(v21 >> 6) + 8] |= 1 << v21;
    uint64_t v55 = (void *)(v24[6] + 16 * v21);
    *uint64_t v55 = v54;
    v55[1] = v53;
    *(void *)(v24[7] + 8 * v21) = MEMORY[0x263F8EE78];
    uint64_t v56 = v24[2];
    uint64_t v57 = v56 + 1;
    BOOL v58 = __OFADD__(v56, 1);
    uint64_t v45 = swift_bridgeObjectRetain();
    if (!v58)
    {
      v24[2] = v57;
      goto LABEL_25;
    }
    __break(1u);
    return MEMORY[0x270FA23F0](v45, v46, v47, v48, v49, v50, v51, v52, a9, a10, a11, a12);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_193();
  if (!v30)
  {
    *(void *)(v12 + 264) = v29;
    OUTLINED_FUNCTION_92(v29);
    *(void *)(v12 + 288) = sub_25C5EE570();
    sub_25C5DB464();
    uint64_t v42 = sub_25C5EE570();
    OUTLINED_FUNCTION_221(v42);
    OUTLINED_FUNCTION_231();
    *(void *)(v12 + 16) = v43;
    *(void *)(v12 + 56) = v12 + 168;
    *(void *)(v12 + 24) = sub_25C5D014C;
    uint64_t v44 = OUTLINED_FUNCTION_238();
    *(void *)(v12 + 120) = MEMORY[0x263EF8330];
    *(void *)(v12 + 128) = 0x40000000;
    *(void *)(v12 + 136) = sub_25C5CD5AC;
    *(void *)(v12 + 144) = &block_descriptor;
    *(void *)(v12 + 152) = v44;
    OUTLINED_FUNCTION_200(v44, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_);
    OUTLINED_FUNCTION_54_0();
    return MEMORY[0x270FA23F0](v45, v46, v47, v48, v49, v50, v51, v52, a9, a10, a11, a12);
  }
  uint64_t v31 = *(void *)(v12 + 256);
  swift_bridgeObjectRelease();
  uint64_t v32 = *(void **)(v12 + 224);
  swift_bridgeObjectRelease();
  uint64_t v33 = OUTLINED_FUNCTION_236();
  sub_25C5B05D8(v33);
  OUTLINED_FUNCTION_234();

  sub_25C5C37C4(v31);
  __swift_destroy_boxed_opaque_existential_1Tm(v12 + 80);
  swift_task_dealloc();
  OUTLINED_FUNCTION_54_0();
  return v36(v34, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12);
}

uint64_t sub_25C5D06A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_217();
  uint64_t v14 = (void *)v12[37];
  unint64_t v13 = (void *)v12[38];
  uint64_t v15 = (void *)v12[36];
  swift_willThrow();

  sub_25C5EE490();
  id v16 = v13;
  id v17 = v13;
  uint64_t v18 = sub_25C5EE4A0();
  os_log_type_t v19 = sub_25C5EE790();
  BOOL v20 = OUTLINED_FUNCTION_157(v19);
  unint64_t v21 = (void *)v12[38];
  if (v20)
  {
    uint64_t v22 = OUTLINED_FUNCTION_3_3();
    char v23 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 138412290;
    id v24 = v21;
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v22 + 4) = v25;
    void *v23 = v25;

    _os_log_impl(&dword_25C5AA000, v18, (os_log_type_t)v14, "Unexpected error when attempting to fetch shortcuts via LNAutoShortcutsProvider. Error: %@", (uint8_t *)v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B91F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
  }
  else
  {
  }
  (*(void (**)(void, void))(v12[26] + 8))(v12[27], v12[25]);
  OUTLINED_FUNCTION_193();
  if (v27)
  {
    uint64_t v28 = v12[32];
    swift_bridgeObjectRelease();
    uint64_t v29 = (void *)v12[28];
    swift_bridgeObjectRelease();
    uint64_t v30 = OUTLINED_FUNCTION_236();
    sub_25C5B05D8(v30);
    OUTLINED_FUNCTION_234();

    sub_25C5C37C4(v28);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v12 + 10));
    swift_task_dealloc();
    OUTLINED_FUNCTION_54_0();
    return v33(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12);
  }
  else
  {
    v12[33] = v26;
    OUTLINED_FUNCTION_92(v26);
    v12[36] = sub_25C5EE570();
    sub_25C5DB464();
    uint64_t v40 = sub_25C5EE570();
    OUTLINED_FUNCTION_221(v40);
    OUTLINED_FUNCTION_231();
    v12[2] = v41;
    v12[7] = v12 + 21;
    void v12[3] = sub_25C5D014C;
    uint64_t v42 = OUTLINED_FUNCTION_238();
    v12[15] = MEMORY[0x263EF8330];
    v12[16] = 0x40000000;
    v12[17] = sub_25C5CD5AC;
    v12[18] = &block_descriptor;
    v12[19] = v42;
    OUTLINED_FUNCTION_200(v42, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_);
    OUTLINED_FUNCTION_54_0();
    return MEMORY[0x270FA23F0](v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12);
  }
}

uint64_t sub_25C5D0964()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C5D0A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_147();
  OUTLINED_FUNCTION_217();
  uint64_t v13 = v12[39];
  OUTLINED_FUNCTION_193();
  if (v15)
  {
    swift_bridgeObjectRelease();
    id v16 = (void *)v12[28];
    swift_bridgeObjectRelease();
    uint64_t v17 = OUTLINED_FUNCTION_236();
    sub_25C5B05D8(v17);
    OUTLINED_FUNCTION_234();

    sub_25C5C37C4((uint64_t)sub_25C5CD628);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v12 + 10));
    swift_task_dealloc();
    OUTLINED_FUNCTION_225();
    OUTLINED_FUNCTION_54_0();
    return v20(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12);
  }
  else
  {
    v12[32] = sub_25C5CD628;
    v12[33] = v14;
    v12[31] = v13;
    OUTLINED_FUNCTION_92(v14);
    v12[36] = sub_25C5EE570();
    sub_25C5DB464();
    uint64_t v27 = sub_25C5EE570();
    OUTLINED_FUNCTION_221(v27);
    OUTLINED_FUNCTION_231();
    v12[2] = v28;
    v12[7] = v12 + 21;
    void v12[3] = sub_25C5D014C;
    uint64_t v29 = OUTLINED_FUNCTION_238();
    v12[15] = MEMORY[0x263EF8330];
    v12[16] = 0x40000000;
    v12[17] = sub_25C5CD5AC;
    v12[18] = &block_descriptor;
    v12[19] = v29;
    OUTLINED_FUNCTION_200(v29, sel_autoShortcutsForBundleIdentifier_localeIdentifier_completion_);
    OUTLINED_FUNCTION_54_0();
    return MEMORY[0x270FA23F0](v30, v31, v32, v33, v34, v35, v36, v37, a9, a10, a11, a12);
  }
}

uint64_t method lookup function for SiriAutoCompleteIndexBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriAutoCompleteIndexBuilder);
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.updateIndexForAppInstall(bundleIds:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_227();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_145(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C5D0D18;
  uint64_t v3 = OUTLINED_FUNCTION_224();
  return v4(v3);
}

uint64_t sub_25C5D0D18()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = OUTLINED_FUNCTION_204();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.deletePhrasesFromApp(bundleIds:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_227();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_145(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C5D0ECC;
  uint64_t v3 = OUTLINED_FUNCTION_224();
  return v4(v3);
}

uint64_t sub_25C5D0ECC()
{
  OUTLINED_FUNCTION_65();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_6();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.buildIndividualSources(sources:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_227();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_145(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C5D85D8;
  uint64_t v3 = OUTLINED_FUNCTION_224();
  return v4(v3);
}

uint64_t dispatch thunk of SiriAutoCompleteIndexBuilder.run(onStartUpEvent:)()
{
  OUTLINED_FUNCTION_76();
  uint64_t v2 = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v0 + 176) + **(int **)(*(void *)v0 + 176));
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_145(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_25C5D85D8;
  return v7(v2);
}

uint64_t sub_25C5D1184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5D11EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 456) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 40) = type metadata accessor for AppLaunchSource();
  *(void *)(v7 + 48) = &off_2709C3548;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D13D4, 0, 0);
}

uint64_t sub_25C5D13D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  uint64_t v12 = OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_212(v12);
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v11 + 288), *(void *)(v11 + 296), *(unsigned __int8 *)(v11 + 456), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  OUTLINED_FUNCTION_213();
  if (OUTLINED_FUNCTION_87())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = OUTLINED_FUNCTION_58_0();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_209(v13);
    *uint64_t v14 = v15;
    v14[1] = sub_25C5D157C;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v25 = OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_57_0(v25);
    uint64_t v26 = swift_task_alloc();
    OUTLINED_FUNCTION_216(v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v10 = v27;
    v10[1] = sub_25C5D1940;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v28, v29, v30, v31, v32, v33, v34, v35, a9, a10);
  }
}

uint64_t sub_25C5D157C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_211(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D1644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 400);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D1940()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D1A28()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C5D1AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_2_4();
  uint64_t v12 = swift_task_alloc();
  uint64_t v13 = (void *)OUTLINED_FUNCTION_126(v12);
  *uint64_t v13 = v14;
  v13[1] = sub_25C5D1B88;
  uint64_t v15 = OUTLINED_FUNCTION_21_0();
  return MEMORY[0x270F642B0](v15, v16, v17, v18, v19, v20, v21, v22, a9, a10, a11, a12);
}

uint64_t sub_25C5D1B88()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_210(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D1C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

#error "25C5D2014: call analysis failed (funcsize=233)"

uint64_t sub_25C5D2304()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_142();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_140(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C5D85DC;
  uint64_t v3 = OUTLINED_FUNCTION_109();
  return sub_25C5CCA7C(v3, v4, v5);
}

uint64_t type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo()
{
  uint64_t result = qword_26A5B95D0;
  if (!qword_26A5B95D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5D23DC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_23_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C5D2430(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_23_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C5D248C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C5D24E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5D254C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 456) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 40) = type metadata accessor for AppIntentTranscriptSource();
  *(void *)(v7 + 48) = &off_2709C3198;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D2734, 0, 0);
}

uint64_t sub_25C5D2734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  uint64_t v12 = OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_212(v12);
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v11 + 288), *(void *)(v11 + 296), *(unsigned __int8 *)(v11 + 456), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  OUTLINED_FUNCTION_213();
  if (OUTLINED_FUNCTION_87())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = OUTLINED_FUNCTION_58_0();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_209(v13);
    *uint64_t v14 = v15;
    v14[1] = sub_25C5D28DC;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v25 = OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_57_0(v25);
    uint64_t v26 = swift_task_alloc();
    OUTLINED_FUNCTION_216(v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v10 = v27;
    v10[1] = sub_25C5D2CA0;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v28, v29, v30, v31, v32, v33, v34, v35, a9, a10);
  }
}

uint64_t sub_25C5D28DC()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_211(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D29A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 400);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D2CA0()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D2D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t objectdestroyTm()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_25C5D30C8()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_142();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_140(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_25C5D3158;
  uint64_t v3 = OUTLINED_FUNCTION_109();
  return sub_25C5CCA7C(v3, v4, v5);
}

uint64_t sub_25C5D3158()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_25C5D3220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 456) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 40) = type metadata accessor for AssistantIntentExamplePhrasesSource();
  *(void *)(v7 + 48) = &off_2709C2CF8;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D3408, 0, 0);
}

uint64_t sub_25C5D3408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  uint64_t v12 = OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_212(v12);
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v11 + 288), *(void *)(v11 + 296), *(unsigned __int8 *)(v11 + 456), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  OUTLINED_FUNCTION_213();
  if (OUTLINED_FUNCTION_87())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = OUTLINED_FUNCTION_58_0();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_209(v13);
    *uint64_t v14 = v15;
    v14[1] = sub_25C5D35B0;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v25 = OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_57_0(v25);
    uint64_t v26 = swift_task_alloc();
    OUTLINED_FUNCTION_216(v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v10 = v27;
    v10[1] = sub_25C5D3974;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v28, v29, v30, v31, v32, v33, v34, v35, a9, a10);
  }
}

uint64_t sub_25C5D35B0()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_211(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D3678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 400);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D3974()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D3A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D3D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 456) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 40) = type metadata accessor for AppShortcutsSource();
  *(void *)(v7 + 48) = &off_2709C3738;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D3F44, 0, 0);
}

uint64_t sub_25C5D3F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  uint64_t v12 = OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_212(v12);
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v11 + 288), *(void *)(v11 + 296), *(unsigned __int8 *)(v11 + 456), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  OUTLINED_FUNCTION_213();
  if (OUTLINED_FUNCTION_87())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = OUTLINED_FUNCTION_58_0();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_209(v13);
    *uint64_t v14 = v15;
    v14[1] = sub_25C5D40EC;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v25 = OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_57_0(v25);
    uint64_t v26 = swift_task_alloc();
    OUTLINED_FUNCTION_216(v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v10 = v27;
    v10[1] = sub_25C5D44B0;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v28, v29, v30, v31, v32, v33, v34, v35, a9, a10);
  }
}

uint64_t sub_25C5D40EC()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_211(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D41B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 400);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D4598;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D44B0()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D4598()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C5D4664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_2_4();
  uint64_t v12 = swift_task_alloc();
  uint64_t v13 = (void *)OUTLINED_FUNCTION_126(v12);
  *uint64_t v13 = v14;
  v13[1] = sub_25C5D46F8;
  uint64_t v15 = OUTLINED_FUNCTION_21_0();
  return MEMORY[0x270F642B0](v15, v16, v17, v18, v19, v20, v21, v22, a9, a10, a11, a12);
}

uint64_t sub_25C5D46F8()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_210(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D47C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v15 = *(void *)(v14 + 376);
  OUTLINED_FUNCTION_230();
  v16(v15);
  OUTLINED_FUNCTION_222();
  __swift_destroy_boxed_opaque_existential_1Tm(v14 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v14 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_17_0();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D4898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D4598;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

#error "25C5D4C5C: call analysis failed (funcsize=233)"

uint64_t sub_25C5D4F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 456) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 40) = type metadata accessor for VoiceShortcutSource();
  *(void *)(v7 + 48) = &off_2709C3528;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D5134, 0, 0);
}

uint64_t sub_25C5D5134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  uint64_t v12 = OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_212(v12);
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v11 + 288), *(void *)(v11 + 296), *(unsigned __int8 *)(v11 + 456), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  OUTLINED_FUNCTION_213();
  if (OUTLINED_FUNCTION_87())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = OUTLINED_FUNCTION_58_0();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_209(v13);
    *uint64_t v14 = v15;
    v14[1] = sub_25C5D52DC;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v25 = OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_57_0(v25);
    uint64_t v26 = swift_task_alloc();
    OUTLINED_FUNCTION_216(v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v10 = v27;
    v10[1] = sub_25C5D56A0;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v28, v29, v30, v31, v32, v33, v34, v35, a9, a10);
  }
}

uint64_t sub_25C5D52DC()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_211(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D53A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 400);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D56A0()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D5788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D5A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 456) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 40) = type metadata accessor for StaticSuggestionsSource();
  *(void *)(v7 + 48) = &off_2709C3758;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D5C70, 0, 0);
}

uint64_t sub_25C5D5C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  uint64_t v12 = OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_212(v12);
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v11 + 288), *(void *)(v11 + 296), *(unsigned __int8 *)(v11 + 456), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  OUTLINED_FUNCTION_213();
  if (OUTLINED_FUNCTION_87())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = OUTLINED_FUNCTION_58_0();
    uint64_t v14 = (void *)OUTLINED_FUNCTION_209(v13);
    *uint64_t v14 = v15;
    v14[1] = sub_25C5D5E18;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v18(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v25 = OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_57_0(v25);
    uint64_t v26 = swift_task_alloc();
    OUTLINED_FUNCTION_216(v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v10 = v27;
    v10[1] = sub_25C5D61DC;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v28, v29, v30, v31, v32, v33, v34, v35, a9, a10);
  }
}

uint64_t sub_25C5D5E18()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  OUTLINED_FUNCTION_211(v3);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D5EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 400);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D61DC()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 424) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D62C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_143(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D1A28;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D65C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(unsigned char *)(v7 + 464) = a6;
  *(void *)(v7 + 296) = a5;
  *(void *)(v7 + 304) = a7;
  *(void *)(v7 + 280) = a2;
  *(void *)(v7 + 288) = a4;
  uint64_t v10 = sub_25C5EE4B0();
  *(void *)(v7 + 312) = v10;
  *(void *)(v7 + 320) = *(void *)(v10 - 8);
  *(void *)(v7 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9518);
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  uint64_t v11 = sub_25C5EE480();
  *(void *)(v7 + 360) = v11;
  *(void *)(v7 + 368) = *(void *)(v11 - 8);
  *(void *)(v7 + 376) = swift_task_alloc();
  uint64_t v12 = type metadata accessor for SiriKitIntentSource();
  *(void *)(v7 + 384) = v12;
  *(void *)(v7 + 40) = v12;
  *(void *)(v7 + 48) = &off_2709C2BB8;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 80) = type metadata accessor for DefaultEligibilityCriteria();
  *(void *)(v7 + 88) = &off_2709C32F0;
  *(void *)(v7 + 56) = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5D67AC, 0, 0);
}

uint64_t sub_25C5D67AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_151();
  *(void *)(v10 + 392) = OUTLINED_FUNCTION_108();
  if (qword_26A5B9150 != -1) {
    swift_once();
  }
  uint64_t v12 = *(long long **)(v10 + 384);
  OUTLINED_FUNCTION_160(qword_26A5B98B8, *(void *)(v10 + 288), *(void *)(v10 + 296), *(unsigned __int8 *)(v10 + 464), (uint64_t)"enableTelemetry=YES");
  OUTLINED_FUNCTION_178();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9520);
  if (swift_dynamicCast())
  {
    swift_release();
    OUTLINED_FUNCTION_185();
    uint64_t v13 = (void *)OUTLINED_FUNCTION_58_0();
    *(void *)(v10 + 400) = v13;
    *uint64_t v13 = v10;
    v13[1] = sub_25C5D6990;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_75();
    return v16(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10);
  }
  else
  {
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_206();
    uint64_t v23 = OUTLINED_FUNCTION_184();
    *(void *)(v10 + 416) = v23;
    sub_25C5B4420(v11, v23 + 16);
    sub_25C5B4420(v12, v23 + 56);
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v10 + 424) = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9538);
    OUTLINED_FUNCTION_133();
    *uint64_t v24 = v25;
    v24[1] = sub_25C5D6D5C;
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_75();
    return MEMORY[0x270F72A38](v26, v27, v28, v29, v30, v31, v32, v33, a9, a10);
  }
}

uint64_t sub_25C5D6990()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 408) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D6A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 408);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_126(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D6E44;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D6D5C()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v6 = v5;
  *(void *)(v3 + 432) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_release();
  }
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_25C5D6E44()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_25C5D6F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_2_4();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v12 + 448) = v13;
  *uint64_t v13 = v12;
  v13[1] = sub_25C5D6FA8;
  uint64_t v14 = OUTLINED_FUNCTION_21_0();
  return MEMORY[0x270F642B0](v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
}

uint64_t sub_25C5D6FA8()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 456) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5D7078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v15 = *(void *)(v14 + 376);
  OUTLINED_FUNCTION_230();
  v16(v15);
  OUTLINED_FUNCTION_222();
  __swift_destroy_boxed_opaque_existential_1Tm(v14 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v14 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_17_0();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_25C5D7150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_110();
  uint64_t v19 = *(void *)(v15 + 256);
  OUTLINED_FUNCTION_130();
  if (v20)
  {
    OUTLINED_FUNCTION_31_0();
    sub_25C5EE9B0();
    uint64_t v21 = OUTLINED_FUNCTION_131();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v30 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_128();
  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_47;
  }
  OUTLINED_FUNCTION_42_0();
  do
  {
    if (v17) {
      OUTLINED_FUNCTION_129();
    }
    else {
      OUTLINED_FUNCTION_60_0();
    }
    OUTLINED_FUNCTION_123();
    if (!v29) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_122())
    {
      swift_release();
    }
    else
    {
      sub_25C5EE8D0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_59_0();
      sub_25C5EE8E0();
    }
    OUTLINED_FUNCTION_125();
  }
  while (!v29);
  uint64_t v30 = a11;
LABEL_18:
  swift_bridgeObjectRelease();
  if (v30 < 0 || (v30 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v21 = sub_25C5EE9B0();
    uint64_t v19 = v21;
    if (v21)
    {
LABEL_21:
      if (v19 >= 1)
      {
        OUTLINED_FUNCTION_41_0();
        do
        {
          if (a10) {
            OUTLINED_FUNCTION_56_0();
          }
          else {
            OUTLINED_FUNCTION_35_0();
          }
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v32 && (OUTLINED_FUNCTION_32_0(v31), (v33 & 1) != 0))
          {
            OUTLINED_FUNCTION_15_0();
            OUTLINED_FUNCTION_13_1();
            OUTLINED_FUNCTION_43_0(*(void *)(v34 + 72));
            uint64_t v35 = OUTLINED_FUNCTION_93();
          }
          else
          {
            type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
            uint64_t v35 = OUTLINED_FUNCTION_38_0();
          }
          OUTLINED_FUNCTION_96(v35, v36);
          OUTLINED_FUNCTION_89();
          type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
          uint64_t v37 = OUTLINED_FUNCTION_4_4();
          if (v29) {
            sub_25C5D23DC(v37, &qword_26A5B9518);
          }
          else {
            sub_25C5D248C(v37);
          }
          OUTLINED_FUNCTION_94();
          sub_25C5EE3C0();
          OUTLINED_FUNCTION_33_0();
          if (v39 && (uint64_t v38 = OUTLINED_FUNCTION_32_0(v38), (v40 & 1) != 0))
          {
            OUTLINED_FUNCTION_9_2();
            uint64_t v38 = sub_25C5D24E8(v43 + *(void *)(v41 + 72) * v42, v44);
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = 1;
          }
          OUTLINED_FUNCTION_6_2(v38, v45);
          OUTLINED_FUNCTION_7_3();
          if (v29)
          {
            sub_25C5D23DC(v18, &qword_26A5B9518);
            uint64_t v46 = sub_25C5EDF30();
            OUTLINED_FUNCTION_12_2(v46);
          }
          else
          {
            uint64_t v47 = OUTLINED_FUNCTION_37_0();
            sub_25C5D2430(v47, v48, &qword_26B350FF0);
            sub_25C5D248C(v18);
          }
          OUTLINED_FUNCTION_34_0();
          swift_release();
        }
        while (v19 != v16);
        goto LABEL_41;
      }
LABEL_47:
      __break(1u);
      return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    uint64_t v21 = OUTLINED_FUNCTION_90();
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_41:
  OUTLINED_FUNCTION_88();
  sub_25C5EE470();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_95();
  swift_release();
  OUTLINED_FUNCTION_86();
  swift_release();
  OUTLINED_FUNCTION_2_4();
  uint64_t v49 = swift_task_alloc();
  uint64_t v50 = (void *)OUTLINED_FUNCTION_126(v49);
  *uint64_t v50 = v51;
  v50[1] = sub_25C5D6E44;
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270F642C0](v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

#error "25C5D7540: call analysis failed (funcsize=251)"

uint64_t sub_25C5D7848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)(a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider);
  v8[3] = type metadata accessor for DefaultLocaleProvider();
  v8[4] = &off_2709C3518;
  *uint64_t v8 = a1;
  uint64_t v9 = (void *)(a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider);
  v9[3] = type metadata accessor for DefaultDeviceTypeProvider();
  v9[4] = &off_2709C3508;
  void *v9 = a2;
  uint64_t v10 = (void *)(a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_appFinderProvider);
  v10[3] = type metadata accessor for DefaultAppFinderForIntentProvider();
  v10[4] = &off_2709C34F8;
  *uint64_t v10 = a3;
  uint64_t v11 = a4 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_source;
  uint64_t v12 = *MEMORY[0x263F6CCD0];
  uint64_t v13 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  return a4;
}

uint64_t sub_25C5D7958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = type metadata accessor for DefaultLocaleProvider();
  uint64_t v30 = &off_2709C3518;
  v28[0] = a1;
  uint64_t v26 = type metadata accessor for DefaultDeviceTypeProvider();
  uint64_t v27 = &off_2709C3508;
  v25[0] = a2;
  uint64_t v23 = type metadata accessor for DefaultAppFinderForIntentProvider();
  uint64_t v24 = &off_2709C34F8;
  v22[0] = a3;
  type metadata accessor for StaticSuggestionsSource();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (void *)((char *)&v22[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void *)((char *)&v22[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (void *)((char *)&v22[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  uint64_t v19 = sub_25C5D7848(*v9, *v13, *v17, v6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return v19;
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

uint64_t sub_25C5D7C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5D7CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5D7D14(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25C5D7D64()
{
  unint64_t result = qword_26B3510B0;
  if (!qword_26B3510B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B3510B0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return OUTLINED_FUNCTION_208();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_25C5D7DF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_25C5EDF30();
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
      memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
      __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_25C5D7F18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25C5EDF30();
  uint64_t result = __swift_getEnumTagSinglePayload(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(v2, v3);
  }
  return result;
}

void *sub_25C5D7FA4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25C5EDF30();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

void *sub_25C5D807C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25C5EDF30();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7);
  int v9 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (!EnumTagSinglePayload)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  return a1;
}

void *sub_25C5D81DC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25C5EDF30();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

void *sub_25C5D82B4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25C5EDF30();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7);
  int v9 = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
  if (!EnumTagSinglePayload)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  return a1;
}

uint64_t sub_25C5D8414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C5D8428);
}

uint64_t sub_25C5D8428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);

  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t sub_25C5D8478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C5D848C);
}

uint64_t sub_25C5D848C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);

  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

void sub_25C5D84E0()
{
  sub_25C5D857C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25C5D857C()
{
  if (!qword_26A5B95E0)
  {
    sub_25C5EDF30();
    unint64_t v0 = sub_25C5EE7D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5B95E0);
    }
  }
}

void *OUTLINED_FUNCTION_2_4()
{
  return __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 304) + 16), *(void *)(*(void *)(v0 + 304) + 40));
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return *(void *)(v0 + 208);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  __swift_getEnumTagSinglePayload(v0, 1, v2);
  return *(void *)(v1 + 352);
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t a1, uint64_t a2)
{
  __swift_storeEnumTagSinglePayload(*(void *)(v2 + 344), a2, 1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  *(void *)(v18 - 80) = a1;
  *uint64_t v17 = a17;
  return sub_25C5EEB60();
}

uint64_t OUTLINED_FUNCTION_12_2(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return *(void *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return type metadata accessor for SiriAutoCompleteIndexBuilder.TapCountInfo();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  *(void *)(v0 + 256) = v1;
  return *(void *)(v0 + 120);
}

uint64_t OUTLINED_FUNCTION_19@<X0>(uint64_t a1@<X8>)
{
  v1[30] = *(void *)(v3 - 96);
  v1[31] = a1;
  uint64_t v5 = *(void *)(v3 - 88);
  v1[28] = v2;
  v1[29] = v5;
  return sub_25C5EE310();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return *(void *)(v0 + 376);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_24_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_26_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_28_0(float a1)
{
  *uint64_t v1 = a1;
  uint64_t v4 = *(void *)(v3 + 160);
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(v2, v4);
  return MEMORY[0x270FA0330](v5, v4, 1);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_25C5B4254(v0, v1 + 216);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  return sub_25C5B0114(a1, v1);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v2 = *(void *)(v0 + 336);
  return MEMORY[0x270F64378](v2);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return v1 + *(int *)(v0 + 20);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39_0(float a1)
{
  *uint64_t v1 = a1;
  return sub_25C5EEB60();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_43_0@<X0>(uint64_t a1@<X8>)
{
  return sub_25C5D24E8(v2 + a1 * v3, v1);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_25C5EE900();
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_0(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  *(void *)(v18 - 80) = a1;
  *uint64_t v17 = a17;
  return sub_25C5EEB60();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return v0;
}

void OUTLINED_FUNCTION_56_0()
{
  JUMPOUT(0x26118B200);
}

uint64_t OUTLINED_FUNCTION_57_0(uint64_t a1)
{
  *(void *)(v1 + 408) = a1;
  sub_25C5B4420(v2, a1 + 16);
  return sub_25C5B4420(v3, a1 + 56);
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return sub_25C5EE910();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return sub_25C5EEB60();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_66_0(uint64_t a1)
{
  *(void *)(v1 + 272) = a1;
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return *(void *)(v0 + 136);
}

uint64_t OUTLINED_FUNCTION_68_0(uint64_t a1, unint64_t a2)
{
  return sub_25C5CD724(a1, a2, (uint64_t *)(v2 - 80));
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return *(void *)(v0 + 208);
}

uint64_t OUTLINED_FUNCTION_73()
{
  return *(void *)(v0 + 208);
}

void OUTLINED_FUNCTION_77()
{
  uint64_t v2 = *(void **)(v1 + 424);
  __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_79()
{
  return sub_25C5EE910();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return *(void *)(v0 + 120);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return MEMORY[0x270F643D8](v0);
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_85(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return MEMORY[0x270F643E0]();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_91(uint64_t a1)
{
  *(void *)(v1 + 4) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_92@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[23] + 16 * a1;
  v1[34] = *(void *)(v3 + 32);
  v1[35] = *(void *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_94()
{
  return MEMORY[0x270F643B0](v0);
}

uint64_t OUTLINED_FUNCTION_95()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_96(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_97(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return a12;
}

uint64_t OUTLINED_FUNCTION_99()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_100@<X0>(uint64_t a1@<X8>)
{
  return sub_25C5D24E8(v2 + a1 * v3, v1);
}

uint64_t OUTLINED_FUNCTION_101()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_103()
{
  return sub_25C5EE900();
}

double OUTLINED_FUNCTION_104()
{
  return v0;
}

void OUTLINED_FUNCTION_105()
{
  *(_WORD *)(v0 + 12) = 2048;
  *(void *)(v0 + 14) = v1;
}

void OUTLINED_FUNCTION_106(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_WORD *)(v16 + 12) = 2048;
  *(void *)(v16 + 14) = a16;
}

uint64_t OUTLINED_FUNCTION_107()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_108()
{
  return sub_25C5EE440();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_112()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_115()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_116(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_118()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_119()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_120()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_122()
{
  return sub_25C5B6D48();
}

BOOL OUTLINED_FUNCTION_124(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_126(uint64_t result)
{
  *(void *)(v1 + 440) = result;
  return result;
}

void OUTLINED_FUNCTION_127(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

void OUTLINED_FUNCTION_129()
{
  JUMPOUT(0x26118B200);
}

uint64_t OUTLINED_FUNCTION_131()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_132()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_135()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return sub_25C5EE490();
}

uint64_t OUTLINED_FUNCTION_137()
{
  return sub_25C5EE490();
}

uint64_t OUTLINED_FUNCTION_140(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_141()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_143(uint64_t result)
{
  *(void *)(v1 + 432) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_145(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_146()
{
  return swift_task_alloc();
}

void *OUTLINED_FUNCTION_149()
{
  return __swift_project_boxed_opaque_existential_1(v0, *(void *)(v1 + 40));
}

void *OUTLINED_FUNCTION_150()
{
  return __swift_project_boxed_opaque_existential_1(v0, *(void *)(v1 + 80));
}

uint64_t OUTLINED_FUNCTION_152(uint64_t result)
{
  *(void *)(v1 + 344) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_153(uint64_t result)
{
  *(void *)(v1 + 328) = result;
  return result;
}

void OUTLINED_FUNCTION_155()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_156()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_157(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_158()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F643C8](a1, a2, a3, a4, a5, 19, 2);
}

uint64_t OUTLINED_FUNCTION_162(uint64_t result)
{
  *(void *)(v1 + 264) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_163(uint64_t result)
{
  *(void *)(v1 + 280) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_164(uint64_t result)
{
  *(void *)(v1 + 296) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_165(uint64_t result)
{
  *(void *)(v1 + 312) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_166(uint64_t result)
{
  *(void *)(v1 + 360) = result;
  return result;
}

void OUTLINED_FUNCTION_174(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

uint64_t OUTLINED_FUNCTION_175()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_176()
{
  *(_WORD *)(v0 + 12) = 2048;
  return sub_25C5EE320();
}

uint64_t OUTLINED_FUNCTION_177()
{
  return *(void *)(v0 + 96);
}

uint64_t OUTLINED_FUNCTION_178()
{
  return sub_25C5B4254(v0, v1);
}

uint64_t OUTLINED_FUNCTION_179()
{
  return sub_25C5B6D48();
}

uint64_t OUTLINED_FUNCTION_183()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_184()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_186(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return a15;
}

uint64_t OUTLINED_FUNCTION_187()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_189(uint64_t a1, unint64_t a2)
{
  return sub_25C5CD724(a1, a2, (uint64_t *)(v2 - 80));
}

void OUTLINED_FUNCTION_190(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_192()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_194(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  return sub_25C5CD724(a1, a2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_196(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_197()
{
  return sub_25C5B4254(v0, v1);
}

uint64_t OUTLINED_FUNCTION_198(uint64_t a1)
{
  *(void *)(v1 + 4) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_199(uint64_t a1)
{
  *(void *)(v2 + 152) = a1;
  return sub_25C5C56EC(v1);
}

id OUTLINED_FUNCTION_200(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v4, v5, v2);
}

uint64_t OUTLINED_FUNCTION_201()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_204()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_205()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_206()
{
  return sub_25C5B4254(v0, v1);
}

uint64_t OUTLINED_FUNCTION_207()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_208()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_209(uint64_t result)
{
  *(void *)(v1 + 392) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_210(uint64_t a1)
{
  *(void *)(v1 + 448) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_211(uint64_t a1)
{
  *(void *)(v1 + 400) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_212(uint64_t result)
{
  *(void *)(v1 + 384) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_213()
{
  return type metadata accessor for SiriKitIntentSource();
}

uint64_t OUTLINED_FUNCTION_216(uint64_t result)
{
  *(void *)(v1 + 416) = result;
  return result;
}

BOOL OUTLINED_FUNCTION_219(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_220()
{
  return *(void *)(v0 + 208);
}

uint64_t OUTLINED_FUNCTION_221(uint64_t a1)
{
  *(void *)(v1 + 296) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_222()
{
  return sub_25C5EE420();
}

uint64_t OUTLINED_FUNCTION_224()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_225()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_226(float a1)
{
  *uint64_t v1 = a1;
  return sub_25C5EEB60();
}

uint64_t OUTLINED_FUNCTION_228@<X0>(uint64_t a1@<X8>)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 72), *(void *)(a1 + 96));
  return sub_25C5EE240();
}

void *OUTLINED_FUNCTION_229@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 240) = *(void *)(*(void *)(a1 + 56) + 8 * a2);
  return __swift_project_boxed_opaque_existential_1(v3, *(void *)(v2 + 40));
}

uint64_t OUTLINED_FUNCTION_234()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_235(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(_WORD *)(v20 + 12) = 2048;
  *(void *)(v20 + 14) = a20;
}

uint64_t OUTLINED_FUNCTION_236()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_238()
{
  return swift_continuation_init();
}

uint64_t sub_25C5D9BA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C5D9BB8()
{
  uint64_t v8 = sub_25C5EE560();
  id v0 = objc_msgSend(self, sel_enumeratorWithOptions_, 0);
  aBlock[4] = sub_25C5D9D38;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25C5AC988;
  aBlock[3] = &block_descriptor_4;
  uint64_t v1 = _Block_copy(aBlock);
  objc_msgSend(v0, sel_setFilter_, v1);
  _Block_release(v1);
  id v2 = objc_msgSend(v0, sel_nextObject);
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 1001;
    while (--v4)
    {
      uint64_t v5 = (void *)MEMORY[0x26118B520]();
      sub_25C5D9D84(v3, (uint64_t)&v8);

      id v3 = objc_msgSend(v0, sel_nextObject);
      if (!v3) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:

  return v8;
}

id sub_25C5D9D38(void *a1)
{
  id v1 = objc_msgSend(a1, sel_applicationState);
  id v2 = objc_msgSend(v1, sel_isInstalled);

  return v2;
}

uint64_t sub_25C5D9D84(void *a1, uint64_t a2)
{
  uint64_t v115 = a2;
  uint64_t v4 = sub_25C5EE4B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v109 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v109 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v116 = (char *)&v109 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v117 = (char *)&v109 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v118 = (char *)&v109 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v119 = (char *)&v109 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v109 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v109 - v26;
  uint64_t result = sub_25C5DB17C(a1);
  if (!v29) {
    return result;
  }
  uint64_t v111 = v8;
  uint64_t v112 = v14;
  uint64_t v110 = v11;
  uint64_t v114 = result;
  unint64_t v121 = v29;
  uint64_t v30 = sub_25C5DB1E0(objc_msgSend(a1, sel_compatibilityObject));
  uint64_t v32 = v31;
  uint64_t v33 = sub_25C5EE580();
  uint64_t v120 = v4;
  if (v32)
  {
    if (v30 == v33 && v32 == v34) {
      goto LABEL_17;
    }
    char v36 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_18;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v37 = sub_25C5EE580();
  if (!v32)
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  if (v30 == v37 && v32 == v38)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    swift_bridgeObjectRelease();
LABEL_19:
    sub_25C5EE490();
    unint64_t v41 = v121;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_25C5EE4A0();
    os_log_type_t v43 = sub_25C5EE780();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v113 = v2;
      uint64_t v45 = (uint8_t *)v44;
      uint64_t v46 = swift_slowAlloc();
      uint64_t v123 = (char *)v46;
      *(_DWORD *)uint64_t v45 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v122 = sub_25C5CD724(v114, v41, (uint64_t *)&v123);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v42, v43, "Application %s is internal type or is hidden app type. Not indexing", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v46, -1, -1);
      MEMORY[0x26118BA70](v45, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v27, v120);
    }
LABEL_21:

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v27, v120);
  }
  char v40 = sub_25C5EEA80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v40) {
    goto LABEL_19;
  }
LABEL_24:
  id v47 = objc_msgSend(a1, sel_appTags);
  uint64_t v48 = sub_25C5EE6B0();

  uint64_t v49 = *(void *)(v48 + 16);
  if (!v49)
  {
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  uint64_t v109 = v5;
  uint64_t v113 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v50 = sub_25C5EE640();
  uint64_t result = swift_bridgeObjectRelease();
  if (v50)
  {
LABEL_26:
    swift_bridgeObjectRelease_n();
    sub_25C5EE490();
    unint64_t v51 = v121;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_25C5EE4A0();
    os_log_type_t v53 = sub_25C5EE780();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v123 = (char *)v55;
      *(_DWORD *)uint64_t v54 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v122 = sub_25C5CD724(v114, v51, (uint64_t *)&v123);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v52, v53, "iOS Application %s has hidden tag. Not indexing", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v55, -1, -1);
      MEMORY[0x26118BA70](v54, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v25, v120);
  }
  if (v49 == 1)
  {
LABEL_34:
    swift_bridgeObjectRelease_n();
    uint64_t v5 = v109;
LABEL_35:
    unsigned __int8 v60 = objc_msgSend(a1, sel_isLaunchProhibited);
    unint64_t v61 = v121;
    if (v60)
    {
      uint64_t v27 = v119;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25C5EE4A0();
      os_log_type_t v62 = sub_25C5EE780();
      if (os_log_type_enabled(v42, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        uint64_t v123 = (char *)v64;
        *(_DWORD *)uint64_t v63 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_25C5CD724(v114, v61, (uint64_t *)&v123);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v42, v62, "iOS Application %s has launch prohibited. Not indexing", v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v64, -1, -1);
        MEMORY[0x26118BA70](v63, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v119, v120);
      }
      goto LABEL_21;
    }
    id v65 = objc_msgSend(a1, sel_appClipMetadata);

    if (v65)
    {
      uint64_t v27 = v118;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25C5EE4A0();
      os_log_type_t v66 = sub_25C5EE780();
      if (os_log_type_enabled(v42, v66))
      {
        uint64_t v67 = (uint8_t *)swift_slowAlloc();
        uint64_t v68 = swift_slowAlloc();
        uint64_t v123 = (char *)v68;
        *(_DWORD *)uint64_t v67 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_25C5CD724(v114, v61, (uint64_t *)&v123);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v42, v66, "iOS Application %s is an appClipMetadata. Not indexing", v67, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v68, -1, -1);
        MEMORY[0x26118BA70](v67, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v118, v120);
      }
      goto LABEL_21;
    }
    id v69 = objc_msgSend(a1, sel_applicationState);
    unsigned int v70 = objc_msgSend(v69, sel_isRestricted);

    if (v70)
    {
      uint64_t v27 = v117;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25C5EE4A0();
      os_log_type_t v71 = sub_25C5EE780();
      if (os_log_type_enabled(v42, v71))
      {
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        uint64_t v73 = swift_slowAlloc();
        uint64_t v123 = (char *)v73;
        *(_DWORD *)uint64_t v72 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_25C5CD724(v114, v61, (uint64_t *)&v123);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v42, v71, "Application %s is Restricted. Not indexing", v72, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v73, -1, -1);
        MEMORY[0x26118BA70](v72, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v117, v120);
      }
      goto LABEL_21;
    }
    uint64_t v74 = v114;
    if (sub_25C5EE640())
    {
      uint64_t v27 = v116;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_25C5EE4A0();
      os_log_type_t v75 = sub_25C5EE780();
      if (os_log_type_enabled(v42, v75))
      {
        os_log_type_t v76 = (uint8_t *)swift_slowAlloc();
        uint64_t v77 = swift_slowAlloc();
        uint64_t v123 = (char *)v77;
        *(_DWORD *)os_log_type_t v76 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_25C5CD724(v114, v61, (uint64_t *)&v123);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v42, v75, "Application %s is a webapp or webclips. Not indexing", v76, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v77, -1, -1);
        MEMORY[0x26118BA70](v76, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v116, v120);
      }
      goto LABEL_21;
    }
    type metadata accessor for DefaultInstalledAppProvider();
    if (sub_25C5DAEA8(v74, v61))
    {
      uint64_t v25 = v112;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_25C5EE4A0();
      os_log_type_t v79 = sub_25C5EE780();
      if (os_log_type_enabled(v78, v79))
      {
        unint64_t v80 = v61;
        uint64_t v109 = v5;
        uint64_t v81 = (uint8_t *)swift_slowAlloc();
        uint64_t v82 = swift_slowAlloc();
        uint64_t v123 = (char *)v82;
        *(_DWORD *)uint64_t v81 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_25C5CD724(v114, v80, (uint64_t *)&v123);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v78, v79, "Application %s is not launchable. Not indexing", v81, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v82, -1, -1);
        MEMORY[0x26118BA70](v81, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v25, v120);
      }
    }
    else
    {
      id v83 = objc_msgSend(self, sel_appInfoWithApplicationRecord_, a1);
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v109 = v5;
        swift_bridgeObjectRetain();
        uint64_t v85 = v74;
        id v86 = objc_msgSend(a1, sel_localizedName);
        uint64_t v87 = sub_25C5EE580();
        uint64_t v89 = v88;

        id v90 = objc_msgSend(v84, sel_supportedIntents);
        uint64_t v91 = sub_25C5EE730();

        sub_25C5CE064(v87, v89, v91, v85, v61);
        swift_bridgeObjectRelease();
        uint64_t v25 = v111;
        sub_25C5EE490();
        id v92 = a1;
        swift_bridgeObjectRetain();
        id v93 = v92;
        uint64_t v94 = sub_25C5EE4A0();
        os_log_type_t v95 = sub_25C5EE780();
        int v96 = v95;
        if (os_log_type_enabled(v94, v95))
        {
          uint64_t v97 = swift_slowAlloc();
          LODWORD(v118) = v96;
          uint64_t v98 = v97;
          uint64_t v119 = (char *)swift_slowAlloc();
          uint64_t v123 = v119;
          *(_DWORD *)uint64_t v98 = 136315394;
          uint64_t v117 = (char *)(v98 + 4);
          id v99 = objc_msgSend(v93, sel_localizedName);
          uint64_t v100 = sub_25C5EE580();
          unint64_t v102 = v101;

          uint64_t v122 = sub_25C5CD724(v100, v102, (uint64_t *)&v123);
          sub_25C5EE7F0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v98 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v122 = sub_25C5CD724(v114, v61, (uint64_t *)&v123);
          sub_25C5EE7F0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25C5AA000, v94, (os_log_type_t)v118, "Added application name: %s bundleId: %s to list of installedApps", (uint8_t *)v98, 0x16u);
          uint64_t v103 = v119;
          swift_arrayDestroy();
          MEMORY[0x26118BA70](v103, -1, -1);
          MEMORY[0x26118BA70](v98, -1, -1);

          return (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v111, v120);
        }

        swift_bridgeObjectRelease_n();
        return (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v25, v120);
      }
      uint64_t v25 = v110;
      sub_25C5EE490();
      swift_bridgeObjectRetain();
      uint64_t v104 = sub_25C5EE4A0();
      os_log_type_t v105 = sub_25C5EE790();
      if (os_log_type_enabled(v104, v105))
      {
        unint64_t v106 = v61;
        uint64_t v109 = v5;
        uint64_t v107 = (uint8_t *)swift_slowAlloc();
        uint64_t v108 = swift_slowAlloc();
        uint64_t v123 = (char *)v108;
        *(_DWORD *)uint64_t v107 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v122 = sub_25C5CD724(v114, v106, (uint64_t *)&v123);
        sub_25C5EE7F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C5AA000, v104, v105, "Unable to fetch App Info for bundleId: %s", v107, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v108, -1, -1);
        MEMORY[0x26118BA70](v107, -1, -1);

        return (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v25, v120);
      }
    }
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v25, v120);
  }
  uint64_t v56 = v48 + 56;
  uint64_t v57 = 1;
  while (1)
  {
    uint64_t v58 = v57 + 1;
    if (__OFADD__(v57, 1)) {
      break;
    }
    swift_bridgeObjectRetain();
    char v59 = sub_25C5EE640();
    uint64_t result = swift_bridgeObjectRelease();
    if (v59) {
      goto LABEL_26;
    }
    ++v57;
    v56 += 16;
    if (v58 == v49) {
      goto LABEL_34;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5DAEA8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351370);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C5EF250;
  *(void *)(inited + 32) = 0xD000000000000016;
  *(void *)(inited + 40) = 0x800000025C5F13D0;
  *(void *)(inited + 48) = 0xD000000000000011;
  *(void *)(inited + 56) = 0x800000025C5F13F0;
  strcpy((char *)(inited + 64), "com.apple.siri");
  *(unsigned char *)(inited + 79) = -18;
  LOBYTE(a2) = sub_25C5E8048(a1, a2, (void *)inited);
  swift_setDeallocating();
  sub_25C5AFBCC();
  return a2 & 1;
}

uint64_t type metadata accessor for DefaultInstalledAppProvider()
{
  return self;
}

uint64_t destroy for AppMetadata()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s16SiriAutoComplete11AppMetadataVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AppMetadata(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppMetadata(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for AppMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppMetadata()
{
  return &type metadata for AppMetadata;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25C5DB17C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_bundleIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C5EE580();

  return v3;
}

uint64_t sub_25C5DB1E0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_applicationType);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C5EE580();

  return v3;
}

uint64_t sub_25C5DB250(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C5DB264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_25C5DB368;
  return v9(a1, a2, a3);
}

uint64_t sub_25C5DB368()
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = *v1;
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v2(v0);
}

uint64_t sub_25C5DB43C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_25C5DB450(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C5DB464()
{
  if (*(void *)(v0 + 24))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    uint64_t v1 = sub_25C5DB4D0();
    *(void *)(v0 + 16) = v1;
    *(void *)(v0 + 24) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C5DB4D0()
{
  uint64_t v0 = sub_25C5EE4B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_sharedPreferences);
  uint64_t result = sub_25C5DC0FC(v4);
  if (!v6)
  {
    sub_25C5EE490();
    uint64_t v7 = sub_25C5EE4A0();
    os_log_type_t v8 = sub_25C5EE790();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25C5AA000, v7, v8, "Unable to fetch Siri locale", v9, 2u);
      MEMORY[0x26118BA70](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return result;
}

uint64_t sub_25C5DB634()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for DefaultLocaleProvider()
{
  return self;
}

uint64_t sub_25C5DB690(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C5DB6A4()
{
  type metadata accessor for DefaultDeviceTypeProvider();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete25DefaultDeviceTypeProvider____lazy_storage___currentDeviceType;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5B9610);
  uint64_t result = __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  qword_26A5B98C8 = v0;
  return result;
}

uint64_t sub_25C5DB70C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9628);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = &v12[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC16SiriAutoComplete25DefaultDeviceTypeProvider____lazy_storage___currentDeviceType;
  swift_beginAccess();
  sub_25C5DBFC8(v9, (uint64_t)v8, &qword_26A5B9628);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5B9610);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10) != 1) {
    return sub_25C5DC094((uint64_t)v8, a1);
  }
  sub_25C5DBF68((uint64_t)v8);
  sub_25C5EE060();
  sub_25C5EE050();
  sub_25C5DBFC8(a1, (uint64_t)v6, (uint64_t *)&unk_26A5B9610);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v10);
  swift_beginAccess();
  sub_25C5DC02C((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_25C5DB884()
{
  sub_25C5DBF68(v0 + OBJC_IVAR____TtC16SiriAutoComplete25DefaultDeviceTypeProvider____lazy_storage___currentDeviceType);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C5DB8E8()
{
  return type metadata accessor for DefaultDeviceTypeProvider();
}

uint64_t type metadata accessor for DefaultDeviceTypeProvider()
{
  uint64_t result = qword_26A5B95F8;
  if (!qword_26A5B95F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C5DB938()
{
  sub_25C5DB9C8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25C5DB9C8()
{
  if (!qword_26A5B9608)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26A5B9610);
    unint64_t v0 = sub_25C5EE7D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A5B9608);
    }
  }
}

uint64_t sub_25C5DBA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_25C5DC16C;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25C5DBB30(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_25C5EE0C0();
  v2[4] = v3;
  OUTLINED_FUNCTION_2(v3);
  v2[5] = v4;
  v2[6] = swift_task_alloc();
  uint64_t v5 = sub_25C5EE0B0();
  v2[7] = v5;
  OUTLINED_FUNCTION_2(v5);
  v2[8] = v6;
  v2[9] = swift_task_alloc();
  uint64_t v7 = sub_25C5EE0E0();
  v2[10] = v7;
  OUTLINED_FUNCTION_2(v7);
  v2[11] = v8;
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C5DBC3C, 0, 0);
}

uint64_t sub_25C5DBC3C()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = (void *)v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  sub_25C5EE100();
  v0[13] = sub_25C5EE0F0();
  *uint64_t v1 = &unk_2709C2AE8;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F6C8E0], v3);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F6C8E8], v6);
  swift_bridgeObjectRetain();
  sub_25C5EE0D0();
  uint64_t v10 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F6C8F0] + MEMORY[0x263F6C8F0]);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_25C5DBDA8;
  uint64_t v8 = v0[12];
  return v10(v8);
}

uint64_t sub_25C5DBDA8()
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = v2[12];
  uint64_t v4 = v2[11];
  uint64_t v5 = v2[10];
  uint64_t v8 = *v1;
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  return v6(v0);
}

uint64_t type metadata accessor for DefaultAppFinderForIntentProvider()
{
  return self;
}

uint64_t sub_25C5DBF68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9628);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C5DBFC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C5DC02C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5DC094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5B9610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5DC0FC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_languageCode);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C5EE580();

  return v3;
}

uint64_t sub_25C5DC18C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    return sub_25C5DC1EC(v3, (uint64_t)a3);
  }
  sub_25C5DE384();
  uint64_t v5 = sub_25C5EE6B0();
  return sub_25C5DC254(v3, v5);
}

uint64_t sub_25C5DC1EC(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5B9660);
  uint64_t v4 = swift_allocError();
  void *v5 = a2;

  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_25C5DC254(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_25C5DC274(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_41();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25C5EE330();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v25[3] = sub_25C5EE410();
  id v13 = objc_msgSend(a1, sel_phrase);
  uint64_t v14 = sub_25C5EE580();
  v25[1] = v15;
  v25[2] = v14;

  id v16 = objc_msgSend(a1, sel_associatedAppBundleIdentifier);
  sub_25C5EE580();
  v25[0] = v17;

  id v18 = objc_msgSend(a1, sel_identifier);
  sub_25C5EE580();

  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F6CCC8], v7);
  uint64_t v19 = sub_25C5EE1D0();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v19);
  uint64_t v20 = sub_25C5EDF30();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v20);
  uint64_t v21 = sub_25C5EE3B0();
  id v22 = objc_msgSend(a1, sel_runEventsCount);
  uint64_t v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, sel_doubleValue);
  }
  sub_25C5EE370();
  return v21;
}

uint64_t sub_25C5DC508(unint64_t a1)
{
  uint64_t v3 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_41();
  sub_25C5EE490();
  uint64_t v7 = sub_25C5EE4A0();
  os_log_type_t v8 = sub_25C5EE770();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25C5AA000, v7, v8, "Ranking Voice Shortcut phrases", v9, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C5EE9B0();
    if (v10) {
      goto LABEL_5;
    }
LABEL_19:
    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v25 = (char *)v12;
    swift_bridgeObjectRetain();
    sub_25C5EA510(&v25);
    swift_bridgeObjectRelease();
    uint64_t v20 = v25;
    if (!v10) {
      return swift_release();
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x26118B200](v21, a1);
      }
      else {
        swift_retain();
      }
      ++v21;
      double v22 = COERCE_DOUBLE(sub_25C5EE360());
      if (v23) {
        double v22 = 0.0;
      }
      sub_25C5ED85C((uint64_t)v20, v22);
      sub_25C5EE370();
      swift_release();
    }
    while (v10 != v21);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_19;
  }
LABEL_5:
  if (v10 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = MEMORY[0x263F8EE78];
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x26118B200](v11, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v13 = sub_25C5EE360();
      if (v14)
      {
        uint64_t v15 = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
LABEL_17:
          sub_25C5E9998(0, *(void *)(v12 + 16) + 1, 1, v12);
          uint64_t v12 = v18;
        }
      }
      else
      {
        uint64_t v15 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          goto LABEL_17;
        }
      }
      unint64_t v17 = *(void *)(v12 + 16);
      unint64_t v16 = *(void *)(v12 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_25C5E9998(v16 > 1, v17 + 1, 1, v12);
        uint64_t v12 = v19;
      }
      ++v11;
      *(void *)(v12 + 16) = v17 + 1;
      *(void *)(v12 + 8 * v17 + 32) = v15;
      swift_release();
      if (v10 == v11) {
        goto LABEL_20;
      }
    }
  }
  __break(1u);
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_25C5DC820()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete19VoiceShortcutSource_source;
  uint64_t v2 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C5DC8C0()
{
  return type metadata accessor for VoiceShortcutSource();
}

uint64_t type metadata accessor for VoiceShortcutSource()
{
  uint64_t result = qword_26A5B9630;
  if (!qword_26A5B9630) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5DC910()
{
  uint64_t result = sub_25C5EE330();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C5DC9A0(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_8_2((uint64_t)&unk_26A5B9648);
  os_log_type_t v8 = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25C5DCA54;
  return v8(v4, v3);
}

uint64_t sub_25C5DCA54()
{
  OUTLINED_FUNCTION_65();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_6();
  swift_task_dealloc();
  OUTLINED_FUNCTION_240();
  return v2(v1);
}

uint64_t sub_25C5DCB24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a1;
  uint64_t v6 = sub_25C5EE4B0();
  v3[17] = v6;
  v3[18] = *(void *)(v6 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DefaultEligibilityCriteria();
  v3[21] = v7;
  v3[5] = v7;
  v3[6] = &off_2709C32F0;
  v3[2] = a2;
  v3[10] = type metadata accessor for DefaultSiriShortcutsEnablementProvider();
  v3[11] = &off_2709C3290;
  v3[7] = a3;
  swift_retain();
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5DCC4C, 0, 0);
}

uint64_t sub_25C5DCC4C()
{
  uint64_t v32 = v0;
  uint64_t v1 = v0 + 16;
  uint64_t v2 = v0 + 56;
  uint64_t v3 = *(void *)(v0 + 168);
  id v4 = objc_msgSend(*(id *)(v0 + 128), sel_associatedAppBundleIdentifier);
  uint64_t v5 = sub_25C5EE580();
  unint64_t v7 = v6;

  *(void *)(v0 + 176) = v5;
  *(void *)(v0 + 184) = v7;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v3);
  if ((sub_25C5C4D44(v5, v7) & 1) == 0)
  {
    uint64_t v13 = *(void **)(v0 + 128);
    sub_25C5EE490();
    id v14 = v13;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_25C5EE4A0();
    os_log_type_t type = sub_25C5EE780();
    BOOL v16 = os_log_type_enabled(v15, type);
    uint64_t v17 = *(void *)(v0 + 160);
    uint64_t v19 = *(void *)(v0 + 136);
    uint64_t v18 = *(void *)(v0 + 144);
    uint64_t v20 = *(void **)(v0 + 128);
    if (v16)
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v29 = v19;
      id v22 = objc_msgSend(v20, sel_shortcutName);
      uint64_t v28 = v17;
      uint64_t v23 = sub_25C5EE580();
      unint64_t v25 = v24;

      *(void *)(v0 + 96) = sub_25C5CD724(v23, v25, &v31);
      sub_25C5EE7F0();
      uint64_t v2 = v0 + 56;
      swift_bridgeObjectRelease();

      *(_WORD *)(v21 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 104) = sub_25C5CD724(v5, v7, &v31);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v15, type, "VoiceShortcut: %s's appBundleId %s is not installed. Not eligible for autocomplete", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      uint64_t v1 = v0 + 16;
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v28, v29);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
    __swift_destroy_boxed_opaque_existential_1(v1);
    __swift_destroy_boxed_opaque_existential_1(v2);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_240();
    OUTLINED_FUNCTION_223();
    __asm { BRAA            X2, X16 }
  }
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  os_log_type_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v8;
  *os_log_type_t v8 = v0;
  v8[1] = sub_25C5DCFA4;
  OUTLINED_FUNCTION_223();
  return sub_25C5C3A48(v9, v10);
}

uint64_t sub_25C5DCFA4()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(unsigned char *)(v1 + 200) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25C5DD070()
{
  if (*(unsigned char *)(v0 + 200) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = *(void **)(v0 + 128);
    sub_25C5EE490();
    id v2 = v1;
    swift_bridgeObjectRetain();
    char v3 = sub_25C5EE4A0();
    os_log_type_t v4 = sub_25C5EE780();
    BOOL v5 = os_log_type_enabled(v3, v4);
    unint64_t v6 = *(void *)(v0 + 184);
    if (v5)
    {
      uint64_t v20 = *(void *)(v0 + 176);
      uint64_t v21 = *(void *)(v0 + 144);
      unint64_t v7 = *(void **)(v0 + 128);
      uint64_t v22 = *(void *)(v0 + 136);
      uint64_t v23 = *(void *)(v0 + 152);
      uint64_t v8 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315394;
      id v9 = objc_msgSend(v7, sel_shortcutName);
      os_log_type_t type = v4;
      uint64_t v10 = sub_25C5EE580();
      unint64_t v12 = v11;

      *(void *)(v0 + 112) = sub_25C5CD724(v10, v12, &v24);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v8 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 120) = sub_25C5CD724(v20, v6, &v24);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C5AA000, v3, type, "VoiceShortcut: %s's appBundleId %s is not enabled for Siri. Not eligible for autocomplete", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 144);
      uint64_t v13 = *(void *)(v0 + 152);
      BOOL v16 = *(void **)(v0 + 128);
      uint64_t v15 = *(void *)(v0 + 136);

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_223();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_25C5DD324()
{
  OUTLINED_FUNCTION_65();
  uint64_t v2 = v1;
  v0[35] = v3;
  v0[36] = *v3;
  uint64_t v4 = sub_25C5EE4B0();
  v0[37] = v4;
  v0[38] = *(void *)(v4 - 8);
  v0[39] = swift_task_alloc();
  v0[40] = swift_task_alloc();
  v0[41] = swift_task_alloc();
  v0[42] = swift_task_alloc();
  v0[13] = type metadata accessor for DefaultEligibilityCriteria();
  v0[14] = &off_2709C32F0;
  v0[10] = v2;
  swift_retain();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_25C5DD454()
{
  uint64_t v18 = v0;
  sub_25C5EE490();
  uint64_t v1 = sub_25C5EE4A0();
  os_log_type_t v2 = sub_25C5EE770();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[38];
    uint64_t v15 = v0[37];
    uint64_t v16 = v0[42];
    uint64_t v4 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = sub_25C5EEB60();
    v0[34] = sub_25C5CD724(v5, v6, &v17);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v1, v2, "%s: Fetching phrases", v4, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v7(v16, v15);
  }
  else
  {
    uint64_t v8 = v0[42];
    uint64_t v9 = v0[37];
    uint64_t v10 = v0[38];

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v7(v8, v9);
  }
  v0[43] = v7;
  sub_25C5EE410();
  v0[32] = sub_25C5EE560();
  id v11 = objc_msgSend(self, sel_standardClient);
  v0[44] = v11;
  v0[2] = v0;
  v0[7] = v0 + 29;
  v0[3] = sub_25C5DD6E8;
  uint64_t v12 = swift_continuation_init();
  v0[15] = MEMORY[0x263EF8330];
  v0[16] = 0x40000000;
  v0[17] = sub_25C5DC18C;
  v0[18] = &block_descriptor_0;
  v0[19] = v12;
  objc_msgSend(v11, sel_getVoiceShortcutsWithCompletion_, v0 + 15);
  OUTLINED_FUNCTION_17_0();
  return MEMORY[0x270FA23F0]();
}

uint64_t sub_25C5DD6E8()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_4();
  *os_log_type_t v2 = v1;
  *os_log_type_t v2 = *v0;
  *(void *)(v1 + 360) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

void sub_25C5DD7C4()
{
  uint64_t v1 = (void *)v0[44];
  unint64_t v2 = v0[29];
  v0[46] = v2;

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v0[47] = v3;
  if (!v3)
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    uint64_t v7 = sub_25C5EE4A0();
    os_log_type_t v8 = sub_25C5EE770();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)OUTLINED_FUNCTION_3_3() = 134217984;
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_17_1(&dword_25C5AA000, v9, v10, "%ld phrase(s) created from Voice Shortcuts");
      OUTLINED_FUNCTION_3();
    }
    id v11 = (void (*)(uint64_t))v0[43];

    uint64_t v12 = OUTLINED_FUNCTION_5_5();
    v11(v12);
    OUTLINED_FUNCTION_4_5();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = sub_25C5B05D8(v13);
    swift_bridgeObjectRelease();
    sub_25C5DC508((unint64_t)v14);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 10));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    __asm { BRAA            X2, X16 }
  }
  if (v3 >= 1)
  {
    type metadata accessor for DefaultSiriShortcutsEnablementProvider();
    uint64_t inited = swift_initStaticObject();
    v0[49] = v0[43];
    v0[50] = 0;
    v0[48] = inited;
    uint64_t v5 = v0[46];
    if ((v5 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x26118B200](0);
    }
    else {
      id v6 = *(id *)(v5 + 32);
    }
    v0[51] = v6;
    __swift_project_boxed_opaque_existential_1(v0 + 10, v0[13]);
    OUTLINED_FUNCTION_8_2((uint64_t)&unk_26A5B9650);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[52] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_25C5DDDE0;
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_17_0();
    __asm { BR              X4 }
  }
  __break(1u);
}

uint64_t sub_25C5DDA78()
{
  uint64_t v28 = v0;
  uint64_t v1 = (void *)v0[44];
  unint64_t v2 = (void *)v0[45];
  swift_willThrow();

  sub_25C5EE490();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_25C5EE4A0();
  os_log_type_t v6 = sub_25C5EE790();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[45];
    uint64_t v25 = v0[41];
    uint64_t v26 = (void (*)(uint64_t, uint64_t))v0[43];
    uint64_t v24 = v0[37];
    os_log_type_t v8 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_25C5EEAD0();
    v0[33] = sub_25C5CD724(v9, v10, &v27);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C5AA000, v5, v6, "Unexpected error occurred while fetching voice shortcuts: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    v26(v25, v24);
  }
  else
  {
    id v11 = (void *)v0[45];
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[43];
    uint64_t v13 = v0[41];
    uint64_t v14 = v0[37];

    v12(v13, v14);
  }
  sub_25C5EE490();
  uint64_t v15 = sub_25C5EE4A0();
  os_log_type_t v16 = sub_25C5EE770();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_DWORD *)uint64_t v17 = 134217984;
    OUTLINED_FUNCTION_15_1();
    v0[30] = *(void *)(v0[32] + 16);
    sub_25C5EE7F0();
    _os_log_impl(&dword_25C5AA000, v15, v16, "%ld phrase(s) created from Voice Shortcuts", v17, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v18 = (void (*)(uint64_t))v0[43];

  uint64_t v19 = OUTLINED_FUNCTION_5_5();
  v18(v19);
  OUTLINED_FUNCTION_15_1();
  uint64_t v20 = swift_bridgeObjectRetain();
  uint64_t v21 = sub_25C5B05D8(v20);
  swift_bridgeObjectRelease();
  sub_25C5DC508((unint64_t)v21);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 10));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_240();
  return v22(v21);
}

uint64_t sub_25C5DDDE0()
{
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_4();
  *unint64_t v2 = v1;
  *unint64_t v2 = *v0;
  *(unsigned char *)(v1 + 424) = v3;
  swift_task_dealloc();
  OUTLINED_FUNCTION_20_0();
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_25C5DDEAC()
{
  uint64_t v50 = v0;
  uint64_t v1 = (void *)(v0 + 80);
  unint64_t v2 = *(void **)(v0 + 408);
  if (*(unsigned char *)(v0 + 424))
  {
    sub_25C5DC274(v2);
    uint64_t v3 = *(void *)(v0 + 256);
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_25C5EE3C0();
    if (*(void *)(v3 + 16))
    {
      sub_25C5B0114(v4, v5);
      char v7 = v6;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v7)
      {
        uint64_t v8 = *(void **)(v0 + 408);
        swift_release();

LABEL_10:
        os_log_type_t v16 = (void *)(v0 + 392);
        goto LABEL_11;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v23 = *(void **)(v0 + 408);
    uint64_t v24 = sub_25C5EE3C0();
    uint64_t v26 = v25;
    uint64_t v27 = sub_25C5DC274(v23);
    uint64_t v28 = *(void *)(v0 + 256);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = v28;
    *(void *)(v0 + 256) = 0x8000000000000000;
    sub_25C5B8F38(v27, v24, v26);
    *(void *)(v0 + 256) = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    goto LABEL_10;
  }
  sub_25C5EE490();
  id v9 = v2;
  unint64_t v10 = sub_25C5EE4A0();
  os_log_type_t v11 = sub_25C5EE780();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = *(void **)(v0 + 408);
  uint64_t v14 = *(void *)(v0 + 312);
  uint64_t v15 = *(void *)(v0 + 296);
  if (v12)
  {
    os_log_type_t v16 = (void *)(v0 + 344);
    id v47 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    uint64_t v46 = *(void *)(v0 + 296);
    uint64_t v17 = OUTLINED_FUNCTION_3_3();
    uint64_t v49 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315138;
    id v18 = objc_msgSend(v13, sel_shortcutName);
    uint64_t v19 = sub_25C5EE580();
    uint64_t v45 = v14;
    unint64_t v21 = v20;

    *(void *)(v17 + 4) = sub_25C5CD724(v19, v21, &v49);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25C5AA000, v10, v11, "VoiceShortcut %s is not eligible for autocomplete. Skipping processing", (uint8_t *)v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v1 = (void *)(v0 + 80);
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    v47(v45, v46);
  }
  else
  {
    os_log_type_t v16 = (void *)(v0 + 392);
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 392);

    v22(v14, v15);
  }
LABEL_11:
  uint64_t v29 = *(void *)(v0 + 400) + 1;
  if (v29 == *(void *)(v0 + 376))
  {
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    uint64_t v30 = sub_25C5EE4A0();
    os_log_type_t v31 = sub_25C5EE770();
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)OUTLINED_FUNCTION_3_3() = 134217984;
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_17_1(&dword_25C5AA000, v32, v33, "%ld phrase(s) created from Voice Shortcuts");
      OUTLINED_FUNCTION_3();
    }
    uint64_t v34 = *(void (**)(uint64_t))(v0 + 344);

    uint64_t v35 = OUTLINED_FUNCTION_5_5();
    v34(v35);
    OUTLINED_FUNCTION_4_5();
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = sub_25C5B05D8(v36);
    swift_bridgeObjectRelease();
    sub_25C5DC508((unint64_t)v37);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v38 = *(uint64_t (**)(const void *))(v0 + 8);
    return v38(v37);
  }
  else
  {
    *(void *)(v0 + 392) = *v16;
    *(void *)(v0 + 400) = v29;
    uint64_t v40 = *(void *)(v0 + 368);
    if ((v40 & 0xC000000000000001) != 0) {
      id v41 = (id)MEMORY[0x26118B200]();
    }
    else {
      id v41 = *(id *)(v40 + 8 * v29 + 32);
    }
    *(void *)(v0 + 408) = v41;
    __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 104));
    OUTLINED_FUNCTION_8_2((uint64_t)&unk_26A5B9650);
    uint64_t v48 = v42;
    os_log_type_t v43 = (void *)swift_task_alloc();
    *(void *)(v0 + 416) = v43;
    void *v43 = v0;
    v43[1] = sub_25C5DDDE0;
    uint64_t v44 = OUTLINED_FUNCTION_11_3();
    return v48(v44);
  }
}

unint64_t sub_25C5DE384()
{
  unint64_t result = qword_26A5B9658;
  if (!qword_26A5B9658)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5B9658);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  *(void *)(v0 + 240) = *(void *)(*(void *)(v0 + 256) + 16);
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_2@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_17_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t sub_25C5DE498()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  MEMORY[0x270FA5388](v0 - 8);
  OUTLINED_FUNCTION_6_1();
  uint64_t v3 = v2 - v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_6_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_25C5EE330();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_6_1();
  uint64_t v14 = v13 - v12;
  sub_25C5EE410();
  sub_25C5EE5F0();
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v14, *MEMORY[0x263F6CCF8], v8);
  uint64_t v15 = sub_25C5EE1D0();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v15);
  uint64_t v16 = sub_25C5EDF30();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v16);
  swift_bridgeObjectRetain();
  return sub_25C5EE3B0();
}

uint64_t sub_25C5DE68C(unint64_t a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v8 = v7 - v6;
  sub_25C5EE490();
  uint64_t v9 = sub_25C5EE4A0();
  os_log_type_t v10 = sub_25C5EE770();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_25C5AA000, v9, v10, "Ranking App Launch phrases", v11, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  swift_retain();
  sub_25C5BE05C(a1);
  return swift_release();
}

uint64_t sub_25C5DE7BC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete15AppLaunchSource_source;
  uint64_t v2 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C5DE86C()
{
  return type metadata accessor for AppLaunchSource();
}

uint64_t type metadata accessor for AppLaunchSource()
{
  uint64_t result = qword_26B351008;
  if (!qword_26B351008) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5DE8BC(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A5B9670 + dword_26A5B9670);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25C5B8D24;
  return v7(v4, v3);
}

uint64_t sub_25C5DE978(uint64_t a1, void *a2)
{
  v2[13] = a2;
  v2[14] = *a2;
  uint64_t v4 = sub_25C5EE4B0();
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for DefaultEligibilityCriteria();
  v2[19] = v5;
  v2[5] = v5;
  v2[6] = &off_2709C32F0;
  v2[2] = a1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5DEA9C, 0, 0);
}

uint64_t sub_25C5DEA9C()
{
  id v47 = v0;
  id v41 = v0 + 2;
  uint64_t v2 = (v0 + 10);
  sub_25C5EE490();
  uint64_t v3 = sub_25C5EE4A0();
  os_log_type_t v4 = sub_25C5EE770();
  uint64_t v40 = v0;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v9 = v0[16];
    uint64_t v42 = v0[15];
    uint64_t v44 = v0[18];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v1 = v5 + 12;
    uint64_t v6 = sub_25C5EEB60();
    v0[12] = sub_25C5CD724(v6, v7, &v46);
    uint64_t v8 = v0 + 5;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v3, v4, "%s: Fetching phrases", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    os_log_type_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    LOBYTE(v9) = v9 + 8;
    uint64_t v39 = v10;
    v10(v44, v42);
  }
  else
  {
    uint64_t v11 = v0[18];
    uint64_t v12 = v0;
    uint64_t v13 = v0[16];
    uint64_t v9 = v12[15];

    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v39(v11, v9);
    uint64_t v8 = v12 + 19;
  }
  uint64_t v14 = *v8;
  v2->isa = (Class)MEMORY[0x263F8EE78];
  uint64_t v15 = __swift_project_boxed_opaque_existential_1(v41, v14);
  uint64_t v16 = *(void *)(*__swift_project_boxed_opaque_existential_1((void *)(*v15 + 16), *(void *)(*v15 + 40)) + 16);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v43 = v16 + 64;
  uint64_t v18 = -1;
  uint64_t v19 = -1 << *(unsigned char *)(v16 + 32);
  if (-v19 < 64) {
    uint64_t v18 = ~(-1 << -(char)v19);
  }
  uint64_t v20 = v18 & v17;
  int64_t v45 = (unint64_t)(63 - v19) >> 6;
  swift_bridgeObjectRetain();
  unint64_t v21 = 0;
  if (!v20) {
    goto LABEL_8;
  }
LABEL_7:
  for (v20 &= v20 - 1; ; uint64_t v20 = (v23 - 1) & v23)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LOBYTE(v9) = sub_25C5DE498();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = swift_retain();
    MEMORY[0x26118B000](v32);
    uint64_t v1 = *(uint8_t **)(((uint64_t)v2->isa & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v1 >= *(void *)(((uint64_t)v2->isa & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25C5EE6E0();
    }
    uint64_t v3 = v2;
    sub_25C5EE700();
    sub_25C5EE6D0();
    swift_release();
    if (v20) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v22 = (int64_t)v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v22 >= v45) {
      break;
    }
    uint64_t v23 = *(void *)(v43 + 8 * v22);
    unint64_t v21 = (void *)((char *)v21 + 1);
    if (v23) {
      continue;
    }
    unint64_t v21 = (void *)(v22 + 1);
    OUTLINED_FUNCTION_3_8();
    if (v24 == v25) {
      break;
    }
    OUTLINED_FUNCTION_2_5();
    if (v23) {
      continue;
    }
    unint64_t v21 = (void *)(v26 + 2);
    OUTLINED_FUNCTION_3_8();
    if (v24 == v25) {
      break;
    }
    OUTLINED_FUNCTION_2_5();
    if (v23) {
      continue;
    }
    unint64_t v21 = (void *)(v27 + 3);
    OUTLINED_FUNCTION_3_8();
    if (v24 == v25) {
      break;
    }
    OUTLINED_FUNCTION_2_5();
    if (v23) {
      continue;
    }
    unint64_t v21 = (void *)(v28 + 4);
    OUTLINED_FUNCTION_3_8();
    if (v24 == v25) {
      break;
    }
    OUTLINED_FUNCTION_2_5();
    if (v23) {
      continue;
    }
    int64_t v30 = v29 + 5;
    if (v30 >= v45) {
      break;
    }
    uint64_t v23 = *(void *)(v43 + 8 * v30);
    if (!v23)
    {
      while (1)
      {
        unint64_t v21 = (void *)(v30 + 1);
        if (__OFADD__(v30, 1)) {
          break;
        }
        OUTLINED_FUNCTION_3_8();
        if (v24 == v25) {
          goto LABEL_35;
        }
        OUTLINED_FUNCTION_2_5();
        int64_t v30 = v31 + 1;
        if (v23) {
          goto LABEL_30;
        }
      }
LABEL_44:
      __break(1u);
LABEL_45:
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25C5EE9B0();
      swift_bridgeObjectRelease();
      goto LABEL_38;
    }
    unint64_t v21 = (void *)v30;
LABEL_30:
    ;
  }
LABEL_35:
  unint64_t v21 = v40;
  swift_release();
  sub_25C5EE490();
  unint64_t v33 = v40[10];
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_25C5EE4A0();
  LOBYTE(v9) = sub_25C5EE770();
  if (os_log_type_enabled(v3, (os_log_type_t)v9))
  {
    uint64_t v1 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v1 = 134217984;
    if (v33 >> 62) {
      goto LABEL_45;
    }
    uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_38:
    swift_bridgeObjectRelease();
    v21[11] = v34;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v3, (os_log_type_t)v9, "%ld phrase(s) created from the App Launch source", v1, 0xCu);
    OUTLINED_FUNCTION_3();
    goto LABEL_40;
  }
  swift_bridgeObjectRelease_n();
LABEL_40:

  v39(v21[17], v21[15]);
  swift_beginAccess();
  unint64_t v35 = swift_bridgeObjectRetain();
  sub_25C5DE68C(v35);
  swift_bridgeObjectRelease();
  uint64_t v36 = v21[10];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = (uint64_t (*)(uint64_t))v21[1];
  return v37(v36);
}

uint64_t sub_25C5DF03C()
{
  uint64_t v44 = sub_25C5EDF30();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6_1();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_25C5EDFA0();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_1();
  uint64_t v12 = v11 - v10;
  uint64_t v43 = sub_25C5EDFB0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6_1();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  int64_t v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  char v25 = (char *)&v42 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v42 = (uint64_t)&v42 - v26;
  type metadata accessor for SiriAutoCompleteHistogram();
  uint64_t v27 = swift_allocObject();
  uint64_t v45 = v27;
  *(void *)(v27 + 16) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v27 + 24) = 0;
  sub_25C5EDF90();
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v12, *MEMORY[0x263F078A8], v6);
  sub_25C5EDF20();
  sub_25C5EDF80();
  uint64_t v28 = v44;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v5, v44);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v43);
  id v29 = [(id)BiomeLibrary() App];
  swift_unknownObjectRelease();
  id v30 = objc_msgSend(v29, sel_InFocus);
  swift_unknownObjectRelease();
  uint64_t v31 = v42;
  sub_25C5DFA80(v42, (uint64_t)v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 1, 1, v28);
  id v32 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v33 = sub_25C5AF9A0((uint64_t)v25, (uint64_t)v22, 1000, 0, 0);
  id v34 = objc_msgSend(v30, sel_publisherWithOptions_, v33);

  uint64_t v50 = sub_25C5DF514;
  uint64_t v51 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v47 = 1107296256;
  uint64_t v48 = sub_25C5AC988;
  uint64_t v49 = &block_descriptor_5;
  unint64_t v35 = _Block_copy(&aBlock);
  id v36 = objc_msgSend(v34, sel_filterWithIsIncluded_, v35);
  _Block_release(v35);

  uint64_t v50 = sub_25C5DF68C;
  uint64_t v51 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v47 = 1107296256;
  uint64_t v48 = sub_25C5AC4A4;
  uint64_t v49 = &block_descriptor_6;
  uint64_t v37 = _Block_copy(&aBlock);
  uint64_t v38 = v45;
  uint64_t v50 = sub_25C5DFB00;
  uint64_t v51 = v45;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v47 = 1107296256;
  uint64_t v48 = sub_25C5AC4A4;
  uint64_t v49 = &block_descriptor_9;
  uint64_t v39 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v40 = objc_msgSend(v36, sel_sinkWithCompletion_receiveInput_, v37, v39);
  _Block_release(v39);
  _Block_release(v37);

  sub_25C5DFB08(v31);
  return v38;
}

id sub_25C5DF514(void *a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_eventBody);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_starting);
  }
  else
  {
    sub_25C5EE490();
    uint64_t v9 = sub_25C5EE4A0();
    os_log_type_t v10 = sub_25C5EE790();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25C5AA000, v9, v10, "Skipping Biome event with missing body", v11, 2u);
      MEMORY[0x26118BA70](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  return v8;
}

id sub_25C5DF68C(void *a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)v21 - v7;
  if (objc_msgSend(a1, sel_state))
  {
    sub_25C5EE490();
    uint64_t v9 = sub_25C5EE4A0();
    os_log_type_t v10 = sub_25C5EE790();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25C5AA000, v9, v10, "Publisher completion state was not 'success'", v11, 2u);
      MEMORY[0x26118BA70](v11, -1, -1);
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    id result = objc_msgSend(a1, sel_error);
    if (result)
    {
      uint64_t v13 = result;
      sub_25C5EE490();
      id v14 = v13;
      uint64_t v15 = sub_25C5EE4A0();
      os_log_type_t v16 = sub_25C5EE790();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v22 = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        v21[1] = v17 + 4;
        swift_getErrorValue();
        uint64_t v19 = sub_25C5EEAD0();
        v21[2] = sub_25C5CD724(v19, v20, &v22);
        sub_25C5EE7F0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C5AA000, v15, v16, "Error encountered while attempting to build the app launch histogram: %s", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26118BA70](v18, -1, -1);
        MEMORY[0x26118BA70](v17, -1, -1);
      }
      else
      {
      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

void sub_25C5DF97C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_eventBody);
  if (v1)
  {
    id v3 = v1;
    sub_25C5DFB68(v1);
    if (v2)
    {
      sub_25C5BDEDC();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_25C5DFA24()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for AppLaunchHistogramBuilder()
{
  return self;
}

uint64_t sub_25C5DFA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_25C5DFB00(void *a1)
{
}

uint64_t sub_25C5DFB08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C5DFB68(void *a1)
{
  id v1 = objc_msgSend(a1, sel_bundleID);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C5EE580();

  return v3;
}

void sub_25C5DFBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25C5EEAE0();
    sub_25C5EE5C0();
    uint64_t v6 = sub_25C5EEB00();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v8 = v6 & ~v7;
    OUTLINED_FUNCTION_2_6();
    if (v9)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_25C5EEA80() & 1) == 0)
      {
        uint64_t v13 = ~v7;
        uint64_t v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_2_6();
        if (v15)
        {
          do
          {
            os_log_type_t v16 = (void *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2) {
              break;
            }
            if (sub_25C5EEA80()) {
              break;
            }
            uint64_t v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_2_6();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

uint64_t sub_25C5DFCF0(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    goto LABEL_9;
  }
  sub_25C5EEAE0();
  sub_25C5E57FC((uint64_t)v17, a1);
  uint64_t v4 = sub_25C5EEB00();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_25C5E01A0(v8, a1);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    char v11 = 1;
    return v11 & 1;
  }
  uint64_t v12 = ~v5;
  unint64_t v13 = (v6 + 1) & v12;
  if (((*(void *)(v7 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
  {
LABEL_9:
    char v11 = 0;
    return v11 & 1;
  }
  do
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_25C5E01A0(v14, a1);
    char v11 = v15;
    swift_bridgeObjectRelease();
    if (v11) {
      break;
    }
    unint64_t v13 = (v13 + 1) & v12;
  }
  while (((*(void *)(v7 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  return v11 & 1;
}

uint64_t sub_25C5DFE24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = a1 + 40;
    do
    {
      uint64_t v4 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_19_0(v4);
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    return a2;
  }
  else
  {
    uint64_t v5 = a2;
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_25C5DFEB0(uint64_t result, uint64_t a2)
{
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  for (v6 &= v6 - 1; ; uint64_t v6 = (v9 - 1) & v9)
  {
    uint64_t v11 = swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_19_0(v11);
    id result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v8 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v8 >= v7) {
      goto LABEL_23;
    }
    uint64_t v9 = *(void *)(v3 + 8 * v8);
    ++v2;
    if (!v9)
    {
      int64_t v2 = v8 + 1;
      if (v8 + 1 >= v7) {
        goto LABEL_23;
      }
      uint64_t v9 = *(void *)(v3 + 8 * v2);
      if (!v9)
      {
        int64_t v2 = v8 + 2;
        if (v8 + 2 >= v7) {
          goto LABEL_23;
        }
        uint64_t v9 = *(void *)(v3 + 8 * v2);
        if (!v9)
        {
          int64_t v2 = v8 + 3;
          if (v8 + 3 >= v7) {
            goto LABEL_23;
          }
          uint64_t v9 = *(void *)(v3 + 8 * v2);
          if (!v9) {
            break;
          }
        }
      }
    }
LABEL_20:
    ;
  }
  int64_t v10 = v8 + 4;
  if (v10 >= v7)
  {
LABEL_23:
    swift_release();
    return a2;
  }
  uint64_t v9 = *(void *)(v3 + 8 * v10);
  if (v9)
  {
    int64_t v2 = v10;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v2 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v2 >= v7) {
      goto LABEL_23;
    }
    uint64_t v9 = *(void *)(v3 + 8 * v2);
    ++v10;
    if (v9) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25C5E0024(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v16 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    uint64_t v14 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    swift_bridgeObjectRetain();
    sub_25C5E3F78(&v15, v14);
    id result = swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v16;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_25C5E01A0(uint64_t a1, uint64_t a2)
{
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v29 = a1 + 56;
  OUTLINED_FUNCTION_12_3();
  unint64_t v7 = v6 & v5;
  int64_t v30 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v9 = a2 + 56;
  if ((v6 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v31 = v4;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    uint64_t v16 = v3;
    uint64_t v17 = *(void *)(*(void *)(v3 + 48) + 16 * i + 8);
    sub_25C5EEAE0();
    swift_bridgeObjectRetain();
    sub_25C5EE5C0();
    uint64_t v18 = sub_25C5EEB00();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v9 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_36;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    OUTLINED_FUNCTION_17_2(v21 + 16 * v20);
    BOOL v23 = v23 && v22 == v17;
    if (!v23 && (OUTLINED_FUNCTION_9_3() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t j = v20 + 1; ; unint64_t j = v26 + 1)
      {
        uint64_t v26 = j & v24;
        if (((*(void *)(v9 + (((j & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v24)) & 1) == 0) {
          break;
        }
        OUTLINED_FUNCTION_17_2(v21 + 16 * v26);
        BOOL v28 = v23 && v27 == v17;
        if (v28 || (OUTLINED_FUNCTION_9_3() & 1) != 0) {
          goto LABEL_25;
        }
      }
LABEL_36:
      swift_bridgeObjectRelease();
      return;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    int64_t v4 = v31;
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v30) {
      return;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v12);
    int64_t v14 = v4 + 1;
    if (!v13)
    {
      int64_t v14 = v4 + 2;
      if (v4 + 2 >= v30) {
        return;
      }
      unint64_t v13 = *(void *)(v29 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v4 + 3;
        if (v4 + 3 >= v30) {
          return;
        }
        unint64_t v13 = *(void *)(v29 + 8 * v14);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v13 - 1) & v13;
    int64_t v31 = v14;
  }
  uint64_t v15 = v4 + 4;
  if (v4 + 4 >= v30) {
    return;
  }
  unint64_t v13 = *(void *)(v29 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v4 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v30) {
      return;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_25C5E03F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a4;
  *(unsigned char *)(v5 + 48) = a5;
  return v5;
}

uint64_t sub_25C5E040C(uint64_t a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_71();
  uint64_t v4 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_1();
  uint64_t v10 = v9 - v8;
  uint64_t v12 = *(void *)(v2 + 16);
  unint64_t v11 = *(void *)(v2 + 24);
  uint64_t v14 = *(void *)(a1 + 16);
  unint64_t v13 = *(void *)(a1 + 24);
  BOOL v15 = v12 == v14 && v11 == v13;
  if (v15 || (sub_25C5EEA80() & 1) != 0)
  {
    uint64_t v16 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = sub_25C5E0024(v17, v16);
    uint64_t v19 = *(void *)(v2 + 40);
    swift_bridgeObjectRetain();
    uint64_t v20 = swift_bridgeObjectRetain();
    uint64_t v21 = sub_25C5DFEB0(v20, v19);
    if (*(unsigned char *)(v2 + 48)) {
      char v22 = 1;
    }
    else {
      char v22 = *(unsigned char *)(a1 + 48);
    }
    type metadata accessor for DeniedIntent();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = v11;
    *(void *)(v2 + 32) = v18;
    *(void *)(v2 + 40) = v21;
    *(unsigned char *)(v2 + 48) = v22;
  }
  else
  {
    uint64_t v30 = v4;
    sub_25C5EE490();
    swift_retain_n();
    swift_retain_n();
    BOOL v23 = sub_25C5EE4A0();
    os_log_type_t v29 = sub_25C5EE790();
    if (os_log_type_enabled(v23, v29))
    {
      uint64_t v28 = v6;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315650;
      uint64_t v25 = sub_25C5EEB60();
      sub_25C5CD724(v25, v26, &v31);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_25C5CD724(v12, v11, &v31);
      sub_25C5EE7F0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 22) = 2080;
      swift_bridgeObjectRetain();
      sub_25C5CD724(v14, v13, &v31);
      sub_25C5EE7F0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v23, v29, "%s Error: The intentClass of the objects being unioned should be the same: %s and %s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v10, v30);
    }
    else
    {

      swift_release_n();
      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v30);
    }
    swift_retain();
  }
  return v2;
}

uint64_t sub_25C5E0780(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C43746E65746E69 && a2 == 0xEB00000000737361;
  if (v3 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000025C5F1600 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000025C5F1620 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000025C5F1640)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25C5E092C()
{
  return 4;
}

unint64_t sub_25C5E0934(char a1)
{
  unint64_t result = 0xD00000000000001BLL;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      unint64_t result = 0x6C43746E65746E69;
      break;
  }
  return result;
}

unint64_t sub_25C5E09E0()
{
  return sub_25C5E0934(*v0);
}

uint64_t sub_25C5E09E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5E0780(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5E0A10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5E092C();
  *a1 = result;
  return result;
}

uint64_t sub_25C5E0A38(uint64_t a1)
{
  unint64_t v2 = sub_25C5E5998();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5E0A74(uint64_t a1)
{
  unint64_t v2 = sub_25C5E5998();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25C5E0AB0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C5E0AE0()
{
  sub_25C5E0AB0();

  return MEMORY[0x270FA0228](v0, 49, 7);
}

uint64_t type metadata accessor for DeniedIntent()
{
  return self;
}

uint64_t sub_25C5E0B38(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96B0);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5E5998();
  sub_25C5EEB20();
  sub_25C5EEA40();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9698);
    sub_25C5E59E4((uint64_t)&unk_26A5B96B8);
    OUTLINED_FUNCTION_8_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
    sub_25C5E5A54((uint64_t)&unk_26A5B96C0);
    OUTLINED_FUNCTION_8_3();
    sub_25C5EEA50();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25C5E0D18(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_25C5E0D68(a1);
  return v2;
}

void *sub_25C5E0D68(void *a1)
{
  uint64_t v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9688);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5E5998();
  sub_25C5EEB10();
  if (v2)
  {
    type metadata accessor for DeniedIntent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v11) = 0;
    OUTLINED_FUNCTION_18_1();
    v1[2] = sub_25C5EEA00();
    v1[3] = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9698);
    sub_25C5E59E4((uint64_t)&unk_26A5B96A0);
    OUTLINED_FUNCTION_7_5();
    sub_25C5EEA20();
    v1[4] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
    sub_25C5E5A54((uint64_t)&unk_26A5B96A8);
    OUTLINED_FUNCTION_7_5();
    sub_25C5EEA20();
    v1[5] = v11;
    OUTLINED_FUNCTION_18_1();
    char v8 = sub_25C5EEA10();
    uint64_t v9 = OUTLINED_FUNCTION_5_1();
    v10(v9);
    *((unsigned char *)v3 + 48) = v8 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_25C5E0FD4()
{
  return 1;
}

uint64_t sub_25C5E0FDC()
{
  return sub_25C5EEAF0();
}

uint64_t sub_25C5E1004(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E496465696E6564 && a2 == 0xED000073746E6574)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25C5E10A4()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5E10E8()
{
  return 0x6E496465696E6564;
}

uint64_t sub_25C5E110C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9730);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5E5D8C();
  sub_25C5EEB20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9718);
  sub_25C5E5DD8((uint64_t)&unk_26A5B9738);
  sub_25C5EEA60();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
}

void *sub_25C5E1264(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9708);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5E5D8C();
  sub_25C5EEB10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9718);
    sub_25C5E5DD8((uint64_t)&unk_26A5B9720);
    sub_25C5EEA20();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
    uint64_t v10 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v10;
}

uint64_t sub_25C5E13E4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C5E0D18(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25C5E1410(void *a1)
{
  return sub_25C5E0B38(a1);
}

uint64_t sub_25C5E1440()
{
  return sub_25C5EEB00();
}

uint64_t sub_25C5E1484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5E1004(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25C5E14B0()
{
  return sub_25C5BA728();
}

uint64_t sub_25C5E14CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5E0FD4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_25C5E14F8(uint64_t a1)
{
  unint64_t v2 = sub_25C5E5D8C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5E1534(uint64_t a1)
{
  unint64_t v2 = sub_25C5E5D8C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25C5E1570@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25C5E1264(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25C5E159C(void *a1)
{
  return sub_25C5E110C(a1);
}

uint64_t sub_25C5E15B8()
{
  type metadata accessor for INIntentParameterCombinationDenyListProvider();
  swift_allocObject();
  uint64_t result = sub_25C5E1670();
  qword_26A5B98E0 = result;
  return result;
}

void sub_25C5E15F4()
{
  qword_26A5B9678 = 0x7473696C70;
  unk_26A5B9680 = 0xE500000000000000;
}

unint64_t sub_25C5E1614()
{
  if (qword_26A5B9170 != -1) {
    swift_once();
  }
  return 0xD00000000000002ALL;
}

uint64_t sub_25C5E1670()
{
  *(void *)(v0 + 16) = sub_25C5E16C4();
  return v0;
}

uint64_t sub_25C5E16C4()
{
  uint64_t v0 = sub_25C5E1708();
  uint64_t v1 = sub_25C5E1CD0();
  return sub_25C5E2548(v1, v0);
}

uint64_t sub_25C5E1708()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FE8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v47 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_25C5EDED0();
  uint64_t v2 = *(void *)(v46 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v46);
  uint64_t v44 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v7 = sub_25C5EE4B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v39 - v12;
  sub_25C5EE490();
  uint64_t v14 = sub_25C5EE4A0();
  os_log_type_t v15 = sub_25C5EE780();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v45 = v2;
  id v41 = v6;
  if (v16)
  {
    uint64_t v43 = v11;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v49 = v18;
    uint64_t v40 = v8;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v19 = sub_25C5EEB60();
    uint64_t v48 = sub_25C5CD724(v19, v20, &v49);
    uint64_t v11 = v43;
    uint64_t v8 = v40;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v14, v15, "%s: loading INIntent deny list from project resources.", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118BA70](v18, -1, -1);
    MEMORY[0x26118BA70](v17, -1, -1);
  }

  uint64_t v42 = *(void (**)(char *, uint64_t))(v8 + 8);
  v42(v13, v7);
  uint64_t v22 = v46;
  uint64_t v21 = (uint64_t)v47;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v24 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v25 = sub_25C5EAE40(0xD000000000000024, 0x800000025C5F0130, 0x7473696C70, 0xE500000000000000, v24);

  if (v25)
  {
    unint64_t v26 = v44;
    sub_25C5EDEC0();

    uint64_t v27 = v45;
    uint64_t v28 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
    v28(v21, v26, v22);
    __swift_storeEnumTagSinglePayload(v21, 0, 1, v22);
    if (__swift_getEnumTagSinglePayload(v21, 1, v22) != 1)
    {
      os_log_type_t v29 = v41;
      v28((uint64_t)v41, (char *)v21, v22);
      uint64_t v30 = sub_25C5E25D4();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v22);
      return v30;
    }
  }
  else
  {
    __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  }
  sub_25C5BC234(v21);
  sub_25C5EE490();
  uint64_t v31 = sub_25C5EE4A0();
  os_log_type_t v32 = sub_25C5EE790();
  if (os_log_type_enabled(v31, v32))
  {
    id v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v49 = v34;
    uint64_t v43 = v11;
    *(_DWORD *)id v33 = 136315138;
    uint64_t v35 = sub_25C5EEB60();
    uint64_t v48 = sub_25C5CD724(v35, v36, &v49);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v31, v32, "%s: unable to get a path to the list of denied parameter combinations for INIntents", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118BA70](v34, -1, -1);
    MEMORY[0x26118BA70](v33, -1, -1);

    uint64_t v37 = v43;
  }
  else
  {

    uint64_t v37 = v11;
  }
  v42(v37, v7);
  type metadata accessor for DeniedIntent();
  return sub_25C5EE560();
}

uint64_t sub_25C5E1CD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C5EDED0();
  uint64_t v60 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v58 = (char *)v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  char v59 = (char *)v55 - v5;
  uint64_t v6 = sub_25C5EE010();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25C5EE4B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v57 = (char *)v55 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v55 - v17;
  id v66 = objc_msgSend(self, sel_clientWithIdentifier_, 134);
  sub_25C5EE490();
  uint64_t v19 = sub_25C5EE4A0();
  os_log_type_t v20 = sub_25C5EE780();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v61 = v2;
  uint64_t v62 = v1;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v56 = v11;
    BOOL v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v63 = v10;
    uint64_t v25 = v24;
    v67[0] = v24;
    v55[1] = v14;
    *(_DWORD *)BOOL v23 = 136315138;
    uint64_t v26 = sub_25C5EEB60();
    uint64_t v68 = sub_25C5CD724(v26, v27, v67);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v19, v20, "%s: looking for INIntent deny list on Trial.", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v25;
    uint64_t v10 = v63;
    MEMORY[0x26118BA70](v28, -1, -1);
    os_log_type_t v29 = v23;
    uint64_t v11 = v56;
    MEMORY[0x26118BA70](v29, -1, -1);
  }

  uint64_t v30 = *(void (**)(char *, uint64_t))(v11 + 8);
  v30(v18, v10);
  uint64_t v31 = v64;
  sub_25C5EDFF0();
  os_log_type_t v32 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  uint64_t v33 = v65;
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v9, *MEMORY[0x263F74760], v31);
  sub_25C5EE000();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v31);
  uint64_t v34 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v66, sel_levelForFactor_withNamespaceName_, v32, v34);

  uint64_t v36 = sub_25C5EDFD0();
  if (v37)
  {
    v67[0] = v36;
    v67[1] = v37;
    swift_bridgeObjectRetain();
    sub_25C5EE5F0();
    swift_bridgeObjectRelease();
    uint64_t v38 = v58;
    sub_25C5EDEA0();
    swift_bridgeObjectRelease();
    sub_25C5E1614();
    uint64_t v39 = v59;
    sub_25C5EDEB0();
    swift_bridgeObjectRelease();
    uint64_t v40 = *(void (**)(char *, uint64_t))(v60 + 8);
    id v41 = v38;
    uint64_t v42 = v61;
    v40(v41, v61);
    uint64_t v43 = sub_25C5E25D4();

    v40(v39, v42);
  }
  else
  {
    uint64_t v45 = v57;
    sub_25C5EE490();
    uint64_t v46 = sub_25C5EE4A0();
    os_log_type_t v47 = sub_25C5EE780();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v63 = v10;
      uint64_t v50 = v49;
      v67[0] = v49;
      *(_DWORD *)uint64_t v48 = 136315138;
      uint64_t v51 = sub_25C5EEB60();
      uint64_t v68 = sub_25C5CD724(v51, v52, v67);
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v46, v47, "%s: No INIntent deny list on Trial.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26118BA70](v50, -1, -1);
      MEMORY[0x26118BA70](v48, -1, -1);

      os_log_type_t v53 = v57;
      uint64_t v54 = v63;
    }
    else
    {

      os_log_type_t v53 = v45;
      uint64_t v54 = v10;
    }
    v30(v53, v54);
    type metadata accessor for DeniedIntent();
    uint64_t v43 = sub_25C5EE560();
  }
  return v43;
}

uint64_t sub_25C5E2548(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_25C5E521C(a1, (uint64_t)sub_25C5E5448, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_25C5E25D4()
{
  uint64_t v0 = sub_25C5EE4B0();
  uint64_t v47 = *(void *)(v0 - 8);
  uint64_t v48 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v40 - v2;
  sub_25C5EDE80();
  swift_allocObject();
  uint64_t v4 = sub_25C5EDE70();
  uint64_t v5 = sub_25C5EDEE0();
  uint64_t v44 = v3;
  unint64_t v7 = v6;
  uint64_t v8 = v5;
  sub_25C5E5AB4();
  sub_25C5EDE60();
  uint64_t v41 = v8;
  unint64_t v42 = v7;
  uint64_t v43 = v4;
  unint64_t v10 = v51[0];
  type metadata accessor for DeniedIntent();
  char isUniquelyReferenced_nonNull_native = (void *)sub_25C5EE560();
  uint64_t v52 = (uint64_t)isUniquelyReferenced_nonNull_native;
  if (v10 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12)
    {
LABEL_3:
      unint64_t v49 = v10 & 0xC000000000000001;
      uint64_t v13 = 4;
      uint64_t v45 = v12;
      unint64_t v46 = v10;
      do
      {
        if (v49)
        {
          uint64_t v14 = MEMORY[0x26118B200](v13 - 4, v10);
        }
        else
        {
          uint64_t v14 = *(void *)(v10 + 8 * v13);
          swift_retain();
        }
        uint64_t v15 = v13 - 3;
        if (__OFADD__(v13 - 4, 1))
        {
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (!isUniquelyReferenced_nonNull_native[2]) {
          goto LABEL_11;
        }
        uint64_t v17 = *(void *)(v14 + 16);
        uint64_t v16 = *(void *)(v14 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_25C5B0114(v17, v16);
        LOBYTE(v17) = v18;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17)
        {
          swift_release();
        }
        else
        {
LABEL_11:
          uint64_t v19 = *(void *)(v14 + 16);
          uint64_t v20 = *(void *)(v14 + 24);
          swift_bridgeObjectRetain();
          swift_retain();
          char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
          uint64_t v21 = v52;
          v51[0] = v52;
          unint64_t v22 = sub_25C5B0114(v19, v20);
          if (__OFADD__(*(void *)(v21 + 16), (v23 & 1) == 0)) {
            goto LABEL_26;
          }
          unint64_t v10 = v22;
          char v24 = v23;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96D0);
          if (sub_25C5EE970())
          {
            unint64_t v25 = sub_25C5B0114(v19, v20);
            if ((v24 & 1) != (v26 & 1))
            {
              uint64_t result = sub_25C5EEAC0();
              __break(1u);
              return result;
            }
            unint64_t v10 = v25;
          }
          char isUniquelyReferenced_nonNull_native = (void *)v51[0];
          if (v24)
          {
            uint64_t v27 = *(void *)(v51[0] + 56);
            swift_release();
            *(void *)(v27 + 8 * v10) = v14;
          }
          else
          {
            *(void *)(v51[0] + 8 * (v10 >> 6) + 64) |= 1 << v10;
            uint64_t v28 = (uint64_t *)(isUniquelyReferenced_nonNull_native[6] + 16 * v10);
            *uint64_t v28 = v19;
            v28[1] = v20;
            *(void *)(isUniquelyReferenced_nonNull_native[7] + 8 * v10) = v14;
            uint64_t v29 = isUniquelyReferenced_nonNull_native[2];
            BOOL v30 = __OFADD__(v29, 1);
            uint64_t v31 = v29 + 1;
            if (v30) {
              goto LABEL_27;
            }
            isUniquelyReferenced_nonNull_native[2] = v31;
            swift_bridgeObjectRetain();
          }
          uint64_t v52 = (uint64_t)isUniquelyReferenced_nonNull_native;
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v12 = v45;
          unint64_t v10 = v46;
        }
        ++v13;
      }
      while (v15 != v12);
    }
  }
  swift_bridgeObjectRelease();
  os_log_type_t v32 = v44;
  sub_25C5EE490();
  swift_bridgeObjectRetain_n();
  uint64_t v33 = sub_25C5EE4A0();
  os_log_type_t v34 = sub_25C5EE780();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v51[0] = v36;
    *(_DWORD *)uint64_t v35 = 136315394;
    uint64_t v37 = sub_25C5EEB60();
    uint64_t v50 = sub_25C5CD724(v37, v38, v51);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2048;
    uint64_t v39 = isUniquelyReferenced_nonNull_native[2];
    swift_bridgeObjectRelease();
    uint64_t v50 = v39;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v33, v34, "%s: loaded %ld intents", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26118BA70](v36, -1, -1);
    MEMORY[0x26118BA70](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  sub_25C5B4690(v41, v42);

  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v32, v48);
  swift_beginAccess();
  return v52;
}

uint64_t sub_25C5E2D38(uint64_t a1, unint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_71();
  uint64_t v8 = v7;
  uint64_t v9 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v85 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v21 = (char *)&v85 - v20;
  uint64_t v22 = *(void *)(v3 + 16);
  if (!*(void *)(v22 + 16)) {
    return 0;
  }
  uint64_t v91 = v19;
  uint64_t v89 = v18;
  swift_bridgeObjectRetain();
  unint64_t v23 = sub_25C5B0114(a1, a2);
  if ((v24 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v88 = v8;
  uint64_t v25 = *(void *)(*(void *)(v22 + 56) + 8 * v23);
  swift_retain();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v25 + 48))
  {
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    char v26 = sub_25C5EE4A0();
    os_log_type_t v27 = sub_25C5EE780();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v86 = a1;
      uint64_t v29 = (uint8_t *)v28;
      v95[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v30 = OUTLINED_FUNCTION_16_0();
      uint64_t v93 = v25;
      uint64_t v94 = sub_25C5CD724(v30, v31, v95);
      uint64_t v87 = v9;
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_1();
      uint64_t v94 = OUTLINED_FUNCTION_14_2();
      sub_25C5EE7F0();
      OUTLINED_FUNCTION_13_2();
      _os_log_impl(&dword_25C5AA000, v26, v27, "%s: Not adding any parameter combinations for intent class %s since areAllParametersDenied = YES", v29, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      swift_release();

      os_log_type_t v32 = *(void (**)(char *, uint64_t))(v11 + 8);
      uint64_t v33 = v21;
LABEL_6:
      uint64_t v34 = v87;
LABEL_48:
      v32(v33, v34);
      return 1;
    }

    swift_release();
    swift_bridgeObjectRelease_n();
    os_log_type_t v32 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v33 = v21;
    goto LABEL_47;
  }
  uint64_t v36 = *(void *)(*(void *)(v25 + 40) + 16);
  uint64_t v86 = a1;
  uint64_t v87 = v9;
  uint64_t v93 = v25;
  if (!v36 && !*(void *)(*(void *)(v25 + 32) + 16))
  {
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v72 = sub_25C5EE4A0();
    os_log_type_t v73 = sub_25C5EE780();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      v95[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v74 = 136315650;
      uint64_t v75 = OUTLINED_FUNCTION_16_0();
      uint64_t v94 = sub_25C5CD724(v75, v76, v95);
      OUTLINED_FUNCTION_3_9();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_1();
      uint64_t v94 = sub_25C5CD724(v86, a2, v95);
      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_13_2();
      *(_WORD *)(v74 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v94 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_13_2();
      _os_log_impl(&dword_25C5AA000, v72, v73, "%s: %s is in the deny list but has empty parameters and parameterCombinations. The entire INIntent  %s is denied.", (uint8_t *)v74, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      swift_release();

      os_log_type_t v32 = *(void (**)(char *, uint64_t))(v11 + 8);
      uint64_t v33 = v17;
      goto LABEL_6;
    }

    swift_release();
    swift_bridgeObjectRelease_n();
    os_log_type_t v32 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v33 = v17;
LABEL_47:
    uint64_t v34 = v9;
    goto LABEL_48;
  }
  uint64_t v85 = v11;
  uint64_t v90 = a3 + 56;
  OUTLINED_FUNCTION_12_3();
  unint64_t v39 = v38 & v37;
  id v92 = ((unint64_t)(v40 + 63) >> 6);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v41 = 0;
  while (v39)
  {
    unint64_t v42 = __clz(__rbit64(v39));
    v39 &= v39 - 1;
    unint64_t v43 = v42 | (v41 << 6);
LABEL_28:
    uint64_t v47 = *(void *)(v25 + 40);
    if (*(void *)(v47 + 16))
    {
      uint64_t v48 = a3;
      unint64_t v49 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v43);
      uint64_t v50 = *v49;
      unint64_t v51 = v49[1];
      sub_25C5EEAE0();
      swift_bridgeObjectRetain();
      sub_25C5EE5C0();
      uint64_t v52 = sub_25C5EEB00();
      uint64_t v53 = -1 << *(unsigned char *)(v47 + 32);
      uint64_t v54 = v52 & ~v53;
      OUTLINED_FUNCTION_22_1();
      if (v55)
      {
        uint64_t v56 = *(void *)(v47 + 48);
        uint64_t v57 = (void *)(v56 + 16 * v54);
        BOOL v58 = *v57 == v50 && v57[1] == v51;
        if (v58 || (sub_25C5EEA80() & 1) != 0)
        {
LABEL_44:
          sub_25C5EE490();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          uint64_t v63 = sub_25C5EE4A0();
          os_log_type_t v64 = sub_25C5EE780();
          int v65 = v64;
          id v92 = v63;
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v66 = swift_slowAlloc();
            uint64_t v90 = swift_slowAlloc();
            v95[0] = v90;
            *(_DWORD *)uint64_t v66 = 136315906;
            uint64_t v67 = OUTLINED_FUNCTION_16_0();
            uint64_t v94 = sub_25C5CD724(v67, v68, v95);
            LODWORD(v89) = v65;
            OUTLINED_FUNCTION_10_3();
            swift_bridgeObjectRelease();
            *(_WORD *)(v66 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v94 = OUTLINED_FUNCTION_14_2();
            OUTLINED_FUNCTION_10_3();
            OUTLINED_FUNCTION_13_2();
            *(_WORD *)(v66 + 22) = 2080;
            swift_bridgeObjectRetain();
            sub_25C5EE740();
            swift_bridgeObjectRelease();
            uint64_t v94 = OUTLINED_FUNCTION_15_2();
            OUTLINED_FUNCTION_10_3();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v66 + 32) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v94 = sub_25C5CD724(v50, v51, v95);
            OUTLINED_FUNCTION_10_3();
            swift_bridgeObjectRelease_n();
            id v69 = v92;
            _os_log_impl(&dword_25C5AA000, v92, (os_log_type_t)v89, "%s: Not adding intent class %s, parameter combination: %s since it contains a denied parameter: '%s'", (uint8_t *)v66, 0x2Au);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_3();
            swift_release();
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_release();
          }
          uint64_t v70 = OUTLINED_FUNCTION_11_4();
          v71(v70);
          swift_release();
          return 1;
        }
        uint64_t v59 = ~v53;
        while (1)
        {
          uint64_t v54 = (v54 + 1) & v59;
          OUTLINED_FUNCTION_22_1();
          if ((v60 & 1) == 0) {
            break;
          }
          uint64_t v61 = (void *)(v56 + 16 * v54);
          BOOL v62 = *v61 == v50 && v61[1] == v51;
          if (v62 || (sub_25C5EEA80() & 1) != 0) {
            goto LABEL_44;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v25 = v93;
      a3 = v48;
    }
  }
  uint64_t v44 = v41 + 1;
  if (__OFADD__(v41, 1))
  {
    __break(1u);
LABEL_62:
    __break(1u);
    return result;
  }
  if (v44 >= (uint64_t)v92) {
    goto LABEL_54;
  }
  unint64_t v45 = *(void *)(v90 + 8 * v44);
  ++v41;
  if (v45) {
    goto LABEL_27;
  }
  uint64_t v41 = v44 + 1;
  if (v44 + 1 >= (uint64_t)v92) {
    goto LABEL_54;
  }
  unint64_t v45 = *(void *)(v90 + 8 * v41);
  if (v45) {
    goto LABEL_27;
  }
  uint64_t v41 = v44 + 2;
  if (v44 + 2 >= (uint64_t)v92) {
    goto LABEL_54;
  }
  unint64_t v45 = *(void *)(v90 + 8 * v41);
  if (v45)
  {
LABEL_27:
    unint64_t v39 = (v45 - 1) & v45;
    unint64_t v43 = __clz(__rbit64(v45)) + (v41 << 6);
    goto LABEL_28;
  }
  uint64_t v46 = v44 + 3;
  if (v46 < (uint64_t)v92)
  {
    unint64_t v45 = *(void *)(v90 + 8 * v46);
    if (!v45)
    {
      while (1)
      {
        uint64_t v41 = v46 + 1;
        if (__OFADD__(v46, 1)) {
          goto LABEL_62;
        }
        if (v41 >= (uint64_t)v92) {
          goto LABEL_54;
        }
        unint64_t v45 = *(void *)(v90 + 8 * v41);
        ++v46;
        if (v45) {
          goto LABEL_27;
        }
      }
    }
    uint64_t v41 = v46;
    goto LABEL_27;
  }
LABEL_54:
  swift_release();
  char v77 = sub_25C5DFCF0(a3, *(void *)(v25 + 32));
  uint64_t v78 = v85;
  if ((v77 & 1) == 0)
  {
    swift_release();
    return 0;
  }
  uint64_t v79 = v89;
  sub_25C5EE490();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v80 = sub_25C5EE4A0();
  os_log_type_t v81 = sub_25C5EE780();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = swift_slowAlloc();
    id v92 = swift_slowAlloc();
    v95[0] = (uint64_t)v92;
    *(_DWORD *)uint64_t v82 = 136315650;
    uint64_t v83 = OUTLINED_FUNCTION_16_0();
    uint64_t v94 = sub_25C5CD724(v83, v84, v95);
    OUTLINED_FUNCTION_3_9();
    swift_bridgeObjectRelease();
    *(_WORD *)(v82 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v94 = OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_13_2();
    *(_WORD *)(v82 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_25C5EE740();
    swift_bridgeObjectRelease();
    uint64_t v94 = OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_3_9();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v80, v81, "%s: Not adding intent class %s, parameter combination: %s", (uint8_t *)v82, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    swift_release();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v79, v87);
  return 1;
}

uint64_t type metadata accessor for INIntentParameterCombinationDenyListProvider()
{
  return self;
}

uint64_t sub_25C5E37D4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96D8);
  char v36 = a2;
  uint64_t v6 = sub_25C5EE9C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_25C5EEAE0();
    sub_25C5EE5C0();
    uint64_t result = sub_25C5EEB00();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    os_log_type_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    void *v32 = v22;
    v32[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v27) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v34)
    {
      swift_release();
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v35 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v34) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v35 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v34)
  {
    unint64_t v18 = *(void *)(v35 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v34) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v35 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
LABEL_34:
  if (v36)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_25C5E3DE4(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25C5E3ADC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96E8);
  char v36 = a2;
  uint64_t v6 = sub_25C5EE9C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25C5EEAE0();
    sub_25C5EE5C0();
    uint64_t result = sub_25C5EEB00();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    os_log_type_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    void *v32 = v22;
    v32[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v27) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v34)
    {
      swift_release();
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v35 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v34) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v35 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v34)
  {
    unint64_t v18 = *(void *)(v35 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v34) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v35 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
LABEL_34:
  if (v36)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_25C5E3DE4(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25C5E3DE4(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_25C5E3E00(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25C5EEAE0();
  swift_bridgeObjectRetain();
  sub_25C5EE5C0();
  uint64_t v8 = sub_25C5EEB00();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  OUTLINED_FUNCTION_2_6();
  if (v11)
  {
    uint64_t v12 = *(void *)(v7 + 48);
    OUTLINED_FUNCTION_17_2(v12 + 16 * v10);
    BOOL v14 = v14 && v13 == a3;
    if (v14 || (OUTLINED_FUNCTION_9_3() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_2_6();
      if ((v19 & 1) == 0) {
        break;
      }
      OUTLINED_FUNCTION_17_2(v12 + 16 * v10);
      BOOL v21 = v14 && v20 == a3;
      if (v21 || (OUTLINED_FUNCTION_9_3() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25C5E4634(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25C5E3F78(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_25C5EEAE0();
  swift_bridgeObjectRetain();
  sub_25C5E57FC((uint64_t)v19, a2);
  uint64_t v6 = sub_25C5EEB00();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v9 = swift_bridgeObjectRetain();
    sub_25C5E01A0(v9, a2);
    char v11 = v10;
    swift_bridgeObjectRelease();
    if (v11)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v12 = ~v7;
    while (1)
    {
      unint64_t v8 = (v8 + 1) & v12;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        break;
      }
      uint64_t v13 = swift_bridgeObjectRetain();
      sub_25C5E01A0(v13, a2);
      char v15 = v14;
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_6;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19[0] = *v2;
  *uint64_t v2 = 0x8000000000000000;
  uint64_t v18 = swift_bridgeObjectRetain();
  sub_25C5E47D0(v18, v8, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v19[0];
  swift_bridgeObjectRelease();
  *a1 = a2;
  return 1;
}

uint64_t sub_25C5E410C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510B8);
  uint64_t v3 = sub_25C5EE880();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    BOOL v30 = (void *)(v2 + 56);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_25C5EEAE0();
      sub_25C5EE5C0();
      uint64_t result = sub_25C5EEB00();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      char v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *char v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_25C5E3DE4(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *BOOL v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_25C5E43E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96C8);
  uint64_t v3 = sub_25C5EE880();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    unint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      sub_25C5EEAE0();
      sub_25C5E57FC((uint64_t)v20, v18);
      sub_25C5EEB00();
      unint64_t result = sub_25C5EE860();
      *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      *(void *)(*(void *)(v4 + 48) + 8 * result) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v15 >= v9) {
        goto LABEL_23;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_23;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_23;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_23:
              swift_release();
              uint64_t v19 = 1 << *(unsigned char *)(v2 + 32);
              if (v19 > 63) {
                sub_25C5E3DE4(0, (unint64_t)(v19 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v19;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_29;
                }
                if (v12 >= v9) {
                  goto LABEL_23;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  unint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25C5E4634(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25C5E410C();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_25C5E4960();
      goto LABEL_22;
    }
    sub_25C5E4CC0();
  }
  uint64_t v11 = *v4;
  sub_25C5EEAE0();
  sub_25C5EE5C0();
  unint64_t result = sub_25C5EEB00();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_25C5EEA80(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_25C5EEAB0();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_25C5EEA80();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
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

uint64_t sub_25C5E47D0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25C5E43E8();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_25C5E4B14();
      goto LABEL_14;
    }
    sub_25C5E4F6C();
  }
  uint64_t v8 = *v3;
  sub_25C5EEAE0();
  sub_25C5E57FC((uint64_t)v21, v5);
  unint64_t result = sub_25C5EEB00();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = swift_bridgeObjectRetain();
    sub_25C5E01A0(v10, v5);
    char v12 = v11;
    unint64_t result = swift_bridgeObjectRelease();
    if (v12)
    {
LABEL_13:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510A8);
      unint64_t result = sub_25C5EEAB0();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        uint64_t v14 = swift_bridgeObjectRetain();
        sub_25C5E01A0(v14, v5);
        char v16 = v15;
        unint64_t result = swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = v5;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
  return result;
}

void *sub_25C5E4960()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C5EE870();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25C5E4B14()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C5EE870();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25C5E4CC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3510B8);
  uint64_t v3 = sub_25C5EE880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_25C5EEAE0();
    swift_bridgeObjectRetain();
    sub_25C5EE5C0();
    uint64_t result = sub_25C5EEB00();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    char v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *char v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_25C5E4F6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96C8);
  uint64_t v3 = sub_25C5EE880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    unint64_t result = swift_release();
    *uint64_t v1 = v4;
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  unint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    sub_25C5EEAE0();
    swift_bridgeObjectRetain();
    sub_25C5E57FC((uint64_t)v19, v18);
    sub_25C5EEB00();
    unint64_t result = sub_25C5EE860();
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(*(void *)(v4 + 48) + 8 * result) = v18;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v9) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_23;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_23:
    swift_release();
    uint64_t v1 = v0;
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_25C5E5184(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a2;
}

uint64_t sub_25C5E51D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_25C5E521C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_25C5E5490(a1, a2, a3, &v32);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25C5E54CC();
  if (v8)
  {
    uint64_t v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    while (1)
    {
      unint64_t v13 = (void *)*a5;
      unint64_t v15 = sub_25C5B0114(v10, v11);
      uint64_t v16 = v13[2];
      BOOL v17 = (v14 & 1) == 0;
      uint64_t v18 = v16 + v17;
      if (__OFADD__(v16, v17)) {
        break;
      }
      char v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B96D0);
          sub_25C5EE980();
        }
      }
      else
      {
        sub_25C5E37D4(v18, a4 & 1);
        unint64_t v20 = sub_25C5B0114(v10, v11);
        if ((v19 & 1) != (v21 & 1)) {
          goto LABEL_17;
        }
        unint64_t v15 = v20;
      }
      unint64_t v22 = (void *)*a5;
      if (v19)
      {
        swift_retain();
        uint64_t v23 = sub_25C5E040C(v12);
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        uint64_t v24 = v22[7];
        swift_release();
        *(void *)(v24 + 8 * v15) = v23;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        unint64_t v25 = (uint64_t *)(v22[6] + 16 * v15);
        *unint64_t v25 = v10;
        v25[1] = v11;
        *(void *)(v22[7] + 8 * v15) = v12;
        uint64_t v26 = v22[2];
        BOOL v27 = __OFADD__(v26, 1);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_16;
        }
        v22[2] = v28;
      }
      uint64_t v10 = sub_25C5E54CC();
      uint64_t v11 = v29;
      uint64_t v12 = v30;
      a4 = 1;
      if (!v29) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C5EEAC0();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_25C5B45A0();
    return swift_release();
  }
  return result;
}

uint64_t sub_25C5E5448@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C5E5184(&v6, *a1, a1[1], a1[2]);
  uint64_t v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

uint64_t sub_25C5E5490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_25C5E54CC()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_retain();
    v11(&v19, v20);
    swift_release();
    swift_bridgeObjectRelease();
    return v19;
  }
  unint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          unint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            unint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            unint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v18 < v14)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  unint64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_25C5E5664()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
  unint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          unint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            unint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            unint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v18 < v14)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  unint64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_25C5E57FC(uint64_t a1, uint64_t a2)
{
  sub_25C5EEB00();
  uint64_t v3 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  int64_t v10 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  for (v6 &= v6 - 1; ; uint64_t v6 = (v12 - 1) & v12)
  {
    sub_25C5EEAE0();
    swift_bridgeObjectRetain();
    sub_25C5EE5C0();
    uint64_t v14 = sub_25C5EEB00();
    uint64_t result = swift_bridgeObjectRelease();
    v9 ^= v14;
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v10++, 1)) {
      goto LABEL_19;
    }
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_25C5EEAF0();
    }
    uint64_t v12 = *(void *)(v3 + 8 * v10);
    if (!v12) {
      break;
    }
LABEL_14:
    ;
  }
  int64_t v13 = v10 + 1;
  if (v10 + 1 >= v7) {
    goto LABEL_17;
  }
  uint64_t v12 = *(void *)(v3 + 8 * v13);
  if (v12)
  {
    ++v10;
    goto LABEL_14;
  }
  while (1)
  {
    int64_t v10 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_17;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v10);
    ++v13;
    if (v12) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

unint64_t sub_25C5E5998()
{
  unint64_t result = qword_26A5B9690;
  if (!qword_26A5B9690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9690);
  }
  return result;
}

unint64_t sub_25C5E59E4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_23_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5B9698);
    sub_25C5E5A54(v4);
    unint64_t result = OUTLINED_FUNCTION_20_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C5E5A54(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_23_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B3510A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C5E5AB4()
{
  unint64_t result = qword_26A5B96E0;
  if (!qword_26A5B96E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B96E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for INIntentParameterCombinationDenyList()
{
  return &type metadata for INIntentParameterCombinationDenyList;
}

uint64_t getEnumTagSinglePayload for DeniedIntent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DeniedIntent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C5E5C64);
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

ValueMetadata *type metadata accessor for DeniedIntent.CodingKeys()
{
  return &type metadata for DeniedIntent.CodingKeys;
}

unint64_t sub_25C5E5CA0()
{
  unint64_t result = qword_26A5B96F0;
  if (!qword_26A5B96F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B96F0);
  }
  return result;
}

unint64_t sub_25C5E5CF0()
{
  unint64_t result = qword_26A5B96F8;
  if (!qword_26A5B96F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B96F8);
  }
  return result;
}

unint64_t sub_25C5E5D40()
{
  unint64_t result = qword_26A5B9700;
  if (!qword_26A5B9700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9700);
  }
  return result;
}

unint64_t sub_25C5E5D8C()
{
  unint64_t result = qword_26A5B9710;
  if (!qword_26A5B9710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9710);
  }
  return result;
}

unint64_t sub_25C5E5DD8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_23_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5B9718);
    sub_25C5E5E44(v4);
    unint64_t result = OUTLINED_FUNCTION_20_1();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25C5E5E44(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_23_1(a1);
  if (!result)
  {
    type metadata accessor for DeniedIntent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for INIntentParameterCombinationDenyList.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for INIntentParameterCombinationDenyList.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C5E5F70);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C5E5F98()
{
  return 0;
}

ValueMetadata *type metadata accessor for INIntentParameterCombinationDenyList.CodingKeys()
{
  return &type metadata for INIntentParameterCombinationDenyList.CodingKeys;
}

unint64_t sub_25C5E5FB4()
{
  unint64_t result = qword_26A5B9748;
  if (!qword_26A5B9748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9748);
  }
  return result;
}

unint64_t sub_25C5E6004()
{
  unint64_t result = qword_26A5B9750;
  if (!qword_26A5B9750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9750);
  }
  return result;
}

unint64_t sub_25C5E6054()
{
  unint64_t result = qword_26A5B9758;
  if (!qword_26A5B9758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9758);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_25C5EEA60();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_25C5EEA80();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t v3 = *(void *)(v1 - 232);
  return sub_25C5CD724(v3, v0, (uint64_t *)(v1 - 160));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_25C5CD724(v0, v1, (uint64_t *)(v2 - 160));
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_25C5EEB60();
}

uint64_t OUTLINED_FUNCTION_17_2@<X0>(uint64_t a1@<X8>)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t a1, ...)
{
  va_start(va, a1);
  return sub_25C5E3E00((uint64_t *)va, v1, v2);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_1(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_25C5E6294(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_source;
  uint64_t v4 = *MEMORY[0x263F6CCC0];
  uint64_t v5 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  *(void *)(v1 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_histogram) = a1;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51F48]), sel_init);
  *(void *)(v1 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_appShortcutProvider) = v6;
  return v1;
}

void sub_25C5E6344(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v73 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v72 = v9;
  uint64_t v71 = sub_25C5EE330();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_8();
  uint64_t v70 = v13;
  sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_8();
  uint64_t v85 = MEMORY[0x263F8EE78];
  id v15 = objc_msgSend(a1, sel_orderedPhrases);
  sub_25C5E7E78();
  unint64_t v16 = sub_25C5EE6B0();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_3;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    char v60 = OUTLINED_FUNCTION_3_10();
    uint64_t v61 = v85;
    if ((v60 & 1) == 0)
    {
      uint64_t v62 = sub_25C5E6CB0(v85);
      swift_bridgeObjectRelease();
      uint64_t v61 = v62;
    }
    uint64_t v63 = *(void *)(v61 + 16);
    if (v63)
    {
      v84[0] = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25C5EE8F0();
      uint64_t v64 = 32;
      do
      {
        swift_retain();
        sub_25C5EE8D0();
        sub_25C5EE900();
        sub_25C5EE910();
        sub_25C5EE8E0();
        v64 += 16;
        --v63;
      }
      while (v63);
      unint64_t v65 = v84[0];
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v65 = MEMORY[0x263F8EE78];
    }
    sub_25C5C5524(v65);
    return;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v17) {
    goto LABEL_31;
  }
LABEL_3:
  if (v17 >= 1)
  {
    uint64_t v18 = 0;
    unint64_t v74 = v16 & 0xC000000000000001;
    unsigned int v69 = *MEMORY[0x263F6CCC0];
    unint64_t v68 = (void (**)(uint64_t, void, uint64_t))(v11 + 104);
    unint64_t v76 = v16;
    char v77 = a1;
    uint64_t v75 = v17;
    uint64_t v81 = a2;
    while (1)
    {
      uint64_t v80 = v18;
      if (v74) {
        id v19 = (id)MEMORY[0x26118B200]();
      }
      else {
        id v19 = *(id *)(v16 + 8 * v18 + 32);
      }
      unint64_t v20 = v19;
      id v21 = objc_msgSend(v19, sel_localizedPhrase);
      sub_25C5EE580();

      uint64_t v22 = sub_25C5EE1B0();
      uint64_t v23 = *(void *)(v22 + 16);
      unint64_t v24 = a3;
      swift_bridgeObjectRetain();
      uint64_t v82 = a2;
      if (v23)
      {
        unint64_t v24 = a3;
        unint64_t v25 = sub_25C5B0114(a2, a3);
        uint64_t v82 = a2;
        if (v26)
        {
          BOOL v27 = (uint64_t *)(*(void *)(v22 + 56) + 16 * v25);
          unint64_t v24 = v27[1];
          uint64_t v82 = *v27;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      char v28 = OUTLINED_FUNCTION_3_10();
      sub_25C5B4254((uint64_t)a4, (uint64_t)v84);
      if (v28)
      {
        __swift_project_boxed_opaque_existential_1(v84, v84[3]);
        id v29 = objc_msgSend(a1, sel_actionIdentifier);
        sub_25C5EE580();

        char v30 = sub_25C5BBF24();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
        if ((v30 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          sub_25C5EE490();
          swift_bridgeObjectRetain_n();
          id v44 = a1;
          swift_bridgeObjectRetain();
          unint64_t v45 = sub_25C5EE4A0();
          os_log_type_t v46 = sub_25C5EE780();
          if (os_log_type_enabled(v45, v46))
          {
            uint64_t v78 = v20;
            uint64_t v47 = swift_slowAlloc();
            uint64_t v67 = swift_slowAlloc();
            v84[0] = v67;
            *(_DWORD *)uint64_t v47 = 136315650;
            os_log_type_t v66 = v46;
            id v48 = objc_msgSend(v44, sel_actionIdentifier);
            uint64_t v49 = sub_25C5EE580();
            unint64_t v51 = v50;

            sub_25C5CD724(v49, v51, v84);
            sub_25C5EE7F0();

            swift_bridgeObjectRelease();
            *(_WORD *)(v47 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v52 = sub_25C5CD724(v81, a3, v84);
            OUTLINED_FUNCTION_6_3(v52);
            sub_25C5EE7F0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v47 + 22) = 2080;
            a2 = v81;
            swift_bridgeObjectRetain();
            uint64_t v53 = sub_25C5CD724(v82, v24, v84);
            OUTLINED_FUNCTION_6_3(v53);
            a1 = v77;
            sub_25C5EE7F0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_25C5AA000, v45, v66, "First party app shortcut not approved in the allow list\nactionIdentifier: %s\nappBundleId: %s\niosVersionBundleId: %s", (uint8_t *)v47, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x26118BA70](v67, -1, -1);
            MEMORY[0x26118BA70](v47, -1, -1);

            uint64_t v54 = OUTLINED_FUNCTION_4_6();
            v55(v54);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();

            uint64_t v56 = OUTLINED_FUNCTION_4_6();
            v57(v56);
            a2 = v81;
          }
LABEL_27:
          uint64_t v38 = v75;
          unint64_t v16 = v76;
          goto LABEL_28;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
      }
      __swift_project_boxed_opaque_existential_1(a4, a4[3]);
      id v31 = objc_msgSend(a1, sel_actionIdentifier);
      sub_25C5EE580();

      sub_25C5BC058();
      uint64_t v33 = v32;
      swift_bridgeObjectRelease();
      if (v33) {
        swift_bridgeObjectRelease();
      }
      sub_25C5EE410();
      swift_bridgeObjectRetain();
      id v34 = objc_msgSend(v77, sel_actionIdentifier);
      sub_25C5EE580();

      (*v68)(v70, v69, v71);
      uint64_t v35 = sub_25C5EE1D0();
      __swift_storeEnumTagSinglePayload(v72, 1, 1, v35);
      uint64_t v36 = sub_25C5EDF30();
      __swift_storeEnumTagSinglePayload(v73, 1, 1, v36);
      uint64_t v37 = sub_25C5EE3B0();
      if (!objc_msgSend(v20, sel_isPrimary))
      {
        uint64_t v39 = v85;
        swift_retain();
        id v40 = v20;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25C5E9B98(0, *(void *)(v39 + 16) + 1, 1, v39);
          uint64_t v39 = v58;
        }
        a2 = v81;
        unint64_t v42 = *(void *)(v39 + 16);
        unint64_t v41 = *(void *)(v39 + 24);
        if (v42 >= v41 >> 1)
        {
          sub_25C5E9B98(v41 > 1, v42 + 1, 1, v39);
          uint64_t v39 = v59;
        }
        *(void *)(v39 + 16) = v42 + 1;
        uint64_t v43 = v39 + 16 * v42;
        *(void *)(v43 + 32) = v37;
        *(void *)(v43 + 40) = v40;
        swift_release();

        uint64_t v85 = v39;
        a1 = v77;
        goto LABEL_27;
      }
      sub_25C5E76F4(0, 0, v37, (uint64_t)v20);
      unint64_t v16 = v76;
      a1 = v77;
      uint64_t v38 = v75;
      a2 = v81;
LABEL_28:
      uint64_t v18 = v80 + 1;
      if (v38 == v80 + 1) {
        goto LABEL_31;
      }
    }
  }
  __break(1u);
}

uint64_t sub_25C5E6CB0(uint64_t a1)
{
  uint64_t v62 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9798);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v57 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v14 = (void *)sub_25C5EE560();
  uint64_t v64 = *(void *)(a1 + 16);
  if (!v64)
  {
    uint64_t v67 = v13;
    uint64_t v55 = 0;
LABEL_36:
    swift_bridgeObjectRelease();
    sub_25C5C37C4(v55);
    return v67;
  }
  uint64_t v61 = (void (**)(char *, uint64_t))(v3 + 8);
  swift_bridgeObjectRetain();
  os_log_type_t v66 = 0;
  uint64_t v15 = 0;
  uint64_t v67 = MEMORY[0x263F8EE78];
  *(void *)&long long v16 = 136315394;
  long long v58 = v16;
  v57[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v59 = a1;
  char v60 = v10;
  unint64_t v65 = v6;
  uint64_t v63 = v12;
  while (1)
  {
    long long v69 = *(_OWORD *)(a1 + 16 * v15 + 32);
    swift_retain();
    id v68 = *((id *)&v69 + 1);
    id v17 = objc_msgSend(v68, sel_parameterIdentifier);
    if (v17)
    {
      uint64_t v18 = v17;
      sub_25C5EDF50();

      uint64_t v19 = sub_25C5EDF60();
      uint64_t v20 = (uint64_t)v10;
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v19 = sub_25C5EDF60();
      uint64_t v20 = (uint64_t)v10;
      uint64_t v21 = 1;
    }
    __swift_storeEnumTagSinglePayload(v20, v21, 1, v19);
    sub_25C5E7EB8((uint64_t)v10, (uint64_t)v12);
    sub_25C5EDF60();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v19) == 1)
    {
      sub_25C5E7F20((uint64_t)v12);
      uint64_t v22 = 0;
      unint64_t v23 = 0xE000000000000000;
    }
    else
    {
      uint64_t v22 = sub_25C5EDF40();
      unint64_t v24 = v12;
      unint64_t v23 = v25;
      (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v24, v19);
    }
    if (v14[2])
    {
      swift_bridgeObjectRetain();
      unint64_t v26 = sub_25C5B0114(v22, v23);
      if (v27)
      {
        uint64_t v28 = *(void *)(v14[7] + 8 * v26);
        swift_bridgeObjectRelease();
        if (v28 >= 1)
        {
          swift_bridgeObjectRelease();

          swift_release();
          goto LABEL_33;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    sub_25C5EE490();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    id v29 = sub_25C5EE4A0();
    os_log_type_t v30 = sub_25C5EE780();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v70 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = v58;
      swift_bridgeObjectRetain();
      *(void *)(v31 + 4) = sub_25C5CD724(v22, v23, (uint64_t *)&v70);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v32 = sub_25C5EE3C0();
      *(void *)(v31 + 14) = sub_25C5CD724(v32, v33, (uint64_t *)&v70);
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v29, v30, "Adding phrase with identifier: %s, phrase: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();

      (*v61)(v65, v62);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      (*v61)(v6, v62);
    }
    uint64_t v35 = (uint64_t)v66;
    uint64_t v34 = v67;
    swift_retain();
    id v68 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_25C5E9B98(0, *(void *)(v34 + 16) + 1, 1, v34);
      uint64_t v34 = v53;
    }
    unint64_t v37 = *(void *)(v34 + 16);
    unint64_t v36 = *(void *)(v34 + 24);
    if (v37 >= v36 >> 1)
    {
      sub_25C5E9B98(v36 > 1, v37 + 1, 1, v34);
      uint64_t v34 = v54;
    }
    *(void *)(v34 + 16) = v37 + 1;
    uint64_t v67 = v34;
    *(_OWORD *)(v34 + 16 * v37 + 32) = v69;
    sub_25C5C37C4(v35);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v70 = v14;
    unint64_t v38 = sub_25C5B0114(v22, v23);
    if (__OFADD__(v14[2], (v39 & 1) == 0)) {
      break;
    }
    unint64_t v40 = v38;
    char v41 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9438);
    char v42 = sub_25C5EE970();
    uint64_t v6 = v65;
    uint64_t v10 = v60;
    if (v42)
    {
      unint64_t v43 = sub_25C5B0114(v22, v23);
      if ((v41 & 1) != (v44 & 1)) {
        goto LABEL_40;
      }
      unint64_t v40 = v43;
    }
    uint64_t v14 = v70;
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
    {
      v14[(v40 >> 6) + 8] |= 1 << v40;
      unint64_t v45 = (uint64_t *)(v14[6] + 16 * v40);
      *unint64_t v45 = v22;
      v45[1] = v23;
      *(void *)(v14[7] + 8 * v40) = 0;
      uint64_t v46 = v14[2];
      uint64_t v47 = v46 + 1;
      BOOL v48 = __OFADD__(v46, 1);
      swift_bridgeObjectRetain();
      if (v48) {
        goto LABEL_39;
      }
      v14[2] = v47;
    }
    swift_bridgeObjectRetain();
    uint64_t v49 = v14[7];
    swift_bridgeObjectRelease();
    uint64_t v50 = *(void *)(v49 + 8 * v40);
    BOOL v51 = __OFADD__(v50, 1);
    uint64_t v52 = v50 + 1;
    if (v51) {
      goto LABEL_38;
    }
    *(void *)(v49 + 8 * v40) = v52;
    swift_bridgeObjectRelease();
    swift_release();

    os_log_type_t v66 = sub_25C5C30C4;
    a1 = v59;
LABEL_33:
    ++v15;
    uint64_t v12 = v63;
    if (v64 == v15)
    {
      swift_bridgeObjectRelease();
      uint64_t v55 = (uint64_t)v66;
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = sub_25C5EEAC0();
  __break(1u);
  return result;
}

uint64_t sub_25C5E7328(unint64_t a1)
{
  uint64_t v2 = sub_25C5EE4B0();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C5EE490();
  uint64_t v8 = sub_25C5EE4A0();
  os_log_type_t v9 = sub_25C5EE770();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_25C5AA000, v8, v9, "Ranking App Shortcut phrases", v10, 2u);
    OUTLINED_FUNCTION_3();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  swift_retain();
  sub_25C5BE05C(a1);
  return swift_release();
}

uint64_t sub_25C5E7460()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete18AppShortcutsSource_source;
  uint64_t v2 = sub_25C5EE330();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  return v0;
}

uint64_t sub_25C5E74E4()
{
  sub_25C5E7460();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C5E753C()
{
  return type metadata accessor for AppShortcutsSource();
}

uint64_t type metadata accessor for AppShortcutsSource()
{
  uint64_t result = qword_26A5B9768;
  if (!qword_26A5B9768) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5E758C()
{
  uint64_t result = sub_25C5EE330();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C5E7638(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A5B9780 + dword_26A5B9780);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25C5C3970;
  return v7(v4, v3);
}

uint64_t sub_25C5E76F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = result;
  uint64_t v9 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v11 > *(void *)(v6 + 24) >> 1)
  {
    if (v7 <= v11) {
      uint64_t v15 = v7 + v10;
    }
    else {
      uint64_t v15 = v7;
    }
    sub_25C5E9B98(isUniquelyReferenced_nonNull_native, v15, 1, v6);
    uint64_t v6 = v16;
  }
  uint64_t v17 = v6 + 32 + 16 * v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9790);
  uint64_t result = swift_arrayDestroy();
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v18 = *(void *)(v6 + 16);
  if (__OFSUB__(v18, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_25C5EA238((char *)(v6 + 32 + 16 * a2), v18 - a2, (char *)(v17 + 16));
  uint64_t v19 = *(void *)(v6 + 16);
  BOOL v20 = __OFADD__(v19, v10);
  uint64_t v21 = v19 + v10;
  if (!v20)
  {
    *(void *)(v6 + 16) = v21;
LABEL_16:
    *(void *)uint64_t v17 = a3;
    *(void *)(v17 + 8) = a4;
    *uint64_t v4 = v6;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_25C5E7814(uint64_t a1, void *a2)
{
  v2[9] = a2;
  v2[10] = *a2;
  uint64_t v4 = sub_25C5EE4B0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for DefaultEligibilityCriteria();
  v2[15] = v5;
  v2[5] = v5;
  v2[6] = &off_2709C32F0;
  v2[2] = a1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_25C5E7938, 0, 0);
}

uint64_t sub_25C5E7938()
{
  BOOL v20 = v0;
  unint64_t v1 = v0 + 2;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 2, v0[15]);
  __swift_project_boxed_opaque_existential_1((void *)(*v2 + 16), *(void *)(*v2 + 40));
  uint64_t v3 = swift_bridgeObjectRetain();
  v0[16] = sub_25C5B0684(v3);
  swift_bridgeObjectRelease();
  sub_25C5EE490();
  uint64_t v4 = sub_25C5EE4A0();
  os_log_type_t v5 = sub_25C5EE770();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v15 = v0[12];
    uint64_t v16 = v0[11];
    uint64_t v17 = v0[14];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = sub_25C5EEB60();
    v0[8] = sub_25C5CD724(v7, v8, &v19);
    unint64_t v1 = v0 + 2;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v4, v5, "%s: Fetching phrases", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v9(v17, v16);
  }
  else
  {
    uint64_t v10 = v0[14];
    uint64_t v12 = v0[11];
    uint64_t v11 = v0[12];

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v9(v10, v12);
  }
  v0[17] = v9;
  __swift_project_boxed_opaque_existential_1(v1, v0[5]);
  uint64_t v18 = (uint64_t (__cdecl *)())((char *)&dword_26A5B9480 + dword_26A5B9480);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[18] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_25C5E7BB4;
  return v18();
}

uint64_t sub_25C5E7BB4()
{
  OUTLINED_FUNCTION_6();
  *(void *)(v1 + 152) = v0;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_25C5E7CB0, 0, 0);
}

uint64_t sub_25C5E7CB0()
{
  sub_25C5EE490();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_25C5EE4A0();
  os_log_type_t v2 = sub_25C5EE770();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = *(void *)(v0 + 152);
  if (v3)
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 134217984;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_25C5EE9B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 56) = v6;
    sub_25C5EE7F0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C5AA000, v1, v2, "%ld phrase(s) created from App Shortcuts using LNAutoShortcutsProvider", v5, 0xCu);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v7 = *(void *)(v0 + 152);
  (*(void (**)(void, void))(v0 + 136))(*(void *)(v0 + 104), *(void *)(v0 + 88));
  sub_25C5E7328(v7);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v9 = *(void *)(v0 + 152);
  return v8(v9);
}

unint64_t sub_25C5E7E78()
{
  unint64_t result = qword_26A5B9788;
  if (!qword_26A5B9788)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5B9788);
  }
  return result;
}

uint64_t sub_25C5E7EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5E7F20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9798);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return sub_25C5EE640();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t sub_25C5E7FE8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v5 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v3 = v6;
    BOOL v6 = v6 || v5 == v2;
    if (v6) {
      return v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5E8048(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25C5EEA80();
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
    if (v12 || (sub_25C5EEA80() & 1) != 0) {
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

uint64_t sub_25C5E8110(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x657361726870 && a2 == 0xE600000000000000;
  if (v3 || (sub_25C5EEA80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x657079546E6F6369 && a2 == 0xE800000000000000;
    if (v6 || (sub_25C5EEA80() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6564496E6F6369 && a2 == 0xEE00726569666974;
      if (v7 || (sub_25C5EEA80() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x4464656C62616E65 && a2 == 0xEE00736563697665;
        if (v8 || (sub_25C5EEA80() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6C646E7542534F69 && a2 == 0xEB00000000644965;
          if (v9 || (sub_25C5EEA80() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x800000025C5F0B80 || (sub_25C5EEA80() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x746E65746E69 && a2 == 0xE600000000000000)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            char v11 = sub_25C5EEA80();
            swift_bridgeObjectRelease();
            if (v11) {
              return 6;
            }
            else {
              return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_25C5E83E4()
{
  return 7;
}

unint64_t sub_25C5E83EC(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x657079546E6F6369;
      break;
    case 2:
      unint64_t result = 0x6E6564496E6F6369;
      break;
    case 3:
      unint64_t result = 0x4464656C62616E65;
      break;
    case 4:
      unint64_t result = 0x6C646E7542534F69;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x746E65746E69;
      break;
    default:
      unint64_t result = 0x657361726870;
      break;
  }
  return result;
}

uint64_t sub_25C5E84F0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9860);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5ED318();
  sub_25C5EEB20();
  OUTLINED_FUNCTION_11_5();
  if (!v1)
  {
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_11_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B351090);
    sub_25C5ED364(&qword_26A5B9868);
    sub_25C5EEA60();
    OUTLINED_FUNCTION_11_5();
    OUTLINED_FUNCTION_11_5();
    sub_25C5EEA30();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_25C5E86F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9850);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5ED318();
  sub_25C5EEB10();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v6 = OUTLINED_FUNCTION_10_4();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  uint64_t v25 = OUTLINED_FUNCTION_10_4();
  uint64_t v26 = v6;
  uint64_t v10 = v9;
  swift_bridgeObjectRetain();
  uint64_t v28 = v10;
  uint64_t v24 = OUTLINED_FUNCTION_10_4();
  uint64_t v12 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B351090);
  sub_25C5ED364((unint64_t *)&qword_26B351098);
  swift_bridgeObjectRetain();
  sub_25C5EEA20();
  swift_bridgeObjectRetain();
  uint64_t v23 = OUTLINED_FUNCTION_10_4();
  uint64_t v27 = v13;
  swift_bridgeObjectRetain();
  uint64_t v21 = OUTLINED_FUNCTION_10_4();
  uint64_t v22 = v14;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_25C5EE9F0();
  uint64_t v17 = v16;
  uint64_t v20 = v15;
  OUTLINED_FUNCTION_5_6();
  v18();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v26;
  a2[1] = v8;
  a2[2] = v25;
  a2[3] = v28;
  a2[4] = v24;
  a2[5] = v12;
  a2[6] = v29;
  a2[7] = v23;
  a2[8] = v27;
  a2[9] = v21;
  a2[10] = v22;
  a2[11] = v20;
  a2[12] = v17;
  return result;
}

uint64_t sub_25C5E8BE0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6465766F72707061 && a2 == 0xEF73657361726850)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25C5EEA80();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25C5E8C80()
{
  return 0x6465766F72707061;
}

uint64_t sub_25C5E8CA4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9820);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5ECCA4();
  sub_25C5EEB20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9808);
  sub_25C5ECD3C(&qword_26A5B9828, (void (*)(void))sub_25C5ECDAC);
  sub_25C5EEA60();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
}

void *sub_25C5E8DF4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B97F8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_1();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C5ECCA4();
  sub_25C5EEB10();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9808);
    sub_25C5ECD3C(&qword_26A5B9810, (void (*)(void))sub_25C5ECCF0);
    sub_25C5EEA20();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
    uint64_t v10 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v10;
}

unint64_t sub_25C5E8F6C()
{
  return sub_25C5E83EC(*v0);
}

uint64_t sub_25C5E8F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5E8110(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5E8F9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5E83E4();
  *a1 = result;
  return result;
}

uint64_t sub_25C5E8FC4(uint64_t a1)
{
  unint64_t v2 = sub_25C5ED318();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5E9000(uint64_t a1)
{
  unint64_t v2 = sub_25C5ED318();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25C5E903C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (void *)sub_25C5E86F4(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x68uLL);
  }
  return result;
}

uint64_t sub_25C5E9088(void *a1)
{
  return sub_25C5E84F0(a1);
}

uint64_t sub_25C5E90A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5E8BE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25C5E90D0(uint64_t a1)
{
  unint64_t v2 = sub_25C5ECCA4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C5E910C(uint64_t a1)
{
  unint64_t v2 = sub_25C5ECCA4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_25C5E9148@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25C5E8DF4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_25C5E9174(void *a1)
{
  return sub_25C5E8CA4(a1);
}

uint64_t sub_25C5E9190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  BOOL v10 = a1 == 0x6E6F6349707061 && a2 == 0xE700000000000000;
  if (v10 || (OUTLINED_FUNCTION_9_3() & 1) != 0)
  {
    *a7 = a5;
    a7[1] = a6;
    uint64_t v15 = *MEMORY[0x263F74C98];
    uint64_t v16 = sub_25C5EE1D0();
    OUTLINED_FUNCTION_23_0();
    (*(void (**)(void *, uint64_t, uint64_t))(v17 + 104))(a7, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)a7, 0, 1, v16);
LABEL_20:
    return swift_bridgeObjectRetain();
  }
  BOOL v18 = a1 == 0x4963696870617267 && a2 == 0xEB000000006E6F63;
  if (v18 || (OUTLINED_FUNCTION_9_3() & 1) != 0)
  {
    *a7 = a3;
    a7[1] = a4;
    uint64_t v19 = (unsigned int *)MEMORY[0x263F74C80];
LABEL_19:
    uint64_t v23 = *v19;
    uint64_t v24 = sub_25C5EE1D0();
    OUTLINED_FUNCTION_23_0();
    (*(void (**)(void *, uint64_t, uint64_t))(v25 + 104))(a7, v23, v24);
    __swift_storeEnumTagSinglePayload((uint64_t)a7, 0, 1, v24);
    goto LABEL_20;
  }
  BOOL v20 = a1 == 0x6C6F626D7973 && a2 == 0xE600000000000000;
  if (v20 || (OUTLINED_FUNCTION_9_3() & 1) != 0)
  {
    uint64_t v21 = (uint64_t)a7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5B97E0) + 48);
    *a7 = a3;
    a7[1] = a4;
    uint64_t v22 = sub_25C5EE1C0();
    __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
    uint64_t v19 = (unsigned int *)MEMORY[0x263F74C90];
    goto LABEL_19;
  }
  uint64_t v27 = sub_25C5EE1D0();

  return __swift_storeEnumTagSinglePayload((uint64_t)a7, 1, 1, v27);
}

uint64_t sub_25C5E93F0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C5EE9B0();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      if (v2 >= 1)
      {
        uint64_t v3 = 0;
        uint64_t v4 = MEMORY[0x263F8EE78];
        while (1)
        {
          if ((a1 & 0xC000000000000001) != 0) {
            MEMORY[0x26118B200](v3, a1);
          }
          else {
            swift_retain();
          }
          uint64_t v5 = sub_25C5EE360();
          if (v6)
          {
            uint64_t v7 = 0;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
LABEL_15:
              sub_25C5E9998(0, *(void *)(v4 + 16) + 1, 1, v4);
              uint64_t v4 = v10;
            }
          }
          else
          {
            uint64_t v7 = v5;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              goto LABEL_15;
            }
          }
          unint64_t v9 = *(void *)(v4 + 16);
          unint64_t v8 = *(void *)(v4 + 24);
          if (v9 >= v8 >> 1)
          {
            sub_25C5E9998(v8 > 1, v9 + 1, 1, v4);
            uint64_t v4 = v11;
          }
          ++v3;
          *(void *)(v4 + 16) = v9 + 1;
          *(void *)(v4 + 8 * v9 + 32) = v7;
          swift_release();
          if (v2 == v3) {
            goto LABEL_18;
          }
        }
      }
      __break(1u);
      goto LABEL_34;
    }
  }
  uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_18:
  swift_bridgeObjectRelease();
  uint64_t v17 = (char *)v4;
  swift_bridgeObjectRetain();
  sub_25C5EA510(&v17);
  swift_bridgeObjectRelease();
  uint64_t v12 = v17;
  if (v2)
  {
    if (v2 < 1)
    {
LABEL_34:
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x26118B200](v13, a1);
      }
      else {
        swift_retain();
      }
      ++v13;
      double v14 = COERCE_DOUBLE(sub_25C5EE360());
      if (v15) {
        double v14 = 0.0;
      }
      sub_25C5ED85C((uint64_t)v12, v14);
      sub_25C5EE370();
      swift_release();
    }
    while (v2 != v13);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_25C5E967C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_source;
  sub_25C5EE330();
  OUTLINED_FUNCTION_23_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_appFinderProvider);
  return v0;
}

uint64_t sub_25C5E9708()
{
  sub_25C5E967C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C5E9760()
{
  return type metadata accessor for StaticSuggestionsSource();
}

uint64_t type metadata accessor for StaticSuggestionsSource()
{
  uint64_t result = qword_26A5B97A0;
  if (!qword_26A5B97A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C5E97B0()
{
  uint64_t result = sub_25C5EE330();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C5E984C(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A5B97B8 + dword_26A5B97B8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25C5C3970;
  return v7(v4, v3);
}

uint64_t sub_25C5E9908(uint64_t a1)
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_1();
    uint64_t result = sub_25C5EE9A0();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_25C5EE6F0();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void sub_25C5E9998(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_13_3();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_25_1();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_12_4();
    }
  }
  OUTLINED_FUNCTION_24_1();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B97D8);
    uint64_t v10 = (char *)OUTLINED_FUNCTION_23_2();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_22_2(v11 - 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (a1)
  {
    sub_25C5EA0B4((char *)(a4 + 32), v4, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C5E9CB4(0, v4, v12, a4);
  }
}

void sub_25C5E9A5C(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25C5E9A90(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25C5E9AA4(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25C5E9AB8(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    OUTLINED_FUNCTION_13_3();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_25_1();
      if (v10)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_12_4();
    }
  }
  else
  {
    uint64_t v9 = a2;
  }
  uint64_t v12 = *(void *)(a4 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    double v14 = (char *)OUTLINED_FUNCTION_23_2();
    size_t v15 = _swift_stdlib_malloc_size(v14);
    *((void *)v14 + 2) = v12;
    *((void *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 32);
  }
  else
  {
    double v14 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v16 = v14 + 32;
  if (a1)
  {
    sub_25C5EA1DC((char *)(a4 + 32), v12, v16);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C5E9EA0(0, v12, (unint64_t)v16, a4, a6);
  }
}

void sub_25C5E9B98(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_25C5E9BCC(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    OUTLINED_FUNCTION_13_3();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_25_1();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_12_4();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v16 = (void *)OUTLINED_FUNCTION_23_2();
    size_t v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 16);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  }
  BOOL v18 = v16 + 4;
  if (a1)
  {
    a7(a4 + 32, v14, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    a6(0, v14, v18, a4);
  }
}

char *sub_25C5E9CB4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    char v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_25C5EE9D0();
  __break(1u);
  return result;
}

uint64_t sub_25C5E9DA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25C5EE9D0();
  __break(1u);
  return result;
}

uint64_t sub_25C5E9EA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 32 * a1 + 32;
    unint64_t v7 = a3 + 32 * v5;
    if (v6 >= v7 || v6 + 32 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  OUTLINED_FUNCTION_1();
  uint64_t result = sub_25C5EE9D0();
  __break(1u);
  return result;
}

uint64_t sub_25C5E9F9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B9790);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_25C5EE9D0();
  __break(1u);
  return result;
}

char *sub_25C5EA0B4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C5EE9D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_25C5EA148(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C5EE9D0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_25C5EA1DC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    uint64_t result = (char *)OUTLINED_FUNCTION_26_1();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_20_2(a3, result);
  }
  return result;
}

char *sub_25C5EA238(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    uint64_t result = (char *)OUTLINED_FUNCTION_26_1();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_20_2(a3, result);
  }
  return result;
}

unint64_t sub_25C5EA298(unint64_t result, char a2, uint64_t a3)
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

char *sub_25C5EA2BC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B97D8);
    char v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  char v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25C5EA0B4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C5AFC10(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_25C5EA3A0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_13_3();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_25_1();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_12_4();
    }
  }
  OUTLINED_FUNCTION_24_1();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B351370);
    char v10 = (char *)OUTLINED_FUNCTION_23_2();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_22_2(v11 - 32);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  char v13 = (char *)(a4 + 32);
  if (a1)
  {
    sub_25C5EA148(v13, v4, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C5AFCBC((unint64_t)v13, v4, (unint64_t)v12);
  }
  swift_release();
}

void sub_25C5EA458(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_13_3();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_25_1();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_12_4();
    }
  }
  OUTLINED_FUNCTION_24_1();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B97E8);
    char v10 = (char *)OUTLINED_FUNCTION_23_2();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_22_2(v11 - 32);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  char v13 = (char *)(a4 + 32);
  if (a1)
  {
    sub_25C5EA1DC(v13, v4, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C5AFD6C((unint64_t)v13, v4, (unint64_t)v12);
  }
  swift_release();
}

uint64_t sub_25C5EA510(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C5EAED4((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_25C5EA57C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_25C5EA57C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_25C5EEA70();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_25C5EAB60(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_124;
  }
  uint64_t v5 = result;
  uint64_t result = sub_25C5E9908(v3 / 2);
  uint64_t v85 = a1;
  uint64_t v86 = result;
  __dst = v6;
  uint64_t v88 = v3;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v28 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_90:
    if (v28 < 2)
    {
LABEL_101:
      uint64_t result = swift_bridgeObjectRelease();
      if (v88 >= -1)
      {
        *(void *)(v86 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_129;
    }
    uint64_t v78 = *v85;
    while (1)
    {
      unint64_t v79 = v28 - 2;
      if (v28 < 2) {
        break;
      }
      if (!v78) {
        goto LABEL_133;
      }
      uint64_t v80 = *(void *)(v9 + 32 + 16 * v79);
      uint64_t v81 = *(void *)(v9 + 32 + 16 * (v28 - 1) + 8);
      uint64_t result = sub_25C5EABB8((char *)(v78 + 8 * v80), (char *)(v78 + 8 * *(void *)(v9 + 32 + 16 * (v28 - 1))), v78 + 8 * v81, __dst);
      if (v1) {
        goto LABEL_86;
      }
      if (v81 < v80) {
        goto LABEL_119;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_25C5EAE2C(v9);
        uint64_t v9 = result;
      }
      if (v79 >= *(void *)(v9 + 16)) {
        goto LABEL_120;
      }
      uint64_t v82 = (void *)(v9 + 32 + 16 * v79);
      void *v82 = v80;
      v82[1] = v81;
      unint64_t v83 = *(void *)(v9 + 16);
      if (v28 > v83) {
        goto LABEL_121;
      }
      uint64_t result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v28 - 1)), (const void *)(v9 + 32 + 16 * v28), 16 * (v83 - v28));
      *(void *)(v9 + 16) = v83 - 1;
      unint64_t v28 = v83 - 1;
      if (v83 <= 2) {
        goto LABEL_101;
      }
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
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
    return result;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v84 = *a1 - 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v87 = v5;
  uint64_t v89 = *a1;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 < v3)
    {
      double v11 = *(double *)(v8 + 8 * v7);
      double v12 = *(double *)(v8 + 8 * v10);
      uint64_t v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        double v13 = v11;
        while (1)
        {
          double v14 = v13;
          double v13 = *(double *)(v8 + 8 * v7);
          if (v11 < v12 == v13 >= v14) {
            break;
          }
          if (++v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v11 < v12)
      {
        if (v7 < v10) {
          goto LABEL_126;
        }
        if (v10 < v7)
        {
          uint64_t v15 = (uint64_t *)(v84 + 8 * v7);
          uint64_t v16 = v7;
          uint64_t v17 = v10;
          BOOL v18 = (uint64_t *)(v8 + 8 * v10);
          do
          {
            if (v17 != --v16)
            {
              if (!v8) {
                goto LABEL_132;
              }
              uint64_t v19 = *v18;
              *BOOL v18 = *v15;
              *uint64_t v15 = v19;
            }
            ++v17;
            --v15;
            ++v18;
          }
          while (v17 < v16);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_123;
      }
      if (v7 - v10 < v5)
      {
        uint64_t v20 = v10 + v5;
        if (__OFADD__(v10, v5)) {
          goto LABEL_127;
        }
        if (v20 >= v3) {
          uint64_t v20 = v3;
        }
        if (v20 < v10) {
          goto LABEL_128;
        }
        if (v7 != v20)
        {
          uint64_t v21 = (double *)(v84 + 8 * v7);
          do
          {
            double v22 = *(double *)(v8 + 8 * v7);
            uint64_t v23 = v10;
            uint64_t v24 = v21;
            do
            {
              double v25 = *v24;
              if (v22 >= *v24) {
                break;
              }
              if (!v8) {
                goto LABEL_130;
              }
              *uint64_t v24 = v22;
              v24[1] = v25;
              --v24;
              ++v23;
            }
            while (v7 != v23);
            ++v7;
            ++v21;
          }
          while (v7 != v20);
          uint64_t v7 = v20;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_122;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_25C5EAD34(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v27 = *(void *)(v9 + 16);
    unint64_t v26 = *(void *)(v9 + 24);
    unint64_t v28 = v27 + 1;
    uint64_t v8 = v89;
    if (v27 >= v26 >> 1)
    {
      uint64_t result = (uint64_t)sub_25C5EAD34((char *)(v26 > 1), v27 + 1, 1, (char *)v9);
      uint64_t v8 = v89;
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v28;
    uint64_t v29 = v9 + 32;
    os_log_type_t v30 = (uint64_t *)(v9 + 32 + 16 * v27);
    *os_log_type_t v30 = v10;
    v30[1] = v7;
    if (v27) {
      break;
    }
    unint64_t v28 = 1;
LABEL_81:
    uint64_t v5 = v87;
    uint64_t v3 = v88;
    if (v7 >= v88) {
      goto LABEL_90;
    }
  }
  while (1)
  {
    unint64_t v31 = v28 - 1;
    if (v28 >= 4)
    {
      unint64_t v36 = v29 + 16 * v28;
      uint64_t v37 = *(void *)(v36 - 64);
      uint64_t v38 = *(void *)(v36 - 56);
      BOOL v42 = __OFSUB__(v38, v37);
      uint64_t v39 = v38 - v37;
      if (v42) {
        goto LABEL_107;
      }
      uint64_t v41 = *(void *)(v36 - 48);
      uint64_t v40 = *(void *)(v36 - 40);
      BOOL v42 = __OFSUB__(v40, v41);
      uint64_t v34 = v40 - v41;
      char v35 = v42;
      if (v42) {
        goto LABEL_108;
      }
      unint64_t v43 = v28 - 2;
      char v44 = (uint64_t *)(v29 + 16 * (v28 - 2));
      uint64_t v46 = *v44;
      uint64_t v45 = v44[1];
      BOOL v42 = __OFSUB__(v45, v46);
      uint64_t v47 = v45 - v46;
      if (v42) {
        goto LABEL_109;
      }
      BOOL v42 = __OFADD__(v34, v47);
      uint64_t v48 = v34 + v47;
      if (v42) {
        goto LABEL_111;
      }
      if (v48 >= v39)
      {
        os_log_type_t v66 = (uint64_t *)(v29 + 16 * v31);
        uint64_t v68 = *v66;
        uint64_t v67 = v66[1];
        BOOL v42 = __OFSUB__(v67, v68);
        uint64_t v69 = v67 - v68;
        if (v42) {
          goto LABEL_117;
        }
        BOOL v59 = v34 < v69;
        goto LABEL_70;
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
        goto LABEL_64;
      }
      uint64_t v33 = *(void *)(v9 + 32);
      uint64_t v32 = *(void *)(v9 + 40);
      BOOL v42 = __OFSUB__(v32, v33);
      uint64_t v34 = v32 - v33;
      char v35 = v42;
    }
    if (v35) {
      goto LABEL_110;
    }
    unint64_t v43 = v28 - 2;
    uint64_t v49 = (uint64_t *)(v29 + 16 * (v28 - 2));
    uint64_t v51 = *v49;
    uint64_t v50 = v49[1];
    BOOL v52 = __OFSUB__(v50, v51);
    uint64_t v53 = v50 - v51;
    char v54 = v52;
    if (v52) {
      goto LABEL_112;
    }
    uint64_t v55 = (uint64_t *)(v29 + 16 * v31);
    uint64_t v57 = *v55;
    uint64_t v56 = v55[1];
    BOOL v42 = __OFSUB__(v56, v57);
    uint64_t v58 = v56 - v57;
    if (v42) {
      goto LABEL_114;
    }
    if (__OFADD__(v53, v58)) {
      goto LABEL_116;
    }
    if (v53 + v58 >= v34)
    {
      BOOL v59 = v34 < v58;
LABEL_70:
      if (v59) {
        unint64_t v31 = v43;
      }
      goto LABEL_72;
    }
LABEL_64:
    if (v54) {
      goto LABEL_113;
    }
    uint64_t v62 = (uint64_t *)(v29 + 16 * v31);
    uint64_t v64 = *v62;
    uint64_t v63 = v62[1];
    BOOL v42 = __OFSUB__(v63, v64);
    uint64_t v65 = v63 - v64;
    if (v42) {
      goto LABEL_115;
    }
    if (v65 < v53) {
      goto LABEL_81;
    }
LABEL_72:
    uint64_t v70 = v9;
    unint64_t v71 = v31 - 1;
    if (v31 - 1 >= v28)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
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
      goto LABEL_118;
    }
    if (!v8) {
      goto LABEL_131;
    }
    uint64_t v72 = (uint64_t *)(v29 + 16 * v71);
    uint64_t v73 = *v72;
    uint64_t v74 = v29;
    uint64_t v75 = (void *)(v29 + 16 * v31);
    uint64_t v76 = v75[1];
    uint64_t result = sub_25C5EABB8((char *)(v8 + 8 * *v72), (char *)(v8 + 8 * *v75), v8 + 8 * v76, __dst);
    if (v1) {
      break;
    }
    if (v76 < v73) {
      goto LABEL_104;
    }
    if (v31 > *(void *)(v70 + 16)) {
      goto LABEL_105;
    }
    *uint64_t v72 = v73;
    *(void *)(v74 + 16 * v71 + 8) = v76;
    unint64_t v77 = *(void *)(v70 + 16);
    if (v31 >= v77) {
      goto LABEL_106;
    }
    uint64_t v9 = v70;
    unint64_t v28 = v77 - 1;
    uint64_t result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v31));
    uint64_t v29 = v74;
    *(void *)(v70 + 16) = v77 - 1;
    uint64_t v8 = v89;
    if (v77 <= 2) {
      goto LABEL_81;
    }
  }
LABEL_86:
  uint64_t result = swift_bridgeObjectRelease();
  if (v88 < -1) {
    goto LABEL_125;
  }
  *(void *)(v86 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C5EAB60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      double v6 = *(double *)(v4 + 8 * a3);
      uint64_t v7 = result;
      uint64_t v8 = (double *)v5;
      do
      {
        double v9 = *v8;
        if (v6 >= *v8) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *uint64_t v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 8;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_25C5EABB8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  double v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 >= v11)
  {
    sub_25C5EA0B4(a2, (uint64_t)(a3 - (void)a2) / 8, __dst);
    double v12 = &v4[8 * v11];
    if (v7 >= v6 || v10 < 8) {
      goto LABEL_39;
    }
    BOOL v18 = (double *)(a3 - 8);
    while (1)
    {
      uint64_t v19 = (char *)(v18 + 1);
      double v20 = *((double *)v6 - 1);
      if (*((double *)v12 - 1) >= v20)
      {
        BOOL v22 = v19 != v12 || v18 >= (double *)v12;
        double v20 = *((double *)v12 - 1);
        v12 -= 8;
        if (!v22) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v21 = v19 != v6 || v18 >= (double *)v6;
        v6 -= 8;
        if (!v21) {
          goto LABEL_35;
        }
      }
      *BOOL v18 = v20;
LABEL_35:
      --v18;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_39;
      }
    }
  }
  sub_25C5EA0B4(__src, (a2 - __src) / 8, __dst);
  double v12 = &v4[8 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      double v14 = *(double *)v6;
      if (*(double *)v6 < *(double *)v4) {
        break;
      }
      double v14 = *(double *)v4;
      BOOL v15 = v7 == v4;
      v4 += 8;
      if (!v15) {
        goto LABEL_11;
      }
LABEL_12:
      v7 += 8;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_17;
      }
    }
    BOOL v15 = v7 == v6;
    v6 += 8;
    if (v15) {
      goto LABEL_12;
    }
LABEL_11:
    *(double *)uint64_t v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  double v6 = v7;
LABEL_39:
  sub_25C5EA0B4(v4, (v12 - v4) / 8, v6);
  return 1;
}

char *sub_25C5EAD34(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B97D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v12 = v10 + 32;
  double v13 = a4 + 32;
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

char *sub_25C5EAE2C(uint64_t a1)
{
  return sub_25C5EAD34(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id sub_25C5EAE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v6 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  int64_t v7 = (void *)sub_25C5EE570();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

char *sub_25C5EAED4(uint64_t a1)
{
  return sub_25C5EA2BC(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25C5EAEE8(uint64_t a1, void *a2)
{
  v2[14] = a2;
  v2[15] = *a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FF0);
  OUTLINED_FUNCTION_58(v3);
  v2[16] = OUTLINED_FUNCTION_192();
  uint64_t v4 = sub_25C5EE330();
  v2[17] = v4;
  OUTLINED_FUNCTION_2(v4);
  v2[18] = v5;
  v2[19] = OUTLINED_FUNCTION_192();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  OUTLINED_FUNCTION_58(v6);
  v2[20] = OUTLINED_FUNCTION_146();
  v2[21] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B350FE8);
  OUTLINED_FUNCTION_58(v7);
  v2[22] = OUTLINED_FUNCTION_192();
  uint64_t v8 = sub_25C5EDED0();
  v2[23] = v8;
  OUTLINED_FUNCTION_2(v8);
  v2[24] = v9;
  v2[25] = OUTLINED_FUNCTION_146();
  v2[26] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5B9610);
  OUTLINED_FUNCTION_58(v10);
  v2[27] = OUTLINED_FUNCTION_192();
  uint64_t v11 = sub_25C5EE120();
  v2[28] = v11;
  OUTLINED_FUNCTION_2(v11);
  v2[29] = v12;
  v2[30] = OUTLINED_FUNCTION_146();
  v2[31] = swift_task_alloc();
  uint64_t v13 = sub_25C5EE4B0();
  v2[32] = v13;
  OUTLINED_FUNCTION_2(v13);
  v2[33] = v14;
  v2[34] = OUTLINED_FUNCTION_146();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25C5EB130, 0, 0);
}

uint64_t sub_25C5EB130()
{
  uint64_t v2 = v1;
  sub_25C5EE490();
  uint64_t v3 = sub_25C5EE4A0();
  os_log_type_t v4 = sub_25C5EE780();
  if (OUTLINED_FUNCTION_24_0(v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_69();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C5AA000, v3, v0, "StaticSuggestionsSource: fetching phrases from static list file", v5, 2u);
    OUTLINED_FUNCTION_3();
  }
  uint64_t v6 = v1[33];
  uint64_t v8 = v1[27];
  uint64_t v7 = v1[28];
  uint64_t v9 = v1[14];

  uint64_t v10 = *(void (**)(void))(v6 + 8);
  v2[41] = v10;
  v2[42] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  OUTLINED_FUNCTION_5_6();
  v10();
  OUTLINED_FUNCTION_27_0((void *)(v9 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_deviceTypeProvider));
  sub_25C5DB70C((uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v7) == 1)
  {
    sub_25C5D23DC(v2[27], (uint64_t *)&unk_26A5B9610);
    sub_25C5EE490();
    uint64_t v11 = (void *)sub_25C5EE4A0();
    os_log_type_t v12 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_24_0(v12))
    {
      *(_WORD *)OUTLINED_FUNCTION_69() = 0;
      OUTLINED_FUNCTION_15_3(&dword_25C5AA000, v13, v14, "StaticSuggestionsSource: unable to get the currentDeviceType. Returning 0 phrases");
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_5_6();
    v10();
LABEL_18:
    OUTLINED_FUNCTION_4_7();
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
    OUTLINED_FUNCTION_14_3();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v15 = v2[14];
  (*(void (**)(void, void, void))(v2[29] + 32))(v2[31], v2[27], v2[28]);
  OUTLINED_FUNCTION_27_0((void *)(v15 + OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_localeProvider));
  sub_25C5DB464();
  char v16 = sub_25C5EE640();
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    sub_25C5EE490();
    unint64_t v27 = (void *)sub_25C5EE4A0();
    os_log_type_t v28 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_24_0(v28))
    {
      *(_WORD *)OUTLINED_FUNCTION_69() = 0;
      OUTLINED_FUNCTION_15_3(&dword_25C5AA000, v29, v30, "SiriSuggestionsPoolSource: siriLocale not en. Returning 0 phrases");
      OUTLINED_FUNCTION_3();
    }
    goto LABEL_17;
  }
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v18 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v19 = sub_25C5EAE40(0xD000000000000019, 0x800000025C5F17E0, 0x7473696C70, 0xE500000000000000, v18);

  if (!v19)
  {
    __swift_storeEnumTagSinglePayload(v2[22], 1, 1, v2[23]);
LABEL_15:
    sub_25C5D23DC(v2[22], &qword_26B350FE8);
    sub_25C5EE490();
    unint64_t v27 = (void *)sub_25C5EE4A0();
    os_log_type_t v31 = sub_25C5EE780();
    if (OUTLINED_FUNCTION_24_0(v31))
    {
      *(_WORD *)OUTLINED_FUNCTION_69() = 0;
      OUTLINED_FUNCTION_15_3(&dword_25C5AA000, v32, v33, "SiriSuggestionsPoolSource: unable to get URL to filePath. Returning 0 phrases");
      OUTLINED_FUNCTION_3();
    }
LABEL_17:
    uint64_t v34 = v2[31];
    uint64_t v35 = v2[28];
    uint64_t v36 = v2[29];

    OUTLINED_FUNCTION_5_6();
    v10();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    goto LABEL_18;
  }
  uint64_t v21 = v2[24];
  uint64_t v20 = v2[25];
  uint64_t v23 = v2[22];
  uint64_t v22 = v2[23];
  sub_25C5EDEC0();

  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32);
  v24(v23, v20, v22);
  __swift_storeEnumTagSinglePayload(v23, 0, 1, v22);
  if (__swift_getEnumTagSinglePayload(v23, 1, v22) == 1) {
    goto LABEL_15;
  }
  v24(v2[26], v2[22], v2[23]);
  sub_25C5EDE80();
  swift_allocObject();
  v2[43] = sub_25C5EDE70();
  v2[44] = sub_25C5EDEE0();
  v2[45] = v25;
  uint64_t v110 = v2;
  LOBYTE(v26) = v25;
  sub_25C5ECB90();
  sub_25C5EDE60();
  uint64_t v39 = MEMORY[0x263F8EE78];
  uint64_t v40 = v2[11];
  v2[46] = v40;
  v2[9] = v39;
  uint64_t v41 = *(void *)(v40 + 16);
  v2[47] = v41;
  if (!v41)
  {
    swift_bridgeObjectRelease();
    unint64_t v86 = MEMORY[0x263F8EE78];
LABEL_80:
    unint64_t v87 = swift_bridgeObjectRetain();
    sub_25C5E93F0(v87);
    swift_bridgeObjectRelease();
    sub_25C5EE490();
    swift_bridgeObjectRetain_n();
    uint64_t v88 = sub_25C5EE4A0();
    LOBYTE(v26) = sub_25C5EE780();
    if (!os_log_type_enabled(v88, (os_log_type_t)v26))
    {
      uint64_t v93 = v2[44];
      unint64_t v92 = v2[45];
      swift_bridgeObjectRelease();
      sub_25C5B4690(v93, v92);
      swift_bridgeObjectRelease();
      uint64_t v8 = v88;
      goto LABEL_85;
    }
    uint64_t v10 = (void (*)(void))OUTLINED_FUNCTION_3_3();
    *(_DWORD *)uint64_t v10 = 134217984;
    uint64_t v8 = v88;
    if (!(v86 >> 62))
    {
      uint64_t v89 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_83:
      uint64_t v91 = v110[44];
      unint64_t v90 = v110[45];
      swift_bridgeObjectRelease();
      v110[10] = v89;
      uint64_t v2 = v110;
      sub_25C5EE7F0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C5AA000, v8, (os_log_type_t)v26, "%ld phrase(s) created from static list using StaticSuggestionsSource", (uint8_t *)v10, 0xCu);
      OUTLINED_FUNCTION_3();
      sub_25C5B4690(v91, v90);
LABEL_85:
      uint64_t v94 = (void (*)(uint64_t, uint64_t))v2[41];
      uint64_t v95 = v2[37];
      uint64_t v96 = v2[32];
      uint64_t v109 = v2[31];
      uint64_t v97 = v2[29];
      uint64_t v98 = v110[28];
      uint64_t v99 = v110[26];
      uint64_t v100 = v110[24];
      uint64_t v101 = v110[23];
      swift_release();

      v94(v95, v96);
      (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v99, v101);
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v109, v98);
      swift_beginAccess();
      goto LABEL_18;
    }
LABEL_90:
    swift_bridgeObjectRetain();
    uint64_t v89 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
    goto LABEL_83;
  }
  unint64_t v42 = 0;
  v2[48] = OBJC_IVAR____TtC16SiriAutoComplete23StaticSuggestionsSource_appFinderProvider;
  *((_DWORD *)v2 + 132) = *MEMORY[0x263F748E8];
  *((_DWORD *)v2 + 133) = *MEMORY[0x263F6CCD0];
  while (1)
  {
    v2[49] = v42;
    uint64_t v43 = v2[46];
    if (v42 >= *(void *)(v43 + 16))
    {
      __break(1u);
      goto LABEL_90;
    }
    char v44 = (void *)(v43 + 104 * v42);
    v2[50] = v44[4];
    v2[51] = v44[5];
    v2[52] = v44[6];
    uint64_t v8 = v44[7];
    v2[53] = v8;
    v2[54] = v44[8];
    v2[55] = v44[9];
    unint64_t v26 = (void *)v44[10];
    v2[56] = v26;
    uint64_t v45 = v44[11];
    uint64_t v46 = v44[12];
    v2[57] = v46;
    v2[58] = v44[13];
    v2[59] = v44[14];
    uint64_t v108 = v45;
    v2[60] = v44[15];
    uint64_t v47 = v44[16];
    v2[61] = v47;
    uint64_t v111 = v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_25C5EE110();
    uint64_t v50 = v49;
    uint64_t v51 = v26[2];
    if (v51)
    {
      uint64_t v10 = (void (*)(void))v48;
      BOOL v52 = v26[4] == v48 && v26[5] == v49;
      if (v52 || (OUTLINED_FUNCTION_9_4() & 1) != 0)
      {
LABEL_30:
        uint64_t v53 = *((unsigned int *)v110 + 132);
        uint64_t v54 = v110[30];
        uint64_t v55 = v110[28];
        uint64_t v56 = v110[29];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 104))(v54, v53, v55);
        sub_25C5ECBDC();
        swift_bridgeObjectRetain();
        sub_25C5EE670();
        sub_25C5EE670();
        if (v110[7] == v110[5] && v110[8] == v110[6])
        {
          swift_bridgeObjectRelease_n();
          uint64_t v64 = OUTLINED_FUNCTION_30_1();
          v65(v64);
        }
        else
        {
          char v58 = sub_25C5EEA80();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v59 = OUTLINED_FUNCTION_30_1();
          v60(v59);
          if ((v58 & 1) == 0)
          {
            uint64_t v61 = v46;
            uint64_t v62 = v108;
            uint64_t v63 = v111;
LABEL_46:
            v110[62] = v62;
            v110[63] = v61;
            if (v63)
            {
              OUTLINED_FUNCTION_27_0((void *)(v110[14] + v110[48]));
              swift_bridgeObjectRetain();
              unint64_t v102 = (void *)swift_task_alloc();
              v110[64] = v102;
              *unint64_t v102 = v110;
              v102[1] = sub_25C5EBFC8;
              OUTLINED_FUNCTION_14_3();
              return sub_25C5DBB30(v103, v104);
            }
            uint64_t v70 = *((unsigned int *)v110 + 133);
            uint64_t v72 = v110[20];
            unint64_t v71 = (void *)v110[21];
            uint64_t v73 = v110[18];
            unint64_t v26 = (void *)v110[19];
            uint64_t v8 = v110[17];
            uint64_t v74 = v110[16];
            sub_25C5E9190(v110[52], v110[53], v110[54], v110[55], v62, v61, v71);
            sub_25C5EE410();
            uint64_t v75 = *(void (**)(void *, uint64_t, NSObject *))(v73 + 104);
            uint64_t v10 = (void (*)(void))(v73 + 104);
            v75(v26, v70, v8);
            sub_25C5ECC2C((uint64_t)v71, v72);
            uint64_t v76 = sub_25C5EDF30();
            __swift_storeEnumTagSinglePayload(v74, 1, 1, v76);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v2 = v110;
            sub_25C5EE3B0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v77 = swift_retain();
            MEMORY[0x26118B000](v77);
            if (*(void *)((v2[9] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v2[9] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              OUTLINED_FUNCTION_32_1();
            }
            uint64_t v78 = v110[21];
            sub_25C5EE700();
            sub_25C5EE6D0();
            swift_release();
            sub_25C5D23DC(v78, &qword_26B351078);
            goto LABEL_50;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v66 = sub_25C5EE1A0();
        uint64_t v63 = v111;
        if (*(void *)(v66 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v67 = sub_25C5B0114(v108, v46);
          if (v68)
          {
            uint64_t v69 = (uint64_t *)(*(void *)(v66 + 56) + 16 * v67);
            uint64_t v62 = *v69;
            uint64_t v61 = v69[1];
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v62 = 0;
            uint64_t v61 = 0xE000000000000000;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v62 = 0;
          uint64_t v61 = 0xE000000000000000;
        }
        swift_bridgeObjectRelease();
        goto LABEL_46;
      }
      if (v51 != 1)
      {
        BOOL v79 = (void (*)(void))v26[6] == v10 && v26[7] == v50;
        if (v79 || (OUTLINED_FUNCTION_9_4() & 1) != 0) {
          goto LABEL_30;
        }
        if (v51 != 2)
        {
          BOOL v80 = (void (*)(void))v26[8] == v10 && v26[9] == v50;
          if (v80 || (OUTLINED_FUNCTION_9_4() & 1) != 0) {
            goto LABEL_30;
          }
          if (v51 != 3)
          {
            if ((void (*)(void))v26[10] == v10 && v26[11] == v50) {
              goto LABEL_30;
            }
            uint64_t result = OUTLINED_FUNCTION_9_4();
            if (result) {
              goto LABEL_30;
            }
            if (v51 != 4) {
              break;
            }
          }
        }
      }
    }
LABEL_41:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v2 = v110;
LABEL_50:
    unint64_t v42 = v2[49] + 1;
    if (v42 == v2[47])
    {
      swift_bridgeObjectRelease();
      unint64_t v86 = v2[9];
      goto LABEL_80;
    }
  }
  unint64_t v83 = v26 + 13;
  uint64_t v84 = 4;
  while (!__OFADD__(v84, 1))
  {
    uint64_t v106 = v84 + 1;
    uint64_t v107 = v84;
    if ((void (*)(void))*(v83 - 1) == v10 && *v83 == v50) {
      goto LABEL_30;
    }
    uint64_t result = OUTLINED_FUNCTION_9_4();
    if (result) {
      goto LABEL_30;
    }
    uint64_t v84 = v107 + 1;
    v83 += 2;
    if (v106 == v51) {
      goto LABEL_41;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5EBFC8()
{
  OUTLINED_FUNCTION_6();
  *(void *)(v1 + 520) = v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25C5EC0A4, 0, 0);
}

uint64_t sub_25C5EC0A4()
{
  uint64_t v96 = v0;
  unint64_t v1 = *(void *)(v0 + 520);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
    if (v16 != 1) {
      goto LABEL_17;
    }
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25C5EE9B0();
    swift_bridgeObjectRelease();
    if (!v17) {
      goto LABEL_17;
    }
  }
  else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
  {
    goto LABEL_17;
  }
  if ((v1 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      swift_retain();
      goto LABEL_6;
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v15 = *(uint8_t **)(v0 + 496);
    uint64_t v14 = *(void *)(v0 + 504);
    goto LABEL_19;
  }
  MEMORY[0x26118B200](0, *(void *)(v0 + 520));
LABEL_6:
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_25C5EE0A0();
  uint64_t v4 = v3;
  swift_release();
  if (!v4) {
    goto LABEL_18;
  }
  unint64_t v86 = (uint8_t *)v2;
  uint64_t v93 = v4;
  swift_bridgeObjectRelease();
  sub_25C5EE490();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25C5EE4A0();
  os_log_type_t v6 = sub_25C5EE780();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void *)(v0 + 488);
  if (v7)
  {
    uint64_t v9 = *(void *)(v0 + 480);
    uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    uint64_t v88 = *(void *)(v0 + 288);
    uint64_t v85 = *(void *)(v0 + 256);
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    uint64_t v95 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 104) = sub_25C5CD724(v9, v8, &v95);
    sub_25C5EE7F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C5AA000, v5, v6, "StaticSuggestionApprovedPhrase: 1 app detected for %s changing to the app's bundleId", v10, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();

    v89(v88, v85);
  }
  else
  {
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    uint64_t v12 = *(void *)(v0 + 288);
    uint64_t v13 = *(void *)(v0 + 256);

    swift_bridgeObjectRelease_n();
    v11(v12, v13);
  }
  uint64_t v14 = v93;
  uint64_t v15 = v86;
  do
  {
LABEL_19:
    uint64_t v18 = *(unsigned int *)(v0 + 532);
    id v19 = *(void **)(v0 + 168);
    uint64_t v84 = *(void *)(v0 + 160);
    uint64_t v21 = *(void *)(v0 + 144);
    uint64_t v20 = *(void *)(v0 + 152);
    uint64_t v23 = *(void *)(v0 + 128);
    uint64_t v22 = *(void *)(v0 + 136);
    sub_25C5E9190(*(void *)(v0 + 416), *(void *)(v0 + 424), *(void *)(v0 + 432), *(void *)(v0 + 440), (uint64_t)v15, v14, v19);
    sub_25C5EE410();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 104))(v20, v18, v22);
    sub_25C5ECC2C((uint64_t)v19, v84);
    uint64_t v24 = sub_25C5EDF30();
    __swift_storeEnumTagSinglePayload(v23, 1, 1, v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C5EE3B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = swift_retain();
    unint64_t v26 = (v0 + 72);
    MEMORY[0x26118B000](v25);
    if (*(void *)((*(void *)(v0 + 72) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 72) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      OUTLINED_FUNCTION_32_1();
    unint64_t v27 = *(void **)(v0 + 168);
    sub_25C5EE700();
    sub_25C5EE6D0();
    swift_release();
    sub_25C5D23DC((uint64_t)v27, &qword_26B351078);
    while (1)
    {
      unint64_t v28 = *(void *)(v0 + 392) + 1;
      if (v28 == *(void *)(v0 + 376))
      {
        swift_bridgeObjectRelease();
        unint64_t v62 = *(void *)(v0 + 72);
        unint64_t v63 = swift_bridgeObjectRetain();
        sub_25C5E93F0(v63);
        swift_bridgeObjectRelease();
        sub_25C5EE490();
        swift_bridgeObjectRetain_n();
        unint64_t v26 = sub_25C5EE4A0();
        LOBYTE(v27) = sub_25C5EE780();
        if (os_log_type_enabled(v26, (os_log_type_t)v27))
        {
          uint64_t v15 = (uint8_t *)OUTLINED_FUNCTION_3_3();
          *(_DWORD *)uint64_t v15 = 134217984;
          if (v62 >> 62) {
            goto LABEL_87;
          }
          uint64_t v64 = *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_77:
          uint64_t v66 = *(void *)(v0 + 352);
          unint64_t v65 = *(void *)(v0 + 360);
          swift_bridgeObjectRelease();
          *(void *)(v0 + 80) = v64;
          sub_25C5EE7F0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25C5AA000, v26, (os_log_type_t)v27, "%ld phrase(s) created from static list using StaticSuggestionsSource", v15, 0xCu);
          OUTLINED_FUNCTION_3();
          sub_25C5B4690(v66, v65);
        }
        else
        {
          uint64_t v68 = *(void *)(v0 + 352);
          unint64_t v67 = *(void *)(v0 + 360);
          swift_bridgeObjectRelease();
          sub_25C5B4690(v68, v67);
          swift_bridgeObjectRelease();
        }
        uint64_t v69 = v26;
        uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
        uint64_t v71 = *(void *)(v0 + 296);
        uint64_t v72 = *(void *)(v0 + 256);
        uint64_t v92 = *(void *)(v0 + 248);
        uint64_t v73 = *(void *)(v0 + 232);
        uint64_t v90 = *(void *)(v0 + 224);
        uint64_t v74 = *(void *)(v0 + 208);
        uint64_t v76 = *(void *)(v0 + 184);
        uint64_t v75 = *(void *)(v0 + 192);
        swift_release();

        v70(v71, v72);
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v74, v76);
        (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v92, v90);
        swift_beginAccess();
        OUTLINED_FUNCTION_4_7();
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
        OUTLINED_FUNCTION_14_3();
        __asm { BRAA            X2, X16 }
      }
      *(void *)(v0 + 392) = v28;
      uint64_t v29 = *(void *)(v0 + 368);
      if (v28 >= *(void *)(v29 + 16))
      {
        __break(1u);
        goto LABEL_86;
      }
      uint64_t v30 = (void *)(v29 + 104 * v28);
      *(void *)(v0 + 400) = v30[4];
      uint64_t v15 = (uint8_t *)v30[5];
      *(void *)(v0 + 408) = v15;
      *(void *)(v0 + 416) = v30[6];
      *(void *)(v0 + 424) = v30[7];
      *(void *)(v0 + 432) = v30[8];
      *(void *)(v0 + 440) = v30[9];
      unint64_t v27 = (void *)v30[10];
      *(void *)(v0 + 448) = v27;
      uint64_t v31 = v30[11];
      uint64_t v32 = v30[12];
      *(void *)(v0 + 456) = v32;
      *(void *)(v0 + 464) = v30[13];
      *(void *)(v0 + 472) = v30[14];
      uint64_t v87 = v31;
      *(void *)(v0 + 480) = v30[15];
      uint64_t v33 = v30[16];
      *(void *)(v0 + 488) = v33;
      uint64_t v91 = v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v94 = v32;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25C5EE110();
      uint64_t v36 = v35;
      unint64_t v26 = v27[2];
      if (v26) {
        break;
      }
LABEL_57:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v37 = v34;
    BOOL v38 = v27[4] == v34 && v27[5] == v35;
    if (!v38 && (OUTLINED_FUNCTION_8_4() & 1) == 0)
    {
      if (v26 != 1)
      {
        BOOL v39 = v27[6] == v37 && v27[7] == v36;
        if (v39 || (OUTLINED_FUNCTION_8_4() & 1) != 0) {
          goto LABEL_58;
        }
        if (v26 != 2)
        {
          BOOL v40 = v27[8] == v37 && v27[9] == v36;
          if (v40 || (OUTLINED_FUNCTION_8_4() & 1) != 0) {
            goto LABEL_58;
          }
          if (v26 != 3)
          {
            BOOL v41 = v27[10] == v37 && v27[11] == v36;
            if (v41 || (OUTLINED_FUNCTION_8_4() & 1) != 0) {
              goto LABEL_58;
            }
            if (v26 != 4)
            {
              unint64_t v42 = v27 + 13;
              uint64_t v43 = 4;
              while (1)
              {
                uint64_t v15 = (uint8_t *)(v43 + 1);
                if (__OFADD__(v43, 1)) {
                  break;
                }
                BOOL v44 = *(v42 - 1) == v37 && *v42 == v36;
                if (v44 || (OUTLINED_FUNCTION_8_4() & 1) != 0) {
                  goto LABEL_58;
                }
                ++v43;
                v42 += 2;
                if (v15 == (uint8_t *)v26) {
                  goto LABEL_57;
                }
              }
LABEL_86:
              __break(1u);
LABEL_87:
              swift_bridgeObjectRetain();
              uint64_t v64 = sub_25C5EE9B0();
              swift_bridgeObjectRelease();
              goto LABEL_77;
            }
          }
        }
      }
      goto LABEL_57;
    }
LABEL_58:
    uint64_t v45 = *(unsigned int *)(v0 + 528);
    uint64_t v46 = *(void *)(v0 + 240);
    uint64_t v47 = *(void *)(v0 + 224);
    uint64_t v48 = *(void *)(v0 + 232);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 104))(v46, v45, v47);
    sub_25C5ECBDC();
    uint64_t v49 = v94;
    swift_bridgeObjectRetain();
    sub_25C5EE670();
    sub_25C5EE670();
    if (*(void *)(v0 + 56) == *(void *)(v0 + 40) && *(void *)(v0 + 64) == *(void *)(v0 + 48))
    {
      swift_bridgeObjectRelease_n();
      uint64_t v55 = OUTLINED_FUNCTION_34_1();
      v56(v55);
    }
    else
    {
      char v51 = sub_25C5EEA80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v52 = OUTLINED_FUNCTION_34_1();
      v53(v52);
      if ((v51 & 1) == 0)
      {
        uint64_t v15 = (uint8_t *)v87;
        uint64_t v54 = v91;
        goto LABEL_72;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v57 = sub_25C5EE1A0();
    if (*(void *)(v57 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v58 = sub_25C5B0114(v87, v94);
      if (v59)
      {
        uint64_t v60 = *(void *)(v57 + 56) + 16 * v58;
        uint64_t v15 = *(uint8_t **)v60;
        unint64_t v61 = *(void *)(v60 + 8);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v61 = 0xE000000000000000;
      }
      uint64_t v54 = v91;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
      unint64_t v61 = 0xE000000000000000;
      uint64_t v54 = v91;
    }
    swift_bridgeObjectRelease();
    uint64_t v49 = v61;
LABEL_72:
    *(void *)(v0 + 496) = v15;
    *(void *)(v0 + 504) = v49;
    uint64_t v14 = v49;
  }
  while (!v54);
  OUTLINED_FUNCTION_27_0((void *)(*(void *)(v0 + 112) + *(void *)(v0 + 384)));
  swift_bridgeObjectRetain();
  BOOL v79 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v79;
  *BOOL v79 = v0;
  v79[1] = sub_25C5EBFC8;
  OUTLINED_FUNCTION_14_3();
  return sub_25C5DBB30(v80, v81);
}

unint64_t sub_25C5ECB90()
{
  unint64_t result = qword_26A5B97C0;
  if (!qword_26A5B97C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B97C0);
  }
  return result;
}

unint64_t sub_25C5ECBDC()
{
  unint64_t result = qword_26A5B97C8;
  if (!qword_26A5B97C8)
  {
    sub_25C5EE120();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B97C8);
  }
  return result;
}

uint64_t sub_25C5ECC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B351078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for StaticSuggestionAprovedPhraseList()
{
  return &type metadata for StaticSuggestionAprovedPhraseList;
}

unint64_t sub_25C5ECCA4()
{
  unint64_t result = qword_26A5B9800;
  if (!qword_26A5B9800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9800);
  }
  return result;
}

unint64_t sub_25C5ECCF0()
{
  unint64_t result = qword_26A5B9818;
  if (!qword_26A5B9818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9818);
  }
  return result;
}

uint64_t sub_25C5ECD3C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5B9808);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25C5ECDAC()
{
  unint64_t result = qword_26A5B9830;
  if (!qword_26A5B9830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9830);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StaticSuggestionAprovedPhraseList.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C5ECE94);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionAprovedPhraseList.CodingKeys()
{
  return &type metadata for StaticSuggestionAprovedPhraseList.CodingKeys;
}

uint64_t destroy for StaticSuggestionApprovedPhrase()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for StaticSuggestionApprovedPhrase(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for StaticSuggestionApprovedPhrase(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for StaticSuggestionApprovedPhrase(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StaticSuggestionApprovedPhrase(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for StaticSuggestionApprovedPhrase(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionApprovedPhrase()
{
  return &type metadata for StaticSuggestionApprovedPhrase;
}

unint64_t sub_25C5ED22C()
{
  unint64_t result = qword_26A5B9838;
  if (!qword_26A5B9838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9838);
  }
  return result;
}

unint64_t sub_25C5ED27C()
{
  unint64_t result = qword_26A5B9840;
  if (!qword_26A5B9840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9840);
  }
  return result;
}

unint64_t sub_25C5ED2CC()
{
  unint64_t result = qword_26A5B9848;
  if (!qword_26A5B9848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9848);
  }
  return result;
}

unint64_t sub_25C5ED318()
{
  unint64_t result = qword_26A5B9858;
  if (!qword_26A5B9858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9858);
  }
  return result;
}

uint64_t sub_25C5ED364(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B351090);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StaticSuggestionApprovedPhrase.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 6) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for StaticSuggestionApprovedPhrase.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x25C5ED51CLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StaticSuggestionApprovedPhrase.CodingKeys()
{
  return &type metadata for StaticSuggestionApprovedPhrase.CodingKeys;
}

unint64_t sub_25C5ED558()
{
  unint64_t result = qword_26A5B9870;
  if (!qword_26A5B9870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9870);
  }
  return result;
}

unint64_t sub_25C5ED5A8()
{
  unint64_t result = qword_26A5B9878;
  if (!qword_26A5B9878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9878);
  }
  return result;
}

unint64_t sub_25C5ED5F8()
{
  unint64_t result = qword_26A5B9880;
  if (!qword_26A5B9880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B9880);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  uint64_t v3 = v0[19];
  *(void *)(v1 - 112) = v0[20];
  *(void *)(v1 - 104) = v3;
  *(void *)(v1 - 96) = v0[16];
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_25C5EEA80();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return sub_25C5EEA80();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return sub_25C5EEA00();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return sub_25C5EEA40();
}

void OUTLINED_FUNCTION_15_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void *OUTLINED_FUNCTION_20_2@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

void OUTLINED_FUNCTION_22_2(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_25C5EE9D0();
}

void *OUTLINED_FUNCTION_27_0(void *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return sub_25C5EE6E0();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return v0;
}

uint64_t sub_25C5ED85C(uint64_t a1, double a2)
{
  uint64_t v4 = sub_25C5EE4B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v30 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v30 - v12;
  if (*(void *)(a1 + 16) > 1uLL)
  {
    uint64_t v18 = sub_25C5EDC78(a1, a2);
    if (v19)
    {
      sub_25C5EE490();
      uint64_t v22 = sub_25C5EE4A0();
      os_log_type_t v23 = sub_25C5EE790();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 136315394;
        uint64_t v25 = OUTLINED_FUNCTION_0_4((uint64_t)"normalizedScoreOf(value:inSortedList:)");
        OUTLINED_FUNCTION_2_8(v25);
        OUTLINED_FUNCTION_1_5();
        _os_log_impl(&dword_25C5AA000, v22, v23, "Function: %s > Unable to calculate a normalized score for value %f since it does not exist in the list", v24, 0x16u);
        OUTLINED_FUNCTION_4_8();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_3();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      uint64_t v20 = v18;
      uint64_t v31 = *(void *)&a2;
      MEMORY[0x270FA5388](v18);
      v30[-2] = &v31;
      uint64_t result = sub_25C5EDCE4((uint64_t (*)(uint64_t *))sub_25C5EDD88, (uint64_t)&v30[-4], a1);
      if (v21)
      {
        sub_25C5EE490();
        unint64_t v26 = sub_25C5EE4A0();
        os_log_type_t v27 = sub_25C5EE790();
        if (os_log_type_enabled(v26, v27))
        {
          unint64_t v28 = (uint8_t *)swift_slowAlloc();
          uint64_t v31 = swift_slowAlloc();
          *(_DWORD *)unint64_t v28 = 136315394;
          uint64_t v29 = OUTLINED_FUNCTION_0_4((uint64_t)"normalizedScoreOf(value:inSortedList:)");
          OUTLINED_FUNCTION_2_8(v29);
          OUTLINED_FUNCTION_1_5();
          _os_log_impl(&dword_25C5AA000, v26, v27, "Function: %s > Unable to calculate a normalized score for value %f since it does not exist in the list", v28, 0x16u);
          OUTLINED_FUNCTION_4_8();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();
        }

        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
      }
      else if (__OFADD__(v20, result))
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_25C5EE490();
    uint64_t v14 = sub_25C5EE4A0();
    os_log_type_t v15 = sub_25C5EE790();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      v30[2] = OUTLINED_FUNCTION_0_4((uint64_t)"normalizedScoreOf(value:inSortedList:)");
      sub_25C5EE7F0();
      _os_log_impl(&dword_25C5AA000, v14, v15, "Function: %s > Skipping normalized score calculation for a list with less than two elements", v16, 0xCu);
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  return result;
}

uint64_t sub_25C5EDC78(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  double v4 = *(double *)(a1 + 32);
  uint64_t result = 0;
  if (v4 != a2)
  {
    uint64_t v6 = v2 - 1;
    uint64_t v7 = a1 + 40;
    while (v6 != result)
    {
      double v8 = *(double *)(v7 + 8 * result++);
      if (v8 == a2) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_25C5EDCD8(double a1, double a2)
{
  return a1 == a2;
}

uint64_t sub_25C5EDCE4(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (v4)
  {
    uint64_t v6 = a3 + 24;
    do
    {
      uint64_t v9 = *(void *)(v6 + 8 * v4);
      char v7 = a1(&v9);
      if (v3) {
        break;
      }
      --v4;
    }
    while (!(v7 & 1 | (v4 == 0)));
  }
  return v4;
}

BOOL sub_25C5EDD64(double *a1, double *a2)
{
  return sub_25C5EDCD8(*a1, *a2);
}

BOOL sub_25C5EDD88(double *a1)
{
  return sub_25C5EDD64(a1, *(double **)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_0_4@<X0>(uint64_t a1@<X8>)
{
  return sub_25C5CD724(0xD000000000000026, (a1 - 32) | 0x8000000000000000, (uint64_t *)(v1 - 104));
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  *(_WORD *)(v0 + 12) = 2048;
  *(void *)(v1 - 112) = v3;
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_2_8(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_25C5EE7F0();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return swift_arrayDestroy();
}

uint64_t sub_25C5EDE40()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_25C5EDE50()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25C5EDE60()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25C5EDE70()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25C5EDE80()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25C5EDE90()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25C5EDEA0()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_25C5EDEB0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25C5EDEC0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25C5EDED0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25C5EDEE0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25C5EDEF0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25C5EDF00()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25C5EDF10()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25C5EDF20()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25C5EDF30()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C5EDF40()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C5EDF50()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25C5EDF60()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C5EDF70()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25C5EDF80()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25C5EDF90()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25C5EDFA0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25C5EDFB0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25C5EDFD0()
{
  return MEMORY[0x270F71530]();
}

uint64_t sub_25C5EDFE0()
{
  return MEMORY[0x270F71538]();
}

uint64_t sub_25C5EDFF0()
{
  return MEMORY[0x270F71540]();
}

uint64_t sub_25C5EE000()
{
  return MEMORY[0x270F71548]();
}

uint64_t sub_25C5EE010()
{
  return MEMORY[0x270F71550]();
}

uint64_t sub_25C5EE020()
{
  return MEMORY[0x270F71558]();
}

uint64_t sub_25C5EE030()
{
  return MEMORY[0x270F71560]();
}

uint64_t sub_25C5EE040()
{
  return MEMORY[0x270F71568]();
}

uint64_t sub_25C5EE050()
{
  return MEMORY[0x270F71570]();
}

uint64_t sub_25C5EE060()
{
  return MEMORY[0x270F71578]();
}

uint64_t sub_25C5EE070()
{
  return MEMORY[0x270F71580]();
}

uint64_t sub_25C5EE080()
{
  return MEMORY[0x270F71588]();
}

uint64_t sub_25C5EE090()
{
  return MEMORY[0x270F71590]();
}

uint64_t sub_25C5EE0A0()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t sub_25C5EE0B0()
{
  return MEMORY[0x270F63B30]();
}

uint64_t sub_25C5EE0C0()
{
  return MEMORY[0x270F63B38]();
}

uint64_t sub_25C5EE0D0()
{
  return MEMORY[0x270F63B40]();
}

uint64_t sub_25C5EE0E0()
{
  return MEMORY[0x270F63B48]();
}

uint64_t sub_25C5EE0F0()
{
  return MEMORY[0x270F63B50]();
}

uint64_t sub_25C5EE100()
{
  return MEMORY[0x270F63B58]();
}

uint64_t sub_25C5EE110()
{
  return MEMORY[0x270F71888]();
}

uint64_t sub_25C5EE120()
{
  return MEMORY[0x270F71890]();
}

uint64_t sub_25C5EE130()
{
  return MEMORY[0x270F71AF8]();
}

uint64_t sub_25C5EE140()
{
  return MEMORY[0x270F71B38]();
}

uint64_t sub_25C5EE150()
{
  return MEMORY[0x270F71B40]();
}

uint64_t sub_25C5EE160()
{
  return MEMORY[0x270F71BE8]();
}

uint64_t sub_25C5EE170()
{
  return MEMORY[0x270F71BF0]();
}

uint64_t sub_25C5EE180()
{
  return MEMORY[0x270F71C08]();
}

uint64_t sub_25C5EE190()
{
  return MEMORY[0x270F71C48]();
}

uint64_t sub_25C5EE1A0()
{
  return MEMORY[0x270F71C58]();
}

uint64_t sub_25C5EE1B0()
{
  return MEMORY[0x270F71C60]();
}

uint64_t sub_25C5EE1C0()
{
  return MEMORY[0x270F71C98]();
}

uint64_t sub_25C5EE1D0()
{
  return MEMORY[0x270F71CA0]();
}

uint64_t sub_25C5EE1E0()
{
  return MEMORY[0x270F64268]();
}

uint64_t sub_25C5EE1F0()
{
  return MEMORY[0x270F64270]();
}

uint64_t sub_25C5EE200()
{
  return MEMORY[0x270F64278]();
}

uint64_t sub_25C5EE210()
{
  return MEMORY[0x270F64280]();
}

uint64_t sub_25C5EE220()
{
  return MEMORY[0x270F64288]();
}

uint64_t sub_25C5EE230()
{
  return MEMORY[0x270F64290]();
}

uint64_t sub_25C5EE240()
{
  return MEMORY[0x270F64298]();
}

uint64_t sub_25C5EE290()
{
  return MEMORY[0x270F642D8]();
}

uint64_t sub_25C5EE2A0()
{
  return MEMORY[0x270F642E0]();
}

uint64_t sub_25C5EE2B0()
{
  return MEMORY[0x270F642E8]();
}

uint64_t sub_25C5EE2C0()
{
  return MEMORY[0x270F642F0]();
}

uint64_t sub_25C5EE2D0()
{
  return MEMORY[0x270F642F8]();
}

uint64_t sub_25C5EE2E0()
{
  return MEMORY[0x270F64300]();
}

uint64_t sub_25C5EE2F0()
{
  return MEMORY[0x270F64308]();
}

uint64_t sub_25C5EE300()
{
  return MEMORY[0x270F64310]();
}

uint64_t sub_25C5EE310()
{
  return MEMORY[0x270F64318]();
}

uint64_t sub_25C5EE320()
{
  return MEMORY[0x270F64320]();
}

uint64_t sub_25C5EE330()
{
  return MEMORY[0x270F64328]();
}

uint64_t sub_25C5EE340()
{
  return MEMORY[0x270F64330]();
}

uint64_t sub_25C5EE350()
{
  return MEMORY[0x270F64338]();
}

uint64_t sub_25C5EE360()
{
  return MEMORY[0x270F64348]();
}

uint64_t sub_25C5EE370()
{
  return MEMORY[0x270F64350]();
}

uint64_t sub_25C5EE380()
{
  return MEMORY[0x270F64360]();
}

uint64_t sub_25C5EE390()
{
  return MEMORY[0x270F64370]();
}

uint64_t sub_25C5EE3B0()
{
  return MEMORY[0x270F64380]();
}

uint64_t sub_25C5EE3C0()
{
  return MEMORY[0x270F64388]();
}

uint64_t sub_25C5EE3D0()
{
  return MEMORY[0x270F64390]();
}

uint64_t sub_25C5EE3E0()
{
  return MEMORY[0x270F64398]();
}

uint64_t sub_25C5EE3F0()
{
  return MEMORY[0x270F643A8]();
}

uint64_t sub_25C5EE410()
{
  return MEMORY[0x270F643B8]();
}

uint64_t sub_25C5EE420()
{
  return MEMORY[0x270F643C0]();
}

uint64_t sub_25C5EE440()
{
  return MEMORY[0x270F643D0]();
}

uint64_t sub_25C5EE470()
{
  return MEMORY[0x270F643E8]();
}

uint64_t sub_25C5EE480()
{
  return MEMORY[0x270F643F0]();
}

uint64_t sub_25C5EE490()
{
  return MEMORY[0x270F643F8]();
}

uint64_t sub_25C5EE4A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C5EE4B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C5EE4C0()
{
  return MEMORY[0x270F7F910]();
}

uint64_t sub_25C5EE4D0()
{
  return MEMORY[0x270F7F980]();
}

uint64_t sub_25C5EE4E0()
{
  return MEMORY[0x270F7F9D8]();
}

uint64_t sub_25C5EE4F0()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_25C5EE500()
{
  return MEMORY[0x270F7FCD0]();
}

uint64_t sub_25C5EE510()
{
  return MEMORY[0x270F7FD28]();
}

uint64_t sub_25C5EE520()
{
  return MEMORY[0x270F7FD30]();
}

uint64_t sub_25C5EE530()
{
  return MEMORY[0x270F80318]();
}

uint64_t sub_25C5EE540()
{
  return MEMORY[0x270F80360]();
}

uint64_t sub_25C5EE550()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25C5EE560()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25C5EE570()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C5EE580()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C5EE590()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25C5EE5A0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25C5EE5B0()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_25C5EE5C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C5EE5D0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25C5EE5E0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_25C5EE5F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C5EE600()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C5EE610()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_25C5EE620()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_25C5EE630()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_25C5EE640()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_25C5EE650()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_25C5EE660()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25C5EE670()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25C5EE680()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25C5EE690()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25C5EE6A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C5EE6B0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25C5EE6C0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C5EE6D0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C5EE6E0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C5EE6F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C5EE700()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C5EE710()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25C5EE720()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25C5EE730()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25C5EE740()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25C5EE750()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25C5EE760()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_25C5EE770()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C5EE780()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C5EE790()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C5EE7A0()
{
  return MEMORY[0x270F71520]();
}

uint64_t sub_25C5EE7B0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25C5EE7C0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25C5EE7D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C5EE7E0()
{
  return MEMORY[0x270F9E4E8]();
}

uint64_t sub_25C5EE7F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C5EE800()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C5EE810()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_25C5EE820()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25C5EE830()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_25C5EE840()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25C5EE850()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25C5EE860()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25C5EE870()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C5EE880()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C5EE890()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C5EE8A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C5EE8B0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25C5EE8C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C5EE8D0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25C5EE8E0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C5EE8F0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25C5EE900()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25C5EE910()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25C5EE920()
{
  return MEMORY[0x270FA2160]();
}

uint64_t sub_25C5EE930()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_25C5EE940()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25C5EE950()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25C5EE960()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25C5EE970()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25C5EE980()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25C5EE990()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25C5EE9A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C5EE9B0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C5EE9C0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25C5EE9D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C5EE9E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C5EE9F0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25C5EEA00()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25C5EEA10()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25C5EEA20()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25C5EEA30()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25C5EEA40()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25C5EEA50()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25C5EEA60()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25C5EEA70()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25C5EEA80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C5EEA90()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25C5EEAB0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C5EEAC0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25C5EEAD0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25C5EEAE0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C5EEAF0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C5EEB00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C5EEB10()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C5EEB20()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25C5EEB30()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_25C5EEB60()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}