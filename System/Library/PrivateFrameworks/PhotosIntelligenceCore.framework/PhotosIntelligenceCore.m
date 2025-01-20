uint64_t sub_25993BA4C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_259955F70();
  v3 = (void *)sub_259955F70();
  v4 = (void *)sub_259955F70();
  v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  v6 = sub_259955F80();
  return v6;
}

id sub_25993BB4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalizedString();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_25993BBA4(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LocalizedString();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_25993BC1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocalizedString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocalizedString()
{
  return self;
}

uint64_t static PNKeyPickerProcessor.keyPick(from:options:)(uint64_t a1, void *a2)
{
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    id v8 = a2;
    unint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v3 = (uint64_t)sub_25993C1B0(v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8;
    id v4 = a2;
    swift_bridgeObjectRetain();
  }
  uint64_t v10 = v3;
  sub_25993C110(&v10, a2);
  uint64_t v5 = v10;
  if (v10 < 0 || (v10 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_259956150();
    swift_release();
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(v10 + 16);
    if (!v6)
    {
LABEL_10:
      swift_release();
      return v6;
    }
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = MEMORY[0x25A2E19A0](0, v5);
    goto LABEL_10;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v6 = *(void *)(v5 + 32);
    swift_unknownObjectRetain();
    goto LABEL_10;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_25993BD7C(id *a1, void **a2, void *a3)
{
  id v4 = *a1;
  uint64_t v5 = *a2;
  unsigned int v6 = objc_msgSend(*a1, sel_favorite);
  if (v6 != objc_msgSend(v5, sel_favorite)) {
    return objc_msgSend(v4, sel_favorite);
  }
  objc_msgSend(v4, sel_curationScore);
  double v9 = v8;
  objc_msgSend(v5, sel_curationScore);
  double v11 = vabdd_f64(v9, v10);
  objc_msgSend(a3, sel_comparableCurationScoreThreshold);
  if (v12 <= v11)
  {
    objc_msgSend(v4, sel_curationScore);
    double v27 = v26;
    objc_msgSend(v5, sel_curationScore);
    return (id)(v28 < v27);
  }
  objc_msgSend(v4, sel_overallAestheticScore);
  float v14 = v13;
  objc_msgSend(v5, sel_overallAestheticScore);
  if (v14 != v15)
  {
    objc_msgSend(v4, sel_overallAestheticScore);
    float v31 = v30;
    objc_msgSend(v5, sel_overallAestheticScore);
    return (id)(v32 < v31);
  }
  id v16 = objc_msgSend(v4, sel_identifier);
  uint64_t v17 = sub_259955F80();
  uint64_t v19 = v18;

  id v20 = objc_msgSend(v5, sel_identifier);
  uint64_t v21 = sub_259955F80();
  uint64_t v23 = v22;

  if (v17 == v21 && v19 == v23)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  else
  {
    char v25 = sub_2599561A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)(v25 & 1);
  }
}

PNKeyPickerProcessor __swiftcall PNKeyPickerProcessor.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (PNKeyPickerProcessor)objc_msgSend(v0, sel_init);
}

id PNKeyPickerProcessor.init()()
{
  v1.super_class = (Class)PNKeyPickerProcessor;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_25993C064(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_259956140();
    __break(1u);
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2408);
    uint64_t result = sub_259955FF0();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void sub_25993C110(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_25993D924();
  }
  uint64_t v6 = *(void *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  id v7 = v4;
  sub_25993C2C8(v8, v7);
  sub_259956130();
}

void *sub_25993C1B0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2410);
      uint64_t v3 = (void *)swift_allocObject();
      size_t v4 = _swift_stdlib_malloc_size(v3);
      v3[2] = v2;
      v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_25993D6F4((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_259956150();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

unint64_t sub_25993C2A4(unint64_t result, char a2, uint64_t a3)
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

void sub_25993C2C8(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[1];
  id v4 = a2;
  uint64_t v5 = sub_259956190();
  if (v5 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_168;
    }
    if (v3) {
      sub_25993CE64(0, v3, 1, a1, v4);
    }
    else {

    }
    goto LABEL_145;
  }
  uint64_t v6 = v5;
  uint64_t v7 = sub_25993C064(v3 / 2);
  __dst = v8;
  uint64_t v168 = v7;
  v161 = v4;
  uint64_t v153 = v3;
  v149 = a1;
  if (v3 <= 0) {
    goto LABEL_129;
  }
  uint64_t v150 = v6;
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  double v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v148 = *a1 - 8;
  double v12 = (SEL *)&property descriptor for PNAssetGroupOptions.groupByDifferentOrientation;
  uint64_t v159 = *a1;
  while (1)
  {
    uint64_t v13 = v9 + 1;
    uint64_t v156 = v9;
    if (v9 + 1 >= v3) {
      goto LABEL_39;
    }
    v151 = v11;
    id v167 = *(id *)(v10 + 8 * v13);
    v166 = *(void **)(v10 + 8 * v9);
    uint64_t v14 = v9;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    unsigned int v162 = sub_25993BD7C(&v167, &v166, v4);
    if (v160)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
LABEL_127:
      if (v3 >= -1)
      {
LABEL_144:
        *(void *)((v168 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_259955FE0();

        swift_bridgeObjectRelease();
LABEL_145:

        return;
      }
      __break(1u);
LABEL_129:
      double v11 = (char *)MEMORY[0x263F8EE78];
      unint64_t v91 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_130:
      v141 = v11;
      if (v91 >= 2)
      {
        uint64_t v142 = *v149;
        uint64_t v165 = *v149;
        do
        {
          unint64_t v143 = v91 - 2;
          if (v91 < 2) {
            goto LABEL_163;
          }
          if (!v142) {
            goto LABEL_177;
          }
          uint64_t v144 = *(void *)&v141[16 * v143 + 32];
          uint64_t v145 = *(void *)&v141[16 * v91 + 24];
          sub_25993D138((char *)(v142 + 8 * v144), (char *)(v142 + 8 * *(void *)&v141[16 * v91 + 16]), v142 + 8 * v145, __dst, v161);
          id v4 = v160;
          if (v160) {
            goto LABEL_126;
          }
          if (v145 < v144) {
            goto LABEL_164;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v141 = sub_25993D524((uint64_t)v141);
          }
          if (v143 >= *((void *)v141 + 2)) {
            goto LABEL_165;
          }
          v146 = &v141[16 * v143 + 32];
          *(void *)v146 = v144;
          *((void *)v146 + 1) = v145;
          unint64_t v147 = *((void *)v141 + 2);
          if (v91 > v147) {
            goto LABEL_166;
          }
          memmove(&v141[16 * v91 + 16], &v141[16 * v91 + 32], 16 * (v147 - v91));
          *((void *)v141 + 2) = v147 - 1;
          unint64_t v91 = v147 - 1;
          id v4 = v161;
          uint64_t v142 = v165;
          uint64_t v3 = v153;
        }
        while (v147 > 2);
      }
      swift_bridgeObjectRelease();
      if (v3 < -1) {
        goto LABEL_173;
      }
      goto LABEL_144;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v13 = v14 + 2;
    if (v14 + 2 >= v3) {
      goto LABEL_28;
    }
    while (1)
    {
      uint64_t v15 = v10 + 8 * v14;
      uint64_t v17 = *(void **)(v15 + 8);
      id v16 = *(void **)(v15 + 16);
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      unsigned int v18 = objc_msgSend(v16, sel_favorite);
      if (v18 != objc_msgSend(v17, sel_favorite))
      {
        unsigned int v19 = objc_msgSend(v16, sel_favorite);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if ((v162 ^ v19)) {
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      objc_msgSend(v16, sel_curationScore);
      double v21 = v20;
      objc_msgSend(v17, sel_curationScore);
      double v23 = vabdd_f64(v21, v22);
      objc_msgSend(v4, sel_comparableCurationScoreThreshold);
      if (v24 <= v23)
      {
        objc_msgSend(v16, sel_curationScore);
        double v38 = v37;
        objc_msgSend(v17, sel_curationScore);
        double v40 = v39;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        BOOL v41 = v40 < v38;
        goto LABEL_19;
      }
      objc_msgSend(v16, sel_overallAestheticScore);
      float v26 = v25;
      objc_msgSend(v17, sel_overallAestheticScore);
      if (v26 != v27)
      {
        objc_msgSend(v16, sel_overallAestheticScore);
        float v43 = v42;
        objc_msgSend(v17, sel_overallAestheticScore);
        float v45 = v44;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        BOOL v41 = v45 < v43;
LABEL_19:
        int v46 = !v41;
        if (((v162 ^ v46) & 1) == 0) {
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      id v28 = objc_msgSend(v16, sel_identifier);
      uint64_t v157 = sub_259955F80();
      uint64_t v30 = v29;

      id v31 = objc_msgSend(v17, sel_identifier);
      uint64_t v32 = sub_259955F80();
      uint64_t v34 = v33;

      BOOL v35 = v157 == v32 && v30 == v34;
      char v36 = v35 ? 0 : sub_2599561A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      char v47 = v162 ^ v36;
      id v4 = v161;
      uint64_t v10 = v159;
      if (v47) {
        break;
      }
LABEL_26:
      ++v13;
      uint64_t v48 = v14 + 3;
      ++v14;
      if (v48 >= v3)
      {
        uint64_t v13 = v3;
        goto LABEL_28;
      }
    }
    uint64_t v13 = v14 + 2;
LABEL_28:
    if ((v162 & 1) == 0)
    {
      double v11 = v151;
      double v12 = (SEL *)&property descriptor for PNAssetGroupOptions.groupByDifferentOrientation;
      goto LABEL_38;
    }
    uint64_t v9 = v156;
    double v11 = v151;
    if (v13 < v156) {
      goto LABEL_172;
    }
    double v12 = (SEL *)&property descriptor for PNAssetGroupOptions.groupByDifferentOrientation;
    if (v156 < v13)
    {
      v49 = (uint64_t *)(v148 + 8 * v13);
      uint64_t v50 = v13;
      uint64_t v51 = v156;
      v52 = (uint64_t *)(v10 + 8 * v156);
      do
      {
        if (v51 != --v50)
        {
          if (!v10) {
            goto LABEL_176;
          }
          uint64_t v53 = *v52;
          uint64_t *v52 = *v49;
          uint64_t *v49 = v53;
        }
        ++v51;
        --v49;
        ++v52;
      }
      while (v51 < v50);
LABEL_38:
      uint64_t v9 = v156;
    }
LABEL_39:
    if (v13 < v3) {
      break;
    }
LABEL_71:
    if (v13 < v9) {
      goto LABEL_167;
    }
    uint64_t v164 = v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      double v11 = sub_25993D42C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v90 = *((void *)v11 + 2);
    unint64_t v89 = *((void *)v11 + 3);
    unint64_t v91 = v90 + 1;
    uint64_t v92 = v10;
    if (v90 >= v89 >> 1) {
      double v11 = sub_25993D42C((char *)(v89 > 1), v90 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v91;
    v93 = v11 + 32;
    v94 = &v11[16 * v90 + 32];
    *(void *)v94 = v156;
    *((void *)v94 + 1) = v13;
    if (v90)
    {
      while (1)
      {
        unint64_t v95 = v91 - 1;
        if (v91 >= 4)
        {
          v100 = &v93[16 * v91];
          uint64_t v101 = *((void *)v100 - 8);
          uint64_t v102 = *((void *)v100 - 7);
          BOOL v106 = __OFSUB__(v102, v101);
          uint64_t v103 = v102 - v101;
          if (v106) {
            goto LABEL_152;
          }
          uint64_t v105 = *((void *)v100 - 6);
          uint64_t v104 = *((void *)v100 - 5);
          BOOL v106 = __OFSUB__(v104, v105);
          uint64_t v98 = v104 - v105;
          char v99 = v106;
          if (v106) {
            goto LABEL_153;
          }
          unint64_t v107 = v91 - 2;
          v108 = &v93[16 * v91 - 32];
          uint64_t v110 = *(void *)v108;
          uint64_t v109 = *((void *)v108 + 1);
          BOOL v106 = __OFSUB__(v109, v110);
          uint64_t v111 = v109 - v110;
          if (v106) {
            goto LABEL_154;
          }
          BOOL v106 = __OFADD__(v98, v111);
          uint64_t v112 = v98 + v111;
          if (v106) {
            goto LABEL_156;
          }
          if (v112 >= v103)
          {
            v130 = &v93[16 * v95];
            uint64_t v132 = *(void *)v130;
            uint64_t v131 = *((void *)v130 + 1);
            BOOL v106 = __OFSUB__(v131, v132);
            uint64_t v133 = v131 - v132;
            if (v106) {
              goto LABEL_162;
            }
            BOOL v123 = v98 < v133;
            goto LABEL_108;
          }
        }
        else
        {
          if (v91 != 3)
          {
            uint64_t v124 = *((void *)v11 + 4);
            uint64_t v125 = *((void *)v11 + 5);
            BOOL v106 = __OFSUB__(v125, v124);
            uint64_t v117 = v125 - v124;
            char v118 = v106;
            goto LABEL_102;
          }
          uint64_t v97 = *((void *)v11 + 4);
          uint64_t v96 = *((void *)v11 + 5);
          BOOL v106 = __OFSUB__(v96, v97);
          uint64_t v98 = v96 - v97;
          char v99 = v106;
        }
        if (v99) {
          goto LABEL_155;
        }
        unint64_t v107 = v91 - 2;
        v113 = &v93[16 * v91 - 32];
        uint64_t v115 = *(void *)v113;
        uint64_t v114 = *((void *)v113 + 1);
        BOOL v116 = __OFSUB__(v114, v115);
        uint64_t v117 = v114 - v115;
        char v118 = v116;
        if (v116) {
          goto LABEL_157;
        }
        v119 = &v93[16 * v95];
        uint64_t v121 = *(void *)v119;
        uint64_t v120 = *((void *)v119 + 1);
        BOOL v106 = __OFSUB__(v120, v121);
        uint64_t v122 = v120 - v121;
        if (v106) {
          goto LABEL_159;
        }
        if (__OFADD__(v117, v122)) {
          goto LABEL_161;
        }
        if (v117 + v122 >= v98)
        {
          BOOL v123 = v98 < v122;
LABEL_108:
          if (v123) {
            unint64_t v95 = v107;
          }
          goto LABEL_110;
        }
LABEL_102:
        if (v118) {
          goto LABEL_158;
        }
        v126 = &v93[16 * v95];
        uint64_t v128 = *(void *)v126;
        uint64_t v127 = *((void *)v126 + 1);
        BOOL v106 = __OFSUB__(v127, v128);
        uint64_t v129 = v127 - v128;
        if (v106) {
          goto LABEL_160;
        }
        if (v129 < v117) {
          goto LABEL_119;
        }
LABEL_110:
        unint64_t v134 = v95 - 1;
        if (v95 - 1 >= v91)
        {
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
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
          goto LABEL_171;
        }
        if (!v92) {
          goto LABEL_175;
        }
        uint64_t v135 = v92;
        v136 = &v93[16 * v134];
        uint64_t v137 = *(void *)v136;
        id v4 = (id)v95;
        v138 = &v93[16 * v95];
        uint64_t v139 = *((void *)v138 + 1);
        sub_25993D138((char *)(v135 + 8 * *(void *)v136), (char *)(v135 + 8 * *(void *)v138), v135 + 8 * v139, __dst, v161);
        if (v160)
        {
LABEL_126:
          swift_bridgeObjectRelease();
          id v4 = v161;
          uint64_t v3 = v153;
          goto LABEL_127;
        }
        if (v139 < v137) {
          goto LABEL_149;
        }
        if ((unint64_t)v4 > *((void *)v11 + 2)) {
          goto LABEL_150;
        }
        *(void *)v136 = v137;
        *(void *)&v93[16 * v134 + 8] = v139;
        unint64_t v140 = *((void *)v11 + 2);
        if ((unint64_t)v4 >= v140) {
          goto LABEL_151;
        }
        unint64_t v91 = v140 - 1;
        memmove(v138, v138 + 16, 16 * (v140 - 1 - (void)v4));
        *((void *)v11 + 2) = v140 - 1;
        id v4 = v161;
        uint64_t v92 = v159;
        double v12 = (SEL *)&property descriptor for PNAssetGroupOptions.groupByDifferentOrientation;
        if (v140 <= 2) {
          goto LABEL_119;
        }
      }
    }
    unint64_t v91 = 1;
LABEL_119:
    uint64_t v3 = v153;
    uint64_t v9 = v164;
    uint64_t v10 = v92;
    if (v164 >= v153) {
      goto LABEL_130;
    }
  }
  if (__OFSUB__(v13, v9)) {
    goto LABEL_169;
  }
  if (v13 - v9 >= v150)
  {
LABEL_70:
    uint64_t v9 = v156;
    goto LABEL_71;
  }
  if (__OFADD__(v156, v150)) {
    goto LABEL_170;
  }
  if (v156 + v150 >= v3) {
    uint64_t v54 = v3;
  }
  else {
    uint64_t v54 = v156 + v150;
  }
  if (v54 >= v156)
  {
    if (v13 == v54)
    {
      uint64_t v9 = v156;
      goto LABEL_71;
    }
    v152 = v11;
    uint64_t v55 = v148 + 8 * v13;
    uint64_t v154 = v54;
LABEL_50:
    uint64_t v163 = v13;
    v56 = *(void **)(v10 + 8 * v13);
    uint64_t v57 = v156;
    uint64_t v158 = v55;
    uint64_t v58 = v55;
    while (1)
    {
      v59 = *(void **)v58;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      unsigned int v60 = [v56 v12[356]];
      if (v60 == [v59 v12[356]])
      {
        objc_msgSend(v56, sel_curationScore);
        double v63 = v62;
        objc_msgSend(v59, sel_curationScore);
        double v65 = vabdd_f64(v63, v64);
        objc_msgSend(v4, sel_comparableCurationScoreThreshold);
        if (v66 <= v65)
        {
          objc_msgSend(v56, sel_curationScore);
          double v81 = v80;
          objc_msgSend(v59, sel_curationScore);
          double v83 = v82;
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if (v83 >= v81) {
            goto LABEL_67;
          }
        }
        else
        {
          objc_msgSend(v56, sel_overallAestheticScore);
          float v68 = v67;
          objc_msgSend(v59, sel_overallAestheticScore);
          if (v68 == v69)
          {
            id v70 = objc_msgSend(v56, sel_identifier);
            uint64_t v71 = sub_259955F80();
            uint64_t v73 = v72;

            id v74 = objc_msgSend(v59, sel_identifier);
            uint64_t v75 = sub_259955F80();
            uint64_t v77 = v76;

            if (v71 == v75 && v73 == v77)
            {
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease_n();
              id v4 = v161;
              uint64_t v10 = v159;
              double v12 = (SEL *)&property descriptor for PNAssetGroupOptions.groupByDifferentOrientation;
LABEL_67:
              uint64_t v13 = v163 + 1;
              uint64_t v55 = v158 + 8;
              if (v163 + 1 == v154)
              {
                uint64_t v13 = v154;
                double v11 = v152;
                goto LABEL_70;
              }
              goto LABEL_50;
            }
            char v79 = sub_2599561A0();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v4 = v161;
            uint64_t v10 = v159;
            double v12 = (SEL *)&property descriptor for PNAssetGroupOptions.groupByDifferentOrientation;
            if ((v79 & 1) == 0) {
              goto LABEL_67;
            }
          }
          else
          {
            objc_msgSend(v56, sel_overallAestheticScore);
            float v85 = v84;
            objc_msgSend(v59, sel_overallAestheticScore);
            float v87 = v86;
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            if (v87 >= v85) {
              goto LABEL_67;
            }
          }
        }
      }
      else
      {
        unsigned __int8 v61 = [v56 v12[356]];
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if ((v61 & 1) == 0) {
          goto LABEL_67;
        }
      }
      if (!v10) {
        goto LABEL_174;
      }
      v88 = *(void **)v58;
      v56 = *(void **)(v58 + 8);
      *(void *)uint64_t v58 = v56;
      *(void *)(v58 + 8) = v88;
      v58 -= 8;
      if (v163 == ++v57) {
        goto LABEL_67;
      }
    }
  }
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:

  __break(1u);
LABEL_175:

  __break(1u);
LABEL_176:

  __break(1u);
LABEL_177:

  __break(1u);
}

void sub_25993CE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v5 = a5;
  if (a3 == a2) {
    goto LABEL_2;
  }
  uint64_t v6 = a3;
  uint64_t v7 = *a4;
  uint64_t v8 = *a4 + 8 * a3 - 8;
  uint64_t v44 = *a4;
  while (2)
  {
    uint64_t v9 = *(void **)(v7 + 8 * v6);
    uint64_t v10 = a1;
    uint64_t v43 = v8;
    uint64_t v46 = v6;
    while (1)
    {
      double v11 = *(void **)v8;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      unsigned int v12 = objc_msgSend(v9, sel_favorite);
      if (v12 == objc_msgSend(v11, sel_favorite)) {
        break;
      }
      unsigned __int8 v13 = objc_msgSend(v9, sel_favorite);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v13 & 1) == 0) {
        goto LABEL_21;
      }
LABEL_19:
      if (!v7)
      {
        __break(1u);
        return;
      }
      double v40 = *(void **)v8;
      uint64_t v9 = *(void **)(v8 + 8);
      *(void *)uint64_t v8 = v9;
      *(void *)(v8 + 8) = v40;
      v8 -= 8;
      if (v6 == ++v10) {
        goto LABEL_21;
      }
    }
    objc_msgSend(v9, sel_curationScore);
    double v15 = v14;
    objc_msgSend(v11, sel_curationScore);
    double v17 = vabdd_f64(v15, v16);
    objc_msgSend(v5, sel_comparableCurationScoreThreshold);
    if (v18 <= v17)
    {
      objc_msgSend(v9, sel_curationScore);
      double v33 = v32;
      objc_msgSend(v11, sel_curationScore);
      double v35 = v34;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v35 >= v33) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    objc_msgSend(v9, sel_overallAestheticScore);
    float v20 = v19;
    objc_msgSend(v11, sel_overallAestheticScore);
    if (v20 != v21)
    {
      objc_msgSend(v9, sel_overallAestheticScore);
      float v37 = v36;
      objc_msgSend(v11, sel_overallAestheticScore);
      float v39 = v38;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v39 >= v37) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    id v22 = objc_msgSend(v9, sel_identifier);
    uint64_t v23 = sub_259955F80();
    uint64_t v25 = v24;

    id v26 = objc_msgSend(v11, sel_identifier);
    uint64_t v27 = sub_259955F80();
    uint64_t v29 = v28;

    if (v23 != v27 || v25 != v29)
    {
      char v31 = sub_2599561A0();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = v44;
      uint64_t v5 = a5;
      uint64_t v6 = v46;
      if ((v31 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v7 = v44;
    uint64_t v5 = a5;
    uint64_t v6 = v46;
LABEL_21:
    ++v6;
    uint64_t v8 = v43 + 8;
    if (v6 != a2) {
      continue;
    }
    break;
  }
LABEL_2:
}

uint64_t sub_25993D138(char *__src, char *a2, unint64_t a3, char *__dst, void *a5)
{
  uint64_t v6 = __dst;
  unint64_t v7 = a3;
  uint64_t v9 = __src;
  int64_t v10 = a2 - __src;
  int64_t v11 = (a2 - __src) / 8;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = (uint64_t)(a3 - (void)a2) / 8;
  if (v11 >= v13)
  {
    sub_25993F710(a2, (uint64_t)(a3 - (void)a2) / 8, __dst);
    double v14 = &v6[8 * v13];
    BOOL v17 = v9 >= a2 || v12 < 8;
    double v16 = a2;
    if (v17) {
      goto LABEL_13;
    }
    double v40 = v9;
    __srca = v6;
    uint64_t v28 = (char *)(v7 - 8);
    uint64_t v29 = a5;
    float v20 = &v6[8 * v13];
    while (1)
    {
      unint64_t v30 = (unint64_t)v20;
      char v31 = v20 - 8;
      id v44 = (id)*((void *)v20 - 1);
      double v32 = v16;
      double v34 = (void *)*((void *)v16 - 1);
      double v33 = v16 - 8;
      uint64_t v43 = v34;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      unsigned __int8 v35 = sub_25993BD7C(&v44, &v43, v29);
      if (v5)
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        sub_25993F710(__srca, (uint64_t)(v30 - (void)__srca) / 8, v32);
        goto LABEL_15;
      }
      unsigned __int8 v36 = v35;
      float v37 = v28 + 8;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v36)
      {
        BOOL v38 = v37 != v32 || v28 >= v32;
        double v32 = v33;
        if (v38) {
          goto LABEL_38;
        }
      }
      else
      {
        BOOL v39 = v37 != (char *)v30 || (unint64_t)v28 >= v30;
        double v33 = v31;
        unint64_t v30 = (unint64_t)v31;
        if (v39) {
LABEL_38:
        }
          *(void *)uint64_t v28 = *(void *)v33;
      }
      double v16 = v32;
      uint64_t v6 = __srca;
      uint64_t v29 = a5;
      if (v32 <= v40)
      {
        float v20 = (char *)v30;
        goto LABEL_14;
      }
      v28 -= 8;
      float v20 = (char *)v30;
      if (v30 <= (unint64_t)__srca) {
        goto LABEL_14;
      }
    }
  }
  sub_25993F710(__src, (a2 - __src) / 8, __dst);
  double v14 = &v6[8 * v11];
  if ((unint64_t)a2 < v7 && v10 >= 8)
  {
    float v19 = (id *)a2;
    float v20 = &v6[8 * v11];
    while (1)
    {
      unint64_t v21 = v7;
      id v22 = v9;
      id v44 = *v19;
      uint64_t v43 = *(void **)v6;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      unsigned __int8 v23 = sub_25993BD7C(&v44, &v43, a5);
      if (v5)
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        sub_25993F710(v6, (v20 - v6) / 8, v9);
        uint64_t v29 = a5;
        goto LABEL_15;
      }
      unsigned __int8 v24 = v23;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if ((v24 & 1) == 0) {
        break;
      }
      uint64_t v25 = v19;
      id v26 = v22;
      BOOL v27 = v22 == (char *)v19++;
      if (!v27) {
        goto LABEL_22;
      }
LABEL_23:
      uint64_t v9 = v26 + 8;
      if (v6 < v20)
      {
        unint64_t v7 = v21;
        if ((unint64_t)v19 < v21) {
          continue;
        }
      }
      double v16 = v9;
      uint64_t v29 = a5;
      goto LABEL_14;
    }
    uint64_t v25 = v6;
    id v26 = v22;
    BOOL v27 = v22 == v6;
    v6 += 8;
    if (v27) {
      goto LABEL_23;
    }
LABEL_22:
    *(void *)id v26 = *v25;
    goto LABEL_23;
  }
  double v16 = v9;
LABEL_13:
  uint64_t v29 = a5;
  float v20 = v14;
LABEL_14:
  sub_25993F710(v6, (v20 - v6) / 8, v16);
LABEL_15:

  return 1;
}

char *sub_25993D42C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2428);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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

char *sub_25993D524(uint64_t a1)
{
  return sub_25993D42C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_25993D538(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_25993D5E8(v6, a2, a3);
  return sub_25993D5A0;
}

void sub_25993D5A0(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_25993D5E8(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_25993C2A4(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x25A2E19A0](a2, a3);
  }
  else {
    uint64_t v7 = swift_unknownObjectRetain();
  }
  *a1 = v7;
  return sub_25993D668;
}

uint64_t sub_25993D668()
{
  return swift_unknownObjectRelease();
}

unint64_t type metadata accessor for PNKeyPickerProcessor()
{
  unint64_t result = qword_26A3D2400;
  if (!qword_26A3D2400)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3D2400);
  }
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

uint64_t sub_25993D6F4(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_259956150();
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
      uint64_t v8 = sub_259956150();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_25993D888();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2418);
            int64_t v10 = sub_25993D538(v13, i, a3);
            uint64_t v12 = *v11;
            swift_unknownObjectRetain();
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
        sub_25993F8BC((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

unint64_t sub_25993D888()
{
  unint64_t result = qword_26A3D2420;
  if (!qword_26A3D2420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3D2418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2420);
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

void sub_25993D924()
{
}

BOOL sub_25993D938(uint64_t a1)
{
  return a1 != 0;
}

uint64_t sub_25993D94C()
{
  return sub_259956230();
}

uint64_t sub_25993D990()
{
  return sub_25993DC94();
}

uint64_t sub_25993D99C(char a1)
{
  return sub_259956230();
}

uint64_t sub_25993DA00()
{
  return sub_259956230();
}

uint64_t sub_25993DA48()
{
  return sub_25993DC20();
}

uint64_t sub_25993DA58()
{
  sub_259955FA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25993DAAC(uint64_t a1, char a2)
{
  sub_25993DF28(a2);
  sub_259955FA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25993DB00()
{
  return sub_259956220();
}

uint64_t sub_25993DB28()
{
  sub_259955FA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25993DBC4()
{
  sub_259955FA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25993DC20()
{
  return sub_259956230();
}

uint64_t sub_25993DC94()
{
  return sub_259956230();
}

uint64_t sub_25993DD44()
{
  return sub_259956230();
}

uint64_t sub_25993DD84(uint64_t a1, char a2)
{
  return sub_259956230();
}

uint64_t sub_25993DDE4()
{
  return sub_259956230();
}

uint64_t sub_25993DE28()
{
  unint64_t v0 = sub_259956170();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25993DE74(char a1)
{
  if (!a1) {
    return 0xD00000000000001BLL;
  }
  if (a1 == 1) {
    return 0xD000000000000018;
  }
  return 0x6E6974617265706FLL;
}

uint64_t sub_25993DEDC()
{
  unint64_t v0 = sub_259956170();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_25993DF28(char a1)
{
  return *(void *)&aNone_1[8 * a1];
}

BOOL sub_25993DF48@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_25993D938(*a1);
  *a2 = result;
  return result;
}

void sub_25993DF7C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25993DF84(unsigned __int8 *a1, char *a2)
{
  return sub_2599482BC(*a1, *a2);
}

uint64_t sub_25993DF90()
{
  return sub_25993D990();
}

uint64_t sub_25993DF98()
{
  return sub_25993DB28();
}

uint64_t sub_25993DFA0()
{
  return sub_25993DC94();
}

uint64_t sub_25993DFA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25993DE28();
  *a1 = result;
  return result;
}

uint64_t sub_25993DFD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25993DE74(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25993E004(char *a1, char *a2)
{
  return sub_259948234(*a1, *a2);
}

uint64_t sub_25993E010()
{
  return sub_25993D99C(*v0);
}

uint64_t sub_25993E018(uint64_t a1)
{
  return sub_25993DAAC(a1, *v1);
}

uint64_t sub_25993E020(uint64_t a1)
{
  return sub_25993DD84(a1, *v1);
}

uint64_t sub_25993E028@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25993DEDC();
  *a1 = result;
  return result;
}

uint64_t sub_25993E058@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25993DF28(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25993E084(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(unsigned char *)(v4 + 24) = a2;
  *(unsigned char *)(v4 + 25) = a3;
  *(void *)(v4 + 32) = a4;
  return v4;
}

uint64_t sub_25993E09C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for SceneConfiguration()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PartOfDay(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_25993E190(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25993E25CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for BoundingBoxSizeType()
{
}

uint64_t sub_25993E294(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_25993E31C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25993E3E8);
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

uint64_t sub_25993E410(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25993E418(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for ThresholdType()
{
}

uint64_t _s5ErrorOwet(unsigned int *a1, int a2)
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

unsigned char *sub_25993E480(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25993E51CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25993E544()
{
  return 0;
}

void type metadata accessor for ConfigurationType()
{
}

unint64_t sub_25993E55C()
{
  unint64_t result = qword_26A3D2430;
  if (!qword_26A3D2430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2430);
  }
  return result;
}

unint64_t sub_25993E5AC()
{
  unint64_t result = qword_26A3D2438;
  if (!qword_26A3D2438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2438);
  }
  return result;
}

unint64_t sub_25993E5FC()
{
  unint64_t result = qword_26A3D2440;
  if (!qword_26A3D2440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2440);
  }
  return result;
}

Swift::Bool __swiftcall PartOfDay.rangeContains(hour:)(Swift::Int hour)
{
  uint64_t v3 = (uint64_t)*(&off_265453FB0 + *v1);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    unsigned int v6 = (Swift::Int *)(v3 + 40);
    do
    {
      uint64_t v7 = v5;
      BOOL v8 = *(v6 - 1) > hour || *v6 < hour;
      Swift::Bool v9 = !v8;
      if (!v8) {
        break;
      }
      --v5;
      v6 += 2;
    }
    while (v7);
  }
  else
  {
    Swift::Bool v9 = 0;
  }
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t static PartOfDay.matches(hour:)(uint64_t result)
{
  uint64_t v1 = qword_27076B438;
  if (qword_27076B438)
  {
    uint64_t v2 = result;
    unint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x263F8EE78];
    while (v3 < qword_27076B438)
    {
      uint64_t v5 = (uint64_t)*(&off_265453FD8 + *((char *)&unk_27076B428 + v3 + 32));
      uint64_t v6 = *(void *)(v5 + 16);
      if (v6)
      {
        char v7 = *((unsigned char *)&unk_27076B428 + v3 + 32);
        BOOL v8 = (uint64_t *)(v5 + 40);
        while (*(v8 - 1) > v2 || *v8 < v2)
        {
          v8 += 2;
          if (!--v6) {
            goto LABEL_12;
          }
        }
        swift_bridgeObjectRelease();
        unint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0) {
          unint64_t result = (uint64_t)sub_25994233C(0, *(void *)(v4 + 16) + 1, 1);
        }
        unint64_t v11 = *(void *)(v4 + 16);
        unint64_t v10 = *(void *)(v4 + 24);
        if (v11 >= v10 >> 1) {
          unint64_t result = (uint64_t)sub_25994233C((char *)(v10 > 1), v11 + 1, 1);
        }
        *(void *)(v4 + 16) = v11 + 1;
        *(unsigned char *)(v4 + v11 + 32) = v7;
      }
      else
      {
LABEL_12:
        unint64_t result = swift_bridgeObjectRelease();
      }
      if (++v3 == v1) {
        goto LABEL_21;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_21:
    swift_bridgeObjectRelease();
    return sub_25993E83C(v4);
  }
  return result;
}

void *static PartOfDay.allCases.getter()
{
  return &unk_27076B428;
}

uint64_t sub_25993E83C(uint64_t a1)
{
  sub_259942BC4();
  uint64_t v2 = sub_259956050();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = a1 + i;
      sub_25993FB5C(&v8, *(unsigned __int8 *)(v5 + 32));
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

uint64_t sub_25993E8D8(uint64_t a1)
{
  uint64_t v2 = sub_259956050();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25993FD14(&v9, v5, v6);
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

uint64_t sub_25993E98C(uint64_t a1)
{
  uint64_t v2 = sub_259956050();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = *(void *)(a1 + 8 * i + 32);
      sub_25993FEC4(&v8, v5);
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

Swift::String __swiftcall PartOfDay.localizedText()()
{
  type metadata accessor for LocalizedString();
  uint64_t v0 = sub_25993BA4C();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0;
  uint64_t v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t static PartOfDay.from(localizedText:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_259955F90();
  uint64_t v4 = v3;
  uint64_t v5 = qword_27076B438;
  if (qword_27076B438)
  {
    uint64_t v6 = v2;
    double v16 = a1;
    type metadata accessor for LocalizedString();
    uint64_t v7 = (char *)(swift_bridgeObjectRetain() + 32);
    while (1)
    {
      char v9 = *v7++;
      char v8 = v9;
      sub_25993BA4C();
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_259955F90();
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      if (v10 == v6 && v12 == v4)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
      char v14 = sub_2599561A0();
      swift_bridgeObjectRelease();
      if (v14) {
        break;
      }
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        char v8 = 5;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease_n();
LABEL_13:
    uint64_t result = swift_bridgeObjectRelease();
LABEL_14:
    a1 = v16;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    char v8 = 5;
  }
  *a1 = v8;
  return result;
}

PhotosIntelligenceCore::PartOfDay_optional __swiftcall PartOfDay.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259956170();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t PartOfDay.rawValue.getter()
{
  return *(void *)&aMorning_2[8 * *v0];
}

uint64_t sub_25993EDB8(char *a1, char *a2)
{
  return sub_2599481AC(*a1, *a2);
}

uint64_t sub_25993EDC4()
{
  return sub_25993DA00();
}

uint64_t sub_25993EDCC()
{
  return sub_25993DA58();
}

uint64_t sub_25993EDD4()
{
  return sub_25993DDE4();
}

PhotosIntelligenceCore::PartOfDay_optional sub_25993EDDC(Swift::String *a1)
{
  return PartOfDay.init(rawValue:)(*a1);
}

uint64_t sub_25993EDE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PartOfDay.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25993EE10()
{
  return sub_259955FC0();
}

uint64_t sub_25993EE70()
{
  return sub_259955FB0();
}

uint64_t sub_25993EEC0()
{
  return 1;
}

void sub_25993EEC8(void *a1@<X8>)
{
  *a1 = &unk_27076B428;
}

uint64_t sub_25993EEE8()
{
  uint64_t v0 = sub_259955E20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_259955E60();
  __swift_allocate_value_buffer(v4, qword_26A3D2448);
  __swift_project_value_buffer(v4, (uint64_t)qword_26A3D2448);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F07740], v0);
  sub_259955E30();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static PNPartOfDayCalculator.partOfDayLocalizedNames(for:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2460);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v2 = v1 - v0;
  unint64_t v3 = sub_259955E80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  int64_t v8 = v7 - v6;
  uint64_t v9 = sub_259955E60();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  unint64_t v14 = v13 - v12;
  sub_259955DC0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v35 = v16;
  uint64_t v36 = v15;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v19 = v18 - v17;
  if (qword_26A3D2320 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v20 = __swift_project_value_buffer(v9, (uint64_t)qword_26A3D2448);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v20, v9);
    sub_259955E70();
    if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
    {
      __break(1u);
      JUMPOUT(0x25993F4ECLL);
    }
    (*(void (**)(int64_t, uint64_t, unint64_t))(v5 + 32))(v8, v2, v3);
    sub_259955E40();
    (*(void (**)(int64_t, unint64_t))(v5 + 8))(v8, v3);
    (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v14, v9);
    uint64_t v21 = sub_259955DB0();
    char v23 = v22;
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v19, v36);
    if (v23)
    {
      sub_2599423BC();
      swift_allocError();
      return swift_willThrow();
    }
    uint64_t v5 = static PartOfDay.matches(hour:)(v21);
    uint64_t v2 = *(void *)(v5 + 16);
    if (!v2) {
      break;
    }
    unint64_t v3 = 0xD000000000000016;
    uint64_t v37 = MEMORY[0x263F8EE78];
    sub_259942408(0, v2, 0);
    uint64_t v9 = v37;
    int64_t v8 = sub_2599426C8(v5);
    uint64_t v11 = v24;
    int v26 = v25 & 1;
    uint64_t v35 = v5 + 56;
    type metadata accessor for LocalizedString();
    uint64_t v34 = v5;
    while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(unsigned char *)(v5 + 32))
    {
      if (((*(void *)(v35 + (((unint64_t)v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      if (*(_DWORD *)(v5 + 36) != v11) {
        goto LABEL_19;
      }
      LODWORD(v36) = v26;
      uint64_t v19 = sub_25993BA4C();
      unint64_t v3 = v27;
      swift_bridgeObjectRelease();
      unint64_t v14 = *(void *)(v37 + 16);
      unint64_t v28 = *(void *)(v37 + 24);
      if (v14 >= v28 >> 1) {
        sub_259942408((char *)(v28 > 1), v14 + 1, 1);
      }
      *(void *)(v37 + 16) = v14 + 1;
      unint64_t v29 = v37 + 16 * v14;
      *(void *)(v29 + 32) = v19;
      *(void *)(v29 + 40) = v3;
      uint64_t v5 = v34;
      int64_t v30 = sub_2599425E4(v8, v11, v26 & 1, v34);
      int64_t v8 = v30;
      uint64_t v11 = v31;
      int v26 = v32 & 1;
      if (!--v2)
      {
        sub_259942748(v30, v31, v32 & 1);
        swift_bridgeObjectRelease();
        return sub_25993E8D8(v9);
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = MEMORY[0x263F8EE78];
  return sub_25993E8D8(v9);
}

PNPartOfDayCalculator __swiftcall PNPartOfDayCalculator.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (PNPartOfDayCalculator)objc_msgSend(v0, sel_init);
}

id PNPartOfDayCalculator.init()()
{
  v1.super_class = (Class)PNPartOfDayCalculator;
  return objc_msgSendSuper2(&v1, sel_init);
}

char *sub_25993F710(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1();
    __src = (char *)sub_259956160();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_25993F798(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_259956160();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_25993F828(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_259956160();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_25993F8BC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v6 = a1 + 8 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    OUTLINED_FUNCTION_1();
    uint64_t v8 = sub_259956160();
    __break(1u);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2408);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return MEMORY[0x270FA01C8](v8, v9, v10, v7);
}

void *sub_25993F9A4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_259956160();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25993FA7C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 16 * v4 > a1) ? (v6 = a1 + 16 * v4 > a3) : (v6 = 0), v6))
  {
    uint64_t v8 = sub_259956160();
    __break(1u);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8D310];
    uint64_t v8 = a3;
  }
  return MEMORY[0x270FA01C8](v8, v5, v4, v7);
}

uint64_t sub_25993FB5C(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_259956210();
  swift_bridgeObjectRetain();
  sub_25993DA58();
  uint64_t v5 = sub_259956230();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = ~v6;
    uint64_t v9 = *(void *)&aMorning_2[8 * (char)a2];
    uint64_t v10 = qword_2599599A0[(char)a2];
    while (1)
    {
      uint64_t v11 = *(char *)(*(void *)(v4 + 48) + v7);
      if (*(void *)&aMorning_2[8 * v11] == v9 && qword_2599599A0[v11] == v10) {
        break;
      }
      char v13 = sub_2599561A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_11;
      }
      unint64_t v7 = (v7 + 1) & v8;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    LOBYTE(a2) = *(unsigned char *)(*(void *)(*v16 + 48) + v7);
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v16;
    *uint64_t v16 = 0x8000000000000000;
    sub_259940C40(a2, v7, isUniquelyReferenced_nonNull_native);
    *uint64_t v16 = v18;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *a1 = a2;
  return result;
}

uint64_t sub_25993FD14(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_259956210();
  swift_bridgeObjectRetain();
  sub_259955FA0();
  uint64_t v8 = sub_259956230();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2599561A0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_2599561A0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *BOOL v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_259940DFC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *BOOL v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25993FEC4(uint64_t *a1, uint64_t a2)
{
  BOOL v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_259956200();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *BOOL v3 = 0x8000000000000000;
    sub_259940F98(a2, v9, isUniquelyReferenced_nonNull_native);
    *BOOL v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_25993FFC0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = v2;
  uint64_t v6 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2599560D0();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    while (1)
    {
      sub_259942AB0(*(void *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      char v11 = MEMORY[0x25A2E1960](v16, a2);
      sub_259942B0C((uint64_t)v16);
      if (v11) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_259942B0C(a2);
    sub_259942AB0(*(void *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_259942AB0(a2, (uint64_t)v16);
    uint64_t v15 = *v3;
    *BOOL v3 = 0x8000000000000000;
    sub_2599410BC((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    *BOOL v3 = v15;
    swift_bridgeObjectRelease();
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_25994013C()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24B8);
  uint64_t v3 = sub_259956100();
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
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      char v18 = *(unsigned char *)(*(void *)(v2 + 48) + i);
      sub_259956210();
      sub_259955FA0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_259956230();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
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
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
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
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(unsigned char *)(*(void *)(v4 + 48) + v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              objc_super v1 = v0;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                sub_259941228(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v27;
              }
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
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
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
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_259940418()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24A0);
  uint64_t v3 = sub_259956100();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v30 = (void *)(v2 + 56);
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
      int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_259956210();
      sub_259955FA0();
      uint64_t result = sub_259956230();
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
      unint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *unint64_t v28 = v18;
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
              objc_super v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_259941228(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *int64_t v30 = -1 << v29;
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2599406F4()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B302500);
  uint64_t result = sub_259956100();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unint64_t v7 = (uint64_t *)(v2 + 56);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v27 = -1 << v8;
    unint64_t v28 = v1;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v6;
    uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = result + 56;
    if ((v9 & v6) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v13 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_259956200();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
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
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v11) {
        goto LABEL_32;
      }
      unint64_t v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        int64_t v5 = v15 + 1;
        if (v15 + 1 >= v11) {
          goto LABEL_32;
        }
        unint64_t v16 = v7[v5];
        if (!v16)
        {
          int64_t v5 = v15 + 2;
          if (v15 + 2 >= v11) {
            goto LABEL_32;
          }
          unint64_t v16 = v7[v5];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63) {
                sub_259941228(0, v11, (void *)(v2 + 56));
              }
              else {
                *unint64_t v7 = v27;
              }
              objc_super v1 = v28;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v5 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v11) {
                  goto LABEL_32;
                }
                unint64_t v16 = v7[v5];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_259940978()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B302520);
  uint64_t v3 = sub_259956100();
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
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(v2 + 48) + 40 * i;
      long long v29 = *(_OWORD *)v18;
      long long v30 = *(_OWORD *)(v18 + 16);
      uint64_t v31 = *(void *)(v18 + 32);
      uint64_t result = sub_2599560D0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
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
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
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
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      uint64_t v27 = *(void *)(v4 + 48) + 40 * v22;
      *(_OWORD *)uint64_t v27 = v29;
      *(_OWORD *)(v27 + 16) = v30;
      *(void *)(v27 + 32) = v31;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              objc_super v1 = v0;
              uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
              if (v28 > 63) {
                sub_259941228(0, (unint64_t)(v28 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v28;
              }
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
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
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
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_259940C40(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_16;
  }
  if (a3)
  {
    sub_25994013C();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_259941244();
      goto LABEL_16;
    }
    sub_2599418F8();
  }
  uint64_t v8 = *v3;
  sub_259956210();
  sub_25993DA58();
  uint64_t result = sub_259956230();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = ~v9;
    uint64_t v11 = *(void *)&aMorning_2[8 * v5];
    uint64_t v12 = qword_2599599A0[v5];
    do
    {
      uint64_t v13 = *(char *)(*(void *)(v8 + 48) + a2);
      if (*(void *)&aMorning_2[8 * v13] == v11 && qword_2599599A0[v13] == v12) {
        goto LABEL_19;
      }
      char v15 = sub_2599561A0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_20;
      }
      a2 = (a2 + 1) & v10;
    }
    while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_16:
  uint64_t v16 = *v20;
  *(void *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v16 + 48) + a2) = v21;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (!v18)
  {
    *(void *)(v16 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_20:
  uint64_t result = sub_2599561B0();
  __break(1u);
  return result;
}

uint64_t sub_259940DFC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  char v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_259940418();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2599413DC();
      goto LABEL_22;
    }
    sub_259941BA0();
  }
  uint64_t v11 = *v4;
  sub_259956210();
  sub_259955FA0();
  uint64_t result = sub_259956230();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    char v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2599561A0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2599561B0();
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
        BOOL v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_2599561A0();
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
  char v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
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

uint64_t sub_259940F98(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2599406F4();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_259941590();
      goto LABEL_14;
    }
    sub_259941E4C();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_259956200();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_2599561B0();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_2599410BC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_259940978();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_259941728();
      goto LABEL_12;
    }
    sub_2599420AC();
  }
  uint64_t v9 = *v3;
  uint64_t result = sub_2599560D0();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_259942AB0(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = MEMORY[0x25A2E1960](v19, v6);
      uint64_t result = sub_259942B0C((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_2599561B0();
  __break(1u);
  return result;
}

uint64_t sub_259941228(uint64_t result, uint64_t a2, void *a3)
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

void *sub_259941244()
{
  objc_super v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2599560F0();
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(unsigned char *)(*(void *)(v4 + 48) + i) = *(unsigned char *)(*(void *)(v2 + 48) + i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2599413DC()
{
  objc_super v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2599560F0();
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_259941590()
{
  objc_super v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B302500);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2599560F0();
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_259941728()
{
  objc_super v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B302520);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2599560F0();
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
    uint64_t v20 = 5 * i;
    uint64_t result = (void *)sub_259942AB0(*(void *)(v2 + 48) + 40 * i, (uint64_t)v24);
    uint64_t v21 = *(void *)(v4 + 48) + 8 * v20;
    long long v22 = v24[0];
    long long v23 = v24[1];
    *(void *)(v21 + 32) = v25;
    *(_OWORD *)uint64_t v21 = v22;
    *(_OWORD *)(v21 + 16) = v23;
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

uint64_t sub_2599418F8()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24B8);
  uint64_t v3 = sub_259956100();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + i);
    sub_259956210();
    sub_259955FA0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_259956230();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
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
        uint64_t v26 = *(void *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(unsigned char *)(*(void *)(v4 + 48) + v22) = v18;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
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
LABEL_32:
    uint64_t result = swift_release_n();
    objc_super v1 = v0;
    goto LABEL_34;
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
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259941BA0()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24A0);
  uint64_t v3 = sub_259956100();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
    sub_259956210();
    swift_bridgeObjectRetain();
    sub_259955FA0();
    uint64_t result = sub_259956230();
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
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
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
    objc_super v1 = v0;
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

uint64_t sub_259941E4C()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B302500);
  uint64_t result = sub_259956100();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  BOOL v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_259956200();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    objc_super v1 = v26;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2599420AC()
{
  objc_super v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26B302520);
  uint64_t v3 = sub_259956100();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    sub_259942AB0(*(void *)(v2 + 48) + 40 * i, (uint64_t)v29);
    uint64_t result = sub_2599560D0();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v10 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v10 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v10 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v4 + 48) + 40 * v21;
    long long v27 = v29[0];
    long long v28 = v29[1];
    *(void *)(v26 + 32) = v30;
    *(_OWORD *)uint64_t v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
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
LABEL_32:
    uint64_t result = swift_release_n();
    objc_super v1 = v0;
    goto LABEL_34;
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
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_25994233C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_259942428(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t sub_2599423BC()
{
  unint64_t result = qword_26A3D2468;
  if (!qword_26A3D2468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2468);
  }
  return result;
}

char *sub_259942408(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_259942500(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_259942428(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25993F798(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25993F9A4(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_259942500(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25993F828(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25993FA7C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

int64_t sub_2599425E4(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (unint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
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

uint64_t sub_2599426C8(uint64_t a1)
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

uint64_t sub_259942748(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_259942758()
{
  unint64_t result = qword_26A3D2470;
  if (!qword_26A3D2470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2470);
  }
  return result;
}

unint64_t sub_2599427A8()
{
  unint64_t result = qword_26A3D2478;
  if (!qword_26A3D2478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3D2480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2478);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PartOfDay(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2599428C8);
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

ValueMetadata *type metadata accessor for PartOfDay()
{
  return &type metadata for PartOfDay;
}

unint64_t type metadata accessor for PNPartOfDayCalculator()
{
  unint64_t result = qword_26A3D2488;
  if (!qword_26A3D2488)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3D2488);
  }
  return result;
}

unsigned char *_s5ErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2599429DCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

unint64_t sub_259942A18()
{
  unint64_t result = qword_26A3D2490;
  if (!qword_26A3D2490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2490);
  }
  return result;
}

unint64_t sub_259942A64()
{
  unint64_t result = qword_26A3D2498;
  if (!qword_26A3D2498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2498);
  }
  return result;
}

uint64_t sub_259942AB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_259942B0C(uint64_t a1)
{
  return a1;
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

unint64_t sub_259942BC4()
{
  unint64_t result = qword_26A3D24B0;
  if (!qword_26A3D24B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D24B0);
  }
  return result;
}

uint64_t PNAssetGroupOptions.groupByDifferentOrientation.getter()
{
  OUTLINED_FUNCTION_0_1();
  return *v0;
}

uint64_t PNAssetGroupOptions.groupByDifferentOrientation.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_0();
  unsigned char *v1 = a1;
  return result;
}

uint64_t PNAssetGroupOptions.groupBySharedLibraryParticipationState.getter()
{
  OUTLINED_FUNCTION_0_1();
  return *v0;
}

uint64_t PNAssetGroupOptions.groupBySharedLibraryParticipationState.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_0();
  unsigned char *v1 = a1;
  return result;
}

double PNAssetGroupOptions.comparableCurationScoreThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  return *(double *)v0;
}

uint64_t PNAssetGroupOptions.comparableCurationScoreThreshold.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___PNAssetGroupOptions_comparableCurationScoreThreshold);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t PNAssetGroupOptions.distanceThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  return *v0;
}

uint64_t PNAssetGroupOptions.distanceThreshold.setter(int a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_0();
  _DWORD *v1 = a1;
  return result;
}

uint64_t PNAssetGroupOptions.distanceFromFirstThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  return *v0;
}

uint64_t PNAssetGroupOptions.distanceFromFirstThreshold.setter(int a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_0();
  _DWORD *v1 = a1;
  return result;
}

uint64_t PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.getter()
{
  OUTLINED_FUNCTION_0_1();
  return *v0;
}

uint64_t PNAssetGroupOptions.distanceIfAdjustedDiffersThreshold.setter(int a1)
{
  uint64_t result = OUTLINED_FUNCTION_1_0();
  _DWORD *v1 = a1;
  return result;
}

void __swiftcall PNAssetGroupOptions.init()(PNAssetGroupOptions *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id PNAssetGroupOptions.init()()
{
  *(unsigned char *)(v0 + OBJC_IVAR___PNAssetGroupOptions_groupByDifferentOrientation) = 1;
  *(unsigned char *)(v0 + OBJC_IVAR___PNAssetGroupOptions_groupBySharedLibraryParticipationState) = 1;
  *(void *)(v0 + OBJC_IVAR___PNAssetGroupOptions_comparableCurationScoreThreshold) = 0x3FA999999999999ALL;
  *(_DWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_distanceThreshold) = 150;
  *(_DWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_distanceFromFirstThreshold) = -1;
  *(_DWORD *)(v0 + OBJC_IVAR___PNAssetGroupOptions_distanceIfAdjustedDiffersThreshold) = -1;
  v2.super_class = (Class)PNAssetGroupOptions;
  return objc_msgSendSuper2(&v2, sel_init);
}

char *keypath_get_selector_groupByDifferentOrientation()
{
  return sel_groupByDifferentOrientation;
}

id sub_25994319C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1), sel_groupByDifferentOrientation);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_2599431CC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGroupByDifferentOrientation_, *a1);
}

char *keypath_get_selector_groupBySharedLibraryParticipationState()
{
  return sel_groupBySharedLibraryParticipationState;
}

id sub_2599431EC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1), sel_groupBySharedLibraryParticipationState);
  unsigned char *v1 = (_BYTE)result;
  return result;
}

id sub_25994321C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGroupBySharedLibraryParticipationState_, *a1);
}

char *keypath_get_selector_comparableCurationScoreThreshold()
{
  return sel_comparableCurationScoreThreshold;
}

id sub_25994323C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1), sel_comparableCurationScoreThreshold);
  void *v1 = v3;
  return result;
}

id sub_25994326C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setComparableCurationScoreThreshold_, *a1);
}

char *keypath_get_selector_distanceThreshold()
{
  return sel_distanceThreshold;
}

id sub_25994328C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1), sel_distanceThreshold);
  _DWORD *v1 = result;
  return result;
}

id sub_2599432BC(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDistanceThreshold_, *a1);
}

char *keypath_get_selector_distanceFromFirstThreshold()
{
  return sel_distanceFromFirstThreshold;
}

id sub_2599432DC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1), sel_distanceFromFirstThreshold);
  _DWORD *v1 = result;
  return result;
}

id sub_25994330C(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDistanceFromFirstThreshold_, *a1);
}

char *keypath_get_selector_distanceIfAdjustedDiffersThreshold()
{
  return sel_distanceIfAdjustedDiffersThreshold;
}

id sub_25994332C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1), sel_distanceIfAdjustedDiffersThreshold);
  _DWORD *v1 = result;
  return result;
}

