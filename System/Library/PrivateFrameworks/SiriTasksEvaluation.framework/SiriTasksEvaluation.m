uint64_t sub_21E6D71E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  void (*v5)(char *, uint64_t);
  unint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_21E6E1318();
  v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E6E1368();
  v4 = sub_21E6E12D8();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_21E6E1368();
  v6 = sub_21E6E1308();
  result = ((uint64_t (*)(char *, uint64_t))v5)(v3, v0);
  if (v6 >= v4) {
    return v6 - v4 < 0xEA61;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E6D7308()
{
  uint64_t v0 = sub_21E6E1448();
  uint64_t v153 = *(void *)(v0 - 8);
  uint64_t v154 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  v135 = (char *)v128 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v137 = (char *)v128 - v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v7 = (char *)v128 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  v152 = (char *)v128 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v149 = (char *)v128 - v11;
  MEMORY[0x270FA5388](v10);
  v136 = (char *)v128 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D40630);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  v134 = (char *)v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v141 = (char *)v128 - v16;
  uint64_t v17 = sub_21E6E1138();
  uint64_t v143 = *(void *)(v17 - 8);
  uint64_t v144 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v133 = (char *)v128 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v142 = (char *)v128 - v20;
  uint64_t v146 = sub_21E6E1118();
  uint64_t v140 = *(void *)(v146 - 8);
  MEMORY[0x270FA5388](v146);
  v145 = (char *)v128 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_21E6E1418();
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  v139 = (char *)v128 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  v26 = (char *)v128 - v25;
  uint64_t v150 = sub_21E6E1168();
  uint64_t v148 = *(void *)(v150 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v150);
  v138 = (char *)v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v147 = (char *)v128 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v33 = (char *)v128 - v32;
  MEMORY[0x270FA5388](v31);
  v151 = (char *)v128 - v34;
  uint64_t v35 = sub_21E6E1318();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v39 = (char *)v128 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  v41 = (char *)v128 - v40;
  sub_21E6E1368();
  uint64_t v42 = sub_21E6E12B8();
  v43 = *(void (**)(char *, uint64_t))(v36 + 8);
  v43(v41, v35);
  uint64_t v44 = *(void *)(v42 + 16);
  if (!v44) {
    goto LABEL_9;
  }
  v131 = v26;
  uint64_t v45 = v42 + 16 * v44;
  uint64_t v46 = *(void *)(v45 + 16);
  unint64_t v47 = *(void *)(v45 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21E6E1368();
  v48 = (void *)sub_21E6E12B8();
  v43(v39, v35);
  if (!v48[2])
  {
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v70 = v153;
    uint64_t v71 = v154;
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_21E6DEED0();
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v7, v72, v71);
    v73 = sub_21E6E1438();
    os_log_type_t v74 = sub_21E6E15B8();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_21E6D2000, v73, v74, "One of the tasks has no requests.", v75, 2u);
      MEMORY[0x223C303F0](v75, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v70 + 8))(v7, v71);
    goto LABEL_34;
  }
  uint64_t v50 = v48[4];
  unint64_t v49 = v48[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v130 = v46;
  uint64_t v156 = v46;
  unint64_t v157 = v47;
  swift_bridgeObjectRetain();
  sub_21E6E14F8();
  uint64_t v51 = v156;
  unint64_t v52 = v157;
  uint64_t v129 = v50;
  uint64_t v156 = v50;
  unint64_t v157 = v49;
  unint64_t v132 = v49;
  swift_bridgeObjectRetain();
  sub_21E6E14F8();
  uint64_t v53 = v156;
  unint64_t v54 = v157;
  type metadata accessor for FeatureStoreUtils();
  uint64_t v55 = sub_21E6E0394();
  v56 = (char *)static FeatureStoreUtils.retrieveFeature(streamId:interactionId:dataVersion:)(0xD000000000000014, 0x800000021E6E2C00, v51, v52, v55);
  swift_bridgeObjectRelease();
  uint64_t v57 = v154;
  if (!v56)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v76 = sub_21E6DEED0();
    v78 = v152;
    uint64_t v77 = v153;
    (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v152, v76, v57);
    swift_bridgeObjectRetain();
    v79 = sub_21E6E1438();
    os_log_type_t v80 = sub_21E6E15B8();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      uint64_t v156 = v82;
      *(_DWORD *)v81 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v155 = sub_21E6D8920(v130, v47, &v156);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v79, v80, "Could not get NLU stream for previous request %s", v81, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v82, -1, -1);
      MEMORY[0x223C303F0](v81, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v57);
    goto LABEL_34;
  }
  id v58 = objc_msgSend(v56, sel_json);
  v59 = v56;
  if (!v58)
  {
    swift_unknownObjectRelease();
    goto LABEL_13;
  }
  v60 = v58;
  v152 = v59;
  sub_21E6E14A8();

  uint64_t v61 = sub_21E6E0394();
  v62 = (void *)static FeatureStoreUtils.retrieveFeature(streamId:interactionId:dataVersion:)(0xD000000000000014, 0x800000021E6E2C00, v53, v54, v61);
  swift_bridgeObjectRelease();
  uint64_t v63 = v153;
  if (!v62) {
    goto LABEL_18;
  }
  id v64 = objc_msgSend(v62, sel_json);
  if (!v64)
  {
    swift_unknownObjectRelease();
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v83 = sub_21E6DEED0();
    v84 = v149;
    uint64_t v85 = v154;
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v149, v83, v154);
    unint64_t v86 = v132;
    swift_bridgeObjectRetain();
    v87 = sub_21E6E1438();
    os_log_type_t v88 = sub_21E6E15B8();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      uint64_t v156 = v90;
      *(_DWORD *)v89 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v155 = sub_21E6D8920(v129, v86, &v156);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v87, v88, "Could not get NLU stream for current request %s", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v90, -1, -1);
      MEMORY[0x223C303F0](v89, -1, -1);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v63 + 8))(v149, v85);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v84, v85);
    }
    goto LABEL_34;
  }
  v65 = v64;
  v128[2] = v62;
  uint64_t v66 = sub_21E6E14A8();
  v128[1] = v67;

  v68 = v151;
  sub_21E6E1158();
  sub_21E6E1408();
  sub_21E6D89F4();
  uint64_t v69 = v150;
  sub_21E6E1428();
  v149 = (char *)v66;
  uint64_t v91 = v148;
  (*(void (**)(char *, uint64_t))(v148 + 8))(v68, v69);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v68, v33, v69);
  v92 = v147;
  uint64_t v93 = v140;
  v94 = v138;
  sub_21E6E1158();
  sub_21E6E1408();
  sub_21E6E1428();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v69);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v92, v94, v69);
  uint64_t v95 = (uint64_t)v141;
  v96 = v145;
  sub_21E6E1148();
  uint64_t v97 = sub_21E6E1108();
  v98 = *(void (**)(char *, uint64_t))(v93 + 8);
  uint64_t v99 = v146;
  v98(v96, v146);
  sub_21E6E1148();
  uint64_t v100 = sub_21E6E1108();
  v98(v96, v99);
  uint64_t v102 = v143;
  uint64_t v101 = v144;
  if (*(void *)(v97 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v143 + 16))(v95, v97 + ((*(unsigned __int8 *)(v143 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80)), v144);
    v103 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56);
    v103(v95, 0, 1, v101);
  }
  else
  {
    v103 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v143 + 56);
    v103(v95, 1, 1, v144);
  }
  swift_bridgeObjectRelease();
  v104 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48);
  if (v104(v95, 1, v101) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v105 = *(void (**)(char *, uint64_t, uint64_t))(v102 + 32);
    v105(v142, v95, v101);
    if (*(void *)(v100 + 16))
    {
      uint64_t v95 = (uint64_t)v134;
      (*(void (**)(char *, unint64_t, uint64_t))(v102 + 16))(v134, v100 + ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80)), v101);
      uint64_t v106 = 0;
    }
    else
    {
      uint64_t v106 = 1;
      uint64_t v95 = (uint64_t)v134;
    }
    v103(v95, v106, 1, v101);
    swift_bridgeObjectRelease();
    uint64_t v107 = v95;
    if (v104(v95, 1, v101) != 1)
    {
      v119 = v133;
      v105(v133, v107, v101);
      v120 = v142;
      uint64_t v121 = sub_21E6E1128();
      uint64_t v123 = v122;
      uint64_t v124 = sub_21E6E1128();
      char v117 = sub_21E6DA150(v124, v125, v121, v123);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v126 = *(void (**)(char *, uint64_t))(v102 + 8);
      v126(v119, v101);
      v126(v120, v101);
      v127 = *(void (**)(char *, uint64_t))(v148 + 8);
      v127(v147, v69);
      v127(v151, v69);
      return v117 & 1;
    }
    (*(void (**)(char *, uint64_t))(v102 + 8))(v142, v101);
    v92 = v147;
  }
  sub_21E6D8A4C(v95);
  uint64_t v108 = sub_21E6DEED0();
  uint64_t v109 = v153;
  uint64_t v110 = v154;
  v111 = v136;
  (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v136, v108, v154);
  v112 = sub_21E6E1438();
  os_log_type_t v113 = sub_21E6E15B8();
  if (os_log_type_enabled(v112, v113))
  {
    v114 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v114 = 0;
    _os_log_impl(&dword_21E6D2000, v112, v113, "At least one requests generated no ASR outputs.", v114, 2u);
    MEMORY[0x223C303F0](v114, -1, -1);
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v109 + 8))(v111, v110);
  v115 = *(void (**)(char *, uint64_t))(v148 + 8);
  uint64_t v116 = v150;
  v115(v92, v150);
  v115(v151, v116);
LABEL_34:
  char v117 = 0;
  return v117 & 1;
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

