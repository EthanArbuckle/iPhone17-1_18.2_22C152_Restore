uint64_t sub_25ACA5B0C(unint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _DWORD v21[74];
  _DWORD v22[76];
  uint64_t vars8;

  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    result = sub_25ACD5EE0();
    v6 = result;
    if (result) {
      goto LABEL_3;
    }
  }
  else
  {
    v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v8 = 0;
      v9 = a1 & 0xC000000000000001;
      v10 = MEMORY[0x263F8EE78];
      v18 = v6;
      while (1)
      {
        if (v9)
        {
          v12 = MEMORY[0x261153D20](v8, a1);
          v13 = __OFADD__(v8++, 1);
          if (v13) {
            goto LABEL_30;
          }
        }
        else
        {
          if (v8 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return result;
          }
          v12 = *(void *)(a1 + 32 + 8 * v8);
          swift_retain();
          v13 = __OFADD__(v8++, 1);
          if (v13)
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        if (!*(void *)(*a2 + 16) || (sub_25ACA7F54(v12), (v14 & 1) == 0))
        {
          v20 = v12;
          v15 = sub_25ACBFA10();
          v19 = sub_25ACA60C0(v10);
          if (v15 >> 62)
          {
            swift_bridgeObjectRetain();
            v16 = sub_25ACD5EE0();
            swift_bridgeObjectRelease();
            if (v16)
            {
LABEL_19:
              while (1)
              {
                v13 = __OFSUB__(v16--, 1);
                if (v13) {
                  break;
                }
                if ((v15 & 0xC000000000000001) != 0)
                {
                  v17 = MEMORY[0x261153D20](v16, v15);
                }
                else
                {
                  if ((v16 & 0x8000000000000000) != 0) {
                    goto LABEL_27;
                  }
                  if (v16 >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_28;
                  }
                  v17 = *(void *)(v15 + 32 + 8 * v16);
                  swift_retain();
                }
                sub_25ACA61C0(v17, a2, a3, v21);
                sub_25ACAA5D8((uint64_t)v21);
                swift_release();
                if (!v16) {
                  goto LABEL_4;
                }
              }
              __break(1u);
LABEL_27:
              __break(1u);
LABEL_28:
              __break(1u);
              return swift_bridgeObjectRelease();
            }
          }
          else
          {
            v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v16) {
              goto LABEL_19;
            }
          }
LABEL_4:
          swift_bridgeObjectRelease();
          sub_25ACA61C0(v20, a2, a3, v22);
          sub_25ACAA5D8((uint64_t)v22);
          v10 = MEMORY[0x263F8EE78];
          v11 = sub_25ACA7718(MEMORY[0x263F8EE78]);
          sub_25ACACA2C(v19, a2, v11);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v9 = a1 & 0xC000000000000001;
          v6 = v18;
        }
        result = swift_release();
        if (v8 == v6) {
          return swift_bridgeObjectRelease();
        }
      }
    }
  }

  return swift_bridgeObjectRelease();
}

unint64_t sub_25ACA5DB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2778);
  v2 = (void *)sub_25ACD5F10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 1);
    int v6 = *v4;
    uint64_t v7 = swift_retain();
    unint64_t result = sub_25ACA7F54(v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    *(_DWORD *)(v2[7] + 4 * result) = v6;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 4;
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

unint64_t sub_25ACA5EB8(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_25ACD5F10();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v7 = *(v5 - 1);
    uint64_t v6 = *v5;
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25ACA7F54(v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v3[6] + v10) = v7;
    *(void *)(v3[7] + v10) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v3[2] = v13;
    v5 += 2;
    if (!--v4)
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

unint64_t sub_25ACA5FC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27D8);
  v2 = (void *)sub_25ACD5F10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v7 = swift_retain();
    unint64_t result = sub_25ACA7F54(v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v5;
    *(void *)(v2[7] + v10) = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v13;
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

unint64_t sub_25ACA60C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2810);
  v2 = (void *)sub_25ACD5F10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 1);
    char v6 = *v4;
    uint64_t v7 = swift_retain();
    unint64_t result = sub_25ACA7F54(v7);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    *(unsigned char *)(v2[7] + result) = v6;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 16;
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

uint64_t sub_25ACA61C0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, _DWORD *a4@<X8>)
{
  v114 = a3;
  v109 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v107 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2800);
  uint64_t v108 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115);
  v116 = (char *)&v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25ACD5620();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v14 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v16 = (char *)&v102 - v15;
  v113 = a2;
  uint64_t v17 = *a2;
  if (*(void *)(v17 + 16))
  {
    uint64_t v18 = swift_retain();
    unint64_t v19 = sub_25ACA7F54(v18);
    if (v20)
    {
      memcpy(v483, (const void *)(*(void *)(v17 + 56) + 296 * v19), 0x128uLL);
      sub_25ACADD94((uint64_t)v483);
      swift_release();
      LODWORD(v145) = v483[32];
      uint64_t v143 = v483[34];
      uint64_t v144 = v483[33];
      int v117 = LOBYTE(v483[35]);
      int v118 = BYTE4(v483[32]);
      uint64_t v142 = v483[36];
      int v132 = BYTE4(v483[28]);
      int v140 = v483[29];
      int v141 = v483[28];
      int v129 = BYTE4(v483[29]);
      LODWORD(v139) = v483[30];
      uint64_t v137 = v483[27];
      uint64_t v138 = v483[31];
      int v126 = BYTE4(v483[18]);
      int v127 = BYTE4(v483[30]);
      int v135 = v483[19];
      int v136 = v483[18];
      int v124 = BYTE4(v483[20]);
      LODWORD(v125) = BYTE4(v483[19]);
      int v133 = v483[21];
      LODWORD(v134) = v483[20];
      int v131 = v483[22];
      int v122 = BYTE4(v483[22]);
      int v123 = BYTE4(v483[21]);
      uint64_t v130 = v483[23];
      int v128 = v483[24];
      int v120 = v483[25];
      LODWORD(v121) = BYTE4(v483[24]);
      char v21 = BYTE4(v483[25]);
      int v119 = v483[26];
      long long v22 = *(_OWORD *)&v483[11];
      char v23 = BYTE4(v483[26]);
      int v24 = v483[13];
      char v25 = BYTE4(v483[13]);
      int v26 = v483[14];
      char v27 = BYTE4(v483[14]);
      int v28 = v483[15];
      char v29 = BYTE4(v483[15]);
      uint64_t v30 = v483[16];
      char v31 = v483[17];
      uint64_t result = LODWORD(v483[6]);
      char v33 = BYTE4(v483[6]);
      int v34 = v483[7];
      char v35 = BYTE4(v483[7]);
      int v36 = v483[8];
      char v37 = BYTE4(v483[8]);
      uint64_t v38 = v483[9];
      char v39 = v483[10];
      int v40 = v483[1];
      char v41 = BYTE4(v483[1]);
      int v42 = v483[2];
      char v43 = BYTE4(v483[2]);
      int v44 = v483[3];
      char v45 = BYTE4(v483[3]);
      int v46 = v483[4];
      char v47 = BYTE4(v483[4]);
      uint64_t v48 = v483[5];
      LODWORD(v146) = v483[0];
      char v49 = BYTE4(v483[0]);
LABEL_11:
      LOBYTE(v236[0]) = v49;
      LOBYTE(v210[0]) = v41;
      LOBYTE(v199[0]) = v43;
      LOBYTE(v161[0]) = v45;
      LOBYTE(v233) = v47;
      LOBYTE(v230) = v33;
      LOBYTE(v227) = v35;
      LOBYTE(v224) = v37;
      LOBYTE(v221) = v39;
      LOBYTE(v218) = v25;
      LOBYTE(v215) = v27;
      LOBYTE(v212) = v29;
      LOBYTE(v207) = v31;
      LOBYTE(v204) = v126;
      LOBYTE(v201) = v125;
      LOBYTE(v196) = v124;
      LOBYTE(v193) = v123;
      LOBYTE(v190) = v122;
      LOBYTE(v187) = v121;
      LOBYTE(v184) = v21;
      LOBYTE(v181) = v23;
      LOBYTE(v178) = v132;
      LOBYTE(v175) = v129;
      LOBYTE(v172) = v127;
      LOBYTE(v169) = v118;
      LOBYTE(v166) = v117;
      v100 = v109;
      _DWORD *v109 = v146;
      v100[2] = v40;
      *((unsigned char *)v100 + 4) = v236[0];
      *((unsigned char *)v100 + 12) = v210[0];
      v100[4] = v42;
      *((unsigned char *)v100 + 20) = v199[0];
      v100[6] = v44;
      *((unsigned char *)v100 + 28) = v161[0];
      v100[8] = v46;
      *((unsigned char *)v100 + 36) = v233;
      *((void *)v100 + 5) = v48;
      v100[12] = result;
      *((unsigned char *)v100 + 52) = v230;
      v100[14] = v34;
      *((unsigned char *)v100 + 60) = v227;
      v100[16] = v36;
      *((unsigned char *)v100 + 68) = v224;
      *((void *)v100 + 9) = v38;
      *((unsigned char *)v100 + 80) = v221;
      *(_OWORD *)(v100 + 22) = v22;
      v100[26] = v24;
      *((unsigned char *)v100 + 108) = v218;
      v100[28] = v26;
      *((unsigned char *)v100 + 116) = v215;
      v100[30] = v28;
      *((unsigned char *)v100 + 124) = v212;
      *((void *)v100 + 16) = v30;
      *((unsigned char *)v100 + 136) = v207;
      v100[36] = v136;
      *((unsigned char *)v100 + 148) = v204;
      v100[38] = v135;
      *((unsigned char *)v100 + 156) = v201;
      v100[40] = v134;
      *((unsigned char *)v100 + 164) = v196;
      v100[42] = v133;
      *((unsigned char *)v100 + 172) = v193;
      v100[44] = v131;
      *((unsigned char *)v100 + 180) = v190;
      *((void *)v100 + 23) = v130;
      v100[48] = v128;
      *((unsigned char *)v100 + 196) = v187;
      v100[50] = v120;
      *((unsigned char *)v100 + 204) = v184;
      v100[52] = v119;
      *((unsigned char *)v100 + 212) = v181;
      *((void *)v100 + 27) = v137;
      v100[56] = v141;
      *((unsigned char *)v100 + 228) = v178;
      v100[58] = v140;
      *((unsigned char *)v100 + 236) = v175;
      v100[60] = v139;
      *((unsigned char *)v100 + 244) = v172;
      *((void *)v100 + 31) = v138;
      v100[64] = v145;
      *((unsigned char *)v100 + 260) = v169;
      uint64_t v101 = v143;
      *((void *)v100 + 33) = v144;
      *((void *)v100 + 34) = v101;
      *((unsigned char *)v100 + 280) = v166;
      *((void *)v100 + 36) = v142;
      return result;
    }
    swift_release();
  }
  uint64_t v103 = v7;
  uint64_t v104 = v6;
  v112 = (char *)&v236[32] + 4;
  sub_25ACD56A0();
  uint64_t v106 = a1;
  sub_25ACD5260();
  sub_25ACC1D88((uint64_t)&v237);
  uint64_t v105 = v11;
  v50 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v110 = v16;
  uint64_t v111 = v10;
  v50(v14, v16, v10);
  sub_25ACD5600();
  LODWORD(v146) = v290;
  char v481 = v291;
  uint64_t v144 = v293;
  uint64_t v145 = v292;
  char v480 = v294;
  uint64_t v143 = v295;
  LODWORD(v138) = v283;
  int v136 = v285;
  int v141 = v286;
  LODWORD(v142) = v284;
  int v140 = v288;
  uint64_t v139 = v289;
  uint64_t v130 = v282;
  int v128 = v265;
  LODWORD(v137) = v266;
  LODWORD(v125) = v267;
  int v135 = v268;
  int v124 = v269;
  int v133 = v287;
  LODWORD(v134) = v270;
  int v132 = v272;
  int v122 = v273;
  int v123 = v271;
  int v131 = v274;
  uint64_t v121 = v275;
  int v129 = v277;
  int v119 = v278;
  int v120 = v276;
  int v118 = v280;
  int v126 = v281;
  int v127 = v279;
  long long v51 = v256;
  int v117 = v294 & 1;
  char v52 = v291 & 1;
  int v53 = v257;
  char v54 = v258;
  int v55 = v259;
  char v56 = v260;
  int v57 = v261;
  char v58 = v262;
  uint64_t v59 = v263;
  char v60 = v264;
  int v61 = v248;
  char v62 = v249;
  int v63 = v250;
  char v64 = v251;
  int v65 = v252;
  char v66 = v253;
  uint64_t v67 = v254;
  char v68 = v255;
  int v69 = v239;
  char v70 = v240;
  int v71 = v241;
  char v72 = v242;
  int v73 = v243;
  char v74 = v244;
  int v75 = v245;
  char v76 = v246;
  uint64_t v77 = v247;
  int v78 = v237;
  for (char i = v238; ; char i = v298)
  {
    LODWORD(v236[0]) = v78;
    LODWORD(v236[1]) = v69;
    LODWORD(v236[2]) = v71;
    LODWORD(v236[3]) = v73;
    LODWORD(v236[4]) = v75;
    v236[5] = v77;
    LODWORD(v236[6]) = v61;
    LODWORD(v236[7]) = v63;
    LODWORD(v236[8]) = v65;
    v236[9] = v67;
    LODWORD(v236[13]) = v53;
    LODWORD(v236[14]) = v55;
    LODWORD(v236[15]) = v57;
    v236[16] = v59;
    LODWORD(v236[18]) = v128;
    LODWORD(v236[19]) = v125;
    LODWORD(v236[20]) = v124;
    LODWORD(v236[21]) = v123;
    LODWORD(v236[22]) = v122;
    v236[23] = v121;
    LODWORD(v236[24]) = v120;
    LODWORD(v236[25]) = v119;
    LODWORD(v236[26]) = v118;
    v236[27] = v130;
    LODWORD(v236[28]) = v138;
    LODWORD(v236[29]) = v136;
    LODWORD(v236[30]) = v133;
    BYTE4(v236[0]) = i & 1;
    BYTE4(v236[1]) = v70 & 1;
    BYTE4(v236[2]) = v72 & 1;
    BYTE4(v236[3]) = v74 & 1;
    BYTE4(v236[4]) = v76 & 1;
    BYTE4(v236[6]) = v62 & 1;
    BYTE4(v236[7]) = v64 & 1;
    BYTE4(v236[8]) = v66 & 1;
    LOBYTE(v236[10]) = v68 & 1;
    *(_OWORD *)&v236[11] = v51;
    BYTE4(v236[13]) = v54 & 1;
    BYTE4(v236[14]) = v56 & 1;
    BYTE4(v236[15]) = v58 & 1;
    LOBYTE(v236[17]) = v60 & 1;
    BYTE4(v236[18]) = v137 & 1;
    BYTE4(v236[19]) = v135 & 1;
    BYTE4(v236[20]) = v134 & 1;
    BYTE4(v236[21]) = v132 & 1;
    BYTE4(v236[22]) = v131 & 1;
    BYTE4(v236[24]) = v129 & 1;
    BYTE4(v236[25]) = v127 & 1;
    BYTE4(v236[26]) = v126 & 1;
    BYTE4(v236[28]) = v142 & 1;
    BYTE4(v236[29]) = v141 & 1;
    BYTE4(v236[30]) = v140 & 1;
    v236[31] = v139;
    LODWORD(v236[32]) = v146;
    v80 = v112;
    unsigned char *v112 = v52 & 1;
    v236[33] = v145;
    v236[34] = v144;
    v80[20] = v117 & 1;
    v236[36] = v143;
    memcpy(v482, v236, sizeof(v482));
    sub_25ACD5610();
    if (!v483[0]) {
      break;
    }
    sub_25ACA61C0(v296, v483[0], v113, v114);
    sub_25ACC5744((int *)v296, (uint64_t)&v297);
    swift_release();
    sub_25ACAA5D8((uint64_t)v296);
    sub_25ACAA5D8((uint64_t)v236);
    LODWORD(v146) = v350;
    uint64_t v144 = v353;
    uint64_t v145 = v352;
    uint64_t v143 = v355;
    LODWORD(v138) = v343;
    int v136 = v345;
    int v141 = v346;
    LODWORD(v142) = v344;
    int v140 = v348;
    uint64_t v139 = v349;
    uint64_t v130 = v342;
    int v128 = v325;
    LODWORD(v137) = v326;
    LODWORD(v125) = v327;
    int v135 = v328;
    int v124 = v329;
    int v133 = v347;
    LODWORD(v134) = v330;
    int v132 = v332;
    int v122 = v333;
    int v123 = v331;
    int v131 = v334;
    uint64_t v121 = v335;
    int v129 = v337;
    int v119 = v338;
    int v120 = v336;
    int v118 = v340;
    int v126 = v341;
    int v127 = v339;
    long long v51 = v316;
    int v117 = v354 & 1;
    char v52 = v351 & 1;
    int v53 = v317;
    char v54 = v318;
    int v55 = v319;
    char v56 = v320;
    int v57 = v321;
    char v58 = v322;
    uint64_t v59 = v323;
    char v60 = v324;
    int v61 = v308;
    char v62 = v309;
    int v63 = v310;
    char v64 = v311;
    int v65 = v312;
    char v66 = v313;
    uint64_t v67 = v314;
    char v68 = v315;
    int v69 = v299;
    char v70 = v300;
    int v71 = v301;
    char v72 = v302;
    int v73 = v303;
    char v74 = v304;
    int v75 = v305;
    char v76 = v306;
    uint64_t v77 = v307;
    int v78 = v297;
  }
  (*(void (**)(char *, uint64_t))(v108 + 8))(v116, v115);
  sub_25ACADF2C((unint64_t *)&qword_26A4B2808, MEMORY[0x263F16548]);
  sub_25ACD5C70();
  sub_25ACD5CA0();
  uint64_t result = sub_25ACD5C90();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    LOBYTE(v483[0]) = 0;
    unint64_t v81 = sub_25ACC2BA0(result);
    uint64_t v82 = v106;
    unint64_t v83 = sub_25ACAA904(v106);
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    uint64_t v146 = v88;
    sub_25ACAAD50(v82, (uint64_t)v356);
    sub_25ACAB478(v82, v357);
    v89 = v107;
    sub_25ACD5550();
    uint64_t v90 = v104;
    uint64_t v91 = sub_25ACD5460();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v89, v90);
    uint64_t v92 = nullsub_1(v91);
    sub_25ACABEAC(v82, (uint64_t)v358);
    sub_25ACAC118((uint64_t)v359);
    sub_25ACAC334(v360);
    LOBYTE(v483[0]) = BYTE4(v83) & 1;
    LOBYTE(v420) = BYTE4(v85) & 1;
    v361[0] = BYTE4(v87) & 1;
    sub_25ACC544C(v81 | ((HIDWORD(v81) & 1) << 32), v83 | ((HIDWORD(v83) & 1) << 32), v85 | ((unint64_t)(BYTE4(v85) & 1) << 32), v87 | ((unint64_t)(BYTE4(v87) & 1) << 32), v146, (uint64_t)v356, (uint64_t)v357, v92, (uint64_t)v361, (uint64_t)v358, (uint64_t)v359, (uint64_t)v360);
    LODWORD(v146) = v362;
    char v479 = v363;
    char v160 = v365;
    int v127 = v366;
    int v128 = v364;
    char v159 = v367;
    int v126 = v368;
    char v158 = v369;
    uint64_t v125 = v370;
    int v124 = v371;
    char v157 = v372;
    int v117 = v373;
    char v156 = v374;
    LODWORD(v107) = v375;
    char v155 = v376;
    char v154 = v378;
    uint64_t v102 = v379;
    uint64_t v103 = v377;
    uint64_t v93 = v380;
    LODWORD(v89) = v381;
    char v153 = v382;
    LODWORD(v85) = v383;
    char v152 = v384;
    int v94 = v385;
    char v151 = v386;
    uint64_t v95 = v387;
    char v150 = v388;
    char v149 = v390;
    LODWORD(v87) = v391;
    char v148 = v392;
    int v129 = v389;
    LODWORD(v130) = v393;
    int v122 = v396;
    int v123 = v394;
    int v131 = v395;
    int v132 = v397;
    uint64_t v134 = v399;
    int v133 = v400;
    int v120 = v401;
    LODWORD(v121) = v398;
    int v135 = v402;
    int v136 = v404;
    int v118 = v405;
    int v119 = v403;
    uint64_t v138 = v406;
    LODWORD(v137) = v407;
    LODWORD(v116) = v408;
    LODWORD(v139) = v409;
    LODWORD(v115) = v410;
    LODWORD(v112) = v412;
    int v140 = v411;
    int v141 = v414;
    LODWORD(v108) = v415;
    uint64_t v142 = v413;
    uint64_t v143 = v417;
    LODWORD(v104) = v418;
    uint64_t v144 = v416;
    uint64_t v145 = v419;
    sub_25ACADD94((uint64_t)v361);
    sub_25ACC5744(v482, (uint64_t)&v420);
    sub_25ACAA5D8((uint64_t)v236);
    sub_25ACAA5D8((uint64_t)v361);
    swift_retain();
    sub_25ACADD94((uint64_t)&v420);
    v96 = v113;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v483[0] = *v96;
    void *v96 = 0x8000000000000000;
    sub_25ACA98EC(&v420, v82, isUniquelyReferenced_nonNull_native);
    void *v96 = v483[0];
    swift_release();
    swift_bridgeObjectRelease();
    LODWORD(v483[1]) = v146;
    LODWORD(v483[2]) = v128;
    LODWORD(v483[3]) = v127;
    LODWORD(v483[4]) = v126;
    v483[5] = v125;
    LODWORD(v483[6]) = v124;
    LODWORD(v483[7]) = v117;
    LODWORD(v483[8]) = v107;
    v483[9] = v103;
    v483[11] = v102;
    v483[12] = v93;
    LODWORD(v483[13]) = v89;
    LODWORD(v483[14]) = v85;
    LODWORD(v483[15]) = v94;
    v483[16] = v95;
    LODWORD(v483[19]) = v87;
    char v232 = v479;
    char v229 = v160;
    char v226 = v159;
    char v223 = v158;
    char v220 = v157;
    char v217 = v156;
    char v214 = v155;
    char v211 = v154;
    char v209 = v153;
    char v206 = v152;
    char v203 = v151;
    char v200 = v150;
    char v198 = v149;
    char v195 = v148;
    char v192 = v123 & 1;
    char v189 = v122 & 1;
    LOBYTE(v93) = v421;
    char v235 = v421;
    char v186 = v121 & 1;
    char v183 = v120 & 1;
    char v180 = v119 & 1;
    char v177 = v118 & 1;
    char v174 = v116 & 1;
    char v171 = v115 & 1;
    char v168 = v112 & 1;
    char v165 = v108 & 1;
    char v162 = v104 & 1;
    LODWORD(v146) = v420;
    LODWORD(v483[0]) = v420;
    BYTE4(v483[0]) = v421;
    *(_WORD *)((char *)v483 + 5) = v233;
    HIBYTE(v483[0]) = v234;
    BYTE4(v483[1]) = v479;
    *(_WORD *)((char *)&v483[1] + 5) = v230;
    HIBYTE(v483[1]) = v231;
    BYTE4(v483[2]) = v160;
    HIBYTE(v483[2]) = v228;
    *(_WORD *)((char *)&v483[2] + 5) = v227;
    BYTE4(v483[3]) = v159;
    HIBYTE(v483[3]) = v225;
    *(_WORD *)((char *)&v483[3] + 5) = v224;
    BYTE4(v483[4]) = v158;
    HIBYTE(v483[4]) = v222;
    *(_WORD *)((char *)&v483[4] + 5) = v221;
    BYTE4(v483[6]) = v157;
    HIBYTE(v483[6]) = v219;
    *(_WORD *)((char *)&v483[6] + 5) = v218;
    BYTE4(v483[7]) = v156;
    HIBYTE(v483[7]) = v216;
    *(_WORD *)((char *)&v483[7] + 5) = v215;
    BYTE4(v483[8]) = v155;
    HIBYTE(v483[8]) = v213;
    *(_WORD *)((char *)&v483[8] + 5) = v212;
    LOBYTE(v483[10]) = v154;
    HIDWORD(v483[10]) = *(_DWORD *)((char *)v210 + 3);
    *(_DWORD *)((char *)&v483[10] + 1) = v210[0];
    BYTE4(v483[13]) = v153;
    HIBYTE(v483[13]) = v208;
    *(_WORD *)((char *)&v483[13] + 5) = v207;
    BYTE4(v483[14]) = v152;
    HIBYTE(v483[14]) = v205;
    *(_WORD *)((char *)&v483[14] + 5) = v204;
    BYTE4(v483[15]) = v151;
    HIBYTE(v483[15]) = v202;
    *(_WORD *)((char *)&v483[15] + 5) = v201;
    LOBYTE(v483[17]) = v150;
    HIDWORD(v483[17]) = *(_DWORD *)((char *)v199 + 3);
    *(_DWORD *)((char *)&v483[17] + 1) = v199[0];
    LODWORD(v483[18]) = v129;
    BYTE4(v483[18]) = v149;
    HIBYTE(v483[18]) = v197;
    *(_WORD *)((char *)&v483[18] + 5) = v196;
    BYTE4(v483[19]) = v148;
    HIBYTE(v483[19]) = v194;
    *(_WORD *)((char *)&v483[19] + 5) = v193;
    LODWORD(v483[20]) = v130;
    BYTE4(v483[20]) = v123 & 1;
    HIBYTE(v483[20]) = v191;
    *(_WORD *)((char *)&v483[20] + 5) = v190;
    LODWORD(v483[21]) = v131;
    BYTE4(v483[21]) = v122 & 1;
    HIBYTE(v483[21]) = v188;
    *(_WORD *)((char *)&v483[21] + 5) = v187;
    LODWORD(v483[22]) = v132;
    BYTE4(v483[22]) = v121 & 1;
    HIBYTE(v483[22]) = v185;
    *(_WORD *)((char *)&v483[22] + 5) = v184;
    v483[23] = v134;
    LODWORD(v483[24]) = v133;
    BYTE4(v483[24]) = v120 & 1;
    HIBYTE(v483[24]) = v182;
    *(_WORD *)((char *)&v483[24] + 5) = v181;
    LODWORD(v483[25]) = v135;
    BYTE4(v483[25]) = v119 & 1;
    HIBYTE(v483[25]) = v179;
    *(_WORD *)((char *)&v483[25] + 5) = v178;
    LODWORD(v483[26]) = v136;
    BYTE4(v483[26]) = v118 & 1;
    HIBYTE(v483[26]) = v176;
    *(_WORD *)((char *)&v483[26] + 5) = v175;
    v483[27] = v138;
    LODWORD(v483[28]) = v137;
    BYTE4(v483[28]) = v116 & 1;
    HIBYTE(v483[28]) = v173;
    *(_WORD *)((char *)&v483[28] + 5) = v172;
    LODWORD(v483[29]) = v139;
    BYTE4(v483[29]) = v115 & 1;
    HIBYTE(v483[29]) = v170;
    *(_WORD *)((char *)&v483[29] + 5) = v169;
    LODWORD(v483[30]) = v140;
    BYTE4(v483[30]) = v112 & 1;
    HIBYTE(v483[30]) = v167;
    *(_WORD *)((char *)&v483[30] + 5) = v166;
    v483[31] = v142;
    LODWORD(v483[32]) = v141;
    BYTE4(v483[32]) = v108 & 1;
    *(_WORD *)((char *)&v483[32] + 5) = v163;
    HIBYTE(v483[32]) = v164;
    v483[33] = v144;
    v483[34] = v143;
    LOBYTE(v483[35]) = v104 & 1;
    *(_DWORD *)((char *)&v483[35] + 1) = v161[0];
    HIDWORD(v483[35]) = *(_DWORD *)((char *)v161 + 3);
    v483[36] = v145;
    swift_retain();
    v98 = v114;
    char v99 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v147 = *v98;
    uint64_t *v98 = 0x8000000000000000;
    sub_25ACA98EC(v483, v82, v99);
    uint64_t *v98 = v147;
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v105 + 8))(v110, v111);
    LODWORD(v145) = v473;
    LOBYTE(v147) = v474;
    uint64_t v143 = v476;
    uint64_t v144 = v475;
    char v479 = v477;
    uint64_t v142 = v478;
    int v132 = v467;
    int v140 = v468;
    int v141 = v466;
    int v129 = v469;
    LODWORD(v139) = v470;
    uint64_t v138 = v472;
    uint64_t v137 = v465;
    int v136 = v448;
    int v126 = v449;
    int v127 = v471;
    int v135 = v450;
    LODWORD(v134) = v452;
    int v124 = v453;
    LODWORD(v125) = v451;
    int v133 = v454;
    int v131 = v456;
    int v122 = v457;
    int v123 = v455;
    uint64_t v130 = v458;
    int v128 = v459;
    LODWORD(v121) = v460;
    long long v22 = v439;
    char v39 = v438 & 1;
    char v37 = v436 & 1;
    char v35 = v434 & 1;
    char v33 = v432 & 1;
    char v49 = v93;
    int v117 = v477 & 1;
    int v118 = v474 & 1;
    char v21 = v462;
    int v119 = v463;
    int v120 = v461;
    char v23 = v464;
    int v24 = v440;
    char v25 = v441;
    int v26 = v442;
    char v27 = v443;
    int v28 = v444;
    char v29 = v445;
    uint64_t v30 = v446;
    char v31 = v447;
    uint64_t result = v431;
    int v34 = v433;
    int v36 = v435;
    uint64_t v38 = v437;
    int v40 = v422;
    char v41 = v423;
    int v42 = v424;
    char v43 = v425;
    int v44 = v426;
    char v45 = v427;
    int v46 = v428;
    char v47 = v429;
    uint64_t v48 = v430;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

unint64_t sub_25ACA7718(unint64_t a1)
{
  unint64_t v1 = a1;
  if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0) {
    goto LABEL_39;
  }
  uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  unint64_t v16 = v1 & 0xFFFFFFFFFFFFFF8;
LABEL_4:
  if ((v2 & 0x4000000000000000) == 0)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    swift_bridgeObjectRelease();
    unint64_t v4 = (unint64_t)v3 >> 1;
    goto LABEL_6;
  }
  while (1)
  {
    swift_retain();
    uint64_t v3 = sub_25ACD5EE0();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v15 = v3 >= 0 ? v3 : v3 + 1;
    if (v3 < -1) {
      __break(1u);
    }
    unint64_t v4 = v15 >> 1;
LABEL_6:
    if ((unint64_t)(v3 + 1) < 3) {
      return v2;
    }
    unint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = v5 + 1;
      unint64_t v1 = v3 - (v5 + 1);
      if (__OFSUB__(v3, v5 + 1)) {
        break;
      }
      if (v5 != v1)
      {
        unint64_t v7 = v16;
        if ((v16 & 0xC000000000000001) != 0)
        {
          uint64_t v9 = MEMORY[0x261153D20](v5, v16);
          uint64_t v10 = MEMORY[0x261153D20](v3 - (v5 + 1), v16);
        }
        else
        {
          if ((v5 & 0x8000000000000000) != 0) {
            goto LABEL_33;
          }
          unint64_t v8 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v5 >= v8) {
            goto LABEL_34;
          }
          uint64_t v9 = *(void *)(v16 + 8 * v5 + 32);
          swift_retain();
          if ((v1 & 0x8000000000000000) != 0) {
            goto LABEL_35;
          }
          if (v1 >= v8) {
            goto LABEL_37;
          }
          uint64_t v10 = *(void *)(v16 + 32 + 8 * v1);
          swift_retain();
        }
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v16 & 0x8000000000000000) != 0
          || (v16 & 0x4000000000000000) != 0)
        {
          sub_25ACA8078(v16);
          unint64_t v7 = v11;
          unint64_t v16 = v11;
        }
        swift_release();
        *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v10;
        sub_25ACD5C20();
        unint64_t v12 = v16;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v16 & 0x8000000000000000) != 0
          || (v16 & 0x4000000000000000) != 0)
        {
          sub_25ACA8078(v16);
          unint64_t v12 = v13;
          unint64_t v16 = v13;
        }
        if ((v1 & 0x8000000000000000) != 0) {
          goto LABEL_36;
        }
        if (v1 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_38;
        }
        swift_release();
        *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 8 * v1 + 0x20) = v9;
        sub_25ACD5C20();
      }
      unint64_t v5 = v6;
      if (v4 == v6) {
        return v16;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    uint64_t v2 = (uint64_t)sub_25ACAA66C(v1);
    unint64_t v16 = v2;
    if ((v2 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
  }
}

double sub_25ACA7938@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACAAD50(a1, (uint64_t)v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v4;
  *(void *)(a2 + 32) = v6;
  return result;
}

void *sub_25ACA797C@<X0>(_DWORD *a1@<X8>)
{
  return sub_25ACA7AEC(MEMORY[0x263F164F0], a1);
}

void *sub_25ACA7994@<X0>(_DWORD *a1@<X8>)
{
  return sub_25ACA7AEC(MEMORY[0x263F164E0], a1);
}

void *sub_25ACA79AC@<X0>(_DWORD *a1@<X8>)
{
  return sub_25ACA7AEC(MEMORY[0x263F164D8], a1);
}

void *sub_25ACA79C4@<X0>(_DWORD *a1@<X8>)
{
  return sub_25ACA7AEC((void *(*)(uint64_t *__return_ptr, uint64_t))sub_25ACB2B74, a1);
}

double sub_25ACA79DC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACAB478(a1, v5);
  long long v3 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v3;
  double result = *(double *)&v6;
  *(_OWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 48) = v7;
  return result;
}

double sub_25ACA7A28@<D0>(uint64_t a1@<X8>)
{
  sub_25ACAC118((uint64_t)v4);
  double result = *(double *)v4;
  long long v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

__n128 sub_25ACA7A6C@<Q0>(uint64_t a1@<X8>)
{
  sub_25ACAC334(v4);
  long long v2 = *(_OWORD *)v5;
  *(_OWORD *)(a1 + 32) = v4[2];
  *(_OWORD *)(a1 + 48) = v2;
  *(void *)(a1 + 61) = *(void *)&v5[13];
  __n128 result = (__n128)v4[1];
  *(_OWORD *)a1 = v4[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

void *sub_25ACA7ABC@<X0>(_DWORD *a1@<X8>)
{
  return sub_25ACA7AEC(MEMORY[0x263F164E8], a1);
}

void *sub_25ACA7AD4@<X0>(_DWORD *a1@<X8>)
{
  return sub_25ACA7AEC(MEMORY[0x263F164F8], a1);
}

void *sub_25ACA7AEC@<X0>(void *(*a1)(uint64_t *__return_ptr, uint64_t)@<X3>, _DWORD *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  __n128 result = a1(&v6, v4);
  *a2 = v6;
  return result;
}

uint64_t sub_25ACA7B44()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5550();
  uint64_t v4 = sub_25ACD5460();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return nullsub_1(v4);
}

uint64_t sub_25ACA7C24(uint64_t a1)
{
  unint64_t v1 = sub_25ACAA904(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

double sub_25ACA7C7C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACABEAC(a1, (uint64_t)v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v4;
  *(void *)(a2 + 32) = v6;
  return result;
}

uint64_t sub_25ACA7CC0(uint64_t a1)
{
  unint64_t v1 = sub_25ACBF84C(a1);
  if (v1 >> 62)
  {
    uint64_t v2 = sub_25ACD5EE0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (v2 <= 0x7FFFFFFF)
  {
    unint64_t v4 = sub_25ACC2BA0(v2);
    return v4 | ((HIDWORD(v4) & 1) << 32);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25ACA7D64(uint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (*(void *)(*a2 + 16))
  {
    uint64_t v6 = result;
    uint64_t v7 = swift_retain();
    unint64_t v8 = sub_25ACA7F54(v7);
    if (v9)
    {
      memcpy(__dst, (const void *)(*(void *)(v3 + 56) + 296 * v8), sizeof(__dst));
      sub_25ACADD94((uint64_t)__dst);
      swift_release();
      memcpy(__src, __dst, sizeof(__src));
      sub_25ACADD94((uint64_t)__dst);
      sub_25ACC9278();
      swift_beginAccess();
      memcpy(v20, __dst, sizeof(v20));
      swift_retain();
      swift_getAtKeyPath();
      swift_release();
      sub_25ACAA5D8((uint64_t)__dst);
      uint64_t result = swift_beginAccess();
      if (v17) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v16;
      }
      BOOL v11 = __OFADD__(v10, a3);
      uint64_t v12 = v10 + a3;
      if (v11)
      {
        __break(1u);
      }
      else
      {
        unint64_t v13 = v12 & ~(v12 >> 63);
        if (!(v13 >> 31))
        {
          v20[0] = v13;
          LOBYTE(v20[1]) = 0;
          swift_retain();
          swift_setAtWritableKeyPath();
          swift_release();
          memcpy(v20, __src, sizeof(v20));
          swift_retain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v15 = *a2;
          *a2 = 0x8000000000000000;
          sub_25ACA98EC(v20, v6, isUniquelyReferenced_nonNull_native);
          *a2 = v15;
          swift_release();
          return swift_bridgeObjectRelease();
        }
      }
      __break(1u);
      return result;
    }
    return swift_release();
  }
  return result;
}

unint64_t sub_25ACA7F54(uint64_t a1)
{
  sub_25ACD56A0();
  sub_25ACADF2C(&qword_26A4B27D0, MEMORY[0x263F16580]);
  uint64_t v2 = sub_25ACD5B10();
  return sub_25ACA80F4(a1, v2);
}

unint64_t sub_25ACA8000(uint64_t a1, uint64_t a2)
{
  sub_25ACD5FF0();
  sub_25ACD5B90();
  uint64_t v4 = sub_25ACD6010();

  return sub_25ACA81F0(a1, a2, v4);
}

void sub_25ACA8078(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25ACD5EE0();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x261153D30);
}

unint64_t sub_25ACA80F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    sub_25ACD56A0();
    sub_25ACADF2C(&qword_26A4B27E0, MEMORY[0x263F16580]);
    do
    {
      if (sub_25ACD5B30()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_25ACA81F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25ACD5F80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25ACD5F80() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25ACA82D4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27C8);
  char v39 = a2;
  uint64_t v6 = sub_25ACD5F00();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  char v37 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  uint64_t v38 = v5;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v36) {
      break;
    }
    unint64_t v19 = v37;
    unint64_t v20 = v37[v18];
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v36) {
        goto LABEL_34;
      }
      unint64_t v20 = v37[v13];
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v36)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v35;
          if ((v39 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = v37[v21];
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v36) {
              goto LABEL_34;
            }
            unint64_t v20 = v37[v13];
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    int64_t v97 = v13;
    uint64_t v22 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    if (v39)
    {
      uint64_t v23 = *(void *)(v5 + 56) + 296 * v17;
      int v67 = *(_DWORD *)v23;
      int v81 = *(_DWORD *)(v23 + 8);
      char v62 = *(unsigned char *)(v23 + 12);
      int v79 = *(_DWORD *)(v23 + 16);
      int v73 = *(_DWORD *)(v23 + 24);
      char v54 = *(unsigned char *)(v23 + 4);
      char v55 = *(unsigned char *)(v23 + 28);
      int v70 = *(_DWORD *)(v23 + 32);
      char v50 = *(unsigned char *)(v23 + 36);
      uint64_t v65 = *(void *)(v23 + 40);
      int v85 = *(_DWORD *)(v23 + 48);
      int v83 = *(_DWORD *)(v23 + 56);
      char v59 = *(unsigned char *)(v23 + 20);
      char v60 = *(unsigned char *)(v23 + 60);
      int v82 = *(_DWORD *)(v23 + 64);
      uint64_t v80 = *(void *)(v23 + 72);
      char v53 = *(unsigned char *)(v23 + 80);
      uint64_t v77 = *(void *)(v23 + 88);
      uint64_t v75 = *(void *)(v23 + 96);
      int v90 = *(_DWORD *)(v23 + 104);
      char v40 = *(unsigned char *)(v23 + 52);
      char v41 = *(unsigned char *)(v23 + 108);
      int v87 = *(_DWORD *)(v23 + 112);
      char v61 = *(unsigned char *)(v23 + 116);
      int v86 = *(_DWORD *)(v23 + 120);
      char v57 = *(unsigned char *)(v23 + 68);
      char v58 = *(unsigned char *)(v23 + 124);
      char v42 = *(unsigned char *)(v23 + 260);
      char v63 = *(unsigned char *)(v23 + 280);
      uint64_t v56 = *(void *)(v23 + 128);
      char v24 = *(unsigned char *)(v23 + 136);
      int v78 = *(_DWORD *)(v23 + 144);
      int v76 = *(_DWORD *)(v23 + 152);
      char v47 = *(unsigned char *)(v23 + 156);
      char v48 = *(unsigned char *)(v23 + 148);
      int v74 = *(_DWORD *)(v23 + 160);
      char v45 = *(unsigned char *)(v23 + 172);
      char v46 = *(unsigned char *)(v23 + 164);
      int v71 = *(_DWORD *)(v23 + 176);
      int v72 = *(_DWORD *)(v23 + 168);
      uint64_t v69 = *(void *)(v23 + 184);
      int v68 = *(_DWORD *)(v23 + 192);
      char v43 = *(unsigned char *)(v23 + 196);
      char v44 = *(unsigned char *)(v23 + 180);
      int v66 = *(_DWORD *)(v23 + 200);
      char v25 = *(unsigned char *)(v23 + 204);
      int v64 = *(_DWORD *)(v23 + 208);
      char v26 = *(unsigned char *)(v23 + 212);
      uint64_t v84 = *(void *)(v23 + 216);
      int v92 = *(_DWORD *)(v23 + 224);
      int v91 = *(_DWORD *)(v23 + 232);
      char v51 = *(unsigned char *)(v23 + 236);
      char v52 = *(unsigned char *)(v23 + 228);
      int v89 = *(_DWORD *)(v23 + 240);
      char v49 = *(unsigned char *)(v23 + 244);
      uint64_t v88 = *(void *)(v23 + 248);
      int v96 = *(_DWORD *)(v23 + 256);
      uint64_t v94 = *(void *)(v23 + 272);
      uint64_t v95 = *(void *)(v23 + 264);
      uint64_t v93 = *(void *)(v23 + 288);
    }
    else
    {
      memcpy(__dst, (const void *)(*(void *)(v5 + 56) + 296 * v17), 0x128uLL);
      int v96 = __dst[32];
      char v42 = BYTE4(__dst[32]);
      uint64_t v94 = __dst[34];
      uint64_t v95 = __dst[33];
      char v63 = __dst[35];
      uint64_t v93 = __dst[36];
      int v92 = __dst[28];
      int v91 = __dst[29];
      char v51 = BYTE4(__dst[29]);
      char v52 = BYTE4(__dst[28]);
      int v89 = __dst[30];
      uint64_t v88 = __dst[31];
      uint64_t v84 = __dst[27];
      int v78 = __dst[18];
      char v48 = BYTE4(__dst[18]);
      char v49 = BYTE4(__dst[30]);
      int v76 = __dst[19];
      int v74 = __dst[20];
      char v46 = BYTE4(__dst[20]);
      char v47 = BYTE4(__dst[19]);
      int v71 = __dst[22];
      int v72 = __dst[21];
      char v44 = BYTE4(__dst[22]);
      char v45 = BYTE4(__dst[21]);
      uint64_t v69 = __dst[23];
      int v68 = __dst[24];
      char v43 = BYTE4(__dst[24]);
      int v66 = __dst[25];
      char v25 = BYTE4(__dst[25]);
      int v64 = __dst[26];
      char v26 = BYTE4(__dst[26]);
      int v90 = __dst[13];
      int v87 = __dst[14];
      int v86 = __dst[15];
      uint64_t v56 = __dst[16];
      char v24 = __dst[17];
      int v85 = __dst[6];
      char v40 = BYTE4(__dst[6]);
      char v41 = BYTE4(__dst[13]);
      int v83 = __dst[7];
      char v60 = BYTE4(__dst[7]);
      char v61 = BYTE4(__dst[14]);
      char v57 = BYTE4(__dst[8]);
      char v58 = BYTE4(__dst[15]);
      uint64_t v80 = __dst[9];
      char v53 = __dst[10];
      uint64_t v77 = __dst[11];
      uint64_t v75 = __dst[12];
      int v81 = __dst[1];
      int v82 = __dst[8];
      char v62 = BYTE4(__dst[1]);
      int v79 = __dst[2];
      char v59 = BYTE4(__dst[2]);
      int v73 = __dst[3];
      int v70 = __dst[4];
      char v50 = BYTE4(__dst[4]);
      uint64_t v65 = __dst[5];
      int v67 = __dst[0];
      char v54 = BYTE4(__dst[0]);
      char v55 = BYTE4(__dst[3]);
      swift_retain();
      sub_25ACADD94((uint64_t)__dst);
    }
    __dst[0] = v22;
    sub_25ACD56A0();
    sub_25ACADF2C(&qword_26A4B27D0, MEMORY[0x263F16580]);
    uint64_t result = sub_25ACD5B10();
    uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v11 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v14 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v22;
    uint64_t v15 = *(void *)(v7 + 56) + 296 * v14;
    *(_DWORD *)uint64_t v15 = v67;
    *(unsigned char *)(v15 + 4) = v54;
    *(_DWORD *)(v15 + 8) = v81;
    *(unsigned char *)(v15 + 12) = v62;
    *(_DWORD *)(v15 + 16) = v79;
    *(unsigned char *)(v15 + 20) = v59;
    *(_DWORD *)(v15 + 24) = v73;
    *(unsigned char *)(v15 + 28) = v55;
    *(_DWORD *)(v15 + 32) = v70;
    *(unsigned char *)(v15 + 36) = v50;
    *(void *)(v15 + 40) = v65;
    *(_DWORD *)(v15 + 48) = v85;
    *(unsigned char *)(v15 + 52) = v40;
    *(_DWORD *)(v15 + 56) = v83;
    *(unsigned char *)(v15 + 60) = v60;
    *(_DWORD *)(v15 + 64) = v82;
    *(unsigned char *)(v15 + 68) = v57;
    *(void *)(v15 + 72) = v80;
    *(unsigned char *)(v15 + 80) = v53;
    *(void *)(v15 + 88) = v77;
    *(void *)(v15 + 96) = v75;
    *(_DWORD *)(v15 + 104) = v90;
    *(unsigned char *)(v15 + 108) = v41;
    *(_DWORD *)(v15 + 112) = v87;
    *(unsigned char *)(v15 + 116) = v61;
    *(_DWORD *)(v15 + 120) = v86;
    *(unsigned char *)(v15 + 124) = v58;
    *(void *)(v15 + 128) = v56;
    *(unsigned char *)(v15 + 136) = v24;
    *(_DWORD *)(v15 + 144) = v78;
    *(unsigned char *)(v15 + 148) = v48;
    *(_DWORD *)(v15 + 152) = v76;
    *(unsigned char *)(v15 + 156) = v47;
    *(_DWORD *)(v15 + 160) = v74;
    *(unsigned char *)(v15 + 164) = v46;
    *(_DWORD *)(v15 + 168) = v72;
    *(unsigned char *)(v15 + 172) = v45;
    *(_DWORD *)(v15 + 176) = v71;
    *(unsigned char *)(v15 + 180) = v44;
    *(void *)(v15 + 184) = v69;
    *(_DWORD *)(v15 + 192) = v68;
    *(unsigned char *)(v15 + 196) = v43;
    *(_DWORD *)(v15 + 200) = v66;
    *(unsigned char *)(v15 + 204) = v25;
    *(_DWORD *)(v15 + 208) = v64;
    *(unsigned char *)(v15 + 212) = v26;
    *(void *)(v15 + 216) = v84;
    *(_DWORD *)(v15 + 224) = v92;
    *(unsigned char *)(v15 + 228) = v52;
    *(_DWORD *)(v15 + 232) = v91;
    *(unsigned char *)(v15 + 236) = v51;
    *(_DWORD *)(v15 + 240) = v89;
    *(unsigned char *)(v15 + 244) = v49;
    *(void *)(v15 + 248) = v88;
    *(_DWORD *)(v15 + 256) = v96;
    *(unsigned char *)(v15 + 260) = v42;
    *(void *)(v15 + 264) = v95;
    *(void *)(v15 + 272) = v94;
    *(unsigned char *)(v15 + 280) = v63;
    *(void *)(v15 + 288) = v93;
    ++*(void *)(v7 + 16);
    uint64_t v5 = v38;
    int64_t v13 = v97;
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v19 = v37;
  if ((v39 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v19, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACA8C48(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27D8);
  char v36 = a2;
  uint64_t v6 = sub_25ACD5F00();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  uint64_t v33 = v2;
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v33;
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v29 = 8 * v20;
    uint64_t v30 = *(void *)(*(void *)(v5 + 48) + v29);
    uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
    if ((v36 & 1) == 0) {
      swift_retain();
    }
    sub_25ACD56A0();
    sub_25ACADF2C(&qword_26A4B27D0, MEMORY[0x263F16580]);
    uint64_t result = sub_25ACD5B10();
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
    uint64_t v18 = 8 * v17;
    *(void *)(*(void *)(v7 + 48) + v18) = v30;
    *(void *)(*(void *)(v7 + 56) + v18) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACA8F90(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27A8);
  char v37 = a2;
  uint64_t v6 = sub_25ACD5F00();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25ACD5FF0();
    sub_25ACD5B90();
    uint64_t result = sub_25ACD6010();
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
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACA929C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2760);
  char v39 = a2;
  uint64_t v6 = sub_25ACD5F00();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v39)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      int v32 = (uint64_t *)(*(void *)(v5 + 56) + 24 * v21);
      uint64_t v34 = *v32;
      uint64_t v33 = v32[1];
      uint64_t v35 = v32[2];
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_25ACD5FF0();
      sub_25ACD5B90();
      uint64_t result = sub_25ACD6010();
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
            goto LABEL_39;
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
      unint64_t v19 = (void *)(*(void *)(v7 + 56) + 24 * v17);
      *unint64_t v19 = v34;
      v19[1] = v33;
      v19[2] = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACA95C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2758);
  char v40 = a2;
  uint64_t v6 = sub_25ACD5F00();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v40)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      int v32 = (uint64_t *)(*(void *)(v5 + 56) + 24 * v21);
      uint64_t v33 = *v32;
      uint64_t v34 = v32[1];
      uint64_t v35 = v32[2];
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_25ACD5FF0();
      sub_25ACD5B90();
      uint64_t result = sub_25ACD6010();
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
            goto LABEL_39;
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
      unint64_t v19 = (void *)(*(void *)(v7 + 56) + 24 * v17);
      *unint64_t v19 = v33;
      v19[1] = v34;
      v19[2] = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACA98EC(const void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25ACA7F54(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25ACA9BC0();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7] + 296 * v10;
      return sub_25ACADE28((uint64_t)a1, v17);
    }
    goto LABEL_13;
  }
  sub_25ACA82D4(v13, a3 & 1);
  unint64_t v19 = sub_25ACA7F54(a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_19:
    sub_25ACD56A0();
    uint64_t result = sub_25ACD5FC0();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  unint64_t v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_13:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  *(void *)(v16[6] + 8 * v10) = a2;
  memcpy((void *)(v16[7] + 296 * v10), a1, 0x128uLL);
  uint64_t v21 = v16[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v16[2] = v23;

  return swift_retain();
}

uint64_t sub_25ACA9A68(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25ACA7F54(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25ACA9DB4();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25ACA8C48(result, a3 & 1);
  uint64_t result = sub_25ACA7F54(a2);
  if ((v14 & 1) != (v17 & 1))
  {
LABEL_17:
    sub_25ACD56A0();
    uint64_t result = sub_25ACD5FC0();
    __break(1u);
    return result;
  }
  unint64_t v10 = result;
  unint64_t v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  uint64_t v18 = 8 * v10;
  *(void *)(v16[6] + v18) = a2;
  *(void *)(v16[7] + v18) = a1;
  uint64_t v19 = v16[2];
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (v20)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v21;

  return swift_retain();
}

void *sub_25ACA9BC0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  BOOL v22 = v1;
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 296 * v15;
    memcpy(__dst, (const void *)(*(void *)(v2 + 56) + 296 * v15), 0x128uLL);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    memcpy((void *)(*(void *)(v4 + 56) + v18), __dst, 0x128uLL);
    swift_retain();
    uint64_t result = (void *)sub_25ACADD94((uint64_t)__dst);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v22;
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25ACA9DB4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACA9F58()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(void *)(v2 + 56) + v20);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v20) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_25ACAA108()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2760);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    int64_t v21 = (uint64_t *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    int64_t v24 = (void *)(*(void *)(v4 + 48) + v16);
    uint64_t v25 = v21[2];
    *int64_t v24 = v19;
    v24[1] = v18;
    unint64_t v26 = (void *)(*(void *)(v4 + 56) + v20);
    *unint64_t v26 = v22;
    v26[1] = v23;
    v26[2] = v25;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACAA2D4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2758);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    int64_t v21 = (uint64_t *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    uint64_t v25 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v25 = v19;
    v25[1] = v18;
    unint64_t v26 = (void *)(*(void *)(v4 + 56) + v20);
    *unint64_t v26 = v22;
    v26[1] = v23;
    v26[2] = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void (*sub_25ACAA4A0(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25ACAA550(v6, a2, a3);
  return sub_25ACAA508;
}

void sub_25ACAA508(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_25ACAA550(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x261153D20](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_25ACAA5D0;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACAA5D0()
{
  return swift_release();
}

uint64_t sub_25ACAA5D8(uint64_t a1)
{
  return a1;
}

void *sub_25ACAA66C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27E8);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_25ACAA764((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25ACD5EE0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_25ACAA764(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25ACD5EE0();
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
      uint64_t v8 = sub_25ACD5EE0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_25ACADE88();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27F0);
            uint64_t v10 = sub_25ACAA4A0(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
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
        sub_25ACD56A0();
        swift_arrayInitWithCopy();
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

unint64_t sub_25ACAA904(uint64_t a1)
{
  uint64_t v2 = sub_25ACD55F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v33 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v30 - v10;
  sub_25ACC1F68();
  int v42 = v12;
  char v43 = v13 & 1;
  int v44 = v14;
  char v45 = v15 & 1;
  uint64_t v46 = v16;
  sub_25ACD5550();
  sub_25ACB3030();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v17 = v7 + 8;
  uint64_t v31 = v18;
  v18(v11, v6);
  unsigned int v40 = v36;
  unsigned __int8 v41 = 0;
  long long v38 = xmmword_25ACD65F0;
  v39[0] = swift_getKeyPath();
  v39[1] = sub_25ACD5390();
  v39[2] = MEMORY[0x263F16260];
  v39[3] = swift_getKeyPath();
  v39[4] = sub_25ACD5360();
  v39[5] = MEMORY[0x263F16210];
  swift_retain();
  uint64_t v34 = a1;
  sub_25ACD5560();
  char v19 = sub_25ACD55D0();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v32 = v3 + 8;
  v20(v5, v2);
  int v36 = v19 & 1;
  char v37 = 0;
  swift_setAtWritableKeyPath();
  unint64_t result = swift_release();
  if ((unint64_t)v38 < 2)
  {
    __break(1u);
  }
  else
  {
    v30[1] = v39;
    uint64_t v22 = v6;
    uint64_t v23 = v2;
    swift_retain();
    uint64_t v24 = v33;
    v30[2] = v17;
    sub_25ACD5560();
    char v25 = sub_25ACD55D0();
    v20(v5, v23);
    int v36 = v25 & 1;
    char v37 = 0;
    swift_setAtWritableKeyPath();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2768);
    swift_arrayDestroy();
    sub_25ACD5550();
    uint64_t v26 = sub_25ACD54E0();
    v31(v24, v22);
    if ((v26 & 0x100000000) != 0)
    {
      uint64_t v28 = MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2770);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25ACD6600;
      *(void *)(inited + 32) = v34;
      *(_DWORD *)(inited + 40) = v26;
      swift_retain();
      uint64_t v28 = inited;
    }
    sub_25ACA5DB8(v28);
    swift_bridgeObjectRelease();
    uint64_t v29 = v40;
    LOBYTE(v40) = v41;
    LOBYTE(v36) = v43;
    char v35 = v45;
    return v29 | ((unint64_t)v41 << 32);
  }
  return result;
}

uint64_t sub_25ACAAD50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACADD3C();
  swift_retain();
  sub_25ACD5540();
  sub_25ACC1F50((uint64_t)&v25);
  long long v23 = xmmword_25ACD6610;
  uint64_t v16 = v24;
  v24[0] = swift_getKeyPath();
  v24[1] = swift_getKeyPath();
  v24[2] = swift_getKeyPath();
  v24[3] = swift_getKeyPath();
  v24[4] = swift_getKeyPath();
  v24[5] = swift_getKeyPath();
  v24[6] = swift_getKeyPath();
  v24[7] = swift_getKeyPath();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  int v20 = v22;
  char v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  int v20 = v22;
  char v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  int v20 = v22;
  char v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  int v20 = v22;
  char v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27B0);
  swift_arrayDestroy();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25ACD6600;
  *(void *)(inited + 32) = v17;
  swift_retain();
  uint64_t v6 = v18;
  *(void *)(inited + 40) = sub_25ACB23C8();
  unint64_t v7 = sub_25ACA5EB8(inited, &qword_26A4B27C0);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  char v9 = v26;
  int v10 = v27;
  char v11 = v28;
  int v12 = v29;
  char v13 = v30;
  int v14 = v31;
  char v15 = v32;
  *(_DWORD *)a2 = v25;
  *(unsigned char *)(a2 + 4) = v9;
  *(_DWORD *)(a2 + 8) = v10;
  *(unsigned char *)(a2 + 12) = v11;
  *(_DWORD *)(a2 + 16) = v12;
  *(unsigned char *)(a2 + 20) = v13;
  *(_DWORD *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 28) = v15;
  *(void *)(a2 + 32) = v7;
  return result;
}

uint64_t sub_25ACAB12C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v38 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v39 = a3;
  while (1)
  {
    if (v7)
    {
      uint64_t v41 = (v7 - 1) & v7;
      int64_t v42 = v8;
      unint64_t v9 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      int64_t v10 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_43;
      }
      if (v10 >= v38)
      {
LABEL_40:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v11 = *(void *)(v37 + 8 * v10);
      int64_t v12 = v8 + 1;
      if (!v11)
      {
        int64_t v12 = v8 + 2;
        if (v8 + 2 >= v38) {
          goto LABEL_40;
        }
        unint64_t v11 = *(void *)(v37 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v8 + 3;
          if (v8 + 3 >= v38) {
            goto LABEL_40;
          }
          unint64_t v11 = *(void *)(v37 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v8 + 4;
            if (v8 + 4 >= v38) {
              goto LABEL_40;
            }
            unint64_t v11 = *(void *)(v37 + 8 * v12);
            if (!v11)
            {
              uint64_t v13 = v8 + 5;
              if (v8 + 5 >= v38) {
                goto LABEL_40;
              }
              unint64_t v11 = *(void *)(v37 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  int64_t v12 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_44;
                  }
                  if (v12 >= v38) {
                    goto LABEL_40;
                  }
                  unint64_t v11 = *(void *)(v37 + 8 * v12);
                  ++v13;
                  if (v11) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v8 + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v41 = (v11 - 1) & v11;
      int64_t v42 = v12;
      unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    }
    int v14 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v9);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    int v17 = *(_DWORD *)(*(void *)(a2 + 56) + 4 * v9);
    uint64_t v18 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain_n();
    if (v18)
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_25ACA8000(v16, v15);
      uint64_t v20 = v15;
      if (v21)
      {
        int v22 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v19);
        uint64_t v16 = *v22;
        uint64_t v20 = v22[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = v15;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v25 = sub_25ACA8000(v16, v20);
    uint64_t v26 = a1[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (a1[3] >= v28)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v24) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_25ACA9F58();
        if (v29) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_25ACA8F90(v28, isUniquelyReferenced_nonNull_native);
      unint64_t v30 = sub_25ACA8000(v16, v20);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_45;
      }
      unint64_t v25 = v30;
      if (v29)
      {
LABEL_4:
        *(_DWORD *)(a1[7] + 4 * v25) = v17;
        goto LABEL_5;
      }
    }
    a1[(v25 >> 6) + 8] |= 1 << v25;
    char v32 = (uint64_t *)(a1[6] + 16 * v25);
    *char v32 = v16;
    v32[1] = v20;
    *(_DWORD *)(a1[7] + 4 * v25) = v17;
    uint64_t v33 = a1[2];
    BOOL v34 = __OFADD__(v33, 1);
    uint64_t v35 = v33 + 1;
    if (v34) {
      goto LABEL_42;
    }
    a1[2] = v35;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v39;
    unint64_t v7 = v41;
    int64_t v8 = v42;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACAB478@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  unint64_t v25 = a2;
  uint64_t v3 = sub_25ACD55F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v24 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACADD3C();
  swift_retain();
  sub_25ACD5540();
  uint64_t v10 = sub_25ACD5430();
  uint64_t v11 = sub_25ACB331C();
  uint64_t v23 = sub_25ACAB12C(MEMORY[0x263F8EE80], v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25ACD5560();
  sub_25ACD56D0();
  uint64_t v22 = sub_25ACD55D0();
  int64_t v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v6, v3);
  sub_25ACD5560();
  sub_25ACD56B0();
  char v13 = sub_25ACD55D0();
  v12(v6, v3);
  sub_25ACD5560();
  sub_25ACD56C0();
  char v14 = sub_25ACD55D0();
  v12(v6, v3);
  uint64_t result = sub_25ACD5440();
  uint64_t v16 = LODWORD(v26[0]);
  if ((v26[0] & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2798);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25ACD6600;
    uint64_t v18 = v23;
    *(void *)(inited + 32) = a1;
    *(void *)(inited + 40) = v18;
    swift_retain();
    unint64_t v19 = sub_25ACA5EB8(inited, &qword_26A4B27A0);
    LOBYTE(v26[0]) = 0;
    sub_25ACC3628(v22 & 1, v13 & 1, v14 & 1, v16, 0, 0, v19, (uint64_t)v26);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v9, v7);
    long long v20 = v26[1];
    char v21 = v25;
    *unint64_t v25 = v26[0];
    v21[1] = v20;
    v21[2] = v26[2];
    *((void *)v21 + 6) = v27;
  }
  return result;
}

uint64_t sub_25ACAB7C4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v41 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v42 = a3;
  while (1)
  {
    if (v7)
    {
      uint64_t v44 = (v7 - 1) & v7;
      int64_t v45 = v8;
      unint64_t v10 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      int64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_43;
      }
      if (v11 >= v41)
      {
LABEL_40:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v12 = *(void *)(v40 + 8 * v11);
      int64_t v13 = v8 + 1;
      if (!v12)
      {
        int64_t v13 = v8 + 2;
        if (v8 + 2 >= v41) {
          goto LABEL_40;
        }
        unint64_t v12 = *(void *)(v40 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 3;
          if (v8 + 3 >= v41) {
            goto LABEL_40;
          }
          unint64_t v12 = *(void *)(v40 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v8 + 4;
            if (v8 + 4 >= v41) {
              goto LABEL_40;
            }
            unint64_t v12 = *(void *)(v40 + 8 * v13);
            if (!v12)
            {
              uint64_t v14 = v8 + 5;
              if (v8 + 5 >= v41) {
                goto LABEL_40;
              }
              unint64_t v12 = *(void *)(v40 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  int64_t v13 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_44;
                  }
                  if (v13 >= v41) {
                    goto LABEL_40;
                  }
                  unint64_t v12 = *(void *)(v40 + 8 * v13);
                  ++v14;
                  if (v12) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v13 = v8 + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v44 = (v12 - 1) & v12;
      int64_t v45 = v13;
      unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    uint64_t v15 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(a2 + 56) + 8 * v10);
    uint64_t v19 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain_n();
    if (v19)
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_25ACA8000(v17, v16);
      if (v21)
      {
        uint64_t v22 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v20);
        uint64_t v24 = *v22;
        uint64_t v23 = v22[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v24 = v17;
    uint64_t v23 = v16;
LABEL_29:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v27 = sub_25ACA8000(v24, v23);
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
        sub_25ACAA108();
        if (v31) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_25ACA929C(v30, isUniquelyReferenced_nonNull_native);
      unint64_t v32 = sub_25ACA8000(v24, v23);
      if ((v31 & 1) != (v33 & 1)) {
        goto LABEL_45;
      }
      unint64_t v27 = v32;
      if (v31)
      {
LABEL_4:
        unint64_t v9 = (uint64_t *)(a1[7] + 24 * v27);
        swift_bridgeObjectRelease();
        *unint64_t v9 = v17;
        v9[1] = v16;
        v9[2] = v18;
        goto LABEL_5;
      }
    }
    a1[(v27 >> 6) + 8] |= 1 << v27;
    BOOL v34 = (uint64_t *)(a1[6] + 16 * v27);
    *BOOL v34 = v24;
    v34[1] = v23;
    uint64_t v35 = (uint64_t *)(a1[7] + 24 * v27);
    *uint64_t v35 = v17;
    v35[1] = v16;
    v35[2] = v18;
    uint64_t v36 = a1[2];
    BOOL v37 = __OFADD__(v36, 1);
    uint64_t v38 = v36 + 1;
    if (v37) {
      goto LABEL_42;
    }
    a1[2] = v38;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v42;
    unint64_t v7 = v44;
    int64_t v8 = v45;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACABB40(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v41 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v42 = a3;
  while (1)
  {
    if (v7)
    {
      uint64_t v44 = (v7 - 1) & v7;
      int64_t v45 = v8;
      unint64_t v10 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      int64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_41;
      }
      if (v11 >= v41)
      {
LABEL_38:
        swift_release();
        return (uint64_t)a1;
      }
      unint64_t v12 = *(void *)(v40 + 8 * v11);
      int64_t v13 = v8 + 1;
      if (!v12)
      {
        int64_t v13 = v8 + 2;
        if (v8 + 2 >= v41) {
          goto LABEL_38;
        }
        unint64_t v12 = *(void *)(v40 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 3;
          if (v8 + 3 >= v41) {
            goto LABEL_38;
          }
          unint64_t v12 = *(void *)(v40 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v8 + 4;
            if (v8 + 4 >= v41) {
              goto LABEL_38;
            }
            unint64_t v12 = *(void *)(v40 + 8 * v13);
            if (!v12)
            {
              uint64_t v14 = v8 + 5;
              if (v8 + 5 >= v41) {
                goto LABEL_38;
              }
              unint64_t v12 = *(void *)(v40 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  int64_t v13 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v41) {
                    goto LABEL_38;
                  }
                  unint64_t v12 = *(void *)(v40 + 8 * v13);
                  ++v14;
                  if (v12) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v13 = v8 + 5;
            }
          }
        }
      }
LABEL_23:
      uint64_t v44 = (v12 - 1) & v12;
      int64_t v45 = v13;
      unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    uint64_t v15 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(a2 + 56) + 8 * v10);
    uint64_t v19 = *(void *)(a3 + 16);
    swift_bridgeObjectRetain_n();
    uint64_t v46 = v18;
    if (v19)
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_25ACA8000(v17, v16);
      if (v21)
      {
        uint64_t v22 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v20);
        uint64_t v24 = *v22;
        uint64_t v23 = v22[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v24 = v17;
    uint64_t v23 = v16;
LABEL_29:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v27 = sub_25ACA8000(v24, v23);
    uint64_t v28 = a1[2];
    BOOL v29 = (v26 & 1) == 0;
    uint64_t v30 = v28 + v29;
    if (__OFADD__(v28, v29)) {
      break;
    }
    char v31 = v26;
    if (a1[3] >= v30)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_25ACAA2D4();
      }
    }
    else
    {
      sub_25ACA95C4(v30, isUniquelyReferenced_nonNull_native);
      unint64_t v32 = sub_25ACA8000(v24, v23);
      if ((v31 & 1) != (v33 & 1)) {
        goto LABEL_43;
      }
      unint64_t v27 = v32;
    }
    if (v31)
    {
      unint64_t v9 = (uint64_t *)(a1[7] + 24 * v27);
      swift_bridgeObjectRelease();
      *unint64_t v9 = v17;
      v9[1] = v16;
      v9[2] = v46;
    }
    else
    {
      a1[(v27 >> 6) + 8] |= 1 << v27;
      BOOL v34 = (uint64_t *)(a1[6] + 16 * v27);
      *BOOL v34 = v24;
      v34[1] = v23;
      uint64_t v35 = (uint64_t *)(a1[7] + 24 * v27);
      *uint64_t v35 = v17;
      v35[1] = v16;
      v35[2] = v46;
      uint64_t v36 = a1[2];
      BOOL v37 = __OFADD__(v36, 1);
      uint64_t v38 = v36 + 1;
      if (v37) {
        goto LABEL_40;
      }
      a1[2] = v38;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v42;
    unint64_t v7 = v44;
    int64_t v8 = v45;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

double sub_25ACABEAC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5550();
  uint64_t v8 = sub_25ACD54C0();
  unint64_t v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  v9(v7, v4);
  sub_25ACD5550();
  uint64_t v10 = sub_25ACD54B0();
  v9(v7, v4);
  sub_25ACD5550();
  uint64_t v11 = sub_25ACB331C();
  v9(v7, v4);
  swift_bridgeObjectRetain();
  unint64_t v12 = (void *)MEMORY[0x263F8EE80];
  uint64_t v13 = sub_25ACAB7C4(MEMORY[0x263F8EE80], v8, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_25ACABB40(v12, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2738);
  uint64_t inited = swift_initStackObject();
  long long v21 = xmmword_25ACD6600;
  *(_OWORD *)(inited + 16) = xmmword_25ACD6600;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = v13;
  swift_retain();
  unint64_t v16 = sub_25ACA5EB8(inited, &qword_26A4B2750);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2740);
  uint64_t v17 = swift_initStackObject();
  *(_OWORD *)(v17 + 16) = v21;
  *(void *)(v17 + 32) = a1;
  *(void *)(v17 + 40) = v14;
  swift_retain();
  unint64_t v18 = sub_25ACA5EB8(v17, &qword_26A4B2748);
  sub_25ACC4F3C(v16, v18, (uint64_t)v22);
  double result = *(double *)v22;
  long long v20 = v22[1];
  *(_OWORD *)a2 = v22[0];
  *(_OWORD *)(a2 + 16) = v20;
  *(void *)(a2 + 32) = v23;
  return result;
}

uint64_t sub_25ACAC118@<X0>(uint64_t a1@<X8>)
{
  uint64_t v15 = sub_25ACD55F0();
  uint64_t v2 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25ACADD3C();
  swift_retain();
  sub_25ACD5540();
  sub_25ACC1F58((uint64_t)v17);
  sub_25ACD54A0();
  unsigned int v14 = v16;
  sub_25ACD5470();
  unsigned int v9 = v16;
  uint64_t result = sub_25ACD5420();
  uint64_t v11 = v16;
  if ((v16 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_25ACD5560();
    char v12 = sub_25ACD55A0();
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v15);
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    *(_DWORD *)a1 = v14;
    *(unsigned char *)(a1 + 4) = 0;
    *(_DWORD *)(a1 + 8) = v9;
    *(unsigned char *)(a1 + 12) = 0;
    *(_DWORD *)(a1 + 16) = v12 & 1;
    *(unsigned char *)(a1 + 20) = 0;
    *(void *)(a1 + 24) = v11;
    *(unsigned char *)(a1 + 32) = 0;
  }
  return result;
}

uint64_t sub_25ACAC334@<X0>(_DWORD *a1@<X8>)
{
  char v54 = a1;
  uint64_t v1 = sub_25ACD55F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v56 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v53 - v9;
  sub_25ACADD3C();
  swift_retain();
  char v55 = v10;
  sub_25ACD5540();
  sub_25ACC1F5C((uint64_t)&v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2788);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25ACD6610;
  *(void *)(inited + 32) = swift_getKeyPath();
  uint64_t v12 = sub_25ACD53B0();
  uint64_t v13 = MEMORY[0x263F162A8];
  *(void *)(inited + 40) = v12;
  *(void *)(inited + 48) = v13;
  *(void *)(inited + 56) = swift_getKeyPath();
  uint64_t v14 = sub_25ACD53C0();
  uint64_t v15 = MEMORY[0x263F162E0];
  *(void *)(inited + 64) = v14;
  *(void *)(inited + 72) = v15;
  *(void *)(inited + 80) = swift_getKeyPath();
  uint64_t v16 = sub_25ACD5380();
  uint64_t v17 = MEMORY[0x263F16258];
  *(void *)(inited + 88) = v16;
  *(void *)(inited + 96) = v17;
  *(void *)(inited + 104) = swift_getKeyPath();
  uint64_t v18 = sub_25ACD5370();
  uint64_t v19 = MEMORY[0x263F16238];
  *(void *)(inited + 112) = v18;
  *(void *)(inited + 120) = v19;
  long long v64 = xmmword_25ACD65F0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v66 = swift_getKeyPath();
  uint64_t v67 = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  uint64_t v68 = result;
  if (!*(void *)(inited + 16))
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v57 = v5;
  uint64_t v58 = v6;
  swift_retain();
  sub_25ACD5560();
  char v21 = sub_25ACD55D0();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v23 = v2 + 8;
  uint64_t v22 = v24;
  v24(v4, v1);
  int v62 = v21 & 1;
  char v63 = 0;
  swift_setAtWritableKeyPath();
  uint64_t result = swift_release();
  if (*(void *)(inited + 16) < 2uLL)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  char v59 = v22;
  uint64_t v60 = v1;
  swift_retain();
  sub_25ACD5560();
  char v25 = sub_25ACD55D0();
  v59(v4, v60);
  int v62 = v25 & 1;
  char v63 = 0;
  swift_setAtWritableKeyPath();
  uint64_t result = swift_release();
  if (*(void *)(inited + 16) < 3uLL)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  swift_retain();
  sub_25ACD5560();
  char v26 = v59;
  char v27 = sub_25ACD55D0();
  v26(v4, v60);
  int v62 = v27 & 1;
  char v63 = 0;
  swift_setAtWritableKeyPath();
  uint64_t result = swift_release();
  if (*(void *)(inited + 16) < 4uLL)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  swift_retain();
  sub_25ACD5560();
  char v28 = sub_25ACD55D0();
  uint64_t v53 = v23;
  v26(v4, v60);
  int v62 = v28 & 1;
  char v63 = 0;
  swift_setAtWritableKeyPath();
  swift_bridgeObjectRelease();
  swift_release();
  BOOL v29 = v56;
  sub_25ACD5550();
  uint64_t v30 = v57;
  sub_25ACB2F14();
  uint64_t v31 = v58 + 8;
  unint64_t v32 = *(uint64_t (**)(char *, uint64_t))(v58 + 8);
  uint64_t result = v32(v29, v30);
  int v84 = v62;
  char v85 = 0;
  uint64_t v33 = v64;
  if (!(void)v64)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  swift_retain();
  swift_retain();
  BOOL v34 = v55;
  swift_getAtKeyPath();
  int v62 = v61;
  char v63 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  uint64_t result = swift_release();
  if (v33 == 1)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t v58 = v31;
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  int v62 = v61;
  char v63 = 0;
  swift_setAtWritableKeyPath();
  uint64_t v35 = v57;
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2790);
  swift_arrayDestroy();
  sub_25ACD5560();
  char v36 = sub_25ACD5590();
  v59(v4, v60);
  int v77 = v36 & 1;
  char v78 = 0;
  sub_25ACD5480();
  if (v62)
  {
    uint64_t v37 = sub_25ACD5490();
    v32(v34, v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    v32(v34, v35);
    uint64_t v37 = v79;
  }
  uint64_t v38 = v54;
  char v39 = v70;
  int v40 = v71;
  char v41 = v72;
  int v42 = v73;
  char v43 = v74;
  int v44 = v75;
  char v45 = v76;
  int v46 = v77;
  char v47 = v78;
  uint64_t result = v80;
  char v48 = v81;
  int v49 = v82;
  char v50 = v83;
  int v51 = v84;
  char v52 = v85;
  *char v54 = v69;
  *((unsigned char *)v38 + 4) = v39;
  v38[2] = v40;
  *((unsigned char *)v38 + 12) = v41;
  v38[4] = v42;
  *((unsigned char *)v38 + 20) = v43;
  v38[6] = v44;
  *((unsigned char *)v38 + 28) = v45;
  v38[8] = v46;
  *((unsigned char *)v38 + 36) = v47;
  *((void *)v38 + 5) = v37;
  v38[12] = result;
  *((unsigned char *)v38 + 52) = v48;
  v38[14] = v49;
  *((unsigned char *)v38 + 60) = v50;
  v38[16] = v51;
  *((unsigned char *)v38 + 68) = v52;
  return result;
}

uint64_t sub_25ACACA2C(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v178 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v179 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v171 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v171 - v9;
  uint64_t v11 = *a2;
  char v188 = a2;
  uint64_t v189 = v11;
  v197[0] = MEMORY[0x263F8EE78];
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25ACD5EE0();
  }
  else
  {
    uint64_t v12 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v183 = v5;
  char v186 = v8;
  __int16 v187 = v10;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v32 = MEMORY[0x263F8EE78];
    if (MEMORY[0x263F8EE78] >> 62) {
      goto LABEL_171;
    }
LABEL_35:
    uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v33) {
      return swift_bridgeObjectRelease();
    }
LABEL_36:
    if ((v32 & 0xC000000000000001) != 0)
    {
      uint64_t v34 = MEMORY[0x261153D20](0, v32);
    }
    else
    {
      if (!*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_196:
        __break(1u);
LABEL_197:
        __break(1u);
LABEL_198:
        __break(1u);
LABEL_199:
        __break(1u);
LABEL_200:
        __break(1u);
LABEL_201:
        __break(1u);
LABEL_202:
        __break(1u);
LABEL_203:
        __break(1u);
LABEL_204:
        __break(1u);
LABEL_205:
        __break(1u);
LABEL_206:
        sub_25ACD5FC0();
        __break(1u);
LABEL_207:
        sub_25ACD56A0();
        sub_25ACD5FC0();
        __break(1u);
LABEL_208:
        uint64_t result = sub_25ACD5FC0();
        __break(1u);
        return result;
      }
      uint64_t v34 = *(void *)(v32 + 32);
      swift_retain();
    }
    if (!*(void *)(v178 + 16)) {
      goto LABEL_192;
    }
    uint64_t v35 = swift_retain();
    unint64_t v36 = sub_25ACA7F54(v35);
    if ((v37 & 1) == 0) {
      goto LABEL_174;
    }
    unint64_t v174 = v32 & 0xC000000000000001;
    uint64_t v177 = v34;
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v179 + 16);
    char v182 = (void (**)(char *, uint64_t))(v179 + 8);
    uint64_t v171 = v32 + 32;
    uint64_t v172 = v32 & 0xFFFFFFFFFFFFFF8;
    uint64_t v39 = MEMORY[0x263F8EE78];
    uint64_t v40 = 1;
    uint64_t v173 = v32;
    uint64_t v175 = v33;
    char v180 = (void (**)(char *, char *, uint64_t))(v179 + 16);
    while (1)
    {
      uint64_t v176 = v40;
      int v41 = *(unsigned __int8 *)(*(void *)(v178 + 56) + v36);
      swift_release();
      unint64_t v190 = sub_25ACA5FC0(v39);
      LODWORD(v189) = v41;
      uint64_t v42 = v41 ? 1 : -1;
      uint64_t v181 = v42;
      unint64_t v43 = sub_25ACBFA10();
      unint64_t v191 = v43;
      if (v43 >> 62) {
        break;
      }
      unint64_t v44 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
      char v45 = v182;
      if (v44) {
        goto LABEL_47;
      }
LABEL_110:
      swift_bridgeObjectRelease();
      unint64_t v102 = v190;
      if (!*(void *)(v190 + 16))
      {
        swift_release();
        uint64_t v106 = v173;
        unint64_t v107 = v174;
        uint64_t v108 = v175;
LABEL_159:
        unint64_t v117 = v176;
        goto LABEL_160;
      }
      uint64_t v103 = v177;
      uint64_t v104 = swift_retain();
      unint64_t v105 = sub_25ACA7F54(v104);
      uint64_t v106 = v173;
      unint64_t v107 = v174;
      uint64_t v108 = v175;
      if ((v109 & 1) == 0)
      {
        swift_release_n();
        goto LABEL_159;
      }
      uint64_t v110 = *(void *)(*(void *)(v102 + 56) + 8 * v105);
      swift_release();
      if ((unsigned __int128)(v110 * (__int128)v181) >> 64 != (v110 * v181) >> 63) {
        goto LABEL_203;
      }
      sub_25ACA7D64(v103, v188, v110 * v181);
      uint64_t v111 = sub_25ACD56A0();
      uint64_t v112 = sub_25ACD5250();
      if (v112)
      {
        uint64_t v113 = v112;
        swift_retain();
        unint64_t v114 = v190;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v197[0] = v114;
        sub_25ACA9A68(v110, v113, isUniquelyReferenced_nonNull_native);
        unint64_t v190 = v197[0];
        swift_release_n();
        swift_bridgeObjectRelease();
      }
      uint64_t v10 = v187;
      unint64_t v117 = v176;
      uint64_t v116 = v177;
      swift_retain();
      uint64_t v118 = sub_25ACD5250();
      if (!v118) {
        goto LABEL_169;
      }
      unint64_t v191 = v111;
      uint64_t v119 = v116;
      do
      {
        unint64_t v120 = v119;
        uint64_t v119 = v118;
        while (1)
        {
          unint64_t v121 = v190;
          if (!*(void *)(v190 + 16)) {
            goto LABEL_156;
          }
          uint64_t v122 = swift_retain();
          unint64_t v123 = sub_25ACA7F54(v122);
          if ((v124 & 1) == 0) {
            goto LABEL_157;
          }
          uint64_t v125 = *(void *)(*(void *)(v121 + 56) + 8 * v123);
          swift_release();
          uint64_t v126 = v125 * v181;
          if ((unsigned __int128)(v125 * (__int128)v181) >> 64 != (v125 * v181) >> 63) {
            goto LABEL_196;
          }
          uint64_t v127 = *v188;
          if (!*(void *)(*v188 + 16))
          {
LABEL_156:
            swift_release();
LABEL_158:
            swift_release();
            swift_release();
            uint64_t v106 = v173;
            unint64_t v107 = v174;
            uint64_t v108 = v175;
            uint64_t v38 = v180;
            goto LABEL_159;
          }
          uint64_t v128 = swift_retain();
          unint64_t v129 = sub_25ACA7F54(v128);
          if ((v130 & 1) == 0)
          {
LABEL_157:
            swift_release();
            swift_release();
            goto LABEL_158;
          }
          memcpy(v196, (const void *)(*(void *)(v127 + 56) + 296 * v129), sizeof(v196));
          sub_25ACADD94((uint64_t)v196);
          swift_release();
          memcpy(v197, v196, sizeof(v197));
          sub_25ACADD94((uint64_t)v196);
          sub_25ACC9278();
          swift_beginAccess();
          memcpy(v195, v196, sizeof(v195));
          swift_retain();
          swift_getAtKeyPath();
          swift_release();
          sub_25ACAA5D8((uint64_t)v196);
          uint64_t v131 = SLODWORD(v193[0]);
          int v132 = BYTE4(v193[0]);
          swift_beginAccess();
          if (v132) {
            uint64_t v133 = 0;
          }
          else {
            uint64_t v133 = v131;
          }
          BOOL v15 = __OFADD__(v133, v126);
          uint64_t v134 = v133 + v126;
          if (v15) {
            goto LABEL_197;
          }
          unint64_t v135 = v134 & ~(v134 >> 63);
          if (v135 >> 31) {
            goto LABEL_198;
          }
          LODWORD(v193[0]) = v135;
          BYTE4(v193[0]) = 0;
          swift_retain();
          swift_setAtWritableKeyPath();
          swift_release();
          memcpy(v195, v197, sizeof(v195));
          swift_retain();
          int v136 = v188;
          char v137 = swift_isUniquelyReferenced_nonNull_native();
          char v194 = (void *)*v136;
          uint64_t v138 = v194;
          *int v136 = 0x8000000000000000;
          unint64_t v140 = sub_25ACA7F54(v119);
          uint64_t v141 = v138[2];
          BOOL v142 = (v139 & 1) == 0;
          uint64_t v143 = v141 + v142;
          if (__OFADD__(v141, v142)) {
            goto LABEL_199;
          }
          char v144 = v139;
          if (v138[3] >= v143)
          {
            if ((v137 & 1) == 0) {
              sub_25ACA9BC0();
            }
          }
          else
          {
            sub_25ACA82D4(v143, v137);
            unint64_t v145 = sub_25ACA7F54(v119);
            if ((v144 & 1) != (v146 & 1)) {
              goto LABEL_208;
            }
            unint64_t v140 = v145;
          }
          uint64_t v8 = v186;
          unint64_t v192 = v120;
          if (v144)
          {
            uint64_t v147 = v194;
            char v148 = (void *)(v194[7] + 296 * v140);
            memcpy(v193, v148, sizeof(v193));
            sub_25ACAA5D8((uint64_t)v193);
            memcpy(v148, v195, 0x128uLL);
          }
          else
          {
            uint64_t v147 = v194;
            v194[(v140 >> 6) + 8] |= 1 << v140;
            *(void *)(v147[6] + 8 * v140) = v119;
            memcpy((void *)(v147[7] + 296 * v140), v195, 0x128uLL);
            uint64_t v149 = v147[2];
            BOOL v15 = __OFADD__(v149, 1);
            uint64_t v150 = v149 + 1;
            if (v15) {
              goto LABEL_201;
            }
            v147[2] = v150;
            swift_retain();
          }
          uint64_t v10 = v187;
          *char v188 = (uint64_t)v147;
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v151 = sub_25ACD5250();
          if (v151) {
            break;
          }
          uint64_t v152 = v119;
          swift_release();
          uint64_t v119 = sub_25ACD5250();
          unint64_t v120 = v152;
          if (!v119)
          {
            uint64_t v106 = v173;
            unint64_t v117 = v176;
            goto LABEL_169;
          }
        }
        uint64_t v153 = v151;
        swift_retain();
        unint64_t v154 = v190;
        char v155 = swift_isUniquelyReferenced_nonNull_native();
        v193[0] = v154;
        unint64_t v157 = sub_25ACA7F54(v153);
        uint64_t v158 = *(void *)(v154 + 16);
        BOOL v159 = (v156 & 1) == 0;
        uint64_t v160 = v158 + v159;
        if (__OFADD__(v158, v159)) {
          goto LABEL_204;
        }
        char v161 = v156;
        if (*(void *)(v154 + 24) >= v160)
        {
          if ((v155 & 1) == 0) {
            sub_25ACA9DB4();
          }
        }
        else
        {
          sub_25ACA8C48(v160, v155);
          unint64_t v162 = sub_25ACA7F54(v153);
          if ((v161 & 1) != (v163 & 1)) {
            goto LABEL_208;
          }
          unint64_t v157 = v162;
        }
        uint64_t v5 = v183;
        char v164 = (void *)v193[0];
        unint64_t v190 = v193[0];
        if (v161)
        {
          *(void *)(*(void *)(v193[0] + 56) + 8 * v157) = v125;
        }
        else
        {
          *(void *)(v193[0] + 8 * (v157 >> 6) + 64) |= 1 << v157;
          uint64_t v165 = 8 * v157;
          *(void *)(v164[6] + v165) = v153;
          *(void *)(v164[7] + v165) = v125;
          uint64_t v166 = v164[2];
          BOOL v15 = __OFADD__(v166, 1);
          uint64_t v167 = v166 + 1;
          if (v15) {
            goto LABEL_205;
          }
          v164[2] = v167;
          swift_retain();
        }
        uint64_t v8 = v186;
        uint64_t v10 = v187;
        swift_release();
        swift_release_n();
        swift_bridgeObjectRelease();
        uint64_t v118 = sub_25ACD5250();
        uint64_t v106 = v173;
        unint64_t v117 = v176;
      }
      while (v118);
LABEL_169:
      swift_release();
      swift_release();
      unint64_t v107 = v174;
      uint64_t v108 = v175;
      uint64_t v38 = v180;
LABEL_160:
      swift_bridgeObjectRelease();
      if (v117 == v108) {
        return swift_bridgeObjectRelease();
      }
      if (v107)
      {
        uint64_t v177 = MEMORY[0x261153D20](v117, v106);
        goto LABEL_165;
      }
      if (v117 >= *(void *)(v172 + 16)) {
        goto LABEL_202;
      }
      uint64_t v177 = *(void *)(v171 + 8 * v117);
      swift_retain();
LABEL_165:
      BOOL v15 = __OFADD__(v117, 1);
      uint64_t v40 = v117 + 1;
      if (v15) {
        goto LABEL_200;
      }
      if (!*(void *)(v178 + 16)) {
        goto LABEL_192;
      }
      uint64_t v168 = swift_retain();
      unint64_t v36 = sub_25ACA7F54(v168);
      uint64_t v39 = MEMORY[0x263F8EE78];
      if ((v169 & 1) == 0)
      {
LABEL_174:
        swift_bridgeObjectRelease();
        swift_release();
        return swift_release();
      }
    }
    swift_bridgeObjectRetain();
    unint64_t v44 = sub_25ACD5EE0();
    swift_bridgeObjectRelease();
    char v45 = v182;
    if (!v44) {
      goto LABEL_110;
    }
LABEL_47:
    unint64_t v192 = v191 & 0xC000000000000001;
    unint64_t v184 = v191 + 32;
    unint64_t v185 = v191 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      BOOL v15 = __OFSUB__(v44--, 1);
      if (v15) {
        goto LABEL_177;
      }
      if (v192)
      {
        uint64_t v47 = MEMORY[0x261153D20](v44, v191);
      }
      else
      {
        if ((v44 & 0x8000000000000000) != 0) {
          goto LABEL_178;
        }
        if (v44 >= *(void *)(v185 + 16)) {
          goto LABEL_179;
        }
        uint64_t v47 = *(void *)(v184 + 8 * v44);
        swift_retain();
      }
      sub_25ACADD3C();
      swift_retain();
      sub_25ACD5540();
      char v48 = sub_25ACD5520();
      (*v38)(v8, v10, v5);
      if ((v48 & 1) == 0)
      {
        swift_release();
        int v46 = *v45;
        (*v45)(v8, v5);
LABEL_49:
        v46(v10, v5);
        goto LABEL_50;
      }
      int v49 = sub_25ACD5450();
      int v46 = *v45;
      (*v45)(v8, v5);
      if (((v189 ^ v49) & 1) == 0)
      {
        swift_release();
        goto LABEL_49;
      }
      unint64_t v50 = v190;
      if (*(void *)(v190 + 16))
      {
        uint64_t v51 = swift_retain();
        unint64_t v52 = sub_25ACA7F54(v51);
        if (v53) {
          uint64_t v54 = *(void *)(*(void *)(v50 + 56) + 8 * v52);
        }
        else {
          uint64_t v54 = 0;
        }
        swift_release();
      }
      else
      {
        uint64_t v54 = 0;
      }
      uint64_t v55 = v54 + 1;
      if (__OFADD__(v54, 1)) {
        goto LABEL_180;
      }
      uint64_t v56 = v55 * v181;
      if ((unsigned __int128)(v55 * (__int128)v181) >> 64 != (v55 * v181) >> 63) {
        goto LABEL_181;
      }
      uint64_t v57 = *v188;
      if (*(void *)(*v188 + 16)) {
        break;
      }
LABEL_88:
      uint64_t v179 = sub_25ACD56A0();
      uint64_t v81 = sub_25ACD5250();
      if (!v81)
      {
        char v45 = v182;
        v46(v10, v5);
        swift_release();
        uint64_t v38 = v180;
        goto LABEL_50;
      }
      uint64_t v82 = v81;
      char v83 = (void *)v190;
      if (*(void *)(v190 + 16))
      {
        uint64_t v84 = swift_retain();
        unint64_t v85 = sub_25ACA7F54(v84);
        if (v86)
        {
          uint64_t v87 = *(void *)(v83[7] + 8 * v85);
          swift_release();
          if (v56 < 0) {
            goto LABEL_96;
          }
          goto LABEL_97;
        }
        swift_release();
      }
      uint64_t v87 = 0;
      if (v56 < 0)
      {
LABEL_96:
        uint64_t v56 = -v56;
        if (v56 < 0) {
          goto LABEL_182;
        }
      }
LABEL_97:
      uint64_t v88 = v87 + v56;
      if (__OFADD__(v87, v56)) {
        goto LABEL_183;
      }
      swift_retain();
      char v89 = swift_isUniquelyReferenced_nonNull_native();
      v197[0] = v83;
      unint64_t v91 = sub_25ACA7F54(v82);
      uint64_t v92 = v83[2];
      BOOL v93 = (v90 & 1) == 0;
      uint64_t v94 = v92 + v93;
      if (__OFADD__(v92, v93)) {
        goto LABEL_184;
      }
      char v95 = v90;
      if (v83[3] >= v94)
      {
        if ((v89 & 1) == 0) {
          sub_25ACA9DB4();
        }
      }
      else
      {
        sub_25ACA8C48(v94, v89);
        unint64_t v96 = sub_25ACA7F54(v82);
        if ((v95 & 1) != (v97 & 1)) {
          goto LABEL_206;
        }
        unint64_t v91 = v96;
      }
      uint64_t v38 = v180;
      v98 = (void *)v197[0];
      unint64_t v190 = v197[0];
      if (v95)
      {
        *(void *)(*(void *)(v197[0] + 56) + 8 * v91) = v88;
      }
      else
      {
        *(void *)(v197[0] + 8 * (v91 >> 6) + 64) |= 1 << v91;
        uint64_t v99 = 8 * v91;
        *(void *)(v98[6] + v99) = v82;
        *(void *)(v98[7] + v99) = v88;
        uint64_t v100 = v98[2];
        BOOL v15 = __OFADD__(v100, 1);
        uint64_t v101 = v100 + 1;
        if (v15) {
          goto LABEL_189;
        }
        v98[2] = v101;
        swift_retain();
      }
      swift_release();
      swift_release_n();
      swift_bridgeObjectRelease();
      uint64_t v10 = v187;
      char v45 = v182;
      uint64_t v5 = v183;
      v46(v187, v183);
      uint64_t v8 = v186;
LABEL_50:
      if (!v44) {
        goto LABEL_110;
      }
    }
    uint64_t v58 = swift_retain();
    unint64_t v59 = sub_25ACA7F54(v58);
    if ((v60 & 1) == 0)
    {
      swift_release();
      goto LABEL_88;
    }
    memcpy(v196, (const void *)(*(void *)(v57 + 56) + 296 * v59), sizeof(v196));
    sub_25ACADD94((uint64_t)v196);
    swift_release();
    memcpy(v197, v196, sizeof(v197));
    sub_25ACADD94((uint64_t)v196);
    sub_25ACC9278();
    swift_beginAccess();
    memcpy(v195, v196, sizeof(v195));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_25ACAA5D8((uint64_t)v196);
    uint64_t v61 = SLODWORD(v193[0]);
    int v62 = BYTE4(v193[0]);
    swift_beginAccess();
    if (v62) {
      uint64_t v63 = 0;
    }
    else {
      uint64_t v63 = v61;
    }
    BOOL v15 = __OFADD__(v63, v56);
    uint64_t v64 = v63 + v56;
    if (v15) {
      goto LABEL_186;
    }
    unint64_t v65 = v64 & ~(v64 >> 63);
    if (v65 >> 31) {
      goto LABEL_187;
    }
    LODWORD(v195[0]) = v65;
    BYTE4(v195[0]) = 0;
    swift_retain();
    swift_setAtWritableKeyPath();
    swift_release();
    memcpy(v195, v197, sizeof(v195));
    swift_retain();
    uint64_t v66 = v188;
    char v67 = swift_isUniquelyReferenced_nonNull_native();
    char v194 = (void *)*v66;
    uint64_t v68 = v194;
    *uint64_t v66 = 0x8000000000000000;
    unint64_t v70 = sub_25ACA7F54(v47);
    uint64_t v71 = v68[2];
    BOOL v72 = (v69 & 1) == 0;
    uint64_t v73 = v71 + v72;
    if (__OFADD__(v71, v72)) {
      goto LABEL_188;
    }
    char v74 = v69;
    if (v68[3] < v73)
    {
      sub_25ACA82D4(v73, v67);
      unint64_t v75 = sub_25ACA7F54(v47);
      if ((v74 & 1) != (v76 & 1)) {
        goto LABEL_207;
      }
      unint64_t v70 = v75;
      uint64_t v8 = v186;
      if ((v74 & 1) == 0) {
        goto LABEL_85;
      }
LABEL_83:
      int v77 = v194;
      char v78 = (void *)(v194[7] + 296 * v70);
      memcpy(v193, v78, sizeof(v193));
      sub_25ACAA5D8((uint64_t)v193);
      memcpy(v78, v195, 0x128uLL);
LABEL_87:
      *char v188 = (uint64_t)v77;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v10 = v187;
      goto LABEL_88;
    }
    if (v67)
    {
      uint64_t v8 = v186;
      if (v69) {
        goto LABEL_83;
      }
    }
    else
    {
      sub_25ACA9BC0();
      uint64_t v8 = v186;
      if (v74) {
        goto LABEL_83;
      }
    }
LABEL_85:
    int v77 = v194;
    v194[(v70 >> 6) + 8] |= 1 << v70;
    *(void *)(v77[6] + 8 * v70) = v47;
    memcpy((void *)(v77[7] + 296 * v70), v195, 0x128uLL);
    uint64_t v79 = v77[2];
    BOOL v15 = __OFADD__(v79, 1);
    uint64_t v80 = v79 + 1;
    if (v15) {
      goto LABEL_191;
    }
    v77[2] = v80;
    swift_retain();
    goto LABEL_87;
  }
  unint64_t v13 = 0;
  unint64_t v184 = a3;
  unint64_t v185 = a3 & 0xC000000000000001;
  char v180 = (void (**)(char *, char *, uint64_t))(a3 + 32);
  uint64_t v181 = a3 & 0xFFFFFFFFFFFFFF8;
  char v182 = (void (**)(char *, uint64_t))v12;
LABEL_6:
  if (v185)
  {
    uint64_t v14 = MEMORY[0x261153D20](v13, a3);
    BOOL v15 = __OFADD__(v13, 1);
    unint64_t v16 = v13 + 1;
    if (v15) {
      goto LABEL_185;
    }
  }
  else
  {
    if (v13 >= *(void *)(v181 + 16)) {
      goto LABEL_190;
    }
    uint64_t v14 = (uint64_t)v180[v13];
    swift_retain();
    BOOL v15 = __OFADD__(v13, 1);
    unint64_t v16 = v13 + 1;
    if (v15) {
      goto LABEL_185;
    }
  }
  unint64_t v190 = v16;
  sub_25ACD56A0();
  swift_retain();
  uint64_t v17 = sub_25ACD5250();
  if (!v17) {
    goto LABEL_5;
  }
  uint64_t v18 = v17;
  unint64_t v19 = v14;
  unint64_t v191 = v14;
  while (1)
  {
    uint64_t v20 = v197[0];
    unint64_t v192 = v19;
    if (v197[0] >> 62) {
      break;
    }
    uint64_t v21 = *(void *)((v197[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v21) {
      goto LABEL_16;
    }
LABEL_24:
    swift_bridgeObjectRelease_n();
    if (!*(void *)(v189 + 16)
      || (uint64_t v27 = swift_retain(), sub_25ACA7F54(v27), v29 = v28, swift_release(), (v29 & 1) == 0))
    {
      uint64_t v31 = swift_retain();
      MEMORY[0x261153B30](v31);
      if (*(void *)((v197[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v197[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25ACD5C30();
      }
      sub_25ACD5C40();
      sub_25ACD5C20();
      swift_release();
LABEL_5:
      swift_release();
      swift_release();
      uint64_t v8 = v186;
      uint64_t v10 = v187;
      uint64_t v5 = v183;
      a3 = v184;
      unint64_t v13 = v190;
      if ((void (**)(char *, uint64_t))v190 == v182)
      {
        swift_bridgeObjectRelease();
        uint64_t v32 = v197[0];
        if (!(v197[0] >> 62)) {
          goto LABEL_35;
        }
LABEL_171:
        swift_bridgeObjectRetain();
        uint64_t v33 = sub_25ACD5EE0();
        swift_bridgeObjectRelease();
        if (!v33) {
          return swift_bridgeObjectRelease();
        }
        goto LABEL_36;
      }
      goto LABEL_6;
    }
    uint64_t v30 = v18;
    swift_release();
    uint64_t v18 = sub_25ACD5250();
    unint64_t v19 = v30;
    if (!v18) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_25ACD5EE0();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_24;
  }
LABEL_16:
  uint64_t v22 = 4;
  while (1)
  {
    uint64_t v23 = v22 - 4;
    if ((v20 & 0xC000000000000001) == 0) {
      break;
    }
    uint64_t v24 = MEMORY[0x261153D20](v22 - 4, v20);
    uint64_t v25 = v22 - 3;
    if (__OFADD__(v23, 1)) {
      goto LABEL_176;
    }
LABEL_22:
    v196[0] = v24;
    v195[0] = v18;
    sub_25ACADF2C(&qword_26A4B27E0, MEMORY[0x263F16580]);
    char v26 = sub_25ACD5B30();
    swift_release();
    if (v26)
    {
      swift_bridgeObjectRelease_n();
      swift_release();
      goto LABEL_5;
    }
    ++v22;
    if (v25 == v21) {
      goto LABEL_24;
    }
  }
  uint64_t v24 = *(void *)(v20 + 8 * v22);
  swift_retain();
  uint64_t v25 = v22 - 3;
  if (!__OFADD__(v23, 1)) {
    goto LABEL_22;
  }
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
LABEL_181:
  __break(1u);
LABEL_182:
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  swift_bridgeObjectRelease();
  return swift_release();
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

unint64_t sub_25ACADD3C()
{
  unint64_t result = qword_26A4B2780;
  if (!qword_26A4B2780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2780);
  }
  return result;
}

uint64_t sub_25ACADD94(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACADE28(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_25ACADE88()
{
  unint64_t result = qword_26A4B27F8;
  if (!qword_26A4B27F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B27F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B27F8);
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

uint64_t sub_25ACADF2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t RealityKitHierarchyExporter.deinit()
{
  return v0;
}

uint64_t RealityKitHierarchyExporter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25ACADF8C()
{
  return swift_allocObject();
}

uint64_t sub_25ACADF9C()
{
  return v0;
}

uint64_t static RealityKitHierarchyExporter.exportDebugRepresentation(for:)(void *a1)
{
  uint64_t v2 = sub_25ACD53D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5400();
  sub_25ACD53E0();
  swift_release();
  sub_25ACAE438();
  uint64_t v6 = sub_25ACD5C80();
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_25ACD5E50();
    sub_25ACD5C70();
    if (v8 < 0)
    {
      __break(1u);
      goto LABEL_12;
    }
    uint64_t v14 = a1;
    do
    {
      uint64_t v9 = (void (*)(void *, void))sub_25ACD5CC0();
      swift_retain();
      v9(v15, 0);
      sub_25ACD5E30();
      sub_25ACD5E60();
      sub_25ACD5E70();
      sub_25ACD5E40();
      sub_25ACD5CB0();
      --v8;
    }
    while (v8);
    uint64_t v10 = v16;
    a1 = v14;
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  a1 = (void *)sub_25ACAE1FC(v10, a1);
  swift_bridgeObjectRelease();
  v15[0] = v7;
  if (a1)
  {
    id v11 = a1;
    MEMORY[0x261153B30]();
    if (*(void *)((v15[0] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v15[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_9:
      sub_25ACD5C40();
      sub_25ACD5C20();
      uint64_t v7 = v15[0];
      goto LABEL_10;
    }
LABEL_12:
    sub_25ACD5C30();
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

uint64_t sub_25ACAE1FC(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25ACD5210();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v25 - v9;
  sub_25ACD5200();
  type metadata accessor for SceneDebugRepresentationProvider();
  sub_25ACB34A8();
  uint64_t v11 = sub_25ACBBFB0(a1, a2);
  unint64_t v13 = v12;
  uint64_t v14 = swift_release();
  if (v13 >> 60 == 15) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v11;
  }
  if (v13 >> 60 == 15) {
    unint64_t v16 = 0xC000000000000000;
  }
  else {
    unint64_t v16 = v13;
  }
  v25[2] = v16;
  v25[3] = v15;
  nullsub_1(v14);
  uint64_t v17 = sub_25ACC0AEC(a1, a2);
  if (v18 >> 60 == 15) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v17;
  }
  v25[1] = v19;
  type metadata accessor for InspectorSceneStatisticsProvider();
  uint64_t v20 = sub_25ACADF8C();
  (*(void (**)(uint64_t, void *))(*(void *)v20 + 80))(a1, a2);
  uint64_t v21 = swift_release();
  nullsub_1(v21);
  sub_25ACB1FE0(a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v22 = objc_allocWithZone((Class)sub_25ACD56F0());
  uint64_t v23 = sub_25ACD56E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v23;
}

unint64_t sub_25ACAE438()
{
  unint64_t result = qword_26A4B2818;
  if (!qword_26A4B2818)
  {
    sub_25ACD53D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2818);
  }
  return result;
}

uint64_t type metadata accessor for RealityKitHierarchyExporter()
{
  return self;
}

uint64_t method lookup function for RealityKitHierarchyExporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RealityKitHierarchyExporter);
}

uint64_t sub_25ACAE4CC()
{
  sub_25ACD5650();

  return sub_25ACD5A10();
}

BOOL sub_25ACAE504()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2820);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5650();
  sub_25ACD5A10();
  uint64_t v3 = sub_25ACD5A30();
  BOOL v4 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3) != 1;
  sub_25ACAEEE0((uint64_t)v2, &qword_26A4B2820);
  return v4;
}

uint64_t sub_25ACAE5D8()
{
  uint64_t v0 = sub_25ACD5240();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5410();
  sub_25ACD5230();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_25ACD5B60();
  REEntitySetName();
  return swift_release();
}

uint64_t (*sub_25ACAE6EC())()
{
  uint64_t v1 = sub_25ACD5620();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  BOOL v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_25ACD5240();
  uint64_t v5 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2828);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2820);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5650();
  sub_25ACD5A10();
  uint64_t v14 = sub_25ACD5A30();
  int v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14);
  sub_25ACAEEE0((uint64_t)v13, &qword_26A4B2820);
  unint64_t v16 = nullsub_1;
  if (v15 != 1) {
    return (uint64_t (*)())v16;
  }
  uint64_t v48 = v2;
  uint64_t v17 = sub_25ACD5650();
  uint64_t v46 = v18;
  uint64_t v47 = v17;
  uint64_t v49 = v0;
  v51[0] = sub_25ACD5650();
  v51[1] = v19;
  uint64_t v52 = 58;
  unint64_t v53 = 0xE100000000000000;
  uint64_t v20 = sub_25ACD5220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
  sub_25ACAEE8C();
  sub_25ACD5D50();
  char v22 = v21;
  sub_25ACAEEE0((uint64_t)v10, &qword_26A4B2828);
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25ACD5BC0();
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    MEMORY[0x261153AA0](v23, v25, v27, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_25ACD5640();
  sub_25ACD59F0();
  swift_bridgeObjectRelease();
  sub_25ACD5410();
  sub_25ACD5230();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v50);
  sub_25ACD5B60();
  REEntitySetName();
  swift_bridgeObjectRelease();
  swift_release();
  sub_25ACD56A0();
  sub_25ACD5260();
  sub_25ACAEF3C();
  uint64_t v30 = sub_25ACD5C80();
  uint64_t v31 = MEMORY[0x263F8EE78];
  if (!v30)
  {
LABEL_13:
    (*(void (**)(char *, uint64_t))(v48 + 8))(v4, v1);
    uint64_t v43 = swift_allocObject();
    swift_weakInit();
    unint64_t v44 = (void *)swift_allocObject();
    uint64_t v45 = v47;
    v44[2] = v43;
    v44[3] = v45;
    v44[4] = v46;
    v44[5] = v31;
    return sub_25ACAF874;
  }
  uint64_t v32 = v30;
  uint64_t v52 = MEMORY[0x263F8EE78];
  sub_25ACAF774(0, v30 & ~(v30 >> 63), 0);
  unint64_t result = (uint64_t (*)())sub_25ACD5C70();
  if ((v32 & 0x8000000000000000) == 0)
  {
    do
    {
      uint64_t v34 = (uint64_t (*)(void *, void))sub_25ACD5CC0();
      swift_retain();
      uint64_t v35 = v34(v51, 0);
      uint64_t v36 = sub_25ACAE6EC(v35);
      uint64_t v38 = v37;
      uint64_t v39 = swift_allocObject();
      *(void *)(v39 + 16) = v36;
      *(void *)(v39 + 24) = v38;
      swift_release();
      uint64_t v31 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25ACAF774(0, *(void *)(v31 + 16) + 1, 1);
        uint64_t v31 = v52;
      }
      unint64_t v41 = *(void *)(v31 + 16);
      unint64_t v40 = *(void *)(v31 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_25ACAF774((void *)(v40 > 1), v41 + 1, 1);
        uint64_t v31 = v52;
      }
      *(void *)(v31 + 16) = v41 + 1;
      unint64_t v42 = v31 + 16 * v41;
      *(void *)(v42 + 32) = sub_25ACAF7CC;
      *(void *)(v42 + 40) = v39;
      sub_25ACD5CB0();
      --v32;
    }
    while (v32);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACAECF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2828);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[2] = a1;
  v18[3] = a2;
  v18[0] = 58;
  v18[1] = 0xE100000000000000;
  uint64_t v7 = sub_25ACD5220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_25ACAEE8C();
  sub_25ACD5D50();
  char v9 = v8;
  sub_25ACAEEE0((uint64_t)v6, &qword_26A4B2828);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = sub_25ACD5BC0();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    a1 = MEMORY[0x261153AA0](v10, v12, v14, v16);
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t sub_25ACAEE8C()
{
  unint64_t result = qword_26A4B2830;
  if (!qword_26A4B2830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2830);
  }
  return result;
}

uint64_t sub_25ACAEEE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25ACAEF3C()
{
  unint64_t result = qword_26A4B2808;
  if (!qword_26A4B2808)
  {
    sub_25ACD5620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2808);
  }
  return result;
}

uint64_t sub_25ACAEF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_25ACD5240();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25ACD5410();
    sub_25ACD5230();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_25ACD5B60();
    REEntitySetName();
    swift_release();
    uint64_t result = swift_release();
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = a4 + 40;
    do
    {
      uint64_t v12 = *(void (**)(uint64_t))(v11 - 8);
      uint64_t v13 = swift_retain();
      v12(v13);
      swift_release();
      v11 += 16;
      --v10;
    }
    while (v10);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall Entity.removePersistentIDFromName(recursive:)(Swift::Bool recursive)
{
  BOOL v13 = recursive;
  uint64_t v1 = sub_25ACD5620();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2800);
  uint64_t v12 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25ACD5240();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5650();
  sub_25ACD5A00();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_25ACD5410();
    sub_25ACD5230();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_25ACD5B60();
    REEntitySetName();
    swift_bridgeObjectRelease();
    swift_release();
  }
  if (v13)
  {
    sub_25ACD56A0();
    sub_25ACD5260();
    sub_25ACD5600();
    while (1)
    {
      sub_25ACD5610();
      if (!v14) {
        break;
      }
      Entity.removePersistentIDFromName(recursive:)(1);
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v2);
  }
}

uint64_t Entity.augmentedWithPersistentIDs(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = sub_25ACAE6EC();
  uint64_t v4 = a1(v1);
  ((void (*)(uint64_t))v3)(v4);
  return swift_release();
}

uint64_t Entity.augmentedWithPersistentIDs<A>(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = sub_25ACAE6EC();
  uint64_t v4 = a1(v1);
  ((void (*)(uint64_t))v3)(v4);
  return swift_release();
}

uint64_t sub_25ACAF4B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2838);
  if (sub_25ACD5B50() == 0xD000000000000014 && v0 == 0x800000025ACD79F0)
  {
    swift_bridgeObjectRelease();
    char v1 = 1;
  }
  else
  {
    char v1 = sub_25ACD5F80();
    swift_bridgeObjectRelease();
  }
  return v1 & 1;
}

uint64_t sub_25ACAF584()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2838);
  sub_25ACD5B50();
  sub_25ACAF880();
  sub_25ACAF8D4();
  char v0 = sub_25ACD5B20();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_25ACAF650(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2828);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[2] = a1;
  v11[3] = a2;
  v11[0] = 58;
  v11[1] = 0xE100000000000000;
  uint64_t v7 = sub_25ACD5220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_25ACAEE8C();
  sub_25ACD5D50();
  uint64_t v9 = v8 & 1;
  sub_25ACAEEE0((uint64_t)v6, &qword_26A4B2828);
  swift_bridgeObjectRelease();
  return v9;
}

void *sub_25ACAF774(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_25ACAF928(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25ACAF794()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25ACAF7CC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25ACAF7F4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25ACAF82C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25ACAF874()
{
  return sub_25ACAEF94(v0[2], v0[3], v0[4], v0[5]);
}

unint64_t sub_25ACAF880()
{
  unint64_t result = qword_26A4B2840;
  if (!qword_26A4B2840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2840);
  }
  return result;
}

unint64_t sub_25ACAF8D4()
{
  unint64_t result = qword_26A4B2848;
  if (!qword_26A4B2848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2848);
  }
  return result;
}

void *sub_25ACAF928(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2850);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2858);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_25ACAFA4C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACAFA84(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25ACAFACC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25ACAFB20()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACAFB58(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25ACAFBA0())()
{
  return j__swift_endAccess;
}

uint64_t sub_25ACAFBF8()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25ACAFC04(unint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v2 + 16) = sub_25ACAFD70(MEMORY[0x263F8EE78]);
  *(void *)(v2 + 24) = sub_25ACAFD70(v3);
  swift_beginAccess();
  swift_beginAccess();
  sub_25ACA5B0C(a1, (uint64_t *)(v2 + 16), (uint64_t *)(v2 + 24));
  swift_endAccess();
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25ACAFCC4(unint64_t a1)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = sub_25ACAFD70(MEMORY[0x263F8EE78]);
  *(void *)(v1 + 24) = sub_25ACAFD70(v3);
  swift_beginAccess();
  swift_beginAccess();
  sub_25ACA5B0C(a1, (uint64_t *)(v1 + 16), (uint64_t *)(v1 + 24));
  swift_endAccess();
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_25ACAFD70(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27C8);
  uint64_t v2 = (void *)sub_25ACD5F10();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_retain();
  memcpy(__dst, (const void *)(a1 + 32), 0x130uLL);
  uint64_t v4 = __dst[0];
  sub_25ACB1D88((uint64_t)__dst);
  unint64_t v5 = sub_25ACA7F54(v4);
  if (v6)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    swift_release();
    goto LABEL_11;
  }
  uint64_t v7 = 336;
  while (1)
  {
    *(void *)((char *)v2 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v5;
    *(void *)(v2[6] + 8 * v5) = v4;
    unint64_t result = memcpy((void *)(v2[7] + 296 * v5), &__dst[1], 0x128uLL);
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    v2[2] = v11;
    if (!--v3) {
      goto LABEL_9;
    }
    memcpy(__dst, (const void *)(a1 + v7), 0x130uLL);
    uint64_t v4 = __dst[0];
    sub_25ACB1D88((uint64_t)__dst);
    unint64_t v5 = sub_25ACA7F54(v4);
    v7 += 304;
    if (v12) {
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACAFED8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v6 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 96);
  uint64_t v7 = swift_retain();
  unint64_t v85 = v6;
  uint64_t v8 = v6(v7);
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_25ACA7F54(a1), (v10 & 1) != 0))
  {
    memcpy(__dst, (const void *)(*(void *)(v8 + 56) + 296 * v9), sizeof(__dst));
    sub_25ACADD94((uint64_t)__dst);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v11 = memcpy(__src, __dst, sizeof(__src));
    unint64_t v12 = sub_25ACBF84C(v11);
    if (a2 >> 62) {
      goto LABEL_40;
    }
    uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (v13)
    {
      if (v12 >> 62)
      {
LABEL_42:
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_25ACD5EE0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      unint64_t v15 = 0;
      unint64_t v90 = a2;
      unint64_t v92 = a2 & 0xC000000000000001;
      unint64_t v80 = a2 + 32;
      uint64_t v82 = a2 & 0xFFFFFFFFFFFFFF8;
      uint64_t v88 = v13;
      while (1)
      {
        if (v92)
        {
          uint64_t v46 = MEMORY[0x261153D20](v15, a2);
          BOOL v47 = __OFADD__(v15++, 1);
          if (v47) {
            break;
          }
          goto LABEL_17;
        }
        if (v15 >= *(void *)(v82 + 16)) {
          goto LABEL_39;
        }
        uint64_t v46 = *(void *)(v80 + 8 * v15);
        swift_retain();
        BOOL v47 = __OFADD__(v15++, 1);
        if (v47) {
          break;
        }
LABEL_17:
        if (v14)
        {
          sub_25ACD56A0();
          swift_bridgeObjectRetain();
          a2 = 4;
          while (1)
          {
            unint64_t v48 = a2 - 4;
            if ((v12 & 0xC000000000000001) != 0)
            {
              uint64_t v49 = MEMORY[0x261153D20](a2 - 4, v12);
              unint64_t v50 = a2 - 3;
              if (__OFADD__(v48, 1)) {
                goto LABEL_37;
              }
            }
            else
            {
              uint64_t v49 = *(void *)(v12 + 8 * a2);
              swift_retain();
              unint64_t v50 = a2 - 3;
              if (__OFADD__(v48, 1))
              {
LABEL_37:
                __break(1u);
                goto LABEL_38;
              }
            }
            v94[0] = v49;
            uint64_t v95 = v46;
            sub_25ACB1BA0(&qword_26A4B27E0);
            char v51 = sub_25ACD5B30();
            swift_release();
            if (v51) {
              break;
            }
            ++a2;
            if (v50 == v14)
            {
              swift_release();
              swift_bridgeObjectRelease();
              a2 = v90;
              goto LABEL_34;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v52 = swift_retain();
          uint64_t v53 = v85(v52);
          a2 = v90;
          if (*(void *)(v53 + 16))
          {
            unint64_t v54 = sub_25ACA7F54(v46);
            if (v55)
            {
              memcpy(v121, (const void *)(*(void *)(v53 + 56) + 296 * v54), sizeof(v121));
              sub_25ACADD94((uint64_t)v121);
              swift_release();
              swift_bridgeObjectRelease();
              memcpy(v122, __src, 0x128uLL);
              sub_25ACC5ED4((unint64_t)v121, (uint64_t)v120);
              sub_25ACAA5D8((uint64_t)v121);
              sub_25ACAA5D8((uint64_t)v122);
              memcpy(__src, v120, sizeof(__src));
              sub_25ACC667C();
              swift_beginAccess();
              swift_retain();
              uint64_t v57 = (void (*)(uint64_t *, void))swift_modifyAtWritableKeyPath();
              uint64_t v13 = v88;
              if (*(unsigned char *)(v56 + 4))
              {
LABEL_9:
                v57(v94, 0);
                swift_release();
                goto LABEL_10;
              }
              if (!__OFSUB__(*(_DWORD *)v56, 1))
              {
                --*(_DWORD *)v56;
                goto LABEL_9;
              }
              __break(1u);
              goto LABEL_42;
            }
          }
          swift_bridgeObjectRelease();
          swift_release_n();
LABEL_34:
          uint64_t v13 = v88;
          if (v15 == v88) {
            goto LABEL_35;
          }
        }
        else
        {
LABEL_10:
          swift_release();
          if (v15 == v13) {
            goto LABEL_35;
          }
        }
      }
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_25ACD5EE0();
    }
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = BYTE4(__src[0]);
    char v41 = BYTE4(__src[1]);
    int v70 = __src[1];
    int v71 = __src[2];
    char v42 = BYTE4(__src[2]);
    int v66 = __src[3];
    int v67 = __src[0];
    char v43 = BYTE4(__src[3]);
    char v44 = BYTE4(__src[4]);
    char v29 = BYTE4(__src[6]);
    int v65 = __src[7];
    char v28 = BYTE4(__src[7]);
    int v62 = __src[8];
    int v63 = __src[4];
    char v27 = BYTE4(__src[8]);
    uint64_t v59 = __src[5];
    uint64_t v60 = __src[9];
    char v26 = __src[10];
    long long v25 = *(_OWORD *)&__src[11];
    int v68 = __src[6];
    int v69 = __src[13];
    char v36 = BYTE4(__src[13]);
    int v64 = __src[14];
    char v37 = BYTE4(__src[14]);
    int v61 = __src[15];
    char v38 = BYTE4(__src[15]);
    uint64_t v39 = __src[16];
    char v40 = __src[17];
    int v89 = __src[18];
    char v31 = BYTE4(__src[32]);
    char v30 = __src[35];
    int v77 = __src[19];
    char v78 = BYTE4(__src[18]);
    char v20 = BYTE4(__src[19]);
    char v21 = BYTE4(__src[20]);
    int v75 = __src[21];
    int v76 = __src[20];
    char v22 = BYTE4(__src[21]);
    int v74 = __src[22];
    char v23 = BYTE4(__src[22]);
    uint64_t v73 = __src[23];
    int v72 = __src[24];
    char v24 = BYTE4(__src[24]);
    int v32 = __src[25];
    char v33 = BYTE4(__src[25]);
    int v34 = __src[26];
    char v35 = BYTE4(__src[26]);
    uint64_t v81 = __src[27];
    int v87 = __src[28];
    char v58 = BYTE4(__src[28]);
    int v86 = __src[29];
    char v18 = BYTE4(__src[29]);
    int v84 = __src[30];
    char v19 = BYTE4(__src[30]);
    uint64_t v83 = __src[31];
    int v93 = __src[32];
    uint64_t v91 = __src[34];
    uint64_t v16 = __src[33];
    uint64_t v17 = __src[36];
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACC1D88((uint64_t)v122);
    int v93 = v122[32];
    v121[0] = BYTE4(v122[32]);
    uint64_t v16 = v122[33];
    uint64_t v91 = v122[34];
    v120[0] = v122[35];
    uint64_t v17 = v122[36];
    int v87 = v122[28];
    char v58 = BYTE4(v122[28]);
    int v86 = v122[29];
    char v18 = BYTE4(v122[29]);
    int v84 = v122[30];
    char v19 = BYTE4(v122[30]);
    uint64_t v83 = v122[31];
    uint64_t v81 = v122[27];
    int v89 = v122[18];
    char v78 = BYTE4(v122[18]);
    int v77 = v122[19];
    char v20 = BYTE4(v122[19]);
    int v76 = v122[20];
    char v21 = BYTE4(v122[20]);
    int v75 = v122[21];
    char v22 = BYTE4(v122[21]);
    int v74 = v122[22];
    char v23 = BYTE4(v122[22]);
    uint64_t v73 = v122[23];
    int v72 = v122[24];
    char v24 = BYTE4(v122[24]);
    long long v25 = *(_OWORD *)&v122[11];
    char v26 = v122[10] & 1;
    char v27 = BYTE4(v122[8]) & 1;
    char v28 = BYTE4(v122[7]) & 1;
    char v29 = BYTE4(v122[6]) & 1;
    char v30 = v122[35] & 1;
    char v31 = BYTE4(v122[32]) & 1;
    int v32 = v122[25];
    char v33 = BYTE4(v122[25]);
    int v34 = v122[26];
    char v35 = BYTE4(v122[26]);
    int v69 = v122[13];
    char v36 = BYTE4(v122[13]);
    int v64 = v122[14];
    char v37 = BYTE4(v122[14]);
    int v61 = v122[15];
    char v38 = BYTE4(v122[15]);
    uint64_t v39 = v122[16];
    char v40 = v122[17];
    int v68 = v122[6];
    int v65 = v122[7];
    int v62 = v122[8];
    uint64_t v60 = v122[9];
    int v70 = v122[1];
    char v41 = BYTE4(v122[1]);
    int v71 = v122[2];
    char v42 = BYTE4(v122[2]);
    int v66 = v122[3];
    char v43 = BYTE4(v122[3]);
    int v63 = v122[4];
    char v44 = BYTE4(v122[4]);
    uint64_t v59 = v122[5];
    int v67 = v122[0];
    uint64_t result = BYTE4(v122[0]);
  }
  LOBYTE(__src[0]) = result;
  __dst[0] = v41;
  LOBYTE(v94[0]) = v42;
  LOBYTE(v95) = v43;
  char v118 = v44;
  char v117 = v29;
  char v116 = v28;
  char v115 = v27;
  char v114 = v26;
  char v113 = v36;
  char v112 = v37;
  char v111 = v38;
  char v110 = v40;
  char v109 = v78;
  char v108 = v20;
  char v107 = v21;
  char v106 = v22;
  char v105 = v23;
  char v104 = v24;
  char v103 = v33;
  char v102 = v35;
  char v101 = v58;
  char v100 = v18;
  char v99 = v19;
  char v98 = v31;
  char v97 = v30;
  *(_DWORD *)a3 = v67;
  *(_DWORD *)(a3 + 8) = v70;
  *(unsigned char *)(a3 + 4) = __src[0];
  *(unsigned char *)(a3 + 12) = __dst[0];
  *(_DWORD *)(a3 + 16) = v71;
  *(unsigned char *)(a3 + 20) = v94[0];
  *(_DWORD *)(a3 + 24) = v66;
  *(unsigned char *)(a3 + 28) = v95;
  *(_DWORD *)(a3 + 32) = v63;
  *(unsigned char *)(a3 + 36) = v118;
  *(void *)(a3 + 40) = v59;
  *(_DWORD *)(a3 + 48) = v68;
  *(unsigned char *)(a3 + 52) = v117;
  *(_DWORD *)(a3 + 56) = v65;
  *(unsigned char *)(a3 + 60) = v116;
  *(_DWORD *)(a3 + 64) = v62;
  *(unsigned char *)(a3 + 68) = v115;
  *(void *)(a3 + 72) = v60;
  *(unsigned char *)(a3 + 80) = v114;
  *(_OWORD *)(a3 + 88) = v25;
  *(_DWORD *)(a3 + 104) = v69;
  *(unsigned char *)(a3 + 108) = v113;
  *(_DWORD *)(a3 + 112) = v64;
  *(unsigned char *)(a3 + 116) = v112;
  *(_DWORD *)(a3 + 120) = v61;
  *(unsigned char *)(a3 + 124) = v111;
  *(void *)(a3 + 128) = v39;
  *(unsigned char *)(a3 + 136) = v110;
  *(_DWORD *)(a3 + 144) = v89;
  *(unsigned char *)(a3 + 148) = v109;
  *(_DWORD *)(a3 + 152) = v77;
  *(unsigned char *)(a3 + 156) = v108;
  *(_DWORD *)(a3 + 160) = v76;
  *(unsigned char *)(a3 + 164) = v107;
  *(_DWORD *)(a3 + 168) = v75;
  *(unsigned char *)(a3 + 172) = v106;
  *(_DWORD *)(a3 + 176) = v74;
  *(unsigned char *)(a3 + 180) = v105;
  *(void *)(a3 + 184) = v73;
  *(_DWORD *)(a3 + 192) = v72;
  *(unsigned char *)(a3 + 196) = v104;
  *(_DWORD *)(a3 + 200) = v32;
  *(unsigned char *)(a3 + 204) = v103;
  *(_DWORD *)(a3 + 208) = v34;
  *(unsigned char *)(a3 + 212) = v102;
  *(void *)(a3 + 216) = v81;
  *(_DWORD *)(a3 + 224) = v87;
  *(unsigned char *)(a3 + 228) = v101;
  *(_DWORD *)(a3 + 232) = v86;
  *(unsigned char *)(a3 + 236) = v100;
  *(_DWORD *)(a3 + 240) = v84;
  *(unsigned char *)(a3 + 244) = v99;
  *(void *)(a3 + 248) = v83;
  *(_DWORD *)(a3 + 256) = v93;
  *(unsigned char *)(a3 + 260) = v98;
  *(void *)(a3 + 264) = v16;
  *(void *)(a3 + 272) = v91;
  *(unsigned char *)(a3 + 280) = v97;
  *(void *)(a3 + 288) = v17;
  return result;
}

void *sub_25ACB080C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_25ACB1450(a1, __src);
  return memcpy(a2, __src, 0x128uLL);
}

uint64_t sub_25ACB084C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 120);
  uint64_t v6 = swift_retain();
  uint64_t v7 = v5(v6);
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_25ACA7F54(a1), (v9 & 1) != 0))
  {
    memcpy(__dst, (const void *)(*(void *)(v7 + 56) + 296 * v8), sizeof(__dst));
    sub_25ACADD94((uint64_t)__dst);
    swift_release();
    swift_bridgeObjectRelease();
    int v62 = __dst[32];
    uint64_t v60 = __dst[34];
    uint64_t v61 = __dst[33];
    char v34 = __dst[35];
    char v35 = BYTE4(__dst[32]);
    uint64_t v59 = __dst[36];
    char v49 = BYTE4(__dst[28]);
    int v57 = __dst[29];
    int v58 = __dst[28];
    char v46 = BYTE4(__dst[29]);
    int v56 = __dst[30];
    uint64_t v54 = __dst[27];
    uint64_t v55 = __dst[31];
    char v43 = BYTE4(__dst[18]);
    char v44 = BYTE4(__dst[30]);
    int v52 = __dst[19];
    int v53 = __dst[18];
    char v41 = BYTE4(__dst[20]);
    char v42 = BYTE4(__dst[19]);
    int v50 = __dst[21];
    int v51 = __dst[20];
    int v48 = __dst[22];
    char v39 = BYTE4(__dst[22]);
    char v40 = BYTE4(__dst[21]);
    uint64_t v47 = __dst[23];
    int v45 = __dst[24];
    int v37 = __dst[25];
    char v38 = BYTE4(__dst[24]);
    char v33 = BYTE4(__dst[25]);
    int v36 = __dst[26];
    long long v10 = *(_OWORD *)&__dst[11];
    uint64_t result = BYTE4(__dst[26]);
    int v12 = __dst[13];
    char v13 = BYTE4(__dst[13]);
    int v14 = __dst[14];
    char v15 = BYTE4(__dst[14]);
    int v16 = __dst[15];
    char v17 = BYTE4(__dst[15]);
    uint64_t v18 = __dst[16];
    char v19 = __dst[17];
    int v20 = __dst[6];
    char v21 = BYTE4(__dst[6]);
    int v22 = __dst[7];
    char v23 = BYTE4(__dst[7]);
    int v24 = __dst[8];
    char v25 = BYTE4(__dst[8]);
    uint64_t v26 = __dst[9];
    char v27 = __dst[10];
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACB1450(a1, __dst);
    int v62 = __dst[32];
    char v70 = BYTE4(__dst[32]);
    uint64_t v60 = __dst[34];
    uint64_t v61 = __dst[33];
    char v69 = __dst[35];
    uint64_t v59 = __dst[36];
    char v49 = BYTE4(__dst[28]);
    int v57 = __dst[29];
    int v58 = __dst[28];
    char v46 = BYTE4(__dst[29]);
    int v56 = __dst[30];
    uint64_t v55 = __dst[31];
    uint64_t v54 = __dst[27];
    int v53 = __dst[18];
    char v43 = BYTE4(__dst[18]);
    char v44 = BYTE4(__dst[30]);
    char v42 = BYTE4(__dst[19]);
    int v51 = __dst[20];
    int v52 = __dst[19];
    int v50 = __dst[21];
    char v40 = BYTE4(__dst[21]);
    char v41 = BYTE4(__dst[20]);
    int v48 = __dst[22];
    uint64_t v47 = __dst[23];
    int v45 = __dst[24];
    char v38 = BYTE4(__dst[24]);
    char v39 = BYTE4(__dst[22]);
    long long v10 = *(_OWORD *)&__dst[11];
    char v27 = __dst[10] & 1;
    char v25 = BYTE4(__dst[8]) & 1;
    char v23 = BYTE4(__dst[7]) & 1;
    char v21 = BYTE4(__dst[6]) & 1;
    char v34 = __dst[35] & 1;
    char v35 = BYTE4(__dst[32]) & 1;
    char v33 = BYTE4(__dst[25]);
    int v36 = __dst[26];
    int v37 = __dst[25];
    uint64_t result = BYTE4(__dst[26]);
    int v12 = __dst[13];
    char v13 = BYTE4(__dst[13]);
    int v14 = __dst[14];
    char v15 = BYTE4(__dst[14]);
    int v16 = __dst[15];
    char v17 = BYTE4(__dst[15]);
    uint64_t v18 = __dst[16];
    char v19 = __dst[17];
    int v20 = __dst[6];
    int v22 = __dst[7];
    int v24 = __dst[8];
    uint64_t v26 = __dst[9];
  }
  int v28 = __dst[1];
  int v29 = __dst[2];
  int v30 = __dst[3];
  int v31 = __dst[4];
  uint64_t v32 = __dst[5];
  char v67 = BYTE4(__dst[0]);
  char v66 = BYTE4(__dst[1]);
  char v65 = BYTE4(__dst[2]);
  char v64 = BYTE4(__dst[3]);
  char v63 = BYTE4(__dst[4]);
  *(_DWORD *)a2 = __dst[0];
  *(_DWORD *)(a2 + 8) = v28;
  *(unsigned char *)(a2 + 4) = v67;
  *(unsigned char *)(a2 + 12) = v66;
  *(_DWORD *)(a2 + 16) = v29;
  *(unsigned char *)(a2 + 20) = v65;
  *(_DWORD *)(a2 + 24) = v30;
  *(unsigned char *)(a2 + 28) = v64;
  *(_DWORD *)(a2 + 32) = v31;
  *(unsigned char *)(a2 + 36) = v63;
  *(void *)(a2 + 40) = v32;
  *(_DWORD *)(a2 + 48) = v20;
  *(unsigned char *)(a2 + 52) = v21;
  *(_DWORD *)(a2 + 56) = v22;
  *(unsigned char *)(a2 + 60) = v23;
  *(_DWORD *)(a2 + 64) = v24;
  *(unsigned char *)(a2 + 68) = v25;
  *(void *)(a2 + 72) = v26;
  *(unsigned char *)(a2 + 80) = v27;
  *(_OWORD *)(a2 + 88) = v10;
  *(_DWORD *)(a2 + 104) = v12;
  *(unsigned char *)(a2 + 108) = v13;
  *(_DWORD *)(a2 + 112) = v14;
  *(unsigned char *)(a2 + 116) = v15;
  *(_DWORD *)(a2 + 120) = v16;
  *(unsigned char *)(a2 + 124) = v17;
  *(void *)(a2 + 128) = v18;
  *(unsigned char *)(a2 + 136) = v19;
  *(_DWORD *)(a2 + 144) = v53;
  *(unsigned char *)(a2 + 148) = v43;
  *(_DWORD *)(a2 + 152) = v52;
  *(unsigned char *)(a2 + 156) = v42;
  *(_DWORD *)(a2 + 160) = v51;
  *(unsigned char *)(a2 + 164) = v41;
  *(_DWORD *)(a2 + 168) = v50;
  *(unsigned char *)(a2 + 172) = v40;
  *(_DWORD *)(a2 + 176) = v48;
  *(unsigned char *)(a2 + 180) = v39;
  *(void *)(a2 + 184) = v47;
  *(_DWORD *)(a2 + 192) = v45;
  *(unsigned char *)(a2 + 196) = v38;
  *(_DWORD *)(a2 + 200) = v37;
  *(unsigned char *)(a2 + 204) = v33;
  *(_DWORD *)(a2 + 208) = v36;
  *(unsigned char *)(a2 + 212) = result;
  *(void *)(a2 + 216) = v54;
  *(_DWORD *)(a2 + 224) = v58;
  *(unsigned char *)(a2 + 228) = v49;
  *(_DWORD *)(a2 + 232) = v57;
  *(unsigned char *)(a2 + 236) = v46;
  *(_DWORD *)(a2 + 240) = v56;
  *(unsigned char *)(a2 + 244) = v44;
  *(void *)(a2 + 248) = v55;
  *(_DWORD *)(a2 + 256) = v62;
  *(unsigned char *)(a2 + 260) = v35;
  *(void *)(a2 + 264) = v61;
  *(void *)(a2 + 272) = v60;
  *(unsigned char *)(a2 + 280) = v34;
  *(void *)(a2 + 288) = v59;
  return result;
}

uint64_t sub_25ACB0DD4()
{
  return 1;
}

uint64_t sub_25ACB0DDC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(uint64_t (**)(unsigned char *))(*(void *)v2 + 112);
  uint64_t v7 = *(void *)v2 + 112;
  unint64_t v8 = (uint64_t (*)(unsigned char *, void))v6(v37);
  sub_25ACB1164(a1, __dst);
  sub_25ACB1CA0((uint64_t)__dst, (uint64_t)v39, &qword_26A4B2860);
  sub_25ACB1A54(v39);
  uint64_t v9 = v8(v37, 0);
  if ((a2 & 1) == 0) {
    goto LABEL_16;
  }
  unint64_t v10 = sub_25ACBF84C(v9);
  unint64_t v11 = v10;
  uint64_t v32 = a1;
  if (!(v10 >> 62))
  {
    uint64_t result = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    a1 = v32;
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27E8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_25ACD6940;
    *(void *)(v25 + 32) = a1;
    __dst[0] = v25;
    sub_25ACD5C20();
    unint64_t v26 = __dst[0];
    swift_retain();
    char v27 = (uint64_t (*)(void *, void))v6(__dst);
    int v29 = v28;
    int v30 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v3 + 136))(v37);
    sub_25ACA5B0C(v26, v29, v31);
    swift_bridgeObjectRelease();
    v30(v37, 0);
    return v27(__dst, 0);
  }
  uint64_t result = sub_25ACD5EE0();
  if (!result) {
    goto LABEL_15;
  }
LABEL_4:
  if (result >= 1)
  {
    uint64_t v13 = 0;
    unint64_t v33 = v11 & 0xC000000000000001;
    uint64_t v34 = result;
    unint64_t v35 = v11;
    do
    {
      if (v33)
      {
        uint64_t v14 = MEMORY[0x261153D20](v13, v11);
      }
      else
      {
        uint64_t v14 = *(void *)(v11 + 8 * v13 + 32);
        swift_retain();
      }
      uint64_t v15 = v3;
      int v16 = v6;
      uint64_t v17 = v7;
      uint64_t v18 = (void (*)(unsigned char *, void))v6(v37);
      int v20 = v19;
      swift_bridgeObjectRetain();
      unint64_t v21 = sub_25ACA7F54(v14);
      char v23 = v22;
      swift_bridgeObjectRelease();
      if (v23)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v36 = *v20;
        *int v20 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native) {
          sub_25ACA9BC0();
        }
        swift_release();
        memcpy(__dst, (const void *)(*(void *)(v36 + 56) + 296 * v21), sizeof(__dst));
        sub_25ACB1260(v21, v36);
        *int v20 = v36;
        swift_bridgeObjectRelease();
        sub_25ACAA5D8((uint64_t)__dst);
      }
      ++v13;
      v18(v37, 0);
      swift_release();
      unint64_t v11 = v35;
      uint64_t v3 = v15;
      uint64_t v6 = v16;
      uint64_t v7 = v17;
    }
    while (v34 != v13);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACB10FC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25ACB1124()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25ACB1164@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_25ACA7F54(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    v11[0] = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_25ACA9BC0();
      uint64_t v9 = v11[0];
    }
    swift_release();
    memmove(a2, (const void *)(*(void *)(v9 + 56) + 296 * v6), 0x128uLL);
    sub_25ACB1260(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    return nullsub_1(a2);
  }
  else
  {
    sub_25ACB1BE4((uint64_t)v11);
    return sub_25ACB1CA0((uint64_t)v11, (uint64_t)a2, &qword_26A4B2860);
  }
}

unint64_t sub_25ACB1260(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25ACD5D80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      sub_25ACD56A0();
      sub_25ACB1BA0(&qword_26A4B27D0);
      do
      {
        uint64_t result = sub_25ACD5B10();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            uint64_t v12 = *(void *)(a2 + 48);
            uint64_t v13 = (void *)(v12 + 8 * v3);
            uint64_t v14 = (void *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1) {
              *uint64_t v13 = *v14;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t result = v15 + 296 * v3;
            int v16 = (const void *)(v15 + 296 * v6);
            if (v3 != v6 || (int64_t v3 = v6, result >= (unint64_t)v16 + 296))
            {
              uint64_t result = (unint64_t)memmove((void *)result, v16, 0x128uLL);
              int64_t v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
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

void *sub_25ACB1450@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_25ACC1D88((uint64_t)&v64);
  v150[1] = v73;
  v150[2] = v74;
  *(_OWORD *)uint64_t v151 = *(_OWORD *)v75;
  *(void *)&v151[13] = *(void *)&v75[13];
  v150[0] = v72;
  v146[0] = v79;
  v146[1] = v80;
  uint64_t v147 = v81;
  uint64_t v145 = v76;
  long long v139 = v68;
  long long v140 = v69;
  long long v141 = v70;
  uint64_t v142 = v71;
  v137[0] = v65;
  v137[1] = v66;
  uint64_t v138 = v67;
  v136[0] = v77;
  v136[1] = v78;
  uint64_t v59 = sub_25ACA7C24(a1);
  uint64_t v60 = v3;
  uint64_t v61 = v4;
  uint64_t v62 = v5;
  swift_bridgeObjectRetain();
  sub_25ACB1C1C((uint64_t)v136);
  sub_25ACA7938(a1, (uint64_t)&v82);
  char v57 = v83;
  int v58 = v82;
  char v55 = v85;
  int v56 = v84;
  char v53 = v87;
  int v54 = v86;
  char v51 = v89;
  int v52 = v88;
  uint64_t v50 = v90;
  sub_25ACB1CA0((uint64_t)&v90, (uint64_t)v135, &qword_26A4B2868);
  sub_25ACB1D04((uint64_t)v135);
  sub_25ACB1C48((uint64_t)v137);
  sub_25ACA79DC(a1, (uint64_t)&v91);
  char v48 = v92;
  int v49 = v91;
  char v46 = v94;
  int v47 = v93;
  char v44 = v96;
  int v45 = v95;
  uint64_t v43 = v97;
  char v42 = v98;
  uint64_t v40 = v100;
  uint64_t v41 = v99;
  sub_25ACB1CA0((uint64_t)&v99, (uint64_t)v134, &qword_26A4B2870);
  sub_25ACB1CA0((uint64_t)&v100, (uint64_t)v133, &qword_26A4B2878);
  sub_25ACB1CA0((uint64_t)&v141 + 8, (uint64_t)v144, &qword_26A4B2870);
  sub_25ACB1D04((uint64_t)v134);
  sub_25ACB1D04((uint64_t)v133);
  sub_25ACB1C74((uint64_t)v144);
  sub_25ACB1CA0((uint64_t)&v142, (uint64_t)v143, &qword_26A4B2878);
  sub_25ACB1C74((uint64_t)v143);
  uint64_t v33 = sub_25ACA7B44();
  swift_bridgeObjectRetain();
  sub_25ACB1C74((uint64_t)&v145);
  sub_25ACA7C7C(a1, (uint64_t)&v101);
  char v38 = v102;
  int v39 = v101;
  uint64_t v36 = v103[1];
  uint64_t v37 = v103[0];
  char v35 = v104;
  uint64_t v34 = v105;
  sub_25ACB1CA0((uint64_t)v103, (uint64_t)v132, &qword_26A4B2880);
  sub_25ACB1CA0((uint64_t)&v105, (uint64_t)v131, &qword_26A4B2888);
  sub_25ACB1CA0((uint64_t)v146 + 8, (uint64_t)v149, &qword_26A4B2880);
  sub_25ACB1D04((uint64_t)v132);
  sub_25ACB1D04((uint64_t)v131);
  sub_25ACB1C74((uint64_t)v149);
  sub_25ACB1CA0((uint64_t)&v147, (uint64_t)v148, &qword_26A4B2888);
  sub_25ACB1C74((uint64_t)v148);
  sub_25ACA7A28((uint64_t)&v106);
  int v6 = v106;
  char v7 = v107;
  int v8 = v108;
  char v9 = v109;
  char v31 = v111;
  int v32 = v110;
  uint64_t v30 = v112;
  char v29 = v113;
  sub_25ACA7A6C((uint64_t)&v114);
  char v10 = v115;
  int v11 = v116;
  char v27 = v117;
  int v28 = v114;
  int v12 = v118;
  int v25 = v120;
  char v26 = v119;
  char v13 = v121;
  int v14 = v122;
  char v24 = v123;
  uint64_t v23 = v124;
  char v21 = v126;
  int v22 = v125;
  char v19 = v128;
  int v20 = v127;
  char v17 = v130;
  int v18 = v129;
  sub_25ACB1D30((uint64_t)&v114);
  sub_25ACB1D5C((uint64_t)v150);
  uint64_t v15 = sub_25ACA7CC0(a1);
  LODWORD(__src[1]) = v58;
  BYTE4(__src[1]) = v57;
  LODWORD(__src[2]) = v56;
  BYTE4(__src[2]) = v55;
  LODWORD(__src[3]) = v54;
  BYTE4(__src[3]) = v53;
  LODWORD(__src[4]) = v52;
  BYTE4(__src[4]) = v51;
  __src[5] = v50;
  LODWORD(__src[6]) = v49;
  BYTE4(__src[6]) = v48;
  LODWORD(__src[7]) = v47;
  BYTE4(__src[7]) = v46;
  LODWORD(__src[8]) = v45;
  BYTE4(__src[8]) = v44;
  __src[9] = v43;
  LOBYTE(__src[10]) = v42;
  __src[11] = v41;
  __src[12] = v40;
  LODWORD(__src[13]) = v6;
  BYTE4(__src[13]) = v7;
  LODWORD(__src[14]) = v8;
  BYTE4(__src[14]) = v9;
  LODWORD(__src[0]) = v15;
  BYTE4(__src[0]) = BYTE4(v15) & 1;
  LODWORD(__src[15]) = v32;
  BYTE4(__src[15]) = v31;
  __src[16] = v30;
  LOBYTE(__src[17]) = v29;
  LODWORD(__src[18]) = v28;
  BYTE4(__src[18]) = v10;
  LODWORD(__src[19]) = v11;
  BYTE4(__src[19]) = v27;
  LODWORD(__src[20]) = v12;
  BYTE4(__src[20]) = v26;
  LODWORD(__src[21]) = v25;
  BYTE4(__src[21]) = v13;
  LODWORD(__src[22]) = v14;
  BYTE4(__src[22]) = v24;
  __src[23] = v23;
  LODWORD(__src[24]) = v22;
  BYTE4(__src[24]) = v21;
  LODWORD(__src[25]) = v20;
  BYTE4(__src[25]) = v19;
  LODWORD(__src[26]) = v18;
  BYTE4(__src[26]) = v17;
  __src[27] = v33;
  LODWORD(__src[28]) = v59;
  BYTE4(__src[28]) = BYTE4(v59) & 1;
  LODWORD(__src[29]) = v60;
  BYTE4(__src[29]) = BYTE4(v60) & 1;
  LODWORD(__src[30]) = v61;
  BYTE4(__src[30]) = BYTE4(v61) & 1;
  __src[31] = v62;
  LODWORD(__src[32]) = v39;
  BYTE4(__src[32]) = v38;
  __src[33] = v37;
  __src[34] = v36;
  LOBYTE(__src[35]) = v35;
  __src[36] = v34;
  sub_25ACADD94((uint64_t)__src);
  sub_25ACB1C74((uint64_t)v132);
  sub_25ACB1C74((uint64_t)v131);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25ACB1D5C((uint64_t)&v114);
  sub_25ACB1C74((uint64_t)v134);
  sub_25ACB1C74((uint64_t)v133);
  sub_25ACB1C48((uint64_t)&v82);
  sub_25ACAA5D8((uint64_t)__src);
  return memcpy(a2, __src, 0x128uLL);
}

uint64_t *sub_25ACB1A54(uint64_t *a1)
{
  return a1;
}

uint64_t sub_25ACB1AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for MetricsData()
{
  return self;
}

uint64_t sub_25ACB1BA0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25ACD56A0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double sub_25ACB1BE4(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 1;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(void *)(a1 + 288) = 0;
  return result;
}

uint64_t sub_25ACB1C1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1C48(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1C74(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1CA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25ACB1D04(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1D30(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1D5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1D88(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACB1E34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25ACD53A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (int *)((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(int *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  int v8 = (*(uint64_t (**)(int *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x263F16298])
  {
    uint64_t result = (*(uint64_t (**)(int *, uint64_t))(v5 + 96))(v7, v4);
    int v10 = *v7;
    *(void *)(a1 + 24) = MEMORY[0x263F8D5C8];
    *(_DWORD *)a1 = v10;
  }
  else if (v8 == *MEMORY[0x263F162A0])
  {
    (*(void (**)(int *, uint64_t))(v5 + 96))(v7, v4);
    uint64_t v11 = *(void *)v7;
    uint64_t result = sub_25ACD5270();
    *(void *)(a1 + 24) = result;
    *(void *)a1 = v11;
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return (*(uint64_t (**)(int *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_25ACB1FCC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_25ACB1FE0(uint64_t a1, void *a2)
{
  return sub_25ACB1FE8(a2);
}

uint64_t sub_25ACB1FE8(void *a1)
{
  uint64_t v2 = sub_25ACD59B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  int v8 = &v20[-v7];
  if (a1)
  {
    char v9 = self;
    id v10 = a1;
    id v11 = objc_msgSend(v9, sel_mainBundle);
    id v12 = objc_msgSend(v11, sel_bundleIdentifier);

    if (v12)
    {
      sub_25ACD5B40();
    }
    sub_25ACD53F0();
    long long v21 = v15;
    long long v22 = v16;
    long long v23 = v17;
    char v24 = 0;
    sub_25ACD59A0();
    sub_25ACD5160();
    swift_allocObject();
    sub_25ACD5150();
    sub_25ACB2370();
    uint64_t v18 = sub_25ACD5140();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    id v13 = objc_msgSend(self, sel_mainBundle);
    id v14 = objc_msgSend(v13, sel_bundleIdentifier);

    if (v14)
    {
      sub_25ACD5B40();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    char v24 = 1;
    sub_25ACD59A0();
    sub_25ACD5160();
    swift_allocObject();
    sub_25ACD5150();
    sub_25ACB2370();
    uint64_t v18 = sub_25ACD5140();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  }
  swift_release();
  return v18;
}

ValueMetadata *type metadata accessor for SceneConfigurationDataProvider()
{
  return &type metadata for SceneConfigurationDataProvider;
}

unint64_t sub_25ACB2370()
{
  unint64_t result = qword_26A4B2890;
  if (!qword_26A4B2890)
  {
    sub_25ACD59B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2890);
  }
  return result;
}

uint64_t sub_25ACB23C8()
{
  sub_25ACD5500();
  sub_25ACD54D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2898);
  swift_getTupleTypeMetadata2();
  sub_25ACB2B18();
  uint64_t v0 = sub_25ACD5BD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25ACB24BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = sub_25ACD5D10();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = &v21[-v16];
  uint64_t v26 = a1;
  MEMORY[0x261153A30](&v26, a4, MEMORY[0x263F8DD08], a5, MEMORY[0x263F8DD10]);
  uint64_t v22 = a5;
  uint64_t v23 = a6;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_25ACB2834((void (*)(char *, char *))sub_25ACB3328, (uint64_t)v21, MEMORY[0x263F8E628], TupleTypeMetadata2, v19, a7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_25ACB2638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_25ACB24BC(a1, a2, a3, v4[4], v4[2], v4[3], a4);
}

uint64_t sub_25ACB2644@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28B0);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD51A0();
  uint64_t v13 = sub_25ACD51B0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_25ACB3358((uint64_t)v12);
    uint64_t v15 = (char *)a5 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    *a5 = a2;
    a5[1] = a3;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v15, a1, a4);
    return swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v17 = sub_25ACD5170();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    int v20 = (char *)a5 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    *a5 = v17;
    a5[1] = v19;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v20, a1, a4);
  }
}

uint64_t sub_25ACB2834@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  char v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  int v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t sub_25ACB2ADC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 32))(*a1, a1[1], a1[2]);
}

unint64_t sub_25ACB2B18()
{
  unint64_t result = qword_26A4B28A0;
  if (!qword_26A4B28A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B2898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B28A0);
  }
  return result;
}

uint64_t sub_25ACB2B74()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25ACD55F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5530();
  sub_25ACD5560();
  swift_release();
  sub_25ACD55E0();
  sub_25ACADD3C();
  sub_25ACD5540();
  sub_25ACD5510();
  BOOL v8 = v11;
  sub_25ACD54F0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  int v10 = v8 + v12;
  if (__OFADD__(v8, v12))
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    BOOL v11 = v10 >= 1;
    sub_25ACB2EC0();
    return sub_25ACD5D70();
  }
  return result;
}

uint64_t sub_25ACB2D9C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2730);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD55E0();
  sub_25ACADD3C();
  sub_25ACD5540();
  sub_25ACD5510();
  int v4 = v8;
  sub_25ACD54F0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (!__OFADD__(v4, v7)) {
    return v4 + v7 > 0;
  }
  __break(1u);
  return result;
}

unint64_t sub_25ACB2EC0()
{
  unint64_t result = qword_26A4B28A8;
  if (!qword_26A4B28A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B28A8);
  }
  return result;
}

uint64_t sub_25ACB2F14()
{
  uint64_t v0 = sub_25ACD55F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5530();
  sub_25ACD5560();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v5[1] = 0;
  sub_25ACB2EC0();
  return sub_25ACD5D70();
}

uint64_t sub_25ACB3028()
{
  return 0;
}

uint64_t sub_25ACB3030()
{
  uint64_t v0 = sub_25ACD55F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5530();
  sub_25ACD5560();
  swift_release();
  char v4 = sub_25ACB316C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6[1] = (v4 & 1) != 0;
  sub_25ACB2EC0();
  return sub_25ACD5D70();
}

uint64_t sub_25ACB316C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25ACD55F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v13 - v7;
  sub_25ACD55E0();
  sub_25ACD5560();
  swift_release();
  sub_25ACD5390();
  char v9 = sub_25ACD55D0();
  int v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v8, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, v2);
  if (v9)
  {
    sub_25ACD55E0();
    sub_25ACD5560();
    swift_release();
    sub_25ACD5360();
    char v11 = sub_25ACD55D0();
    v10(v8, v2);
  }
  else
  {
    char v11 = 0;
  }
  v10(v6, v2);
  return v11 & 1;
}

uint64_t sub_25ACB331C()
{
  return MEMORY[0x263F8EE80];
}

uint64_t sub_25ACB3328@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25ACB2644(a1, v2[4], v2[5], v2[2], a2);
}

uint64_t sub_25ACB3358(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_25ACB33B8()
{
  return &qword_26A4B28B8;
}

uint64_t sub_25ACB33C4()
{
  return qword_26A4B28B8;
}

uint64_t sub_25ACB3408(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_26A4B28B8 = a1;
  return result;
}

uint64_t (*sub_25ACB3450())()
{
  return j__swift_endAccess;
}

uint64_t sub_25ACB34A8()
{
  uint64_t v0 = swift_allocObject();
  sub_25ACD5930();
  return v0;
}

uint64_t sub_25ACB34EC()
{
  uint64_t v1 = sub_25ACD5940();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5930();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy, v4, v1);
  return v0;
}

uint64_t sub_25ACB35BC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v1 + 128))(a1, qword_26A4B28B8);
  return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 136))(v3);
}

uint64_t sub_25ACB3658(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_25ACD5A50();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD59E0();
  swift_retain();
  char v9 = sub_25ACD5A40();
  os_log_type_t v10 = sub_25ACD5CD0();
  if (os_log_type_enabled(v9, v10))
  {
    char v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = v2;
    int v12 = v11;
    *(_DWORD *)char v11 = 134217984;
    uint64_t v16 = v5;
    v18[0] = sub_25ACD5640();
    uint64_t v5 = v16;
    sub_25ACD5D20();
    swift_release();
    _os_log_impl(&dword_25ACA4000, v9, v10, "Representing entity %llu in RealityKitHierarchy", v12, 0xCu);
    MEMORY[0x261154430](v12, -1, -1);
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_25ACB40C8(a1, 0, a2, 1);
  swift_beginAccess();
  uint64_t v13 = (void (*)(uint64_t *, void))sub_25ACD5920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28C0);
  sub_25ACD5720();
  v13(v18, 0);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_25ACB38B0()
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_25ACD5940();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25ACD5A50();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v37 = (char *)&v36 - v8;
  MEMORY[0x270FA5388](v7);
  os_log_type_t v10 = (char *)&v36 - v9;
  sub_25ACD59E0();
  char v11 = sub_25ACD5A40();
  os_log_type_t v12 = sub_25ACD5CD0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25ACA4000, v11, v12, "Encoding RealityKitHierarchy", v13, 2u);
    MEMORY[0x261154430](v13, -1, -1);
  }

  char v38 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v39 = v5 + 8;
  v38(v10, v4);
  sub_25ACD5160();
  swift_allocObject();
  uint64_t v14 = sub_25ACD5150();
  uint64_t v15 = v40 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v15, v0);
  sub_25ACBE0F0(&qword_26A4B28C8, MEMORY[0x263F78B20]);
  uint64_t v16 = sub_25ACD5140();
  unint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  switch(v18 >> 62)
  {
    case 1uLL:
      if (v16 >> 32 < (int)v16) {
        __break(1u);
      }
      sub_25ACBDA38(v16, v18);
      swift_retain();
      uint64_t v19 = sub_25ACBD794((int)v16, v16 >> 32, v18 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_25ACBDA00);
      unint64_t v21 = v20;
      sub_25ACBDA90(v16, v18);
      if (v21) {
        goto LABEL_14;
      }
      goto LABEL_9;
    case 2uLL:
      uint64_t v22 = *(void *)(v16 + 16);
      uint64_t v23 = *(void *)(v16 + 24);
      sub_25ACBDA38(v16, v18);
      swift_retain();
      swift_retain();
      uint64_t v19 = sub_25ACBD794(v22, v23, v18 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_25ACBDA00);
      unint64_t v21 = v24;
      swift_release();
      swift_release();
      if (v21) {
        goto LABEL_14;
      }
LABEL_9:
      uint64_t v43 = v16;
      unint64_t v44 = v18;
      sub_25ACBDA38(v16, v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28D0);
      if (!swift_dynamicCast())
      {
        uint64_t v42 = 0;
        memset(v41, 0, sizeof(v41));
        sub_25ACAEEE0((uint64_t)v41, &qword_26A4B28D8);
LABEL_22:
        uint64_t v26 = v37;
        uint64_t v19 = sub_25ACBC898(v16, v18);
        unint64_t v21 = v35;
        sub_25ACBDA90(v16, v18);
        goto LABEL_16;
      }
      sub_25ACBE19C(v41, (uint64_t)v45);
      __swift_project_boxed_opaque_existential_1Tm(v45, v46);
      if ((sub_25ACD5F50() & 1) == 0)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
        goto LABEL_22;
      }
      __swift_project_boxed_opaque_existential_1Tm(v45, v46);
      sub_25ACD5F40();
      sub_25ACBDA90(v16, v18);
      unint64_t v21 = *((void *)&v41[0] + 1);
      uint64_t v19 = *(void *)&v41[0];
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
LABEL_15:
      uint64_t v26 = v37;
LABEL_16:
      sub_25ACD59E0();
      swift_bridgeObjectRetain();
      char v27 = sub_25ACD5A40();
      os_log_type_t v28 = sub_25ACD5CD0();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v40 = v4;
        uint64_t v29 = v19;
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        v45[0] = v31;
        uint64_t v36 = v14;
        *(_DWORD *)uint64_t v30 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)&v41[0] = sub_25ACBC240(v29, v21, v45);
        sub_25ACD5D20();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25ACA4000, v27, v28, "%s", v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261154430](v31, -1, -1);
        MEMORY[0x261154430](v30, -1, -1);

        swift_release();
        int v32 = v37;
        uint64_t v33 = v40;
      }
      else
      {

        swift_release();
        swift_bridgeObjectRelease_n();
        int v32 = v26;
        uint64_t v33 = v4;
      }
      v38(v32, v33);
      return v16;
    case 3uLL:
      memset(v45, 0, 14);
      goto LABEL_13;
    default:
      v45[0] = v16;
      LOWORD(v45[1]) = v18;
      BYTE2(v45[1]) = BYTE2(v18);
      BYTE3(v45[1]) = BYTE3(v18);
      BYTE4(v45[1]) = BYTE4(v18);
      BYTE5(v45[1]) = BYTE5(v18);
LABEL_13:
      uint64_t v19 = sub_25ACD5B80();
      unint64_t v21 = v25;
LABEL_14:
      sub_25ACBDA90(v16, v18);
      goto LABEL_15;
  }
}

uint64_t sub_25ACB40C8(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  int v90 = a4;
  uint64_t v101 = a3;
  uint64_t v97 = a2;
  uint64_t v7 = sub_25ACD5620();
  MEMORY[0x270FA5388](v7 - 8);
  v75[1] = (char *)v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2800);
  uint64_t v77 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v11 = (char *)v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_25ACD5990();
  uint64_t v79 = *(void *)(v100 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v100);
  uint64_t v99 = (char *)v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v87 = (char *)v75 - v14;
  uint64_t v15 = sub_25ACD55F0();
  MEMORY[0x270FA5388](v15 - 8);
  char v85 = (char *)v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_25ACD55C0();
  uint64_t v88 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  char v98 = (char *)v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_25ACD6070();
  uint64_t v102 = *(void *)(v96 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v96);
  int v86 = (void *)((char *)v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v18);
  char v92 = (void *)((char *)v75 - v20);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28E0);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v95 = (uint64_t)v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  int v84 = (void *)((char *)v75 - v24);
  uint64_t v104 = sub_25ACD5A30();
  uint64_t v91 = *(void *)(v104 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v104);
  char v94 = (char *)v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  char v103 = (char *)v75 - v27;
  int v93 = (void (*)(char *, char *, uint64_t))sub_25ACD5A50();
  uint64_t v28 = *((void *)v93 - 1);
  MEMORY[0x270FA5388](v93);
  uint64_t v30 = (char *)v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD59E0();
  swift_retain_n();
  uint64_t v31 = sub_25ACD5A40();
  os_log_type_t v32 = sub_25ACD5CD0();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v78 = v9;
  uint64_t v76 = v11;
  if (v33)
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(void *)&long long v110 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v83 = (uint64_t)(v34 + 4);
    uint64_t v36 = sub_25ACD5650();
    uint64_t v107 = sub_25ACBC240(v36, v37, (uint64_t *)&v110);
    sub_25ACD5D20();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25ACA4000, v31, v32, "RealityKitHierarchy capturing entity: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261154430](v35, -1, -1);
    MEMORY[0x261154430](v34, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v28 + 8))(v30, v93);
  uint64_t v38 = v104;
  uint64_t v39 = v103;
  uint64_t v40 = v102;
  uint64_t v41 = v94;
  sub_25ACD5640();
  sub_25ACD5A20();
  *(void *)&long long v110 = a1;
  sub_25ACD6080();
  uint64_t v102 = v42;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v91 + 16);
  char v94 = (char *)(v91 + 16);
  int v93 = v43;
  v43(v41, v39, v38);
  uint64_t v83 = sub_25ACD5650();
  uint64_t v82 = v44;
  *(void *)&long long v110 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2838);
  uint64_t v81 = sub_25ACD5B50();
  uint64_t v80 = v45;
  swift_retain();
  sub_25ACD5670();
  sub_25ACD5570();
  sub_25ACD5680();
  sub_25ACD5630();
  sub_25ACD58E0();
  swift_allocObject();
  uint64_t v46 = sub_25ACD58C0();
  uint64_t v83 = sub_25ACD56A0();
  uint64_t v111 = v83;
  *(void *)&long long v110 = a1;
  swift_retain();
  uint64_t v47 = v92;
  sub_25ACD6020();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25ACD65F0;
  *(void *)(inited + 32) = 0x6E656E6F706D6F63;
  *(void *)(inited + 40) = 0xEA00000000007374;
  *(void *)(inited + 48) = 0x6E6572646C696863;
  *(void *)(inited + 56) = 0xE800000000000000;
  sub_25ACB4EB4(v47, v101, inited, (uint64_t)v84);
  swift_setDeallocating();
  swift_arrayDestroy();
  int v49 = *(uint64_t **)(v40 + 8);
  uint64_t v102 = v40 + 8;
  char v92 = v49;
  ((void (*)(uint64_t *, uint64_t))v49)(v47, v96);
  uint64_t v97 = v46;
  sub_25ACD58B0();
  int v84 = a1;
  sub_25ACD5560();
  uint64_t v50 = v98;
  sub_25ACD5580();
  sub_25ACD55B0();
  uint64_t v51 = v100;
  int v52 = v99;
  char v53 = v87;
  int v54 = v86;
  if (v111)
  {
    char v55 = v41;
    int v56 = (void (**)(char *, char *, uint64_t))(v79 + 16);
    char v57 = (void (**)(char *, uint64_t))(v79 + 8);
    do
    {
      sub_25ACBE19C(&v110, (uint64_t)&v107);
      __swift_project_boxed_opaque_existential_1Tm(&v107, v108);
      v105[0] = swift_getDynamicType();
      v105[1] = v109;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29E0);
      sub_25ACD5B50();
      swift_bridgeObjectRetain();
      sub_25ACD5980();
      (*v56)(v52, v53, v51);
      v93(v55, v103, v104);
      uint64_t v58 = v108;
      uint64_t v59 = v5;
      uint64_t v60 = __swift_project_boxed_opaque_existential_1Tm(&v107, v108);
      uint64_t v106 = v58;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v105);
      uint64_t v62 = v60;
      uint64_t v5 = v59;
      int v52 = v99;
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v58 - 8) + 16))(boxed_opaque_existential_0, v62, v58);
      sub_25ACBE1DC(v105);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v105);
      sub_25ACD5910();
      swift_allocObject();
      sub_25ACD5900();
      uint64_t v63 = v108;
      char v64 = __swift_project_boxed_opaque_existential_1Tm(&v107, v108);
      uint64_t v106 = v63;
      long long v65 = __swift_allocate_boxed_opaque_existential_0(v105);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v63 - 8) + 16))(v65, v64, v63);
      sub_25ACD6020();
      sub_25ACB4EB4(v54, v101, MEMORY[0x263F8EE78], v95);
      ((void (*)(uint64_t *, uint64_t))v92)(v54, v96);
      sub_25ACD58F0();
      long long v66 = (void (*)(uint64_t *, void))sub_25ACD58A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29E8);
      sub_25ACD5720();
      v66(v105, 0);
      uint64_t v51 = v100;
      uint64_t v50 = v98;
      swift_release();
      (*v57)(v53, v51);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v107);
      sub_25ACD55B0();
    }
    while (v111);
  }
  (*(void (**)(char *, uint64_t))(v88 + 8))(v50, v89);
  uint64_t v67 = v97;
  if (v90)
  {
    sub_25ACD5260();
    long long v68 = v76;
    sub_25ACD5600();
    uint64_t v69 = v78;
    sub_25ACD5610();
    uint64_t v70 = v110;
    for (i = v101; (void)v110; uint64_t v70 = v110)
    {
      swift_retain();
      char v72 = sub_25ACAF4B0();
      sub_25ACB40C8(v70, v67, i, (v72 & 1) == 0);
      swift_release();
      long long v73 = (void (*)(long long *, void))sub_25ACD58D0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28C0);
      sub_25ACD5720();
      v73(&v110, 0);
      swift_release();
      swift_release();
      sub_25ACD5610();
    }
    (*(void (**)(char *, uint64_t))(v77 + 8))(v68, v69);
  }
  (*(void (**)(char *, uint64_t))(v91 + 8))(v103, v104);
  return v67;
}

uint64_t sub_25ACB4EB4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v100 = a2;
  uint64_t v101 = a4;
  uint64_t v99 = sub_25ACD57A0();
  uint64_t v6 = *(void *)(v99 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v99);
  char v98 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v97 = (uint64_t *)((char *)&v86 - v9);
  uint64_t v103 = sub_25ACD5760();
  *(void *)&long long v105 = *(void *)(v103 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v103);
  uint64_t v96 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v95 = (char *)&v86 - v12;
  uint64_t v13 = sub_25ACD6070();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25ACD5A50();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v115 = v17;
  int v116 = (long long *)v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v89 = (char *)&v86 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  char v87 = (char *)&v86 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v111 = (char *)&v86 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v112 = (char *)&v86 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v86 - v27;
  sub_25ACD59E0();
  uint64_t v29 = *(void (**)(char *, uint64_t *, uint64_t))(v14 + 16);
  char v117 = a1;
  int v114 = (void (*)(char *, uint64_t))v13;
  v29(v16, a1, v13);
  uint64_t v30 = sub_25ACD5A40();
  os_log_type_t v31 = sub_25ACD5CD0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v109 = a3;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v113 = v6;
    uint64_t v34 = (uint8_t *)v33;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v132 = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    long long v110 = v34 + 4;
    v130[0] = sub_25ACD6030();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
    uint64_t v36 = sub_25ACD5B50();
    v130[0] = sub_25ACBC240(v36, v37, &v132);
    a3 = v109;
    sub_25ACD5D20();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void))(v14 + 8))(v16, v114);
    _os_log_impl(&dword_25ACA4000, v30, v31, "RealityKitHierarchy capturing properties for subjectType: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261154430](v35, -1, -1);
    uint64_t v38 = v34;
    uint64_t v6 = v113;
    MEMORY[0x261154430](v38, -1, -1);
  }
  else
  {
    (*(void (**)(char *, void))(v14 + 8))(v16, v114);
  }

  uint64_t v39 = (uint64_t)v116;
  int v114 = (void (*)(char *, uint64_t))*((void *)v116 + 1);
  v114(v28, v115);
  uint64_t v40 = sub_25ACD5970();
  sub_25ACBE0F0(&qword_26A4B2978, MEMORY[0x263F78A88]);
  sub_25ACBE0F0(&qword_26A4B2980, MEMORY[0x263F78B38]);
  uint64_t v94 = v40;
  sub_25ACD5740();
  sub_25ACD6060();
  uint64_t v41 = sub_25ACD5E80();
  swift_release();
  swift_retain();
  long long v110 = (uint8_t *)v41;
  sub_25ACD5F30();
  uint64_t v43 = v111;
  if (v135)
  {
    int v116 = &v128;
    char v117 = &v131;
    uint64_t v113 = v39 + 8;
    uint64_t v107 = &v120;
    uint64_t v108 = &v134;
    uint64_t v106 = &v126;
    char v92 = (void (**)(char *, void *, uint64_t))(v6 + 16);
    int v93 = (void (**)(char *, char *, uint64_t))(v105 + 16);
    int v90 = (void (**)(char *, uint64_t))(v105 + 8);
    uint64_t v91 = (void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v88 = (uint64_t *)(a3 + 40);
    *(void *)&long long v42 = 136315138;
    long long v105 = v42;
    uint64_t v102 = MEMORY[0x263F8EE58] + 8;
    while (1)
    {
      uint64_t v48 = v132;
      uint64_t v49 = v133;
      v130[0] = v132;
      v130[1] = v133;
      uint64_t v50 = v117;
      sub_25ACBE09C(v108, v117);
      swift_bridgeObjectRetain();
      uint64_t v51 = v112;
      sub_25ACD59E0();
      *(void *)&long long v127 = v48;
      *((void *)&v127 + 1) = v49;
      sub_25ACBDEEC((uint64_t)v50, (uint64_t)v116);
      sub_25ACBE138((uint64_t)&v127, (uint64_t)&v124, &qword_26A4B2990);
      long long v121 = v127;
      long long v122 = v128;
      long long v123 = v129;
      swift_bridgeObjectRetain();
      int v52 = sub_25ACD5A40();
      os_log_type_t v53 = sub_25ACD5CD0();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v104 = v55;
        *(_DWORD *)uint64_t v54 = v105;
        uint64_t v57 = v124;
        uint64_t v56 = v125;
        v119[0] = v55;
        v119[1] = v124;
        v119[2] = v125;
        uint64_t v58 = (uint64_t)v107;
        sub_25ACBDEEC((uint64_t)v106, (uint64_t)v107);
        v118[0] = v57;
        v118[1] = v56;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29C8);
        uint64_t v59 = sub_25ACD5B50();
        unint64_t v61 = v60;
        uint64_t v62 = v115;
        __swift_destroy_boxed_opaque_existential_1Tm(v58);
        *(void *)(v54 + 4) = sub_25ACBC240(v59, v61, v119);
        uint64_t v43 = v111;
        swift_bridgeObjectRelease();
        sub_25ACAEEE0((uint64_t)&v121, &qword_26A4B2990);
        sub_25ACAEEE0((uint64_t)&v124, &qword_26A4B2990);
        _os_log_impl(&dword_25ACA4000, v52, v53, "property label: %s", (uint8_t *)v54, 0xCu);
        uint64_t v63 = v104;
        swift_arrayDestroy();
        MEMORY[0x261154430](v63, -1, -1);
        MEMORY[0x261154430](v54, -1, -1);

        char v64 = v112;
        uint64_t v65 = v62;
      }
      else
      {
        sub_25ACAEEE0((uint64_t)&v121, &qword_26A4B2990);
        sub_25ACAEEE0((uint64_t)&v124, &qword_26A4B2990);

        char v64 = v51;
        uint64_t v65 = v115;
      }
      v114(v64, v65);
      sub_25ACD59E0();
      *(void *)&long long v127 = v48;
      *((void *)&v127 + 1) = v49;
      sub_25ACBDEEC((uint64_t)v117, (uint64_t)v116);
      sub_25ACBE138((uint64_t)&v127, (uint64_t)&v124, &qword_26A4B2990);
      long long v121 = v127;
      long long v122 = v128;
      long long v123 = v129;
      swift_bridgeObjectRetain();
      long long v66 = sub_25ACD5A40();
      os_log_type_t v67 = sub_25ACD5CD0();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        v118[0] = v69;
        *(_DWORD *)uint64_t v68 = v105;
        sub_25ACBDEEC((uint64_t)v106, (uint64_t)v107);
        uint64_t v70 = sub_25ACD5B50();
        *(void *)(v68 + 4) = sub_25ACBC240(v70, v71, v118);
        uint64_t v43 = v111;
        swift_bridgeObjectRelease();
        sub_25ACAEEE0((uint64_t)&v121, &qword_26A4B2990);
        sub_25ACAEEE0((uint64_t)&v124, &qword_26A4B2990);
        _os_log_impl(&dword_25ACA4000, v66, v67, "property value: %s", (uint8_t *)v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261154430](v69, -1, -1);
        MEMORY[0x261154430](v68, -1, -1);
      }
      else
      {
        sub_25ACAEEE0((uint64_t)&v121, &qword_26A4B2990);
        sub_25ACAEEE0((uint64_t)&v124, &qword_26A4B2990);
      }

      v114(v43, v115);
      uint64_t v72 = v109;
      *(void *)&long long v127 = v48;
      *((void *)&v127 + 1) = v49;
      uint64_t v73 = (uint64_t)v116;
      sub_25ACBDEEC((uint64_t)v117, (uint64_t)v116);
      __swift_destroy_boxed_opaque_existential_1Tm(v73);
      if (!v49) {
        break;
      }
      uint64_t v74 = *(void *)(v72 + 16);
      if (v74)
      {
        sub_25ACAEE8C();
        swift_bridgeObjectRetain();
        int v75 = v88;
        while (1)
        {
          uint64_t v76 = *v75;
          *(void *)&long long v127 = *(v75 - 1);
          *((void *)&v127 + 1) = v76;
          uint64_t v124 = v48;
          uint64_t v125 = v49;
          if (!sub_25ACD5D40()) {
            break;
          }
          v75 += 2;
          if (!--v74)
          {
            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v77 = v87;
        sub_25ACD59E0();
        uint64_t v78 = sub_25ACD5A40();
        os_log_type_t v84 = sub_25ACD5CD0();
        if (os_log_type_enabled(v78, v84))
        {
          uint64_t v80 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v80 = 0;
          uint64_t v81 = v78;
          os_log_type_t v82 = v84;
          uint64_t v83 = "Excluding property";
LABEL_24:
          _os_log_impl(&dword_25ACA4000, v81, v82, v83, v80, 2u);
          MEMORY[0x261154430](v80, -1, -1);
        }
        goto LABEL_25;
      }
LABEL_6:
      swift_bridgeObjectRetain();
      uint64_t v44 = v95;
      sub_25ACD5750();
      uint64_t v45 = v97;
      uint64_t v46 = v117;
      sub_25ACB6DEC((uint64_t)v117, v100, v97);
      (*v93)(v96, v44, v103);
      uint64_t v47 = v99;
      (*v92)(v98, v45, v99);
      sub_25ACBE1DC(v46);
      swift_allocObject();
      uint64_t v43 = v111;
      sub_25ACD5950();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28E0);
      sub_25ACD5720();
      swift_release();
      (*v91)(v45, v47);
      (*v90)(v44, v103);
LABEL_7:
      sub_25ACAEEE0((uint64_t)v130, &qword_26A4B2990);
      sub_25ACD5F30();
      if (!v135) {
        return swift_release_n();
      }
    }
    uint64_t v77 = v89;
    sub_25ACD59E0();
    uint64_t v78 = sub_25ACD5A40();
    os_log_type_t v79 = sub_25ACD5CF0();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v80 = 0;
      uint64_t v81 = v78;
      os_log_type_t v82 = v79;
      uint64_t v83 = "Failed to capture property because it lacked a label";
      goto LABEL_24;
    }
LABEL_25:

    v114(v77, v115);
    goto LABEL_7;
  }
  return swift_release_n();
}

unint64_t sub_25ACB5B04(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = a2;
  uint64_t v2 = sub_25ACD57A0();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  os_log_type_t v53 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int v52 = (char *)v49 - v5;
  uint64_t v6 = sub_25ACD5A50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  os_log_type_t v67 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v49 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v49 - v13;
  sub_25ACD59E0();
  uint64_t v15 = sub_25ACD5A40();
  os_log_type_t v16 = sub_25ACD5CD0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_25ACA4000, v15, v16, "RealityKitHierarchy capturing array", v17, 2u);
    MEMORY[0x261154430](v17, -1, -1);
  }

  uint64_t v18 = *(void (**)(void, void))(v7 + 8);
  uint64_t v68 = v7 + 8;
  uint64_t v19 = v18;
  v18(v14, v6);
  sub_25ACD6060();
  uint64_t v20 = sub_25ACD5E80();
  swift_release();
  swift_retain();
  uint64_t v66 = v20;
  sub_25ACD5F30();
  if (v81)
  {
    char v64 = &v80;
    uint64_t v65 = &v77;
    uint64_t v63 = v75;
    uint64_t v58 = &v73;
    uint64_t v59 = &v69;
    v49[1] = v54 + 32;
    uint64_t v50 = (void (**)(char *, char *, uint64_t))(v54 + 16);
    unint64_t v56 = MEMORY[0x263F8EE78];
    uint64_t v22 = (uint64_t *)&unk_26A4B2990;
    v49[0] = v54 + 8;
    *(void *)&long long v21 = 136315138;
    long long v57 = v21;
    uint64_t v62 = MEMORY[0x263F8EE58] + 8;
    uint64_t v60 = v6;
    while (1)
    {
      uint64_t v23 = v78;
      uint64_t v24 = v79;
      v76[0] = v78;
      v76[1] = v79;
      uint64_t v25 = v65;
      sub_25ACBE09C(v64, v65);
      swift_bridgeObjectRetain();
      sub_25ACD59E0();
      *(void *)&long long v74 = v23;
      *((void *)&v74 + 1) = v24;
      sub_25ACBDEEC((uint64_t)v25, (uint64_t)v63);
      sub_25ACBE138((uint64_t)&v74, (uint64_t)v72, v22);
      v71[0] = v74;
      v71[1] = v75[0];
      v71[2] = v75[1];
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_25ACD5A40();
      uint64_t v27 = v22;
      os_log_type_t v28 = sub_25ACD5CD0();
      if (os_log_type_enabled(v26, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        os_log_t v61 = v26;
        uint64_t v30 = v29;
        uint64_t v31 = swift_slowAlloc();
        uint64_t v70 = v31;
        *(_DWORD *)uint64_t v30 = v57;
        sub_25ACBDEEC((uint64_t)v58, (uint64_t)v59);
        uint64_t v32 = sub_25ACD5B50();
        uint64_t v33 = v19;
        *(void *)(v30 + 4) = sub_25ACBC240(v32, v34, &v70);
        swift_bridgeObjectRelease();
        sub_25ACAEEE0((uint64_t)v71, v27);
        sub_25ACAEEE0((uint64_t)v72, v27);
        os_log_t v35 = v61;
        _os_log_impl(&dword_25ACA4000, v61, v28, "property value: %s", (uint8_t *)v30, 0xCu);
        swift_arrayDestroy();
        uint64_t v36 = v31;
        uint64_t v6 = v60;
        MEMORY[0x261154430](v36, -1, -1);
        MEMORY[0x261154430](v30, -1, -1);

        uint64_t v19 = v33;
        v33(v12, v6);
        uint64_t v22 = v27;
        if (!v24) {
          goto LABEL_13;
        }
      }
      else
      {
        sub_25ACAEEE0((uint64_t)v71, v27);
        sub_25ACAEEE0((uint64_t)v72, v27);

        v19(v12, v6);
        uint64_t v22 = v27;
        if (!v24)
        {
LABEL_13:
          uint64_t v40 = v52;
          sub_25ACB6DEC(v65, v51);
          (*v50)(v53, v40, v55);
          unint64_t v41 = v56;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v41 = sub_25ACBBFD8(0, *(void *)(v41 + 16) + 1, 1, v41);
          }
          unint64_t v43 = *(void *)(v41 + 16);
          unint64_t v42 = *(void *)(v41 + 24);
          if (v43 >= v42 >> 1) {
            unint64_t v41 = sub_25ACBBFD8(v42 > 1, v43 + 1, 1, v41);
          }
          *(void *)(v41 + 16) = v43 + 1;
          unint64_t v44 = v41;
          uint64_t v45 = v54;
          unint64_t v46 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
          unint64_t v56 = v44;
          uint64_t v47 = v55;
          (*(void (**)(unint64_t, char *, uint64_t))(v54 + 32))(v44 + v46 + *(void *)(v54 + 72) * v43, v53, v55);
          (*(void (**)(char *, uint64_t))(v45 + 8))(v52, v47);
          goto LABEL_10;
        }
      }
      swift_bridgeObjectRelease();
      sub_25ACD59E0();
      unint64_t v37 = sub_25ACD5A40();
      os_log_type_t v38 = sub_25ACD5CF0();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_25ACA4000, v37, v38, "Failed to capture array property because it contained a label", v39, 2u);
        MEMORY[0x261154430](v39, -1, -1);
      }

      v19(v67, v6);
LABEL_10:
      sub_25ACAEEE0((uint64_t)v76, v22);
      sub_25ACD5F30();
      if (!v81) {
        goto LABEL_19;
      }
    }
  }
  unint64_t v56 = MEMORY[0x263F8EE78];
LABEL_19:
  swift_release_n();
  return v56;
}

uint64_t sub_25ACB618C(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a2;
  uint64_t v67 = sub_25ACD5790();
  uint64_t v2 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v66 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_25ACD57A0();
  uint64_t v4 = *(void *)(v73 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v73);
  uint64_t v65 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v64 = (char *)&v57 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v70 = (char *)&v57 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v71 = (char *)&v57 - v11;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28E0);
  *(void *)&long long v78 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  long long v74 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25ACD5A50();
  uint64_t v83 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v88 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v57 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v57 - v19;
  sub_25ACD59E0();
  long long v21 = sub_25ACD5A40();
  os_log_type_t v22 = sub_25ACD5CD0();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_25ACA4000, v21, v22, "RealityKitHierarchy capturing dictionary", v23, 2u);
    MEMORY[0x261154430](v23, -1, -1);
  }

  os_log_type_t v82 = *(void (**)(char *, uint64_t))(v83 + 8);
  v83 += 8;
  v82(v20, v13);
  unint64_t v76 = sub_25ACB6BB8(MEMORY[0x263F8EE78]);
  sub_25ACD6060();
  uint64_t v24 = sub_25ACD5E80();
  swift_release();
  swift_retain();
  uint64_t v87 = v24;
  sub_25ACD5F30();
  if (!v101)
  {
LABEL_31:
    swift_release_n();
    return v76;
  }
  char v85 = &v100;
  uint64_t v86 = &v97;
  os_log_type_t v84 = v95;
  uint64_t v79 = &v93;
  uint64_t v80 = &v89;
  uint64_t v69 = (uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v68 = *MEMORY[0x263F78AF0];
  uint64_t v62 = (void (**)(char *, uint64_t))(v4 + 96);
  uint64_t v63 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v60 = (void (**)(char *, uint64_t))(v78 + 8);
  os_log_t v61 = (void (**)(char *, char *, uint64_t))(v78 + 32);
  uint64_t v58 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v4 + 16);
  *(void *)&long long v25 = 136315138;
  long long v78 = v25;
  uint64_t v77 = MEMORY[0x263F8EE58] + 8;
  uint64_t v26 = v82;
  uint64_t v81 = v13;
  while (1)
  {
    uint64_t v27 = v98;
    uint64_t v28 = v99;
    v96[0] = v98;
    v96[1] = v99;
    uint64_t v29 = v86;
    sub_25ACBE09C(v85, v86);
    swift_bridgeObjectRetain();
    sub_25ACD59E0();
    *(void *)&long long v94 = v27;
    *((void *)&v94 + 1) = v28;
    sub_25ACBDEEC((uint64_t)v29, (uint64_t)v84);
    sub_25ACBE138((uint64_t)&v94, (uint64_t)v92, &qword_26A4B2990);
    v91[0] = v94;
    v91[1] = v95[0];
    v91[2] = v95[1];
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_25ACD5A40();
    os_log_type_t v31 = sub_25ACD5CD0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v90 = v33;
      *(_DWORD *)uint64_t v32 = v78;
      sub_25ACBDEEC((uint64_t)v79, (uint64_t)v80);
      uint64_t v34 = sub_25ACD5B50();
      *(void *)(v32 + 4) = sub_25ACBC240(v34, v35, &v90);
      swift_bridgeObjectRelease();
      sub_25ACAEEE0((uint64_t)v91, &qword_26A4B2990);
      sub_25ACAEEE0((uint64_t)v92, &qword_26A4B2990);
      _os_log_impl(&dword_25ACA4000, v30, v31, "property value: %s", (uint8_t *)v32, 0xCu);
      swift_arrayDestroy();
      uint64_t v36 = v33;
      uint64_t v13 = v81;
      MEMORY[0x261154430](v36, -1, -1);
      uint64_t v37 = v32;
      uint64_t v26 = v82;
      MEMORY[0x261154430](v37, -1, -1);
    }
    else
    {
      sub_25ACAEEE0((uint64_t)v91, &qword_26A4B2990);
      sub_25ACAEEE0((uint64_t)v92, &qword_26A4B2990);
    }

    v26(v18, v13);
    if (v28)
    {
      swift_bridgeObjectRelease();
      sub_25ACD59E0();
      os_log_type_t v38 = sub_25ACD5A40();
      os_log_type_t v39 = sub_25ACD5CF0();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl(&dword_25ACA4000, v38, v39, "Failed to capture dictionary property because it contained a label", v40, 2u);
        MEMORY[0x261154430](v40, -1, -1);
      }

      v26(v88, v13);
      goto LABEL_12;
    }
    unint64_t v41 = v71;
    sub_25ACB6DEC(v86, v72);
    uint64_t v42 = v73;
    int v43 = (*v69)(v41, v73);
    if (v43 != v68)
    {
      sub_25ACAEEE0((uint64_t)v96, &qword_26A4B2990);
      (*v63)(v41, v42);
      goto LABEL_13;
    }
    (*v62)(v41, v42);
    swift_bridgeObjectRelease();
    unint64_t v44 = &v41[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2960) + 48)];
    (*v61)(v74, v44, v75);
    unint64_t v45 = sub_25ACD5700();
    if (v45 >> 62) {
      uint64_t v46 = sub_25ACD5EE0();
    }
    else {
      uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v46 < 2)
    {
      (*v60)(v74, v75);
LABEL_12:
      sub_25ACAEEE0((uint64_t)v96, &qword_26A4B2990);
      goto LABEL_13;
    }
    uint64_t result = sub_25ACD5700();
    if ((result & 0xC000000000000001) != 0)
    {
      MEMORY[0x261153D20](0, result);
      goto LABEL_22;
    }
    if (!*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    swift_retain();
LABEL_22:
    swift_bridgeObjectRelease();
    sub_25ACD5960();
    swift_release();
    uint64_t result = sub_25ACD5700();
    if ((result & 0xC000000000000001) != 0)
    {
      MEMORY[0x261153D20](1, result);
    }
    else
    {
      if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL) {
        goto LABEL_33;
      }
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v48 = v64;
    sub_25ACD5960();
    swift_release();
    uint64_t v49 = *v59;
    uint64_t v50 = (uint64_t)v65;
    uint64_t v51 = v70;
    uint64_t v52 = v73;
    (*v59)(v65, v70, v73);
    sub_25ACBE0F0(&qword_26A4B29A0, MEMORY[0x263F78B08]);
    sub_25ACD5D90();
    uint64_t v53 = (uint64_t)v66;
    sub_25ACD5780();
    v49((char *)v50, v48, v52);
    unint64_t v54 = v76;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v94 = v54;
    sub_25ACBCEE0(v50, v53, isUniquelyReferenced_nonNull_native);
    unint64_t v76 = v94;
    swift_bridgeObjectRelease();
    (*v58)(v53, v67);
    unint64_t v56 = *v63;
    (*v63)(v48, v52);
    v56(v51, v52);
    (*v60)(v74, v75);
    sub_25ACAEEE0((uint64_t)v96, &qword_26A4B2990);
    uint64_t v13 = v81;
    uint64_t v26 = v82;
LABEL_13:
    sub_25ACD5F30();
    if (!v101) {
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

unint64_t sub_25ACB6BB8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29B8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29A8);
  uint64_t v6 = sub_25ACD5F10();
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
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25ACBE138(v12, (uint64_t)v5, &qword_26A4B29B8);
    unint64_t result = sub_25ACBC94C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25ACD5790();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7];
    uint64_t v20 = sub_25ACD57A0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, v9, v20);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
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

uint64_t sub_25ACB6DEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v511 = a2;
  uint64_t v491 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28E0);
  uint64_t v489 = *(void *)(v491 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v491);
  int v461 = (char *)&v458 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v478 = (char *)&v458 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  int v459 = (char *)&v458 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int v473 = (char *)&v458 - v12;
  MEMORY[0x270FA5388](v11);
  v488 = (char *)&v458 - v13;
  uint64_t v495 = sub_25ACD5760();
  v492 = *(NSObject **)(v495 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v495);
  char v477 = (char *)&v458 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v497 = (char *)&v458 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v498 = (char *)&v458 - v19;
  MEMORY[0x270FA5388](v18);
  v499 = (char *)&v458 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28E8);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  int v466 = (char *)&v458 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  int v470 = (char *)&v458 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  int v463 = (char *)&v458 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  char v481 = (char *)&v458 - v29;
  MEMORY[0x270FA5388](v28);
  v527 = (char *)&v458 - v30;
  uint64_t v516 = sub_25ACD57A0();
  uint64_t v526 = *(void *)(v516 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v516);
  unsigned __int8 v467 = (char *)&v458 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v472 = (char *)&v458 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v458 = (char *)&v458 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  char v474 = (char *)&v458 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  char v480 = (char *)&v458 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v512 = (char *)&v458 - v42;
  MEMORY[0x270FA5388](v41);
  v514 = (char *)&v458 - v43;
  uint64_t v524 = sub_25ACD6040();
  v531 = *(void **)(v524 - 8);
  MEMORY[0x270FA5388](v524);
  v509 = (char *)&v458 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v523 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28F0);
  uint64_t v45 = MEMORY[0x270FA5388](v523);
  uint64_t v506 = (uint64_t)&v458 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v45);
  v520 = (unsigned long long *)((char *)&v458 - v47);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28F8);
  uint64_t v49 = MEMORY[0x270FA5388](v48 - 8);
  uint64_t v493 = (uint64_t)&v458 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  os_log_t v525 = (os_log_t)((char *)&v458 - v52);
  uint64_t v53 = MEMORY[0x270FA5388](v51);
  uint64_t v505 = (uint64_t)&v458 - v54;
  uint64_t v55 = MEMORY[0x270FA5388](v53);
  v519 = (void (*)(void))((char *)&v458 - v56);
  uint64_t v57 = MEMORY[0x270FA5388](v55);
  v530 = (char **)((char *)&v458 - v58);
  MEMORY[0x270FA5388](v57);
  uint64_t v60 = (char *)&v458 - v59;
  uint64_t v61 = sub_25ACD5A50();
  v532 = *(char **)(v61 - 8);
  uint64_t v62 = MEMORY[0x270FA5388](v61);
  unsigned __int8 v471 = (char *)&v458 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v484 = (char *)&v458 - v65;
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v482 = (char *)&v458 - v67;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  char v464 = (char *)&v458 - v69;
  uint64_t v70 = MEMORY[0x270FA5388](v68);
  uint64_t v465 = (char *)&v458 - v71;
  uint64_t v72 = MEMORY[0x270FA5388](v70);
  int v468 = (char *)&v458 - v73;
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  unsigned __int8 v469 = (char *)&v458 - v75;
  uint64_t v76 = MEMORY[0x270FA5388](v74);
  uint64_t v476 = (char *)&v458 - v77;
  uint64_t v78 = MEMORY[0x270FA5388](v76);
  v496 = (char *)&v458 - v79;
  uint64_t v80 = MEMORY[0x270FA5388](v78);
  v483 = (char *)&v458 - v81;
  uint64_t v82 = MEMORY[0x270FA5388](v80);
  char v462 = (char *)&v458 - v83;
  uint64_t v84 = MEMORY[0x270FA5388](v82);
  v487 = (char *)&v458 - v85;
  uint64_t v86 = MEMORY[0x270FA5388](v84);
  uint64_t v475 = (char *)&v458 - v87;
  uint64_t v88 = MEMORY[0x270FA5388](v86);
  char v479 = (char *)&v458 - v89;
  uint64_t v90 = MEMORY[0x270FA5388](v88);
  v510 = (char *)&v458 - v91;
  uint64_t v92 = MEMORY[0x270FA5388](v90);
  v507 = (char *)&v458 - v93;
  uint64_t v94 = MEMORY[0x270FA5388](v92);
  v513 = (char *)&v458 - v95;
  uint64_t v96 = MEMORY[0x270FA5388](v94);
  v508 = (char *)&v458 - v97;
  MEMORY[0x270FA5388](v96);
  uint64_t v99 = (char *)&v458 - v98;
  uint64_t v100 = sub_25ACD6070();
  uint64_t v101 = *(void *)(v100 - 8);
  uint64_t v102 = MEMORY[0x270FA5388](v100);
  unsigned __int8 v460 = (char *)&v458 - ((v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = MEMORY[0x270FA5388](v102);
  v490 = (char *)&v458 - v105;
  uint64_t v106 = MEMORY[0x270FA5388](v104);
  v486 = (char *)&v458 - v107;
  uint64_t v108 = MEMORY[0x270FA5388](v106);
  v494 = (char *)&v458 - v109;
  MEMORY[0x270FA5388](v108);
  uint64_t v111 = (char *)&v458 - v110;
  uint64_t v515 = a1;
  sub_25ACBDEEC(a1, (uint64_t)&v542);
  sub_25ACD6020();
  uint64_t v112 = sub_25ACD6030();
  sub_25ACD59E0();
  uint64_t v113 = sub_25ACD5A40();
  os_log_type_t v114 = sub_25ACD5CD0();
  BOOL v115 = os_log_type_enabled(v113, v114);
  v528 = v111;
  v518 = a3;
  uint64_t v522 = v100;
  uint64_t v529 = v61;
  uint64_t v521 = v101;
  uint64_t v485 = v112;
  if (v115)
  {
    int v116 = (uint8_t *)swift_slowAlloc();
    uint64_t v117 = swift_slowAlloc();
    *(void *)&unsigned long long v542 = v117;
    *(_DWORD *)int v116 = 136315138;
    *(void *)&unsigned long long v538 = v112;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
    uint64_t v118 = sub_25ACD5B50();
    *(void *)&unsigned long long v538 = sub_25ACBC240(v118, v119, (uint64_t *)&v542);
    uint64_t v111 = v528;
    sub_25ACD5D20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25ACA4000, v113, v114, "RealityKitHierarchy capturing PropertyValue of subjectType: %s", v116, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261154430](v117, -1, -1);
    MEMORY[0x261154430](v116, -1, -1);

    uint64_t v120 = (void (*)(char *, uint64_t))*((void *)v532 + 1);
    long long v121 = v99;
    uint64_t v122 = v529;
  }
  else
  {

    uint64_t v120 = (void (*)(char *, uint64_t))*((void *)v532 + 1);
    long long v121 = v99;
    uint64_t v122 = v61;
  }
  v517 = v120;
  v120(v121, v122);
  sub_25ACD6050();
  uint64_t v123 = *MEMORY[0x263F8E810];
  uint64_t v124 = (uint64_t)v531;
  uint64_t v125 = (void (*)(os_log_t, void, uint64_t))v531[13];
  uint64_t v126 = (void (*)(void, void))v530;
  uint64_t v127 = v524;
  v503 = (char *)(v531 + 13);
  v501 = v125;
  v125((os_log_t)v530, v123, v524);
  v502 = *(void (**)(os_log_t, void, uint64_t, uint64_t))(v124 + 56);
  uint64_t v500 = v124 + 56;
  v502((os_log_t)v126, 0, 1, v127);
  long long v128 = v520;
  uint64_t v129 = (uint64_t)v520 + *(int *)(v523 + 48);
  sub_25ACBE138((uint64_t)v60, (uint64_t)v520, &qword_26A4B28F8);
  sub_25ACBE138((uint64_t)v126, v129, &qword_26A4B28F8);
  char v130 = *(unsigned int (**)(unsigned long long *, uint64_t, uint64_t))(v124 + 48);
  unsigned int v131 = v130(v128, 1, v127);
  uint64_t v132 = v527;
  uint64_t v133 = v519;
  v504 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v130;
  if (v131 == 1)
  {
    sub_25ACAEEE0((uint64_t)v126, &qword_26A4B28F8);
    sub_25ACAEEE0((uint64_t)v60, &qword_26A4B28F8);
    unsigned int v134 = v130((unsigned long long *)v129, 1, v127);
    uint64_t v135 = v526;
    os_log_t v136 = v525;
    if (v134 == 1)
    {
      sub_25ACAEEE0((uint64_t)v128, &qword_26A4B28F8);
LABEL_11:
      sub_25ACD6060();
      sub_25ACBBD90(&v538);
      swift_release();
      if (v541)
      {
        unsigned long long v542 = v538;
        sub_25ACBE09C(&v539, &v543);
        uint64_t v145 = v508;
        sub_25ACD59E0();
        char v146 = sub_25ACD5A40();
        os_log_type_t v147 = sub_25ACD5CD0();
        if (os_log_type_enabled(v146, v147))
        {
          char v148 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v148 = 0;
          _os_log_impl(&dword_25ACA4000, v146, v147, "Unwrapping optional PropertyValue", v148, 2u);
          uint64_t v149 = v148;
          uint64_t v111 = v528;
          MEMORY[0x261154430](v149, -1, -1);
        }

        v517(v145, v529);
        sub_25ACB6DEC(&v543, v511);
        sub_25ACAEEE0((uint64_t)&v542, &qword_26A4B2990);
        return (*(uint64_t (**)(char *, uint64_t))(v521 + 8))(v111, v522);
      }
      long long v139 = &qword_26A4B2940;
      long long v140 = &v538;
      goto LABEL_16;
    }
  }
  else
  {
    sub_25ACBE138((uint64_t)v128, (uint64_t)v519, &qword_26A4B28F8);
    unsigned int v137 = v130((unsigned long long *)v129, 1, v127);
    uint64_t v138 = v526;
    if (v137 != 1)
    {
      uint64_t v141 = (uint64_t)v531;
      uint64_t v142 = v509;
      ((void (*)(char *, uint64_t, uint64_t))v531[4])(v509, v129, v127);
      char v143 = sub_25ACD5B30();
      char v144 = *(void (**)(char *, uint64_t))(v141 + 8);
      v144(v142, v127);
      sub_25ACAEEE0((uint64_t)v530, &qword_26A4B28F8);
      sub_25ACAEEE0((uint64_t)v60, &qword_26A4B28F8);
      v144((char *)v133, v127);
      uint64_t v132 = v527;
      uint64_t v111 = v528;
      sub_25ACAEEE0((uint64_t)v128, &qword_26A4B28F8);
      os_log_t v136 = v525;
      uint64_t v135 = v138;
      if ((v143 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_11;
    }
    sub_25ACAEEE0((uint64_t)v530, &qword_26A4B28F8);
    sub_25ACAEEE0((uint64_t)v60, &qword_26A4B28F8);
    ((void (*)(void (*)(void), uint64_t))v531[1])(v133, v127);
    os_log_t v136 = v525;
    uint64_t v135 = v138;
  }
  long long v139 = &qword_26A4B28F0;
  long long v140 = v128;
LABEL_16:
  sub_25ACAEEE0((uint64_t)v140, v139);
LABEL_17:
  uint64_t v151 = v515;
  sub_25ACBDEEC(v515, (uint64_t)&v542);
  sub_25ACD5770();
  uint64_t v152 = v516;
  uint64_t v153 = (uint64_t)v132;
  unint64_t v154 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v135 + 48);
  if (v154(v153, 1, v516) != 1)
  {
    char v164 = v514;
    v531 = *(void **)(v135 + 32);
    ((void (*)(char *, uint64_t, uint64_t))v531)(v514, v153, v152);
    uint64_t v165 = v513;
    sub_25ACD59E0();
    uint64_t v166 = v512;
    (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v512, v164, v152);
    uint64_t v167 = sub_25ACD5A40();
    os_log_type_t v168 = sub_25ACD5CD0();
    if (os_log_type_enabled(v167, v168))
    {
      char v169 = (uint8_t *)swift_slowAlloc();
      uint64_t v170 = swift_slowAlloc();
      *(void *)&unsigned long long v542 = v170;
      *(_DWORD *)char v169 = 136315138;
      v530 = (char **)(v169 + 4);
      sub_25ACBE0F0(&qword_26A4B2998, MEMORY[0x263F78B08]);
      uint64_t v171 = sub_25ACD5F60();
      *(void *)&unsigned long long v538 = sub_25ACBC240(v171, v172, (uint64_t *)&v542);
      sub_25ACD5D20();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v135 + 8))(v166, v152);
      _os_log_impl(&dword_25ACA4000, v167, v168, "Encoded PropertyValueType as known type: %s", v169, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261154430](v170, -1, -1);
      MEMORY[0x261154430](v169, -1, -1);

      v517(v513, v529);
      (*(void (**)(char *, uint64_t))(v521 + 8))(v528, v522);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v135 + 8))(v166, v152);
      v517(v165, v529);
      (*(void (**)(char *, uint64_t))(v521 + 8))(v111, v522);
    }
    return ((uint64_t (*)(void *, char *, uint64_t))v531)(v518, v514, v152);
  }
  v527 = (char *)v154;
  v530 = (char **)(v135 + 48);
  sub_25ACAEEE0(v153, &qword_26A4B28E8);
  sub_25ACBDEEC(v151, (uint64_t)&v535);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2900);
  if (swift_dynamicCast())
  {
    sub_25ACBE19C((long long *)&v538, (uint64_t)&v542);
    uint64_t v156 = *((void *)&v543 + 1);
    uint64_t v155 = v544;
    __swift_project_boxed_opaque_existential_1Tm(&v542, *((uint64_t *)&v543 + 1));
    v520 = *(unsigned long long **)(v155 + 16);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v158 = sub_25ACD5D10();
    uint64_t v159 = *(void *)(v158 - 8);
    MEMORY[0x270FA5388](v158);
    char v161 = (char *)&v458 - v160;
    ((void (*)(uint64_t, uint64_t))v520)(v156, v155);
    uint64_t v162 = *(void *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v162 + 48))(v161, 1, AssociatedTypeWitness) != 1)
    {
      uint64_t v537 = AssociatedTypeWitness;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v535);
      (*(void (**)(uint64_t *, char *, uint64_t))(v162 + 32))(boxed_opaque_existential_0, v161, AssociatedTypeWitness);
      sub_25ACBE09C(&v535, &v538);
      unint64_t v190 = v507;
      sub_25ACD59E0();
      sub_25ACBDEEC((uint64_t)&v538, (uint64_t)&v535);
      unint64_t v191 = sub_25ACD5A40();
      os_log_type_t v192 = sub_25ACD5CD0();
      if (os_log_type_enabled(v191, v192))
      {
        __int16 v193 = (uint8_t *)swift_slowAlloc();
        uint64_t v194 = swift_slowAlloc();
        uint64_t v534 = v194;
        *(_DWORD *)__int16 v193 = 136315138;
        __swift_project_boxed_opaque_existential_1Tm(&v535, v537);
        uint64_t DynamicType = swift_getDynamicType();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
        uint64_t v195 = sub_25ACD5B50();
        uint64_t DynamicType = sub_25ACBC240(v195, v196, &v534);
        sub_25ACD5D20();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v535);
        _os_log_impl(&dword_25ACA4000, v191, v192, "Unwrapping value as type: %s", v193, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261154430](v194, -1, -1);
        MEMORY[0x261154430](v193, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v535);
      }

      v517(v190, v529);
      uint64_t v201 = v522;
      char v202 = v528;
      uint64_t v203 = v521;
      sub_25ACB6DEC(&v538, v511);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v538);
      (*(void (**)(char *, uint64_t))(v203 + 8))(v202, v201);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v542);
    }
    (*(void (**)(char *, uint64_t))(v159 + 8))(v161, v158);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v542);
    uint64_t v163 = v516;
    uint64_t v135 = v526;
    uint64_t v111 = v528;
    uint64_t v151 = v515;
    os_log_t v136 = v525;
  }
  else
  {
    uint64_t v540 = 0;
    unsigned long long v538 = 0u;
    long long v539 = 0u;
    sub_25ACAEEE0((uint64_t)&v538, &qword_26A4B2908);
    uint64_t v163 = v152;
  }
  sub_25ACBDEEC(v151, (uint64_t)&v542);
  int v173 = swift_dynamicCast();
  unint64_t v174 = v510;
  if (v173)
  {
    sub_25ACBDF48(0, &qword_26A4B2910);
    uint64_t v175 = (void *)sub_25ACD5D00();
LABEL_30:
    id v176 = v175;
    sub_25ACD59E0();
    uint64_t v177 = sub_25ACD5A40();
    os_log_type_t v178 = sub_25ACD5CD0();
    BOOL v179 = os_log_type_enabled(v177, v178);
    uint64_t v180 = v522;
    uint64_t v181 = v529;
    char v182 = v518;
    if (v179)
    {
      uint64_t v183 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v183 = 0;
      _os_log_impl(&dword_25ACA4000, v177, v178, "Encoded PropertyValueType as a color", v183, 2u);
      unint64_t v184 = v183;
      uint64_t v111 = v528;
      MEMORY[0x261154430](v184, -1, -1);
    }

    v517(v174, v181);
    id v185 = objc_msgSend(v176, sel_CGColor);

    (*(void (**)(char *, uint64_t))(v521 + 8))(v111, v180);
    *char v182 = v185;
    uint64_t v186 = *MEMORY[0x263F78AE0];
    __int16 v187 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v135 + 104);
    char v188 = v182;
    return v187(v188, v186, v163);
  }
  sub_25ACBDEEC(v151, (uint64_t)&v542);
  sub_25ACBDF48(0, &qword_26A4B2910);
  if (swift_dynamicCast())
  {
    uint64_t v175 = (void *)v538;
    goto LABEL_30;
  }
  sub_25ACBDEEC(v151, (uint64_t)&v542);
  sub_25ACBDF48(0, &qword_26A4B2918);
  if (swift_dynamicCast())
  {
    char v197 = (UIImage *)v538;
    objc_msgSend((id)v538, sel_size);
    if (v198 > 1024.0 || ([(UIImage *)v197 size], v199 > 1024.0))
    {

      (*(void (**)(char *, uint64_t))(v521 + 8))(v111, v522);
      char v188 = v518;
      void *v518 = 0xD000000000000037;
      v188[1] = 0x800000025ACD7B10;
      char v200 = (unsigned int *)MEMORY[0x263F78AB0];
LABEL_101:
      uint64_t v186 = *v200;
      __int16 v187 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v135 + 104);
      return v187(v188, v186, v163);
    }
    __int16 v204 = UIImagePNGRepresentation(v197);
    if (v204)
    {
      char v205 = v204;
      uint64_t v206 = sub_25ACD51D0();
      uint64_t v208 = v207;

      char v209 = v479;
      sub_25ACD59E0();
      v210 = sub_25ACD5A40();
      os_log_type_t v211 = sub_25ACD5CD0();
      if (os_log_type_enabled(v210, v211))
      {
        uint64_t v212 = v163;
        char v213 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v213 = 0;
        _os_log_impl(&dword_25ACA4000, v210, v211, "Encoded PropertyValueType as an image", v213, 2u);
        char v214 = v213;
        uint64_t v163 = v212;
        MEMORY[0x261154430](v214, -1, -1);
      }

      v517(v209, v529);
      (*(void (**)(char *, uint64_t))(v521 + 8))(v528, v522);
      char v188 = v518;
      void *v518 = v206;
      v188[1] = v208;
      char v200 = (unsigned int *)MEMORY[0x263F78AE8];
      goto LABEL_101;
    }
  }
  uint64_t v215 = v505;
  sub_25ACD6050();
  uint64_t v216 = v524;
  v501(v136, *MEMORY[0x263F8E800], v524);
  v502(v136, 0, 1, v216);
  uint64_t v217 = v506;
  uint64_t v218 = v506 + *(int *)(v523 + 48);
  sub_25ACBE138(v215, v506, &qword_26A4B28F8);
  sub_25ACBE138((uint64_t)v136, v218, &qword_26A4B28F8);
  char v219 = v504;
  if (v504(v217, 1, v216) == 1)
  {
    sub_25ACAEEE0((uint64_t)v136, &qword_26A4B28F8);
    sub_25ACAEEE0(v215, &qword_26A4B28F8);
    int v220 = v219(v218, 1, v216);
    uint64_t v221 = v522;
    uint64_t v222 = v521;
    uint64_t v223 = v515;
    uint64_t v163 = v516;
    if (v220 == 1)
    {
      sub_25ACAEEE0(v506, &qword_26A4B28F8);
      uint64_t v135 = v526;
      goto LABEL_68;
    }
    goto LABEL_53;
  }
  uint64_t v224 = v493;
  sub_25ACBE138(v217, v493, &qword_26A4B28F8);
  int v225 = v219(v218, 1, v216);
  uint64_t v226 = v522;
  uint64_t v227 = v521;
  if (v225 == 1)
  {
    sub_25ACAEEE0((uint64_t)v525, &qword_26A4B28F8);
    sub_25ACAEEE0(v215, &qword_26A4B28F8);
    ((void (*)(uint64_t, uint64_t))v531[1])(v224, v216);
    uint64_t v223 = v515;
    uint64_t v221 = v226;
    uint64_t v222 = v227;
    uint64_t v163 = v516;
LABEL_53:
    sub_25ACAEEE0(v506, &qword_26A4B28F0);
    uint64_t v135 = v526;
    goto LABEL_54;
  }
  uint64_t v255 = (uint64_t)v531;
  long long v256 = v509;
  ((void (*)(char *, uint64_t, uint64_t))v531[4])(v509, v218, v216);
  LODWORD(v523) = sub_25ACD5B30();
  int v257 = *(void (**)(char *, uint64_t))(v255 + 8);
  v257(v256, v216);
  sub_25ACAEEE0((uint64_t)v525, &qword_26A4B28F8);
  sub_25ACAEEE0(v505, &qword_26A4B28F8);
  v257((char *)v224, v216);
  sub_25ACAEEE0(v506, &qword_26A4B28F8);
  uint64_t v223 = v515;
  uint64_t v135 = v526;
  uint64_t v221 = v226;
  uint64_t v222 = v227;
  uint64_t v163 = v516;
  if ((v523 & 1) == 0)
  {
LABEL_54:
    sub_25ACBDEEC(v223, (uint64_t)&v542);
    sub_25ACD56A0();
    if (swift_dynamicCast())
    {
      sub_25ACD59E0();
      swift_retain();
      char v228 = sub_25ACD5A40();
      os_log_type_t v229 = sub_25ACD5CD0();
      if (os_log_type_enabled(v228, v229))
      {
        __int16 v230 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)__int16 v230 = 134217984;
        *(void *)&unsigned long long v542 = sub_25ACD5640();
        uint64_t v221 = v522;
        sub_25ACD5D20();
        swift_release();
        _os_log_impl(&dword_25ACA4000, v228, v229, "Encoded PropertyValueType as an EntityID: %llu", v230, 0xCu);
        MEMORY[0x261154430](v230, -1, -1);
      }
      else
      {

        swift_release();
      }
      v517(v496, v529);
      uint64_t v263 = sub_25ACD5640();
      swift_release();
      (*(void (**)(char *, uint64_t))(v222 + 8))(v528, v221);
      char v188 = v518;
      void *v518 = v263;
      char v200 = (unsigned int *)MEMORY[0x263F78B00];
      goto LABEL_101;
    }
    char v231 = *(void (**)(char *, char *, uint64_t))(v222 + 16);
    uint64_t v232 = v222;
    __int16 v233 = v490;
    v231(v490, v111, v221);
    uint64_t v234 = v511 - 1;
    if (v511 < 1)
    {
      unsigned __int8 v274 = v233;
      int v237 = *(char ***)(v232 + 8);
      ((void (*)(char *, uint64_t))v237)(v274, v221);
      uint64_t v275 = v484;
LABEL_88:
      sub_25ACBDEEC(v223, (uint64_t)&v535);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2920);
      if (swift_dynamicCast())
      {
        sub_25ACBE19C((long long *)&v538, (uint64_t)&v542);
        char v294 = v482;
        sub_25ACD59E0();
        sub_25ACBDF84((uint64_t)&v542, (uint64_t)&v538);
        uint64_t v295 = sub_25ACD5A40();
        os_log_type_t v296 = sub_25ACD5CD0();
        if (os_log_type_enabled(v295, v296))
        {
          int v297 = (uint8_t *)swift_slowAlloc();
          v531 = (void *)swift_slowAlloc();
          *(void *)&long long v535 = v531;
          *(_DWORD *)int v297 = 136315138;
          v530 = (char **)(v297 + 4);
          __swift_project_boxed_opaque_existential_1Tm(&v538, *((uint64_t *)&v539 + 1));
          uint64_t v298 = sub_25ACD5F60();
          uint64_t v534 = sub_25ACBC240(v298, v299, (uint64_t *)&v535);
          uint64_t v300 = v522;
          sub_25ACD5D20();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v538);
          _os_log_impl(&dword_25ACA4000, v295, v296, "Encoded PropertyValueType as a string (CustomStringConvertible): %s", v297, 0xCu);
          uint64_t v301 = (uint64_t)v531;
          swift_arrayDestroy();
          MEMORY[0x261154430](v301, -1, -1);
          MEMORY[0x261154430](v297, -1, -1);

          v517(v482, v529);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v538);

          v517(v294, v529);
          uint64_t v300 = v522;
        }
        __swift_project_boxed_opaque_existential_1Tm(&v542, *((uint64_t *)&v543 + 1));
        uint64_t v333 = sub_25ACD5F60();
        uint64_t v335 = v334;
        ((void (*)(char *, uint64_t))v237)(v528, v300);
        int v336 = v518;
        void *v518 = v333;
        v336[1] = v335;
      }
      else
      {
        uint64_t v540 = 0;
        unsigned long long v538 = 0u;
        long long v539 = 0u;
        sub_25ACAEEE0((uint64_t)&v538, &qword_26A4B2928);
        sub_25ACBDEEC(v223, (uint64_t)&v535);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2930);
        if (!swift_dynamicCast())
        {
          uint64_t v540 = 0;
          unsigned long long v538 = 0u;
          long long v539 = 0u;
          sub_25ACAEEE0((uint64_t)&v538, &qword_26A4B2938);
          sub_25ACBDEEC(v223, (uint64_t)&v542);
          uint64_t v337 = sub_25ACD5B50();
          unint64_t v339 = v338;
          int v340 = v471;
          sub_25ACD59E0();
          swift_bridgeObjectRetain_n();
          unsigned __int8 v341 = sub_25ACD5A40();
          os_log_type_t v342 = sub_25ACD5CD0();
          if (os_log_type_enabled(v341, v342))
          {
            int v343 = (uint8_t *)swift_slowAlloc();
            uint64_t v344 = swift_slowAlloc();
            *(void *)&unsigned long long v542 = v344;
            v530 = v237;
            *(_DWORD *)int v343 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)&unsigned long long v538 = sub_25ACBC240(v337, v339, (uint64_t *)&v542);
            int v345 = v518;
            sub_25ACD5D20();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_25ACA4000, v341, v342, "Encoded PropertyValueType as a string (Unknown): %s", v343, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x261154430](v344, -1, -1);
            MEMORY[0x261154430](v343, -1, -1);

            v517(v471, v529);
            ((void (*)(char *, uint64_t))v530)(v528, v522);
          }
          else
          {
            swift_bridgeObjectRelease_n();

            v517(v340, v529);
            ((void (*)(char *, uint64_t))v237)(v528, v522);
            int v345 = v518;
          }
          *int v345 = v337;
          v345[1] = v339;
          return (*(uint64_t (**)(uint64_t *, void, uint64_t))(v135 + 104))(v345, *MEMORY[0x263F78AF8], v516);
        }
        sub_25ACBE19C((long long *)&v538, (uint64_t)&v542);
        sub_25ACD59E0();
        sub_25ACBDF84((uint64_t)&v542, (uint64_t)&v538);
        char v302 = sub_25ACD5A40();
        os_log_type_t v303 = sub_25ACD5CD0();
        if (os_log_type_enabled(v302, v303))
        {
          char v304 = (uint8_t *)swift_slowAlloc();
          uint64_t v305 = swift_slowAlloc();
          v530 = v237;
          char v306 = v275;
          uint64_t v307 = v305;
          uint64_t v534 = v305;
          *(_DWORD *)char v304 = 136315138;
          sub_25ACBDF84((uint64_t)&v538, (uint64_t)&v535);
          uint64_t v308 = sub_25ACD5B50();
          *(void *)&long long v535 = sub_25ACBC240(v308, v309, &v534);
          uint64_t v310 = v522;
          sub_25ACD5D20();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v538);
          _os_log_impl(&dword_25ACA4000, v302, v303, "Encoded PropertyValueType as a string (CustomDebugStringConvertible): %s", v304, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x261154430](v307, -1, -1);
          MEMORY[0x261154430](v304, -1, -1);

          char v311 = v306;
          int v237 = v530;
          v517(v311, v529);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v538);

          v517(v275, v529);
          uint64_t v310 = v522;
        }
        __swift_project_boxed_opaque_existential_1Tm(&v542, *((uint64_t *)&v543 + 1));
        uint64_t v373 = sub_25ACD5F90();
        uint64_t v375 = v374;
        ((void (*)(char *, uint64_t))v237)(v528, v310);
        char v376 = v518;
        void *v518 = v373;
        v376[1] = v375;
      }
      (*(void (**)(void))(v135 + 104))();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v542);
    }
    sub_25ACD6060();
    uint64_t v235 = sub_25ACD5E90();
    swift_release();
    v236 = v233;
    int v237 = *(char ***)(v232 + 8);
    ((void (*)(char *, uint64_t))v237)(v236, v221);
    if (v235 > 0)
    {
      char v238 = v476;
      sub_25ACD59E0();
      int v239 = sub_25ACD5A40();
      os_log_type_t v240 = sub_25ACD5CD0();
      if (os_log_type_enabled(v239, v240))
      {
        int v241 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v241 = 0;
        _os_log_impl(&dword_25ACA4000, v239, v240, "Unwrapping complex property type", v241, 2u);
        char v242 = v241;
        uint64_t v111 = v528;
        MEMORY[0x261154430](v242, -1, -1);
      }

      v531 = v532 + 8;
      v517(v238, v529);
      sub_25ACD6060();
      sub_25ACBBD90(&v542);
      swift_release();
      uint64_t v243 = v491;
      char v244 = v478;
      if (v545)
      {
        uint64_t v245 = *((void *)&v542 + 1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v543);
        if (v245)
        {
          swift_bridgeObjectRelease();
          sub_25ACB4EB4(v111, v234, MEMORY[0x263F8EE78]);
          if ((sub_25ACD5730() & 1) == 0)
          {
            int v381 = v465;
            sub_25ACD59E0();
            uint64_t v382 = v489;
            int v383 = *(void (**)(char *, char *, uint64_t))(v489 + 16);
            char v384 = v461;
            v383(v461, v244, v243);
            int v385 = sub_25ACD5A40();
            os_log_type_t v386 = sub_25ACD5CD0();
            LODWORD(v532) = v386;
            if (os_log_type_enabled(v385, v386))
            {
              uint64_t v387 = swift_slowAlloc();
              os_log_t v525 = v385;
              uint64_t v388 = v387;
              v527 = (char *)swift_slowAlloc();
              *(void *)&unsigned long long v542 = v527;
              *(_DWORD *)uint64_t v388 = 136315394;
              *(void *)&unsigned long long v538 = v485;
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
              uint64_t v389 = sub_25ACD5B50();
              v530 = v237;
              *(void *)&unsigned long long v538 = sub_25ACBC240(v389, v390, (uint64_t *)&v542);
              sub_25ACD5D20();
              swift_bridgeObjectRelease();
              *(_WORD *)(v388 + 12) = 2080;
              v383(v473, v384, v243);
              uint64_t v391 = sub_25ACD5B50();
              *(void *)&unsigned long long v538 = sub_25ACBC240(v391, v392, (uint64_t *)&v542);
              sub_25ACD5D20();
              int v237 = v530;
              uint64_t v382 = v489;
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v382 + 8))(v384, v243);
              os_log_t v393 = v525;
              _os_log_impl(&dword_25ACA4000, v525, (os_log_type_t)v532, "Encoded PropertyValueType as a nested type: %s -> %s", (uint8_t *)v388, 0x16u);
              unsigned __int8 v394 = v527;
              swift_arrayDestroy();
              MEMORY[0x261154430](v394, -1, -1);
              uint64_t v395 = v388;
              uint64_t v396 = v485;
              MEMORY[0x261154430](v395, -1, -1);

              v517(v465, v529);
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v382 + 8))(v384, v243);

              v517(v381, v529);
              uint64_t v396 = v485;
            }
            uint64_t v441 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2960);
            int v442 = v518;
            char v443 = (char *)v518 + *(int *)(v441 + 48);
            *(void *)&unsigned long long v542 = v396;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
            uint64_t v444 = sub_25ACD5B50();
            uint64_t v446 = v445;
            ((void (*)(char *, uint64_t))v237)(v528, v522);
            *int v442 = v444;
            v442[1] = v446;
            (*(void (**)(char *, char *, uint64_t))(v382 + 32))(v443, v244, v243);
            return (*(uint64_t (**)(uint64_t *, void, uint64_t))(v526 + 104))(v442, *MEMORY[0x263F78AF0], v516);
          }
          char v246 = v464;
          sub_25ACD59E0();
          uint64_t v247 = v460;
          uint64_t v248 = v522;
          v231(v460, v111, v522);
          char v249 = sub_25ACD5A40();
          os_log_type_t v250 = sub_25ACD5CE0();
          if (os_log_type_enabled(v249, v250))
          {
            char v251 = (uint8_t *)swift_slowAlloc();
            v530 = (char **)swift_slowAlloc();
            *(void *)&unsigned long long v542 = v530;
            *(_DWORD *)char v251 = 136315138;
            uint64_t v252 = sub_25ACD5F60();
            *(void *)&unsigned long long v538 = sub_25ACBC240(v252, v253, (uint64_t *)&v542);
            sub_25ACD5D20();
            swift_bridgeObjectRelease();
            ((void (*)(char *, uint64_t))v237)(v247, v248);
            _os_log_impl(&dword_25ACA4000, v249, v250, "Nested PropertyValueType has no properties %s", v251, 0xCu);
            uint64_t v254 = (void (*)(void, void))v530;
            swift_arrayDestroy();
            MEMORY[0x261154430](v254, -1, -1);
            MEMORY[0x261154430](v251, -1, -1);

            v517(v464, v529);
            (*(void (**)(char *, uint64_t))(v489 + 8))(v478, v491);
          }
          else
          {

            ((void (*)(char *, uint64_t))v237)(v247, v248);
            v517(v246, v529);
            (*(void (**)(char *, uint64_t))(v489 + 8))(v244, v243);
          }
          uint64_t v135 = v526;
          goto LABEL_87;
        }
      }
      else
      {
        sub_25ACAEEE0((uint64_t)&v542, &qword_26A4B2940);
      }
      sub_25ACBDEEC(v515, (uint64_t)&v542);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2948);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        uint64_t v346 = sub_25ACB618C((uint64_t)v111, v511);
        int v347 = v469;
        sub_25ACD59E0();
        swift_bridgeObjectRetain_n();
        unsigned __int8 v348 = sub_25ACD5A40();
        os_log_type_t v349 = sub_25ACD5CD0();
        int v350 = v349;
        if (os_log_type_enabled(v348, v349))
        {
          uint64_t v351 = swift_slowAlloc();
          LODWORD(v532) = v350;
          uint64_t v352 = v351;
          v527 = (char *)swift_slowAlloc();
          *(void *)&unsigned long long v542 = v527;
          *(_DWORD *)uint64_t v352 = 136315394;
          *(void *)&unsigned long long v538 = v485;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
          uint64_t v353 = sub_25ACD5B50();
          v530 = v237;
          *(void *)&unsigned long long v538 = sub_25ACBC240(v353, v354, (uint64_t *)&v542);
          sub_25ACD5D20();
          swift_bridgeObjectRelease();
          *(_WORD *)(v352 + 12) = 2080;
          sub_25ACD5790();
          sub_25ACBE0F0(&qword_26A4B2958, MEMORY[0x263F78AB8]);
          swift_bridgeObjectRetain();
          uint64_t v355 = sub_25ACD5AA0();
          unint64_t v357 = v356;
          swift_bridgeObjectRelease();
          *(void *)&unsigned long long v538 = sub_25ACBC240(v355, v357, (uint64_t *)&v542);
          sub_25ACD5D20();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25ACA4000, v348, (os_log_type_t)v532, "Encoded PropertyValueType as an dictionary: %s -> %s", (uint8_t *)v352, 0x16u);
          v358 = v527;
          swift_arrayDestroy();
          MEMORY[0x261154430](v358, -1, -1);
          MEMORY[0x261154430](v352, -1, -1);

          v517(v469, v529);
          ((void (*)(char *, uint64_t))v530)(v528, v522);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v517(v347, v529);
          ((void (*)(char *, uint64_t))v237)(v111, v522);
        }
        void *v518 = v346;
      }
      else
      {
        unint64_t v359 = sub_25ACB5B04((uint64_t)v111, v511);
        v360 = v468;
        sub_25ACD59E0();
        swift_bridgeObjectRetain_n();
        v361 = sub_25ACD5A40();
        os_log_type_t v362 = sub_25ACD5CD0();
        int v363 = v362;
        if (os_log_type_enabled(v361, v362))
        {
          uint64_t v364 = swift_slowAlloc();
          LODWORD(v532) = v363;
          uint64_t v365 = v364;
          uint64_t v366 = swift_slowAlloc();
          *(void *)&unsigned long long v542 = v366;
          *(_DWORD *)uint64_t v365 = 136315394;
          *(void *)&unsigned long long v538 = v485;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
          uint64_t v367 = sub_25ACD5B50();
          *(void *)&unsigned long long v538 = sub_25ACBC240(v367, v368, (uint64_t *)&v542);
          v530 = v237;
          sub_25ACD5D20();
          swift_bridgeObjectRelease();
          *(_WORD *)(v365 + 12) = 2080;
          uint64_t v369 = swift_bridgeObjectRetain();
          uint64_t v370 = MEMORY[0x261153B40](v369, v516);
          unint64_t v372 = v371;
          swift_bridgeObjectRelease();
          *(void *)&unsigned long long v538 = sub_25ACBC240(v370, v372, (uint64_t *)&v542);
          sub_25ACD5D20();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25ACA4000, v361, (os_log_type_t)v532, "Encoded PropertyValueType as an array: %s -> %s", (uint8_t *)v365, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x261154430](v366, -1, -1);
          MEMORY[0x261154430](v365, -1, -1);

          v517(v468, v529);
          ((void (*)(char *, uint64_t))v530)(v528, v522);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v517(v360, v529);
          ((void (*)(char *, uint64_t))v237)(v111, v522);
        }
        void *v518 = v359;
      }
      return (*(uint64_t (**)(void))(v526 + 104))();
    }
LABEL_87:
    uint64_t v223 = v515;
    uint64_t v275 = v484;
    goto LABEL_88;
  }
LABEL_68:
  sub_25ACD5750();
  sub_25ACD5750();
  sub_25ACD5750();
  sub_25ACD6060();
  sub_25ACBBD90(&v538);
  swift_release();
  if (!v541)
  {
    sub_25ACAEEE0((uint64_t)&v538, &qword_26A4B2940);
    uint64_t v264 = v515;
    sub_25ACBDEEC(v515, (uint64_t)&v542);
    uint64_t v265 = sub_25ACD5B50();
    unint64_t v267 = v266;
    sub_25ACBDEEC(v264, (uint64_t)&v535);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2968);
    char v268 = swift_dynamicCast();
    v531 = (void *)v265;
    if ((v268 & 1) == 0)
    {
      uint64_t v540 = 0;
      unsigned long long v538 = 0u;
      long long v539 = 0u;
      sub_25ACAEEE0((uint64_t)&v538, &qword_26A4B2970);
      uint64_t v272 = v495;
      int v273 = v483;
      goto LABEL_97;
    }
    sub_25ACBE19C((long long *)&v538, (uint64_t)&v542);
    *((void *)&v539 + 1) = MEMORY[0x263F8D310];
    *(void *)&unsigned long long v538 = v265;
    *((void *)&v538 + 1) = v267;
    swift_bridgeObjectRetain();
    uint64_t v269 = (uint64_t)v470;
    sub_25ACD5770();
    unsigned __int8 v270 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v527;
    int v271 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v527)(v269, 1, v163);
    uint64_t v272 = v495;
    if (v271 == 1)
    {
LABEL_77:
      int v273 = v483;
      uint64_t v221 = v522;
      sub_25ACAEEE0(v269, &qword_26A4B28E8);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v542);
LABEL_97:
      sub_25ACD59E0();
      swift_bridgeObjectRetain_n();
      int v321 = sub_25ACD5A40();
      os_log_type_t v322 = sub_25ACD5CD0();
      if (os_log_type_enabled(v321, v322))
      {
        uint64_t v323 = swift_slowAlloc();
        uint64_t v324 = swift_slowAlloc();
        *(void *)&unsigned long long v542 = v324;
        *(_DWORD *)uint64_t v323 = 136315394;
        *(void *)&unsigned long long v538 = v485;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
        uint64_t v325 = sub_25ACD5B50();
        uint64_t v326 = v222;
        *(void *)&unsigned long long v538 = sub_25ACBC240(v325, v327, (uint64_t *)&v542);
        sub_25ACD5D20();
        swift_bridgeObjectRelease();
        *(_WORD *)(v323 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v328 = (uint64_t)v531;
        *(void *)&unsigned long long v538 = sub_25ACBC240((uint64_t)v531, v267, (uint64_t *)&v542);
        sub_25ACD5D20();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25ACA4000, v321, v322, "Encoded PropertyValueType as an enumeration: %s -> %s", (uint8_t *)v323, 0x16u);
        swift_arrayDestroy();
        uint64_t v329 = v324;
        uint64_t v163 = v516;
        MEMORY[0x261154430](v329, -1, -1);
        MEMORY[0x261154430](v323, -1, -1);

        v517(v483, v529);
        isa = (void (*)(char *, uint64_t))v492[1].isa;
        uint64_t v331 = v495;
        isa(v497, v495);
        isa(v498, v331);
        isa(v499, v331);
        (*(void (**)(char *, uint64_t))(v326 + 8))(v528, v522);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        v517(v273, v529);
        unsigned __int8 v332 = (void (*)(char *, uint64_t))v492[1].isa;
        v332(v497, v272);
        v332(v498, v272);
        v332(v499, v272);
        (*(void (**)(char *, uint64_t))(v222 + 8))(v111, v221);
        uint64_t v328 = (uint64_t)v531;
      }
      char v188 = v518;
      void *v518 = v328;
      v188[1] = v267;
      char v200 = (unsigned int *)MEMORY[0x263F78AA8];
      goto LABEL_101;
    }
    os_log_t v525 = *(os_log_t *)(v135 + 32);
    ((void (*)(char *, uint64_t, uint64_t))v525)(v472, v269, v163);
    __swift_project_boxed_opaque_existential_1Tm(&v542, *((uint64_t *)&v543 + 1));
    *((void *)&v539 + 1) = swift_getAssociatedTypeWitness();
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v538);
    sub_25ACD5BF0();
    uint64_t v269 = (uint64_t)v466;
    sub_25ACD5770();
    if (v270(v269, 1, v163) == 1)
    {
      (*(void (**)(char *, uint64_t))(v135 + 8))(v472, v163);
      uint64_t v111 = v528;
      uint64_t v222 = v521;
      goto LABEL_77;
    }
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t, uint64_t))v525)(v467, v269, v163);
    sub_25ACD5970();
    sub_25ACBE0F0(&qword_26A4B2978, MEMORY[0x263F78A88]);
    sub_25ACBE0F0(&qword_26A4B2980, MEMORY[0x263F78B38]);
    int v397 = v459;
    sub_25ACD5740();
    v530 = (char **)v492[2].isa;
    unsigned __int8 v398 = v477;
    ((void (*)(char *, char *, uint64_t))v530)(v477, v499, v272);
    uint64_t v399 = *(void (**)(char *, char *, uint64_t))(v135 + 16);
    int v400 = v474;
    v399(v474, v472, v163);
    swift_allocObject();
    v531 = (void *)sub_25ACD5950();
    sub_25ACD5720();
    ((void (*)(char *, char *, uint64_t))v530)(v398, v498, v495);
    v399(v400, v467, v163);
    __swift_project_boxed_opaque_existential_1Tm(&v542, *((uint64_t *)&v543 + 1));
    *((void *)&v539 + 1) = swift_getAssociatedTypeWitness();
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v538);
    sub_25ACD5BF0();
    sub_25ACBE1DC(&v538);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v538);
    swift_allocObject();
    unsigned __int8 v401 = (char **)sub_25ACD5950();
    sub_25ACD5720();
    int v402 = v462;
    sub_25ACD59E0();
    unsigned __int8 v403 = sub_25ACD5A40();
    os_log_type_t v404 = sub_25ACD5CD0();
    if (os_log_type_enabled(v403, v404))
    {
      uint64_t v405 = swift_slowAlloc();
      v527 = (char *)swift_slowAlloc();
      *(void *)&unsigned long long v538 = v527;
      *(_DWORD *)uint64_t v405 = 136315394;
      uint64_t v406 = v485;
      *(void *)&long long v535 = v485;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
      v530 = v401;
      uint64_t v407 = sub_25ACD5B50();
      *(void *)&long long v535 = sub_25ACBC240(v407, v408, (uint64_t *)&v538);
      uint64_t v409 = v491;
      sub_25ACD5D20();
      swift_bridgeObjectRelease();
      *(_WORD *)(v405 + 12) = 2080;
      swift_beginAccess();
      unsigned __int8 v410 = v397;
      uint64_t v411 = v489;
      (*(void (**)(char *, char *, uint64_t))(v489 + 16))(v473, v410, v409);
      uint64_t v412 = sub_25ACD5B50();
      uint64_t v534 = sub_25ACBC240(v412, v413, (uint64_t *)&v538);
      sub_25ACD5D20();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25ACA4000, v403, v404, "Encoded PropertyValueType as an enumeration with raw value: %s -> %s", (uint8_t *)v405, 0x16u);
      int v414 = v527;
      swift_arrayDestroy();
      MEMORY[0x261154430](v414, -1, -1);
      MEMORY[0x261154430](v405, -1, -1);

      v517(v462, v529);
    }
    else
    {

      v517(v402, v529);
      unsigned __int8 v410 = v397;
      uint64_t v411 = v489;
      uint64_t v406 = v485;
    }
    uint64_t v447 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2960);
    int v448 = v518;
    v532 = (char *)v518 + *(int *)(v447 + 48);
    *(void *)&unsigned long long v538 = v406;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
    uint64_t v449 = sub_25ACD5B50();
    uint64_t v451 = v450;
    swift_release();
    swift_release();
    uint64_t v452 = v526;
    unsigned __int8 v453 = *(void (**)(char *, uint64_t))(v526 + 8);
    uint64_t v454 = v516;
    v453(v467, v516);
    v453(v472, v454);
    unsigned __int8 v455 = (void (*)(char *, uint64_t))v492[1].isa;
    uint64_t v456 = v495;
    v455(v497, v495);
    v455(v498, v456);
    v455(v499, v456);
    (*(void (**)(char *, uint64_t))(v521 + 8))(v528, v522);
    *int v448 = v449;
    v448[1] = v451;
    swift_beginAccess();
    uint64_t v457 = v491;
    (*(void (**)(char *, char *, uint64_t))(v411 + 16))(v532, v410, v491);
    (*(void (**)(uint64_t *, void, uint64_t))(v452 + 104))(v448, *MEMORY[0x263F78A90], v454);
    (*(void (**)(char *, uint64_t))(v411 + 8))(v410, v457);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v542);
  }
  unint64_t v259 = *((void *)&v538 + 1);
  uint64_t v258 = v538;
  unsigned long long v542 = v538;
  sub_25ACBE09C(&v539, &v543);
  sub_25ACBDEEC((uint64_t)&v543, (uint64_t)&v539);
  swift_bridgeObjectRetain();
  sub_25ACD6020();
  unsigned long long v538 = __PAIR128__(v259, v258);
  sub_25ACBDEEC((uint64_t)&v543, (uint64_t)&v539);
  char v260 = v486;
  (*(void (**)(char *, char *, uint64_t))(v222 + 16))(v486, v111, v221);
  if (v259)
  {
    int v261 = *(void (**)(char *, uint64_t))(v222 + 8);
    swift_bridgeObjectRetain();
    v261(v260, v221);
    unint64_t v262 = v259;
  }
  else
  {
    *(void *)&long long v535 = sub_25ACD6060();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2988);
    uint64_t v258 = sub_25ACD5B50();
    unint64_t v262 = v276;
    int v261 = *(void (**)(char *, uint64_t))(v222 + 8);
    v261(v260, v221);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v539);
  if (v511 < 1) {
    goto LABEL_83;
  }
  os_log_t v525 = (os_log_t)(v511 - 1);
  v531 = v261;
  uint64_t v277 = sub_25ACD5970();
  sub_25ACBE0F0(&qword_26A4B2978, MEMORY[0x263F78A88]);
  sub_25ACBE0F0(&qword_26A4B2980, MEMORY[0x263F78B38]);
  int v278 = v488;
  sub_25ACD5740();
  uint64_t v537 = MEMORY[0x263F8D310];
  *(void *)&long long v535 = v258;
  *((void *)&v535 + 1) = v262;
  swift_bridgeObjectRetain();
  uint64_t v279 = (uint64_t)v481;
  sub_25ACD5770();
  uint64_t v280 = v516;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v527)(v279, 1, v516) == 1)
  {
    sub_25ACAEEE0(v279, &qword_26A4B28E8);
    (*(void (**)(char *, uint64_t))(v489 + 8))(v278, v491);
    int v261 = (void (*)(char *, uint64_t))v531;
LABEL_83:
    sub_25ACBDEEC((uint64_t)&v543, (uint64_t)&v539);
    swift_bridgeObjectRelease();
    sub_25ACD5B50();
    *(void *)&unsigned long long v538 = v258;
    *((void *)&v538 + 1) = v262;
    sub_25ACD5BA0();
    sub_25ACD5BA0();
    swift_bridgeObjectRelease();
    sub_25ACD5BA0();
    unsigned long long v281 = v538;
    uint64_t v282 = v487;
    sub_25ACD59E0();
    swift_bridgeObjectRetain_n();
    int v283 = sub_25ACD5A40();
    os_log_type_t v284 = sub_25ACD5CD0();
    if (os_log_type_enabled(v283, v284))
    {
      int v285 = (uint8_t *)swift_slowAlloc();
      unsigned __int8 v286 = v261;
      uint64_t v287 = swift_slowAlloc();
      *(void *)&unsigned long long v538 = v287;
      *(_DWORD *)int v285 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v535 = sub_25ACBC240(v281, *((unint64_t *)&v281 + 1), (uint64_t *)&v538);
      unsigned __int8 v288 = (unsigned long long *)v518;
      sub_25ACD5D20();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25ACA4000, v283, v284, "Encoded PropertyValueType as an simplified enumeration: %s", v285, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261154430](v287, -1, -1);
      MEMORY[0x261154430](v285, -1, -1);

      v517(v487, v529);
      uint64_t v289 = v522;
      v286(v494, v522);
      sub_25ACAEEE0((uint64_t)&v542, &qword_26A4B2990);
      int v290 = (void (*)(char *, uint64_t))v492[1].isa;
      uint64_t v291 = v495;
      v290(v497, v495);
      v290(v498, v291);
      v290(v499, v291);
      v286(v528, v289);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v517(v282, v529);
      v261(v494, v221);
      sub_25ACAEEE0((uint64_t)&v542, &qword_26A4B2990);
      uint64_t v292 = (void (*)(char *, uint64_t))v492[1].isa;
      uint64_t v293 = v495;
      v292(v497, v495);
      v292(v498, v293);
      v292(v499, v293);
      v261(v528, v221);
      unsigned __int8 v288 = (unsigned long long *)v518;
    }
    *unsigned __int8 v288 = v281;
    return (*(uint64_t (**)(unsigned long long *, void, uint64_t))(v526 + 104))(v288, *MEMORY[0x263F78AA8], v516);
  }
  swift_bridgeObjectRelease();
  uint64_t v312 = v526;
  char v313 = *(unsigned long long **)(v526 + 32);
  uint64_t v314 = v480;
  uint64_t v523 = v526 + 32;
  v520 = v313;
  ((void (*)(char *, uint64_t, uint64_t))v313)(v480, v279, v280);
  char v315 = v492 + 2;
  v519 = (void (*)(void))v492[2].isa;
  v519();
  v514 = *(char **)(v312 + 16);
  ((void (*)(char *, char *, uint64_t))v514)(v474, v314, v280);
  uint64_t v515 = v277;
  swift_allocObject();
  uint64_t v524 = sub_25ACD5950();
  uint64_t v316 = v491;
  sub_25ACD5720();
  int v317 = v494;
  sub_25ACD6060();
  uint64_t v318 = sub_25ACD5E90();
  swift_release();
  if (v318 < 1)
  {
    uint64_t v377 = v519;
    os_log_t v525 = v315;
    char v378 = v520;
    uint64_t v379 = v477;
    sub_25ACBDEEC((uint64_t)&v543, (uint64_t)v536);
    swift_bridgeObjectRelease();
    uint64_t v380 = (uint64_t)v463;
    sub_25ACD5770();
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v527)(v380, 1, v280) == 1)
    {
      sub_25ACAEEE0(v380, &qword_26A4B28E8);
    }
    else
    {
      unsigned __int8 v415 = v458;
      ((void (*)(char *, uint64_t, uint64_t))v378)(v458, v380, v280);
      ((void (*)(char *, char *, uint64_t))v377)(v379, v497, v495);
      uint64_t v416 = (void (*)(uint64_t *, char *, uint64_t))v514;
      ((void (*)(char *, char *, uint64_t))v514)(v474, v415, v280);
      uint64_t v537 = v280;
      uint64_t v417 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v535);
      v416(v417, v415, v280);
      sub_25ACBE1DC(&v535);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v535);
      swift_allocObject();
      sub_25ACD5950();
      sub_25ACD5720();
      swift_release();
      (*(void (**)(char *, uint64_t))(v526 + 8))(v415, v280);
    }
    uint64_t v320 = v489;
  }
  else
  {
    swift_bridgeObjectRelease();
    int v319 = v473;
    sub_25ACB4EB4(v317, v525, MEMORY[0x263F8EE78]);
    sub_25ACD5710();
    uint64_t v320 = v489;
    (*(void (**)(char *, uint64_t))(v489 + 8))(v319, v316);
  }
  unsigned __int8 v418 = v475;
  sub_25ACD59E0();
  uint64_t v419 = sub_25ACD5A40();
  os_log_type_t v420 = sub_25ACD5CD0();
  if (os_log_type_enabled(v419, v420))
  {
    uint64_t v421 = swift_slowAlloc();
    uint64_t v422 = swift_slowAlloc();
    *(void *)&long long v535 = v422;
    *(_DWORD *)uint64_t v421 = 136315394;
    uint64_t v423 = v485;
    uint64_t v534 = v485;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
    uint64_t v424 = sub_25ACD5B50();
    uint64_t v534 = sub_25ACBC240(v424, v425, (uint64_t *)&v535);
    sub_25ACD5D20();
    swift_bridgeObjectRelease();
    *(_WORD *)(v421 + 12) = 2080;
    int v426 = v488;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v489 + 16))(v473, v426, v491);
    uint64_t v427 = sub_25ACD5B50();
    uint64_t DynamicType = sub_25ACBC240(v427, v428, (uint64_t *)&v535);
    uint64_t v320 = v489;
    sub_25ACD5D20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25ACA4000, v419, v420, "Encoded PropertyValueType as an enumeration with associated values: %s -> %s", (uint8_t *)v421, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261154430](v422, -1, -1);
    MEMORY[0x261154430](v421, -1, -1);

    v517(v475, v529);
  }
  else
  {

    v517(v418, v529);
    uint64_t v423 = v485;
  }
  char v429 = v494;
  uint64_t v430 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2960);
  unsigned int v431 = v518;
  v532 = (char *)v518 + *(int *)(v430 + 48);
  *(void *)&long long v535 = v423;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
  v530 = (char **)sub_25ACD5B50();
  uint64_t v529 = v432;
  swift_release();
  uint64_t v433 = v526;
  (*(void (**)(char *, uint64_t))(v526 + 8))(v480, v280);
  uint64_t v434 = v522;
  int v435 = (void (*)(char *, uint64_t))v531;
  ((void (*)(char *, uint64_t))v531)(v429, v522);
  sub_25ACAEEE0((uint64_t)&v542, &qword_26A4B2990);
  char v436 = (void (*)(char *, uint64_t))v492[1].isa;
  uint64_t v437 = v495;
  v436(v497, v495);
  v436(v498, v437);
  v436(v499, v437);
  v435(v528, v434);
  uint64_t v438 = v529;
  *unsigned int v431 = v530;
  v431[1] = v438;
  long long v439 = v488;
  swift_beginAccess();
  uint64_t v440 = v491;
  (*(void (**)(char *, char *, uint64_t))(v320 + 16))(v532, v439, v491);
  (*(void (**)(void *, void, uint64_t))(v433 + 104))(v431, *MEMORY[0x263F78AD0], v280);
  return (*(uint64_t (**)(char *, uint64_t))(v320 + 8))(v439, v440);
}

uint64_t sub_25ACBBD90@<X0>(_OWORD *a1@<X8>)
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v2 = sub_25ACD5DD0();
  swift_getObjectType();
  uint64_t result = sub_25ACD5DD0();
  if (v2 == result)
  {
    char v4 = sub_25ACD5DE0();
    swift_unknownObjectRelease();
    if (v4)
    {
      uint64_t result = swift_unknownObjectRelease();
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    else
    {
      sub_25ACD5EA0();
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25ACBBEAC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy;
  uint64_t v2 = sub_25ACD5940();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_25ACBBF10()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy;
  uint64_t v2 = sub_25ACD5940();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25ACBBFB4(unint64_t a1)
{
  return sub_25ACBDC40(a1);
}

uint64_t sub_25ACBBFD8(char a1, int64_t a2, char a3, unint64_t a4)
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
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29C0);
  uint64_t v10 = *(void *)(sub_25ACD57A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_25ACD5EB0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25ACD57A0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25ACBDAE8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_25ACBC240(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25ACBC314(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25ACBDEEC((uint64_t)v12, *a3);
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
      sub_25ACBDEEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25ACBC314(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25ACD5D30();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25ACBC4D0(a5, a6);
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
  uint64_t v8 = sub_25ACD5E10();
  if (!v8)
  {
    sub_25ACD5EB0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25ACD5F20();
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

uint64_t sub_25ACBC4D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25ACBC568(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25ACBC748(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25ACBC748(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25ACBC568(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25ACBC6E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25ACD5DC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25ACD5EB0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25ACD5BB0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25ACD5F20();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25ACD5EB0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25ACBC6E0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25ACBC748(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29D0);
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
  uint64_t result = sub_25ACD5F20();
  __break(1u);
  return result;
}

uint64_t sub_25ACBC898(uint64_t a1, unint64_t a2)
{
  sub_25ACBDA38(a1, a2);
  sub_25ACBD844(a1, a2);
  sub_25ACBDA90(a1, a2);
  uint64_t v4 = sub_25ACD5B80();
  swift_release();
  return v4;
}

uint64_t sub_25ACBC910@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25ACD5B80();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25ACBC94C(uint64_t a1)
{
  sub_25ACD5790();
  sub_25ACBE0F0(&qword_26A4B2958, MEMORY[0x263F78AB8]);
  uint64_t v2 = sub_25ACD5B10();

  return sub_25ACBD1D8(a1, v2);
}

uint64_t sub_25ACBC9E4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = sub_25ACD57A0();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25ACD5790();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29A8);
  int v50 = a2;
  uint64_t v12 = sub_25ACD5F00();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  unint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v43) {
      break;
    }
    uint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_25ACBE0F0(&qword_26A4B2958, MEMORY[0x263F78AB8]);
    uint64_t result = sub_25ACD5B10();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_25ACBCEE0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25ACD5790();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25ACBC94C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_25ACBD398();
      goto LABEL_7;
    }
    sub_25ACBC9E4(v17, a3 & 1);
    unint64_t v28 = sub_25ACBC94C(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_25ACBD0E4(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_25ACD5FC0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = sub_25ACD57A0();
  uint64_t v23 = *(void *)(v22 - 8);
  unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

uint64_t sub_25ACBD0E4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25ACD5790();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_25ACD57A0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

unint64_t sub_25ACBD1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25ACD5790();
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
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25ACBE0F0(&qword_26A4B29B0, MEMORY[0x263F78AB8]);
      char v15 = sub_25ACD5B30();
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

void *sub_25ACBD398()
{
  uint64_t v42 = sub_25ACD57A0();
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_25ACD5790();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  BOOL v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29A8);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_25ACD5EF0();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  char v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_25ACBD740(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_25ACBD794(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_25ACD5110();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_25ACD5130();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = sub_25ACD5120();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_25ACBD740(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

void *sub_25ACBD844(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_25ACD51E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29D0);
          unint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_25ACBDA38(a1, a2);
        uint64_t v13 = sub_25ACD51C0();
        sub_25ACBDA90(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x25ACBD9F0);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_25ACBDA00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25ACD5B80();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25ACBDA38(uint64_t a1, unint64_t a2)
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

uint64_t sub_25ACBDA90(uint64_t a1, unint64_t a2)
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

uint64_t sub_25ACBDAE8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25ACD57A0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_25ACD5F20();
  __break(1u);
  return result;
}

uint64_t sub_25ACBDC40(unint64_t a1)
{
  sub_25ACD56A0();
  swift_allocObject();
  sub_25ACD5690();
  sub_25ACD5660();
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v8 = swift_bridgeObjectRelease();
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 136))(v8);
    swift_release();
    return v9;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25ACD5EE0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 128);
  if (v3 >= 1)
  {
    swift_beginAccess();
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v7 = MEMORY[0x261153D20](i, a1);
      }
      else
      {
        uint64_t v7 = *(void *)(a1 + 8 * i + 32);
        swift_retain();
      }
      v5(v7, qword_26A4B28B8);
      swift_release();
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACBDE08()
{
  return type metadata accessor for SceneDebugRepresentationProvider();
}

uint64_t type metadata accessor for SceneDebugRepresentationProvider()
{
  uint64_t result = qword_26A4B2B78;
  if (!qword_26A4B2B78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25ACBDE5C()
{
  uint64_t result = sub_25ACD5940();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25ACBDEEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25ACBDF48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25ACBDF84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_25ACBE09C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25ACBE0F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25ACBE138(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25ACBE19C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_25ACBE1B4()
{
}

void sub_25ACBE1C8()
{
  qword_26A4B2B90 = MEMORY[0x263F8EE80];
}

uint64_t sub_25ACBE1DC(void *a1)
{
  uint64_t v2 = sub_25ACD6040();
  long long v3 = *(void **)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v57 = &v52[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28F0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v63 = &v52[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v52[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28F8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v61 = &v52[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v64 = &v52[-v14];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v69 = &v52[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v66 = &v52[-v18];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v52[-v20];
  MEMORY[0x270FA5388](v19);
  unint64_t v23 = &v52[-v22];
  uint64_t v24 = sub_25ACD6070();
  uint64_t v67 = *(void *)(v24 - 8);
  uint64_t v68 = v24;
  MEMORY[0x270FA5388](v24);
  int64_t v26 = &v52[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v56 = a1;
  sub_25ACBDEEC((uint64_t)a1, (uint64_t)&v73);
  sub_25ACD6020();
  sub_25ACD6050();
  uint64_t v27 = *MEMORY[0x263F8E810];
  uint64_t v58 = (void (*)(unsigned char *, uint64_t, uint64_t))v3[13];
  v58(v21, v27, v2);
  uint64_t v59 = (void (*)(unsigned char *, void, uint64_t, uint64_t))v3[7];
  v59(v21, 0, 1, v2);
  uint64_t v62 = v5;
  uint64_t v28 = *(int *)(v5 + 48);
  uint64_t v29 = (uint64_t)v9;
  uint64_t v30 = (uint64_t)&v9[v28];
  sub_25ACBEA20((uint64_t)v23, (uint64_t)v9);
  sub_25ACBEA20((uint64_t)v21, v30);
  uint64_t v65 = v3;
  uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v3[6];
  int v32 = v31(v29, 1, v2);
  uint64_t v60 = v3 + 13;
  if (v32 != 1)
  {
    sub_25ACBEA20(v29, (uint64_t)v66);
    if (v31(v30, 1, v2) != 1)
    {
      uint64_t v55 = v3 + 7;
      uint64_t v38 = v65;
      BOOL v39 = (void (*)(unsigned char *, uint64_t, uint64_t))v65[4];
      uint64_t v54 = v31;
      uint64_t v40 = v57;
      v39(v57, v30, v2);
      uint64_t v41 = v66;
      int v53 = sub_25ACD5B30();
      uint64_t v42 = (void (*)(unsigned char *, uint64_t))v38[1];
      uint64_t v43 = v40;
      uint64_t v31 = v54;
      v42(v43, v2);
      sub_25ACAEEE0((uint64_t)v21, &qword_26A4B28F8);
      sub_25ACAEEE0((uint64_t)v23, &qword_26A4B28F8);
      v42(v41, v2);
      sub_25ACAEEE0(v29, &qword_26A4B28F8);
      if (v53) {
        goto LABEL_17;
      }
LABEL_7:
      int64_t v34 = v69;
      sub_25ACD6050();
      uint64_t v35 = v64;
      v58(v64, *MEMORY[0x263F8E7E8], v2);
      v59(v35, 0, 1, v2);
      uint64_t v36 = v63;
      uint64_t v37 = (uint64_t)&v63[*(int *)(v62 + 48)];
      sub_25ACBEA20((uint64_t)v34, (uint64_t)v63);
      sub_25ACBEA20((uint64_t)v35, v37);
      if (v31((uint64_t)v36, 1, v2) == 1)
      {
        sub_25ACAEEE0((uint64_t)v35, &qword_26A4B28F8);
        sub_25ACAEEE0((uint64_t)v69, &qword_26A4B28F8);
        if (v31(v37, 1, v2) == 1)
        {
          uint64_t v33 = (uint64_t)v36;
          goto LABEL_10;
        }
      }
      else
      {
        sub_25ACBEA20((uint64_t)v36, (uint64_t)v61);
        if (v31(v37, 1, v2) != 1)
        {
          uint64_t v44 = v65;
          uint64_t v45 = v61;
          uint64_t v46 = v57;
          ((void (*)(unsigned char *, uint64_t, uint64_t))v65[4])(v57, v37, v2);
          char v47 = sub_25ACD5B30();
          uint64_t v48 = (void (*)(unsigned char *, uint64_t))v44[1];
          v48(v46, v2);
          sub_25ACAEEE0((uint64_t)v64, &qword_26A4B28F8);
          sub_25ACAEEE0((uint64_t)v69, &qword_26A4B28F8);
          v48(v45, v2);
          sub_25ACAEEE0((uint64_t)v36, &qword_26A4B28F8);
          if (v47) {
            goto LABEL_17;
          }
LABEL_19:
          __swift_project_boxed_opaque_existential_1Tm(v56, v56[3]);
          uint64_t DynamicType = (const void *)swift_getDynamicType();
          unsigned __int8 v49 = sub_25ACBEA88(DynamicType);
          goto LABEL_20;
        }
        sub_25ACAEEE0((uint64_t)v35, &qword_26A4B28F8);
        sub_25ACAEEE0((uint64_t)v69, &qword_26A4B28F8);
        ((void (*)(unsigned char *, uint64_t))v65[1])(v61, v2);
      }
      sub_25ACAEEE0((uint64_t)v36, &qword_26A4B28F0);
      goto LABEL_19;
    }
    sub_25ACAEEE0((uint64_t)v21, &qword_26A4B28F8);
    sub_25ACAEEE0((uint64_t)v23, &qword_26A4B28F8);
    ((void (*)(unsigned char *, uint64_t))v65[1])(v66, v2);
LABEL_6:
    sub_25ACAEEE0(v29, &qword_26A4B28F0);
    goto LABEL_7;
  }
  sub_25ACAEEE0((uint64_t)v21, &qword_26A4B28F8);
  sub_25ACAEEE0((uint64_t)v23, &qword_26A4B28F8);
  if (v31(v30, 1, v2) != 1) {
    goto LABEL_6;
  }
  uint64_t v33 = v29;
LABEL_10:
  sub_25ACAEEE0(v33, &qword_26A4B28F8);
LABEL_17:
  sub_25ACD6060();
  sub_25ACBBD90(&v70);
  swift_release();
  if (!v72)
  {
    (*(void (**)(unsigned char *, uint64_t))(v67 + 8))(v26, v68);
    sub_25ACAEEE0((uint64_t)&v70, &qword_26A4B2940);
    unsigned __int8 v49 = 0;
    return v49 & 1;
  }
  long long v73 = v70;
  sub_25ACBE09C(&v71, v74);
  unsigned __int8 v49 = sub_25ACBE1DC(v74);
  sub_25ACAEEE0((uint64_t)&v73, &qword_26A4B2990);
LABEL_20:
  (*(void (**)(unsigned char *, uint64_t))(v67 + 8))(v26, v68);
  return v49 & 1;
}

uint64_t sub_25ACBEA20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *sub_25ACBEA88(const void *a1)
{
  uint64_t v2 = sub_25ACD5A50();
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int v50 = (char *)&v45 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25ACD5A80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v45 - v15;
  if (qword_26A4B2B88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v17 = qword_26A4B2B90;
  if (*(void *)(qword_26A4B2B90 + 16))
  {
    unint64_t v18 = sub_25ACBF208((uint64_t)a1);
    if (v19)
    {
      char v20 = *(unsigned char *)(*(void *)(v17 + 56) + v18);
      swift_endAccess();
      return (const char *)(v20 & 1);
    }
  }
  swift_endAccess();
  memset(&v54, 0, sizeof(v54));
  if (!dladdr(a1, &v54))
  {
    uint64_t v22 = 1;
LABEL_10:
    uint64_t v49 = v2;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v22, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_25ACAEEE0((uint64_t)v9, &qword_26A4B29F0);
      sub_25ACD59E0();
      unint64_t v23 = sub_25ACD5A40();
      os_log_type_t v24 = sub_25ACD5CD0();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        int64_t v26 = (const char *)swift_slowAlloc();
        v54.dli_fname = v26;
        *(_DWORD *)uint64_t v25 = 136315138;
        uint64_t v52 = (uint64_t)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
        uint64_t v27 = sub_25ACD5B50();
        uint64_t v52 = sub_25ACBC240(v27, v28, (uint64_t *)&v54);
        sub_25ACD5D20();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25ACA4000, v23, v24, "Type %s unable to determine source - isInternal=unknown", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261154430](v26, -1, -1);
        MEMORY[0x261154430](v25, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v5, v49);
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v52 = qword_26A4B2B90;
      qword_26A4B2B90 = 0x8000000000000000;
      sub_25ACBF4EC(0, (uint64_t)a1, isUniquelyReferenced_nonNull_native);
      qword_26A4B2B90 = v52;
      swift_bridgeObjectRelease();
      swift_endAccess();
      char v20 = 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
      v54.dli_fname = (const char *)sub_25ACD5A70();
      v54.dli_fbase = v30;
      uint64_t v52 = 0xD000000000000010;
      unint64_t v53 = 0x800000025ACD7E30;
      sub_25ACAEE8C();
      char v20 = sub_25ACD5D60();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      char v31 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v52 = qword_26A4B2B90;
      qword_26A4B2B90 = 0x8000000000000000;
      sub_25ACBF4EC(v20 & 1, (uint64_t)a1, v31);
      qword_26A4B2B90 = v52;
      swift_bridgeObjectRelease();
      swift_endAccess();
      int v32 = v50;
      sub_25ACD59E0();
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
      uint64_t v33 = sub_25ACD5A40();
      os_log_type_t v34 = sub_25ACD5CD0();
      int v35 = v34;
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v36 = swift_slowAlloc();
        int v47 = v20 & 1;
        uint64_t v37 = v36;
        uint64_t v48 = (const char *)swift_slowAlloc();
        v54.dli_fname = v48;
        *(_DWORD *)uint64_t v37 = 136315650;
        int v46 = v35;
        uint64_t v52 = (uint64_t)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2950);
        uint64_t v38 = sub_25ACD5B50();
        uint64_t v52 = sub_25ACBC240(v38, v39, (uint64_t *)&v54);
        sub_25ACD5D20();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        uint64_t v40 = sub_25ACD5A70();
        uint64_t v52 = sub_25ACBC240(v40, v41, (uint64_t *)&v54);
        sub_25ACD5D20();
        swift_bridgeObjectRelease();
        uint64_t v42 = *(void (**)(char *, uint64_t))(v11 + 8);
        v42(v14, v10);
        *(_WORD *)(v37 + 22) = 1024;
        LODWORD(v52) = v47;
        sub_25ACD5D20();
        _os_log_impl(&dword_25ACA4000, v33, (os_log_type_t)v46, "Type %s source: %s, isInternal=%{BOOL}d", (uint8_t *)v37, 0x1Cu);
        uint64_t v43 = v48;
        swift_arrayDestroy();
        MEMORY[0x261154430](v43, -1, -1);
        MEMORY[0x261154430](v37, -1, -1);

        (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v49);
        v42(v16, v10);
      }
      else
      {

        uint64_t v44 = *(void (**)(char *, uint64_t))(v11 + 8);
        v44(v14, v10);
        (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v49);
        v44(v16, v10);
      }
    }
    return (const char *)(v20 & 1);
  }
  uint64_t result = v54.dli_fname;
  if (v54.dli_fname)
  {
    sub_25ACD5A60();
    uint64_t v22 = 0;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

unint64_t sub_25ACBF208(uint64_t a1)
{
  uint64_t v2 = sub_25ACD5FE0();

  return sub_25ACBF620(a1, v2);
}

uint64_t sub_25ACBF24C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29F8);
  uint64_t result = sub_25ACD5F00();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    int v32 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v10;
    uint64_t v31 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v32;
                goto LABEL_38;
              }
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v30;
              }
              uint64_t v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      char v22 = *(unsigned char *)(*(void *)(v5 + 56) + v17);
      uint64_t result = sub_25ACD5FE0();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      *(unsigned char *)(*(void *)(v7 + 56) + v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACBF4EC(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25ACBF208(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25ACBF6BC();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1 & 1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(void *)(v16[6] + 8 * v10) = a2;
    *(unsigned char *)(v16[7] + v10) = a1 & 1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_25ACBF24C(result, a3 & 1);
  uint64_t result = sub_25ACBF208(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

unint64_t sub_25ACBF620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_25ACBF6BC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25ACBF850()
{
  uint64_t v0 = sub_25ACD5620();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2800);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_25ACD56A0();
  sub_25ACD5260();
  sub_25ACD5600();
  while (1)
  {
    sub_25ACD5610();
    if (!v9) {
      break;
    }
    uint64_t v5 = swift_retain();
    MEMORY[0x261153B30](v5);
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25ACD5C30();
    }
    sub_25ACD5C40();
    uint64_t v6 = sub_25ACD5C20();
    unint64_t v7 = sub_25ACBF850(v6);
    sub_25ACBFC68(v7);
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

uint64_t sub_25ACBFA14()
{
  uint64_t v0 = sub_25ACD5620();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2800);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)&v13 - v6;
  uint64_t v14 = MEMORY[0x263F8EE78];
  sub_25ACD56A0();
  sub_25ACD5260();
  sub_25ACD5600();
  while (1)
  {
    sub_25ACD5610();
    if (!v13) {
      break;
    }
    uint64_t v8 = swift_retain();
    MEMORY[0x261153B30](v8);
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25ACD5C30();
    }
    sub_25ACD5C40();
    sub_25ACD5C20();
    swift_release();
  }
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v7, v1);
  sub_25ACD5260();
  sub_25ACD5600();
  while (1)
  {
    uint64_t v10 = sub_25ACD5610();
    if (!v13) {
      break;
    }
    unint64_t v11 = sub_25ACBFA14(v10);
    sub_25ACBFC68(v11);
    swift_release();
  }
  v9(v5, v1);
  return v14;
}

uint64_t sub_25ACBFC68(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25ACD5EE0();
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
    uint64_t v5 = sub_25ACD5EE0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
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
    unint64_t v4 = MEMORY[0x261153D30](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25ACAA764(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25ACD5EE0();
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

  return sub_25ACD5C20();
}

uint64_t Array.appending<A>(contentsOf:)(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = a2;
  (*(void (**)(char *))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25ACD5C60();
  swift_bridgeObjectRetain();
  sub_25ACD5C50();
  return v7;
}

uint64_t Array<A>.removingDuplicates()()
{
  sub_25ACD5A90();
  sub_25ACD5C60();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v0 = sub_25ACD5E20();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_25ACC0004()
{
  sub_25ACD5AF0();
  sub_25ACD5AB0();
  return v1 == 2;
}

uint64_t Array<A>.removeDuplicates()()
{
  uint64_t v1 = Array<A>.removingDuplicates()();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v0 = v1;
  return result;
}

uint64_t sub_25ACC00BC()
{
  sub_25ACD5350();
  sub_25ACD5340();
  sub_25ACD5330();
  swift_release();
  sub_25ACD5310();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v1);
}

uint64_t sub_25ACC0134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v71 = a2;
  uint64_t v2 = sub_25ACD52A0();
  uint64_t v62 = *(void *)(v2 - 8);
  uint64_t v63 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v67 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A00);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v61 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25ACD5280();
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v57 = (char *)v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_25ACD52F0();
  uint64_t v66 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v65 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_25ACD5A50();
  uint64_t v72 = *(void *)(v70 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v70);
  uint64_t v69 = (char *)v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v55 - v11;
  uint64_t v13 = sub_25ACD51B0();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  char v16 = (char *)v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  int64_t v19 = (char *)v55 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v55 - v20;
  uint64_t v22 = sub_25ACD5210();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  unint64_t v25 = (char *)v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACD5200();
  uint64_t v26 = sub_25ACD51F0();
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
  uint64_t v29 = v13;
  id v30 = objc_msgSend(self, sel_defaultManager);
  id v31 = objc_msgSend(v30, sel_temporaryDirectory);

  sub_25ACD5190();
  v75[0] = v26;
  v75[1] = v28;
  sub_25ACD5BA0();
  sub_25ACD5180();
  swift_bridgeObjectRelease();
  uint64_t v32 = v73;
  uint64_t v33 = v73 + 8;
  os_log_type_t v34 = *(void (**)(char *, uint64_t))(v73 + 8);
  v34(v19, v29);
  sub_25ACD59D0();
  int v35 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  uint64_t v36 = v16;
  uint64_t v68 = v21;
  v35(v16, v21, v29);
  uint64_t v56 = (void (*)(void, void))v12;
  uint64_t v37 = sub_25ACD5A40();
  os_log_type_t v38 = sub_25ACD5CD0();
  BOOL v39 = os_log_type_enabled(v37, v38);
  v55[2] = v33;
  v55[1] = v34;
  if (v39)
  {
    uint64_t v40 = v34;
    unint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v75[0] = v42;
    *(_DWORD *)unint64_t v41 = 136315138;
    v55[0] = v41 + 4;
    sub_25ACC1C18(&qword_26A4B2A10, MEMORY[0x263F06EA8]);
    uint64_t v43 = sub_25ACD5F60();
    uint64_t v74 = sub_25ACBC240(v43, v44, v75);
    sub_25ACD5D20();
    swift_bridgeObjectRelease();
    v40(v36, v29);
    _os_log_impl(&dword_25ACA4000, v37, v38, "writing to %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261154430](v42, -1, -1);
    MEMORY[0x261154430](v41, -1, -1);
  }
  else
  {
    v34(v16, v29);
  }

  uint64_t v45 = v56;
  uint64_t v56 = *(void (**)(void, void))(v72 + 8);
  v56(v45, v70);
  int v46 = v68;
  uint64_t v47 = v63;
  uint64_t v48 = v61;
  uint64_t v49 = v62;
  uint64_t v50 = v60;
  (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, *MEMORY[0x263F16190], v59);
  uint64_t v51 = v65;
  sub_25ACD5290();
  sub_25ACD52D0();
  (*(void (**)(char *, void, uint64_t))(v49 + 104))(v67, *MEMORY[0x263F16198], v47);
  sub_25ACD52B0();
  uint64_t v52 = sub_25ACD52C0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v48, 0, 1, v52);
  sub_25ACD52E0();
  sub_25ACD5300();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v51, v50);
  uint64_t v53 = v73;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v71, v46, v29);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v71, 0, 1, v29);
}

uint64_t sub_25ACC0AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25ACD51B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  uint64_t v5 = *MEMORY[0x263F78B48];
  uint64_t v6 = sub_25ACD59C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(a2, v5, v6);
}

uint64_t sub_25ACC0BA8(char a1, int64_t a2, char a3, unint64_t a4)
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
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A40);
  uint64_t v10 = *(void *)(sub_25ACD51B0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_25ACD5EB0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25ACD51B0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25ACC131C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_25ACC0E10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25ACC0E88(a1, a2, a3, (void *)*v3, &qword_26A4B2A48, MEMORY[0x263F78B50]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25ACC0E4C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25ACC0E88(a1, a2, a3, (void *)*v3, &qword_26A4B2A50, MEMORY[0x263F161D8]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25ACC0E88(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
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
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
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
  uint64_t result = sub_25ACD5F20();
  __break(1u);
  return result;
}

uint64_t sub_25ACC10D0(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25ACD5320();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    if (!v8) {
      return v9;
    }
    uint64_t v21 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25ACC0E4C(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0) {
      break;
    }
    uint64_t v19 = v7;
    unint64_t v20 = a1;
    uint64_t v11 = 0;
    uint64_t v9 = v21;
    unint64_t v17 = a1 & 0xC000000000000001;
    uint64_t v18 = v8;
    v16[0] = v4;
    v16[1] = v5 + 32;
    while (v8 != v11)
    {
      if (v17) {
        MEMORY[0x261153D20](v11, a1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = (char *)v16[0];
      uint64_t v12 = v19;
      uint64_t v13 = v2;
      Entity.augmentedWithPersistentIDs<A>(_:)((uint64_t (*)(uint64_t))sub_25ACC00BC);
      uint64_t v4 = v2;
      swift_release();
      uint64_t v21 = v9;
      unint64_t v15 = *(void *)(v9 + 16);
      unint64_t v14 = *(void *)(v9 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_25ACC0E4C(v14 > 1, v15 + 1, 1);
        uint64_t v9 = v21;
      }
      ++v11;
      *(void *)(v9 + 16) = v15 + 1;
      (*(void (**)(unint64_t, char *, char *))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v15, v12, v7);
      uint64_t v8 = v18;
      uint64_t v2 = v13;
      a1 = v20;
      if (v18 == v11) {
        return v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25ACD5EE0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACC131C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25ACD51B0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_25ACD5F20();
  __break(1u);
  return result;
}

uint64_t sub_25ACC1474(unint64_t a1)
{
  uint64_t v57 = sub_25ACD59C0();
  uint64_t v64 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57 - 8);
  uint64_t v65 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B28B0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25ACD51B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v63 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v62 = (char *)&v52 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v56 = (char *)&v52 - v12;
  uint64_t v61 = sub_25ACD5320();
  uint64_t v13 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  unint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25ACC10D0(a1);
  uint64_t v53 = 0;
  uint64_t v17 = *(void *)(v16 + 16);
  uint64_t v66 = v7;
  if (v17)
  {
    unint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
    uint64_t v18 = v13 + 16;
    uint64_t v19 = v20;
    unint64_t v21 = (*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64);
    uint64_t v52 = v16;
    unint64_t v22 = v16 + v21;
    uint64_t v23 = *(void *)(v18 + 56);
    uint64_t v59 = (void (**)(char *, uint64_t))(v18 - 8);
    uint64_t v60 = v23;
    uint64_t v58 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v24 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    unint64_t v25 = MEMORY[0x263F8EE78];
    Dl_info v54 = v20;
    uint64_t v55 = v5;
    uint64_t v26 = v18;
    do
    {
      uint64_t v27 = v61;
      v19(v15, v22, v61);
      sub_25ACC0134((uint64_t)v15, (uint64_t)v5);
      (*v59)(v15, v27);
      if ((*v58)(v5, 1, v6) == 1)
      {
        sub_25ACB3358((uint64_t)v5);
      }
      else
      {
        uint64_t v28 = v26;
        uint64_t v29 = *v24;
        id v30 = v56;
        (*v24)(v56, v5, v6);
        v29(v62, v30, v6);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v25 = sub_25ACC0BA8(0, *(void *)(v25 + 16) + 1, 1, v25);
        }
        unint64_t v32 = *(void *)(v25 + 16);
        unint64_t v31 = *(void *)(v25 + 24);
        uint64_t v33 = v25;
        uint64_t v26 = v28;
        if (v32 >= v31 >> 1) {
          uint64_t v33 = sub_25ACC0BA8(v31 > 1, v32 + 1, 1, v25);
        }
        uint64_t v19 = v54;
        *(void *)(v33 + 16) = v32 + 1;
        unint64_t v25 = v33;
        v29((char *)(v33+ ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80))+ *(void *)(v66 + 72) * v32), v62, v6);
        uint64_t v5 = v55;
      }
      v22 += v60;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v25 = MEMORY[0x263F8EE78];
  }
  int64_t v34 = *(void *)(v25 + 16);
  int v35 = (void (**)(char *, uint64_t))v25;
  uint64_t v36 = v65;
  if (v34)
  {
    uint64_t v67 = MEMORY[0x263F8EE78];
    sub_25ACC0E10(0, v34, 0);
    uint64_t v37 = v57;
    os_log_type_t v38 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
    uint64_t v39 = *(unsigned __int8 *)(v66 + 80);
    uint64_t v59 = v35;
    uint64_t v40 = (char *)v35 + ((v39 + 32) & ~v39);
    uint64_t v62 = *(char **)(v66 + 72);
    LODWORD(v61) = *MEMORY[0x263F78B48];
    unint64_t v41 = (void (**)(char *, void, uint64_t))(v64 + 104);
    v66 += 16;
    uint64_t v42 = (void (**)(char *, uint64_t))(v66 - 8);
    uint64_t v60 = v64 + 32;
    do
    {
      uint64_t v43 = v63;
      v38(v63, v40, v6);
      v38(v36, v43, v6);
      (*v41)(v36, v61, v37);
      (*v42)(v43, v6);
      uint64_t v44 = v67;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25ACC0E10(0, *(void *)(v44 + 16) + 1, 1);
        uint64_t v37 = v57;
        uint64_t v44 = v67;
      }
      unint64_t v46 = *(void *)(v44 + 16);
      unint64_t v45 = *(void *)(v44 + 24);
      if (v46 >= v45 >> 1)
      {
        sub_25ACC0E10(v45 > 1, v46 + 1, 1);
        uint64_t v37 = v57;
        uint64_t v44 = v67;
      }
      *(void *)(v44 + 16) = v46 + 1;
      unint64_t v47 = v44
          + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))
          + *(void *)(v64 + 72) * v46;
      uint64_t v36 = v65;
      (*(void (**)(unint64_t, char *, uint64_t))(v64 + 32))(v47, v65, v37);
      uint64_t v67 = v44;
      uint64_t v40 = &v62[(void)v40];
      --v34;
    }
    while (v34);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v44 = MEMORY[0x263F8EE78];
  }
  sub_25ACD5160();
  swift_allocObject();
  sub_25ACD5150();
  uint64_t v67 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A18);
  sub_25ACC1B00();
  uint64_t v48 = v53;
  uint64_t v49 = sub_25ACD5140();
  if (v48)
  {
    MEMORY[0x261154280](v48);
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  else
  {
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v50;
}

ValueMetadata *type metadata accessor for RealityFileProvider()
{
  return &type metadata for RealityFileProvider;
}

unint64_t sub_25ACC1B00()
{
  unint64_t result = qword_26A4B2A20;
  if (!qword_26A4B2A20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B2A18);
    sub_25ACC1B74();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2A20);
  }
  return result;
}

unint64_t sub_25ACC1B74()
{
  unint64_t result = qword_26A4B2A28;
  if (!qword_26A4B2A28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B2A30);
    sub_25ACC1C18(&qword_26A4B2A38, MEMORY[0x263F78B50]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2A28);
  }
  return result;
}

uint64_t sub_25ACC1C18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25ACC1C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void *sub_25ACC1C74()
{
  return &unk_25ACD6B60;
}

void *sub_25ACC1C80()
{
  return &unk_25ACD6B68;
}

uint64_t sub_25ACC1C8C()
{
  return 0;
}

char *sub_25ACC1C98()
{
  return &byte_26A4B2DE8;
}

uint64_t sub_25ACC1CA4()
{
  return byte_26A4B2DE8;
}

uint64_t sub_25ACC1CE8(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26A4B2DE8 = a1;
  return result;
}

uint64_t (*sub_25ACC1D30())()
{
  return j__swift_endAccess;
}

void sub_25ACC1D88(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 28) = 1;
  *(_DWORD *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 36) = 1;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 52) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 1;
  *(_DWORD *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 68) = 1;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 108) = 1;
  *(_DWORD *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 116) = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 124) = 1;
  *(void *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 136) = 1;
  *(_DWORD *)(a1 + 144) = 0;
  *(unsigned char *)(a1 + 148) = 1;
  *(_DWORD *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 156) = 1;
  *(_DWORD *)(a1 + 160) = 0;
  *(unsigned char *)(a1 + 164) = 1;
  *(_DWORD *)(a1 + 168) = 0;
  *(unsigned char *)(a1 + 172) = 1;
  *(_DWORD *)(a1 + 176) = 0;
  *(unsigned char *)(a1 + 180) = 1;
  *(void *)(a1 + 184) = 0;
  *(_DWORD *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 196) = 1;
  *(_DWORD *)(a1 + 200) = 0;
  *(unsigned char *)(a1 + 204) = 1;
  *(_DWORD *)(a1 + 208) = 0;
  *(unsigned char *)(a1 + 212) = 1;
  *(void *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 224) = 0;
  *(unsigned char *)(a1 + 228) = 1;
  *(_DWORD *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 236) = 1;
  *(_DWORD *)(a1 + 240) = 0;
  *(unsigned char *)(a1 + 244) = 1;
  *(void *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 256) = 0;
  *(unsigned char *)(a1 + 260) = 1;
  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 272) = 0;
  *(unsigned char *)(a1 + 280) = 1;
  *(void *)(a1 + 288) = 0;
}

uint64_t sub_25ACC1F60()
{
  return 0;
}

uint64_t sub_25ACC1F6C@<X0>(uint64_t (*a1)(void, uint64_t, uint64_t)@<X0>, uint64_t (*a2)(void, uint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v43 = a5;
  uint64_t v41 = *(void *)(*(void *)(a4 + 8) + 24);
  uint64_t v40 = *(void *)(v41 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v37 = (char *)&v35 - v9;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v39 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v45 = (char *)&v35 - v13;
  uint64_t v14 = sub_25ACD5D10();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  int v35 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v35 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v35 - v21;
  uint64_t v44 = v10;
  uint64_t v23 = *(uint64_t (**)(void, uint64_t, uint64_t))(v10 + 48);
  uint64_t v42 = a1;
  int v24 = v23(a1, 1, a3);
  unint64_t v25 = *(void (**)(char *, uint64_t (*)(void, uint64_t, uint64_t), uint64_t))(v15 + 16);
  uint64_t v36 = a2;
  unint64_t v46 = v25;
  v25(v22, a2, v14);
  if (v24 == 1 && v23(v22, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
    uint64_t v26 = 1;
    uint64_t v27 = v43;
    uint64_t v28 = v44;
  }
  else
  {
    uint64_t v29 = *(void (**)(char *, uint64_t))(v15 + 8);
    v29(v22, v14);
    v46(v20, v42, v14);
    if (v23(v20, 1, a3) == 1)
    {
      uint64_t v42 = v23;
      swift_getAssociatedConformanceWitness();
      sub_25ACD5FA0();
      sub_25ACD5F70();
      uint64_t v23 = v42;
      v29(v20, v14);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v45, v20, a3);
    }
    uint64_t v27 = v43;
    id v30 = v35;
    v46(v35, v36, v14);
    if (v23(v30, 1, a3) == 1)
    {
      swift_getAssociatedConformanceWitness();
      sub_25ACD5FA0();
      unint64_t v31 = v39;
      sub_25ACD5F70();
      v29(v30, v14);
      uint64_t v28 = v44;
    }
    else
    {
      uint64_t v28 = v44;
      unint64_t v31 = v39;
      (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v39, v30, a3);
    }
    unint64_t v32 = v45;
    sub_25ACD5EC0();
    uint64_t v33 = *(void (**)(char *, uint64_t))(v28 + 8);
    v33(v31, a3);
    v33(v32, a3);
    uint64_t v26 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v27, v26, 1, a3);
}

uint64_t sub_25ACC2478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v30 = a4;
  uint64_t v32 = a2;
  int64_t v34 = a5;
  uint64_t v7 = sub_25ACD5D10();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v31 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = *(void *)(a3 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  uint64_t v29 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v33 = (char *)&v27 - v17;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v18(v13, a1, v7);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v19(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    uint64_t v20 = 1;
    uint64_t v21 = v34;
  }
  else
  {
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v28(v33, v13, a3);
    unint64_t v22 = v31;
    v18(v31, v32, v7);
    if (v19(v22, 1, a3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
      uint64_t v21 = v34;
      v28(v34, v33, a3);
    }
    else
    {
      uint64_t v23 = v29;
      v28(v29, v22, a3);
      int v24 = v33;
      uint64_t v21 = v34;
      sub_25ACD5ED0();
      unint64_t v25 = *(void (**)(char *, uint64_t))(v14 + 8);
      v25(v23, a3);
      v25(v24, a3);
    }
    uint64_t v20 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v21, v20, 1, a3);
}

uint64_t sub_25ACC2798(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a2)
  {
    if (a1)
    {
      MEMORY[0x270FA5388](a1);
      sub_25ACD5AF0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25ACD5AD0();
      return a1;
    }
    else
    {
      swift_bridgeObjectRetain();
      return a2;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v2;
}

uint64_t sub_25ACC2888(uint64_t result)
{
  if (result)
  {
    MEMORY[0x270FA5388](result);
    swift_bridgeObjectRetain();
    return sub_25ACD5AE0();
  }
  return result;
}

uint64_t sub_25ACC2938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v13 = (char *)v17 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))((char *)v17 - v12, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(&v13[*(int *)(TupleTypeMetadata2 + 48)], a2, a5);
  if (a3)
  {
    v17[1] = a3;
    sub_25ACD5AC0();
    swift_getWitnessTable();
    char v14 = sub_25ACD5BE0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
    char v15 = v14 ^ 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
    char v15 = 1;
  }
  return v15 & 1;
}

uint64_t sub_25ACC2B20(uint64_t result)
{
  *(_DWORD *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_25ACC2B30())()
{
  return nullsub_1;
}

unint64_t sub_25ACC2B50(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x100000000) == 0)
  {
    if ((a1 & 0x100000000) != 0) {
      LODWORD(a1) = 0;
    }
    BOOL v2 = __OFADD__(a2, a1);
    LODWORD(a1) = a2 + a1;
    if (!v2) {
      goto LABEL_5;
    }
    __break(1u);
LABEL_9:
    unsigned __int8 v3 = 1;
    return a1 | ((unint64_t)v3 << 32);
  }
  if ((a1 & 0x100000000) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  unsigned __int8 v3 = 0;
  return a1 | ((unint64_t)v3 << 32);
}

uint64_t sub_25ACC2BA0(unint64_t a1)
{
  return a1 | ((HIDWORD(a1) & 1) << 32);
}

unint64_t sub_25ACC2BB8(unint64_t result, unint64_t a2)
{
  if (((a2 | result) & 0x100000000) != 0)
  {
    uint64_t v2 = HIDWORD(a2) & 1;
    return a2 | ((unint64_t)v2 << 32);
  }
  BOOL v3 = __OFSUB__(a2, result);
  LODWORD(a2) = a2 - result;
  if (!v3)
  {
    LOBYTE(v2) = 0;
    return a2 | ((unint64_t)v2 << 32);
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACC2BF4()
{
  return 0x100000000;
}

unint64_t sub_25ACC2C10()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

unint64_t sub_25ACC2C30()
{
  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

uint64_t sub_25ACC2C50(uint64_t result)
{
  *(_DWORD *)(v1 + 8) = result;
  *(unsigned char *)(v1 + 12) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_25ACC2C60())()
{
  return nullsub_1;
}

unint64_t sub_25ACC2C80()
{
  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t sub_25ACC2CA0(uint64_t result)
{
  *(_DWORD *)(v1 + 16) = result;
  *(unsigned char *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_25ACC2CB0())()
{
  return nullsub_1;
}

unint64_t sub_25ACC2CD0()
{
  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t sub_25ACC2CF0(uint64_t result)
{
  *(_DWORD *)(v1 + 24) = result;
  *(unsigned char *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_25ACC2D00())()
{
  return nullsub_1;
}

uint64_t sub_25ACC2D20(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_25ACC2D4C())()
{
  return nullsub_1;
}

uint64_t sub_25ACC2D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v12 = *(_DWORD *)a1;
  if (*(unsigned char *)(v4 + 4) == 1)
  {
    if (*(unsigned char *)(a1 + 4))
    {
      char v2 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    int v13 = *(_DWORD *)v4;
    if (*(unsigned char *)(a1 + 4)) {
      int v12 = 0;
    }
    BOOL v14 = __OFADD__(v13, v12);
    v12 += v13;
    if (v14)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  char v2 = 0;
LABEL_8:
  int v7 = *(_DWORD *)(a1 + 8);
  if (*(unsigned char *)(v4 + 12) == 1)
  {
    if (*(unsigned char *)(a1 + 12))
    {
      char v3 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    int v15 = *(_DWORD *)(v4 + 8);
    if (*(unsigned char *)(a1 + 12)) {
      int v7 = 0;
    }
    BOOL v14 = __OFADD__(v15, v7);
    v7 += v15;
    if (v14)
    {
      __break(1u);
      goto LABEL_21;
    }
  }
LABEL_14:
  char v3 = 0;
LABEL_15:
  int v9 = *(_DWORD *)(a1 + 16);
  if (*(unsigned char *)(v4 + 20) == 1)
  {
    if (*(unsigned char *)(a1 + 20))
    {
      char v16 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    int v17 = *(_DWORD *)(v4 + 16);
    if (*(unsigned char *)(a1 + 20)) {
      int v9 = 0;
    }
    BOOL v14 = __OFADD__(v17, v9);
    v9 += v17;
    if (v14)
    {
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_21:
  char v16 = 0;
LABEL_22:
  int v8 = *(_DWORD *)(a1 + 24);
  char v23 = v16;
  char v24 = v3;
  char v22 = v2;
  if (*(unsigned char *)(v4 + 28) == 1)
  {
    if (*(unsigned char *)(a1 + 28))
    {
      char v6 = 1;
      goto LABEL_29;
    }
  }
  else
  {
    int v18 = *(_DWORD *)(v4 + 24);
    if (*(unsigned char *)(a1 + 28)) {
      int v8 = 0;
    }
    BOOL v14 = __OFADD__(v18, v8);
    v8 += v18;
    if (v14)
    {
      __break(1u);
      goto LABEL_41;
    }
  }
LABEL_28:
  char v6 = 0;
LABEL_29:
  sub_25ACB1CA0(v4 + 32, (uint64_t)v27, &qword_26A4B2868);
  uint64_t v5 = *(void *)(a1 + 32);
  sub_25ACB1CA0((uint64_t)v27, (uint64_t)&v26, &qword_26A4B2868);
  if (!v5)
  {
    uint64_t result = sub_25ACB1D04((uint64_t)v27);
    goto LABEL_42;
  }
  sub_25ACB1CA0((uint64_t)v27, (uint64_t)&v28, &qword_26A4B2868);
  if (!v28)
  {
LABEL_41:
    unint64_t v26 = v5;
    uint64_t result = swift_bridgeObjectRetain();
    goto LABEL_42;
  }
  sub_25ACCC850(v4);
  sub_25ACCC850(a1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v25 = v26;
  unint64_t v26 = 0x8000000000000000;
  sub_25ACC9ED8(v5, (uint64_t)sub_25ACCC84C, 0, isUniquelyReferenced_nonNull_native, &v25, &qword_26A4B27C0);
  unint64_t v26 = v25;
  uint64_t result = swift_bridgeObjectRelease();
LABEL_42:
  unint64_t v21 = v26;
  *(_DWORD *)a2 = v12;
  *(unsigned char *)(a2 + 4) = v22;
  *(_DWORD *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 12) = v24;
  *(_DWORD *)(a2 + 16) = v9;
  *(unsigned char *)(a2 + 20) = v23;
  *(_DWORD *)(a2 + 24) = v8;
  *(unsigned char *)(a2 + 28) = v6;
  *(void *)(a2 + 32) = v21;
  return result;
}

uint64_t sub_25ACC2FE0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(unsigned char *)(a6 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 20) = BYTE4(a3) & 1;
  *(_DWORD *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 28) = BYTE4(a4) & 1;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_25ACC3018@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = result;
  int v5 = *(_DWORD *)v2;
  char v6 = *(unsigned char *)(v2 + 4);
  if ((v6 & 1) == 0 && (*(unsigned char *)(result + 4) & 1) == 0)
  {
    BOOL v7 = __OFSUB__(v5, *(_DWORD *)result);
    v5 -= *(_DWORD *)result;
    if (v7)
    {
      __break(1u);
      goto LABEL_21;
    }
    char v6 = 0;
  }
  int v8 = *(_DWORD *)(v2 + 8);
  char v9 = *(unsigned char *)(v2 + 12);
  if ((v9 & 1) == 0 && (*(unsigned char *)(result + 12) & 1) == 0)
  {
    int v10 = *(_DWORD *)(result + 8);
    BOOL v7 = __OFSUB__(v8, v10);
    v8 -= v10;
    if (!v7)
    {
      char v9 = 0;
      goto LABEL_9;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_9:
  int v11 = *(_DWORD *)(v2 + 16);
  char v12 = *(unsigned char *)(v2 + 20);
  if ((v12 & 1) == 0 && (*(unsigned char *)(result + 20) & 1) == 0)
  {
    int v13 = *(_DWORD *)(result + 16);
    BOOL v7 = __OFSUB__(v11, v13);
    v11 -= v13;
    if (!v7)
    {
      char v12 = 0;
      goto LABEL_13;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
LABEL_13:
  int v14 = *(_DWORD *)(v2 + 24);
  char v15 = *(unsigned char *)(v2 + 28);
  if ((v15 & 1) == 0 && (*(unsigned char *)(result + 28) & 1) == 0)
  {
    int v16 = *(_DWORD *)(result + 24);
    BOOL v7 = __OFSUB__(v14, v16);
    v14 -= v16;
    if (!v7)
    {
      char v15 = 0;
      goto LABEL_17;
    }
LABEL_23:
    __break(1u);
    return result;
  }
LABEL_17:
  uint64_t v17 = *(void *)(v2 + 32);
  if (v17)
  {
    uint64_t v18 = *(void *)(result + 32);
    char v20 = v6;
    int v21 = v5;
    int v19 = v8;
    sub_25ACCC850(result);
    sub_25ACCC850(v2);
    uint64_t v17 = sub_25ACCCEF0(v17, v18, &qword_26A4B27C0);
    sub_25ACB1C48(v3);
    uint64_t result = sub_25ACB1C48(v2);
    int v8 = v19;
    char v6 = v20;
    int v5 = v21;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v6;
  *(_DWORD *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 12) = v9;
  *(_DWORD *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 20) = v12;
  *(_DWORD *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 28) = v15;
  *(void *)(a2 + 32) = v17;
  return result;
}

uint64_t sub_25ACC3180@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 12);
  int v3 = *(_DWORD *)(v1 + 16);
  char v4 = *(unsigned char *)(v1 + 20);
  int v5 = *(_DWORD *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 28);
  int v7 = *(_DWORD *)(v1 + 32);
  char v8 = *(unsigned char *)(v1 + 36);
  uint64_t v9 = *(void *)(v1 + 40);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 8);
  *(unsigned char *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  *(_DWORD *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 28) = v8;
  *(void *)(a1 + 32) = v9;
  return swift_bridgeObjectRetain();
}

__n128 sub_25ACC31CC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 8) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 24) = v4;
  *(void *)(v1 + 40) = *(void *)(a1 + 32);
  return result;
}

unint64_t sub_25ACC3208()
{
  sub_25ACB1CA0(v0, (uint64_t)v10, &qword_26A4B2A58);
  sub_25ACB1CA0((uint64_t)v10, (uint64_t)&v11, &qword_26A4B2A58);
  if ((v12 & 1) != 0
    || (int v1 = v11,
        sub_25ACB1CA0(v0 + 8, (uint64_t)v9, &qword_26A4B2A58),
        sub_25ACB1CA0((uint64_t)v9, (uint64_t)&v13, &qword_26A4B2A58),
        (v14 & 1) != 0)
    || (int v2 = v13,
        sub_25ACB1CA0(v0 + 16, (uint64_t)&v8, &qword_26A4B2A58),
        unint64_t result = sub_25ACB1CA0((uint64_t)&v8, (uint64_t)&v15, &qword_26A4B2A58),
        (v16 & 1) != 0))
  {
    unsigned int v4 = 0;
    unsigned __int8 v5 = 1;
LABEL_5:
    LOBYTE(v15) = v5;
    return v4 | ((unint64_t)v5 << 32);
  }
  int v6 = v1 + v2;
  if (__OFADD__(v1, v2))
  {
    __break(1u);
  }
  else
  {
    BOOL v7 = __OFADD__(v6, v15);
    unsigned int v4 = v6 + v15;
    if (!v7)
    {
      unsigned __int8 v5 = 0;
      goto LABEL_5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACC32F8()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_25ACC3304(uint64_t result, char a2)
{
  *(void *)(v2 + 24) = result;
  *(unsigned char *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t sub_25ACC3314()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACC331C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*sub_25ACC3348())()
{
  return nullsub_1;
}

uint64_t sub_25ACC3368()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACC3370(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_25ACC339C())()
{
  return nullsub_1;
}

uint64_t sub_25ACC33BC@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v11 = *a1;
  if (*(unsigned char *)(v3 + 4) == 1)
  {
    if (a1[1])
    {
      char v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    int v12 = *(_DWORD *)v3;
    if (*((unsigned char *)a1 + 4)) {
      int v11 = 0;
    }
    BOOL v13 = __OFADD__(v12, v11);
    v11 += v12;
    if (v13)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  char v8 = 0;
LABEL_8:
  int v5 = a1[2];
  if (*(unsigned char *)(v3 + 12) == 1)
  {
    if (a1[3])
    {
      char v2 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    int v14 = *(_DWORD *)(v3 + 8);
    if (*((unsigned char *)a1 + 12)) {
      int v5 = 0;
    }
    BOOL v13 = __OFADD__(v14, v5);
    v5 += v14;
    if (v13)
    {
      __break(1u);
      goto LABEL_21;
    }
  }
LABEL_14:
  char v2 = 0;
LABEL_15:
  int v7 = a1[4];
  if (*(unsigned char *)(v3 + 20) == 1)
  {
    if (a1[5])
    {
      char v15 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    int v16 = *(_DWORD *)(v3 + 16);
    if (*((unsigned char *)a1 + 20)) {
      int v7 = 0;
    }
    BOOL v13 = __OFADD__(v16, v7);
    v7 += v16;
    if (v13)
    {
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_21:
  char v15 = 0;
LABEL_22:
  uint64_t v4 = *((void *)a1 + 3);
  char v22 = v15;
  char v23 = v2;
  if (*(unsigned char *)(v3 + 32) == 1)
  {
    if (a1[8])
    {
      char v6 = 1;
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v17 = *(void *)(v3 + 24);
    if (*((unsigned char *)a1 + 32)) {
      uint64_t v4 = 0;
    }
    BOOL v18 = __CFADD__(v17, v4);
    v4 += v17;
    if (v18)
    {
      __break(1u);
      goto LABEL_41;
    }
  }
LABEL_28:
  char v6 = 0;
LABEL_29:
  sub_25ACB1CA0(v3 + 48, (uint64_t)v26, &qword_26A4B2878);
  uint64_t v3 = *((void *)a1 + 6);
  sub_25ACB1CA0((uint64_t)v26, (uint64_t)&v25, &qword_26A4B2878);
  if (!v3)
  {
    uint64_t result = sub_25ACB1D04((uint64_t)v26);
    goto LABEL_42;
  }
  sub_25ACB1CA0((uint64_t)v26, (uint64_t)&v27, &qword_26A4B2878);
  if (!v27)
  {
LABEL_41:
    unint64_t v25 = v3;
    uint64_t result = swift_bridgeObjectRetain();
    goto LABEL_42;
  }
  sub_25ACB1D04((uint64_t)v26);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v24 = v25;
  unint64_t v25 = 0x8000000000000000;
  sub_25ACC9ED8(v3, (uint64_t)sub_25ACCC84C, 0, isUniquelyReferenced_nonNull_native, &v24, &qword_26A4B27A0);
  unint64_t v25 = v24;
  uint64_t result = swift_bridgeObjectRelease();
LABEL_42:
  unint64_t v21 = v25;
  *(_DWORD *)a2 = v11;
  *(unsigned char *)(a2 + 4) = v8;
  *(_DWORD *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 12) = v23;
  *(_DWORD *)(a2 + 16) = v7;
  *(unsigned char *)(a2 + 20) = v22;
  *(void *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = v21;
  return result;
}

uint64_t sub_25ACC3628@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_DWORD *)a8 = result;
  *(unsigned char *)(a8 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a8 + 16) = a3;
  *(unsigned char *)(a8 + 20) = BYTE4(a3) & 1;
  *(void *)(a8 + 24) = a4;
  *(unsigned char *)(a8 + 32) = a5 & 1;
  *(void *)(a8 + 40) = a6;
  *(void *)(a8 + 48) = a7;
  return result;
}

uint64_t sub_25ACC3660@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v4 = *v2;
  char v5 = *((unsigned char *)v2 + 4);
  if ((v5 & 1) == 0 && (*(unsigned char *)(result + 4) & 1) == 0)
  {
    BOOL v6 = __OFSUB__(v4, *(_DWORD *)result);
    v4 -= *(_DWORD *)result;
    if (v6)
    {
      __break(1u);
      goto LABEL_23;
    }
    char v5 = 0;
  }
  int v7 = v2[2];
  char v8 = *((unsigned char *)v2 + 12);
  if ((v8 & 1) == 0 && (*(unsigned char *)(result + 12) & 1) == 0)
  {
    int v9 = *(_DWORD *)(result + 8);
    BOOL v6 = __OFSUB__(v7, v9);
    v7 -= v9;
    if (!v6)
    {
      char v8 = 0;
      goto LABEL_9;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_9:
  int v10 = v2[4];
  char v11 = *((unsigned char *)v2 + 20);
  if ((v11 & 1) == 0 && (*(unsigned char *)(result + 20) & 1) == 0)
  {
    int v12 = *(_DWORD *)(result + 16);
    BOOL v6 = __OFSUB__(v10, v12);
    v10 -= v12;
    if (!v6)
    {
      char v11 = 0;
      goto LABEL_13;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
LABEL_13:
  unint64_t v13 = *((void *)v2 + 3);
  char v14 = *((unsigned char *)v2 + 32);
  if ((v14 & 1) == 0 && (*(unsigned char *)(result + 32) & 1) == 0)
  {
    unint64_t v15 = *(void *)(result + 24);
    BOOL v16 = v13 >= v15;
    v13 -= v15;
    if (!v16) {
      goto LABEL_25;
    }
    char v14 = 0;
  }
  if (*((void *)v2 + 6))
  {
    uint64_t v17 = *(void *)(result + 48);
    char v20 = v5;
    int v21 = v4;
    swift_bridgeObjectRetain();
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = sub_25ACCCEF0(v18, v17, &qword_26A4B27A0);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    char v5 = v20;
    int v4 = v21;
  }
  else
  {
    uint64_t v19 = 0;
  }
  *(_DWORD *)a2 = v4;
  *(unsigned char *)(a2 + 4) = v5;
  *(_DWORD *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 12) = v8;
  *(_DWORD *)(a2 + 16) = v10;
  *(unsigned char *)(a2 + 20) = v11;
  *(void *)(a2 + 24) = v13;
  *(unsigned char *)(a2 + 32) = v14;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = v19;
  return result;
}

uint64_t sub_25ACC37C0@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 52);
  int v3 = *(_DWORD *)(v1 + 56);
  char v4 = *(unsigned char *)(v1 + 60);
  int v5 = *(_DWORD *)(v1 + 64);
  char v6 = *(unsigned char *)(v1 + 68);
  uint64_t v7 = *(void *)(v1 + 72);
  char v8 = *(unsigned char *)(v1 + 80);
  uint64_t v9 = *(void *)(v1 + 88);
  uint64_t v10 = *(void *)(v1 + 96);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 48);
  *(unsigned char *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 sub_25ACC383C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 64) = v3;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v1 + 80) = result;
  *(void *)(v1 + 96) = *(void *)(a1 + 48);
  return result;
}

int *sub_25ACC3884@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *((unsigned __int8 *)result + 4);
  if (*((unsigned char *)v2 + 4) == 1)
  {
    if (v4)
    {
      LOBYTE(v5) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    int v5 = *v2;
    if (*((unsigned char *)result + 4)) {
      int v3 = 0;
    }
    BOOL v6 = __OFADD__(v5, v3);
    v3 += v5;
    if (v6)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  LOBYTE(v5) = 0;
LABEL_8:
  int v4 = result[2];
  int v7 = *((unsigned __int8 *)result + 12);
  if (*((unsigned char *)v2 + 12) == 1)
  {
    if (v7)
    {
      LOBYTE(v8) = 1;
      goto LABEL_15;
    }
  }
  else
  {
    int v8 = v2[2];
    if (*((unsigned char *)result + 12)) {
      int v4 = 0;
    }
    BOOL v6 = __OFADD__(v8, v4);
    v4 += v8;
    if (v6)
    {
      __break(1u);
      goto LABEL_21;
    }
  }
LABEL_14:
  LOBYTE(v8) = 0;
LABEL_15:
  int v7 = result[4];
  uint64_t v9 = *((unsigned __int8 *)result + 20);
  if (*((unsigned char *)v2 + 20) == 1)
  {
    if (v9)
    {
      LOBYTE(v10) = 1;
      goto LABEL_22;
    }
  }
  else
  {
    int v10 = v2[4];
    if (*((unsigned char *)result + 20)) {
      int v7 = 0;
    }
    BOOL v6 = __OFADD__(v10, v7);
    v7 += v10;
    if (v6)
    {
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_21:
  LOBYTE(v10) = 0;
LABEL_22:
  uint64_t v9 = *((void *)result + 3);
  if (*((unsigned char *)v2 + 32) == 1)
  {
    if (result[8])
    {
      char v11 = 1;
LABEL_29:
      *(_DWORD *)a2 = v3;
      *(unsigned char *)(a2 + 4) = v5;
      *(_DWORD *)(a2 + 8) = v4;
      *(unsigned char *)(a2 + 12) = v8;
      *(_DWORD *)(a2 + 16) = v7;
      *(unsigned char *)(a2 + 20) = v10;
      *(void *)(a2 + 24) = v9;
      *(unsigned char *)(a2 + 32) = v11;
      return result;
    }
LABEL_28:
    char v11 = 0;
    goto LABEL_29;
  }
  uint64_t v12 = *((void *)v2 + 3);
  if (*((unsigned char *)result + 32)) {
    uint64_t v9 = 0;
  }
  BOOL v13 = __CFADD__(v12, v9);
  v9 += v12;
  if (!v13) {
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACC39C8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(unsigned char *)(a6 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 20) = BYTE4(a3) & 1;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5 & 1;
  return result;
}

uint64_t sub_25ACC39FC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2;
  char v4 = *((unsigned char *)v2 + 4);
  if ((v4 & 1) == 0 && (*(unsigned char *)(result + 4) & 1) == 0)
  {
    BOOL v5 = __OFSUB__(v3, *(_DWORD *)result);
    v3 -= *(_DWORD *)result;
    if (v5)
    {
      __break(1u);
      goto LABEL_20;
    }
    char v4 = 0;
  }
  int v6 = v2[2];
  char v7 = *((unsigned char *)v2 + 12);
  if (v7 & 1) != 0 || (*(unsigned char *)(result + 12)) {
    goto LABEL_9;
  }
  int v8 = *(_DWORD *)(result + 8);
  BOOL v5 = __OFSUB__(v6, v8);
  v6 -= v8;
  if (v5)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  char v7 = 0;
LABEL_9:
  int v9 = v2[4];
  char v10 = *((unsigned char *)v2 + 20);
  if (v10 & 1) != 0 || (*(unsigned char *)(result + 20))
  {
LABEL_13:
    unint64_t v12 = *((void *)v2 + 3);
    char v13 = *((unsigned char *)v2 + 32);
    if ((v13 & 1) == 0 && (*(unsigned char *)(result + 32) & 1) == 0)
    {
      unint64_t v14 = *(void *)(result + 24);
      BOOL v15 = v12 >= v14;
      v12 -= v14;
      if (!v15) {
        goto LABEL_22;
      }
      char v13 = 0;
    }
    *(_DWORD *)a2 = v3;
    *(unsigned char *)(a2 + 4) = v4;
    *(_DWORD *)(a2 + 8) = v6;
    *(unsigned char *)(a2 + 12) = v7;
    *(_DWORD *)(a2 + 16) = v9;
    *(unsigned char *)(a2 + 20) = v10;
    *(void *)(a2 + 24) = v12;
    *(unsigned char *)(a2 + 32) = v13;
    return result;
  }
  int v11 = *(_DWORD *)(result + 16);
  BOOL v5 = __OFSUB__(v9, v11);
  v9 -= v11;
  if (!v5)
  {
    char v10 = 0;
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

void sub_25ACC3AC0(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 108);
  int v3 = *(_DWORD *)(v1 + 112);
  char v4 = *(unsigned char *)(v1 + 116);
  int v5 = *(_DWORD *)(v1 + 120);
  char v6 = *(unsigned char *)(v1 + 124);
  uint64_t v7 = *(void *)(v1 + 128);
  char v8 = *(unsigned char *)(v1 + 136);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 104);
  *(unsigned char *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 20) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
}

__n128 sub_25ACC3B04(uint64_t a1)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 104) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 120) = v3;
  *(unsigned char *)(v1 + 136) = *(unsigned char *)(a1 + 32);
  return result;
}

uint64_t (*sub_25ACC3B1C())()
{
  return nullsub_1;
}

unint64_t sub_25ACC3B3C()
{
  return *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
}

uint64_t sub_25ACC3B5C(uint64_t result)
{
  *(_DWORD *)(v1 + 32) = result;
  *(unsigned char *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

unint64_t sub_25ACC3B6C()
{
  sub_25ACB1CA0(v0 + 40, (uint64_t)&v4, &qword_26A4B2A60);
  sub_25ACB1CA0((uint64_t)&v4, (uint64_t)&v5, &qword_26A4B2A60);
  uint64_t v1 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  unint64_t v2 = *(void *)(v5 + 16);
  if (v2 >> 31)
  {
    __break(1u);
LABEL_4:
    unint64_t v2 = 0;
  }
  return v2 | ((unint64_t)(v1 == 0) << 32);
}

unint64_t sub_25ACC3BE8()
{
  return *(unsigned int *)(v0 + 48) | ((unint64_t)*(unsigned __int8 *)(v0 + 52) << 32);
}

uint64_t sub_25ACC3C08(uint64_t result)
{
  *(_DWORD *)(v1 + 48) = result;
  *(unsigned char *)(v1 + 52) = BYTE4(result) & 1;
  return result;
}

unint64_t sub_25ACC3C18()
{
  return *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
}

uint64_t sub_25ACC3C38(uint64_t result)
{
  *(_DWORD *)(v1 + 56) = result;
  *(unsigned char *)(v1 + 60) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_25ACC3C48())()
{
  return nullsub_1;
}

unint64_t sub_25ACC3C68()
{
  return *(unsigned int *)(v0 + 64) | ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 32);
}

uint64_t sub_25ACC3C88(uint64_t result)
{
  *(_DWORD *)(v1 + 64) = result;
  *(unsigned char *)(v1 + 68) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_25ACC3C98())()
{
  return nullsub_1;
}

unint64_t sub_25ACC3CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACB1CA0(v2 + 40, (uint64_t)v30, &qword_26A4B2A60);
  sub_25ACB1CA0((uint64_t)v30, (uint64_t)&v28, &qword_26A4B2A60);
  sub_25ACB1CA0(a1 + 40, (uint64_t)v29, &qword_26A4B2A60);
  sub_25ACB1CA0((uint64_t)v29, (uint64_t)&v32, &qword_26A4B2A60);
  uint64_t v5 = v32;
  if (v32)
  {
    sub_25ACB1CA0((uint64_t)v30, (uint64_t)&v31, &qword_26A4B2A60);
    if (v31)
    {
      sub_25ACB1D30(v2);
      sub_25ACB1D30(a1);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v27 = v28;
      unint64_t v28 = 0x8000000000000000;
      sub_25ACC96E0(v5, (uint64_t)sub_25ACCCE70, 0, isUniquelyReferenced_nonNull_native, (uint64_t *)&v27);
      unint64_t v28 = v27;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    unint64_t v28 = v5;
    sub_25ACB1D30(v2);
    uint64_t v8 = a1;
  }
  else
  {
    uint64_t v8 = v2;
  }
  sub_25ACB1D30(v8);
LABEL_7:
  int v9 = *(_DWORD *)a1;
  int v10 = *(unsigned __int8 *)(a1 + 4);
  if (*(unsigned char *)(v2 + 4) == 1)
  {
    if (v10)
    {
      LOBYTE(v11) = 1;
      goto LABEL_14;
    }
  }
  else
  {
    int v11 = *(_DWORD *)v2;
    if (*(unsigned char *)(a1 + 4)) {
      int v9 = 0;
    }
    BOOL v12 = __OFADD__(v11, v9);
    v9 += v11;
    if (v12)
    {
      __break(1u);
      goto LABEL_20;
    }
  }
  LOBYTE(v11) = 0;
LABEL_14:
  int v10 = *(_DWORD *)(a1 + 8);
  int v13 = *(unsigned __int8 *)(a1 + 12);
  if (*(unsigned char *)(v2 + 12) == 1)
  {
    if (v13)
    {
      LOBYTE(v14) = 1;
      goto LABEL_21;
    }
  }
  else
  {
    int v14 = *(_DWORD *)(v2 + 8);
    if (*(unsigned char *)(a1 + 12)) {
      int v10 = 0;
    }
    BOOL v12 = __OFADD__(v14, v10);
    v10 += v14;
    if (v12)
    {
      __break(1u);
      goto LABEL_27;
    }
  }
LABEL_20:
  LOBYTE(v14) = 0;
LABEL_21:
  int v13 = *(_DWORD *)(a1 + 16);
  int v15 = *(unsigned __int8 *)(a1 + 20);
  if (*(unsigned char *)(v2 + 20) == 1)
  {
    if (v15)
    {
      LOBYTE(v16) = 1;
      goto LABEL_28;
    }
  }
  else
  {
    int v16 = *(_DWORD *)(v2 + 16);
    if (*(unsigned char *)(a1 + 20)) {
      int v13 = 0;
    }
    BOOL v12 = __OFADD__(v16, v13);
    v13 += v16;
    if (v12)
    {
      __break(1u);
      goto LABEL_34;
    }
  }
LABEL_27:
  LOBYTE(v16) = 0;
LABEL_28:
  int v15 = *(_DWORD *)(a1 + 24);
  int v17 = *(unsigned __int8 *)(a1 + 28);
  if (*(unsigned char *)(v2 + 28) == 1)
  {
    if (v17)
    {
      LOBYTE(v18) = 1;
      goto LABEL_35;
    }
  }
  else
  {
    int v18 = *(_DWORD *)(v2 + 24);
    if (*(unsigned char *)(a1 + 28)) {
      int v15 = 0;
    }
    BOOL v12 = __OFADD__(v18, v15);
    v15 += v18;
    if (v12)
    {
      __break(1u);
      goto LABEL_41;
    }
  }
LABEL_34:
  LOBYTE(v18) = 0;
LABEL_35:
  int v17 = *(_DWORD *)(a1 + 32);
  unint64_t result = *(unsigned __int8 *)(a1 + 36);
  if (*(unsigned char *)(v2 + 36) == 1)
  {
    if (result)
    {
      LOBYTE(v20) = 1;
      goto LABEL_42;
    }
  }
  else
  {
    int v20 = *(_DWORD *)(v2 + 32);
    if (*(unsigned char *)(a1 + 36)) {
      int v17 = 0;
    }
    BOOL v12 = __OFADD__(v20, v17);
    v17 += v20;
    if (v12)
    {
      __break(1u);
      goto LABEL_48;
    }
  }
LABEL_41:
  LOBYTE(v20) = 0;
LABEL_42:
  unint64_t result = v28;
  int v7 = *(_DWORD *)(a1 + 48);
  int v21 = *(unsigned __int8 *)(a1 + 52);
  if (*(unsigned char *)(v2 + 52) == 1)
  {
    if (v21)
    {
      LOBYTE(v22) = 1;
      goto LABEL_49;
    }
  }
  else
  {
    int v22 = *(_DWORD *)(v2 + 48);
    if (*(unsigned char *)(a1 + 52)) {
      int v7 = 0;
    }
    BOOL v12 = __OFADD__(v22, v7);
    v7 += v22;
    if (v12)
    {
      __break(1u);
      goto LABEL_55;
    }
  }
LABEL_48:
  LOBYTE(v22) = 0;
LABEL_49:
  int v21 = *(_DWORD *)(a1 + 56);
  int v23 = *(unsigned __int8 *)(a1 + 60);
  if (*(unsigned char *)(v2 + 60) == 1)
  {
    if (v23)
    {
      LOBYTE(v24) = 1;
      goto LABEL_56;
    }
  }
  else
  {
    int v24 = *(_DWORD *)(v2 + 56);
    if (*(unsigned char *)(a1 + 60)) {
      int v21 = 0;
    }
    BOOL v12 = __OFADD__(v24, v21);
    v21 += v24;
    if (v12)
    {
      __break(1u);
      goto LABEL_62;
    }
  }
LABEL_55:
  LOBYTE(v24) = 0;
LABEL_56:
  int v23 = *(_DWORD *)(a1 + 64);
  if (*(unsigned char *)(v2 + 68) == 1)
  {
    if (*(unsigned char *)(a1 + 68))
    {
      char v25 = 1;
LABEL_63:
      *(_DWORD *)a2 = v9;
      *(unsigned char *)(a2 + 4) = v11;
      *(_DWORD *)(a2 + 8) = v10;
      *(unsigned char *)(a2 + 12) = v14;
      *(_DWORD *)(a2 + 16) = v13;
      *(unsigned char *)(a2 + 20) = v16;
      *(_DWORD *)(a2 + 24) = v15;
      *(unsigned char *)(a2 + 28) = v18;
      *(_DWORD *)(a2 + 32) = v17;
      *(unsigned char *)(a2 + 36) = v20;
      *(void *)(a2 + 40) = result;
      *(_DWORD *)(a2 + 48) = v7;
      *(unsigned char *)(a2 + 52) = v22;
      *(_DWORD *)(a2 + 56) = v21;
      *(unsigned char *)(a2 + 60) = v24;
      *(_DWORD *)(a2 + 64) = v23;
      *(unsigned char *)(a2 + 68) = v25;
      return result;
    }
LABEL_62:
    char v25 = 0;
    goto LABEL_63;
  }
  int v26 = *(_DWORD *)(v2 + 64);
  if (*(unsigned char *)(a1 + 68)) {
    int v23 = 0;
  }
  BOOL v12 = __OFADD__(v26, v23);
  v23 += v26;
  if (!v12) {
    goto LABEL_62;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACC405C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10, char a11)
{
  *(_DWORD *)a9 = result;
  *(unsigned char *)(a9 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a9 + 16) = a3;
  *(unsigned char *)(a9 + 20) = BYTE4(a3) & 1;
  *(_DWORD *)(a9 + 24) = a4;
  *(unsigned char *)(a9 + 28) = BYTE4(a4) & 1;
  *(_DWORD *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 36) = BYTE4(a5) & 1;
  *(void *)(a9 + 40) = a6;
  *(_DWORD *)(a9 + 48) = a7;
  *(unsigned char *)(a9 + 52) = BYTE4(a7) & 1;
  *(_DWORD *)(a9 + 56) = a8;
  *(unsigned char *)(a9 + 60) = BYTE4(a8) & 1;
  *(_DWORD *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 68) = a11 & 1;
  return result;
}

unint64_t sub_25ACC40C8@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = result;
  int v5 = *v2;
  char v6 = *((unsigned char *)v2 + 4);
  if ((v6 & 1) == 0 && (*(unsigned char *)(result + 4) & 1) == 0)
  {
    BOOL v7 = __OFSUB__(v5, *(_DWORD *)result);
    v5 -= *(_DWORD *)result;
    if (v7)
    {
      __break(1u);
      goto LABEL_37;
    }
    char v6 = 0;
  }
  int v8 = v2[2];
  char v9 = *((unsigned char *)v2 + 12);
  if ((v9 & 1) == 0 && (*(unsigned char *)(result + 12) & 1) == 0)
  {
    int v10 = *(_DWORD *)(result + 8);
    BOOL v7 = __OFSUB__(v8, v10);
    v8 -= v10;
    if (!v7)
    {
      char v9 = 0;
      goto LABEL_9;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_9:
  int v11 = v2[4];
  char v12 = *((unsigned char *)v2 + 20);
  if ((v12 & 1) == 0 && (*(unsigned char *)(result + 20) & 1) == 0)
  {
    int v13 = *(_DWORD *)(result + 16);
    BOOL v7 = __OFSUB__(v11, v13);
    v11 -= v13;
    if (!v7)
    {
      char v12 = 0;
      goto LABEL_13;
    }
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
LABEL_13:
  int v14 = v2[6];
  char v15 = *((unsigned char *)v2 + 28);
  if ((v15 & 1) == 0 && (*(unsigned char *)(result + 28) & 1) == 0)
  {
    int v16 = *(_DWORD *)(result + 24);
    BOOL v7 = __OFSUB__(v14, v16);
    v14 -= v16;
    if (!v7)
    {
      char v15 = 0;
      goto LABEL_17;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
LABEL_17:
  int v17 = v2[8];
  char v18 = *((unsigned char *)v2 + 36);
  if ((v18 & 1) == 0 && (*(unsigned char *)(result + 36) & 1) == 0)
  {
    int v19 = *(_DWORD *)(result + 32);
    BOOL v7 = __OFSUB__(v17, v19);
    v17 -= v19;
    if (!v7)
    {
      char v18 = 0;
      goto LABEL_21;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_21:
  char v38 = v18;
  int v39 = v17;
  char v40 = v15;
  unint64_t result = sub_25ACCD0B8(MEMORY[0x263F8EE78]);
  int v20 = v2[12];
  char v21 = *((unsigned char *)v2 + 52);
  if ((v21 & 1) == 0 && (*(unsigned char *)(v3 + 52) & 1) == 0)
  {
    int v22 = *(_DWORD *)(v3 + 48);
    BOOL v7 = __OFSUB__(v20, v22);
    v20 -= v22;
    if (!v7)
    {
      char v21 = 0;
      goto LABEL_25;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_25:
  int v37 = v14;
  int v23 = v2[14];
  char v24 = *((unsigned char *)v2 + 60);
  if ((v24 & 1) == 0 && (*(unsigned char *)(v3 + 60) & 1) == 0)
  {
    int v25 = *(_DWORD *)(v3 + 56);
    BOOL v7 = __OFSUB__(v23, v25);
    v23 -= v25;
    if (!v7)
    {
      char v24 = 0;
      goto LABEL_29;
    }
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
LABEL_29:
  char v36 = v12;
  int v26 = v2[16];
  char v27 = *((unsigned char *)v2 + 68);
  if ((v27 & 1) == 0 && (*(unsigned char *)(v3 + 68) & 1) == 0)
  {
    int v28 = *(_DWORD *)(v3 + 64);
    BOOL v7 = __OFSUB__(v26, v28);
    v26 -= v28;
    if (!v7)
    {
      char v27 = 0;
      goto LABEL_33;
    }
LABEL_43:
    __break(1u);
    return result;
  }
LABEL_33:
  int v31 = v26;
  char v32 = v24;
  int v33 = v23;
  char v34 = v21;
  unint64_t v29 = result;
  int v35 = v20;
  sub_25ACB1CA0((uint64_t)(v2 + 10), (uint64_t)v42, &qword_26A4B2A60);
  unint64_t result = sub_25ACB1CA0((uint64_t)v42, (uint64_t)&v43, &qword_26A4B2A60);
  uint64_t v30 = v43;
  if (v43)
  {
    unint64_t v41 = sub_25ACCD0B8(MEMORY[0x263F8EE78]);
    MEMORY[0x270FA5388](v41);
    sub_25ACCD334(v30, (void (*)(uint64_t, uint64_t))sub_25ACCD1BC);
    unint64_t result = swift_bridgeObjectRelease();
    unint64_t v29 = v41;
  }
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v6;
  *(_DWORD *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 12) = v9;
  *(_DWORD *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 20) = v36;
  *(_DWORD *)(a2 + 24) = v37;
  *(unsigned char *)(a2 + 28) = v40;
  *(_DWORD *)(a2 + 32) = v39;
  *(unsigned char *)(a2 + 36) = v38;
  *(void *)(a2 + 40) = v29;
  *(_DWORD *)(a2 + 48) = v35;
  *(unsigned char *)(a2 + 52) = v34;
  *(_DWORD *)(a2 + 56) = v33;
  *(unsigned char *)(a2 + 60) = v32;
  *(_DWORD *)(a2 + 64) = v31;
  *(unsigned char *)(a2 + 68) = v27;
  return result;
}

uint64_t sub_25ACC43B0@<X0>(uint64_t a1@<X8>)
{
  return sub_25ACCD4BC((int *)(v1 + 144), a1);
}

uint64_t sub_25ACC43BC(int *a1)
{
  return sub_25ACCD570(a1, v1 + 144);
}

uint64_t (*sub_25ACC43C4())()
{
  return nullsub_1;
}

unint64_t sub_25ACC43E4(unint64_t result)
{
  if (!result)
  {
    unsigned int v2 = 0;
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  int64_t v1 = 0;
  unsigned int v2 = 0;
  unint64_t v3 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (v6)
  {
    unint64_t v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v9 = v8 | (v1 << 6);
LABEL_6:
    int v10 = *(_DWORD *)(*(void *)(result + 56) + 4 * v9);
    BOOL v11 = __OFADD__(v2, v10);
    v2 += v10;
    if (v11)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  int64_t v12 = v1 + 1;
  if (__OFADD__(v1, 1)) {
    goto LABEL_29;
  }
  if (v12 >= v7) {
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v12);
  ++v1;
  if (v13) {
    goto LABEL_25;
  }
  int64_t v1 = v12 + 1;
  if (v12 + 1 >= v7) {
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v1);
  if (v13) {
    goto LABEL_25;
  }
  int64_t v1 = v12 + 2;
  if (v12 + 2 >= v7) {
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v1);
  if (v13) {
    goto LABEL_25;
  }
  int64_t v1 = v12 + 3;
  if (v12 + 3 >= v7) {
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v1);
  if (v13) {
    goto LABEL_25;
  }
  int64_t v1 = v12 + 4;
  if (v12 + 4 >= v7) {
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v1);
  if (v13)
  {
LABEL_25:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v9 = __clz(__rbit64(v13)) + (v1 << 6);
    goto LABEL_6;
  }
  int64_t v14 = v12 + 5;
  if (v14 >= v7) {
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v1 = v14;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v1 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v1 >= v7) {
      return v2 | ((unint64_t)(result == 0) << 32);
    }
    unint64_t v13 = *(void *)(v3 + 8 * v1);
    ++v14;
    if (v13) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25ACC4540(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int64_t v1 = a1;
  return result;
}

unint64_t sub_25ACC456C(uint64_t a1)
{
  if (!a1) {
    goto LABEL_4;
  }
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >> 31)
  {
    __break(1u);
LABEL_4:
    unint64_t v1 = 0;
  }
  return v1 | ((unint64_t)(a1 == 0) << 32);
}

uint64_t sub_25ACC45A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1)
  {
    if (a2)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v6 = v2;
      sub_25ACC996C(a1, (uint64_t)sub_25ACCCE84, 0, isUniquelyReferenced_nonNull_native, &v6);
      uint64_t v2 = v6;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      return a1;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v2;
}

unint64_t sub_25ACC4664(uint64_t a1, uint64_t a2)
{
  unint64_t result = sub_25ACCD628(MEMORY[0x263F8EE78]);
  if (a2)
  {
    swift_bridgeObjectRelease();
    unint64_t v4 = sub_25ACCD628(MEMORY[0x263F8EE78]);
    MEMORY[0x270FA5388](v4);
    sub_25ACCD96C(a2, (uint64_t (*)(void, void))sub_25ACCD700);
    return v4;
  }
  return result;
}

unint64_t sub_25ACC4710(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  if (!a3) {
    goto LABEL_6;
  }
  if (!*(void *)(a3 + 16)) {
    goto LABEL_6;
  }
  unint64_t result = sub_25ACCAE0C(a1);
  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
  int v10 = *(_DWORD *)(*(void *)(a3 + 56) + 4 * result);
  BOOL v11 = __OFSUB__(a2, v10);
  a2 -= v10;
  if (v11)
  {
    __break(1u);
    return result;
  }
  if (a2 >= 1)
  {
LABEL_6:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *a4;
    *a4 = 0x8000000000000000;
    sub_25ACCBC90(a2, a1, isUniquelyReferenced_nonNull_native);
    *a4 = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25ACC47BC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACC47C4(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 216) = a1;
  return result;
}

uint64_t (*sub_25ACC47F0())()
{
  return nullsub_1;
}

uint64_t sub_25ACC4810(uint64_t a1, unint64_t a2)
{
  return a2 | ((HIDWORD(a2) & 1) << 32);
}

uint64_t sub_25ACC4828(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return a3 | ((HIDWORD(a3) & 1) << 32);
}

uint64_t sub_25ACC4840()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACC4848(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

unint64_t sub_25ACC4874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = a1;
  if ((a5 & 0x100000000) != 0)
  {
    if ((a1 & 0x100000000) == 0)
    {
      unsigned int v10 = a1;
      goto LABEL_6;
    }
LABEL_22:
    unsigned __int8 v13 = 1;
    if ((a6 & 0x100000000) == 0) {
      goto LABEL_7;
    }
LABEL_23:
    if ((a2 & 0x100000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
  if ((a1 & 0x100000000) != 0) {
    int v11 = 0;
  }
  else {
    int v11 = a1;
  }
  BOOL v12 = __OFADD__(a5, v11);
  unsigned int v10 = a5 + v11;
  if (v12)
  {
    __break(1u);
    goto LABEL_22;
  }
LABEL_6:
  unsigned __int8 v13 = 0;
  if ((a6 & 0x100000000) != 0) {
    goto LABEL_23;
  }
LABEL_7:
  if ((a2 & 0x100000000) != 0) {
    int v14 = 0;
  }
  else {
    int v14 = a2;
  }
  if (!__OFADD__(a6, v14))
  {
LABEL_11:
    if ((a7 & 0x100000000) == 0) {
      goto LABEL_12;
    }
LABEL_27:
    if ((a3 & 0x100000000) == 0) {
      goto LABEL_16;
    }
LABEL_30:
    if (!a4) {
      goto LABEL_31;
    }
    goto LABEL_17;
  }
  __break(1u);
LABEL_26:
  if ((a7 & 0x100000000) != 0) {
    goto LABEL_27;
  }
LABEL_12:
  if ((a3 & 0x100000000) != 0) {
    int v15 = 0;
  }
  else {
    int v15 = a3;
  }
  if (__OFADD__(a7, v15))
  {
    __break(1u);
    goto LABEL_30;
  }
LABEL_16:
  if (!a4)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    return v10 | ((unint64_t)v13 << 32);
  }
LABEL_17:
  if (!a8) {
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = a8;
  sub_25ACC9C1C(a4, (uint64_t)sub_25ACCCE98, 0, isUniquelyReferenced_nonNull_native, &v18);
  swift_bridgeObjectRelease();
  return v10 | ((unint64_t)v13 << 32);
}

uint64_t sub_25ACC4A1C(unint64_t a1)
{
  return a1 | ((HIDWORD(a1) & 1) << 32);
}

unint64_t sub_25ACC4A58(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a5;
  if (((a5 | result) & 0x100000000) != 0)
  {
    uint64_t v10 = HIDWORD(a5) & 1;
    if (((a6 | a2) & 0x100000000) != 0) {
      goto LABEL_3;
    }
    goto LABEL_8;
  }
  unsigned int v8 = a5 - result;
  if (__OFSUB__(a5, result))
  {
    __break(1u);
    goto LABEL_14;
  }
  LOBYTE(v10) = 0;
  if (((a6 | a2) & 0x100000000) == 0)
  {
LABEL_8:
    if (!__OFSUB__(a6, a2))
    {
      if (((a7 | a3) & 0x100000000) != 0)
      {
LABEL_4:
        if (!a8) {
          return v8 | ((unint64_t)v10 << 32);
        }
LABEL_5:
        swift_bridgeObjectRetain();
        uint64_t v11 = swift_bridgeObjectRetain();
        sub_25ACCDCAC(v11, a4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v8 | ((unint64_t)v10 << 32);
      }
      goto LABEL_10;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_3:
  if (((a7 | a3) & 0x100000000) != 0) {
    goto LABEL_4;
  }
LABEL_10:
  if (!__OFSUB__(a7, a3))
  {
    if (!a8) {
      return v8 | ((unint64_t)v10 << 32);
    }
    goto LABEL_5;
  }
LABEL_15:
  __break(1u);
  return result;
}

unint64_t sub_25ACC4B88()
{
  uint64_t v1 = *(unsigned int *)(v0 + 224);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 228);
  swift_bridgeObjectRetain();
  return v1 | ((unint64_t)v2 << 32);
}

uint64_t sub_25ACC4C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(_DWORD *)(v4 + 224) = a1;
  *(unsigned char *)(v4 + 228) = BYTE4(a1) & 1;
  *(_DWORD *)(v4 + 232) = a2;
  *(unsigned char *)(v4 + 236) = BYTE4(a2) & 1;
  *(_DWORD *)(v4 + 240) = a3;
  *(unsigned char *)(v4 + 244) = BYTE4(a3) & 1;
  *(void *)(v4 + 248) = a4;
  return result;
}

uint64_t (*sub_25ACC4C7C())()
{
  return nullsub_1;
}

uint64_t sub_25ACC4C9C(int a1)
{
  long long v17 = *(_OWORD *)(v1 + 240);
  sub_25ACB1CA0((uint64_t)&v17 + 8, (uint64_t)v18, &qword_26A4B2A68);
  uint64_t result = sub_25ACB1CA0((uint64_t)v18, (uint64_t)&v19, &qword_26A4B2A68);
  if (v19)
  {
    int64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = v19 + 64;
    uint64_t v7 = 1 << *(unsigned char *)(v19 + 32);
    uint64_t v8 = -1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    unint64_t v9 = v8 & *(void *)(v19 + 64);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    while (1)
    {
      if (v9)
      {
        unint64_t v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v12 = v11 | (v4 << 6);
      }
      else
      {
        int64_t v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        if (v13 >= v10) {
          goto LABEL_29;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v13);
        ++v4;
        if (!v14)
        {
          int64_t v4 = v13 + 1;
          if (v13 + 1 >= v10) {
            goto LABEL_29;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v4);
          if (!v14)
          {
            int64_t v4 = v13 + 2;
            if (v13 + 2 >= v10) {
              goto LABEL_29;
            }
            unint64_t v14 = *(void *)(v6 + 8 * v4);
            if (!v14)
            {
              int64_t v4 = v13 + 3;
              if (v13 + 3 >= v10) {
                goto LABEL_29;
              }
              unint64_t v14 = *(void *)(v6 + 8 * v4);
              if (!v14)
              {
                int64_t v4 = v13 + 4;
                if (v13 + 4 >= v10) {
                  goto LABEL_29;
                }
                unint64_t v14 = *(void *)(v6 + 8 * v4);
                if (!v14)
                {
                  int64_t v15 = v13 + 5;
                  if (v15 >= v10)
                  {
LABEL_29:
                    sub_25ACB1D04((uint64_t)v18);
                    uint64_t result = swift_release();
                    if (v5 >= (uint64_t)0xFFFFFFFF80000000)
                    {
                      if (v5 <= 0x7FFFFFFF) {
                        return v5;
                      }
                      __break(1u);
                      return 0;
                    }
LABEL_36:
                    __break(1u);
LABEL_37:
                    __break(1u);
                    return result;
                  }
                  unint64_t v14 = *(void *)(v6 + 8 * v15);
                  if (!v14)
                  {
                    while (1)
                    {
                      int64_t v4 = v15 + 1;
                      if (__OFADD__(v15, 1)) {
                        goto LABEL_37;
                      }
                      if (v4 >= v10) {
                        goto LABEL_29;
                      }
                      unint64_t v14 = *(void *)(v6 + 8 * v4);
                      ++v15;
                      if (v14) {
                        goto LABEL_28;
                      }
                    }
                  }
                  int64_t v4 = v15;
                }
              }
            }
          }
        }
LABEL_28:
        unint64_t v9 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
      }
      if (*(_DWORD *)(*(void *)(v19 + 56) + 4 * v12) == a1 && __OFADD__(v5++, 1)) {
        goto LABEL_35;
      }
    }
  }
  return 0;
}

uint64_t sub_25ACC4E78()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACC4E80()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_25ACC4E8C()
{
  return swift_bridgeObjectRetain();
}

void sub_25ACC4E94(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
}

uint64_t sub_25ACC4EB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v2 + 24) - 8) + 16))(a2, a1);
}

uint64_t sub_25ACC4F08(uint64_t a1, uint64_t a2)
{
  return sub_25ACC2938(a1, a2, v2[5], v2[2], v2[3]) & 1;
}

double sub_25ACC4F3C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_25ACCDE68(a1, a2, (uint64_t)v6);
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a3 = v6[0];
  *(_OWORD *)(a3 + 16) = v5;
  *(void *)(a3 + 32) = v7;
  return result;
}

double sub_25ACC4F80@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_25ACB1CA0(v2 + 8, (uint64_t)v16, &qword_26A4B2880);
  uint64_t v5 = *(void *)(a1 + 8);
  sub_25ACB1CA0((uint64_t)v16, (uint64_t)v13, &qword_26A4B2880);
  if (v5)
  {
    sub_25ACB1CA0((uint64_t)v16, (uint64_t)&v17, &qword_26A4B2880);
    if (v17)
    {
      sub_25ACB1D04((uint64_t)v16);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v18 = *(void *)&v13[0];
      *(void *)&v13[0] = 0x8000000000000000;
      sub_25ACC9ED8(v5, (uint64_t)sub_25ACCC84C, 0, isUniquelyReferenced_nonNull_native, &v18, &qword_26A4B2750);
      *(void *)&v13[0] = v18;
      swift_bridgeObjectRelease();
    }
    else
    {
      *(void *)&v13[0] = v5;
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    sub_25ACB1D04((uint64_t)v16);
  }
  uint64_t v7 = *(void *)&v13[0];
  sub_25ACB1CA0(v2 + 32, (uint64_t)v15, &qword_26A4B2888);
  uint64_t v8 = *(void *)(a1 + 32);
  sub_25ACB1CA0((uint64_t)v15, (uint64_t)v13, &qword_26A4B2888);
  if (v8)
  {
    sub_25ACB1CA0((uint64_t)v15, (uint64_t)&v18, &qword_26A4B2888);
    if (v18)
    {
      sub_25ACB1D04((uint64_t)v15);
      swift_bridgeObjectRetain();
      char v9 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = *(void *)&v13[0];
      *(void *)&v13[0] = 0x8000000000000000;
      sub_25ACC9ED8(v8, (uint64_t)sub_25ACCC84C, 0, v9, &v12, &qword_26A4B2748);
      *(void *)&v13[0] = v12;
      swift_bridgeObjectRelease();
    }
    else
    {
      *(void *)&v13[0] = v8;
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    sub_25ACB1D04((uint64_t)v15);
  }
  sub_25ACCDE68(v7, *(uint64_t *)&v13[0], (uint64_t)v13);
  double result = *(double *)v13;
  long long v11 = v13[1];
  *(_OWORD *)a2 = v13[0];
  *(_OWORD *)(a2 + 16) = v11;
  *(void *)(a2 + 32) = v14;
  return result;
}

double sub_25ACC5180@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(v2 + 8))
  {
    uint64_t v7 = 0;
    if (*(void *)(v2 + 32)) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_25ACCCEF0(v6, v5, &qword_26A4B2750);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v2 + 32)) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_25ACCCEF0(v9, v8, &qword_26A4B2748);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  sub_25ACCDE68(v7, v10, (uint64_t)v13);
  double result = *(double *)v13;
  long long v12 = v13[1];
  *(_OWORD *)a2 = v13[0];
  *(_OWORD *)(a2 + 16) = v12;
  *(void *)(a2 + 32) = v14;
  return result;
}

uint64_t sub_25ACC5284@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 260);
  char v3 = *(unsigned char *)(v1 + 280);
  uint64_t v4 = *(void *)(v1 + 288);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 256);
  *(unsigned char *)(a1 + 4) = v2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 264);
  *(unsigned char *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 sub_25ACC52E8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 256) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 272) = v4;
  *(void *)(v1 + 288) = *(void *)(a1 + 32);
  return result;
}

uint64_t (*sub_25ACC5328())()
{
  return nullsub_1;
}

uint64_t sub_25ACC5348()
{
  return 0x100000000;
}

void sub_25ACC5380(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 28) = 1;
  *(void *)(a1 + 32) = 0;
}

void sub_25ACC53AC(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 20) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
}

void sub_25ACC53D8(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 20) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

void sub_25ACC5400(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 28) = 1;
  *(_DWORD *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 36) = 1;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 52) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 1;
  *(_DWORD *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 68) = 1;
}

__n128 sub_25ACC544C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char v35 = *(unsigned char *)(a6 + 4) & 1;
  char v34 = *(unsigned char *)(a6 + 12) & 1;
  char v33 = *(unsigned char *)(a6 + 20) & 1;
  char v32 = *(unsigned char *)(a6 + 28) & 1;
  char v31 = *(unsigned char *)(a7 + 4) & 1;
  char v30 = *(unsigned char *)(a7 + 12) & 1;
  char v29 = *(unsigned char *)(a7 + 20) & 1;
  char v28 = *(unsigned char *)(a7 + 32) & 1;
  char v27 = *(unsigned char *)(a11 + 4) & 1;
  char v26 = *(unsigned char *)(a11 + 12) & 1;
  char v25 = *(unsigned char *)(a11 + 20) & 1;
  char v24 = *(unsigned char *)(a11 + 32) & 1;
  char v23 = *(unsigned char *)(a12 + 4) & 1;
  char v22 = *(unsigned char *)(a12 + 12) & 1;
  char v21 = *(unsigned char *)(a12 + 20) & 1;
  char v20 = *(unsigned char *)(a12 + 28) & 1;
  char v19 = *(unsigned char *)(a12 + 36) & 1;
  char v18 = *(unsigned char *)(a12 + 52) & 1;
  char v17 = *(unsigned char *)(a12 + 60) & 1;
  char v16 = *(unsigned char *)(a12 + 68) & 1;
  char v15 = *(unsigned char *)(a10 + 4) & 1;
  char v14 = *(unsigned char *)(a10 + 24) & 1;
  *(_DWORD *)a9 = a1;
  *(unsigned char *)(a9 + 4) = BYTE4(a1) & 1;
  *(_DWORD *)(a9 + 8) = *(_DWORD *)a6;
  *(unsigned char *)(a9 + 12) = v35;
  *(_DWORD *)(a9 + 16) = *(_DWORD *)(a6 + 8);
  *(unsigned char *)(a9 + 20) = v34;
  *(_DWORD *)(a9 + 24) = *(_DWORD *)(a6 + 16);
  *(unsigned char *)(a9 + 28) = v33;
  *(_DWORD *)(a9 + 32) = *(_DWORD *)(a6 + 24);
  *(unsigned char *)(a9 + 36) = v32;
  *(void *)(a9 + 40) = *(void *)(a6 + 32);
  *(_DWORD *)(a9 + 48) = *(_DWORD *)a7;
  *(unsigned char *)(a9 + 52) = v31;
  *(_DWORD *)(a9 + 56) = *(_DWORD *)(a7 + 8);
  *(unsigned char *)(a9 + 60) = v30;
  *(_DWORD *)(a9 + 64) = *(_DWORD *)(a7 + 16);
  *(unsigned char *)(a9 + 68) = v29;
  *(void *)(a9 + 72) = *(void *)(a7 + 24);
  *(unsigned char *)(a9 + 80) = v28;
  __n128 result = *(__n128 *)(a7 + 40);
  *(_DWORD *)(a9 + 104) = *(_DWORD *)a11;
  *(unsigned char *)(a9 + 108) = v27;
  *(_DWORD *)(a9 + 112) = *(_DWORD *)(a11 + 8);
  *(unsigned char *)(a9 + 116) = v26;
  *(_DWORD *)(a9 + 120) = *(_DWORD *)(a11 + 16);
  *(unsigned char *)(a9 + 124) = v25;
  *(void *)(a9 + 128) = *(void *)(a11 + 24);
  *(unsigned char *)(a9 + 136) = v24;
  *(_DWORD *)(a9 + 144) = *(_DWORD *)a12;
  *(unsigned char *)(a9 + 148) = v23;
  *(_DWORD *)(a9 + 152) = *(_DWORD *)(a12 + 8);
  *(unsigned char *)(a9 + 156) = v22;
  *(_DWORD *)(a9 + 160) = *(_DWORD *)(a12 + 16);
  *(unsigned char *)(a9 + 164) = v21;
  *(_DWORD *)(a9 + 168) = *(_DWORD *)(a12 + 24);
  *(unsigned char *)(a9 + 172) = v20;
  *(_DWORD *)(a9 + 176) = *(_DWORD *)(a12 + 32);
  *(unsigned char *)(a9 + 180) = v19;
  *(void *)(a9 + 184) = *(void *)(a12 + 40);
  *(_DWORD *)(a9 + 192) = *(_DWORD *)(a12 + 48);
  *(unsigned char *)(a9 + 196) = v18;
  *(_DWORD *)(a9 + 200) = *(_DWORD *)(a12 + 56);
  *(unsigned char *)(a9 + 204) = v17;
  *(_DWORD *)(a9 + 208) = *(_DWORD *)(a12 + 64);
  *(unsigned char *)(a9 + 212) = v16;
  *(void *)(a9 + 216) = a8;
  *(_DWORD *)(a9 + 224) = a2;
  *(unsigned char *)(a9 + 228) = BYTE4(a2) & 1;
  *(_DWORD *)(a9 + 232) = a3;
  *(unsigned char *)(a9 + 236) = BYTE4(a3) & 1;
  *(_DWORD *)(a9 + 240) = a4;
  *(unsigned char *)(a9 + 244) = BYTE4(a4) & 1;
  *(void *)(a9 + 248) = a5;
  *(_DWORD *)(a9 + 256) = *(_DWORD *)a10;
  *(unsigned char *)(a9 + 260) = v15;
  *(unsigned char *)(a9 + 280) = v14;
  long long v13 = *(_OWORD *)(a10 + 8);
  *(void *)(a9 + 288) = *(void *)(a10 + 32);
  *(__n128 *)(a9 + 88) = result;
  *(_OWORD *)(a9 + 264) = v13;
  return result;
}

uint64_t sub_25ACC5744@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  if ((v2[1] & 1) == 0)
  {
    int v6 = *v2;
    if (a1[1]) {
      int v5 = 0;
    }
    BOOL v7 = __OFADD__(v6, v5);
    v5 += v6;
    if (!v7) {
      goto LABEL_5;
    }
    __break(1u);
LABEL_9:
    int v78 = v5;
    char v73 = 1;
    goto LABEL_10;
  }
  if (a1[1]) {
    goto LABEL_9;
  }
LABEL_5:
  int v78 = v5;
  char v73 = 0;
LABEL_10:
  uint64_t v8 = v2[56];
  uint64_t v9 = v2[58];
  unsigned __int8 v10 = *((unsigned char *)v2 + 236);
  uint64_t v11 = v2[60];
  unsigned __int8 v12 = *((unsigned char *)v2 + 244);
  uint64_t v13 = *((void *)v2 + 31);
  uint64_t v14 = a1[56];
  unsigned __int8 v15 = *((unsigned char *)a1 + 228);
  uint64_t v16 = a1[58];
  unsigned __int8 v17 = *((unsigned char *)a1 + 236);
  unint64_t v18 = a1[60] | ((unint64_t)*((unsigned __int8 *)a1 + 244) << 32);
  LOBYTE(v190) = *((unsigned char *)v2 + 228);
  LOBYTE(v188[0]) = v10;
  LOBYTE(v171) = v12;
  unint64_t v60 = sub_25ACC4874(v14 | ((unint64_t)v15 << 32), v16 | ((unint64_t)v17 << 32), v18, *((void *)a1 + 31), v8 | ((unint64_t)v190 << 32), v9 | ((unint64_t)v10 << 32), v11 | ((unint64_t)v12 << 32), v13);
  uint64_t v62 = v19;
  uint64_t v65 = v20;
  uint64_t v80 = v21;
  long long v22 = *(_OWORD *)(v2 + 6);
  long long v201 = *(_OWORD *)(v2 + 2);
  long long v202 = v22;
  uint64_t v203 = *((void *)v2 + 5);
  long long v23 = *(_OWORD *)(a1 + 6);
  v199[0] = *(_OWORD *)(a1 + 2);
  v199[1] = v23;
  uint64_t v200 = *((void *)a1 + 5);
  sub_25ACC2D6C((uint64_t)v199, (uint64_t)&v138);
  int v59 = v138;
  int v63 = v140;
  char v53 = v141;
  char v54 = v139;
  int v66 = v142;
  int v68 = v144;
  char v51 = v145;
  char v52 = v143;
  uint64_t v70 = v146;
  long long v24 = *((_OWORD *)v2 + 4);
  long long v195 = *((_OWORD *)v2 + 3);
  long long v196 = v24;
  long long v25 = *((_OWORD *)v2 + 5);
  uint64_t v198 = *((void *)v2 + 12);
  long long v197 = v25;
  sub_25ACC33BC(a1 + 12, (uint64_t)&v147);
  int v61 = v147;
  int v64 = v149;
  char v47 = v150;
  char v48 = v148;
  int v67 = v151;
  uint64_t v69 = v153;
  char v45 = v154;
  char v46 = v152;
  uint64_t v71 = v156;
  uint64_t v72 = v155;
  uint64_t v74 = sub_25ACC45A4(*((void *)a1 + 27), *((void *)v2 + 27));
  long long v26 = *((_OWORD *)v2 + 17);
  v193[2] = *((_OWORD *)v2 + 16);
  v193[3] = v26;
  uint64_t v194 = *((void *)v2 + 36);
  sub_25ACC4F80((uint64_t)(a1 + 64), (uint64_t)&v157);
  int v75 = v157;
  uint64_t v76 = v160;
  uint64_t v77 = v159;
  char v49 = v161;
  char v50 = v158;
  uint64_t v79 = v162;
  sub_25ACC3884(a1 + 26, (uint64_t)&v163);
  char v27 = v164;
  int v55 = v163;
  int v56 = v165;
  char v28 = v166;
  int v57 = v167;
  char v29 = v168;
  uint64_t v58 = v169;
  char v30 = v170;
  long long v31 = *((_OWORD *)v2 + 12);
  long long v192 = *((_OWORD *)v2 + 11);
  v193[0] = v31;
  *(void *)((char *)v193 + 13) = *(void *)((char *)v2 + 205);
  long long v32 = *((_OWORD *)v2 + 10);
  long long v190 = *((_OWORD *)v2 + 9);
  long long v191 = v32;
  long long v33 = *((_OWORD *)a1 + 12);
  v188[2] = *((_OWORD *)a1 + 11);
  v189[0] = v33;
  *(void *)((char *)v189 + 13) = *(void *)((char *)a1 + 205);
  long long v34 = *((_OWORD *)a1 + 10);
  v188[0] = *((_OWORD *)a1 + 9);
  v188[1] = v34;
  sub_25ACC3CB8((uint64_t)v188, (uint64_t)&v171);
  int v35 = v171;
  char v113 = v172;
  char v110 = v174;
  char v107 = v176;
  char v104 = v178;
  char v101 = v180;
  char v98 = v183;
  char v95 = v185;
  char v92 = v187;
  int v36 = v173;
  int v37 = v175;
  int v38 = v177;
  *(_DWORD *)a2 = v78;
  *(unsigned char *)(a2 + 4) = v73;
  *(_WORD *)(a2 + 5) = v136;
  *(unsigned char *)(a2 + 7) = v137;
  int v39 = v179;
  *(_DWORD *)(a2 + 8) = v59;
  *(unsigned char *)(a2 + 12) = v54;
  *(unsigned char *)(a2 + 15) = v135;
  *(_WORD *)(a2 + 13) = v134;
  uint64_t v40 = v181;
  *(_DWORD *)(a2 + 16) = v63;
  *(unsigned char *)(a2 + 20) = v53;
  *(unsigned char *)(a2 + 23) = v133;
  *(_WORD *)(a2 + 21) = v132;
  int v41 = v182;
  *(_DWORD *)(a2 + 24) = v66;
  *(unsigned char *)(a2 + 28) = v52;
  *(unsigned char *)(a2 + 31) = v131;
  *(_WORD *)(a2 + 29) = v130;
  int v42 = v184;
  int v43 = v186;
  *(_DWORD *)(a2 + 32) = v68;
  *(unsigned char *)(a2 + 36) = v51;
  *(unsigned char *)(a2 + 39) = v129;
  *(_WORD *)(a2 + 37) = v128;
  *(void *)(a2 + 40) = v70;
  *(_DWORD *)(a2 + 48) = v61;
  *(unsigned char *)(a2 + 52) = v48;
  *(unsigned char *)(a2 + 55) = v127;
  *(_WORD *)(a2 + 53) = v126;
  *(_DWORD *)(a2 + 56) = v64;
  *(unsigned char *)(a2 + 60) = v47;
  *(unsigned char *)(a2 + 63) = v125;
  *(_WORD *)(a2 + 61) = v124;
  *(_DWORD *)(a2 + 64) = v67;
  *(unsigned char *)(a2 + 68) = v46;
  *(unsigned char *)(a2 + 71) = v123;
  *(_WORD *)(a2 + 69) = v122;
  *(void *)(a2 + 72) = v69;
  *(unsigned char *)(a2 + 80) = v45;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v121[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v121;
  *(void *)(a2 + 88) = v72;
  *(void *)(a2 + 96) = v71;
  *(_DWORD *)(a2 + 104) = v55;
  *(unsigned char *)(a2 + 108) = v27;
  *(unsigned char *)(a2 + 111) = v120;
  *(_WORD *)(a2 + 109) = v119;
  *(_DWORD *)(a2 + 112) = v56;
  *(unsigned char *)(a2 + 116) = v28;
  *(unsigned char *)(a2 + 119) = v118;
  *(_WORD *)(a2 + 117) = v117;
  *(_DWORD *)(a2 + 120) = v57;
  *(unsigned char *)(a2 + 124) = v29;
  *(unsigned char *)(a2 + 127) = v116;
  *(_WORD *)(a2 + 125) = v115;
  *(void *)(a2 + 128) = v58;
  *(unsigned char *)(a2 + 136) = v30;
  uint64_t result = *(unsigned int *)&v114[3];
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v114[3];
  *(_DWORD *)(a2 + 144) = v35;
  *(_DWORD *)(a2 + 137) = *(_DWORD *)v114;
  *(unsigned char *)(a2 + 148) = v113;
  *(unsigned char *)(a2 + 151) = v112;
  *(_WORD *)(a2 + 149) = v111;
  *(_DWORD *)(a2 + 152) = v36;
  *(unsigned char *)(a2 + 156) = v110;
  *(unsigned char *)(a2 + 159) = v109;
  *(_WORD *)(a2 + 157) = v108;
  *(_DWORD *)(a2 + 160) = v37;
  *(unsigned char *)(a2 + 164) = v107;
  *(unsigned char *)(a2 + 167) = v106;
  *(_WORD *)(a2 + 165) = v105;
  *(_DWORD *)(a2 + 168) = v38;
  *(unsigned char *)(a2 + 172) = v104;
  *(unsigned char *)(a2 + 175) = v103;
  *(_WORD *)(a2 + 173) = v102;
  *(_DWORD *)(a2 + 176) = v39;
  *(unsigned char *)(a2 + 180) = v101;
  *(unsigned char *)(a2 + 183) = v100;
  *(_WORD *)(a2 + 181) = v99;
  *(void *)(a2 + 184) = v40;
  *(_DWORD *)(a2 + 192) = v41;
  *(unsigned char *)(a2 + 196) = v98;
  *(unsigned char *)(a2 + 199) = v97;
  *(_WORD *)(a2 + 197) = v96;
  *(_DWORD *)(a2 + 200) = v42;
  *(unsigned char *)(a2 + 204) = v95;
  *(unsigned char *)(a2 + 207) = v94;
  *(_WORD *)(a2 + 205) = v93;
  *(_DWORD *)(a2 + 208) = v43;
  *(unsigned char *)(a2 + 212) = v92;
  *(unsigned char *)(a2 + 215) = v91;
  *(_WORD *)(a2 + 213) = v90;
  *(void *)(a2 + 216) = v74;
  *(_DWORD *)(a2 + 224) = v60;
  *(unsigned char *)(a2 + 228) = BYTE4(v60) & 1;
  *(unsigned char *)(a2 + 231) = v89;
  *(_WORD *)(a2 + 229) = v88;
  *(_DWORD *)(a2 + 232) = v62;
  *(unsigned char *)(a2 + 236) = BYTE4(v62) & 1;
  *(unsigned char *)(a2 + 239) = v87;
  *(_WORD *)(a2 + 237) = v86;
  *(_DWORD *)(a2 + 240) = v65;
  *(unsigned char *)(a2 + 244) = BYTE4(v65) & 1;
  *(unsigned char *)(a2 + 247) = v85;
  *(_WORD *)(a2 + 245) = v84;
  *(void *)(a2 + 248) = v80;
  *(_DWORD *)(a2 + 256) = v75;
  *(unsigned char *)(a2 + 260) = v50;
  *(unsigned char *)(a2 + 263) = v83;
  *(_WORD *)(a2 + 261) = v82;
  *(void *)(a2 + 264) = v77;
  *(void *)(a2 + 272) = v76;
  *(unsigned char *)(a2 + 280) = v49;
  *(_DWORD *)(a2 + 284) = *(_DWORD *)&v81[3];
  *(_DWORD *)(a2 + 281) = *(_DWORD *)v81;
  *(void *)(a2 + 288) = v79;
  return result;
}

unint64_t sub_25ACC5ED4@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v3 = v2;
  unint64_t v4 = result;
  int v6 = *v2;
  int v7 = *((unsigned __int8 *)v2 + 4);
  if ((v7 | *(unsigned __int8 *)(result + 4)))
  {
    char v8 = v7 & 1;
  }
  else
  {
    BOOL v9 = __OFSUB__(v6, *(_DWORD *)result);
    v6 -= *(_DWORD *)result;
    if (v9)
    {
      __break(1u);
      goto LABEL_48;
    }
    char v8 = 0;
  }
  long long v10 = *((_OWORD *)v2 + 15);
  long long v162 = *((_OWORD *)v2 + 14);
  long long v163 = v10;
  long long v11 = *(_OWORD *)(result + 240);
  long long v160 = *(_OWORD *)(result + 224);
  long long v161 = v11;
  int v12 = v162;
  char v13 = BYTE4(v162);
  if ((BYTE4(v162) & 1) == 0 && (BYTE4(v160) & 1) == 0)
  {
    int v12 = v162 - v160;
    if (!__OFSUB__(v162, v160))
    {
      char v13 = 0;
      goto LABEL_9;
    }
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
LABEL_9:
  int v14 = DWORD2(v162);
  char v15 = BYTE12(v162);
  if ((BYTE12(v162) & 1) == 0 && (BYTE12(v160) & 1) == 0)
  {
    int v14 = DWORD2(v162) - DWORD2(v160);
    if (!__OFSUB__(DWORD2(v162), DWORD2(v160)))
    {
      char v15 = 0;
      goto LABEL_13;
    }
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
LABEL_13:
  int v16 = v163;
  char v17 = BYTE4(v163);
  if ((BYTE4(v163) & 1) == 0 && (BYTE4(v161) & 1) == 0)
  {
    int v16 = v163 - v161;
    if (!__OFSUB__(v163, v161))
    {
      char v17 = 0;
      goto LABEL_17;
    }
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
LABEL_17:
  char v92 = v17;
  char v93 = v15;
  char v94 = v8;
  char v95 = v13;
  int v96 = v16;
  uint64_t v18 = *((void *)&v163 + 1);
  if (*((void *)&v163 + 1))
  {
    uint64_t v19 = *((void *)&v161 + 1);
    sub_25ACCE6D8((uint64_t)&v160);
    sub_25ACCE6D8((uint64_t)&v162);
    uint64_t v18 = sub_25ACCDCAC(v18, v19);
    sub_25ACB1C1C((uint64_t)&v160);
    uint64_t result = sub_25ACB1C1C((uint64_t)&v162);
  }
  long long v20 = *(_OWORD *)(v3 + 6);
  long long v157 = *(_OWORD *)(v3 + 2);
  long long v158 = v20;
  uint64_t v159 = *((void *)v3 + 5);
  long long v21 = *(_OWORD *)(v4 + 24);
  long long v154 = *(_OWORD *)(v4 + 8);
  long long v155 = v21;
  uint64_t v156 = *(void *)(v4 + 40);
  int v22 = v157;
  char v23 = BYTE4(v157);
  if ((BYTE4(v157) & 1) == 0 && (BYTE4(v154) & 1) == 0)
  {
    int v22 = v157 - v154;
    if (!__OFSUB__(v157, v154))
    {
      char v23 = 0;
      goto LABEL_23;
    }
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
LABEL_23:
  int v24 = DWORD2(v157);
  char v25 = BYTE12(v157);
  if ((BYTE12(v157) & 1) == 0 && (BYTE12(v154) & 1) == 0)
  {
    int v24 = DWORD2(v157) - DWORD2(v154);
    if (!__OFSUB__(DWORD2(v157), DWORD2(v154)))
    {
      char v25 = 0;
      goto LABEL_27;
    }
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
LABEL_27:
  int v26 = v158;
  char v27 = BYTE4(v158);
  if (BYTE4(v158) & 1) != 0 || (BYTE4(v155)) {
    goto LABEL_31;
  }
  int v26 = v158 - v155;
  if (__OFSUB__(v158, v155))
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  char v27 = 0;
LABEL_31:
  int v28 = DWORD2(v158);
  char v29 = BYTE12(v158);
  if (BYTE12(v158) & 1) != 0 || (BYTE12(v155)) {
    goto LABEL_35;
  }
  int v28 = DWORD2(v158) - DWORD2(v155);
  if (!__OFSUB__(DWORD2(v158), DWORD2(v155)))
  {
    char v29 = 0;
LABEL_35:
    char v79 = v29;
    char v81 = v27;
    char v82 = v25;
    int v83 = v28;
    char v84 = v23;
    int v85 = v26;
    int v86 = v24;
    int v87 = v22;
    uint64_t v88 = v18;
    uint64_t v30 = v159;
    if (v159)
    {
      uint64_t v31 = v156;
      sub_25ACCC850((uint64_t)&v154);
      sub_25ACCC850((uint64_t)&v157);
      uint64_t v80 = sub_25ACCCEF0(v30, v31, &qword_26A4B27C0);
      sub_25ACB1C48((uint64_t)&v154);
      sub_25ACB1C48((uint64_t)&v157);
    }
    else
    {
      uint64_t v80 = 0;
    }
    int v91 = v12;
    sub_25ACC3660(v4 + 48, (uint64_t)&v105);
    int v73 = v105;
    int v74 = v107;
    char v70 = v108;
    char v71 = v106;
    int v75 = v109;
    char v68 = v112;
    char v69 = v110;
    uint64_t v78 = v113;
    uint64_t v76 = v111;
    uint64_t v77 = v114;
    uint64_t v152 = *((void *)v3 + 27);
    unint64_t v32 = sub_25ACCD628(MEMORY[0x263F8EE78]);
    sub_25ACB1CA0((uint64_t)&v152, (uint64_t)&v153, &qword_26A4B2A70);
    sub_25ACB1CA0((uint64_t)&v153, (uint64_t)v164, &qword_26A4B2A70);
    uint64_t v33 = v164[0];
    int v89 = v6;
    if (v164[0])
    {
      swift_bridgeObjectRelease();
      *(void *)&long long v148 = sub_25ACCD628(MEMORY[0x263F8EE78]);
      MEMORY[0x270FA5388](v148);
      sub_25ACCD96C(v33, (uint64_t (*)(void, void))sub_25ACCFF04);
      unint64_t v72 = v148;
    }
    else
    {
      unint64_t v72 = v32;
    }
    int v90 = v14;
    uint64_t v34 = *((void *)v3 + 36);
    uint64_t v35 = *(void *)(v4 + 288);
    if (*((void *)v3 + 33))
    {
      uint64_t v36 = *(void *)(v4 + 264);
      swift_bridgeObjectRetain();
      uint64_t v37 = swift_bridgeObjectRetain();
      uint64_t v38 = sub_25ACCCEF0(v37, v36, &qword_26A4B2750);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34)
      {
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v39 = swift_bridgeObjectRetain();
        uint64_t v40 = sub_25ACCCEF0(v39, v35, &qword_26A4B2748);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_46:
        sub_25ACCDE68(v38, v40, (uint64_t)&v115);
        int v65 = v115;
        char v59 = v116;
        uint64_t v66 = v118;
        uint64_t v67 = v117;
        char v41 = v119;
        uint64_t v64 = v120;
        sub_25ACC39FC(v4 + 104, (uint64_t)&v121);
        char v42 = v122;
        int v60 = v121;
        int v61 = v123;
        char v43 = v124;
        int v62 = v125;
        char v44 = v126;
        uint64_t v63 = v127;
        char v45 = v128;
        long long v46 = *((_OWORD *)v3 + 12);
        long long v150 = *((_OWORD *)v3 + 11);
        v151[0] = v46;
        *(void *)((char *)v151 + 13) = *(void *)((char *)v3 + 205);
        long long v47 = *((_OWORD *)v3 + 10);
        long long v148 = *((_OWORD *)v3 + 9);
        long long v149 = v47;
        long long v48 = *(_OWORD *)(v4 + 192);
        _OWORD v146[2] = *(_OWORD *)(v4 + 176);
        v147[0] = v48;
        *(void *)((char *)v147 + 13) = *(void *)(v4 + 205);
        long long v49 = *(_OWORD *)(v4 + 160);
        v146[0] = *(_OWORD *)(v4 + 144);
        v146[1] = v49;
        uint64_t result = sub_25ACC40C8((unint64_t)v146, (uint64_t)&v129);
        char v104 = v130;
        char v103 = v132;
        char v102 = v134;
        char v101 = v136;
        char v100 = v138;
        char v99 = v141;
        char v98 = v143;
        char v97 = v145;
        int v50 = v129;
        int v51 = v131;
        int v52 = v133;
        int v53 = v135;
        int v54 = v137;
        *(_DWORD *)a2 = v89;
        *(unsigned char *)(a2 + 4) = v94;
        uint64_t v55 = v139;
        *(_DWORD *)(a2 + 8) = v87;
        *(unsigned char *)(a2 + 12) = v84;
        int v56 = v140;
        *(_DWORD *)(a2 + 16) = v86;
        *(unsigned char *)(a2 + 20) = v82;
        int v57 = v142;
        *(_DWORD *)(a2 + 24) = v85;
        *(unsigned char *)(a2 + 28) = v81;
        int v58 = v144;
        *(_DWORD *)(a2 + 32) = v83;
        *(unsigned char *)(a2 + 36) = v79;
        *(void *)(a2 + 40) = v80;
        *(_DWORD *)(a2 + 48) = v73;
        *(unsigned char *)(a2 + 52) = v71;
        *(_DWORD *)(a2 + 56) = v74;
        *(unsigned char *)(a2 + 60) = v70;
        *(_DWORD *)(a2 + 64) = v75;
        *(unsigned char *)(a2 + 68) = v69;
        *(void *)(a2 + 72) = v76;
        *(unsigned char *)(a2 + 80) = v68;
        *(void *)(a2 + 88) = v78;
        *(void *)(a2 + 96) = v77;
        *(_DWORD *)(a2 + 104) = v60;
        *(unsigned char *)(a2 + 108) = v42;
        *(_DWORD *)(a2 + 112) = v61;
        *(unsigned char *)(a2 + 116) = v43;
        *(_DWORD *)(a2 + 120) = v62;
        *(unsigned char *)(a2 + 124) = v44;
        *(void *)(a2 + 128) = v63;
        *(unsigned char *)(a2 + 136) = v45;
        *(_DWORD *)(a2 + 144) = v50;
        *(unsigned char *)(a2 + 148) = v104;
        *(_DWORD *)(a2 + 152) = v51;
        *(unsigned char *)(a2 + 156) = v103;
        *(_DWORD *)(a2 + 160) = v52;
        *(unsigned char *)(a2 + 164) = v102;
        *(_DWORD *)(a2 + 168) = v53;
        *(unsigned char *)(a2 + 172) = v101;
        *(_DWORD *)(a2 + 176) = v54;
        *(unsigned char *)(a2 + 180) = v100;
        *(void *)(a2 + 184) = v55;
        *(_DWORD *)(a2 + 192) = v56;
        *(unsigned char *)(a2 + 196) = v99;
        *(_DWORD *)(a2 + 200) = v57;
        *(unsigned char *)(a2 + 204) = v98;
        *(_DWORD *)(a2 + 208) = v58;
        *(unsigned char *)(a2 + 212) = v97;
        *(void *)(a2 + 216) = v72;
        *(_DWORD *)(a2 + 224) = v91;
        *(unsigned char *)(a2 + 228) = v95;
        *(_DWORD *)(a2 + 232) = v90;
        *(unsigned char *)(a2 + 236) = v93;
        *(_DWORD *)(a2 + 240) = v96;
        *(unsigned char *)(a2 + 244) = v92;
        *(void *)(a2 + 248) = v88;
        *(_DWORD *)(a2 + 256) = v65;
        *(unsigned char *)(a2 + 260) = v59;
        *(void *)(a2 + 264) = v67;
        *(void *)(a2 + 272) = v66;
        *(unsigned char *)(a2 + 280) = v41;
        *(void *)(a2 + 288) = v64;
        return result;
      }
    }
    else
    {
      uint64_t v38 = 0;
      if (v34) {
        goto LABEL_43;
      }
    }
    uint64_t v40 = 0;
    goto LABEL_46;
  }
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_25ACC6654()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2DF0 = result;
  return result;
}

uint64_t *sub_25ACC667C()
{
  if (qword_26A4B2B98 != -1) {
    swift_once();
  }
  return &qword_26A4B2DF0;
}

uint64_t sub_25ACC66C8()
{
  return sub_25ACC9570(&qword_26A4B2B98);
}

uint64_t sub_25ACC66EC(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2B98, &qword_26A4B2DF0);
}

uint64_t (*sub_25ACC6710())()
{
  if (qword_26A4B2B98 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC6798()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2DF8 = result;
  return result;
}

uint64_t *sub_25ACC67C0()
{
  if (qword_26A4B2BA0 != -1) {
    swift_once();
  }
  return &qword_26A4B2DF8;
}

uint64_t sub_25ACC680C()
{
  return sub_25ACC9570(&qword_26A4B2BA0);
}

uint64_t sub_25ACC6830(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BA0, &qword_26A4B2DF8);
}

uint64_t (*sub_25ACC6854())()
{
  if (qword_26A4B2BA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC68DC()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E00 = result;
  return result;
}

uint64_t *sub_25ACC6904()
{
  if (qword_26A4B2BA8 != -1) {
    swift_once();
  }
  return &qword_26A4B2E00;
}

uint64_t sub_25ACC6950()
{
  return sub_25ACC9570(&qword_26A4B2BA8);
}

uint64_t sub_25ACC6974(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BA8, &qword_26A4B2E00);
}

uint64_t (*sub_25ACC6998())()
{
  if (qword_26A4B2BA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC6A20()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E08 = result;
  return result;
}

uint64_t *sub_25ACC6A48()
{
  if (qword_26A4B2BB0 != -1) {
    swift_once();
  }
  return &qword_26A4B2E08;
}

uint64_t sub_25ACC6A94()
{
  return sub_25ACC9570(&qword_26A4B2BB0);
}

uint64_t sub_25ACC6AB8(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BB0, &qword_26A4B2E08);
}

uint64_t (*sub_25ACC6ADC())()
{
  if (qword_26A4B2BB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC6B64()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E10 = result;
  return result;
}

uint64_t *sub_25ACC6B8C()
{
  if (qword_26A4B2BB8 != -1) {
    swift_once();
  }
  return &qword_26A4B2E10;
}

uint64_t sub_25ACC6BD8()
{
  return sub_25ACC9570(&qword_26A4B2BB8);
}

uint64_t sub_25ACC6BFC(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BB8, &qword_26A4B2E10);
}

uint64_t (*sub_25ACC6C20())()
{
  if (qword_26A4B2BB8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC6CA8()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E18 = result;
  return result;
}

uint64_t *sub_25ACC6CD0()
{
  if (qword_26A4B2BC0 != -1) {
    swift_once();
  }
  return &qword_26A4B2E18;
}

uint64_t sub_25ACC6D1C()
{
  return sub_25ACC9570(&qword_26A4B2BC0);
}

uint64_t sub_25ACC6D40(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BC0, &qword_26A4B2E18);
}

uint64_t (*sub_25ACC6D64())()
{
  if (qword_26A4B2BC0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC6DEC()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E20 = result;
  return result;
}

uint64_t *sub_25ACC6E14()
{
  if (qword_26A4B2BC8 != -1) {
    swift_once();
  }
  return &qword_26A4B2E20;
}

uint64_t sub_25ACC6E60()
{
  return sub_25ACC9570(&qword_26A4B2BC8);
}

uint64_t sub_25ACC6E84(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BC8, &qword_26A4B2E20);
}

uint64_t (*sub_25ACC6EA8())()
{
  if (qword_26A4B2BC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC6F30()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E28 = result;
  return result;
}

uint64_t *sub_25ACC6F58()
{
  if (qword_26A4B2BD0 != -1) {
    swift_once();
  }
  return &qword_26A4B2E28;
}

uint64_t sub_25ACC6FA4()
{
  return sub_25ACC9570(&qword_26A4B2BD0);
}

uint64_t sub_25ACC6FC8(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BD0, &qword_26A4B2E28);
}

uint64_t (*sub_25ACC6FEC())()
{
  if (qword_26A4B2BD0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC7074()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E30 = result;
  return result;
}

uint64_t *sub_25ACC709C()
{
  if (qword_26A4B2BD8 != -1) {
    swift_once();
  }
  return &qword_26A4B2E30;
}

uint64_t sub_25ACC70E8()
{
  return sub_25ACC9570(&qword_26A4B2BD8);
}

uint64_t sub_25ACC710C(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BD8, &qword_26A4B2E30);
}

uint64_t (*sub_25ACC7130())()
{
  if (qword_26A4B2BD8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC71B8()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E38 = result;
  return result;
}

uint64_t *sub_25ACC71E0()
{
  if (qword_26A4B2BE0 != -1) {
    swift_once();
  }
  return &qword_26A4B2E38;
}

uint64_t sub_25ACC722C()
{
  return sub_25ACC9570(&qword_26A4B2BE0);
}

uint64_t sub_25ACC7250(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BE0, &qword_26A4B2E38);
}

uint64_t (*sub_25ACC7274())()
{
  if (qword_26A4B2BE0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC72FC()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E40 = result;
  return result;
}

uint64_t sub_25ACC7324@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(result + 4))
  {
    int v2 = 0;
    char v3 = 1;
LABEL_8:
    *(_DWORD *)a2 = v2;
    *(unsigned char *)(a2 + 4) = v3;
    return result;
  }
  int v2 = 0;
  char v3 = 1;
  if (*(unsigned char *)(result + 12) & 1) != 0 || (*(unsigned char *)(result + 20)) {
    goto LABEL_8;
  }
  int v4 = *(_DWORD *)(result + 8);
  int v5 = *(_DWORD *)result + v4;
  if (__OFADD__(*(_DWORD *)result, v4))
  {
    __break(1u);
  }
  else
  {
    int v6 = *(_DWORD *)(result + 16);
    BOOL v7 = __OFADD__(v5, v6);
    int v2 = v5 + v6;
    if (!v7)
    {
      char v3 = 0;
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_25ACC7384()
{
  if (qword_26A4B2BE8 != -1) {
    swift_once();
  }
  return &qword_26A4B2E40;
}

uint64_t sub_25ACC73D0()
{
  return sub_25ACC9570(&qword_26A4B2BE8);
}

uint64_t sub_25ACC73F4(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BE8, &qword_26A4B2E40);
}

uint64_t (*sub_25ACC7418())()
{
  if (qword_26A4B2BE8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC74A0()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E48 = result;
  return result;
}

uint64_t *sub_25ACC74C8()
{
  if (qword_26A4B2BF0 != -1) {
    swift_once();
  }
  return &qword_26A4B2E48;
}

uint64_t sub_25ACC7514()
{
  return sub_25ACC9570(&qword_26A4B2BF0);
}

uint64_t sub_25ACC7538(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BF0, &qword_26A4B2E48);
}

uint64_t (*sub_25ACC755C())()
{
  if (qword_26A4B2BF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC75E4()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E50 = result;
  return result;
}

uint64_t *sub_25ACC760C()
{
  if (qword_26A4B2BF8 != -1) {
    swift_once();
  }
  return &qword_26A4B2E50;
}

uint64_t sub_25ACC7658()
{
  return sub_25ACC9570(&qword_26A4B2BF8);
}

uint64_t sub_25ACC767C(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2BF8, &qword_26A4B2E50);
}

uint64_t (*sub_25ACC76A0())()
{
  if (qword_26A4B2BF8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC7728()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E58 = result;
  return result;
}

uint64_t *sub_25ACC7750()
{
  if (qword_26A4B2C00 != -1) {
    swift_once();
  }
  return &qword_26A4B2E58;
}

uint64_t sub_25ACC779C()
{
  return sub_25ACC9570(&qword_26A4B2C00);
}

uint64_t sub_25ACC77C0(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C00, &qword_26A4B2E58);
}

uint64_t (*sub_25ACC77E4())()
{
  if (qword_26A4B2C00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC786C()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E60 = result;
  return result;
}

uint64_t *sub_25ACC7894()
{
  if (qword_26A4B2C08 != -1) {
    swift_once();
  }
  return &qword_26A4B2E60;
}

uint64_t sub_25ACC78E0()
{
  return sub_25ACC9570(&qword_26A4B2C08);
}

uint64_t sub_25ACC7904(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C08, &qword_26A4B2E60);
}

uint64_t (*sub_25ACC7928())()
{
  if (qword_26A4B2C08 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC79B0()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E68 = result;
  return result;
}

uint64_t *sub_25ACC79D8()
{
  if (qword_26A4B2C10 != -1) {
    swift_once();
  }
  return &qword_26A4B2E68;
}

uint64_t sub_25ACC7A24()
{
  return sub_25ACC9570(&qword_26A4B2C10);
}

uint64_t sub_25ACC7A48(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C10, &qword_26A4B2E68);
}

uint64_t (*sub_25ACC7A6C())()
{
  if (qword_26A4B2C10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC7AF4()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E70 = result;
  return result;
}

unint64_t sub_25ACC7B1C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25ACC43E4(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t *sub_25ACC7B50()
{
  if (qword_26A4B2C18 != -1) {
    swift_once();
  }
  return &qword_26A4B2E70;
}

uint64_t sub_25ACC7B9C()
{
  return sub_25ACC9570(&qword_26A4B2C18);
}

uint64_t sub_25ACC7BC0(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C18, &qword_26A4B2E70);
}

uint64_t (*sub_25ACC7BE4())()
{
  if (qword_26A4B2C18 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC7C6C()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E78 = result;
  return result;
}

uint64_t *sub_25ACC7C94()
{
  if (qword_26A4B2C20 != -1) {
    swift_once();
  }
  return &qword_26A4B2E78;
}

uint64_t sub_25ACC7CE0()
{
  return sub_25ACC9570(&qword_26A4B2C20);
}

uint64_t sub_25ACC7D04(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C20, &qword_26A4B2E78);
}

uint64_t (*sub_25ACC7D28())()
{
  if (qword_26A4B2C20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC7DB0()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E80 = result;
  return result;
}

uint64_t *sub_25ACC7DD8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  if (!*result) {
    goto LABEL_4;
  }
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 >> 31)
  {
    __break(1u);
LABEL_4:
    LODWORD(v3) = 0;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v2 == 0;
  return result;
}

uint64_t *sub_25ACC7E08()
{
  if (qword_26A4B2C28 != -1) {
    swift_once();
  }
  return &qword_26A4B2E80;
}

uint64_t sub_25ACC7E54()
{
  return sub_25ACC9570(&qword_26A4B2C28);
}

uint64_t sub_25ACC7E78(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C28, &qword_26A4B2E80);
}

uint64_t (*sub_25ACC7E9C())()
{
  if (qword_26A4B2C28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC7F24()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E88 = result;
  return result;
}

uint64_t *sub_25ACC7F4C()
{
  if (qword_26A4B2C30 != -1) {
    swift_once();
  }
  return &qword_26A4B2E88;
}

uint64_t sub_25ACC7F98()
{
  return sub_25ACC9570(&qword_26A4B2C30);
}

uint64_t sub_25ACC7FBC(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C30, &qword_26A4B2E88);
}

uint64_t (*sub_25ACC7FE0())()
{
  if (qword_26A4B2C30 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8068()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E90 = result;
  return result;
}

uint64_t *sub_25ACC8090()
{
  if (qword_26A4B2C38 != -1) {
    swift_once();
  }
  return &qword_26A4B2E90;
}

uint64_t sub_25ACC80DC()
{
  return sub_25ACC9570(&qword_26A4B2C38);
}

uint64_t sub_25ACC8100(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C38, &qword_26A4B2E90);
}

uint64_t (*sub_25ACC8124())()
{
  if (qword_26A4B2C38 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC81AC()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2E98 = result;
  return result;
}

uint64_t *sub_25ACC81D4()
{
  if (qword_26A4B2C40 != -1) {
    swift_once();
  }
  return &qword_26A4B2E98;
}

uint64_t sub_25ACC8220()
{
  return sub_25ACC9570(&qword_26A4B2C40);
}

uint64_t sub_25ACC8244(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C40, &qword_26A4B2E98);
}

uint64_t (*sub_25ACC8268())()
{
  if (qword_26A4B2C40 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC82F0()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EA0 = result;
  return result;
}

uint64_t *sub_25ACC8318()
{
  if (qword_26A4B2C48 != -1) {
    swift_once();
  }
  return &qword_26A4B2EA0;
}

uint64_t sub_25ACC8364()
{
  return sub_25ACC9570(&qword_26A4B2C48);
}

uint64_t sub_25ACC8388(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C48, &qword_26A4B2EA0);
}

uint64_t (*sub_25ACC83AC())()
{
  if (qword_26A4B2C48 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8434()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EA8 = result;
  return result;
}

uint64_t *sub_25ACC845C()
{
  if (qword_26A4B2C50 != -1) {
    swift_once();
  }
  return &qword_26A4B2EA8;
}

uint64_t sub_25ACC84A8()
{
  return sub_25ACC9570(&qword_26A4B2C50);
}

uint64_t sub_25ACC84CC(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C50, &qword_26A4B2EA8);
}

uint64_t (*sub_25ACC84F0())()
{
  if (qword_26A4B2C50 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8578()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EB0 = result;
  return result;
}

uint64_t *sub_25ACC85A0()
{
  if (qword_26A4B2C58 != -1) {
    swift_once();
  }
  return &qword_26A4B2EB0;
}

uint64_t sub_25ACC85EC()
{
  return sub_25ACC9570(&qword_26A4B2C58);
}

uint64_t sub_25ACC8610(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C58, &qword_26A4B2EB0);
}

uint64_t (*sub_25ACC8634())()
{
  if (qword_26A4B2C58 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC86BC()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EB8 = result;
  return result;
}

uint64_t *sub_25ACC86E4()
{
  if (qword_26A4B2C60 != -1) {
    swift_once();
  }
  return &qword_26A4B2EB8;
}

uint64_t sub_25ACC8730()
{
  return sub_25ACC9570(&qword_26A4B2C60);
}

uint64_t sub_25ACC8754(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C60, &qword_26A4B2EB8);
}

uint64_t (*sub_25ACC8778())()
{
  if (qword_26A4B2C60 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8800()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EC0 = result;
  return result;
}

uint64_t *sub_25ACC8828()
{
  if (qword_26A4B2C68 != -1) {
    swift_once();
  }
  return &qword_26A4B2EC0;
}

uint64_t sub_25ACC8874()
{
  return sub_25ACC9570(&qword_26A4B2C68);
}

uint64_t sub_25ACC8898(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C68, &qword_26A4B2EC0);
}

uint64_t (*sub_25ACC88BC())()
{
  if (qword_26A4B2C68 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8944()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EC8 = result;
  return result;
}

uint64_t *sub_25ACC896C()
{
  if (qword_26A4B2C70 != -1) {
    swift_once();
  }
  return &qword_26A4B2EC8;
}

uint64_t sub_25ACC89B8()
{
  return sub_25ACC9570(&qword_26A4B2C70);
}

uint64_t sub_25ACC89DC(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C70, &qword_26A4B2EC8);
}

uint64_t (*sub_25ACC8A00())()
{
  if (qword_26A4B2C70 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8A88()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2ED0 = result;
  return result;
}

uint64_t *sub_25ACC8AB0()
{
  if (qword_26A4B2C78 != -1) {
    swift_once();
  }
  return &qword_26A4B2ED0;
}

uint64_t sub_25ACC8AFC()
{
  return sub_25ACC9570(&qword_26A4B2C78);
}

uint64_t sub_25ACC8B20(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C78, &qword_26A4B2ED0);
}

uint64_t (*sub_25ACC8B44())()
{
  if (qword_26A4B2C78 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8BCC()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2ED8 = result;
  return result;
}

uint64_t *sub_25ACC8BF4()
{
  if (qword_26A4B2C80 != -1) {
    swift_once();
  }
  return &qword_26A4B2ED8;
}

uint64_t sub_25ACC8C40()
{
  return sub_25ACC9570(&qword_26A4B2C80);
}

uint64_t sub_25ACC8C64(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C80, &qword_26A4B2ED8);
}

uint64_t (*sub_25ACC8C88())()
{
  if (qword_26A4B2C80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8D10()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EE0 = result;
  return result;
}

uint64_t *sub_25ACC8D38()
{
  if (qword_26A4B2C88 != -1) {
    swift_once();
  }
  return &qword_26A4B2EE0;
}

uint64_t sub_25ACC8D84()
{
  return sub_25ACC9570(&qword_26A4B2C88);
}

uint64_t sub_25ACC8DA8(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C88, &qword_26A4B2EE0);
}

uint64_t (*sub_25ACC8DCC())()
{
  if (qword_26A4B2C88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8E54()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EE8 = result;
  return result;
}

uint64_t *sub_25ACC8E7C()
{
  if (qword_26A4B2C90 != -1) {
    swift_once();
  }
  return &qword_26A4B2EE8;
}

uint64_t sub_25ACC8EC8()
{
  return sub_25ACC9570(&qword_26A4B2C90);
}

uint64_t sub_25ACC8EEC(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C90, &qword_26A4B2EE8);
}

uint64_t (*sub_25ACC8F10())()
{
  if (qword_26A4B2C90 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC8F98()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EF0 = result;
  return result;
}

uint64_t sub_25ACC8FC0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 40);
  if (!v2) {
    goto LABEL_4;
  }
  unint64_t v3 = *(void *)(v2 + 16);
  if (v3 >> 31)
  {
    __break(1u);
LABEL_4:
    LODWORD(v3) = 0;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v2 == 0;
  return result;
}

uint64_t *sub_25ACC8FF0()
{
  if (qword_26A4B2C98 != -1) {
    swift_once();
  }
  return &qword_26A4B2EF0;
}

uint64_t sub_25ACC903C()
{
  return sub_25ACC9570(&qword_26A4B2C98);
}

uint64_t sub_25ACC9060(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2C98, &qword_26A4B2EF0);
}

uint64_t (*sub_25ACC9084())()
{
  if (qword_26A4B2C98 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC910C()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2EF8 = result;
  return result;
}

uint64_t *sub_25ACC9134()
{
  if (qword_26A4B2CA0 != -1) {
    swift_once();
  }
  return &qword_26A4B2EF8;
}

uint64_t sub_25ACC9180()
{
  return sub_25ACC9570(&qword_26A4B2CA0);
}

uint64_t sub_25ACC91A4(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2CA0, &qword_26A4B2EF8);
}

uint64_t (*sub_25ACC91C8())()
{
  if (qword_26A4B2CA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC9250()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2F00 = result;
  return result;
}

uint64_t *sub_25ACC9278()
{
  if (qword_26A4B2CA8 != -1) {
    swift_once();
  }
  return &qword_26A4B2F00;
}

uint64_t sub_25ACC92C4()
{
  return sub_25ACC9570(&qword_26A4B2CA8);
}

uint64_t sub_25ACC92E8(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2CA8, &qword_26A4B2F00);
}

uint64_t (*sub_25ACC930C())()
{
  if (qword_26A4B2CA8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC9394()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2F08 = result;
  return result;
}

uint64_t *sub_25ACC93BC()
{
  if (qword_26A4B2CB0 != -1) {
    swift_once();
  }
  return &qword_26A4B2F08;
}

uint64_t sub_25ACC9408()
{
  return sub_25ACC9570(&qword_26A4B2CB0);
}

uint64_t sub_25ACC942C(uint64_t a1)
{
  return sub_25ACC95F0(a1, &qword_26A4B2CB0, &qword_26A4B2F08);
}

uint64_t (*sub_25ACC9450())()
{
  if (qword_26A4B2CB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC94D8()
{
  uint64_t result = swift_getKeyPath();
  qword_26A4B2F10 = result;
  return result;
}

uint64_t *sub_25ACC9500()
{
  if (qword_26A4B2CB8[0] != -1) {
    swift_once();
  }
  return &qword_26A4B2F10;
}

uint64_t sub_25ACC954C()
{
  return sub_25ACC9570(qword_26A4B2CB8);
}

uint64_t sub_25ACC9570(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_25ACC95CC(uint64_t a1)
{
  return sub_25ACC95F0(a1, qword_26A4B2CB8, &qword_26A4B2F10);
}

uint64_t sub_25ACC95F0(uint64_t a1, void *a2, void *a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a3 = a1;
  return swift_release();
}

uint64_t (*sub_25ACC9658())()
{
  if (qword_26A4B2CB8[0] != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25ACC96E0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  unsigned int v7 = sub_25ACCC87C();
  if (!v8)
  {
LABEL_16:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACCFE8C();
    return swift_release();
  }
  unsigned int v9 = v7;
  uint64_t v10 = v8;
  while (1)
  {
    uint64_t v16 = *a5;
    unint64_t v18 = sub_25ACCADC4(v9);
    uint64_t v19 = *(void *)(v16 + 16);
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20)) {
      break;
    }
    char v22 = v17;
    if (*(void *)(v16 + 24) >= v21)
    {
      if (a4)
      {
        if (v17) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_25ACCAE78();
        if (v22) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_25ACCA51C(v21, a4 & 1);
      unint64_t v23 = sub_25ACCADC4(v9);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_19;
      }
      unint64_t v18 = v23;
      if (v22)
      {
LABEL_3:
        uint64_t v11 = *a5;
        uint64_t v12 = *(void *)(*(void *)(*a5 + 56) + 8 * v18);
        uint64_t v30 = v10;
        sub_25ACD56A0();
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B27F0);
        sub_25ACCFE94();
        uint64_t v30 = Array.appending<A>(contentsOf:)((uint64_t)&v30, v12);
        sub_25ACB1BA0(&qword_26A4B27D0);
        Array<A>.removeDuplicates()();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v13 = *(void *)(v11 + 56);
        uint64_t v14 = v30;
        swift_bridgeObjectRelease();
        *(void *)(v13 + 8 * v18) = v14;
        goto LABEL_4;
      }
    }
    char v25 = (void *)*a5;
    *(void *)(*a5 + 8 * (v18 >> 6) + 64) |= 1 << v18;
    *(_DWORD *)(v25[6] + 4 * v18) = v9;
    *(void *)(v25[7] + 8 * v18) = v10;
    uint64_t v26 = v25[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_18;
    }
    v25[2] = v28;
LABEL_4:
    unsigned int v9 = sub_25ACCC87C();
    uint64_t v10 = v15;
    a4 = 1;
    if (!v15) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACC996C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25ACCC9FC();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v9 = v7;
  int v10 = v8;
  uint64_t v11 = (void *)*a5;
  unint64_t v13 = sub_25ACCAE0C(v7);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  char v17 = v12;
  if (v11[3] >= v16)
  {
    if (a4)
    {
      BOOL v20 = (void *)*a5;
      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25ACCB020();
      BOOL v20 = (void *)*a5;
      if (v17) {
        goto LABEL_9;
      }
    }
LABEL_12:
    v20[(v13 >> 6) + 8] |= 1 << v13;
    *(void *)(v20[6] + 8 * v13) = v9;
    *(_DWORD *)(v20[7] + 4 * v13) = v10;
    uint64_t v25 = v20[2];
    BOOL v23 = __OFADD__(v25, 1);
    uint64_t v26 = v25 + 1;
    if (v23)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v20[2] = v26;
LABEL_14:
    uint64_t v27 = sub_25ACCC9FC();
    if (v27)
    {
      uint64_t v29 = v27;
      int v30 = v28;
      do
      {
        uint64_t v34 = (void *)*a5;
        unint64_t v35 = sub_25ACCAE0C(v29);
        uint64_t v37 = v34[2];
        BOOL v38 = (v36 & 1) == 0;
        BOOL v23 = __OFADD__(v37, v38);
        uint64_t v39 = v37 + v38;
        if (v23) {
          goto LABEL_26;
        }
        char v40 = v36;
        if (v34[3] < v39)
        {
          sub_25ACCA7D0(v39, 1);
          unint64_t v35 = sub_25ACCAE0C(v29);
          if ((v40 & 1) != (v41 & 1)) {
            goto LABEL_29;
          }
        }
        char v42 = (void *)*a5;
        if (v40)
        {
          uint64_t v43 = v42[7];
          int v44 = *(_DWORD *)(v43 + 4 * v35);
          BOOL v23 = __OFADD__(v44, v30);
          int v45 = v44 + v30;
          if (v23) {
            goto LABEL_28;
          }
          *(_DWORD *)(v43 + 4 * v35) = v45;
        }
        else
        {
          v42[(v35 >> 6) + 8] |= 1 << v35;
          *(void *)(v42[6] + 8 * v35) = v29;
          *(_DWORD *)(v42[7] + 4 * v35) = v30;
          uint64_t v31 = v42[2];
          BOOL v23 = __OFADD__(v31, 1);
          uint64_t v32 = v31 + 1;
          if (v23) {
            goto LABEL_27;
          }
          v42[2] = v32;
        }
        uint64_t v29 = sub_25ACCC9FC();
        int v30 = v33;
      }
      while (v29);
    }
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACCFE8C();
    return swift_release();
  }
  sub_25ACCA7D0(v16, a4 & 1);
  unint64_t v18 = sub_25ACCAE0C(v9);
  if ((v17 & 1) == (v19 & 1))
  {
    unint64_t v13 = v18;
    BOOL v20 = (void *)*a5;
    if ((v17 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v21 = v20[7];
    int v22 = *(_DWORD *)(v21 + 4 * v13);
    BOOL v23 = __OFADD__(v22, v10);
    int v24 = v22 + v10;
    if (v23)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    *(_DWORD *)(v21 + 4 * v13) = v24;
    goto LABEL_14;
  }
LABEL_29:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACC9C1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25ACCCB64();
  if (!v7) {
    goto LABEL_23;
  }
  uint64_t v9 = v7;
  int v10 = v8;
  uint64_t v11 = (void *)*a5;
  unint64_t v13 = sub_25ACA7F54(v7);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v17 = v12;
  if (v11[3] >= v16)
  {
    if (a4)
    {
      BOOL v20 = (void *)*a5;
      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25ACCB1B4();
      BOOL v20 = (void *)*a5;
      if (v17) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v20[(v13 >> 6) + 8] |= 1 << v13;
    *(void *)(v20[6] + 8 * v13) = v9;
    *(_DWORD *)(v20[7] + 4 * v13) = v10;
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v20[2] = v24;
LABEL_13:
    uint64_t v25 = sub_25ACCCB64();
    if (v25)
    {
      uint64_t v27 = v25;
      int v28 = v26;
      do
      {
        uint64_t v32 = (void *)*a5;
        unint64_t v33 = sub_25ACA7F54(v27);
        uint64_t v35 = v32[2];
        BOOL v36 = (v34 & 1) == 0;
        BOOL v23 = __OFADD__(v35, v36);
        uint64_t v37 = v35 + v36;
        if (v23) {
          goto LABEL_24;
        }
        char v38 = v34;
        if (v32[3] < v37)
        {
          sub_25ACCAA98(v37, 1);
          unint64_t v33 = sub_25ACA7F54(v27);
          if ((v38 & 1) != (v39 & 1)) {
            goto LABEL_26;
          }
        }
        char v40 = (void *)*a5;
        if (v38)
        {
          uint64_t v29 = 4 * v33;
          int v30 = *(_DWORD *)(v40[7] + 4 * v33);
          swift_release();
          *(_DWORD *)(v40[7] + v29) = v30;
        }
        else
        {
          v40[(v33 >> 6) + 8] |= 1 << v33;
          *(void *)(v40[6] + 8 * v33) = v27;
          *(_DWORD *)(v40[7] + 4 * v33) = v28;
          uint64_t v41 = v40[2];
          BOOL v23 = __OFADD__(v41, 1);
          uint64_t v42 = v41 + 1;
          if (v23) {
            goto LABEL_25;
          }
          v40[2] = v42;
        }
        uint64_t v27 = sub_25ACCCB64();
        int v28 = v31;
      }
      while (v27);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACCFE8C();
    return swift_release();
  }
  sub_25ACCAA98(v16, a4 & 1);
  unint64_t v18 = sub_25ACA7F54(v9);
  if ((v17 & 1) == (v19 & 1))
  {
    unint64_t v13 = v18;
    BOOL v20 = (void *)*a5;
    if ((v17 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    int v21 = *(_DWORD *)(v20[7] + 4 * v13);
    swift_release();
    *(_DWORD *)(v20[7] + 4 * v13) = v21;
    goto LABEL_13;
  }
LABEL_26:
  sub_25ACD56A0();
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACC9ED8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t *a6)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v9 = sub_25ACCCCE4();
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  unint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_25ACA7F54(v9);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      uint64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25ACCB35C(a6);
      uint64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v26 = 8 * v15;
    *(void *)(v22[6] + v26) = v11;
    *(void *)(v22[7] + v26) = v12;
    uint64_t v27 = v22[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    _OWORD v22[2] = v29;
LABEL_13:
    uint64_t v30 = sub_25ACCCCE4();
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = v31;
      do
      {
        char v38 = (void *)*a5;
        unint64_t v39 = sub_25ACA7F54(v32);
        uint64_t v41 = v38[2];
        BOOL v42 = (v40 & 1) == 0;
        BOOL v28 = __OFADD__(v41, v42);
        uint64_t v43 = v41 + v42;
        if (v28) {
          goto LABEL_24;
        }
        char v44 = v40;
        if (v38[3] < v43)
        {
          sub_25ACCA1E4(v43, 1, a6);
          unint64_t v39 = sub_25ACA7F54(v32);
          if ((v44 & 1) != (v45 & 1)) {
            goto LABEL_26;
          }
        }
        long long v46 = (void *)*a5;
        if (v44)
        {
          uint64_t v34 = 8 * v39;
          uint64_t v35 = *(void *)(v46[7] + 8 * v39);
          swift_bridgeObjectRetain();
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v36 = v46[7];
          swift_bridgeObjectRelease();
          *(void *)(v36 + v34) = v35;
        }
        else
        {
          v46[(v39 >> 6) + 8] |= 1 << v39;
          uint64_t v47 = 8 * v39;
          *(void *)(v46[6] + v47) = v32;
          *(void *)(v46[7] + v47) = v33;
          uint64_t v48 = v46[2];
          BOOL v28 = __OFADD__(v48, 1);
          uint64_t v49 = v48 + 1;
          if (v28) {
            goto LABEL_25;
          }
          v46[2] = v49;
        }
        uint64_t v32 = sub_25ACCCCE4();
        uint64_t v33 = v37;
      }
      while (v32);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25ACCFE8C();
    return swift_release();
  }
  sub_25ACCA1E4(v18, a4 & 1, a6);
  unint64_t v20 = sub_25ACA7F54(v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    uint64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v23 = 8 * v15;
    uint64_t v24 = *(void *)(v22[7] + v23);
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v25 = v22[7];
    swift_bridgeObjectRelease();
    *(void *)(v25 + v23) = v24;
    goto LABEL_13;
  }
LABEL_26:
  sub_25ACD56A0();
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACCA1E4(uint64_t a1, char a2, uint64_t *a3)
{
  int v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v36 = a2;
  uint64_t v7 = sub_25ACD5F00();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v35 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v34) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v35 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v35 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v35 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v34) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v35 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void *)(*(void *)(v6 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v6 + 56) + v30);
    if ((v36 & 1) == 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
    }
    sub_25ACD56A0();
    sub_25ACB1BA0(&qword_26A4B27D0);
    uint64_t result = sub_25ACD5B10();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v8 + 48) + v19) = v31;
    *(void *)(*(void *)(v8 + 56) + v19) = v32;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v23 = (void *)(v6 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v6 + 32);
  if (v33 >= 64) {
    bzero(v23, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v33;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_25ACCA51C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A88);
  uint64_t result = sub_25ACD5F00();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v29 = -1 << v10;
    uint64_t v30 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v9[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if (a2)
              {
                if (v30 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v31);
                }
                else {
                  *uint64_t v9 = v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v9[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v12 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(unsigned int *)(*(void *)(v5 + 48) + 4 * v19);
      uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = MEMORY[0x261153F00](*(void *)(v7 + 40), v27, 4);
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v16 == v24;
          if (v16 == v24) {
            unint64_t v16 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v17) = v27;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACCA7D0(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A80);
  uint64_t result = sub_25ACD5F00();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    int64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v31 = -1 << v29;
              }
              unint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * v16);
      int v21 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v16);
      sub_25ACD5FF0();
      sub_25ACD6000();
      uint64_t result = sub_25ACD6010();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      *(_DWORD *)(*(void *)(v7 + 56) + 4 * v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACCAA98(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2778);
  char v34 = a2;
  uint64_t v6 = sub_25ACD5F00();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = v2;
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v20 >= v32) {
      break;
    }
    int v21 = (void *)(v5 + 64);
    unint64_t v22 = *(void *)(v33 + 8 * v20);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v20 + 1;
      if (v20 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (!v22)
      {
        int64_t v23 = v20 + 2;
        if (v23 >= v32)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v31;
          if ((v34 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v22 = *(void *)(v33 + 8 * v23);
        if (!v22)
        {
          while (1)
          {
            int64_t v13 = v23 + 1;
            if (__OFADD__(v23, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v32) {
              goto LABEL_33;
            }
            unint64_t v22 = *(void *)(v33 + 8 * v13);
            ++v23;
            if (v22) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v23;
      }
    }
LABEL_30:
    unint64_t v10 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_31:
    uint64_t v28 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
    int v29 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v19);
    if ((v34 & 1) == 0) {
      swift_retain();
    }
    sub_25ACD56A0();
    sub_25ACB1BA0(&qword_26A4B27D0);
    uint64_t result = sub_25ACD5B10();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v26 = v16 == v25;
        if (v16 == v25) {
          unint64_t v16 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v16);
      }
      while (v27 == -1);
      unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(void *)(*(void *)(v7 + 48) + 8 * v17) = v28;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v31;
  int v21 = (void *)(v5 + 64);
  if ((v34 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
  if (v30 >= 64) {
    bzero(v21, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int v21 = -1 << v30;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_25ACCADC4(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x261153F00](*(void *)(v1 + 40), a1, 4);

  return sub_25ACCB500(a1, v3);
}

unint64_t sub_25ACCAE0C(uint64_t a1)
{
  sub_25ACD5FF0();
  sub_25ACD6000();
  uint64_t v2 = sub_25ACD6010();

  return sub_25ACBF620(a1, v2);
}

void *sub_25ACCAE78()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 8 * v15;
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + v18);
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v18) = v19;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACCB020()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v23 = __clz(__rbit64(v21));
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = v23 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 4 * v15;
    int v19 = *(_DWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_DWORD *)(*(void *)(v4 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACCB1B4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2778);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 4 * v15;
    int v19 = *(_DWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_DWORD *)(*(void *)(v4 + 56) + v18) = v19;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACCB35C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25ACD5EF0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    swift_retain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_25ACCB500(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_25ACCB59C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v5;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t result = sub_25ACD5F10();
  uint64_t v9 = result;
  uint64_t v32 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  uint64_t v34 = v5;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v35 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v32) {
        return v9;
      }
      unint64_t v16 = a1[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v32) {
          return v9;
        }
        unint64_t v16 = a1[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v32) {
            return v9;
          }
          unint64_t v16 = a1[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v32) {
              return v9;
            }
            unint64_t v16 = a1[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v32) {
                  return v9;
                }
                unint64_t v16 = a1[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v35 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = 8 * v14;
    uint64_t v20 = *(void *)(*(void *)(v5 + 48) + v19);
    uint64_t v21 = *(void *)(*(void *)(v5 + 56) + v19);
    sub_25ACD56A0();
    sub_25ACB1BA0(&qword_26A4B27D0);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t result = sub_25ACD5B10();
    uint64_t v22 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = 8 * v25;
    *(void *)(*(void *)(v9 + 48) + v30) = v20;
    *(void *)(*(void *)(v9 + 56) + v30) = v21;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v6--, 1)) {
      break;
    }
    uint64_t v5 = v34;
    uint64_t v11 = v35;
    if (!v6) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25ACCB880(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2778);
  uint64_t result = sub_25ACD5F10();
  uint64_t v8 = result;
  uint64_t v29 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  uint64_t v31 = v4;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      uint64_t v32 = v10;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v29) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      uint64_t v16 = v10 + 1;
      if (!v15)
      {
        uint64_t v16 = v10 + 2;
        if (v10 + 2 >= v29) {
          return v8;
        }
        unint64_t v15 = a1[v16];
        if (!v15)
        {
          uint64_t v16 = v10 + 3;
          if (v10 + 3 >= v29) {
            return v8;
          }
          unint64_t v15 = a1[v16];
          if (!v15)
          {
            uint64_t v17 = v10 + 4;
            if (v10 + 4 >= v29) {
              return v8;
            }
            unint64_t v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                uint64_t v16 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v16 >= v29) {
                  return v8;
                }
                unint64_t v15 = a1[v16];
                ++v17;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v16 = v10 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      uint64_t v32 = v16;
      unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v13);
    int v19 = *(_DWORD *)(*(void *)(v4 + 56) + 4 * v13);
    sub_25ACD56A0();
    sub_25ACB1BA0(&qword_26A4B27D0);
    swift_retain();
    uint64_t result = sub_25ACD5B10();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v8 + 48) + 8 * v23) = v18;
    *(_DWORD *)(*(void *)(v8 + 56) + 4 * v23) = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t v4 = v31;
    uint64_t v10 = v32;
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25ACCBB58(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25ACCADC4(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25ACCAE78();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_DWORD *)(v16[6] + 4 * v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      void v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_25ACCA51C(result, a3 & 1);
  uint64_t result = sub_25ACCADC4(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACCBC90(int a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25ACCAE0C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25ACCB020();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(_DWORD *)(v16[7] + 4 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(void *)(v16[6] + 8 * v10) = a2;
    *(_DWORD *)(v16[7] + 4 * v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      void v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_25ACCA7D0(result, a3 & 1);
  uint64_t result = sub_25ACCAE0C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACCBDBC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25ACD5FF0();
  swift_bridgeObjectRetain();
  sub_25ACD5B90();
  uint64_t v8 = sub_25ACD6010();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    BOOL v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25ACD5F80() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_25ACD5F80() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25ACCC24C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25ACCBF6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A78);
  uint64_t v3 = sub_25ACD5DB0();
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
                uint64_t v1 = v0;
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
      sub_25ACD5FF0();
      sub_25ACD5B90();
      uint64_t result = sub_25ACD6010();
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
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25ACCC24C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25ACCBF6C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25ACCC3E8();
      goto LABEL_22;
    }
    sub_25ACCC59C();
  }
  uint64_t v11 = *v4;
  sub_25ACD5FF0();
  sub_25ACD5B90();
  uint64_t result = sub_25ACD6010();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25ACD5F80(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25ACD5FB0();
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
          uint64_t result = sub_25ACD5F80();
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

void *sub_25ACCC3E8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5DA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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

uint64_t sub_25ACCC59C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A78);
  uint64_t v3 = sub_25ACD5DB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    sub_25ACD5FF0();
    swift_bridgeObjectRetain();
    sub_25ACD5B90();
    uint64_t result = sub_25ACD6010();
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

uint64_t sub_25ACCC850(uint64_t a1)
{
  return a1;
}

uint64_t sub_25ACCC87C()
{
  void (*v9)(uint64_t *__return_ptr, int *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    int v7 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * v6);
    uint64_t v8 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, int *))v0[5];
    int64_t v18 = v7;
    BOOL v19 = v8;
    swift_bridgeObjectRetain();
    v9(&v17, &v18);
    swift_bridgeObjectRelease();
    return v17;
  }
  int64_t v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      int64_t v13 = v0[1];
      unint64_t v14 = *(void *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        uint64_t v5 = (v14 - 1) & v14;
        unint64_t v6 = __clz(__rbit64(v14)) + (v11 << 6);
        int64_t v4 = v11;
        goto LABEL_3;
      }
      unint64_t v15 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        unint64_t v14 = *(void *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          int64_t v11 = v15;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          unint64_t v14 = *(void *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            int64_t v11 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v15 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            unint64_t v14 = *(void *)(v13 + 8 * v15);
            if (v14) {
              goto LABEL_10;
            }
            int64_t v11 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              unint64_t v14 = *(void *)(v13 + 8 * v11);
              if (v14) {
                goto LABEL_7;
              }
              int64_t v4 = v12 - 1;
              int64_t v16 = v3 + 6;
              while (v12 != v16)
              {
                unint64_t v14 = *(void *)(v13 + 8 * v16++);
                if (v14)
                {
                  int64_t v11 = v16 - 1;
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

uint64_t sub_25ACCC9FC()
{
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(v1 + 48) + 8 * v6);
    int v8 = *(_DWORD *)(*(void *)(v1 + 56) + 4 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    int64_t v18 = v7;
    BOOL v19 = v8;
    v9(&v17, &v18);
    return v17;
  }
  int64_t v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      int64_t v13 = v0[1];
      unint64_t v14 = *(void *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        uint64_t v5 = (v14 - 1) & v14;
        unint64_t v6 = __clz(__rbit64(v14)) + (v11 << 6);
        int64_t v4 = v11;
        goto LABEL_3;
      }
      unint64_t v15 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        unint64_t v14 = *(void *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          int64_t v11 = v15;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          unint64_t v14 = *(void *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            int64_t v11 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v15 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            unint64_t v14 = *(void *)(v13 + 8 * v15);
            if (v14) {
              goto LABEL_10;
            }
            int64_t v11 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              unint64_t v14 = *(void *)(v13 + 8 * v11);
              if (v14) {
                goto LABEL_7;
              }
              int64_t v4 = v12 - 1;
              int64_t v16 = v3 + 6;
              while (v12 != v16)
              {
                unint64_t v14 = *(void *)(v13 + 8 * v16++);
                if (v14)
                {
                  int64_t v11 = v16 - 1;
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

uint64_t sub_25ACCCB64()
{
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(v1 + 48) + 8 * v6);
    int v8 = *(_DWORD *)(*(void *)(v1 + 56) + 4 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    int64_t v18 = v7;
    BOOL v19 = v8;
    swift_retain();
    v9(&v17, &v18);
    swift_release();
    return v17;
  }
  int64_t v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      int64_t v13 = v0[1];
      unint64_t v14 = *(void *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        uint64_t v5 = (v14 - 1) & v14;
        unint64_t v6 = __clz(__rbit64(v14)) + (v11 << 6);
        int64_t v4 = v11;
        goto LABEL_3;
      }
      unint64_t v15 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        unint64_t v14 = *(void *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          int64_t v11 = v15;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          unint64_t v14 = *(void *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            int64_t v11 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v15 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            unint64_t v14 = *(void *)(v13 + 8 * v15);
            if (v14) {
              goto LABEL_10;
            }
            int64_t v11 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              unint64_t v14 = *(void *)(v13 + 8 * v11);
              if (v14) {
                goto LABEL_7;
              }
              int64_t v4 = v12 - 1;
              int64_t v16 = v3 + 6;
              while (v12 != v16)
              {
                unint64_t v14 = *(void *)(v13 + 8 * v16++);
                if (v14)
                {
                  int64_t v11 = v16 - 1;
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

uint64_t sub_25ACCCCE4()
{
  void (*v9)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  void v18[2];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = *(void *)(*(void *)(v1 + 48) + 8 * v6);
    uint64_t v8 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v18[0] = v7;
    v18[1] = v8;
    swift_retain();
    swift_bridgeObjectRetain();
    v9(&v17, v18);
    swift_bridgeObjectRelease();
    swift_release();
    return v17;
  }
  int64_t v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      int64_t v13 = v0[1];
      unint64_t v14 = *(void *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        uint64_t v5 = (v14 - 1) & v14;
        unint64_t v6 = __clz(__rbit64(v14)) + (v11 << 6);
        int64_t v4 = v11;
        goto LABEL_3;
      }
      unint64_t v15 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        unint64_t v14 = *(void *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          int64_t v11 = v15;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          unint64_t v14 = *(void *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            int64_t v11 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v15 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            unint64_t v14 = *(void *)(v13 + 8 * v15);
            if (v14) {
              goto LABEL_10;
            }
            int64_t v11 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              unint64_t v14 = *(void *)(v13 + 8 * v11);
              if (v14) {
                goto LABEL_7;
              }
              int64_t v4 = v12 - 1;
              int64_t v16 = v3 + 6;
              while (v12 != v16)
              {
                unint64_t v14 = *(void *)(v13 + 8 * v16++);
                if (v14)
                {
                  int64_t v11 = v16 - 1;
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

uint64_t sub_25ACCCE70@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  *(_DWORD *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACCCE84@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(_DWORD *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(_DWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_25ACCCE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(_DWORD *)(a1 + 8);
  *(void *)a2 = *(void *)a1;
  *(_DWORD *)(a2 + 8) = v2;
  return swift_retain();
}

uint64_t sub_25ACCCEB0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  swift_retain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_25ACCCEF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25ACCE4D0((uint64_t)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    if (v3) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    int64_t v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_25ACCE4D0((uint64_t)v13, v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    MEMORY[0x261154430](v13, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v12;
}

unint64_t sub_25ACCD0B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A88);
  uint64_t v3 = (void *)sub_25ACD5F10();
  unsigned int v4 = *(_DWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t result = sub_25ACCADC4(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  unsigned int v8 = (void *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    v3[2] = v11;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v12 = v8 + 2;
    unsigned int v4 = *((_DWORD *)v8 - 2);
    uint64_t v13 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25ACCADC4(v4);
    unsigned int v8 = v12;
    uint64_t v5 = v13;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACCD1BC(unsigned int a1, uint64_t a2)
{
  uint64_t v5 = *(uint64_t **)(v2 + 24);
  sub_25ACB1CA0(*(void *)(v2 + 16) + 40, (uint64_t)v17, &qword_26A4B2A60);
  sub_25ACB1CA0((uint64_t)v17, (uint64_t)&v18, &qword_26A4B2A60);
  uint64_t v6 = v18;
  if (v18 && *(void *)(v18 + 16) && (unint64_t v7 = sub_25ACCADC4(a1), (v8 & 1) != 0))
  {
    unint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    unint64_t v10 = swift_bridgeObjectRetain();
    unint64_t v11 = sub_25ACCD708(v10, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_25ACD5EE0();
      swift_bridgeObjectRelease();
      if (v15 < 1) {
        return swift_bridgeObjectRelease();
      }
    }
    else if (*(uint64_t *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
    {
      return swift_bridgeObjectRelease();
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    uint64_t v13 = v11;
  }
  else
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    uint64_t v13 = a2;
  }
  sub_25ACCBB58(v13, a1, isUniquelyReferenced_nonNull_native);
  *uint64_t v5 = v16;
  return swift_bridgeObjectRelease();
}

uint64_t sub_25ACCD334(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v8) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v4 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v4 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v4 + 8 * v10);
        if (!v16)
        {
          int64_t v10 = v15 + 3;
          if (v15 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v4 + 8 * v10);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 48) + 4 * v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    a2(v13, v14);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v8) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v4 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v4 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25ACCD4BC(int *a1, uint64_t a2)
{
  int v3 = *a1;
  *(unsigned char *)(a2 + 4) = *((unsigned char *)a1 + 4);
  *(_DWORD *)a2 = v3;
  int v4 = a1[2];
  *(unsigned char *)(a2 + 12) = *((unsigned char *)a1 + 12);
  *(_DWORD *)(a2 + 8) = v4;
  int v5 = a1[4];
  *(unsigned char *)(a2 + 20) = *((unsigned char *)a1 + 20);
  *(_DWORD *)(a2 + 16) = v5;
  int v6 = a1[6];
  *(unsigned char *)(a2 + 28) = *((unsigned char *)a1 + 28);
  *(_DWORD *)(a2 + 24) = v6;
  int v7 = a1[8];
  *(unsigned char *)(a2 + 36) = *((unsigned char *)a1 + 36);
  *(_DWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 40) = *((void *)a1 + 5);
  int v8 = a1[12];
  *(unsigned char *)(a2 + 52) = *((unsigned char *)a1 + 52);
  *(_DWORD *)(a2 + 48) = v8;
  int v9 = a1[14];
  *(unsigned char *)(a2 + 60) = *((unsigned char *)a1 + 60);
  *(_DWORD *)(a2 + 56) = v9;
  int v10 = a1[16];
  *(unsigned char *)(a2 + 68) = *((unsigned char *)a1 + 68);
  *(_DWORD *)(a2 + 64) = v10;
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_25ACCD570(int *a1, uint64_t a2)
{
  int v4 = *a1;
  *(unsigned char *)(a2 + 4) = *((unsigned char *)a1 + 4);
  *(_DWORD *)a2 = v4;
  int v5 = a1[2];
  *(unsigned char *)(a2 + 12) = *((unsigned char *)a1 + 12);
  *(_DWORD *)(a2 + 8) = v5;
  int v6 = a1[4];
  *(unsigned char *)(a2 + 20) = *((unsigned char *)a1 + 20);
  *(_DWORD *)(a2 + 16) = v6;
  int v7 = a1[6];
  *(unsigned char *)(a2 + 28) = *((unsigned char *)a1 + 28);
  *(_DWORD *)(a2 + 24) = v7;
  int v8 = a1[8];
  *(unsigned char *)(a2 + 36) = *((unsigned char *)a1 + 36);
  *(_DWORD *)(a2 + 32) = v8;
  *(void *)(a2 + 40) = *((void *)a1 + 5);
  swift_bridgeObjectRelease();
  int v9 = a1[12];
  *(unsigned char *)(a2 + 52) = *((unsigned char *)a1 + 52);
  *(_DWORD *)(a2 + 48) = v9;
  int v10 = a1[14];
  *(unsigned char *)(a2 + 60) = *((unsigned char *)a1 + 60);
  *(_DWORD *)(a2 + 56) = v10;
  int v11 = a1[16];
  *(unsigned char *)(a2 + 68) = *((unsigned char *)a1 + 68);
  *(_DWORD *)(a2 + 64) = v11;
  return a2;
}

unint64_t sub_25ACCD628(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A80);
    int v3 = (void *)sub_25ACD5F10();
    for (uint64_t i = (_DWORD *)(a1 + 40); ; i += 4)
    {
      uint64_t v5 = *((void *)i - 1);
      int v6 = *i;
      unint64_t result = sub_25ACCAE0C(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      *(_DWORD *)(v3[7] + 4 * result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_25ACCD700(uint64_t a1, int a2)
{
  return sub_25ACC4710(a1, a2, *(void *)(v2 + 16), *(uint64_t **)(v2 + 24));
}

uint64_t sub_25ACCD708(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_30:
    uint64_t v4 = sub_25ACD5EE0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      uint64_t v13 = v3;
      unint64_t v5 = 0;
      uint64_t v15 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v16 = v3 & 0xC000000000000001;
      uint64_t v14 = v4;
      while (1)
      {
        if (v16)
        {
          MEMORY[0x261153D20](v5, v13);
          BOOL v6 = __OFADD__(v5++, 1);
          if (v6) {
            goto LABEL_29;
          }
        }
        else
        {
          if (v5 >= *(void *)(v15 + 16)) {
            goto LABEL_28;
          }
          swift_retain();
          BOOL v6 = __OFADD__(v5++, 1);
          if (v6)
          {
LABEL_29:
            __break(1u);
            goto LABEL_30;
          }
        }
        if (a2 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v7 = sub_25ACD5EE0();
          if (v7)
          {
LABEL_11:
            uint64_t v3 = sub_25ACD56A0();
            uint64_t v8 = 4;
            do
            {
              uint64_t v9 = v8 - 4;
              if ((a2 & 0xC000000000000001) != 0)
              {
                MEMORY[0x261153D20](v8 - 4, a2);
                uint64_t v10 = v8 - 3;
                if (__OFADD__(v9, 1)) {
                  goto LABEL_27;
                }
              }
              else
              {
                swift_retain();
                uint64_t v10 = v8 - 3;
                if (__OFADD__(v9, 1))
                {
LABEL_27:
                  __break(1u);
LABEL_28:
                  __break(1u);
                  goto LABEL_29;
                }
              }
              sub_25ACB1BA0(&qword_26A4B27E0);
              char v11 = sub_25ACD5B30();
              swift_release();
              if (v11)
              {
                swift_release();
                swift_bridgeObjectRelease();
                goto LABEL_5;
              }
              ++v8;
            }
            while (v10 != v7);
          }
        }
        else
        {
          uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v7) {
            goto LABEL_11;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v3 = (uint64_t)&v17;
        sub_25ACD5E30();
        sub_25ACD5E60();
        sub_25ACD5E70();
        sub_25ACD5E40();
LABEL_5:
        if (v5 == v14) {
          return v17;
        }
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25ACCD96C(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v14 = *(void *)(v4 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v14 = *(void *)(v4 + 8 * v10);
        if (!v14)
        {
          int64_t v10 = v13 + 3;
          if (v13 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v14 = *(void *)(v4 + 8 * v10);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_5:
    uint64_t result = a2(*(void *)(*(void *)(a1 + 48) + 8 * v12), *(unsigned int *)(*(void *)(a1 + 56) + 4 * v12));
  }
  int64_t v15 = v13 + 4;
  if (v15 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_25ACCDAD4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = (unint64_t *)result;
  uint64_t v23 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    while (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v6 << 6);
      if (!a4) {
        goto LABEL_4;
      }
LABEL_22:
      if (*(void *)(a4 + 16))
      {
        uint64_t v18 = *(void *)(*(void *)(a3 + 48) + 8 * v14);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_25ACA7F54(v18);
        char v20 = v19;
        swift_release();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          continue;
        }
      }
      goto LABEL_4;
    }
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v11) {
      return sub_25ACCB880(v22, a2, v23, a3);
    }
    unint64_t v16 = *(void *)(v7 + 8 * v15);
    ++v6;
    if (!v16)
    {
      int64_t v6 = v15 + 1;
      if (v15 + 1 >= v11) {
        return sub_25ACCB880(v22, a2, v23, a3);
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (!v16)
      {
        int64_t v6 = v15 + 2;
        if (v15 + 2 >= v11) {
          return sub_25ACCB880(v22, a2, v23, a3);
        }
        unint64_t v16 = *(void *)(v7 + 8 * v6);
        if (!v16) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v6 << 6);
    if (a4) {
      goto LABEL_22;
    }
LABEL_4:
    *(unint64_t *)((char *)v22 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    if (__OFADD__(v23++, 1)) {
      goto LABEL_28;
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v11) {
    return sub_25ACCB880(v22, a2, v23, a3);
  }
  unint64_t v16 = *(void *)(v7 + 8 * v17);
  if (v16)
  {
    int64_t v6 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v6 >= v11) {
      return sub_25ACCB880(v22, a2, v23, a3);
    }
    unint64_t v16 = *(void *)(v7 + 8 * v6);
    ++v17;
    if (v16) {
      goto LABEL_21;
    }
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25ACCDCAC(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25ACCDAD4((uint64_t)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    int64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25ACCDAD4((uint64_t)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x261154430](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_25ACCDE68@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = a2;
  if (!a2)
  {
LABEL_102:
    uint64_t v7 = 0;
    int v58 = 0;
LABEL_106:
    *(_DWORD *)a3 = v58;
    *(unsigned char *)(a3 + 4) = v3 == 0;
    *(void *)(a3 + 8) = result;
    *(void *)(a3 + 16) = v7;
    *(unsigned char *)(a3 + 24) = v3 == 0;
    *(void *)(a3 + 32) = v3;
    return result;
  }
  uint64_t v59 = a3;
  uint64_t v60 = result;
  v71[2] = MEMORY[0x263F8EE88];
  uint64_t v61 = a2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v62 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int v69 = 0;
  int64_t v8 = 0;
LABEL_7:
  uint64_t v70 = v7;
  if (v6)
  {
    uint64_t v65 = (v6 - 1) & v6;
    int64_t v67 = v8;
    unint64_t v9 = __clz(__rbit64(v6)) | (v8 << 6);
LABEL_25:
    uint64_t v14 = *(void *)(*(void *)(a2 + 56) + 8 * v9);
    uint64_t v15 = v14 + 64;
    uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
    if (v16 < 64) {
      uint64_t v17 = ~(-1 << v16);
    }
    else {
      uint64_t v17 = -1;
    }
    unint64_t v18 = v17 & *(void *)(v14 + 64);
    int64_t v19 = (unint64_t)(v16 + 63) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v20 = 0;
    while (1)
    {
      if (v18)
      {
        unint64_t v21 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        unint64_t v22 = v21 | (v20 << 6);
      }
      else
      {
        int64_t v27 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
          __break(1u);
          goto LABEL_104;
        }
        if (v27 >= v19) {
          goto LABEL_6;
        }
        unint64_t v28 = *(void *)(v15 + 8 * v27);
        ++v20;
        if (!v28)
        {
          int64_t v20 = v27 + 1;
          if (v27 + 1 >= v19) {
            goto LABEL_6;
          }
          unint64_t v28 = *(void *)(v15 + 8 * v20);
          if (!v28)
          {
            int64_t v20 = v27 + 2;
            if (v27 + 2 >= v19) {
              goto LABEL_6;
            }
            unint64_t v28 = *(void *)(v15 + 8 * v20);
            if (!v28)
            {
              int64_t v20 = v27 + 3;
              if (v27 + 3 >= v19) {
                goto LABEL_6;
              }
              unint64_t v28 = *(void *)(v15 + 8 * v20);
              if (!v28)
              {
                int64_t v29 = v27 + 4;
                if (v29 >= v19)
                {
LABEL_6:
                  uint64_t result = swift_release();
                  uint64_t v7 = v70;
                  unint64_t v6 = v65;
                  int64_t v8 = v67;
                  goto LABEL_7;
                }
                unint64_t v28 = *(void *)(v15 + 8 * v29);
                if (!v28)
                {
                  while (1)
                  {
                    int64_t v20 = v29 + 1;
                    if (__OFADD__(v29, 1)) {
                      break;
                    }
                    if (v20 >= v19) {
                      goto LABEL_6;
                    }
                    unint64_t v28 = *(void *)(v15 + 8 * v20);
                    ++v29;
                    if (v28) {
                      goto LABEL_47;
                    }
                  }
LABEL_108:
                  __break(1u);
LABEL_109:
                  __break(1u);
                  goto LABEL_110;
                }
                int64_t v20 = v29;
              }
            }
          }
        }
LABEL_47:
        unint64_t v18 = (v28 - 1) & v28;
        unint64_t v22 = __clz(__rbit64(v28)) + (v20 << 6);
      }
      uint64_t v23 = (uint64_t *)(*(void *)(v14 + 56) + 24 * v22);
      uint64_t v24 = *v23;
      uint64_t v25 = v23[1];
      uint64_t v26 = v23[2];
      swift_bridgeObjectRetain_n();
      uint64_t v7 = sub_25ACCBDBC(v71, v24, v25);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v7)
      {
        if (__OFADD__(v69, 1)) {
          goto LABEL_109;
        }
        ++v69;
        BOOL v30 = __CFADD__(v70, v26);
        v70 += v26;
        if (v30)
        {
          __break(1u);
          goto LABEL_52;
        }
      }
    }
  }
  int64_t v10 = v8 + 1;
  if (__OFADD__(v8, 1)) {
    goto LABEL_111;
  }
  if (v10 < v62)
  {
    unint64_t v11 = *(void *)(v61 + 8 * v10);
    int64_t v12 = v8 + 1;
    if (v11) {
      goto LABEL_24;
    }
    int64_t v12 = v8 + 2;
    if (v8 + 2 >= v62) {
      goto LABEL_52;
    }
    unint64_t v11 = *(void *)(v61 + 8 * v12);
    if (v11) {
      goto LABEL_24;
    }
    int64_t v12 = v8 + 3;
    if (v8 + 3 >= v62) {
      goto LABEL_52;
    }
    unint64_t v11 = *(void *)(v61 + 8 * v12);
    if (v11) {
      goto LABEL_24;
    }
    int64_t v12 = v8 + 4;
    if (v8 + 4 >= v62) {
      goto LABEL_52;
    }
    unint64_t v11 = *(void *)(v61 + 8 * v12);
    if (v11) {
      goto LABEL_24;
    }
    uint64_t v13 = v8 + 5;
    if (v8 + 5 >= v62) {
      goto LABEL_52;
    }
    unint64_t v11 = *(void *)(v61 + 8 * v13);
    if (v11)
    {
      int64_t v12 = v8 + 5;
LABEL_24:
      uint64_t v65 = (v11 - 1) & v11;
      int64_t v67 = v12;
      unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
      goto LABEL_25;
    }
    while (1)
    {
      int64_t v12 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_113;
      }
      if (v12 >= v62) {
        break;
      }
      unint64_t v11 = *(void *)(v61 + 8 * v12);
      ++v13;
      if (v11) {
        goto LABEL_24;
      }
    }
  }
LABEL_52:
  uint64_t v3 = a2;
  swift_release();
  if (!v60)
  {
LABEL_105:
    swift_bridgeObjectRelease();
    a3 = v59;
    uint64_t result = v60;
    int v58 = v69;
    goto LABEL_106;
  }
  uint64_t v63 = v60 + 64;
  uint64_t v31 = 1 << *(unsigned char *)(v60 + 32);
  if (v31 < 64) {
    uint64_t v32 = ~(-1 << v31);
  }
  else {
    uint64_t v32 = -1;
  }
  unint64_t v33 = v32 & *(void *)(v60 + 64);
  int64_t v66 = (unint64_t)(v31 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v34 = 0;
  uint64_t v3 = 24;
  while (2)
  {
    if (!v33)
    {
      int64_t v37 = v34 + 1;
      uint64_t result = v60;
      uint64_t v7 = v70;
      if (__OFADD__(v34, 1)) {
        goto LABEL_112;
      }
      if (v37 < v66)
      {
        unint64_t v38 = *(void *)(v63 + 8 * v37);
        int64_t v39 = v34 + 1;
        if (v38) {
          goto LABEL_75;
        }
        int64_t v39 = v34 + 2;
        if (v34 + 2 >= v66) {
          goto LABEL_104;
        }
        unint64_t v38 = *(void *)(v63 + 8 * v39);
        if (v38) {
          goto LABEL_75;
        }
        int64_t v39 = v34 + 3;
        if (v34 + 3 >= v66) {
          goto LABEL_104;
        }
        unint64_t v38 = *(void *)(v63 + 8 * v39);
        if (v38) {
          goto LABEL_75;
        }
        int64_t v39 = v34 + 4;
        if (v34 + 4 >= v66) {
          goto LABEL_104;
        }
        unint64_t v38 = *(void *)(v63 + 8 * v39);
        if (v38) {
          goto LABEL_75;
        }
        uint64_t v40 = v34 + 5;
        if (v34 + 5 >= v66) {
          goto LABEL_104;
        }
        unint64_t v38 = *(void *)(v63 + 8 * v40);
        if (v38)
        {
          int64_t v39 = v34 + 5;
LABEL_75:
          uint64_t v68 = (v38 - 1) & v38;
          int64_t v35 = v39;
          unint64_t v36 = __clz(__rbit64(v38)) + (v39 << 6);
          goto LABEL_76;
        }
        while (1)
        {
          int64_t v39 = v40 + 1;
          if (__OFADD__(v40, 1)) {
            goto LABEL_114;
          }
          if (v39 >= v66) {
            break;
          }
          unint64_t v38 = *(void *)(v63 + 8 * v39);
          ++v40;
          if (v38) {
            goto LABEL_75;
          }
        }
      }
LABEL_104:
      swift_release();
      uint64_t v3 = a2;
      goto LABEL_105;
    }
    uint64_t v68 = (v33 - 1) & v33;
    int64_t v35 = v34;
    unint64_t v36 = __clz(__rbit64(v33)) | (v34 << 6);
    uint64_t result = v60;
LABEL_76:
    uint64_t v41 = *(void *)(*(void *)(result + 56) + 8 * v36);
    uint64_t v42 = v41 + 64;
    uint64_t v43 = 1 << *(unsigned char *)(v41 + 32);
    if (v43 < 64) {
      uint64_t v44 = ~(-1 << v43);
    }
    else {
      uint64_t v44 = -1;
    }
    unint64_t v45 = v44 & *(void *)(v41 + 64);
    int64_t v46 = (unint64_t)(v43 + 63) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v47 = 0;
    while (1)
    {
      if (v45)
      {
        unint64_t v48 = __clz(__rbit64(v45));
        v45 &= v45 - 1;
        unint64_t v49 = v48 | (v47 << 6);
        goto LABEL_81;
      }
      int64_t v54 = v47 + 1;
      if (__OFADD__(v47, 1))
      {
        __break(1u);
        goto LABEL_108;
      }
      if (v54 >= v46) {
        goto LABEL_57;
      }
      unint64_t v55 = *(void *)(v42 + 8 * v54);
      ++v47;
      if (!v55)
      {
        int64_t v47 = v54 + 1;
        if (v54 + 1 >= v46) {
          goto LABEL_57;
        }
        unint64_t v55 = *(void *)(v42 + 8 * v47);
        if (!v55)
        {
          int64_t v47 = v54 + 2;
          if (v54 + 2 >= v46) {
            goto LABEL_57;
          }
          unint64_t v55 = *(void *)(v42 + 8 * v47);
          if (!v55)
          {
            int64_t v47 = v54 + 3;
            if (v54 + 3 >= v46) {
              goto LABEL_57;
            }
            unint64_t v55 = *(void *)(v42 + 8 * v47);
            if (!v55) {
              break;
            }
          }
        }
      }
LABEL_98:
      unint64_t v45 = (v55 - 1) & v55;
      unint64_t v49 = __clz(__rbit64(v55)) + (v47 << 6);
LABEL_81:
      int v50 = (uint64_t *)(*(void *)(v41 + 56) + 24 * v49);
      uint64_t v51 = *v50;
      uint64_t v52 = v50[1];
      swift_bridgeObjectRetain();
      char v53 = sub_25ACCBDBC(v71, v51, v52);
      uint64_t result = swift_bridgeObjectRelease();
      if (v53)
      {
        BOOL v57 = __OFADD__(v69, 1);
        a3 = ++v69;
        if (v57)
        {
          __break(1u);
          goto LABEL_102;
        }
      }
    }
    int64_t v56 = v54 + 4;
    if (v56 >= v46)
    {
LABEL_57:
      swift_release();
      int64_t v34 = v35;
      unint64_t v33 = v68;
      continue;
    }
    break;
  }
  unint64_t v55 = *(void *)(v42 + 8 * v56);
  if (v55)
  {
    int64_t v47 = v56;
    goto LABEL_98;
  }
  while (1)
  {
    int64_t v47 = v56 + 1;
    if (__OFADD__(v56, 1)) {
      break;
    }
    if (v47 >= v46) {
      goto LABEL_57;
    }
    unint64_t v55 = *(void *)(v42 + 8 * v47);
    ++v56;
    if (v55) {
      goto LABEL_98;
    }
  }
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
  return result;
}

uint64_t sub_25ACCE4D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v23 = (unint64_t *)result;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 64);
  int64_t v25 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    while (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      if (!a4) {
        goto LABEL_4;
      }
LABEL_22:
      if (*(void *)(a4 + 16))
      {
        uint64_t v18 = *(void *)(*(void *)(a3 + 48) + 8 * v14);
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_25ACA7F54(v18);
        char v20 = v19;
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          continue;
        }
      }
      goto LABEL_4;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v25) {
      return sub_25ACCB59C(v23, a2, v24, a3, a5);
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v25) {
        return sub_25ACCB59C(v23, a2, v24, a3, a5);
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v25) {
          return sub_25ACCB59C(v23, a2, v24, a3, a5);
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
    if (a4) {
      goto LABEL_22;
    }
LABEL_4:
    *(unint64_t *)((char *)v23 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    if (__OFADD__(v24++, 1)) {
      goto LABEL_28;
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v25) {
    return sub_25ACCB59C(v23, a2, v24, a3, a5);
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v25) {
      return sub_25ACCB59C(v23, a2, v24, a3, a5);
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_21;
    }
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25ACCE6D8(uint64_t a1)
{
  return a1;
}

uint64_t destroy for Metrics()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v3 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  uint64_t v4 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v4;
  uint64_t v5 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v5;
  long long v6 = *(_OWORD *)(a2 + 104);
  long long v7 = *(_OWORD *)(a2 + 120);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 104) = v6;
  LODWORD(v4) = *(_DWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 148) = *(unsigned char *)(a2 + 148);
  *(_DWORD *)(a1 + 144) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 152);
  *(unsigned char *)(a1 + 156) = *(unsigned char *)(a2 + 156);
  *(_DWORD *)(a1 + 152) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 160);
  *(unsigned char *)(a1 + 164) = *(unsigned char *)(a2 + 164);
  *(_DWORD *)(a1 + 160) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 172) = *(unsigned char *)(a2 + 172);
  *(_DWORD *)(a1 + 168) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 176);
  *(unsigned char *)(a1 + 180) = *(unsigned char *)(a2 + 180);
  *(_DWORD *)(a1 + 176) = v4;
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  LODWORD(v4) = *(_DWORD *)(a2 + 192);
  *(unsigned char *)(a1 + 196) = *(unsigned char *)(a2 + 196);
  *(_DWORD *)(a1 + 192) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 200);
  *(unsigned char *)(a1 + 204) = *(unsigned char *)(a2 + 204);
  *(_DWORD *)(a1 + 200) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 208);
  *(unsigned char *)(a1 + 212) = *(unsigned char *)(a2 + 212);
  *(_DWORD *)(a1 + 208) = v4;
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  LODWORD(v4) = *(_DWORD *)(a2 + 224);
  *(unsigned char *)(a1 + 228) = *(unsigned char *)(a2 + 228);
  *(_DWORD *)(a1 + 224) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 232);
  *(unsigned char *)(a1 + 236) = *(unsigned char *)(a2 + 236);
  *(_DWORD *)(a1 + 232) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 240);
  *(unsigned char *)(a1 + 244) = *(unsigned char *)(a2 + 244);
  *(_DWORD *)(a1 + 240) = v4;
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  LODWORD(v4) = *(_DWORD *)(a2 + 256);
  *(unsigned char *)(a1 + 260) = *(unsigned char *)(a2 + 260);
  *(_DWORD *)(a1 + 256) = v4;
  uint64_t v9 = *(void *)(a2 + 264);
  uint64_t v8 = *(void *)(a2 + 272);
  *(unsigned char *)(a1 + 280) = *(unsigned char *)(a2 + 280);
  *(void *)(a1 + 264) = v9;
  *(void *)(a1 + 272) = v8;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  int v5 = a2[2];
  *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  int v6 = a2[4];
  *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  int v7 = a2[6];
  *(unsigned char *)(a1 + 28) = *((unsigned char *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  int v8 = a2[8];
  *(unsigned char *)(a1 + 36) = *((unsigned char *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v9 = a2[12];
  *(unsigned char *)(a1 + 52) = *((unsigned char *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v9;
  int v10 = a2[14];
  *(unsigned char *)(a1 + 60) = *((unsigned char *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v10;
  int v11 = a2[16];
  *(unsigned char *)(a1 + 68) = *((unsigned char *)a2 + 68);
  *(_DWORD *)(a1 + 64) = v11;
  uint64_t v12 = *((void *)a2 + 9);
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v13 = a2[26];
  *(unsigned char *)(a1 + 108) = *((unsigned char *)a2 + 108);
  *(_DWORD *)(a1 + 104) = v13;
  int v14 = a2[28];
  *(unsigned char *)(a1 + 116) = *((unsigned char *)a2 + 116);
  *(_DWORD *)(a1 + 112) = v14;
  int v15 = a2[30];
  *(unsigned char *)(a1 + 124) = *((unsigned char *)a2 + 124);
  *(_DWORD *)(a1 + 120) = v15;
  uint64_t v16 = *((void *)a2 + 16);
  *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 136);
  *(void *)(a1 + 128) = v16;
  LODWORD(v16) = a2[36];
  *(unsigned char *)(a1 + 148) = *((unsigned char *)a2 + 148);
  *(_DWORD *)(a1 + 144) = v16;
  LODWORD(v16) = a2[38];
  *(unsigned char *)(a1 + 156) = *((unsigned char *)a2 + 156);
  *(_DWORD *)(a1 + 152) = v16;
  LODWORD(v16) = a2[40];
  *(unsigned char *)(a1 + 164) = *((unsigned char *)a2 + 164);
  *(_DWORD *)(a1 + 160) = v16;
  LODWORD(v16) = a2[42];
  *(unsigned char *)(a1 + 172) = *((unsigned char *)a2 + 172);
  *(_DWORD *)(a1 + 168) = v16;
  LODWORD(v16) = a2[44];
  *(unsigned char *)(a1 + 180) = *((unsigned char *)a2 + 180);
  *(_DWORD *)(a1 + 176) = v16;
  *(void *)(a1 + 184) = *((void *)a2 + 23);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v17 = a2[48];
  *(unsigned char *)(a1 + 196) = *((unsigned char *)a2 + 196);
  *(_DWORD *)(a1 + 192) = v17;
  int v18 = a2[50];
  *(unsigned char *)(a1 + 204) = *((unsigned char *)a2 + 204);
  *(_DWORD *)(a1 + 200) = v18;
  int v19 = a2[52];
  *(unsigned char *)(a1 + 212) = *((unsigned char *)a2 + 212);
  *(_DWORD *)(a1 + 208) = v19;
  *(void *)(a1 + 216) = *((void *)a2 + 27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v20 = a2[56];
  *(unsigned char *)(a1 + 228) = *((unsigned char *)a2 + 228);
  *(_DWORD *)(a1 + 224) = v20;
  int v21 = a2[58];
  *(unsigned char *)(a1 + 236) = *((unsigned char *)a2 + 236);
  *(_DWORD *)(a1 + 232) = v21;
  int v22 = a2[60];
  *(unsigned char *)(a1 + 244) = *((unsigned char *)a2 + 244);
  *(_DWORD *)(a1 + 240) = v22;
  *(void *)(a1 + 248) = *((void *)a2 + 31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v23 = a2[64];
  *(unsigned char *)(a1 + 260) = *((unsigned char *)a2 + 260);
  *(_DWORD *)(a1 + 256) = v23;
  *(void *)(a1 + 264) = *((void *)a2 + 33);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = *((void *)a2 + 34);
  *(unsigned char *)(a1 + 280) = *((unsigned char *)a2 + 280);
  *(void *)(a1 + 272) = v24;
  *(void *)(a1 + 288) = *((void *)a2 + 36);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy296_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x128uLL);
}

uint64_t assignWithTake for Metrics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v4 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(unsigned char *)(a1 + 108) = *(unsigned char *)(a2 + 108);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 120);
  *(unsigned char *)(a1 + 124) = *(unsigned char *)(a2 + 124);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  int v5 = *(_DWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 148) = *(unsigned char *)(a2 + 148);
  *(_DWORD *)(a1 + 144) = v5;
  *(unsigned char *)(a1 + 156) = *(unsigned char *)(a2 + 156);
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(a2 + 152);
  *(unsigned char *)(a1 + 164) = *(unsigned char *)(a2 + 164);
  *(_DWORD *)(a1 + 160) = *(_DWORD *)(a2 + 160);
  *(unsigned char *)(a1 + 172) = *(unsigned char *)(a2 + 172);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 180) = *(unsigned char *)(a2 + 180);
  *(_DWORD *)(a1 + 176) = *(_DWORD *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
  *(unsigned char *)(a1 + 196) = *(unsigned char *)(a2 + 196);
  *(_DWORD *)(a1 + 200) = *(_DWORD *)(a2 + 200);
  *(unsigned char *)(a1 + 204) = *(unsigned char *)(a2 + 204);
  *(_DWORD *)(a1 + 208) = *(_DWORD *)(a2 + 208);
  *(unsigned char *)(a1 + 212) = *(unsigned char *)(a2 + 212);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 224) = *(_DWORD *)(a2 + 224);
  *(unsigned char *)(a1 + 228) = *(unsigned char *)(a2 + 228);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(unsigned char *)(a1 + 236) = *(unsigned char *)(a2 + 236);
  *(_DWORD *)(a1 + 240) = *(_DWORD *)(a2 + 240);
  *(unsigned char *)(a1 + 244) = *(unsigned char *)(a2 + 244);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 256) = *(_DWORD *)(a2 + 256);
  *(unsigned char *)(a1 + 260) = *(unsigned char *)(a2 + 260);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(unsigned char *)(a1 + 280) = *(unsigned char *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 296)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
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
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 296) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 296) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics()
{
  return &type metadata for Metrics;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Metrics.EntityTree(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Metrics.EntityTree(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Metrics.EntityTree()
{
  return &type metadata for Metrics.EntityTree;
}

uint64_t destroy for Metrics.Animation()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Animation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Animation(uint64_t a1, int *a2)
{
  int v3 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v3;
  int v4 = a2[2];
  *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v4;
  int v5 = a2[4];
  *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v5;
  int v6 = a2[6];
  *(unsigned char *)(a1 + 28) = *((unsigned char *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Metrics.Animation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Animation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Animation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Animation()
{
  return &type metadata for Metrics.Animation;
}

uint64_t initializeBufferWithCopyOfBuffer for Metrics.Audio(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Metrics.Audio()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Audio(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Audio(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  int v5 = a2[2];
  *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  int v6 = a2[4];
  *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Metrics.Audio(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Audio(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Audio(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Audio()
{
  return &type metadata for Metrics.Audio;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Metrics.Geometry(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Metrics.Geometry(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
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
  *(unsigned char *)(result + 33) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Geometry()
{
  return &type metadata for Metrics.Geometry;
}

uint64_t destroy for Metrics.Lighting()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Lighting(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v3 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Lighting(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  int v5 = a2[2];
  *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  int v6 = a2[4];
  *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  int v7 = a2[6];
  *(unsigned char *)(a1 + 28) = *((unsigned char *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  int v8 = a2[8];
  *(unsigned char *)(a1 + 36) = *((unsigned char *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v9 = a2[12];
  *(unsigned char *)(a1 + 52) = *((unsigned char *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v9;
  int v10 = a2[14];
  *(unsigned char *)(a1 + 60) = *((unsigned char *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v10;
  int v11 = a2[16];
  *(unsigned char *)(a1 + 68) = *((unsigned char *)a2 + 68);
  *(_DWORD *)(a1 + 64) = v11;
  return a1;
}

__n128 __swift_memcpy69_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 61) = *(void *)(a2 + 61);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Metrics.Lighting(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v4 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Lighting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 69)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Lighting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 68) = 0;
    *(_DWORD *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 69) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 69) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Lighting()
{
  return &type metadata for Metrics.Lighting;
}

void *initializeBufferWithCopyOfBuffer for Metrics.Material(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Metrics.Material()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Metrics.Material(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *assignWithTake for Metrics.Material(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Material(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
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

uint64_t storeEnumTagSinglePayload for Metrics.Material(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Material()
{
  return &type metadata for Metrics.Material;
}

uint64_t destroy for Metrics.Physics()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Physics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Physics(uint64_t a1, int *a2)
{
  int v3 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v3;
  int v4 = a2[2];
  *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v4;
  int v5 = a2[4];
  *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for Metrics.Physics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Physics(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Physics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Physics()
{
  return &type metadata for Metrics.Physics;
}

uint64_t destroy for Metrics.Texture()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Texture(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Texture(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *((void *)a2 + 2);
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Metrics.Texture(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Texture(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Texture(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Texture()
{
  return &type metadata for Metrics.Texture;
}

ValueMetadata *type metadata accessor for Metrics.KeyPaths()
{
  return &type metadata for Metrics.KeyPaths;
}

uint64_t sub_25ACCFE8C()
{
  return swift_release();
}

unint64_t sub_25ACCFE94()
{
  unint64_t result = qword_26A4B2A90;
  if (!qword_26A4B2A90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4B27F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4B2A90);
  }
  return result;
}

uint64_t sub_25ACCFF10(uint64_t a1, const void *a2)
{
  sub_25ACC845C();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC85A0();
  swift_beginAccess();
  memcpy(v6, a2, sizeof(v6));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC86E4();
  swift_beginAccess();
  memcpy(v5, a2, sizeof(v5));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACC8828();
  swift_beginAccess();
  memcpy(v4, a2, sizeof(v4));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACD57F0();
  return swift_release();
}

uint64_t sub_25ACD010C(uint64_t a1, const void *a2)
{
  sub_25ACD0524(a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC896C();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC8AB0();
  swift_beginAccess();
  memcpy(v10, a2, sizeof(v10));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC8BF4();
  swift_beginAccess();
  memcpy(v9, a2, sizeof(v9));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC8D38();
  swift_beginAccess();
  memcpy(v8, a2, sizeof(v8));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC8E7C();
  swift_beginAccess();
  memcpy(v7, a2, sizeof(v7));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC9278();
  swift_beginAccess();
  memcpy(v6, a2, sizeof(v6));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC93BC();
  swift_beginAccess();
  memcpy(v5, a2, sizeof(v5));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACC9500();
  swift_beginAccess();
  memcpy(v4, a2, sizeof(v4));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACD5810();
  return swift_release();
}

uint64_t sub_25ACD0524(const void *a1)
{
  uint64_t v50 = sub_25ACD5A30();
  uint64_t v2 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  int v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25ACADD94((uint64_t)a1);
  sub_25ACC9134();
  swift_beginAccess();
  memcpy(v53, a1, sizeof(v53));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a1);
  uint64_t v5 = v52;
  if (!v52) {
    return 0;
  }
  int64_t v6 = 0;
  uint64_t v7 = v52 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v52 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v52 + 64);
  int64_t v45 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v46 = v2 + 32;
  uint64_t v43 = v52;
  uint64_t v44 = MEMORY[0x263F8EE80];
  uint64_t v47 = v2;
  uint64_t v42 = v52 + 64;
  if (v10) {
    goto LABEL_9;
  }
LABEL_12:
  int64_t v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 < v45)
    {
      unint64_t v18 = *(void *)(v7 + 8 * v17);
      ++v6;
      if (v18) {
        goto LABEL_25;
      }
      int64_t v6 = v17 + 1;
      if (v17 + 1 >= v45) {
        goto LABEL_49;
      }
      unint64_t v18 = *(void *)(v7 + 8 * v6);
      if (v18) {
        goto LABEL_25;
      }
      int64_t v6 = v17 + 2;
      if (v17 + 2 >= v45) {
        goto LABEL_49;
      }
      unint64_t v18 = *(void *)(v7 + 8 * v6);
      if (v18)
      {
LABEL_25:
        unint64_t v10 = (v18 - 1) & v18;
        for (unint64_t i = __clz(__rbit64(v18)) + (v6 << 6); ; unint64_t i = v13 | (v6 << 6))
        {
          int64_t v51 = v6;
          uint64_t v20 = *(void *)(v5 + 56);
          unsigned int v49 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * i);
          unint64_t v21 = *(void *)(v20 + 8 * i);
          if (v21 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v12 = sub_25ACD5EE0();
            swift_bridgeObjectRelease();
            if (!v12) {
              goto LABEL_8;
            }
            swift_bridgeObjectRetain();
            uint64_t v15 = sub_25ACD5EE0();
            swift_bridgeObjectRelease();
            if (!v15)
            {
              swift_bridgeObjectRelease();
              uint64_t v16 = MEMORY[0x263F8EE78];
              goto LABEL_37;
            }
          }
          else
          {
            uint64_t v15 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v15)
            {
LABEL_8:
              swift_bridgeObjectRelease();
              int64_t v6 = v51;
              if (!v10) {
                goto LABEL_12;
              }
              goto LABEL_9;
            }
          }
          v53[0] = MEMORY[0x263F8EE78];
          sub_25ACD3ED4(0, v15 & ~(v15 >> 63), 0);
          if (v15 < 0) {
            goto LABEL_52;
          }
          uint64_t v22 = 0;
          uint64_t v16 = v53[0];
          unint64_t v48 = v21 & 0xC000000000000001;
          do
          {
            if (v48) {
              MEMORY[0x261153D20](v22, v21);
            }
            else {
              swift_retain();
            }
            sub_25ACD5640();
            sub_25ACD5A20();
            swift_release();
            v53[0] = v16;
            int v23 = v4;
            unint64_t v25 = *(void *)(v16 + 16);
            unint64_t v24 = *(void *)(v16 + 24);
            if (v25 >= v24 >> 1)
            {
              sub_25ACD3ED4(v24 > 1, v25 + 1, 1);
              uint64_t v16 = v53[0];
            }
            ++v22;
            *(void *)(v16 + 16) = v25 + 1;
            (*(void (**)(unint64_t, char *, uint64_t))(v47 + 32))(v16+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(void *)(v47 + 72) * v25, v23, v50);
            int v4 = v23;
          }
          while (v15 != v22);
          swift_bridgeObjectRelease();
LABEL_37:
          unsigned int v26 = v49;
          uint64_t v27 = v44;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v53[0] = v27;
          unint64_t v30 = sub_25ACCADC4(v26);
          uint64_t v31 = *(void *)(v27 + 16);
          BOOL v32 = (v29 & 1) == 0;
          uint64_t v33 = v31 + v32;
          if (__OFADD__(v31, v32)) {
            goto LABEL_53;
          }
          char v34 = v29;
          if (*(void *)(v27 + 24) >= v33)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_25ACD33A4();
            }
          }
          else
          {
            sub_25ACD1BBC(v33, isUniquelyReferenced_nonNull_native);
            unint64_t v35 = sub_25ACCADC4(v26);
            if ((v34 & 1) != (v36 & 1)) {
              goto LABEL_55;
            }
            unint64_t v30 = v35;
          }
          int64_t v37 = (void *)v53[0];
          uint64_t v44 = v53[0];
          if (v34)
          {
            uint64_t v38 = *(void *)(v53[0] + 56);
            swift_bridgeObjectRelease();
            *(void *)(v38 + 8 * v30) = v16;
          }
          else
          {
            *(void *)(v53[0] + 8 * (v30 >> 6) + 64) |= 1 << v30;
            *(_DWORD *)(v37[6] + 4 * v30) = v26;
            *(void *)(v37[7] + 8 * v30) = v16;
            uint64_t v39 = v37[2];
            BOOL v40 = __OFADD__(v39, 1);
            uint64_t v41 = v39 + 1;
            if (v40) {
              goto LABEL_54;
            }
            v37[2] = v41;
          }
          swift_bridgeObjectRelease();
          uint64_t v7 = v42;
          uint64_t v5 = v43;
          int64_t v6 = v51;
          if (!v10) {
            goto LABEL_12;
          }
LABEL_9:
          unint64_t v13 = __clz(__rbit64(v10));
          v10 &= v10 - 1;
        }
      }
      int64_t v19 = v17 + 3;
      if (v19 < v45)
      {
        unint64_t v18 = *(void *)(v7 + 8 * v19);
        if (v18)
        {
          int64_t v6 = v19;
          goto LABEL_25;
        }
        while (1)
        {
          int64_t v6 = v19 + 1;
          if (__OFADD__(v19, 1)) {
            goto LABEL_51;
          }
          if (v6 >= v45) {
            break;
          }
          unint64_t v18 = *(void *)(v7 + 8 * v6);
          ++v19;
          if (v18) {
            goto LABEL_25;
          }
        }
      }
    }
LABEL_49:
    swift_release();
    return v44;
  }
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
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACD0A40(uint64_t a1, const void *a2)
{
  sub_25ACD0B08(a2);
  sub_25ACC7B50();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  sub_25ACD5830();
  return swift_release();
}

uint64_t sub_25ACD0B08(const void *a1)
{
  sub_25ACADD94((uint64_t)a1);
  sub_25ACC7C94();
  swift_beginAccess();
  memcpy(__dst, a1, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a1);
  if (!v29) {
    return 0;
  }
  int64_t v2 = 0;
  uint64_t v3 = v29 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v29 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v29 + 64);
  int64_t v28 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
    }
    else
    {
      int64_t v10 = v2 + 1;
      if (__OFADD__(v2, 1)) {
        goto LABEL_39;
      }
      if (v10 >= v28)
      {
LABEL_34:
        swift_release();
        return (uint64_t)v7;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v10);
      ++v2;
      if (!v11)
      {
        int64_t v2 = v10 + 1;
        if (v10 + 1 >= v28) {
          goto LABEL_34;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 2;
          if (v10 + 2 >= v28) {
            goto LABEL_34;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11)
          {
            int64_t v12 = v10 + 3;
            if (v12 >= v28) {
              goto LABEL_34;
            }
            unint64_t v11 = *(void *)(v3 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                int64_t v2 = v12 + 1;
                if (__OFADD__(v12, 1)) {
                  goto LABEL_40;
                }
                if (v2 >= v28) {
                  goto LABEL_34;
                }
                unint64_t v11 = *(void *)(v3 + 8 * v2);
                ++v12;
                if (v11) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v2 = v12;
          }
        }
      }
LABEL_22:
      unint64_t v6 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
    }
    uint64_t v13 = *(void *)(*(void *)(v29 + 48) + 8 * v9);
    int v14 = *(_DWORD *)(*(void *)(v29 + 56) + 4 * v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    __dst[0] = v7;
    unint64_t v17 = sub_25ACD1AE0(v13);
    uint64_t v18 = v7[2];
    BOOL v19 = (v16 & 1) == 0;
    uint64_t v20 = v18 + v19;
    if (__OFADD__(v18, v19)) {
      break;
    }
    char v21 = v16;
    if (v7[3] >= v20)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v7 = (void *)__dst[0];
        if (v16) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_25ACD354C();
        uint64_t v7 = (void *)__dst[0];
        if (v21) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_25ACD1E70(v20, isUniquelyReferenced_nonNull_native);
      unint64_t v22 = sub_25ACD1AE0(v13);
      if ((v21 & 1) != (v23 & 1)) {
        goto LABEL_41;
      }
      unint64_t v17 = v22;
      uint64_t v7 = (void *)__dst[0];
      if (v21)
      {
LABEL_5:
        *(_DWORD *)(v7[7] + 4 * v17) = v14;
        goto LABEL_6;
      }
    }
    v7[(v17 >> 6) + 8] |= 1 << v17;
    *(void *)(v7[6] + 8 * v17) = v13;
    *(_DWORD *)(v7[7] + 4 * v17) = v14;
    uint64_t v24 = v7[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_38;
    }
    v7[2] = v26;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACD0DDC(uint64_t a1, const void *a2)
{
  sub_25ACADD94((uint64_t)a2);
  sub_25ACC8318();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  if (v5[0])
  {
    sub_25ACADD94((uint64_t)a2);
    sub_25ACC8090();
    swift_beginAccess();
    memcpy(__dst, a2, sizeof(__dst));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_25ACAA5D8((uint64_t)a2);
    uint64_t v3 = MEMORY[0x263F8EE80];
    uint64_t v6 = MEMORY[0x263F8EE80];
    swift_bridgeObjectRetain();
    sub_25ACD4560(v3, v5[0], v5[0], &v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_25ACADD94((uint64_t)a2);
    sub_25ACC7F4C();
    swift_beginAccess();
    memcpy(__dst, a2, sizeof(__dst));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_25ACAA5D8((uint64_t)a2);
    sub_25ACC81D4();
    swift_beginAccess();
    memcpy(v5, a2, sizeof(v5));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_25ACAA5D8((uint64_t)a2);
    swift_bridgeObjectRetain();
    sub_25ACD57D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25ACAA5D8((uint64_t)a2);
    __dst[0] = 0;
    sub_25ACD57D0();
  }
  return swift_release();
}

uint64_t sub_25ACD1080(void *a1, uint64_t *a2, uint64_t a3, void *a4)
{
  int64_t v62 = a1;
  uint64_t v74 = sub_25ACD57C0();
  uint64_t v69 = *(void *)(v74 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v74);
  int v73 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v68 = (char *)&v58 - v9;
  uint64_t v10 = sub_25ACD5A30();
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v70 = a2[1];
  if (!*(void *)(v70 + 16) || !*(void *)(a3 + 16)) {
    return result;
  }
  uint64_t v59 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = v13;
  uint64_t v61 = result;
  uint64_t v14 = *a2;
  uint64_t v15 = swift_retain();
  unint64_t v16 = sub_25ACA7F54(v15);
  if ((v17 & 1) == 0)
  {
    return swift_release();
  }
  uint64_t v18 = *(void *)(*(void *)(a3 + 56) + 8 * v16);
  swift_bridgeObjectRetain();
  uint64_t v58 = v14;
  swift_release();
  uint64_t v19 = *(void *)(v70 + 64);
  uint64_t v64 = v70 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(v70 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  int64_t v65 = (unint64_t)(v20 + 63) >> 6;
  char v71 = (void (**)(char *, char *, uint64_t))(v69 + 32);
  uint64_t v63 = v69 + 40;
  swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v24 = (char *)MEMORY[0x263F8EE78];
  uint64_t v66 = v18;
  int64_t v67 = a4;
  while (1)
  {
    if (v22)
    {
      unint64_t v25 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      int64_t v72 = v23;
      unint64_t v26 = v25 | (v23 << 6);
    }
    else
    {
      int64_t v27 = v23 + 1;
      if (__OFADD__(v23, 1)) {
        goto LABEL_49;
      }
      if (v27 >= v65)
      {
LABEL_45:
        swift_bridgeObjectRelease();
        swift_release();
        swift_retain();
        sub_25ACD5640();
        uint64_t v55 = (uint64_t)v59;
        sub_25ACD5A20();
        swift_release();
        int64_t v56 = v62;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        int v75 = (void *)*v56;
        *int64_t v56 = 0x8000000000000000;
        sub_25ACD2D40((uint64_t)v24, v55, isUniquelyReferenced_nonNull_native);
        *int64_t v56 = v75;
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v55, v61);
      }
      unint64_t v28 = *(void *)(v64 + 8 * v27);
      int64_t v29 = v23 + 1;
      if (!v28)
      {
        int64_t v29 = v23 + 2;
        if (v23 + 2 >= v65) {
          goto LABEL_45;
        }
        unint64_t v28 = *(void *)(v64 + 8 * v29);
        if (!v28)
        {
          int64_t v29 = v23 + 3;
          if (v23 + 3 >= v65) {
            goto LABEL_45;
          }
          unint64_t v28 = *(void *)(v64 + 8 * v29);
          if (!v28)
          {
            uint64_t v30 = v23 + 4;
            if (v23 + 4 >= v65) {
              goto LABEL_45;
            }
            unint64_t v28 = *(void *)(v64 + 8 * v30);
            if (!v28)
            {
              while (1)
              {
                int64_t v29 = v30 + 1;
                if (__OFADD__(v30, 1)) {
                  goto LABEL_50;
                }
                if (v29 >= v65) {
                  goto LABEL_45;
                }
                unint64_t v28 = *(void *)(v64 + 8 * v29);
                ++v30;
                if (v28) {
                  goto LABEL_24;
                }
              }
            }
            int64_t v29 = v23 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v22 = (v28 - 1) & v28;
      int64_t v72 = v29;
      unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
    }
    uint64_t v31 = (uint64_t *)(*(void *)(v70 + 48) + 16 * v26);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v24 = sub_25ACD4228(0, *((void *)v24 + 2) + 1, 1, v24);
    }
    unint64_t v35 = *((void *)v24 + 2);
    unint64_t v34 = *((void *)v24 + 3);
    if (v35 >= v34 >> 1) {
      uint64_t v24 = sub_25ACD4228((char *)(v34 > 1), v35 + 1, 1, v24);
    }
    *((void *)v24 + 2) = v35 + 1;
    char v36 = &v24[16 * v35];
    *((void *)v36 + 4) = v33;
    *((void *)v36 + 5) = v32;
    if (*(void *)(v18 + 16))
    {
      swift_bridgeObjectRetain();
      sub_25ACA8000(v33, v32);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    int64_t v37 = v68;
    sub_25ACD57B0();
    swift_bridgeObjectRelease();
    uint64_t v38 = *v71;
    (*v71)(v73, v37, v74);
    uint64_t v39 = v67;
    int v40 = swift_isUniquelyReferenced_nonNull_native();
    int v75 = (void *)*v39;
    uint64_t v41 = v75;
    *uint64_t v39 = 0x8000000000000000;
    unint64_t v43 = sub_25ACA8000(v33, v32);
    uint64_t v44 = v41[2];
    BOOL v45 = (v42 & 1) == 0;
    uint64_t v46 = v44 + v45;
    if (__OFADD__(v44, v45)) {
      break;
    }
    char v47 = v42;
    if (v41[3] >= v46)
    {
      if (v40)
      {
        uint64_t v50 = v75;
        if (v42) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_25ACD36E0();
        uint64_t v50 = v75;
        if (v47) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      sub_25ACD2110(v46, v40);
      unint64_t v48 = sub_25ACA8000(v33, v32);
      if ((v47 & 1) != (v49 & 1)) {
        goto LABEL_51;
      }
      unint64_t v43 = v48;
      uint64_t v50 = v75;
      if (v47)
      {
LABEL_7:
        (*(void (**)(unint64_t, char *, uint64_t))(v69 + 40))(v50[7] + *(void *)(v69 + 72) * v43, v73, v74);
        goto LABEL_8;
      }
    }
    v50[(v43 >> 6) + 8] |= 1 << v43;
    int64_t v51 = (uint64_t *)(v50[6] + 16 * v43);
    *int64_t v51 = v33;
    v51[1] = v32;
    v38((char *)(v50[7] + *(void *)(v69 + 72) * v43), v73, v74);
    uint64_t v52 = v50[2];
    BOOL v53 = __OFADD__(v52, 1);
    uint64_t v54 = v52 + 1;
    if (v53) {
      goto LABEL_48;
    }
    v50[2] = v54;
    swift_bridgeObjectRetain();
LABEL_8:
    *uint64_t v39 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v66;
    int64_t v23 = v72;
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  uint64_t result = sub_25ACD5FC0();
  __break(1u);
  return result;
}

uint64_t sub_25ACD16F0(uint64_t a1, unsigned char *a2)
{
  uint64_t v2 = sub_25ACD4760(a1, a2);
  swift_release();
  return v2;
}

uint64_t sub_25ACD1724(unint64_t a1)
{
  type metadata accessor for MetricsData();
  unint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = (uint64_t *)sub_25ACAFC04(v2);
  swift_retain();
  uint64_t v4 = sub_25ACD432C(a1, (uint64_t)v3);
  swift_release();
  uint64_t v5 = v4[2];
  if (v5)
  {
    sub_25ACD4CBC((uint64_t)(v4 + 4), (uint64_t)v24);
    uint64_t v6 = (uint64_t)(v4 + 41);
    int v7 = 1;
    while (1)
    {
      sub_25ACD4CBC((uint64_t)v24, (uint64_t)v25);
      BOOL v8 = sub_25ACD4D24((uint64_t)v25) == 1;
      int v9 = ((v8 | BYTE4(v25[0])) & 1) != 0 ? 0 : LODWORD(v25[0]);
      BOOL v10 = __OFADD__(v7, v9);
      int v11 = v7 + v9;
      if (v10) {
        break;
      }
      if (!--v5) {
        goto LABEL_11;
      }
      sub_25ACD4CBC(v6, (uint64_t)v24);
      v6 += 296;
      BOOL v10 = __OFADD__(v11, 1);
      int v7 = v11 + 1;
      if (v10)
      {
        __break(1u);
LABEL_11:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25ACD5EE0();
    uint64_t v12 = result;
    if (!result) {
      goto LABEL_29;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_13:
  v25[0] = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_28;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v12)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    unint64_t v22 = v25[0];
    swift_bridgeObjectRelease();
    swift_retain();
    sub_25ACD4D48(MEMORY[0x263F8EE80], v22, v3);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v23 = sub_25ACD5860();
    swift_release();
    return v23;
  }
LABEL_15:
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v14 = 0;
      do
      {
        MEMORY[0x261153D20](v14, a1);
        uint64_t v15 = swift_retain();
        MEMORY[0x261153B30](v15);
        if (*(void *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25ACD5C30();
        }
        ++v14;
        sub_25ACD5C40();
        uint64_t v16 = sub_25ACD5C20();
        unint64_t v17 = sub_25ACBFA10(v16);
        sub_25ACBFC68(v17);
        swift_unknownObjectRelease();
      }
      while (v12 != v14);
    }
    else
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = swift_retain_n();
        MEMORY[0x261153B30](v19);
        if (*(void *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25ACD5C30();
        }
        ++v18;
        sub_25ACD5C40();
        uint64_t v20 = sub_25ACD5C20();
        unint64_t v21 = sub_25ACBFA10(v20);
        sub_25ACBFC68(v21);
        swift_release();
      }
      while (v12 != v18);
    }
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACD1A2C()
{
  sub_25ACD5870();
  unint64_t v0 = swift_bridgeObjectRetain();
  sub_25ACD1724(v0);
  uint64_t v1 = sub_25ACD5850();
  swift_release();
  return v1;
}

uint64_t sub_25ACD1A8C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25ACD1A9C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 80))();
}

unint64_t sub_25ACD1AE0(uint64_t a1)
{
  uint64_t v2 = sub_25ACD5FE0();

  return sub_25ACD3148(a1, v2);
}

unint64_t sub_25ACD1B24(uint64_t a1)
{
  sub_25ACD5A30();
  sub_25ACD50C8(&qword_26A4B2AA0, MEMORY[0x263F78B60]);
  uint64_t v2 = sub_25ACD5B10();

  return sub_25ACD31E4(a1, v2);
}

uint64_t sub_25ACD1BBC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AD0);
  uint64_t result = sub_25ACD5F00();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    int v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v29 = -1 << v10;
    uint64_t v30 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v9[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if (a2)
              {
                if (v30 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v31);
                }
                else {
                  *int v9 = v29;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v9[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v12 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(unsigned int *)(*(void *)(v5 + 48) + 4 * v19);
      uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = MEMORY[0x261153F00](*(void *)(v7 + 40), v27, 4);
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v16 == v24;
          if (v16 == v24) {
            unint64_t v16 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v17) = v27;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACD1E70(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AC8);
  uint64_t result = sub_25ACD5F00();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    uint64_t v32 = v3;
    int64_t v8 = 0;
    int v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v10;
    uint64_t v31 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v32;
                goto LABEL_38;
              }
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *int v9 = v30;
              }
              uint64_t v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      int v22 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v17);
      uint64_t result = sub_25ACD5FE0();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      *(_DWORD *)(*(void *)(v7 + 56) + 4 * v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25ACD2110(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_25ACD57C0();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  unint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AC0);
  int v47 = a2;
  uint64_t v8 = sub_25ACD5F00();
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
  char v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  BOOL v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
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
    uint64_t v23 = v44;
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
    BOOL v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
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
    sub_25ACD5FF0();
    sub_25ACD5B90();
    uint64_t result = sub_25ACD6010();
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
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *unint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_25ACD24F8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25ACD5A30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AB8);
  int v46 = a2;
  uint64_t v10 = sub_25ACD5F00();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  int64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    int64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
    }
    sub_25ACD50C8(&qword_26A4B2AA0, MEMORY[0x263F78B60]);
    uint64_t result = sub_25ACD5B10();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  int64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_25ACD291C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25ACD5A30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A98);
  int v46 = a2;
  uint64_t v10 = sub_25ACD5F00();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  char v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  int64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    int64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_25ACD50C8(&qword_26A4B2AA0, MEMORY[0x263F78B60]);
    uint64_t result = sub_25ACD5B10();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  int64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_25ACD2D40(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25ACD5A30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25ACD1B24(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    int64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_25ACD39A4();
    goto LABEL_7;
  }
  sub_25ACD24F8(v17, a3 & 1);
  unint64_t v23 = sub_25ACD1B24(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_25ACD5FC0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  int64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25ACD3090(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_25ACD2EE8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25ACD5A30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25ACD1B24(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    int64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_25ACD3C3C();
    goto LABEL_7;
  }
  sub_25ACD291C(v17, a3 & 1);
  unint64_t v23 = sub_25ACD1B24(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_25ACD5FC0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  int64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25ACD3090(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_25ACD3090(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25ACD5A30();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_25ACD3148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25ACD31E4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25ACD5A30();
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
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25ACD50C8(&qword_26A4B2AA8, MEMORY[0x263F78B60]);
      char v15 = sub_25ACD5B30();
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

void *sub_25ACD33A4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AD0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 8 * v15;
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + v18);
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v18) = v19;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACD354C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25ACD5EF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v23 = __clz(__rbit64(v21));
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = v23 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 4 * v15;
    int v19 = *(_DWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_DWORD *)(*(void *)(v4 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25ACD36E0()
{
  uint64_t v35 = sub_25ACD57C0();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AC0);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_25ACD5EF0();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    int64_t v27 = v30;
LABEL_25:
    *int64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  unint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    unint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
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
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *unint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    int64_t v27 = v30;
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

void *sub_25ACD39A4()
{
  uint64_t v1 = sub_25ACD5A30();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AB8);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25ACD5EF0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_25ACD3C3C()
{
  uint64_t v1 = sub_25ACD5A30();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2A98);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25ACD5EF0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

size_t sub_25ACD3ED4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25ACD3F14(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_25ACD3EF4(void *a1, int64_t a2, char a3)
{
  size_t result = sub_25ACD40E8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_25ACD3F14(size_t result, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AD8);
  uint64_t v10 = *(void *)(sub_25ACD5A30() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
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
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25ACD5A30() - 8);
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

void *sub_25ACD40E8(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2AB0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 296);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[37 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 296 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2860);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_25ACD4228(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B29D8);
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
  unint64_t v14 = a4 + 32;
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

void *sub_25ACD432C(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25ACD5EE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return (void *)v4;
  }
  uint64_t v23 = MEMORY[0x263F8EE78];
  size_t result = sub_25ACD3EF4(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    unint64_t v18 = v2 & 0xC000000000000001;
    int64_t v7 = *(uint64_t (**)(uint64_t))(*(void *)a2 + 96);
    uint64_t v4 = v23;
    unint64_t v8 = v2;
    uint64_t v9 = v3;
    do
    {
      if (v18)
      {
        uint64_t v10 = MEMORY[0x261153D20](v6, v2);
      }
      else
      {
        uint64_t v10 = *(void *)(v2 + 8 * v6 + 32);
        swift_retain();
      }
      uint64_t v11 = swift_retain();
      uint64_t v12 = v7(v11);
      if (*(void *)(v12 + 16) && (unint64_t v13 = sub_25ACA7F54(v10), (v14 & 1) != 0))
      {
        uint64_t v15 = (const void *)(*(void *)(v12 + 56) + 296 * v13);
        memcpy(__dst, v15, sizeof(__dst));
        memmove(v21, v15, 0x128uLL);
        nullsub_1(v21);
        sub_25ACADD94((uint64_t)__dst);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
        sub_25ACB1BE4((uint64_t)v21);
      }
      sub_25ACD4CBC((uint64_t)v21, (uint64_t)v22);
      swift_release();
      uint64_t v23 = v4;
      unint64_t v17 = *(void *)(v4 + 16);
      unint64_t v16 = *(void *)(v4 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_25ACD3EF4((void *)(v16 > 1), v17 + 1, 1);
        uint64_t v4 = v23;
      }
      ++v6;
      *(void *)(v4 + 16) = v17 + 1;
      sub_25ACD4CBC((uint64_t)v22, v4 + 296 * v17 + 32);
      unint64_t v2 = v8;
    }
    while (v9 != v6);
    return (void *)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_25ACD4560(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = a1;
  uint64_t v8 = a2 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a2 + 64);
  int64_t v21 = (unint64_t)(v9 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  if (!v11) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    uint64_t v19 = 8 * i;
    uint64_t v20 = *(void *)(*(void *)(a2 + 56) + v19);
    v22[0] = *(void *)(*(void *)(a2 + 48) + v19);
    v22[1] = v20;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_25ACD1080(&v23, v22, a3, a4);
    if (v4)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    if (v11) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v21) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v21) {
        goto LABEL_25;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v13);
      if (!v17)
      {
        int64_t v13 = v16 + 2;
        if (v16 + 2 >= v21) {
          goto LABEL_25;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v13);
        if (!v17)
        {
          int64_t v13 = v16 + 3;
          if (v16 + 3 >= v21) {
            goto LABEL_25;
          }
          unint64_t v17 = *(void *)(v8 + 8 * v13);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v11 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v21)
  {
LABEL_25:
    swift_release();
    return v23;
  }
  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
    int64_t v13 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v13 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v13 >= v21) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v13);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25ACD4760(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = sub_25ACD5A30();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v54 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25ACD57E0();
  uint64_t v50 = *(void *)(v6 - 8);
  uint64_t v51 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v49 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v45 = (char *)&v37 - v9;
  uint64_t v10 = sub_25ACD5840();
  uint64_t v47 = *(void *)(v10 - 8);
  uint64_t v48 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  int v46 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = sub_25ACD5820();
  uint64_t v52 = *(void *)(v15 - 8);
  uint64_t v53 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v44 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - v18;
  uint64_t v20 = sub_25ACD5800();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v41 = v20;
  uint64_t v42 = v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  int64_t v43 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  int64_t v25 = (char *)&v37 - v24;
  swift_retain();
  sub_25ACADD94((uint64_t)a2);
  uint64_t v40 = v25;
  sub_25ACCFF10(a1, a2);
  swift_retain();
  sub_25ACADD94((uint64_t)a2);
  uint64_t v38 = v19;
  sub_25ACD010C(a1, a2);
  swift_retain();
  sub_25ACADD94((uint64_t)a2);
  sub_25ACD0B08(a2);
  sub_25ACC7B50();
  swift_beginAccess();
  memcpy(v57, a2, sizeof(v57));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_25ACAA5D8((uint64_t)a2);
  char v55 = v56;
  uint64_t v37 = v14;
  sub_25ACD5830();
  swift_release();
  uint64_t v26 = swift_retain();
  uint64_t v27 = v45;
  sub_25ACD0DDC(v26, a2);
  int v28 = *(_DWORD *)a2;
  if (a2[4]) {
    int v28 = 0;
  }
  int v39 = v28;
  swift_retain();
  sub_25ACD5640();
  sub_25ACD5A20();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v43, v25, v20);
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v44, v19, v53);
  uint64_t v29 = v47;
  uint64_t v30 = v48;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v46, v14, v48);
  uint64_t v31 = v50;
  int64_t v32 = v27;
  uint64_t v33 = v27;
  uint64_t v34 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v32, v51);
  uint64_t v35 = sub_25ACD5880();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v37, v30);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v38, v53);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  return v35;
}

uint64_t sub_25ACD4CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4B2860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25ACD4D24(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 40);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25ACD4D48(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v42 = a3;
  uint64_t v37 = sub_25ACD5A30();
  uint64_t v7 = *(void *)(v37 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v37);
  uint64_t v36 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v38 = (char *)v30 - v10;
  if (a2 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25ACD5EE0();
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_3:
      uint64_t v39 = a1;
      v30[1] = v4;
      unint64_t v12 = a2 & 0xC000000000000001;
      uint64_t v13 = *v42;
      int64_t v32 = (void (**)(char *, char *, uint64_t))(v7 + 16);
      unint64_t v14 = *(uint64_t (**)(uint64_t))(v13 + 96);
      uint64_t v40 = v13 + 96;
      uint64_t v41 = v14;
      uint64_t v31 = (void (**)(uint64_t, uint64_t))(v7 + 8);
      a1 = 4;
      uint64_t v34 = v11;
      unint64_t v35 = a2;
      unint64_t v33 = a2 & 0xC000000000000001;
      while (1)
      {
        uint64_t v7 = a1 - 4;
        if (v12)
        {
          uint64_t v4 = MEMORY[0x261153D20](a1 - 4, a2);
          uint64_t v15 = a1 - 3;
          if (__OFADD__(v7, 1)) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v4 = *(void *)(a2 + 8 * a1);
          swift_retain();
          uint64_t v15 = a1 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        uint64_t v16 = swift_retain();
        uint64_t v17 = v41(v16);
        if (*(void *)(v17 + 16) && (unint64_t v18 = sub_25ACA7F54(v4), (v19 & 1) != 0))
        {
          memcpy(v43, (const void *)(*(void *)(v17 + 56) + 296 * v18), 0x128uLL);
          sub_25ACADD94((uint64_t)v43);
          swift_release();
          swift_bridgeObjectRelease();
          swift_retain();
          sub_25ACD5640();
          uint64_t v20 = v38;
          sub_25ACD5A20();
          swift_release();
          sub_25ACD5890();
          uint64_t v21 = swift_retain();
          uint64_t v22 = sub_25ACD4760(v21, v43);
          swift_release();
          uint64_t v23 = (uint64_t)v36;
          uint64_t v24 = v37;
          (*v32)(v36, v20, v37);
          swift_retain();
          uint64_t v25 = v39;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v44 = v25;
          sub_25ACD2EE8(v22, v23, isUniquelyReferenced_nonNull_native);
          uint64_t v39 = v44;
          swift_bridgeObjectRelease();
          uint64_t v27 = *v31;
          (*v31)(v23, v24);
          a2 = v35;
          swift_release();
          uint64_t v28 = v24;
          unint64_t v12 = v33;
          uint64_t v11 = v34;
          v27((uint64_t)v38, v28);
          swift_release();
        }
        else
        {
          swift_release_n();
          swift_bridgeObjectRelease();
        }
        ++a1;
        if (v15 == v11)
        {
          swift_bridgeObjectRelease();
          return v39;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for InspectorSceneStatisticsProvider()
{
  return self;
}

uint64_t sub_25ACD50C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25ACD5110()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25ACD5120()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25ACD5130()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25ACD5140()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25ACD5150()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25ACD5160()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25ACD5170()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25ACD5180()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25ACD5190()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25ACD51A0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25ACD51B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25ACD51C0()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_25ACD51D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25ACD51E0()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_25ACD51F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25ACD5200()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25ACD5210()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25ACD5220()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25ACD5230()
{
  return MEMORY[0x270EFBAA0]();
}

uint64_t sub_25ACD5240()
{
  return MEMORY[0x270EFBAA8]();
}

uint64_t sub_25ACD5250()
{
  return MEMORY[0x270EFBAF8]();
}

uint64_t sub_25ACD5260()
{
  return MEMORY[0x270EFBB08]();
}

uint64_t sub_25ACD5270()
{
  return MEMORY[0x270EFBD18]();
}

uint64_t sub_25ACD5280()
{
  return MEMORY[0x270EFBD20]();
}

uint64_t sub_25ACD5290()
{
  return MEMORY[0x270EFBD28]();
}

uint64_t sub_25ACD52A0()
{
  return MEMORY[0x270EFBD38]();
}

uint64_t sub_25ACD52B0()
{
  return MEMORY[0x270EFBD50]();
}

uint64_t sub_25ACD52C0()
{
  return MEMORY[0x270EFBD60]();
}

uint64_t sub_25ACD52D0()
{
  return MEMORY[0x270EFBD68]();
}

uint64_t sub_25ACD52E0()
{
  return MEMORY[0x270EFBD78]();
}

uint64_t sub_25ACD52F0()
{
  return MEMORY[0x270EFBD90]();
}

uint64_t sub_25ACD5300()
{
  return MEMORY[0x270EFBD98]();
}

uint64_t sub_25ACD5310()
{
  return MEMORY[0x270EFBDA0]();
}

uint64_t sub_25ACD5320()
{
  return MEMORY[0x270EFBDA8]();
}

uint64_t sub_25ACD5330()
{
  return MEMORY[0x270EFBE18]();
}

uint64_t sub_25ACD5340()
{
  return MEMORY[0x270EFBE38]();
}

uint64_t sub_25ACD5350()
{
  return MEMORY[0x270EFBE40]();
}

uint64_t sub_25ACD5360()
{
  return MEMORY[0x270EFBEA8]();
}

uint64_t sub_25ACD5370()
{
  return MEMORY[0x270EFBEF8]();
}

uint64_t sub_25ACD5380()
{
  return MEMORY[0x270EFBF68]();
}

uint64_t sub_25ACD5390()
{
  return MEMORY[0x270EFBF70]();
}

uint64_t sub_25ACD53A0()
{
  return MEMORY[0x270EFC000]();
}

uint64_t sub_25ACD53B0()
{
  return MEMORY[0x270EFC018]();
}

uint64_t sub_25ACD53C0()
{
  return MEMORY[0x270EFC088]();
}

uint64_t sub_25ACD53D0()
{
  return MEMORY[0x270EFC4A0]();
}

uint64_t sub_25ACD53E0()
{
  return MEMORY[0x270EFC4C8]();
}

uint64_t sub_25ACD53F0()
{
  return MEMORY[0x270EFD118]();
}

uint64_t sub_25ACD5400()
{
  return MEMORY[0x270EFD200]();
}

uint64_t sub_25ACD5410()
{
  return MEMORY[0x270EFC508]();
}

uint64_t sub_25ACD5420()
{
  return MEMORY[0x270EFC520]();
}

uint64_t sub_25ACD5430()
{
  return MEMORY[0x270EFC528]();
}

uint64_t sub_25ACD5440()
{
  return MEMORY[0x270EFC530]();
}

uint64_t sub_25ACD5450()
{
  return MEMORY[0x270EFC538]();
}

uint64_t sub_25ACD5460()
{
  return MEMORY[0x270EFC540]();
}

uint64_t sub_25ACD5470()
{
  return MEMORY[0x270EFC548]();
}

uint64_t sub_25ACD5480()
{
  return MEMORY[0x270EFC550]();
}

uint64_t sub_25ACD5490()
{
  return MEMORY[0x270EFC558]();
}

uint64_t sub_25ACD54A0()
{
  return MEMORY[0x270EFC560]();
}

uint64_t sub_25ACD54B0()
{
  return MEMORY[0x270EFC568]();
}

uint64_t sub_25ACD54C0()
{
  return MEMORY[0x270EFC570]();
}

uint64_t sub_25ACD54D0()
{
  return MEMORY[0x270EFC578]();
}

uint64_t sub_25ACD54E0()
{
  return MEMORY[0x270EFC580]();
}

uint64_t sub_25ACD54F0()
{
  return MEMORY[0x270EFC588]();
}

uint64_t sub_25ACD5500()
{
  return MEMORY[0x270EFC590]();
}

uint64_t sub_25ACD5510()
{
  return MEMORY[0x270EFC598]();
}

uint64_t sub_25ACD5520()
{
  return MEMORY[0x270EFC5A0]();
}

uint64_t sub_25ACD5530()
{
  return MEMORY[0x270EFC5A8]();
}

uint64_t sub_25ACD5540()
{
  return MEMORY[0x270EFC5B0]();
}

uint64_t sub_25ACD5550()
{
  return MEMORY[0x270EFC5C8]();
}

uint64_t sub_25ACD5560()
{
  return MEMORY[0x270EFC5E0]();
}

uint64_t sub_25ACD5570()
{
  return MEMORY[0x270EFC5E8]();
}

uint64_t sub_25ACD5580()
{
  return MEMORY[0x270EFC5F0]();
}

uint64_t sub_25ACD5590()
{
  return MEMORY[0x270EFC5F8]();
}

uint64_t sub_25ACD55A0()
{
  return MEMORY[0x270EFC600]();
}

uint64_t sub_25ACD55B0()
{
  return MEMORY[0x270EFC608]();
}

uint64_t sub_25ACD55C0()
{
  return MEMORY[0x270EFC610]();
}

uint64_t sub_25ACD55D0()
{
  return MEMORY[0x270EFC618]();
}

uint64_t sub_25ACD55E0()
{
  return MEMORY[0x270EFC628]();
}

uint64_t sub_25ACD55F0()
{
  return MEMORY[0x270EFC638]();
}

uint64_t sub_25ACD5600()
{
  return MEMORY[0x270EFC688]();
}

uint64_t sub_25ACD5610()
{
  return MEMORY[0x270EFC690]();
}

uint64_t sub_25ACD5620()
{
  return MEMORY[0x270EFC6A8]();
}

uint64_t sub_25ACD5630()
{
  return MEMORY[0x270EFC6B8]();
}

uint64_t sub_25ACD5640()
{
  return MEMORY[0x270EFC6E0]();
}

uint64_t sub_25ACD5650()
{
  return MEMORY[0x270EFC6E8]();
}

uint64_t sub_25ACD5660()
{
  return MEMORY[0x270EFC6F0]();
}

uint64_t sub_25ACD5670()
{
  return MEMORY[0x270EFC708]();
}

uint64_t sub_25ACD5680()
{
  return MEMORY[0x270EFC710]();
}

uint64_t sub_25ACD5690()
{
  return MEMORY[0x270EFC720]();
}

uint64_t sub_25ACD56A0()
{
  return MEMORY[0x270EFC728]();
}

uint64_t sub_25ACD56B0()
{
  return MEMORY[0x270EFCCA8]();
}

uint64_t sub_25ACD56C0()
{
  return MEMORY[0x270EFCCB0]();
}

uint64_t sub_25ACD56D0()
{
  return MEMORY[0x270EFCCB8]();
}

uint64_t sub_25ACD56E0()
{
  return MEMORY[0x270F76AA8]();
}

uint64_t sub_25ACD56F0()
{
  return MEMORY[0x270F76AB0]();
}

uint64_t sub_25ACD5700()
{
  return MEMORY[0x270F76AB8]();
}

uint64_t sub_25ACD5710()
{
  return MEMORY[0x270F76AC0]();
}

uint64_t sub_25ACD5720()
{
  return MEMORY[0x270F76AC8]();
}

uint64_t sub_25ACD5730()
{
  return MEMORY[0x270F76AD0]();
}

uint64_t sub_25ACD5740()
{
  return MEMORY[0x270F76AD8]();
}

uint64_t sub_25ACD5750()
{
  return MEMORY[0x270F76AE0]();
}

uint64_t sub_25ACD5760()
{
  return MEMORY[0x270F76AE8]();
}

uint64_t sub_25ACD5770()
{
  return MEMORY[0x270F76AF0]();
}

uint64_t sub_25ACD5780()
{
  return MEMORY[0x270F76AF8]();
}

uint64_t sub_25ACD5790()
{
  return MEMORY[0x270F76B00]();
}

uint64_t sub_25ACD57A0()
{
  return MEMORY[0x270F76B08]();
}

uint64_t sub_25ACD57B0()
{
  return MEMORY[0x270F76B10]();
}

uint64_t sub_25ACD57C0()
{
  return MEMORY[0x270F76B18]();
}

uint64_t sub_25ACD57D0()
{
  return MEMORY[0x270F76B20]();
}

uint64_t sub_25ACD57E0()
{
  return MEMORY[0x270F76B28]();
}

uint64_t sub_25ACD57F0()
{
  return MEMORY[0x270F76B30]();
}

uint64_t sub_25ACD5800()
{
  return MEMORY[0x270F76B38]();
}

uint64_t sub_25ACD5810()
{
  return MEMORY[0x270F76B40]();
}

uint64_t sub_25ACD5820()
{
  return MEMORY[0x270F76B48]();
}

uint64_t sub_25ACD5830()
{
  return MEMORY[0x270F76B50]();
}

uint64_t sub_25ACD5840()
{
  return MEMORY[0x270F76B58]();
}

uint64_t sub_25ACD5850()
{
  return MEMORY[0x270F76B60]();
}

uint64_t sub_25ACD5860()
{
  return MEMORY[0x270F76B68]();
}

uint64_t sub_25ACD5870()
{
  return MEMORY[0x270F76B70]();
}

uint64_t sub_25ACD5880()
{
  return MEMORY[0x270F76B78]();
}

uint64_t sub_25ACD5890()
{
  return MEMORY[0x270F76B80]();
}

uint64_t sub_25ACD58A0()
{
  return MEMORY[0x270F76B88]();
}

uint64_t sub_25ACD58B0()
{
  return MEMORY[0x270F76B90]();
}

uint64_t sub_25ACD58C0()
{
  return MEMORY[0x270F76B98]();
}

uint64_t sub_25ACD58D0()
{
  return MEMORY[0x270F76BA0]();
}

uint64_t sub_25ACD58E0()
{
  return MEMORY[0x270F76BA8]();
}

uint64_t sub_25ACD58F0()
{
  return MEMORY[0x270F76BB0]();
}

uint64_t sub_25ACD5900()
{
  return MEMORY[0x270F76BB8]();
}

uint64_t sub_25ACD5910()
{
  return MEMORY[0x270F76BC0]();
}

uint64_t sub_25ACD5920()
{
  return MEMORY[0x270F76BC8]();
}

uint64_t sub_25ACD5930()
{
  return MEMORY[0x270F76BD0]();
}

uint64_t sub_25ACD5940()
{
  return MEMORY[0x270F76BD8]();
}

uint64_t sub_25ACD5950()
{
  return MEMORY[0x270F76BE0]();
}

uint64_t sub_25ACD5960()
{
  return MEMORY[0x270F76BE8]();
}

uint64_t sub_25ACD5970()
{
  return MEMORY[0x270F76BF0]();
}

uint64_t sub_25ACD5980()
{
  return MEMORY[0x270F76BF8]();
}

uint64_t sub_25ACD5990()
{
  return MEMORY[0x270F76C00]();
}

uint64_t sub_25ACD59A0()
{
  return MEMORY[0x270F76C08]();
}

uint64_t sub_25ACD59B0()
{
  return MEMORY[0x270F76C10]();
}

uint64_t sub_25ACD59C0()
{
  return MEMORY[0x270F76C18]();
}

uint64_t sub_25ACD59D0()
{
  return MEMORY[0x270F76C20]();
}

uint64_t sub_25ACD59E0()
{
  return MEMORY[0x270F76C28]();
}

uint64_t sub_25ACD59F0()
{
  return MEMORY[0x270F76C30]();
}

uint64_t sub_25ACD5A00()
{
  return MEMORY[0x270F76C38]();
}

uint64_t sub_25ACD5A10()
{
  return MEMORY[0x270F76C40]();
}

uint64_t sub_25ACD5A20()
{
  return MEMORY[0x270F76C48]();
}

uint64_t sub_25ACD5A30()
{
  return MEMORY[0x270F76C50]();
}

uint64_t sub_25ACD5A40()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25ACD5A50()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25ACD5A60()
{
  return MEMORY[0x270FA1598]();
}

uint64_t sub_25ACD5A70()
{
  return MEMORY[0x270FA15C0]();
}

uint64_t sub_25ACD5A80()
{
  return MEMORY[0x270FA1618]();
}

uint64_t sub_25ACD5A90()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_25ACD5AA0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25ACD5AB0()
{
  return MEMORY[0x270F9D070]();
}

uint64_t sub_25ACD5AC0()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_25ACD5AD0()
{
  return MEMORY[0x270F9D130]();
}

uint64_t sub_25ACD5AE0()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_25ACD5AF0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25ACD5B00()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25ACD5B10()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25ACD5B20()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25ACD5B30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25ACD5B40()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25ACD5B50()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25ACD5B60()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25ACD5B70()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25ACD5B80()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25ACD5B90()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25ACD5BA0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25ACD5BB0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25ACD5BC0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25ACD5BD0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25ACD5BE0()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_25ACD5BF0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25ACD5C00()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25ACD5C10()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25ACD5C20()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25ACD5C30()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25ACD5C40()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25ACD5C50()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_25ACD5C60()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25ACD5C70()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25ACD5C80()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25ACD5C90()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_25ACD5CA0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_25ACD5CB0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25ACD5CC0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25ACD5CD0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25ACD5CE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25ACD5CF0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25ACD5D00()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_25ACD5D10()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25ACD5D20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25ACD5D30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25ACD5D40()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_25ACD5D50()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25ACD5D60()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25ACD5D70()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_25ACD5D80()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25ACD5D90()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25ACD5DA0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25ACD5DB0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25ACD5DC0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25ACD5DD0()
{
  return MEMORY[0x270F9EA10]();
}

uint64_t sub_25ACD5DE0()
{
  return MEMORY[0x270F9EA18]();
}

uint64_t sub_25ACD5DF0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25ACD5E00()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25ACD5E10()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25ACD5E20()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_25ACD5E30()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25ACD5E40()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25ACD5E50()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25ACD5E60()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25ACD5E70()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25ACD5E80()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_25ACD5E90()
{
  return MEMORY[0x270F9EEE0]();
}

uint64_t sub_25ACD5EA0()
{
  return MEMORY[0x270F9EEF8]();
}

uint64_t sub_25ACD5EB0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25ACD5EC0()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_25ACD5ED0()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_25ACD5EE0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25ACD5EF0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25ACD5F00()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25ACD5F10()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25ACD5F20()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25ACD5F30()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_25ACD5F40()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t sub_25ACD5F50()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t sub_25ACD5F60()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25ACD5F70()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25ACD5F80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25ACD5F90()
{
  return MEMORY[0x270F9F7D8]();
}

uint64_t sub_25ACD5FA0()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25ACD5FB0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25ACD5FC0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25ACD5FD0()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_25ACD5FE0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25ACD5FF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25ACD6000()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25ACD6010()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25ACD6020()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_25ACD6030()
{
  return MEMORY[0x270F9FCB0]();
}

uint64_t sub_25ACD6040()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t sub_25ACD6050()
{
  return MEMORY[0x270F9FCC0]();
}

uint64_t sub_25ACD6060()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_25ACD6070()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_25ACD6080()
{
  return MEMORY[0x270FA0080]();
}

uint64_t REEntitySetName()
{
  return MEMORY[0x270F1DCE8]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x270FA04E8]();
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