id sub_25994335C(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDistanceIfAdjustedDiffersThreshold_, *a1);
}

unint64_t type metadata accessor for PNAssetGroupOptions()
{
  unint64_t result = qword_26A3D24F8;
  if (!qword_26A3D24F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3D24F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_259943428()
{
  uint64_t v0 = sub_259955F50();
  __swift_allocate_value_buffer(v0, qword_26A3D3360);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3D3360);
  return sub_259955F40();
}

uint64_t static ProgressReporter<>.ignore.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for RootProgressReporter(0);
  swift_allocObject();
  uint64_t result = RootProgressReporter.init(_:)((uint64_t)nullsub_1, 0);
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for RootProgressReporter;
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of ProgressReporter.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ProgressReporter.report(progress:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ProgressReporter.complete()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ProgressReporter.canProceed(progress:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ProgressReporter.child(from:to:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ProgressReporter.child(from:to:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t dispatch thunk of ProgressReporter.split(at:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 88))();
}

uint64_t RootProgressReporter.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  return sub_259945628(a1, a2, (void (*)(uint64_t, uint64_t))RootProgressReporter.init(_:));
}

{
  return sub_259945628(a1, a2, (void (*)(uint64_t, uint64_t))RootProgressReporter.init(_:));
}

uint64_t sub_25994364C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_259955E10();
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259955F50();
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)v23 - v13;
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2))
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    int64_t v15 = sub_259955F30();
    os_log_type_t v16 = sub_259956080();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      v23[1] = v3;
      uint64_t v18 = v17;
      *(_WORD *)int64_t v17 = 0;
      _os_log_impl(&dword_259939000, v15, v16, "Progress reporter has already been started", v17, 2u);
      MEMORY[0x25A2E20E0](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v25);
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2))
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    unint64_t v19 = sub_259955F30();
    os_log_type_t v20 = sub_259956080();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl(&dword_259939000, v19, v20, "Progress reporter has already completed", v21, 2u);
      MEMORY[0x25A2E20E0](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 32))(1, a1, a2);
  (*(void (**)(uint64_t, uint64_t, double))(a2 + 88))(a1, a2, 0.0);
  sub_259955E00();
  (*(void (**)(char *, uint64_t, uint64_t))(a2 + 112))(v8, a1, a2);
  uint64_t v26 = v4;
  return (*(uint64_t (**)(uint64_t, double))(*(void *)(a2 + 8) + 16))(a1, 0.0);
}

