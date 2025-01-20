unint64_t sub_2145DD674(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;

  v3 = v2 + 64;
  v4 = -1 << *(unsigned char *)(v2 + 32);
  result = a1 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    v6 = *(void *)(v2 + 48);
    if (*(double *)(v6 + 8 * result) != a2)
    {
      v7 = ~v4;
      for (result = (result + 1) & v7;
            ((*(void *)(v3 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v7)
      {
        if (*(double *)(v6 + 8 * result) == a2) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_2145DD70C()
{
  v1 = v0;
  uint64_t v2 = sub_2146020B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780EEE8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_214603628();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  v23 = v1;
  result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
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
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v24 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v6 + 48) + 8 * v16);
    unint64_t v19 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 56) + v19, v2);
    *(void *)(*(void *)(v8 + 48) + v17) = v18;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 56) + v19, v5, v2);
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v25)
  {
LABEL_23:
    result = (void *)swift_release();
    v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2145DD9A8(void **a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780EE98) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_2145DF190(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_2145DDA54(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_2145DDA54(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780EE98);
  uint64_t v4 = *(void *)(v127 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v127);
  uint64_t v123 = (uint64_t)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v133 = (uint64_t)&v118 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v130 = (double *)((char *)&v118 - v10);
  MEMORY[0x270FA5388](v9);
  v129 = (double *)((char *)&v118 - v11);
  uint64_t v12 = a1[1];
  uint64_t result = sub_214603798();
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_141;
    }
    if (v12) {
      return sub_2145DE440(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_140;
  }
  uint64_t v126 = v4;
  uint64_t v120 = result;
  if (v12 > 1)
  {
    uint64_t v15 = v14 >> 1;
    uint64_t result = sub_214603098();
    *(void *)(result + 16) = v15;
    uint64_t v16 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v119 = result;
    unint64_t v125 = result + ((v16 + 32) & ~v16);
LABEL_12:
    uint64_t v18 = 0;
    uint64_t v17 = MEMORY[0x263F8EE78];
    v132 = a1;
    while (1)
    {
      uint64_t v20 = v18 + 1;
      uint64_t v124 = v18;
      if (v18 + 1 >= v12)
      {
        uint64_t v29 = v18 + 1;
      }
      else
      {
        uint64_t v21 = *a1;
        uint64_t v22 = *(void *)(v4 + 72);
        uint64_t v23 = *a1 + v22 * v20;
        uint64_t v24 = v129;
        uint64_t v131 = v12;
        sub_2145553A4(v23, (uint64_t)v129, &qword_26780EE98);
        int64_t v25 = v130;
        sub_2145553A4(v21 + v22 * v124, (uint64_t)v130, &qword_26780EE98);
        double v26 = *v24;
        double v27 = *v25;
        sub_2145515B8((uint64_t)v25, &qword_26780EE98);
        uint64_t v28 = (uint64_t)v24;
        uint64_t v18 = v124;
        uint64_t v12 = v131;
        uint64_t result = sub_2145515B8(v28, &qword_26780EE98);
        uint64_t v29 = v18 + 2;
        uint64_t v122 = v21;
        uint64_t v134 = v22;
        if (v18 + 2 >= v12)
        {
          uint64_t v36 = v22;
          uint64_t v4 = v126;
          if (v26 >= v27) {
            goto LABEL_39;
          }
        }
        else
        {
          uint64_t v121 = v2;
          uint64_t v118 = v17;
          uint64_t v128 = v22 * v20;
          uint64_t v30 = v21;
          uint64_t v31 = v18 + 2;
          uint64_t v32 = v22 * (v18 + 2);
          while (1)
          {
            v33 = v129;
            sub_2145553A4(v30 + v32, (uint64_t)v129, &qword_26780EE98);
            v34 = v130;
            sub_2145553A4(v30 + v128, (uint64_t)v130, &qword_26780EE98);
            BOOL v35 = *v33 >= *v34;
            sub_2145515B8((uint64_t)v34, &qword_26780EE98);
            uint64_t result = sub_2145515B8((uint64_t)v33, &qword_26780EE98);
            if (v26 < v27 == v35) {
              break;
            }
            uint64_t v36 = v134;
            v30 += v134;
            ++v31;
            uint64_t v12 = v131;
            if (v131 == v31)
            {
              uint64_t v29 = v131;
              uint64_t v4 = v126;
              uint64_t v17 = v118;
              uint64_t v2 = v121;
              uint64_t v21 = v122;
              uint64_t v18 = v124;
              if (v26 < v27) {
                goto LABEL_26;
              }
              goto LABEL_39;
            }
          }
          uint64_t v4 = v126;
          uint64_t v17 = v118;
          uint64_t v29 = v31;
          uint64_t v2 = v121;
          uint64_t v21 = v122;
          uint64_t v18 = v124;
          uint64_t v12 = v131;
          uint64_t v36 = v134;
          if (v26 >= v27) {
            goto LABEL_39;
          }
        }
LABEL_26:
        if (v29 < v18) {
          goto LABEL_142;
        }
        if (v18 < v29)
        {
          uint64_t v121 = v2;
          uint64_t v37 = 0;
          uint64_t v38 = v36 * (v29 - 1);
          uint64_t v39 = v29 * v36;
          uint64_t v40 = v18 * v36;
          do
          {
            if (v18 != v29 + v37 - 1)
            {
              if (!v21) {
                goto LABEL_147;
              }
              uint64_t v128 = v21 + v38;
              sub_214566B8C(v21 + v40, v123, &qword_26780EE98);
              if (v40 < v38 || v21 + v40 >= (unint64_t)(v21 + v39))
              {
                uint64_t v41 = v128;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v41 = v128;
                if (v40 != v38) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              uint64_t result = sub_214566B8C(v123, v41, &qword_26780EE98);
              a1 = v132;
              uint64_t v21 = v122;
              uint64_t v36 = v134;
            }
            ++v18;
            --v37;
            v38 -= v36;
            v39 -= v36;
            v40 += v36;
          }
          while (v18 < v29 + v37);
          uint64_t v4 = v126;
          uint64_t v2 = v121;
          uint64_t v18 = v124;
          uint64_t v12 = v131;
        }
      }
LABEL_39:
      if (v29 < v12)
      {
        if (__OFSUB__(v29, v18)) {
          goto LABEL_139;
        }
        if (v29 - v18 < v120)
        {
          if (__OFADD__(v18, v120)) {
            goto LABEL_143;
          }
          if (v18 + v120 >= v12) {
            uint64_t v42 = v12;
          }
          else {
            uint64_t v42 = v18 + v120;
          }
          if (v42 < v18)
          {
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
            return result;
          }
          if (v29 != v42)
          {
            uint64_t v118 = v17;
            uint64_t v121 = v2;
            uint64_t v122 = v42;
            uint64_t v43 = *(void *)(v4 + 72);
            uint64_t v134 = v43 * (v29 - 1);
            uint64_t v128 = v43;
            uint64_t v44 = v29 * v43;
            do
            {
              uint64_t v46 = 0;
              uint64_t v131 = v29;
              while (1)
              {
                uint64_t v47 = *a1;
                uint64_t v48 = v44;
                uint64_t v49 = v44 + v46 + *a1;
                v50 = a1;
                v51 = v129;
                sub_2145553A4(v49, (uint64_t)v129, &qword_26780EE98);
                uint64_t v52 = v134 + v46 + v47;
                v53 = v130;
                sub_2145553A4(v52, (uint64_t)v130, &qword_26780EE98);
                double v54 = *v51;
                double v55 = *v53;
                sub_2145515B8((uint64_t)v53, &qword_26780EE98);
                uint64_t result = sub_2145515B8((uint64_t)v51, &qword_26780EE98);
                if (v54 >= v55) {
                  break;
                }
                uint64_t v56 = *v50;
                if (!*v50) {
                  goto LABEL_145;
                }
                uint64_t v44 = v48;
                uint64_t v57 = v56 + v134 + v46;
                sub_214566B8C(v56 + v48 + v46, v133, &qword_26780EE98);
                swift_arrayInitWithTakeFrontToBack();
                uint64_t result = sub_214566B8C(v133, v57, &qword_26780EE98);
                v46 -= v128;
                ++v18;
                uint64_t v45 = v131;
                a1 = v132;
                if (v131 == v18) {
                  goto LABEL_50;
                }
              }
              a1 = v50;
              uint64_t v45 = v131;
              uint64_t v44 = v48;
LABEL_50:
              uint64_t v29 = v45 + 1;
              v134 += v128;
              v44 += v128;
              uint64_t v18 = v124;
            }
            while (v29 != v122);
            uint64_t v29 = v122;
            uint64_t v2 = v121;
            uint64_t v17 = v118;
          }
        }
      }
      if (v29 < v18) {
        goto LABEL_134;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v131 = v29;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2145DEB08(0, *(void *)(v17 + 16) + 1, 1, (char *)v17);
        uint64_t v17 = result;
      }
      unint64_t v59 = *(void *)(v17 + 16);
      unint64_t v58 = *(void *)(v17 + 24);
      unint64_t v19 = v59 + 1;
      if (v59 >= v58 >> 1)
      {
        uint64_t result = (uint64_t)sub_2145DEB08((char *)(v58 > 1), v59 + 1, 1, (char *)v17);
        uint64_t v17 = result;
      }
      uint64_t v60 = v2;
      *(void *)(v17 + 16) = v19;
      uint64_t v61 = v17 + 32;
      v62 = (uint64_t *)(v17 + 32 + 16 * v59);
      uint64_t v63 = v131;
      uint64_t *v62 = v18;
      v62[1] = v63;
      if (v59)
      {
        while (1)
        {
          unint64_t v64 = v19 - 1;
          if (v19 >= 4)
          {
            unint64_t v69 = v61 + 16 * v19;
            uint64_t v70 = *(void *)(v69 - 64);
            uint64_t v71 = *(void *)(v69 - 56);
            BOOL v75 = __OFSUB__(v71, v70);
            uint64_t v72 = v71 - v70;
            if (v75) {
              goto LABEL_123;
            }
            uint64_t v74 = *(void *)(v69 - 48);
            uint64_t v73 = *(void *)(v69 - 40);
            BOOL v75 = __OFSUB__(v73, v74);
            uint64_t v67 = v73 - v74;
            char v68 = v75;
            if (v75) {
              goto LABEL_124;
            }
            unint64_t v76 = v19 - 2;
            v77 = (uint64_t *)(v61 + 16 * (v19 - 2));
            uint64_t v79 = *v77;
            uint64_t v78 = v77[1];
            BOOL v75 = __OFSUB__(v78, v79);
            uint64_t v80 = v78 - v79;
            if (v75) {
              goto LABEL_125;
            }
            BOOL v75 = __OFADD__(v67, v80);
            uint64_t v81 = v67 + v80;
            if (v75) {
              goto LABEL_127;
            }
            if (v81 >= v72)
            {
              v99 = (uint64_t *)(v61 + 16 * v64);
              uint64_t v101 = *v99;
              uint64_t v100 = v99[1];
              BOOL v75 = __OFSUB__(v100, v101);
              uint64_t v102 = v100 - v101;
              if (v75) {
                goto LABEL_133;
              }
              BOOL v92 = v67 < v102;
              goto LABEL_94;
            }
          }
          else
          {
            if (v19 != 3)
            {
              uint64_t v93 = *(void *)(v17 + 32);
              uint64_t v94 = *(void *)(v17 + 40);
              BOOL v75 = __OFSUB__(v94, v93);
              uint64_t v86 = v94 - v93;
              char v87 = v75;
              goto LABEL_88;
            }
            uint64_t v66 = *(void *)(v17 + 32);
            uint64_t v65 = *(void *)(v17 + 40);
            BOOL v75 = __OFSUB__(v65, v66);
            uint64_t v67 = v65 - v66;
            char v68 = v75;
          }
          if (v68) {
            goto LABEL_126;
          }
          unint64_t v76 = v19 - 2;
          v82 = (uint64_t *)(v61 + 16 * (v19 - 2));
          uint64_t v84 = *v82;
          uint64_t v83 = v82[1];
          BOOL v85 = __OFSUB__(v83, v84);
          uint64_t v86 = v83 - v84;
          char v87 = v85;
          if (v85) {
            goto LABEL_128;
          }
          v88 = (uint64_t *)(v61 + 16 * v64);
          uint64_t v90 = *v88;
          uint64_t v89 = v88[1];
          BOOL v75 = __OFSUB__(v89, v90);
          uint64_t v91 = v89 - v90;
          if (v75) {
            goto LABEL_130;
          }
          if (__OFADD__(v86, v91)) {
            goto LABEL_132;
          }
          if (v86 + v91 >= v67)
          {
            BOOL v92 = v67 < v91;
LABEL_94:
            if (v92) {
              unint64_t v64 = v76;
            }
            goto LABEL_96;
          }
LABEL_88:
          if (v87) {
            goto LABEL_129;
          }
          v95 = (uint64_t *)(v61 + 16 * v64);
          uint64_t v97 = *v95;
          uint64_t v96 = v95[1];
          BOOL v75 = __OFSUB__(v96, v97);
          uint64_t v98 = v96 - v97;
          if (v75) {
            goto LABEL_131;
          }
          if (v98 < v86) {
            goto LABEL_14;
          }
LABEL_96:
          unint64_t v103 = v64 - 1;
          if (v64 - 1 >= v19)
          {
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
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
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
            goto LABEL_144;
          }
          uint64_t v104 = *a1;
          if (!*a1) {
            goto LABEL_146;
          }
          uint64_t v105 = v17;
          v106 = (uint64_t *)(v61 + 16 * v103);
          uint64_t v107 = *v106;
          v108 = (void *)(v61 + 16 * v64);
          uint64_t v109 = v108[1];
          uint64_t result = sub_2145DE6C0(v104 + *(void *)(v126 + 72) * *v106, v104 + *(void *)(v126 + 72) * *v108, v104 + *(void *)(v126 + 72) * v109, v125);
          if (v60) {
            goto LABEL_117;
          }
          if (v109 < v107) {
            goto LABEL_120;
          }
          if (v64 > *(void *)(v105 + 16)) {
            goto LABEL_121;
          }
          uint64_t *v106 = v107;
          *(void *)(v61 + 16 * v103 + 8) = v109;
          unint64_t v110 = *(void *)(v105 + 16);
          if (v64 >= v110) {
            goto LABEL_122;
          }
          uint64_t v17 = v105;
          unint64_t v19 = v110 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v61 + 16 * v64), v108 + 2, 16 * (v110 - 1 - v64));
          *(void *)(v105 + 16) = v110 - 1;
          a1 = v132;
          if (v110 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v19 = 1;
LABEL_14:
      uint64_t v18 = v131;
      uint64_t v2 = v60;
      uint64_t v12 = a1[1];
      uint64_t v4 = v126;
      if (v131 >= v12) {
        goto LABEL_106;
      }
    }
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  unint64_t v125 = MEMORY[0x263F8EE78]
       + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v119 = MEMORY[0x263F8EE78];
  if (v12 == 1) {
    goto LABEL_12;
  }
  unint64_t v19 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
  uint64_t v111 = v17;
  if (v19 >= 2)
  {
    uint64_t v112 = *a1;
    do
    {
      unint64_t v113 = v19 - 2;
      if (v19 < 2) {
        goto LABEL_135;
      }
      if (!v112) {
        goto LABEL_148;
      }
      uint64_t v114 = *(void *)(v111 + 32 + 16 * v113);
      uint64_t v115 = *(void *)(v111 + 32 + 16 * (v19 - 1) + 8);
      uint64_t result = sub_2145DE6C0(v112 + *(void *)(v126 + 72) * v114, v112 + *(void *)(v126 + 72) * *(void *)(v111 + 32 + 16 * (v19 - 1)), v112 + *(void *)(v126 + 72) * v115, v125);
      if (v2) {
        break;
      }
      if (v115 < v114) {
        goto LABEL_136;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2145DECEC(v111);
        uint64_t v111 = result;
      }
      if (v113 >= *(void *)(v111 + 16)) {
        goto LABEL_137;
      }
      v116 = (void *)(v111 + 32 + 16 * v113);
      void *v116 = v114;
      v116[1] = v115;
      unint64_t v117 = *(void *)(v111 + 16);
      if (v19 > v117) {
        goto LABEL_138;
      }
      uint64_t result = (uint64_t)memmove((void *)(v111 + 32 + 16 * (v19 - 1)), (const void *)(v111 + 32 + 16 * v19), 16 * (v117 - v19));
      *(void *)(v111 + 16) = v117 - 1;
      unint64_t v19 = v117 - 1;
    }
    while (v117 > 2);
  }
LABEL_117:
  swift_bridgeObjectRelease();
  *(void *)(v119 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2145DE440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v27 = a1;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780EE98);
  uint64_t v7 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v29 = (double *)((char *)&v25 - v10);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (double *)((char *)&v25 - v13);
  uint64_t v31 = a3;
  uint64_t v26 = a2;
  if (a3 != a2)
  {
    uint64_t v15 = *(void *)(v12 + 72);
    uint64_t v34 = v15 * (v31 - 1);
    uint64_t v30 = v15;
    uint64_t v33 = v15 * v31;
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v17 = v27;
    while (1)
    {
      uint64_t v18 = *a4;
      sub_2145553A4(v33 + v16 + *a4, (uint64_t)v14, &qword_26780EE98);
      uint64_t v19 = v34 + v16 + v18;
      uint64_t v20 = v29;
      sub_2145553A4(v19, (uint64_t)v29, &qword_26780EE98);
      double v21 = *v14;
      double v22 = *v20;
      sub_2145515B8((uint64_t)v20, &qword_26780EE98);
      uint64_t result = sub_2145515B8((uint64_t)v14, &qword_26780EE98);
      if (v21 >= v22)
      {
LABEL_4:
        v34 += v30;
        v33 += v30;
        if (++v31 == v26) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v23 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v24 = v23 + v34 + v16;
      sub_214566B8C(v23 + v33 + v16, v32, &qword_26780EE98);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_214566B8C(v32, v24, &qword_26780EE98);
      v16 -= v30;
      if (v31 == ++v17) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2145DE6C0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780EE98);
  uint64_t v8 = MEMORY[0x270FA5388](v39);
  uint64_t v10 = (double *)((char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (double *)((char *)&v37 - v12);
  uint64_t v15 = *(void *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_68;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_69;
  }
  uint64_t v17 = (uint64_t)(a2 - a1) / v15;
  unint64_t v42 = a1;
  unint64_t v41 = a4;
  if (v17 >= v16 / v15)
  {
    uint64_t v19 = v16 / v15 * v15;
    if (a4 < a2 || a2 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v28 = a4 + v19;
    unint64_t v40 = a4 + v19;
    unint64_t v42 = a2;
    unint64_t v38 = a1;
    if (v19 >= 1 && a1 < a2)
    {
      uint64_t v30 = -v15;
      do
      {
        unint64_t v31 = a3 + v30;
        sub_2145553A4(v28 + v30, (uint64_t)v13, &qword_26780EE98);
        unint64_t v32 = a2 + v30;
        sub_2145553A4(a2 + v30, (uint64_t)v10, &qword_26780EE98);
        double v33 = *v13;
        double v34 = *v10;
        sub_2145515B8((uint64_t)v10, &qword_26780EE98);
        sub_2145515B8((uint64_t)v13, &qword_26780EE98);
        if (v33 >= v34)
        {
          unint64_t v35 = v40;
          v40 += v30;
          if (a3 < v35 || v31 >= v35)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != v35)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v32 = a2;
        }
        else
        {
          if (a3 < a2 || v31 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != a2)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v42 += v30;
        }
        unint64_t v28 = v40;
        if (v40 <= a4) {
          break;
        }
        a2 = v32;
        a3 += v30;
      }
      while (v32 > v38);
    }
  }
  else
  {
    uint64_t v18 = v17 * v15;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v38 = a4 + v18;
    unint64_t v40 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_2145553A4(a2, (uint64_t)v13, &qword_26780EE98);
        sub_2145553A4(a4, (uint64_t)v10, &qword_26780EE98);
        double v21 = *v13;
        double v22 = *v10;
        sub_2145515B8((uint64_t)v10, &qword_26780EE98);
        sub_2145515B8((uint64_t)v13, &qword_26780EE98);
        unint64_t v23 = v42;
        if (v21 >= v22)
        {
          unint64_t v26 = v41 + v15;
          if (v42 < v41 || v42 >= v26)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v42 != v41)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v41 = v26;
          unint64_t v24 = a2;
        }
        else
        {
          unint64_t v24 = a2 + v15;
          if (v42 < a2 || v42 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v42 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v42 = v23 + v15;
        a4 = v41;
        if (v41 >= v38) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_2145DEC04(&v42, &v41, (uint64_t *)&v40);
  return 1;
}

char *sub_2145DEB08(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780EEE0);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2145DEC04(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26780EE98);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2145DECEC(uint64_t a1)
{
  return sub_2145DEB08(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2145DED00(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = 0x6567616D69;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = 0xE500000000000000;
  switch(*a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000656761;
      uint64_t v3 = 0x6D496D6574737973;
      break;
    case 2:
      unint64_t v6 = 0xEE00726F6C6F4374;
      uint64_t v3 = 0x6E69546567616D69;
      break;
    case 3:
      unint64_t v6 = 0xEA00000000006874;
      uint64_t v3 = 0x6469576567616D69;
      break;
    case 4:
      unint64_t v6 = 0xEB00000000746867;
      uint64_t v3 = 0x6965486567616D69;
      break;
    default:
      break;
  }
  if (v4 == v3 && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_214603898();
  }
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2145DEE38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780EE98);
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v31 - v13;
  uint64_t v15 = *(void *)(a4 + 64);
  uint64_t v36 = a4 + 64;
  uint64_t v16 = -1 << *(unsigned char *)(a4 + 32);
  if (-v16 < 64) {
    uint64_t v17 = ~(-1 << -(char)v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  if (!a2)
  {
    int64_t v19 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v30 = v36;
    *a1 = a4;
    a1[1] = v30;
    a1[2] = ~v16;
    a1[3] = v19;
    a1[4] = v18;
    return a3;
  }
  if (!a3)
  {
    int64_t v19 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v33 = -1 << *(unsigned char *)(a4 + 32);
  double v34 = a1;
  int64_t v19 = 0;
  uint64_t v20 = 0;
  int64_t v35 = (unint64_t)(63 - v16) >> 6;
  int64_t v32 = v35 - 1;
  uint64_t v21 = a3;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v23 = v22 | (v19 << 6);
  while (1)
  {
    ++v20;
    uint64_t v27 = *(void *)(a4 + 56);
    uint64_t v28 = *(void *)(*(void *)(a4 + 48) + 8 * v23);
    uint64_t v29 = sub_2146020B8();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(&v11[*(int *)(v38 + 48)], v27 + *(void *)(*(void *)(v29 - 8) + 72) * v23, v29);
    *(void *)int64_t v11 = v28;
    sub_214566B8C((uint64_t)v11, (uint64_t)v14, &qword_26780EE98);
    uint64_t result = sub_214566B8C((uint64_t)v14, a2, &qword_26780EE98);
    if (v20 == v21)
    {
      a3 = v21;
      goto LABEL_38;
    }
    a2 += *(void *)(v37 + 72);
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v24 >= v35) {
      goto LABEL_33;
    }
    unint64_t v25 = *(void *)(v36 + 8 * v24);
    if (!v25)
    {
      v19 += 2;
      if (v24 + 1 >= v35)
      {
        unint64_t v18 = 0;
        int64_t v19 = v24;
      }
      else
      {
        unint64_t v25 = *(void *)(v36 + 8 * v19);
        if (v25) {
          goto LABEL_14;
        }
        int64_t v26 = v24 + 2;
        if (v24 + 2 >= v35) {
          goto LABEL_33;
        }
        unint64_t v25 = *(void *)(v36 + 8 * v26);
        if (v25)
        {
LABEL_17:
          int64_t v24 = v26;
          goto LABEL_18;
        }
        int64_t v19 = v24 + 3;
        if (v24 + 3 < v35)
        {
          unint64_t v25 = *(void *)(v36 + 8 * v19);
          if (v25)
          {
LABEL_14:
            int64_t v24 = v19;
            goto LABEL_18;
          }
          int64_t v26 = v24 + 4;
          if (v24 + 4 >= v35)
          {
LABEL_33:
            unint64_t v18 = 0;
            goto LABEL_37;
          }
          unint64_t v25 = *(void *)(v36 + 8 * v26);
          if (!v25)
          {
            while (1)
            {
              int64_t v24 = v26 + 1;
              if (__OFADD__(v26, 1)) {
                goto LABEL_42;
              }
              if (v24 >= v35)
              {
                unint64_t v18 = 0;
                int64_t v19 = v32;
                goto LABEL_37;
              }
              unint64_t v25 = *(void *)(v36 + 8 * v24);
              ++v26;
              if (v25) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v18 = 0;
        int64_t v19 = v24 + 2;
      }
LABEL_37:
      a3 = v20;
LABEL_38:
      uint64_t v16 = v33;
      a1 = v34;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v18 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v19 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

size_t sub_2145DF190(void *a1)
{
  return sub_2145DCECC(0, a1[2], 0, a1);
}

uint64_t sub_2145DF1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v47 = a5;
  uint64_t v43 = a3;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v49 = a2;
  uint64_t v50 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v46 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v38 - v12;
  uint64_t v14 = sub_2146032D8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v38 - v19;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v45 = a1;
  unint64_t v41 = v21;
  v21((char *)v38 - v19, a1, v14);
  uint64_t v22 = *(void *)(a4 - 8);
  unint64_t v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  int v23 = v40(v20, 1, a4);
  v38[0] = v22;
  v38[1] = a6;
  uint64_t v44 = v15;
  if (v23 == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
    uint64_t v48 = 0;
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v48 = sub_214603AF8();
    unint64_t v25 = v20;
    uint64_t v24 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, a4);
  }
  uint64_t v27 = v50;
  uint64_t v28 = v13;
  uint64_t v29 = v13;
  uint64_t v30 = v43;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  v39(v29, v49, v43);
  if (!v24)
  {
    uint64_t v48 = sub_214603AF8();
    uint64_t v24 = v31;
  }
  uint64_t v42 = v24;
  uint64_t v32 = v27 + 8;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v50 = v32;
  v33(v28, v30);
  v41(v18, v45, v14);
  if (v40(v18, 1, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v18, v14);
    double v34 = v46;
    v39(v46, v49, v30);
LABEL_9:
    sub_214603B18();
    goto LABEL_10;
  }
  sub_214603B18();
  char v36 = v35;
  (*(void (**)(char *, uint64_t))(v38[0] + 8))(v18, a4);
  double v34 = v46;
  v39(v46, v49, v30);
  if (v36) {
    goto LABEL_9;
  }
LABEL_10:
  v33(v34, v30);
  return v48;
}

uint64_t type metadata accessor for RUIImage.Keys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2145DF5A8()
{
  unint64_t v0 = sub_214603688();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_2145DF5F4()
{
  unint64_t result = qword_26780EE78;
  if (!qword_26780EE78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780EE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EE78);
  }
  return result;
}

unint64_t sub_2145DF650()
{
  unint64_t result = qword_26780EE80;
  if (!qword_26780EE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EE80);
  }
  return result;
}

uint64_t sub_2145DF6A4(uint64_t a1)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  char v12 = 0;
  unint64_t v7 = sub_21459C358();
  if (v6 == sub_2145DF1A4(v4, (uint64_t)&v12, (uint64_t)&type metadata for RUIImage.DefaultCodingKeys, v2, v7, v3)
    && v5 == v8)
  {
    char v10 = 1;
  }
  else
  {
    char v10 = sub_214603898();
  }
  swift_bridgeObjectRelease();
  return v10 & 1;
}

unint64_t sub_2145DF758()
{
  unint64_t result = qword_26780EE88;
  if (!qword_26780EE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EE88);
  }
  return result;
}

uint64_t sub_2145DF7AC(uint64_t a1)
{
  return a1;
}

void sub_2145DF7D8(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2146032B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_214601EB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone(MEMORY[0x263F08B08]);
  uint64_t v11 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithString_, v11);

  sub_214601E98();
  uint64_t v13 = sub_2146032A8();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!v15)
  {

    uint64_t v16 = 0;
    uint64_t v13 = 0;
LABEL_12:
    char v22 = 0;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  if (objc_msgSend(v12, sel_isAtEnd))
  {
    uint64_t v16 = 1;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07D68], v2);
    uint64_t v16 = sub_2146032C8();
    char v18 = v17;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((v18 & 1) != 0 || (sub_214603298(), uint64_t v20 = v19, swift_bridgeObjectRelease(), !v20))
    {
      swift_bridgeObjectRelease_n();

LABEL_11:
      uint64_t v16 = 0;
      uint64_t v13 = 0;
      uint64_t v15 = 0;
      goto LABEL_12;
    }
  }
  unsigned __int8 v21 = objc_msgSend(v12, sel_isAtEnd);
  swift_bridgeObjectRelease();

  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  char v22 = 1;
LABEL_13:
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v13;
  *(void *)(a1 + 16) = v15;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = v22;
}

uint64_t sub_2145DFA90()
{
  return swift_getWitnessTable();
}

uint64_t sub_2145DFAAC()
{
  return swift_getWitnessTable();
}

unint64_t sub_2145DFACC()
{
  unint64_t result = qword_26780EEB0;
  if (!qword_26780EEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EEB0);
  }
  return result;
}

unint64_t sub_2145DFB24()
{
  unint64_t result = qword_26780EEB8;
  if (!qword_26780EEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EEB8);
  }
  return result;
}

unint64_t sub_2145DFB7C()
{
  unint64_t result = qword_26780EEC0;
  if (!qword_26780EEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EEC0);
  }
  return result;
}

unint64_t sub_2145DFBD4()
{
  unint64_t result = qword_26780EEC8;
  if (!qword_26780EEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EEC8);
  }
  return result;
}

unint64_t sub_2145DFC2C()
{
  unint64_t result = qword_26780EED0;
  if (!qword_26780EED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EED0);
  }
  return result;
}

uint64_t _s8RemoteUI3BoxCMa_0()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t destroy for RUIImage(uint64_t a1)
{
  sub_21455E56C();

  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for RUIImage(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_21455E4A0();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = (void *)a2[3];
  uint64_t v8 = a2[4];
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = a2[5];
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(void *)(a1 + 56) = a2[7];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 72) = a2[9];
  id v9 = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RUIImage(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_21455E4A0();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_21455E56C();
  uint64_t v7 = *(void **)(a1 + 24);
  uint64_t v8 = (void *)a2[3];
  *(void *)(a1 + 24) = v8;
  id v9 = v8;

  *(void *)(a1 + 32) = a2[4];
  swift_retain();
  swift_release();
  uint64_t v10 = a2[5];
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(void *)(a1 + 40) = v10;
  LOBYTE(v10) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 56) = a2[7];
  *(unsigned char *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for RUIImage(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_21455E56C();

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RUIImage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RUIImage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RUIImage()
{
  return &type metadata for RUIImage;
}

uint64_t type metadata accessor for RUIImage.RawKey()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2145DFFC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_2145DFFC8()
{
  uint64_t result = sub_2146032D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2145E0060(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  size_t v10 = v7 + v8;
  if (v8 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & ~v8) + v7 > 0x18)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    uint64_t v14 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48);
    if (v14(a2, 1, v5))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    uint64_t v15 = (void *)(((unint64_t)a2 + v10) & v9);
    if (v14(v15, 1, v5))
    {
      memcpy((void *)(((unint64_t)a1 + v10) & v9), v15, v7);
    }
    else
    {
      (*(void (**)(unint64_t, void *, uint64_t))(v6 + 16))(((unint64_t)a1 + v10) & v9, v15, v5);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v6 + 56))(((unint64_t)a1 + v10) & v9, 0, 1, v5);
    }
    uint64_t v16 = (void *)((v10 + (((unint64_t)a1 + v10) & v9)) & v9);
    char v17 = (void *)(((unint64_t)v15 + v10) & v9);
    if (v14(v17, 1, v5))
    {
      memcpy(v16, v17, v7);
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v16, v17, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v5);
    }
    char v18 = (void *)(((unint64_t)v16 + v10) & v9);
    uint64_t v19 = (void *)(((unint64_t)v17 + v10) & v9);
    if (v14(v19, 1, v5))
    {
      memcpy(v18, v19, v7);
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v18, v19, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v18, 0, 1, v5);
    }
    uint64_t v20 = (void *)(((unint64_t)v18 + v10) & v9);
    unsigned __int8 v21 = (void *)(((unint64_t)v19 + v10) & v9);
    if (v14(v21, 1, v5))
    {
      memcpy(v20, v21, v7);
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v20, v21, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v20, 0, 1, v5);
    }
  }
  return a1;
}

uint64_t sub_2145E03E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v15 = *(void *)(v3 - 8);
  char v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  if (!v4(a1, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v3);
  }
  if (*(_DWORD *)(v15 + 84)) {
    uint64_t v5 = *(void *)(v15 + 64);
  }
  else {
    uint64_t v5 = *(void *)(v15 + 64) + 1;
  }
  uint64_t v6 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v7 = v5 + v6;
  uint64_t v8 = ~v6;
  uint64_t v9 = (v5 + v6 + a1) & ~v6;
  if (!v4(v9, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v9, v3);
  }
  uint64_t v10 = (v7 + v9) & v8;
  if (!v4(v10, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v10, v3);
  }
  uint64_t v11 = (v7 + v10) & v8;
  if (!v4(v11, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v11, v3);
  }
  uint64_t v12 = (v7 + v11) & v8;
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v4)(v12, 1, v3);
  if (!result)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    return v14(v12, v3);
  }
  return result;
}

void *sub_2145E05E0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  if (v7(a2, 1, v5))
  {
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
    if (v8) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = v9 + 1;
    }
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
  }
  if (v8) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v9 + 1;
  }
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  size_t v13 = v11 + v12;
  uint64_t v14 = ~v12;
  uint64_t v15 = (void *)(((unint64_t)a1 + v11 + v12) & ~v12);
  uint64_t v16 = (const void *)(((unint64_t)a2 + v11 + v12) & ~v12);
  if (v7(v16, 1, v5))
  {
    memcpy(v15, v16, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v15, v16, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v5);
  }
  char v17 = (void *)(((unint64_t)v15 + v13) & v14);
  char v18 = (const void *)(((unint64_t)v16 + v13) & v14);
  if (v7(v18, 1, v5))
  {
    memcpy(v17, v18, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v17, v18, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
  }
  uint64_t v19 = (void *)(((unint64_t)v17 + v13) & v14);
  uint64_t v20 = (const void *)(((unint64_t)v18 + v13) & v14);
  if (v7(v20, 1, v5))
  {
    memcpy(v19, v20, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v19, v20, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  }
  unsigned __int8 v21 = (void *)(((unint64_t)v19 + v13) & v14);
  char v22 = (const void *)(((unint64_t)v20 + v13) & v14);
  if (v7(v22, 1, v5))
  {
    memcpy(v21, v22, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v21, v22, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v21, 0, 1, v5);
  }
  return a1;
}

void *sub_2145E091C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    size_t v13 = *(void *)(v6 + 64);
  }
  else {
    size_t v13 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v14 = *(unsigned __int8 *)(v6 + 80);
  size_t v15 = v13 + v14;
  double v34 = a1;
  uint64_t v16 = ~v14;
  char v17 = (void *)(((unint64_t)a1 + v13 + v14) & ~v14);
  char v18 = (void *)(((unint64_t)a2 + v13 + v14) & ~v14);
  int v19 = v7(v17, 1, v5);
  int v20 = v7(v18, 1, v5);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v17, v18, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v17, v5);
LABEL_20:
    memcpy(v17, v18, v13);
    goto LABEL_21;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 24))(v17, v18, v5);
LABEL_21:
  unsigned __int8 v21 = (void *)(((unint64_t)v17 + v15) & v16);
  char v22 = (void *)(((unint64_t)v18 + v15) & v16);
  int v23 = v7(v21, 1, v5);
  int v24 = v7(v22, 1, v5);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v21, v22, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v21, 0, 1, v5);
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v21, v5);
LABEL_26:
    memcpy(v21, v22, v13);
    goto LABEL_27;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 24))(v21, v22, v5);
