unint64_t sub_228E8F234()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t inited;
  int *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t);
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double *v44;
  double v45;
  uint64_t v46;
  double *v47;
  double v48;
  char *v49;
  int v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char v72;
  unint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char v83;
  unint64_t v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  unint64_t v94;
  _OWORD v95[2];
  long long v96;
  uint64_t v97;

  v1 = type metadata accessor for StreamBlock.EventBlock(0);
  v88 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  v93 = (uint64_t)&v86 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for StreamBlock.PCMBlock(0);
  v87 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_228E9EF50();
  v90 = *(void *)(v6 - 8);
  v91 = v6;
  v7 = MEMORY[0x270FA5388](v6);
  v89 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v86 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3160);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228E9F650;
  *(void *)(inited + 32) = 0x6F4D726F736E6573;
  *(void *)(inited + 40) = 0xEB000000006C6564;
  v12 = (int *)type metadata accessor for StreamBlock(0);
  v13 = (void *)((char *)v0 + v12[7]);
  v14 = v13[1];
  if (v14)
  {
    v15 = *v13;
    v16 = v14;
  }
  else
  {
    v15 = 0;
    v16 = 0xE000000000000000;
  }
  v17 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v15;
  *(void *)(inited + 56) = v16;
  *(void *)(inited + 72) = v17;
  *(void *)(inited + 80) = 0x4449726F736E6573;
  *(void *)(inited + 88) = 0xE800000000000000;
  v18 = (void *)((char *)v0 + v12[10]);
  v19 = *v18;
  v20 = v18[1];
  if (v20 >> 60 == 15) {
    v21 = 0;
  }
  else {
    v21 = *v18;
  }
  v92 = v0;
  if (v20 >> 60 == 15) {
    v22 = 0xC000000000000000;
  }
  else {
    v22 = v20;
  }
  swift_bridgeObjectRetain();
  sub_228E8FB10(v19, v20);
  sub_228E9E1A0(v21, v22);
  v23 = sub_228E9EF30();
  v25 = v24;
  v26 = *(void (**)(char *, unint64_t))(v90 + 8);
  v26(v10, v91);
  *(void *)(inited + 96) = v23;
  v27 = MEMORY[0x263F8D310];
  v28 = v92;
  *(void *)(inited + 104) = v25;
  *(void *)(inited + 120) = v27;
  *(void *)(inited + 128) = 0x656E6F5A656D6974;
  *(void *)(inited + 136) = 0xE800000000000000;
  v29 = (void *)((char *)v28 + v12[11]);
  v30 = v29[1];
  if (v30)
  {
    v31 = *v29;
    v32 = v30;
  }
  else
  {
    v31 = 0;
    v32 = 0xE000000000000000;
  }
  *(void *)(inited + 144) = v31;
  *(void *)(inited + 152) = v32;
  *(void *)(inited + 168) = v27;
  *(void *)(inited + 176) = 0x496E6F6973736573;
  *(void *)(inited + 184) = 0xE900000000000044;
  v33 = (void *)((char *)v28 + v12[12]);
  v34 = *v33;
  v35 = v33[1];
  if (v35 >> 60 == 15) {
    v36 = 0;
  }
  else {
    v36 = *v33;
  }
  if (v35 >> 60 == 15) {
    v37 = 0xC000000000000000;
  }
  else {
    v37 = v33[1];
  }
  swift_bridgeObjectRetain();
  sub_228E8FB10(v34, v35);
  v38 = v89;
  sub_228E9E1A0(v36, v37);
  v39 = sub_228E9EF30();
  v41 = v40;
  v26(v38, v91);
  *(void *)(inited + 192) = v39;
  *(void *)(inited + 200) = v41;
  v42 = MEMORY[0x263F8D310];
  v43 = v92;
  *(void *)(inited + 216) = MEMORY[0x263F8D310];
  *(void *)(inited + 224) = 0xD000000000000010;
  *(void *)(inited + 232) = 0x8000000228EA02C0;
  v44 = (double *)((char *)v43 + v12[13]);
  v45 = *v44;
  if (*((unsigned char *)v44 + 8)) {
    v45 = 0.0;
  }
  v46 = MEMORY[0x263F8D538];
  *(double *)(inited + 240) = v45;
  *(void *)(inited + 264) = v46;
  *(void *)(inited + 272) = 0xD000000000000010;
  *(void *)(inited + 280) = 0x8000000228EA02E0;
  v47 = (double *)((char *)v43 + v12[14]);
  v48 = *v47;
  if (*((unsigned char *)v47 + 8)) {
    v48 = 0.0;
  }
  *(double *)(inited + 288) = v48;
  *(void *)(inited + 312) = v46;
  *(void *)(inited + 320) = 0x646E496B636F6C62;
  *(void *)(inited + 328) = 0xEA00000000007865;
  v49 = (char *)v43 + v12[15];
  if (v49[4]) {
    v50 = 0;
  }
  else {
    v50 = *(_DWORD *)v49;
  }
  v51 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 336) = v50;
  *(void *)(inited + 360) = v51;
  *(void *)(inited + 368) = 0x6C427473614C7369;
  *(void *)(inited + 376) = 0xEB000000006B636FLL;
  v52 = *((unsigned char *)v43 + v12[16]) & 1;
  *(void *)(inited + 408) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 384) = v52;
  v53 = sub_228E8FB7C(inited);
  v54 = (void *)((char *)v43 + v12[8]);
  v55 = v54[1];
  if (v55)
  {
    v56 = *v54;
    v97 = v42;
    *(void *)&v96 = v56;
    *((void *)&v96 + 1) = v55;
    sub_228E91760(&v96, v95);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v94 = v53;
    sub_228E912B4(v95, 0x6552726F736E6573, 0xEE006E6F69736976, isUniquelyReferenced_nonNull_native);
    v53 = v94;
    swift_bridgeObjectRelease();
  }
  v58 = (void *)((char *)v43 + v12[9]);
  v59 = v58[1];
  if (v59)
  {
    v60 = *v58;
    v97 = v42;
    *(void *)&v96 = v60;
    *((void *)&v96 + 1) = v59;
    sub_228E91760(&v96, v95);
    swift_bridgeObjectRetain();
    v61 = swift_isUniquelyReferenced_nonNull_native();
    v94 = v53;
    sub_228E912B4(v95, 0x614E726F736E6573, 0xEA0000000000656DLL, v61);
    v53 = v94;
    swift_bridgeObjectRelease();
  }
  v62 = *v43;
  v63 = *(void *)(*v43 + 16);
  v64 = MEMORY[0x263F8EE78];
  if (v63)
  {
    v91 = v53;
    *(void *)&v96 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_228E91740(0, v63, 0);
    v65 = *(unsigned __int8 *)(v87 + 80);
    v90 = v62;
    v66 = v62 + ((v65 + 32) & ~v65);
    v67 = *(void *)(v87 + 72);
    v64 = v96;
    do
    {
      sub_228E91770(v66, (uint64_t)v5, type metadata accessor for StreamBlock.PCMBlock);
      v68 = sub_228E8FCA8();
      sub_228E917D8((uint64_t)v5, type metadata accessor for StreamBlock.PCMBlock);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E91740(0, *(void *)(v64 + 16) + 1, 1);
        v64 = v96;
      }
      v70 = *(void *)(v64 + 16);
      v69 = *(void *)(v64 + 24);
      if (v70 >= v69 >> 1)
      {
        sub_228E91740((void *)(v69 > 1), v70 + 1, 1);
        v64 = v96;
      }
      *(void *)(v64 + 16) = v70 + 1;
      *(void *)(v64 + 8 * v70 + 32) = v68;
      v66 += v67;
      --v63;
    }
    while (v63);
    swift_bridgeObjectRelease();
    v53 = v91;
    v43 = v92;
  }
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3168);
  v97 = v71;
  *(void *)&v96 = v64;
  sub_228E91760(&v96, v95);
  v72 = swift_isUniquelyReferenced_nonNull_native();
  v94 = v53;
  sub_228E912B4(v95, 0x6B636F6C426D6370, 0xE900000000000073, v72);
  v73 = v94;
  swift_bridgeObjectRelease();
  v74 = v43[1];
  v75 = *(void *)(v74 + 16);
  v76 = MEMORY[0x263F8EE78];
  if (v75)
  {
    v91 = v73;
    v92 = (void *)v71;
    *(void *)&v96 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_228E91740(0, v75, 0);
    v77 = v74 + ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80));
    v78 = *(void *)(v88 + 72);
    v76 = v96;
    do
    {
      v79 = v93;
      sub_228E91770(v77, v93, type metadata accessor for StreamBlock.EventBlock);
      v80 = sub_228E9043C();
      sub_228E917D8(v79, type metadata accessor for StreamBlock.EventBlock);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E91740(0, *(void *)(v76 + 16) + 1, 1);
        v76 = v96;
      }
      v82 = *(void *)(v76 + 16);
      v81 = *(void *)(v76 + 24);
      if (v82 >= v81 >> 1)
      {
        sub_228E91740((void *)(v81 > 1), v82 + 1, 1);
        v76 = v96;
      }
      *(void *)(v76 + 16) = v82 + 1;
      *(void *)(v76 + 8 * v82 + 32) = v80;
      v77 += v78;
      --v75;
    }
    while (v75);
    swift_bridgeObjectRelease();
    v73 = v91;
    v71 = (uint64_t)v92;
  }
  v97 = v71;
  *(void *)&v96 = v76;
  sub_228E91760(&v96, v95);
  v83 = swift_isUniquelyReferenced_nonNull_native();
  v94 = v73;
  sub_228E912B4(v95, 0x6F6C42746E657665, 0xEB00000000736B63, v83);
  v84 = v94;
  swift_bridgeObjectRelease();
  return v84;
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

uint64_t sub_228E8FB10(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_228E8FB24(a1, a2);
  }
  return a1;
}

uint64_t sub_228E8FB24(uint64_t a1, unint64_t a2)
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

unint64_t sub_228E8FB7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3188);
  uint64_t v2 = sub_228E9F200();
  v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_228E91C6C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_228E90C60(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_228E91760(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_228E8FCA8()
{
  v1 = v0;
  uint64_t v2 = sub_228E9F1A0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_228E9EF20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2682B3128 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_2682B3130;
  uint64_t v8 = (int *)type metadata accessor for StreamBlock.PCMBlock(0);
  id v9 = v7;
  sub_228E9EF00();
  char v10 = (void *)sub_228E9EF10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v11 = objc_msgSend(v9, sel_stringFromDate_, v10);

  uint64_t v12 = sub_228E9F170();
  uint64_t v14 = v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3160);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228E9F660;
  strcpy((char *)(inited + 32), "channelNames");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  uint64_t v16 = *v1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3170);
  *(void *)(inited + 48) = v16;
  *(void *)(inited + 72) = v17;
  strcpy((char *)(inited + 80), "bitsPerChannel");
  *(unsigned char *)(inited + 95) = -18;
  v18 = (char *)v1 + v8[6];
  if (v18[4]) {
    int v19 = 0;
  }
  else {
    int v19 = *(_DWORD *)v18;
  }
  uint64_t v20 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 96) = v19;
  *(void *)(inited + 120) = v20;
  strcpy((char *)(inited + 128), "bytesPerFrame");
  *(_WORD *)(inited + 142) = -4864;
  v21 = (char *)v1 + v8[7];
  if (v21[4]) {
    int v22 = 0;
  }
  else {
    int v22 = *(_DWORD *)v21;
  }
  *(_DWORD *)(inited + 144) = v22;
  *(void *)(inited + 168) = v20;
  *(void *)(inited + 176) = 0x6C4674616D726F66;
  *(void *)(inited + 184) = 0xEB00000000736761;
  v23 = (char *)v1 + v8[8];
  if (v23[4]) {
    int v24 = 0;
  }
  else {
    int v24 = *(_DWORD *)v23;
  }
  *(_DWORD *)(inited + 192) = v24;
  *(void *)(inited + 216) = v20;
  *(void *)(inited + 224) = 0xD000000000000011;
  *(void *)(inited + 232) = 0x8000000228EA0340;
  v25 = (double *)((char *)v1 + v8[9]);
  double v26 = *v25;
  if (*((unsigned char *)v25 + 8)) {
    double v26 = 0.0;
  }
  uint64_t v27 = MEMORY[0x263F8D538];
  *(double *)(inited + 240) = v26;
  *(void *)(inited + 264) = v27;
  *(void *)(inited + 272) = 0x7461447472617473;
  uint64_t v28 = MEMORY[0x263F8D310];
  *(void *)(inited + 280) = 0xE900000000000065;
  *(void *)(inited + 288) = v12;
  *(void *)(inited + 296) = v14;
  *(void *)(inited + 312) = v28;
  *(void *)(inited + 320) = 0x6D69547472617473;
  *(void *)(inited + 328) = 0xE900000000000065;
  v29 = (double *)((char *)v1 + v8[11]);
  double v30 = *v29;
  if (*((unsigned char *)v29 + 8)) {
    double v30 = 0.0;
  }
  *(double *)(inited + 336) = v30;
  *(void *)(inited + 360) = v27;
  *(void *)(inited + 368) = 0x656D6954646E65;
  *(void *)(inited + 376) = 0xE700000000000000;
  v31 = (double *)((char *)v1 + v8[12]);
  double v32 = *v31;
  if (*((unsigned char *)v31 + 8)) {
    double v32 = 0.0;
  }
  *(double *)(inited + 384) = v32;
  *(void *)(inited + 408) = v27;
  *(void *)(inited + 416) = 0x646E49656D617266;
  *(void *)(inited + 424) = 0xEA00000000007865;
  v33 = (char *)v1 + v8[13];
  if (v33[4]) {
    int v34 = 0;
  }
  else {
    int v34 = *(_DWORD *)v33;
  }
  *(_DWORD *)(inited + 432) = v34;
  *(void *)(inited + 456) = v20;
  *(void *)(inited + 464) = 0x756F43656D617266;
  *(void *)(inited + 472) = 0xEA0000000000746ELL;
  v35 = (char *)v1 + v8[14];
  if (v35[4]) {
    int v36 = 0;
  }
  else {
    int v36 = *(_DWORD *)v35;
  }
  *(void *)(inited + 504) = v20;
  *(_DWORD *)(inited + 480) = v36;
  swift_bridgeObjectRetain();
  unint64_t v37 = sub_228E8FB7C(inited);
  unint64_t v50 = v37;
  v38 = (uint64_t *)((char *)v1 + v8[15]);
  unint64_t v39 = v38[1];
  if (v39 >> 60 == 15) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = *v38;
  }
  if (v39 >> 60 == 15) {
    unint64_t v41 = 0xC000000000000000;
  }
  else {
    unint64_t v41 = v38[1];
  }
  sub_228E8FB10(*v38, v39);
  uint64_t v42 = sub_228E9AF30(v19, v24, v40, v41);
  sub_228E918B8(v40, v41);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3180);
  *(void *)&long long v48 = v42;
  sub_228E91760(&v48, v47);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v46 = v37;
  sub_228E912B4(v47, 0x73656D617266, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
  unint64_t v44 = v46;
  swift_bridgeObjectRelease();
  return v44;
}

uint64_t sub_228E902E0(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_228E91740(0, v5, 0);
    uint64_t v6 = v17;
    uint64_t v8 = *(void *)(type metadata accessor for StreamBlock.Event(0) - 8);
    uint64_t v9 = a3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    while (1)
    {
      a1(&v16, v9);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v11 = v16;
      uint64_t v17 = v6;
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_228E91740((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v6 = v17;
      }
      *(void *)(v6 + 16) = v13 + 1;
      *(void *)(v6 + 8 * v13 + 32) = v11;
      v9 += v10;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

unint64_t sub_228E9043C()
{
  v1 = v0;
  uint64_t v2 = sub_228E9F1A0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3160);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228E9F670;
  strcpy((char *)(inited + 32), "channelNames");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  uint64_t v6 = *v1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3170);
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 72) = v7;
  strcpy((char *)(inited + 80), "bitsPerChannel");
  *(unsigned char *)(inited + 95) = -18;
  uint64_t v8 = (int *)type metadata accessor for StreamBlock.EventBlock(0);
  uint64_t v9 = v8;
  uint64_t v10 = (char *)v1 + v8[7];
  if (v10[4]) {
    int v11 = 0;
  }
  else {
    int v11 = *(_DWORD *)v10;
  }
  uint64_t v12 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 96) = v11;
  *(void *)(inited + 120) = v12;
  *(void *)(inited + 128) = 0x7265507365747962;
  *(void *)(inited + 136) = 0xEF64616F6C796150;
  unint64_t v13 = (char *)v1 + v8[8];
  if (v13[4]) {
    int v14 = 0;
  }
  else {
    int v14 = *(_DWORD *)v13;
  }
  *(_DWORD *)(inited + 144) = v14;
  *(void *)(inited + 168) = v12;
  *(void *)(inited + 176) = 0x6C4674616D726F66;
  *(void *)(inited + 184) = 0xEB00000000736761;
  uint64_t v15 = (char *)v1 + v8[9];
  if (v15[4]) {
    int v16 = 0;
  }
  else {
    int v16 = *(_DWORD *)v15;
  }
  *(_DWORD *)(inited + 192) = v16;
  *(void *)(inited + 216) = v12;
  *(void *)(inited + 224) = 0x646E49746E657665;
  *(void *)(inited + 232) = 0xEA00000000007865;
  uint64_t v17 = (char *)v1 + v8[10];
  if (v17[4]) {
    int v18 = 0;
  }
  else {
    int v18 = *(_DWORD *)v17;
  }
  *(_DWORD *)(inited + 240) = v18;
  *(void *)(inited + 264) = v12;
  *(void *)(inited + 272) = 0x6E65736572706572;
  *(void *)(inited + 280) = 0xEF65746174537374;
  char v19 = *((unsigned char *)v1 + v8[11]);
  *(void *)(inited + 312) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 288) = v19 & 1;
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_228E8FB7C(inited);
  unint64_t v21 = v20;
  unint64_t v38 = v20;
  if (v19)
  {
    v33 = v4;
    int v22 = (void *)((char *)v1 + v9[12]);
    unint64_t v23 = v22[1];
    if (v23 >> 60 == 15) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = *v22;
    }
    if (v23 >> 60 == 15) {
      unint64_t v25 = 0xC000000000000000;
    }
    else {
      unint64_t v25 = v22[1];
    }
    sub_228E8FB10(*v22, v23);
    uint64_t v26 = sub_228E9AF30(v11, v16, v24, v25);
    sub_228E918B8(v24, v25);
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3180);
    *(void *)&long long v36 = v26;
    sub_228E91760(&v36, v35);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v34 = v21;
    sub_228E912B4(v35, 0xD000000000000015, 0x8000000228EA0320, isUniquelyReferenced_nonNull_native);
    unint64_t v21 = v34;
    unint64_t v38 = v34;
    unint64_t v20 = swift_bridgeObjectRelease();
  }
  uint64_t v28 = v1[1];
  MEMORY[0x270FA5388](v20);
  *(&v33 - 2) = (char *)v1;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_228E902E0((void (*)(uint64_t *__return_ptr, uint64_t))sub_228E91838, (uint64_t)(&v33 - 4), v28);
  swift_bridgeObjectRelease();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3168);
  *(void *)&long long v36 = v29;
  sub_228E91760(&v36, v35);
  char v30 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v34 = v21;
  sub_228E912B4(v35, 0x73746E657665, 0xE600000000000000, v30);
  unint64_t v31 = v34;
  swift_bridgeObjectRelease();
  return v31;
}

id sub_228E9093C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
  id result = objc_msgSend(v0, sel_setFormatOptions_, 1907);
  qword_2682B3130 = (uint64_t)v0;
  return result;
}