uint64_t sub_2599439BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v8 = sub_259955F50();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)&v27 - v13;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2) & 1) == 0)
  {
    uint64_t v28 = v8;
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    int64_t v15 = sub_259955F30();
    os_log_type_t v16 = sub_259956080();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = v3;
      uint64_t v18 = v17;
      *(_WORD *)int64_t v17 = 0;
      _os_log_impl(&dword_259939000, v15, v16, "Progress reporter has not been started", v17, 2u);
      unint64_t v19 = v18;
      uint64_t v4 = v27;
      MEMORY[0x25A2E20E0](v19, -1, -1);
    }

    uint64_t v8 = v28;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v28);
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2))
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 72))(a1, a2);
    os_log_type_t v20 = sub_259955F30();
    os_log_type_t v21 = sub_259956080();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = v8;
      uint64_t v23 = v4;
      uint64_t v24 = v22;
      *(_WORD *)char v22 = 0;
      _os_log_impl(&dword_259939000, v20, v21, "Progress reporter has already completed", v22, 2u);
      uint64_t v25 = v24;
      uint64_t v4 = v23;
      uint64_t v8 = v28;
      MEMORY[0x25A2E20E0](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  uint64_t v29 = v5;
  uint64_t result = (*(uint64_t (**)(uint64_t, double))(*(void *)(a2 + 8) + 16))(a1, 1.0);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 56))(1, a1, a2);
  }
  return result;
}