LABEL_27:
  unint64_t v25 = (void *)(((unint64_t)v21 + v15) & v16);
  uint64_t v26 = (void *)(((unint64_t)v22 + v15) & v16);
  int v27 = v7(v25, 1, v5);
  int v28 = v7(v26, 1, v5);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v25, v26, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v25, 0, 1, v5);
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v25, v5);
LABEL_32:
    memcpy(v25, v26, v13);
    goto LABEL_33;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 24))(v25, v26, v5);
LABEL_33:
  uint64_t v29 = (void *)(((unint64_t)v25 + v15) & v16);
  uint64_t v30 = (void *)(((unint64_t)v26 + v15) & v16);
  int v31 = v7(v29, 1, v5);
  int v32 = v7(v30, 1, v5);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(v29, v30, v5);
      return v34;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(v29, v5);
    goto LABEL_38;
  }
  if (v32)
  {
LABEL_38:
    memcpy(v29, v30, v13);
    return v34;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v29, v30, v5);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v29, 0, 1, v5);
  return v34;
}

void *sub_2145E0E4C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  if (v7(a2, 1, v5))
  {
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
    if (v8) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = v9 + 1;
    }
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
  }
  if (v8) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v9 + 1;
  }
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  size_t v13 = v11 + v12;
  uint64_t v14 = ~v12;
  size_t v15 = (void *)(((unint64_t)a1 + v11 + v12) & ~v12);
  uint64_t v16 = (const void *)(((unint64_t)a2 + v11 + v12) & ~v12);
  if (v7(v16, 1, v5))
  {
    memcpy(v15, v16, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v15, v16, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v5);
  }
  char v17 = (void *)(((unint64_t)v15 + v13) & v14);
  char v18 = (const void *)(((unint64_t)v16 + v13) & v14);
  if (v7(v18, 1, v5))
  {
    memcpy(v17, v18, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v17, v18, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
  }
  int v19 = (void *)(((unint64_t)v17 + v13) & v14);
  int v20 = (const void *)(((unint64_t)v18 + v13) & v14);
  if (v7(v20, 1, v5))
  {
    memcpy(v19, v20, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v19, v20, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  }
  unsigned __int8 v21 = (void *)(((unint64_t)v19 + v13) & v14);
  char v22 = (const void *)(((unint64_t)v20 + v13) & v14);
  if (v7(v22, 1, v5))
  {
    memcpy(v21, v22, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v21, v22, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v21, 0, 1, v5);
  }
  return a1;
}

void *sub_2145E1188(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    size_t v13 = *(void *)(v6 + 64);
  }
  else {
    size_t v13 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v14 = *(unsigned __int8 *)(v6 + 80);
  size_t v15 = v13 + v14;
  double v34 = a1;
  uint64_t v16 = ~v14;
  char v17 = (void *)(((unint64_t)a1 + v13 + v14) & ~v14);
  char v18 = (void *)(((unint64_t)a2 + v13 + v14) & ~v14);
  int v19 = v7(v17, 1, v5);
  int v20 = v7(v18, 1, v5);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v17, v18, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v17, v5);
LABEL_20:
    memcpy(v17, v18, v13);
    goto LABEL_21;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 40))(v17, v18, v5);
LABEL_21:
  unsigned __int8 v21 = (void *)(((unint64_t)v17 + v15) & v16);
  char v22 = (void *)(((unint64_t)v18 + v15) & v16);
  int v23 = v7(v21, 1, v5);
  int v24 = v7(v22, 1, v5);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v21, v22, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v21, 0, 1, v5);
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v21, v5);
LABEL_26:
    memcpy(v21, v22, v13);
    goto LABEL_27;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 40))(v21, v22, v5);
LABEL_27:
  unint64_t v25 = (void *)(((unint64_t)v21 + v15) & v16);
  uint64_t v26 = (void *)(((unint64_t)v22 + v15) & v16);
  int v27 = v7(v25, 1, v5);
  int v28 = v7(v26, 1, v5);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v25, v26, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v25, 0, 1, v5);
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v6 + 8))(v25, v5);
LABEL_32:
    memcpy(v25, v26, v13);
    goto LABEL_33;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 40))(v25, v26, v5);
LABEL_33:
  uint64_t v29 = (void *)(((unint64_t)v25 + v15) & v16);
  uint64_t v30 = (void *)(((unint64_t)v26 + v15) & v16);
  int v31 = v7(v29, 1, v5);
  int v32 = v7(v30, 1, v5);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(v29, v30, v5);
      return v34;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(v29, v5);
    goto LABEL_38;
  }
  if (v32)
  {
LABEL_38:
    memcpy(v29, v30, v13);
    return v34;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v29, v30, v5);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v29, 0, 1, v5);
  return v34;
}

uint64_t sub_2145E16B8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v10 = ((v7 + v9 + ((v7 + v9 + ((v7 + v9 + ((v7 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9) + v7;
    char v11 = 8 * v10;
    if (v10 > 3) {
      goto LABEL_8;
    }
    unsigned int v13 = ((v8 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (v12) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v13 <= 0xFF)
      {
        if (v13 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v12 = *((unsigned __int8 *)a1 + v10);
        if (!*((unsigned char *)a1 + v10)) {
          goto LABEL_23;
        }
LABEL_15:
        int v14 = (v12 - 1) << v11;
        if (v10 > 3) {
          int v14 = 0;
        }
        if (v10)
        {
          if (v10 > 3) {
            LODWORD(v10) = 4;
          }
          switch((int)v10)
          {
            case 2:
              LODWORD(v10) = *a1;
              break;
            case 3:
              LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v10) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v10) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v10 | v14) + 1;
      }
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_2145E1878(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v10;
  }
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  size_t v12 = ((v10 + v11 + ((v10 + v11 + ((v10 + v11 + ((v10 + v11) & ~v11)) & ~v11)) & ~v11)) & ~v11) + v10;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 == 0 || !v13)
  {
LABEL_14:
    if (v9 < a2) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  if (v12 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  unsigned int v15 = ((v14 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
  if (!HIWORD(v15))
  {
    if (v15 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v15 > 1;
    }
    goto LABEL_14;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_15:
    unsigned int v16 = ~v9 + a2;
    if (v12 < 4)
    {
      int v17 = (v16 >> (8 * v12)) + 1;
      if (v12)
      {
        int v18 = v16 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if (v12 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v12 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v12);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v12] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v17;
        return;
      case 3:
        goto LABEL_40;
      case 4:
        *(_DWORD *)&a1[v12] = v17;
        return;
      default:
        return;
    }
  }
LABEL_22:
  switch(v6)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_40:
      __break(1u);
      JUMPOUT(0x2145E1ADCLL);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v8 >= 2)
        {
          int v19 = *(void (**)(void))(v7 + 56);
          v19();
        }
      }
      return;
  }
}

uint64_t destroy for RUIImage.ImageType()
{
  return sub_21455E56C();
}

uint64_t _s8RemoteUI8RUIImageV9ImageTypeOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_21455E4A0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RUIImage.ImageType(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_21455E4A0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_21455E56C();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RUIImage.ImageType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_21455E56C();
  return a1;
}

uint64_t getEnumTagSinglePayload for RUIImage.ImageType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RUIImage.ImageType(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2145E1CA4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2145E1CAC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RUIImage.ImageType()
{
  return &type metadata for RUIImage.ImageType;
}

uint64_t getEnumTagSinglePayload for RUIImage.DefaultCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RUIImage.DefaultCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x2145E1E24);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RUIImage.DefaultCodingKeys()
{
  return &type metadata for RUIImage.DefaultCodingKeys;
}

uint64_t destroy for RUIImage.ImageURLCodingKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RUIImage.ImageURLCodingKey(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RUIImage.ImageURLCodingKey(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  return a1;
}

uint64_t assignWithTake for RUIImage.ImageURLCodingKey(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for RUIImage.ImageURLCodingKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RUIImage.ImageURLCodingKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RUIImage.ImageURLCodingKey()
{
  return &type metadata for RUIImage.ImageURLCodingKey;
}

uint64_t sub_2145E1FF8(uint64_t a1)
{
  return sub_2145DED00(a1, *(unsigned char **)(v1 + 16)) & 1;
}

id RUIXMLElement.traverse(withDelegate:)(void *a1)
{
  uint64_t v3 = sub_214602EF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_traversalDelegateDidStartElement_, v1);
  id v7 = objc_msgSend(v1, sel_stringValue);
  if (v7)
  {
    int v8 = v7;
    sub_214602EA8();

    sub_214602ED8();
    uint64_t v9 = sub_214602EB8();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v11 >> 60 != 15)
    {
      size_t v12 = (void *)sub_2146020D8();
      objc_msgSend(a1, sel_traversalDelegateFoundCData_, v12);

      sub_214556AE0(v9, v11);
    }
  }
  id v13 = objc_msgSend(v1, sel_children);
  type metadata accessor for RUIXMLElement((uint64_t)v13);
  unint64_t v14 = sub_214603058();

  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_6;
    }
LABEL_13:
    swift_bridgeObjectRelease_n();
    return objc_msgSend(a1, sel_traversalDelegateDidEndlement_, v1);
  }
  swift_bridgeObjectRetain();
  id result = (id)sub_214603618();
  uint64_t v15 = (uint64_t)result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_6:
  if (v15 >= 1)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v18 = (id)MEMORY[0x2166A3B40](i, v14);
      }
      else {
        id v18 = *(id *)(v14 + 8 * i + 32);
      }
      int v19 = v18;
      objc_msgSend(v18, sel_traverseWithDelegate_, a1);
    }
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RUIXMLElement(uint64_t a1)
{
  return sub_214586198(a1, &qword_2678189B8);
}

id _RUIXMLNamespace.init()()
{
  v1.super_class = (Class)_RUIXMLNamespace;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t RUIXMLElement.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___RUIXMLElement_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RUIXMLElement.attributtes.getter()
{
  return sub_2145E3228();
}

uint64_t RUIXMLElement.attributtes.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___RUIXMLElement_attributtes);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

void sub_2145E256C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_attributtes);
  uint64_t v4 = sub_214602E08();

  *a2 = v4;
}

void sub_2145E25D4(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  id v3 = (id)sub_214602DF8();
  objc_msgSend(v2, sel_setAttributtes_, v3);
}

void RUIXMLElement.parent.getter()
{
}

uint64_t RUIXMLElement.stringValue.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___RUIXMLElement_stringValue);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t RUIXMLElement.stringValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___RUIXMLElement_stringValue);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_2145E2848(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_stringValue);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_214602EA8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_2145E28B0(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_214602E78();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setStringValue_);
}

uint64_t RUIXMLElement.children.getter()
{
  return sub_2145E3228();
}

void __swiftcall RUIXMLElement.init(name:)(RUIXMLElement *__return_ptr retstr, Swift::String name)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithName_, v3);
}

id RUIXMLElement.init(name:)()
{
  uint64_t v1 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  sub_2145CEECC(MEMORY[0x263F8EE78]);
  id v2 = (void *)sub_214602DF8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_initWithName_attributes_, v1, v2);

  return v3;
}

void __swiftcall RUIXMLElement.init(name:attributes:)(RUIXMLElement *__return_ptr retstr, Swift::String name, Swift::OpaquePointer attributes)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_214602DF8();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_initWithName_attributes_, v4, v5);
}

id RUIXMLElement.init(name:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = &v3[OBJC_IVAR___RUIXMLElement_stringValue];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___RUIXMLElement_mutableChildren] = MEMORY[0x263F8EE78];
  swift_unknownObjectWeakInit();
  int v8 = &v3[OBJC_IVAR___RUIXMLElement_name];
  *(void *)int v8 = a1;
  *((void *)v8 + 1) = a2;
  *(void *)&v3[OBJC_IVAR___RUIXMLElement_attributtes] = a3;
  v10.receiver = v3;
  v10.super_class = (Class)RUIXMLElement;
  return objc_msgSendSuper2(&v10, sel_init);
}

Swift::Void __swiftcall RUIXMLElement.appendChildren(_:)(Swift::OpaquePointer a1)
{
  id v2 = v1;
  if ((unint64_t)a1._rawValue >> 62)
  {
    id v9 = v1;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_214603618();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v5 = v2;
    swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if (((unint64_t)a1._rawValue & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x2166A3B40](i, a1._rawValue);
    }
    else {
      id v7 = *((id *)a1._rawValue + i + 4);
    }
    int v8 = v7;
    objc_msgSend(v10, sel_appendChild_, v7);
  }
LABEL_10:
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall RUIXMLElement.appendChild(_:)(RUIXMLElement *a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___RUIXMLElement_mutableChildren);
  swift_beginAccess();
  uint64_t v4 = a1;
  MEMORY[0x2166A36A0]();
  if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_214603088();
  }
  sub_2146030B8();
  sub_214603068();
  swift_endAccess();
  swift_unknownObjectWeakAssign();
}

void RUIXMLElement.init()()
{
}

void *RUIXMLParserDelegate.xmlElement.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___RUIXMLParserDelegate__xmlElement);
  id v2 = v1;
  return v1;
}

uint64_t RUIXMLParserDelegate.stack.getter()
{
  return sub_2145E3228();
}

uint64_t sub_2145E3228()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall RUIXMLParserDelegate.init(root:)(RUIXMLParserDelegate *__return_ptr retstr, RUIXMLElement_optional *root)
{
}

id RUIXMLParserDelegate.init(root:)(void *a1)
{
  id v2 = sub_2145E7018(a1);

  return v2;
}

id _sSo16_RUIXMLNamespaceC8RemoteUIEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

id RUIXMLParserDelegate.init()()
{
  return objc_msgSend(v0, sel_initWithRoot_, 0);
}

Swift::Void __swiftcall RUIXMLParserDelegate.parser(_:didStartElement:namespaceURI:qualifiedName:attributes:)(NSXMLParser _, Swift::String didStartElement, Swift::String_optional namespaceURI, Swift::String_optional qualifiedName, Swift::OpaquePointer attributes)
{
}

void RUIXMLParserDelegate.parser(_:foundCDATA:)()
{
}

Swift::Void __swiftcall RUIXMLParserDelegate.parser(_:foundCharacters:)(NSXMLParser _, Swift::String foundCharacters)
{
}

Swift::Void __swiftcall RUIXMLParserDelegate.parser(_:didEndElement:namespaceURI:qualifiedName:)(NSXMLParser _, Swift::String didEndElement, Swift::String_optional namespaceURI, Swift::String_optional qualifiedName)
{
}

uint64_t RUIXMLSanitizer.Options.rawValue.getter()
{
  return *(void *)v0;
}

RemoteUI::RUIXMLSanitizer::Options __swiftcall RUIXMLSanitizer.Options.init(rawValue:)(RemoteUI::RUIXMLSanitizer::Options rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static RUIXMLSanitizer.Options.moveTableViewToMultiChoiceView.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static RUIXMLSanitizer.Options.moveWebViewToMultiChoiceView.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static RUIXMLSanitizer.Options.movePinViewToMultiChoiceView.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void sub_2145E3704()
{
  qword_2678185A8 = 1;
}

uint64_t sub_2145E3714@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    id v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t static RUIXMLSanitizer.Options.all.getter@<X0>(void *a1@<X8>)
{
  if (qword_2678185A0 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = qword_2678185A8;
  return result;
}

void static RUIXMLSanitizer.Options.default.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2145E37D0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_2145E37DC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_2145E37F0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_2145E3804@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2145E3818(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2145E3848@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2145E3874@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2145E3898(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2145E38AC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2145E38C0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2145E38D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2145E38E8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2145E38FC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_2145E3910(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2145E3924()
{
  return *v0 == 0;
}

uint64_t sub_2145E3934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2145E394C(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_2145E3964@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___RUIXMLSanitizer_options);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_2145E39B4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___RUIXMLSanitizer_options);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t (*sub_2145E3A08())()
{
  return j__swift_endAccess;
}

id RUIXMLSanitizer.__allocating_init(options:)(void *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___RUIXMLSanitizer_options] = *a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id RUIXMLSanitizer.init(options:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___RUIXMLSanitizer_options] = *a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for RUIXMLSanitizer();
  return objc_msgSendSuper2(&v3, sel_init);
}

id RUIXMLSanitizer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t RUIXMLSanitizer.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = 0;
  uint64_t v1 = (*(uint64_t (**)(uint64_t *))(ObjectType + 112))(&v3);
  swift_deallocPartialClassInstance();
  return v1;
}

void *sub_2145E3C14(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_214602EF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_allocWithZone(MEMORY[0x263F08D58]);
  sub_214556110(a1, a2);
  id v10 = (void *)sub_2146020D8();
  id v11 = objc_msgSend(v9, sel_initWithData_, v10);
  sub_214556AF4(a1, a2);

  id v12 = objc_msgSend(objc_allocWithZone((Class)RUIXMLParserDelegate), sel_init);
  objc_msgSend(v11, sel_setDelegate_, v12);
  objc_msgSend(v11, sel_parse);
  if (objc_msgSend(v11, sel_parserError)) {
    goto LABEL_2;
  }
  id v14 = objc_msgSend(v12, sel_xmlElement);
  if (!v14)
  {
    sub_2145E7910();
    swift_allocError();
    *unsigned __int8 v21 = 0;
LABEL_2:
    swift_willThrow();

    return v2;
  }
  uint64_t v15 = v14;

  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x263F8EED0] & *v2) + 0x58))(&v23);
  id v16 = sub_2145E4700(&v23);
  id v17 = objc_msgSend(v16, sel_xmlString);

  sub_214602EA8();
  sub_214602ED8();
  uint64_t v2 = (void *)sub_214602EB8();
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v19 >> 60 == 15)
  {
    sub_2145E7910();
    swift_allocError();
    *uint64_t v20 = 1;
    swift_willThrow();
  }

  return v2;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Data.xmlElement()(RUIXMLElement *__return_ptr retstr)
{
  unint64_t v3 = v2;
  uint64_t v4 = v1;
  id v5 = objc_allocWithZone(MEMORY[0x263F08D58]);
  sub_214556110(v4, v3);
  uint64_t v6 = (void *)sub_2146020D8();
  id v7 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_214556AF4(v4, v3);

  id v8 = objc_msgSend(objc_allocWithZone((Class)RUIXMLParserDelegate), sel_init);
  objc_msgSend(v7, sel_setDelegate_, v8);
  objc_msgSend(v7, sel_parse);
  if (objc_msgSend(v7, sel_parserError)) {
    goto LABEL_2;
  }
  if (!objc_msgSend(v8, sel_xmlElement))
  {
    sub_2145E7910();
    swift_allocError();
    *id v9 = 0;
LABEL_2:
    swift_willThrow();

    return;
  }
}

uint64_t sub_2145E416C()
{
  uint64_t v1 = sub_214602EF8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t *__return_ptr, uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x58))(&v14, v3);
  id v6 = sub_2145E4700(&v14);
  id v7 = objc_msgSend(v6, sel_xmlString);

  sub_214602EA8();
  sub_214602ED8();
  uint64_t v8 = sub_214602EB8();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  if (v10 >> 60 == 15)
  {
    sub_2145E7910();
    swift_allocError();
    *id v11 = 1;
    swift_willThrow();
  }
  return v8;
}

uint64_t sub_2145E4404(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v3;
  id v7 = objc_allocWithZone(MEMORY[0x263F08D58]);
  sub_214556110(a1, a2);
  uint64_t v8 = (void *)sub_2146020D8();
  id v9 = objc_msgSend(v7, sel_initWithData_, v8);
  sub_214556AF4(a1, a2);

  id v10 = objc_msgSend(objc_allocWithZone((Class)RUIXMLParserDelegate), sel_init);
  objc_msgSend(v9, sel_setDelegate_, v10);
  objc_msgSend(v9, sel_parse);
  if (!objc_msgSend(v9, sel_parserError))
  {
    id v12 = objc_msgSend(v10, sel_xmlElement);
    if (v12)
    {
      uint64_t v13 = v12;

      uint64_t v4 = (*(uint64_t (**)(void *))((*MEMORY[0x263F8EED0] & *v2) + 0x90))(v13);
      return v4;
    }
    sub_2145E7910();
    swift_allocError();
    *uint64_t v14 = 0;
  }
  swift_willThrow();

  return v4;
}

id sub_2145E468C()
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x58))(&v2);
  return sub_2145E4700(&v2);
}

id sub_2145E4700(uint64_t *a1)
{
  uint64_t v2 = *a1;
  id v3 = objc_msgSend(v1, sel_name);
  sub_214602EA8();

  uint64_t v4 = sub_214602F18();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v4 == 0x69756C6D78 && v6 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    id v10 = (void *)sub_2145E4CE0();
    uint64_t v11 = sub_2145BD22C((uint64_t)&unk_26C543C40);
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780E070);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214616D50;
    id v13 = objc_msgSend(v10, sel_name);
    uint64_t v14 = sub_214602EA8();
    uint64_t v16 = v15;

    *(void *)(inited + 32) = v14;
    *(void *)(inited + 40) = v16;
    uint64_t v17 = sub_2145BD22C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    unint64_t v18 = MEMORY[0x263F8EE78];
    unint64_t v36 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2145E7964(&v36, 0x7FFFFFFFFFFFFFFFLL, v10, v11, v17);
    swift_bridgeObjectRelease();
    uint64_t v19 = swift_bridgeObjectRelease();
    type metadata accessor for RUIXMLElement(v19);
    uint64_t v20 = (void *)sub_214603048();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_appendChildren_, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    unint64_t v36 = v18;
    id v21 = v10;
    sub_2145E7D84(&v36, 1, v21, v21);

    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_214603618();
      swift_bridgeObjectRelease();
      if (v26) {
        goto LABEL_12;
      }
    }
    else if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_12:
      id v22 = objc_allocWithZone((Class)RUIXMLElement);
      uint64_t v23 = (void *)sub_214602E78();
      id v24 = objc_msgSend(v22, sel_initWithName_, v23);

      unint64_t v25 = (void *)sub_214603048();
      swift_bridgeObjectRelease();
      objc_msgSend(v24, sel_appendChildren_, v25);

      objc_msgSend(v21, sel_appendChild_, v24);
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
LABEL_15:
    id v27 = objc_msgSend(v21, sel_children);
    unint64_t v28 = sub_214603058();

    id v29 = v21;
    unint64_t v30 = sub_2145E81C4(v28);

    swift_bridgeObjectRelease();
    if (v30 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_214603618();
      uint64_t v31 = (uint64_t)result;
      if (result) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v31)
      {
LABEL_17:
        if (v31 < 1)
        {
          __break(1u);
          return result;
        }
        for (uint64_t i = 0; v31 != i; ++i)
        {
          if ((v30 & 0xC000000000000001) != 0) {
            id v33 = (id)MEMORY[0x2166A3B40](i, v30);
          }
          else {
            id v33 = *(id *)(v30 + 8 * i + 32);
          }
          double v34 = v33;
          sub_2145E5530();
          if (v2)
          {
            sub_2145E5104(0x656956656C626174, 0xE900000000000077);
            if ((v2 & 4) == 0)
            {
LABEL_25:
              if ((v2 & 2) != 0) {
                goto LABEL_29;
              }
              goto LABEL_19;
            }
          }
          else if ((v2 & 4) == 0)
          {
            goto LABEL_25;
          }
          sub_2145E5104(0x776569566E6970, 0xE700000000000000);
          if ((v2 & 2) != 0) {
LABEL_29:
          }
            sub_2145E5104(1819112552, 0xE400000000000000);
LABEL_19:
        }
      }
    }
    swift_bridgeObjectRelease_n();
    return v29;
  }
  char v8 = sub_214603898();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_10;
  }
  return v35;
}

void *sub_2145E4BA8(uint64_t a1, uint64_t a2)
{
  return sub_2145E93A0(a1, a2);
}

uint64_t RUIXMLElement.xmlLogString.getter()
{
  return sub_2145E6058(v0);
}

id RUIXMLSanitizer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RUIXMLSanitizer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2145E4CE0()
{
  id v1 = objc_msgSend(v0, sel_name);
  sub_214602EA8();

  id v2 = objc_msgSend(v0, sel_attributtes);
  sub_214602E08();

  id v3 = objc_allocWithZone((Class)RUIXMLElement);
  uint64_t v4 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_214602DF8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithName_attributes_, v4, v5);

  id v7 = objc_msgSend(v0, sel_stringValue);
  objc_msgSend(v6, sel_setStringValue_, v7);

  id v8 = objc_msgSend(v0, sel_children);
  type metadata accessor for RUIXMLElement((uint64_t)v8);
  unint64_t v9 = sub_214603058();

  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_214603048();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_appendChildren_, v15);

    return (uint64_t)v6;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_214603618();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t result = sub_214603548();
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v12 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x2166A3B40](v12, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * v12 + 32);
      }
      uint64_t v14 = v13;
      ++v12;
      sub_2145E4CE0();

      sub_214603528();
      sub_214603558();
      sub_214603568();
      sub_214603538();
    }
    while (v10 != v12);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

char *sub_2145E4F9C(unint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v4) {
      return (char *)v5;
    }
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t result = sub_214582720(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0) {
      break;
    }
    uint64_t v7 = 0;
    uint64_t v5 = v17;
    while (v4 != v7)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x2166A3B40](v7, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v7 + 32);
      }
      unint64_t v9 = v8;
      uint64_t v10 = a3();
      uint64_t v12 = v11;

      unint64_t v14 = *(void *)(v17 + 16);
      unint64_t v13 = *(void *)(v17 + 24);
      if (v14 >= v13 >> 1) {
        sub_214582720((char *)(v13 > 1), v14 + 1, 1);
      }
      ++v7;
      *(void *)(v17 + 16) = v14 + 1;
      uint64_t v15 = v17 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
      if (v4 == v7) {
        return (char *)v5;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_2145E5104(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_children);
  type metadata accessor for RUIXMLElement((uint64_t)v5);
  unint64_t v6 = sub_214603058();

  if (v6 >> 62)
  {
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_214603618();
    if (v7) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    return;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  int v32 = v2;
  a2 = 0x6F684369746C756DLL;
  a1 = 4;
  id v2 = &selRef_hasImage;
  while (1)
  {
    uint64_t v8 = a1 - 4;
    if ((v6 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x2166A3B40](a1 - 4, v6);
      uint64_t v10 = a1 - 3;
      if (__OFADD__(v8, 1)) {
        goto LABEL_29;
      }
    }
    else
    {
      id v9 = *(id *)(v6 + 8 * a1);
      uint64_t v10 = a1 - 3;
      if (__OFADD__(v8, 1))
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
    }
    id v33 = v9;
    id v11 = objc_msgSend(v9, sel_name);
    uint64_t v12 = sub_214602EA8();
    uint64_t v14 = v13;

    if (v12 == 0x6F684369746C756DLL && v14 == 0xEF77656956656369)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    char v16 = sub_214603898();
    swift_bridgeObjectRelease();
    if (v16) {
      break;
    }

    ++a1;
    if (v10 == v7) {
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_18:
  id v17 = objc_msgSend(v32, sel_children);
  unint64_t v18 = sub_214603058();

  swift_bridgeObjectRetain();
  uint64_t v19 = sub_2145E8C04(v18, v30, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19)
  {
    uint64_t v20 = (unint64_t *)((char *)v32 + OBJC_IVAR___RUIXMLElement_mutableChildren);
    swift_beginAccess();
    id v21 = v19;
    uint64_t v22 = sub_2145E8528(v20, v21);

    if (*v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_214603618();
      swift_bridgeObjectRelease();
      if (v23 >= v22) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v23 = *(void *)((*v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v23 >= v22)
      {
LABEL_21:
        sub_2145E88FC(v22, v23);
        swift_endAccess();
        id v24 = objc_msgSend(v33, sel_children);
        unint64_t v25 = sub_214603058();

        id v26 = sub_2145E8C04(v25, 0x746E65746E6F63, 0xE700000000000000);
        swift_bridgeObjectRelease();
        if (!v26)
        {
          id v27 = objc_allocWithZone((Class)RUIXMLElement);
          unint64_t v28 = (void *)sub_214602E78();
          id v26 = objc_msgSend(v27, sel_initWithName_, v28);
        }
        id v29 = objc_msgSend(v26, sel_parent);

        if (!v29) {
          objc_msgSend(v33, sel_appendChild_, v26);
        }
        objc_msgSend(v26, sel_appendChild_, v21);

        return;
      }
    }
    __break(1u);
    return;
  }
}

void sub_2145E5530()
{
  id v1 = v0;
  id v2 = sub_2145E5A6C(0x656956656C626174, 0xE900000000000077);
  if (!v2) {
    return;
  }
  id v3 = v2;
  uint64_t v4 = sub_2145E5A6C(0x6F684369746C756DLL, 0xEF77656956656369);
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v3, sel_parent);
    if (v6)
    {
      uint64_t v7 = v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780E070);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_214616D50;
      id v9 = objc_msgSend(v5, sel_name);
      uint64_t v10 = sub_214602EA8();
      uint64_t v12 = v11;

      *(void *)(inited + 32) = v10;
      *(void *)(inited + 40) = v12;
      uint64_t v13 = sub_2145BD22C(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t v14 = swift_initStackObject();
      *(_OWORD *)(v14 + 16) = xmmword_214616D50;
      id v15 = objc_msgSend(v7, sel_name);
      uint64_t v16 = sub_214602EA8();
      uint64_t v18 = v17;

      *(void *)(v14 + 32) = v16;
      *(void *)(v14 + 40) = v18;
      uint64_t v19 = sub_2145BD22C(v14);
      swift_setDeallocating();
      swift_arrayDestroy();
      v40[0] = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2145E7964(v40, 0x7FFFFFFFFFFFFFFFLL, v1, v13, v19);
      swift_bridgeObjectRelease();
      uint64_t v20 = swift_bridgeObjectRelease();
      type metadata accessor for RUIXMLElement(v20);
      id v21 = (void *)sub_214603048();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_appendChildren_, v21);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  id v22 = objc_msgSend(v3, sel_children);
  type metadata accessor for RUIXMLElement((uint64_t)v22);
  unint64_t v23 = sub_214603058();

  if (v23 >> 62) {
    goto LABEL_30;
  }
  unint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v24)
  {
LABEL_20:
    id v35 = 0;
    goto LABEL_23;
  }
  while (1)
  {
    while (__OFSUB__(v24--, 1))
    {
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_214603618();
      swift_bridgeObjectRelease();
      if (!v24) {
        goto LABEL_20;
      }
    }
    if ((v23 & 0xC000000000000001) != 0)
    {
      id v26 = (id)MEMORY[0x2166A3B40](v24, v23);
      goto LABEL_14;
    }
    if ((v24 & 0x8000000000000000) != 0) {
      goto LABEL_28;
    }
    if (v24 >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_29;
    }
    id v26 = *(id *)(v23 + 32 + 8 * v24);
LABEL_14:
    id v27 = v26;
    id v28 = objc_msgSend(v26, sel_name);
    uint64_t v29 = sub_214602EA8();
    uint64_t v31 = v30;

    if (v29 == 0x6E6F6974636573 && v31 == 0xE700000000000000) {
      break;
    }
    char v33 = sub_214603898();

    uint64_t v34 = swift_bridgeObjectRelease();
    if (v33) {
      goto LABEL_22;
    }
    if (!v24) {
      goto LABEL_20;
    }
  }

  uint64_t v34 = swift_bridgeObjectRelease();
LABEL_22:
  MEMORY[0x270FA5388](v34);
  unint64_t v39 = v24;
  sub_2145E9ED0(&v39, v40);
  id v35 = (id)v40[0];
LABEL_23:
  swift_bridgeObjectRelease();
  if (!v35) {
    id v35 = v3;
  }
  uint64_t v36 = sub_2145BD22C((uint64_t)&unk_26C543BA0);
  swift_arrayDestroy();
  uint64_t v37 = sub_2145BD22C((uint64_t)&unk_26C543B60);
  swift_arrayDestroy();
  v40[0] = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2145E7964(v40, 0x7FFFFFFFFFFFFFFFLL, v1, v36, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v38 = (void *)sub_214603048();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_appendChildren_, v38);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void *sub_2145E5A6C(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_name);
  uint64_t v6 = sub_214602EA8();
  uint64_t v8 = v7;

  if (v6 == a1 && v8 == a2)
  {
    swift_bridgeObjectRelease();
    id v12 = v2;
  }
  else
  {
    char v10 = sub_214603898();
    swift_bridgeObjectRelease();
    if (v10)
    {
      id v11 = v2;
    }
    else
    {
      id v13 = objc_msgSend(v2, sel_children);
      type metadata accessor for RUIXMLElement((uint64_t)v13);
      unint64_t v14 = sub_214603058();

      if (v14 >> 62) {
        goto LABEL_21;
      }
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (v15)
      {
        uint64_t v16 = 4;
        while (1)
        {
          id v17 = (v14 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x2166A3B40](v16 - 4, v14)
              : *(id *)(v14 + 8 * v16);
          uint64_t v18 = v17;
          uint64_t v19 = v16 - 3;
          if (__OFADD__(v16 - 4, 1)) {
            break;
          }
          id v2 = (void *)sub_2145E5A6C(a1, a2);

          if (v2)
          {
            swift_bridgeObjectRelease();
            return v2;
          }
          ++v16;
          if (v19 == v15) {
            goto LABEL_17;
          }
        }
        __break(1u);
LABEL_21:
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_214603618();
        swift_bridgeObjectRelease();
      }
LABEL_17:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v2;
}

uint64_t sub_2145E5C1C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_214602288();
  uint64_t v47 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_parent);
  if (result)
  {
    char v10 = (void *)result;
    id v11 = objc_msgSend(a1, sel_name);
    uint64_t v12 = sub_214602EA8();
    uint64_t v14 = v13;

    char v15 = sub_2145B3DE8(v12, v14, a2);
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0
      && (id v16 = objc_msgSend(v10, sel_name),
          uint64_t v17 = sub_214602EA8(),
          uint64_t v19 = v18,
          v16,
          LOBYTE(v16) = sub_2145B3DE8(v17, v19, a3),
          swift_bridgeObjectRelease(),
          (v16 & 1) == 0))
    {
      uint64_t v20 = sub_21457B748();
      uint64_t v21 = v6;
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v8, v20, v6);
      id v22 = a1;
      id v23 = v10;
      swift_bridgeObjectRetain_n();
      id v24 = v22;
      id v25 = v23;
      id v26 = sub_214602268();
      os_log_type_t v27 = sub_2146031E8();
      int v28 = v27;
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v29 = swift_slowAlloc();
        int v45 = v28;
        uint64_t v30 = v29;
        uint64_t v46 = swift_slowAlloc();
        uint64_t v49 = v46;
        *(_DWORD *)uint64_t v30 = 136315650;
        id v31 = objc_msgSend(v24, (SEL)&selRef_scaledFontForFont_);
        uint64_t v32 = sub_214602EA8();
        os_log_t v44 = v26;
        unint64_t v34 = v33;

        uint64_t v48 = sub_21455A094(v32, v34, &v49);
        sub_2146032F8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2080;
        id v35 = objc_msgSend(v25, sel_name);
        uint64_t v36 = sub_214602EA8();
        unint64_t v38 = v37;

        uint64_t v48 = sub_21455A094(v36, v38, &v49);
        sub_2146032F8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v39 = sub_214603198();
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_21455A094(v39, v41, &v49);
        sub_2146032F8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        os_log_t v42 = v44;
        _os_log_impl(&dword_2144F2000, v44, (os_log_type_t)v45, "Found %s inside %s. Expected in %s", (uint8_t *)v30, 0x20u);
        uint64_t v43 = v46;
        swift_arrayDestroy();
        MEMORY[0x2166A5210](v43, -1, -1);
        MEMORY[0x2166A5210](v30, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v8, v21);
      return 1;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

uint64_t sub_2145E6058(char *a1)
{
  uint64_t v2 = sub_214601EB8();
  uint64_t v53 = *(void *)(v2 - 8);
  uint64_t v54 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v52 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(a1, sel_attributtes);
  uint64_t v5 = sub_214602E08();

  if (*(void *)(v5 + 16)
    && (sub_2145E6E7C(0xD000000000000015, 0x800000021460FB50, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_214555184), (v6 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    unsigned int v8 = objc_msgSend(v7, sel_BOOLValue);
  }
  else
  {
    swift_bridgeObjectRelease();
    unsigned int v8 = 0;
  }
  id v9 = objc_msgSend(a1, sel_name);
  uint64_t v10 = sub_214602EA8();
  uint64_t v12 = v11;

  if (v10 == 0x6E49726576726573 && v12 == 0xEA00000000006F66)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  int v13 = sub_214603898();
  swift_bridgeObjectRelease();
  if ((v13 | v8))
  {
LABEL_9:
    id v14 = objc_msgSend(a1, sel_attributtes);
    uint64_t v15 = sub_214602E08();

    id v16 = (void *)sub_2145CEECC(MEMORY[0x263F8EE78]);
    sub_2145E8DAC(v16, v15, 0xD000000000000015, 0x800000021460FB50);
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(a1, (SEL)&selRef_scaledFontForFont_);
    sub_214602EA8();

    id v18 = objc_allocWithZone((Class)RUIXMLElement);
    uint64_t v19 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_214602DF8();
    swift_bridgeObjectRelease();
    uint64_t v21 = (char *)objc_msgSend(v18, sel_initWithName_attributes_, v19, v20);

    objc_msgSend(v21, sel_setStringValue_, 0);
    if (v21) {
      goto LABEL_10;
    }
    return 0;
  }
  uint64_t v21 = a1;
  if (!v21) {
    return 0;
  }
LABEL_10:
  uint64_t v58 = 60;
  unint64_t v59 = 0xE100000000000000;
  id v22 = objc_msgSend(a1, (SEL)&selRef_scaledFontForFont_);
  sub_214602EA8();

  sub_214602F68();
  swift_bridgeObjectRelease();
  sub_2145E6C08();
  sub_214602F68();
  swift_bridgeObjectRelease();
  uint64_t v24 = v58;
  unint64_t v23 = v59;
  uint64_t v60 = v58;
  unint64_t v61 = v59;
  id v25 = &a1[OBJC_IVAR___RUIXMLElement_mutableChildren];
  swift_beginAccess();
  unint64_t v26 = *(void *)v25;
  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_214603618();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_12;
    }
  }
  else if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_12:
    sub_214602F68();
    id v27 = objc_msgSend(v21, sel_children);
    type metadata accessor for RUIXMLElement((uint64_t)v27);
    unint64_t v28 = sub_214603058();

    uint64_t v29 = sub_2145E4F9C(v28, (uint64_t)v57, sub_2145E6058);
    swift_bridgeObjectRelease();
    uint64_t v55 = (uint64_t)v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780ECE8);
    sub_21455B000((unint64_t *)&qword_26780EF50, &qword_26780ECE8);
    sub_214602E48();
    swift_bridgeObjectRelease();
    sub_214602F68();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(a1, sel_stringValue);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = sub_214602EA8();
      unint64_t v34 = v33;

      uint64_t v55 = v32;
      unint64_t v56 = v34;
      id v35 = v52;
      sub_214601EA8();
      sub_214594B98();
      uint64_t v36 = sub_214603318();
      unint64_t v38 = v37;
      (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v54);
      swift_bridgeObjectRelease();
      uint64_t v39 = HIBYTE(v38) & 0xF;
      if ((v38 & 0x2000000000000000) == 0) {
        uint64_t v39 = v36 & 0xFFFFFFFFFFFFLL;
      }
      if (v39)
      {
        uint64_t v55 = 0x41544144435B213CLL;
        unint64_t v56 = 0xE90000000000005BLL;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_214602F68();
        sub_214602F68();
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v41 = v60;
    unint64_t v40 = v61;
    uint64_t v55 = 12092;
    unint64_t v56 = 0xE200000000000000;
    id v42 = objc_msgSend(a1, (SEL)&selRef_scaledFontForFont_);
    sub_214602EA8();

    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_214602F68();
    uint64_t v55 = v41;
    unint64_t v56 = v40;
    swift_bridgeObjectRetain();
    sub_214602F68();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  id v45 = objc_msgSend(a1, sel_stringValue);
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = sub_214602EA8();
    unint64_t v49 = v48;

    swift_bridgeObjectRelease();
    uint64_t v50 = HIBYTE(v49) & 0xF;
    if ((v49 & 0x2000000000000000) == 0) {
      uint64_t v50 = v47 & 0xFFFFFFFFFFFFLL;
    }
    if (v50) {
      goto LABEL_12;
    }
  }
  uint64_t v55 = v24;
  unint64_t v56 = v23;
  swift_bridgeObjectRetain();
  sub_214602F68();
LABEL_27:
  swift_bridgeObjectRelease();

  return v55;
}

uint64_t sub_2145E6788(void *a1)
{
  uint64_t v2 = sub_214601EB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = 60;
  unint64_t v40 = 0xE100000000000000;
  char v6 = a1;
  id v7 = objc_msgSend(v6, sel_name);
  sub_214602EA8();

  sub_214602F68();
  swift_bridgeObjectRelease();
  sub_2145E6C08();
  sub_214602F68();
  swift_bridgeObjectRelease();
  uint64_t v9 = v39;
  unint64_t v8 = v40;
  uint64_t v41 = v39;
  unint64_t v42 = v40;
  uint64_t v10 = &v6[OBJC_IVAR___RUIXMLElement_mutableChildren];
  swift_beginAccess();
  unint64_t v11 = *(void *)v10;
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_214603618();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  id v28 = objc_msgSend(v6, sel_stringValue);
  if (!v28) {
    goto LABEL_15;
  }
  uint64_t v29 = v28;
  uint64_t v30 = sub_214602EA8();
  unint64_t v32 = v31;

  swift_bridgeObjectRelease();
  uint64_t v33 = HIBYTE(v32) & 0xF;
  if ((v32 & 0x2000000000000000) == 0) {
    uint64_t v33 = v30 & 0xFFFFFFFFFFFFLL;
  }
  if (!v33)
  {
LABEL_15:
    uint64_t v36 = v9;
    unint64_t v37 = v8;
    swift_bridgeObjectRetain();
    sub_214602F68();
    goto LABEL_16;
  }
LABEL_3:
  sub_214602F68();
  id v12 = objc_msgSend(v6, sel_children);
  type metadata accessor for RUIXMLElement((uint64_t)v12);
  unint64_t v13 = sub_214603058();

  id v14 = sub_2145E4F9C(v13, (uint64_t)v38, sub_2145E6788);
  swift_bridgeObjectRelease();
  uint64_t v36 = (uint64_t)v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780ECE8);
  sub_21455B000((unint64_t *)&qword_26780EF50, &qword_26780ECE8);
  sub_214602E48();
  swift_bridgeObjectRelease();
  sub_214602F68();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v6, sel_stringValue);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = sub_214602EA8();
    unint64_t v19 = v18;

    uint64_t v36 = v17;
    unint64_t v37 = v19;
    sub_214601EA8();
    sub_214594B98();
    uint64_t v20 = sub_214603318();
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    uint64_t v23 = HIBYTE(v22) & 0xF;
    if ((v22 & 0x2000000000000000) == 0) {
      uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
    }
    if (v23)
    {
      uint64_t v36 = 0x41544144435B213CLL;
      unint64_t v37 = 0xE90000000000005BLL;
      sub_214602F68();
      swift_bridgeObjectRelease();
      sub_214602F68();
      sub_214602F68();
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v25 = v41;
  unint64_t v24 = v42;
  uint64_t v36 = 12092;
  unint64_t v37 = 0xE200000000000000;
  id v26 = objc_msgSend(v6, sel_name);
  sub_214602EA8();

  sub_214602F68();
  swift_bridgeObjectRelease();
  sub_214602F68();
  uint64_t v36 = v25;
  unint64_t v37 = v24;
  swift_bridgeObjectRetain();
  sub_214602F68();
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();

  return v36;
}

uint64_t sub_2145E6C08()
{
  id v1 = objc_msgSend(v0, sel_attributtes);
  uint64_t v2 = sub_214602E08();

  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
  id v4 = objc_msgSend(v0, sel_attributtes);
  uint64_t v5 = sub_214602E08();

  MEMORY[0x270FA5388](v6);
  sub_2145E9140(v5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2145E9C0C);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780ECE8);
  sub_21455B000((unint64_t *)&qword_26780EF50, &qword_26780ECE8);
  sub_214602E48();
  swift_bridgeObjectRelease();
  sub_214602F68();
  swift_bridgeObjectRelease();
  return 32;
}