uint64_t sub_21E6D8654(uint64_t a1)
{
  uint64_t result = sub_21E6D9DBC(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_21E6D9EF4(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_21E6D86D4@<X0>(uint64_t *a1@<X8>)
{
  sub_21E6DA704();
  uint64_t result = sub_21E6E15F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E6D8728(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_21E6D9C30(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = a1 + 56;
    do
    {
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_getAtKeyPath();
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v6 = *(void *)(v11 + 16);
      unint64_t v5 = *(void *)(v11 + 24);
      if (v6 >= v5 >> 1) {
        sub_21E6D9C30(v5 > 1, v6 + 1, 1);
      }
      *(void *)(v11 + 16) = v6 + 1;
      uint64_t v7 = v11 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21E6D8854(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2)
  {
    char v12 = 1;
    return v12 & 1;
  }
  if (v2 != 1)
  {
    swift_bridgeObjectRetain();
    char v12 = sub_21E6D91E0(a1, a2);
LABEL_16:
    swift_bridgeObjectRelease();
    return v12 & 1;
  }
  uint64_t result = sub_21E6D8654(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      uint64_t v9 = result;
      uint64_t v10 = (void *)(a1 + 40);
      while (1)
      {
        BOOL v11 = *(v10 - 1) == v9 && v7 == *v10;
        if (v11 || (sub_21E6E1708() & 1) != 0) {
          break;
        }
        v10 += 2;
        if (!--v8) {
          goto LABEL_12;
        }
      }
      char v12 = 1;
    }
    else
    {
LABEL_12:
      char v12 = 0;
    }
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E6D8920(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21E6D8AAC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21E6DA7AC((uint64_t)v12, *a3);
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
      sub_21E6DA7AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_21E6D89F4()
{
  unint64_t result = qword_267D40638;
  if (!qword_267D40638)
  {
    sub_21E6E1168();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D40638);
  }
  return result;
}

uint64_t sub_21E6D8A4C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D40630);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E6D8AAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21E6E15E8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21E6D8C68(a5, a6);
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
  uint64_t v8 = sub_21E6E1698();
  if (!v8)
  {
    sub_21E6E16A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21E6E16F8();
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

uint64_t sub_21E6D8C68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21E6D8D00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21E6D8EE0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21E6D8EE0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21E6D8D00(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21E6D8E78(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21E6E1678();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21E6E16A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21E6E1508();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21E6E16F8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21E6E16A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21E6D8E78(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D40660);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21E6D8EE0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D40660);
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
  uint64_t result = sub_21E6E16F8();
  __break(1u);
  return result;
}

uint64_t sub_21E6D9030(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_21E6E1748();
  swift_bridgeObjectRetain();
  sub_21E6E14E8();
  uint64_t v8 = sub_21E6E1768();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_21E6E1708() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_21E6E1708() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21E6D9630(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21E6D91E0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  size_t v5 = ((unint64_t)((1 << v4) + 63) >> 3) & 0x1FFFFFFFFFFFFFF8;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    char v6 = sub_21E6D9F48((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v3, a2);
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    char v6 = sub_21E6D9F48((uint64_t)v7, v3, a2);
    MEMORY[0x223C303F0](v7, -1, -1);
  }
  return v6 & 1;
}

uint64_t sub_21E6D9350()
{
  int64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D40648);
  uint64_t v3 = sub_21E6E1658();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                int64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
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
      sub_21E6E1748();
      sub_21E6E14E8();
      uint64_t result = sub_21E6E1768();
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
  *int64_t v1 = v4;
  return result;
}

uint64_t sub_21E6D9630(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21E6D9350();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_21E6D97CC();
      goto LABEL_22;
    }
    sub_21E6D9980();
  }
  uint64_t v11 = *v4;
  sub_21E6E1748();
  sub_21E6E14E8();
  uint64_t result = sub_21E6E1768();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_21E6E1708(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_21E6E1728();
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
          uint64_t result = sub_21E6E1708();
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

void *sub_21E6D97CC()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D40648);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E6E1648();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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

uint64_t sub_21E6D9980()
{
  int64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D40648);
  uint64_t v3 = sub_21E6E1658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *int64_t v1 = v4;
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
    sub_21E6E1748();
    swift_bridgeObjectRetain();
    sub_21E6E14E8();
    uint64_t result = sub_21E6E1768();
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
    int64_t v1 = v0;
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

uint64_t sub_21E6D9C30(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21E6D9C50(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_21E6D9C50(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D40658);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_21E6E16F8();
  __break(1u);
  return result;
}

uint64_t sub_21E6D9DBC(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_21E6D9E5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_21E6E1588();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_21E6D9030(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21E6D9EF4(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_21E6D9F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *(void *)(a2 + 16);
  if (v27)
  {
    uint64_t v28 = a3 + 56;
    uint64_t v26 = a2 + 32;
    swift_bridgeObjectRetain();
    uint64_t v25 = 0;
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = (uint64_t *)(v26 + 16 * v4);
      uint64_t v7 = *v5;
      uint64_t v6 = v5[1];
      sub_21E6E1748();
      swift_bridgeObjectRetain();
      sub_21E6E14E8();
      uint64_t v8 = sub_21E6E1768();
      uint64_t v9 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v10 = v8 & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = 1 << v10;
      if (((1 << v10) & *(void *)(v28 + 8 * (v10 >> 6))) == 0) {
        goto LABEL_3;
      }
      uint64_t v13 = *(void *)(a3 + 48);
      unint64_t v14 = (void *)(v13 + 16 * v10);
      BOOL v15 = *v14 == v7 && v14[1] == v6;
      if (!v15 && (sub_21E6E1708() & 1) == 0) {
        break;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_12:
      uint64_t v17 = *(void *)(a1 + 8 * v11);
      *(void *)(a1 + 8 * v11) = v12 | v17;
      if ((v12 & v17) == 0)
      {
        if (__OFADD__(v25, 1))
        {
          __break(1u);
          return result;
        }
        if (++v25 == *(void *)(a3 + 16))
        {
          uint64_t v23 = 1;
LABEL_26:
          swift_bridgeObjectRelease();
          return v23;
        }
      }
LABEL_4:
      if (++v4 == v27)
      {
        uint64_t v23 = 0;
        goto LABEL_26;
      }
    }
    uint64_t v18 = ~v9;
    for (unint64_t i = v10 + 1; ; unint64_t i = v20 + 1)
    {
      unint64_t v20 = i & v18;
      if (((*(void *)(v28 + (((i & v18) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v18)) & 1) == 0) {
        break;
      }
      uint64_t v21 = (void *)(v13 + 16 * v20);
      BOOL v22 = *v21 == v7 && v21[1] == v6;
      if (v22 || (sub_21E6E1708() & 1) != 0)
      {
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v20 >> 6;
        uint64_t v12 = 1 << v20;
        goto LABEL_12;
      }
    }
LABEL_3:
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  return 0;
}

uint64_t sub_21E6DA150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_21E6E1448();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v52 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v45 - v12;
  uint64_t v54 = a3;
  uint64_t v55 = a4;
  unint64_t v14 = sub_21E6DA6AC();
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v16 = MEMORY[0x223C2FDC0](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x263F8D310], v14);
  uint64_t v54 = a1;
  uint64_t v55 = a2;
  uint64_t v17 = v16;
  uint64_t v18 = MEMORY[0x223C2FDC0](32, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, v15, v14);
  uint64_t v19 = sub_21E6DEED0();
  unint64_t v49 = *(void (**)(char *))(v9 + 16);
  uint64_t v50 = v19;
  v49(v13);
  swift_bridgeObjectRetain_n();
  unint64_t v20 = sub_21E6E1438();
  os_log_type_t v21 = sub_21E6E15A8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v51 = v8;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v47 = v18;
    uint64_t v24 = v23;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v54 = v46;
    *(_DWORD *)uint64_t v24 = 134218242;
    uint64_t v53 = *(void *)(v17 + 16);
    uint64_t v48 = v9;
    sub_21E6E15D8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = MEMORY[0x223C2FD20](v25, MEMORY[0x263F8D980]);
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_21E6D8920(v26, v28, &v54);
    uint64_t v9 = v48;
    uint64_t v8 = v51;
    sub_21E6E15D8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E6D2000, v20, v21, "\n--- FIRST TOKENS (%ld):\n%s\n\n", (uint8_t *)v24, 0x16u);
    uint64_t v29 = v46;
    swift_arrayDestroy();
    MEMORY[0x223C303F0](v29, -1, -1);
    uint64_t v30 = v24;
    uint64_t v18 = v47;
    MEMORY[0x223C303F0](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
  v31(v13, v8);
  uint64_t v32 = v52;
  ((void (*)(char *, uint64_t, uint64_t))v49)(v52, v50, v8);
  swift_bridgeObjectRetain_n();
  v33 = sub_21E6E1438();
  os_log_type_t v34 = sub_21E6E15A8();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v54 = v36;
    *(_DWORD *)uint64_t v35 = 134218242;
    uint64_t v53 = *(void *)(v18 + 16);
    sub_21E6E15D8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v50 = v17;
    uint64_t v37 = swift_bridgeObjectRetain();
    uint64_t v38 = MEMORY[0x223C2FD20](v37, MEMORY[0x263F8D980]);
    unint64_t v49 = (void (*)(char *))v31;
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t v53 = sub_21E6D8920(v38, v40, &v54);
    sub_21E6E15D8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E6D2000, v33, v34, "\n--- SECOND TOKENS (%ld):\n%s\n\n", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C303F0](v36, -1, -1);
    MEMORY[0x223C303F0](v35, -1, -1);

    uint64_t v17 = v50;
    ((void (*)(char *, uint64_t))v49)(v52, v51);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v31(v32, v8);
  }
  uint64_t v41 = sub_21E6D8728(v17);
  swift_bridgeObjectRelease();
  uint64_t v42 = sub_21E6D8728(v18);
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_21E6D9E5C(v41);
  swift_bridgeObjectRelease();
  LOBYTE(v41) = sub_21E6D8854(v42, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v41 & 1;
}

ValueMetadata *type metadata accessor for RestatementChecker()
{
  return &type metadata for RestatementChecker;
}

unint64_t sub_21E6DA6AC()
{
  unint64_t result = qword_267D40640;
  if (!qword_267D40640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D40640);
  }
  return result;
}

unint64_t sub_21E6DA704()
{
  unint64_t result = qword_267D40650;
  if (!qword_267D40650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D40650);
  }
  return result;
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

uint64_t sub_21E6DA7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL sub_21E6DA808(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21E6DA81C()
{
  return sub_21E6E1768();
}

uint64_t sub_21E6DA864()
{
  return sub_21E6E1758();
}

uint64_t sub_21E6DA890()
{
  return sub_21E6E1768();
}

unint64_t sub_21E6DA8D4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_21E6DDDE4(*a1);
  *a2 = result;
  return result;
}

void sub_21E6DA900(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21E6DA90C()
{
  return sub_21E6E1538();
}

uint64_t sub_21E6DA96C()
{
  return sub_21E6E1528();
}

uint64_t sub_21E6DA9BC(uint64_t a1)
{
  uint64_t v2 = sub_21E6E1448();
  uint64_t v3 = *(char **)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v48 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v42 - v6;
  uint64_t v8 = sub_21E6E13E8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v42 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v17((char *)&v42 - v15, a1, v8);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v16, v8);
  if (v18 == *MEMORY[0x263F74F98] || v18 == *MEMORY[0x263F74F68])
  {
    uint64_t v20 = sub_21E6DEED0();
    uint64_t v48 = v3;
    (*((void (**)(char *, uint64_t, uint64_t))v3 + 2))(v7, v20, v2);
    v17(v14, a1, v8);
    os_log_type_t v21 = sub_21E6E1438();
    os_log_type_t v22 = sub_21E6E15B8();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = (char *)v2;
      uint64_t v24 = v23;
      *(_DWORD *)uint64_t v23 = 134217984;
      uint64_t v25 = sub_21E6E13D8();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      uint64_t v49 = v25;
      sub_21E6E15D8();
      _os_log_impl(&dword_21E6D2000, v21, v22, "Unsupported taskEngagementType: %ld", v24, 0xCu);
      uint64_t v26 = v24;
      uint64_t v2 = (uint64_t)v47;
      MEMORY[0x223C303F0](v26, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }

    (*((void (**)(char *, uint64_t))v48 + 1))(v7, v2);
  }
  else
  {
    if (v18 == *MEMORY[0x263F74F88]) {
      return 2;
    }
    if (v18 == *MEMORY[0x263F74F58]) {
      return 4;
    }
    if (v18 == *MEMORY[0x263F74F48]
      || v18 == *MEMORY[0x263F74F70]
      || v18 == *MEMORY[0x263F74F50]
      || v18 == *MEMORY[0x263F74F60]
      || v18 == *MEMORY[0x263F74F78]
      || v18 == *MEMORY[0x263F74F90])
    {
      return 3;
    }
    uint64_t v33 = v2;
    uint64_t v34 = sub_21E6DEED0();
    (*((void (**)(char *, uint64_t, uint64_t))v3 + 2))(v48, v34, v2);
    uint64_t v35 = v47;
    v17(v47, a1, v8);
    uint64_t v36 = sub_21E6E1438();
    os_log_type_t v37 = sub_21E6E15B8();
    int v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      int v45 = v38;
      unint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = v36;
      *(_DWORD *)unint64_t v40 = 134217984;
      uint64_t v44 = v40 + 4;
      uint64_t v43 = sub_21E6E13D8();
      uint64_t v41 = *(void (**)(char *, uint64_t))(v9 + 8);
      v41(v35, v8);
      uint64_t v49 = v43;
      uint64_t v36 = v46;
      sub_21E6E15D8();
      _os_log_impl(&dword_21E6D2000, v36, (os_log_type_t)v45, "Unknown taskEngagementType: %ld", v40, 0xCu);
      MEMORY[0x223C303F0](v40, -1, -1);
    }
    else
    {
      uint64_t v41 = *(void (**)(char *, uint64_t))(v9 + 8);
      v41(v35, v8);
    }

    (*((void (**)(char *, uint64_t))v3 + 1))(v48, v33);
    v41(v16, v8);
  }
  return 0;
}

void *sub_21E6DAF14(uint64_t a1)
{
  uint64_t v83 = a1;
  uint64_t v70 = sub_21E6E1448();
  os_log_type_t v80 = *(void (**)(char *, uint64_t))(v70 - 8);
  MEMORY[0x270FA5388](v70);
  uint64_t v2 = (char *)v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_21E6E1268();
  uint64_t v78 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v77 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v76 = (char *)v66 - v6;
  uint64_t v75 = sub_21E6E1258();
  uint64_t v73 = *(void *)(v75 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v75);
  uint64_t v72 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v71 = (char *)v66 - v9;
  uint64_t v10 = sub_21E6E13A8();
  uint64_t v81 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v66 - v14;
  uint64_t v79 = sub_21E6E12A8();
  uint64_t v16 = *(void *)(v79 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v79);
  uint64_t v69 = (char *)v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v66 - v19;
  uint64_t v82 = sub_21E6E1318();
  uint64_t v21 = *(void *)(v82 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v82);
  uint64_t v24 = (char *)v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)v66 - v25;
  id v74 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E2E0]), sel_init);
  if (v74)
  {
    v68 = v13;
    uint64_t v70 = v3;
    uint64_t v27 = v10;
    uint64_t v28 = v83;
    sub_21E6E1368();
    sub_21E6E12F8();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v21 + 8);
    uint64_t v29 = v21 + 8;
    os_log_type_t v80 = v30;
    v30(v26, v82);
    char v31 = sub_21E6E1278();
    uint64_t v32 = v20;
    uint64_t v33 = *(void (**)(char *, uint64_t))(v16 + 8);
    v66[0] = v16 + 8;
    v33(v32, v79);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v81 + 16);
    uint64_t v35 = v28;
    uint64_t v36 = v27;
    v34(v15, v35, v27);
    if (v31)
    {
      uint64_t v67 = *(void (**)(char *, uint64_t))(v81 + 8);
      v67(v15, v27);
      os_log_type_t v37 = v68;
      v34(v68, v83, v27);
      uint64_t v38 = v78;
      unint64_t v39 = v37;
    }
    else
    {
      sub_21E6E1368();
      uint64_t v47 = v69;
      sub_21E6E12F8();
      v80(v24, v82);
      char v48 = sub_21E6E1288();
      v33(v47, v79);
      uint64_t v67 = *(void (**)(char *, uint64_t))(v81 + 8);
      v67(v15, v27);
      unint64_t v39 = v68;
      v34(v68, v83, v36);
      if ((v48 & 1) == 0)
      {
        sub_21E6E1368();
        sub_21E6E12F8();
        uint64_t v49 = v82;
        uint64_t v51 = v80;
        v80(v24, v82);
        LODWORD(v81) = sub_21E6E1298();
        v33(v47, v79);
        v67(v39, v36);
        uint64_t v38 = v78;
        uint64_t v46 = v74;
        uint64_t v50 = v51;
        goto LABEL_11;
      }
      uint64_t v38 = v78;
    }
    uint64_t v49 = v82;
    v67(v39, v36);
    LODWORD(v81) = 1;
    uint64_t v46 = v74;
    uint64_t v50 = v80;
LABEL_11:
    v66[1] = v29;
    sub_21E6E1368();
    unint64_t v52 = v71;
    sub_21E6E12C8();
    v50(v24, v49);
    uint64_t v54 = v72;
    uint64_t v53 = v73;
    uint64_t v55 = v75;
    (*(void (**)(char *, void, uint64_t))(v73 + 104))(v72, *MEMORY[0x263F74EC8], v75);
    sub_21E6DDDF4(&qword_267D40668, MEMORY[0x263F74EF0]);
    uint64_t v56 = v49;
    sub_21E6E1518();
    sub_21E6E1518();
    BOOL v57 = v85 == v84;
    id v58 = *(void (**)(char *, uint64_t))(v53 + 8);
    v58(v54, v55);
    v58(v52, v55);
    objc_msgSend(v46, sel_setIsSuccess_, v57);
    sub_21E6E1368();
    v59 = v76;
    sub_21E6E12E8();
    v80(v24, v56);
    v60 = v77;
    uint64_t v61 = v70;
    (*(void (**)(char *, void, uint64_t))(v38 + 104))(v77, *MEMORY[0x263F74F20], v70);
    sub_21E6DDDF4(&qword_267D40670, MEMORY[0x263F74F28]);
    sub_21E6E1518();
    sub_21E6E1518();
    BOOL v62 = v85 == v84;
    uint64_t v63 = *(void (**)(char *, uint64_t))(v38 + 8);
    v63(v60, v61);
    v63(v59, v61);
    objc_msgSend(v46, sel_setIsExecuted_, v62);
    if (v81) {
      id v64 = 0;
    }
    else {
      id v64 = objc_msgSend(v46, sel_isSuccess);
    }
    objc_msgSend(v46, sel_setIsSuccessfulDirectExecution_, v64);
    return v46;
  }
  uint64_t v40 = sub_21E6DEED0();
  uint64_t v41 = (void (**)(char *, uint64_t))v80;
  uint64_t v42 = v70;
  (*((void (**)(char *, uint64_t, uint64_t))v80 + 2))(v2, v40, v70);
  uint64_t v43 = sub_21E6E1438();
  os_log_type_t v44 = sub_21E6E15B8();
  if (os_log_type_enabled(v43, v44))
  {
    int v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v45 = 0;
    _os_log_impl(&dword_21E6D2000, v43, v44, "Failed to create SELF simpleTaskInfo", v45, 2u);
    MEMORY[0x223C303F0](v45, -1, -1);
  }

  v41[1](v2, v42);
  return 0;
}

void *sub_21E6DB858(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_21E6DC1A4(a1, a2, a3, 2);
}

void *sub_21E6DB860(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_21E6E1448();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x60))(a3);
  uint64_t v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, sel_setTaskSuccessType_, 3);
    type metadata accessor for EditableTaskEvaluator();
    if (sub_21E6DF2D8())
    {
      objc_msgSend(v12, sel_setIsSuccess_, 0);
      objc_msgSend(v12, sel_setIsSuccessfulDirectExecution_, 0);
    }
  }
  else
  {
    uint64_t v13 = sub_21E6DEED0();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_21E6E1438();
    os_log_type_t v15 = sub_21E6E15B8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v20[0] = a1;
      uint64_t v18 = v17;
      uint64_t v21 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v20[1] = (uint64_t)(v16 + 4);
      swift_bridgeObjectRetain();
      v20[2] = sub_21E6D8920(v20[0], a2, &v21);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v14, v15, "Failed to create simpleTaskInfo for %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v18, -1, -1);
      MEMORY[0x223C303F0](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v12;
}

uint64_t sub_21E6DBB28(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v52 = a2;
  uint64_t v50 = a1;
  uint64_t v51 = sub_21E6E1448();
  uint64_t v5 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21E6E1208();
  uint64_t v48 = *(void *)(v8 - 8);
  uint64_t v49 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v47 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21E6E1248();
  uint64_t v45 = *(void *)(v10 - 8);
  uint64_t v46 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21E6E13E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v45 - v18;
  uint64_t v20 = a3;
  uint64_t v21 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x60))(a3);
  uint64_t v22 = v21;
  if (!v21)
  {
    uint64_t v49 = 0;
    uint64_t v37 = sub_21E6DEED0();
    uint64_t v38 = v5;
    uint64_t v39 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v37, v51);
    swift_bridgeObjectRetain_n();
    uint64_t v40 = sub_21E6E1438();
    os_log_type_t v41 = sub_21E6E15B8();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v54 = v43;
      *(_DWORD *)uint64_t v42 = 136315138;
      unint64_t v44 = (unint64_t)v52;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_21E6D8920(v50, v44, &v54);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v40, v41, "Failed to create simpleTaskInfo for %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v43, -1, -1);
      MEMORY[0x223C303F0](v42, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v39);
    return v49;
  }
  objc_msgSend(v21, sel_setTaskSuccessType_, 1);
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E2E8]), sel_init);
  if (!v23) {
    return (uint64_t)v22;
  }
  uint64_t v24 = v23;
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E2A8]), sel_init);
  if (!v25)
  {

    return (uint64_t)v22;
  }
  uint64_t v26 = v25;
  uint64_t v51 = v20;
  sub_21E6E1358();
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v17, *MEMORY[0x263F74F88], v13);
  sub_21E6DDDF4(&qword_267D40678, MEMORY[0x263F74FA8]);
  unint64_t v52 = v24;
  sub_21E6E1518();
  sub_21E6E1518();
  uint64_t v28 = v53;
  uint64_t v27 = v54;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29(v17, v13);
  v29(v19, v13);
  BOOL v30 = v27 == v28;
  char v31 = v52;
  if (!v30)
  {
LABEL_11:
    objc_msgSend(v31, sel_setLongRunningTaskInfo_, v26);
    objc_msgSend(v22, sel_setTaskSpecificInfo_, v31);

    return (uint64_t)v22;
  }
  sub_21E6E1338();
  uint64_t v32 = v47;
  sub_21E6E1238();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v46);
  sub_21E6E11F8();
  double v34 = v33;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v32, v49);
  double v36 = v34 * 1000.0;
  if ((~COERCE__INT64(v34 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v36 <= -1.0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v36 < 1.84467441e19)
  {
    objc_msgSend(v26, sel_setDurationInMs_, (unint64_t)v36);
    if ((unint64_t)objc_msgSend(v26, sel_durationInMs) >> 3 <= 0x270)
    {
      objc_msgSend(v22, sel_setIsSuccess_, 0);
      objc_msgSend(v22, sel_setIsSuccessfulDirectExecution_, 0);
    }
    goto LABEL_11;
  }
LABEL_20:
  __break(1u);
  return result;
}

void *sub_21E6DC19C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_21E6DC1A4(a1, a2, a3, 4);
}