uint64_t sub_259943CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10 = (*(uint64_t (**)(void))(a2 + 16))();
  uint64_t v11 = *(double (**)(uint64_t, uint64_t, double))(a2 + 128);
  double v12 = v11(a1, a2, a4);
  double v13 = v11(a1, a2, a5);
  uint64_t v14 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  uint64_t result = sub_25994623C(v10, v12, v13);
  a3[3] = v14;
  a3[4] = (uint64_t)&off_27076B1F8;
  *a3 = result;
  return result;
}

uint64_t sub_259943DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, double, double))(*(void *)(a5 + 8) + 40))(a4, (double)a1 / (double)a3, (double)a2 / (double)a3);
}

uint64_t sub_259943E04(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v19 = v9(a3, a4);
  uint64_t v10 = *(double (**)(uint64_t, uint64_t, double))(a4 + 128);
  double v11 = v10(a3, a4, 0.0);
  double v12 = v10(a3, a4, a5);
  uint64_t v13 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  uint64_t v14 = sub_25994623C(v19, v11, v12);
  a1[3] = v13;
  a1[4] = (uint64_t)&off_27076B1F8;
  *a1 = v14;
  uint64_t v15 = v9(a3, a4);
  double v16 = v10(a3, a4, a5);
  double v17 = v10(a3, a4, 1.0);
  swift_allocObject();
  uint64_t result = sub_25994623C(v15, v16, v17);
  a2[3] = v13;
  a2[4] = (uint64_t)&off_27076B1F8;
  *a2 = result;
  return result;
}