uint64_t RUIXMLElement.xmlString.getter()
{
  return sub_2145E6788(v0);
}

unint64_t sub_2145E6E20(unint64_t result, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0) {
    return MEMORY[0x2166A3B40]();
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
  {
    return (unint64_t)*(id *)(a2 + 8 * result + 32);
  }
  __break(1u);
  return result;
}

uint64_t sub_2145E6E7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_214603A78();
  sub_214602F48();
  uint64_t v5 = sub_214603A98();
  return a3(a1, a2, v5);
}

char *sub_2145E6F00(uint64_t a1)
{
  return sub_2145D0CAC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_2145E6F14(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_214603618();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2166A3B50);
}

uint64_t sub_2145E6F90(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

id sub_2145E7018(void *a1)
{
  uint64_t v3 = OBJC_IVAR___RUIXMLParserDelegate__xmlElement;
  *(void *)&v1[OBJC_IVAR___RUIXMLParserDelegate__xmlElement] = 0;
  uint64_t v4 = OBJC_IVAR___RUIXMLParserDelegate_root;
  *(void *)&v1[OBJC_IVAR___RUIXMLParserDelegate_root] = 0;
  *(void *)&v1[OBJC_IVAR___RUIXMLParserDelegate__stack] = MEMORY[0x263F8EE78];
  char v5 = *(void **)&v1[v3];
  *(void *)&v1[v3] = a1;
  unsigned int v6 = v1;
  id v7 = a1;

  unint64_t v8 = *(void **)&v1[v4];
  *(void *)&v1[v4] = a1;
  id v9 = v7;

  v11.receiver = v6;
  v11.super_class = (Class)RUIXMLParserDelegate;
  return objc_msgSendSuper2(&v11, sel_init);
}

void sub_2145E70C8(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone((Class)RUIXMLElement);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unsigned int v6 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_214602DF8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_initWithName_attributes_, v6, v7);

  id v9 = (char **)&v2[OBJC_IVAR___RUIXMLParserDelegate__stack];
  swift_beginAccess();
  unint64_t v10 = *v9;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *id v9 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v10 = sub_2145D0CAC(0, *((void *)v10 + 2) + 1, 1, v10);
    *id v9 = v10;
  }
  unint64_t v13 = *((void *)v10 + 2);
  unint64_t v12 = *((void *)v10 + 3);
  if (v13 >= v12 >> 1)
  {
    unint64_t v10 = sub_2145D0CAC((char *)(v12 > 1), v13 + 1, 1, v10);
    *id v9 = v10;
  }
  *((void *)v10 + 2) = v13 + 1;
  id v14 = &v10[16 * v13];
  *((void *)v14 + 4) = a1;
  *((void *)v14 + 5) = a2;
  swift_endAccess();
  id v15 = objc_msgSend(v2, sel_xmlElement);
  objc_msgSend(v15, sel_appendChild_, v8);

  uint64_t v16 = OBJC_IVAR___RUIXMLParserDelegate__xmlElement;
  uint64_t v17 = *(void **)&v2[OBJC_IVAR___RUIXMLParserDelegate__xmlElement];
  *(void *)&v2[OBJC_IVAR___RUIXMLParserDelegate__xmlElement] = v8;
  id v18 = v8;

  if (!*(void *)&v2[OBJC_IVAR___RUIXMLParserDelegate_root])
  {
    unint64_t v19 = *(void **)&v2[v16];
    *(void *)&v2[OBJC_IVAR___RUIXMLParserDelegate_root] = v19;
    id v20 = v19;
  }
}

void sub_2145E72B0()
{
  uint64_t v1 = sub_214602EF8();
  MEMORY[0x270FA5388](v1 - 8);
  sub_214602ED8();
  sub_214602EC8();
  if (v2)
  {
    id v3 = objc_msgSend(v0, sel_xmlElement);
    if (v3
      && (uint64_t v4 = v3, v5 = objc_msgSend(v3, sel_stringValue), v4, v5))
    {
      uint64_t v6 = sub_214602EA8();
      unint64_t v8 = v7;
    }
    else
    {
      uint64_t v6 = 0;
      unint64_t v8 = 0xE000000000000000;
    }
    id v9 = objc_msgSend(v0, sel_xmlElement);
    if (v9)
    {
      unint64_t v10 = v9;
      swift_bridgeObjectRetain();
      sub_214602F68();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      objc_super v11 = (void *)sub_214602E78();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setStringValue_, v11, v6, v8);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

void sub_2145E744C()
{
  id v1 = objc_msgSend(v0, sel_xmlElement);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_stringValue);

    if (v3)
    {
      sub_214602EA8();
    }
  }
  id v4 = objc_msgSend(v0, sel_xmlElement);
  if (v4)
  {
    id v5 = v4;
    swift_bridgeObjectRetain();
    sub_214602F68();
    swift_bridgeObjectRelease();
    id v6 = (id)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setStringValue_, v6);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_2145E75A4(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  id v6 = objc_msgSend(v2, sel_xmlElement);
  if (!v6) {
    goto LABEL_27;
  }
  unint64_t v7 = v6;
  id v8 = objc_msgSend(v3, sel_stack);
  uint64_t v9 = sub_214603058();

  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {
    swift_bridgeObjectRelease();
LABEL_24:
    sub_214603498();
    sub_214602F68();
    sub_214602F68();
    sub_214602F68();
    id v25 = objc_msgSend(v3, sel_stack);
    uint64_t v26 = sub_214603058();

    if (*(void *)(v26 + 16)) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780DA50);
    sub_214602F08();
    sub_214602F68();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v11 = v9 + 16 * v10;
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v12 = *(void *)(v11 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v13 == a1 && v12 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_214603898();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_24;
    }
  }
  uint64_t v16 = (char **)&v3[OBJC_IVAR___RUIXMLParserDelegate__stack];
  swift_beginAccess();
  uint64_t v17 = *v16;
  if (!*((void *)*v16 + 2))
  {
    __break(1u);
LABEL_20:
    uint64_t v17 = sub_2145E6F00((uint64_t)v17);
    uint64_t v18 = *((void *)v17 + 2);
    if (v18) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v18 = *((void *)v17 + 2);
  if (!v18)
  {
LABEL_21:
    __break(1u);
LABEL_27:
    sub_214603608();
    __break(1u);
    return;
  }
LABEL_13:
  *((void *)v17 + 2) = v18 - 1;
  *uint64_t v16 = v17;
  swift_endAccess();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v7, sel_parent);
  if (v19)
  {
    uint64_t v20 = OBJC_IVAR___RUIXMLParserDelegate__xmlElement;
    unint64_t v21 = *(void **)&v3[OBJC_IVAR___RUIXMLParserDelegate__xmlElement];
    *(void *)&v3[OBJC_IVAR___RUIXMLParserDelegate__xmlElement] = v19;
    id v22 = v19;

    if (!*(void *)&v3[OBJC_IVAR___RUIXMLParserDelegate_root])
    {
      uint64_t v23 = *(void **)&v3[v20];
      *(void *)&v3[OBJC_IVAR___RUIXMLParserDelegate_root] = v23;
      id v24 = v23;
    }
  }
  else
  {
    id v22 = v7;
  }
}

uint64_t type metadata accessor for RUIXMLSanitizer()
{
  return self;
}

unint64_t sub_2145E7910()
{
  unint64_t result = qword_26780EF48;
  if (!qword_26780EF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EF48);
  }
  return result;
}

uint64_t sub_2145E7964(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_214602158();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v33 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 < 1) {
    return result;
  }
  uint64_t v32 = a2 - 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_2145BD22C((uint64_t)&unk_26C543C10);
  swift_arrayDestroy();
  id v15 = objc_msgSend(a3, sel_name);
  uint64_t v16 = sub_214602EA8();
  uint64_t v18 = v17;

  LOBYTE(v15) = sub_2145B3DE8(v16, v18, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0)
  {
    uint64_t v29 = v11;
    uint64_t v30 = v10;
    sub_214602148();
    v28[1] = a3;
    id v19 = objc_msgSend(a3, sel_children);
    type metadata accessor for RUIXMLElement((uint64_t)v19);
    unint64_t v20 = sub_214603058();

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_214603618();
      uint64_t v21 = result;
      uint64_t v22 = v32;
      if (result) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v22 = v32;
      if (v21)
      {
LABEL_8:
        if (v21 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v23 = 0;
        uint64_t v31 = a5;
        do
        {
          if ((v20 & 0xC000000000000001) != 0) {
            id v24 = (id)MEMORY[0x2166A3B40](v23, v20);
          }
          else {
            id v24 = *(id *)(v20 + 8 * v23 + 32);
          }
          id v25 = v24;
          if (sub_2145E5C1C(v24, a4, a5))
          {
            id v26 = v25;
            MEMORY[0x2166A36A0]();
            if (*(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_214603088();
            }
            sub_2146030B8();
            sub_214603068();
            sub_214602138();
            a5 = v31;
            uint64_t v22 = v32;
          }
          ++v23;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2145E7964(a1, v22, v25, a4, a5);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        while (v21 != v23);
      }
    }
    swift_bridgeObjectRelease_n();
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780EFF0);
    sub_21455B000(&qword_26780EFF8, &qword_26780EFF0);
    sub_21455B000((unint64_t *)&unk_26780F000, &qword_26780EFF0);
    uint64_t v27 = v33;
    sub_2146031C8();
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v27, v30);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2145E7D84(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = sub_214602158();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v35 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 < 1) {
    return;
  }
  id v37 = a4;
  uint64_t v11 = sub_2145BD22C((uint64_t)&unk_26C543BE0);
  swift_arrayDestroy();
  id v12 = objc_msgSend(a3, sel_name);
  uint64_t v13 = sub_214602EA8();
  uint64_t v15 = v14;

  LOBYTE(v12) = sub_2145B3DE8(v13, v15, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
    uint64_t v33 = v9;
    uint64_t v34 = v8;
    sub_214602148();
    id v17 = objc_msgSend(a3, sel_children);
    type metadata accessor for RUIXMLElement((uint64_t)v17);
    unint64_t v18 = sub_214603058();

    v32[1] = a3;
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_214603618();
      if (v19) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v19)
      {
LABEL_8:
        if (v19 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v20 = 0;
        unint64_t v36 = v18 & 0xC000000000000001;
        unint64_t v21 = v18;
        do
        {
          if (v36) {
            id v23 = (id)MEMORY[0x2166A3B40](v20, v18);
          }
          else {
            id v23 = *(id *)(v18 + 8 * v20 + 32);
          }
          id v24 = v23;
          uint64_t v25 = sub_2145BD22C((uint64_t)&unk_26C543C40);
          swift_arrayDestroy();
          id v26 = objc_msgSend(v24, sel_name);
          uint64_t v27 = sub_214602EA8();
          uint64_t v29 = v28;

          LOBYTE(v26) = sub_2145B3DE8(v27, v29, v25);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v26 & 1) == 0)
          {
            id v30 = v24;
            MEMORY[0x2166A36A0]();
            if (*(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_214603088();
            }
            sub_2146030B8();
            sub_214603068();
            sub_214602138();
          }
          ++v20;
          id v22 = v37;
          sub_2145E7D84(a1, 0, v24, v22);

          unint64_t v18 = v21;
        }
        while (v19 != v20);
      }
    }
    swift_bridgeObjectRelease_n();
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780EFF0);
    sub_21455B000(&qword_26780EFF8, &qword_26780EFF0);
    sub_21455B000((unint64_t *)&unk_26780F000, &qword_26780EFF0);
    uint64_t v31 = v35;
    sub_2146031C8();
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v34);

    return;
  }
  id v16 = v37;
}

uint64_t sub_2145E81C4(unint64_t a1)
{
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x2166A3B40](v3, a1);
LABEL_9:
        id v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_21;
        }
        uint64_t v7 = v2;
        id v8 = objc_msgSend(v4, sel_name);
        uint64_t v9 = sub_214602EA8();
        uint64_t v11 = v10;

        if (v9 == 1701273968 && v11 == 0xE400000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          sub_214603528();
          sub_214603558();
          sub_214603568();
          sub_214603538();
          goto LABEL_5;
        }
        char v13 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v13) {
          goto LABEL_17;
        }

LABEL_5:
        ++v3;
        uint64_t v2 = v7;
        if (v6 == v7) {
          return v15;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      uint64_t v2 = sub_214603618();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2145E8384(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v5)
  {
    uint64_t v6 = 0;
    uint64_t v20 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166A3B40](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      id v8 = v7;
      id v9 = objc_msgSend(v7, sel_name, v20);
      uint64_t v10 = sub_214602EA8();
      uint64_t v12 = v11;

      id v13 = objc_msgSend(a2, sel_name);
      uint64_t v3 = sub_214602EA8();
      uint64_t v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n();
        return v6;
      }
      char v17 = sub_214603898();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        return v6;
      }
      uint64_t v18 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      ++v6;
      if (v18 == v5) {
        return 0;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_2145E8528(unint64_t *a1, void *a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  id v40 = a2;
  unint64_t v41 = sub_2145E8384(v5, a2);
  char v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v39 = v2;
  if (v2) {
    return v41;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = (id)(v41 + 1);
    if (__OFADD__(v41, 1)) {
      goto LABEL_60;
    }
    if (*a1 >> 62)
    {
LABEL_61:
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_214603618();
      swift_bridgeObjectRelease();
      if (v8 != (id)v37) {
        goto LABEL_6;
      }
    }
    else if (v8 != *(id *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v41 + 5; ; ++i)
      {
        unint64_t v10 = i - 4;
        unint64_t v11 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          id v12 = (id)MEMORY[0x2166A3B40](i - 4);
        }
        else
        {
          if ((v10 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
            goto LABEL_61;
          }
          if (v10 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          id v12 = *(id *)(v11 + 8 * i);
        }
        id v13 = v12;
        id v14 = objc_msgSend(v12, sel_name, v39);
        uint64_t v15 = sub_214602EA8();
        uint64_t v17 = v16;

        id v8 = objc_msgSend(v40, sel_name);
        uint64_t v18 = sub_214602EA8();
        uint64_t v20 = v19;

        if (v15 == v18 && v17 == v20)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_38;
        }
        char v22 = sub_214603898();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v22) {
          goto LABEL_38;
        }
        if (v10 != v41) {
          break;
        }
LABEL_35:
        if (__OFADD__(v41, 1)) {
          goto LABEL_53;
        }
        ++v41;
LABEL_38:
        id v8 = (id)(i - 3);
        if (__OFADD__(v10, 1)) {
          goto LABEL_52;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v34 = sub_214603618();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v34 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v8 == (id)v34) {
          return v41;
        }
      }
      unint64_t v23 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        id v24 = (id)MEMORY[0x2166A3B40](v41, *a1);
        unint64_t v23 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v10 & 0x8000000000000000) != 0) {
            goto LABEL_56;
          }
          if (v10 >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_57;
          }
          id v25 = *(id *)(v23 + 8 * i);
          goto LABEL_24;
        }
      }
      else
      {
        if ((v41 & 0x8000000000000000) != 0) {
          goto LABEL_54;
        }
        if (v41 >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_55;
        }
        id v24 = *(id *)(v23 + 8 * v41 + 32);
        if ((v23 & 0xC000000000000001) == 0) {
          goto LABEL_21;
        }
      }
      id v25 = (id)MEMORY[0x2166A3B40](i - 4, v23);
      unint64_t v23 = *a1;
LABEL_24:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v23;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v23 & 0x8000000000000000) != 0
        || (v23 & 0x4000000000000000) != 0)
      {
        sub_2145E6F14(v23);
        unint64_t v23 = v27;
        *a1 = v27;
      }
      uint64_t v28 = *(void **)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v41 + 0x20);
      *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v41 + 0x20) = v25;

      sub_214603068();
      unint64_t v29 = *a1;
      int v30 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v29;
      if (!v30 || (v29 & 0x8000000000000000) != 0 || (v29 & 0x4000000000000000) != 0)
      {
        sub_2145E6F14(v29);
        unint64_t v29 = v31;
        *a1 = v31;
      }
      if ((v10 & 0x8000000000000000) != 0) {
        goto LABEL_58;
      }
      uint64_t v32 = v29 & 0xFFFFFFFFFFFFFF8;
      if (v10 >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_59;
      }
      uint64_t v33 = *(void **)(v32 + 8 * i);
      *(void *)(v32 + 8 * i) = v24;

      sub_214603068();
      goto LABEL_35;
    }
    return v41;
  }
  unint64_t v35 = *a1;
  if (!(v35 >> 62)) {
    return *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_214603618();
  swift_bridgeObjectRelease();
  return v38;
}

uint64_t sub_2145E88FC(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_214603618();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_214603618();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_214603618();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  uint64_t isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v9 & 0x8000000000000000) == 0
    && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x2166A3B50](v7, v12, 1, v9);
  uint64_t isUniquelyReferenced_nonNull_bridgeObject = swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  id v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for RUIXMLElement(isUniquelyReferenced_nonNull_bridgeObject);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_214603618();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_214603658();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_214603618();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_214603068();
}

void *sub_2145E8C04(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_214603618();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)MEMORY[0x2166A3B40](v4 - 4, v7);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, sel_name, v22);
        uint64_t v16 = sub_214602EA8();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2145E8DAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v41 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v45)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v45 = i;
      unint64_t v11 = v10 | (i << 6);
    }
    else
    {
      int64_t v12 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_45;
      }
      if (v12 >= v41)
      {
LABEL_42:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v13 = *(void *)(v40 + 8 * v12);
      int64_t v14 = i + 1;
      if (!v13)
      {
        int64_t v14 = i + 2;
        if (i + 2 >= v41) {
          goto LABEL_42;
        }
        unint64_t v13 = *(void *)(v40 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = i + 3;
          if (i + 3 >= v41) {
            goto LABEL_42;
          }
          unint64_t v13 = *(void *)(v40 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = i + 4;
            if (i + 4 >= v41) {
              goto LABEL_42;
            }
            unint64_t v13 = *(void *)(v40 + 8 * v14);
            if (!v13)
            {
              uint64_t v15 = i + 5;
              if (i + 5 >= v41) {
                goto LABEL_42;
              }
              unint64_t v13 = *(void *)(v40 + 8 * v15);
              if (!v13)
              {
                while (1)
                {
                  int64_t v14 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_46;
                  }
                  if (v14 >= v41) {
                    goto LABEL_42;
                  }
                  unint64_t v13 = *(void *)(v40 + 8 * v14);
                  ++v15;
                  if (v13) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = i + 5;
            }
          }
        }
      }
LABEL_23:
      unint64_t v7 = (v13 - 1) & v13;
      int64_t v45 = v14;
      unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    }
    uint64_t v16 = 16 * v11;
    uint64_t v17 = (uint64_t *)(*(void *)(a2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    char v20 = (uint64_t *)(*(void *)(a2 + 56) + v16);
    uint64_t v21 = *v20;
    unint64_t v22 = v20[1];
    BOOL v23 = *v17 == a3 && v18 == a4;
    if (v23 || (sub_214603898() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = v22;
    }
    else
    {
      unint64_t v24 = 0xEA00000000007D64;
      uint64_t v21 = 0x657463616465527BLL;
    }
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v27 = sub_2145E6E7C(v19, v18, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_214555184);
    uint64_t v28 = a1[2];
    BOOL v29 = (v26 & 1) == 0;
    uint64_t v30 = v28 + v29;
    if (__OFADD__(v28, v29)) {
      break;
    }
    char v31 = v26;
    if (a1[3] >= v30)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v26) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_2145D0A04();
        if (v31) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_2145D06DC(v30, isUniquelyReferenced_nonNull_native);
      uint64_t v32 = sub_2145E6E7C(v19, v18, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_214555184);
      if ((v31 & 1) != (v33 & 1)) {
        goto LABEL_47;
      }
      unint64_t v27 = v32;
      if (v31)
      {
LABEL_4:
        uint64_t v9 = (uint64_t *)(a1[7] + 16 * v27);
        swift_bridgeObjectRelease();
        *uint64_t v9 = v21;
        v9[1] = v24;
        goto LABEL_5;
      }
    }
    a1[(v27 >> 6) + 8] |= 1 << v27;
    uint64_t v34 = (uint64_t *)(a1[6] + 16 * v27);
    uint64_t *v34 = v19;
    v34[1] = v18;
    unint64_t v35 = (uint64_t *)(a1[7] + 16 * v27);
    *unint64_t v35 = v21;
    v35[1] = v24;
    uint64_t v36 = a1[2];
    BOOL v37 = __OFADD__(v36, 1);
    uint64_t v38 = v36 + 1;
    if (v37) {
      goto LABEL_44;
    }
    a1[2] = v38;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  uint64_t result = sub_2146039E8();
  __break(1u);
  return result;
}

uint64_t sub_2145E9140(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_214582720(0, v2, 0);
  uint64_t v3 = v35;
  uint64_t result = sub_2145E6F90(a1);
  uint64_t v7 = result;
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 64;
  int64_t v30 = v2;
  int v31 = v6;
  uint64_t v32 = a1 + 64;
  while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v12 = (unint64_t)v7 >> 6;
    if ((*(void *)(v9 + 8 * ((unint64_t)v7 >> 6)) & (1 << v7)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v6) {
      goto LABEL_24;
    }
    uint64_t v34 = v8;
    unint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v7);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v7);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = a2(v14, v15, v17, v18);
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v23 = *(void *)(v35 + 16);
    unint64_t v22 = *(void *)(v35 + 24);
    if (v23 >= v22 >> 1) {
      uint64_t result = (uint64_t)sub_214582720((char *)(v22 > 1), v23 + 1, 1);
    }
    *(void *)(v35 + 16) = v23 + 1;
    uint64_t v24 = v35 + 16 * v23;
    *(void *)(v24 + 32) = v19;
    *(void *)(v24 + 40) = v21;
    int64_t v10 = 1 << *(unsigned char *)(a1 + 32);
    if (v7 >= v10) {
      goto LABEL_25;
    }
    uint64_t v9 = a1 + 64;
    uint64_t v25 = *(void *)(v32 + 8 * v12);
    if ((v25 & (1 << v7)) == 0) {
      goto LABEL_26;
    }
    int v6 = v31;
    if (*(_DWORD *)(a1 + 36) != v31) {
      goto LABEL_27;
    }
    unint64_t v26 = v25 & (-2 << (v7 & 0x3F));
    if (v26)
    {
      int64_t v10 = __clz(__rbit64(v26)) | v7 & 0xFFFFFFFFFFFFFFC0;
      int64_t v11 = v30;
    }
    else
    {
      unint64_t v27 = v12 + 1;
      unint64_t v28 = (unint64_t)(v10 + 63) >> 6;
      int64_t v11 = v30;
      if (v12 + 1 < v28)
      {
        unint64_t v29 = *(void *)(v32 + 8 * v27);
        if (v29)
        {
LABEL_20:
          int64_t v10 = __clz(__rbit64(v29)) + (v27 << 6);
        }
        else
        {
          while (v28 - 2 != v12)
          {
            unint64_t v29 = *(void *)(a1 + 80 + 8 * v12++);
            if (v29)
            {
              unint64_t v27 = v12 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v8 = v34 + 1;
    uint64_t v7 = v10;
    if (v34 + 1 == v11) {
      return v3;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2145E93A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_214602EF8();
  uint64_t v5 = *(v4 - 1);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_214601EB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[0] = a1;
  v23[1] = a2;
  sub_214601EA8();
  sub_214594B98();
  sub_214603318();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_214602ED8();
  uint64_t v12 = sub_214602EB8();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v5 + 8))(v7, v4);
  if (v14 >> 60 != 15)
  {
    uint64_t v4 = 0;
    switch(v14 >> 62)
    {
      case 1uLL:
        if ((int)v12 == v12 >> 32) {
          goto LABEL_10;
        }
        goto LABEL_5;
      case 2uLL:
        if (*(void *)(v12 + 16) == *(void *)(v12 + 24)) {
          goto LABEL_10;
        }
        goto LABEL_5;
      case 3uLL:
        goto LABEL_13;
      default:
        if ((v14 & 0xFF000000000000) != 0)
        {
LABEL_5:
          id v16 = objc_allocWithZone(MEMORY[0x263F08D58]);
          sub_214556110(v12, v14);
          uint64_t v17 = (void *)sub_2146020D8();
          uint64_t v4 = objc_msgSend(v16, sel_initWithData_, v17);
          sub_214556AE0(v12, v14);

          id v18 = objc_msgSend(objc_allocWithZone((Class)RUIXMLParserDelegate), sel_init);
          objc_msgSend(v4, sel_setDelegate_, v18);
          objc_msgSend(v4, sel_parse);
          if (objc_msgSend(v4, sel_parserError))
          {
LABEL_6:
            swift_willThrow();

            sub_214556AE0(v12, v14);
            return v4;
          }
          uint64_t v19 = (char *)objc_msgSend(v18, sel_xmlElement);
          if (!v19)
          {
            sub_2145E7910();
            swift_allocError();
            *unint64_t v22 = 0;
            goto LABEL_6;
          }
          uint64_t v20 = v19;

          uint64_t v4 = (void *)sub_2145E6058(v20);
        }
        else
        {
LABEL_10:
          uint64_t v4 = 0;
        }
LABEL_13:
        sub_214556AE0(v12, v14);
        return v4;
    }
  }
  sub_2145E7910();
  swift_allocError();
  *uint64_t v15 = 1;
  swift_willThrow();
  return v4;
}

unint64_t sub_2145E9770()
{
  unint64_t result = qword_26780EF60;
  if (!qword_26780EF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EF60);
  }
  return result;
}

unint64_t sub_2145E97C8()
{
  unint64_t result = qword_26780EF68;
  if (!qword_26780EF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EF68);
  }
  return result;
}

unint64_t sub_2145E9820()
{
  unint64_t result = qword_26780EF70;
  if (!qword_26780EF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EF70);
  }
  return result;
}

unint64_t sub_2145E9878()
{
  unint64_t result = qword_26780EF78;
  if (!qword_26780EF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EF78);
  }
  return result;
}

unint64_t sub_2145E98D0()
{
  unint64_t result = qword_26780EF80;
  if (!qword_26780EF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780EF80);
  }
  return result;
}

char *keypath_get_selector_attributtes()
{
  return sel_attributtes;
}

char *keypath_get_selector_stringValue()
{
  return sel_stringValue;
}

uint64_t type metadata accessor for _RUIXMLNamespace(uint64_t a1)
{
  return sub_214586198(a1, &qword_2678189B0);
}

uint64_t type metadata accessor for RUIXMLParserDelegate(uint64_t a1)
{
  return sub_214586198(a1, (unint64_t *)&unk_2678189C0);
}

unsigned char *storeEnumTagSinglePayload for RUIXMLSanitizerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 1;
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
        JUMPOUT(0x2145E9A30);
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
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RUIXMLSanitizerError()
{
  return &type metadata for RUIXMLSanitizerError;
}

uint64_t method lookup function for RUIXMLSanitizer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RUIXMLSanitizer);
}

uint64_t dispatch thunk of RUIXMLSanitizer.__allocating_init(options:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of RUIXMLSanitizer.sanitizedXML(data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of RUIXMLSanitizer.sanitizedXMLData(element:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of RUIXMLSanitizer.sanitizedXMLElement(data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of RUIXMLSanitizer.sanitizedXML(element:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of RUIXMLSanitizer.logString(xmlString:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

ValueMetadata *type metadata accessor for RUIXMLSanitizer.Options()
{
  return &type metadata for RUIXMLSanitizer.Options;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2145E9C0C()
{
}

unint64_t sub_2145E9ED0@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_2145E6E20(*a1, **(void **)(v2 + 16));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2145E9F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *((void *)v2 + 2);
  long long v6 = *(long long *)((char *)v2 + 24);
  long long v11 = *v2;
  long long v12 = v6;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = *v2;
  *(void *)(v7 + 32) = v5;
  *(_OWORD *)(v7 + 40) = *(long long *)((char *)v2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  uint64_t v9 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780F020) + 36));
  *uint64_t v9 = sub_2145EA4D8;
  v9[1] = (uint64_t (*)())v7;
  v9[2] = 0;
  v9[3] = 0;
  sub_2145863DC((uint64_t)&v11);
  swift_unknownObjectRetain();
  return sub_2145EA590((uint64_t)&v12);
}

uint64_t View.registerScriptInterface<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2146034B8();
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  type metadata accessor for ScriptEnvironment();
  sub_2145EA110();
  v14[0] = sub_214602688();
  v14[1] = v10;
  v13[0] = v12[0];
  v13[1] = v12[1];
  v12[2] = v9;
  v12[3] = v14[0];
  v12[4] = v10;
  MEMORY[0x2166A3290](v12, a2, &type metadata for ScriptInterfaceModifier, a4);
  sub_214586408((uint64_t)v13);
  swift_unknownObjectRelease();
  return sub_2145EA168((uint64_t)v14);
}

unint64_t sub_2145EA110()
{
  unint64_t result = qword_26780E320;
  if (!qword_26780E320)
  {
    type metadata accessor for ScriptEnvironment();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780E320);
  }
  return result;
}

uint64_t sub_2145EA168(uint64_t a1)
{
  return a1;
}

uint64_t sub_2145EA194()
{
  return swift_getWitnessTable();
}

unint64_t sub_2145EA1FC()
{
  unint64_t result = qword_2678189D0[0];
  if (!qword_2678189D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2678189D0);
  }
  return result;
}

uint64_t destroy for ScriptInterfaceModifier()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_release();
}