unint64_t sub_228E9098C(int a1, __int16 a2)
{
  uint64_t v5 = sub_228E9F1A0();
  MEMORY[0x270FA5388](v5 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3160);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_228E9F680;
  *(void *)(inited + 32) = 0x6D6954746E657665;
  *(void *)(inited + 40) = 0xE900000000000065;
  uint64_t v7 = type metadata accessor for StreamBlock.Event(0);
  uint64_t v8 = v2 + *(int *)(v7 + 20);
  double v9 = *(double *)v8;
  if (*(unsigned char *)(v8 + 8)) {
    double v9 = 0.0;
  }
  *(void *)(inited + 72) = MEMORY[0x263F8D538];
  *(double *)(inited + 48) = v9;
  unint64_t v10 = sub_228E8FB7C(inited);
  unint64_t v21 = v10;
  int v11 = (uint64_t *)(v2 + *(int *)(v7 + 24));
  unint64_t v12 = v11[1];
  if (v12 >> 60 == 15) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = *v11;
  }
  if (v12 >> 60 == 15) {
    unint64_t v14 = 0xC000000000000000;
  }
  else {
    unint64_t v14 = v11[1];
  }
  sub_228E8FB10(*v11, v12);
  uint64_t v15 = sub_228E9AF30(a1, a2, v13, v14);
  sub_228E918B8(v13, v14);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3180);
  *(void *)&long long v19 = v15;
  sub_228E91760(&v19, v18);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_228E912B4(v18, 0x736C656E6E616863, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_228E90C60(uint64_t a1, uint64_t a2)
{
  sub_228E9F270();
  sub_228E9F1B0();
  uint64_t v4 = sub_228E9F290();
  return sub_228E91474(a1, a2, v4);
}

double sub_228E90CD8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_228E90C60(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_228E91558();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_228E91760((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_228E910DC(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_228E90DDC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3188);
  uint64_t v6 = sub_228E9F1F0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_228E91760(v24, v35);
      }
      else
      {
        sub_228E91970((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_228E9F270();
      sub_228E9F1B0();
      uint64_t result = sub_228E9F290();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_228E91760(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_228E910DC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_228E9F1D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_228E9F270();
        swift_bridgeObjectRetain();
        sub_228E9F1B0();
        uint64_t v10 = sub_228E9F290();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_228E912B4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_228E90C60(a2, a3);
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
      sub_228E91558();
      goto LABEL_7;
    }
    sub_228E90DDC(v15, a4 & 1);
    unint64_t v21 = sub_228E90C60(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_228E9F220();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_228E91760(a1, v19);
  }
LABEL_13:
  sub_228E91408(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_228E91408(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_228E91760(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_228E91474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_228E9F210() & 1) == 0)
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
      while (!v14 && (sub_228E9F210() & 1) == 0);
    }
  }
  return v6;
}

void *sub_228E91558()
{
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3188);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_228E9F1E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v20 = 32 * v15;
    sub_228E91970(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_228E91760(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_228E91740(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_228E919EC(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

_OWORD *sub_228E91760(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_228E91770(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_228E917D8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_228E91838@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = type metadata accessor for StreamBlock.EventBlock(0);
  uint64_t v5 = v3 + *(int *)(v4 + 28);
  if (*(unsigned char *)(v5 + 4)) {
    int v6 = 0;
  }
  else {
    int v6 = *(_DWORD *)v5;
  }
  uint64_t v7 = v3 + *(int *)(v4 + 36);
  if (*(unsigned char *)(v7 + 4)) {
    __int16 v8 = 0;
  }
  else {
    __int16 v8 = *(_DWORD *)v7;
  }
  unint64_t result = sub_228E9098C(v6, v8);
  *a1 = result;
  return result;
}

uint64_t sub_228E918B8(uint64_t a1, unint64_t a2)
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

uint64_t sub_228E91910(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3178);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_228E91970(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_228E919CC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_228E91B10(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

void *sub_228E919EC(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3198);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682B31A0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_228E91B10(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3190);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

uint64_t sub_228E91C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682B31A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_228E91CD4(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    int64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    int64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_228E9EF80();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    unint64_t v15 = (void *)((char *)v7 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *unint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (void *)((char *)v7 + v14);
    uint64_t v19 = (void *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[9];
    uint64_t v22 = a3[10];
    unint64_t v23 = (void *)((char *)v7 + v21);
    int64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    unint64_t v26 = (char *)v7 + v22;
    unint64_t v27 = (void *)((char *)a2 + v22);
    unint64_t v28 = *(void *)((char *)a2 + v22 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)unint64_t v26 = *(_OWORD *)v27;
    }
    else
    {
      uint64_t v29 = *v27;
      sub_228E8FB24(*v27, v28);
      *(void *)unint64_t v26 = v29;
      *((void *)v26 + 1) = v28;
    }
    uint64_t v30 = a3[11];
    uint64_t v31 = a3[12];
    uint64_t v32 = (void *)((char *)v7 + v30);
    int64_t v33 = (void *)((char *)a2 + v30);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    v35 = (char *)v7 + v31;
    long long v36 = (_OWORD *)((char *)a2 + v31);
    unint64_t v37 = *(void *)((char *)a2 + v31 + 8);
    swift_bridgeObjectRetain();
    if (v37 >> 60 == 15)
    {
      *(_OWORD *)v35 = *v36;
    }
    else
    {
      uint64_t v38 = *(void *)v36;
      sub_228E8FB24(v38, v37);
      *(void *)v35 = v38;
      *((void *)v35 + 1) = v37;
    }
    uint64_t v39 = a3[13];
    uint64_t v40 = a3[14];
    unint64_t v41 = (char *)v7 + v39;
    uint64_t v42 = (char *)a2 + v39;
    *(void *)unint64_t v41 = *(void *)v42;
    v41[8] = v42[8];
    v43 = (char *)v7 + v40;
    unint64_t v44 = (char *)a2 + v40;
    *(void *)v43 = *(void *)v44;
    v43[8] = v44[8];
    uint64_t v45 = a3[15];
    uint64_t v46 = a3[16];
    v47 = (char *)v7 + v45;
    long long v48 = (char *)a2 + v45;
    *(_DWORD *)v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    *((unsigned char *)v7 + v46) = *((unsigned char *)a2 + v46);
  }
  return v7;
}

uint64_t sub_228E91F04(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_228E9EF80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v6 = (uint64_t *)(a1 + a2[10]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    sub_228E918B8(*v6, v7);
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t *)(a1 + a2[12]);
  unint64_t v10 = v9[1];
  if (v10 >> 60 != 15)
  {
    uint64_t v11 = *v9;
    return sub_228E918B8(v11, v10);
  }
  return result;
}

void *sub_228E9201C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_228E9EF80();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v12);
  unint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)((char *)a1 + v13);
  uint64_t v18 = (void *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)((char *)a1 + v20);
  unint64_t v23 = (void *)((char *)a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (char *)a1 + v21;
  unint64_t v26 = (void *)((char *)a2 + v21);
  unint64_t v27 = *(void *)((char *)a2 + v21 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  }
  else
  {
    uint64_t v28 = *v26;
    sub_228E8FB24(*v26, v27);
    *(void *)uint64_t v25 = v28;
    *((void *)v25 + 1) = v27;
  }
  uint64_t v29 = a3[11];
  uint64_t v30 = a3[12];
  uint64_t v31 = (void *)((char *)a1 + v29);
  uint64_t v32 = (void *)((char *)a2 + v29);
  uint64_t v33 = v32[1];
  void *v31 = *v32;
  v31[1] = v33;
  uint64_t v34 = (char *)a1 + v30;
  v35 = (_OWORD *)((char *)a2 + v30);
  unint64_t v36 = *(void *)((char *)a2 + v30 + 8);
  swift_bridgeObjectRetain();
  if (v36 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v34 = *v35;
  }
  else
  {
    uint64_t v37 = *(void *)v35;
    sub_228E8FB24(v37, v36);
    *(void *)uint64_t v34 = v37;
    *((void *)v34 + 1) = v36;
  }
  uint64_t v38 = a3[13];
  uint64_t v39 = a3[14];
  uint64_t v40 = (char *)a1 + v38;
  unint64_t v41 = (char *)a2 + v38;
  *(void *)uint64_t v40 = *(void *)v41;
  v40[8] = v41[8];
  uint64_t v42 = (char *)a1 + v39;
  v43 = (char *)a2 + v39;
  *(void *)uint64_t v42 = *(void *)v43;
  v42[8] = v43[8];
  uint64_t v44 = a3[15];
  uint64_t v45 = a3[16];
  uint64_t v46 = (char *)a1 + v44;
  v47 = (char *)a2 + v44;
  *(_DWORD *)uint64_t v46 = *(_DWORD *)v47;
  v46[4] = v47[4];
  *((unsigned char *)a1 + v45) = *((unsigned char *)a2 + v45);
  return a1;
}

void *sub_228E921F8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  unint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[10];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  unint64_t v22 = *(void *)((char *)a2 + v19 + 8);
  if (*(void *)((char *)a1 + v19 + 8) >> 60 == 15)
  {
    if (v22 >> 60 != 15)
    {
      uint64_t v23 = *v21;
      sub_228E8FB24(v23, v22);
      *uint64_t v20 = v23;
      v20[1] = v22;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v22 >> 60 == 15)
  {
    sub_228E924BC((uint64_t)v20);
LABEL_6:
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    goto LABEL_8;
  }
  uint64_t v24 = *v21;
  sub_228E8FB24(v24, v22);
  uint64_t v25 = *v20;
  unint64_t v26 = v20[1];
  *uint64_t v20 = v24;
  v20[1] = v22;
  sub_228E918B8(v25, v26);
LABEL_8:
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[12];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  unint64_t v33 = *(void *)((char *)a2 + v30 + 8);
  if (*(void *)((char *)a1 + v30 + 8) >> 60 != 15)
  {
    if (v33 >> 60 != 15)
    {
      uint64_t v35 = *v32;
      sub_228E8FB24(v35, v33);
      uint64_t v36 = *v31;
      unint64_t v37 = v31[1];
      uint64_t *v31 = v35;
      v31[1] = v33;
      sub_228E918B8(v36, v37);
      goto LABEL_15;
    }
    sub_228E924BC((uint64_t)v31);
    goto LABEL_13;
  }
  if (v33 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
    goto LABEL_15;
  }
  uint64_t v34 = *v32;
  sub_228E8FB24(v34, v33);
  uint64_t *v31 = v34;
  v31[1] = v33;
LABEL_15:
  uint64_t v38 = a3[13];
  uint64_t v39 = (char *)a1 + v38;
  uint64_t v40 = (char *)a2 + v38;
  uint64_t v41 = *(void *)v40;
  v39[8] = v40[8];
  *(void *)uint64_t v39 = v41;
  uint64_t v42 = a3[14];
  v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = *(void *)v44;
  v43[8] = v44[8];
  *(void *)v43 = v45;
  uint64_t v46 = a3[15];
  v47 = (char *)a1 + v46;
  long long v48 = (char *)a2 + v46;
  LODWORD(v45) = *(_DWORD *)v48;
  v47[4] = v48[4];
  *(_DWORD *)v47 = v45;
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
  return a1;
}

uint64_t sub_228E924BC(uint64_t a1)
{
  return a1;
}

_OWORD *sub_228E92510(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  uint64_t v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  uint64_t v12 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  uint64_t v13 = a3[13];
  uint64_t v14 = a3[14];
  unint64_t v15 = (char *)a1 + v13;
  uint64_t v16 = (char *)a2 + v13;
  *(void *)unint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = (char *)a1 + v14;
  uint64_t v18 = (char *)a2 + v14;
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = a3[15];
  uint64_t v20 = a3[16];
  uint64_t v21 = (char *)a1 + v19;
  unint64_t v22 = (char *)a2 + v19;
  *(_DWORD *)uint64_t v21 = *(_DWORD *)v22;
  v21[4] = v22[4];
  *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
  return a1;
}

void *sub_228E92630(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  void *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)((char *)a1 + v20);
  unint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[10];
  uint64_t v26 = (uint64_t)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  unint64_t v28 = *(void *)((char *)a1 + v25 + 8);
  if (v28 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v29 = *((void *)v27 + 1);
  if (v29 >> 60 == 15)
  {
    sub_228E924BC(v26);
LABEL_4:
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    goto LABEL_6;
  }
  uint64_t v30 = *(void *)v26;
  *(void *)uint64_t v26 = *(void *)v27;
  *(void *)(v26 + 8) = v29;
  sub_228E918B8(v30, v28);
LABEL_6:
  uint64_t v31 = a3[11];
  uint64_t v32 = (void *)((char *)a1 + v31);
  unint64_t v33 = (void *)((char *)a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[12];
  unint64_t v37 = (void *)((char *)a1 + v36);
  uint64_t v38 = (void *)((char *)a2 + v36);
  unint64_t v39 = *(void *)((char *)a1 + v36 + 8);
  if (v39 >> 60 != 15)
  {
    unint64_t v40 = v38[1];
    if (v40 >> 60 != 15)
    {
      uint64_t v41 = *v37;
      *unint64_t v37 = *v38;
      v37[1] = v40;
      sub_228E918B8(v41, v39);
      goto LABEL_11;
    }
    sub_228E924BC((uint64_t)v37);
  }
  *(_OWORD *)unint64_t v37 = *(_OWORD *)v38;
LABEL_11:
  uint64_t v42 = a3[13];
  uint64_t v43 = a3[14];
  uint64_t v44 = (char *)a1 + v42;
  uint64_t v45 = (char *)a2 + v42;
  *(void *)uint64_t v44 = *(void *)v45;
  v44[8] = v45[8];
  uint64_t v46 = (char *)a1 + v43;
  v47 = (char *)a2 + v43;
  *(void *)uint64_t v46 = *(void *)v47;
  v46[8] = v47[8];
  uint64_t v48 = a3[15];
  uint64_t v49 = a3[16];
  unint64_t v50 = (char *)a1 + v48;
  v51 = (char *)a2 + v48;
  *(_DWORD *)unint64_t v50 = *(_DWORD *)v51;
  v50[4] = v51[4];
  *((unsigned char *)a1 + v49) = *((unsigned char *)a2 + v49);
  return a1;
}

uint64_t sub_228E9283C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_228E92854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t type metadata accessor for StreamBlock(uint64_t a1)
{
  return sub_228E95D6C(a1, (uint64_t *)&unk_2682B31B0);
}

uint64_t sub_228E9288C()
{
  uint64_t result = sub_228E9EF80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_228E92964(char *a1, char *a2)
{
  return qword_228E9FE90[*a1] == qword_228E9FE90[*a2];
}

uint64_t sub_228E92988()
{
  return sub_228E9F290();
}

uint64_t sub_228E929EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_228E9A900();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_228E92A38()
{
  return sub_228E9F290();
}

void sub_228E92A98(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_228E92AA0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_228E972C0(a1);
  *a2 = result;
  return result;
}

uint64_t sub_228E92AC8()
{
  return qword_228E9FE90[*v0];
}

uint64_t sub_228E92ADC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_228E972C0(*a1);
  *a2 = result;
  return result;
}

void sub_228E92B08(void *a1@<X8>)
{
  *a1 = qword_228E9FE90[*v1];
}

void sub_228E92B20(void *a1@<X8>)
{
  *a1 = &unk_26DD4B080;
}

uint64_t sub_228E92B30()
{
  uint64_t v0 = sub_228E9F130();
  __swift_allocate_value_buffer(v0, qword_2682B34C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B34C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3258);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682B3260) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_228E9F690;
  unint64_t v4 = v30 + v3;
  unint64_t v5 = v30 + v3 + v1[14];
  *(void *)(v30 + v3) = 1;
  *(void *)unint64_t v5 = "sensorModel";
  *(void *)(v5 + 8) = 11;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_228E9F110();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "sensorRevision";
  *(void *)(v9 + 8) = 14;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 3;
  *(void *)uint64_t v11 = "sensorName";
  *((void *)v11 + 1) = 10;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "sensorID";
  *((void *)v13 + 1) = 8;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "timeZone";
  *((void *)v15 + 1) = 8;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "sessionID";
  *((void *)v17 + 1) = 9;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  void *v18 = 7;
  *(void *)uint64_t v19 = "sessionStartDate";
  *((void *)v19 + 1) = 16;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  *uint64_t v20 = 8;
  *(void *)uint64_t v21 = "sessionStartTime";
  *((void *)v21 + 1) = 16;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "blockIndex";
  *(void *)(v22 + 8) = 10;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v4 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)uint64_t v24 = "isLastBlock";
  *((void *)v24 + 1) = 11;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v4 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  void *v25 = 11;
  *(void *)uint64_t v26 = "pcmBlocks";
  *((void *)v26 + 1) = 9;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v4 + 11 * v2);
  unint64_t v28 = (char *)v27 + v1[14];
  *uint64_t v27 = 12;
  *(void *)unint64_t v28 = "eventBlocks";
  *((void *)v28 + 1) = 11;
  v28[16] = 2;
  v8();
  return sub_228E9F120();
}

uint64_t sub_228E92F54()
{
  uint64_t result = sub_228E9EFE0();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 5:
          type metadata accessor for StreamBlock(0);
          uint64_t v4 = v3;
          sub_228E9F030();
          goto LABEL_13;
        case 4:
        case 6:
          type metadata accessor for StreamBlock(0);
          uint64_t v4 = v3;
          sub_228E9F000();
          goto LABEL_13;
        case 7:
        case 8:
          type metadata accessor for StreamBlock(0);
          uint64_t v4 = v3;
          sub_228E9F020();
          goto LABEL_13;
        case 9:
          type metadata accessor for StreamBlock(0);
          uint64_t v4 = v3;
          sub_228E9F040();
          goto LABEL_13;
        case 10:
          type metadata accessor for StreamBlock(0);
          uint64_t v4 = v3;
          sub_228E9EFF0();
          goto LABEL_13;
        case 11:
          type metadata accessor for StreamBlock.PCMBlock(0);
          sub_228E95AEC(&qword_2682B3208, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
          goto LABEL_12;
        case 12:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_228E95AEC(&qword_2682B31C8, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
LABEL_12:
          uint64_t v4 = v3;
          sub_228E9F050();
LABEL_13:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_228E9EFE0();
    }
  }
  return result;
}

uint64_t sub_228E931F4()
{
  char v2 = (int *)type metadata accessor for StreamBlock(0);
  if (!*(void *)((char *)v0 + v2[7] + 8) || (uint64_t result = sub_228E9F0E0(), !v1))
  {
    if (!*(void *)((char *)v0 + v2[8] + 8) || (uint64_t result = sub_228E9F0E0(), !v1))
    {
      if (!*(void *)((char *)v0 + v2[9] + 8) || (uint64_t result = sub_228E9F0E0(), !v1))
      {
        uint64_t v4 = (char *)v0 + v2[10];
        unint64_t v5 = *((void *)v4 + 1);
        if (v5 >> 60 == 15
          || (uint64_t v6 = *(void *)v4,
              sub_228E8FB24(*(void *)v4, *((void *)v4 + 1)),
              sub_228E9F0B0(),
              uint64_t result = sub_228E96044(v6, v5),
              !v1))
        {
          if (!*(void *)((char *)v0 + v2[11] + 8) || (uint64_t result = sub_228E9F0E0(), !v1))
          {
            uint64_t v7 = (char *)v0 + v2[12];
            unint64_t v8 = *((void *)v7 + 1);
            if (v8 >> 60 == 15
              || (uint64_t v9 = *(void *)v7,
                  sub_228E8FB24(*(void *)v7, *((void *)v7 + 1)),
                  sub_228E9F0B0(),
                  uint64_t result = sub_228E96044(v9, v8),
                  !v1))
            {
              if ((*((unsigned char *)v0 + v2[13] + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
              {
                if ((*((unsigned char *)v0 + v2[14] + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
                {
                  if ((*((unsigned char *)v0 + v2[15] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
                  {
                    if (*((unsigned char *)v0 + v2[16]) == 2 || (uint64_t result = sub_228E9F0A0(), !v1))
                    {
                      if (!*(void *)(*v0 + 16)
                        || (type metadata accessor for StreamBlock.PCMBlock(0),
                            sub_228E95AEC(&qword_2682B3208, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock), uint64_t result = sub_228E9F100(), !v1))
                      {
                        if (!*(void *)(v0[1] + 16)) {
                          return sub_228E9EF60();
                        }
                        type metadata accessor for StreamBlock.EventBlock(0);
                        sub_228E95AEC(&qword_2682B31C8, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
                        uint64_t result = sub_228E9F100();
                        if (!v1) {
                          return sub_228E9EF60();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double sub_228E93588@<D0>(int *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  *a2 = MEMORY[0x263F8EE78];
  a2[1] = v4;
  sub_228E9EF70();
  uint64_t v5 = a1[8];
  uint64_t v6 = (void *)((char *)a2 + a1[7]);
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)((char *)a2 + v5);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = a1[10];
  uint64_t v9 = (void *)((char *)a2 + a1[9]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  double result = 0.0;
  *(_OWORD *)((char *)a2 + v8) = xmmword_228E9F6A0;
  uint64_t v11 = a1[12];
  uint64_t v12 = (void *)((char *)a2 + a1[11]);
  *uint64_t v12 = 0;
  v12[1] = 0;
  *(_OWORD *)((char *)a2 + v11) = xmmword_228E9F6A0;
  uint64_t v13 = a1[14];
  uint64_t v14 = (char *)a2 + a1[13];
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)uint64_t v15 = 0;
  v15[8] = 1;
  uint64_t v16 = a1[16];
  uint64_t v17 = (char *)a2 + a1[15];
  v17[4] = 1;
  *(_DWORD *)uint64_t v17 = 0;
  *((unsigned char *)a2 + v16) = 2;
  return result;
}

uint64_t sub_228E93638()
{
  return 0x6C426D6165727453;
}

uint64_t (*sub_228E93664())()
{
  return nullsub_1;
}

uint64_t sub_228E9368C()
{
  return sub_228E92F54();
}

uint64_t sub_228E936A4()
{
  return sub_228E931F4();
}

uint64_t sub_228E936C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E95AEC(&qword_2682B3250, (void (*)(uint64_t))type metadata accessor for StreamBlock);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_228E93740@<X0>(uint64_t a1@<X8>)
{
  return sub_228E95808(&qword_2682B3138, (uint64_t)qword_2682B34C8, a1);
}

uint64_t sub_228E93764(uint64_t a1)
{
  uint64_t v2 = sub_228E95AEC((unint64_t *)&qword_2682B3228, (void (*)(uint64_t))type metadata accessor for StreamBlock);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_228E937D4()
{
  sub_228E95AEC((unint64_t *)&qword_2682B3228, (void (*)(uint64_t))type metadata accessor for StreamBlock);
  return sub_228E9F090();
}

uint64_t sub_228E93858()
{
  uint64_t v0 = sub_228E9F130();
  __swift_allocate_value_buffer(v0, qword_2682B34E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B34E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3258);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682B3260) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_228E9F6B0;
  unint64_t v4 = v20 + v3 + v1[14];
  *(void *)(v20 + v3) = 1;
  *(void *)unint64_t v4 = "FormatFlagIsFloat";
  *(void *)(v4 + 8) = 17;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = *MEMORY[0x263F50718];
  uint64_t v6 = sub_228E9F110();
  uint64_t v7 = *(void (**)(void))(*(void *)(v6 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v7)(v4, v5, v6);
  unint64_t v8 = v20 + v3 + v2 + v1[14];
  *(void *)(v20 + v3 + v2) = 2;
  *(void *)unint64_t v8 = "FormatFlagIsBigEndian";
  *(void *)(v8 + 8) = 21;
  *(unsigned char *)(v8 + 16) = 2;
  v7();
  uint64_t v9 = (void *)(v20 + v3 + 2 * v2);
  uint64_t v10 = (char *)v9 + v1[14];
  *uint64_t v9 = 4;
  *(void *)uint64_t v10 = "FormatFlagIsSignedInteger";
  *((void *)v10 + 1) = 25;
  v10[16] = 2;
  v7();
  uint64_t v11 = (void *)(v20 + v3 + 3 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 8;
  *(void *)uint64_t v12 = "FormatFlagIsPacked";
  *((void *)v12 + 1) = 18;
  v12[16] = 2;
  v7();
  uint64_t v13 = (void *)(v20 + v3 + 4 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 16;
  *(void *)uint64_t v14 = "FormatFlagIsAlignedHigh";
  *((void *)v14 + 1) = 23;
  v14[16] = 2;
  v7();
  uint64_t v15 = (void *)(v20 + v3 + 5 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 256;
  *(void *)uint64_t v16 = "FormatFlagVarint";
  *((void *)v16 + 1) = 16;
  v16[16] = 2;
  v7();
  uint64_t v17 = (void *)(v20 + v3 + 6 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 512;
  *(void *)uint64_t v18 = "FormatFlagALAC";
  *((void *)v18 + 1) = 14;
  v18[16] = 2;
  v7();
  return sub_228E9F120();
}

uint64_t sub_228E93B4C@<X0>(uint64_t a1@<X8>)
{
  return sub_228E95808(&qword_2682B3140, (uint64_t)qword_2682B34E0, a1);
}

uint64_t sub_228E93B70()
{
  uint64_t v0 = sub_228E9F130();
  __swift_allocate_value_buffer(v0, qword_2682B34F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B34F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3258);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682B3260) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_228E9F6C0;
  unint64_t v4 = v28 + v3;
  unint64_t v5 = v28 + v3 + v1[14];
  *(void *)(v28 + v3) = 1;
  *(void *)unint64_t v5 = "channelNames";
  *(void *)(v5 + 8) = 12;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_228E9F110();
  unint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "bitsPerChannel";
  *(void *)(v9 + 8) = 14;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 3;
  *(void *)uint64_t v11 = "bytesPerFrame";
  *((void *)v11 + 1) = 13;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "formatFlags";
  *((void *)v13 + 1) = 11;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "nominalSampleRate";
  *((void *)v15 + 1) = 17;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "startDate";
  *((void *)v17 + 1) = 9;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  void *v18 = 7;
  *(void *)uint64_t v19 = "startTime";
  *((void *)v19 + 1) = 9;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  *uint64_t v20 = 8;
  *(void *)uint64_t v21 = "endTime";
  *((void *)v21 + 1) = 7;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "frameIndex";
  *(void *)(v22 + 8) = 10;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v4 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)uint64_t v24 = "frameCount";
  *((void *)v24 + 1) = 10;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v4 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  void *v25 = 11;
  *(void *)uint64_t v26 = "frameData";
  *((void *)v26 + 1) = 9;
  v26[16] = 2;
  v8();
  return sub_228E9F120();
}

uint64_t sub_228E93F54()
{
  while (1)
  {
    uint64_t result = sub_228E9EFE0();
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        sub_228E9F010();
        break;
      case 2:
      case 3:
      case 4:
      case 9:
      case 10:
        type metadata accessor for StreamBlock.PCMBlock(0);
        sub_228E9F040();
        break;
      case 5:
      case 6:
      case 7:
      case 8:
        type metadata accessor for StreamBlock.PCMBlock(0);
        sub_228E9F020();
        break;
      case 11:
        type metadata accessor for StreamBlock.PCMBlock(0);
        sub_228E9F000();
        break;
      default:
        continue;
    }
  }
}

uint64_t sub_228E94120()
{
  if (!*(void *)(*(void *)v0 + 16) || (uint64_t result = sub_228E9F0C0(), !v1))
  {
    unint64_t v3 = (int *)type metadata accessor for StreamBlock.PCMBlock(0);
    if ((*(unsigned char *)(v0 + v3[6] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
    {
      if ((*(unsigned char *)(v0 + v3[7] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
      {
        if ((*(unsigned char *)(v0 + v3[8] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
        {
          if ((*(unsigned char *)(v0 + v3[9] + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
          {
            if ((*(unsigned char *)(v0 + v3[10] + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
            {
              if ((*(unsigned char *)(v0 + v3[11] + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
              {
                if ((*(unsigned char *)(v0 + v3[12] + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
                {
                  if ((*(unsigned char *)(v0 + v3[13] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
                  {
                    if ((*(unsigned char *)(v0 + v3[14] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
                    {
                      uint64_t v4 = v0 + v3[15];
                      unint64_t v5 = *(void *)(v4 + 8);
                      if (v5 >> 60 == 15) {
                        return sub_228E9EF60();
                      }
                      uint64_t v6 = *(void *)v4;
                      sub_228E8FB24(*(void *)v4, *(void *)(v4 + 8));
                      sub_228E9F0B0();
                      uint64_t result = sub_228E96044(v6, v5);
                      if (!v1) {
                        return sub_228E9EF60();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double sub_228E943CC@<D0>(int *a1@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  sub_228E9EF70();
  uint64_t v4 = a1[7];
  unint64_t v5 = (char *)a2 + a1[6];
  *(_DWORD *)unint64_t v5 = 0;
  v5[4] = 1;
  uint64_t v6 = (char *)a2 + v4;
  *(_DWORD *)uint64_t v6 = 0;
  v6[4] = 1;
  uint64_t v7 = a1[9];
  unint64_t v8 = (char *)a2 + a1[8];
  *(_DWORD *)unint64_t v8 = 0;
  v8[4] = 1;
  unint64_t v9 = (char *)a2 + v7;
  *(void *)unint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = a1[11];
  uint64_t v11 = (char *)a2 + a1[10];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = a1[13];
  uint64_t v14 = (char *)a2 + a1[12];
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  uint64_t v15 = (char *)a2 + v13;
  *(_DWORD *)uint64_t v15 = 0;
  v15[4] = 1;
  uint64_t v16 = a1[15];
  uint64_t v17 = (char *)a2 + a1[14];
  *(_DWORD *)uint64_t v17 = 0;
  v17[4] = 1;
  double result = 0.0;
  *(_OWORD *)((char *)a2 + v16) = xmmword_228E9F6A0;
  return result;
}

unint64_t sub_228E94498()
{
  return 0xD000000000000014;
}

uint64_t sub_228E944B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_228E9EF80();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_228E94524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_228E9EF80();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_228E94594())()
{
  return nullsub_1;
}

uint64_t sub_228E945B8()
{
  return sub_228E93F54();
}

uint64_t sub_228E945D0()
{
  return sub_228E94120();
}

uint64_t sub_228E945E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E95AEC(&qword_2682B3270, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_228E94664@<X0>(uint64_t a1@<X8>)
{
  return sub_228E95808(&qword_2682B3148, (uint64_t)qword_2682B34F8, a1);
}

uint64_t sub_228E94688(uint64_t a1)
{
  uint64_t v2 = sub_228E95AEC(&qword_2682B3208, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_228E946F4()
{
  sub_228E95AEC(&qword_2682B3208, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
  return sub_228E9F090();
}

uint64_t sub_228E94774()
{
  uint64_t v0 = sub_228E9F130();
  __swift_allocate_value_buffer(v0, qword_2682B3510);
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B3510);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3258);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682B3260) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_228E9F6D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "eventTime";
  *(void *)(v6 + 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_228E9F110();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "payload";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  return sub_228E9F120();
}

uint64_t sub_228E9492C()
{
  while (1)
  {
    uint64_t result = sub_228E9EFE0();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      type metadata accessor for StreamBlock.Event(0);
      sub_228E9F000();
    }
    else if (result == 1)
    {
      type metadata accessor for StreamBlock.Event(0);
      sub_228E9F020();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t sub_228E949FC()
{
  uint64_t v2 = type metadata accessor for StreamBlock.Event(0);
  if ((*(unsigned char *)(v0 + *(int *)(v2 + 20) + 8) & 1) != 0 || (uint64_t result = sub_228E9F0D0(), !v1))
  {
    uint64_t v4 = v0 + *(int *)(v2 + 24);
    unint64_t v5 = *(void *)(v4 + 8);
    if (v5 >> 60 == 15) {
      return sub_228E9EF60();
    }
    uint64_t v6 = *(void *)v4;
    sub_228E8FB24(*(void *)v4, *(void *)(v4 + 8));
    sub_228E9F0B0();
    uint64_t result = sub_228E96044(v6, v5);
    if (!v1) {
      return sub_228E9EF60();
    }
  }
  return result;
}

double sub_228E94AF8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_228E9EF70();
  uint64_t v4 = *(int *)(a1 + 24);
  uint64_t v5 = a2 + *(int *)(a1 + 20);
  *(void *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 8) = 1;
  double result = 0.0;
  *(_OWORD *)(a2 + v4) = xmmword_228E9F6A0;
  return result;
}

unint64_t sub_228E94B40()
{
  return 0xD000000000000011;
}

uint64_t sub_228E94B5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_228E9EF80();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_228E94BC4(uint64_t a1)
{
  uint64_t v3 = sub_228E9EF80();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*sub_228E94C2C())()
{
  return nullsub_1;
}

uint64_t sub_228E94C4C()
{
  return sub_228E9492C();
}

uint64_t sub_228E94C64()
{
  return sub_228E949FC();
}

uint64_t sub_228E94C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E95AEC(&qword_2682B3278, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_228E94CF8@<X0>(uint64_t a1@<X8>)
{
  return sub_228E95808(&qword_2682B3150, (uint64_t)qword_2682B3510, a1);
}

uint64_t sub_228E94D1C(uint64_t a1)
{
  uint64_t v2 = sub_228E95AEC(&qword_2682B31E8, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_228E94D88()
{
  sub_228E95AEC(&qword_2682B31E8, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
  return sub_228E9F090();
}

uint64_t sub_228E94E08()
{
  uint64_t v0 = sub_228E9F130();
  __swift_allocate_value_buffer(v0, qword_2682B3528);
  __swift_project_value_buffer(v0, (uint64_t)qword_2682B3528);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682B3258);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682B3260) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_228E9F650;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "channelNames";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_228E9F110();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "bitsPerChannel";
  *(void *)(v10 + 8) = 14;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "bytesPerPayload";
  *((void *)v12 + 1) = 15;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "formatFlags";
  *((void *)v14 + 1) = 11;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "eventIndex";
  *((void *)v16 + 1) = 10;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "representsState";
  *((void *)v18 + 1) = 15;
  v18[16] = 2;
  v9();
  uint64_t v19 = (void *)(v5 + 6 * v2);
  uint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 7;
  *(void *)uint64_t v20 = "startingStatePayload";
  *((void *)v20 + 1) = 20;
  v20[16] = 2;
  v9();
  uint64_t v21 = (void *)(v5 + 7 * v2);
  uint64_t v22 = (char *)v21 + v1[14];
  void *v21 = 8;
  *(void *)uint64_t v22 = "events";
  *((void *)v22 + 1) = 6;
  v22[16] = 2;
  v9();
  return sub_228E9F120();
}

uint64_t sub_228E95144()
{
  uint64_t result = sub_228E9EFE0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_228E9F010();
          break;
        case 2:
        case 3:
        case 4:
        case 5:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_228E9F040();
          break;
        case 6:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_228E9EFF0();
          break;
        case 7:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_228E9F000();
          break;
        case 8:
          type metadata accessor for StreamBlock.Event(0);
          sub_228E95AEC(&qword_2682B31E8, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
          sub_228E9F050();
          break;
        default:
          break;
      }
      uint64_t result = sub_228E9EFE0();
    }
  }
  return result;
}

uint64_t sub_228E9534C()
{
  if (!*(void *)(*v0 + 16) || (uint64_t result = sub_228E9F0C0(), !v1))
  {
    unint64_t v3 = (int *)type metadata accessor for StreamBlock.EventBlock(0);
    if ((*((unsigned char *)v0 + v3[7] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
    {
      if ((*((unsigned char *)v0 + v3[8] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
      {
        if ((*((unsigned char *)v0 + v3[9] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
        {
          if ((*((unsigned char *)v0 + v3[10] + 4) & 1) != 0 || (uint64_t result = sub_228E9F0F0(), !v1))
          {
            if (*((unsigned char *)v0 + v3[11]) == 2 || (uint64_t result = sub_228E9F0A0(), !v1))
            {
              uint64_t v4 = (char *)v0 + v3[12];
              unint64_t v5 = *((void *)v4 + 1);
              if (v5 >> 60 == 15
                || (uint64_t v6 = *(void *)v4,
                    sub_228E8FB24(*(void *)v4, *((void *)v4 + 1)),
                    sub_228E9F0B0(),
                    uint64_t result = sub_228E96044(v6, v5),
                    !v1))
              {
                if (!*(void *)(v0[1] + 16)) {
                  return sub_228E9EF60();
                }
                type metadata accessor for StreamBlock.Event(0);
                sub_228E95AEC(&qword_2682B31E8, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
                uint64_t result = sub_228E9F100();
                if (!v1) {
                  return sub_228E9EF60();
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double sub_228E955AC@<D0>(int *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  *a2 = MEMORY[0x263F8EE78];
  a2[1] = v4;
  sub_228E9EF70();
  uint64_t v5 = a1[8];
  uint64_t v6 = (char *)a2 + a1[7];
  *(_DWORD *)uint64_t v6 = 0;
  v6[4] = 1;
  uint64_t v7 = (char *)a2 + v5;
  *(_DWORD *)uint64_t v7 = 0;
  v7[4] = 1;
  uint64_t v8 = a1[10];
  unint64_t v9 = (char *)a2 + a1[9];
  *(_DWORD *)unint64_t v9 = 0;
  v9[4] = 1;
  unint64_t v10 = (char *)a2 + v8;
  *(_DWORD *)unint64_t v10 = 0;
  v10[4] = 1;
  uint64_t v11 = a1[12];
  *((unsigned char *)a2 + a1[11]) = 2;
  double result = 0.0;
  *(_OWORD *)((char *)a2 + v11) = xmmword_228E9F6A0;
  return result;
}

unint64_t sub_228E9563C()
{
  return 0xD000000000000016;
}

uint64_t sub_228E95658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_228E9EF80();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_228E956C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_228E9EF80();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_228E95738()
{
  return sub_228E95144();
}

uint64_t sub_228E95750()
{
  return sub_228E9534C();
}

uint64_t sub_228E95768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E95AEC(&qword_2682B3280, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_228E957E4@<X0>(uint64_t a1@<X8>)
{
  return sub_228E95808(&qword_2682B3158, (uint64_t)qword_2682B3528, a1);
}

uint64_t sub_228E95808@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_228E9F130();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_228E958A4(uint64_t a1)
{
  uint64_t v2 = sub_228E95AEC(&qword_2682B31C8, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_228E95910()
{
  return sub_228E9F290();
}

uint64_t sub_228E95968()
{
  sub_228E95AEC(&qword_2682B31C8, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
  return sub_228E9F090();
}

uint64_t sub_228E959E4()
{
  return sub_228E9F290();
}

uint64_t sub_228E95A3C()
{
  return sub_228E95AEC(&qword_2682B31C0, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
}

uint64_t type metadata accessor for StreamBlock.EventBlock(uint64_t a1)
{
  return sub_228E95D6C(a1, (uint64_t *)&unk_2682B3298);
}

uint64_t sub_228E95AA4()
{
  return sub_228E95AEC(&qword_2682B31C8, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
}

uint64_t sub_228E95AEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_228E95B34()
{
  return sub_228E95AEC(&qword_2682B31D0, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
}

uint64_t sub_228E95B7C()
{
  return sub_228E95AEC(&qword_2682B31D8, (void (*)(uint64_t))type metadata accessor for StreamBlock.EventBlock);
}

uint64_t sub_228E95BC4()
{
  return sub_228E95AEC(&qword_2682B31E0, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
}

uint64_t type metadata accessor for StreamBlock.Event(uint64_t a1)
{
  return sub_228E95D6C(a1, (uint64_t *)&unk_2682B3288);
}

uint64_t sub_228E95C2C()
{
  return sub_228E95AEC(&qword_2682B31E8, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
}

uint64_t sub_228E95C74()
{
  return sub_228E95AEC(&qword_2682B31F0, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
}

uint64_t sub_228E95CBC()
{
  return sub_228E95AEC(&qword_2682B31F8, (void (*)(uint64_t))type metadata accessor for StreamBlock.Event);
}

uint64_t sub_228E95D04()
{
  return sub_228E95AEC(&qword_2682B3200, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
}

uint64_t type metadata accessor for StreamBlock.PCMBlock(uint64_t a1)
{
  return sub_228E95D6C(a1, (uint64_t *)&unk_2682B32A8);
}

uint64_t sub_228E95D6C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_228E95DA4()
{
  return sub_228E95AEC(&qword_2682B3208, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
}

uint64_t sub_228E95DEC()
{
  return sub_228E95AEC(&qword_2682B3210, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
}

uint64_t sub_228E95E34()
{
  return sub_228E95AEC(&qword_2682B3218, (void (*)(uint64_t))type metadata accessor for StreamBlock.PCMBlock);
}

uint64_t sub_228E95E7C()
{
  return sub_228E95AEC(&qword_2682B3220, (void (*)(uint64_t))type metadata accessor for StreamBlock);
}

uint64_t sub_228E95EC4()
{
  return sub_228E95AEC((unint64_t *)&qword_2682B3228, (void (*)(uint64_t))type metadata accessor for StreamBlock);
}

uint64_t sub_228E95F0C()
{
  return sub_228E95AEC(&qword_2682B3230, (void (*)(uint64_t))type metadata accessor for StreamBlock);
}

unint64_t sub_228E95F58()
{
  unint64_t result = qword_2682B3238;
  if (!qword_2682B3238)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2682B3240);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B3238);
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

uint64_t sub_228E95FFC()
{
  return sub_228E95AEC(&qword_2682B3248, (void (*)(uint64_t))type metadata accessor for StreamBlock);
}

uint64_t sub_228E96044(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_228E918B8(a1, a2);
  }
  return a1;
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

uint64_t sub_228E960F4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(char *, char *))
{
  a3(0);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15 == *(void *)(a2 + 16))
  {
    if (!v15 || a1 == a2)
    {
      char v19 = 1;
    }
    else
    {
      unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      uint64_t v17 = *(void *)(v12 + 72);
      uint64_t v18 = v15 - 1;
      do
      {
        sub_228E987D0(a1 + v16, (uint64_t)v14, a4);
        sub_228E987D0(a2 + v16, (uint64_t)v11, a4);
        char v19 = a5(v14, v11);
        sub_228E98838((uint64_t)v11, a4);
        sub_228E98838((uint64_t)v14, a4);
        BOOL v21 = v18-- != 0;
        if ((v19 & 1) == 0) {
          break;
        }
        v16 += v17;
      }
      while (v21);
    }
  }
  else
  {
    char v19 = 0;
  }
  return v19 & 1;
}

uint64_t sub_228E9627C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_228E9F210(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_228E9F210() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_228E96344(uint64_t a1, uint64_t a2)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t v122 = type metadata accessor for StreamBlock.Event(0);
  uint64_t v4 = MEMORY[0x270FA5388](v122);
  char v6 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v114 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 != *(void *)(a2 + 16)) {
    goto LABEL_141;
  }
  if (!v10 || a1 == a2)
  {
    char v106 = 1;
    return v106 & 1;
  }
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = *(void *)(v7 + 72);
  uint64_t v119 = a1;
  uint64_t v120 = v12;
  uint64_t v13 = v10 - 1;
  v117 = v6;
  while (1)
  {
    sub_228E987D0(a1 + v11, (uint64_t)v9, type metadata accessor for StreamBlock.Event);
    sub_228E987D0(a2 + v11, (uint64_t)v6, type metadata accessor for StreamBlock.Event);
    uint64_t v14 = *(int *)(v122 + 20);
    uint64_t v15 = (double *)&v9[v14];
    char v16 = v9[v14 + 8];
    uint64_t v17 = (double *)&v6[v14];
    int v18 = v6[v14 + 8];
    if (v16)
    {
      if (!v18) {
        goto LABEL_140;
      }
    }
    else
    {
      if (*v15 != *v17) {
        LOBYTE(v18) = 1;
      }
      if (v18) {
        goto LABEL_140;
      }
    }
    uint64_t v19 = *(int *)(v122 + 24);
    uint64_t v20 = *(void *)&v9[v19];
    unint64_t v21 = *(void *)&v9[v19 + 8];
    uint64_t v22 = (uint64_t *)&v6[v19];
    uint64_t v23 = *v22;
    unint64_t v24 = v22[1];
    if (v21 >> 60 == 15)
    {
      if (v24 >> 60 != 15) {
        break;
      }
      goto LABEL_130;
    }
    if (v24 >> 60 == 15) {
      break;
    }
    unint64_t v25 = v21 >> 62;
    uint64_t v26 = 0;
    switch(v21 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v20), v20))
        {
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
        }
        uint64_t v27 = v13;
        unint64_t v28 = v22[1];
        uint64_t v29 = a2;
        uint64_t v30 = *v22;
        uint64_t v26 = HIDWORD(v20) - (int)v20;
        sub_228E8FB24(v20, v21);
        sub_228E8FB24(v20, v21);
        uint64_t v23 = v30;
        a2 = v29;
        unint64_t v24 = v28;
LABEL_21:
        uint64_t v13 = v27;
        char v6 = v117;
        break;
      case 2uLL:
        uint64_t v32 = *(void *)(v20 + 16);
        uint64_t v31 = *(void *)(v20 + 24);
        uint64_t v26 = v31 - v32;
        if (__OFSUB__(v31, v32)) {
          goto LABEL_144;
        }
        uint64_t v27 = v13;
        unint64_t v33 = v21;
        unint64_t v34 = v24;
        uint64_t v35 = a2;
        uint64_t v36 = v23;
        sub_228E8FB24(v20, v33);
        sub_228E8FB24(v20, v33);
        uint64_t v23 = v36;
        a2 = v35;
        unint64_t v24 = v34;
        unint64_t v21 = v33;
        goto LABEL_21;
      case 3uLL:
        break;
      default:
        uint64_t v26 = BYTE6(v21);
        break;
    }
    uint64_t v121 = v20;
    unint64_t v37 = v24 >> 62;
    switch(v24 >> 62)
    {
      case 1uLL:
        LODWORD(v38) = HIDWORD(v23) - v23;
        if (__OFSUB__(HIDWORD(v23), v23)) {
          goto LABEL_145;
        }
        uint64_t v38 = (int)v38;
LABEL_27:
        if (v26 != v38)
        {
LABEL_138:
          uint64_t v112 = v121;
          sub_228E96044(v121, v21);
          uint64_t v110 = v112;
          unint64_t v111 = v21;
          goto LABEL_139;
        }
        if (v26 < 1)
        {
LABEL_38:
          uint64_t v47 = v121;
          sub_228E96044(v121, v21);
          sub_228E96044(v47, v21);
          a1 = v119;
        }
        else
        {
          a1 = v119;
          switch((int)v25)
          {
            case 1:
              uint64_t v116 = a2;
              uint64_t v48 = (int)v121;
              if ((int)v121 > v121 >> 32) {
                goto LABEL_147;
              }
              uint64_t v118 = v23;
              sub_228E8FB24(v23, v24);
              uint64_t v49 = sub_228E9EE80();
              if (v49)
              {
                uint64_t v50 = v49;
                uint64_t v51 = sub_228E9EEA0();
                if (__OFSUB__(v48, v51)) {
                  goto LABEL_149;
                }
                v115 = (char *)(v50 + v48 - v51);
              }
              else
              {
                v115 = 0;
              }
              a2 = v116;
              a1 = v119;
              sub_228E9EE90();
              if (!v37)
              {
                uint64_t v74 = v118;
                __s1[0] = v118;
                LOWORD(__s1[1]) = v24;
                BYTE2(__s1[1]) = BYTE2(v24);
                BYTE3(__s1[1]) = BYTE3(v24);
                BYTE4(__s1[1]) = BYTE4(v24);
                BYTE5(__s1[1]) = BYTE5(v24);
                if (!v115) {
                  goto LABEL_174;
                }
                int v62 = memcmp(v115, __s1, BYTE6(v24));
                goto LABEL_107;
              }
              if (v37 == 1)
              {
                uint64_t v68 = (int)v118;
                uint64_t v69 = (v118 >> 32) - (int)v118;
                if (v118 >> 32 < (int)v118) {
                  goto LABEL_158;
                }
                swift_retain();
                v70 = (char *)sub_228E9EE80();
                if (v70)
                {
                  uint64_t v71 = sub_228E9EEA0();
                  if (__OFSUB__(v68, v71)) {
                    goto LABEL_165;
                  }
                  v70 += v68 - v71;
                }
                a2 = v116;
                uint64_t v72 = sub_228E9EE90();
                if (v72 >= v69) {
                  size_t v73 = v69;
                }
                else {
                  size_t v73 = v72;
                }
                if (!v115) {
                  goto LABEL_179;
                }
                a1 = v119;
                if (!v70) {
                  goto LABEL_168;
                }
                int v62 = memcmp(v115, v70, v73);
                uint64_t v74 = v118;
                sub_228E96044(v118, v24);
LABEL_107:
                sub_228E96044(v74, v24);
LABEL_108:
                uint64_t v94 = v121;
                sub_228E96044(v121, v21);
                sub_228E96044(v94, v21);
                if (v62) {
                  goto LABEL_140;
                }
                goto LABEL_130;
              }
              uint64_t v95 = *(void *)(v118 + 16);
              uint64_t v116 = *(void *)(v118 + 24);
              swift_retain();
              swift_retain();
              v96 = (char *)sub_228E9EE80();
              if (v96)
              {
                uint64_t v97 = sub_228E9EEA0();
                if (__OFSUB__(v95, v97)) {
                  goto LABEL_164;
                }
                v96 += v95 - v97;
              }
              BOOL v41 = __OFSUB__(v116, v95);
              int64_t v98 = v116 - v95;
              if (v41) {
                goto LABEL_159;
              }
              uint64_t v99 = sub_228E9EE90();
              if (v99 >= v98) {
                size_t v100 = v98;
              }
              else {
                size_t v100 = v99;
              }
              if (!v115) {
                goto LABEL_175;
              }
              a1 = v119;
              if (!v96) {
                goto LABEL_176;
              }
              int v101 = memcmp(v115, v96, v100);
              swift_release();
              uint64_t v102 = v118;
              swift_release();
              sub_228E96044(v102, v24);
              uint64_t v103 = v121;
              sub_228E96044(v121, v21);
              sub_228E96044(v103, v21);
              if (v101) {
                goto LABEL_140;
              }
              break;
            case 2:
              v115 = *(char **)(v121 + 16);
              uint64_t v118 = v23;
              sub_228E8FB10(v23, v24);
              swift_retain();
              swift_retain();
              uint64_t v52 = sub_228E9EE80();
              uint64_t v116 = v21 & 0x3FFFFFFFFFFFFFFFLL;
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = sub_228E9EEA0();
                if (__OFSUB__(v115, v54)) {
                  goto LABEL_148;
                }
                v115 = &v115[v53 - v54];
              }
              else
              {
                v115 = 0;
              }
              sub_228E9EE90();
              a1 = v119;
              if (!v37)
              {
                uint64_t v86 = v118;
                __s1[0] = v118;
                LOWORD(__s1[1]) = v24;
                BYTE2(__s1[1]) = BYTE2(v24);
                BYTE3(__s1[1]) = BYTE3(v24);
                BYTE4(__s1[1]) = BYTE4(v24);
                BYTE5(__s1[1]) = BYTE5(v24);
                if (!v115) {
                  goto LABEL_171;
                }
                LODWORD(v115) = memcmp(v115, __s1, BYTE6(v24));
LABEL_128:
                swift_release();
                uint64_t v93 = v121;
                goto LABEL_129;
              }
              if (v37 == 1)
              {
                uint64_t v63 = (int)v118;
                uint64_t v64 = (v118 >> 32) - (int)v118;
                if (v118 >> 32 < (int)v118) {
                  goto LABEL_152;
                }
                swift_retain();
                uint64_t v65 = sub_228E9EE80();
                if (v65)
                {
                  uint64_t v114 = v65;
                  uint64_t v66 = sub_228E9EEA0();
                  if (__OFSUB__(v63, v66)) {
                    goto LABEL_163;
                  }
                  v67 = (const void *)(v114 + v63 - v66);
                }
                else
                {
                  v67 = 0;
                }
                uint64_t v104 = sub_228E9EE90();
                if (v104 >= v64) {
                  size_t v105 = v64;
                }
                else {
                  size_t v105 = v104;
                }
                if (!v115) {
                  goto LABEL_177;
                }
                a1 = v119;
                if (!v67) {
                  goto LABEL_178;
                }
                LODWORD(v115) = memcmp(v115, v67, v105);
                uint64_t v86 = v118;
                sub_228E96044(v118, v24);
                goto LABEL_128;
              }
              uint64_t v87 = *(void *)(v118 + 16);
              uint64_t v114 = *(void *)(v118 + 24);
              swift_retain();
              swift_retain();
              v88 = (char *)sub_228E9EE80();
              if (v88)
              {
                uint64_t v89 = sub_228E9EEA0();
                if (__OFSUB__(v87, v89)) {
                  goto LABEL_162;
                }
                v88 += v87 - v89;
              }
              BOOL v41 = __OFSUB__(v114, v87);
              int64_t v90 = v114 - v87;
              if (v41) {
                goto LABEL_157;
              }
              uint64_t v91 = sub_228E9EE90();
              if (v91 >= v90) {
                size_t v92 = v90;
              }
              else {
                size_t v92 = v91;
              }
              if (!v115) {
                goto LABEL_172;
              }
              a1 = v119;
              if (!v88) {
                goto LABEL_173;
              }
              LODWORD(v115) = memcmp(v115, v88, v92);
              swift_release();
              uint64_t v93 = v121;
              swift_release();
              swift_release();
              uint64_t v86 = v118;
LABEL_129:
              swift_release();
              sub_228E96044(v86, v24);
              sub_228E96044(v93, v21);
              sub_228E96044(v93, v21);
              if (v115) {
                goto LABEL_140;
              }
              goto LABEL_130;
            case 3:
              memset(__s1, 0, 14);
              if (!v37) {
                goto LABEL_56;
              }
              uint64_t v118 = v23;
              if (v37 == 1)
              {
                uint64_t v55 = (int)v23;
                uint64_t v116 = (v23 >> 32) - (int)v23;
                if (v23 >> 32 < (int)v23) {
                  goto LABEL_151;
                }
                sub_228E8FB24(v23, v24);
                uint64_t v56 = sub_228E9EE80();
                if (!v56) {
                  goto LABEL_167;
                }
                uint64_t v44 = v56;
                uint64_t v57 = sub_228E9EEA0();
                BOOL v41 = __OFSUB__(v55, v57);
                uint64_t v46 = v55 - v57;
                if (v41) {
                  goto LABEL_156;
                }
LABEL_51:
                uint64_t v58 = sub_228E9EE90();
                if (v58 >= v116) {
                  size_t v59 = v116;
                }
                else {
                  size_t v59 = v58;
                }
                int v60 = memcmp(__s1, (const void *)(v44 + v46), v59);
                sub_228E96044(v118, v24);
                uint64_t v61 = v121;
                sub_228E96044(v121, v21);
                sub_228E96044(v61, v21);
                a1 = v119;
                if (v60) {
                  goto LABEL_140;
                }
              }
              else
              {
                uint64_t v80 = *(void *)(v23 + 16);
                uint64_t v116 = *(void *)(v23 + 24);
                sub_228E8FB10(v23, v24);
                swift_retain();
                swift_retain();
                v76 = (char *)sub_228E9EE80();
                if (v76)
                {
                  uint64_t v81 = sub_228E9EEA0();
                  if (__OFSUB__(v80, v81)) {
                    goto LABEL_161;
                  }
                  v76 += v80 - v81;
                }
                BOOL v41 = __OFSUB__(v116, v80);
                int64_t v78 = v116 - v80;
                if (v41) {
                  goto LABEL_154;
                }
                uint64_t v79 = sub_228E9EE90();
                if (!v76) {
                  goto LABEL_170;
                }
LABEL_88:
                if (v79 >= v78) {
                  size_t v82 = v78;
                }
                else {
                  size_t v82 = v79;
                }
                int v83 = memcmp(__s1, v76, v82);
                swift_release();
                uint64_t v84 = v118;
                swift_release();
                sub_228E96044(v84, v24);
                uint64_t v85 = v121;
                sub_228E96044(v121, v21);
                sub_228E96044(v85, v21);
                a1 = v119;
                if (v83) {
                  goto LABEL_140;
                }
              }
              goto LABEL_130;
            default:
              __s1[0] = v121;
              LOWORD(__s1[1]) = v21;
              BYTE2(__s1[1]) = BYTE2(v21);
              BYTE3(__s1[1]) = BYTE3(v21);
              BYTE4(__s1[1]) = BYTE4(v21);
              BYTE5(__s1[1]) = BYTE5(v21);
              if (!v37)
              {
LABEL_56:
                uint64_t __s2 = v23;
                __int16 v124 = v24;
                char v125 = BYTE2(v24);
                char v126 = BYTE3(v24);
                char v127 = BYTE4(v24);
                char v128 = BYTE5(v24);
                int v62 = memcmp(__s1, &__s2, BYTE6(v24));
                goto LABEL_108;
              }
              uint64_t v118 = v23;
              if (v37 == 1)
              {
                uint64_t v42 = (int)v23;
                uint64_t v116 = (v23 >> 32) - (int)v23;
                if (v23 >> 32 < (int)v23) {
                  goto LABEL_150;
                }
                sub_228E8FB24(v23, v24);
                uint64_t v43 = sub_228E9EE80();
                if (!v43)
                {
                  sub_228E9EE90();
                  __break(1u);
LABEL_167:
                  sub_228E9EE90();
                  __break(1u);
LABEL_168:
                  __break(1u);
LABEL_169:
                  __break(1u);
LABEL_170:
                  __break(1u);
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
LABEL_178:
                  __break(1u);
LABEL_179:
                  __break(1u);
                  JUMPOUT(0x228E9701CLL);
                }
                uint64_t v44 = v43;
                uint64_t v45 = sub_228E9EEA0();
                BOOL v41 = __OFSUB__(v42, v45);
                uint64_t v46 = v42 - v45;
                if (v41) {
                  goto LABEL_155;
                }
                goto LABEL_51;
              }
              uint64_t v75 = *(void *)(v23 + 16);
              uint64_t v116 = *(void *)(v23 + 24);
              sub_228E8FB10(v23, v24);
              swift_retain();
              swift_retain();
              v76 = (char *)sub_228E9EE80();
              if (v76)
              {
                uint64_t v77 = sub_228E9EEA0();
                if (__OFSUB__(v75, v77)) {
                  goto LABEL_160;
                }
                v76 += v75 - v77;
              }
              BOOL v41 = __OFSUB__(v116, v75);
              int64_t v78 = v116 - v75;
              if (v41) {
                goto LABEL_153;
              }
              uint64_t v79 = sub_228E9EE90();
              if (!v76) {
                goto LABEL_169;
              }
              goto LABEL_88;
          }
        }
        break;
      case 2uLL:
        uint64_t v40 = *(void *)(v23 + 16);
        uint64_t v39 = *(void *)(v23 + 24);
        BOOL v41 = __OFSUB__(v39, v40);
        uint64_t v38 = v39 - v40;
        if (!v41) {
          goto LABEL_27;
        }
        goto LABEL_146;
      case 3uLL:
        if (!v26) {
          goto LABEL_38;
        }
        goto LABEL_138;
      default:
        uint64_t v38 = BYTE6(v24);
        goto LABEL_27;
    }
LABEL_130:
    sub_228E9EF80();
    sub_228E95AEC(&qword_2682B3268, MEMORY[0x263F50560]);
    char v106 = sub_228E9F160();
    sub_228E98838((uint64_t)v6, type metadata accessor for StreamBlock.Event);
    sub_228E98838((uint64_t)v9, type metadata accessor for StreamBlock.Event);
    BOOL v108 = v13-- != 0;
    if (v106)
    {
      v11 += v120;
      if (v108) {
        continue;
      }
    }
    return v106 & 1;
  }
  uint64_t v109 = *v22;
  sub_228E8FB10(v20, v21);
  sub_228E8FB10(v109, v24);
  sub_228E96044(v20, v21);
  uint64_t v110 = v109;
  unint64_t v111 = v24;
LABEL_139:
  sub_228E96044(v110, v111);
LABEL_140:
  sub_228E98838((uint64_t)v6, type metadata accessor for StreamBlock.Event);
  sub_228E98838((uint64_t)v9, type metadata accessor for StreamBlock.Event);
LABEL_141:
  char v106 = 0;
  return v106 & 1;
}

uint64_t sub_228E9704C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_228E8FB24(a2, a3);
      uint64_t v10 = (char *)sub_228E9EE80();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_228E9EEA0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_228E9EE90();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x228E972B0);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_228E918B8(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_228E9EE80();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_228E9EEA0();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_228E9EE90();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_228E972C0(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 1;
      break;
    case 3:
      uint64_t result = 2;
      break;
    case 7:
      uint64_t result = 3;
      break;
    case 15:
      uint64_t result = 4;
      break;
    default:
      uint64_t result = 7;
      break;
  }
  return result;
}

uint64_t sub_228E97378(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_228E9704C((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_228E97450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_228E9EE80();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_228E9EEA0();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_228E9EE90();
  sub_228E9704C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_228E97508(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x228E97770);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_228E8FB24(a3, a4);
                  sub_228E8FB24(a1, a2);
                  char v17 = sub_228E97450((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_228E918B8(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_228E8FB24(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_228E97450(v21, v22, v20, a3, a4);
                  sub_228E918B8(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_228E8FB24(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_228E8FB24(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_228E97378(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_228E918B8(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_228E977A0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_228E9EF80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v68[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v68[-v9];
  BOOL v11 = (int *)type metadata accessor for StreamBlock(0);
  uint64_t v12 = v11[7];
  uint64_t v13 = (uint64_t *)((char *)a1 + v12);
  uint64_t v14 = *(uint64_t *)((char *)a1 + v12 + 8);
  uint64_t v15 = (uint64_t *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_33;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_33;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = sub_228E9F210(), LOBYTE(v19) = 0, (v18 & 1) != 0))
  {
LABEL_10:
    uint64_t v20 = v11[8];
    uint64_t v21 = (uint64_t *)((char *)a1 + v20);
    uint64_t v22 = *(uint64_t *)((char *)a1 + v20 + 8);
    int v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    if (v22)
    {
      if (!v24) {
        goto LABEL_33;
      }
      if (*v21 != *v23 || v22 != v24)
      {
        char v26 = sub_228E9F210();
        LOBYTE(v19) = 0;
        if ((v26 & 1) == 0) {
          return v19 & 1;
        }
      }
    }
    else if (v24)
    {
      goto LABEL_33;
    }
    uint64_t v27 = v11[9];
    char v28 = (uint64_t *)((char *)a1 + v27);
    uint64_t v29 = *(uint64_t *)((char *)a1 + v27 + 8);
    char v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    if (v29)
    {
      if (!v31) {
        goto LABEL_33;
      }
      if (*v28 != *v30 || v29 != v31)
      {
        char v33 = sub_228E9F210();
        LOBYTE(v19) = 0;
        if ((v33 & 1) == 0) {
          return v19 & 1;
        }
      }
    }
    else if (v31)
    {
      goto LABEL_33;
    }
    uint64_t v70 = v5;
    uint64_t v34 = v11[10];
    uint64_t v35 = *(uint64_t *)((char *)a1 + v34);
    unint64_t v36 = *(uint64_t *)((char *)a1 + v34 + 8);
    unint64_t v37 = (uint64_t *)((char *)a2 + v34);
    uint64_t v38 = *v37;
    unint64_t v39 = v37[1];
    if (v36 >> 60 == 15)
    {
      if (v39 >> 60 != 15) {
        goto LABEL_32;
      }
    }
    else
    {
      if (v39 >> 60 == 15) {
        goto LABEL_32;
      }
      sub_228E8FB10(v35, v36);
      sub_228E8FB10(v38, v39);
      int v69 = sub_228E97508(v35, v36, v38, v39);
      sub_228E96044(v38, v39);
      sub_228E96044(v35, v36);
      if ((v69 & 1) == 0) {
        goto LABEL_33;
      }
    }
    uint64_t v41 = v11[11];
    uint64_t v42 = (uint64_t *)((char *)a1 + v41);
    uint64_t v43 = *(uint64_t *)((char *)a1 + v41 + 8);
    uint64_t v44 = (uint64_t *)((char *)a2 + v41);
    uint64_t v45 = v44[1];
    if (v43)
    {
      if (!v45) {
        goto LABEL_33;
      }
      if (*v42 != *v44 || v43 != v45)
      {
        char v46 = sub_228E9F210();
        LOBYTE(v19) = 0;
        if ((v46 & 1) == 0) {
          return v19 & 1;
        }
      }
    }
    else if (v45)
    {
      goto LABEL_33;
    }
    uint64_t v47 = v11[12];
    uint64_t v35 = *(uint64_t *)((char *)a1 + v47);
    unint64_t v36 = *(uint64_t *)((char *)a1 + v47 + 8);
    uint64_t v48 = (uint64_t *)((char *)a2 + v47);
    uint64_t v38 = *v48;
    unint64_t v39 = v48[1];
    if (v36 >> 60 == 15)
    {
      if (v39 >> 60 == 15)
      {
LABEL_48:
        uint64_t v49 = v11[13];
        uint64_t v50 = (double *)((char *)a1 + v49);
        char v51 = *((unsigned char *)a1 + v49 + 8);
        uint64_t v52 = (double *)((char *)a2 + v49);
        int v19 = *((unsigned __int8 *)a2 + v49 + 8);
        if (v51)
        {
          if (!v19) {
            return v19 & 1;
          }
        }
        else
        {
          if (*v50 != *v52) {
            LOBYTE(v19) = 1;
          }
          if (v19) {
            goto LABEL_33;
          }
        }
        uint64_t v53 = v11[14];
        uint64_t v54 = (double *)((char *)a1 + v53);
        char v55 = *((unsigned char *)a1 + v53 + 8);
        uint64_t v56 = (double *)((char *)a2 + v53);
        int v19 = *((unsigned __int8 *)a2 + v53 + 8);
        if (v55)
        {
          if (!v19) {
            return v19 & 1;
          }
        }
        else
        {
          if (*v54 != *v56) {
            LOBYTE(v19) = 1;
          }
          if (v19) {
            goto LABEL_33;
          }
        }
        uint64_t v57 = v11[15];
        uint64_t v58 = (_DWORD *)((char *)a1 + v57);
        char v59 = *((unsigned char *)a1 + v57 + 4);
        int v60 = (_DWORD *)((char *)a2 + v57);
        int v19 = *((unsigned __int8 *)a2 + v57 + 4);
        if (v59)
        {
          if (!v19) {
            return v19 & 1;
          }
        }
        else
        {
          if (*v58 != *v60) {
            LOBYTE(v19) = 1;
          }
          if (v19) {
            goto LABEL_33;
          }
        }
        uint64_t v61 = v11[16];
        int v62 = *((unsigned __int8 *)a1 + v61);
        int v63 = *((unsigned __int8 *)a2 + v61);
        if (v62 == 2)
        {
          if (v63 == 2) {
            goto LABEL_71;
          }
        }
        else if (v63 != 2 && ((((v63 & 1) == 0) ^ v62) & 1) != 0)
        {
LABEL_71:
          if (sub_228E960F4(*a1, *a2, (void (*)(void))type metadata accessor for StreamBlock.PCMBlock, type metadata accessor for StreamBlock.PCMBlock, (uint64_t (*)(char *, char *))sub_228E97D38) & 1) != 0&& (sub_228E960F4(a1[1], a2[1], (void (*)(void))type metadata accessor for StreamBlock.EventBlock, type metadata accessor for StreamBlock.EventBlock, (uint64_t (*)(char *, char *))sub_228E9842C))
          {
            uint64_t v64 = v70;
            uint64_t v65 = *(void (**)(unsigned char *, char *, uint64_t))(v70 + 16);
            v65(v10, (char *)a1 + v11[6], v4);
            v65(v8, (char *)a2 + v11[6], v4);
            sub_228E95AEC(&qword_2682B3268, MEMORY[0x263F50560]);
            char v66 = sub_228E9F160();
            v67 = *(void (**)(unsigned char *, uint64_t))(v64 + 8);
            v67(v8, v4);
            v67(v10, v4);
            LOBYTE(v19) = v66;
            return v19 & 1;
          }
        }
LABEL_33:
        LOBYTE(v19) = 0;
        return v19 & 1;
      }
    }
    else if (v39 >> 60 != 15)
    {
      sub_228E8FB10(v35, v36);
      sub_228E8FB10(v38, v39);
      int v69 = sub_228E97508(v35, v36, v38, v39);
      sub_228E96044(v38, v39);
      sub_228E96044(v35, v36);
      if ((v69 & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_48;
    }
LABEL_32:
    sub_228E8FB10(v35, v36);
    sub_228E8FB10(v38, v39);
    sub_228E96044(v35, v36);
    sub_228E96044(v38, v39);
    goto LABEL_33;
  }
  return v19 & 1;
}

uint64_t sub_228E97D38(void **a1, char *a2)
{
  uint64_t v4 = sub_228E9EF80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v69[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v69[-v9];
  if ((sub_228E9627C(*a1, *(void **)a2) & 1) == 0) {
    goto LABEL_61;
  }
  BOOL v11 = (int *)type metadata accessor for StreamBlock.PCMBlock(0);
  uint64_t v12 = v11;
  uint64_t v13 = v11[6];
  uint64_t v14 = (_DWORD *)((char *)a1 + v13);
  char v15 = *((unsigned char *)a1 + v13 + 4);
  uint64_t v16 = &a2[v13];
  int v17 = a2[v13 + 4];
  if (v15)
  {
    if (!v17) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v14 != *(_DWORD *)v16) {
      LOBYTE(v17) = 1;
    }
    if (v17) {
      goto LABEL_61;
    }
  }
  uint64_t v18 = v11[7];
  int v19 = (_DWORD *)((char *)a1 + v18);
  char v20 = *((unsigned char *)a1 + v18 + 4);
  uint64_t v21 = &a2[v18];
  int v22 = a2[v18 + 4];
  if (v20)
  {
    if (!v22) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v19 != *(_DWORD *)v21) {
      LOBYTE(v22) = 1;
    }
    if (v22) {
      goto LABEL_61;
    }
  }
  uint64_t v23 = v11[8];
  uint64_t v24 = (_DWORD *)((char *)a1 + v23);
  char v25 = *((unsigned char *)a1 + v23 + 4);
  char v26 = &a2[v23];
  int v27 = a2[v23 + 4];
  if (v25)
  {
    if (!v27) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v24 != *(_DWORD *)v26) {
      LOBYTE(v27) = 1;
    }
    if (v27) {
      goto LABEL_61;
    }
  }
  uint64_t v28 = v11[9];
  uint64_t v29 = (double *)((char *)a1 + v28);
  char v30 = *((unsigned char *)a1 + v28 + 8);
  uint64_t v31 = (double *)&a2[v28];
  int v32 = a2[v28 + 8];
  if (v30)
  {
    if (!v32) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v29 != *v31) {
      LOBYTE(v32) = 1;
    }
    if (v32) {
      goto LABEL_61;
    }
  }
  uint64_t v33 = v11[10];
  uint64_t v34 = (double *)((char *)a1 + v33);
  char v35 = *((unsigned char *)a1 + v33 + 8);
  unint64_t v36 = (double *)&a2[v33];
  int v37 = a2[v33 + 8];
  if (v35)
  {
    if (!v37) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v34 != *v36) {
      LOBYTE(v37) = 1;
    }
    if (v37) {
      goto LABEL_61;
    }
  }
  uint64_t v38 = v11[11];
  unint64_t v39 = (double *)((char *)a1 + v38);
  char v40 = *((unsigned char *)a1 + v38 + 8);
  uint64_t v41 = (double *)&a2[v38];
  int v42 = a2[v38 + 8];
  if (v40)
  {
    if (!v42) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v39 != *v41) {
      LOBYTE(v42) = 1;
    }
    if (v42) {
      goto LABEL_61;
    }
  }
  uint64_t v43 = v11[12];
  uint64_t v44 = (double *)((char *)a1 + v43);
  char v45 = *((unsigned char *)a1 + v43 + 8);
  char v46 = (double *)&a2[v43];
  int v47 = a2[v43 + 8];
  if (v45)
  {
    if (!v47) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v44 != *v46) {
      LOBYTE(v47) = 1;
    }
    if (v47) {
      goto LABEL_61;
    }
  }
  uint64_t v48 = v11[13];
  uint64_t v49 = (_DWORD *)((char *)a1 + v48);
  char v50 = *((unsigned char *)a1 + v48 + 4);
  char v51 = &a2[v48];
  int v52 = a2[v48 + 4];
  if (v50)
  {
    if (!v52) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v49 != *(_DWORD *)v51) {
      LOBYTE(v52) = 1;
    }
    if (v52) {
      goto LABEL_61;
    }
  }
  uint64_t v53 = v11[14];
  uint64_t v54 = (_DWORD *)((char *)a1 + v53);
  char v55 = *((unsigned char *)a1 + v53 + 4);
  uint64_t v56 = &a2[v53];
  int v57 = a2[v53 + 4];
  if (v55)
  {
    if (!v57) {
      goto LABEL_61;
    }
  }
  else
  {
    if (*v54 != *(_DWORD *)v56) {
      LOBYTE(v57) = 1;
    }
    if (v57) {
      goto LABEL_61;
    }
  }
  uint64_t v58 = v11[15];
  uint64_t v59 = *(uint64_t *)((char *)a1 + v58);
  unint64_t v60 = *(unint64_t *)((char *)a1 + v58 + 8);
  uint64_t v61 = (uint64_t *)&a2[v58];
  uint64_t v62 = *v61;
  unint64_t v63 = v61[1];
  if (v60 >> 60 == 15)
  {
    if (v63 >> 60 == 15) {
      goto LABEL_64;
    }
    goto LABEL_60;
  }
  if (v63 >> 60 == 15)
  {
LABEL_60:
    uint64_t v64 = v59;
    sub_228E8FB10(v59, v60);
    sub_228E8FB10(v62, v63);
    sub_228E96044(v64, v60);
    sub_228E96044(v62, v63);
    goto LABEL_61;
  }
  uint64_t v71 = v59;
  sub_228E8FB10(v59, v60);
  sub_228E8FB10(v62, v63);
  int v70 = sub_228E97508(v71, v60, v62, v63);
  sub_228E96044(v62, v63);
  sub_228E96044(v71, v60);
  if (v70)
  {
LABEL_64:
    v67 = *(void (**)(unsigned char *, char *, uint64_t))(v5 + 16);
    v67(v10, (char *)a1 + v12[5], v4);
    v67(v8, &a2[v12[5]], v4);
    sub_228E95AEC(&qword_2682B3268, MEMORY[0x263F50560]);
    char v65 = sub_228E9F160();
    uint64_t v68 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
    v68(v8, v4);
    v68(v10, v4);
    return v65 & 1;
  }
LABEL_61:
  char v65 = 0;
  return v65 & 1;
}

uint64_t sub_228E98194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E9EF80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v27[-v9];
  uint64_t v11 = type metadata accessor for StreamBlock.Event(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = (double *)(a1 + v12);
  char v14 = *(unsigned char *)(a1 + v12 + 8);
  char v15 = (double *)(a2 + v12);
  int v16 = *(unsigned __int8 *)(a2 + v12 + 8);
  if (v14)
  {
    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
    if (*v13 != *v15) {
      LOBYTE(v16) = 1;
    }
    if (v16) {
      goto LABEL_12;
    }
  }
  uint64_t v17 = *(int *)(v11 + 24);
  uint64_t v18 = *(void *)(a1 + v17);
  unint64_t v19 = *(void *)(a1 + v17 + 8);
  char v20 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v20;
  unint64_t v22 = v20[1];
  if (v19 >> 60 == 15)
  {
    if (v22 >> 60 == 15) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (v22 >> 60 == 15)
  {
LABEL_11:
    sub_228E8FB10(v18, v19);
    sub_228E8FB10(v21, v22);
    sub_228E96044(v18, v19);
    sub_228E96044(v21, v22);
    goto LABEL_12;
  }
  sub_228E8FB10(v18, v19);
  sub_228E8FB10(v21, v22);
  int v28 = sub_228E97508(v18, v19, v21, v22);
  sub_228E96044(v21, v22);
  sub_228E96044(v18, v19);
  if (v28)
  {
LABEL_15:
    char v25 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
    v25(v10, a1, v4);
    v25(v8, a2, v4);
    sub_228E95AEC(&qword_2682B3268, MEMORY[0x263F50560]);
    char v23 = sub_228E9F160();
    char v26 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
    v26(v8, v4);
    v26(v10, v4);
    return v23 & 1;
  }
LABEL_12:
  char v23 = 0;
  return v23 & 1;
}

uint64_t sub_228E9842C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E9EF80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v47[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v47[-v9];
  if ((sub_228E9627C(*(void **)a1, *(void **)a2) & 1) == 0) {
    goto LABEL_39;
  }
  uint64_t v11 = (int *)type metadata accessor for StreamBlock.EventBlock(0);
  uint64_t v12 = v11;
  uint64_t v13 = v11[7];
  char v14 = (_DWORD *)(a1 + v13);
  char v15 = *(unsigned char *)(a1 + v13 + 4);
  int v16 = (_DWORD *)(a2 + v13);
  int v17 = *(unsigned __int8 *)(a2 + v13 + 4);
  if (v15)
  {
    if (!v17) {
      goto LABEL_39;
    }
  }
  else
  {
    if (*v14 != *v16) {
      LOBYTE(v17) = 1;
    }
    if (v17) {
      goto LABEL_39;
    }
  }
  uint64_t v18 = v11[8];
  unint64_t v19 = (_DWORD *)(a1 + v18);
  char v20 = *(unsigned char *)(a1 + v18 + 4);
  uint64_t v21 = (_DWORD *)(a2 + v18);
  int v22 = *(unsigned __int8 *)(a2 + v18 + 4);
  if (v20)
  {
    if (!v22) {
      goto LABEL_39;
    }
  }
  else
  {
    if (*v19 != *v21) {
      LOBYTE(v22) = 1;
    }
    if (v22) {
      goto LABEL_39;
    }
  }
  uint64_t v23 = v11[9];
  uint64_t v24 = (_DWORD *)(a1 + v23);
  char v25 = *(unsigned char *)(a1 + v23 + 4);
  char v26 = (_DWORD *)(a2 + v23);
  int v27 = *(unsigned __int8 *)(a2 + v23 + 4);
  if (v25)
  {
    if (!v27) {
      goto LABEL_39;
    }
  }
  else
  {
    if (*v24 != *v26) {
      LOBYTE(v27) = 1;
    }
    if (v27) {
      goto LABEL_39;
    }
  }
  uint64_t v28 = v11[10];
  uint64_t v29 = (_DWORD *)(a1 + v28);
  char v30 = *(unsigned char *)(a1 + v28 + 4);
  uint64_t v31 = (_DWORD *)(a2 + v28);
  int v32 = *(unsigned __int8 *)(a2 + v28 + 4);
  if (v30)
  {
    if (!v32) {
      goto LABEL_39;
    }
  }
  else
  {
    if (*v29 != *v31) {
      LOBYTE(v32) = 1;
    }
    if (v32) {
      goto LABEL_39;
    }
  }
  uint64_t v33 = v11[11];
  int v34 = *(unsigned __int8 *)(a1 + v33);
  int v35 = *(unsigned __int8 *)(a2 + v33);
  if (v34 == 2)
  {
    if (v35 != 2) {
      goto LABEL_39;
    }
  }
  else if (v35 == 2 || ((((v35 & 1) == 0) ^ v34) & 1) == 0)
  {
    goto LABEL_39;
  }
  uint64_t v36 = v11[12];
  uint64_t v37 = *(void *)(a1 + v36);
  unint64_t v38 = *(void *)(a1 + v36 + 8);
  unint64_t v39 = (uint64_t *)(a2 + v36);
  uint64_t v40 = *v39;
  unint64_t v41 = v39[1];
  if (v38 >> 60 != 15)
  {
    if (v41 >> 60 == 15) {
      goto LABEL_35;
    }
    uint64_t v49 = v37;
    sub_228E8FB10(v37, v38);
    sub_228E8FB10(v40, v41);
    int v48 = sub_228E97508(v49, v38, v40, v41);
    sub_228E96044(v40, v41);
    sub_228E96044(v49, v38);
    if (v48) {
      goto LABEL_37;
    }
LABEL_39:
    char v44 = 0;
    return v44 & 1;
  }
  if (v41 >> 60 != 15)
  {
LABEL_35:
    uint64_t v42 = v37;
    sub_228E8FB10(v37, v38);
    sub_228E8FB10(v40, v41);
    sub_228E96044(v42, v38);
    sub_228E96044(v40, v41);
    goto LABEL_39;
  }
LABEL_37:
  if ((sub_228E96344(*(void *)(a1 + 8), *(void *)(a2 + 8)) & 1) == 0) {
    goto LABEL_39;
  }
  uint64_t v43 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
  v43(v10, a1 + v12[6], v4);
  v43(v8, a2 + v12[6], v4);
  sub_228E95AEC(&qword_2682B3268, MEMORY[0x263F50560]);
  char v44 = sub_228E9F160();
  char v45 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v45(v8, v4);
  v45(v10, v4);
  return v44 & 1;
}

uint64_t sub_228E987D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_228E98838(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StreamBlock.FormatFlag(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StreamBlock.FormatFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228E98A04);
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

uint64_t sub_228E98A2C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_228E98A34(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StreamBlock.FormatFlag()
{
  return &type metadata for StreamBlock.FormatFlag;
}

uint64_t *sub_228E98A4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_228E9EF80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *(void *)uint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    uint64_t v12 = (char *)a1 + v9;
    uint64_t v13 = (uint64_t *)((char *)a2 + v9);
    unint64_t v14 = *(uint64_t *)((char *)a2 + v9 + 8);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    }
    else
    {
      uint64_t v16 = *v13;
      sub_228E8FB24(*v13, v14);
      *(void *)uint64_t v12 = v16;
      *((void *)v12 + 1) = v14;
    }
  }
  return a1;
}

uint64_t sub_228E98B60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228E9EF80();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  unsigned int v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = *v6;
    return sub_228E918B8(v8, v7);
  }
  return result;
}

uint64_t sub_228E98BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_228E9EF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = (uint64_t *)(a2 + v8);
  unint64_t v13 = *(void *)(a2 + v8 + 8);
  if (v13 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  }
  else
  {
    uint64_t v14 = *v12;
    sub_228E8FB24(*v12, v13);
    *(void *)uint64_t v11 = v14;
    *(void *)(v11 + 8) = v13;
  }
  return a1;
}

uint64_t sub_228E98CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_228E9EF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  *(unsigned char *)(v8 + 8) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (uint64_t *)(a1 + v11);
  unint64_t v13 = (uint64_t *)(a2 + v11);
  unint64_t v14 = *(void *)(a2 + v11 + 8);
  if (*(void *)(a1 + v11 + 8) >> 60 != 15)
  {
    if (v14 >> 60 != 15)
    {
      uint64_t v16 = *v13;
      sub_228E8FB24(v16, v14);
      uint64_t v17 = *v12;
      unint64_t v18 = v12[1];
      *uint64_t v12 = v16;
      v12[1] = v14;
      sub_228E918B8(v17, v18);
      return a1;
    }
    sub_228E924BC((uint64_t)v12);
    goto LABEL_6;
  }
  if (v14 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    return a1;
  }
  uint64_t v15 = *v13;
  sub_228E8FB24(v15, v14);
  *uint64_t v12 = v15;
  v12[1] = v14;
  return a1;
}

uint64_t sub_228E98DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_228E9EF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_228E98E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_228E9EF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  uint64_t v11 = (uint64_t *)(a1 + v8);
  uint64_t v12 = (uint64_t *)(a2 + v8);
  unint64_t v13 = *(void *)(a1 + v8 + 8);
  if (v13 >> 60 != 15)
  {
    unint64_t v14 = v12[1];
    if (v14 >> 60 != 15)
    {
      uint64_t v15 = *v11;
      uint64_t *v11 = *v12;
      v11[1] = v14;
      sub_228E918B8(v15, v13);
      return a1;
    }
    sub_228E924BC((uint64_t)v11);
  }
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  return a1;
}

uint64_t sub_228E98F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_228E98F44);
}

uint64_t sub_228E98F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_228E9EF80();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
    BOOL v11 = ((4 * v10) & 0xC) == 0;
    unsigned int v12 = ((4 * v10) & 0xC | (v10 >> 2)) ^ 0xF;
    if (v11) {
      return 0;
    }
    else {
      return v12;
    }
  }
}

uint64_t sub_228E99010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_228E99024);
}

uint64_t sub_228E99024(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_228E9EF80();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    BOOL v11 = (void *)(a1 + *(int *)(a4 + 24));
    void *v11 = 0;
    v11[1] = (unint64_t)((~a2 >> 2) & 3 | (4 * ~a2)) << 60;
  }
  return result;
}

uint64_t sub_228E990F0()
{
  uint64_t result = sub_228E9EF80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_228E99190(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_228E9EF80();
    unsigned int v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (char *)v7 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
    v15[4] = v16[4];
    uint64_t v17 = (char *)v7 + v14;
    unint64_t v18 = (char *)a2 + v14;
    *(_DWORD *)uint64_t v17 = *(_DWORD *)v18;
    v17[4] = v18[4];
    uint64_t v19 = a3[9];
    uint64_t v20 = a3[10];
    uint64_t v21 = (char *)v7 + v19;
    int v22 = (char *)a2 + v19;
    *(_DWORD *)uint64_t v21 = *(_DWORD *)v22;
    v21[4] = v22[4];
    uint64_t v23 = (char *)v7 + v20;
    uint64_t v24 = (char *)a2 + v20;
    v23[4] = v24[4];
    *(_DWORD *)uint64_t v23 = *(_DWORD *)v24;
    uint64_t v25 = a3[12];
    char v26 = (char *)v7 + v25;
    int v27 = (char *)a2 + v25;
    *((unsigned char *)v7 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    unint64_t v28 = *((void *)v27 + 1);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)char v26 = *(_OWORD *)v27;
    }
    else
    {
      uint64_t v29 = *(void *)v27;
      sub_228E8FB24(*(void *)v27, *((void *)v27 + 1));
      *(void *)char v26 = v29;
      *((void *)v26 + 1) = v28;
    }
  }
  return v7;
}

uint64_t sub_228E99340(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_228E9EF80();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(a2 + 48));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *v7;
    return sub_228E918B8(v9, v8);
  }
  return result;
}

void *sub_228E993F8(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  unint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_228E9EF80();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (char *)a1 + v12;
  uint64_t v15 = (char *)a2 + v12;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  uint64_t v16 = (char *)a1 + v13;
  uint64_t v17 = (char *)a2 + v13;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)v17;
  v16[4] = v17[4];
  uint64_t v18 = a3[9];
  uint64_t v19 = a3[10];
  uint64_t v20 = (char *)a1 + v18;
  uint64_t v21 = (char *)a2 + v18;
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  v20[4] = v21[4];
  int v22 = (char *)a1 + v19;
  uint64_t v23 = (char *)a2 + v19;
  v22[4] = v23[4];
  *(_DWORD *)int v22 = *(_DWORD *)v23;
  uint64_t v24 = a3[12];
  uint64_t v25 = (char *)a1 + v24;
  char v26 = (char *)a2 + v24;
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  unint64_t v27 = *((void *)v26 + 1);
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  }
  else
  {
    uint64_t v28 = *(void *)v26;
    sub_228E8FB24(*(void *)v26, *((void *)v26 + 1));
    *(void *)uint64_t v25 = v28;
    *((void *)v25 + 1) = v27;
  }
  return a1;
}

void *sub_228E99554(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  int v13 = *(_DWORD *)v12;
  v11[4] = v12[4];
  *(_DWORD *)uint64_t v11 = v13;
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  LOBYTE(v13) = v16[4];
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
  v15[4] = v13;
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  LOBYTE(v13) = v19[4];
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v13;
  uint64_t v20 = a3[10];
  uint64_t v21 = (char *)a1 + v20;
  int v22 = (char *)a2 + v20;
  LOBYTE(v13) = v22[4];
  *(_DWORD *)uint64_t v21 = *(_DWORD *)v22;
  v21[4] = v13;
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v23 = a3[12];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  unint64_t v26 = *(void *)((char *)a2 + v23 + 8);
  if (*(void *)((char *)a1 + v23 + 8) >> 60 != 15)
  {
    if (v26 >> 60 != 15)
    {
      uint64_t v28 = *v25;
      sub_228E8FB24(v28, v26);
      uint64_t v29 = *v24;
      unint64_t v30 = v24[1];
      *uint64_t v24 = v28;
      v24[1] = v26;
      sub_228E918B8(v29, v30);
      return a1;
    }
    sub_228E924BC((uint64_t)v24);
    goto LABEL_6;
  }
  if (v26 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    return a1;
  }
  uint64_t v27 = *v25;
  sub_228E8FB24(v27, v26);
  *uint64_t v24 = v27;
  v24[1] = v26;
  return a1;
}

_OWORD *sub_228E99704(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v10;
  int v13 = (char *)a2 + v10;
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  uint64_t v16 = a3[9];
  uint64_t v17 = a3[10];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  uint64_t v20 = (char *)a1 + v17;
  uint64_t v21 = (char *)a2 + v17;
  v20[4] = v21[4];
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  uint64_t v22 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  return a1;
}

void *sub_228E9980C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v10;
  int v13 = (char *)a2 + v10;
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  uint64_t v16 = a3[9];
  uint64_t v17 = a3[10];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  uint64_t v20 = (char *)a1 + v17;
  uint64_t v21 = (char *)a2 + v17;
  v20[4] = v21[4];
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  uint64_t v22 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  unint64_t v25 = *(void *)((char *)a1 + v22 + 8);
  if (v25 >> 60 != 15)
  {
    unint64_t v26 = v24[1];
    if (v26 >> 60 != 15)
    {
      uint64_t v27 = *v23;
      uint64_t *v23 = *v24;
      v23[1] = v26;
      sub_228E918B8(v27, v25);
      return a1;
    }
    sub_228E924BC((uint64_t)v23);
  }
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  return a1;
}

uint64_t sub_228E99970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_228E99984);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_228E9EF80();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_228E99A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_228E99A4C);
}

void *__swift_store_extra_inhabitant_indexTm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_228E9EF80();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_228E99AF8()
{
  uint64_t result = sub_228E9EF80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_228E99BB8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_228E9EF80();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v7 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
    v15[4] = v16[4];
    uint64_t v17 = (char *)v7 + v14;
    uint64_t v18 = (char *)a2 + v14;
    *(_DWORD *)uint64_t v17 = *(_DWORD *)v18;
    v17[4] = v18[4];
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v7 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *(_DWORD *)uint64_t v21 = *(_DWORD *)v22;
    v21[4] = v22[4];
    uint64_t v23 = (char *)v7 + v20;
    uint64_t v24 = (char *)a2 + v20;
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = a3[10];
    uint64_t v26 = a3[11];
    uint64_t v27 = (char *)v7 + v25;
    uint64_t v28 = (char *)a2 + v25;
    uint64_t v29 = *(void *)v28;
    v27[8] = v28[8];
    *(void *)uint64_t v27 = v29;
    unint64_t v30 = (char *)v7 + v26;
    uint64_t v31 = (char *)a2 + v26;
    v30[8] = v31[8];
    *(void *)unint64_t v30 = *(void *)v31;
    uint64_t v32 = a3[12];
    uint64_t v33 = a3[13];
    int v34 = (char *)v7 + v32;
    int v35 = (char *)a2 + v32;
    v34[8] = v35[8];
    *(void *)int v34 = *(void *)v35;
    uint64_t v36 = (char *)v7 + v33;
    uint64_t v37 = (char *)a2 + v33;
    v36[4] = v37[4];
    *(_DWORD *)uint64_t v36 = *(_DWORD *)v37;
    uint64_t v38 = a3[14];
    uint64_t v39 = a3[15];
    uint64_t v40 = (char *)v7 + v38;
    unint64_t v41 = (char *)a2 + v38;
    v40[4] = v41[4];
    LODWORD(v29) = *(_DWORD *)v41;
    uint64_t v42 = (char *)v7 + v39;
    uint64_t v43 = (uint64_t *)((char *)a2 + v39);
    *(_DWORD *)uint64_t v40 = v29;
    unint64_t v44 = *(uint64_t *)((char *)a2 + v39 + 8);
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
    }
    else
    {
      uint64_t v45 = *v43;
      sub_228E8FB24(*v43, v44);
      *(void *)uint64_t v42 = v45;
      *((void *)v42 + 1) = v44;
    }
  }
  return v7;
}

uint64_t sub_228E99DD0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_228E9EF80();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(a2 + 60));
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *v7;
    return sub_228E918B8(v9, v8);
  }
  return result;
}

void *sub_228E99E80(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  v13[4] = v14[4];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
  v15[4] = v16[4];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
  v19[4] = v20[4];
  uint64_t v21 = (char *)a1 + v18;
  uint64_t v22 = (char *)a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  uint64_t v23 = a3[10];
  uint64_t v24 = a3[11];
  uint64_t v25 = (char *)a1 + v23;
  uint64_t v26 = (char *)a2 + v23;
  uint64_t v27 = *(void *)v26;
  v25[8] = v26[8];
  *(void *)uint64_t v25 = v27;
  uint64_t v28 = (char *)a1 + v24;
  uint64_t v29 = (char *)a2 + v24;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = a3[12];
  uint64_t v31 = a3[13];
  uint64_t v32 = (char *)a1 + v30;
  uint64_t v33 = (char *)a2 + v30;
  v32[8] = v33[8];
  *(void *)uint64_t v32 = *(void *)v33;
  int v34 = (char *)a1 + v31;
  int v35 = (char *)a2 + v31;
  v34[4] = v35[4];
  *(_DWORD *)int v34 = *(_DWORD *)v35;
  uint64_t v36 = a3[14];
  uint64_t v37 = a3[15];
  uint64_t v38 = (char *)a1 + v36;
  uint64_t v39 = (char *)a2 + v36;
  v38[4] = v39[4];
  LODWORD(v27) = *(_DWORD *)v39;
  uint64_t v40 = (char *)a1 + v37;
  unint64_t v41 = (void *)((char *)a2 + v37);
  *(_DWORD *)uint64_t v38 = v27;
  unint64_t v42 = *(void *)((char *)a2 + v37 + 8);
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  }
  else
  {
    uint64_t v43 = *v41;
    sub_228E8FB24(*v41, v42);
    *(void *)uint64_t v40 = v43;
    *((void *)v40 + 1) = v42;
  }
  return a1;
}

void *sub_228E9A04C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[4];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)v12;
  v11[4] = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  char v17 = v16[4];
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
  v15[4] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  int v21 = *(_DWORD *)v20;
  v19[4] = v20[4];
  *(_DWORD *)uint64_t v19 = v21;
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  v23[8] = v24[8];
  *(void *)uint64_t v23 = v25;
  uint64_t v26 = a3[10];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = *(void *)v28;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = v29;
  uint64_t v30 = a3[11];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  LOBYTE(v29) = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  v31[8] = v29;
  uint64_t v33 = a3[12];
  int v34 = (char *)a1 + v33;
  int v35 = (char *)a2 + v33;
  LOBYTE(v29) = v35[8];
  *(void *)int v34 = *(void *)v35;
  v34[8] = v29;
  uint64_t v36 = a3[13];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  LOBYTE(v29) = v38[4];
  *(_DWORD *)uint64_t v37 = *(_DWORD *)v38;
  v37[4] = v29;
  uint64_t v39 = a3[14];
  uint64_t v40 = (char *)a1 + v39;
  unint64_t v41 = (char *)a2 + v39;
  LOBYTE(v29) = v41[4];
  *(_DWORD *)uint64_t v40 = *(_DWORD *)v41;
  v40[4] = v29;
  uint64_t v42 = a3[15];
  uint64_t v43 = (void *)((char *)a1 + v42);
  unint64_t v44 = (void *)((char *)a2 + v42);
  unint64_t v45 = *(void *)((char *)a2 + v42 + 8);
  if (*(void *)((char *)a1 + v42 + 8) >> 60 != 15)
  {
    if (v45 >> 60 != 15)
    {
      uint64_t v47 = *v44;
      sub_228E8FB24(v47, v45);
      uint64_t v48 = *v43;
      unint64_t v49 = v43[1];
      uint64_t *v43 = v47;
      v43[1] = v45;
      sub_228E918B8(v48, v49);
      return a1;
    }
    sub_228E924BC((uint64_t)v43);
    goto LABEL_6;
  }
  if (v45 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
    return a1;
  }
  uint64_t v46 = *v44;
  sub_228E8FB24(v46, v45);
  uint64_t *v43 = v46;
  v43[1] = v45;
  return a1;
}

void *sub_228E9A264(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  uint64_t v20 = (char *)a1 + v17;
  int v21 = (char *)a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v22;
  uint64_t v25 = (char *)a2 + v22;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = (char *)a1 + v23;
  uint64_t v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  uint64_t v29 = a3[12];
  uint64_t v30 = a3[13];
  uint64_t v31 = (char *)a1 + v29;
  uint64_t v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  uint64_t v33 = (char *)a1 + v30;
  int v34 = (char *)a2 + v30;
  v33[4] = v34[4];
  *(_DWORD *)uint64_t v33 = *(_DWORD *)v34;
  uint64_t v35 = a3[14];
  uint64_t v36 = a3[15];
  uint64_t v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  v37[4] = v38[4];
  *(_DWORD *)uint64_t v37 = *(_DWORD *)v38;
  *(_OWORD *)((char *)a1 + v36) = *(_OWORD *)((char *)a2 + v36);
  return a1;
}

void *sub_228E9A3E4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_228E9EF80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(_DWORD *)uint64_t v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  uint64_t v20 = (char *)a1 + v17;
  int v21 = (char *)a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v22;
  uint64_t v25 = (char *)a2 + v22;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = (char *)a1 + v23;
  uint64_t v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  uint64_t v29 = a3[12];
  uint64_t v30 = a3[13];
  uint64_t v31 = (char *)a1 + v29;
  uint64_t v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  uint64_t v33 = (char *)a1 + v30;
  int v34 = (char *)a2 + v30;
  v33[4] = v34[4];
  *(_DWORD *)uint64_t v33 = *(_DWORD *)v34;
  uint64_t v35 = a3[14];
  uint64_t v36 = a3[15];
  uint64_t v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  v37[4] = v38[4];
  uint64_t v39 = (void *)((char *)a1 + v36);
  uint64_t v40 = (void *)((char *)a2 + v36);
  *(_DWORD *)uint64_t v37 = *(_DWORD *)v38;
  unint64_t v41 = *(void *)((char *)a1 + v36 + 8);
  if (v41 >> 60 != 15)
  {
    unint64_t v42 = v40[1];
    if (v42 >> 60 != 15)
    {
      uint64_t v43 = *v39;
      *uint64_t v39 = *v40;
      v39[1] = v42;
      sub_228E918B8(v43, v41);
      return a1;
    }
    sub_228E924BC((uint64_t)v39);
  }
  *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
  return a1;
}

uint64_t sub_228E9A5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_228E9A5C4);
}

uint64_t sub_228E9A5C4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_228E9EF80();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_228E9A674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_228E9A688);
}

void *sub_228E9A688(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_228E9EF80();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_228E9A730()
{
  uint64_t result = sub_228E9EF80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_228E9A7FC()
{
  unint64_t result = qword_2682B32B8;
  if (!qword_2682B32B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32B8);
  }
  return result;
}

unint64_t sub_228E9A854()
{
  unint64_t result = qword_2682B32C0;
  if (!qword_2682B32C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32C0);
  }
  return result;
}

unint64_t sub_228E9A8AC()
{
  unint64_t result = qword_2682B32C8;
  if (!qword_2682B32C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32C8);
  }
  return result;
}

unint64_t sub_228E9A900()
{
  unint64_t result = qword_2682B32D0;
  if (!qword_2682B32D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32D0);
  }
  return result;
}

BOOL sub_228E9A954(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_228E9A96C()
{
  return sub_228E9F290();
}

uint64_t sub_228E9A9B4()
{
  return sub_228E9F280();
}

uint64_t sub_228E9A9E0()
{
  return sub_228E9F290();
}

uint64_t sub_228E9AA34(uint64_t a1, unint64_t a2, unint64_t a3)
{
  char v5 = 0;
  uint64_t v6 = 0;
  uint64_t v34 = (int)a2;
  uint64_t v32 = (uint64_t)a2 >> 32;
  uint64_t v33 = BYTE6(a3);
  unint64_t v29 = a2 >> 16;
  unint64_t v30 = a2 >> 8;
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v27 = HIDWORD(a2);
  unint64_t v28 = a2 >> 24;
  uint64_t v7 = 1;
  unint64_t v25 = HIWORD(a2);
  unint64_t v26 = a2 >> 40;
  unint64_t v23 = a3 >> 8;
  unint64_t v24 = HIBYTE(a2);
  unint64_t v21 = a3 >> 24;
  unint64_t v22 = a3 >> 16;
  char v31 = a3;
  unint64_t v19 = a3 >> 40;
  unint64_t v20 = HIDWORD(a3);
  unint64_t v8 = a3 >> 62;
  while (2)
  {
    uint64_t v9 = a1 + v7 - 1;
    if (__OFADD__(a1, v7 - 1))
    {
      __break(1u);
LABEL_22:
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
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
    }
    switch(v8)
    {
      case 1uLL:
        if (v9 < v34 || v9 >= v32) {
          goto LABEL_23;
        }
        uint64_t v11 = sub_228E9EE80();
        if (!v11) {
          goto LABEL_29;
        }
        uint64_t v12 = v11;
        uint64_t v13 = sub_228E9EEA0();
        uint64_t v14 = v9 - v13;
        if (!__OFSUB__(v9, v13)) {
          goto LABEL_16;
        }
        goto LABEL_25;
      case 2uLL:
        if (v9 < *(void *)(a2 + 16)) {
          goto LABEL_24;
        }
        if (v9 >= *(void *)(a2 + 24)) {
          goto LABEL_26;
        }
        uint64_t v15 = sub_228E9EE80();
        if (!v15) {
          goto LABEL_30;
        }
        uint64_t v12 = v15;
        uint64_t v16 = sub_228E9EEA0();
        uint64_t v14 = v9 - v16;
        if (__OFSUB__(v9, v16)) {
          goto LABEL_27;
        }
LABEL_16:
        char v10 = *(unsigned char *)(v12 + v14);
LABEL_17:
        v6 |= (unint64_t)(v10 & 0x7F) << v5;
        if ((v10 & 0x80) == 0) {
          return v6;
        }
        v5 += 7;
        if (++v7 != 11) {
          continue;
        }
        sub_228E9ACE4();
        swift_allocError();
        *uint64_t v17 = 1;
        swift_willThrow();
        return v6;
      case 3uLL:
        goto LABEL_28;
      default:
        if (v9 >= v33) {
          goto LABEL_22;
        }
        v35[0] = v34;
        v35[1] = v30;
        _OWORD v35[2] = v29;
        _OWORD v35[3] = v28;
        v35[4] = v27;
        v35[5] = v26;
        v35[6] = v25;
        v35[7] = v24;
        v35[8] = v31;
        v35[9] = v23;
        v35[10] = v22;
        v35[11] = v21;
        v35[12] = v20;
        v35[13] = v19;
        char v10 = v35[v9];
        goto LABEL_17;
    }
  }
}

unint64_t sub_228E9ACE4()
{
  unint64_t result = qword_2682B32D8;
  if (!qword_2682B32D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VarIntError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VarIntError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228E9AE94);
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

unsigned char *sub_228E9AEBC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for VarIntError()
{
  return &type metadata for VarIntError;
}

unint64_t sub_228E9AEDC()
{
  unint64_t result = qword_2682B32E0;
  if (!qword_2682B32E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32E0);
  }
  return result;
}

uint64_t sub_228E9AF30(int a1, __int16 a2, uint64_t a3, unint64_t a4)
{
  if ((a2 & 1) == 0)
  {
    HIDWORD(v7) = a1;
    LODWORD(v7) = a1 - 8;
    int v6 = v7 >> 3;
    if ((a2 & 4) == 0)
    {
      switch(v6)
      {
        case 0:
          uint64_t v8 = sub_228E9C8A4(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9B9DC);
          if (v5) {
            return v4;
          }
          uint64_t v9 = v8;
          goto LABEL_14;
        case 1:
          uint64_t v19 = sub_228E9CA28(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9B7B4);
          if (v5) {
            return v4;
          }
          uint64_t v20 = v19;
          goto LABEL_29;
        case 3:
          uint64_t v21 = sub_228E9CBB8(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9B58C);
          if (v5) {
            return v4;
          }
          uint64_t v22 = v21;
          goto LABEL_32;
        case 7:
          uint64_t v23 = sub_228E9CD4C(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9B368);
          if (v5) {
            return v4;
          }
          uint64_t v24 = v23;
          goto LABEL_36;
        default:
          goto LABEL_15;
      }
    }
    switch(v6)
    {
      case 0:
        uint64_t v12 = sub_228E9C8A4(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9C234);
        if (v5) {
          return v4;
        }
        uint64_t v9 = v12;
LABEL_14:
        uint64_t v13 = sub_228E9D778(v9);
        break;
      case 1:
        uint64_t v25 = sub_228E9CA28(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9C00C);
        if (v5) {
          return v4;
        }
        uint64_t v20 = v25;
LABEL_29:
        uint64_t v13 = sub_228E9D894(v20);
        break;
      case 3:
        uint64_t v26 = sub_228E9CBB8(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9BDE4);
        if (v5) {
          return v4;
        }
        uint64_t v22 = v26;
LABEL_32:
        uint64_t v13 = sub_228E9D9B0(v22);
        break;
      case 7:
        uint64_t v27 = sub_228E9CD4C(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, void, uint64_t, unint64_t))sub_228E9BC04);
        if (v5) {
          return v4;
        }
        uint64_t v24 = v27;
LABEL_36:
        uint64_t v13 = sub_228E9DACC(v24);
        break;
      default:
        goto LABEL_15;
    }
    uint64_t v4 = v13;
    swift_bridgeObjectRelease();
    return v4;
  }
  switch(a1)
  {
    case 64:
      uint64_t v15 = sub_228E9C73C(a2, 0, 1, a3, a4);
      if (!v5)
      {
        uint64_t v11 = sub_228E9D654(v15);
        goto LABEL_20;
      }
      break;
    case 32:
      uint64_t v16 = sub_228E9C5D4(a2, 0, 1, a3, a4);
      if (!v5)
      {
        uint64_t v11 = sub_228E9D530(v16);
        goto LABEL_20;
      }
      break;
    case 16:
      uint64_t v10 = sub_228E9C470(a2, 0, 1, a3, a4);
      if (!v5)
      {
        uint64_t v11 = sub_228E9D40C(v10);
LABEL_20:
        uint64_t v17 = v11;
        swift_bridgeObjectRelease();
        return v17;
      }
      break;
    default:
LABEL_15:
      sub_228E9B314();
      swift_allocError();
      *uint64_t v14 = 1;
      swift_willThrow();
      break;
  }
  return v4;
}

unint64_t sub_228E9B314()
{
  unint64_t result = qword_2682B32E8;
  if (!qword_2682B32E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B32E8);
  }
  return result;
}

char *sub_228E9B368(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9B57CLL);
          }
          if (v7 < 0)
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_228E9DBE8(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B3328);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            uint64_t v10 = sub_228E9DBE8((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B3328);
          }
          *((void *)v10 + 2) = v20 + 1;
          *(void *)&v10[8 * v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

char *sub_228E9B58C(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9B7A4);
          }
          if (HIDWORD(v7))
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_228E9DCE0(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B3320);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            uint64_t v10 = sub_228E9DCE0((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B3320);
          }
          *((void *)v10 + 2) = v20 + 1;
          *(_DWORD *)&v10[4 * v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

char *sub_228E9B7B4(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9B9CCLL);
          }
          if (v7 >> 16)
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_228E9DDD8(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B3318);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            uint64_t v10 = sub_228E9DDD8((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B3318);
          }
          *((void *)v10 + 2) = v20 + 1;
          *(_WORD *)&v10[2 * v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

char *sub_228E9B9DC(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9BBF4);
          }
          if (v7 > 0xFF)
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_228E9DECC(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B3310);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            uint64_t v10 = sub_228E9DECC((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B3310);
          }
          *((void *)v10 + 2) = v20 + 1;
          v10[v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

char *sub_228E9BC04(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  BOOL v8 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v23 = v8;
  uint64_t v22 = HIDWORD(a3) - (int)a3;
  uint64_t v27 = BYTE6(a4);
  BOOL v9 = (char *)MEMORY[0x263F8EE78];
  unint64_t v10 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v27;
    switch(v10)
    {
      case 1uLL:
        uint64_t v11 = v22;
        if (v23) {
          goto LABEL_27;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_28;
      case 3uLL:
        if (v7 < 0) {
          goto LABEL_12;
        }
        return v9;
      default:
LABEL_9:
        if (v7 >= v11) {
          return v9;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v9 + 2) == a1) {
          return v9;
        }
        unint64_t v15 = sub_228E9AA34(v7, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v6);
          v6 += v17;
          if (v14)
          {
            __break(1u);
LABEL_26:
            __break(1u);
LABEL_27:
            __break(1u);
LABEL_28:
            __break(1u);
            JUMPOUT(0x228E9BDD4);
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            BOOL v9 = sub_228E9DBE8(0, *((void *)v9 + 2) + 1, 1, v9, &qword_2682B3308);
          }
          unint64_t v20 = *((void *)v9 + 2);
          unint64_t v19 = *((void *)v9 + 3);
          if (v20 >= v19 >> 1) {
            BOOL v9 = sub_228E9DBE8((char *)(v19 > 1), v20 + 1, 1, v9, &qword_2682B3308);
          }
          *((void *)v9 + 2) = v20 + 1;
          *(void *)&v9[8 * v20 + 32] = v6;
          BOOL v14 = __OFADD__(v7, v18);
          v7 += v18;
          if (v14) {
            goto LABEL_26;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v9;
    }
  }
}

char *sub_228E9BDE4(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9BFFCLL);
          }
          if (v7 != (int)v7)
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v10 = sub_228E9DCE0(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B3300);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            unint64_t v10 = sub_228E9DCE0((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B3300);
          }
          *((void *)v10 + 2) = v20 + 1;
          *(_DWORD *)&v10[4 * v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

char *sub_228E9C00C(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9C224);
          }
          if (v7 != (__int16)v7)
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v10 = sub_228E9DDD8(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B32F8);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            unint64_t v10 = sub_228E9DDD8((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B32F8);
          }
          *((void *)v10 + 2) = v20 + 1;
          *(_WORD *)&v10[2 * v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

char *sub_228E9C234(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  BOOL v9 = __OFSUB__(HIDWORD(a3), a3);
  BOOL v24 = v9;
  uint64_t v23 = HIDWORD(a3) - (int)a3;
  uint64_t v28 = BYTE6(a4);
  unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v27 = a4 >> 62;
  while (2)
  {
    uint64_t v11 = v28;
    switch(v27)
    {
      case 1uLL:
        uint64_t v11 = v23;
        if (v24) {
          goto LABEL_29;
        }
        goto LABEL_9;
      case 2uLL:
        uint64_t v13 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        BOOL v14 = __OFSUB__(v12, v13);
        uint64_t v11 = v12 - v13;
        if (!v14) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        if (v8 < 0) {
          goto LABEL_12;
        }
        return v10;
      default:
LABEL_9:
        if (v8 >= v11) {
          return v10;
        }
LABEL_12:
        if ((a2 & 1) == 0 && *((void *)v10 + 2) == a1) {
          return v10;
        }
        unint64_t v15 = sub_228E9AA34(v8, a3, a4);
        if (!v4)
        {
          unint64_t v17 = -(uint64_t)(v15 & 1) ^ (v15 >> 1);
          BOOL v14 = __OFADD__(v17, v7);
          v7 += v17;
          if (v14)
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            JUMPOUT(0x228E9C44CLL);
          }
          if (v7 != (char)v7)
          {
            swift_bridgeObjectRelease();
            sub_228E9ACE4();
            swift_allocError();
            unsigned char *v21 = 0;
            swift_willThrow();
            return v10;
          }
          uint64_t v18 = v16;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v10 = sub_228E9DECC(0, *((void *)v10 + 2) + 1, 1, v10, &qword_2682B32F0);
          }
          unint64_t v20 = *((void *)v10 + 2);
          unint64_t v19 = *((void *)v10 + 3);
          if (v20 >= v19 >> 1) {
            unint64_t v10 = sub_228E9DECC((char *)(v19 > 1), v20 + 1, 1, v10, &qword_2682B32F0);
          }
          *((void *)v10 + 2) = v20 + 1;
          v10[v20 + 32] = v7;
          BOOL v14 = __OFADD__(v8, v18);
          v8 += v18;
          if (v14) {
            goto LABEL_28;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        return v10;
    }
  }
}

BOOL sub_228E9C45C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_228E9C470(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      LODWORD(v9) = HIDWORD(a4) - a4;
      if (__OFSUB__(HIDWORD(a4), a4)) {
        goto LABEL_25;
      }
      uint64_t v9 = (int)v9;
LABEL_6:
      uint64_t v13 = v9 / 2;
      if (v13 > a2 && (a3 & 1) == 0) {
        uint64_t v15 = a2;
      }
      else {
        uint64_t v15 = v13;
      }
      uint64_t v20 = v15;
      if (v15 < 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v15)
      {
        uint64_t v16 = sub_228E9F1C0();
        *(void *)(v16 + 16) = v15;
      }
      else
      {
        uint64_t v16 = MEMORY[0x263F8EE78];
      }
      v18[1] = v15;
      uint64_t v19 = 0;
      v18[0] = v16 + 32;
      sub_228E9D188(v18, &v19, a1, &v20, a4, a5);
      if (!v5)
      {
        if (v15 >= v19)
        {
          *(void *)(v16 + 16) = v19;
          return v16;
        }
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        JUMPOUT(0x228E9C5C4);
      }
      if (v15 < v19)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      *(void *)(v16 + 16) = v19;
      swift_bridgeObjectRelease();
      return v16;
    case 2uLL:
      uint64_t v11 = *(void *)(a4 + 16);
      uint64_t v10 = *(void *)(a4 + 24);
      BOOL v12 = __OFSUB__(v10, v11);
      uint64_t v9 = v10 - v11;
      if (!v12) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v9 = BYTE6(a5);
      goto LABEL_6;
  }
}

uint64_t sub_228E9C5D4(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      LODWORD(v9) = HIDWORD(a4) - a4;
      if (__OFSUB__(HIDWORD(a4), a4)) {
        goto LABEL_25;
      }
      uint64_t v9 = (int)v9;
LABEL_6:
      uint64_t v13 = v9 / 4;
      if (v13 > a2 && (a3 & 1) == 0) {
        uint64_t v15 = a2;
      }
      else {
        uint64_t v15 = v13;
      }
      uint64_t v20 = v15;
      if (v15 < 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v15)
      {
        uint64_t v16 = sub_228E9F1C0();
        *(void *)(v16 + 16) = v15;
      }
      else
      {
        uint64_t v16 = MEMORY[0x263F8EE78];
      }
      v18[1] = v15;
      uint64_t v19 = 0;
      v18[0] = v16 + 32;
      sub_228E9D034(v18, &v19, a1, &v20, a4, a5);
      if (!v5)
      {
        if (v15 >= v19)
        {
          *(void *)(v16 + 16) = v19;
          return v16;
        }
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        JUMPOUT(0x228E9C72CLL);
      }
      if (v15 < v19)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      *(void *)(v16 + 16) = v19;
      swift_bridgeObjectRelease();
      return v16;
    case 2uLL:
      uint64_t v11 = *(void *)(a4 + 16);
      uint64_t v10 = *(void *)(a4 + 24);
      BOOL v12 = __OFSUB__(v10, v11);
      uint64_t v9 = v10 - v11;
      if (!v12) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v9 = BYTE6(a5);
      goto LABEL_6;
  }
}

uint64_t sub_228E9C73C(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = 0;
  switch(a5 >> 62)
  {
    case 1uLL:
      LODWORD(v9) = HIDWORD(a4) - a4;
      if (__OFSUB__(HIDWORD(a4), a4)) {
        goto LABEL_25;
      }
      uint64_t v9 = (int)v9;
LABEL_6:
      uint64_t v13 = v9 / 8;
      if (v13 > a2 && (a3 & 1) == 0) {
        uint64_t v15 = a2;
      }
      else {
        uint64_t v15 = v13;
      }
      uint64_t v20 = v15;
      if (v15 < 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v15)
      {
        uint64_t v16 = sub_228E9F1C0();
        *(void *)(v16 + 16) = v15;
      }
      else
      {
        uint64_t v16 = MEMORY[0x263F8EE78];
      }
      v18[1] = v15;
      uint64_t v19 = 0;
      v18[0] = v16 + 32;
      sub_228E9CEE0(v18, &v19, a1, &v20, a4, a5);
      if (!v5)
      {
        if (v15 >= v19)
        {
          *(void *)(v16 + 16) = v19;
          return v16;
        }
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        JUMPOUT(0x228E9C894);
      }
      if (v15 < v19)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      *(void *)(v16 + 16) = v19;
      swift_bridgeObjectRelease();
      return v16;
    case 2uLL:
      uint64_t v11 = *(void *)(a4 + 16);
      uint64_t v10 = *(void *)(a4 + 24);
      BOOL v12 = __OFSUB__(v10, v11);
      uint64_t v9 = v10 - v11;
      if (!v12) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v9 = BYTE6(a5);
      goto LABEL_6;
  }
}

uint64_t sub_228E9C8A4(__int16 a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(uint64_t, void, uint64_t, unint64_t))
{
  if ((a1 & 0x100) != 0)
  {
    uint64_t v12 = a6(a2, a3 & 1, a4, a5);
    if (!v6) {
      return v12;
    }
  }
  else
  {
    char v10 = a1;
    uint64_t v11 = 0;
    switch(a5 >> 62)
    {
      case 1uLL:
        LODWORD(v11) = HIDWORD(a4) - a4;
        if (__OFSUB__(HIDWORD(a4), a4)) {
          goto LABEL_29;
        }
        uint64_t v11 = (int)v11;
LABEL_9:
        if (v11 > a2 && (a3 & 1) == 0) {
          uint64_t v17 = a2;
        }
        else {
          uint64_t v17 = v11;
        }
        uint64_t v21 = v17;
        if (v17 < 0)
        {
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (v17)
        {
          uint64_t v7 = sub_228E9F1C0();
          *(void *)(v7 + 16) = v17;
        }
        else
        {
          uint64_t v7 = MEMORY[0x263F8EE78];
        }
        v19[1] = v17;
        uint64_t v20 = 0;
        v19[0] = v7 + 32;
        sub_228E9D2D4(v19, &v20, v10, &v21, a4, a5);
        if (v6)
        {
          if (v17 >= v20)
          {
            *(void *)(v7 + 16) = v20;
            swift_bridgeObjectRelease();
            return v7;
          }
          goto LABEL_27;
        }
        if (v17 < v20)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          JUMPOUT(0x228E9CA18);
        }
        *(void *)(v7 + 16) = v20;
        break;
      case 2uLL:
        uint64_t v14 = *(void *)(a4 + 16);
        uint64_t v13 = *(void *)(a4 + 24);
        BOOL v15 = __OFSUB__(v13, v14);
        uint64_t v11 = v13 - v14;
        if (!v15) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        goto LABEL_9;
      default:
        uint64_t v11 = BYTE6(a5);
        goto LABEL_9;
    }
  }
  return v7;
}

uint64_t sub_228E9CA28(__int16 a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(uint64_t, void, uint64_t, unint64_t))
{
  if ((a1 & 0x100) != 0)
  {
    uint64_t v12 = a6(a2, a3 & 1, a4, a5);
    if (!v6) {
      return v12;
    }
  }
  else
  {
    char v10 = a1;
    uint64_t v11 = 0;
    switch(a5 >> 62)
    {
      case 1uLL:
        LODWORD(v11) = HIDWORD(a4) - a4;
        if (__OFSUB__(HIDWORD(a4), a4)) {
          goto LABEL_29;
        }
        uint64_t v11 = (int)v11;
LABEL_9:
        uint64_t v16 = v11 / 2;
        if (v16 > a2 && (a3 & 1) == 0) {
          uint64_t v18 = a2;
        }
        else {
          uint64_t v18 = v16;
        }
        uint64_t v22 = v18;
        if (v18 < 0)
        {
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (v18)
        {
          uint64_t v7 = sub_228E9F1C0();
          *(void *)(v7 + 16) = v18;
        }
        else
        {
          uint64_t v7 = MEMORY[0x263F8EE78];
        }
        v20[1] = v18;
        uint64_t v21 = 0;
        v20[0] = v7 + 32;
        sub_228E9D188(v20, &v21, v10, &v22, a4, a5);
        if (v6)
        {
          if (v18 >= v21)
          {
            *(void *)(v7 + 16) = v21;
            swift_bridgeObjectRelease();
            return v7;
          }
          goto LABEL_27;
        }
        if (v18 < v21)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          JUMPOUT(0x228E9CBA8);
        }
        *(void *)(v7 + 16) = v21;
        break;
      case 2uLL:
        uint64_t v14 = *(void *)(a4 + 16);
        uint64_t v13 = *(void *)(a4 + 24);
        BOOL v15 = __OFSUB__(v13, v14);
        uint64_t v11 = v13 - v14;
        if (!v15) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        goto LABEL_9;
      default:
        uint64_t v11 = BYTE6(a5);
        goto LABEL_9;
    }
  }
  return v7;
}

uint64_t sub_228E9CBB8(__int16 a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(uint64_t, void, uint64_t, unint64_t))
{
  if ((a1 & 0x100) != 0)
  {
    uint64_t v12 = a6(a2, a3 & 1, a4, a5);
    if (!v6) {
      return v12;
    }
  }
  else
  {
    char v10 = a1;
    uint64_t v11 = 0;
    switch(a5 >> 62)
    {
      case 1uLL:
        LODWORD(v11) = HIDWORD(a4) - a4;
        if (__OFSUB__(HIDWORD(a4), a4)) {
          goto LABEL_29;
        }
        uint64_t v11 = (int)v11;
LABEL_9:
        uint64_t v16 = v11 / 4;
        if (v16 > a2 && (a3 & 1) == 0) {
          uint64_t v18 = a2;
        }
        else {
          uint64_t v18 = v16;
        }
        uint64_t v22 = v18;
        if (v18 < 0)
        {
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (v18)
        {
          uint64_t v7 = sub_228E9F1C0();
          *(void *)(v7 + 16) = v18;
        }
        else
        {
          uint64_t v7 = MEMORY[0x263F8EE78];
        }
        v20[1] = v18;
        uint64_t v21 = 0;
        v20[0] = v7 + 32;
        sub_228E9D034(v20, &v21, v10, &v22, a4, a5);
        if (v6)
        {
          if (v18 >= v21)
          {
            *(void *)(v7 + 16) = v21;
            swift_bridgeObjectRelease();
            return v7;
          }
          goto LABEL_27;
        }
        if (v18 < v21)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          JUMPOUT(0x228E9CD3CLL);
        }
        *(void *)(v7 + 16) = v21;
        break;
      case 2uLL:
        uint64_t v14 = *(void *)(a4 + 16);
        uint64_t v13 = *(void *)(a4 + 24);
        BOOL v15 = __OFSUB__(v13, v14);
        uint64_t v11 = v13 - v14;
        if (!v15) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        goto LABEL_9;
      default:
        uint64_t v11 = BYTE6(a5);
        goto LABEL_9;
    }
  }
  return v7;
}

uint64_t sub_228E9CD4C(__int16 a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(uint64_t, void, uint64_t, unint64_t))
{
  if ((a1 & 0x100) != 0)
  {
    uint64_t v12 = a6(a2, a3 & 1, a4, a5);
    if (!v6) {
      return v12;
    }
  }
  else
  {
    char v10 = a1;
    uint64_t v11 = 0;
    switch(a5 >> 62)
    {
      case 1uLL:
        LODWORD(v11) = HIDWORD(a4) - a4;
        if (__OFSUB__(HIDWORD(a4), a4)) {
          goto LABEL_29;
        }
        uint64_t v11 = (int)v11;
LABEL_9:
        uint64_t v16 = v11 / 8;
        if (v16 > a2 && (a3 & 1) == 0) {
          uint64_t v18 = a2;
        }
        else {
          uint64_t v18 = v16;
        }
        uint64_t v22 = v18;
        if (v18 < 0)
        {
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (v18)
        {
          uint64_t v7 = sub_228E9F1C0();
          *(void *)(v7 + 16) = v18;
        }
        else
        {
          uint64_t v7 = MEMORY[0x263F8EE78];
        }
        v20[1] = v18;
        uint64_t v21 = 0;
        v20[0] = v7 + 32;
        sub_228E9CEE0(v20, &v21, v10, &v22, a4, a5);
        if (v6)
        {
          if (v18 >= v21)
          {
            *(void *)(v7 + 16) = v21;
            swift_bridgeObjectRelease();
            return v7;
          }
          goto LABEL_27;
        }
        if (v18 < v21)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          JUMPOUT(0x228E9CED0);
        }
        *(void *)(v7 + 16) = v21;
        break;
      case 2uLL:
        uint64_t v14 = *(void *)(a4 + 16);
        uint64_t v13 = *(void *)(a4 + 24);
        BOOL v15 = __OFSUB__(v13, v14);
        uint64_t v11 = v13 - v14;
        if (!v15) {
          goto LABEL_9;
        }
        goto LABEL_30;
      case 3uLL:
        goto LABEL_9;
      default:
        uint64_t v11 = BYTE6(a5);
        goto LABEL_9;
    }
  }
  return v7;
}

uint64_t sub_228E9CEE0(uint64_t *a1, void *a2, char a3, void *a4, uint64_t a5, unint64_t a6)
{
  if ((a3 & 2) != 0)
  {
    sub_228E9B314();
    swift_allocError();
    unsigned char *v11 = 0;
    return swift_willThrow();
  }
  *a2 = *a4;
  uint64_t result = *a1;
  uint64_t v8 = a1[1];
  unint64_t v9 = a6 >> 62;
  switch(a6 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a5) - a5;
      if (__OFSUB__(HIDWORD(a5), a5)) {
        goto LABEL_26;
      }
      uint64_t v10 = (int)v10;
LABEL_8:
      if (v10 < 1) {
        return result;
      }
      if (v9)
      {
        if (v9 == 1) {
          uint64_t v15 = (int)a5;
        }
        else {
          uint64_t v15 = *(void *)(a5 + 16);
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      if ((unint64_t)(v8 - 0x1000000000000000) >> 61 != 7)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      uint64_t v16 = 8 * v8;
      if (v10 < 8 * v8) {
        uint64_t v16 = v10;
      }
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16)) {
        goto LABEL_24;
      }
      if (v17 < v15) {
        goto LABEL_25;
      }
      if (v15 == v17) {
        return result;
      }
      if (!result)
      {
LABEL_28:
        __break(1u);
        JUMPOUT(0x228E9D024);
      }
      return sub_228E9EED0();
    case 2uLL:
      uint64_t v13 = *(void *)(a5 + 16);
      uint64_t v12 = *(void *)(a5 + 24);
      BOOL v14 = __OFSUB__(v12, v13);
      uint64_t v10 = v12 - v13;
      if (!v14) {
        goto LABEL_8;
      }
      goto LABEL_27;
    case 3uLL:
      return result;
    default:
      uint64_t v10 = BYTE6(a6);
      goto LABEL_8;
  }
}

uint64_t sub_228E9D034(uint64_t *a1, void *a2, char a3, void *a4, uint64_t a5, unint64_t a6)
{
  if ((a3 & 2) != 0)
  {
    sub_228E9B314();
    swift_allocError();
    unsigned char *v11 = 0;
    return swift_willThrow();
  }
  *a2 = *a4;
  uint64_t result = *a1;
  uint64_t v8 = a1[1];
  unint64_t v9 = a6 >> 62;
  switch(a6 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a5) - a5;
      if (__OFSUB__(HIDWORD(a5), a5)) {
        goto LABEL_26;
      }
      uint64_t v10 = (int)v10;
LABEL_8:
      if (v10 < 1) {
        return result;
      }
      if (v9)
      {
        if (v9 == 1) {
          uint64_t v15 = (int)a5;
        }
        else {
          uint64_t v15 = *(void *)(a5 + 16);
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      if ((unint64_t)(v8 - 0x2000000000000000) >> 62 != 3)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      uint64_t v16 = 4 * v8;
      if (v10 < 4 * v8) {
        uint64_t v16 = v10;
      }
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16)) {
        goto LABEL_24;
      }
      if (v17 < v15) {
        goto LABEL_25;
      }
      if (v15 == v17) {
        return result;
      }
      if (!result)
      {
LABEL_28:
        __break(1u);
        JUMPOUT(0x228E9D178);
      }
      return sub_228E9EED0();
    case 2uLL:
      uint64_t v13 = *(void *)(a5 + 16);
      uint64_t v12 = *(void *)(a5 + 24);
      BOOL v14 = __OFSUB__(v12, v13);
      uint64_t v10 = v12 - v13;
      if (!v14) {
        goto LABEL_8;
      }
      goto LABEL_27;
    case 3uLL:
      return result;
    default:
      uint64_t v10 = BYTE6(a6);
      goto LABEL_8;
  }
}

uint64_t sub_228E9D188(uint64_t *a1, void *a2, char a3, void *a4, uint64_t a5, unint64_t a6)
{
  if ((a3 & 2) != 0)
  {
    sub_228E9B314();
    swift_allocError();
    unsigned char *v11 = 0;
    return swift_willThrow();
  }
  *a2 = *a4;
  uint64_t result = *a1;
  uint64_t v8 = a1[1];
  unint64_t v9 = a6 >> 62;
  switch(a6 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a5) - a5;
      if (__OFSUB__(HIDWORD(a5), a5)) {
        goto LABEL_26;
      }
      uint64_t v10 = (int)v10;
LABEL_8:
      if (v10 < 1) {
        return result;
      }
      if (v9)
      {
        if (v9 == 1) {
          uint64_t v15 = (int)a5;
        }
        else {
          uint64_t v15 = *(void *)(a5 + 16);
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      uint64_t v16 = 2 * v8;
      if (v10 < 2 * v8) {
        uint64_t v16 = v10;
      }
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16)) {
        goto LABEL_24;
      }
      if (v17 < v15) {
        goto LABEL_25;
      }
      if (v15 == v17) {
        return result;
      }
      if (!result)
      {
LABEL_28:
        __break(1u);
        JUMPOUT(0x228E9D2C4);
      }
      return sub_228E9EED0();
    case 2uLL:
      uint64_t v13 = *(void *)(a5 + 16);
      uint64_t v12 = *(void *)(a5 + 24);
      BOOL v14 = __OFSUB__(v12, v13);
      uint64_t v10 = v12 - v13;
      if (!v14) {
        goto LABEL_8;
      }
      goto LABEL_27;
    case 3uLL:
      return result;
    default:
      uint64_t v10 = BYTE6(a6);
      goto LABEL_8;
  }
}

uint64_t sub_228E9D2D4(uint64_t *a1, void *a2, char a3, void *a4, uint64_t a5, unint64_t a6)
{
  if ((a3 & 2) != 0)
  {
    sub_228E9B314();
    swift_allocError();
    unsigned char *v11 = 0;
    return swift_willThrow();
  }
  *a2 = *a4;
  uint64_t result = *a1;
  uint64_t v8 = a1[1];
  unint64_t v9 = a6 >> 62;
  switch(a6 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a5) - a5;
      if (__OFSUB__(HIDWORD(a5), a5)) {
        goto LABEL_25;
      }
      uint64_t v10 = (int)v10;
LABEL_8:
      if (v10 < 1) {
        return result;
      }
      if (v9)
      {
        if (v9 == 1) {
          uint64_t v15 = (int)a5;
        }
        else {
          uint64_t v15 = *(void *)(a5 + 16);
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      if (v10 >= v8) {
        uint64_t v16 = v8;
      }
      else {
        uint64_t v16 = v10;
      }
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16))
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      if (v17 < v15) {
        goto LABEL_24;
      }
      if (v15 == v17) {
        return result;
      }
      if (!result)
      {
LABEL_27:
        __break(1u);
        JUMPOUT(0x228E9D3FCLL);
      }
      return sub_228E9EED0();
    case 2uLL:
      uint64_t v13 = *(void *)(a5 + 16);
      uint64_t v12 = *(void *)(a5 + 24);
      BOOL v14 = __OFSUB__(v12, v13);
      uint64_t v10 = v12 - v13;
      if (!v14) {
        goto LABEL_8;
      }
      goto LABEL_26;
    case 3uLL:
      return result;
    default:
      uint64_t v10 = BYTE6(a6);
      goto LABEL_8;
  }
}

uint64_t sub_228E9D40C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 2;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_228E9D530(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_228E9D654(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_228E9D778(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      ++v4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_228E9D894(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      v4 += 2;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_228E9D9B0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      v4 += 4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_228E9DACC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_228E919CC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      v4 += 8;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_228E919CC(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_228E919CC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_228E91760(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

char *sub_228E9DBE8(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_228E9DCE0(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 29;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[4 * v9]) {
      memmove(v14, v15, 4 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_228E9DDD8(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    int64_t v13 = v12 - 32;
    if (v12 < 32) {
      int64_t v13 = v12 - 31;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = v13 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[2 * v9]) {
      memmove(v14, v15, 2 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 2 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_228E9DECC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v11 + 32;
  BOOL v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t getEnumTagSinglePayload for FormatError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FormatError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x228E9E110);
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

ValueMetadata *type metadata accessor for FormatError()
{
  return &type metadata for FormatError;
}

unint64_t sub_228E9E14C()
{
  unint64_t result = qword_2682B3330;
  if (!qword_2682B3330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B3330);
  }
  return result;
}

uint64_t sub_228E9E1A0(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x228E9E3E0);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 16) {
        goto LABEL_12;
      }
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EEF0();
      sub_228E9EF40();
      return sub_228E918B8(a1, a2);
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v6, v5);
      uint64_t v4 = v6 - v5;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_11;
    case 3uLL:
      goto LABEL_12;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

id SRStreamBlock.__allocating_init(binaryRep:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SRStreamBlock.init(binaryRep:)(a1, a2);
}

id SRStreamBlock.init(binaryRep:)(uint64_t a1, unint64_t a2)
{
  int v3 = v2;
  uint64_t v6 = sub_228E9EFA0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = type metadata accessor for StreamBlock(0);
  MEMORY[0x270FA5388](v7);
  int64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v11) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_32;
      }
      uint64_t v11 = (int)v11;
LABEL_6:
      if (v11 <= 3) {
        goto LABEL_24;
      }
      if (v10)
      {
        if (v10 == 1)
        {
          if ((int)a1 > a1 >> 32)
          {
LABEL_34:
            __break(1u);
LABEL_35:
            __break(1u);
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
          id v15 = v2;
          uint64_t v16 = sub_228E9EE80();
          if (!v16)
          {
LABEL_40:
            sub_228E9EE90();
            __break(1u);
            goto LABEL_41;
          }
          uint64_t v17 = v16;
          uint64_t v18 = sub_228E9EEA0();
          uint64_t v35 = (int)a1 - v18;
          if (__OFSUB__((int)a1, v18)) {
            goto LABEL_36;
          }
          sub_228E9EE90();
          if (__OFSUB__(HIDWORD(a1), a1))
          {
LABEL_38:
            __break(1u);
            goto LABEL_39;
          }
          unsigned int v19 = *(_DWORD *)(v17 + v35);
          uint64_t v20 = HIDWORD(a1) - (int)a1;
        }
        else
        {
          uint64_t v22 = *(void *)(a1 + 16);
          id v23 = v2;
          swift_retain();
          swift_retain();
          uint64_t v24 = sub_228E9EE80();
          if (!v24)
          {
LABEL_39:
            sub_228E9EE90();
            __break(1u);
            goto LABEL_40;
          }
          uint64_t v25 = v24;
          uint64_t v26 = sub_228E9EEA0();
          BOOL v14 = __OFSUB__(v22, v26);
          uint64_t v27 = v22 - v26;
          if (v14) {
            goto LABEL_35;
          }
          sub_228E9EE90();
          unsigned int v19 = *(_DWORD *)(v25 + v27);
          swift_release();
          swift_release();
          uint64_t v29 = *(void *)(a1 + 16);
          uint64_t v28 = *(void *)(a1 + 24);
          uint64_t v20 = v28 - v29;
          if (__OFSUB__(v28, v29))
          {
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
        }
      }
      else
      {
        uint64_t v20 = BYTE6(a2);
        id v21 = v3;
        unsigned int v19 = a1;
      }
      if (v19 >= 0xFFFFFFFC)
      {
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      if (v20 == v19 + 4)
      {
        if (v10)
        {
          if (v10 == 1)
          {
            uint64_t v30 = (int)a1;
            uint64_t v31 = a1 >> 32;
          }
          else
          {
            uint64_t v30 = *(void *)(a1 + 16);
            uint64_t v31 = *(void *)(a1 + 24);
          }
        }
        else
        {
          uint64_t v30 = 0;
          uint64_t v31 = BYTE6(a2);
        }
        if (v31 >= 4 && v31 >= v30)
        {
          sub_228E9EEC0();
          uint64_t v39 = 0;
          long long v37 = 0u;
          long long v38 = 0u;
          sub_228E9EF90();
          sub_228E9EA48();
          sub_228E9F070();
          sub_228E9EAA0((uint64_t)v9, (uint64_t)v3 + OBJC_IVAR____TtC16SensorKitSupport13SRStreamBlock_streamBlock);

          uint64_t v34 = (objc_class *)type metadata accessor for SRStreamBlock();
          v36.receiver = v3;
          v36.super_class = v34;
          id v32 = objc_msgSendSuper2(&v36, sel_init);
          sub_228E918B8(a1, a2);
          return v32;
        }
LABEL_41:
        __break(1u);
        JUMPOUT(0x228E9E7D8);
      }

LABEL_24:
      sub_228E918B8(a1, a2);
      type metadata accessor for SRStreamBlock();
      swift_deallocPartialClassInstance();
      return 0;
    case 2uLL:
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      BOOL v14 = __OFSUB__(v12, v13);
      uint64_t v11 = v12 - v13;
      if (!v14) {
        goto LABEL_6;
      }
      goto LABEL_33;
    case 3uLL:
      goto LABEL_24;
    default:
      uint64_t v11 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t type metadata accessor for SRStreamBlock()
{
  uint64_t result = qword_2682B3338;
  if (!qword_2682B3338) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_228E9E90C()
{
  sub_228E8F234();
  uint64_t v0 = sub_228E9F140();
  swift_bridgeObjectRelease();
  return v0;
}

id SRStreamBlock.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SRStreamBlock.init()()
{
}

id SRStreamBlock.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRStreamBlock();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_228E9EA48()
{
  unint64_t result = qword_2682B3228;
  if (!qword_2682B3228)
  {
    type metadata accessor for StreamBlock(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2682B3228);
  }
  return result;
}

uint64_t sub_228E9EAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StreamBlock(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_228E9EB04()
{
  return type metadata accessor for SRStreamBlock();
}

uint64_t sub_228E9EB0C()
{
  uint64_t result = type metadata accessor for StreamBlock(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SRStreamBlock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SRStreamBlock);
}

uint64_t dispatch thunk of SRStreamBlock.__allocating_init(binaryRep:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SRStreamBlock.dictionary.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t sub_228E9EBFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StreamBlock(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_228E9EE80()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_228E9EE90()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_228E9EEA0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_228E9EEB0()
{
  return MEMORY[0x270EEFF90]();
}

uint64_t sub_228E9EEC0()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_228E9EED0()
{
  return MEMORY[0x270EF0108]();
}

uint64_t sub_228E9EEE0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_228E9EEF0()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_228E9EF00()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_228E9EF10()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_228E9EF20()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_228E9EF30()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_228E9EF40()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_228E9EF50()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_228E9EF60()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_228E9EF70()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_228E9EF80()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_228E9EF90()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_228E9EFA0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_228E9EFB0()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_228E9EFE0()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_228E9EFF0()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_228E9F000()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_228E9F010()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_228E9F020()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_228E9F030()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_228E9F040()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_228E9F050()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_228E9F060()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_228E9F070()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_228E9F090()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_228E9F0A0()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_228E9F0B0()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_228E9F0C0()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_228E9F0D0()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_228E9F0E0()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_228E9F0F0()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_228E9F100()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_228E9F110()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_228E9F120()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_228E9F130()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_228E9F140()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_228E9F150()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_228E9F160()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_228E9F170()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_228E9F180()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_228E9F190()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_228E9F1A0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_228E9F1B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_228E9F1C0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_228E9F1D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_228E9F1E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_228E9F1F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_228E9F200()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_228E9F210()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_228E9F220()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_228E9F230()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_228E9F240()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_228E9F250()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_228E9F260()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_228E9F270()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_228E9F280()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_228E9F290()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}