uint64_t sub_259943F98(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  double v12 = *(uint64_t (**)(uint64_t, uint64_t))(a5 + 16);
  uint64_t v26 = v12(a4, a5);
  uint64_t v13 = *(double (**)(uint64_t, uint64_t, double))(a5 + 128);
  double v14 = v13(a4, a5, 0.0);
  double v15 = v13(a4, a5, a6);
  uint64_t v16 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  uint64_t v17 = sub_25994623C(v26, v14, v15);
  a1[3] = v16;
  a1[4] = (uint64_t)&off_27076B1F8;
  *a1 = v17;
  uint64_t v18 = v12(a4, a5);
  double v19 = v13(a4, a5, a6);
  double v20 = v13(a4, a5, a7);
  swift_allocObject();
  uint64_t v21 = sub_25994623C(v18, v19, v20);
  a2[3] = v16;
  a2[4] = (uint64_t)&off_27076B1F8;
  *a2 = v21;
  uint64_t v22 = v12(a4, a5);
  double v23 = v13(a4, a5, a7);
  double v24 = v13(a4, a5, 1.0);
  swift_allocObject();
  uint64_t result = sub_25994623C(v22, v23, v24);
  a3[3] = v16;
  a3[4] = (uint64_t)&off_27076B1F8;
  *a3 = result;
  return result;
}

uint64_t sub_2599441B4(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9)
{
  double v33 = *(uint64_t (**)(uint64_t, uint64_t))(a6 + 16);
  uint64_t v15 = v33(a5, a6);
  uint64_t v16 = *(double (**)(uint64_t, uint64_t, double))(a6 + 128);
  double v17 = v16(a5, a6, 0.0);
  double v18 = v16(a5, a6, a7);
  uint64_t v19 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  uint64_t v20 = sub_25994623C(v15, v17, v18);
  a1[3] = v19;
  a1[4] = (uint64_t)&off_27076B1F8;
  *a1 = v20;
  uint64_t v21 = v33(a5, a6);
  double v22 = v16(a5, a6, a7);
  double v23 = v16(a5, a6, a8);
  swift_allocObject();
  uint64_t v24 = sub_25994623C(v21, v22, v23);
  a2[3] = v19;
  a2[4] = (uint64_t)&off_27076B1F8;
  *a2 = v24;
  uint64_t v25 = v33(a5, a6);
  double v26 = v16(a5, a6, a8);
  double v27 = v16(a5, a6, a9);
  swift_allocObject();
  uint64_t v28 = sub_25994623C(v25, v26, v27);
  a3[3] = v19;
  a3[4] = (uint64_t)&off_27076B1F8;
  *a3 = v28;
  uint64_t v29 = v33(a5, a6);
  double v30 = v16(a5, a6, a9);
  double v31 = v16(a5, a6, 1.0);
  swift_allocObject();
  uint64_t result = sub_25994623C(v29, v30, v31);
  a4[3] = v19;
  a4[4] = (uint64_t)&off_27076B1F8;
  *a4 = result;
  return result;
}

uint64_t sub_259944474(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  double v40 = *(uint64_t (**)(uint64_t, uint64_t))(a7 + 16);
  uint64_t v18 = v40(a6, a7);
  uint64_t v19 = *(double (**)(uint64_t, uint64_t, double))(a7 + 128);
  double v20 = v19(a6, a7, 0.0);
  double v21 = v19(a6, a7, a8);
  uint64_t v22 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  uint64_t v23 = sub_25994623C(v18, v20, v21);
  a1[3] = v22;
  a1[4] = (uint64_t)&off_27076B1F8;
  *a1 = v23;
  uint64_t v24 = v40(a6, a7);
  double v25 = v19(a6, a7, a8);
  double v26 = v19(a6, a7, a9);
  swift_allocObject();
  uint64_t v27 = sub_25994623C(v24, v25, v26);
  a2[3] = v22;
  a2[4] = (uint64_t)&off_27076B1F8;
  *a2 = v27;
  uint64_t v28 = v40(a6, a7);
  double v29 = v19(a6, a7, a9);
  double v30 = v19(a6, a7, a10);
  swift_allocObject();
  uint64_t v31 = sub_25994623C(v28, v29, v30);
  a3[3] = v22;
  a3[4] = (uint64_t)&off_27076B1F8;
  *a3 = v31;
  uint64_t v32 = v40(a6, a7);
  double v33 = v19(a6, a7, a10);
  double v34 = v19(a6, a7, a11);
  swift_allocObject();
  uint64_t v35 = sub_25994623C(v32, v33, v34);
  a4[3] = v22;
  a4[4] = (uint64_t)&off_27076B1F8;
  *a4 = v35;
  uint64_t v36 = v40(a6, a7);
  double v37 = v19(a6, a7, a11);
  double v38 = v19(a6, a7, 1.0);
  swift_allocObject();
  uint64_t result = sub_25994623C(v36, v37, v38);
  a5[3] = v22;
  a5[4] = (uint64_t)&off_27076B1F8;
  *a5 = result;
  return result;
}

uint64_t sub_2599447CC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13)
{
  char v47 = *(uint64_t (**)(uint64_t, uint64_t))(a8 + 16);
  uint64_t v21 = v47(a7, a8);
  uint64_t v22 = *(double (**)(uint64_t, uint64_t, double))(a8 + 128);
  double v23 = v22(a7, a8, 0.0);
  double v24 = v22(a7, a8, a9);
  uint64_t v25 = type metadata accessor for ChildProgressReporter(0);
  swift_allocObject();
  uint64_t v26 = sub_25994623C(v21, v23, v24);
  a1[3] = v25;
  a1[4] = (uint64_t)&off_27076B1F8;
  *a1 = v26;
  uint64_t v27 = v47(a7, a8);
  double v28 = v22(a7, a8, a9);
  double v29 = v22(a7, a8, a10);
  swift_allocObject();
  uint64_t v30 = sub_25994623C(v27, v28, v29);
  a2[3] = v25;
  a2[4] = (uint64_t)&off_27076B1F8;
  *a2 = v30;
  uint64_t v31 = v47(a7, a8);
  double v32 = v22(a7, a8, a10);
  double v33 = v22(a7, a8, a11);
  swift_allocObject();
  uint64_t v34 = sub_25994623C(v31, v32, v33);
  a3[3] = v25;
  a3[4] = (uint64_t)&off_27076B1F8;
  *a3 = v34;
  uint64_t v35 = v47(a7, a8);
  double v36 = v22(a7, a8, a11);
  double v37 = v22(a7, a8, a12);
  swift_allocObject();
  uint64_t v38 = sub_25994623C(v35, v36, v37);
  a4[3] = v25;
  a4[4] = (uint64_t)&off_27076B1F8;
  *a4 = v38;
  uint64_t v39 = v47(a7, a8);
  double v40 = v22(a7, a8, a12);
  double v41 = v22(a7, a8, a13);
  swift_allocObject();
  uint64_t v42 = sub_25994623C(v39, v40, v41);
  a5[3] = v25;
  a5[4] = (uint64_t)&off_27076B1F8;
  *a5 = v42;
  uint64_t v43 = v47(a7, a8);
  double v44 = v22(a7, a8, a13);
  double v45 = v22(a7, a8, 1.0);
  swift_allocObject();
  uint64_t result = sub_25994623C(v43, v44, v45);
  a6[3] = v25;
  a6[4] = (uint64_t)&off_27076B1F8;
  *a6 = result;
  return result;
}

uint64_t sub_259944BBC(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_259955E10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress;
  double v12 = *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress);
  if (v12 > a1)
  {
    double v13 = v12 - a1;
    swift_retain();
    double v14 = sub_259955F30();
    if (v13 <= 0.001) {
      os_log_type_t v15 = sub_259956060();
    }
    else {
      os_log_type_t v15 = sub_259956080();
    }
    os_log_type_t v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      double v17 = v10;
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134218240;
      double v37 = *(double *)(v2 + v11);
      sub_2599560C0();
      swift_release();
      *(_WORD *)(v18 + 12) = 2048;
      double v37 = a1;
      sub_2599560C0();
      _os_log_impl(&dword_259939000, v14, v16, "Progress going backwards, from %f to %f", (uint8_t *)v18, 0x16u);
      uint64_t v19 = v18;
      uint64_t v10 = v17;
      MEMORY[0x25A2E20E0](v19, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  uint64_t v35 = v11;
  sub_259955E00();
  uint64_t v20 = v2 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastReportDate;
  swift_beginAccess();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v21(v8, v20, v4);
  sub_259955DE0();
  double v23 = v22;
  uint64_t v24 = v2;
  uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v8, v4);
  if (v23 > 1.0)
  {
    uint64_t v33 = v2;
    uint64_t v34 = v10;
    uint64_t v26 = sub_259955F30();
    os_log_type_t v27 = sub_259956080();
    if (os_log_type_enabled(v26, v27))
    {
      double v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = v5;
      double v29 = v28;
      *(_DWORD *)double v28 = 134217984;
      double v36 = v23;
      sub_2599560C0();
      _os_log_impl(&dword_259939000, v26, v27, "Progress wasn't called for %f seconds", v29, 0xCu);
      uint64_t v30 = v29;
      uint64_t v5 = v32;
      MEMORY[0x25A2E20E0](v30, -1, -1);
    }

    uint64_t v24 = v33;
    uint64_t v10 = v34;
  }
  *(double *)(v24 + v35) = a1;
  v21(v8, (uint64_t)v10, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v20, v8, v4);
  swift_endAccess();
  return ((uint64_t (*)(char *, uint64_t))v25)(v10, v4);
}

uint64_t sub_259944F70(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_259955E10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress;
  double v12 = *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress);
  if (v12 > a1)
  {
    double v13 = v12 - a1;
    swift_retain();
    double v14 = sub_259955F30();
    if (v13 <= 0.001) {
      os_log_type_t v15 = sub_259956060();
    }
    else {
      os_log_type_t v15 = sub_259956080();
    }
    os_log_type_t v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      double v17 = v10;
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134218240;
      double v37 = *(double *)(v2 + v11);
      sub_2599560C0();
      swift_release();
      *(_WORD *)(v18 + 12) = 2048;
      double v37 = a1;
      sub_2599560C0();
      _os_log_impl(&dword_259939000, v14, v16, "Progress going backwards, from %f to %f", (uint8_t *)v18, 0x16u);
      uint64_t v19 = v18;
      uint64_t v10 = v17;
      MEMORY[0x25A2E20E0](v19, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
  uint64_t v35 = v11;
  sub_259955E00();
  uint64_t v20 = v2 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastReportDate;
  swift_beginAccess();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v21(v8, v20, v4);
  sub_259955DE0();
  double v23 = v22;
  uint64_t v24 = v2;
  uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v8, v4);
  if (v23 > 1.0)
  {
    uint64_t v33 = v2;
    uint64_t v34 = v10;
    uint64_t v26 = sub_259955F30();
    os_log_type_t v27 = sub_259956080();
    if (os_log_type_enabled(v26, v27))
    {
      double v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = v5;
      double v29 = v28;
      *(_DWORD *)double v28 = 134217984;
      double v36 = v23;
      sub_2599560C0();
      _os_log_impl(&dword_259939000, v26, v27, "Progress wasn't called for %f seconds", v29, 0xCu);
      uint64_t v30 = v29;
      uint64_t v5 = v32;
      MEMORY[0x25A2E20E0](v30, -1, -1);
    }

    uint64_t v24 = v33;
    uint64_t v10 = v34;
  }
  *(double *)(v24 + v35) = a1;
  v21(v8, (uint64_t)v10, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v20, v8, v4);
  swift_endAccess();
  return ((uint64_t (*)(char *, uint64_t))v25)(v10, v4);
}

uint64_t static RootProgressReporter.ignore.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for RootProgressReporter(0);
  uint64_t v3 = swift_allocObject();
  uint64_t result = RootProgressReporter.init(_:)((uint64_t)nullsub_1, 0);
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for RootProgressReporter;
  *a1 = v3;
  return result;
}

uint64_t sub_259945394@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger;
  uint64_t v4 = sub_259955F50();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_259945408()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted);
}

uint64_t sub_259945418(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted) = result;
  return result;
}

uint64_t sub_259945428()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted);
}

uint64_t sub_259945438(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted) = result;
  return result;
}

void sub_259945448(double a1)
{
  *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress) = a1;
}

uint64_t sub_259945458(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastReportDate;
  swift_beginAccess();
  uint64_t v4 = sub_259955E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t sub_2599454E4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_25994552C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_259945578())()
{
  return j__swift_endAccess;
}

double sub_2599455D8()
{
  return *(double *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress);
}

uint64_t RootProgressReporter.init(_:)(uint64_t a1, uint64_t a2)
{
  return sub_259945688(a1, a2, 0);
}

{
  return sub_259945688(a1, a2, 1);
}

uint64_t type metadata accessor for RootProgressReporter(uint64_t a1)
{
  return sub_259946A80(a1, (uint64_t *)&unk_26A3D2540);
}

uint64_t sub_259945628(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = swift_allocObject();
  a3(a1, a2);
  return v6;
}

uint64_t sub_259945688(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger;
  if (qword_26A3D2328 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_259955F50();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A3D3360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v3 + v7, v9, v8);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted) = 0;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_lastProgress) = 0;
  sub_259955E00();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled) = 0;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(unsigned char *)(v3 + 32) = a3 & 1;
  return v3;
}