void *sub_21E6DC1A4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_21E6E1448();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x60))(a3);
  uint64_t v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, sel_setTaskSuccessType_, a4);
  }
  else
  {
    uint64_t v15 = sub_21E6DEED0();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_21E6E1438();
    os_log_type_t v17 = sub_21E6E15B8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v22[0] = a1;
      uint64_t v20 = v19;
      uint64_t v23 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v22[1] = (uint64_t)(v18 + 4);
      swift_bridgeObjectRetain();
      v22[2] = sub_21E6D8920(v22[0], a2, &v23);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v16, v17, "Failed to create simpleTaskInfo for %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v20, -1, -1);
      MEMORY[0x223C303F0](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v14;
}

void (**sub_21E6DC430(unint64_t a1))(char *, uint64_t, uint64_t)
{
  uint64_t v2 = sub_21E6E14D8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v107 = (char *)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t isUniquelyReferenced_nonNull_native = sub_21E6E1448();
  uint64_t v5 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  uint64_t v6 = MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  uint64_t v8 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v88 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (unint64_t)&v88 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D40680);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v102 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21E6E13A8();
  os_log_type_t v17 = *(char **)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v101 = (uint64_t)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (uint64_t *)sub_21E6DCFB0(MEMORY[0x263F8EE78]);
  unint64_t v109 = (unint64_t)v19;
  v96 = v8;
  if (a1 >> 62) {
    goto LABEL_39;
  }
  uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v20)
  {
    while (1)
    {
      if (v20 < 1) {
        goto LABEL_68;
      }
      uint64_t v93 = v11;
      uint64_t v11 = 0;
      uint64_t v100 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
      uint64_t v91 = (void (**)(uint64_t, uint64_t))(v17 + 8);
      v92 = (void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32);
      v104 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      unint64_t v105 = a1 & 0xC000000000000001;
      v103 = (void (**)(char *, uint64_t))(v5 + 8);
      *(void *)&long long v21 = 136315138;
      long long v90 = v21;
      uint64_t v88 = MEMORY[0x263F8EE58] + 8;
      unint64_t v89 = a1;
      uint64_t v95 = isUniquelyReferenced_nonNull_native;
      unint64_t v97 = v13;
      uint64_t v98 = v20;
      uint64_t v99 = v16;
      while (1)
      {
        if (v105) {
          id v22 = (id)MEMORY[0x223C2FE40](v11, a1);
        }
        else {
          id v22 = *(id *)(a1 + 8 * (void)v11 + 32);
        }
        id v106 = v22;
        id v23 = objc_msgSend(v22, sel_eventBody, v88);
        if (!v23
          || (uint64_t v24 = v23, v25 = objc_msgSend(v23, sel_taskID),
                         v24,
                         !v25))
        {
          uint64_t v37 = sub_21E6DEED0();
          (*v104)(v8, v37, isUniquelyReferenced_nonNull_native);
          uint64_t v38 = sub_21E6E1438();
          os_log_type_t v39 = sub_21E6E15B8();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v40 = 0;
            _os_log_impl(&dword_21E6D2000, v38, v39, "Could not get taskId from event.", v40, 2u);
            MEMORY[0x223C303F0](v40, -1, -1);
          }

          (*v103)(v8, isUniquelyReferenced_nonNull_native);
          goto LABEL_6;
        }
        uint64_t v5 = sub_21E6E14A8();
        unint64_t v27 = v26;

        uint64_t v28 = (uint64_t)v102;
        sub_21E6E13F8();
        if ((*v100)(v28, 1, v16) != 1) {
          break;
        }
        sub_21E6DDE94(v28);
        uint64_t v29 = sub_21E6DEED0();
        BOOL v30 = v93;
        (*v104)(v93, v29, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRetain();
        char v31 = sub_21E6E1438();
        os_log_type_t v32 = sub_21E6E15B8();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = swift_slowAlloc();
          uint64_t v34 = swift_slowAlloc();
          v108[0] = v34;
          *(_DWORD *)uint64_t v33 = v90;
          swift_bridgeObjectRetain();
          *(void *)(v33 + 4) = sub_21E6D8920(v5, v27, v108);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21E6D2000, v31, v32, "Could not get engagement for taskId %s.", (uint8_t *)v33, 0xCu);
          swift_arrayDestroy();
          uint64_t v35 = v34;
          uint64_t isUniquelyReferenced_nonNull_native = v95;
          MEMORY[0x223C303F0](v35, -1, -1);
          uint64_t v36 = v33;
          uint64_t v8 = v96;
          MEMORY[0x223C303F0](v36, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }

        (*v103)(v30, isUniquelyReferenced_nonNull_native);
        unint64_t v13 = v97;
        uint64_t v16 = v99;
LABEL_35:
        uint64_t v20 = v98;
LABEL_6:
        if ((char *)v20 == ++v11)
        {
          swift_bridgeObjectRelease();
          uint64_t v19 = (uint64_t *)v109;
          goto LABEL_41;
        }
      }
      uint64_t v41 = v101;
      (*v92)(v101, v28, v16);
      uint64_t v42 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v94) + 0x90))(v41);
      if (!v42) {
        break;
      }
      os_log_type_t v17 = v42;
      uint64_t v19 = (uint64_t *)v109;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v108[0] = (uint64_t)v19;
      unint64_t v109 = 0x8000000000000000;
      unint64_t v13 = sub_21E6DD7C4(v5, v27);
      uint64_t v44 = v19[2];
      BOOL v45 = (v43 & 1) == 0;
      uint64_t v46 = v44 + v45;
      if (!__OFADD__(v44, v45))
      {
        char v47 = v43;
        if (v19[3] >= v46)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t v19 = v108;
            sub_21E6DDC30();
          }
        }
        else
        {
          sub_21E6DD83C(v46, isUniquelyReferenced_nonNull_native);
          uint64_t v19 = (uint64_t *)v108[0];
          unint64_t v48 = sub_21E6DD7C4(v5, v27);
          if ((v47 & 1) != (v49 & 1)) {
            goto LABEL_70;
          }
          unint64_t v13 = v48;
        }
        uint64_t isUniquelyReferenced_nonNull_native = v95;
        a1 = v108[0];
        if (v47)
        {
          uint64_t v57 = *(void *)(v108[0] + 56);

          *(void *)(v57 + 8 * v13) = v17;
        }
        else
        {
          *(void *)(v108[0] + 8 * (v13 >> 6) + 64) |= 1 << v13;
          id v58 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
          *id v58 = v5;
          v58[1] = v27;
          *(void *)(*(void *)(a1 + 56) + 8 * v13) = v17;
          uint64_t v59 = *(void *)(a1 + 16);
          BOOL v60 = __OFADD__(v59, 1);
          uint64_t v61 = v59 + 1;
          if (v60) {
            goto LABEL_38;
          }
          *(void *)(a1 + 16) = v61;
          swift_bridgeObjectRetain();
        }
        unint64_t v109 = a1;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v62 = v101;
        sub_21E6DDEF4(v101, (uint64_t)&v109);

        uint64_t v16 = v99;
        (*v91)(v62, v99);
        a1 = v89;
        uint64_t v8 = v96;
        unint64_t v13 = v97;
        goto LABEL_35;
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v8 = v96;
      uint64_t v20 = sub_21E6E16B8();
      if (!v20) {
        goto LABEL_40;
      }
    }
    uint64_t v50 = sub_21E6DEED0();
    (*v104)((char *)v13, v50, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_21E6E1438();
    os_log_type_t v52 = sub_21E6E15B8();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      v108[0] = v54;
      *(_DWORD *)uint64_t v53 = v90;
      swift_bridgeObjectRetain();
      *(void *)(v53 + 4) = sub_21E6D8920(v5, v27, v108);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v51, v52, "Could not evaluate %s.", (uint8_t *)v53, 0xCu);
      swift_arrayDestroy();
      uint64_t v55 = v54;
      uint64_t isUniquelyReferenced_nonNull_native = v95;
      MEMORY[0x223C303F0](v55, -1, -1);
      uint64_t v56 = v53;
      uint64_t v8 = v96;
      MEMORY[0x223C303F0](v56, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*v103)((char *)v13, isUniquelyReferenced_nonNull_native);
    uint64_t v16 = v99;
    (*v91)(v101, v99);
    goto LABEL_35;
  }