void *initializeWithCopy for ScriptInterfaceModifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ScriptInterfaceModifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for ScriptInterfaceModifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScriptInterfaceModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScriptInterfaceModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScriptInterfaceModifier()
{
  return &type metadata for ScriptInterfaceModifier;
}

uint64_t sub_2145EA474()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2145EA490()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2145EA4D8()
{
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v2 = v0[2];
    uint64_t v5 = v0 + 3;
    uint64_t v3 = v0[3];
    uint64_t v4 = v5[1];
    long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v1 + 136);
    swift_retain();
    v6(v4, v2, v3);
    return swift_release();
  }
  else
  {
    type metadata accessor for ScriptEnvironment();
    sub_2145EA110();
    uint64_t result = sub_214602678();
    __break(1u);
  }
  return result;
}

uint64_t sub_2145EA590(uint64_t a1)
{
  return a1;
}

unint64_t sub_2145EA5C0()
{
  unint64_t result = qword_26780F028;
  if (!qword_26780F028)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F020);
    sub_2145EA63C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F028);
  }
  return result;
}

unint64_t sub_2145EA63C()
{
  unint64_t result = qword_26780F030;
  if (!qword_26780F030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F030);
  }
  return result;
}

uint64_t sub_2145EA698()
{
  uint64_t result = 0x746E656D656C65;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7972617262696CLL;
      break;
    case 2:
      uint64_t result = 0x737365636F7270;
      break;
    case 3:
      uint64_t result = 0x6E74736F486C7275;
      break;
    case 4:
      uint64_t result = 0x687461506C7275;
      break;
    case 5:
      uint64_t result = 0x7461636572706564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2145EA760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2145EAFF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2145EA788(uint64_t a1)
{
  unint64_t v2 = sub_2145EAA00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2145EA7C4(uint64_t a1)
{
  unint64_t v2 = sub_2145EAA00();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2145EA800(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F038);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2145EAA00();
  sub_214603AE8();
  v8[15] = 0;
  sub_214603778();
  if (!v1)
  {
    v8[14] = 1;
    sub_214603768();
    v8[13] = 2;
    sub_214603778();
    v8[12] = 3;
    sub_214603768();
    v8[11] = 4;
    sub_214603768();
    v8[10] = 5;
    sub_214603788();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2145EAA00()
{
  unint64_t result = qword_267818A60[0];
  if (!qword_267818A60[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267818A60);
  }
  return result;
}

uint64_t sub_2145EAA54@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(void *)(a9 + 72) = a11;
  *(unsigned char *)(a9 + 80) = a12;
  return result;
}

unint64_t sub_2145EAA78()
{
  return 0xD000000000000022;
}

unint64_t sub_2145EAA94(uint64_t a1)
{
  unint64_t result = sub_2145CA6A4();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2145EAABC(void *a1)
{
  return sub_2145EA800(a1);
}

ValueMetadata *_s14descr26C540531C9EventDataOMa()
{
  return &_s14descr26C540531C9EventDataON;
}

uint64_t _s14descr26C540531C9EventDataO16DidRenderElementVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s14descr26C540531C9EventDataO16DidRenderElementVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s14descr26C540531C9EventDataO16DidRenderElementVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s14descr26C540531C9EventDataO16DidRenderElementVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t _s14descr26C540531C9EventDataO16DidRenderElementVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 81)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14descr26C540531C9EventDataO16DidRenderElementVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 81) = 1;
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
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s14descr26C540531C9EventDataO16DidRenderElementVMa()
{
  return &_s14descr26C540531C9EventDataO16DidRenderElementVN;
}

unsigned char *_s14descr26C540531C9EventDataO16DidRenderElementV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 5;
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
        JUMPOUT(0x2145EAEB8);
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
          char *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14descr26C540531C9EventDataO16DidRenderElementV10CodingKeysOMa()
{
  return &_s14descr26C540531C9EventDataO16DidRenderElementV10CodingKeysON;
}

unint64_t sub_2145EAEF4()
{
  unint64_t result = qword_267818C70[0];
  if (!qword_267818C70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267818C70);
  }
  return result;
}

unint64_t sub_2145EAF4C()
{
  unint64_t result = qword_267818D80;
  if (!qword_267818D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267818D80);
  }
  return result;
}

unint64_t sub_2145EAFA4()
{
  unint64_t result = qword_267818D88[0];
  if (!qword_267818D88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267818D88);
  }
  return result;
}

uint64_t sub_2145EAFF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E656D656C65 && a2 == 0xE700000000000000;
  if (v2 || (sub_214603898() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7972617262696CLL && a2 == 0xE700000000000000 || (sub_214603898() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x737365636F7270 && a2 == 0xE700000000000000 || (sub_214603898() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E74736F486C7275 && a2 == 0xEB00000000656D61 || (sub_214603898() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x687461506C7275 && a2 == 0xE700000000000000 || (sub_214603898() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7461636572706564 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_214603898();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_2145EB2A0()
{
  return sub_2145EB334((void (*)(void))sub_2145EB2C0);
}

unint64_t sub_2145EB2C0()
{
  unint64_t result = qword_267818E10[0];
  if (!qword_267818E10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267818E10);
  }
  return result;
}

uint64_t sub_2145EB314(uint64_t a1, uint64_t a2)
{
  return sub_2145EB37C(a1, a2, (void (*)(uint64_t, uint64_t))sub_2145EB2C0);
}

uint64_t sub_2145EB334(void (*a1)(void))
{
  a1();
  sub_214602778();
  return v2;
}

uint64_t sub_2145EB37C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  return sub_214602788();
}

ValueMetadata *type metadata accessor for ReplaceXMLAction()
{
  return &type metadata for ReplaceXMLAction;
}

ValueMetadata *type metadata accessor for ParentReplaceXMLEnvironmentKey()
{
  return &type metadata for ParentReplaceXMLEnvironmentKey;
}

ValueMetadata *type metadata accessor for ReplaceXMLEnvironmentKey()
{
  return &type metadata for ReplaceXMLEnvironmentKey;
}

uint64_t type metadata accessor for SwiftUIContentView.ContentLoader()
{
  uint64_t result = qword_267819440;
  if (!qword_267819440) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2145EB440()
{
  unint64_t result = qword_26780E200;
  if (!qword_26780E200)
  {
    type metadata accessor for SwiftUIContentView.ContentLoader();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780E200);
  }
  return result;
}

void sub_2145EB498(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v1 = sub_2146027F8();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v25 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F040);
  MEMORY[0x270FA5388](v26);
  unint64_t v28 = (uint64_t *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F048);
  MEMORY[0x270FA5388](v4);
  char v6 = (unint64_t *)((char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F050);
  MEMORY[0x270FA5388](v27);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F058);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SwiftUIContentView.ContentLoader();
  sub_2145EB440();
  uint64_t v13 = sub_2146024E8();
  unint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 88))(v13);
  swift_release();
  if (v14 >> 62)
  {
    if (v14 >> 62 == 1)
    {
      if (objc_msgSend(self, sel_isInternalBuild))
      {
        sub_2146027E8();
        sub_2146027D8();
        uint64_t v33 = v14 & 0x3FFFFFFFFFFFFFFFLL;
        id v15 = (id)(v14 & 0x3FFFFFFFFFFFFFFFLL);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780DD98);
        sub_214602F28();
        sub_2146027C8();
        swift_bridgeObjectRelease();
        sub_2146027D8();
        sub_214602808();
        *(void *)&long long v30 = sub_214602B78();
        *((void *)&v30 + 1) = v16;
        *(void *)&long long v31 = v17 & 1;
        *((void *)&v31 + 1) = v18;
        char v32 = 0;
      }
      else
      {
        long long v30 = 0u;
        long long v31 = 0u;
        char v32 = 1;
      }
      sub_214602958();
      uint64_t v19 = v33;
      uint64_t v20 = v34;
      uint64_t v21 = v35;
      uint64_t v22 = v36;
      char v23 = v37;
      uint64_t v24 = v28;
      *unint64_t v28 = v33;
      v24[1] = v20;
      v24[2] = v21;
      v24[3] = v22;
      *((unsigned char *)v24 + 32) = v23;
      swift_storeEnumTagMultiPayload();
      sub_2145EBAC4(v19, v20, v21, v22, v23);
      sub_2145EBAC4(v19, v20, v21, v22, v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780F060);
      sub_2145EBB08();
      sub_2145EBBA8();
      sub_214602958();
      sub_2145EBC1C(v14);
      sub_2145EBC3C(v19, v20, v21, v22, v23);
      sub_2145EBC3C(v19, v20, v21, v22, v23);
    }
    else
    {
      sub_214602508();
      (*(void (**)(unint64_t *, char *, uint64_t))(v10 + 16))(v6, v12, v9);
      swift_storeEnumTagMultiPayload();
      sub_21455B000(&qword_26780F070, &qword_26780F058);
      sub_214602958();
      sub_2145EBC80((uint64_t)v8, (uint64_t)v28);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780F060);
      sub_2145EBB08();
      sub_2145EBBA8();
      sub_214602958();
      sub_2145EBCE8((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
  }
  else
  {
    *char v6 = v14;
    swift_storeEnumTagMultiPayload();
    sub_21455B000(&qword_26780F070, &qword_26780F058);
    swift_retain();
    sub_214602958();
    sub_2145EBC80((uint64_t)v8, (uint64_t)v28);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F060);
    sub_2145EBB08();
    sub_2145EBBA8();
    sub_214602958();
    sub_2145EBCE8((uint64_t)v8);
    sub_2145EBC1C(v14);
  }
}

uint64_t sub_2145EBAC4(uint64_t result, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
  {
    sub_214566B24(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2145EBB08()
{
  unint64_t result = qword_26780F068;
  if (!qword_26780F068)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F050);
    sub_21455B000(&qword_26780F070, &qword_26780F058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F068);
  }
  return result;
}

unint64_t sub_2145EBBA8()
{
  unint64_t result = qword_26780F078;
  if (!qword_26780F078)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F078);
  }
  return result;
}

void sub_2145EBC1C(unint64_t a1)
{
  if (a1 >> 62 == 1)
  {
  }
  else if (!(a1 >> 62))
  {
    swift_release();
  }
}

uint64_t sub_2145EBC3C(uint64_t result, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0)
  {
    sub_214566B34(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2145EBC80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2145EBCE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F050);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2145EBD50(uint64_t a1@<X8>)
{
}

uint64_t sub_2145EBD5C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_214602468();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2145EBDD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_2145EBE1C(unint64_t *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(unint64_t))(**(void **)a2 + 96);
  sub_2145ECF64(*a1);
  return v3(v2);
}

uint64_t sub_2145EBE78()
{
  return sub_214602478();
}

void (*sub_2145EBEE8(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_214602458();
  return sub_2145D1954;
}

uint64_t sub_2145EBF74()
{
  return swift_endAccess();
}

uint64_t sub_2145EBFD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F088);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F080);
  sub_214602448();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_2145EC104(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F088);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV8RemoteUI18SwiftUIContentView13ContentLoader__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F080);
  sub_214602438();
  swift_endAccess();
  return sub_2145D1C94;
}

uint64_t sub_2145EC214()
{
  sub_2145EC318();
  sub_2146023B8();
  sub_2145EC36C();
  uint64_t v1 = sub_214602D28();
  return (*(uint64_t (**)(uint64_t))(*(void *)v0 + 96))(v1);
}

unint64_t sub_2145EC318()
{
  unint64_t result = qword_26780F090;
  if (!qword_26780F090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F090);
  }
  return result;
}

unint64_t sub_2145EC36C()
{
  unint64_t result = qword_26780F098;
  if (!qword_26780F098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F098);
  }
  return result;
}

uint64_t sub_2145EC3C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV8RemoteUI18SwiftUIContentView13ContentLoader__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F080);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2145EC464()
{
  uint64_t v0 = swift_allocObject();
  sub_214602428();
  return v0;
}

uint64_t sub_2145EC4C4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SwiftUIContentView.ContentLoader();
  uint64_t result = sub_2146023D8();
  *a1 = result;
  return result;
}

uint64_t sub_2145EC504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_214587A38(a1, a2);
}

uint64_t sub_2145EC50C()
{
  return sub_214603A98();
}

uint64_t sub_2145EC558()
{
  return sub_214602F48();
}

uint64_t sub_2145EC568()
{
  return sub_214603A98();
}

uint64_t sub_2145EC5B0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_214603688();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2145EC604(void *a1@<X8>)
{
  *a1 = 2003134838;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_2145EC618()
{
  return 2003134838;
}

uint64_t sub_2145EC628@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_214603688();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2145EC680(uint64_t a1)
{
  unint64_t v2 = sub_2145ED2F8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2145EC6BC(uint64_t a1)
{
  unint64_t v2 = sub_2145ED2F8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2145EC6F8()
{
  return sub_214602D78();
}

char *sub_2145EC7C0@<X0>(void *a1@<X0>, char **a2@<X8>)
{
  uint64_t result = sub_2145EC904(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

char *sub_2145EC7EC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F0F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8]) {
      memmove(v12, v13, 120 * v8);
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

char *sub_2145EC904(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F0F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int64_t v7 = (char *)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v7);
  sub_2145ED2F8();
  sub_214603AD8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_2146036A8();
    uint64_t v29 = v4;
    __swift_project_boxed_opaque_existential_1(v27, v28);
    char v9 = sub_2146037C8();
    int64_t v7 = (char *)MEMORY[0x263F8EE78];
    if ((v9 & 1) == 0)
    {
      do
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v28);
        sub_214583C40();
        sub_2146037B8();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v7 = sub_2145EC7EC(0, *((void *)v7 + 2) + 1, 1, v7);
        }
        unint64_t v11 = *((void *)v7 + 2);
        unint64_t v10 = *((void *)v7 + 3);
        if (v11 >= v10 >> 1) {
          int64_t v7 = sub_2145EC7EC((char *)(v10 > 1), v11 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v11 + 1;
        long long v12 = &v7[120 * v11];
        long long v13 = *(_OWORD *)&v19[8];
        long long v14 = v20;
        long long v15 = v22;
        *((_OWORD *)v12 + 4) = v21;
        *((_OWORD *)v12 + 5) = v15;
        *((_OWORD *)v12 + 2) = v13;
        *((_OWORD *)v12 + 3) = v14;
        long long v16 = v23;
        long long v17 = v24;
        long long v18 = v25;
        v12[144] = v26;
        *((_OWORD *)v12 + 7) = v17;
        *((_OWORD *)v12 + 8) = v18;
        *((_OWORD *)v12 + 6) = v16;
        __swift_project_boxed_opaque_existential_1(v27, v28);
      }
      while ((sub_2146037C8() & 1) == 0);
    }
    (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_2145ECBF0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2145ECC10()
{
  unint64_t result = qword_26780F0A8;
  if (!qword_26780F0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F0A8);
  }
  return result;
}

unint64_t sub_2145ECC68()
{
  unint64_t result = qword_26780F0B0;
  if (!qword_26780F0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F0B0);
  }
  return result;
}

unint64_t sub_2145ECCC0()
{
  unint64_t result = qword_26780F0B8;
  if (!qword_26780F0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F0B8);
  }
  return result;
}

uint64_t sub_2145ECD14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SwiftUIContentView()
{
  return sub_2145C4F78();
}

uint64_t _s8RemoteUI18SwiftUIContentViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2145C4F70();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SwiftUIContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2145C4F70();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2145C4F78();
  return a1;
}

uint64_t assignWithTake for SwiftUIContentView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2145C4F78();
  return a1;
}

ValueMetadata *type metadata accessor for SwiftUIContentView()
{
  return &type metadata for SwiftUIContentView;
}

uint64_t sub_2145ECE40()
{
  return type metadata accessor for SwiftUIContentView.ContentLoader();
}

void sub_2145ECE48()
{
  sub_2145ECED8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2145ECED8()
{
  if (!qword_26780F0C0)
  {
    unint64_t v0 = sub_214602488();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26780F0C0);
    }
  }
}

unint64_t *initializeBufferWithCopyOfBuffer for SwiftUIContentView.ContentLoader.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2145ECF64(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_2145ECF64(unint64_t result)
{
  if (result >> 62 == 1) {
    return (unint64_t)(id)(result & 0x3FFFFFFFFFFFFFFFLL);
  }
  if (!(result >> 62)) {
    return swift_retain();
  }
  return result;
}

void destroy for SwiftUIContentView.ContentLoader.State(unint64_t *a1)
{
}

unint64_t *assignWithCopy for SwiftUIContentView.ContentLoader.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_2145ECF64(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_2145EBC1C(v4);
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  char *result = *a2;
  return result;
}

unint64_t *assignWithTake for SwiftUIContentView.ContentLoader.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_2145EBC1C(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SwiftUIContentView.ContentLoader.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SwiftUIContentView.ContentLoader.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2145ED0B4(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_2145ED0D0(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2145ED0E0(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  char *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for SwiftUIContentView.ContentLoader.State()
{
  return &type metadata for SwiftUIContentView.ContentLoader.State;
}

ValueMetadata *type metadata accessor for SwiftUIContentView.ContentView()
{
  return &type metadata for SwiftUIContentView.ContentView;
}

unsigned char *storeEnumTagSinglePayload for SwiftUIContentView.ContentView.CodingKeys(unsigned char *result, int a2, int a3)
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
        char *result = a2;
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
      char *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2145ED1C8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SwiftUIContentView.ContentView.CodingKeys()
{
  return &type metadata for SwiftUIContentView.ContentView.CodingKeys;
}

unint64_t sub_2145ED204()
{
  unint64_t result = qword_26780F0C8;
  if (!qword_26780F0C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F0D0);
    sub_2145EBB08();
    sub_2145EBBA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F0C8);
  }
  return result;
}

unint64_t sub_2145ED284()
{
  unint64_t result = qword_26780F0D8;
  if (!qword_26780F0D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F0E0);
    sub_214587BAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F0D8);
  }
  return result;
}

unint64_t sub_2145ED2F8()
{
  unint64_t result = qword_26780F0E8;
  if (!qword_26780F0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F0E8);
  }
  return result;
}

id sub_2145ED350()
{
  id v1 = objc_msgSend(v0, sel_image);
  id v2 = objc_msgSend(v0, sel_tintColor);
  return v1;
}

void sub_2145ED3A8(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  if (a1)
  {
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = v10;
    BOOL v12 = a4 > 0.0;
    if (a5 > 0.0) {
      BOOL v12 = 1;
    }
    *(void *)(v10 + 16) = a1;
    *(void *)(v10 + 24) = a1;
    *(void *)(v10 + 32) = a2;
    *(unsigned char *)(v10 + 40) = v12;
    id v13 = a2;
    id v14 = a1;
    sub_214602DA8();
    sub_214602548();
    uint64_t v15 = v21;
    uint64_t v16 = v22;
    uint64_t v17 = v23;
    uint64_t v18 = v24;

    long long v19 = v25;
    long long v20 = sub_2145ED534;
  }
  else
  {
    long long v20 = 0;
    uint64_t v11 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    long long v19 = 0uLL;
  }
  *(void *)a3 = v20;
  *(void *)(a3 + 8) = v11;
  *(void *)(a3 + 16) = v15;
  *(void *)(a3 + 24) = v16;
  *(void *)(a3 + 32) = v17;
  *(void *)(a3 + 40) = v18;
  *(_OWORD *)(a3 + 48) = v19;
}

uint64_t sub_2145ED4EC()
{
  return MEMORY[0x270FA0238](v0, 41, 7);
}

id sub_2145ED534@<X0>(uint64_t a1@<X8>)
{
  int v3 = *(void **)(v1 + 16);
  id v10 = *(id *)(v1 + 32);
  char v4 = *(unsigned char *)(v1 + 40);
  id v5 = objc_msgSend(self, sel_configurationWithScale_, 3);
  id v6 = objc_msgSend(v3, sel_imageWithSymbolConfiguration_, v5);

  sub_214602558();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v4;
  return v10;
}

id sub_2145ED5F8(void *a1)
{
  objc_msgSend(a1, sel_setTintColor_, *(void *)(v1 + 24));
  id v3 = *(id *)v1;
  if (objc_msgSend(*(id *)v1, sel_isSymbolImage))
  {
    if ((*(unsigned char *)(v1 + 32) & 1) != 0
      && (id v4 = objc_msgSend(v3, sel_symbolConfiguration)) != 0)
    {
      id v5 = v4;
      double v6 = *(double *)(v1 + 8);
      if (*(double *)(v1 + 16) < v6) {
        double v6 = *(double *)(v1 + 16);
      }
      id v7 = objc_msgSend(self, sel_configurationWithPointSize_, v6 * 0.48);
      id v8 = objc_msgSend(v5, sel_configurationByApplyingConfiguration_, v7);

      id v9 = objc_msgSend(v3, sel_imageWithConfiguration_, v8);
      objc_msgSend(a1, sel_setImage_, v9);
    }
    else
    {
      objc_msgSend(a1, sel_setImage_, v3);
    }
    uint64_t v10 = 4;
  }
  else
  {
    objc_msgSend(a1, sel_setImage_, v3);
    uint64_t v10 = 1;
  }
  return objc_msgSend(a1, sel_setContentMode_, v10);
}

unint64_t sub_2145ED77C()
{
  unint64_t result = qword_26780F100;
  if (!qword_26780F100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F100);
  }
  return result;
}

id sub_2145ED7D0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  objc_msgSend(v0, sel_setClipsToBounds_, 1);
  sub_2145ED5F8(v0);
  return v0;
}

uint64_t sub_2145ED828()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_2145ED834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2145EDCD4();
  return MEMORY[0x270F01788](a1, a2, a3, v6);
}

uint64_t sub_2145ED898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2145EDCD4();
  return MEMORY[0x270F01710](a1, a2, a3, v6);
}

void sub_2145ED8FC()
{
}

void *_s13RUIDescriptorVwCP(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void _s13RUIDescriptorVwxx_0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
}

uint64_t _s13RUIDescriptorVwca_0(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  id v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  return a1;
}

uint64_t _s13RUIDescriptorVwta_0(uint64_t a1, _OWORD *a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s13RUIDescriptorVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t _s13RUIDescriptorVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *_s13RUIDescriptorVMa_0()
{
  return &_s13RUIDescriptorVN_0;
}

void _s13RUIDescriptorV18ImageRepresentableVwxx(uint64_t a1)
{
  id v2 = *(void **)(a1 + 24);
}

uint64_t _s13RUIDescriptorV18ImageRepresentableVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  int v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t _s13RUIDescriptorV18ImageRepresentableVwca(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v7 = *(void **)(a1 + 24);
  id v8 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t _s13RUIDescriptorV18ImageRepresentableVwta(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t _s13RUIDescriptorV18ImageRepresentableVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13RUIDescriptorV18ImageRepresentableVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s13RUIDescriptorV18ImageRepresentableVMa()
{
  return &_s13RUIDescriptorV18ImageRepresentableVN;
}

unint64_t sub_2145EDCD4()
{
  unint64_t result = qword_26780F108;
  if (!qword_26780F108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F108);
  }
  return result;
}

void *RemoteUIModernTableViewCell.textLabel.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___RemoteUIModernTableViewCell__textLabel);
  id v2 = v1;
  return v1;
}

void *RemoteUIModernTableViewCell.imageView.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___RemoteUIModernTableViewCell__imageView);
  id v2 = v1;
  return v1;
}

void *RemoteUIModernTableViewCell.detailTextLabel.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel);
  id v2 = v1;
  return v1;
}

id RemoteUIModernTableViewCell.imageSize.getter()
{
  v1.super_class = (Class)RemoteUIModernTableViewCell;
  return objc_msgSendSuper2(&v1, sel_imageSize);
}

uint64_t RemoteUIModernTableViewCell.imageSize.setter()
{
  v2.super_class = (Class)RemoteUIModernTableViewCell;
  objc_msgSendSuper2(&v2, sel_setImageSize_);
  v1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v1[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v1);
  sub_2145F2F40();
  sub_214602988();
  return MEMORY[0x2166A3880](v1);
}

void __swiftcall RemoteUIModernTableViewCell.init(coder:)(RemoteUIModernTableViewCell_optional *__return_ptr retstr, NSCoder coder)
{
}

void *RemoteUIModernTableViewCell.webContainerView.getter()
{
  objc_super v1 = *(void **)(v0 + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView);
  id v2 = v1;
  return v1;
}

void RemoteUIModernTableViewCell.webContainerView.setter(void *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView);
  *(void *)(v1 + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView) = a1;
  id v3 = a1;

  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v4[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v4);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v4);
}

void __swiftcall RemoteUIModernTableViewCell.init(style:reuseIdentifier:)(RemoteUIModernTableViewCell *__return_ptr retstr, UITableViewCellStyle style, Swift::String_optional reuseIdentifier)
{
  if (reuseIdentifier.value._object)
  {
    int v4 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStyle_reuseIdentifier_, style, v4);
}

char *RemoteUIModernTableViewCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR___RemoteUIModernTableViewCell__textLabel;
  id v7 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v8 = v3;
  *(void *)&v3[v6] = objc_msgSend(v7, sel_init);
  uint64_t v9 = OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel;
  *(void *)&v8[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v10 = OBJC_IVAR___RemoteUIModernTableViewCell__imageView;
  *(void *)&v8[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  *(void *)&v8[OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_214603618()) {
    sub_2145F2BE0(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v11 = MEMORY[0x263F8EE88];
  }
  *(void *)&v8[OBJC_IVAR___RemoteUIModernTableViewCell_observers] = v11;
  BOOL v12 = &v8[OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler];
  *(void *)BOOL v12 = 0;
  *((void *)v12 + 1) = 0;
  id v13 = &v8[OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo];
  *(void *)id v13 = 0;
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  *(void *)&v8[OBJC_IVAR___RemoteUIModernTableViewCell_cellStyle] = a1;

  if (a3)
  {
    id v14 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v14 = 0;
  }
  v39.receiver = v8;
  v39.super_class = (Class)RemoteUIModernTableViewCell;
  uint64_t v15 = (char *)objc_msgSendSuper2(&v39, sel_initWithStyle_reuseIdentifier_, a1, v14);

  if (a1 == 3)
  {
    uint64_t v16 = *(void **)&v15[OBJC_IVAR___RemoteUIModernTableViewCell__textLabel];
    uint64_t v17 = v15;
    objc_msgSend(v16, sel_setNumberOfLines_, 0);
    uint64_t v18 = *(void **)&v17[OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel];
    objc_msgSend(v18, sel_setNumberOfLines_, 0);
    long long v19 = self;
    uint64_t v20 = *MEMORY[0x263F835B8];
    id v21 = v18;
    id v22 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);
    objc_msgSend(v21, sel_setFont_, v22);
  }
  else
  {
    uint64_t v23 = v15;
  }
  unsigned __int8 v24 = *(void **)&v15[OBJC_IVAR___RemoteUIModernTableViewCell__textLabel];
  objc_msgSend(v24, sel_setTextAlignment_, 4);
  uint64_t v25 = OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel;
  objc_msgSend(*(id *)&v15[OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel], sel_setTextAlignment_, 4);
  id v26 = v24;
  sub_2145EE808();

  id v27 = *(id *)&v15[v25];
  sub_2145EE808();

  uint64_t v28 = *(void **)&v15[OBJC_IVAR___RemoteUIModernTableViewCell__imageView];
  swift_getKeyPath();
  uint64_t v29 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_2145F3114;
  *(void *)(v30 + 24) = v29;
  id v31 = v28;
  char v32 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();

  v38[0] = (uint64_t)v31;
  swift_getKeyPath();
  uint64_t v33 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_2145F3114;
  *(void *)(v34 + 24) = v33;
  uint64_t v35 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();

  MEMORY[0x270FA5388](v36);
  v38[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v38[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v38);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v38);

  return v15;
}

void sub_2145EE808()
{
  swift_getKeyPath();
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = sub_2145F3114;
  *(void *)(v1 + 24) = v0;
  id v2 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();

  swift_getKeyPath();
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_2145F3114;
  *(void *)(v4 + 24) = v3;
  id v5 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();

  swift_getKeyPath();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2145F3114;
  *(void *)(v7 + 24) = v6;
  id v8 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();

  swift_getKeyPath();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_2145F3114;
  *(void *)(v10 + 24) = v9;
  uint64_t v11 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();

  swift_getKeyPath();
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_2145F3114;
  *(void *)(v13 + 24) = v12;
  id v14 = (void *)sub_214601FF8();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_2145D29F0();
  swift_endAccess();
}

uint64_t RemoteUIModernTableViewCell.setDetailLinkText(_:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)&v4[OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel];
  if (a2) {
    id v8 = (void *)sub_214602E78();
  }
  else {
    id v8 = 0;
  }
  objc_msgSend(v7, sel_setText_, v8);

  if (a3)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = a3;
    v9[3] = a4;
    v9[4] = v4;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_2145F3258;
    *(void *)(v10 + 24) = v9;
    uint64_t v11 = v4;
    uint64_t v12 = sub_2145F32D8;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v13 = (uint64_t (**)())&v4[OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler];
  uint64_t v14 = *(void *)&v4[OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler];
  *uint64_t v13 = v12;
  v13[1] = (uint64_t (*)())v10;
  sub_21458F1B8(a3);
  uint64_t v15 = sub_21458CF28(v14);
  MEMORY[0x270FA5388](v15);
  v17[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v17[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v17);
  sub_2145F2F40();
  sub_214602988();
  return MEMORY[0x2166A3880](v17);
}

void sub_2145EEF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = sub_21456BF24;
    v7[3] = &block_descriptor_6;
    uint64_t v6 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v6 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, a1, v6);
  _Block_release(v6);
}

id RemoteUIModernTableViewCell.forceFullSizeDetailLabel.getter()
{
  v1.super_class = (Class)RemoteUIModernTableViewCell;
  return objc_msgSendSuper2(&v1, sel_forceFullSizeDetailLabel);
}

uint64_t RemoteUIModernTableViewCell.forceFullSizeDetailLabel.setter(char a1)
{
  v3.super_class = (Class)RemoteUIModernTableViewCell;
  objc_msgSendSuper2(&v3, sel_setForceFullSizeDetailLabel_, a1 & 1);
  v2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v2[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v2);
  sub_2145F2F40();
  sub_214602988();
  return MEMORY[0x2166A3880](v2);
}

Swift::Void __swiftcall RemoteUIModernTableViewCell.tintColorDidChange()()
{
  v5.super_class = (Class)RemoteUIModernTableViewCell;
  objc_msgSendSuper2(&v5, sel_tintColorDidChange);
  id v1 = objc_msgSend(v0, sel_imageView);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v0, sel_imageView);
    id v4 = objc_msgSend(v3, sel_tintColor);

    if (!v4) {
      id v4 = objc_msgSend(v0, sel_tintColor);
    }
    objc_msgSend(v2, sel_setTintColor_, v4);
  }
}

uint64_t RemoteUIModernTableViewCell.setHTMLData(_:sourceURL:delegate:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780DEF0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_214586198(0, &qword_26780DEF8);
  sub_2145553A4(a3, (uint64_t)v12, &qword_26780DEF0);
  sub_2145560FC(a1, a2);
  id v13 = sub_214580384(a1, a2, (uint64_t)v12);
  uint64_t v14 = OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView;
  uint64_t v15 = *(void **)(v5 + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView);
  *(void *)(v5 + OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView) = v13;

  id v16 = *(id *)(v5 + v14);
  if (v16) {
    id v16 = objc_msgSend(v16, sel_setDelegate_, a4);
  }
  MEMORY[0x270FA5388](v16);
  *(&v18 - 2) = v5;
  v19[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v19[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v19);
  sub_2145F2F40();
  sub_214602988();
  return MEMORY[0x2166A3880](v19);
}

Swift::Void __swiftcall RemoteUIModernTableViewCell.setImage(_:padding:tintColor:)(UIImage_optional _, UIEdgeInsets padding, UIColor_optional tintColor)
{
  uint64_t v4 = *(void *)&_.is_nil;
  Class isa = _.value.super.isa;
  id v6 = objc_msgSend(v3, sel_imageView, tintColor.value.super.isa, *(void *)&tintColor.is_nil, padding.top, padding.left, padding.bottom, padding.right);
  objc_msgSend(v6, sel_setImage_, isa);

  id v7 = objc_msgSend(v3, sel_imageView);
  objc_msgSend(v7, sel_setTintColor_, v4);
}

Swift::Void __swiftcall RemoteUIModernTableViewCell.setBadgeImage(_:tintColor:isCircular:)(UIImage_optional _, UIColor_optional tintColor, Swift::Bool isCircular)
{
  Class isa = _.value.super.isa;
  if (_.value.super.isa)
  {
    uint64_t v5 = *(void **)&_.is_nil;
    char v6 = (uint64_t)tintColor.value.super.isa & 1;
    id v7 = *(id *)&_.is_nil;
  }
  else
  {
    uint64_t v5 = 0;
    char v6 = 0;
  }
  uint64_t v8 = v3 + OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo;
  uint64_t v9 = *(void **)(v3 + OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo);
  uint64_t v10 = *(void **)(v3 + OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo + 8);
  *(void *)uint64_t v8 = isa;
  *(void *)(v8 + 8) = v5;
  *(unsigned char *)(v8 + 16) = v6;
  uint64_t v11 = isa;
  sub_2145F3300(isa, v5);
  sub_2145F3340(v9, v10);
  MEMORY[0x270FA5388](v12);
  v13[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v13[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v13);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v13);
  sub_2145F3340(isa, v5);
}

uint64_t RemoteUIModernTableViewCell.shouldSkipCustomLayout.getter()
{
  return 1;
}

void sub_2145EFAB4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_text);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_214602EA8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_2145EFB1C(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_214602E78();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setText_);
}

id sub_2145EFB8C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_textColor);
  *a2 = result;
  return result;
}

id sub_2145EFBC8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTextColor_, *a1);
}

id sub_2145EFBDC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_font);
  *a2 = result;
  return result;
}

id sub_2145EFC18(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFont_, *a1);
}

id sub_2145EFC2C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_numberOfLines);
  *a2 = result;
  return result;
}

id sub_2145EFC60(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNumberOfLines_, *a1);
}

id sub_2145EFC74@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_textAlignment);
  *a2 = result;
  return result;
}

id sub_2145EFCA8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTextAlignment_, *a1);
}

id sub_2145EFCBC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_image);
  *a2 = result;
  return result;
}

id sub_2145EFCF8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setImage_, *a1);
}

id sub_2145EFD0C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_tintColor);
  *a2 = result;
  return result;
}

id sub_2145EFD48(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTintColor_, *a1);
}