void sub_259945798(double a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_259956000();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasStarted) & 1) == 0)
  {
    uint64_t v11 = (void *)sub_259955F30();
    os_log_type_t v12 = sub_259956080();
    if (OUTLINED_FUNCTION_6(v12))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_8(&dword_259939000, v13, v14, "Progress reporter has not been started");
      OUTLINED_FUNCTION_7();
    }
  }
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_hasCompleted) == 1)
  {
    os_log_type_t v15 = (void *)sub_259955F30();
    os_log_type_t v16 = sub_259956080();
    if (OUTLINED_FUNCTION_6(v16))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_8(&dword_259939000, v17, v18, "Progress reporter has completed");
      OUTLINED_FUNCTION_7();
    }
  }
  sub_259956020();
  uint64_t v19 = &unk_26A3D3000;
  if (v2)
  {
    uint64_t v20 = v2;
  }
  else
  {
    uint64_t v21 = (unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
    swift_beginAccess();
    if (*v21 != 1)
    {
      sub_259944BBC(a1);
      double v22 = *(uint64_t (**)(uint64_t, double))(v3 + 16);
      char v23 = *(unsigned char *)(v3 + 32);
      uint64_t v24 = swift_retain();
      if (v23)
      {
        if ((v22(v24, a1) & 1) == 0)
        {
          sub_259945C24();
          uint64_t v20 = (void *)OUTLINED_FUNCTION_2_1();
          sub_259955F60();
          swift_willThrow();
          sub_2599467C0();
          uint64_t v19 = &unk_26A3D3000;
          goto LABEL_17;
        }
      }
      else
      {
        v22(v24, a1);
      }
      sub_2599467C0();
      return;
    }
    sub_259945C24();
    uint64_t v20 = (void *)OUTLINED_FUNCTION_2_1();
    sub_259955F60();
    swift_willThrow();
  }
LABEL_17:
  id v37 = v20;
  id v25 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2528);
  if (swift_dynamicCast())
  {

    uint64_t v26 = (unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
    swift_beginAccess();
    *uint64_t v26 = 1;
    sub_259945C24();
    OUTLINED_FUNCTION_2_1();
    sub_259955F60();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    id v27 = v37;
  }
  else
  {

    id v28 = v20;
    id v29 = v20;
    uint64_t v30 = sub_259955F30();
    os_log_type_t v31 = sub_259956080();
    if (OUTLINED_FUNCTION_6(v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      v36[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 138412290;
      id v33 = v20;
      uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
      v36[4] = v34;
      uint64_t v19 = (void *)&unk_26A3D3000;
      sub_2599560C0();
      *(void *)v36[0] = v34;

      _os_log_impl(&dword_259939000, v30, (os_log_type_t)v2, "Unexpected error thrown from progress block: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2538);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
    }
    else
    {
    }
    uint64_t v35 = (unsigned char *)(v3 + v19[111]);
    swift_beginAccess();
    *uint64_t v35 = 1;
    sub_259945C24();
    OUTLINED_FUNCTION_2_1();
    sub_259955F60();
    swift_willThrow();
    id v27 = v20;
  }
}

unint64_t sub_259945C24()
{
  unint64_t result = qword_26A3D2530;
  if (!qword_26A3D2530)
  {
    sub_259956000();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2530);
  }
  return result;
}

BOOL sub_259945C74(double a1)
{
  sub_259956000();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = (BOOL *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_isCancelled);
  swift_beginAccess();
  if (*v4 || (sub_259956010() & 1) != 0)
  {
    BOOL v5 = 0;
    *uint64_t v4 = 1;
  }
  else
  {
    sub_259944BBC(a1);
    uint64_t v6 = *(uint64_t (**)(uint64_t, double))(v1 + 16);
    int v7 = *(unsigned __int8 *)(v1 + 32);
    uint64_t v8 = swift_retain();
    if (v7 == 1)
    {
      char v9 = v6(v8, a1);
      sub_2599467C0();
      *uint64_t v4 = (v9 & 1) == 0;
    }
    else
    {
      v6(v8, a1);
      sub_2599467C0();
    }
    return !*v4;
  }
  return v5;
}

uint64_t RootProgressReporter.deinit()
{
  sub_2599467C0();
  sub_259955F50();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = OUTLINED_FUNCTION_3();
  v2(v1);
  sub_259955E10();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_3();
  v4(v3);
  return v0;
}

uint64_t RootProgressReporter.__deallocating_deinit()
{
  return sub_259946430((void (*)(void))RootProgressReporter.deinit);
}

uint64_t sub_25994603C(uint64_t a1)
{
  return sub_25994364C(a1, (uint64_t)&off_27076B170);
}

void sub_259946068(double a1)
{
}

uint64_t sub_25994608C(uint64_t a1)
{
  return sub_2599439BC(a1, (uint64_t)&off_27076B170);
}

BOOL sub_2599460B8(double a1)
{
  return sub_259945C74(a1);
}

uint64_t sub_2599460E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  return sub_259943CC4(a1, (uint64_t)&off_27076B170, a2, a3, a4);
}

uint64_t sub_25994610C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_259943DA8(a1, a2, a3, a4, (uint64_t)&off_27076B170);
}

uint64_t sub_259946138(uint64_t *a1, uint64_t *a2, uint64_t a3, double a4)
{
  return sub_259943E04(a1, a2, a3, (uint64_t)&off_27076B170, a4);
}

uint64_t sub_259946164(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, double a5, double a6)
{
  return sub_259943F98(a1, a2, a3, a4, (uint64_t)&off_27076B170, a5, a6);
}

uint64_t sub_259946190(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, double a6, double a7, double a8)
{
  return sub_2599441B4(a1, a2, a3, a4, a5, (uint64_t)&off_27076B170, a6, a7, a8);
}

uint64_t sub_2599461BC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  return sub_259944474(a1, a2, a3, a4, a5, a6, (uint64_t)&off_27076B170, a7, a8, a9, a10);
}

uint64_t sub_2599461E8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12)
{
  return sub_2599447CC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&off_27076B170, a8, a9, a10, a11, a12);
}

uint64_t sub_259946214()
{
  return swift_retain();
}

uint64_t sub_25994623C(uint64_t a1, double a2, double a3)
{
  *(unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasStarted) = 0;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasCompleted) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress) = 0;
  sub_259955E00();
  *(void *)(v3 + 16) = a1;
  *(double *)(v3 + 24) = a2;
  *(double *)(v3 + 32) = a3;
  uint64_t v7 = a1 + OBJC_IVAR____TtC22PhotosIntelligenceCore20RootProgressReporter_logger;
  uint64_t v8 = v3 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_logger;
  uint64_t v9 = sub_259955F50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, v7, v9);
  return v3;
}

void sub_259946308(double a1)
{
  sub_259944F70(a1);
  double v1 = OUTLINED_FUNCTION_5();
  sub_259945798(v1);
}

double sub_259946344(double a1)
{
  return *(double *)(v1 + 24) + (*(double *)(v1 + 32) - *(double *)(v1 + 24)) * a1;
}

BOOL sub_259946358(double a1)
{
  sub_259944F70(a1);
  double v1 = OUTLINED_FUNCTION_5();
  return sub_259945C74(v1);
}

uint64_t sub_259946390()
{
  swift_release();
  sub_259955F50();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = OUTLINED_FUNCTION_3();
  v2(v1);
  sub_259955E10();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_3();
  v4(v3);
  return v0;
}

uint64_t sub_259946418()
{
  return sub_259946430((void (*)(void))sub_259946390);
}

uint64_t sub_259946430(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x270FA0228](v1, v2, v3);
}

uint64_t sub_25994648C(uint64_t a1)
{
  return sub_25994364C(a1, (uint64_t)&off_27076B258);
}

void sub_2599464B8(double a1)
{
}

uint64_t sub_2599464DC(uint64_t a1)
{
  return sub_2599439BC(a1, (uint64_t)&off_27076B258);
}

BOOL sub_259946508(double a1)
{
  return sub_259946358(a1);
}

uint64_t sub_259946530@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  return sub_259943CC4(a1, (uint64_t)&off_27076B258, a2, a3, a4);
}

uint64_t sub_25994655C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_259943DA8(a1, a2, a3, a4, (uint64_t)&off_27076B258);
}

uint64_t sub_259946588(uint64_t *a1, uint64_t *a2, uint64_t a3, double a4)
{
  return sub_259943E04(a1, a2, a3, (uint64_t)&off_27076B258, a4);
}

uint64_t sub_2599465B4(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, double a5, double a6)
{
  return sub_259943F98(a1, a2, a3, a4, (uint64_t)&off_27076B258, a5, a6);
}

uint64_t sub_2599465E0(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, double a6, double a7, double a8)
{
  return sub_2599441B4(a1, a2, a3, a4, a5, (uint64_t)&off_27076B258, a6, a7, a8);
}

uint64_t sub_25994660C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  return sub_259944474(a1, a2, a3, a4, a5, a6, (uint64_t)&off_27076B258, a7, a8, a9, a10);
}

uint64_t sub_259946638(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12)
{
  return sub_2599447CC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&off_27076B258, a8, a9, a10, a11, a12);
}

uint64_t sub_259946664()
{
  return swift_retain();
}

uint64_t sub_25994666C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasStarted);
}

uint64_t sub_25994667C(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasStarted) = result;
  return result;
}

uint64_t sub_25994668C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasCompleted);
}

uint64_t sub_25994669C(uint64_t result)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_hasCompleted) = result;
  return result;
}

uint64_t sub_2599466AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_logger;
  uint64_t v4 = sub_259955F50();
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

void sub_259946720(double a1)
{
  *(double *)(v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastProgress) = a1;
}

uint64_t sub_259946730(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22PhotosIntelligenceCore21ChildProgressReporter_lastReportDate;
  swift_beginAccess();
  uint64_t v4 = sub_259955E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t sub_2599467C0()
{
  return swift_release();
}

uint64_t sub_2599467C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2599454E4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2599467F8(char *a1)
{
  return sub_25994552C(*a1);
}

uint64_t sub_259946820()
{
  return type metadata accessor for RootProgressReporter(0);
}

uint64_t sub_259946828()
{
  uint64_t result = sub_259955F50();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_259955E10();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for RootProgressReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RootProgressReporter);
}