LABEL_40:
  swift_bridgeObjectRelease();
LABEL_41:
  uint64_t v63 = (void (**)(char *, uint64_t, uint64_t))objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  uint64_t v64 = v19[8];
  v104 = v63;
  unint64_t v105 = (unint64_t)(v19 + 8);
  uint64_t v65 = 1 << *((unsigned char *)v19 + 32);
  uint64_t v66 = -1;
  if (v65 < 64) {
    uint64_t v66 = ~(-1 << v65);
  }
  unint64_t v67 = v66 & v64;
  id v106 = (id)((unint64_t)(v65 + 63) >> 6);
  swift_bridgeObjectRetain();
  uint64_t v68 = 0;
  if (v67) {
    goto LABEL_46;
  }
LABEL_47:
  uint64_t v72 = v68 + 1;
  if (__OFADD__(v68, 1))
  {
    __break(1u);
    goto LABEL_67;
  }
  if (v72 >= (uint64_t)v106) {
    goto LABEL_65;
  }
  unint64_t v73 = *(void *)(v105 + 8 * v72);
  ++v68;
  if (v73) {
    goto LABEL_60;
  }
  uint64_t v68 = v72 + 1;
  if (v72 + 1 >= (uint64_t)v106) {
    goto LABEL_65;
  }
  unint64_t v73 = *(void *)(v105 + 8 * v68);
  if (v73) {
    goto LABEL_60;
  }
  uint64_t v68 = v72 + 2;
  if (v72 + 2 >= (uint64_t)v106) {
    goto LABEL_65;
  }
  unint64_t v73 = *(void *)(v105 + 8 * v68);
  if (v73) {
    goto LABEL_60;
  }
  uint64_t v74 = v72 + 3;
  if (v74 >= (uint64_t)v106)
  {
LABEL_65:
    swift_release();
    swift_bridgeObjectRelease();
    return v104;
  }
  unint64_t v73 = *(void *)(v105 + 8 * v74);
  if (!v73)
  {
    while (1)
    {
      uint64_t v68 = v74 + 1;
      if (__OFADD__(v74, 1)) {
        break;
      }
      if (v68 >= (uint64_t)v106) {
        goto LABEL_65;
      }
      unint64_t v73 = *(void *)(v105 + 8 * v68);
      ++v74;
      if (v73) {
        goto LABEL_60;
      }
    }
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  uint64_t v68 = v74;
LABEL_60:
  unint64_t v67 = (v73 - 1) & v73;
  for (unint64_t i = __clz(__rbit64(v73)) + (v68 << 6); ; unint64_t i = v70 | (v68 << 6))
  {
    uint64_t v75 = (uint64_t *)(v19[6] + 16 * i);
    uint64_t v76 = *v75;
    uint64_t v77 = v75[1];
    uint64_t v78 = *(void **)(v19[7] + 8 * i);
    swift_bridgeObjectRetain();
    id v79 = v78;
    id v80 = objc_msgSend(v79, sel_jsonData);
    if (!v80) {
      break;
    }
    uint64_t v81 = v80;
    uint64_t v82 = sub_21E6E10F8();
    unint64_t v84 = v83;

    sub_21E6E14C8();
    sub_21E6E14B8();
    uint64_t v86 = v85;
    sub_21E6DDE3C(v82, v84);
    if (v86)
    {
      uint64_t v69 = (void *)sub_21E6E1498();
      swift_bridgeObjectRelease();
      v108[0] = v76;
      v108[1] = v77;
      swift_bridgeObjectRetain();
      objc_msgSend(v104, sel___swift_setObject_forKeyedSubscript_, v69, sub_21E6E1718());
      swift_bridgeObjectRelease();

      swift_unknownObjectRelease();
      if (!v67) {
        goto LABEL_47;
      }
    }
    else
    {
      swift_bridgeObjectRelease();

      if (!v67) {
        goto LABEL_47;
      }
    }
LABEL_46:
    unint64_t v70 = __clz(__rbit64(v67));
    v67 &= v67 - 1;
  }
LABEL_69:
  __break(1u);
LABEL_70:
  uint64_t result = (void (**)(char *, uint64_t, uint64_t))sub_21E6E1738();
  __break(1u);
  return result;
}