id sub_2145EFD5C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  sub_214586538((uint64_t *)v30);
  long long v28 = v30[1];
  long long v29 = v30[0];
  uint64_t v26 = v32;
  uint64_t v27 = v31;
  sub_214586538((uint64_t *)v33);
  long long v24 = v33[1];
  long long v25 = v33[0];
  uint64_t v4 = v34;
  uint64_t v5 = v35;
  id v6 = sub_2145ED350();
  uint64_t v8 = v7;
  objc_msgSend(a1, sel_imageSize);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  id v13 = *(void **)&a1[OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView];
  uint64_t v14 = *(void *)&a1[OBJC_IVAR___RemoteUIModernTableViewCell_cellStyle];
  id v15 = v13;
  unsigned __int8 v16 = objc_msgSend(a1, sel_forceFullSizeDetailLabel);
  unsigned __int8 v17 = objc_msgSend(a1, sel_leftAlignDetailLabel);
  uint64_t v19 = *(void *)&a1[OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler];
  uint64_t v18 = *(void *)&a1[OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler + 8];
  uint64_t v20 = &a1[OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo];
  id v21 = *(void **)&a1[OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo];
  id v22 = (void *)*((void *)v20 + 1);
  *(_OWORD *)a2 = v29;
  *(_OWORD *)(a2 + 16) = v28;
  *(void *)(a2 + 32) = v27;
  *(void *)(a2 + 40) = v26;
  *(_OWORD *)(a2 + 48) = v25;
  *(_OWORD *)(a2 + 64) = v24;
  *(void *)(a2 + 80) = v4;
  *(void *)(a2 + 88) = v5;
  *(void *)(a2 + 96) = v6;
  *(void *)(a2 + 104) = v8;
  *(void *)(a2 + 112) = v10;
  *(void *)(a2 + 120) = v12;
  *(void *)(a2 + 128) = v13;
  *(void *)(a2 + 136) = v14;
  *(unsigned char *)(a2 + 144) = v16;
  *(unsigned char *)(a2 + 145) = v17;
  *(void *)(a2 + 152) = v19;
  *(void *)(a2 + 160) = v18;
  *(void *)(a2 + 168) = v21;
  *(void *)(a2 + 176) = v22;
  *(unsigned char *)(a2 + 184) = v20[16];
  sub_21458F1B8(v19);
  return sub_2145F3300(v21, v22);
}

uint64_t sub_2145EFF00()
{
  if (*(void *)(v0 + 136) > 1uLL && (int v1 = sub_21458661C()) != 0)
  {
    if (v1 == 1) {
      sub_214602838();
    }
    else {
      sub_214602858();
    }
  }
  else
  {
    sub_214602848();
  }
  sub_214602838();
  if (sub_214602828())
  {
    return sub_214602DA8();
  }
  else
  {
    sub_214602858();
    if (sub_214602828())
    {
      return MEMORY[0x270F050A0]();
    }
    else
    {
      return sub_214602DB8();
    }
  }
}

uint64_t sub_2145EFFE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F160);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v38[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F168);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v38[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F170);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v38[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = *(void **)(a1 + 128);
  if (v15)
  {
    id v16 = v15;
    unsigned __int8 v17 = (void *)nullsub_1(v16);
    uint64_t v18 = sub_214602DB8();
    sub_2145F038C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v38, 0.0, 1, 0.0, 1, v18, v19, v17);

    id v21 = (void *)v38[0];
    uint64_t v20 = v38[1];
    char v22 = v39;
    uint64_t v23 = v40;
    char v24 = v41;
    uint64_t v25 = v42;
    char v26 = v43;
    uint64_t v27 = v44;
    char v28 = v45;
    uint64_t v29 = v46;
    char v30 = v47;
    uint64_t v31 = v48;
    char v32 = v49;
    long long v33 = v50;
    *(void *)uint64_t v11 = v38[0];
    *((void *)v11 + 1) = v20;
    v11[16] = v22;
    *((void *)v11 + 3) = v23;
    v11[32] = v24;
    *((void *)v11 + 5) = v25;
    v11[48] = v26;
    *((void *)v11 + 7) = v27;
    v11[64] = v28;
    *((void *)v11 + 9) = v29;
    v11[80] = v30;
    *((void *)v11 + 11) = v31;
    v11[96] = v32;
    *(_OWORD *)(v11 + 104) = v33;
    swift_storeEnumTagMultiPayload();
    id v34 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F180);
    sub_2145F3E48(&qword_26780F188, &qword_26780F180, (void (*)(void))sub_21456F154);
    sub_21455B000(&qword_26780F190, &qword_26780F160);
    sub_214602958();
  }
  else
  {
    *(void *)uint64_t v8 = sub_214602798();
    *((void *)v8 + 1) = 0;
    unsigned char v8[16] = 1;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F178);
    sub_2145F0900(a2, (uint64_t)&v8[*(int *)(v35 + 44)]);
    sub_2145553A4((uint64_t)v8, (uint64_t)v11, &qword_26780F160);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F180);
    sub_2145F3E48(&qword_26780F188, &qword_26780F180, (void (*)(void))sub_21456F154);
    sub_21455B000(&qword_26780F190, &qword_26780F160);
    sub_214602958();
    sub_2145515B8((uint64_t)v8, &qword_26780F160);
  }
  sub_214566B8C((uint64_t)v14, a3, &qword_26780F170);
  return sub_2145F3CCC(a2);
}

id sub_2145F038C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void *a16)
{
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
    sub_2146031F8();
    uint64_t v25 = (void *)sub_214602A78();
    sub_214602258();
  }
  sub_214602668();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;
  return a16;
}

__n128 sub_2145F0554@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    sub_2146031F8();
    uint64_t v23 = (void *)sub_214602A78();
    sub_214602258();
  }
  sub_214602668();
  sub_2145553A4(v13, a9, &qword_26780F198);
  char v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780F1A0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *char v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 sub_2145F0714@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    sub_2146031F8();
    uint64_t v23 = (void *)sub_214602A78();
    sub_214602258();
  }
  sub_214602668();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780F1D0) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_2145F0900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F198);
  MEMORY[0x270FA5388](v3 - 8);
  char v45 = (uint64_t *)((char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1A0);
  uint64_t v6 = ((uint64_t (*)(uint64_t))MEMORY[0x270FA5388])(v5 - 8);
  uint64_t v48 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = ((uint64_t (*)(uint64_t))MEMORY[0x270FA5388])(v6);
  uint64_t v46 = (uint64_t)&v42 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v47 = (uint64_t)&v42 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1A8);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1B0);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = ((uint64_t (*)(uint64_t))MEMORY[0x270FA5388])(v15);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v42 - v20;
  sub_2145ED3A8(*(void **)(a1 + 96), *(void **)(a1 + 104), (uint64_t)&v50, *(double *)(a1 + 112), *(double *)(a1 + 120));
  long long v43 = v51;
  long long v44 = v50;
  long long v42 = v52;
  uint64_t v22 = v53;
  uint64_t v23 = v54;
  uint64_t v24 = sub_214602D98();
  uint64_t v26 = v25;
  sub_2145F0D04(a1, (uint64_t)v14);
  long long v27 = (uint64_t *)&v14[*(int *)(v12 + 44)];
  *long long v27 = v24;
  v27[1] = v26;
  uint64_t v28 = *(int *)(v16 + 44);
  uint64_t v29 = (uint64_t)v21;
  sub_2145553A4((uint64_t)v14, (uint64_t)&v19[v28], &qword_26780F1A8);
  long long v30 = v43;
  *(_OWORD *)uint64_t v19 = v44;
  *((_OWORD *)v19 + 1) = v30;
  *((_OWORD *)v19 + 2) = v42;
  *((void *)v19 + 6) = v22;
  *((void *)v19 + 7) = v23;
  sub_2145515B8((uint64_t)v14, &qword_26780F1A8);
  sub_214566B8C((uint64_t)v19, (uint64_t)v21, &qword_26780F1B0);
  if (*(void *)(a1 + 136) > 1uLL
    && (long long v31 = *(_OWORD *)(a1 + 16),
        long long v50 = *(_OWORD *)a1,
        long long v51 = v31,
        long long v52 = *(_OWORD *)(a1 + 32),
        (int v32 = sub_21458661C()) != 0))
  {
    if (v32 == 1) {
      uint64_t v33 = sub_214602838();
    }
    else {
      uint64_t v33 = sub_214602858();
    }
  }
  else
  {
    uint64_t v33 = sub_214602848();
  }
  uint64_t v34 = (uint64_t)v45;
  *char v45 = v33;
  *(void *)(v34 + 8) = 0;
  *(unsigned char *)(v34 + 16) = 1;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1B8);
  sub_2145F170C(a1, v34 + *(int *)(v35 + 44));
  sub_214602DA8();
  uint64_t v36 = v46;
  sub_2145F0554(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v46, 0.0, 1, 0.0, 1);
  sub_2145515B8(v34, &qword_26780F198);
  uint64_t v37 = v47;
  sub_214566B8C(v36, v47, &qword_26780F1A0);
  sub_2145553A4(v29, (uint64_t)v19, &qword_26780F1B0);
  uint64_t v38 = v48;
  sub_2145553A4(v37, v48, &qword_26780F1A0);
  uint64_t v39 = v49;
  sub_2145553A4((uint64_t)v19, v49, &qword_26780F1B0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1C0);
  sub_2145553A4(v38, v39 + *(int *)(v40 + 48), &qword_26780F1A0);
  sub_2145515B8(v37, &qword_26780F1A0);
  sub_2145515B8(v29, &qword_26780F1B0);
  sub_2145515B8(v38, &qword_26780F1A0);
  return sub_2145515B8((uint64_t)v19, &qword_26780F1B0);
}

uint64_t sub_2145F0D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2146029B8();
  uint64_t v88 = *(void *)(v4 - 8);
  uint64_t v89 = v4;
  MEMORY[0x270FA5388](v4);
  char v87 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780E6A8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v86 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780E6B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780E6B8);
  MEMORY[0x270FA5388](v93);
  uint64_t v13 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2B8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2C0);
  MEMORY[0x270FA5388](v91);
  uint64_t v18 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2C8);
  MEMORY[0x270FA5388](v92);
  uint64_t v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2D0);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  MEMORY[0x270FA5388](v22);
  long long v27 = *(void **)(a1 + 168);
  if (v27)
  {
    uint64_t v78 = v13;
    uint64_t v79 = (uint64_t)&v71 - v25;
    uint64_t v80 = v26;
    uint64_t v81 = v24;
    uint64_t v73 = v11;
    uint64_t v82 = v7;
    uint64_t v83 = v23;
    uint64_t v84 = v6;
    uint64_t v85 = a2;
    uint64_t v28 = *(void **)(a1 + 176);
    int v90 = *(unsigned __int8 *)(a1 + 184);
    id v29 = v28;
    id v30 = v27;
    sub_21457B9DC();
    id v77 = v30;
    unsigned __int8 v31 = objc_msgSend(v30, sel_isSymbolImage);
    uint64_t v32 = sub_214602CA8();
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v34 = (unsigned int *)MEMORY[0x263F1B508];
    if ((v31 & (v28 != 0)) == 0) {
      uint64_t v34 = (unsigned int *)MEMORY[0x263F1B500];
    }
    (*(void (**)(char *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v16, *v34, v32);
    sub_214602CA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v16, 0, 1, v32);
    uint64_t v35 = sub_214602C98();
    swift_release();
    sub_2145515B8((uint64_t)v16, &qword_26780F2B8);
    if (v28) {
      uint64_t v36 = MEMORY[0x2166A32A0](v29);
    }
    else {
      uint64_t v36 = sub_214602C58();
    }
    uint64_t v39 = v36;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v41 = v84;
    char v42 = v90;
    uint64_t v75 = v39;
    uint64_t v76 = v35;
    uint64_t v74 = KeyPath;
    if (v90)
    {
      sub_21459D180();
      uint64_t v72 = sub_214602D88();
      uint64_t v43 = sub_214602DA8();
      uint64_t v45 = v44;
      uint64_t v46 = v87;
      sub_2146029A8();
      uint64_t v48 = v88;
      uint64_t v47 = v89;
      uint64_t v49 = (uint64_t)v86;
      (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v86, v46, v89);
      *(_WORD *)(v49 + *(int *)(v41 + 56)) = 256;
      long long v50 = v46;
      char v42 = v90;
      (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v47);
      uint64_t v51 = (uint64_t)v73;
      sub_214566B8C(v49, (uint64_t)v73, &qword_26780E6A8);
      uint64_t v52 = 0;
    }
    else
    {
      sub_21459D12C();
      uint64_t v72 = sub_214602D88();
      uint64_t v52 = 1;
      uint64_t v43 = sub_214602DA8();
      uint64_t v45 = v53;
      uint64_t v51 = (uint64_t)v73;
    }
    uint64_t v54 = v91;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56))(v51, v52, 1, v41);
    uint64_t v55 = v51;
    uint64_t v56 = (uint64_t)v78;
    sub_214566B8C(v55, (uint64_t)v78, &qword_26780E6B0);
    uint64_t v57 = (uint64_t *)(v56 + *(int *)(v93 + 36));
    *uint64_t v57 = v43;
    v57[1] = v45;
    sub_2145553A4(v56, (uint64_t)&v18[*(int *)(v54 + 36)], &qword_26780E6B8);
    uint64_t v58 = v74;
    *(void *)uint64_t v18 = v76;
    *((void *)v18 + 1) = v58;
    uint64_t v59 = v72;
    *((void *)v18 + 2) = v75;
    *((void *)v18 + 3) = v59;
    *((_WORD *)v18 + 16) = 256;
    sub_2145515B8(v56, &qword_26780E6B8);
    uint64_t v60 = sub_214602DA8();
    uint64_t v62 = v61;
    uint64_t v63 = (uint64_t)&v20[*(int *)(v92 + 36)];
    sub_2145F1468(v42 & 1, v63);
    unint64_t v64 = (uint64_t *)(v63 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780E6E0) + 36));
    *unint64_t v64 = v60;
    v64[1] = v62;
    sub_214566B8C((uint64_t)v18, (uint64_t)v20, &qword_26780F2C0);

    uint64_t v65 = v80;
    sub_2145553A4((uint64_t)v20, v80, &qword_26780F2C8);
    uint64_t v66 = v83;
    *(_OWORD *)(v65 + *(int *)(v83 + 36)) = xmmword_214615AB0;
    sub_2145515B8((uint64_t)v20, &qword_26780F2C8);
    uint64_t v67 = v65;
    uint64_t v68 = v79;
    sub_214566B8C(v67, v79, &qword_26780F2D0);
    uint64_t v69 = v68;
    uint64_t v70 = v85;
    sub_214566B8C(v69, v85, &qword_26780F2D0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v81 + 56))(v70, 0, 1, v66);
  }
  else
  {
    uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 56);
    return v37(a2, 1, 1);
  }
}

uint64_t sub_2145F1468@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2146029B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780E6F0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v24[0] = v9;
    sub_2146029A8();
    sub_2146024F8();
    uint64_t v12 = v24[1];
    uint64_t v13 = v24[3];
    uint64_t v14 = v24[4];
    uint64_t v15 = v24[5];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780E6F8);
    uint64_t v17 = v24[2];
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(&v11[*(int *)(v16 + 52)], v7, v4);
    *(void *)uint64_t v11 = v12;
    *((void *)v11 + 1) = v17;
    *((void *)v11 + 2) = v13;
    *((void *)v11 + 3) = v14;
    *((void *)v11 + 4) = v15;
    *(_WORD *)&v11[*(int *)(v16 + 56)] = 256;
    uint64_t v18 = sub_214602DA8();
    uint64_t v20 = v19;
    uint64_t v21 = (uint64_t *)&v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780E700) + 36)];
    *uint64_t v21 = v18;
    v21[1] = v20;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_214566B8C((uint64_t)v11, a2, &qword_26780E6F0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v24[0] + 56))(a2, 0, 1, v8);
  }
  else
  {
    uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v23(a2, 1, 1, v8);
  }
}

uint64_t sub_2145F170C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1C8);
  uint64_t v29 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1D0);
  uint64_t v6 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1D8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1E0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v28 - v19;
  *(void *)uint64_t v20 = sub_214602798();
  *((void *)v20 + 1) = 0;
  uint64_t v21 = 1;
  v20[16] = 1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1E8);
  sub_2145F1AB0((long long *)a1, &v20[*(int *)(v22 + 44)]);
  if (*(void *)(a1 + 136) == 3)
  {
    long long v23 = *(_OWORD *)(a1 + 64);
    long long v32 = *(_OWORD *)(a1 + 48);
    long long v33 = v23;
    long long v34 = *(_OWORD *)(a1 + 80);
    uint64_t v28 = v3;
    sub_214586638(0, (uint64_t)v5);
    sub_2145EFF00();
    __n128 v24 = sub_2145F0714(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v8, 0.0, 1, 0.0, 1);
    (*(void (**)(char *, uint64_t, __n128))(v29 + 8))(v5, v28, v24);
    sub_214566B8C((uint64_t)v8, (uint64_t)v14, &qword_26780F1D0);
    uint64_t v21 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, v21, 1, v30);
  sub_2145553A4((uint64_t)v20, (uint64_t)v18, &qword_26780F1E0);
  sub_2145553A4((uint64_t)v14, (uint64_t)v12, &qword_26780F1D8);
  uint64_t v25 = v31;
  sub_2145553A4((uint64_t)v18, v31, &qword_26780F1E0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1F0);
  sub_2145553A4((uint64_t)v12, v25 + *(int *)(v26 + 48), &qword_26780F1D8);
  sub_2145515B8((uint64_t)v14, &qword_26780F1D8);
  sub_2145515B8((uint64_t)v20, &qword_26780F1E0);
  sub_2145515B8((uint64_t)v12, &qword_26780F1D8);
  return sub_2145515B8((uint64_t)v18, &qword_26780F1E0);
}

uint64_t sub_2145F1AB0@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  v142 = a2;
  uint64_t v131 = sub_214602658();
  uint64_t v110 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  uint64_t v109 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1F8);
  uint64_t v108 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  uint64_t v107 = (char *)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F200);
  uint64_t v112 = *(void *)(v132 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v132);
  v106 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v111 = (char *)&v105 - v7;
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F208);
  MEMORY[0x270FA5388](v126);
  uint64_t v127 = (uint64_t)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F210);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v130 = (uint64_t)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v129 = (char *)&v105 - v12;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F218);
  MEMORY[0x270FA5388](v118);
  uint64_t v119 = (char *)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F220);
  MEMORY[0x270FA5388](v122);
  uint64_t v121 = (uint64_t)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F228);
  unint64_t v123 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v120 = (uint64_t)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F230);
  MEMORY[0x270FA5388](v133);
  uint64_t v134 = (char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F238);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v141 = (uint64_t *)((char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v18);
  uint64_t v140 = (uint64_t)&v105 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F1C8);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v114 = (uint64_t)&v105 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v105 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F240);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F248);
  v135 = *(void **)(v136 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v136);
  v139 = (char *)&v105 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  long long v34 = (char *)&v105 - v33;
  MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v105 - v35;
  long long v37 = a1[1];
  long long v157 = *a1;
  long long v158 = v37;
  long long v159 = a1[2];
  sub_214586638(0, (uint64_t)v26);
  int v115 = *((unsigned __int8 *)a1 + 144);
  if (v115) {
    double v38 = 0.0;
  }
  else {
    double v38 = 1.0;
  }
  unint64_t v113 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v113(v29, v26, v21);
  *(double *)&v29[*(int *)(v27 + 36)] = v38;
  uint64_t v39 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v117 = v21;
  uint64_t v116 = v22 + 8;
  v39(v26, v21);
  uint64_t v40 = (void (*)(uint64_t, uint64_t))v39;
  unsigned int v137 = *((unsigned __int8 *)a1 + 145);
  uint64_t v41 = v137 ^ 1;
  uint64_t v42 = sub_2145EFF00();
  uint64_t v44 = v43;
  unint64_t v45 = sub_2145F3D90();
  int v125 = v41;
  uint64_t v46 = v44;
  uint64_t v47 = v135;
  sub_21456EA30(v41, v42, v46, v27, v45, (uint64_t)v34);
  uint64_t v48 = a1;
  uint64_t v49 = (uint64_t)v29;
  uint64_t v50 = v136;
  sub_2145515B8(v49, &qword_26780F240);
  uint64_t v51 = (void (*)(char *, char *, uint64_t))v47[4];
  v138 = v36;
  v51(v36, v34, v50);
  if (*((void *)a1 + 17) > 1uLL)
  {
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F268);
    uint64_t v55 = v140;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v140, 1, 1, v54);
    uint64_t v56 = (uint64_t)v141;
  }
  else
  {
    uint64_t v52 = *((void *)a1 + 19);
    uint64_t v105 = *((void *)a1 + 20);
    if (v52) {
      uint64_t v53 = sub_214602C48();
    }
    else {
      uint64_t v53 = 0;
    }
    long long v57 = v48[4];
    long long v154 = v48[3];
    long long v155 = v57;
    long long v156 = v48[5];
    uint64_t v58 = v114;
    sub_214586638(v53, v114);
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v60 = (uint64_t)v119;
    uint64_t v61 = v117;
    v113(v119, (char *)v58, v117);
    uint64_t v62 = v60 + *(int *)(v118 + 36);
    *(void *)uint64_t v62 = KeyPath;
    *(unsigned char *)(v62 + 8) = 1;
    v40(v58, v61);
    sub_214602DA8();
    sub_214602668();
    uint64_t v63 = v121;
    sub_2145553A4(v60, v121, &qword_26780F218);
    uint64_t v64 = v122;
    uint64_t v65 = (_OWORD *)(v63 + *(int *)(v122 + 36));
    long long v66 = v152;
    v65[4] = v151;
    v65[5] = v66;
    v65[6] = v153;
    long long v67 = v148;
    *uint64_t v65 = v147;
    v65[1] = v67;
    long long v68 = v150;
    v65[2] = v149;
    v65[3] = v68;
    sub_2145515B8(v60, &qword_26780F218);
    uint64_t v69 = sub_214602DB8();
    uint64_t v71 = v70;
    uint64_t v72 = sub_2145F3E48(&qword_26780F278, &qword_26780F220, (void (*)(void))sub_2145F3EC8);
    uint64_t v73 = v120;
    sub_21456EA30(v137, v69, v71, v64, v72, v120);
    sub_2145515B8(v63, &qword_26780F220);
    if (v115) {
      double v74 = 1.0;
    }
    else {
      double v74 = 0.0;
    }
    unint64_t v75 = v123;
    uint64_t v76 = (uint64_t)v134;
    uint64_t v77 = v124;
    (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v134, v73, v124);
    *(double *)(v76 + *(int *)(v133 + 36)) = v74;
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v73, v77);
    if (v52)
    {
      uint64_t v78 = swift_allocObject();
      uint64_t v79 = v105;
      *(void *)(v78 + 16) = v52;
      *(void *)(v78 + 24) = v79;
      MEMORY[0x270FA5388](v78);
      unint64_t v123 = sub_2145F3FD8();
      swift_retain_n();
      uint64_t v124 = v52;
      uint64_t v80 = v107;
      sub_214602D08();
      uint64_t v81 = v109;
      sub_214602648();
      uint64_t v82 = sub_21455B000(&qword_26780F298, &qword_26780F1F8);
      unint64_t v83 = sub_2145F3F80();
      uint64_t v84 = v106;
      uint64_t v85 = v128;
      uint64_t v86 = v131;
      sub_214602BC8();
      (*(void (**)(char *, uint64_t))(v110 + 8))(v81, v86);
      (*(void (**)(char *, uint64_t))(v108 + 8))(v80, v85);
      uint64_t v87 = v112;
      uint64_t v88 = v50;
      uint64_t v89 = v111;
      uint64_t v90 = v132;
      (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v111, v84, v132);
      (*(void (**)(uint64_t, char *, uint64_t))(v87 + 16))(v127, v89, v90);
      swift_storeEnumTagMultiPayload();
      uint64_t v143 = v85;
      uint64_t v144 = v86;
      uint64_t v145 = v82;
      unint64_t v146 = v83;
      swift_getOpaqueTypeConformance2();
      uint64_t v91 = (uint64_t)v129;
      uint64_t v76 = (uint64_t)v134;
      sub_214602958();
      sub_21458CF28(v124);
      uint64_t v92 = v89;
      uint64_t v50 = v88;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v92, v90);
    }
    else
    {
      sub_2145553A4(v76, v127, &qword_26780F230);
      swift_storeEnumTagMultiPayload();
      uint64_t v93 = sub_21455B000(&qword_26780F298, &qword_26780F1F8);
      unint64_t v94 = sub_2145F3F80();
      uint64_t v143 = v128;
      uint64_t v144 = v131;
      uint64_t v145 = v93;
      unint64_t v146 = v94;
      swift_getOpaqueTypeConformance2();
      sub_2145F3FD8();
      uint64_t v91 = (uint64_t)v129;
      sub_214602958();
    }
    uint64_t v95 = v130;
    sub_2145553A4(v91, v130, &qword_26780F210);
    uint64_t v56 = (uint64_t)v141;
    void *v141 = 0;
    *(unsigned char *)(v56 + 8) = v125;
    *(unsigned char *)(v56 + 9) = v137;
    uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2B0);
    sub_2145553A4(v95, v56 + *(int *)(v96 + 48), &qword_26780F210);
    sub_2145515B8(v91, &qword_26780F210);
    sub_2145515B8(v95, &qword_26780F210);
    uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F268);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v56, 0, 1, v97);
    uint64_t v55 = v140;
    sub_214566B8C(v56, v140, &qword_26780F238);
    sub_2145515B8(v76, &qword_26780F230);
  }
  uint64_t v98 = (void (*)(char *, char *, uint64_t))v47[2];
  v99 = v139;
  uint64_t v100 = v138;
  v98(v139, v138, v50);
  sub_2145553A4(v55, v56, &qword_26780F238);
  uint64_t v101 = v142;
  v98(v142, v99, v50);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F270);
  sub_2145553A4(v56, (uint64_t)&v101[*(int *)(v102 + 48)], &qword_26780F238);
  sub_2145515B8(v55, &qword_26780F238);
  unint64_t v103 = (void (*)(char *, uint64_t))v47[1];
  v103(v100, v50);
  sub_2145515B8(v56, &qword_26780F238);
  return ((uint64_t (*)(char *, uint64_t))v103)(v99, v50);
}

uint64_t sub_2145F2AB8@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[9];
  v9[8] = v1[8];
  v9[9] = v3;
  v10[0] = v1[10];
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)v1 + 169);
  long long v4 = v1[5];
  v9[4] = v1[4];
  v9[5] = v4;
  long long v5 = v1[7];
  v9[6] = v1[6];
  v9[7] = v5;
  long long v6 = v1[1];
  v9[0] = *v1;
  v9[1] = v6;
  long long v7 = v1[3];
  v9[2] = v1[2];
  v9[3] = v7;
  sub_2145F3C08((uint64_t)v9);
  return sub_2145EFFE0((uint64_t)v9, (uint64_t)v9, a1);
}

uint64_t sub_2145F2B30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_214602698();
  *a1 = result;
  return result;
}

uint64_t sub_2145F2B5C()
{
  return sub_2146026A8();
}

uint64_t sub_2145F2B88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2146026B8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2145F2BB8()
{
  return sub_2146026C8();
}

void sub_2145F2BE0(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_214603618();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED88);
      uint64_t v3 = sub_214603488();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_214603618();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v42 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v40 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x2166A3B40](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      uint64_t v12 = sub_214603268();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_214601FC8();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_214603278();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v40;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_214603278();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v40;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    id v26 = *(id *)(v1 + 32 + 8 * v25);
    uint64_t v27 = sub_214603268();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_214601FC8();
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_214603278();

      if (v34) {
        goto LABEL_24;
      }
      uint64_t v35 = ~v28;
      unint64_t v29 = (v29 + 1) & v35;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
          char v37 = sub_214603278();

          if (v37) {
            break;
          }
          unint64_t v29 = (v29 + 1) & v35;
          unint64_t v30 = v29 >> 6;
          uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
          uint64_t v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v42;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v42;
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

id sub_2145F2F38@<X0>(uint64_t a1@<X8>)
{
  return sub_2145EFD5C(*(char **)(v1 + 16), a1);
}

unint64_t sub_2145F2F40()
{
  unint64_t result = qword_267819550[0];
  if (!qword_267819550[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267819550);
  }
  return result;
}

void _sSo27RemoteUIModernTableViewCellC0A2UIE5coderABSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = OBJC_IVAR___RemoteUIModernTableViewCell__textLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v2 = OBJC_IVAR___RemoteUIModernTableViewCell__detailLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v3 = OBJC_IVAR___RemoteUIModernTableViewCell__imageView;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  *(void *)&v0[OBJC_IVAR___RemoteUIModernTableViewCell__webContainerView] = 0;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_214603618()) {
    sub_2145F2BE0(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v4 = MEMORY[0x263F8EE88];
  }
  *(void *)&v0[OBJC_IVAR___RemoteUIModernTableViewCell_observers] = v4;
  uint64_t v5 = &v0[OBJC_IVAR___RemoteUIModernTableViewCell_detailLinkHandler];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v0[OBJC_IVAR___RemoteUIModernTableViewCell_badgeInfo];
  v6[16] = 0;
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;

  sub_214603608();
  __break(1u);
}

char *keypath_get_selector_image()
{
  return sel_image;
}

uint64_t sub_2145F30DC()
{
  swift_unknownObjectUnownedDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2145F3114()
{
}

uint64_t sub_2145F312C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

char *keypath_get_selector_tintColor()
{
  return sel_tintColor;
}

void sub_2145F3164()
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F128);
  v1[4] = sub_21455B000(&qword_26780F130, &qword_26780F128);
  __swift_allocate_boxed_opaque_existential_0(v1);
  sub_2145F2F40();
  sub_214602988();
  MEMORY[0x2166A3880](v1);
}

uint64_t sub_2145F3218()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2145F3258()
{
  return (*(uint64_t (**)(void, uint64_t (*)(), void))(v0 + 16))(*(void *)(v0 + 32), nullsub_1, 0);
}

uint64_t sub_2145F32A0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2145F32D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_2145F3300(id result, void *a2)
{
  if (result)
  {
    id v3 = result;
    id v2 = a2;
    return v3;
  }
  return result;
}

void sub_2145F3340(void *a1, void *a2)
{
  if (a1)
  {
  }
}

uint64_t type metadata accessor for RemoteUIModernTableViewCell(uint64_t a1)
{
  return sub_214586198(a1, qword_267819568);
}

void _s11ContentViewVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 152)) {
    swift_release();
  }
  id v2 = *(void **)(a1 + 168);
  if (v2)
  {

    id v3 = *(void **)(a1 + 176);
  }
}

uint64_t _s11ContentViewVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  uint64_t v7 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v8 = *(void **)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(void **)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  uint64_t v11 = (_OWORD *)(a2 + 152);
  uint64_t v10 = *(void *)(a2 + 152);
  uint64_t v12 = *(void **)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v12;
  uint64_t v13 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v13;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v14 = *(void *)(a2 + 136);
  uint64_t v28 = *(void **)(a2 + 128);
  uint64_t v29 = v10;
  *(void *)(a1 + 128) = v28;
  *(void *)(a1 + 136) = v14;
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  id v15 = v6;
  id v16 = v7;
  swift_bridgeObjectRetain();
  id v17 = v8;
  id v18 = v9;
  id v19 = v12;
  id v20 = v13;
  id v21 = v28;
  if (v29)
  {
    uint64_t v22 = *(void *)(a2 + 160);
    *(void *)(a1 + 152) = v29;
    *(void *)(a1 + 160) = v22;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 152) = *v11;
  }
  uint64_t v23 = *(void **)(a2 + 168);
  if (v23)
  {
    uint64_t v24 = *(void **)(a2 + 176);
    *(void *)(a1 + 168) = v23;
    *(void *)(a1 + 176) = v24;
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
    id v25 = v23;
    id v26 = v24;
  }
  else
  {
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  }
  return a1;
}

uint64_t _s11ContentViewVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v8;
  id v9 = v8;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a2 + 64);
  uint64_t v11 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v10;
  id v12 = v10;

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v13 = *(void **)(a1 + 80);
  uint64_t v14 = *(void **)(a2 + 80);
  *(void *)(a1 + 80) = v14;
  id v15 = v14;

  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  id v16 = *(void **)(a1 + 96);
  id v17 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v17;
  id v18 = v17;

  id v19 = *(void **)(a1 + 104);
  id v20 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v20;
  id v21 = v20;

  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v22 = *(void **)(a1 + 128);
  uint64_t v23 = *(void **)(a2 + 128);
  *(void *)(a1 + 128) = v23;
  id v24 = v23;

  uint64_t v25 = *(void *)(a1 + 152);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 145) = *(unsigned char *)(a2 + 145);
  uint64_t v26 = *(void *)(a2 + 152);
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = *(void *)(a2 + 160);
      *(void *)(a1 + 152) = v26;
      *(void *)(a1 + 160) = v27;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v26)
  {
    uint64_t v28 = *(void *)(a2 + 160);
    *(void *)(a1 + 152) = v26;
    *(void *)(a1 + 160) = v28;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
LABEL_8:
  uint64_t v29 = (_OWORD *)(a1 + 168);
  unint64_t v30 = *(void **)(a1 + 168);
  uint64_t v32 = (_OWORD *)(a2 + 168);
  uint64_t v31 = *(void **)(a2 + 168);
  if (v30)
  {
    if (v31)
    {
      *(void *)(a1 + 168) = v31;
      id v33 = v31;

      char v34 = *(void **)(a1 + 176);
      uint64_t v35 = *(void **)(a2 + 176);
      *(void *)(a1 + 176) = v35;
      id v36 = v35;

      *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
    }
    else
    {
      sub_2145F37B0((id *)(a1 + 168));
      char v40 = *(unsigned char *)(a2 + 184);
      *uint64_t v29 = *v32;
      *(unsigned char *)(a1 + 184) = v40;
    }
  }
  else if (v31)
  {
    *(void *)(a1 + 168) = v31;
    char v37 = *(void **)(a2 + 176);
    *(void *)(a1 + 176) = v37;
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
    id v38 = v31;
    id v39 = v37;
  }
  else
  {
    long long v41 = *v32;
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
    *uint64_t v29 = v41;
  }
  return a1;
}

id *sub_2145F37B0(id *a1)
{
  return a1;
}

__n128 __swift_memcpy185_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(_OWORD *)(a1 + 169) = *(long long *)((char *)a2 + 169);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t _s11ContentViewVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  long long v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  long long v9 = *(void **)(a1 + 80);
  uint64_t v10 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v10;

  uint64_t v11 = *(void **)(a1 + 96);
  uint64_t v12 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v12;

  uint64_t v13 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);

  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v14 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);

  uint64_t v15 = *(void *)(a2 + 152);
  uint64_t v16 = *(void *)(a1 + 152);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 145) = *(unsigned char *)(a2 + 145);
  if (v16)
  {
    if (v15)
    {
      uint64_t v17 = *(void *)(a2 + 160);
      *(void *)(a1 + 152) = v15;
      *(void *)(a1 + 160) = v17;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v15)
  {
    uint64_t v18 = *(void *)(a2 + 160);
    *(void *)(a1 + 152) = v15;
    *(void *)(a1 + 160) = v18;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
LABEL_8:
  id v19 = *(void **)(a1 + 168);
  uint64_t v20 = *(void *)(a2 + 168);
  if (!v19)
  {
LABEL_12:
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
    return a1;
  }
  if (!v20)
  {
    sub_2145F37B0((id *)(a1 + 168));
    goto LABEL_12;
  }
  *(void *)(a1 + 168) = v20;

  id v21 = *(void **)(a1 + 176);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);

  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  return a1;
}

uint64_t _s11ContentViewVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 185)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s11ContentViewVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 184) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 185) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 185) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s11ContentViewVMa()
{
  return &_s11ContentViewVN;
}

uint64_t initializeBufferWithCopyOfBuffer for BadgeInfo(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for BadgeInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for BadgeInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BadgeInfo(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BadgeInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BadgeInfo()
{
  return &type metadata for BadgeInfo;
}

uint64_t sub_2145F3BEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2145F3C08(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 64);
  id v5 = *(void **)(a1 + 80);
  uint64_t v7 = *(void **)(a1 + 96);
  id v6 = *(void **)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 152);
  uint64_t v17 = *(void **)(a1 + 176);
  uint64_t v18 = *(void **)(a1 + 168);
  id v8 = *(id *)(a1 + 128);
  swift_bridgeObjectRetain();
  id v9 = v2;
  id v10 = v3;
  swift_bridgeObjectRetain();
  id v11 = v4;
  id v12 = v5;
  id v13 = v7;
  id v14 = v6;
  sub_21458F1B8(v16);
  sub_2145F3300(v18, v17);
  return a1;
}

uint64_t sub_2145F3CCC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 80);
  id v5 = *(void **)(a1 + 96);
  id v6 = *(void **)(a1 + 104);
  uint64_t v7 = *(void **)(a1 + 128);
  uint64_t v9 = *(void *)(a1 + 152);
  id v10 = *(void **)(a1 + 176);
  id v11 = *(void **)(a1 + 168);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_21458CF28(v9);
  sub_2145F3340(v11, v10);
  return a1;
}