uint64_t dispatch thunk of RootProgressReporter.isCancelled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of RootProgressReporter.isCancelled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of RootProgressReporter.isCancelled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of RootProgressReporter.progress.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of RootProgressReporter.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of RootProgressReporter.report(progress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of RootProgressReporter.canProceed(progress:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t sub_259946A58()
{
  return type metadata accessor for ChildProgressReporter(0);
}

uint64_t type metadata accessor for ChildProgressReporter(uint64_t a1)
{
  return sub_259946A80(a1, (uint64_t *)&unk_26A3D2570);
}

uint64_t sub_259946A80(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259946AB4()
{
  uint64_t result = sub_259955F50();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_259955E10();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_259946BAC()
{
  return swift_retain();
}

uint64_t destroy for RootProgressReporter.CallbackType()
{
  return sub_2599467C0();
}

uint64_t _s22PhotosIntelligenceCore20RootProgressReporterC12CallbackTypeOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_259946BAC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RootProgressReporter.CallbackType(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_259946BAC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2599467C0();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RootProgressReporter.CallbackType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2599467C0();
  return a1;
}

uint64_t getEnumTagSinglePayload for RootProgressReporter.CallbackType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for RootProgressReporter.CallbackType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_259946D48(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_259946D50(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RootProgressReporter.CallbackType()
{
  return &type metadata for RootProgressReporter.CallbackType;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0;
}

void OUTLINED_FUNCTION_4()
{
  sub_2599467C0();
}

double OUTLINED_FUNCTION_5()
{
  return *(double *)(v0 + 24) + (*(double *)(v0 + 32) - *(double *)(v0 + 24)) * v1;
}

BOOL OUTLINED_FUNCTION_6(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x25A2E20E0);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_259946E54(uint64_t a1)
{
  if ((unint64_t)(a1 - 1664) < 2)
  {
    char v8 = 0;
    char v9 = 2;
    goto LABEL_23;
  }
  if (a1 != 287 && a1 != 421)
  {
    if (a1 == 595)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_259959B20;
      uint64_t v5 = 595;
      goto LABEL_19;
    }
    if (a1 != 839)
    {
      if (a1 == 881)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
        uint64_t v7 = swift_initStackObject();
        *(_OWORD *)(v7 + 16) = xmmword_259959B20;
        *(void *)(v7 + 32) = 881;
        uint64_t v6 = sub_259947BAC(v7);
        char v9 = 0;
        char v8 = 2;
        goto LABEL_24;
      }
      if (a1 != 910 && a1 != 1086 && a1 != 1533)
      {
        BOOL v2 = a1 == 1663 || a1 == 15291;
        if (!v2 && a1 != 10932)
        {
          char v8 = 0;
          char v9 = 0;
LABEL_23:
          uint64_t v6 = MEMORY[0x263F8EE88];
          goto LABEL_24;
        }
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259959B20;
  uint64_t v5 = 492;
LABEL_19:
  *(void *)(inited + 32) = v5;
  uint64_t v6 = sub_259947BAC(inited);
  char v9 = 0;
  char v8 = 1;
LABEL_24:
  type metadata accessor for UtilitySceneConfiguration();
  swift_allocObject();
  return sub_25993E084(a1, v9, v8, v6);
}

id sub_259946FD0(void *a1)
{
  return objc_msgSend(a1, *off_265454070[*(char *)(v1 + 24)]);
}

double sub_259946FE8()
{
  return dbl_259959B50[*(char *)(v0 + 25)];
}

uint64_t type metadata accessor for UtilitySceneConfiguration()
{
  return self;
}

uint64_t sub_259947020(uint64_t a1)
{
  uint64_t result = MEMORY[0x263F8EE88];
  switch(a1)
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_259959B80;
      *(_OWORD *)(inited + 32) = xmmword_259959B90;
      *(_OWORD *)(inited + 48) = xmmword_259959BA0;
      *(_OWORD *)(inited + 64) = xmmword_259959BB0;
      *(void *)(inited + 80) = 1663;
      return sub_25993E98C(inited);
    case 2:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_259959B20;
      uint64_t v4 = 1086;
      goto LABEL_10;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_259959BC0;
      *(_OWORD *)(inited + 32) = xmmword_259959BD0;
      *(_OWORD *)(inited + 48) = xmmword_259959BE0;
      *(_OWORD *)(inited + 64) = xmmword_259959BF0;
      *(_OWORD *)(inited + 80) = xmmword_259959C00;
      *(_OWORD *)(inited + 96) = xmmword_259959C10;
      *(_OWORD *)(inited + 112) = xmmword_259959C20;
      *(_OWORD *)(inited + 128) = xmmword_259959C30;
      *(_OWORD *)(inited + 144) = xmmword_259959C40;
      *(_OWORD *)(inited + 160) = xmmword_259959C50;
      return sub_25993E98C(inited);
    case 8:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_259959B20;
      uint64_t v4 = 1664;
      goto LABEL_10;
    default:
      if (a1 == 16)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_259959B20;
        uint64_t v4 = 2147482095;
      }
      else
      {
        if (a1 != 32) {
          return result;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_259959B20;
        uint64_t v4 = 839;
      }
LABEL_10:
      *(void *)(inited + 32) = v4;
      return sub_25993E98C(inited);
  }
}

uint64_t sub_259947218(uint64_t a1)
{
  if (a1 == 4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
    uint64_t inited = (_OWORD *)swift_initStackObject();
    inited[1] = xmmword_259959C60;
    inited[2] = xmmword_259959C70;
    inited[3] = xmmword_259959C80;
    inited[4] = xmmword_259959C90;
    inited[5] = xmmword_259959CA0;
    return sub_25993E98C((uint64_t)inited);
  }
  if (a1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
    uint64_t inited = (_OWORD *)swift_initStackObject();
    inited[1] = xmmword_259959CB0;
    inited[2] = xmmword_259959CC0;
    inited[3] = xmmword_259959CD0;
    inited[4] = xmmword_259959CE0;
    inited[5] = xmmword_259959CF0;
    inited[6] = xmmword_259959D00;
    inited[7] = xmmword_259959D10;
    inited[8] = xmmword_259959D20;
    return sub_25993E98C((uint64_t)inited);
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_25994730C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for UtilityTypeConfiguration()
{
  return self;
}

uint64_t static PartOfWeek.partOfWeek(for:in:)@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_259955E50();
  *a1 = result & 1;
  return result;
}

Swift::String __swiftcall PartOfWeek.localizedText()()
{
  type metadata accessor for LocalizedString();
  uint64_t v0 = sub_25993BA4C();
  BOOL v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0;
  uint64_t v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t static PartOfWeek.from(localizedText:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_259955F90();
  uint64_t v4 = v3;
  char v5 = byte_27076B608;
  OUTLINED_FUNCTION_0_2();
  type metadata accessor for LocalizedString();
  OUTLINED_FUNCTION_1_2();
  sub_25993BA4C();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_259955F90();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  if (v6 == v2 && v8 == v4) {
    goto LABEL_12;
  }
  char v10 = sub_2599561A0();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_13:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  char v5 = byte_27076B609;
  OUTLINED_FUNCTION_0_2();
  sub_25993BA4C();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_259955F90();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if (v11 == v2 && v13 == v4)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v15 = sub_2599561A0();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v15 & 1) == 0) {
    char v5 = 2;
  }
LABEL_14:
  *a1 = v5;
  return result;
}

void *static PartOfWeek.allCases.getter()
{
  return &unk_27076B610;
}

PhotosIntelligenceCore::PartOfWeek_optional __swiftcall PartOfWeek.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_259956170();
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
  *uint64_t v2 = v5;
  return result;
}

uint64_t PartOfWeek.rawValue.getter()
{
  if (*v0) {
    return 0x646E656B656577;
  }
  else {
    return 0x7961646B656577;
  }
}

uint64_t sub_259947610(char *a1, char *a2)
{
  return sub_2599483C8(*a1, *a2);
}

uint64_t sub_25994761C()
{
  return sub_25993DA48();
}

uint64_t sub_259947624()
{
  return sub_25993DBC4();
}

uint64_t sub_25994762C()
{
  return sub_25993DC20();
}

PhotosIntelligenceCore::PartOfWeek_optional sub_259947634(Swift::String *a1)
{
  return PartOfWeek.init(rawValue:)(*a1);
}

uint64_t sub_259947640@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PartOfWeek.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_259947668()
{
  return sub_259955FC0();
}

uint64_t sub_2599476C8()
{
  return sub_259955FB0();
}

void sub_259947718(void *a1@<X8>)
{
  *a1 = &unk_27076B610;
}

uint64_t sub_259947728()
{
  uint64_t v0 = sub_259955E20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_259955E60();
  __swift_allocate_value_buffer(v4, qword_26A3D2580);
  __swift_project_value_buffer(v4, (uint64_t)qword_26A3D2580);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F07740], v0);
  sub_259955E30();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static PNPartOfWeekCalculator.partOfWeekLocalizedNames(for:)()
{
  uint64_t v0 = sub_259955E60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26A3D2330 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26A3D2580);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  sub_259955E50();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259959B20;
  type metadata accessor for LocalizedString();
  OUTLINED_FUNCTION_1_2();
  uint64_t v6 = sub_25993BA4C();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v8;
  return sub_259947CE8(inited);
}

PNPartOfWeekCalculator __swiftcall PNPartOfWeekCalculator.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (PNPartOfWeekCalculator)objc_msgSend(v0, sel_init);
}

id PNPartOfWeekCalculator.init()()
{
  v1.super_class = (Class)PNPartOfWeekCalculator;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_259947BAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B302500);
  uint64_t result = sub_259956110();
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v5 = 0;
  uint64_t v6 = result + 56;
  uint64_t v7 = ~(-1 << *(unsigned char *)(result + 32));
  while (v5 < *(void *)(a1 + 16))
  {
    uint64_t v8 = *(void *)(a1 + 32 + 8 * v5);
    uint64_t result = sub_259956200();
    unint64_t v9 = result & v7;
    unint64_t v10 = (result & (unint64_t)v7) >> 6;
    uint64_t v11 = *(void *)(v6 + 8 * v10);
    uint64_t v12 = 1 << (result & v7);
    uint64_t v13 = *(void *)(v3 + 48);
    if ((v12 & v11) != 0)
    {
      while (*(void *)(v13 + 8 * v9) != v8)
      {
        unint64_t v9 = (v9 + 1) & v7;
        unint64_t v10 = v9 >> 6;
        uint64_t v11 = *(void *)(v6 + 8 * (v9 >> 6));
        uint64_t v12 = 1 << v9;
        if ((v11 & (1 << v9)) == 0) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      *(void *)(v6 + 8 * v10) = v12 | v11;
      *(void *)(v13 + 8 * v9) = v8;
      uint64_t v14 = *(void *)(v3 + 16);
      BOOL v15 = __OFADD__(v14, 1);
      uint64_t v16 = v14 + 1;
      if (v15) {
        goto LABEL_15;
      }
      *(void *)(v3 + 16) = v16;
    }
    if (++v5 == v4) {
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_259947CE8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D24A0);
  uint64_t result = sub_259956110();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_259956210();
    swift_bridgeObjectRetain();
    sub_259955FA0();
    uint64_t result = sub_259956230();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      BOOL v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_2599561A0(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_2599561A0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *uint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_259947EBC()
{
  unint64_t result = qword_26A3D2598;
  if (!qword_26A3D2598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D2598);
  }
  return result;
}

unint64_t sub_259947F0C()
{
  unint64_t result = qword_26A3D25A0;
  if (!qword_26A3D25A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3D25A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D25A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PartOfWeek(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PartOfWeek(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2599480B4);
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

unsigned char *sub_2599480DC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PartOfWeek()
{
  return &type metadata for PartOfWeek;
}

unint64_t type metadata accessor for PNPartOfWeekCalculator()
{
  unint64_t result = qword_26A3D25B0;
  if (!qword_26A3D25B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3D25B0);
  }
  return result;
}

unint64_t sub_259948138()
{
  unint64_t result = qword_26A3D25B8;
  if (!qword_26A3D25B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3D25B8);
  }
  return result;
}

unint64_t OUTLINED_FUNCTION_1_2()
{
  return 0xD000000000000017;
}

uint64_t sub_2599481AC(char a1, char a2)
{
  if (*(void *)&aMorning_3[8 * a1] == *(void *)&aMorning_3[8 * a2] && qword_259959ED0[a1] == qword_259959ED0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_2599561A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_259948234(char a1, char a2)
{
  uint64_t v3 = sub_25993DF28(a1);
  uint64_t v5 = v4;
  if (v3 == sub_25993DF28(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2599561A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2599482BC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x8000000259957F40;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0xD000000000000018;
    }
    else {
      unint64_t v4 = 0x6E6974617265706FLL;
    }
    if (v3 == 1) {
      unint64_t v5 = 0x8000000259957F60;
    }
    else {
      unint64_t v5 = 0xEE00746E696F5067;
    }
  }
  else
  {
    unint64_t v4 = 0xD00000000000001BLL;
    unint64_t v5 = 0x8000000259957F40;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v6 = 0xD000000000000018;
    }
    else {
      unint64_t v6 = 0x6E6974617265706FLL;
    }
    if (a2 == 1) {
      unint64_t v2 = 0x8000000259957F60;
    }
    else {
      unint64_t v2 = 0xEE00746E696F5067;
    }
  }
  else
  {
    unint64_t v6 = 0xD00000000000001BLL;
  }
  if (v4 == v6 && v5 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2599561A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2599483C8(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x646E656B656577;
  }
  else {
    uint64_t v2 = 0x7961646B656577;
  }
  if (a2) {
    uint64_t v3 = 0x646E656B656577;
  }
  else {
    uint64_t v3 = 0x7961646B656577;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_2599561A0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_259948448(uint64_t a1)
{
  return sub_2599484B0(a1, MEMORY[0x263F90268], qword_26B3024E0, MEMORY[0x263F90260]);
}

uint64_t sub_25994847C(uint64_t a1)
{
  return sub_2599484B0(a1, MEMORY[0x263F90228], qword_26B3024C8, MEMORY[0x263F90220]);
}

uint64_t sub_2599484B0(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(unint64_t, unint64_t, unint64_t, unint64_t))
{
  uint64_t v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  return a4(0xD000000000000021, 0x8000000259958560, 0xD000000000000015, 0x8000000259958820);
}

void sub_259948544()
{
  off_26B302510 = &unk_27076B2E0;
}

uint64_t static PNUtilityTypeClassifier.supportedUtilityTypes.getter()
{
  if (qword_26B302518 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static PNUtilityTypeClassifier.supportedUtilityTypes.setter(void *a1)
{
  if (qword_26B302518 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_26B302510 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PNUtilityTypeClassifier.supportedUtilityTypes.modify())()
{
  if (qword_26B302518 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static PNUtilityTypeClassifier.latestVersion()()
{
  return 9;
}

uint64_t static PNUtilityTypeClassifier.screenshotInferred(in:usingSceneModel:)(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259959B20;
  *(void *)(inited + 32) = 1665;
  uint64_t v5 = sub_259947BAC(inited);
  id v6 = objc_msgSend(a1, sel_sceneClassifications);
  uint64_t v7 = sub_259956040();

  if (*(void *)(v7 + 16))
  {
    char v8 = sub_259948888(v5, MEMORY[0x263F8EE88], v7, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B3024F8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_259955F50();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B3024E0);
    unint64_t v10 = sub_259955F30();
    os_log_type_t v11 = sub_259956070();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_259939000, v10, v11, "[Inferred Screenshot] Empty sceneClassifications", v12, 2u);
      OUTLINED_FUNCTION_7();
    }

    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_259948888(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = sub_259949560(a3);
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  char v27 = 0;
  int64_t v11 = 0;
  while (v8)
  {
    unint64_t v12 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v13 = v12 | (v11 << 6);
LABEL_20:
    sub_259942AB0(*(void *)(a3 + 48) + 40 * v13, (uint64_t)&v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024C0);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      if (((unint64_t)objc_msgSend(v28, sel_classificationType) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
        goto LABEL_22;
      }
      id v17 = objc_msgSend(v28, sel_extendedSceneIdentifier);
      uint64_t v18 = (uint64_t)v17;
      BOOL v19 = (v27 & 1) == 0 && *(void *)(a1 + 16) && sub_25994987C((uint64_t)v17, a1);
      if (*(void *)(a2 + 16))
      {
        if (((v19 | sub_25994987C(v18, a2)) & 1) == 0) {
          goto LABEL_22;
        }
      }
      else if (!v19)
      {
        goto LABEL_22;
      }
      objc_msgSend(v28, sel_confidence, v23);
      if (sub_259949948(v18, a4, v20))
      {
        if (sub_25994987C(v18, a2)) {
          goto LABEL_40;
        }
        BOOL v21 = sub_259949AD8(v18, v28, v23);
        uint64_t result = swift_unknownObjectRelease();
        uint64_t v22 = *(void *)(a2 + 16);
        char v27 = v22 != 0 && v21;
        if (!v22 && v21)
        {
          swift_bridgeObjectRelease();
          swift_release();
          char v27 = 1;
          return v27 & 1;
        }
      }
      else
      {
LABEL_22:
        uint64_t result = swift_unknownObjectRelease();
      }
    }
  }
  int64_t v14 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_40:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    char v27 = 0;
    return v27 & 1;
  }
  if (v14 >= v9) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v11;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v11 = v14 + 1;
  if (v14 + 1 >= v9) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v11);
  if (v15) {
    goto LABEL_19;
  }
  int64_t v11 = v14 + 2;
  if (v14 + 2 >= v9) {
    goto LABEL_37;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v11);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    goto LABEL_20;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v9)
  {
LABEL_37:
    swift_bridgeObjectRelease();
    swift_release();
    return v27 & 1;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
  __break(1u);
  return result;
}

uint64_t static PNUtilityTypeClassifier.utilityTypesDetected(in:usingSceneModel:)(void *a1, void *a2)
{
  uint64_t v26 = 0;
  id v3 = objc_msgSend(a1, sel_sceneClassifications);
  uint64_t v4 = sub_259956040();

  uint64_t v5 = *(void *)(v4 + 16);
  swift_bridgeObjectRelease();
  if (!v5) {
    return 0;
  }
  if (qword_26B3024F8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_259955F50();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B3024E0);
  swift_unknownObjectRetain_n();
  uint64_t v7 = sub_259955F30();
  os_log_type_t v8 = sub_259956070();
  if (os_log_type_enabled(v7, v8))
  {
    int64_t v9 = (uint8_t *)OUTLINED_FUNCTION_2_2();
    *(_DWORD *)int64_t v9 = 134217984;
    id v10 = objc_msgSend(a1, sel_sceneClassifications);
    sub_259956040();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_2599560C0();
    swift_unknownObjectRelease();
    _os_log_impl(&dword_259939000, v7, v8, "sceneClassifications.count: %ld", v9, 0xCu);
    OUTLINED_FUNCTION_7();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v12 = objc_msgSend(a1, sel_sceneClassifications);
  uint64_t v13 = sub_259956040();

  if (qword_26B302518 != -1) {
    swift_once();
  }
  swift_beginAccess();
  int64_t v14 = off_26B302510;
  uint64_t v15 = *((void *)off_26B302510 + 2);
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    for (uint64_t i = 0; i != v15; ++i)
    {
      uint64_t v18 = v14[i + 4];
      BOOL v19 = sub_259955F30();
      os_log_type_t v20 = sub_259956070();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = OUTLINED_FUNCTION_2_2();
        *(_DWORD *)uint64_t v21 = 134217984;
        *(void *)(v21 + 4) = v18;
        _os_log_impl(&dword_259939000, v19, v20, "utilityType: %lu", (uint8_t *)v21, 0xCu);
        OUTLINED_FUNCTION_7();
      }

      if (static PNUtilityTypeClassifier.utilityOfType(_:detectedInSceneClassifications:hasQRCodeData:isAIImageFromGenerativePlayground:using:)(v18, v13, (int)objc_msgSend(a1, sel_hasQRCodeData), (int)objc_msgSend(a1, sel_isAIImageFromGenerativePlayground), a2))
      {
        v16 |= v18;
        uint64_t v26 = v16;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v22 = sub_259955F30();
  os_log_type_t v23 = sub_259956070();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)OUTLINED_FUNCTION_2_2();
    *(_DWORD *)uint64_t v24 = 134217984;
    sub_2599560C0();
    _os_log_impl(&dword_259939000, v22, v23, "detectedUtilityTypes: %lu", v24, 0xCu);
    OUTLINED_FUNCTION_7();
  }

  swift_beginAccess();
  return v26;
}

uint64_t static PNUtilityTypeClassifier.utilityOfType(_:detectedInSceneClassifications:hasQRCodeData:isAIImageFromGenerativePlayground:using:)(uint64_t a1, uint64_t a2, int a3, int a4, void *a5)
{
  v52 = a5;
  int v53 = a4;
  int v54 = a3;
  uint64_t v55 = a2;
  uint64_t v60 = a1;
  uint64_t v58 = sub_259955EE0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  int64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_259955EB0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  BOOL v19 = (char *)&v51 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v51 - v20;
  if (qword_26B3024B0 != -1) {
    swift_once();
  }
  uint64_t v57 = v6;
  unsigned __int8 v61 = v16;
  uint64_t v22 = sub_259955ED0();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_26B3024C8);
  sub_259955EA0();
  uint64_t v59 = v23;
  uint64_t v24 = sub_259955EC0();
  os_signpost_type_t v25 = sub_2599560A0();
  char v26 = sub_2599560B0();
  v56 = v9;
  if (v26)
  {
    char v27 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v27(v19, v21, v10);
    id v28 = (uint8_t *)OUTLINED_FUNCTION_2_2();
    uint64_t v51 = v12;
    uint64_t v29 = v10;
    uint64_t v30 = v28;
    *(_DWORD *)id v28 = 134217984;
    uint64_t v31 = v60;
    uint64_t v62 = v60;
    sub_2599560C0();
    os_signpost_id_t v32 = sub_259955E90();
    _os_signpost_emit_with_name_impl(&dword_259939000, v24, v25, v32, "[UT] utilityOfType", "type: %lu", v30, 0xCu);
    uint64_t v10 = v29;
    uint64_t v12 = v51;
    OUTLINED_FUNCTION_7();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v10);
  }
  else
  {

    char v27 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v31 = v60;
  }
  v27(v19, v21, v10);
  sub_259955F10();
  swift_allocObject();
  sub_259955F00();
  id v33 = *(void (**)(char *, uint64_t))(v12 + 8);
  v33(v21, v10);
  if (v31 == 16)
  {
    char v35 = v54;
    uint64_t v34 = v61;
  }
  else
  {
    uint64_t v34 = v61;
    if (v31 == 4 && (v53 & 1) != 0)
    {
      char v35 = 1;
    }
    else
    {
      uint64_t v36 = v55;
      if (*(void *)(v55 + 16))
      {
        type metadata accessor for UtilityTypeConfiguration();
        uint64_t v37 = sub_259947020(v31);
        uint64_t v38 = sub_259947218(v31);
        char v35 = sub_259948888(v37, v38, v36, v52);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v35 = 0;
      }
    }
  }
  uint64_t v39 = sub_259955EC0();
  sub_259955EF0();
  os_signpost_type_t v40 = sub_259956090();
  if (sub_2599560B0())
  {
    swift_retain();
    double v41 = v56;
    sub_259955F20();
    swift_release();
    uint64_t v43 = v57;
    uint64_t v42 = v58;
    if ((*(unsigned int (**)(char *, uint64_t))(v57 + 88))(v41, v58) == *MEMORY[0x263F90238])
    {
      uint64_t v44 = v10;
      double v45 = "[Error] Interval already ended";
    }
    else
    {
      uint64_t v46 = v43;
      uint64_t v44 = v10;
      (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v42);
      double v45 = "";
    }
    char v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v47 = 0;
    uint64_t v48 = v61;
    os_signpost_id_t v49 = sub_259955E90();
    _os_signpost_emit_with_name_impl(&dword_259939000, v39, v40, v49, "[UT] utilityOfType", v45, v47, 2u);
    OUTLINED_FUNCTION_7();
    uint64_t v10 = v44;
    uint64_t v34 = v48;
  }

  v33(v34, v10);
  swift_release();
  return v35 & 1;
}

uint64_t sub_259949560(uint64_t a1)
{
  uint64_t v22 = MEMORY[0x263F8EE88];
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  CGFloat v7 = *MEMORY[0x263F001B0];
  CGFloat v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_20;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v13 >= v6) {
      goto LABEL_25;
    }
    unint64_t v14 = *(void *)(v2 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v6) {
        goto LABEL_25;
      }
      unint64_t v14 = *(void *)(v2 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v6) {
          goto LABEL_25;
        }
        unint64_t v14 = *(void *)(v2 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_20:
    sub_259942AB0(*(void *)(a1 + 48) + 40 * v12, (uint64_t)v20);
    v18[0] = v20[0];
    v18[1] = v20[1];
    uint64_t v19 = v21;
    sub_259942AB0((uint64_t)v18, (uint64_t)v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024C0);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_24;
    }
    objc_msgSend(v16[0], sel_boundingBox);
    v23.width = v7;
    v23.height = v8;
    if (CGSizeEqualToSize(v23, v24))
    {
      sub_259942B0C((uint64_t)v18);
      uint64_t result = swift_unknownObjectRelease();
    }
    else
    {
      sub_259942AB0((uint64_t)v18, (uint64_t)v16);
      sub_25993FFC0((uint64_t)v17, (uint64_t)v16);
      swift_unknownObjectRelease();
      sub_259942B0C((uint64_t)v17);
LABEL_24:
      uint64_t result = sub_259942B0C((uint64_t)v18);
    }
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v6)
  {
LABEL_25:
    swift_release();
    return v22;
  }
  unint64_t v14 = *(void *)(v2 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v6) {
      goto LABEL_25;
    }
    unint64_t v14 = *(void *)(v2 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2599497A4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v4 = sub_2599560D0(),
        uint64_t v5 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v6 = v4 & ~v5,
        ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    uint64_t v7 = ~v5;
    do
    {
      sub_259942AB0(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v10);
      char v8 = MEMORY[0x25A2E1960](v10, a1);
      sub_259942B0C((uint64_t)v10);
      if (v8) {
        break;
      }
      unint64_t v6 = (v6 + 1) & v7;
    }
    while (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

BOOL sub_25994987C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = sub_259956200();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

BOOL sub_259949948(uint64_t a1, id a2, double a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_5;
  }
  id v5 = objc_msgSend(a2, sel_nodeForSignalIdentifier_, a1);
  if (v5)
  {
    unint64_t v6 = v5;
    type metadata accessor for UtilitySceneConfiguration();
    sub_259946E54(a1);
    sub_259946FD0(v6);
    double v8 = v7;

    swift_release();
    return v8 <= a3;
  }
  if (qword_26B3024F8 != -1) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v10 = sub_259955F50();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B3024E0);
  unint64_t v11 = sub_259955F30();
  os_log_type_t v12 = sub_259956080();
  if (os_log_type_enabled(v11, v12))
  {
    int64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v13 = 134217984;
    sub_2599560C0();
    _os_log_impl(&dword_259939000, v11, v12, "Cannot find utilityNode for sceneIdentifier: %llu", v13, 0xCu);
    MEMORY[0x25A2E20E0](v13, -1, -1);
  }

  return 0;
}

BOOL sub_259949AD8(uint64_t a1, void *a2, uint64_t a3)
{
  type metadata accessor for UtilitySceneConfiguration();
  uint64_t v6 = sub_259946E54(a1);
  if (sub_259946FE8() <= 0.0)
  {
    swift_release();
    return 1;
  }
  else
  {
    uint64_t v7 = sub_259949BA0(a2, v6, a3);
    if (v8)
    {
      swift_release();
      return 0;
    }
    else
    {
      double v9 = *(double *)&v7;
      double v10 = sub_259946FE8();
      swift_release();
      return v10 <= v9;
    }
  }
}

uint64_t sub_259949BA0(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3024C0);
  if (swift_dynamicCast())
  {
    v29[0] = v26;
    v29[1] = v27;
    uint64_t v30 = v28;
    if (sub_2599497A4((uint64_t)v29, a3))
    {
      objc_msgSend(a1, sel_boundingBox);
      double width = v31.width;
      double height = v31.height;
      BOOL v8 = CGSizeEqualToSize(*MEMORY[0x263F001B0], v31);
      sub_259942B0C((uint64_t)v29);
      if (v8) {
        *(double *)&uint64_t result = 0.0;
      }
      else {
        *(double *)&uint64_t result = width * height;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a2 + 32);
      uint64_t v11 = a3 + 56;
      uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
      uint64_t v13 = -1;
      if (v12 < 64) {
        uint64_t v13 = ~(-1 << v12);
      }
      unint64_t v14 = v13 & *(void *)(a3 + 56);
      int64_t v15 = (unint64_t)(v12 + 63) >> 6;
      *(double *)&uint64_t result = COERCE_DOUBLE(swift_bridgeObjectRetain());
      int64_t v16 = 0;
      while (1)
      {
        do
        {
          if (v14)
          {
            unint64_t v17 = __clz(__rbit64(v14));
            v14 &= v14 - 1;
            unint64_t v18 = v17 | (v16 << 6);
          }
          else
          {
            int64_t v19 = v16 + 1;
            if (__OFADD__(v16, 1))
            {
              __break(1u);
LABEL_35:
              __break(1u);
              return result;
            }
            if (v19 >= v15) {
              goto LABEL_29;
            }
            unint64_t v20 = *(void *)(v11 + 8 * v19);
            ++v16;
            if (!v20)
            {
              int64_t v16 = v19 + 1;
              if (v19 + 1 >= v15) {
                goto LABEL_29;
              }
              unint64_t v20 = *(void *)(v11 + 8 * v16);
              if (!v20)
              {
                int64_t v16 = v19 + 2;
                if (v19 + 2 >= v15) {
                  goto LABEL_29;
                }
                unint64_t v20 = *(void *)(v11 + 8 * v16);
                if (!v20)
                {
                  int64_t v21 = v19 + 3;
                  if (v21 >= v15)
                  {
LABEL_29:
                    swift_release();
                    sub_259942B0C((uint64_t)v29);
                    goto LABEL_30;
                  }
                  unint64_t v20 = *(void *)(v11 + 8 * v21);
                  if (!v20)
                  {
                    while (1)
                    {
                      int64_t v16 = v21 + 1;
                      if (__OFADD__(v21, 1)) {
                        goto LABEL_35;
                      }
                      if (v16 >= v15) {
                        goto LABEL_29;
                      }
                      unint64_t v20 = *(void *)(v11 + 8 * v16);
                      ++v21;
                      if (v20) {
                        goto LABEL_25;
                      }
                    }
                  }
                  int64_t v16 = v21;
                }
              }
            }
LABEL_25:
            unint64_t v14 = (v20 - 1) & v20;
            unint64_t v18 = __clz(__rbit64(v20)) + (v16 << 6);
          }
          sub_259942AB0(*(void *)(a3 + 48) + 40 * v18, (uint64_t)&v26);
          *(double *)&uint64_t result = COERCE_DOUBLE(swift_dynamicCast());
        }
        while ((result & 1) == 0);
        if (sub_25994987C((uint64_t)objc_msgSend(v25, sel_extendedSceneIdentifier), v10)) {
          break;
        }
        *(double *)&uint64_t result = COERCE_DOUBLE(swift_unknownObjectRelease());
      }
      objc_msgSend(v25, sel_boundingBox);
      double v22 = v32.width;
      double v23 = v32.height;
      BOOL v24 = CGSizeEqualToSize(*MEMORY[0x263F001B0], v32);
      swift_release();
      swift_unknownObjectRelease();
      sub_259942B0C((uint64_t)v29);
      if (v24) {
        *(double *)&uint64_t result = 0.0;
      }
      else {
        *(double *)&uint64_t result = v22 * v23;
      }
    }
  }
  else
  {
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    sub_259949F68((uint64_t)&v26);
LABEL_30:
    *(double *)&uint64_t result = 0.0;
  }
  return result;
}

PNUtilityTypeClassifier __swiftcall PNUtilityTypeClassifier.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (PNUtilityTypeClassifier)objc_msgSend(v0, sel_init);
}

id PNUtilityTypeClassifier.init()()
{
  v1.super_class = (Class)PNUtilityTypeClassifier;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for PNUtilityTypeClassifier()
{
  unint64_t result = qword_26A3D25C8;
  if (!qword_26A3D25C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3D25C8);
  }
  return result;
}

uint64_t sub_259949F68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3D2638);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_slowAlloc();
}

unint64_t PhotosIntelligenceCoreLogSubsystem.getter()
{
  return 0xD000000000000021;
}

void sub_25994BB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

__CFString *NSStringFromPNErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"Unknown Error";
  }
  else {
    return off_2654540E0[a1 + 1];
  }
}

__CFString *CLSTaxonomyBasedModelStringFromConfidenceThresholdType(unint64_t a1)
{
  if (a1 > 6) {
    return 0;
  }
  else {
    return off_265454130[a1];
  }
}

uint64_t SimilarityModelVersionFromSceneAnalysisVersion(unint64_t a1)
{
  uint64_t v1 = 80;
  uint64_t v2 = 33;
  if (a1 < 0x21) {
    uint64_t v2 = 0;
  }
  if (a1 <= 0x4F) {
    uint64_t v1 = v2;
  }
  if (a1 <= 0x53) {
    return v1;
  }
  else {
    return 84;
  }
}

uint64_t sub_259955DB0()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_259955DC0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_259955DD0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_259955DE0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_259955DF0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_259955E00()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_259955E10()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_259955E20()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_259955E30()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_259955E40()
{
  return MEMORY[0x270EF1220]();
}

uint64_t sub_259955E50()
{
  return MEMORY[0x270EF1290]();
}

uint64_t sub_259955E60()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_259955E70()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_259955E80()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_259955E90()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_259955EA0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_259955EB0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_259955EC0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_259955ED0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_259955EE0()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_259955EF0()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_259955F00()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_259955F10()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_259955F20()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_259955F30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259955F40()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259955F50()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259955F60()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_259955F70()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_259955F80()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_259955F90()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_259955FA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259955FB0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_259955FC0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_259955FD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_259955FE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_259955FF0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259956000()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_259956010()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_259956020()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_259956030()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_259956040()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_259956050()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_259956060()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_259956070()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_259956080()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_259956090()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2599560A0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2599560B0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2599560C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2599560D0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2599560E0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2599560F0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_259956100()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_259956110()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_259956120()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_259956130()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_259956140()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_259956150()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_259956160()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_259956170()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_259956180()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_259956190()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2599561A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2599561B0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2599561C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2599561D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2599561E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2599561F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_259956200()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_259956210()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259956220()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_259956230()
{
  return MEMORY[0x270F9FC90]();
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x270EE7348]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

uint64_t PFSceneTaxonomyNodeExtendedSceneClassId()
{
  return MEMORY[0x270F53AF8]();
}

uint64_t PFSceneTaxonomyNodeF0Point5Threshold()
{
  return MEMORY[0x270F53B00]();
}

uint64_t PFSceneTaxonomyNodeF1Threshold()
{
  return MEMORY[0x270F53B08]();
}

uint64_t PFSceneTaxonomyNodeF2Threshold()
{
  return MEMORY[0x270F53B10]();
}

uint64_t PFSceneTaxonomyNodeGraphHighPrecisionThreshold()
{
  return MEMORY[0x270F53B18]();
}

uint64_t PFSceneTaxonomyNodeGraphHighRecallThreshold()
{
  return MEMORY[0x270F53B20]();
}

uint64_t PFSceneTaxonomyNodeName()
{
  return MEMORY[0x270F53B40]();
}

uint64_t PFSceneTaxonomyNodeNetworkId()
{
  return MEMORY[0x270F53B48]();
}

uint64_t PFSceneTaxonomyNodeSearchThreshold()
{
  return MEMORY[0x270F53B50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}