unint64_t sub_21E6DCFB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D406A8);
  uint64_t v2 = (void *)sub_21E6E16E8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_21E6DD7C4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_21E6DD148(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21E6E13A8();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v36 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_21E6E1448();
  uint64_t v6 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  id v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E6E13E8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_21E6E1388();
  unint64_t v14 = v13;
  sub_21E6E1358();
  uint64_t v15 = (void *)MEMORY[0x263F8EED0];
  char v16 = (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & *v1) + 0x58))(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  switch(v16)
  {
    case 1:
      uint64_t v32 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))((*v15 & *v2) + 0x80))(v40, v14, a1);
      goto LABEL_8;
    case 2:
      uint64_t v32 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))((*v15 & *v2) + 0x78))(v40, v14, a1);
      goto LABEL_8;
    case 3:
      uint64_t v32 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))((*v15 & *v2) + 0x70))(v40, v14, a1);
      goto LABEL_8;
    case 4:
      uint64_t v32 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))((*v15 & *v2) + 0x68))(v40, v14, a1);
LABEL_8:
      uint64_t v33 = v32;
      swift_bridgeObjectRelease();
      break;
    default:
      uint64_t v17 = sub_21E6DEED0();
      uint64_t v18 = v6;
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      uint64_t v20 = v39;
      v19(v8, v17, v39);
      long long v21 = v36;
      uint64_t v22 = v37;
      uint64_t v23 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v36, a1, v38);
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_21E6E1438();
      os_log_type_t v25 = sub_21E6E15B8();
      if (os_log_type_enabled(v24, v25))
      {
        unint64_t v26 = v21;
        uint64_t v27 = v22;
        uint64_t v28 = swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v42 = v35;
        *(_DWORD *)uint64_t v28 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_21E6D8920(v40, v14, &v42);
        sub_21E6E15D8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 2080;
        uint64_t v29 = sub_21E6E1398();
        uint64_t v41 = sub_21E6D8920(v29, v30, &v42);
        sub_21E6E15D8();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v38);
        _os_log_impl(&dword_21E6D2000, v24, v25, "Task %s has unsupported taskType with taskName: %s", (uint8_t *)v28, 0x16u);
        uint64_t v31 = v35;
        swift_arrayDestroy();
        MEMORY[0x223C303F0](v31, -1, -1);
        MEMORY[0x223C303F0](v28, -1, -1);

        (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v39);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v23);

        (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v20);
      }
      uint64_t v33 = 0;
      break;
  }
  return v33;
}

id SimpleTaskSuccessEvaluator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SimpleTaskSuccessEvaluator.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator_minStartCallDurationInMs] = 5000;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimpleTaskSuccessEvaluator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SimpleTaskSuccessEvaluator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SimpleTaskSuccessEvaluator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21E6DD7C4(uint64_t a1, uint64_t a2)
{
  sub_21E6E1748();
  sub_21E6E14E8();
  uint64_t v4 = sub_21E6E1768();

  return sub_21E6DDB4C(a1, a2, v4);
}

uint64_t sub_21E6DD83C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D406A8);
  char v38 = a2;
  uint64_t v6 = sub_21E6E16D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_21E6E1748();
    sub_21E6E14E8();
    uint64_t result = sub_21E6E1768();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_21E6DDB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E6E1708() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21E6E1708() & 1) == 0);
    }
  }
  return v6;
}