unint64_t sub_2145F3D90()
{
  unint64_t result = qword_26780F250;
  if (!qword_26780F250)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F240);
    swift_getOpaqueTypeConformance2();
    sub_21455B000(&qword_26780F258, &qword_26780F260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F250);
  }
  return result;
}

uint64_t sub_2145F3E48(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2145F3EC8()
{
  unint64_t result = qword_26780F280;
  if (!qword_26780F280)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F218);
    swift_getOpaqueTypeConformance2();
    sub_21455B000(&qword_26780F288, &qword_26780F290);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F280);
  }
  return result;
}

unint64_t sub_2145F3F80()
{
  unint64_t result = qword_26780F2A0;
  if (!qword_26780F2A0)
  {
    sub_214602658();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F2A0);
  }
  return result;
}

unint64_t sub_2145F3FD8()
{
  unint64_t result = qword_26780F2A8;
  if (!qword_26780F2A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F230);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F220);
    sub_2145F3E48(&qword_26780F278, &qword_26780F220, (void (*)(void))sub_2145F3EC8);
    swift_getOpaqueTypeConformance2();
    sub_21455B000(&qword_26780F258, &qword_26780F260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F2A8);
  }
  return result;
}

uint64_t sub_2145F40D8@<X0>(uint64_t a1@<X8>)
{
  return sub_2145553A4(*(void *)(v1 + 16), a1, &qword_26780F230);
}

uint64_t sub_2145F4100()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2145F4138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2145EEF30(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

char *keypath_get_selector_text()
{
  return sel_text;
}

char *keypath_get_selector_textColor()
{
  return sel_textColor;
}

char *keypath_get_selector_font()
{
  return sel_font;
}

char *keypath_get_selector_numberOfLines()
{
  return sel_numberOfLines;
}

char *keypath_get_selector_textAlignment()
{
  return sel_textAlignment;
}

void type metadata accessor for CellStyle(uint64_t a1)
{
}

unint64_t sub_2145F41AC()
{
  unint64_t result = qword_26780F2E0;
  if (!qword_26780F2E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F170);
    sub_2145F3E48(&qword_26780F188, &qword_26780F180, (void (*)(void))sub_21456F154);
    sub_21455B000(&qword_26780F190, &qword_26780F160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F2E0);
  }
  return result;
}

unint64_t sub_2145F429C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F330);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780E3E0);
  uint64_t v6 = sub_214603648();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2145FE2F8(v12, (uint64_t)v5);
    unint64_t result = sub_214558B2C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_2146035C8();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_21455538C(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t RUI.LiftUI.XMLDecoder.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RUI.LiftUI.XMLDecoder.userInfo.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*RUI.LiftUI.XMLDecoder.userInfo.modify())()
{
  return j__swift_endAccess;
}

uint64_t RUI.LiftUI.XMLDecoder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_2145F429C(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t RUI.LiftUI.XMLDecoder.init()()
{
  *(void *)(v0 + 16) = sub_2145F429C(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t RUI.LiftUI.XMLDecoder.decode<A>(_:from:)(uint64_t a1, void *a2)
{
  _s6LiftUIO8_DecoderCMa();
  uint64_t v4 = (void *)swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8EE78];
  v4[2] = MEMORY[0x263F8EE78];
  id v6 = a2;
  v4[3] = sub_2145F429C(v5);
  v4[4] = v6;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v2 + 16);
  swift_beginAccess();
  v4[3] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2145F46FC();
  return sub_214603188();
}

uint64_t _s6LiftUIO8_DecoderCMa()
{
  return self;
}

unint64_t sub_2145F46FC()
{
  unint64_t result = qword_2678196F0[0];
  if (!qword_2678196F0[0])
  {
    _s6LiftUIO8_DecoderCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2678196F0);
  }
  return result;
}

uint64_t RUI.LiftUI.XMLDecoder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RUI.LiftUI.XMLDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2145F47A8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2145F47EC(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  *(void *)(v3 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2145F4838())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2145F4890(uint64_t a1, void **a2)
{
  return RUI.LiftUI.XMLDecoder.decode<A>(_:from:)(a1, *a2);
}

uint64_t sub_2145F48B8(uint64_t a1)
{
  if (qword_2678196D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2146035C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2678196D8);
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_214558B2C(v3);
  if ((v5 & 1) == 0) {
    return 0;
  }
  sub_214555068(*(void *)(a1 + 56) + 32 * v4, (uint64_t)v8);
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v7;
  }
  return result;
}

uint64_t sub_2145F4978()
{
  if (qword_2678196D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2146035C8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2678196D8);
}

uint64_t sub_2145F49DC(uint64_t a1)
{
  return sub_2145F4A24(a1, qword_2678196B8);
}

uint64_t sub_2145F4A00(uint64_t a1)
{
  return sub_2145F4A24(a1, qword_2678196D8);
}

uint64_t sub_2145F4A24(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780D968);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2146035C8();
  __swift_allocate_value_buffer(v6, a2);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)a2);
  sub_2146035B8();
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v7, v5, v6);
  }
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.ruiEnableLiftUITweaks.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2678196D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2146035C8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2678196D8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_2145F4BF8(unsigned __int8 *a1, char *a2)
{
  return sub_2145F4C04(*a1, *a2);
}

uint64_t sub_2145F4C04(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 7630441;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 7630441;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1819242338;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x656C62756F64;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x676E69727473;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1819242338) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x656C62756F64;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x676E69727473) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_214603898();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2145F4D64()
{
  return sub_214603A98();
}

uint64_t sub_2145F4E28()
{
  sub_214602F48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2145F4ED4()
{
  return sub_214603A98();
}

uint64_t sub_2145F4F94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2145FBFC4();
  *a1 = result;
  return result;
}

void sub_2145F4FC4(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 7630441;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1819242338;
      goto LABEL_3;
    case 2:
      *a1 = 0x656C62756F64;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0x676E69727473;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_2145F5048()
{
  uint64_t v1 = sub_2146035C8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2678196B0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_2678196B8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v0 + 24);
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_214558B2C((uint64_t)v4);
    if (v8)
    {
      sub_214555068(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  if (*((void *)&v12 + 1))
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v10[7];
    }
  }
  else
  {
    sub_214557E44((uint64_t)&v11);
    return 0;
  }
  return result;
}

uint64_t sub_2145F520C()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 32);
  _s6LiftUIO14KeyedContainerVMa();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v2 = v1;
  swift_getWitnessTable();
  return sub_214603758();
}

void sub_2145F52DC(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_2146035C8();
  uint64_t v16 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _s6LiftUIO8_DecoderCMa();
  uint64_t v19 = v17;
  unint64_t v10 = sub_2145F46FC();
  unint64_t v20 = v10;
  v18[0] = v4;
  swift_retain();
  uint64_t v21 = a2;
  sub_214603188();
  if (v3)
  {
    uint64_t v15 = a1;
    swift_beginAccess();
    uint64_t v11 = swift_bridgeObjectRetain();
    char v12 = sub_2145F48B8(v11);
    swift_bridgeObjectRelease();
    if (v12)
    {
      char v13 = sub_2145F5048() ^ 1;
      if (qword_2678196B0 != -1) {
        swift_once();
      }
      uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_2678196B8);
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v9, v14, v7);
      uint64_t v19 = MEMORY[0x263F8D4F8];
      LOBYTE(v18[0]) = v13 & 1;
      swift_beginAccess();
      sub_21458C8B0((uint64_t)v18, (uint64_t)v9);
      swift_endAccess();
      uint64_t v19 = v17;
      unint64_t v20 = v10;
      v18[0] = v4;
      swift_retain();
      sub_214603188();
    }
    else
    {
      swift_willThrow();
    }
  }
}

uint64_t sub_2145F5530()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2145F5578()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2145F5584()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2145F55C8()
{
  return sub_2145F520C();
}

id sub_2145F55EC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v6 = *(void **)(v3 + 32);
  a1[3] = &_s6LiftUIO16UnkeyedContainerVN;
  a1[4] = sub_2145FB1F4();
  uint64_t v7 = (void *)swift_allocObject();
  *a1 = v7;
  v7[2] = v4;
  v7[3] = v5;
  v7[4] = v6;
  v7[5] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

id sub_2145F5694@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v6 = *(void **)(v3 + 32);
  a1[3] = &_s6LiftUIO20SingleValueContainerVN;
  a1[4] = sub_2145FB1A0();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_2145F5724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2146035C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_conformsToProtocol2()) {
    uint64_t v8 = a2;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8) {
    return 1;
  }
  if (qword_2678196D0 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_2678196D8);
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v11 = sub_214558B2C(v10);
  if ((v12 & 1) == 0) {
    return 0;
  }
  sub_214555068(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v18);
  if (!swift_dynamicCast() || (v17 & 1) == 0) {
    return 0;
  }
  if (qword_2678196B0 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_2678196B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_214558B2C((uint64_t)v7), (v15 & 1) != 0))
  {
    sub_214555068(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!*((void *)&v19 + 1))
  {
    sub_214557E44((uint64_t)&v18);
    return 0;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v17;
  }
  return result;
}

char *sub_2145F597C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v15 = MEMORY[0x263F8EE78];
    uint64_t result = sub_214582720(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v15;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x2166A3B40](v5, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_name);
      uint64_t v9 = sub_214602EA8();
      uint64_t v11 = v10;

      unint64_t v13 = *(void *)(v15 + 16);
      unint64_t v12 = *(void *)(v15 + 24);
      if (v13 >= v12 >> 1) {
        sub_214582720((char *)(v12 > 1), v13 + 1, 1);
      }
      ++v5;
      *(void *)(v15 + 16) = v13 + 1;
      uint64_t v14 = v15 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_2145F5AF8(uint64_t a1, void *a2, uint64_t a3)
{
  if (swift_conformsToProtocol2()) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6)
  {
    id v7 = objc_msgSend(a2, sel_attributtes);
    uint64_t v8 = sub_214602E08();

    sub_2145FBCDC(v8);
    uint64_t v9 = swift_bridgeObjectRelease();
  }
  else
  {
    if (swift_conformsToProtocol2()) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780E070);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_214616D50;
      id v12 = objc_msgSend(a2, sel_name);
      uint64_t v13 = sub_214602EA8();
      uint64_t v15 = v14;

      *(void *)(v11 + 32) = v13;
      *(void *)(v11 + 40) = v15;
    }
    else
    {
      if (sub_2145F5724(a1, a3))
      {
        id v16 = objc_msgSend(a2, sel_name);
        uint64_t v17 = sub_214602EA8();
        uint64_t v19 = v18;

        unint64_t v20 = sub_2145D0CAC(0, 1, 1, MEMORY[0x263F8EE78]);
        unint64_t v22 = *((void *)v20 + 2);
        unint64_t v21 = *((void *)v20 + 3);
        unint64_t v23 = v22 + 1;
        if (v22 >= v21 >> 1)
        {
          unint64_t v33 = v22 + 1;
          uint64_t v32 = sub_2145D0CAC((char *)(v21 > 1), v22 + 1, 1, v20);
          unint64_t v23 = v22 + 1;
          unint64_t v20 = v32;
        }
        *((void *)v20 + 2) = v23;
        id v24 = &v20[16 * v22];
        *((void *)v24 + 4) = v17;
        *((void *)v24 + 5) = v19;
      }
      id v25 = objc_msgSend(a2, sel_children, v33);
      type metadata accessor for RUIXMLElement(0);
      unint64_t v26 = sub_214603058();

      uint64_t v27 = sub_2145F597C(v26);
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(a2, sel_attributtes);
      uint64_t v29 = sub_214602E08();

      sub_2145FB6D8(v29);
      uint64_t v9 = sub_2145D0BC0((uint64_t)v27);
    }
  }
  MEMORY[0x270FA5388](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780ECE8);
  sub_2145FF774();
  uint64_t v30 = sub_214602FC8();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_2145F5E14(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_2145F5AF8(a2, a3, a4);
  sub_2146030D8();
  swift_getWitnessTable();
  char v4 = sub_214602FE8();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

BOOL sub_2145F5ED4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return (sub_2145F5E14(a1, a2, a3, a4) & 1) == 0;
}

uint64_t sub_2145F5EF4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  sub_2145F5F58(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    uint64_t v8 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = objc_msgSend(v8, sel_BOOLValue);
  }
  return v7 & 1;
}

void *sub_2145F5F58(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_214603AF8();
  uint64_t v13 = v12;
  id v14 = objc_msgSend(a4, sel_attributtes);
  uint64_t v15 = sub_214602E08();

  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_214554F58(v11, v13), (v17 & 1) != 0))
  {
    a4 = *(void **)(*(void *)(v15 + 56) + 16 * v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v18 = sub_2145F6160(a1, a2, a3, a4, a5, a6);
    if (!v28)
    {
      uint64_t v19 = v18;
      id v20 = objc_msgSend(v18, sel_attributtes);
      uint64_t v21 = sub_214602E08();

      if (*(void *)(v21 + 16) && (unint64_t v22 = sub_214554F58(0x65756C6176, 0xE500000000000000), (v23 & 1) != 0))
      {
        a4 = *(void **)(*(void *)(v21 + 56) + 16 * v22);
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        id v24 = objc_msgSend(v19, sel_stringValue);
        if (v24)
        {
          id v25 = v24;
          a4 = (void *)sub_214602EA8();
        }
        else
        {

          return 0;
        }
      }
    }
  }
  return a4;
}

id sub_2145F6160(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  v53[8] = a2;
  uint64_t v11 = sub_214603AF8();
  uint64_t v13 = v12;
  id v14 = objc_msgSend(a4, sel_attributtes);
  uint64_t v15 = sub_214602E08();

  if (*(void *)(v15 + 16))
  {
    sub_214554F58(v11, v13);
    if (v16)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_214603AF8();
      id v17 = objc_allocWithZone((Class)RUIXMLElement);
      id v18 = (void *)sub_214602E78();
      swift_bridgeObjectRelease();
      id v19 = objc_msgSend(v17, sel_initWithName_, v18);

      id v20 = (void *)sub_214602E78();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setStringValue_, v20);

      id v21 = objc_msgSend(a4, sel_attributtes);
      uint64_t v22 = sub_214602E08();

      if (*(void *)(v22 + 16) && (unint64_t v23 = sub_214554F58(1701869940, 0xE400000000000000), (v24 & 1) != 0))
      {
        id v25 = (uint64_t *)(*(void *)(v22 + 56) + 16 * v23);
        uint64_t v26 = *v25;
        uint64_t v27 = v25[1];
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
      }
      swift_bridgeObjectRelease();
      id v42 = objc_msgSend(v19, sel_attributtes);
      uint64_t v43 = sub_214602E08();

      unint64_t v55 = v43;
      if (v27)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v57 = v43;
        sub_2145FB550(v26, v27, 1701869940, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
      }
      else
      {
        sub_2145FB290(1701869940, 0xE400000000000000);
      }
      swift_bridgeObjectRelease();
      unint64_t v45 = (void *)sub_214602DF8();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setAttributtes_, v45);

      return v19;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_2145F6C1C(a1, a4, a5);
  if (v28) {
    return v28;
  }
  id v29 = objc_msgSend(a4, sel_children);
  type metadata accessor for RUIXMLElement(0);
  unint64_t v30 = sub_214603058();

  MEMORY[0x270FA5388](v31);
  v53[2] = a5;
  v53[3] = a6;
  v53[4] = a1;
  uint64_t v32 = v54;
  id v19 = sub_2145F6F6C(sub_2145FF17C, (uint64_t)v53, v30);
  swift_bridgeObjectRelease();
  if (v19) {
    return v19;
  }
  char v33 = sub_2145F5724(a3, a5);
  uint64_t v34 = (uint64_t)&selRef_hasImage;
  if ((v33 & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v54 = v32;
  uint64_t v35 = sub_214603AF8();
  uint64_t v37 = v36;
  id v38 = objc_msgSend(a4, sel_name);
  uint64_t v39 = sub_214602EA8();
  uint64_t v41 = v40;

  if (v35 != v39 || v37 != v41)
  {
    char v47 = sub_214603898();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v34 = 0x1F6426000;
    if (v47) {
      return a4;
    }
LABEL_21:
    id v19 = (id)sub_214603508();
    uint64_t v54 = swift_allocError();
    uint64_t v48 = v34;
    uint64_t v50 = v49;
    v53[7] = (char *)v49 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780F348) + 48);
    v50[3] = a5;
    v50[4] = a6;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v50);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
    unint64_t v55 = 0;
    unint64_t v56 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    unint64_t v55 = 0xD00000000000001ALL;
    unint64_t v56 = 0x8000000214610370;
    id v52 = [a4 (SEL)(v48 + 3864)];
    sub_214602EA8();

    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t *, void, id))(*((void *)v19 - 1) + 104))(v50, *MEMORY[0x263F8DCA8], v19);
    swift_willThrow();
    return v19;
  }
  swift_bridgeObjectRelease_n();
  return a4;
}

void sub_2145F6730(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  sub_2145F5F58(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    unsigned __int8 v7 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_doubleValue);
  }
}

void sub_2145F679C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  sub_2145F5F58(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    unsigned __int8 v7 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_floatValue);
  }
}

id sub_2145F6808(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id result = sub_2145F5F58(a1, a2, a3, a4, a5, a6);
  if (!v6)
  {
    uint64_t v8 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v8, sel_integerValue);

    return v9;
  }
  return result;
}

uint64_t sub_2145F686C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X5>, uint64_t a4@<X8>)
{
  uint64_t result = sub_214603908();
  if (!v4)
  {
    uint64_t v9 = sub_2146038F8();
    sub_2145F8F7C(a1, v9, a2, a3, a4);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2145F692C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  _s6LiftUIO14KeyedContainerVMa();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = a7(WitnessTable, v12, v13);
  uint64_t result = sub_2145F686C(a8, a8, v14, (uint64_t)&v16);
  if (!v8) {
    return v16;
  }
  return result;
}

uint64_t sub_2145F69E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  _s6LiftUIO14KeyedContainerVMa();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = a7(WitnessTable, v12, v13);
  uint64_t result = sub_2145F686C(a8, a8, v14, (uint64_t)&v16);
  if (!v8) {
    return v16;
  }
  return result;
}

uint64_t sub_2145F6AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  _s6LiftUIO14KeyedContainerVMa();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = a7(WitnessTable, v12, v13);
  uint64_t result = sub_2145F686C(a8, a8, v14, (uint64_t)&v16);
  if (!v8) {
    return v16;
  }
  return result;
}

uint64_t sub_2145F6B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t), uint64_t a8)
{
  _s6LiftUIO14KeyedContainerVMa();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v14 = a7(WitnessTable, v12, v13);
  uint64_t result = sub_2145F686C(a8, a8, v14, (uint64_t)&v16);
  if (!v8) {
    return v16;
  }
  return result;
}

void *sub_2145F6C1C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = v9;
  swift_getMetatypeMetadata();
  sub_214602F28();
  char v10 = sub_2145F6E04();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  if (v10)
  {
    if (sub_214603AF8() == 0x746E65746E6F63 && v11 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
LABEL_11:
      id v14 = a2;
      return a2;
    }
    char v13 = sub_214603898();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
    if (v13) {
      goto LABEL_11;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
  }
  return 0;
}

uint64_t sub_2145F6E04()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_214602F78();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_214602F78();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_214603898();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_214602F78();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_214602F78();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2145F6F6C(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_214603618())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2166A3B40](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_2145F7094(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v42 = a7;
  uint64_t v44 = a3;
  uint64_t v41 = a9;
  if (swift_conformsToProtocol2()) {
    uint64_t v17 = a1;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v17 && (sub_2145F48B8(a4) & 1) == 0)
  {
    id v25 = objc_allocWithZone((Class)RUIXMLElement);
    uint64_t v40 = a4;
    uint64_t v26 = (void *)sub_214602E78();
    id v38 = objc_msgSend(v25, sel_initWithName_, v26);

    id v27 = objc_msgSend(a5, sel_children);
    type metadata accessor for RUIXMLElement(0);
    unint64_t v28 = sub_214603058();

    MEMORY[0x270FA5388](v29);
    v37[2] = a6;
    v37[3] = v42;
    v37[4] = a8;
    v37[5] = a10;
    v37[6] = a2;
    sub_2145F74F0(sub_2145FF244, (uint64_t)v37, v28);
    uint64_t v39 = v10;
    unint64_t v30 = (void *)sub_214603048();
    swift_bridgeObjectRelease();
    id v31 = v38;
    objc_msgSend(v38, sel_appendChildren_, v30);

    _s6LiftUIO8_DecoderCMa();
    uint64_t v32 = (void *)swift_allocObject();
    uint64_t v33 = MEMORY[0x263F8EE78];
    void v32[2] = MEMORY[0x263F8EE78];
    id v34 = v31;
    v32[3] = sub_2145F429C(v33);
    v32[4] = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214616D50;
    *(void *)(inited + 56) = a6;
    *(void *)(inited + 64) = a8;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(boxed_opaque_existential_0, a2, a6);
    uint64_t v43 = v44;
    swift_bridgeObjectRetain();
    sub_2145FBAA4((void *)inited);
    void v32[2] = v43;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v32[3] = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2145F52DC(a10, v41);
    swift_release();
  }
  else
  {
    uint64_t v18 = v44;
    id v19 = sub_2145F6160(a2, v44, a4, a5, a6, a8);
    if (!v10)
    {
      id v20 = v19;
      _s6LiftUIO8_DecoderCMa();
      id v21 = (void *)swift_allocObject();
      uint64_t v22 = MEMORY[0x263F8EE78];
      v21[2] = MEMORY[0x263F8EE78];
      uint64_t v40 = a10;
      v21[3] = sub_2145F429C(v22);
      v21[4] = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_214616D50;
      *(void *)(v23 + 56) = a6;
      *(void *)(v23 + 64) = a8;
      char v24 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v23 + 32));
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v24, a2, a6);
      swift_bridgeObjectRetain();
      sub_2145FBAA4((void *)v23);
      v21[2] = v18;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v21[3] = a4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_2145F52DC(v40, v41);
      swift_release();
    }
  }
}

uint64_t sub_2145F74F0(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
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
        id v9 = (id)MEMORY[0x2166A3B40](v8, v4);
LABEL_9:
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
          sub_214603528();
          sub_214603558();
          unint64_t v4 = v15;
          sub_214603568();
          sub_214603538();
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
      uint64_t v7 = sub_214603618();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2145F769C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_214616D50;
  *(void *)(inited + 56) = a5;
  *(void *)(inited + 64) = a7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  swift_bridgeObjectRetain();
  sub_2145FBAA4((void *)inited);
  swift_bridgeObjectRetain();
  sub_2145F6160(a1, a2, a3, a4, a5, a7);
  if (v7)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    _s6LiftUIO14KeyedContainerVMa();
    swift_getWitnessTable();
    return sub_214603758();
  }
}

void *sub_2145F7820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = sub_2145F6160(a1, a2, a3, a4, a5, a6);
  if (v7)
  {
    swift_bridgeObjectRelease();
    return (void *)swift_bridgeObjectRelease();
  }
  else
  {
    id v17 = v15;
    a7[3] = &_s6LiftUIO16UnkeyedContainerVN;
    a7[4] = sub_2145FB1F4();
    uint64_t result = (void *)swift_allocObject();
    *a7 = result;
    result[2] = a2;
    result[3] = a3;
    result[4] = v17;
    result[5] = 0;
  }
  return result;
}

uint64_t sub_2145F78F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v12 = sub_2146032D8();
  MEMORY[0x270FA5388](v12 - 8);
  id v14 = (char *)&v17 - v13;
  sub_214603B08();
  uint64_t v15 = *(void *)(a4 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, a4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_2145F7A50((uint64_t)v14, a1, a2, a3, a4, a5, a6);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v14, a4);
  }
  return result;
}

unint64_t sub_2145F7A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  unint64_t result = (unint64_t)sub_2145F6160(a1, a2, a3, a4, a5, a6);
  if (!v7)
  {
    unint64_t v15 = result;
    uint64_t v21 = _s6LiftUIO8_DecoderCMa();
    id v20 = a7;
    uint64_t v16 = (void *)swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8EE78];
    void v16[2] = MEMORY[0x263F8EE78];
    v16[3] = sub_2145F429C(v17);
    v16[4] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214616D50;
    *(void *)(inited + 56) = a5;
    *(void *)(inited + 64) = a6;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
    swift_bridgeObjectRetain();
    sub_2145FBAA4((void *)inited);
    void v16[2] = a2;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v16[3] = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20[3] = v21;
    unint64_t result = sub_2145F46FC();
    v20[4] = result;
    *id v20 = v16;
  }
  return result;
}

uint64_t sub_2145F7BC8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2145F7BD0(uint64_t a1)
{
  return sub_2145F5AF8(*(void *)(v1 + 8), *(void **)(v1 + 16), *(void *)(a1 + 16));
}

uint64_t sub_2145F7BE0(uint64_t a1, uint64_t a2)
{
  return sub_2145F5E14(a1, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16));
}

BOOL sub_2145F7BF0(uint64_t a1, uint64_t a2)
{
  return sub_2145F5ED4(a1, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16));
}

uint64_t sub_2145F7C28(uint64_t a1, uint64_t a2)
{
  return sub_2145F5EF4(a1, *(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24)) & 1;
}

void *sub_2145F7C54(uint64_t a1, uint64_t a2)
{
  return sub_2145F5F58(a1, *(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

void sub_2145F7C7C(uint64_t a1, uint64_t a2)
{
  sub_2145F6730(a1, *(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

void sub_2145F7CA4(uint64_t a1, uint64_t a2)
{
  sub_2145F679C(a1, *(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

id sub_2145F7CCC(uint64_t a1, uint64_t a2)
{
  return sub_2145F6808(a1, *(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_2145F7CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7E74(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF604, MEMORY[0x263F8E498]);
}

uint64_t sub_2145F7D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7ED8(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF5B0, MEMORY[0x263F8E4F0]);
}

uint64_t sub_2145F7D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7F3C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF55C, MEMORY[0x263F8E548]);
}

uint64_t sub_2145F7D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7DC4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF508, MEMORY[0x263F8E5C0]);
}

uint64_t sub_2145F7DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  return sub_2145F6B60(a1, *v5, v5[1], v5[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5);
}

uint64_t sub_2145F7DF4()
{
  return sub_214603998();
}

uint64_t sub_2145F7E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7DC4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF4B4, MEMORY[0x263F8D9D0]);
}

uint64_t sub_2145F7E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7E74(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF460, MEMORY[0x263F8E778]);
}

uint64_t sub_2145F7E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  return sub_2145F692C(a1, *v5, v5[1], v5[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5);
}

uint64_t sub_2145F7EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7ED8(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF40C, MEMORY[0x263F8E888]);
}

uint64_t sub_2145F7ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  return sub_2145F69E8(a1, *v5, v5[1], v5[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5);
}

uint64_t sub_2145F7F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7F3C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF3B8, MEMORY[0x263F8E8F8]);
}

uint64_t sub_2145F7F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  return sub_2145F6AA4(a1, *v5, v5[1], v5[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5);
}

uint64_t sub_2145F7F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F7DC4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2145FF310, MEMORY[0x263F8E970]);
}

uint64_t sub_2145F7FA0()
{
  return sub_2146039A8();
}

void sub_2145F7FB8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_2145F7094(a1, a2, *(void *)v6, *(void *)(v6 + 8), *(void **)(v6 + 16), *(void *)(a5 + 16), a3, *(void *)(a5 + 24), a6, a4);
}

uint64_t sub_2145F7FF4()
{
  return sub_214603928();
}

uint64_t sub_2145F800C()
{
  return sub_214603918();
}

uint64_t sub_2145F8024()
{
  uint64_t result = sub_214603938();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145F8048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8274(a1, a2, a3, MEMORY[0x263F8E340]);
}

uint64_t sub_2145F8074()
{
  uint64_t result = sub_214603948();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145F8098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F81BC(a1, a2, a3, MEMORY[0x263F8E358]);
}

uint64_t sub_2145F80C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8218(a1, a2, a3, MEMORY[0x263F8E360]);
}

uint64_t sub_2145F80F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8274(a1, a2, a3, MEMORY[0x263F8E368]);
}

uint64_t sub_2145F811C()
{
  uint64_t result = sub_214603978();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145F8140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F82FC(a1, a2, a3, MEMORY[0x263F8E380]);
}

uint64_t sub_2145F816C()
{
  uint64_t result = sub_214603958();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145F8190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F81BC(a1, a2, a3, MEMORY[0x263F8E378]);
}

uint64_t sub_2145F81BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_2145F81EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8218(a1, a2, a3, MEMORY[0x263F8E388]);
}

uint64_t sub_2145F8218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_2145F8248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8274(a1, a2, a3, MEMORY[0x263F8E390]);
}

uint64_t sub_2145F8274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_2145F82AC()
{
  uint64_t result = sub_214603988();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145F82D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F82FC(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t sub_2145F82FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_2145F8328()
{
  return sub_214603968();
}

uint64_t sub_2145F8354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2145F769C(a2, *(void *)v5, *(void *)(v5 + 8), *(void **)(v5 + 16), *(void *)(a5 + 16), a3, *(void *)(a5 + 24));
}

uint64_t sub_2145F8388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8408(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2145F7820);
}

uint64_t sub_2145F83B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2145F78F4(*(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), *(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

uint64_t sub_2145F83DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2145F8408(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2145F7A50);
}

uint64_t sub_2145F8408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void))
{
  return a4(a1, *v4, v4[1], v4[2], *(void *)(a2 + 16), *(void *)(a2 + 24));
}

id sub_2145F8438()
{
  uint64_t v0 = (void *)sub_214602E78();
  id v1 = objc_msgSend(v0, sel_integerValue);

  return v1;
}

void *sub_2145F8474()
{
  uint64_t v0 = (void *)sub_214602E78();
  id v1 = objc_msgSend(v0, sel_integerValue);

  if (v1 != (void *)(char)v1)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x80000002146100D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F328);
    sub_214602F08();
    id v1 = v6;
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

void *sub_2145F85D4()
{
  uint64_t v0 = (void *)sub_214602E78();
  id v1 = objc_msgSend(v0, sel_integerValue);

  if (v1 != (void *)(__int16)v1)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x80000002146100D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F320);
    sub_214602F08();
    id v1 = v6;
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

void *sub_2145F8734()
{
  uint64_t v0 = (void *)sub_214602E78();
  id v1 = objc_msgSend(v0, sel_integerValue);

  if (v1 != (void *)(int)v1)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x80000002146100D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F318);
    sub_214602F08();
    id v1 = v6;
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_2145F8894()
{
  uint64_t v0 = (void *)sub_214602E78();
  unint64_t v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if ((v1 & 0x8000000000000000) != 0)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F310);
    sub_214602F08();
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

void *sub_2145F89F8()
{
  uint64_t v0 = (void *)sub_214602E78();
  unint64_t v1 = objc_msgSend(v0, sel_integerValue);

  if ((unint64_t)v1 > 0xFF)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x80000002146100D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F308);
    sub_214602F08();
    unint64_t v1 = v6;
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_2145F8B58()
{
  uint64_t v0 = (void *)sub_214602E78();
  unint64_t v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if (v1 >> 16)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x80000002146100D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F300);
    sub_214602F08();
    unint64_t v1 = (unint64_t)v6;
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_2145F8CB8()
{
  uint64_t v0 = (void *)sub_214602E78();
  unint64_t v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if (HIDWORD(v1))
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    v6[0] = 0xD000000000000018;
    v6[1] = 0x80000002146100D0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2F8);
    sub_214602F08();
    unint64_t v1 = (unint64_t)v6;
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_2145F8E18()
{
  uint64_t v0 = (void *)sub_214602E78();
  unint64_t v1 = (unint64_t)objc_msgSend(v0, sel_integerValue);

  if ((v1 & 0x8000000000000000) != 0)
  {
    uint64_t v2 = sub_214603508();
    swift_allocError();
    uint64_t v4 = v3;
    swift_bridgeObjectRetain();
    sub_214603498();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2F0);
    sub_214602F08();
    sub_214602F68();
    swift_bridgeObjectRelease();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x263F8DCB8], v2);
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_2145F8F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v51 = a5;
  uint64_t v53 = a1;
  uint64_t v54 = a2;
  uint64_t v50 = *(void *)(*(void *)(*(void *)(a4 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v46 = &v44[-v6];
  uint64_t v55 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v48 = &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v49 = &v44[-v10];
  MEMORY[0x270FA5388](v11);
  id v52 = &v44[-v12];
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = &v44[-v14];
  MEMORY[0x270FA5388](v16);
  id v18 = &v44[-v17];
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = &v44[-v20];
  uint64_t v22 = (void *)sub_214602E78();
  uint64_t v23 = (uint64_t)objc_msgSend(v22, sel_integerValue);

  sub_2146035E8();
  char v24 = sub_214603378();
  uint64_t v25 = sub_214603368();
  if (v24)
  {
    if (v25 > 64)
    {
      unint64_t v56 = v23;
      sub_2145FF364();
      sub_214603348();
      char v26 = sub_214602E58();
      id v27 = *(void (**)(unsigned char *, uint64_t))(v55 + 8);
      v27(v18, a3);
      v27(v21, a3);
      if (v26) {
        goto LABEL_27;
      }
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v28 = sub_214603358();
    id v27 = *(void (**)(unsigned char *, uint64_t))(v55 + 8);
    v27(v21, a3);
    if (v23 < v28) {
      goto LABEL_27;
    }
    goto LABEL_10;
  }
  if (v25 <= 63) {
    goto LABEL_6;
  }
  unint64_t v56 = v23;
  uint64_t v29 = v55;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 16))(v15, v21, a3);
  if (v23 < 0)
  {
    uint64_t v36 = *(void (**)(unsigned char *, uint64_t))(v29 + 8);
    v36(v15, a3);
    v36(v21, a3);
    goto LABEL_27;
  }
  sub_2145FF364();
  sub_214603348();
  int v45 = sub_214602E58();
  id v27 = *(void (**)(unsigned char *, uint64_t))(v29 + 8);
  v27(v18, a3);
  v27(v15, a3);
  v27(v21, a3);
  if ((v45 & 1) == 0)
  {
LABEL_10:
    unint64_t v30 = v52;
    sub_2146035D8();
    if (sub_214603378())
    {
      if (sub_214603368() < 64) {
        goto LABEL_19;
      }
    }
    else
    {
      char v31 = sub_214603378();
      uint64_t v32 = sub_214603368();
      if ((v31 & 1) == 0)
      {
        if (v32 < 64)
        {
LABEL_19:
          uint64_t v34 = sub_214603358();
          v27(v30, a3);
LABEL_20:
          if (v34 >= v23) {
            goto LABEL_21;
          }
          goto LABEL_27;
        }
        uint64_t v40 = v48;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v55 + 16))(v48, v30, a3);
        unint64_t v56 = v23;
        if (v23 <= 0)
        {
          v27(v40, a3);
          v27(v30, a3);
          goto LABEL_21;
        }
        sub_2145FF364();
        sub_214603348();
        LODWORD(v50) = sub_214602E58();
        v27(v18, a3);
        v27(v40, a3);
        v27(v30, a3);
        if (v50) {
          goto LABEL_27;
        }
LABEL_21:
        unint64_t v56 = v23;
        sub_2145FF364();
        return sub_214603388();
      }
      if (v32 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_2146039B8();
        sub_214603878();
        char v37 = sub_214602E58();
        uint64_t v38 = v55;
        v27(v18, a3);
        uint64_t v39 = v49;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v38 + 16))(v49, v30, a3);
        if (v37)
        {
          v27(v39, a3);
          v27(v30, a3);
          goto LABEL_27;
        }
        uint64_t v34 = sub_214603358();
        v27(v39, a3);
        v27(v30, a3);
        goto LABEL_20;
      }
    }
    unint64_t v56 = v23;
    sub_2145FF364();
    sub_214603348();
    char v33 = sub_214602E58();
    v27(v18, a3);
    v27(v30, a3);
    if (v33) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
LABEL_27:
  uint64_t v41 = sub_214603508();
  swift_allocError();
  uint64_t v43 = v42;
  unint64_t v56 = 0;
  unint64_t v57 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_214603498();
  swift_bridgeObjectRelease();
  unint64_t v56 = 0xD000000000000018;
  unint64_t v57 = 0x80000002146100D0;
  uint64_t v58 = v53;
  swift_getMetatypeMetadata();
  sub_214602F08();
  sub_214602F68();
  swift_bridgeObjectRelease();
  sub_2146034F8();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v41 - 8) + 104))(v43, *MEMORY[0x263F8DCB8], v41);
  return swift_willThrow();
}