id sub_21E6DDC30()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D406A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E6E16C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_21E6DDDE4(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

uint64_t sub_21E6DDDF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21E6DDE3C(uint64_t a1, unint64_t a2)
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

uint64_t sub_21E6DDE94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D40680);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E6DDEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v117 = a2;
  uint64_t v122 = sub_21E6E1448();
  uint64_t v119 = *(void *)(v122 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v122);
  v118 = &v108[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  unint64_t v7 = &v108[-v6];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = &v108[-v9];
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = &v108[-v11];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D40680);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = &v108[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_21E6E13A8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v120 = v16;
  uint64_t v121 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v20 = &v108[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  unint64_t v23 = &v108[-v22];
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  unint64_t v26 = &v108[-v25];
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = &v108[-v28];
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = &v108[-v30];
  if (sub_21E6E1328())
  {
    v112 = v29;
    os_log_type_t v113 = v26;
    v114 = v12;
    uint64_t v115 = (uint64_t)v23;
    v118 = v31;
    uint64_t v32 = v122;
    uint64_t v33 = v119;
    uint64_t v34 = (uint8_t *)sub_21E6E1348();
    unint64_t v36 = v35;
    uint64_t v116 = v34;
    sub_21E6E13F8();
    uint64_t v38 = v120;
    uint64_t v37 = v121;
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v121 + 48))(v15, 1, v120) == 1)
    {
      sub_21E6DDE94((uint64_t)v15);
      uint64_t v39 = sub_21E6DEED0();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v33 + 16))(v7, v39, v32);
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_21E6E1438();
      os_log_type_t v41 = sub_21E6E15B8();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v124 = v43;
        *(_DWORD *)uint64_t v42 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v123 = sub_21E6D8920((uint64_t)v116, v36, &v124);
        sub_21E6E15D8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21E6D2000, v40, v41, "Could not get previousTaskEngagement with taskId %s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C303F0](v43, -1, -1);
        MEMORY[0x223C303F0](v42, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v33 + 8))(v7, v32);
    }
    else
    {
      unint64_t v111 = v36;
      id v58 = v118;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v37 + 32))(v118, v15, v38);
      if (sub_21E6D71E0())
      {
        if (sub_21E6D7308())
        {
          uint64_t v59 = sub_21E6DEED0();
          uint64_t v60 = v33;
          uint64_t v61 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v33 + 16);
          uint64_t v62 = v114;
          v61(v114, v59, v32);
          uint64_t v63 = v38;
          uint64_t v64 = v37;
          uint64_t v65 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v37 + 16);
          uint64_t v66 = v112;
          v65(v112, a1, v63);
          unint64_t v67 = v113;
          v65(v113, (uint64_t)v58, v63);
          uint64_t v68 = sub_21E6E1438();
          os_log_type_t v69 = sub_21E6E1598();
          int v70 = v69;
          if (os_log_type_enabled(v68, v69))
          {
            uint64_t v71 = swift_slowAlloc();
            os_log_t v110 = v68;
            uint64_t v72 = v71;
            uint64_t v115 = swift_slowAlloc();
            uint64_t v124 = v115;
            *(_DWORD *)uint64_t v72 = 136315394;
            int v109 = v70;
            uint64_t v73 = sub_21E6E1388();
            uint64_t v123 = sub_21E6D8920(v73, v74, &v124);
            sub_21E6E15D8();
            swift_bridgeObjectRelease();
            uint64_t v75 = *(void (**)(unsigned char *, uint64_t))(v64 + 8);
            v75(v66, v63);
            *(_WORD *)(v72 + 12) = 2080;
            uint64_t v76 = sub_21E6E1388();
            uint64_t v123 = sub_21E6D8920(v76, v77, &v124);
            id v58 = v118;
            sub_21E6E15D8();
            swift_bridgeObjectRelease();
            v75(v67, v63);
            os_log_t v78 = v110;
            _os_log_impl(&dword_21E6D2000, v110, (os_log_type_t)v109, "Task %s is a restatement of %s", (uint8_t *)v72, 0x16u);
            uint64_t v79 = v115;
            swift_arrayDestroy();
            MEMORY[0x223C303F0](v79, -1, -1);
            MEMORY[0x223C303F0](v72, -1, -1);

            (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v114, v122);
          }
          else
          {
            uint64_t v75 = *(void (**)(unsigned char *, uint64_t))(v64 + 8);
            v75(v66, v63);
            v75(v67, v63);

            (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v62, v122);
          }
          uint64_t v97 = *(void *)v117;
          uint64_t v98 = v111;
          if (!*(void *)(*(void *)v117 + 16)) {
            goto LABEL_28;
          }
          swift_bridgeObjectRetain();
          unint64_t v99 = sub_21E6DD7C4((uint64_t)v116, v98);
          if (v100)
          {
            id v101 = *(id *)(*(void *)(v97 + 56) + 8 * v99);
            swift_bridgeObjectRelease();
            objc_msgSend(v101, sel_setIsSuccess_, 0);

            id v58 = v118;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          if (*(void *)(v97 + 16) && (unint64_t v102 = sub_21E6DD7C4((uint64_t)v116, v98), (v103 & 1) != 0))
          {
            id v104 = *(id *)(*(void *)(v97 + 56) + 8 * v102);
            unint64_t v105 = v58;
            id v106 = v104;
            swift_bridgeObjectRelease();
            objc_msgSend(v106, sel_setIsSuccessfulDirectExecution_, 0);

            uint64_t v107 = v105;
          }
          else
          {
LABEL_28:
            swift_bridgeObjectRelease();
            uint64_t v107 = v58;
          }
          return ((uint64_t (*)(unsigned char *, uint64_t))v75)(v107, v63);
        }
        else
        {
          (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v58, v38);
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        uint64_t v80 = sub_21E6DEED0();
        uint64_t v81 = v33;
        uint64_t v82 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v33 + 16);
        unint64_t v83 = v10;
        uint64_t v84 = v32;
        v82(v10, v80, v32);
        uint64_t v85 = v115;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v115, a1, v38);
        unint64_t v86 = v111;
        swift_bridgeObjectRetain();
        v87 = sub_21E6E1438();
        os_log_type_t v88 = sub_21E6E1598();
        if (os_log_type_enabled(v87, v88))
        {
          uint64_t v89 = swift_slowAlloc();
          uint64_t v117 = swift_slowAlloc();
          uint64_t v124 = v117;
          *(_DWORD *)uint64_t v89 = 136315394;
          uint64_t v90 = sub_21E6E1388();
          uint64_t v123 = sub_21E6D8920(v90, v91, &v124);
          sub_21E6E15D8();
          swift_bridgeObjectRelease();
          v92 = *(void (**)(uint64_t, uint64_t))(v121 + 8);
          v121 += 8;
          uint64_t v93 = v85;
          uint64_t v94 = v120;
          v92(v93, v120);
          *(_WORD *)(v89 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v123 = sub_21E6D8920((uint64_t)v116, v86, &v124);
          sub_21E6E15D8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21E6D2000, v87, v88, "Tasks %s and %s are ineligible for restatement correction.", (uint8_t *)v89, 0x16u);
          uint64_t v95 = v117;
          swift_arrayDestroy();
          MEMORY[0x223C303F0](v95, -1, -1);
          MEMORY[0x223C303F0](v89, -1, -1);

          (*(void (**)(unsigned char *, uint64_t))(v81 + 8))(v83, v122);
          return ((uint64_t (*)(unsigned char *, uint64_t))v92)(v118, v94);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v96 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
          v96(v85, v38);
          (*(void (**)(unsigned char *, uint64_t))(v81 + 8))(v83, v84);
          return ((uint64_t (*)(unsigned char *, uint64_t))v96)(v118, v38);
        }
      }
    }
  }
  else
  {
    uint64_t v44 = sub_21E6DEED0();
    BOOL v45 = v118;
    uint64_t v46 = v119;
    uint64_t v47 = v122;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v119 + 16))(v118, v44, v122);
    uint64_t v48 = v120;
    uint64_t v49 = v121;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v121 + 16))(v20, a1, v120);
    uint64_t v50 = sub_21E6E1438();
    os_log_type_t v51 = sub_21E6E1598();
    if (os_log_type_enabled(v50, v51))
    {
      os_log_type_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v117 = swift_slowAlloc();
      uint64_t v124 = v117;
      uint64_t v116 = v52;
      *(_DWORD *)os_log_type_t v52 = 136315138;
      uint64_t v53 = sub_21E6E1388();
      uint64_t v123 = sub_21E6D8920(v53, v54, &v124);
      sub_21E6E15D8();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v20, v48);
      uint64_t v55 = v116;
      _os_log_impl(&dword_21E6D2000, v50, v51, "Task %s has no previousTaskId set.", v116, 0xCu);
      uint64_t v56 = v117;
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v56, -1, -1);
      MEMORY[0x223C303F0](v55, -1, -1);

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v46 + 8))(v45, v122);
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v20, v48);

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v46 + 8))(v45, v47);
    }
  }
}

uint64_t type metadata accessor for SimpleTaskSuccessEvaluator()
{
  return self;
}

unint64_t sub_21E6DEAF8()
{
  unint64_t result = qword_267D40690;
  if (!qword_267D40690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D40690);
  }
  return result;
}

uint64_t method lookup function for SimpleTaskSuccessEvaluator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SimpleTaskSuccessEvaluator);
}

uint64_t dispatch thunk of SimpleTaskSuccessEvaluator.evaluate(pseEvents:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SimpleTaskSuccessEvaluator.evaluateTask(taskEngagement:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SimpleTaskSuccessEvaluator.TaskSuccessType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SimpleTaskSuccessEvaluator.TaskSuccessType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x21E6DED38);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_21E6DED60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21E6DED6C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SimpleTaskSuccessEvaluator.TaskSuccessType()
{
  return &type metadata for SimpleTaskSuccessEvaluator.TaskSuccessType;
}

unint64_t sub_21E6DED84()
{
  unint64_t result = qword_267D406A0;
  if (!qword_267D406A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D406A0);
  }
  return result;
}