void *sub_2145F97EC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  if (swift_dynamicCastMetatype())
  {
    uint64_t result = sub_2145FC684(a1, a3);
    if (!v5) {
      return (void *)swift_dynamicCast();
    }
  }
  else
  {
    _s6LiftUIO8_DecoderCMa();
    uint64_t v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x263F8EE78];
    v12[2] = MEMORY[0x263F8EE78];
    id v14 = a3;
    v12[3] = sub_2145F429C(v13);
    v12[4] = v14;
    v12[2] = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v12[3] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2145F52DC(a4, a5);
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_2145F993C()
{
  return sub_2145FC010(*(void **)(v0 + 16));
}

uint64_t sub_2145F9944()
{
  return sub_2145FC424(*(void *)v0, *(void **)(v0 + 16)) & 1;
}

void *sub_2145F9968()
{
  return sub_2145FC684(*(void *)v0, *(void **)(v0 + 16));
}

void sub_2145F9988()
{
  sub_2145FC8B4(*(void *)v0, *(void **)(v0 + 16));
}

void sub_2145F99A8()
{
  sub_2145FC684(*(void *)v0, *(void **)(v0 + 16));
  if (!v1)
  {
    uint64_t v2 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_floatValue);
  }
}

void *sub_2145F9A1C()
{
  return sub_2145FCB18(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9A3C()
{
  return sub_2145FCD7C(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9A5C()
{
  return sub_2145FCFDC(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9A7C()
{
  return sub_2145FD23C(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9A9C()
{
  return sub_2145FD49C(*(void *)v0, *(void **)(v0 + 16));
}

uint64_t sub_2145F9ABC()
{
  return sub_2146038D8();
}

void *sub_2145F9AD4()
{
  return sub_2145FD700(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9AF4()
{
  return sub_2145FD960(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9B14()
{
  return sub_2145FDBC0(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9B34()
{
  return sub_2145FDE20(*(void *)v0, *(void **)(v0 + 16));
}

void *sub_2145F9B54()
{
  return sub_2145FE080(*(void *)v0, *(void **)(v0 + 16));
}

uint64_t sub_2145F9B74()
{
  return sub_2146038E8();
}

void *sub_2145F9B8C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return sub_2145F97EC(*(void *)v2, *(void *)(v2 + 8), *(void **)(v2 + 16), a1, a2);
}

uint64_t sub_2145F9BB4(uint64_t a1)
{
  unint64_t v2 = sub_2145FECF0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2145F9BF0(uint64_t a1)
{
  unint64_t v2 = sub_2145FECF0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2145F9C2C()
{
  sub_2145FEB08(*(void *)v0, *(id *)(v0 + 16), *(void *)(v0 + 24));
  if (!v1)
  {
    uint64_t v4 = v2;
    id v5 = objc_msgSend(v2, sel_attributtes);
    uint64_t v6 = sub_214602E08();

    if (*(void *)(v6 + 16) && (sub_214554F58(0x65756C6176, 0xE500000000000000), (v7 & 1) != 0))
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v8 = objc_msgSend(v4, sel_children);
      type metadata accessor for RUIXMLElement(0);
      unint64_t v9 = sub_214603058();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_214603618();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (!v10)
      {
        id v11 = objc_msgSend(v4, sel_stringValue);
        if (!v11)
        {

          char v3 = 1;
          return v3 & 1;
        }
      }
    }
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_2145F9D94()
{
  return sub_2145F9DF8((uint64_t (*)(uint64_t))sub_2145FED94);
}

uint64_t sub_2145F9DF8(uint64_t (*a1)(uint64_t))
{
  uint64_t result = a1(v1);
  if (v2) {
    return swift_willThrow();
  }
  uint64_t v4 = *(void *)(v1 + 24);
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    *(void *)(v1 + 24) = v6;
  }
  return result;
}

void *sub_2145F9E4C@<X0>(uint64_t a1@<X8>)
{
  char v3 = v1;
  uint64_t v6 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v7 = v3[3];
  sub_2145FEB08(*v3, (id)v3[2], v7);
  if (v2) {
    return (void *)swift_willThrow();
  }
  uint64_t v10 = v8;
  uint64_t v16 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_214616D50;
  uint64_t v12 = sub_2146037A8();
  uint64_t v14 = v13;
  *(void *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
  *(void *)(inited + 64) = sub_2145FECF0();
  uint64_t v15 = swift_allocObject();
  *(void *)(inited + 32) = v15;
  *(void *)(v15 + 16) = v12;
  *(void *)(v15 + 24) = v14;
  *(void *)(v15 + 32) = v7;
  *(unsigned char *)(v15 + 40) = 0;
  uint64_t v20 = v6;
  swift_bridgeObjectRetain();
  sub_2145FBAA4((void *)inited);
  id v18 = &_s6LiftUIO16UnkeyedContainerVN;
  unint64_t v19 = sub_2145FB1F4();
  uint64_t result = (void *)swift_allocObject();
  *(void *)&long long v17 = result;
  result[2] = v6;
  result[3] = v5;
  result[4] = v10;
  result[5] = 0;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    v3[3] = v7 + 1;
    sub_2145FED7C(&v17, v16);
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

void sub_2145F9FC0(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a1[3];
  sub_2145FEB08(*a1, (id)a1[2], v6);
  if (!v2)
  {
    uint64_t v8 = v7;
    uint64_t v19 = _s6LiftUIO8_DecoderCMa();
    unint64_t v9 = (void *)swift_allocObject();
    uint64_t v10 = MEMORY[0x263F8EE78];
    v9[2] = MEMORY[0x263F8EE78];
    id v18 = v8;
    v9[3] = sub_2145F429C(v10);
    v9[4] = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214616D50;
    uint64_t v12 = sub_2146037A8();
    uint64_t v17 = v4;
    uint64_t v13 = a2;
    uint64_t v15 = v14;
    *(void *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
    *(void *)(inited + 64) = sub_2145FECF0();
    uint64_t v16 = swift_allocObject();
    *(void *)(inited + 32) = v16;
    *(void *)(v16 + 16) = v12;
    *(void *)(v16 + 24) = v15;
    *(void *)(v16 + 32) = v6;
    *(unsigned char *)(v16 + 40) = 0;
    swift_bridgeObjectRetain();
    sub_2145FBAA4((void *)inited);
    v9[2] = v5;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v9[3] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v13[3] = v19;
    v13[4] = sub_2145F46FC();

    *uint64_t v13 = v9;
  }
}

void sub_2145FA16C()
{
  uint64_t v2 = *v0;
  uint64_t v15 = v0[1];
  uint64_t v3 = v0[3];
  sub_2145FEB08(*v0, (id)v0[2], v3);
  if (!v1)
  {
    uint64_t v5 = v4;
    _s6LiftUIO8_DecoderCMa();
    uint64_t v6 = (void *)swift_allocObject();
    uint64_t v7 = MEMORY[0x263F8EE78];
    void v6[2] = MEMORY[0x263F8EE78];
    id v14 = v5;
    v6[3] = sub_2145F429C(v7);
    v6[4] = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214616D50;
    uint64_t v9 = sub_2146037A8();
    uint64_t v11 = v10;
    *(void *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
    *(void *)(inited + 64) = sub_2145FECF0();
    uint64_t v12 = swift_allocObject();
    *(void *)(inited + 32) = v12;
    *(void *)(v12 + 16) = v9;
    *(void *)(v12 + 24) = v11;
    *(void *)(v12 + 32) = v3;
    *(unsigned char *)(v12 + 40) = 0;
    swift_bridgeObjectRetain();
    sub_2145FBAA4((void *)inited);
    void v6[2] = v2;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v6[3] = v15;
    swift_bridgeObjectRetain();
    uint64_t v13 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v13);
    sub_2145F9DF8((uint64_t (*)(uint64_t))sub_2145FEEFC);

    swift_release();
  }
}

uint64_t sub_2145FA384()
{
  return sub_2145FE9C8(*(void **)(v0 + 16));
}

BOOL sub_2145FA3A4()
{
  return sub_2145FEA60(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2145FA3AC()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_2145FA3B4()
{
  return sub_2145F9C2C() & 1;
}

void sub_2145FA3D0()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_2145FEF24(*(void *)v0, *(void **)(v0 + 16), v2);
  if (v1)
  {
    swift_willThrow();
  }
  else
  {
    uint64_t v3 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_BOOLValue);

    if (__OFADD__(v2, 1)) {
      __break(1u);
    }
    else {
      *(void *)(v0 + 24) = v2 + 1;
    }
  }
}

void *sub_2145FA460()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t result = sub_2145FEF24(*(void *)v0, *(void **)(v0 + 16), v2);
  uint64_t v4 = result;
  if (v1)
  {
    swift_willThrow();
    return v4;
  }
  if (!__OFADD__(v2, 1))
  {
    *(void *)(v0 + 24) = v2 + 1;
    return v4;
  }
  __break(1u);
  return result;
}

void sub_2145FA4C0()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_2145FEF24(*(void *)v0, *(void **)(v0 + 16), v2);
  if (v1)
  {
    swift_willThrow();
  }
  else
  {
    uint64_t v3 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_doubleValue);

    if (__OFADD__(v2, 1)) {
      __break(1u);
    }
    else {
      *(void *)(v0 + 24) = v2 + 1;
    }
  }
}

void sub_2145FA558()
{
  uint64_t v2 = *(void *)(v0 + 24);
  sub_2145FEF24(*(void *)v0, *(void **)(v0 + 16), v2);
  if (v1)
  {
    swift_willThrow();
  }
  else
  {
    uint64_t v3 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_floatValue);

    if (__OFADD__(v2, 1)) {
      __break(1u);
    }
    else {
      *(void *)(v0 + 24) = v2 + 1;
    }
  }
}

uint64_t sub_2145FA5F0(uint64_t a1, uint64_t a2)
{
  return sub_2145FA6A0(a1, a2, (uint64_t (*)(void *))sub_2145F8438);
}

uint64_t sub_2145FA61C(uint64_t a1, uint64_t a2)
{
  return sub_2145FA798(a1, a2, (uint64_t (*)(void *))sub_2145F8474);
}

uint64_t sub_2145FA648(uint64_t a1, uint64_t a2)
{
  return sub_2145FA864(a1, a2, (uint64_t (*)(void *))sub_2145F85D4);
}

uint64_t sub_2145FA674(uint64_t a1, uint64_t a2)
{
  return sub_2145FA930(a1, a2, (uint64_t (*)(void *))sub_2145F8734);
}

uint64_t sub_2145FA6A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = sub_2145FEF24(*(void *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(void *))a3(v7);
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(void *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2145FA728()
{
  return sub_214603858();
}

uint64_t sub_2145FA740(uint64_t a1, uint64_t a2)
{
  return sub_2145FA9FC(a1, a2, (uint64_t (*)(void *))sub_2145F8894);
}

uint64_t sub_2145FA76C(uint64_t a1, uint64_t a2)
{
  return sub_2145FA798(a1, a2, (uint64_t (*)(void *))sub_2145F89F8);
}

uint64_t sub_2145FA798(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = sub_2145FEF24(*(void *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(void *))a3(v7);
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(void *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2145FA838(uint64_t a1, uint64_t a2)
{
  return sub_2145FA864(a1, a2, (uint64_t (*)(void *))sub_2145F8B58);
}

uint64_t sub_2145FA864(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = sub_2145FEF24(*(void *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(void *))a3(v7);
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(void *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2145FA904(uint64_t a1, uint64_t a2)
{
  return sub_2145FA930(a1, a2, (uint64_t (*)(void *))sub_2145F8CB8);
}

uint64_t sub_2145FA930(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = sub_2145FEF24(*(void *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(void *))a3(v7);
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(void *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2145FA9D0(uint64_t a1, uint64_t a2)
{
  return sub_2145FA9FC(a1, a2, (uint64_t (*)(void *))sub_2145F8E18);
}

uint64_t sub_2145FA9FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = sub_2145FEF24(*(void *)v3, *(void **)(v3 + 16), v6);
  if (v4)
  {
    swift_willThrow();
    return (uint64_t)a3;
  }
  a3 = (uint64_t (*)(void *))a3(v7);
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    *(void *)(v3 + 24) = v6 + 1;
    return (uint64_t)a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2145FAA9C()
{
  return sub_214603868();
}

void sub_2145FAAB4()
{
}

uint64_t sub_2145FAACC()
{
  return sub_2146037E8();
}

uint64_t sub_2145FAAE4()
{
  return sub_2146037D8();
}

uint64_t sub_2145FAAFC()
{
  uint64_t result = sub_2146037F8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145FAB20(uint64_t a1, uint64_t a2)
{
  return sub_2145FAD4C(a1, a2, MEMORY[0x263F8E110]);
}

uint64_t sub_2145FAB4C()
{
  uint64_t result = sub_214603808();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145FAB70(uint64_t a1, uint64_t a2)
{
  return sub_2145FAC94(a1, a2, MEMORY[0x263F8E118]);
}

uint64_t sub_2145FAB9C(uint64_t a1, uint64_t a2)
{
  return sub_2145FACF0(a1, a2, MEMORY[0x263F8E120]);
}

uint64_t sub_2145FABC8(uint64_t a1, uint64_t a2)
{
  return sub_2145FAD4C(a1, a2, MEMORY[0x263F8E128]);
}

uint64_t sub_2145FABF4()
{
  uint64_t result = sub_214603838();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145FAC18(uint64_t a1, uint64_t a2)
{
  return sub_2145FADD4(a1, a2, MEMORY[0x263F8E138]);
}

uint64_t sub_2145FAC44()
{
  uint64_t result = sub_214603818();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145FAC68(uint64_t a1, uint64_t a2)
{
  return sub_2145FAC94(a1, a2, MEMORY[0x263F8E130]);
}

uint64_t sub_2145FAC94(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_2145FACC4(uint64_t a1, uint64_t a2)
{
  return sub_2145FACF0(a1, a2, MEMORY[0x263F8E140]);
}

uint64_t sub_2145FACF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_2145FAD20(uint64_t a1, uint64_t a2)
{
  return sub_2145FAD4C(a1, a2, MEMORY[0x263F8E148]);
}

uint64_t sub_2145FAD4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_2145FAD84()
{
  uint64_t result = sub_214603848();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2145FADA8(uint64_t a1, uint64_t a2)
{
  return sub_2145FADD4(a1, a2, MEMORY[0x263F8E150]);
}

uint64_t sub_2145FADD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t sub_2145FAE00()
{
  return sub_214603828();
}

uint64_t sub_2145FAE2C()
{
  return sub_2145F9D94();
}

void *sub_2145FAE4C@<X0>(uint64_t a1@<X8>)
{
  return sub_2145F9E4C(a1);
}

void sub_2145FAE64(void *a1@<X8>)
{
  sub_2145F9FC0(v1, a1);
  if (v2)
  {
    swift_willThrow();
  }
  else
  {
    uint64_t v3 = v1[3];
    BOOL v4 = __OFADD__(v3, 1);
    uint64_t v5 = v3 + 1;
    if (v4) {
      __break(1u);
    }
    else {
      v1[3] = v5;
    }
  }
}

uint64_t SingleValueDecodingContainer.ruiXMLElement.getter(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
  if (swift_dynamicCast())
  {
    uint64_t v1 = v9[3];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = sub_214603508();
    swift_allocError();
    uint64_t v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
    *uint64_t v7 = type metadata accessor for RUIXMLElement(0);
    sub_2146038A8();
    sub_2146034F8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v7, *MEMORY[0x263F8DCC0], v5);
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_2145FB074()
{
  unint64_t result = qword_26780E3D0;
  if (!qword_26780E3D0)
  {
    type metadata accessor for RUI.LiftUI.XMLDecoder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780E3D0);
  }
  return result;
}

uint64_t type metadata accessor for RUI.LiftUI.XMLDecoder()
{
  return self;
}

uint64_t sub_2145FB0EC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

ValueMetadata *type metadata accessor for RUI.LiftUI()
{
  return &type metadata for RUI.LiftUI;
}

uint64_t method lookup function for RUI.LiftUI.XMLDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RUI.LiftUI.XMLDecoder);
}

uint64_t dispatch thunk of RUI.LiftUI.XMLDecoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *_s6LiftUIO20SingleValueContainerVMa()
{
  return &_s6LiftUIO20SingleValueContainerVN;
}

unint64_t sub_2145FB1A0()
{
  unint64_t result = qword_267819980;
  if (!qword_267819980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267819980);
  }
  return result;
}

unint64_t sub_2145FB1F4()
{
  unint64_t result = qword_267819988[0];
  if (!qword_267819988[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267819988);
  }
  return result;
}

uint64_t sub_2145FB248()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2145FB290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_214554F58(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2145D0A04();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_2145FB378(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_2145FB378(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_2146033C8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_214603A78();
        swift_bridgeObjectRetain();
        sub_214602F48();
        uint64_t v9 = sub_214603A98();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          uint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2145FB550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_214554F58(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2145D0A04();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      BOOL v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_2145D06DC(v17, a5 & 1);
  unint64_t v23 = sub_214554F58(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_2146039E8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  *char v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2145FB6D8(uint64_t result)
{
  uint64_t v3 = *(void *)(result + 16);
  uint64_t v4 = *v1;
  int64_t v5 = *((void *)*v1 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = result;
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    uint64_t v4 = sub_2145D0CAC(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = *((void *)v4 + 3) >> 1;
  }
  uint64_t v11 = *((void *)v4 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_2145FBDC4((uint64_t)v38, &v4[16 * v11 + 32], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v14 = *((void *)v4 + 2);
    BOOL v15 = __OFADD__(v14, result);
    uint64_t v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    *((void *)v4 + 2) = v16;
  }
  if (result != v12)
  {
LABEL_13:
    uint64_t result = sub_21455539C();
    uint64_t *v1 = v4;
    return result;
  }
LABEL_16:
  int64_t v2 = *((void *)v4 + 2);
  uint64_t v3 = v38[0];
  uint64_t v37 = v38[1];
  uint64_t v13 = v39;
  int64_t v6 = v40;
  if (v41)
  {
    unint64_t v17 = (v41 - 1) & v41;
    unint64_t v18 = __clz(__rbit64(v41)) | (v40 << 6);
    int64_t v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  int64_t v32 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    goto LABEL_66;
  }
  int64_t v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36) {
    goto LABEL_13;
  }
  unint64_t v33 = *(void *)(v37 + 8 * v32);
  int64_t v34 = v6 + 1;
  if (!v33)
  {
    int64_t v34 = v6 + 2;
    if (v6 + 2 >= v36) {
      goto LABEL_13;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v34);
    if (!v33)
    {
      int64_t v34 = v6 + 3;
      if (v6 + 3 >= v36) {
        goto LABEL_13;
      }
      unint64_t v33 = *(void *)(v37 + 8 * v34);
      if (!v33)
      {
        int64_t v34 = v6 + 4;
        if (v6 + 4 >= v36) {
          goto LABEL_13;
        }
        unint64_t v33 = *(void *)(v37 + 8 * v34);
        if (!v33)
        {
          int64_t v34 = v6 + 5;
          if (v6 + 5 >= v36) {
            goto LABEL_13;
          }
          unint64_t v33 = *(void *)(v37 + 8 * v34);
          if (!v33)
          {
            int64_t v35 = v6 + 6;
            do
            {
              if (v36 == v35) {
                goto LABEL_13;
              }
              unint64_t v33 = *(void *)(v37 + 8 * v35++);
            }
            while (!v33);
            int64_t v34 = v35 - 1;
          }
        }
      }
    }
  }
  unint64_t v17 = (v33 - 1) & v33;
  unint64_t v18 = __clz(__rbit64(v33)) + (v34 << 6);
  int64_t v6 = v34;
LABEL_18:
  uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v18);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v22 = *((void *)v4 + 3);
    int64_t v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1) {
      break;
    }
    if (v2 < v23) {
      goto LABEL_23;
    }
LABEL_20:
    *((void *)v4 + 2) = v2;
  }
  uint64_t result = (uint64_t)sub_2145D0CAC((char *)(v22 > 1), v2 + 1, 1, v4);
  uint64_t v4 = (char *)result;
  int64_t v23 = *(void *)(result + 24) >> 1;
  if (v2 >= v23) {
    goto LABEL_20;
  }
  while (1)
  {
LABEL_23:
    char v24 = &v4[16 * v2 + 32];
    *(void *)char v24 = v21;
    *((void *)v24 + 1) = v20;
    ++v2;
    if (v17)
    {
      unint64_t v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    int64_t v27 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v27 >= v36) {
      goto LABEL_45;
    }
    unint64_t v28 = *(void *)(v37 + 8 * v27);
    int64_t v29 = v6 + 1;
    if (!v28)
    {
      int64_t v29 = v6 + 2;
      if (v6 + 2 >= v36) {
        goto LABEL_45;
      }
      unint64_t v28 = *(void *)(v37 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v6 + 3;
        if (v6 + 3 >= v36) {
          goto LABEL_45;
        }
        unint64_t v28 = *(void *)(v37 + 8 * v29);
        if (!v28)
        {
          int64_t v29 = v6 + 4;
          if (v6 + 4 >= v36) {
            goto LABEL_45;
          }
          unint64_t v28 = *(void *)(v37 + 8 * v29);
          if (!v28)
          {
            int64_t v29 = v6 + 5;
            if (v6 + 5 >= v36) {
              goto LABEL_45;
            }
            unint64_t v28 = *(void *)(v37 + 8 * v29);
            if (!v28)
            {
              int64_t v30 = v6 + 6;
              while (v36 != v30)
              {
                unint64_t v28 = *(void *)(v37 + 8 * v30++);
                if (v28)
                {
                  int64_t v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              *((void *)v4 + 2) = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    unint64_t v17 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
    int64_t v6 = v29;
LABEL_41:
    char v31 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v26);
    uint64_t v21 = *v31;
    uint64_t v20 = v31[1];
    if (v2 >= v23)
    {
      uint64_t result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    uint64_t result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

void *sub_2145FBAA4(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = sub_2145FBBA4(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F340);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void *sub_2145FBBA4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    _OWORD v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F340);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2145FBCDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780E070);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2145FBDC4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21455539C();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2145FBDC4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
  size_t v11 = a2;
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
    *size_t v11 = *v20;
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

uint64_t sub_2145FBFC4()
{
  unint64_t v0 = sub_214603688();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_2145FC010(void *a1)
{
  id v2 = objc_msgSend(a1, sel_attributtes);
  uint64_t v3 = sub_214602E08();

  if (*(void *)(v3 + 16))
  {
    sub_214554F58(0x65756C6176, 0xE500000000000000);
    char v5 = v4;
    swift_bridgeObjectRelease();
    if (v5) {
      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(a1, sel_children);
  type metadata accessor for RUIXMLElement(0);
  unint64_t v7 = sub_214603058();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8) {
    return 0;
  }
  id v9 = objc_msgSend(a1, sel_stringValue);
  if (v9)
  {

    return 0;
  }
  return 1;
}

uint64_t sub_2145FC154(int a1, id a2)
{
  id v3 = objc_msgSend(a2, sel_attributtes);
  uint64_t v4 = sub_214602E08();

  if (*(void *)(v4 + 16) && (sub_214554F58(1701869940, 0xE400000000000000), (v5 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_2145FBFC4();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = 4;
  }
  id v7 = objc_msgSend(a2, sel_attributtes);
  uint64_t v8 = MEMORY[0x263F8D310];
  uint64_t v9 = sub_214602E08();

  if (*(void *)(v9 + 16) && (sub_214554F58(0x65756C6176, 0xE500000000000000), (v10 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(a2, sel_stringValue);
    if (v11)
    {
      int64_t v12 = v11;
      sub_214602EA8();
    }
    else
    {
      uint64_t v6 = sub_214603508();
      swift_allocError();
      int64_t v14 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
      *int64_t v14 = v8;
      swift_bridgeObjectRetain();
      sub_214603498();
      swift_bridgeObjectRelease();
      id v15 = a2;
      id v16 = objc_msgSend(v15, sel_description, 0xD00000000000001DLL, 0x8000000214610080);
      sub_214602EA8();

      sub_214602F68();
      swift_bridgeObjectRelease();
      sub_2146034F8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v14, *MEMORY[0x263F8DCC0], v6);
      swift_willThrow();
    }
  }
  return v6;
}

uint64_t sub_2145FC424(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
        swift_bridgeObjectRelease();
        goto LABEL_5;
      case 4:
        goto LABEL_5;
      default:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6)
        {
LABEL_5:
          id v7 = (void *)sub_214602E78();
          swift_bridgeObjectRelease();
          LOBYTE(v2) = objc_msgSend(v7, sel_BOOLValue);
        }
        else
        {
          uint64_t v9 = sub_214603508();
          swift_allocError();
          id v11 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
          *id v11 = MEMORY[0x263F8D4F8];
          swift_bridgeObjectRetain();
          sub_214603498();
          swift_bridgeObjectRelease();
          v12[0] = 0xD00000000000002CLL;
          v12[1] = 0x80000002146102D0;
          char v13 = v5;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
          sub_214602F08();
          swift_bridgeObjectRelease();
          id v2 = v12;
          sub_214602F68();
          swift_bridgeObjectRelease();
          sub_2146034F8();
          (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v9);
          swift_willThrow();
        }
        break;
    }
  }
  return v2 & 1;
}

void *sub_2145FC684(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v7 = v4;
    id v2 = v5;
    switch(v4)
    {
      case 3:
        swift_bridgeObjectRelease();
        break;
      case 4:
        return v2;
      default:
        char v8 = sub_214603898();
        swift_bridgeObjectRelease();
        if ((v8 & 1) == 0)
        {
          uint64_t v9 = sub_214603508();
          swift_allocError();
          id v11 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
          *id v11 = MEMORY[0x263F8D310];
          swift_bridgeObjectRetain();
          sub_214603498();
          swift_bridgeObjectRelease();
          v12[0] = 0xD00000000000002ELL;
          v12[1] = 0x8000000214610050;
          char v13 = v7;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
          sub_214602F08();
          swift_bridgeObjectRelease();
          id v2 = v12;
          sub_214602F68();
          swift_bridgeObjectRelease();
          sub_2146034F8();
          (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB0], v9);
          swift_willThrow();
        }
        break;
    }
  }
  return v2;
}

void sub_2145FC8B4(int a1, void *a2)
{
  char v3 = sub_2145FC154(a1, a2);
  if (!v2)
  {
    switch(v3)
    {
      case 2:
        swift_bridgeObjectRelease();
        goto LABEL_5;
      case 4:
        goto LABEL_5;
      default:
        char v4 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v4)
        {
LABEL_5:
          char v5 = (void *)sub_214602E78();
          swift_bridgeObjectRelease();
          objc_msgSend(v5, sel_doubleValue);
        }
        else
        {
          uint64_t v6 = sub_214603508();
          swift_allocError();
          char v8 = v7;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
          *char v8 = MEMORY[0x263F8D538];
          swift_bridgeObjectRetain();
          sub_214603498();
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
          sub_214602F08();
          swift_bridgeObjectRelease();
          sub_214602F68();
          swift_bridgeObjectRelease();
          sub_2146034F8();
          (*(void (**)(void *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB0], v6);
          swift_willThrow();
        }
        break;
    }
  }
}

void *sub_2145FCB18(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_5;
        }
        uint64_t v8 = sub_214603508();
        swift_allocError();
        char v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *char v10 = MEMORY[0x263F8D6C8];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v12[0] = 0xD00000000000002BLL;
        v12[1] = 0x8000000214610270;
        char v13 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v12;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCB0], v8);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_5;
      default:
        swift_bridgeObjectRelease();
LABEL_5:
        char v7 = (void *)sub_214602E78();
        uint64_t v2 = objc_msgSend(v7, sel_integerValue);

        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FCD7C(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E498];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002CLL;
        v11[1] = 0x8000000214610240;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = sub_2145F8474();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FCFDC(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E4F0];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002DLL;
        v11[1] = 0x8000000214610210;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = sub_2145F85D4();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FD23C(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E548];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002DLL;
        v11[1] = 0x80000002146101E0;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = sub_2145F8734();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FD49C(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_5;
        }
        uint64_t v8 = sub_214603508();
        swift_allocError();
        char v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *char v10 = MEMORY[0x263F8E5C0];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v12[0] = 0xD00000000000002DLL;
        v12[1] = 0x80000002146101B0;
        char v13 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v12;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCB0], v8);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_5;
      default:
        swift_bridgeObjectRelease();
LABEL_5:
        uint64_t v7 = (void *)sub_214602E78();
        uint64_t v2 = objc_msgSend(v7, sel_integerValue);

        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FD700(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8D9D0];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002CLL;
        v11[1] = 0x8000000214610180;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = (void *)sub_2145F8894();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FD960(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E778];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002DLL;
        v11[1] = 0x8000000214610150;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = sub_2145F89F8();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FDBC0(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E888];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002ELL;
        v11[1] = 0x8000000214610120;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = (void *)sub_2145F8B58();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FDE20(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E8F8];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002ELL;
        v11[1] = 0x80000002146100F0;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = (void *)sub_2145F8CB8();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

void *sub_2145FE080(int a1, void *a2)
{
  char v4 = sub_2145FC154(a1, a2);
  if (!v3)
  {
    char v5 = v4;
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
        char v6 = sub_214603898();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_8;
        }
        uint64_t v7 = sub_214603508();
        swift_allocError();
        uint64_t v9 = v8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00);
        *uint64_t v9 = MEMORY[0x263F8E970];
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        v11[0] = 0xD00000000000002ELL;
        v11[1] = 0x80000002146100A0;
        char v12 = v5;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26780F2E8);
        sub_214602F08();
        swift_bridgeObjectRelease();
        uint64_t v2 = v11;
        sub_214602F68();
        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCB0], v7);
        swift_willThrow();
        break;
      case 4:
        goto LABEL_8;
      default:
        swift_bridgeObjectRelease();
LABEL_8:
        uint64_t v2 = (void *)sub_2145F8E18();
        swift_bridgeObjectRelease();
        break;
    }
  }
  return v2;
}

uint64_t _s6LiftUIO14KeyedContainerVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2145FE2F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2145FE360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void *_s6LiftUIO20SingleValueContainerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *_s6LiftUIO20SingleValueContainerVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

uint64_t _s6LiftUIO20SingleValueContainerVwta_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t _s6LiftUIO20SingleValueContainerVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2145FE4C0(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_2145FE504(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6LiftUIO11TypedStringVwca(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6LiftUIO11TypedStringVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6LiftUIO11TypedStringVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6LiftUIO11TypedStringVwst(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s6LiftUIO11TypedStringVMa()
{
  return &_s6LiftUIO11TypedStringVN;
}

unsigned char *_s6LiftUIO11TypedStringV9ValueTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0x2145FE728);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s6LiftUIO11TypedStringV9ValueTypeOMa()
{
  return &_s6LiftUIO11TypedStringV9ValueTypeON;
}

void _s6LiftUIO20SingleValueContainerVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 16);
}

void *_s6LiftUIO16UnkeyedContainerVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

void *_s6LiftUIO16UnkeyedContainerVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t _s6LiftUIO16UnkeyedContainerVwta(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t _s6LiftUIO16UnkeyedContainerVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6LiftUIO16UnkeyedContainerVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s6LiftUIO16UnkeyedContainerVMa()
{
  return &_s6LiftUIO16UnkeyedContainerVN;
}

unint64_t sub_2145FE96C()
{
  unint64_t result = qword_267819A90[0];
  if (!qword_267819A90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267819A90);
  }
  return result;
}

uint64_t sub_2145FE9C0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_2145FE9C8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_children);
  type metadata accessor for RUIXMLElement(0);
  unint64_t v2 = sub_214603058();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v3;
}

BOOL sub_2145FEA60(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel_children);
  type metadata accessor for RUIXMLElement(0);
  unint64_t v4 = sub_214603058();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v5 <= a2;
}

void sub_2145FEB08(int a1, id a2, uint64_t a3)
{
  id v5 = objc_msgSend(a2, sel_children);
  type metadata accessor for RUIXMLElement(0);
  unint64_t v6 = sub_214603058();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_214603618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 <= a3)
  {
    uint64_t v11 = sub_214603508();
    swift_allocError();
    uint64_t v13 = v12;
    swift_bridgeObjectRetain();
    sub_2146034F8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB8], v11);
    swift_willThrow();
  }
  else
  {
    id v8 = objc_msgSend(a2, sel_children);
    uint64_t v9 = sub_214603058();

    if ((v9 & 0xC000000000000001) != 0)
    {
      MEMORY[0x2166A3B40](a3, v9);
      goto LABEL_8;
    }
    if (a3 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
    {
      id v10 = *(id *)(v9 + 8 * a3 + 32);
LABEL_8:
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
}

unint64_t sub_2145FECF0()
{
  unint64_t result = qword_267819CA0[0];
  if (!qword_267819CA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267819CA0);
  }
  return result;
}

uint64_t sub_2145FED44()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_2145FED7C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_2145FED94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  sub_2145FEB08(*(void *)a1, *(id *)(a1 + 16), v2);
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F338);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_214616D50;
    uint64_t v4 = sub_2146037A8();
    uint64_t v6 = v5;
    *(void *)(inited + 56) = &_s6LiftUIO16UnkeyedContainerV3KeyVN;
    *(void *)(inited + 64) = sub_2145FECF0();
    uint64_t v7 = swift_allocObject();
    *(void *)(inited + 32) = v7;
    *(void *)(v7 + 16) = v4;
    *(void *)(v7 + 24) = v6;
    *(void *)(v7 + 32) = v2;
    *(unsigned char *)(v7 + 40) = 0;
    swift_bridgeObjectRetain();
    sub_2145FBAA4((void *)inited);
    _s6LiftUIO14KeyedContainerVMa();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    sub_214603758();
  }
}

void sub_2145FEEFC(uint64_t a1@<X8>)
{
  sub_2145F52DC(*(void *)(v1 + 24), a1);
}

void *sub_2145FEF24(int a1, void *a2, uint64_t a3)
{
  sub_2145FEB08(a1, a2, a3);
  if (!v4)
  {
    id v8 = v6;
    id v9 = objc_msgSend(v6, sel_attributtes);
    uint64_t v10 = MEMORY[0x263F8D310];
    uint64_t v11 = sub_214602E08();

    if (*(void *)(v11 + 16) && (unint64_t v12 = sub_214554F58(0x65756C6176, 0xE500000000000000), (v13 & 1) != 0))
    {
      long long v3 = *(void **)(*(void *)(v11 + 56) + 16 * v12);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v14 = objc_msgSend(v8, sel_stringValue);
      if (v14)
      {
        id v15 = v14;
        long long v3 = (void *)sub_214602EA8();
      }
      else
      {
        uint64_t v16 = sub_214603508();
        swift_allocError();
        unint64_t v18 = v17;
        v21[3] = (char *)v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780ED00) + 48);
        *unint64_t v18 = v10;
        swift_bridgeObjectRetain();
        sub_214603498();
        swift_bridgeObjectRelease();
        id v19 = a2;
        id v20 = objc_msgSend(v19, sel_description, 0xD00000000000001DLL, 0x8000000214610080);
        sub_214602EA8();

        long long v3 = v21;
        sub_214602F68();

        swift_bridgeObjectRelease();
        sub_2146034F8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCC0], v16);
        swift_willThrow();
      }
    }
  }
  return v3;
}

uint64_t sub_2145FF17C(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_name);
  uint64_t v2 = sub_214602EA8();
  uint64_t v4 = v3;

  if (v2 == sub_214603AF8() && v4 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = sub_214603898();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2145FF244(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_name);
  uint64_t v2 = sub_214602EA8();
  uint64_t v4 = v3;

  if (v2 == sub_214603AF8() && v4 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = sub_214603898();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

unint64_t sub_2145FF310()
{
  unint64_t result = qword_26780F350;
  if (!qword_26780F350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F350);
  }
  return result;
}

unint64_t sub_2145FF364()
{
  unint64_t result = qword_26780F358;
  if (!qword_26780F358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F358);
  }
  return result;
}

unint64_t sub_2145FF3B8()
{
  unint64_t result = qword_26780F360;
  if (!qword_26780F360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F360);
  }
  return result;
}

unint64_t sub_2145FF40C()
{
  unint64_t result = qword_26780F368;
  if (!qword_26780F368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F368);
  }
  return result;
}

unint64_t sub_2145FF460()
{
  unint64_t result = qword_26780F370;
  if (!qword_26780F370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F370);
  }
  return result;
}

unint64_t sub_2145FF4B4()
{
  unint64_t result = qword_26780F378;
  if (!qword_26780F378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F378);
  }
  return result;
}

unint64_t sub_2145FF508()
{
  unint64_t result = qword_26780F380;
  if (!qword_26780F380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F380);
  }
  return result;
}

unint64_t sub_2145FF55C()
{
  unint64_t result = qword_26780F388;
  if (!qword_26780F388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F388);
  }
  return result;
}

unint64_t sub_2145FF5B0()
{
  unint64_t result = qword_26780F390;
  if (!qword_26780F390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F390);
  }
  return result;
}

unint64_t sub_2145FF604()
{
  unint64_t result = qword_26780F398;
  if (!qword_26780F398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F398);
  }
  return result;
}

uint64_t sub_2145FF658()
{
  uint64_t v0 = sub_214603AF8();
  uint64_t v2 = v1;
  if (v0 == sub_214603AF8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_214603898();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2145FF710()
{
  return sub_214603B08();
}

unint64_t sub_2145FF774()
{
  unint64_t result = qword_26780F3A0;
  if (!qword_26780F3A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780ECE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F3A0);
  }
  return result;
}

ValueMetadata *_s6LiftUIO16UnkeyedContainerV3KeyVMa()
{
  return &_s6LiftUIO16UnkeyedContainerV3KeyVN;
}

unint64_t sub_2145FF7E4()
{
  unint64_t result = qword_267819DB0;
  if (!qword_267819DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267819DB0);
  }
  return result;
}

unint64_t sub_2145FF83C()
{
  unint64_t result = qword_267819DB8[0];
  if (!qword_267819DB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267819DB8);
  }
  return result;
}

uint64_t sub_2145FF894@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F3A8);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (double *)((char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F3B0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v8 = sub_214602798();
  v8[1] = a3;
  *((unsigned char *)v8 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F3B8);
  v26[1] = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F3C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26780F3C8);
  sub_21455B000(&qword_26780F3D0, &qword_26780F3C0);
  sub_21455B000(&qword_26780F3D8, &qword_26780F3C8);
  sub_2145FFB9C();
  sub_214602D78();
  char v13 = sub_214602A88();
  sub_2146024B8();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_2145553A4((uint64_t)v8, (uint64_t)v12, &qword_26780F3A8);
  unint64_t v22 = &v12[*(int *)(v10 + 44)];
  *unint64_t v22 = v13;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v21;
  v22[40] = 0;
  sub_2145515B8((uint64_t)v8, &qword_26780F3A8);
  char v23 = sub_214602AC8();
  sub_2145553A4((uint64_t)v12, a2, &qword_26780F3B0);
  uint64_t v24 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26780F3E8) + 36);
  *(unsigned char *)uint64_t v24 = v23;
  *(_OWORD *)(v24 + 8) = 0u;
  *(_OWORD *)(v24 + 24) = 0u;
  *(unsigned char *)(v24 + 40) = 1;
  return sub_2145515B8((uint64_t)v12, &qword_26780F3B0);
}

uint64_t sub_2145FFB2C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = a1[2];
  *(void *)a2 = sub_214602838();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  *(void *)(a2 + 40) = v4;
  *(void *)(a2 + 48) = v3;
  *(void *)(a2 + 56) = v5;
  *(void *)(a2 + 64) = 0;
  *(unsigned char *)(a2 + 72) = 1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

unint64_t sub_2145FFB9C()
{
  unint64_t result = qword_26780F3E0;
  if (!qword_26780F3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F3E0);
  }
  return result;
}

uint64_t sub_2145FFBF0()
{
  return sub_214603A98();
}

uint64_t sub_2145FFC40()
{
  return sub_214602F48();
}

uint64_t sub_2145FFC54()
{
  return sub_214603A98();
}

uint64_t sub_2145FFCA0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_214603688();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2145FFCF4(void *a1@<X8>)
{
  *a1 = 0x6C656E6170;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_2145FFD0C()
{
  return 0x6C656E6170;
}

uint64_t sub_2145FFD20@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_214603688();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2145FFD78(uint64_t a1)
{
  unint64_t v2 = sub_214600B60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2145FFDB4(uint64_t a1)
{
  unint64_t v2 = sub_214600B60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2145FFDF0@<X0>(uint64_t a1@<X8>)
{
  return sub_2145FF894(*(void *)(v1 + 16), a1, *(double *)(v1 + 24));
}

uint64_t sub_2145FFDFC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2145FFF28(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_2145FFE30()
{
  return sub_214602D78();
}

uint64_t sub_2145FFEF8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_21460018C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_2145FFF28(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780F440);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t countAndFlagsBits = Decoder.decodeRUIID()()._countAndFlagsBits;
  if (v8)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v1 = countAndFlagsBits;
    uint64_t v11 = v4;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_214600B60();
    swift_bridgeObjectRetain();
    sub_214603AD8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780F3C0);
    sub_214600BB4(&qword_26780F448, &qword_26780F3C0, (void (*)(void))sub_214600C20);
    sub_214603718();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t sub_21460018C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t countAndFlagsBits = Decoder.decodeRUIID()()._countAndFlagsBits;
  if (v4)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    uint64_t v1 = countAndFlagsBits;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    swift_bridgeObjectRetain();
    sub_214603AB8();
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26780E438);
    sub_214600BB4((unint64_t *)&qword_26780E440, &qword_26780E438, (void (*)(void))sub_214583C40);
    sub_2146038C8();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v1;
}

unint64_t sub_214600348()
{
  unint64_t result = qword_26780F3F0;
  if (!qword_26780F3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F3F0);
  }
  return result;
}

unint64_t sub_2146003A0()
{
  unint64_t result = qword_26780F3F8;
  if (!qword_26780F3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F3F8);
  }
  return result;
}

unint64_t sub_2146003F8()
{
  unint64_t result = qword_26780F400;
  if (!qword_26780F400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F400);
  }
  return result;
}

unint64_t sub_21460044C(void *a1)
{
  a1[1] = sub_214600484();
  a1[2] = sub_2146004D8();
  unint64_t result = sub_21460052C();
  a1[3] = result;
  return result;
}

unint64_t sub_214600484()
{
  unint64_t result = qword_26780F408;
  if (!qword_26780F408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F408);
  }
  return result;
}

unint64_t sub_2146004D8()
{
  unint64_t result = qword_26780F410;
  if (!qword_26780F410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F410);
  }
  return result;
}

unint64_t sub_21460052C()
{
  unint64_t result = qword_26780F418;
  if (!qword_26780F418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F418);
  }
  return result;
}

uint64_t sub_214600580()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21460059C()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeWithCopy for HSplitViewElement(void *a1, void *a2)
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

void *assignWithCopy for HSplitViewElement(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for HSplitViewElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for HSplitViewElement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HSplitViewElement(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HSplitViewElement()
{
  return &type metadata for HSplitViewElement;
}

unsigned char *storeEnumTagSinglePayload for HSplitViewElement.CodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2146007F0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HSplitViewElement.CodingKeys()
{
  return &type metadata for HSplitViewElement.CodingKeys;
}

uint64_t _s8RemoteUI17HSplitViewElementV5PanelVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s8RemoteUI17HSplitViewElementV5PanelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HSplitViewElement.Panel(void *a1, void *a2)
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

uint64_t assignWithTake for HSplitViewElement.Panel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HSplitViewElement.Panel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HSplitViewElement.Panel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for HSplitViewElement.Panel()
{
  return &type metadata for HSplitViewElement.Panel;
}

unint64_t sub_2146009F4()
{
  unint64_t result = qword_26780F420;
  if (!qword_26780F420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F3E8);
    sub_214600A70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F420);
  }
  return result;
}

unint64_t sub_214600A70()
{
  unint64_t result = qword_26780F428;
  if (!qword_26780F428)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26780F3B0);
    sub_21455B000(&qword_26780F430, &qword_26780F3A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F428);
  }
  return result;
}

uint64_t sub_214600B10()
{
  return sub_214600BB4((unint64_t *)&qword_26780F0D8, &qword_26780F0E0, (void (*)(void))sub_214587BAC);
}

unint64_t sub_214600B60()
{
  unint64_t result = qword_26780F438;
  if (!qword_26780F438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F438);
  }
  return result;
}

uint64_t sub_214600BB4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_214600C20()
{
  unint64_t result = qword_26780F450;
  if (!qword_26780F450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26780F450);
  }
  return result;
}

uint64_t sub_214600C74()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getBFFStyleClass_block_invoke_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SetupAssistantUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIStyle.m", 48, @"%s", *a1);

  __break(1u);
}

void __getBFFStyleClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBFFStyleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIStyle.m", 49, @"Unable to find class %s", "BFFStyle");

  __break(1u);
}

void RUIJSSection_removeRow_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_2144F2000, log, OS_LOG_TYPE_ERROR, "section.removeRow: Attempt to remove row %i of section %i, out of bounds.", (uint8_t *)v3, 0xEu);
}

void RUIJSSection_updateHTMLFooterContent_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2144F2000, log, OS_LOG_TYPE_ERROR, "Number of arguments or type mismatch.", v1, 2u);
}

void getAKAppleIDAuthenticationErrorDomain_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAKAppleIDAuthenticationErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIObjectModel.m", 61, @"%s", dlerror());

  __break(1u);
}

void getAKAuthenticationPasswordKey_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getAKAuthenticationPasswordKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIObjectModel.m", 58, @"%s", dlerror());

  __break(1u);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AuthKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIObjectModel.m", 64, @"%s", *a1);

  __break(1u);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAKAppleIDAuthenticationInAppContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIObjectModel.m", 65, @"Unable to find class %s", "AKAppleIDAuthenticationInAppContext");

  __break(1u);
}

void __getACAccountStoreClass_block_invoke_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AppleAccountLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIObjectModel.m", 69, @"%s", *a1);

  __break(1u);
}

void __getACAccountStoreClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getACAccountStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIObjectModel.m", 70, @"Unable to find class %s", "ACAccountStore");

  __break(1u);
}

void __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAKAppleIDAuthenticationControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIObjectModel.m", 52, @"Unable to find class %s", "AKAppleIDAuthenticationController");

  __break(1u);
}

void AuthKitLibrary_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AuthKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIObjectModel.m", 51, @"%s", *a1);

  __break(1u);
}

void HSAAuthenticationLibrary_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *HSAAuthenticationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RemoteUIController.m", 42, @"%s", *a1);

  __break(1u);
}

void __getPSListControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPSListControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIPasscodeView.m", 61, @"Unable to find class %s", "PSListController");

  __break(1u);
}

void PreferencesLibrary_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PreferencesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIPasscodeView.m", 57, @"%s", *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ManagedConfigurationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIPasscodeView.m", 66, @"%s", *a1);

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMCProfileConnectionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIPasscodeView.m", 67, @"Unable to find class %s", "MCProfileConnection");

  __break(1u);
}

void __getPSPasscodeFieldClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPSPasscodeFieldClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIPasscodeView.m", 58, @"Unable to find class %s", "PSPasscodeField");

  __break(1u);
}

void __getOBPrivacyLinkControllerClass_block_invoke_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *OnBoardingKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUIPrivacyLinkContainerView.m", 17, @"%s", *a1);

  __break(1u);
}

void __getOBPrivacyLinkControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getOBPrivacyLinkControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RUIPrivacyLinkContainerView.m", 18, @"Unable to find class %s", "OBPrivacyLinkController");

  __break(1u);
}

void __getCTSettingCopyMyPhoneNumberSymbolLoc_block_invoke_cold_1(void *a1)
{
  unint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreTelephonyLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RUITableViewRow.m", 49, @"%s", *a1);

  __break(1u);
}

uint64_t sub_214601E58()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_214601E68()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_214601E88()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_214601E98()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_214601EA8()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_214601EB8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_214601EC8()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_214601ED8()
{
  return MEMORY[0x270EEE530]();
}

uint64_t sub_214601EE8()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_214601EF8()
{
  return MEMORY[0x270EEE570]();
}

uint64_t sub_214601F08()
{
  return MEMORY[0x270EEE580]();
}

uint64_t sub_214601F18()
{
  return MEMORY[0x270EEE590]();
}

uint64_t sub_214601F28()
{
  return MEMORY[0x270EEE5A0]();
}

uint64_t sub_214601F38()
{
  return MEMORY[0x270EEE5D8]();
}

uint64_t sub_214601F48()
{
  return MEMORY[0x270EEE5E8]();
}

uint64_t sub_214601F58()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_214601F68()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_214601F78()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_214601F88()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_214601F98()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_214601FA8()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_214601FB8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_214601FC8()
{
  return MEMORY[0x270EEF770]();
}

uint64_t sub_214601FD8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_214601FE8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_214601FF8()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_214602008()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_214602018()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_214602028()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_214602038()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_214602048()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_214602058()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_214602068()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_214602078()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_214602088()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_214602098()
{
  return MEMORY[0x270EEFEF0]();
}

uint64_t sub_2146020A8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2146020B8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2146020C8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2146020D8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2146020E8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2146020F8()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_214602108()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_214602118()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_214602128()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_214602138()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_214602148()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_214602158()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_214602168()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_214602178()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_214602188()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_214602198()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2146021A8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2146021B8()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2146021C8()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2146021D8()
{
  return MEMORY[0x270FA2AB0]();
}

uint64_t sub_2146021E8()
{
  return MEMORY[0x270F08400]();
}

uint64_t sub_2146021F8()
{
  return MEMORY[0x270F08408]();
}

uint64_t sub_214602208()
{
  return MEMORY[0x270F08410]();
}

uint64_t sub_214602218()
{
  return MEMORY[0x270F08418]();
}

uint64_t sub_214602228()
{
  return MEMORY[0x270F08420]();
}

uint64_t sub_214602248()
{
  return MEMORY[0x270F08440]();
}

uint64_t sub_214602258()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_214602268()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_214602278()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_214602288()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_214602298()
{
  return MEMORY[0x270F47028]();
}

uint64_t sub_2146022C8()
{
  return MEMORY[0x270F47058]();
}

uint64_t sub_2146022D8()
{
  return MEMORY[0x270F47068]();
}

uint64_t sub_2146022E8()
{
  return MEMORY[0x270F47080]();
}

uint64_t sub_2146022F8()
{
  return MEMORY[0x270F47088]();
}

uint64_t sub_214602308()
{
  return MEMORY[0x270F47090]();
}

uint64_t sub_214602318()
{
  return MEMORY[0x270F470A8]();
}

uint64_t sub_214602328()
{
  return MEMORY[0x270F470E8]();
}

uint64_t sub_214602338()
{
  return MEMORY[0x270F47110]();
}

uint64_t sub_214602348()
{
  return MEMORY[0x270F47130]();
}

uint64_t sub_214602358()
{
  return MEMORY[0x270F47150]();
}

uint64_t sub_214602368()
{
  return MEMORY[0x270F47190]();
}

uint64_t sub_214602378()
{
  return MEMORY[0x270F471A0]();
}

uint64_t sub_214602388()
{
  return MEMORY[0x270F471C0]();
}

uint64_t sub_214602398()
{
  return MEMORY[0x270F471E0]();
}

uint64_t sub_2146023A8()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_2146023B8()
{
  return MEMORY[0x270EE3BF8]();
}

uint64_t sub_2146023C8()
{
  return MEMORY[0x270EFEB50]();
}

uint64_t sub_2146023D8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2146023E8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_2146023F8()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_214602408()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_214602418()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t sub_214602428()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_214602438()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_214602448()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_214602458()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_214602468()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_214602478()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_214602488()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_214602498()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_2146024A8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2146024B8()
{
  return MEMORY[0x270EFED00]();
}

uint64_t sub_2146024C8()
{
  return MEMORY[0x270EFEFC8]();
}

uint64_t sub_2146024D8()
{
  return MEMORY[0x270EFEFF8]();
}

uint64_t sub_2146024E8()
{
  return MEMORY[0x270EFF110]();
}

uint64_t sub_2146024F8()
{
  return MEMORY[0x270EFF130]();
}

uint64_t sub_214602508()
{
  return MEMORY[0x270EFF3B0]();
}

uint64_t sub_214602518()
{
  return MEMORY[0x270EFF518]();
}

uint64_t sub_214602528()
{
  return MEMORY[0x270EFF528]();
}

uint64_t sub_214602538()
{
  return MEMORY[0x270EFF530]();
}

uint64_t sub_214602548()
{
  return MEMORY[0x270EFF5A0]();
}

uint64_t sub_214602558()
{
  return MEMORY[0x270EFF6D8]();
}

uint64_t sub_214602568()
{
  return MEMORY[0x270EFF820]();
}

uint64_t sub_214602578()
{
  return MEMORY[0x270EFF830]();
}

uint64_t sub_214602588()
{
  return MEMORY[0x270EFF848]();
}

uint64_t sub_214602598()
{
  return MEMORY[0x270EFF880]();
}

uint64_t sub_2146025A8()
{
  return MEMORY[0x270EFF890]();
}

uint64_t sub_2146025B8()
{
  return MEMORY[0x270EFF910]();
}

uint64_t sub_2146025C8()
{
  return MEMORY[0x270EFF9A8]();
}

uint64_t sub_2146025E8()
{
  return MEMORY[0x270EFFB78]();
}

uint64_t sub_214602608()
{
  return MEMORY[0x270EFFE98]();
}

uint64_t sub_214602618()
{
  return MEMORY[0x270EFFEA0]();
}

uint64_t sub_214602628()
{
  return MEMORY[0x270F001B0]();
}

uint64_t sub_214602638()
{
  return MEMORY[0x270F00218]();
}

uint64_t sub_214602648()
{
  return MEMORY[0x270F004D8]();
}

uint64_t sub_214602658()
{
  return MEMORY[0x270F004E0]();
}

uint64_t sub_214602668()
{
  return MEMORY[0x270F00690]();
}

uint64_t sub_214602678()
{
  return MEMORY[0x270F00830]();
}

uint64_t sub_214602688()
{
  return MEMORY[0x270F00848]();
}

uint64_t sub_214602698()
{
  return MEMORY[0x270F00A28]();
}

uint64_t sub_2146026A8()
{
  return MEMORY[0x270F00A38]();
}

uint64_t sub_2146026B8()
{
  return MEMORY[0x270F00A80]();
}

uint64_t sub_2146026C8()
{
  return MEMORY[0x270F00A90]();
}

uint64_t sub_2146026D8()
{
  return MEMORY[0x270F00C70]();
}

uint64_t sub_2146026E8()
{
  return MEMORY[0x270F00C80]();
}

uint64_t sub_2146026F8()
{
  return MEMORY[0x270F00D88]();
}

uint64_t sub_214602708()
{
  return MEMORY[0x270F00D98]();
}

uint64_t sub_214602718()
{
  return MEMORY[0x270F00DF8]();
}

uint64_t sub_214602728()
{
  return MEMORY[0x270F00E08]();
}

uint64_t sub_214602738()
{
  return MEMORY[0x270F00E80]();
}

uint64_t sub_214602748()
{
  return MEMORY[0x270F00E90]();
}

uint64_t sub_214602758()
{
  return MEMORY[0x270F00ED0]();
}

uint64_t sub_214602768()
{
  return MEMORY[0x270F00EE8]();
}

uint64_t sub_214602778()
{
  return MEMORY[0x270F00F08]();
}

uint64_t sub_214602788()
{
  return MEMORY[0x270F00F18]();
}

uint64_t sub_214602798()
{
  return MEMORY[0x270F01068]();
}

uint64_t sub_2146027A8()
{
  return MEMORY[0x270F01158]();
}

uint64_t sub_2146027B8()
{
  return MEMORY[0x270F01168]();
}

uint64_t sub_2146027C8()
{
  return MEMORY[0x270F01220]();
}

uint64_t sub_2146027D8()
{
  return MEMORY[0x270F01230]();
}

uint64_t sub_2146027E8()
{
  return MEMORY[0x270F01240]();
}

uint64_t sub_2146027F8()
{
  return MEMORY[0x270F01260]();
}

uint64_t sub_214602808()
{
  return MEMORY[0x270F01278]();
}

uint64_t sub_214602818()
{
  return MEMORY[0x270F01298]();
}

uint64_t sub_214602828()
{
  return MEMORY[0x270F01500]();
}

uint64_t sub_214602838()
{
  return MEMORY[0x270F01508]();
}

uint64_t sub_214602848()
{
  return MEMORY[0x270F01518]();
}

uint64_t sub_214602858()
{
  return MEMORY[0x270F01530]();
}

uint64_t sub_214602868()
{
  return MEMORY[0x270F01658]();
}

uint64_t sub_214602878()
{
  return MEMORY[0x270F016A8]();
}

uint64_t sub_214602888()
{
  return MEMORY[0x270F016C0]();
}

uint64_t sub_214602898()
{
  return MEMORY[0x270F016E8]();
}

uint64_t sub_2146028A8()
{
  return MEMORY[0x270F016F0]();
}

uint64_t sub_2146028C8()
{
  return MEMORY[0x270F01720]();
}

uint64_t sub_2146028D8()
{
  return MEMORY[0x270F01730]();
}

uint64_t sub_2146028E8()
{
  return MEMORY[0x270F01740]();
}

uint64_t sub_2146028F8()
{
  return MEMORY[0x270F01750]();
}

uint64_t sub_214602908()
{
  return MEMORY[0x270F01760]();
}

uint64_t sub_214602918()
{
  return MEMORY[0x270F01770]();
}

uint64_t sub_214602938()
{
  return MEMORY[0x270F01798]();
}

uint64_t sub_214602948()
{
  return MEMORY[0x270F017F0]();
}

uint64_t sub_214602958()
{
  return MEMORY[0x270F01808]();
}

uint64_t sub_214602968()
{
  return MEMORY[0x270F01810]();
}

uint64_t sub_214602978()
{
  return MEMORY[0x270F01E10]();
}

uint64_t sub_214602988()
{
  return MEMORY[0x270F01E20]();
}

uint64_t sub_214602998()
{
  return MEMORY[0x270F01E30]();
}

uint64_t sub_2146029A8()
{
  return MEMORY[0x270F02440]();
}

uint64_t sub_2146029B8()
{
  return MEMORY[0x270F02448]();
}

uint64_t sub_2146029C8()
{
  return MEMORY[0x270F026A8]();
}

uint64_t sub_2146029D8()
{
  return MEMORY[0x270F026B8]();
}

uint64_t sub_2146029E8()
{
  return MEMORY[0x270F026C0]();
}

uint64_t sub_214602A08()
{
  return MEMORY[0x270F026E8]();
}

uint64_t sub_214602A18()
{
  return MEMORY[0x270F026F8]();
}

uint64_t sub_214602A28()
{
  return MEMORY[0x270F02708]();
}

uint64_t sub_214602A48()
{
  return MEMORY[0x270F02880]();
}

uint64_t sub_214602A58()
{
  return MEMORY[0x270F028A0]();
}

uint64_t sub_214602A68()
{
  return MEMORY[0x270F02980]();
}

uint64_t sub_214602A78()
{
  return MEMORY[0x270F029E8]();
}

uint64_t sub_214602A88()
{
  return MEMORY[0x270F02A18]();
}

uint64_t sub_214602A98()
{
  return MEMORY[0x270F02A28]();
}

uint64_t sub_214602AA8()
{
  return MEMORY[0x270F02A40]();
}

uint64_t sub_214602AB8()
{
  return MEMORY[0x270F02A50]();
}

uint64_t sub_214602AC8()
{
  return MEMORY[0x270F02A88]();
}

uint64_t sub_214602AD8()
{
  return MEMORY[0x270F02AE0]();
}

uint64_t sub_214602AE8()
{
  return MEMORY[0x270F02B58]();
}

uint64_t sub_214602AF8()
{
  return MEMORY[0x270F02BB8]();
}

uint64_t sub_214602B08()
{
  return MEMORY[0x270F02C78]();
}

uint64_t sub_214602B18()
{
  return MEMORY[0x270F02CB8]();
}

uint64_t sub_214602B28()
{
  return MEMORY[0x270F02CF0]();
}

uint64_t sub_214602B38()
{
  return MEMORY[0x270F02D58]();
}

uint64_t sub_214602B48()
{
  return MEMORY[0x270F02F20]();
}

uint64_t sub_214602B58()
{
  return MEMORY[0x270F03000]();
}

uint64_t sub_214602B68()
{
  return MEMORY[0x270F030B0]();
}

uint64_t sub_214602B78()
{
  return MEMORY[0x270F03230]();
}

uint64_t sub_214602B88()
{
  return MEMORY[0x270F03240]();
}

uint64_t sub_214602B98()
{
  return MEMORY[0x270F032C8]();
}

uint64_t sub_214602BA8()
{
  return MEMORY[0x270F032D8]();
}

uint64_t sub_214602BB8()
{
  return MEMORY[0x270F033A8]();
}

uint64_t sub_214602BC8()
{
  return MEMORY[0x270F03440]();
}

uint64_t sub_214602BD8()
{
  return MEMORY[0x270F03490]();
}

uint64_t sub_214602BE8()
{
  return MEMORY[0x270F03550]();
}

uint64_t sub_214602BF8()
{
  return MEMORY[0x270F036B8]();
}

uint64_t sub_214602C08()
{
  return MEMORY[0x270F03A80]();
}

uint64_t sub_214602C18()
{
  return MEMORY[0x270F03FF0]();
}

uint64_t sub_214602C28()
{
  return MEMORY[0x270F04168]();
}

uint64_t sub_214602C38()
{
  return MEMORY[0x270F04370]();
}

uint64_t sub_214602C48()
{
  return MEMORY[0x270F04380]();
}

uint64_t sub_214602C58()
{
  return MEMORY[0x270F04560]();
}

uint64_t sub_214602C78()
{
  return MEMORY[0x270F04658]();
}

uint64_t sub_214602C88()
{
  return MEMORY[0x270F04688]();
}

uint64_t sub_214602C98()
{
  return MEMORY[0x270F046B0]();
}

uint64_t sub_214602CA8()
{
  return MEMORY[0x270F046E0]();
}

uint64_t sub_214602CB8()
{
  return MEMORY[0x270F04710]();
}

uint64_t sub_214602CC8()
{
  return MEMORY[0x270F04750]();
}

uint64_t sub_214602CD8()
{
  return MEMORY[0x270F04810]();
}

uint64_t sub_214602CE8()
{
  return MEMORY[0x270F04828]();
}

uint64_t sub_214602CF8()
{
  return MEMORY[0x270F04840]();
}

uint64_t sub_214602D08()
{
  return MEMORY[0x270F048A8]();
}

uint64_t sub_214602D18()
{
  return MEMORY[0x270F04AA8]();
}

uint64_t sub_214602D28()
{
  return MEMORY[0x270F04B18]();
}

uint64_t sub_214602D38()
{
  return MEMORY[0x270F04B38]();
}

uint64_t sub_214602D48()
{
  return MEMORY[0x270F04B40]();
}

uint64_t sub_214602D58()
{
  return MEMORY[0x270F04B78]();
}

uint64_t sub_214602D68()
{
  return MEMORY[0x270F04BF0]();
}

uint64_t sub_214602D78()
{
  return MEMORY[0x270F04CB0]();
}

uint64_t sub_214602D88()
{
  return MEMORY[0x270F04DE0]();
}

uint64_t sub_214602D98()
{
  return MEMORY[0x270F05040]();
}

uint64_t sub_214602DA8()
{
  return MEMORY[0x270F05080]();
}

uint64_t sub_214602DB8()
{
  return MEMORY[0x270F05090]();
}

uint64_t sub_214602DD8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_214602DE8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_214602DF8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_214602E08()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_214602E18()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_214602E28()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_214602E38()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_214602E48()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_214602E58()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_214602E68()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_214602E78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_214602E88()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_214602E98()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_214602EA8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_214602EB8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_214602EC8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_214602ED8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_214602EE8()
{
  return MEMORY[0x270EF1AC8]();
}

uint64_t sub_214602EF8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_214602F08()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_214602F18()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_214602F28()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_214602F38()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_214602F48()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_214602F58()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_214602F68()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_214602F78()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_214602F88()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_214602F98()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_214602FA8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_214602FB8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_214602FC8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_214602FD8()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_214602FE8()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_214602FF8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_214603008()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_214603018()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_214603028()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_214603038()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_214603048()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_214603058()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_214603068()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_214603078()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_214603088()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_214603098()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2146030A8()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_2146030B8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2146030C8()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_2146030D8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2146030E8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2146030F8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_214603108()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_214603118()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_214603128()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_214603138()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_214603148()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_214603158()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_214603178()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_214603188()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_214603198()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2146031A8()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_2146031B8()
{
  return MEMORY[0x270FA2BE0]();
}

uint64_t sub_2146031C8()
{
  return MEMORY[0x270F053F8]();
}

uint64_t sub_2146031E8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2146031F8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_214603208()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_214603218()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_214603228()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_214603238()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_214603248()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_214603258()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_214603268()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_214603278()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_214603288()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_214603298()
{
  return MEMORY[0x270EF2350]();
}

uint64_t sub_2146032A8()
{
  return MEMORY[0x270EF2388]();
}

uint64_t sub_2146032B8()
{
  return MEMORY[0x270EF2390]();
}

uint64_t sub_2146032C8()
{
  return MEMORY[0x270EF2398]();
}

uint64_t sub_2146032D8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2146032E8()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_2146032F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_214603308()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_214603318()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_214603328()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_214603338()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_214603348()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_214603358()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_214603368()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_214603378()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_214603388()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_214603398()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2146033B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2146033C8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2146033D8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2146033E8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2146033F8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_214603408()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_214603418()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_214603428()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_214603438()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_214603448()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_214603458()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_214603468()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_214603478()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_214603488()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_214603498()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2146034A8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2146034B8()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_2146034C8()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2146034D8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2146034E8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2146034F8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_214603508()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_214603518()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_214603528()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_214603538()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_214603548()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_214603558()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_214603568()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_214603578()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_214603588()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_214603598()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2146035A8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2146035B8()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_2146035C8()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_2146035D8()
{
  return MEMORY[0x270F9EE68]();
}

uint64_t sub_2146035E8()
{
  return MEMORY[0x270F9EE70]();
}

uint64_t sub_2146035F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_214603608()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_214603618()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_214603628()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_214603638()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_214603648()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_214603658()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_214603668()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_214603688()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2146036A8()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_2146036B8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2146036C8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2146036D8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2146036E8()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2146036F8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_214603708()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_214603718()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_214603728()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_214603738()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_214603748()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_214603758()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_214603768()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_214603778()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_214603788()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_214603798()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2146037A8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2146037B8()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_2146037C8()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_2146037D8()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_2146037E8()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_2146037F8()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_214603808()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_214603818()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_214603828()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_214603838()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_214603848()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_214603858()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_214603868()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_214603878()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_214603888()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_214603898()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2146038A8()
{
  return MEMORY[0x270F9F7E0]();
}

uint64_t sub_2146038B8()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_2146038C8()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_2146038D8()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_2146038E8()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_2146038F8()
{
  return MEMORY[0x270F9F950]();
}

uint64_t sub_214603908()
{
  return MEMORY[0x270F9F958]();
}

uint64_t sub_214603918()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_214603928()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_214603938()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_214603948()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_214603958()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_214603968()
{
  return MEMORY[0x270F9F988]();
}

uint64_t sub_214603978()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_214603988()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_214603998()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_2146039A8()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_2146039B8()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_2146039C8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2146039D8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2146039E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2146039F8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_214603A18()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_214603A28()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_214603A38()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_214603A48()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_214603A58()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_214603A68()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_214603A78()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_214603A88()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_214603A98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_214603AA8()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_214603AB8()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_214603AC8()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_214603AD8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_214603AE8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_214603AF8()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_214603B08()
{
  return MEMORY[0x270FA0098]();
}

uint64_t sub_214603B18()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t sub_214603B48()
{
  return MEMORY[0x270FA0128]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5280](string, range.location, range.length);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceStatus CGImageSourceGetStatus(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5058](isrc);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return (JSClassRef)MEMORY[0x270EF52F0](definition);
}

JSGlobalContextRef JSContextGetGlobalContext(JSContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x270EF5300](ctx);
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return (JSObjectRef)MEMORY[0x270EF5308](ctx);
}

JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x270EF5310](ctx, script, thisObject, sourceURL, *(void *)&startingLineNumber, exception);
}

JSGlobalContextRef JSGlobalContextCreate(JSClassRef globalObjectClass)
{
  return (JSGlobalContextRef)MEMORY[0x270EF5320](globalObjectClass);
}

void JSGlobalContextRelease(JSGlobalContextRef ctx)
{
}

JSGlobalContextRef JSGlobalContextRetain(JSGlobalContextRef ctx)
{
  return (JSGlobalContextRef)MEMORY[0x270EF5338](ctx);
}

JSValueRef JSObjectCallAsFunction(JSContextRef ctx, JSObjectRef object, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x270EF5340](ctx, object, thisObject, argumentCount, arguments, exception);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return (void *)MEMORY[0x270EF5360](object);
}

JSValueRef JSObjectGetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x270EF5368](ctx, object, propertyName, exception);
}

JSValueRef JSObjectGetPropertyAtIndex(JSContextRef ctx, JSObjectRef object, unsigned int propertyIndex, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x270EF5370](ctx, object, *(void *)&propertyIndex, exception);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)MEMORY[0x270EF5378](ctx, jsClass, data);
}

JSObjectRef JSObjectMakeArray(JSContextRef ctx, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x270EF5380](ctx, argumentCount, arguments, exception);
}

JSObjectRef JSObjectMakeDate(JSContextRef ctx, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x270EF5388](ctx, argumentCount, arguments, exception);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
}

CFStringRef JSStringCopyCFString(CFAllocatorRef alloc, JSStringRef string)
{
  return (CFStringRef)MEMORY[0x270EF53C8](alloc, string);
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return (JSStringRef)MEMORY[0x270EF53D0](string);
}

JSStringRef JSStringCreateWithUTF8CString(const char *string)
{
  return (JSStringRef)MEMORY[0x270EF53D8](string);
}

BOOL JSStringIsEqualToUTF8CString(JSStringRef a, const char *b)
{
  return MEMORY[0x270EF53F8](a, b);
}

void JSStringRelease(JSStringRef string)
{
}

JSType JSValueGetType(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5418](ctx, value);
}

BOOL JSValueIsBoolean(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5428](ctx, value);
}

BOOL JSValueIsInstanceOfConstructor(JSContextRef ctx, JSValueRef value, JSObjectRef constructor, JSValueRef *exception)
{
  return MEMORY[0x270EF5430](ctx, value, constructor, exception);
}

BOOL JSValueIsNumber(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5438](ctx, value);
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5440](ctx, value);
}

BOOL JSValueIsString(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5448](ctx, value);
}

BOOL JSValueIsUndefined(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5450](ctx, value);
}

JSValueRef JSValueMakeBoolean(JSContextRef ctx, BOOL BOOLean)
{
  return (JSValueRef)MEMORY[0x270EF5458](ctx, BOOLean);
}

JSValueRef JSValueMakeNumber(JSContextRef ctx, double number)
{
  return (JSValueRef)MEMORY[0x270EF5470](ctx, number);
}

JSValueRef JSValueMakeString(JSContextRef ctx, JSStringRef string)
{
  return (JSValueRef)MEMORY[0x270EF5478](ctx, string);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x270EF5480](ctx);
}

BOOL JSValueToBoolean(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x270EF5488](ctx, value);
}

double JSValueToNumber(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  MEMORY[0x270EF5490](ctx, value, exception);
  return result;
}

JSObjectRef JSValueToObject(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x270EF5498](ctx, value, exception);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x270EF54A0](ctx, value, exception);
}

uint64_t LICreateDefaultIcon()
{
  return MEMORY[0x270F4ADD0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
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

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x270F82DF8]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x270F82E28]();
}

uint64_t UIKeyboardOrderOutAutomaticSkippingAnimation()
{
  return MEMORY[0x270F82E30]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UISystemFontForSize()
{
  return MEMORY[0x270F80B28]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x270F857F0]();
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

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x270F82F80]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA0540]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}