uint64_t sub_21E6DEDD8()
{
  sub_21E6DEFD0();
  uint64_t result = sub_21E6E15C8();
  qword_267D409A0 = result;
  return result;
}

uint64_t sub_21E6DEE44()
{
  uint64_t v0 = sub_21E6E1448();
  __swift_allocate_value_buffer(v0, qword_267D409A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D409A8);
  if (qword_267D40980 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267D409A0;
  return sub_21E6E1458();
}

uint64_t sub_21E6DEED0()
{
  if (qword_267D40988 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21E6E1448();

  return __swift_project_value_buffer(v0, (uint64_t)qword_267D409A8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_21E6DEFD0()
{
  unint64_t result = qword_267D406B0;
  if (!qword_267D406B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D406B0);
  }
  return result;
}

uint64_t sub_21E6DF010()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D406C8);
  uint64_t v0 = sub_21E6E13E8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21E6E2220;
  unint64_t v5 = v4 + v3;
  unsigned int v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F74F70], v0);
  v6(v5 + v2, *MEMORY[0x263F74F48], v0);
  v6(v5 + 2 * v2, *MEMORY[0x263F74F60], v0);
  v6(v5 + 3 * v2, *MEMORY[0x263F74F50], v0);
  uint64_t v7 = sub_21E6DF768(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_267D409C0 = v7;
  return result;
}

uint64_t sub_21E6DF19C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D406C8);
  uint64_t v0 = sub_21E6E13E8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21E6E2230;
  unint64_t v5 = v4 + v3;
  unsigned int v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F74F78], v0);
  v6(v5 + v2, *MEMORY[0x263F74F90], v0);
  uint64_t v7 = sub_21E6DF768(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_267D409C8 = v7;
  return result;
}

uint64_t sub_21E6DF2D8()
{
  uint64_t v0 = sub_21E6E13E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21E6E1248();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E6E1338();
  uint64_t v8 = sub_21E6E1378();
  if (qword_267D40990 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_267D409C0;
  sub_21E6E1358();
  LOBYTE(v9) = sub_21E6DF55C((uint64_t)v3, v9);
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v3, v0);
  if (v9)
  {
    char v11 = sub_21E6DFA58((uint64_t)v7, v8);
  }
  else
  {
    if (qword_267D40998 != -1) {
      swift_once();
    }
    uint64_t v12 = qword_267D409C8;
    sub_21E6E1358();
    char v13 = sub_21E6DF55C((uint64_t)v3, v12);
    v10(v3, v0);
    if ((v13 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_bridgeObjectRelease();
      char v14 = 0;
      return v14 & 1;
    }
    char v11 = sub_21E6DFD78((uint64_t)v7, v8);
  }
  char v14 = v11;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14 & 1;
}

uint64_t sub_21E6DF55C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21E6E13E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_21E6E0350(&qword_267D406B8),
        uint64_t v7 = sub_21E6E1478(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    char v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_21E6E0350(&qword_267D406C0);
      char v15 = sub_21E6E1488();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_21E6DF748()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21E6DF758()
{
  return swift_allocObject();
}

uint64_t sub_21E6DF768(uint64_t a1)
{
  uint64_t v2 = sub_21E6E13E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D406D0);
    uint64_t v9 = sub_21E6E1668();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    char v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_21E6E0350(&qword_267D406B8);
      uint64_t v16 = sub_21E6E1478();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_21E6E0350(&qword_267D406C0);
          char v23 = sub_21E6E1488();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_21E6DFA58(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = sub_21E6E1248();
  uint64_t v3 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21E6E1198();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v35 - v11;
  sub_21E6E1218();
  char v13 = sub_21E6E1178();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v14 = v7 + 8;
  char v15 = v16;
  v16(v12, v6);
  if (v13)
  {
    sub_21E6E1218();
    uint64_t v17 = sub_21E6E1188();
    unint64_t v18 = v15;
    uint64_t v19 = v17;
    uint64_t v21 = v20;
    uint64_t v37 = v18;
    uint64_t v38 = v14;
    v18(v12, v6);
    uint64_t v22 = *(void *)(a2 + 16);
    if (v22)
    {
      uint64_t v36 = v6;
      uint64_t v23 = *(void *)(sub_21E6E13C8() - 8);
      uint64_t v24 = a2 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
      uint64_t v25 = (void (**)(char *, uint64_t))(v3 + 8);
      uint64_t v26 = a2;
      uint64_t v27 = *(void *)(v23 + 72);
      v35[1] = v26;
      swift_bridgeObjectRetain();
      uint64_t v28 = v22 - 1;
      while (1)
      {
        uint64_t v29 = v28;
        sub_21E6E13B8();
        sub_21E6E1218();
        (*v25)(v5, v39);
        uint64_t v30 = sub_21E6E1188();
        uint64_t v32 = v31;
        v37(v10, v36);
        if (v19 == v30 && v21 == v32) {
          break;
        }
        char v33 = sub_21E6E1708();
        swift_bridgeObjectRelease();
        if ((v33 & 1) == 0)
        {
          uint64_t v28 = v29 - 1;
          v24 += v27;
          if (v29) {
            continue;
          }
        }
        goto LABEL_12;
      }
      swift_bridgeObjectRelease();
      char v33 = 1;
LABEL_12:
      swift_bridgeObjectRelease();
    }
    else
    {
      char v33 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v33 = 0;
  }
  return v33 & 1;
}

uint64_t sub_21E6DFD78(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a2;
  uint64_t v2 = sub_21E6E1248();
  uint64_t v75 = *(void *)(v2 - 8);
  uint64_t v76 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v60 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v62 = (char *)&v56 - v5;
  uint64_t v6 = sub_21E6E13C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v67 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v56 - v10;
  uint64_t v12 = sub_21E6E11E8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v56 - v17;
  sub_21E6E1228();
  char v19 = sub_21E6E11A8();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v20 = v13 + 8;
  uint64_t v21 = v22;
  v22(v18, v12);
  if ((v19 & 1) == 0) {
    return 0;
  }
  uint64_t v59 = v16;
  uint64_t v73 = v11;
  sub_21E6E1228();
  uint64_t v23 = sub_21E6E11C8();
  uint64_t v25 = v24;
  uint64_t v66 = v12;
  uint64_t v26 = v20;
  v21(v18, v12);
  uint64_t v27 = *(void *)(v56 + 16);
  if (!v27)
  {
    uint64_t v53 = 0;
    goto LABEL_17;
  }
  id v58 = v18;
  uint64_t v29 = *(void (**)(char *))(v7 + 16);
  uint64_t v28 = v7 + 16;
  uint64_t v71 = v29;
  uint64_t v72 = v21;
  uint64_t v30 = v56 + ((*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64));
  int v70 = (void (**)(char *, uint64_t))(v75 + 8);
  uint64_t v64 = (void (**)(char *, uint64_t))(v28 - 8);
  uint64_t v61 = *(void *)(v28 + 56);
  swift_bridgeObjectRetain();
  uint64_t v31 = v30;
  uint64_t v32 = v62;
  char v33 = v73;
  uint64_t v34 = v59;
  uint64_t v63 = v25;
  uint64_t v65 = v6;
  uint64_t v68 = v26;
  uint64_t v69 = v28;
  uint64_t v57 = v23;
  while (1)
  {
    uint64_t v74 = v31;
    uint64_t v75 = v27;
    v71(v33);
    sub_21E6E13B8();
    sub_21E6E1228();
    unint64_t v35 = *v70;
    (*v70)(v32, v76);
    uint64_t v36 = sub_21E6E11C8();
    uint64_t v38 = v37;
    uint64_t v39 = v66;
    v72(v34, v66);
    if (v23 == v36 && v25 == v38) {
      break;
    }
    char v41 = sub_21E6E1708();
    swift_bridgeObjectRelease();
    uint64_t v40 = v67;
    if (v41) {
      goto LABEL_10;
    }
    char v33 = v73;
    (*v64)(v73, v65);
LABEL_5:
    uint64_t v31 = v74 + v61;
    uint64_t v27 = v75 - 1;
    uint64_t v25 = v63;
    if (v75 == 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v53 = 0;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v40 = v67;
LABEL_10:
  uint64_t v42 = v60;
  uint64_t v43 = v73;
  sub_21E6E13B8();
  uint64_t v44 = v58;
  sub_21E6E1228();
  uint64_t v45 = v76;
  v35(v42, v76);
  char v46 = sub_21E6E11B8();
  uint64_t v47 = v72;
  v72(v44, v39);
  uint64_t v48 = v43;
  uint64_t v49 = v39;
  uint64_t v50 = v65;
  ((void (*)(char *, char *, uint64_t))v71)(v40, v48, v65);
  if ((v46 & 1) == 0)
  {
    sub_21E6E13B8();
    sub_21E6E1228();
    v35(v42, v45);
    char v51 = sub_21E6E11D8();
    v47(v44, v49);
    os_log_type_t v52 = *v64;
    (*v64)(v40, v50);
    char v33 = v73;
    v52(v73, v50);
    uint64_t v32 = v62;
    uint64_t v34 = v59;
    uint64_t v23 = v57;
    if (v51)
    {
      swift_bridgeObjectRelease();
      uint64_t v53 = 1;
      goto LABEL_17;
    }
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  unint64_t v54 = *v64;
  (*v64)(v40, v50);
  v54(v73, v50);
  uint64_t v53 = 1;
LABEL_17:
  swift_bridgeObjectRelease();
  return v53;
}

uint64_t type metadata accessor for EditableTaskEvaluator()
{
  return self;
}

uint64_t sub_21E6E0350(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_21E6E13E8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E6E0394()
{
  return 1;
}

id FeatureStoreUtils.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id FeatureStoreUtils.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreUtils();
  return objc_msgSendSuper2(&v2, sel_init);
}

id FeatureStoreUtils.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreUtils();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21E6E05A4(uint64_t a1)
{
  uint64_t v2 = sub_21E6E1618();

  return sub_21E6E05E8(a1, v2);
}

unint64_t sub_21E6E05E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_21E6E1034(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C2FDE0](v9, a1);
      sub_21E6E0F80((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21E6E06B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D40648);
    uint64_t v3 = sub_21E6E1668();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_21E6E1748();
      swift_bridgeObjectRetain();
      sub_21E6E14E8();
      uint64_t result = sub_21E6E1768();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_21E6E1708(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          char v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_21E6E1708();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD4Data8streamId011interactionJ0Say10Foundation0H0VGSS_SStFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_21E6E1448();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v39 - v13;
  id v15 = objc_allocWithZone(MEMORY[0x263F3C0C0]);
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_21E6E1498();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_initWithStreamId_, v16);

  if (v17)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D40658);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21E6E2260;
    *(void *)(inited + 32) = a3;
    *(void *)(inited + 40) = a4;
    swift_bridgeObjectRetain();
    sub_21E6E06B0(inited);
    id v41 = v17;
    swift_setDeallocating();
    swift_arrayDestroy();
    char v19 = (void *)sub_21E6E1578();
    uint64_t v20 = v41;
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v20, sel_retrieve_, v19);

    if (v21)
    {
      uint64_t v22 = sub_21E6E1468();

      uint64_t v42 = a3;
      unint64_t v43 = a4;
      swift_bridgeObjectRetain();
      sub_21E6E1638();
      if (*(void *)(v22 + 16) && (unint64_t v23 = sub_21E6E05A4((uint64_t)v44), (v24 & 1) != 0))
      {
        sub_21E6DA7AC(*(void *)(v22 + 56) + 32 * v23, (uint64_t)&v45);
      }
      else
      {
        long long v45 = 0u;
        long long v46 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_21E6E0F80((uint64_t)v44);
      if (*((void *)&v46 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267D406E0);
        if (swift_dynamicCast())
        {

          return v42;
        }
      }
      else
      {
        sub_21E6E0FD4((uint64_t)&v45);
      }
    }
    uint64_t v39 = a1;
    uint64_t v33 = sub_21E6DEED0();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v33, v8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v34 = sub_21E6E1438();
    os_log_type_t v35 = sub_21E6E15B8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v44[0] = v37;
      *(_DWORD *)uint64_t v36 = 136315394;
      uint64_t v40 = v8;
      swift_bridgeObjectRetain();
      *(void *)&long long v45 = sub_21E6D8920(a3, a4, v44);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v45 = sub_21E6D8920(v39, a2, v44);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v34, v35, "Interaction %s does not exist in stream %s.", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v37, -1, -1);
      uint64_t v38 = v36;
      uint64_t v20 = v41;
      MEMORY[0x223C303F0](v38, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v40);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  else
  {
    uint64_t v25 = a1;
    uint64_t v26 = sub_21E6DEED0();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v26, v8);
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_21E6E1438();
    os_log_type_t v28 = sub_21E6E15B8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v40 = v8;
      uint64_t v31 = v30;
      v44[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v45 = sub_21E6D8920(v25, a2, v44);
      sub_21E6E15D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E6D2000, v27, v28, "Failed to extract to feature store because the stream %s is not found", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C303F0](v31, -1, -1);
      MEMORY[0x223C303F0](v29, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v40);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
  return MEMORY[0x263F8EE78];
}

id _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD08streamId011interactionI011dataVersionSo20FSFCurareInteraction_pSgSS_SSs6UInt32VtFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)_s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD4Data8streamId011interactionJ0Say10Foundation0H0VGSS_SStFZ_0(a1, a2, a3, a4);
  if (v6[2])
  {
    uint64_t v7 = v6[4];
    unint64_t v8 = v6[5];
    sub_21E6E1090(v7, v8);
    swift_bridgeObjectRelease();
    uint64_t v9 = self;
    uint64_t v10 = (void *)sub_21E6E10E8();
    uint64_t v11 = (void *)sub_21E6E1498();
    id v12 = objc_msgSend(v9, sel_deserialize_dataVersion_interactionId_, v10, a5, v11);
    sub_21E6DDE3C(v7, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v12;
}

uint64_t type metadata accessor for FeatureStoreUtils()
{
  return self;
}

uint64_t sub_21E6E0F80(uint64_t a1)
{
  return a1;
}

uint64_t sub_21E6E0FD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D406D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E6E1034(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_21E6E1090(uint64_t a1, unint64_t a2)
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

uint64_t sub_21E6E10E8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21E6E10F8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21E6E1108()
{
  return MEMORY[0x270F6A438]();
}

uint64_t sub_21E6E1118()
{
  return MEMORY[0x270F6A480]();
}

uint64_t sub_21E6E1128()
{
  return MEMORY[0x270F6A6B8]();
}

uint64_t sub_21E6E1138()
{
  return MEMORY[0x270F6A6D0]();
}

uint64_t sub_21E6E1148()
{
  return MEMORY[0x270F6B9F8]();
}

uint64_t sub_21E6E1158()
{
  return MEMORY[0x270F6BA20]();
}

uint64_t sub_21E6E1168()
{
  return MEMORY[0x270F6BA28]();
}

uint64_t sub_21E6E1178()
{
  return MEMORY[0x270F72008]();
}

uint64_t sub_21E6E1188()
{
  return MEMORY[0x270F72010]();
}

uint64_t sub_21E6E1198()
{
  return MEMORY[0x270F72028]();
}

uint64_t sub_21E6E11A8()
{
  return MEMORY[0x270F72030]();
}

uint64_t sub_21E6E11B8()
{
  return MEMORY[0x270F72038]();
}

uint64_t sub_21E6E11C8()
{
  return MEMORY[0x270F72040]();
}

uint64_t sub_21E6E11D8()
{
  return MEMORY[0x270F72048]();
}

uint64_t sub_21E6E11E8()
{
  return MEMORY[0x270F72050]();
}

uint64_t sub_21E6E11F8()
{
  return MEMORY[0x270F720A8]();
}

uint64_t sub_21E6E1208()
{
  return MEMORY[0x270F720B0]();
}

uint64_t sub_21E6E1218()
{
  return MEMORY[0x270F72110]();
}

uint64_t sub_21E6E1228()
{
  return MEMORY[0x270F72120]();
}

uint64_t sub_21E6E1238()
{
  return MEMORY[0x270F72140]();
}

uint64_t sub_21E6E1248()
{
  return MEMORY[0x270F72150]();
}

uint64_t sub_21E6E1258()
{
  return MEMORY[0x270F72158]();
}

uint64_t sub_21E6E1268()
{
  return MEMORY[0x270F72160]();
}

uint64_t sub_21E6E1278()
{
  return MEMORY[0x270F72168]();
}

uint64_t sub_21E6E1288()
{
  return MEMORY[0x270F72178]();
}

uint64_t sub_21E6E1298()
{
  return MEMORY[0x270F72188]();
}

uint64_t sub_21E6E12A8()
{
  return MEMORY[0x270F721A8]();
}

uint64_t sub_21E6E12B8()
{
  return MEMORY[0x270F721B0]();
}

uint64_t sub_21E6E12C8()
{
  return MEMORY[0x270F721C0]();
}

uint64_t sub_21E6E12D8()
{
  return MEMORY[0x270F721D0]();
}

uint64_t sub_21E6E12E8()
{
  return MEMORY[0x270F721E0]();
}

uint64_t sub_21E6E12F8()
{
  return MEMORY[0x270F721F0]();
}

uint64_t sub_21E6E1308()
{
  return MEMORY[0x270F72200]();
}

uint64_t sub_21E6E1318()
{
  return MEMORY[0x270F72218]();
}

uint64_t sub_21E6E1328()
{
  return MEMORY[0x270F72220]();
}

uint64_t sub_21E6E1338()
{
  return MEMORY[0x270F72228]();
}

uint64_t sub_21E6E1348()
{
  return MEMORY[0x270F72238]();
}

uint64_t sub_21E6E1358()
{
  return MEMORY[0x270F72248]();
}

uint64_t sub_21E6E1368()
{
  return MEMORY[0x270F72258]();
}

uint64_t sub_21E6E1378()
{
  return MEMORY[0x270F72270]();
}

uint64_t sub_21E6E1388()
{
  return MEMORY[0x270F72280]();
}

uint64_t sub_21E6E1398()
{
  return MEMORY[0x270F72290]();
}

uint64_t sub_21E6E13A8()
{
  return MEMORY[0x270F722A8]();
}

uint64_t sub_21E6E13B8()
{
  return MEMORY[0x270F722B8]();
}

uint64_t sub_21E6E13C8()
{
  return MEMORY[0x270F722E8]();
}

uint64_t sub_21E6E13D8()
{
  return MEMORY[0x270F722F0]();
}

uint64_t sub_21E6E13E8()
{
  return MEMORY[0x270F722F8]();
}

uint64_t sub_21E6E13F8()
{
  return MEMORY[0x270F72340]();
}

uint64_t sub_21E6E1408()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_21E6E1418()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_21E6E1428()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_21E6E1438()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21E6E1448()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21E6E1458()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_21E6E1468()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21E6E1478()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21E6E1488()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21E6E1498()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E6E14A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21E6E14B8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_21E6E14C8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_21E6E14D8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_21E6E14E8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E6E14F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21E6E1508()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21E6E1518()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_21E6E1528()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_21E6E1538()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_21E6E1548()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21E6E1558()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21E6E1568()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21E6E1578()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_21E6E1588()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21E6E1598()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21E6E15A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21E6E15B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21E6E15C8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_21E6E15D8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21E6E15E8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21E6E15F8()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_21E6E1608()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_21E6E1618()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21E6E1628()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21E6E1638()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21E6E1648()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21E6E1658()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21E6E1668()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21E6E1678()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21E6E1688()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21E6E1698()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21E6E16A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21E6E16B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21E6E16C8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21E6E16D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21E6E16E8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21E6E16F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21E6E1708()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E6E1718()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_21E6E1728()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21E6E1738()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21E6E1748()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E6E1758()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21E6E1768()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void NSLog(NSString *format, ...)
{
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}