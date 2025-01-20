uint64_t sub_25A7B59BC()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  byte_26A464188 = result;
  return result;
}

uint64_t static OSVariant.isInternalBuild.getter()
{
  return sub_25A7B5B5C(&qword_26A464180, (unsigned __int8 *)&byte_26A464188);
}

uint64_t static OSVariant.isInternalBuild.setter(char a1)
{
  return sub_25A7B5BD8(a1, &qword_26A464180, &byte_26A464188);
}

uint64_t (*static OSVariant.isInternalBuild.modify())()
{
  if (qword_26A464180 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_25A7B5AB4()
{
  if (qword_26A464180 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  byte_26A464198 = (byte_26A464188 & 1) == 0;
  return result;
}

uint64_t static OSVariant.isCustomerBuild.getter()
{
  return sub_25A7B5B5C(&qword_26A464190, (unsigned __int8 *)&byte_26A464198);
}

uint64_t sub_25A7B5B5C(void *a1, unsigned __int8 *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return *a2;
}

uint64_t static OSVariant.isCustomerBuild.setter(char a1)
{
  return sub_25A7B5BD8(a1, &qword_26A464190, &byte_26A464198);
}

uint64_t sub_25A7B5BD8(char a1, void *a2, unsigned char *a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  *a3 = a1 & 1;
  return result;
}

uint64_t (*static OSVariant.isCustomerBuild.modify())()
{
  if (qword_26A464190 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for OSVariant()
{
  return &type metadata for OSVariant;
}

uint64_t sub_25A7B5CDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25A7F1F90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7F1F80();
  sub_25A7F1F70();
  MEMORY[0x261143BA0](7824750, 0xE300000000000000);
  sub_25A7B5F28();
  sub_25A7F1F40();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641C8);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7F1F50();
  uint64_t v9 = sub_25A7F2010();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_25A7BD1C4((uint64_t)v8, &qword_26A4641C8);
    sub_25A7BC414();
    swift_allocError();
    unsigned char *v11 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v8, v9);
  }
}

unint64_t sub_25A7B5F28()
{
  uint64_t v1 = v0;
  unint64_t v242 = MEMORY[0x263F8EE78];
  uint64_t v2 = sub_25A7F1F30();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = *(void *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641D8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v240 = v0;
  uint64_t v241 = v6;
  uint64_t v7 = (char *)&v233 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v5)
  {
    v236 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v236((char *)&v233 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
LABEL_8:
    uint64_t v13 = sub_25A7BD1C4((uint64_t)v7, &qword_26A4641D8);
    uint64_t v14 = *(void *)(v0 + 48);
    if (!v14) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  v236 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v236(v7, 0, 1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) == 1) {
    goto LABEL_8;
  }
  v8 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v9 = v8((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7, v2);
  v239 = &v233;
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v10 = sub_25A7BC5C4(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v12 = *(void *)(v10 + 16);
  unint64_t v11 = *(void *)(v10 + 24);
  if (v12 >= v11 >> 1) {
    unint64_t v10 = sub_25A7BC5C4(v11 > 1, v12 + 1, 1, v10);
  }
  *(void *)(v10 + 16) = v12 + 1;
  v8((char *)(v10+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v12), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v242 = v10;
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  uint64_t v1 = v240;
  uint64_t v14 = *(void *)(v240 + 48);
  if (v14)
  {
LABEL_9:
    uint64_t v16 = *(void *)(v1 + 56);
    uint64_t v15 = *(void *)(v1 + 64);
    long long v243 = *(_OWORD *)(v1 + 32);
    uint64_t v244 = v14;
    uint64_t v245 = v16;
    uint64_t v246 = v15;
    uint64_t v17 = sub_25A7B8D8C();
    uint64_t v13 = sub_25A7BBBBC(v17);
  }
LABEL_10:
  v237 = (int *)&v233;
  uint64_t v18 = MEMORY[0x270FA5388](v13);
  uint64_t v19 = v1;
  unint64_t v20 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v21 = (char *)&v233 - v20;
  char v22 = *(unsigned char *)(v19 + 88);
  MEMORY[0x270FA5388](v18);
  v24 = (char *)&v233 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25A7BB1B8(v22, (uint64_t)v24);
  swift_bridgeObjectRelease();
  v238 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  v239 = (uint64_t (**)(char *, char *, uint64_t))(v3 + 48);
  if (v238(v24, 1, v2) == 1)
  {
    uint64_t v25 = sub_25A7BD1C4((uint64_t)v24, &qword_26A4641D8);
  }
  else
  {
    v235 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v26 = v235((char *)&v233 - v20, v24, v2);
    MEMORY[0x270FA5388](v26);
    v27 = (char *)&v233 - v20;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v20, (char *)&v233 - v20, v2);
    unint64_t v28 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v28 = sub_25A7BC5C4(0, *(void *)(v28 + 16) + 1, 1, v28);
    }
    unint64_t v30 = *(void *)(v28 + 16);
    unint64_t v29 = *(void *)(v28 + 24);
    if (v30 >= v29 >> 1) {
      unint64_t v28 = sub_25A7BC5C4(v29 > 1, v30 + 1, 1, v28);
    }
    *(void *)(v28 + 16) = v30 + 1;
    v235((char *)(v28+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v30), v27, v2);
    unint64_t v242 = v28;
    uint64_t v25 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v21, v2);
  }
  v237 = (int *)&v233;
  uint64_t v31 = MEMORY[0x270FA5388](v25);
  unint64_t v32 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v33 = (char *)&v233 - v32;
  char v34 = *(unsigned char *)(v240 + 112);
  MEMORY[0x270FA5388](v31);
  v36 = (char *)&v233 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25A7BB3D0(v34, (uint64_t)v36);
  swift_bridgeObjectRelease();
  if (v238(v36, 1, v2) == 1)
  {
    uint64_t v37 = sub_25A7BD1C4((uint64_t)v36, &qword_26A4641D8);
  }
  else
  {
    v235 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v38 = v235((char *)&v233 - v32, v36, v2);
    MEMORY[0x270FA5388](v38);
    v39 = (char *)&v233 - v32;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v32, (char *)&v233 - v32, v2);
    unint64_t v40 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v40 = sub_25A7BC5C4(0, *(void *)(v40 + 16) + 1, 1, v40);
    }
    unint64_t v42 = *(void *)(v40 + 16);
    unint64_t v41 = *(void *)(v40 + 24);
    if (v42 >= v41 >> 1) {
      unint64_t v40 = sub_25A7BC5C4(v41 > 1, v42 + 1, 1, v40);
    }
    *(void *)(v40 + 16) = v42 + 1;
    v235((char *)(v40+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v42), v39, v2);
    unint64_t v242 = v40;
    uint64_t v37 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v33, v2);
  }
  v237 = (int *)&v233;
  uint64_t v43 = MEMORY[0x270FA5388](v37);
  uint64_t v44 = *(void *)(v240 + 144);
  MEMORY[0x270FA5388](v43);
  v46 = (char *)&v233 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v44)
  {
    v236((char *)&v233 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  v236(v46, 0, 1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v46, 1, v2) == 1)
  {
LABEL_32:
    uint64_t v51 = sub_25A7BD1C4((uint64_t)v46, &qword_26A4641D8);
    goto LABEL_33;
  }
  v235 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v47 = v235((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v46, v2);
  MEMORY[0x270FA5388](v47);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v48 = v242;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v48 = sub_25A7BC5C4(0, *(void *)(v48 + 16) + 1, 1, v48);
  }
  unint64_t v50 = *(void *)(v48 + 16);
  unint64_t v49 = *(void *)(v48 + 24);
  if (v50 >= v49 >> 1) {
    unint64_t v48 = sub_25A7BC5C4(v49 > 1, v50 + 1, 1, v48);
  }
  *(void *)(v48 + 16) = v50 + 1;
  v235((char *)(v48+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v50), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v242 = v48;
  uint64_t v51 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
LABEL_33:
  v237 = (int *)&v233;
  uint64_t v52 = MEMORY[0x270FA5388](v51);
  uint64_t v53 = *(void *)(v240 + 176);
  MEMORY[0x270FA5388](v52);
  v55 = (char *)&v233 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v53)
  {
    v236((char *)&v233 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  v236(v55, 0, 1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v55, 1, v2) == 1)
  {
LABEL_41:
    uint64_t v60 = sub_25A7BD1C4((uint64_t)v55, &qword_26A4641D8);
    goto LABEL_42;
  }
  v235 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v56 = v235((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v55, v2);
  MEMORY[0x270FA5388](v56);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v57 = v242;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v57 = sub_25A7BC5C4(0, *(void *)(v57 + 16) + 1, 1, v57);
  }
  unint64_t v59 = *(void *)(v57 + 16);
  unint64_t v58 = *(void *)(v57 + 24);
  if (v59 >= v58 >> 1) {
    unint64_t v57 = sub_25A7BC5C4(v58 > 1, v59 + 1, 1, v57);
  }
  *(void *)(v57 + 16) = v59 + 1;
  v235((char *)(v57+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v59), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v242 = v57;
  uint64_t v60 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
LABEL_42:
  v237 = (int *)&v233;
  uint64_t v61 = MEMORY[0x270FA5388](v60);
  unint64_t v62 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v63 = (char *)&v233 - v62;
  uint64_t v64 = *(void *)(v240 + 200);
  MEMORY[0x270FA5388](v61);
  v66 = (char *)&v233 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB9F8(v64, (void (*)(uint64_t, uint64_t))sub_25A7BCAB4, (uint64_t)v66);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v66, 1, v2) == 1)
  {
    uint64_t v67 = sub_25A7BD1C4((uint64_t)v66, &qword_26A4641D8);
  }
  else
  {
    v235 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v68 = v235((char *)&v233 - v62, v66, v2);
    MEMORY[0x270FA5388](v68);
    v69 = (char *)&v233 - v62;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v62, (char *)&v233 - v62, v2);
    unint64_t v70 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v70 = sub_25A7BC5C4(0, *(void *)(v70 + 16) + 1, 1, v70);
    }
    unint64_t v72 = *(void *)(v70 + 16);
    unint64_t v71 = *(void *)(v70 + 24);
    if (v72 >= v71 >> 1) {
      unint64_t v70 = sub_25A7BC5C4(v71 > 1, v72 + 1, 1, v70);
    }
    *(void *)(v70 + 16) = v72 + 1;
    v235((char *)(v70+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v72), v69, v2);
    unint64_t v242 = v70;
    uint64_t v67 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v63, v2);
  }
  MEMORY[0x270FA5388](v67);
  unint64_t v73 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v74 = (char *)&v233 - v73;
  v237 = (int *)type metadata accessor for TapToRadarDraft();
  MEMORY[0x270FA5388](v237);
  v76 = (char *)&v233 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7BB554((uint64_t)v76);
  if (v238(v76, 1, v2) == 1)
  {
    uint64_t v77 = sub_25A7BD1C4((uint64_t)v76, &qword_26A4641D8);
  }
  else
  {
    v234 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v78 = v234((char *)&v233 - v73, v76, v2);
    MEMORY[0x270FA5388](v78);
    v79 = (char *)&v233 - v73;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v73, (char *)&v233 - v73, v2);
    unint64_t v80 = v242;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v235 = (uint64_t (*)(char *, char *, uint64_t))&v233;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v80 = sub_25A7BC5C4(0, *(void *)(v80 + 16) + 1, 1, v80);
    }
    unint64_t v83 = *(void *)(v80 + 16);
    unint64_t v82 = *(void *)(v80 + 24);
    if (v83 >= v82 >> 1) {
      unint64_t v80 = sub_25A7BC5C4(v82 > 1, v83 + 1, 1, v80);
    }
    *(void *)(v80 + 16) = v83 + 1;
    v234((char *)(v80+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v83), v79, v2);
    unint64_t v242 = v80;
    uint64_t v77 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v74, v2);
  }
  v235 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v84 = MEMORY[0x270FA5388](v77);
  unint64_t v85 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v86 = (char *)&v233 - v85;
  uint64_t v87 = *(void *)(v240 + v237[12] + 16);
  MEMORY[0x270FA5388](v84);
  v89 = (char *)&v233 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB828(v87, (uint64_t)v89);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v89, 1, v2) == 1)
  {
    uint64_t v90 = sub_25A7BD1C4((uint64_t)v89, &qword_26A4641D8);
  }
  else
  {
    v234 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v91 = v234((char *)&v233 - v85, v89, v2);
    MEMORY[0x270FA5388](v91);
    v92 = (char *)&v233 - v85;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v85, (char *)&v233 - v85, v2);
    unint64_t v93 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v93 = sub_25A7BC5C4(0, *(void *)(v93 + 16) + 1, 1, v93);
    }
    unint64_t v95 = *(void *)(v93 + 16);
    unint64_t v94 = *(void *)(v93 + 24);
    if (v95 >= v94 >> 1) {
      unint64_t v93 = sub_25A7BC5C4(v94 > 1, v95 + 1, 1, v93);
    }
    *(void *)(v93 + 16) = v95 + 1;
    v234((char *)(v93+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v95), v92, v2);
    unint64_t v242 = v93;
    uint64_t v90 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v86, v2);
  }
  v235 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v96 = MEMORY[0x270FA5388](v90);
  unint64_t v97 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v98 = (char *)&v233 - v97;
  uint64_t v99 = *(void *)(v240 + v237[13] + 16);
  MEMORY[0x270FA5388](v96);
  v101 = (char *)&v233 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB828(v99, (uint64_t)v101);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v101, 1, v2) == 1)
  {
    uint64_t v102 = sub_25A7BD1C4((uint64_t)v101, &qword_26A4641D8);
  }
  else
  {
    v234 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v103 = v234((char *)&v233 - v97, v101, v2);
    MEMORY[0x270FA5388](v103);
    v104 = (char *)&v233 - v97;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v97, (char *)&v233 - v97, v2);
    unint64_t v105 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v105 = sub_25A7BC5C4(0, *(void *)(v105 + 16) + 1, 1, v105);
    }
    unint64_t v107 = *(void *)(v105 + 16);
    unint64_t v106 = *(void *)(v105 + 24);
    if (v107 >= v106 >> 1) {
      unint64_t v105 = sub_25A7BC5C4(v106 > 1, v107 + 1, 1, v105);
    }
    *(void *)(v105 + 16) = v107 + 1;
    v234((char *)(v105+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v107), v104, v2);
    unint64_t v242 = v105;
    uint64_t v102 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v98, v2);
  }
  v235 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v108 = MEMORY[0x270FA5388](v102);
  unint64_t v109 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v110 = (char *)&v233 - v109;
  uint64_t v111 = *(void *)(v240 + v237[14] + 16);
  MEMORY[0x270FA5388](v108);
  v113 = (char *)&v233 - ((v112 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB9F8(v111, (void (*)(uint64_t, uint64_t))sub_25A7BCF08, (uint64_t)v113);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v113, 1, v2) == 1)
  {
    uint64_t v114 = sub_25A7BD1C4((uint64_t)v113, &qword_26A4641D8);
  }
  else
  {
    v234 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v115 = v234((char *)&v233 - v109, v113, v2);
    MEMORY[0x270FA5388](v115);
    v116 = (char *)&v233 - v109;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v109, (char *)&v233 - v109, v2);
    unint64_t v117 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v117 = sub_25A7BC5C4(0, *(void *)(v117 + 16) + 1, 1, v117);
    }
    unint64_t v119 = *(void *)(v117 + 16);
    unint64_t v118 = *(void *)(v117 + 24);
    if (v119 >= v118 >> 1) {
      unint64_t v117 = sub_25A7BC5C4(v118 > 1, v119 + 1, 1, v117);
    }
    *(void *)(v117 + 16) = v119 + 1;
    v234((char *)(v117+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v119), v116, v2);
    unint64_t v242 = v117;
    uint64_t v114 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v110, v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v120 = MEMORY[0x270FA5388](v114);
  unint64_t v121 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v122 = (char *)&v233 - v121;
  MEMORY[0x270FA5388](v120);
  v124 = (char *)&v233 - ((v123 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  swift_bridgeObjectRelease();
  v235 = (uint64_t (*)(char *, char *, uint64_t))(v3 + 56);
  v236(v124, 0, 1, v2);
  swift_bridgeObjectRelease();
  if (v238(v124, 1, v2) == 1)
  {
    uint64_t v125 = sub_25A7BD1C4((uint64_t)v124, &qword_26A4641D8);
  }
  else
  {
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v126 = v233((char *)&v233 - v121, v124, v2);
    MEMORY[0x270FA5388](v126);
    v127 = (char *)&v233 - v121;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v121, (char *)&v233 - v121, v2);
    unint64_t v128 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v128 = sub_25A7BC5C4(0, *(void *)(v128 + 16) + 1, 1, v128);
    }
    unint64_t v130 = *(void *)(v128 + 16);
    unint64_t v129 = *(void *)(v128 + 24);
    if (v130 >= v129 >> 1) {
      unint64_t v128 = sub_25A7BC5C4(v129 > 1, v130 + 1, 1, v128);
    }
    *(void *)(v128 + 16) = v130 + 1;
    v233((char *)(v128+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v130), v127, v2);
    unint64_t v242 = v128;
    uint64_t v125 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v122, v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v131 = MEMORY[0x270FA5388](v125);
  unint64_t v132 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v133 = (char *)&v233 - v132;
  uint64_t v134 = *(void *)(v240 + v237[16] + 16);
  MEMORY[0x270FA5388](v131);
  v136 = (char *)&v233 - ((v135 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB9F8(v134, (void (*)(uint64_t, uint64_t))sub_25A7BCF08, (uint64_t)v136);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v136, 1, v2) == 1)
  {
    uint64_t v137 = sub_25A7BD1C4((uint64_t)v136, &qword_26A4641D8);
  }
  else
  {
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v138 = v233((char *)&v233 - v132, v136, v2);
    MEMORY[0x270FA5388](v138);
    v139 = (char *)&v233 - v132;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v132, (char *)&v233 - v132, v2);
    unint64_t v140 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v140 = sub_25A7BC5C4(0, *(void *)(v140 + 16) + 1, 1, v140);
    }
    unint64_t v142 = *(void *)(v140 + 16);
    unint64_t v141 = *(void *)(v140 + 24);
    if (v142 >= v141 >> 1) {
      unint64_t v140 = sub_25A7BC5C4(v141 > 1, v142 + 1, 1, v140);
    }
    *(void *)(v140 + 16) = v142 + 1;
    v233((char *)(v140+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v142), v139, v2);
    unint64_t v242 = v140;
    uint64_t v137 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v133, v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v143 = MEMORY[0x270FA5388](v137);
  unint64_t v144 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v145 = (char *)&v233 - v144;
  uint64_t v146 = *(void *)(v240 + v237[17] + 16);
  MEMORY[0x270FA5388](v143);
  v148 = (char *)&v233 - ((v147 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB9F8(v146, (void (*)(uint64_t, uint64_t))sub_25A7BD038, (uint64_t)v148);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v148, 1, v2) == 1)
  {
    uint64_t v149 = sub_25A7BD1C4((uint64_t)v148, &qword_26A4641D8);
  }
  else
  {
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v150 = v233((char *)&v233 - v144, v148, v2);
    MEMORY[0x270FA5388](v150);
    v151 = (char *)&v233 - v144;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v144, (char *)&v233 - v144, v2);
    unint64_t v152 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v152 = sub_25A7BC5C4(0, *(void *)(v152 + 16) + 1, 1, v152);
    }
    unint64_t v154 = *(void *)(v152 + 16);
    unint64_t v153 = *(void *)(v152 + 24);
    if (v154 >= v153 >> 1) {
      unint64_t v152 = sub_25A7BC5C4(v153 > 1, v154 + 1, 1, v152);
    }
    *(void *)(v152 + 16) = v154 + 1;
    v233((char *)(v152+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v154), v151, v2);
    unint64_t v242 = v152;
    uint64_t v149 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v145, v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v155 = MEMORY[0x270FA5388](v149);
  unint64_t v156 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v157 = (char *)&v233 - v156;
  uint64_t v158 = *(void *)(v240 + v237[18] + 16);
  MEMORY[0x270FA5388](v155);
  v160 = (char *)&v233 - ((v159 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB9F8(v158, (void (*)(uint64_t, uint64_t))sub_25A7BCF08, (uint64_t)v160);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v160, 1, v2) == 1)
  {
    uint64_t v161 = sub_25A7BD1C4((uint64_t)v160, &qword_26A4641D8);
  }
  else
  {
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v162 = v233((char *)&v233 - v156, v160, v2);
    MEMORY[0x270FA5388](v162);
    v163 = (char *)&v233 - v156;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v156, (char *)&v233 - v156, v2);
    unint64_t v164 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v164 = sub_25A7BC5C4(0, *(void *)(v164 + 16) + 1, 1, v164);
    }
    unint64_t v166 = *(void *)(v164 + 16);
    unint64_t v165 = *(void *)(v164 + 24);
    if (v166 >= v165 >> 1) {
      unint64_t v164 = sub_25A7BC5C4(v165 > 1, v166 + 1, 1, v164);
    }
    *(void *)(v164 + 16) = v166 + 1;
    v233((char *)(v164+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v166), v163, v2);
    unint64_t v242 = v164;
    uint64_t v161 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v157, v2);
  }
  uint64_t v167 = MEMORY[0x270FA5388](v161);
  uint64_t v168 = *(void *)(v240 + v237[19] + 16);
  MEMORY[0x270FA5388](v167);
  v170 = (char *)&v233 - ((v169 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25A7BA5AC(v168);
  if (v171)
  {
    sub_25A7F1F20();
    swift_bridgeObjectRelease();
    uint64_t v172 = 0;
  }
  else
  {
    uint64_t v172 = 1;
  }
  v236(v170, v172, 1, v2);
  swift_bridgeObjectRelease();
  if (v238(v170, 1, v2) == 1)
  {
    uint64_t v173 = sub_25A7BD1C4((uint64_t)v170, &qword_26A4641D8);
  }
  else
  {
    v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v174 = v233((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v170, v2);
    MEMORY[0x270FA5388](v174);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    unint64_t v175 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v175 = sub_25A7BC5C4(0, *(void *)(v175 + 16) + 1, 1, v175);
    }
    unint64_t v177 = *(void *)(v175 + 16);
    unint64_t v176 = *(void *)(v175 + 24);
    if (v177 >= v176 >> 1) {
      unint64_t v175 = sub_25A7BC5C4(v176 > 1, v177 + 1, 1, v175);
    }
    *(void *)(v175 + 16) = v177 + 1;
    v233((char *)(v175+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v177), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    unint64_t v242 = v175;
    uint64_t v173 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v178 = MEMORY[0x270FA5388](v173);
  unint64_t v179 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v180 = (char *)&v233 - v179;
  MEMORY[0x270FA5388](v178);
  v182 = (char *)&v233 - ((v181 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  swift_bridgeObjectRelease();
  v236(v182, 0, 1, v2);
  swift_bridgeObjectRelease();
  if (v238(v182, 1, v2) == 1)
  {
    uint64_t v183 = sub_25A7BD1C4((uint64_t)v182, &qword_26A4641D8);
  }
  else
  {
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v184 = v233((char *)&v233 - v179, v182, v2);
    MEMORY[0x270FA5388](v184);
    v185 = (char *)&v233 - v179;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v179, (char *)&v233 - v179, v2);
    unint64_t v186 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v186 = sub_25A7BC5C4(0, *(void *)(v186 + 16) + 1, 1, v186);
    }
    unint64_t v188 = *(void *)(v186 + 16);
    unint64_t v187 = *(void *)(v186 + 24);
    if (v188 >= v187 >> 1) {
      unint64_t v186 = sub_25A7BC5C4(v187 > 1, v188 + 1, 1, v186);
    }
    *(void *)(v186 + 16) = v188 + 1;
    v233((char *)(v186+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v188), v185, v2);
    unint64_t v242 = v186;
    uint64_t v183 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v180, v2);
  }
  uint64_t v189 = MEMORY[0x270FA5388](v183);
  char v190 = *(unsigned char *)(v240 + v237[21] + 16);
  MEMORY[0x270FA5388](v189);
  v192 = (char *)&v233 - ((v191 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_25A7BAD30(v190);
  if (v193)
  {
    sub_25A7F1F20();
    swift_bridgeObjectRelease();
    uint64_t v194 = 0;
  }
  else
  {
    uint64_t v194 = 1;
  }
  v236(v192, v194, 1, v2);
  swift_bridgeObjectRelease();
  if (v238(v192, 1, v2) == 1)
  {
    uint64_t v195 = sub_25A7BD1C4((uint64_t)v192, &qword_26A4641D8);
  }
  else
  {
    v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v196 = v233((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v192, v2);
    MEMORY[0x270FA5388](v196);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    unint64_t v197 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v197 = sub_25A7BC5C4(0, *(void *)(v197 + 16) + 1, 1, v197);
    }
    unint64_t v199 = *(void *)(v197 + 16);
    unint64_t v198 = *(void *)(v197 + 24);
    if (v199 >= v198 >> 1) {
      unint64_t v197 = sub_25A7BC5C4(v198 > 1, v199 + 1, 1, v197);
    }
    *(void *)(v197 + 16) = v199 + 1;
    v233((char *)(v197+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v199), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    unint64_t v242 = v197;
    uint64_t v195 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v200 = MEMORY[0x270FA5388](v195);
  unint64_t v201 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v202 = (char *)&v233 - v201;
  uint64_t v203 = *(void *)(v240 + v237[22] + 16);
  MEMORY[0x270FA5388](v200);
  v205 = (char *)&v233 - ((v204 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7BB9F8(v203, (void (*)(uint64_t, uint64_t))sub_25A7BCF08, (uint64_t)v205);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v205, 1, v2) == 1)
  {
    uint64_t v206 = sub_25A7BD1C4((uint64_t)v205, &qword_26A4641D8);
  }
  else
  {
    v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v207 = v233((char *)&v233 - v201, v205, v2);
    MEMORY[0x270FA5388](v207);
    v208 = (char *)&v233 - v201;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - v201, (char *)&v233 - v201, v2);
    unint64_t v209 = v242;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v209 = sub_25A7BC5C4(0, *(void *)(v209 + 16) + 1, 1, v209);
    }
    unint64_t v211 = *(void *)(v209 + 16);
    unint64_t v210 = *(void *)(v209 + 24);
    if (v211 >= v210 >> 1) {
      unint64_t v209 = sub_25A7BC5C4(v210 > 1, v211 + 1, 1, v209);
    }
    *(void *)(v209 + 16) = v211 + 1;
    v233((char *)(v209+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v211), v208, v2);
    unint64_t v242 = v209;
    uint64_t v206 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v202, v2);
  }
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v212 = MEMORY[0x270FA5388](v206);
  uint64_t v213 = *(void *)(v240 + v237[23] + 24);
  MEMORY[0x270FA5388](v212);
  v215 = (char *)&v233 - ((v214 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v213)
  {
    v236((char *)&v233 - ((v214 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
    goto LABEL_147;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  v236(v215, 0, 1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v215, 1, v2) == 1)
  {
LABEL_147:
    uint64_t v220 = sub_25A7BD1C4((uint64_t)v215, &qword_26A4641D8);
    goto LABEL_148;
  }
  v233 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v216 = v233((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v215, v2);
  MEMORY[0x270FA5388](v216);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v217 = v242;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v217 = sub_25A7BC5C4(0, *(void *)(v217 + 16) + 1, 1, v217);
  }
  unint64_t v219 = *(void *)(v217 + 16);
  unint64_t v218 = *(void *)(v217 + 24);
  if (v219 >= v218 >> 1) {
    unint64_t v217 = sub_25A7BC5C4(v218 > 1, v219 + 1, 1, v217);
  }
  *(void *)(v217 + 16) = v219 + 1;
  v233((char *)(v217+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v219), (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  unint64_t v242 = v217;
  uint64_t v220 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
LABEL_148:
  v234 = (uint64_t (*)(char *, char *, uint64_t))&v233;
  uint64_t v221 = MEMORY[0x270FA5388](v220);
  v222 = (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v223 = *(void *)(v240 + v237[24] + 24);
  MEMORY[0x270FA5388](v221);
  v225 = (char *)&v233 - ((v224 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v223)
  {
    v236((char *)&v233 - ((v224 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
    goto LABEL_156;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A7F1F20();
  v236(v225, 0, 1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v238(v225, 1, v2) == 1)
  {
LABEL_156:
    sub_25A7BD1C4((uint64_t)v225, &qword_26A4641D8);
    return v242;
  }
  v226 = *(uint64_t (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v227 = v226((char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v225, v2);
  MEMORY[0x270FA5388](v227);
  v228 = (char *)&v233 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v228, v222, v2);
  unint64_t v229 = v242;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v229 = sub_25A7BC5C4(0, *(void *)(v229 + 16) + 1, 1, v229);
  }
  unint64_t v231 = *(void *)(v229 + 16);
  unint64_t v230 = *(void *)(v229 + 24);
  if (v231 >= v230 >> 1) {
    unint64_t v229 = sub_25A7BC5C4(v230 > 1, v231 + 1, 1, v229);
  }
  *(void *)(v229 + 16) = v231 + 1;
  v226((char *)(v229+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v231), v228, v2);
  unint64_t v242 = v229;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v222, v2);
  return v242;
}

uint64_t sub_25A7B8BB0()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_25A7B8BD0, 0, 0);
}

uint64_t sub_25A7B8BD0()
{
  uint64_t v1 = sub_25A7F2010();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  sub_25A7B5CDC(v3);
  id v4 = objc_msgSend(self, sel_defaultWorkspace);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = (void *)sub_25A7F1FF0();
    sub_25A7C9D80(MEMORY[0x263F8EE78]);
    uint64_t v7 = (void *)sub_25A7F2FB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_openSensitiveURL_withOptions_, v6, v7);
  }
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_task_dealloc();
  v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_25A7B8D8C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641E0);
  sub_25A7F1F30();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25A7F3A00;
  sub_25A7F3390();
  sub_25A7F1F20();
  swift_bridgeObjectRelease();
  sub_25A7F1F20();
  sub_25A7F1F20();
  return v0;
}

uint64_t sub_25A7B8F00()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7B8FA0()
{
  sub_25A7F3430();
  swift_bridgeObjectRetain();
  sub_25A7F3050();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25A7F3050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A7B9030()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7B90CC(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_25A7BFD74(v5, v7) & 1;
}

unint64_t sub_25A7B9118(char a1)
{
  unint64_t result = 0x7974697275636553;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x7265776F50;
      break;
    case 3:
      unint64_t result = 0x616D726F66726550;
      break;
    case 4:
      unint64_t result = 0x69626173552F4955;
      break;
    case 5:
      unint64_t result = 0x2073756F69726553;
      break;
    case 6:
      unint64_t result = 0x754220726568744FLL;
      break;
    case 7:
      unint64_t result = 0x2065727574616546;
      break;
    case 8:
      unint64_t result = 0x6D65636E61686E45;
      break;
    case 9:
      unint64_t result = 1802723668;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_25A7B927C(char a1)
{
  unint64_t result = 0x7974697275636553;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x7265776F50;
      break;
    case 3:
      unint64_t result = 0x616D726F66726550;
      break;
    case 4:
      unint64_t result = 0x69626173552F4955;
      break;
    case 5:
      unint64_t result = 0x2073756F69726553;
      break;
    case 6:
      unint64_t result = 0x754220726568744FLL;
      break;
    case 7:
      unint64_t result = 0x2065727574616546;
      break;
    case 8:
      unint64_t result = 0x6D65636E61686E45;
      break;
    case 9:
      unint64_t result = 1802723668;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A7B93E0(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_25A7B927C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_25A7B927C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25A7F33A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A7B946C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x737961776C41;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x737961776C41;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x656D6974656D6F53;
      unint64_t v3 = 0xE900000000000073;
      break;
    case 2:
      uint64_t v5 = 0x796C65726152;
      break;
    case 3:
      uint64_t v5 = 0x656C62616E55;
      break;
    case 4:
      uint64_t v5 = 0x74276E6469442049;
      unint64_t v3 = 0xEC00000079725420;
      break;
    case 5:
      uint64_t v5 = 0x6C70704120746F4ELL;
      unint64_t v3 = 0xEE00656C62616369;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000073;
      if (v5 == 0x656D6974656D6F53) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      if (v5 != 0x796C65726152) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      if (v5 != 0x656C62616E55) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v2 = 0x74276E6469442049;
      unint64_t v6 = 0xEC00000079725420;
      goto LABEL_15;
    case 5:
      unint64_t v6 = 0xEE00656C62616369;
      if (v5 != 0x6C70704120746F4ELL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_25A7F33A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A7B9680(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 7105633;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 7105633;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE100000000000000;
      unint64_t v5 = 48;
      break;
    case 2:
      unint64_t v3 = 0xE200000000000000;
      unint64_t v5 = 12589;
      break;
    case 3:
      unint64_t v6 = "sysdiagnose-only";
      goto LABEL_7;
    case 4:
      unint64_t v6 = "log-archive-only";
      goto LABEL_7;
    case 5:
      unint64_t v6 = "full-log-archive";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 6:
      unint64_t v5 = 0xD00000000000001CLL;
      unint64_t v3 = 0x800000025A7F4BE0;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE100000000000000;
      if (v5 == 48) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v7 = 0xE200000000000000;
      if (v5 != 12589) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      char v8 = "sysdiagnose-only";
      goto LABEL_17;
    case 4:
      char v8 = "log-archive-only";
      goto LABEL_17;
    case 5:
      char v8 = "full-log-archive";
LABEL_17:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v2 = 0xD000000000000010;
      goto LABEL_18;
    case 6:
      unint64_t v7 = 0x800000025A7F4BE0;
      if (v5 != 0xD00000000000001CLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_22:
      }
        char v9 = sub_25A7F33A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_25A7B985C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x656E6F685069;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x656E6F685069;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1684099177;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6863746157;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x5654656C707041;
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x646F50656D6F48;
      break;
    case 5:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 6512973;
      break;
    case 6:
      uint64_t v5 = 0x6E6F69736956;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1684099177) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6863746157) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x5654656C707041) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x646F50656D6F48) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v2 = 6512973;
      goto LABEL_18;
    case 6:
      if (v5 != 0x6E6F69736956) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_25A7F33A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A7B9A68()
{
  char v1 = *v0;
  sub_25A7F3420();
  sub_25A7B927C(v1);
  sub_25A7F3050();
  swift_bridgeObjectRelease();
  return sub_25A7F3440();
}

uint64_t sub_25A7B9ACC()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7B9BE4()
{
  sub_25A7B927C(*v0);
  sub_25A7F3050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A7B9C38()
{
  sub_25A7F3050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A7B9D28()
{
  char v1 = *v0;
  sub_25A7F3420();
  sub_25A7B927C(v1);
  sub_25A7F3050();
  swift_bridgeObjectRelease();
  return sub_25A7F3440();
}

uint64_t sub_25A7B9D88()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7B9E94()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7B9F94()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7BA0A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A7BFE14();
  *a1 = result;
  return result;
}

unint64_t sub_25A7BA0D8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A7B927C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A7BA104()
{
  return sub_25A7B9118(*v0);
}

uint64_t sub_25A7BA10C(unsigned __int8 *a1, char *a2)
{
  return sub_25A7B946C(*a1, *a2);
}

uint64_t sub_25A7BA118()
{
  return sub_25A7B9ACC();
}

uint64_t sub_25A7BA120()
{
  sub_25A7F3050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A7BA220()
{
  return sub_25A7B9F94();
}

uint64_t sub_25A7BA228@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A7BFE60();
  *a1 = result;
  return result;
}

void sub_25A7BA258(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x737961776C41;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000073;
      uint64_t v3 = 0x656D6974656D6F53;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x796C65726152;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 3:
      *(void *)a1 = 0x656C62616E55;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 4:
      strcpy((char *)a1, "I Didn't Try");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 5:
      strcpy((char *)a1, "Not Applicable");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_25A7BA338()
{
  return *(void *)&aAlways_1[8 * *v0];
}

uint64_t sub_25A7BA35C(unsigned __int8 *a1, char *a2)
{
  return sub_25A7B985C(*a1, *a2);
}

uint64_t sub_25A7BA368()
{
  return sub_25A7B9D88();
}

uint64_t sub_25A7BA374()
{
  sub_25A7F3050();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A7BA46C()
{
  return sub_25A7B9D88();
}

uint64_t sub_25A7BA474@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A7C0610();
  *a1 = result;
  return result;
}

void sub_25A7BA4AC(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x656E6F685069;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1684099177;
      goto LABEL_3;
    case 2:
      *a1 = 0x6863746157;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 0x5654656C707041;
      a1[1] = 0xE700000000000000;
      break;
    case 4:
      *a1 = 0x646F50656D6F48;
      a1[1] = 0xE700000000000000;
      break;
    case 5:
      *a1 = 6512973;
      a1[1] = 0xE300000000000000;
      break;
    case 6:
      *a1 = 0x6E6F69736956;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_25A7BA588()
{
  return *(void *)&aIphone_1[8 * *v0];
}

uint64_t sub_25A7BA5AC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (a1)
    {
      unint64_t v2 = sub_25A7BC4B4(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v4 = v2[2];
      unint64_t v3 = v2[3];
      if (v4 >= v3 >> 1) {
        unint64_t v2 = sub_25A7BC4B4((void *)(v3 > 1), v4 + 1, 1, v2);
      }
      v2[2] = v4 + 1;
      uint64_t v5 = &v2[2 * v4];
      v5[4] = 0x79616C50726941;
      v5[5] = 0xE700000000000000;
      if ((v1 & 2) == 0)
      {
LABEL_14:
        if ((v1 & 4) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
          }
          unint64_t v10 = v2[2];
          unint64_t v9 = v2[3];
          if (v10 >= v9 >> 1) {
            unint64_t v2 = sub_25A7BC4B4((void *)(v9 > 1), v10 + 1, 1, v2);
          }
          v2[2] = v10 + 1;
          unint64_t v11 = (char *)&v2[2 * v10];
          strcpy(v11 + 32, "MediaSystems");
          v11[45] = 0;
          *((_WORD *)v11 + 23) = -5120;
        }
        if ((v1 & 8) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
          }
          unint64_t v13 = v2[2];
          unint64_t v12 = v2[3];
          if (v13 >= v12 >> 1) {
            unint64_t v2 = sub_25A7BC4B4((void *)(v12 > 1), v13 + 1, 1, v2);
          }
          v2[2] = v13 + 1;
          uint64_t v14 = &v2[2 * v13];
          v14[4] = 0x616C506572616853;
          v14[5] = 0xE900000000000079;
          if ((v1 & 0x10) == 0)
          {
LABEL_22:
            if ((v1 & 0x20) == 0) {
              goto LABEL_23;
            }
            goto LABEL_36;
          }
        }
        else if ((v1 & 0x10) == 0)
        {
          goto LABEL_22;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
        }
        unint64_t v16 = v2[2];
        unint64_t v15 = v2[3];
        if (v16 >= v15 >> 1) {
          unint64_t v2 = sub_25A7BC4B4((void *)(v15 > 1), v16 + 1, 1, v2);
        }
        v2[2] = v16 + 1;
        uint64_t v17 = &v2[2 * v16];
        v17[4] = 0x79627261654ELL;
        v17[5] = 0xE600000000000000;
        if ((v1 & 0x20) == 0)
        {
LABEL_23:
          if ((v1 & 0x40) == 0) {
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_36:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
        }
        unint64_t v19 = v2[2];
        unint64_t v18 = v2[3];
        if (v19 >= v18 >> 1) {
          unint64_t v2 = sub_25A7BC4B4((void *)(v18 > 1), v19 + 1, 1, v2);
        }
        v2[2] = v19 + 1;
        unint64_t v20 = &v2[2 * v19];
        v20[4] = 0x657463656E6E6F43;
        v20[5] = 0xE900000000000064;
        if ((v1 & 0x40) == 0)
        {
LABEL_24:
          if ((v1 & 0x80) == 0)
          {
LABEL_51:
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641B0);
            sub_25A7BC370();
            uint64_t v1 = sub_25A7F2FD0();
            swift_bridgeObjectRelease();
            return v1;
          }
LABEL_46:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
          }
          unint64_t v25 = v2[2];
          unint64_t v24 = v2[3];
          if (v25 >= v24 >> 1) {
            unint64_t v2 = sub_25A7BC4B4((void *)(v24 > 1), v25 + 1, 1, v2);
          }
          v2[2] = v25 + 1;
          uint64_t v26 = &v2[2 * v25];
          v26[4] = 0xD000000000000016;
          v26[5] = 0x800000025A7F4E10;
          goto LABEL_51;
        }
LABEL_41:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
        }
        unint64_t v22 = v2[2];
        unint64_t v21 = v2[3];
        if (v22 >= v21 >> 1) {
          unint64_t v2 = sub_25A7BC4B4((void *)(v21 > 1), v22 + 1, 1, v2);
        }
        v2[2] = v22 + 1;
        uint64_t v23 = &v2[2 * v22];
        v23[4] = 0x61656854656D6F48;
        v23[5] = 0xEB00000000726574;
        if ((v1 & 0x80) == 0) {
          goto LABEL_51;
        }
        goto LABEL_46;
      }
    }
    else
    {
      unint64_t v2 = (void *)MEMORY[0x263F8EE78];
      if ((a1 & 2) == 0) {
        goto LABEL_14;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v2 = sub_25A7BC4B4(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      unint64_t v2 = sub_25A7BC4B4((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    char v8 = &v2[2 * v7];
    v8[4] = 0x4874694B656D6F48;
    v8[5] = 0xEB00000000656D6FLL;
    goto LABEL_14;
  }
  return v1;
}

void *sub_25A7BAA68@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25A7BAA74()
{
  return sub_25A7BA5AC(*v0);
}

uint64_t sub_25A7BAA7C()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7BAAC4()
{
  return sub_25A7F3430();
}

uint64_t sub_25A7BAAF0()
{
  return sub_25A7F3440();
}

void sub_25A7BAB34(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25A7BAB3C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_25A7BAB50@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_25A7BAB64@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_25A7BAB78(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_25A7BABA8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_25A7BABD4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_25A7BABF8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_25A7BAC0C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_25A7BAC20(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_25A7BAC34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_25A7BAC48(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_25A7BAC5C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_25A7BAC70(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_25A7BAC84()
{
  return *v0 == 0;
}

uint64_t sub_25A7BAC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_25A7BACAC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_25A7BACC0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25A7BACD0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25A7BACDC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25A7BACF0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_25A7BC82C(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

unint64_t sub_25A7BAD30(char a1)
{
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      char v2 = sub_25A7F33A0();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_4;
      }
      unint64_t result = 48;
      switch(a1)
      {
        case 2:
          unint64_t result = 12589;
          break;
        case 3:
        case 4:
        case 5:
          unint64_t result = 0xD000000000000010;
          break;
        case 6:
          unint64_t result = 0xD00000000000001CLL;
          break;
        default:
          return result;
      }
      break;
    default:
      swift_bridgeObjectRelease();
LABEL_4:
      unint64_t result = 0;
      break;
  }
  return result;
}

unint64_t sub_25A7BAEE0(char a1)
{
  unint64_t result = 7105633;
  switch(a1)
  {
    case 1:
      unint64_t result = 48;
      break;
    case 2:
      unint64_t result = 12589;
      break;
    case 3:
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A7BAF9C(unsigned __int8 *a1, char *a2)
{
  return sub_25A7B9680(*a1, *a2);
}

uint64_t sub_25A7BAFA8()
{
  return sub_25A7B9E94();
}

uint64_t sub_25A7BAFB4()
{
  return sub_25A7B9C38();
}

uint64_t sub_25A7BAFBC()
{
  return sub_25A7B9E94();
}

uint64_t sub_25A7BAFC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A7C0610();
  *a1 = result;
  return result;
}

unint64_t sub_25A7BAFFC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A7BAEE0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A7BB028()
{
  return sub_25A7BAD30(*v0);
}

unint64_t sub_25A7BB030(char a1)
{
  if (!a1) {
    return 0xD000000000000028;
  }
  if (a1 == 1) {
    return 0xD00000000000001DLL;
  }
  return 0xD00000000000002DLL;
}

BOOL sub_25A7BB08C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25A7BB0A0()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7BB0E8()
{
  return sub_25A7F3430();
}

uint64_t sub_25A7BB114()
{
  return sub_25A7F3440();
}

unint64_t sub_25A7BB158()
{
  return sub_25A7BB030(*v0);
}

uint64_t sub_25A7BB160()
{
  return sub_25A7F1FB0();
}

uint64_t sub_25A7BB178()
{
  return sub_25A7F1FC0();
}

uint64_t sub_25A7BB190()
{
  return sub_25A7F1FA0();
}

uint64_t sub_25A7BB1B8@<X0>(char a1@<W2>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 10:
      uint64_t v3 = sub_25A7F1F30();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
      uint64_t v5 = v3;
      uint64_t v6 = a2;
      uint64_t v7 = 1;
      break;
    default:
      sub_25A7F1F20();
      swift_bridgeObjectRelease();
      uint64_t v8 = sub_25A7F1F30();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
      uint64_t v5 = v8;
      uint64_t v6 = a2;
      uint64_t v7 = 0;
      break;
  }
  return v4(v6, v7, 1, v5);
}

uint64_t sub_25A7BB3D0@<X0>(char a1@<W2>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 6:
      uint64_t v9 = sub_25A7F1F30();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
      uint64_t v5 = v9;
      uint64_t v6 = a2;
      uint64_t v7 = 1;
      break;
    default:
      sub_25A7F1F20();
      swift_bridgeObjectRelease();
      uint64_t v3 = sub_25A7F1F30();
      unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
      uint64_t v5 = v3;
      uint64_t v6 = a2;
      uint64_t v7 = 0;
      break;
  }
  return v4(v6, v7, 1, v5);
}

uint64_t sub_25A7BB554@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  uint64_t v4 = sub_25A7F2050();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7BD15C(v3, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
  {
    sub_25A7BD1C4((uint64_t)v9, qword_26A4641F8);
    uint64_t v10 = sub_25A7F1F30();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v9, v4);
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08788]), sel_init);
    unint64_t v13 = (void *)sub_25A7F2FF0();
    objc_msgSend(v12, sel_setDateFormat_, v13);

    objc_msgSend(v12, sel_setDoesRelativeDateFormatting_, 0);
    uint64_t v14 = (void *)sub_25A7F2030();
    id v15 = objc_msgSend(v12, sel_stringFromDate_, v14);

    sub_25A7F3000();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_25A7F1F20();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25A7F1F30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 0, 1, v16);
  }
}

uint64_t sub_25A7BB828@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    MEMORY[0x270FA5388]();
    sub_25A7F2010();
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    sub_25A7BCBD8(a1, KeyPath);
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641B0);
    sub_25A7BC370();
    sub_25A7F2FD0();
    swift_bridgeObjectRelease();
    sub_25A7F1F20();
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_25A7F1F30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a2, 0, 1, v5);
  }
  else
  {
    uint64_t v7 = sub_25A7F1F30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    return v8(a2, 1, 1, v7);
  }
}

uint64_t sub_25A7BB9F8@<X0>(uint64_t a1@<X2>, void (*a2)(uint64_t, uint64_t)@<X5>, uint64_t a3@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    MEMORY[0x270FA5388]();
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    a2(a1, KeyPath);
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641B0);
    sub_25A7BC370();
    sub_25A7F2FD0();
    swift_bridgeObjectRelease();
    sub_25A7F1F20();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_25A7F1F30();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a3, 0, 1, v7);
  }
  else
  {
    uint64_t v9 = sub_25A7F1F30();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    return v10(a3, 1, 1, v9);
  }
}

uint64_t sub_25A7BBBBC(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_25A7BC5C4(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_25A7F1F30() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25A7F3370();
  __break(1u);
  return result;
}

uint64_t sub_25A7BBD6C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25A7BBD9C()
{
  return sub_25A7F3390();
}

uint64_t sub_25A7BBDD8()
{
  if (*v0) {
    return 49;
  }
  else {
    return 48;
  }
}

uint64_t sub_25A7BBDF0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08788]), sel_init);
  uint64_t v1 = (void *)sub_25A7F2FF0();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  objc_msgSend(v0, sel_setDoesRelativeDateFormatting_, 0);
  unint64_t v2 = (void *)sub_25A7F2030();
  id v3 = objc_msgSend(v0, sel_stringFromDate_, v2);

  uint64_t v4 = sub_25A7F3000();
  return v4;
}

uint64_t sub_25A7BBECC()
{
  return sub_25A7F2000();
}

uint64_t sub_25A7BBEE8()
{
  sub_25A7F30A0();
  swift_getWitnessTable();
  uint64_t v0 = 0;
  if ((sub_25A7F3160() & 1) == 0)
  {
    MEMORY[0x270FA5388]();
    swift_getKeyPath();
    MEMORY[0x270FA5388]();
    swift_getWitnessTable();
    sub_25A7F3080();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641B0);
    sub_25A7BC370();
    uint64_t v0 = sub_25A7F2FD0();
    swift_bridgeObjectRelease();
  }
  return v0;
}

uint64_t sub_25A7BC07C()
{
  return sub_25A7BBEE8();
}

uint64_t sub_25A7BC090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v5 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v12, a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a1);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(v8, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v13;
}

uint64_t sub_25A7BC284(uint64_t a1, uint64_t a2)
{
  return sub_25A7BC090(a1, *(void *)(a2 - 8));
}

uint64_t sub_25A7BC28C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25A7BC2A0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a2 + a1 - 8) + 8))(*(void *)(a2 + a1 - 16));
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_25A7BC2E8()
{
  return 16;
}

__n128 sub_25A7BC2F4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_25A7BC300()
{
  return swift_getAtKeyPath();
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

unint64_t sub_25A7BC370()
{
  unint64_t result = qword_26A4641B8;
  if (!qword_26A4641B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A4641B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A4641B8);
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

unint64_t sub_25A7BC414()
{
  unint64_t result = qword_26A4641D0;
  if (!qword_26A4641D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4641D0);
  }
  return result;
}

uint64_t type metadata accessor for TapToRadarDraft()
{
  uint64_t result = qword_26A464280;
  if (!qword_26A464280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_25A7BC4B4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641E8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25A7BC9C0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25A7BC5C4(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641E0);
  uint64_t v10 = *(void *)(sub_25A7F1F30() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_25A7F3330();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25A7F1F30() - 8);
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
    sub_25A7BC864(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_25A7BC82C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_25A7BC864(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25A7F1F30() - 8);
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
  uint64_t result = sub_25A7F3370();
  __break(1u);
  return result;
}

uint64_t sub_25A7BC9C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_25A7F3370();
  __break(1u);
  return result;
}

void *sub_25A7BCAB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  id v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_getAtKeyPath();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v3 = sub_25A7BC4B4(0, v3[2] + 1, 1, v3);
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1) {
        id v3 = sub_25A7BC4B4((void *)(v5 > 1), v6 + 1, 1, v3);
      }
      v3[2] = v6 + 1;
      uint64_t v4 = &v3[2 * v6];
      v4[4] = v8;
      v4[5] = v9;
    }
    ++v2;
  }
  while (v1 != v2);
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_25A7BCBD8(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641C8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  v23[1] = a1;
  if (v5)
  {
    uint64_t v6 = sub_25A7F2010();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = v7;
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v24 = *(void *)(v7 + 72);
    unint64_t v28 = (void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    uint64_t v11 = v7 + 16;
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v26 = v11;
    v27 = v10;
    unint64_t v25 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    v23[3] = v8 + 8;
    v23[4] = v8 + 32;
    swift_bridgeObjectRetain();
    v33 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      v27(v4, v9, v6);
      (*v28)(v4, 0, 1, v6);
      if ((*v25)(v4, 1, v6) == 1) {
        break;
      }
      MEMORY[0x270FA5388]();
      BOOL v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v15, v4, v6);
      swift_getAtKeyPath();
      uint64_t v16 = v31;
      uint64_t v17 = v32;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v6);
      if (v17)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v30 = v23;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          v33 = sub_25A7BC4B4(0, v33[2] + 1, 1, v33);
        }
        unint64_t v20 = v33[2];
        unint64_t v19 = v33[3];
        if (v20 >= v19 >> 1) {
          v33 = sub_25A7BC4B4((void *)(v19 > 1), v20 + 1, 1, v33);
        }
        unint64_t v12 = v33;
        v33[2] = v20 + 1;
        uint64_t v13 = &v12[2 * v20];
        v13[4] = v16;
        v13[5] = v17;
      }
      v9 += v24;
      if (!--v5) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    v33 = (void *)MEMORY[0x263F8EE78];
LABEL_12:
    uint64_t v21 = sub_25A7F2010();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  }
  swift_bridgeObjectRelease();
  return v33;
}

void *sub_25A7BCF08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = swift_bridgeObjectRetain() + 40;
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_bridgeObjectRetain();
    swift_getAtKeyPath();
    swift_bridgeObjectRelease();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_25A7BC4B4(0, v3[2] + 1, 1, v3);
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1) {
        uint64_t v3 = sub_25A7BC4B4((void *)(v5 > 1), v6 + 1, 1, v3);
      }
      v3[2] = v6 + 1;
      uint64_t v4 = &v3[2 * v6];
      v4[4] = v8;
      v4[5] = v9;
    }
    v2 += 16;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_25A7BD038(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = 0;
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    swift_getAtKeyPath();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_25A7BC4B4(0, v3[2] + 1, 1, v3);
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1) {
        uint64_t v3 = sub_25A7BC4B4((void *)(v5 > 1), v6 + 1, 1, v3);
      }
      v3[2] = v6 + 1;
      uint64_t v4 = &v3[2 * v6];
      v4[4] = v8;
      v4[5] = v9;
    }
    ++v2;
  }
  while (v1 != v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25A7BD15C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A7BD1C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.DeviceClass()
{
  return &type metadata for TapToRadarDraft.DeviceClass;
}

uint64_t getEnumTagSinglePayload for TapToRadarDraft.TapToRadarError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TapToRadarDraft.TapToRadarError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A7BD3A8);
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

uint64_t sub_25A7BD3D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25A7BD3D8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.TapToRadarError()
{
  return &type metadata for TapToRadarDraft.TapToRadarError;
}

uint64_t sub_25A7BD3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_25A7BD3F8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25A7BD494(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_25A7BD59C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_25A7BD610(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_25A7BD6A0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_25A7BD738(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_25A7BD7A8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_25A7BD830(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 1);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_25A7BD9D0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x25A7BDC30);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
          unint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for URLParameter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A7BDC70(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)a1 = *a2;
    a1 = v12 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      uint64_t v10 = a2[7];
      uint64_t v11 = a2[8];
      *(void *)(a1 + 48) = v9;
      *(void *)(a1 + 56) = v10;
      *(void *)(a1 + 64) = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v13 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v13;
      *(void *)(a1 + 64) = a2[8];
    }
    uint64_t v14 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v14;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v15 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v15;
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    uint64_t v16 = a2[16];
    *(void *)(a1 + 120) = a2[15];
    *(void *)(a1 + 128) = v16;
    uint64_t v17 = a2[18];
    *(void *)(a1 + 136) = a2[17];
    *(void *)(a1 + 144) = v17;
    uint64_t v18 = a2[20];
    *(void *)(a1 + 152) = a2[19];
    *(void *)(a1 + 160) = v18;
    uint64_t v19 = a2[22];
    *(void *)(a1 + 168) = a2[21];
    *(void *)(a1 + 176) = v19;
    uint64_t v20 = a2[24];
    *(void *)(a1 + 184) = a2[23];
    *(void *)(a1 + 192) = v20;
    *(void *)(a1 + 200) = a2[25];
    uint64_t v21 = a3[11];
    uint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v21 + 8);
    *uint64_t v22 = *(uint64_t *)((char *)a2 + v21);
    v22[1] = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v25 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
    uint64_t v26 = (char *)v22 + v25;
    v27 = (const void *)(v23 + v25);
    uint64_t v28 = sub_25A7F2050();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v31 = a3[12];
    uint64_t v32 = a3[13];
    v33 = (void *)(a1 + v31);
    char v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    v33[2] = v34[2];
    v36 = (void *)(a1 + v32);
    uint64_t v37 = (uint64_t *)((char *)a2 + v32);
    uint64_t v38 = v37[1];
    void *v36 = *v37;
    v36[1] = v38;
    v36[2] = v37[2];
    uint64_t v39 = a3[14];
    uint64_t v40 = a3[15];
    unint64_t v41 = (void *)(a1 + v39);
    unint64_t v42 = (uint64_t *)((char *)a2 + v39);
    uint64_t v43 = v42[1];
    *unint64_t v41 = *v42;
    v41[1] = v43;
    v41[2] = v42[2];
    uint64_t v44 = a1 + v40;
    uint64_t v45 = (uint64_t)a2 + v40;
    uint64_t v46 = *(void *)(v45 + 8);
    *(void *)uint64_t v44 = *(void *)v45;
    *(void *)(v44 + 8) = v46;
    *(unsigned char *)(v44 + 16) = *(unsigned char *)(v45 + 16);
    uint64_t v47 = a3[16];
    uint64_t v48 = a3[17];
    unint64_t v49 = (void *)(a1 + v47);
    unint64_t v50 = (uint64_t *)((char *)a2 + v47);
    uint64_t v51 = v50[1];
    *unint64_t v49 = *v50;
    v49[1] = v51;
    v49[2] = v50[2];
    uint64_t v52 = (void *)(a1 + v48);
    uint64_t v53 = (uint64_t *)((char *)a2 + v48);
    uint64_t v54 = v53[1];
    *uint64_t v52 = *v53;
    v52[1] = v54;
    v52[2] = v53[2];
    uint64_t v55 = a3[18];
    uint64_t v56 = a3[19];
    unint64_t v57 = (void *)(a1 + v55);
    unint64_t v58 = (uint64_t *)((char *)a2 + v55);
    uint64_t v59 = v58[1];
    *unint64_t v57 = *v58;
    v57[1] = v59;
    v57[2] = v58[2];
    uint64_t v60 = (void *)(a1 + v56);
    uint64_t v61 = (uint64_t *)((char *)a2 + v56);
    uint64_t v62 = v61[1];
    *uint64_t v60 = *v61;
    v60[1] = v62;
    v60[2] = v61[2];
    uint64_t v63 = a3[20];
    uint64_t v64 = a3[21];
    uint64_t v65 = a1 + v63;
    uint64_t v66 = (uint64_t)a2 + v63;
    uint64_t v67 = *(void *)(v66 + 8);
    *(void *)uint64_t v65 = *(void *)v66;
    *(void *)(v65 + 8) = v67;
    *(unsigned char *)(v65 + 16) = *(unsigned char *)(v66 + 16);
    uint64_t v68 = a1 + v64;
    uint64_t v69 = (uint64_t)a2 + v64;
    uint64_t v70 = *(void *)(v69 + 8);
    *(void *)uint64_t v68 = *(void *)v69;
    *(void *)(v68 + 8) = v70;
    *(unsigned char *)(v68 + 16) = *(unsigned char *)(v69 + 16);
    uint64_t v71 = a3[22];
    uint64_t v72 = a3[23];
    unint64_t v73 = (void *)(a1 + v71);
    v74 = (uint64_t *)((char *)a2 + v71);
    uint64_t v75 = v74[1];
    *unint64_t v73 = *v74;
    v73[1] = v75;
    v73[2] = v74[2];
    v76 = (void *)(a1 + v72);
    uint64_t v77 = (uint64_t *)((char *)a2 + v72);
    uint64_t v78 = v77[1];
    void *v76 = *v77;
    v76[1] = v78;
    uint64_t v79 = v77[3];
    v76[2] = v77[2];
    v76[3] = v79;
    uint64_t v80 = a3[24];
    v81 = (void *)(a1 + v80);
    unint64_t v82 = (uint64_t *)((char *)a2 + v80);
    uint64_t v83 = v82[1];
    void *v81 = *v82;
    v81[1] = v83;
    uint64_t v84 = v82[3];
    v81[2] = v82[2];
    v81[3] = v84;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25A7BE138(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  uint64_t v6 = sub_25A7F2050();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A7BE38C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 56);
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v11;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
  }
  uint64_t v12 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v12;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v13 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v13;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v14 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v14;
  uint64_t v15 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v15;
  uint64_t v16 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v16;
  uint64_t v17 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v17;
  uint64_t v18 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v18;
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  uint64_t v84 = a3;
  uint64_t v19 = a3[11];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)(a2 + v19 + 8);
  *uint64_t v20 = *(void *)(a2 + v19);
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  uint64_t v24 = (char *)v20 + v23;
  uint64_t v25 = (const void *)(v21 + v23);
  uint64_t v26 = sub_25A7F2050();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v29 = v84[12];
  uint64_t v30 = v84[13];
  uint64_t v31 = (void *)(a1 + v29);
  uint64_t v32 = (void *)(a2 + v29);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  v31[2] = v32[2];
  char v34 = (void *)(a1 + v30);
  uint64_t v35 = (void *)(a2 + v30);
  uint64_t v36 = v35[1];
  *char v34 = *v35;
  v34[1] = v36;
  v34[2] = v35[2];
  uint64_t v37 = v84[14];
  uint64_t v38 = v84[15];
  uint64_t v39 = (void *)(a1 + v37);
  uint64_t v40 = (void *)(a2 + v37);
  uint64_t v41 = v40[1];
  void *v39 = *v40;
  v39[1] = v41;
  v39[2] = v40[2];
  uint64_t v42 = a1 + v38;
  uint64_t v43 = a2 + v38;
  uint64_t v44 = *(void *)(v43 + 8);
  *(void *)uint64_t v42 = *(void *)v43;
  *(void *)(v42 + 8) = v44;
  *(unsigned char *)(v42 + 16) = *(unsigned char *)(v43 + 16);
  uint64_t v45 = v84[16];
  uint64_t v46 = v84[17];
  uint64_t v47 = (void *)(a1 + v45);
  uint64_t v48 = (void *)(a2 + v45);
  uint64_t v49 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v49;
  v47[2] = v48[2];
  unint64_t v50 = (void *)(a1 + v46);
  uint64_t v51 = (void *)(a2 + v46);
  uint64_t v52 = v51[1];
  *unint64_t v50 = *v51;
  v50[1] = v52;
  v50[2] = v51[2];
  uint64_t v53 = v84[18];
  uint64_t v54 = v84[19];
  uint64_t v55 = (void *)(a1 + v53);
  uint64_t v56 = (void *)(a2 + v53);
  uint64_t v57 = v56[1];
  void *v55 = *v56;
  v55[1] = v57;
  v55[2] = v56[2];
  unint64_t v58 = (void *)(a1 + v54);
  uint64_t v59 = (void *)(a2 + v54);
  uint64_t v60 = v59[1];
  *unint64_t v58 = *v59;
  v58[1] = v60;
  v58[2] = v59[2];
  uint64_t v61 = v84[20];
  uint64_t v62 = v84[21];
  uint64_t v63 = a1 + v61;
  uint64_t v64 = a2 + v61;
  uint64_t v65 = *(void *)(v64 + 8);
  *(void *)uint64_t v63 = *(void *)v64;
  *(void *)(v63 + 8) = v65;
  *(unsigned char *)(v63 + 16) = *(unsigned char *)(v64 + 16);
  uint64_t v66 = a1 + v62;
  uint64_t v67 = a2 + v62;
  uint64_t v68 = *(void *)(v67 + 8);
  *(void *)uint64_t v66 = *(void *)v67;
  *(void *)(v66 + 8) = v68;
  *(unsigned char *)(v66 + 16) = *(unsigned char *)(v67 + 16);
  uint64_t v69 = v84[22];
  uint64_t v70 = v84[23];
  uint64_t v71 = (void *)(a1 + v69);
  uint64_t v72 = (void *)(a2 + v69);
  uint64_t v73 = v72[1];
  *uint64_t v71 = *v72;
  v71[1] = v73;
  v71[2] = v72[2];
  v74 = (void *)(a1 + v70);
  uint64_t v75 = (void *)(a2 + v70);
  uint64_t v76 = v75[1];
  void *v74 = *v75;
  v74[1] = v76;
  uint64_t v77 = v75[3];
  v74[2] = v75[2];
  v74[3] = v77;
  uint64_t v78 = v84[24];
  uint64_t v79 = (void *)(a1 + v78);
  uint64_t v80 = (void *)(a2 + v78);
  uint64_t v81 = v80[1];
  void *v79 = *v80;
  v79[1] = v81;
  uint64_t v82 = v80[3];
  v79[2] = v80[2];
  v79[3] = v82;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

uint64_t sub_25A7BE80C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v8)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25A7BEF18(a1 + 32);
      uint64_t v9 = *(void *)(a2 + 64);
      long long v10 = *(_OWORD *)(a2 + 48);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 48) = v10;
      *(void *)(a1 + 64) = v9;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *v7;
    long long v12 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *uint64_t v6 = v11;
    *(_OWORD *)(a1 + 48) = v12;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = a2 + v13;
  *uint64_t v14 = *(void *)(a2 + v13);
  v14[1] = *(void *)(a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  uint64_t v17 = (char *)v14 + v16;
  uint64_t v18 = (char *)(v15 + v16);
  uint64_t v19 = sub_25A7F2050();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v17, v18, v19);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_13;
  }
  if (v23)
  {
LABEL_13:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_14:
  uint64_t v25 = a3[12];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = a2 + v25;
  *uint64_t v26 = *(void *)(a2 + v25);
  v26[1] = *(void *)(a2 + v25 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26[2] = *(void *)(v27 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[13];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = a2 + v28;
  *uint64_t v29 = *(void *)(a2 + v28);
  v29[1] = *(void *)(a2 + v28 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29[2] = *(void *)(v30 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[14];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = a2 + v31;
  *uint64_t v32 = *(void *)(a2 + v31);
  v32[1] = *(void *)(a2 + v31 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32[2] = *(void *)(v33 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[15];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(void *)uint64_t v35 = *(void *)(a2 + v34);
  *(void *)(v35 + 8) = *(void *)(a2 + v34 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v35 + 16) = *(unsigned char *)(v36 + 16);
  uint64_t v37 = a3[16];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = a2 + v37;
  *uint64_t v38 = *(void *)(a2 + v37);
  v38[1] = *(void *)(a2 + v37 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v38[2] = *(void *)(v39 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[17];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = a2 + v40;
  *uint64_t v41 = *(void *)(a2 + v40);
  v41[1] = *(void *)(a2 + v40 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41[2] = *(void *)(v42 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[18];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = a2 + v43;
  *uint64_t v44 = *(void *)(a2 + v43);
  v44[1] = *(void *)(a2 + v43 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44[2] = *(void *)(v45 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[19];
  uint64_t v47 = (void *)(a1 + v46);
  uint64_t v48 = a2 + v46;
  *uint64_t v47 = *(void *)(a2 + v46);
  v47[1] = *(void *)(a2 + v46 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v47[2] = *(void *)(v48 + 16);
  uint64_t v49 = a3[20];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  *(void *)uint64_t v50 = *(void *)(a2 + v49);
  *(void *)(v50 + 8) = *(void *)(a2 + v49 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v50 + 16) = *(unsigned char *)(v51 + 16);
  uint64_t v52 = a3[21];
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  *(void *)uint64_t v53 = *(void *)(a2 + v52);
  *(void *)(v53 + 8) = *(void *)(a2 + v52 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v53 + 16) = *(unsigned char *)(v54 + 16);
  uint64_t v55 = a3[22];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = a2 + v55;
  *uint64_t v56 = *(void *)(a2 + v55);
  v56[1] = *(void *)(a2 + v55 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v56[2] = *(void *)(v57 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[23];
  uint64_t v59 = (void *)(a1 + v58);
  uint64_t v60 = a2 + v58;
  *uint64_t v59 = *(void *)(a2 + v58);
  v59[1] = *(void *)(a2 + v58 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v59[2] = *(void *)(v60 + 16);
  v59[3] = *(void *)(v60 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v61 = a3[24];
  uint64_t v62 = (void *)(a1 + v61);
  uint64_t v63 = a2 + v61;
  *uint64_t v62 = *(void *)(a2 + v61);
  v62[1] = *(void *)(a2 + v61 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v62[2] = *(void *)(v63 + 16);
  v62[3] = *(void *)(v63 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A7BEF18(uint64_t a1)
{
  return a1;
}

uint64_t sub_25A7BEF4C(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  uint64_t v8 = a3[11];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  long long v12 = (void *)(v9 + v11);
  uint64_t v13 = (const void *)(v10 + v11);
  uint64_t v14 = sub_25A7F2050();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[12];
  uint64_t v18 = a3[13];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(void *)(v19 + 16) = *(void *)(v20 + 16);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(void *)(v21 + 16) = *(void *)(v22 + 16);
  uint64_t v23 = a3[14];
  uint64_t v24 = a3[15];
  uint64_t v25 = a1 + v23;
  uint64_t v26 = a2 + v23;
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *(void *)(v25 + 16) = *(void *)(v26 + 16);
  uint64_t v27 = a1 + v24;
  uint64_t v28 = a2 + v24;
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *(unsigned char *)(v27 + 16) = *(unsigned char *)(v28 + 16);
  uint64_t v29 = a3[16];
  uint64_t v30 = a3[17];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = (long long *)(a2 + v29);
  long long v33 = *v32;
  *(void *)(v31 + 16) = *((void *)v32 + 2);
  *(_OWORD *)uint64_t v31 = v33;
  uint64_t v34 = a1 + v30;
  uint64_t v35 = a2 + v30;
  *(void *)(v34 + 16) = *(void *)(v35 + 16);
  *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
  uint64_t v36 = a3[18];
  uint64_t v37 = a3[19];
  uint64_t v38 = a1 + v36;
  uint64_t v39 = a2 + v36;
  *(void *)(v38 + 16) = *(void *)(v39 + 16);
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  uint64_t v40 = a1 + v37;
  uint64_t v41 = a2 + v37;
  *(void *)(v40 + 16) = *(void *)(v41 + 16);
  *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  uint64_t v42 = a3[20];
  uint64_t v43 = a3[21];
  uint64_t v44 = a1 + v42;
  uint64_t v45 = a2 + v42;
  *(unsigned char *)(v44 + 16) = *(unsigned char *)(v45 + 16);
  *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  uint64_t v46 = a1 + v43;
  uint64_t v47 = a2 + v43;
  *(unsigned char *)(v46 + 16) = *(unsigned char *)(v47 + 16);
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  uint64_t v48 = a3[22];
  uint64_t v49 = a3[23];
  uint64_t v50 = a1 + v48;
  uint64_t v51 = a2 + v48;
  *(void *)(v50 + 16) = *(void *)(v51 + 16);
  *(_OWORD *)uint64_t v50 = *(_OWORD *)v51;
  uint64_t v52 = (_OWORD *)(a1 + v49);
  uint64_t v53 = (_OWORD *)(a2 + v49);
  long long v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = a3[24];
  uint64_t v56 = (_OWORD *)(a1 + v55);
  uint64_t v57 = (_OWORD *)(a2 + v55);
  long long v58 = v57[1];
  *uint64_t v56 = *v57;
  v56[1] = v58;
  return a1;
}

uint64_t sub_25A7BF234(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = *(void *)(a2 + 48);
    if (v8)
    {
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(void *)(a1 + 48) = v8;
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v9;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_25A7BEF18(a1 + 32);
  }
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v10;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
LABEL_6:
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v12 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v13 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v17;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)(a2 + v18 + 8);
  *uint64_t v19 = *(void *)(a2 + v18);
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  uint64_t v23 = (char *)v19 + v22;
  uint64_t v24 = (char *)(v20 + v22);
  uint64_t v25 = sub_25A7F2050();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_11;
  }
  if (v29)
  {
LABEL_11:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_12:
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = a2 + v31;
  uint64_t v34 = *(void *)(a2 + v31 + 8);
  *uint64_t v32 = *(void *)(a2 + v31);
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v32[2] = *(void *)(v33 + 16);
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[13];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = a2 + v35;
  uint64_t v38 = *(void *)(a2 + v35 + 8);
  void *v36 = *(void *)(a2 + v35);
  v36[1] = v38;
  swift_bridgeObjectRelease();
  v36[2] = *(void *)(v37 + 16);
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[14];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = a2 + v39;
  uint64_t v42 = *(void *)(a2 + v39 + 8);
  *uint64_t v40 = *(void *)(a2 + v39);
  v40[1] = v42;
  swift_bridgeObjectRelease();
  v40[2] = *(void *)(v41 + 16);
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[15];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  uint64_t v46 = *(void *)(a2 + v43 + 8);
  *(void *)uint64_t v44 = *(void *)(a2 + v43);
  *(void *)(v44 + 8) = v46;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v44 + 16) = *(unsigned char *)(v45 + 16);
  uint64_t v47 = a3[16];
  uint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = a2 + v47;
  uint64_t v50 = *(void *)(a2 + v47 + 8);
  *uint64_t v48 = *(void *)(a2 + v47);
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v48[2] = *(void *)(v49 + 16);
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[17];
  uint64_t v52 = (void *)(a1 + v51);
  uint64_t v53 = a2 + v51;
  uint64_t v54 = *(void *)(a2 + v51 + 8);
  *uint64_t v52 = *(void *)(a2 + v51);
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v52[2] = *(void *)(v53 + 16);
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[18];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = a2 + v55;
  uint64_t v58 = *(void *)(a2 + v55 + 8);
  *uint64_t v56 = *(void *)(a2 + v55);
  v56[1] = v58;
  swift_bridgeObjectRelease();
  v56[2] = *(void *)(v57 + 16);
  swift_bridgeObjectRelease();
  uint64_t v59 = a3[19];
  uint64_t v60 = (void *)(a1 + v59);
  uint64_t v61 = a2 + v59;
  uint64_t v62 = *(void *)(a2 + v59 + 8);
  *uint64_t v60 = *(void *)(a2 + v59);
  v60[1] = v62;
  swift_bridgeObjectRelease();
  v60[2] = *(void *)(v61 + 16);
  uint64_t v63 = a3[20];
  uint64_t v64 = a1 + v63;
  uint64_t v65 = a2 + v63;
  uint64_t v66 = *(void *)(a2 + v63 + 8);
  *(void *)uint64_t v64 = *(void *)(a2 + v63);
  *(void *)(v64 + 8) = v66;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v64 + 16) = *(unsigned char *)(v65 + 16);
  uint64_t v67 = a3[21];
  uint64_t v68 = a1 + v67;
  uint64_t v69 = a2 + v67;
  uint64_t v70 = *(void *)(a2 + v67 + 8);
  *(void *)uint64_t v68 = *(void *)(a2 + v67);
  *(void *)(v68 + 8) = v70;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v68 + 16) = *(unsigned char *)(v69 + 16);
  uint64_t v71 = a3[22];
  uint64_t v72 = (void *)(a1 + v71);
  uint64_t v73 = a2 + v71;
  uint64_t v74 = *(void *)(a2 + v71 + 8);
  *uint64_t v72 = *(void *)(a2 + v71);
  v72[1] = v74;
  swift_bridgeObjectRelease();
  v72[2] = *(void *)(v73 + 16);
  swift_bridgeObjectRelease();
  uint64_t v75 = a3[23];
  uint64_t v76 = (void *)(a1 + v75);
  uint64_t v77 = a2 + v75;
  uint64_t v78 = *(void *)(a2 + v75 + 8);
  void *v76 = *(void *)(a2 + v75);
  v76[1] = v78;
  swift_bridgeObjectRelease();
  uint64_t v79 = *(void *)(v77 + 24);
  v76[2] = *(void *)(v77 + 16);
  v76[3] = v79;
  swift_bridgeObjectRelease();
  uint64_t v80 = a3[24];
  uint64_t v81 = (void *)(a1 + v80);
  uint64_t v82 = (void *)(a2 + v80);
  uint64_t v83 = v82[1];
  void *v81 = *v82;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  uint64_t v84 = v82[3];
  v81[2] = v82[2];
  v81[3] = v84;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25A7BF6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A7BF710);
}

uint64_t sub_25A7BF710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25A7BF7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A7BF7D8);
}

uint64_t sub_25A7BF7D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25A7BF884()
{
  sub_25A7BF960();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25A7BF960()
{
  if (!qword_26A464290)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A4641F8);
    sub_25A7BF9C8();
    unint64_t v0 = type metadata accessor for URLParameter();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A464290);
    }
  }
}

unint64_t sub_25A7BF9C8()
{
  unint64_t result = qword_26A464298;
  if (!qword_26A464298)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A4641F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A464298);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TapToRadarDraft.Component(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TapToRadarDraft.Component()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TapToRadarDraft.Component(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TapToRadarDraft.Component(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for TapToRadarDraft.Component(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TapToRadarDraft.Component(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TapToRadarDraft.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.Component()
{
  return &type metadata for TapToRadarDraft.Component;
}

unint64_t sub_25A7BFC6C()
{
  unint64_t result = qword_26A4642A0;
  if (!qword_26A4642A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642A0);
  }
  return result;
}

unint64_t sub_25A7BFCC8()
{
  unint64_t result = qword_26A4642A8;
  if (!qword_26A4642A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642A8);
  }
  return result;
}

unint64_t sub_25A7BFD20()
{
  unint64_t result = qword_26A4642B0;
  if (!qword_26A4642B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642B0);
  }
  return result;
}

uint64_t sub_25A7BFD74(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  BOOL v4 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v4 || (v5 = sub_25A7F33A0(), uint64_t result = 0, (v5 & 1) != 0))
  {
    if (a1[3] == a2[3] && a1[4] == a2[4])
    {
      return 1;
    }
    else
    {
      return sub_25A7F33A0();
    }
  }
  return result;
}

uint64_t sub_25A7BFE14()
{
  unint64_t v0 = sub_25A7F3380();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A7BFE60()
{
  unint64_t v0 = sub_25A7F3380();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t getEnumTagSinglePayload for PrivateMLClientInferenceProviderError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s32PrivateMLClientInferenceProvider15TapToRadarDraftV15AutoDiagnosticsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A7C0038);
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

ValueMetadata *type metadata accessor for TapToRadarDraft.AutoDiagnostics()
{
  return &type metadata for TapToRadarDraft.AutoDiagnostics;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.RemoteDeviceSelections()
{
  return &type metadata for TapToRadarDraft.RemoteDeviceSelections;
}

uint64_t getEnumTagSinglePayload for TapToRadarDraft.Reproducibility(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TapToRadarDraft.Reproducibility(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A7C01DCLL);
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

ValueMetadata *type metadata accessor for TapToRadarDraft.Reproducibility()
{
  return &type metadata for TapToRadarDraft.Reproducibility;
}

uint64_t getEnumTagSinglePayload for TapToRadarDraft.Classification(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TapToRadarDraft.Classification(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x25A7C0370);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarDraft.Classification()
{
  return &type metadata for TapToRadarDraft.Classification;
}

unint64_t sub_25A7C03AC()
{
  unint64_t result = qword_26A4642B8;
  if (!qword_26A4642B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642B8);
  }
  return result;
}

unint64_t sub_25A7C0404()
{
  unint64_t result = qword_26A4642C0;
  if (!qword_26A4642C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642C0);
  }
  return result;
}

unint64_t sub_25A7C045C()
{
  unint64_t result = qword_26A4642C8;
  if (!qword_26A4642C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642C8);
  }
  return result;
}

unint64_t sub_25A7C04B4()
{
  unint64_t result = qword_26A4642D0;
  if (!qword_26A4642D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642D0);
  }
  return result;
}

unint64_t sub_25A7C050C()
{
  unint64_t result = qword_26A4642D8;
  if (!qword_26A4642D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642D8);
  }
  return result;
}

unint64_t sub_25A7C0564()
{
  unint64_t result = qword_26A4642E0;
  if (!qword_26A4642E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642E0);
  }
  return result;
}

unint64_t sub_25A7C05BC()
{
  unint64_t result = qword_26A4642E8;
  if (!qword_26A4642E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642E8);
  }
  return result;
}

uint64_t sub_25A7C0610()
{
  unint64_t v0 = sub_25A7F3380();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

unint64_t sub_25A7C0664()
{
  return 0xD000000000000025;
}

uint64_t Constraints.toTMLConstraints(logger:)@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v100 = a1;
  v98 = a2;
  uint64_t v3 = sub_25A7F2C10();
  uint64_t v95 = *(void *)(v3 - 8);
  uint64_t v96 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v93 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_25A7F2DF0();
  uint64_t v92 = *(void *)(v94 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v94);
  uint64_t v90 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v91 = (char *)&v87 - v7;
  uint64_t v8 = sub_25A7F2DD0();
  uint64_t v97 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v89 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v87 - v11;
  uint64_t v13 = sub_25A7F2680();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (uint64_t *)((char *)&v87 - v18);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v88 = v2;
  v20((char *)&v87 - v18, v2, v13);
  int v21 = (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 88))(v19, v13);
  if (v21 == *MEMORY[0x263F7F848])
  {
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v19, v13);
    uint64_t v22 = v97;
    (*(void (**)(char *, uint64_t *, uint64_t))(v97 + 32))(v12, v19, v8);
    uint64_t v23 = sub_25A7F2EC0();
    os_log_type_t v24 = sub_25A7F31A0();
    uint64_t v25 = v8;
    uint64_t v26 = v12;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25A7B3000, v23, v24, "toTMLConstraints schema", v27, 2u);
      MEMORY[0x261145500](v27, -1, -1);
    }

    sub_25A7C1300();
    char v28 = sub_25A7F3210();
    uint64_t v29 = v99;
    if (v28)
    {
      if (qword_26B32BB78 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_25A7F2EE0();
      __swift_project_value_buffer(v30, (uint64_t)qword_26B32BBF8);
      uint64_t v31 = sub_25A7F2EC0();
      os_log_type_t v32 = sub_25A7F3170();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl(&dword_25A7B3000, v31, v32, "Converting schema into grammar", v33, 2u);
        MEMORY[0x261145500](v33, -1, -1);
      }

      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
      uint64_t v87 = v8;
      v34(v89, v26, v8);
      uint64_t v35 = v91;
      sub_25A7F2DE0();
      uint64_t v100 = v26;
      uint64_t v36 = v92;
      uint64_t v37 = v94;
      (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v90, v35, v94);
      uint64_t v38 = v93;
      sub_25A7F2C00();
      sub_25A7C13D0(&qword_26A464310, MEMORY[0x263F7FC38]);
      uint64_t v39 = v96;
      uint64_t v40 = sub_25A7F3390();
      uint64_t v42 = v41;
      (*(void (**)(char *, uint64_t))(v95 + 8))(v38, v39);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v100, v87);
      uint64_t v43 = v98;
      uint64_t *v98 = v40;
      v43[1] = v42;
      uint64_t v44 = *MEMORY[0x263F611A8];
      uint64_t v45 = sub_25A7F23E0();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104))(v43, v44, v45);
      uint64_t v46 = (unsigned int *)MEMORY[0x263F611B0];
      goto LABEL_21;
    }
    sub_25A7F1F10();
    swift_allocObject();
    sub_25A7F1F00();
    sub_25A7C13D0(&qword_26A464300, MEMORY[0x263F40C58]);
    uint64_t v55 = sub_25A7F1EF0();
    if (v29)
    {
      swift_release();
      uint64_t v57 = v29;
    }
    else
    {
      uint64_t v76 = v55;
      unint64_t v77 = v56;
      swift_release();
      uint64_t v78 = sub_25A7F3030();
      MEMORY[0x270FA5388](v78 - 8);
      sub_25A7F3020();
      uint64_t v79 = sub_25A7F3010();
      if (v80)
      {
        uint64_t v81 = v79;
        uint64_t v82 = v80;
        (*(void (**)(char *, uint64_t))(v22 + 8))(v26, v25);
        sub_25A7C1340(v76, v77);
        uint64_t v83 = v98;
        uint64_t *v98 = v81;
        v83[1] = v82;
        uint64_t v43 = v83;
        uint64_t v84 = *MEMORY[0x263F611D0];
        uint64_t v85 = sub_25A7F2410();
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v85 - 8) + 104))(v43, v84, v85);
        uint64_t v46 = (unsigned int *)MEMORY[0x263F611C0];
LABEL_21:
        uint64_t v70 = *v46;
        uint64_t v71 = sub_25A7F23F0();
        uint64_t v72 = *(void *)(v71 - 8);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v72 + 104))(v43, v70, v71);
        return (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t))(v72 + 56))(v43, 0, 1, v71);
      }
      sub_25A7C129C();
      uint64_t v57 = swift_allocError();
      void *v86 = 0xD00000000000002BLL;
      v86[1] = 0x800000025A7F4F10;
      swift_willThrow();
      sub_25A7C1340(v76, v77);
    }
    unint64_t v101 = 0;
    unint64_t v102 = 0xE000000000000000;
    sub_25A7F32B0();
    sub_25A7F3060();
    uint64_t v103 = v57;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464308);
    sub_25A7F3320();
    unint64_t v58 = v101;
    unint64_t v59 = v102;
    sub_25A7C129C();
    swift_allocError();
    *uint64_t v60 = v58;
    v60[1] = v59;
    swift_willThrow();
    MEMORY[0x261145390](v57);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v26, v25);
  }
  if (v21 == *MEMORY[0x263F7F850])
  {
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v19, v13);
    uint64_t v47 = *v19;
    uint64_t v48 = v19[1];
    uint64_t v49 = sub_25A7F2EC0();
    os_log_type_t v50 = sub_25A7F31A0();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_25A7B3000, v49, v50, "toTMLConstraints grammar", v51, 2u);
      MEMORY[0x261145500](v51, -1, -1);
    }

    uint64_t v52 = v98;
    uint64_t *v98 = v47;
    v52[1] = v48;
    uint64_t v43 = v52;
    uint64_t v53 = *MEMORY[0x263F611A8];
    uint64_t v54 = sub_25A7F23E0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 104))(v43, v53, v54);
    uint64_t v46 = (unsigned int *)MEMORY[0x263F611B0];
    goto LABEL_21;
  }
  if (v21 == *MEMORY[0x263F7F840])
  {
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v19, v13);
    uint64_t v62 = *v19;
    uint64_t v63 = v19[1];
    uint64_t v64 = sub_25A7F2EC0();
    os_log_type_t v65 = sub_25A7F31A0();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      _os_log_impl(&dword_25A7B3000, v64, v65, "toTMLConstraints partialGrammar", v66, 2u);
      MEMORY[0x261145500](v66, -1, -1);
    }

    uint64_t v67 = v98;
    uint64_t *v98 = v62;
    v67[1] = v63;
    uint64_t v43 = v67;
    uint64_t v68 = *MEMORY[0x263F611C8];
    uint64_t v69 = sub_25A7F2400();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v69 - 8) + 104))(v43, v68, v69);
    uint64_t v46 = (unsigned int *)MEMORY[0x263F611B8];
    goto LABEL_21;
  }
  unint64_t v101 = 0;
  unint64_t v102 = 0xE000000000000000;
  sub_25A7F32B0();
  swift_bridgeObjectRelease();
  unint64_t v101 = 0xD00000000000002FLL;
  unint64_t v102 = 0x800000025A7F4EB0;
  v20(v17, v88, v13);
  sub_25A7F3040();
  sub_25A7F3060();
  swift_bridgeObjectRelease();
  sub_25A7F3060();
  unint64_t v73 = v101;
  unint64_t v74 = v102;
  sub_25A7C129C();
  swift_allocError();
  *uint64_t v75 = v73;
  v75[1] = v74;
  swift_willThrow();
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 8))(v19, v13);
}

unint64_t sub_25A7C129C()
{
  unint64_t result = qword_26A4642F0;
  if (!qword_26A4642F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4642F0);
  }
  return result;
}

uint64_t sub_25A7C12F0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_25A7C1300()
{
  unint64_t result = qword_26A4642F8;
  if (!qword_26A4642F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A4642F8);
  }
  return result;
}

uint64_t sub_25A7C1340(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25A7C13D0(unint64_t *a1, void (*a2)(uint64_t))
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

void *_s16ConstraintsErrorOwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16ConstraintsErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s16ConstraintsErrorOwca(void *a1, void *a2)
{
  *a1 = *a2;
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

void *_s16ConstraintsErrorOwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16ConstraintsErrorOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s16ConstraintsErrorOwst(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25A7C1558()
{
  return 0;
}

ValueMetadata *_s16ConstraintsErrorOMa()
{
  return &_s16ConstraintsErrorON;
}

uint64_t sub_25A7C1578(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v80 = a1;
  uint64_t v81 = a3;
  uint64_t v10 = type metadata accessor for PrivateMLClientAlertService();
  uint64_t v76 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v77 = v11;
  uint64_t v78 = (uint64_t)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A7F2EE0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v74 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v64 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  int v21 = (char *)&v64 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v64 - v22;
  if (qword_26A464180 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (byte_26A464188 == 1)
  {
    uint64_t v68 = v21;
    uint64_t v70 = v18;
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v72 = v13 + 16;
    uint64_t v75 = v25;
    v25(v23, v6, v12);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_25A7F2EC0();
    os_log_type_t v27 = sub_25A7F3180();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v79 = v6;
    uint64_t v73 = v13;
    uint64_t v69 = a5;
    unint64_t v67 = a2;
    if (v28)
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v83 = v30;
      *(_DWORD *)uint64_t v29 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_25A7EED88(v80, a2, &v83);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_25A7EED88(v81, a4, &v83);
      uint64_t v13 = v73;
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v26, v27, "displayPrivateMLClientFailedDialogIfInternal: %s RequestID:%s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      uint64_t v31 = v30;
      uint64_t v6 = v79;
      MEMORY[0x261145500](v31, -1, -1);
      MEMORY[0x261145500](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v71 = *(void (**)(char *, uint64_t))(v13 + 8);
    v71(v23, v12);
    id v32 = objc_allocWithZone(MEMORY[0x263EFFA48]);
    uint64_t v33 = (void *)sub_25A7F2FF0();
    uint64_t v34 = (char *)objc_msgSend(v32, sel_initWithSuiteName_, v33);

    if (v34)
    {
      uint64_t v35 = (void *)sub_25A7F2FF0();
      uint64_t v36 = (void *)sub_25A7F2FF0();
      unint64_t v74 = v34;
      objc_msgSend(v34, sel_setObject_forKey_, v35, v36);

      type metadata accessor for PrivateMLClientAlert();
      uint64_t v37 = swift_allocObject();
      sub_25A7F2ED0();
      *(void *)(v37 + 16) = 0xD00000000000001DLL;
      *(void *)(v37 + 24) = 0x800000025A7F4F90;
      *(void *)(v37 + 32) = 0xD00000000000002DLL;
      *(void *)(v37 + 40) = 0x800000025A7F4FB0;
      strcpy((char *)(v37 + 48), "File a Radar");
      *(unsigned char *)(v37 + 61) = 0;
      *(_WORD *)(v37 + 62) = -5120;
      *(void *)(v37 + 64) = 0x7373696D736944;
      *(void *)(v37 + 72) = 0xE700000000000000;
      uint64_t v66 = v37;
      os_log_type_t v65 = type metadata accessor for PrivateMLClientAlertService;
      uint64_t v38 = v78;
      sub_25A7C3918(v6, v78, (uint64_t (*)(void))type metadata accessor for PrivateMLClientAlertService);
      unint64_t v39 = (*(unsigned __int8 *)(v76 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
      v77 += v39;
      uint64_t v40 = v12;
      unint64_t v41 = (v77 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v42 = (v41 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v43 = swift_allocObject();
      sub_25A7C304C(v38, v43 + v39);
      uint64_t v44 = (void *)(v43 + v41);
      uint64_t v45 = v79;
      unint64_t v46 = v67;
      *uint64_t v44 = v80;
      v44[1] = v46;
      uint64_t v47 = (void *)(v43 + v42);
      *uint64_t v47 = v81;
      v47[1] = a4;
      uint64_t v80 = v43;
      *(void *)(v43 + ((v42 + 23) & 0xFFFFFFFFFFFFFFF8)) = v69;
      sub_25A7C3918(v45, v38, (uint64_t (*)(void))v65);
      uint64_t v48 = swift_allocObject();
      sub_25A7C304C(v38, v48 + v39);
      uint64_t v49 = v68;
      uint64_t v81 = v40;
      v75(v68, v45, v40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      os_log_type_t v50 = sub_25A7F2EC0();
      os_log_type_t v51 = sub_25A7F3180();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl(&dword_25A7B3000, v50, v51, "Display Alert Box started", v52, 2u);
        MEMORY[0x261145500](v52, -1, -1);
      }

      uint64_t v53 = v81;
      uint64_t v54 = (uint64_t (*)(char *, uint64_t))v71;
      uint64_t v78 = v73 + 8;
      v71(v49, v81);
      uint64_t v55 = v80;
      swift_retain();
      sub_25A7C3E98((void (*)(__CFUserNotification *))sub_25A7C30B0, v55, (void (*)(__CFUserNotification *))sub_25A7C3244);
      swift_release();
      unint64_t v56 = v70;
      v75(v70, v79, v53);
      uint64_t v57 = sub_25A7F2EC0();
      os_log_type_t v58 = sub_25A7F3180();
      if (os_log_type_enabled(v57, v58))
      {
        unint64_t v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v59 = 0;
        _os_log_impl(&dword_25A7B3000, v57, v58, "Display Alert Box finished", v59, 2u);
        MEMORY[0x261145500](v59, -1, -1);
        swift_release();

        swift_release();
        swift_release();
      }
      else
      {

        swift_release();
        swift_release();

        swift_release();
      }
      return v54(v56, v81);
    }
    else
    {
      uint64_t v60 = v74;
      v75(v74, v6, v12);
      uint64_t v61 = sub_25A7F2EC0();
      os_log_type_t v62 = sub_25A7F3190();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v63 = 0;
        _os_log_impl(&dword_25A7B3000, v61, v62, "Failed to write requestID to userdefaults", v63, 2u);
        MEMORY[0x261145500](v63, -1, -1);
      }

      return ((uint64_t (*)(char *, uint64_t))v71)(v60, v12);
    }
  }
  return result;
}

uint64_t type metadata accessor for PrivateMLClientAlertService()
{
  uint64_t result = qword_26B32BBC0;
  if (!qword_26B32BBC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A7C1EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint8_t *a7)
{
  uint64_t v70 = a6;
  uint64_t v71 = a7;
  uint64_t v68 = a3;
  uint64_t v69 = a5;
  uint64_t v76 = a2;
  uint64_t v8 = type metadata accessor for PrivateMLClientAlertService();
  uint64_t v9 = v8 - 8;
  uint64_t v62 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v63 = v10;
  os_log_type_t v65 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464318);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v64 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_25A7F2EE0();
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v73 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (int *)type metadata accessor for TapToRadarDraft();
  uint64_t v75 = swift_allocBox();
  uint64_t v16 = v15;
  *(void *)uint64_t v15 = 0x4449656C646E7542;
  *(void *)(v15 + 8) = 0xE800000000000000;
  *(void *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  strcpy((char *)(v15 + 72), "Classification");
  *(unsigned char *)(v15 + 87) = -18;
  *(unsigned char *)(v15 + 88) = 10;
  *(void *)(v15 + 96) = 0x6375646F72706552;
  *(void *)(v15 + 104) = 0xEF7974696C696269;
  *(unsigned char *)(v15 + 112) = 6;
  *(void *)(v15 + 120) = 0x656C746954;
  *(void *)(v15 + 128) = 0xE500000000000000;
  *(void *)(v15 + 136) = 0;
  *(void *)(v15 + 144) = 0;
  *(void *)(v15 + 152) = 0x7470697263736544;
  *(void *)(v15 + 160) = 0xEB000000006E6F69;
  *(void *)(v15 + 168) = 0;
  *(void *)(v15 + 176) = 0;
  *(void *)(v15 + 184) = 0x7364726F7779654BLL;
  *(void *)(v15 + 192) = 0xE800000000000000;
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)(v15 + 200) = MEMORY[0x263F8EE78];
  uint64_t v18 = (void *)(v15 + v14[11]);
  uint64_t v19 = (uint64_t)v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4641F0) + 36);
  uint64_t v67 = v19;
  uint64_t v20 = sub_25A7F2050();
  uint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v66(v19, 1, 1, v20);
  *uint64_t v18 = 0x7349664F656D6954;
  v18[1] = 0xEB00000000657573;
  int v21 = (void *)(v16 + v14[12]);
  void *v21 = 0x656D686361747441;
  v21[1] = 0xEB0000000073746ELL;
  v21[2] = v17;
  uint64_t v22 = (void *)(v16 + v14[13]);
  *uint64_t v22 = 0xD000000000000011;
  v22[1] = 0x800000025A7F4FE0;
  v22[2] = v17;
  uint64_t v23 = (void *)(v16 + v14[14]);
  *uint64_t v23 = 0xD000000000000014;
  v23[1] = 0x800000025A7F5000;
  v23[2] = v17;
  os_log_type_t v24 = (char *)(v16 + v14[15]);
  strcpy(v24, "DeleteOnAttach");
  v24[15] = -18;
  v24[16] = 0;
  uint64_t v25 = (void *)(v16 + v14[16]);
  *uint64_t v25 = 0x4449656369766544;
  v25[1] = 0xE900000000000073;
  v25[2] = v17;
  uint64_t v26 = v16 + v14[17];
  strcpy((char *)v26, "DeviceClasses");
  *(_WORD *)(v26 + 14) = -4864;
  *(void *)(v26 + 16) = v17;
  uint64_t v27 = v16 + v14[18];
  strcpy((char *)v27, "DeviceModels");
  *(unsigned char *)(v27 + 13) = 0;
  *(_WORD *)(v27 + 14) = -5120;
  *(void *)(v27 + 16) = v17;
  BOOL v28 = (void *)(v16 + v14[19]);
  *BOOL v28 = 0xD000000000000016;
  v28[1] = 0x800000025A7F5020;
  v28[2] = 0;
  uint64_t v29 = v16 + v14[20];
  *(void *)uint64_t v29 = 0xD00000000000001ALL;
  *(void *)(v29 + 8) = 0x800000025A7F5040;
  *(unsigned char *)(v29 + 16) = 0;
  uint64_t v30 = v16 + v14[21];
  *(void *)uint64_t v30 = 0x676169446F747541;
  *(void *)(v30 + 8) = 0xEF73636974736F6ELL;
  *(unsigned char *)(v30 + 16) = 0;
  uint64_t v31 = (void *)(v16 + v14[22]);
  *uint64_t v31 = 0xD00000000000001BLL;
  v31[1] = 0x800000025A7F5060;
  v31[2] = v17;
  uint64_t v32 = v76;
  uint64_t v33 = (void *)(v16 + v14[23]);
  void *v33 = 0xD000000000000018;
  v33[1] = 0x800000025A7F5080;
  v33[2] = 0;
  v33[3] = 0;
  uint64_t v34 = (void *)(v16 + v14[24]);
  *uint64_t v34 = 0xD000000000000012;
  v34[1] = 0x800000025A7F50A0;
  v34[2] = 0;
  v34[3] = 0;
  *(void *)(v16 + 32) = *(void *)(v32 + *(int *)(v9 + 28));
  *(_OWORD *)(v16 + 40) = xmmword_25A7F4400;
  *(_OWORD *)(v16 + 56) = xmmword_25A7F4410;
  *(unsigned char *)(v16 + 88) = 6;
  *(unsigned char *)(v16 + 112) = 5;
  *(void *)(v16 + 136) = v68;
  *(void *)(v16 + 144) = a4;
  uint64_t v78 = 0;
  unint64_t v79 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_25A7F32B0();
  sub_25A7F3060();
  sub_25A7F3060();
  sub_25A7F3060();
  sub_25A7F3060();
  sub_25A7F3060();
  uint64_t v35 = v78;
  unint64_t v36 = v79;
  swift_bridgeObjectRelease();
  *(void *)(v16 + 168) = v35;
  *(void *)(v16 + 176) = v36;
  uint64_t v37 = v71;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
  MEMORY[0x270FA5388](v38 - 8);
  uint64_t v40 = (char *)&v61 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7F2040();
  v66((uint64_t)v40, 0, 1, v20);
  sub_25A7C3488((uint64_t)v40, v67);
  if (*((void *)v37 + 2)) {
    swift_bridgeObjectRetain();
  }
  else {
    uint64_t v37 = (uint8_t *)&unk_27085BED0;
  }
  swift_bridgeObjectRelease();
  v23[2] = v37;
  uint64_t v42 = v72;
  unint64_t v41 = v73;
  uint64_t v43 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v73, v32, v74);
  uint64_t v44 = v75;
  swift_retain_n();
  uint64_t v45 = sub_25A7F2EC0();
  os_log_type_t v46 = sub_25A7F3180();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v80 = v48;
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v44 = v75;
    uint64_t v71 = v47 + 4;
    swift_beginAccess();
    uint64_t v49 = swift_bridgeObjectRetain();
    uint64_t v50 = MEMORY[0x261144CD0](v49, MEMORY[0x263F8D310]);
    unint64_t v52 = v51;
    swift_bridgeObjectRelease();
    uint64_t v77 = sub_25A7EED88(v50, v52, &v80);
    sub_25A7F3270();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A7B3000, v45, v46, "Using DiagnosticExtension: %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v53 = v48;
    uint64_t v32 = v76;
    MEMORY[0x261145500](v53, -1, -1);
    MEMORY[0x261145500](v47, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v73, v74);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  }
  uint64_t v55 = (uint64_t)v64;
  uint64_t v54 = (uint64_t)v65;
  uint64_t v56 = v62;
  uint64_t v57 = sub_25A7F30D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v55, 1, 1, v57);
  sub_25A7C3918(v32, v54, (uint64_t (*)(void))type metadata accessor for PrivateMLClientAlertService);
  unint64_t v58 = (*(unsigned __int8 *)(v56 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  unint64_t v59 = (void *)swift_allocObject();
  v59[2] = 0;
  v59[3] = 0;
  v59[4] = v44;
  sub_25A7C304C(v54, (uint64_t)v59 + v58);
  swift_retain();
  sub_25A7C2C34(v55, (uint64_t)&unk_26A464328, (uint64_t)v59);
  swift_release();
  return swift_release();
}

uint64_t sub_25A7C27E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a5;
  uint64_t v6 = sub_25A7F2EE0();
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  type metadata accessor for TapToRadarDraft();
  v5[9] = swift_task_alloc();
  v5[10] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_25A7C28E0, 0, 0);
}

uint64_t sub_25A7C28E0()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  swift_beginAccess();
  sub_25A7C3918(v2, v1, (uint64_t (*)(void))type metadata accessor for TapToRadarDraft);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25A7C29A8;
  return sub_25A7B8BB0();
}

uint64_t sub_25A7C29A8()
{
  uint64_t v2 = *(void *)(*v1 + 72);
  uint64_t v3 = *v1;
  *(void *)(v3 + 96) = v0;
  swift_task_dealloc();
  sub_25A7C3980(v2);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25A7C2B14, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_25A7C2B14()
{
  (*(void (**)(void, void, void))(v0[7] + 16))(v0[8], v0[5], v0[6]);
  uint64_t v1 = sub_25A7F2EC0();
  os_log_type_t v2 = sub_25A7F3180();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25A7B3000, v1, v2, "PrivateMLClient failure -- failed to open Tap To Radar3", v3, 2u);
    MEMORY[0x261145500](v3, -1, -1);
  }
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v6 = v0[6];
  MEMORY[0x261145390](v0[12]);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25A7C2C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A7F30D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25A7F30C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25A7C37C8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A7F30B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_25A7C2DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25A7F2EE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a2, v3);
  uint64_t v7 = sub_25A7F2EC0();
  os_log_type_t v8 = sub_25A7F3180();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25A7B3000, v7, v8, "Dismiss user notification for Tap-To-Radar", v9, 2u);
    MEMORY[0x261145500](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_25A7C2F28()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_25A7C304C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrivateMLClientAlertService();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A7C30B0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + v5);
  uint64_t v8 = *(void *)(v1 + v5 + 8);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = *(void *)(v1 + v6 + 8);
  uint64_t v11 = *(uint8_t **)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_25A7C1EC4(a1, v1 + v4, v7, v8, v9, v10, v11);
}

uint64_t sub_25A7C316C()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25A7C3244(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_25A7C2DD8(a1, v4);
}

uint64_t sub_25A7C32B4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25A7C3390;
  return v6(a1);
}

uint64_t sub_25A7C3390()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A7C3488(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A4641F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A7C34F0()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25A7C35D8(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for PrivateMLClientAlertService() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25A7C36D4;
  return sub_25A7C27E4(a1, v5, v6, v7, v8);
}

uint64_t sub_25A7C36D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A7C37C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464318);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A7C3828()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A7C3860(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25A7C36D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A464330 + dword_26A464330);
  return v6(a1, v4);
}

uint64_t sub_25A7C3918(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A7C3980(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TapToRadarDraft();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_25A7C39DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25A7F2EE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_25A7C3AA8(uint64_t a1)
{
  uint64_t v2 = sub_25A7F2EE0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25A7C3B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A7C3B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A7C3C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A7C3C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_25A7C3CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A7C3D10);
}

uint64_t sub_25A7C3D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A7F2EE0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_25A7C3D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A7C3D90);
}

uint64_t sub_25A7C3D90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A7F2EE0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25A7C3E00()
{
  uint64_t result = sub_25A7F2EE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_25A7C3E98(void (*a1)(__CFUserNotification *), uint64_t a2, void (*a3)(__CFUserNotification *))
{
  uint64_t v4 = v3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_25A7F2EC0();
  os_log_type_t v8 = sub_25A7F3180();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25A7B3000, v7, v8, "Displaying alert", v9, 2u);
    MEMORY[0x261145500](v9, -1, -1);
  }

  SInt32 error = 0;
  if (!*MEMORY[0x263EFFFC0])
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v10 = sub_25A7F3000();
  uint64_t v12 = v11;
  uint64_t v14 = v4[2];
  uint64_t v13 = v4[3];
  swift_bridgeObjectRetain();
  CFOptionFlags v15 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  CFOptionFlags responseFlags = v15;
  sub_25A7C4D50(v14, v13, v10, v12, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*MEMORY[0x263EFFFD0])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v17 = sub_25A7F3000();
  uint64_t v19 = v18;
  uint64_t v20 = v4[4];
  uint64_t v21 = v4[5];
  swift_bridgeObjectRetain();
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  CFOptionFlags responseFlags = v15;
  sub_25A7C4D50(v20, v21, v17, v19, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*MEMORY[0x263EFFFF8])
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  uint64_t v23 = sub_25A7F3000();
  uint64_t v25 = v24;
  uint64_t v26 = v4[6];
  uint64_t v27 = v4[7];
  swift_bridgeObjectRetain();
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  CFOptionFlags responseFlags = v15;
  sub_25A7C4D50(v26, v27, v23, v25, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*MEMORY[0x263EFFFF0]) {
    goto LABEL_24;
  }
  uint64_t v29 = sub_25A7F3000();
  uint64_t v31 = v30;
  uint64_t v33 = v4[8];
  uint64_t v32 = v4[9];
  swift_bridgeObjectRetain();
  char v34 = swift_isUniquelyReferenced_nonNull_native();
  CFOptionFlags responseFlags = v15;
  sub_25A7C4D50(v33, v32, v29, v31, v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB10];
  CFDictionaryRef v36 = (const __CFDictionary *)sub_25A7F2FB0();
  swift_bridgeObjectRelease();
  uint64_t v37 = CFUserNotificationCreate(v35, 30.0, 0, &error, v36);

  uint64_t v38 = sub_25A7F2EC0();
  os_log_type_t v39 = sub_25A7F3180();
  BOOL v40 = os_log_type_enabled(v38, v39);
  if (v37)
  {
    if (v40)
    {
      unint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v41 = 0;
      _os_log_impl(&dword_25A7B3000, v38, v39, "Wait for user response", v41, 2u);
      MEMORY[0x261145500](v41, -1, -1);
    }

    CFOptionFlags responseFlags = 0;
    SInt32 v42 = CFUserNotificationReceiveResponse(v37, 30.0, &responseFlags);
    uint64_t v43 = sub_25A7F2EC0();
    os_log_type_t v44 = sub_25A7F3180();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 67109120;
      sub_25A7F3270();
      _os_log_impl(&dword_25A7B3000, v43, v44, "User response received: %d", v45, 8u);
      MEMORY[0x261145500](v45, -1, -1);
    }

    if (v42) {
      goto LABEL_13;
    }
    if (!responseFlags) {
      a3 = a1;
    }
    if (!a3)
    {
LABEL_13:
    }
    else
    {
      swift_retain_n();
      a3(v37);

      sub_25A7C4ED8((uint64_t)a3);
      sub_25A7C4ED8((uint64_t)a3);
    }
  }
  else
  {
    if (v40)
    {
      os_log_type_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v46 = 0;
      _os_log_impl(&dword_25A7B3000, v38, v39, "Failed to create User notification for PrivateMLClient", v46, 2u);
      MEMORY[0x261145500](v46, -1, -1);
    }
  }
}

uint64_t sub_25A7C4368()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20PrivateMLClientAlert_logger;
  uint64_t v2 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25A7C4428()
{
  return type metadata accessor for PrivateMLClientAlert();
}

uint64_t type metadata accessor for PrivateMLClientAlert()
{
  uint64_t result = qword_26A464340;
  if (!qword_26A464340) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A7C447C()
{
  uint64_t result = sub_25A7F2EE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_25A7C451C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_25A7F3370();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unint64_t sub_25A7C45C0(uint64_t a1, uint64_t a2)
{
  sub_25A7F3420();
  sub_25A7F3050();
  uint64_t v4 = sub_25A7F3440();
  return sub_25A7C4638(a1, a2, v4);
}

unint64_t sub_25A7C4638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25A7F33A0() & 1) == 0)
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
      while (!v14 && (sub_25A7F33A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25A7C471C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE0);
  char v42 = a2;
  uint64_t v6 = sub_25A7F3350();
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
  os_log_type_t v39 = v2;
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
    uint64_t v24 = (void *)(v5 + 64);
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
    CFAllocatorRef v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_25A7F3420();
    sub_25A7F3050();
    uint64_t result = sub_25A7F3440();
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
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25A7C4A44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464350);
  char v37 = a2;
  uint64_t v6 = sub_25A7F3350();
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
  uint64_t v34 = v2;
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
    unint64_t v22 = (void *)(v5 + 64);
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
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25A7F3420();
    sub_25A7F3050();
    uint64_t result = sub_25A7F3440();
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
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25A7C4D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25A7C45C0(a3, a4);
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
    sub_25A7C4EE8();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      int64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      void *v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_25A7C471C(v17, a5 & 1);
  unint64_t v23 = sub_25A7C45C0(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_25A7F33B0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  char v25 = (uint64_t *)(v20[6] + 16 * v14);
  *char v25 = a3;
  v25[1] = a4;
  unint64_t v26 = (void *)(v20[7] + 16 * v14);
  *unint64_t v26 = a1;
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

uint64_t sub_25A7C4ED8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_25A7C4EE8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A7F3340();
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
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
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

void *sub_25A7C50A4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464350);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A7F3340();
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
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
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

uint64_t dispatch thunk of InferenceProviderWithPrewarm.prewarmHint(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_25A7C36D4;
  return v9(a1, a2, a3);
}

uint64_t sub_25A7C5358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v31 = a1;
  uint64_t v3 = sub_25A7F2360();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v30 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A7F3310();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25A7F2EE0();
  MEMORY[0x270FA5388](v12);
  unint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v15 + 16))(v14, v2);
  uint64_t v16 = (int *)_s18InstrumentedTokensVMa(0);
  uint64_t v17 = v2 + v16[5];
  uint64_t v18 = sub_25A7F2080();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v17);
  int64_t v22 = (uint64_t *)(v2 + v16[6]);
  uint64_t v23 = v22[1];
  uint64_t v29 = *v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v2 + v16[8], v8);
  uint64_t v24 = sub_25A7F2F20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 1, 1, v24);
  uint64_t v25 = v2 + v16[9];
  swift_bridgeObjectRetain();
  uint64_t v26 = (uint64_t)v30;
  sub_25A7F2370();
  sub_25A7C56F4(v25, (uint64_t)v32);
  return sub_25A7C5758((uint64_t)v14, (uint64_t)v20, v29, v23, (uint64_t)v11, (uint64_t)v7, 0, v26, v31, (uint64_t)v32, *(unsigned int *)(v2 + v16[10]) | ((unint64_t)*(unsigned __int8 *)(v2 + v16[10] + 4) << 32));
}

uint64_t _s18InstrumentedTokensVMa(uint64_t a1)
{
  return sub_25A7C5BAC(a1, (uint64_t *)&unk_26A464398);
}

uint64_t sub_25A7C56F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25A7C5758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, unint64_t a11)
{
  uint64_t v53 = a7;
  uint64_t v54 = a8;
  uint64_t v52 = a6;
  uint64_t v48 = a5;
  v37[1] = a4;
  uint64_t v39 = a3;
  uint64_t v42 = a2;
  uint64_t v49 = a10;
  unint64_t v56 = a11;
  uint64_t v57 = HIDWORD(a11) & 1;
  uint64_t v16 = sub_25A7F2EE0();
  uint64_t v55 = v16;
  uint64_t v43 = *(void *)(v16 - 8);
  uint64_t v17 = v43;
  MEMORY[0x270FA5388](v16);
  uint64_t v45 = (char *)v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_25A7F2F50();
  uint64_t v50 = *(void *)(v19 - 8);
  uint64_t v51 = v19;
  MEMORY[0x270FA5388](v19);
  os_log_type_t v44 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (int *)_s18InstrumentedTokensV13AsyncIteratorVMa(0);
  uint64_t v47 = a9 + v21[9];
  uint64_t v22 = v47;
  uint64_t v23 = sub_25A7F2F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  uint64_t v46 = v21[13];
  *(void *)(a9 + v46) = 0;
  int64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  uint64_t v38 = a1;
  v40(a9, a1, v16);
  uint64_t v24 = a9 + v21[5];
  uint64_t v41 = sub_25A7F2080();
  uint64_t v25 = *(void *)(v41 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, a2, v41);
  uint64_t v26 = (void *)(a9 + v21[6]);
  *uint64_t v26 = a3;
  v26[1] = a4;
  uint64_t v27 = a9 + v21[7];
  uint64_t v28 = sub_25A7F3310();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v27, v48, v28);
  uint64_t v31 = v49;
  sub_25A7C56F4(v49, a9 + v21[11]);
  v40((uint64_t)v45, a1, v55);
  swift_bridgeObjectRetain();
  char v58 = v57;
  int v32 = v44;
  sub_25A7F2F30();
  __swift_destroy_boxed_opaque_existential_1(v31);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v28);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v42, v41);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v38, v55);
  (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(a9 + v21[8], v32, v51);
  sub_25A7C5C34(v52, v47);
  *(void *)(a9 + v46) = v53;
  uint64_t v33 = a9 + v21[10];
  uint64_t v34 = sub_25A7F2360();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v33, v54, v34);
  uint64_t v36 = a9 + v21[12];
  *(_DWORD *)uint64_t v36 = v56;
  *(unsigned char *)(v36 + 4) = v57;
  return result;
}

uint64_t _s18InstrumentedTokensV13AsyncIteratorVMa(uint64_t a1)
{
  return sub_25A7C5BAC(a1, (uint64_t *)&unk_26A4643A8);
}

uint64_t sub_25A7C5BAC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
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

uint64_t sub_25A7C5C34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A7C5C9C(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_25A7F2F20();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464370);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  uint64_t v4 = sub_25A7F2EE0();
  v2[17] = v4;
  v2[18] = *(void *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464378);
  v2[22] = swift_task_alloc();
  uint64_t v5 = sub_25A7F2380();
  v2[23] = v5;
  v2[24] = *(void *)(v5 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7C5F00, 0, 0);
}

uint64_t sub_25A7C5F00()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = sub_25A7F2080();
  v0[27] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = v3;
  v0[28] = v3;
  v0[29] = *(void *)(v3 + 64);
  uint64_t v5 = swift_task_alloc();
  v0[30] = v5;
  uint64_t v6 = _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  v0[31] = v6;
  uint64_t v7 = v1 + *(int *)(v6 + 20);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[32] = v8;
  v0[33] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v5, v7, v2);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[34] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_25A7C6060;
  uint64_t v10 = v0[22];
  return MEMORY[0x270F57268](v10);
}

uint64_t sub_25A7C6060()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7C6C68;
  }
  else {
    uint64_t v2 = sub_25A7C6174;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7C6174()
{
  v113 = v0;
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[22];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = v0[31];
    uint64_t v5 = v0[15];
    uint64_t v6 = v0[8];
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[7];
    sub_25A7BD1C4(v3, &qword_26A464378);
    uint64_t v9 = v8 + *(int *)(v4 + 36);
    sub_25A7C7164(v9, v5, &qword_26A464360);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_25A7BD1C4(v0[15], &qword_26A464360);
    }
    else
    {
      uint64_t v40 = v0[9];
      uint64_t v39 = v0[10];
      uint64_t v41 = v0[8];
      (*(void (**)(uint64_t, void, uint64_t))(v40 + 32))(v39, v0[15], v41);
      sub_25A7F2F00();
      sub_25A7F2F10();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
      sub_25A7BD1C4(v9, &qword_26A464360);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v9, 1, 1, v41);
    }
    uint64_t v42 = v0[30];
    uint64_t v43 = v0[27];
    uint64_t v44 = v0[28];
    uint64_t v45 = v0[23];
    uint64_t v46 = v0[24];
    uint64_t v47 = v0[6];
    logMetric(logger:name:startInstant:)(v0[7], 0xD000000000000019, 0x800000025A7F5290);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v43);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(v47, 1, 1, v45);
    goto LABEL_23;
  }
  uint64_t v11 = v0[25];
  uint64_t v10 = v0[26];
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  v12(v10, v3, v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v11, v10, v1);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v11, v1);
  if (v13 == *MEMORY[0x263F611A0])
  {
    uint64_t v111 = v12;
    unint64_t v14 = (void (*)(uint64_t, uint64_t, uint64_t))v0[32];
    uint64_t v15 = v0[30];
    uint64_t v16 = v0[27];
    uint64_t v17 = (uint64_t *)v0[25];
    uint64_t v18 = v0[21];
    uint64_t v19 = v0[17];
    uint64_t v20 = v0[18];
    uint64_t v21 = v0[7];
    (*(void (**)(uint64_t *, void))(v0[24] + 96))(v17, v0[23]);
    uint64_t v22 = *v17;
    unint64_t v23 = v17[1];
    uint64_t v105 = v22;
    uint64_t v100 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    v100(v18, v21, v19);
    uint64_t v24 = swift_task_alloc();
    v14(v24, v15, v16);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_25A7F2EC0();
    os_log_type_t v26 = sub_25A7F3180();
    log = v25;
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = v0[27];
    uint64_t v29 = v0[28];
    uint64_t v30 = v0[21];
    uint64_t v31 = v0[17];
    uint64_t v32 = v0[18];
    if (v27)
    {
      uint64_t v97 = v0[21];
      uint64_t v33 = swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      uint64_t v112 = v95;
      *(_DWORD *)uint64_t v33 = 136315395;
      sub_25A7C71C8();
      os_log_type_t type = v26;
      uint64_t v34 = v24;
      uint64_t v35 = sub_25A7F3390();
      v0[4] = sub_25A7EED88(v35, v36, &v112);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      char v37 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v37(v34, v28);
      *(_WORD *)(v33 + 12) = 2081;
      swift_bridgeObjectRetain();
      v0[5] = sub_25A7EED88(v105, v23, &v112);
      uint64_t v38 = v37;
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, log, type, "%s received token %{private}s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v95, -1, -1);
      MEMORY[0x261145500](v33, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v97, v31);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v38(v24, v0[27]);
      swift_bridgeObjectRelease_n();

      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    }
    uint64_t v72 = v0[7];
    uint64_t v73 = v0[30];
    uint64_t v74 = (int *)v0[31];
    uint64_t v75 = v74[13];
    uint64_t v76 = v0[27];
    if (*(void *)(v72 + v75))
    {
      uint64_t result = ((uint64_t (*)(void, void))v38)(v0[30], v0[27]);
    }
    else
    {
      uint64_t v81 = v0[20];
      uint64_t v82 = v0[17];
      uint64_t v99 = v0[16];
      os_log_t logb = (os_log_t)v0[9];
      uint64_t v110 = v0[8];
      sub_25A7F2F40();
      v100(v81, v72, v82);
      LOBYTE(v81) = *(unsigned char *)(v72 + v74[12] + 4);
      swift_bridgeObjectRetain();
      LOBYTE(v112) = v81;
      sub_25A7F2EF0();
      v38(v73, v76);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))logb[7].isa)(v99, 0, 1, v110);
      uint64_t result = sub_25A7C5C34(v99, v72 + v74[9]);
    }
    uint64_t v83 = *(void *)(v72 + v75);
    BOOL v84 = __OFADD__(v83, 1);
    uint64_t v85 = v83 + 1;
    if (v84)
    {
      __break(1u);
      return result;
    }
    *(void *)(v72 + v75) = v85;
    goto LABEL_21;
  }
  if (v13 == *MEMORY[0x263F61190])
  {
    uint64_t v111 = v12;
    uint64_t v103 = (void (*)(uint64_t, uint64_t, uint64_t))v0[32];
    uint64_t v101 = v0[30];
    uint64_t v48 = v0[27];
    uint64_t v49 = v0[25];
    uint64_t v50 = v0[18];
    uint64_t v51 = v0[19];
    uint64_t v52 = v0[17];
    uint64_t v54 = v0[13];
    uint64_t v53 = v0[14];
    uint64_t v55 = v0[7];
    (*(void (**)(uint64_t, void))(v0[24] + 96))(v49, v0[23]);
    os_log_t loga = (os_log_t)__swift_instantiateConcreteTypeFromMangledName(&qword_26A464380);
    sub_25A7C70FC(v49 + SLODWORD(loga[6].isa), v53);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v51, v55, v52);
    uint64_t v56 = swift_task_alloc();
    v103(v56, v101, v48);
    sub_25A7C7164(v53, v54, &qword_26A464370);
    uint64_t v57 = sub_25A7F2EC0();
    os_log_type_t v58 = sub_25A7F3180();
    BOOL v59 = os_log_type_enabled(v57, v58);
    uint64_t v60 = v0[30];
    uint64_t v62 = v0[27];
    uint64_t v61 = v0[28];
    uint64_t v63 = v0[18];
    uint64_t v102 = v0[17];
    uint64_t v104 = v0[19];
    uint64_t v64 = v0[13];
    uint64_t v106 = v0[14];
    if (v59)
    {
      uint64_t v98 = v0[30];
      uint64_t v65 = v0[12];
      uint64_t v93 = v0[13];
      uint64_t v66 = swift_slowAlloc();
      uint64_t v96 = swift_slowAlloc();
      uint64_t v112 = v96;
      *(_DWORD *)uint64_t v66 = 136315394;
      sub_25A7C71C8();
      uint64_t v67 = sub_25A7F3390();
      v0[2] = sub_25A7EED88(v67, v68, &v112);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v69(v56, v62);
      *(_WORD *)(v66 + 12) = 2082;
      sub_25A7C7164(v93, v65, &qword_26A464370);
      uint64_t v70 = sub_25A7F3040();
      v0[3] = sub_25A7EED88(v70, v71, &v112);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      sub_25A7BD1C4(v93, &qword_26A464370);
      _os_log_impl(&dword_25A7B3000, v57, v58, "%s received environment. Server environment %{public}s", (uint8_t *)v66, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v96, -1, -1);
      MEMORY[0x261145500](v66, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v104, v102);
      sub_25A7BD1C4(v106, &qword_26A464370);
      v69(v98, v62);
      swift_task_dealloc();
    }
    else
    {

      sub_25A7BD1C4(v64, &qword_26A464370);
      v86 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v86(v56, v62);
      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v104, v102);
      sub_25A7BD1C4(v106, &qword_26A464370);
      v86(v60, v62);
    }
    uint64_t v87 = v0[25];
    sub_25A7BD1C4(v87 + SLODWORD(loga[8].isa), &qword_26A464388);
    uint64_t v88 = sub_25A7F23D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v88 - 8) + 8))(v87, v88);
LABEL_21:
    uint64_t v12 = v111;
    goto LABEL_22;
  }
  uint64_t v79 = v0[24];
  uint64_t v78 = v0[25];
  uint64_t v80 = v0[23];
  (*(void (**)(void, void))(v0[28] + 8))(v0[30], v0[27]);
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v78, v80);
LABEL_22:
  uint64_t v89 = v0[23];
  uint64_t v90 = v0[24];
  uint64_t v91 = v0[6];
  v12(v91, v0[26], v89);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v90 + 56))(v91, 0, 1, v89);
LABEL_23:
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
  uint64_t v92 = (uint64_t (*)(void))v0[1];
  return v92();
}

uint64_t sub_25A7C6C68()
{
  (*(void (**)(void, void))(v0[28] + 8))(v0[30], v0[27]);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25A7C6D90(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25A7C36D4;
  return sub_25A7C5C9C(a1);
}

uint64_t sub_25A7C6E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  uint64_t v6 = (void *)swift_task_alloc();
  v4[6] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_25A7C6EC8;
  return sub_25A7C5C9C(a1);
}

uint64_t sub_25A7C6EC8()
{
  uint64_t v2 = (void *)*v1;
  v2[7] = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (v2[3])
    {
      swift_getObjectType();
      uint64_t v3 = sub_25A7F30B0();
      uint64_t v5 = v4;
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v5 = 0;
    }
    return MEMORY[0x270FA2498](sub_25A7C7038, v3, v5);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t sub_25A7C7038()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[5];
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464308);
  swift_willThrowTypedImpl();
  *uint64_t v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A7C70D0@<X0>(uint64_t a1@<X8>)
{
  sub_25A7C5358(a1);
  return sub_25A7C9D24(v1);
}

uint64_t sub_25A7C70FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A7C7164(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25A7C71C8()
{
  unint64_t result = qword_26A464390;
  if (!qword_26A464390)
  {
    sub_25A7F2080();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A464390);
  }
  return result;
}

uint64_t *sub_25A7C7214(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A7F2EE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A7F2080();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    unint64_t v14 = (uint64_t *)((char *)a1 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *unint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = (char *)a1 + v13;
    uint64_t v18 = (char *)a2 + v13;
    uint64_t v19 = sub_25A7F2390();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    v20(v17, v18, v19);
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)a1 + v21;
    unint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = sub_25A7F3310();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    uint64_t v25 = a3[9];
    long long v26 = *(_OWORD *)((char *)a2 + v25 + 24);
    *(_OWORD *)((char *)a1 + v25 + 24) = v26;
    (**(void (***)(void))(v26 - 8))();
    uint64_t v27 = a3[10];
    uint64_t v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    *(_DWORD *)uint64_t v28 = *(_DWORD *)v29;
    v28[4] = v29[4];
  }
  return a1;
}

uint64_t sub_25A7C7450(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_25A7F2390();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[8];
  uint64_t v10 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[9];
  return __swift_destroy_boxed_opaque_existential_1(v11);
}

uint64_t sub_25A7C759C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v11);
  unint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a1 + v12;
  uint64_t v17 = a2 + v12;
  uint64_t v18 = sub_25A7F2390();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  uint64_t v24 = a3[9];
  long long v25 = *(_OWORD *)(a2 + v24 + 24);
  *(_OWORD *)(a1 + v24 + 24) = v25;
  (**(void (***)(void))(v25 - 8))();
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(_DWORD *)uint64_t v27 = *(_DWORD *)v28;
  *(unsigned char *)(v27 + 4) = *(unsigned char *)(v28 + 4);
  return a1;
}

uint64_t sub_25A7C7788(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_25A7F2390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[9]), (uint64_t *)(a2 + a3[9]));
  uint64_t v22 = a3[10];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = (int *)(a2 + v22);
  int v25 = *v24;
  *(unsigned char *)(v23 + 4) = *((unsigned char *)v24 + 4);
  *(_DWORD *)uint64_t v23 = v25;
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
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *unint64_t result = *a2;
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

uint64_t sub_25A7C7B60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25A7F2390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[9];
  uint64_t v20 = a3[10];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  long long v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v21 + 32) = *(void *)(v22 + 32);
  uint64_t v24 = a1 + v20;
  uint64_t v25 = a2 + v20;
  *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
  *(unsigned char *)(v24 + 4) = *(unsigned char *)(v25 + 4);
  return a1;
}

uint64_t sub_25A7C7CEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_25A7F2390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  __swift_destroy_boxed_opaque_existential_1(a1 + v24);
  long long v27 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *(_OWORD *)(v25 + 16) = v27;
  *(void *)(v25 + 32) = *(void *)(v26 + 32);
  uint64_t v28 = a3[10];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  *(_DWORD *)uint64_t v29 = *(_DWORD *)v30;
  *(unsigned char *)(v29 + 4) = *(unsigned char *)(v30 + 4);
  return a1;
}

uint64_t sub_25A7C7E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A7C7EAC);
}

uint64_t sub_25A7C7EAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_25A7F2080();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = sub_25A7F2390();
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[7];
      goto LABEL_11;
    }
    uint64_t v17 = sub_25A7F3310();
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[8];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_25A7C807C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A7C8090);
}

uint64_t sub_25A7C8090(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_25A7F2EE0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_25A7F2080();
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v16 = sub_25A7F2390();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  uint64_t v17 = sub_25A7F3310();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[8];
  return v18(v20, a2, a2, v19);
}

uint64_t sub_25A7C8260()
{
  uint64_t result = sub_25A7F2EE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25A7F2080();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_25A7F2390();
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_25A7F3310();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_25A7C83BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A7F2EE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A7F2080();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (uint64_t *)((char *)a1 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = (char *)a1 + v13;
    uint64_t v18 = (char *)a2 + v13;
    uint64_t v19 = sub_25A7F3310();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    v20(v17, v18, v19);
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = sub_25A7F2F50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    uint64_t v25 = a3[9];
    uint64_t v26 = (char *)a1 + v25;
    long long v27 = (char *)a2 + v25;
    uint64_t v28 = sub_25A7F2F20();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v32 = a3[10];
    uint64_t v33 = (char *)a1 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = sub_25A7F2360();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
    uint64_t v36 = a3[11];
    long long v37 = *(_OWORD *)((char *)a2 + v36 + 24);
    *(_OWORD *)((char *)a1 + v36 + 24) = v37;
    (**(void (***)(void))(v37 - 8))();
    uint64_t v38 = a3[12];
    uint64_t v39 = a3[13];
    uint64_t v40 = (char *)a1 + v38;
    uint64_t v41 = (char *)a2 + v38;
    *(_DWORD *)uint64_t v40 = *(_DWORD *)v41;
    v40[4] = v41[4];
    *(uint64_t *)((char *)a1 + v39) = *(uint64_t *)((char *)a2 + v39);
  }
  return a1;
}

uint64_t sub_25A7C8720(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[8];
  uint64_t v10 = sub_25A7F2F50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[9];
  uint64_t v12 = sub_25A7F2F20();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  uint64_t v14 = a1 + a2[10];
  uint64_t v15 = sub_25A7F2360();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = a1 + a2[11];
  return __swift_destroy_boxed_opaque_existential_1(v16);
}

uint64_t sub_25A7C8930(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a1 + v12;
  uint64_t v17 = a2 + v12;
  uint64_t v18 = sub_25A7F3310();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_25A7F2F50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  uint64_t v27 = sub_25A7F2F20();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  uint64_t v30 = a3[10];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  uint64_t v33 = sub_25A7F2360();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
  uint64_t v34 = a3[11];
  long long v35 = *(_OWORD *)(a2 + v34 + 24);
  *(_OWORD *)(a1 + v34 + 24) = v35;
  (**(void (***)(void))(v35 - 8))();
  uint64_t v36 = a3[12];
  uint64_t v37 = a3[13];
  uint64_t v38 = a1 + v36;
  uint64_t v39 = a2 + v36;
  *(_DWORD *)uint64_t v38 = *(_DWORD *)v39;
  *(unsigned char *)(v38 + 4) = *(unsigned char *)(v39 + 4);
  *(void *)(a1 + v37) = *(void *)(a2 + v37);
  return a1;
}

uint64_t sub_25A7C8C44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_25A7F2F50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = sub_25A7F2F20();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 24))(v23, v24, v25);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_6;
  }
  if (v29)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 16))(v23, v24, v25);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_7:
  uint64_t v31 = a3[10];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  uint64_t v34 = sub_25A7F2360();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 24))(v32, v33, v34);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[11]), (uint64_t *)(a2 + a3[11]));
  uint64_t v35 = a3[12];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = (int *)(a2 + v35);
  int v38 = *v37;
  *(unsigned char *)(v36 + 4) = *((unsigned char *)v37 + 4);
  *(_DWORD *)uint64_t v36 = v38;
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_25A7C8F84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_25A7F2F50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  uint64_t v22 = sub_25A7F2F20();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  uint64_t v25 = a3[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = sub_25A7F2360();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
  uint64_t v29 = a3[11];
  uint64_t v30 = a3[12];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = a2 + v29;
  long long v33 = *(_OWORD *)(v32 + 16);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  *(_OWORD *)(v31 + 16) = v33;
  *(void *)(v31 + 32) = *(void *)(v32 + 32);
  uint64_t v34 = a1 + v30;
  uint64_t v35 = a2 + v30;
  *(_DWORD *)uint64_t v34 = *(_DWORD *)v35;
  *(unsigned char *)(v34 + 4) = *(unsigned char *)(v35 + 4);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_25A7C9244(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25A7F2080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_25A7F2F50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  uint64_t v27 = sub_25A7F2F20();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v25, v26, v27);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
    goto LABEL_6;
  }
  if (v31)
  {
LABEL_6:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
    memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v25, v26, v27);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
LABEL_7:
  uint64_t v33 = a3[10];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = sub_25A7F2360();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 40))(v34, v35, v36);
  uint64_t v37 = a3[11];
  uint64_t v38 = a1 + v37;
  uint64_t v39 = a2 + v37;
  __swift_destroy_boxed_opaque_existential_1(a1 + v37);
  long long v40 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  *(_OWORD *)(v38 + 16) = v40;
  *(void *)(v38 + 32) = *(void *)(v39 + 32);
  uint64_t v41 = a3[12];
  uint64_t v42 = a3[13];
  uint64_t v43 = a1 + v41;
  uint64_t v44 = a2 + v41;
  *(_DWORD *)uint64_t v43 = *(_DWORD *)v44;
  *(unsigned char *)(v43 + 4) = *(unsigned char *)(v44 + 4);
  *(void *)(a1 + v42) = *(void *)(a2 + v42);
  return a1;
}

uint64_t sub_25A7C9584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A7C9598);
}

uint64_t sub_25A7C9598(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A7F2EE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_16:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_25A7F2080();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_15:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_16;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = sub_25A7F3310();
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[7];
      goto LABEL_15;
    }
    uint64_t v17 = sub_25A7F2F50();
    if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a2)
    {
      uint64_t v8 = v17;
      uint64_t v12 = *(void *)(v17 - 8);
      uint64_t v13 = a3[8];
      goto LABEL_15;
    }
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
    if (*(_DWORD *)(*(void *)(v18 - 8) + 84) == a2)
    {
      uint64_t v8 = v18;
      uint64_t v12 = *(void *)(v18 - 8);
      uint64_t v13 = a3[9];
      goto LABEL_15;
    }
    uint64_t v19 = sub_25A7F2360();
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48);
    uint64_t v21 = v19;
    uint64_t v22 = a1 + a3[10];
    return v20(v22, a2, v21);
  }
}

uint64_t sub_25A7C9804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A7C9818);
}

uint64_t sub_25A7C9818(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_25A7F2EE0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_14:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_25A7F2080();
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[5];
LABEL_13:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_14;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v16 = sub_25A7F3310();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_13;
  }
  uint64_t v17 = sub_25A7F2F50();
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
  {
    uint64_t v10 = v17;
    uint64_t v14 = *(void *)(v17 - 8);
    uint64_t v15 = a4[8];
    goto LABEL_13;
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
  if (*(_DWORD *)(*(void *)(v18 - 8) + 84) == a3)
  {
    uint64_t v10 = v18;
    uint64_t v14 = *(void *)(v18 - 8);
    uint64_t v15 = a4[9];
    goto LABEL_13;
  }
  uint64_t v19 = sub_25A7F2360();
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  uint64_t v21 = v19;
  uint64_t v22 = a1 + a4[10];
  return v20(v22, a2, a2, v21);
}

void sub_25A7C9A84()
{
  sub_25A7F2EE0();
  if (v0 <= 0x3F)
  {
    sub_25A7F2080();
    if (v1 <= 0x3F)
    {
      sub_25A7F3310();
      if (v2 <= 0x3F)
      {
        sub_25A7F2F50();
        if (v3 <= 0x3F)
        {
          sub_25A7C9C64();
          if (v4 <= 0x3F)
          {
            sub_25A7F2360();
            if (v5 <= 0x3F) {
              swift_initStructMetadata();
            }
          }
        }
      }
    }
  }
}

void sub_25A7C9C64()
{
  if (!qword_26A4643B8[0])
  {
    sub_25A7F2F20();
    unint64_t v0 = sub_25A7F3260();
    if (!v1) {
      atomic_store(v0, qword_26A4643B8);
    }
  }
}

uint64_t sub_25A7C9CBC()
{
  return MEMORY[0x263F8E4E0];
}

unint64_t sub_25A7C9CCC()
{
  unint64_t result = qword_26A4643D0;
  if (!qword_26A4643D0)
  {
    _s18InstrumentedTokensV13AsyncIteratorVMa(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4643D0);
  }
  return result;
}

uint64_t sub_25A7C9D24(uint64_t a1)
{
  uint64_t v2 = _s18InstrumentedTokensVMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25A7C9D80(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464530);
  uint64_t v2 = sub_25A7F3360();
  unint64_t v3 = (void *)v2;
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
    sub_25A7C7164(v6, (uint64_t)&v15, &qword_26A464538);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25A7C45C0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25A7F03A0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_25A7C9EB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE0);
  uint64_t v2 = (void *)sub_25A7F3360();
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
    unint64_t result = sub_25A7C45C0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

void logMetric(logger:name:startInstant:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_25A7F3310();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7C1300();
  if (sub_25A7F31D0())
  {
    sub_25A7F32F0();
    sub_25A7F3300();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_25A7F2EC0();
    os_log_type_t v10 = sub_25A7F31A0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v16 = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_25A7EED88(a2, a3, &v16);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2080;
      uint64_t v13 = sub_25A7F3450();
      uint64_t v15 = sub_25A7EED88(v13, v14, &v16);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A7B3000, v9, v10, "performance metric: %s %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v12, -1, -1);
      MEMORY[0x261145500](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_25A7CA24C()
{
  uint64_t v0 = sub_25A7F2EE0();
  __swift_allocate_value_buffer(v0, qword_26B32BBF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B32BBF8);
  swift_bridgeObjectRetain();
  return sub_25A7F2ED0();
}

uint64_t sub_25A7CA2D4()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7CA31C()
{
  return sub_25A7F3430();
}

uint64_t sub_25A7CA34C()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7CA390@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25A7EF854(*a1);
  *a2 = result;
  return result;
}

void sub_25A7CA3BC(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_25A7CA3CC()
{
  uint64_t v0 = qword_26A4643E8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_25A7CA404()
{
  return *v0 + 1;
}

uint64_t sub_25A7CA410(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A7F1288();
  unint64_t v5 = sub_25A7F12DC();
  return MEMORY[0x270F9FB50](a1, a2, v4, v5);
}

uint64_t ErrorCodeDifferentiator.rawValue.getter()
{
  return 10000 * *v0 + 10000;
}

PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional __swiftcall ErrorCodeDifferentiator.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue <= 29999)
  {
    if (rawValue == 10000)
    {
      *uint64_t v1 = 0;
      return (PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional)rawValue;
    }
    if (rawValue == 20000)
    {
      *uint64_t v1 = 1;
      return (PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional)rawValue;
    }
LABEL_12:
    *uint64_t v1 = 5;
    return (PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional)rawValue;
  }
  if (rawValue == 50000)
  {
    *uint64_t v1 = 4;
    return (PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional)rawValue;
  }
  if (rawValue == 40000)
  {
    *uint64_t v1 = 3;
    return (PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional)rawValue;
  }
  if (rawValue != 30000) {
    goto LABEL_12;
  }
  *uint64_t v1 = 2;
  return (PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional)rawValue;
}

uint64_t sub_25A7CA504()
{
  return sub_25A7F3440();
}

uint64_t sub_25A7CA550()
{
  return sub_25A7F3430();
}

uint64_t sub_25A7CA584()
{
  return sub_25A7F3440();
}

PrivateMLClientInferenceProvider::ErrorCodeDifferentiator_optional sub_25A7CA5CC(Swift::Int *a1)
{
  return ErrorCodeDifferentiator.init(rawValue:)(*a1);
}

void sub_25A7CA5D4(void *a1@<X8>)
{
  *a1 = 10000 * *v1 + 10000;
}

uint64_t NewInferenceProvider.__allocating_init()()
{
  uint64_t v0 = sub_25A7F2EE0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_26B32BB78 != -1) {
    swift_once();
  }
  uint64_t v6 = v4 + v5;
  uint64_t v7 = __swift_project_value_buffer(v0, (uint64_t)qword_26B32BBF8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v8(v6, v7, v0);
  sub_25A7F32E0();
  v8((uint64_t)v3, v6, v0);
  sub_25A7F2E40();
  return v4;
}

uint64_t NewInferenceProvider.init()()
{
  uint64_t v1 = sub_25A7F2EE0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25A7F2E60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_26B32BB78 != -1) {
    swift_once();
  }
  uint64_t v10 = v0 + v9;
  uint64_t v11 = __swift_project_value_buffer(v1, (uint64_t)qword_26B32BBF8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v12(v10, v11, v1);
  sub_25A7F32E0();
  v12((uint64_t)v4, v10, v1);
  sub_25A7F2E40();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster, v8, v5);
  return v0;
}

uint64_t NewInferenceProvider.loadIn(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_25A7CA968, 0, 0);
}

uint64_t sub_25A7CA968()
{
  uint64_t v10 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_25A7F2EC0();
  os_log_type_t v2 = sub_25A7F31A0();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = v0[4];
    uint64_t v4 = v0[3];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_25A7EED88(v4, v3, &v9);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A7B3000, v1, v2, "%s load in", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v6, -1, -1);
    MEMORY[0x261145500](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t NewInferenceProvider.loadOut(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_25A7CAB40, 0, 0);
}

uint64_t sub_25A7CAB40()
{
  uint64_t v10 = v0;
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_25A7F2EC0();
  os_log_type_t v2 = sub_25A7F31A0();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = v0[4];
    uint64_t v4 = v0[3];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v9 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_25A7EED88(v4, v3, &v9);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A7B3000, v1, v2, "%s load out", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v6, -1, -1);
    MEMORY[0x261145500](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t NewInferenceProvider.prewarmHint(_:)(uint64_t a1)
{
  v2[117] = v1;
  v2[116] = a1;
  uint64_t v3 = sub_25A7F2E70();
  v2[118] = v3;
  v2[119] = *(void *)(v3 - 8);
  v2[120] = swift_task_alloc();
  v2[121] = swift_task_alloc();
  v2[122] = swift_task_alloc();
  v2[123] = swift_task_alloc();
  uint64_t v4 = sub_25A7F2D40();
  v2[124] = v4;
  v2[125] = *(void *)(v4 - 8);
  v2[126] = swift_task_alloc();
  v2[127] = swift_task_alloc();
  v2[128] = swift_task_alloc();
  v2[129] = swift_task_alloc();
  v2[130] = swift_task_alloc();
  v2[131] = swift_task_alloc();
  v2[132] = swift_task_alloc();
  v2[133] = swift_task_alloc();
  v2[134] = swift_task_alloc();
  v2[135] = swift_task_alloc();
  v2[136] = swift_task_alloc();
  v2[137] = swift_task_alloc();
  v2[138] = swift_task_alloc();
  v2[139] = swift_task_alloc();
  v2[140] = swift_task_alloc();
  v2[141] = swift_task_alloc();
  v2[142] = swift_task_alloc();
  v2[143] = swift_task_alloc();
  uint64_t v5 = sub_25A7F2C40();
  v2[144] = v5;
  v2[145] = *(void *)(v5 - 8);
  v2[146] = swift_task_alloc();
  uint64_t v6 = sub_25A7F2E30();
  v2[147] = v6;
  v2[148] = *(void *)(v6 - 8);
  v2[149] = swift_task_alloc();
  v2[150] = swift_task_alloc();
  v2[151] = swift_task_alloc();
  v2[152] = swift_task_alloc();
  v2[153] = swift_task_alloc();
  v2[154] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7CB004, 0, 0);
}

uint64_t sub_25A7CB004()
{
  uint64_t v228 = v0;
  *(void *)(v0 + 1240) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  sub_25A7F2E20();
  uint64_t v1 = sub_25A7F2E50();
  os_signpost_type_t v2 = sub_25A7F3230();
  uint64_t v223 = (long long *)(v0 + 56);
  if (sub_25A7F3250())
  {
    uint64_t v3 = *(void *)(v0 + 1224);
    uint64_t v4 = *(void *)(v0 + 1184);
    uint64_t v5 = *(void *)(v0 + 1176);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    unint64_t v7 = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v6(v3, *(void *)(v0 + 1232), v5);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    os_signpost_id_t v9 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v1, v2, v9, "prewarmHint", "", v8, 2u);
    MEMORY[0x261145500](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 1184);

    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    unint64_t v7 = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  *(void *)(v0 + 1248) = v10;
  uint64_t v12 = *(void *)(v0 + 1232);
  uint64_t v13 = *(void *)(v0 + 1224);
  uint64_t v14 = *(void *)(v0 + 1184);
  uint64_t v15 = *(void *)(v0 + 1176);
  uint64_t v16 = *(void *)(v0 + 1168);
  uint64_t v17 = *(void *)(v0 + 1160);
  uint64_t v221 = *(void *)(v0 + 1152);
  *(void *)(v0 + 1256) = v7;
  uint64_t v194 = v10;
  v10(v13, v12, v15);
  sub_25A7F2EA0();
  swift_allocObject();
  *(void *)(v0 + 1264) = sub_25A7F2E90();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  *(void *)(v0 + 1272) = v18;
  *(void *)(v0 + 1280) = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  *(void *)os_log_type_t type = v18;
  v18(v12, v15);
  uint64_t v19 = sub_25A7F2BB0();
  *(void *)(v0 + 1288) = v19;
  uint64_t v208 = v19;
  uint64_t v209 = *(void *)(v19 - 8);
  *(void *)(v0 + 1296) = v209;
  uint64_t v20 = swift_task_alloc();
  *(void *)(v0 + 1304) = v20;
  sub_25A7F2BA0();
  sub_25A7F2D20();
  sub_25A7F2C30();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v221);
  LOBYTE(v227[0]) = 0;
  uint64_t v210 = v20;
  sub_25A7F2B90();
  uint64_t v21 = sub_25A7F2080();
  *(void *)(v0 + 1312) = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v222 = v22;
  *(void *)(v0 + 1320) = v22;
  *(void *)(v0 + 1328) = *(void *)(v22 + 64);
  uint64_t v23 = swift_task_alloc();
  *(void *)(v0 + 1336) = v23;
  sub_25A7F2070();
  os_log_t log = (os_log_t)sub_25A7F2060();
  *(void *)(v0 + 1344) = log;
  unint64_t v217 = v24;
  *(void *)(v0 + 1352) = v24;
  int v25 = sub_25A7F2D00();
  uint64_t v26 = sub_25A7CE90C(v23, v25, 0);
  unint64_t v28 = v27;
  *(void *)(v0 + 1360) = v26;
  *(void *)(v0 + 1368) = v27;
  sub_25A7F20E0();
  swift_allocObject();
  sub_25A7F20D0();
  sub_25A7F2D30();
  sub_25A7F20B0();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v187 = v26;
  uint64_t v188 = v23;
  uint64_t v190 = v21;
  if (*(void *)(v0 + 80))
  {
    unint64_t v189 = v28;
    unint64_t v211 = (_OWORD *)(v0 + 536);
    sub_25A7EEEA0(v223, v0 + 16);
    uint64_t v224 = (void *)(v0 + 16);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    uint64_t v29 = sub_25A7F2100();
    uint64_t v30 = *(void *)(v29 + 16);
    if (v30)
    {
      uint64_t v31 = v29 + 32;
      while (1)
      {
        sub_25A7C56F4(v31, v0 + 576);
        sub_25A7C56F4(v0 + 576, v0 + 616);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB60);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB70);
        if (swift_dynamicCast()) {
          break;
        }
        __swift_destroy_boxed_opaque_existential_1(v0 + 576);
        v31 += 40;
        if (!--v30) {
          goto LABEL_9;
        }
      }
      __swift_destroy_boxed_opaque_existential_1(v0 + 456);
      uint64_t v32 = (long long *)(v0 + 536);
      sub_25A7EEEA0((long long *)(v0 + 576), (uint64_t)v211);
    }
    else
    {
LABEL_9:
      uint64_t v32 = (long long *)(v0 + 536);
      *(void *)(v0 + 568) = 0;
      *unint64_t v211 = 0u;
      *(_OWORD *)(v0 + 552) = 0u;
    }
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + 560))
    {
      uint64_t v213 = (_OWORD *)(v0 + 376);
      v185 = (void *)(v0 + 496);
      sub_25A7EEEA0(v32, v0 + 496);
      __swift_project_boxed_opaque_existential_1(v224, *(void *)(v0 + 40));
      uint64_t v61 = sub_25A7F2100();
      uint64_t v62 = *(void *)(v61 + 16);
      if (v62)
      {
        uint64_t v63 = v61 + 32;
        while (1)
        {
          sub_25A7C56F4(v63, v0 + 336);
          sub_25A7C56F4(v0 + 336, v0 + 296);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB60);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB68);
          if (swift_dynamicCast()) {
            break;
          }
          __swift_destroy_boxed_opaque_existential_1(v0 + 336);
          v63 += 40;
          if (!--v62) {
            goto LABEL_18;
          }
        }
        __swift_destroy_boxed_opaque_existential_1(v0 + 256);
        uint64_t v64 = (long long *)(v0 + 376);
        sub_25A7EEEA0((long long *)(v0 + 336), (uint64_t)v213);
      }
      else
      {
LABEL_18:
        uint64_t v64 = (long long *)(v0 + 376);
        *(void *)(v0 + 408) = 0;
        *uint64_t v213 = 0u;
        *(_OWORD *)(v0 + 392) = 0u;
      }
      swift_bridgeObjectRelease();
      uint64_t v100 = *(void *)(v0 + 1000);
      uint64_t v101 = *(void *)(v0 + 992);
      uint64_t v102 = *(void *)(v0 + 928);
      if (*(void *)(v0 + 400))
      {
        v226 = (void *)(v0 + 176);
        v215 = (void *)(v0 + 216);
        *(void *)typea = *(void *)(v0 + 1144);
        uint64_t v200 = *(void *)(v0 + 1136);
        os_log_t v203 = *(os_log_t *)(v0 + 1128);
        sub_25A7EEEA0(v64, v0 + 416);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
        uint64_t v103 = swift_allocObject();
        *(_OWORD *)(v103 + 16) = xmmword_25A7F46B0;
        *(void *)(v103 + 32) = 0x6C65646F6DLL;
        *(void *)(v103 + 40) = 0xE500000000000000;
        __swift_project_boxed_opaque_existential_1(v185, *(void *)(v0 + 520));
        *(void *)(v103 + 48) = sub_25A7F20F0();
        *(void *)(v103 + 56) = v104;
        *(void *)(v103 + 64) = 0x72657470616461;
        *(void *)(v103 + 72) = 0xE700000000000000;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 416), *(void *)(v0 + 440));
        *(void *)(v103 + 80) = sub_25A7F20F0();
        *(void *)(v103 + 88) = v105;
        unint64_t v106 = sub_25A7C9EB8(v103);
        *(void *)(v0 + 1376) = v106;
        *(void *)(v0 + 1384) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
        unint64_t v107 = *(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 16);
        *(void *)(v0 + 1392) = v107;
        *(void *)(v0 + 1400) = (v100 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        v107(*(void *)typea, v102, v101);
        v107(v200, v102, v101);
        v107((uint64_t)v203, v102, v101);
        unint64_t v108 = v28;
        sub_25A7C56F4((uint64_t)v185, v0 + 216);
        sub_25A7C56F4(v0 + 416, v0 + 176);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        unint64_t v109 = sub_25A7F2EC0();
        os_log_type_t v110 = sub_25A7F31A0();
        BOOL v111 = os_log_type_enabled(v109, v110);
        uint64_t v112 = *(void *)(v0 + 1144);
        uint64_t v113 = *(void *)(v0 + 1128);
        uint64_t v114 = *(void *)(v0 + 1000);
        uint64_t v115 = *(void *)(v0 + 992);
        os_log_t v207 = (os_log_t)v106;
        if (v111)
        {
          uint64_t v204 = v109;
          uint64_t v184 = *(void *)(v0 + 1136);
          uint64_t v186 = *(void *)(v0 + 1128);
          uint64_t v116 = swift_slowAlloc();
          uint64_t v201 = swift_slowAlloc();
          v227[0] = v201;
          *(_DWORD *)uint64_t v116 = 136316674;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 872) = sub_25A7EED88((uint64_t)log, v217, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v116 + 12) = 2080;
          uint64_t v117 = swift_task_alloc();
          MEMORY[0x261144930]();
          uint64_t v118 = sub_25A7F2060();
          unint64_t v120 = v119;
          (*(void (**)(uint64_t, uint64_t))(v222 + 8))(v117, v190);
          swift_task_dealloc();
          *(void *)(v0 + 880) = sub_25A7EED88(v118, v120, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          unint64_t v121 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
          v121(v112, v115);
          *(_WORD *)(v116 + 22) = 2080;
          uint64_t v122 = sub_25A7F2D30();
          *(void *)(v0 + 888) = sub_25A7EED88(v122, v123, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          uint64_t v124 = ((uint64_t (*)(uint64_t, uint64_t))v121)(v184, v115);
          *(_WORD *)(v116 + 32) = 2080;
          uint64_t v125 = MEMORY[0x261144950](v124);
          *(void *)(v0 + 896) = sub_25A7EED88(v125, v126, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          unint64_t v108 = v189;
          v121(v186, v115);
          *(_WORD *)(v116 + 42) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v127 = v187;
          *(void *)(v0 + 904) = sub_25A7EED88(v187, v189, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v116 + 52) = 2080;
          __swift_project_boxed_opaque_existential_1(v215, *(void *)(v0 + 240));
          uint64_t v128 = sub_25A7F20F0();
          *(void *)(v0 + 912) = sub_25A7EED88(v128, v129, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v215);
          *(_WORD *)(v116 + 62) = 2080;
          __swift_project_boxed_opaque_existential_1(v226, *(void *)(v0 + 200));
          uint64_t v130 = sub_25A7F20F0();
          *(void *)(v0 + 920) = sub_25A7EED88(v130, v131, v227);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v226);
          _os_log_impl(&dword_25A7B3000, v204, v110, "%s Initiating prewarm. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s\nmodel=%s adapter=%s", (uint8_t *)v116, 0x48u);
          swift_arrayDestroy();
          MEMORY[0x261145500](v201, -1, -1);
          uint64_t v132 = v116;
          os_log_t v133 = log;
          MEMORY[0x261145500](v132, -1, -1);

          uint64_t v134 = v209;
        }
        else
        {
          uint64_t v158 = *(void *)(v0 + 1136);

          swift_bridgeObjectRelease_n();
          uint64_t v159 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
          v159(v112, v115);
          v159(v158, v115);
          v159(v113, v115);
          swift_bridgeObjectRelease_n();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v215);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v226);
          uint64_t v134 = v209;
          uint64_t v127 = v187;
          os_log_t v133 = log;
        }
        uint64_t v160 = *(void *)(v0 + 928);
        uint64_t v161 = swift_task_alloc();
        *(void *)(v0 + 1408) = v161;
        (*(void (**)(void))(v134 + 16))();
        uint64_t v162 = (void *)swift_task_alloc();
        *(void *)(v0 + 1416) = v162;
        v162[2] = v133;
        v162[3] = v217;
        v162[4] = v207;
        v162[5] = v160;
        v162[6] = v127;
        v162[7] = v108;
        v163 = (void *)swift_task_alloc();
        *(void *)(v0 + 1424) = v163;
        void *v163 = v0;
        v163[1] = sub_25A7CD4E0;
        return sub_25A7EF87C(v161, (uint64_t)&unk_26A464438, (uint64_t)v162);
      }
      uint64_t v135 = *(void *)(v0 + 1096);
      uint64_t v136 = *(void *)(v0 + 1088);
      uint64_t v137 = *(void *)(v0 + 1080);
      sub_25A7BD1C4((uint64_t)v64, &qword_26A464428);
      uint64_t v138 = *(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 16);
      v138(v135, v102, v101);
      v138(v136, v102, v101);
      v138(v137, v102, v101);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v139 = sub_25A7F2EC0();
      os_log_type_t v140 = sub_25A7F3190();
      BOOL v141 = os_log_type_enabled(v139, v140);
      unint64_t v142 = *(NSObject **)(v0 + 1096);
      uint64_t v143 = *(NSObject **)(v0 + 1088);
      unint64_t v144 = *(NSObject **)(v0 + 1080);
      uint64_t v145 = *(void *)(v0 + 1000);
      uint64_t v146 = *(void *)(v0 + 992);
      if (v141)
      {
        uint64_t v183 = *(void *)(v0 + 1088);
        uint64_t v147 = swift_slowAlloc();
        uint64_t v216 = swift_slowAlloc();
        v227[0] = v216;
        *(_DWORD *)uint64_t v147 = 136316162;
        uint64_t v193 = v139;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 744) = sub_25A7EED88((uint64_t)log, v217, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v147 + 12) = 2080;
        os_log_type_t v205 = v140;
        uint64_t v148 = swift_task_alloc();
        MEMORY[0x261144930]();
        uint64_t v149 = sub_25A7F2060();
        os_log_t logb = v144;
        unint64_t v151 = v150;
        uint64_t v220 = *(void (**)(uint64_t, uint64_t))(v222 + 8);
        v220(v148, v190);
        swift_task_dealloc();
        *(void *)(v0 + 752) = sub_25A7EED88(v149, v151, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        unint64_t v152 = *(void (**)(uint64_t, uint64_t))(v145 + 8);
        v152((uint64_t)v142, v146);
        *(_WORD *)(v147 + 22) = 2080;
        uint64_t v153 = sub_25A7F2D30();
        *(void *)(v0 + 760) = sub_25A7EED88(v153, v154, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        uint64_t v155 = ((uint64_t (*)(uint64_t, uint64_t))v152)(v183, v146);
        *(_WORD *)(v147 + 32) = 2080;
        uint64_t v156 = MEMORY[0x261144950](v155);
        *(void *)(v0 + 768) = sub_25A7EED88(v156, v157, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        v152((uint64_t)logb, v146);
        *(_WORD *)(v147 + 42) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 776) = sub_25A7EED88(v187, v189, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25A7B3000, v193, v205, "%s prewarm with no LLMAdapter called. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v147, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v216, -1, -1);
        MEMORY[0x261145500](v147, -1, -1);

        v220(v188, v190);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v171 = *(void (**)(NSObject *, uint64_t))(v145 + 8);
        v171(v144, v146);
        v171(v143, v146);
        v171(v142, v146);
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v222 + 8))(v188, v190);
      }
      (*(void (**)(uint64_t, uint64_t))(v209 + 8))(v210, v208);
      uint64_t v92 = *(void (**)(uint64_t, uint64_t))type;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v185);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v224);
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v93 = sub_25A7F2E50();
      sub_25A7F2E80();
      os_signpost_type_t v94 = sub_25A7F3220();
      if (sub_25A7F3250())
      {
        uint64_t v172 = *(void *)(v0 + 984);
        uint64_t v173 = *(void *)(v0 + 952);
        uint64_t v174 = *(void *)(v0 + 944);
        swift_retain();
        sub_25A7F2EB0();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v173 + 88))(v172, v174) == *MEMORY[0x263F90238])
        {
          uint64_t v98 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 952) + 8))(*(void *)(v0 + 984), *(void *)(v0 + 944));
          uint64_t v98 = "";
        }
        uint64_t v169 = *(void *)(v0 + 1224);
        uint64_t v170 = *(void *)(v0 + 1216);
LABEL_53:
        uint64_t v178 = *(void *)(v0 + 1176);
        v194(v169, v170, v178);
        unint64_t v179 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v179 = 0;
        os_signpost_id_t v180 = sub_25A7F2E10();
        _os_signpost_emit_with_name_impl(&dword_25A7B3000, v93, v94, v180, "prewarmHint", v98, v179, 2u);
        MEMORY[0x261145500](v179, -1, -1);

        v92(v170, v178);
        uint64_t v176 = v169;
        uint64_t v177 = v178;
        goto LABEL_54;
      }
      uint64_t v99 = *(void *)(v0 + 1216);
    }
    else
    {
      uint64_t v65 = *(void *)(v0 + 1072);
      uint64_t v66 = *(void *)(v0 + 1064);
      uint64_t v67 = *(void *)(v0 + 1056);
      uint64_t v68 = *(void *)(v0 + 1000);
      uint64_t v69 = *(void *)(v0 + 992);
      uint64_t v70 = *(void *)(v0 + 928);
      sub_25A7BD1C4((uint64_t)v32, &qword_26A464428);
      unint64_t v71 = *(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16);
      v71(v65, v70, v69);
      v71(v66, v70, v69);
      v71(v67, v70, v69);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v72 = sub_25A7F2EC0();
      os_log_type_t v73 = sub_25A7F3190();
      BOOL v74 = os_log_type_enabled(v72, v73);
      uint64_t v75 = *(void *)(v0 + 1072);
      uint64_t v76 = *(void *)(v0 + 1064);
      uint64_t v77 = *(void *)(v0 + 1056);
      uint64_t v78 = *(void *)(v0 + 1000);
      uint64_t v79 = *(void *)(v0 + 992);
      if (v74)
      {
        uint64_t v182 = *(void *)(v0 + 992);
        os_log_t v192 = *(os_log_t *)(v0 + 1056);
        uint64_t v80 = swift_slowAlloc();
        uint64_t v214 = swift_slowAlloc();
        v227[0] = v214;
        *(_DWORD *)uint64_t v80 = 136316162;
        uint64_t v206 = v72;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 664) = sub_25A7EED88((uint64_t)log, v217, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v80 + 12) = 2080;
        uint64_t v81 = swift_task_alloc();
        MEMORY[0x261144930]();
        uint64_t v82 = sub_25A7F2060();
        os_log_type_t v219 = v73;
        unint64_t v84 = v83;
        os_log_t loga = *(os_log_t *)(v222 + 8);
        ((void (*)(uint64_t, uint64_t))loga)(v81, v190);
        swift_task_dealloc();
        *(void *)(v0 + 672) = sub_25A7EED88(v82, v84, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        uint64_t v85 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
        v85(v75, v182);
        *(_WORD *)(v80 + 22) = 2080;
        uint64_t v86 = sub_25A7F2D30();
        *(void *)(v0 + 680) = sub_25A7EED88(v86, v87, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        uint64_t v88 = ((uint64_t (*)(uint64_t, uint64_t))v85)(v76, v182);
        *(_WORD *)(v80 + 32) = 2080;
        uint64_t v89 = MEMORY[0x261144950](v88);
        *(void *)(v0 + 688) = sub_25A7EED88(v89, v90, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        v85((uint64_t)v192, v182);
        *(_WORD *)(v80 + 42) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 696) = sub_25A7EED88(v187, v189, v227);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25A7B3000, v206, v219, "%s prewarm with no LLModel called. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v80, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v214, -1, -1);
        MEMORY[0x261145500](v80, -1, -1);

        ((void (*)(uint64_t, uint64_t))loga)(v188, v190);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        unint64_t v165 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
        v165(v77, v79);
        v165(v76, v79);
        v165(v75, v79);
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v222 + 8))(v188, v190);
      }
      (*(void (**)(uint64_t, uint64_t))(v209 + 8))(v210, v208);
      uint64_t v92 = *(void (**)(uint64_t, uint64_t))type;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v224);
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v93 = sub_25A7F2E50();
      sub_25A7F2E80();
      os_signpost_type_t v94 = sub_25A7F3220();
      if (sub_25A7F3250())
      {
        uint64_t v166 = *(void *)(v0 + 976);
        uint64_t v167 = *(void *)(v0 + 952);
        uint64_t v168 = *(void *)(v0 + 944);
        swift_retain();
        sub_25A7F2EB0();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v167 + 88))(v166, v168) == *MEMORY[0x263F90238])
        {
          uint64_t v98 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 952) + 8))(*(void *)(v0 + 976), *(void *)(v0 + 944));
          uint64_t v98 = "";
        }
        uint64_t v169 = *(void *)(v0 + 1224);
        uint64_t v170 = *(void *)(v0 + 1208);
        goto LABEL_53;
      }
      uint64_t v99 = *(void *)(v0 + 1208);
    }
  }
  else
  {
    uint64_t v33 = *(void *)(v0 + 1048);
    uint64_t v34 = *(void *)(v0 + 1040);
    uint64_t v35 = *(void *)(v0 + 1032);
    unint64_t v36 = v28;
    uint64_t v37 = *(void *)(v0 + 1000);
    uint64_t v38 = *(void *)(v0 + 992);
    uint64_t v39 = *(void *)(v0 + 928);
    sub_25A7BD1C4((uint64_t)v223, &qword_26A464420);
    long long v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
    v40(v33, v39, v38);
    v40(v34, v39, v38);
    v40(v35, v39, v38);
    unint64_t v41 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_25A7F2EC0();
    os_log_type_t v43 = sub_25A7F3190();
    BOOL v44 = os_log_type_enabled(v42, v43);
    uint64_t v45 = *(void *)(v0 + 1048);
    uint64_t v46 = *(void *)(v0 + 1040);
    uint64_t v47 = *(void *)(v0 + 1032);
    uint64_t v48 = *(void *)(v0 + 1000);
    uint64_t v49 = *(void *)(v0 + 992);
    if (v44)
    {
      os_log_t v191 = *(os_log_t *)(v0 + 1032);
      uint64_t v50 = swift_slowAlloc();
      uint64_t v225 = swift_slowAlloc();
      v227[0] = v225;
      *(_DWORD *)uint64_t v50 = 136316162;
      v202 = v42;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 728) = sub_25A7EED88((uint64_t)log, v217, v227);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v50 + 12) = 2080;
      uint64_t v51 = swift_task_alloc();
      MEMORY[0x261144930]();
      uint64_t v52 = sub_25A7F2060();
      os_log_type_t v218 = v43;
      unint64_t v54 = v53;
      uint64_t v212 = *(void (**)(uint64_t, uint64_t))(v222 + 8);
      v212(v51, v190);
      swift_task_dealloc();
      *(void *)(v0 + 720) = sub_25A7EED88(v52, v54, v227);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v55(v45, v49);
      *(_WORD *)(v50 + 22) = 2080;
      uint64_t v56 = sub_25A7F2D30();
      *(void *)(v0 + 712) = sub_25A7EED88(v56, v57, v227);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v58 = ((uint64_t (*)(uint64_t, uint64_t))v55)(v46, v49);
      *(_WORD *)(v50 + 32) = 2080;
      uint64_t v59 = MEMORY[0x261144950](v58);
      *(void *)(v0 + 704) = sub_25A7EED88(v59, v60, v227);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      v55((uint64_t)v191, v49);
      *(_WORD *)(v50 + 42) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 656) = sub_25A7EED88(v187, v41, v227);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v202, v218, "%s prewarm for unknown bundle. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v50, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v225, -1, -1);
      MEMORY[0x261145500](v50, -1, -1);

      v212(v188, v190);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v91 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v91(v47, v49);
      v91(v46, v49);
      v91(v45, v49);
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v222 + 8))(v188, v190);
    }
    (*(void (**)(uint64_t, uint64_t))(v209 + 8))(v210, v208);
    uint64_t v92 = *(void (**)(uint64_t, uint64_t))type;
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v93 = sub_25A7F2E50();
    sub_25A7F2E80();
    os_signpost_type_t v94 = sub_25A7F3220();
    if (sub_25A7F3250())
    {
      uint64_t v95 = *(void *)(v0 + 968);
      uint64_t v96 = *(void *)(v0 + 952);
      uint64_t v97 = *(void *)(v0 + 944);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v96 + 88))(v95, v97) == *MEMORY[0x263F90238])
      {
        uint64_t v98 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 952) + 8))(*(void *)(v0 + 968), *(void *)(v0 + 944));
        uint64_t v98 = "";
      }
      uint64_t v169 = *(void *)(v0 + 1224);
      uint64_t v170 = *(void *)(v0 + 1200);
      goto LABEL_53;
    }
    uint64_t v99 = *(void *)(v0 + 1200);
  }
  uint64_t v175 = *(void *)(v0 + 1176);

  uint64_t v176 = v99;
  uint64_t v177 = v175;
LABEL_54:
  v92(v176, v177);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v181 = *(uint64_t (**)(void))(v0 + 8);
  return v181();
}

uint64_t sub_25A7CD4E0()
{
  os_signpost_type_t v2 = (void *)*v1;
  v2[179] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[176];
  uint64_t v4 = v2[162];
  uint64_t v5 = v2[161];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v6 = v4 + 8;
  unint64_t v7 = v8;
  if (v0)
  {
    v7(v2[176], v5);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    os_signpost_id_t v9 = sub_25A7CE064;
  }
  else
  {
    v2[180] = v7;
    v2[181] = v6 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v7(v3, v5);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    os_signpost_id_t v9 = sub_25A7CD6CC;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_25A7CD6CC()
{
  uint64_t v74 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1392);
  uint64_t v2 = *(void *)(v0 + 1112);
  uint64_t v68 = *(void *)(v0 + 1104);
  uint64_t v3 = *(void *)(v0 + 992);
  uint64_t v4 = *(void *)(v0 + 928);
  v1(*(void *)(v0 + 1120), v4, v3);
  v1(v2, v4, v3);
  v1(v68, v4, v3);
  uint64_t v66 = (void *)(v0 + 136);
  sub_25A7C56F4(v0 + 496, v0 + 136);
  uint64_t v67 = (void *)(v0 + 96);
  sub_25A7C56F4(v0 + 416, v0 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25A7F2EC0();
  os_log_type_t v6 = sub_25A7F31A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1440);
    unint64_t v55 = *(void *)(v0 + 1368);
    uint64_t v56 = *(void *)(v0 + 1360);
    os_log_t log = v5;
    unint64_t v7 = *(void *)(v0 + 1352);
    uint64_t v8 = *(void *)(v0 + 1344);
    uint64_t v61 = *(void *)(v0 + 1336);
    uint64_t v72 = *(void *)(v0 + 1320);
    uint64_t v9 = *(void *)(v0 + 1312);
    uint64_t v62 = *(void *)(v0 + 1288);
    uint64_t v64 = *(void *)(v0 + 1304);
    uint64_t v10 = *(void *)(v0 + 1120);
    uint64_t v53 = *(void *)(v0 + 1112);
    uint64_t v54 = *(void *)(v0 + 1104);
    uint64_t v11 = *(void *)(v0 + 1000);
    uint64_t v52 = *(void *)(v0 + 992);
    os_log_type_t type = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    v73[0] = v59;
    *(_DWORD *)uint64_t v12 = 136316674;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 816) = sub_25A7EED88(v8, v7, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v13 = swift_task_alloc();
    MEMORY[0x261144930]();
    uint64_t v14 = sub_25A7F2060();
    unint64_t v16 = v15;
    unint64_t v57 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v57(v13, v9);
    swift_task_dealloc();
    *(void *)(v0 + 824) = sub_25A7EED88(v14, v16, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v10, v52);
    *(_WORD *)(v12 + 22) = 2080;
    uint64_t v18 = sub_25A7F2D30();
    *(void *)(v0 + 832) = sub_25A7EED88(v18, v19, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v20 = ((uint64_t (*)(uint64_t, uint64_t))v17)(v53, v52);
    *(_WORD *)(v12 + 32) = 2080;
    uint64_t v21 = MEMORY[0x261144950](v20);
    *(void *)(v0 + 840) = sub_25A7EED88(v21, v22, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    v17(v54, v52);
    *(_WORD *)(v12 + 42) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 848) = sub_25A7EED88(v56, v55, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 52) = 2080;
    __swift_project_boxed_opaque_existential_1(v66, *(void *)(v0 + 160));
    uint64_t v23 = sub_25A7F20F0();
    *(void *)(v0 + 856) = sub_25A7EED88(v23, v24, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    *(_WORD *)(v12 + 62) = 2080;
    __swift_project_boxed_opaque_existential_1(v67, *(void *)(v0 + 120));
    uint64_t v25 = sub_25A7F20F0();
    *(void *)(v0 + 864) = sub_25A7EED88(v25, v26, v73);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
    _os_log_impl(&dword_25A7B3000, log, type, "%s prewarm complete. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s model=%s adapter=%s", (uint8_t *)v12, 0x48u);
    swift_arrayDestroy();
    MEMORY[0x261145500](v59, -1, -1);
    MEMORY[0x261145500](v12, -1, -1);

    v57(v61, v9);
    v69(v64, v62);
  }
  else
  {
    unint64_t v71 = *(void (**)(uint64_t, uint64_t))(v0 + 1440);
    uint64_t v63 = *(void *)(v0 + 1336);
    uint64_t v27 = *(void *)(v0 + 1320);
    uint64_t v28 = *(void *)(v0 + 1312);
    uint64_t v70 = *(void *)(v0 + 1304);
    uint64_t v65 = *(void *)(v0 + 1288);
    uint64_t v29 = *(void *)(v0 + 1120);
    uint64_t v30 = *(void *)(v0 + 1112);
    uint64_t v31 = *(void *)(v0 + 1104);
    uint64_t v32 = *(void *)(v0 + 1000);
    uint64_t v33 = *(void *)(v0 + 992);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    swift_bridgeObjectRelease_n();
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v34(v31, v33);
    v34(v30, v33);
    v34(v29, v33);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v63, v28);
    v71(v70, v65);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 416);
  __swift_destroy_boxed_opaque_existential_1(v0 + 496);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v36 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    uint64_t v37 = *(void *)(v0 + 960);
    uint64_t v38 = *(void *)(v0 + 952);
    uint64_t v39 = *(void *)(v0 + 944);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v38 + 88))(v37, v39) == *MEMORY[0x263F90238])
    {
      long long v40 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 952) + 8))(*(void *)(v0 + 960), *(void *)(v0 + 944));
      long long v40 = "";
    }
    BOOL v44 = *(void (**)(uint64_t, uint64_t))(v0 + 1272);
    uint64_t v45 = *(void *)(v0 + 1224);
    uint64_t v46 = *(void *)(v0 + 1192);
    uint64_t v47 = *(void *)(v0 + 1176);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1248))(v45, v46, v47);
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v48 = 0;
    os_signpost_id_t v49 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v35, v36, v49, "prewarmHint", v40, v48, 2u);
    MEMORY[0x261145500](v48, -1, -1);

    v44(v46, v47);
    v44(v45, v47);
  }
  else
  {
    unint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0 + 1272);
    uint64_t v42 = *(void *)(v0 + 1192);
    uint64_t v43 = *(void *)(v0 + 1176);

    v41(v42, v43);
  }
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v50 = *(uint64_t (**)(void))(v0 + 8);
  return v50();
}

uint64_t sub_25A7CE064()
{
  uint64_t v68 = v0;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 416);
  __swift_destroy_boxed_opaque_existential_1(v0 + 496);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v66 = *(void *)(v0 + 1432);
  uint64_t v1 = *(void *)(v0 + 1016);
  uint64_t v2 = *(void *)(v0 + 1008);
  uint64_t v3 = *(void *)(v0 + 992);
  uint64_t v4 = *(void *)(v0 + 928);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1000) + 16);
  v5(*(void *)(v0 + 1024), v4, v3);
  v5(v1, v4, v3);
  v5(v2, v4, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_log_type_t v6 = sub_25A7F2EC0();
  os_log_type_t v7 = sub_25A7F31A0();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v53 = *(void *)(v0 + 1368);
    uint64_t v55 = *(void *)(v0 + 1360);
    os_log_t log = v6;
    unint64_t v8 = *(void *)(v0 + 1352);
    uint64_t v9 = *(void *)(v0 + 1344);
    uint64_t v58 = *(void *)(v0 + 1336);
    uint64_t v64 = *(void *)(v0 + 1320);
    uint64_t v10 = *(void *)(v0 + 1312);
    uint64_t v62 = *(void *)(v0 + 1304);
    uint64_t v57 = *(void *)(v0 + 1296);
    uint64_t v60 = *(void *)(v0 + 1288);
    uint64_t v50 = *(void *)(v0 + 1016);
    uint64_t v51 = *(void *)(v0 + 1008);
    uint64_t v11 = *(void *)(v0 + 1000);
    uint64_t v48 = *(void *)(v0 + 1024);
    uint64_t v49 = *(void *)(v0 + 992);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v67[0] = v54;
    *(_DWORD *)uint64_t v12 = 136316162;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 808) = sub_25A7EED88(v9, v8, v67);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v13 = swift_task_alloc();
    MEMORY[0x261144930]();
    uint64_t v14 = sub_25A7F2060();
    unint64_t v16 = v15;
    uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
    v52(v13, v10);
    swift_task_dealloc();
    *(void *)(v0 + 800) = sub_25A7EED88(v14, v16, v67);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v48, v49);
    *(_WORD *)(v12 + 22) = 2080;
    uint64_t v18 = sub_25A7F2D30();
    *(void *)(v0 + 792) = sub_25A7EED88(v18, v19, v67);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v20 = ((uint64_t (*)(uint64_t, uint64_t))v17)(v50, v49);
    *(_WORD *)(v12 + 32) = 2080;
    uint64_t v21 = MEMORY[0x261144950](v20);
    *(void *)(v0 + 784) = sub_25A7EED88(v21, v22, v67);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    v17(v51, v49);
    *(_WORD *)(v12 + 42) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 736) = sub_25A7EED88(v55, v53, v67);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A7B3000, log, v7, "%s prewarm failed. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v12, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x261145500](v54, -1, -1);
    MEMORY[0x261145500](v12, -1, -1);
    MEMORY[0x261145390](v66);

    v52(v58, v10);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v62, v60);
  }
  else
  {
    uint64_t v23 = *(void *)(v0 + 1320);
    uint64_t v59 = *(void *)(v0 + 1312);
    uint64_t v61 = *(void *)(v0 + 1336);
    uint64_t v24 = *(void *)(v0 + 1296);
    uint64_t v63 = *(void *)(v0 + 1288);
    uint64_t v65 = *(void *)(v0 + 1304);
    uint64_t v25 = *(void *)(v0 + 1024);
    uint64_t v26 = *(void *)(v0 + 1016);
    uint64_t v27 = *(void *)(v0 + 1008);
    uint64_t v28 = *(void *)(v0 + 1000);
    uint64_t v29 = *(void *)(v0 + 992);
    MEMORY[0x261145390](v66);

    swift_bridgeObjectRelease_n();
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v30(v27, v29);
    v30(v26, v29);
    v30(v25, v29);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v61, v59);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v65, v63);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v32 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    uint64_t v33 = *(void *)(v0 + 960);
    uint64_t v34 = *(void *)(v0 + 952);
    uint64_t v35 = *(void *)(v0 + 944);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v34 + 88))(v33, v35) == *MEMORY[0x263F90238])
    {
      os_signpost_type_t v36 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 952) + 8))(*(void *)(v0 + 960), *(void *)(v0 + 944));
      os_signpost_type_t v36 = "";
    }
    long long v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1272);
    uint64_t v41 = *(void *)(v0 + 1224);
    uint64_t v42 = *(void *)(v0 + 1192);
    uint64_t v43 = *(void *)(v0 + 1176);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1248))(v41, v42, v43);
    BOOL v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v44 = 0;
    os_signpost_id_t v45 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v31, v32, v45, "prewarmHint", v36, v44, 2u);
    MEMORY[0x261145500](v44, -1, -1);

    v40(v42, v43);
    v40(v41, v43);
  }
  else
  {
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 1272);
    uint64_t v38 = *(void *)(v0 + 1192);
    uint64_t v39 = *(void *)(v0 + 1176);

    v37(v38, v39);
  }
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
  return v46();
}

uint64_t sub_25A7CE90C(uint64_t a1, uint64_t a2, char a3)
{
  v150[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = sub_25A7F2EE0();
  unint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v138 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B32BB78 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_26B32BBF8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_66;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    swift_once();
LABEL_26:
    if (sub_25A7EEBD4(v4, v10, (void *)qword_26A4643F8) & 1) != 0 || (a3)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v77 = sub_25A7F2EC0();
      uint64_t v78 = v12;
      os_log_type_t v79 = sub_25A7F3180();
      if (os_log_type_enabled(v77, v79))
      {
        uint64_t v80 = swift_slowAlloc();
        uint64_t v146 = v78;
        uint64_t v81 = (uint8_t *)v80;
        uint64_t v82 = (void *)swift_slowAlloc();
        v150[0] = v82;
        unint64_t v83 = v147;
        id v145 = v5;
        *(_DWORD *)uint64_t v81 = 136315138;
        swift_bridgeObjectRetain();
        v149[0] = sub_25A7EED88(v4, v10, (uint64_t *)v150);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25A7B3000, v77, v79, "allowing daemon %s", v81, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261145500](v82, -1, -1);
        MEMORY[0x261145500](v81, -1, -1);

        (*(void (**)(char *, uint64_t))(v83 + 8))(v146, v144);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v147 + 8))(v78, v9);
      }
      return v4;
    }
    else
    {
      BOOL v141 = v3;
      swift_bridgeObjectRelease();
      uint64_t v67 = sub_25A7F2080();
      unint64_t v142 = &v138;
      uint64_t v68 = *(void *)(v67 - 8);
      MEMORY[0x270FA5388](v67);
      uint64_t v70 = (char *)&v138 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v70, a1, v67);
      uint64_t v146 = v12;
      unint64_t v71 = sub_25A7F2EC0();
      os_log_type_t v72 = sub_25A7F3180();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v73 = swift_slowAlloc();
        os_log_t v140 = (os_log_t)swift_slowAlloc();
        v150[0] = v140;
        *(_DWORD *)uint64_t v73 = 136315394;
        uint64_t v139 = v73 + 4;
        sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
        uint64_t v74 = sub_25A7F3390();
        v149[0] = sub_25A7EED88(v74, v75, (uint64_t *)v150);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v68 + 8))(v70, v67);
        *(_WORD *)(v73 + 12) = 2048;
        v149[0] = (uint64_t)v145;
        sub_25A7F3270();
        _os_log_impl(&dword_25A7B3000, v71, v72, "%s daemon for pid=%ld is not allowed", (uint8_t *)v73, 0x16u);
        os_log_t v76 = v140;
        swift_arrayDestroy();
        MEMORY[0x261145500](v76, -1, -1);
        MEMORY[0x261145500](v73, -1, -1);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v68 + 8))(v70, v67);
      }

      (*(void (**)(char *, uint64_t))(v147 + 8))(v146, v144);
    }
    return a2;
  }
  id v14 = objc_msgSend(self, sel_identifierWithPid_, a2);
  unint64_t v147 = v10;
  id v145 = (id)a2;
  if (v14)
  {
    unint64_t v15 = v14;
    unint64_t v16 = self;
    v150[0] = 0;
    id v17 = v15;
    id v18 = objc_msgSend(v16, sel_handleForIdentifier_error_, v17, v150);
    uint64_t v144 = v9;
    if (v18)
    {
      uint64_t v5 = v18;
      id v19 = v150[0];

      unsigned __int8 v20 = objc_msgSend(v5, sel_isDaemon);
      uint64_t v143 = (os_log_t *)v17;
      if (v20)
      {
        a2 = 0xD000000000000012;
        id v21 = objc_msgSend(v5, sel_name);
        uint64_t v3 = "com.unknown.third.party";
        if (v21)
        {
          unint64_t v22 = v21;
          unint64_t v4 = sub_25A7F3000();
          unint64_t v10 = v23;
        }
        else
        {
          unint64_t v10 = 0x800000025A7F5690;
          unint64_t v4 = 0xD000000000000012;
        }
        if (qword_26A4641A0 == -1) {
          goto LABEL_26;
        }
        goto LABEL_67;
      }
      uint64_t v48 = (os_log_t *)objc_msgSend(v5, sel_bundle);
      if (v48)
      {
        uint64_t v49 = v48;
        id v50 = [(os_log_t *)v48 identifier];
        if (v50)
        {
          uint64_t v51 = v50;
          unint64_t v142 = v49;
          a2 = sub_25A7F3000();
          unint64_t v53 = v52;

          v150[0] = (id)a2;
          v150[1] = v53;
          v149[0] = 0x6C7070612E6D6F63;
          v149[1] = 0xEA00000000002E65;
          sub_25A7F0FC0();
          sub_25A7F1014();
          if ((sub_25A7F2FC0() & 1) == 0 && (a3 & 1) == 0)
          {
            id v145 = v5;
            swift_bridgeObjectRelease();
            uint64_t v54 = sub_25A7F2080();
            uint64_t v55 = *(void *)(v54 - 8);
            MEMORY[0x270FA5388](v54);
            uint64_t v57 = (char *)&v138 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v57, a1, v54);
            uint64_t v58 = sub_25A7F2EC0();
            os_log_type_t v59 = sub_25A7F3180();
            if (os_log_type_enabled(v58, v59))
            {
              uint64_t v60 = swift_slowAlloc();
              uint64_t v146 = v12;
              uint64_t v61 = (uint8_t *)v60;
              uint64_t v62 = (void *)swift_slowAlloc();
              BOOL v141 = (const char *)&v138;
              uint64_t v63 = v62;
              v150[0] = v62;
              *(_DWORD *)uint64_t v61 = 136315138;
              sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
              uint64_t v64 = sub_25A7F3390();
              v149[0] = sub_25A7EED88(v64, v65, (uint64_t *)v150);
              sub_25A7F3270();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
              _os_log_impl(&dword_25A7B3000, v58, v59, "%s is third party bundle-id", v61, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x261145500](v63, -1, -1);
              uint64_t v66 = v61;
              uint64_t v12 = v146;
              MEMORY[0x261145500](v66, -1, -1);
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
            }
            uint64_t v136 = v142;

            (*(void (**)(char *, uint64_t))(v147 + 8))(v12, v144);
            return 0xD000000000000017;
          }
          uint64_t v100 = sub_25A7F2080();
          uint64_t v101 = *(void *)(v100 - 8);
          MEMORY[0x270FA5388](v100);
          uint64_t v103 = (char *)&v138 - ((v102 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v103, a1, v100);
          swift_bridgeObjectRetain_n();
          uint64_t v104 = sub_25A7F2EC0();
          os_log_type_t v105 = sub_25A7F3180();
          int v106 = v105;
          if (os_log_type_enabled(v104, v105))
          {
            uint64_t v107 = swift_slowAlloc();
            LODWORD(v139) = v106;
            uint64_t v108 = v107;
            os_log_t v140 = (os_log_t)swift_slowAlloc();
            v150[0] = v140;
            *(_DWORD *)uint64_t v108 = 136315650;
            BOOL v141 = (const char *)&v138;
            sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
            os_log_t v138 = v104;
            uint64_t v109 = sub_25A7F3390();
            v149[0] = sub_25A7EED88(v109, v110, (uint64_t *)v150);
            uint64_t v146 = v12;
            sub_25A7F3270();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v101 + 8))(v103, v100);
            *(_WORD *)(v108 + 12) = 2080;
            swift_bridgeObjectRetain();
            v149[0] = sub_25A7EED88(a2, (unint64_t)v53, (uint64_t *)v150);
            sub_25A7F3270();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v108 + 22) = 2048;
            v149[0] = (uint64_t)v145;
            sub_25A7F3270();
            os_log_t v111 = v138;
            _os_log_impl(&dword_25A7B3000, v138, (os_log_type_t)v139, "%s is bundle-id %s for pid %ld", (uint8_t *)v108, 0x20u);
            os_log_t v112 = v140;
            swift_arrayDestroy();
            MEMORY[0x261145500](v112, -1, -1);
            MEMORY[0x261145500](v108, -1, -1);

            (*(void (**)(char *, uint64_t))(v147 + 8))(v146, v144);
            return a2;
          }

          (*(void (**)(char *, uint64_t))(v101 + 8))(v103, v100);
LABEL_62:

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v147 + 8))(v12, v144);
          return a2;
        }
      }
      if (qword_26A464180 != -1) {
        swift_once();
      }
      a2 = 0xD000000000000012;
      swift_beginAccess();
      if (byte_26A464188 == 1)
      {
        id v84 = objc_msgSend(v5, sel_name);
        a2 = 0xD000000000000010;
        BOOL v141 = "com.unknown.bundle";
        unint64_t v142 = (os_log_t *)0xD000000000000010;
        if (v84)
        {
          uint64_t v85 = v84;
          a2 = sub_25A7F3000();
          unint64_t v87 = v86;
        }
        else
        {
          unint64_t v87 = 0x800000025A7F5650;
        }
        if (qword_26A4641A8 != -1) {
          swift_once();
        }
        id v145 = v5;
        if (sub_25A7EEBD4(a2, v87, (void *)qword_26A464400) & 1) != 0 || (a3)
        {
          uint64_t v126 = sub_25A7F2080();
          uint64_t v127 = *(void *)(v126 - 8);
          MEMORY[0x270FA5388](v126);
          unint64_t v129 = (char *)&v138 - ((v128 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v129, a1, v126);
          swift_bridgeObjectRetain_n();
          uint64_t v104 = sub_25A7F2EC0();
          os_log_type_t v130 = sub_25A7F3180();
          if (os_log_type_enabled(v104, v130))
          {
            uint64_t v131 = swift_slowAlloc();
            BOOL v141 = (const char *)swift_slowAlloc();
            v149[0] = (uint64_t)v141;
            *(_DWORD *)uint64_t v131 = 136315394;
            unint64_t v142 = &v138;
            sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
            os_log_t v140 = v104;
            uint64_t v132 = sub_25A7F3390();
            uint64_t v148 = sub_25A7EED88(v132, v133, v149);
            uint64_t v146 = v12;
            sub_25A7F3270();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v127 + 8))(v129, v126);
            *(_WORD *)(v131 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v148 = sub_25A7EED88(a2, v87, v149);
            sub_25A7F3270();
            swift_bridgeObjectRelease_n();
            os_log_t v134 = v140;
            _os_log_impl(&dword_25A7B3000, v140, v130, "%s bundle identifier is cli tool %s", (uint8_t *)v131, 0x16u);
            uint64_t v135 = v141;
            swift_arrayDestroy();
            MEMORY[0x261145500](v135, -1, -1);
            MEMORY[0x261145500](v131, -1, -1);

            (*(void (**)(char *, uint64_t))(v147 + 8))(v146, v144);
            return a2;
          }

          (*(void (**)(char *, uint64_t))(v127 + 8))(v129, v126);
          goto LABEL_62;
        }
        swift_bridgeObjectRelease();
        uint64_t v113 = sub_25A7F2080();
        uint64_t v114 = *(void *)(v113 - 8);
        MEMORY[0x270FA5388](v113);
        uint64_t v116 = (char *)&v138 - ((v115 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v114 + 16))(v116, a1, v113);
        uint64_t v117 = sub_25A7F2EC0();
        os_log_type_t v118 = sub_25A7F3180();
        if (os_log_type_enabled(v117, v118))
        {
          uint64_t v119 = swift_slowAlloc();
          uint64_t v146 = v12;
          unint64_t v120 = (uint8_t *)v119;
          uint64_t v121 = swift_slowAlloc();
          os_log_t v140 = (os_log_t)&v138;
          uint64_t v122 = v121;
          v149[0] = v121;
          *(_DWORD *)unint64_t v120 = 136315138;
          sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
          uint64_t v123 = sub_25A7F3390();
          uint64_t v148 = sub_25A7EED88(v123, v124, v149);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v114 + 8))(v116, v113);
          _os_log_impl(&dword_25A7B3000, v117, v118, "%s bundle identifier is an unknown cli tool", v120, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x261145500](v122, -1, -1);
          uint64_t v125 = v120;
          uint64_t v12 = v146;
          MEMORY[0x261145500](v125, -1, -1);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v114 + 8))(v116, v113);
        }

        (*(void (**)(char *, uint64_t))(v147 + 8))(v12, v144);
        return (uint64_t)v142;
      }
      else
      {
        uint64_t v88 = sub_25A7F2080();
        uint64_t v89 = *(void *)(v88 - 8);
        MEMORY[0x270FA5388](v88);
        uint64_t v91 = (char *)&v138 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v91, a1, v88);
        uint64_t v92 = sub_25A7F2EC0();
        os_log_type_t v93 = sub_25A7F3180();
        int v94 = v93;
        if (os_log_type_enabled(v92, v93))
        {
          uint64_t v95 = swift_slowAlloc();
          uint64_t v96 = (os_log_t *)swift_slowAlloc();
          uint64_t v146 = v12;
          unint64_t v142 = v96;
          v149[0] = (uint64_t)v96;
          *(_DWORD *)uint64_t v95 = 136315394;
          os_log_t v140 = (os_log_t)(v95 + 4);
          sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
          LODWORD(v141) = v94;
          uint64_t v97 = sub_25A7F3390();
          uint64_t v148 = sub_25A7EED88(v97, v98, v149);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v89 + 8))(v91, v88);
          *(_WORD *)(v95 + 12) = 2048;
          uint64_t v148 = (uint64_t)v145;
          sub_25A7F3270();
          _os_log_impl(&dword_25A7B3000, v92, (os_log_type_t)v141, "%s could not get process bundle for pid=%ld", (uint8_t *)v95, 0x16u);
          uint64_t v99 = v142;
          swift_arrayDestroy();
          uint64_t v12 = v146;
          MEMORY[0x261145500](v99, -1, -1);
          MEMORY[0x261145500](v95, -1, -1);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v89 + 8))(v91, v88);
        }

        (*(void (**)(char *, uint64_t))(v147 + 8))(v12, v144);
      }
    }
    else
    {
      id v35 = v150[0];
      os_signpost_type_t v36 = (os_log_t *)sub_25A7F1FE0();

      swift_willThrow();
      uint64_t v37 = sub_25A7F2080();
      uint64_t v38 = *(void *)(v37 - 8);
      MEMORY[0x270FA5388](v37);
      long long v40 = (char *)&v138 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v40, a1, v37);
      uint64_t v146 = v12;
      uint64_t v41 = sub_25A7F2EC0();
      os_log_type_t v42 = sub_25A7F3180();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        BOOL v141 = (const char *)swift_slowAlloc();
        unint64_t v142 = v36;
        v150[0] = (id)v141;
        *(_DWORD *)uint64_t v43 = 136315394;
        os_log_t v140 = (os_log_t)(v43 + 4);
        sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
        uint64_t v44 = sub_25A7F3390();
        v149[0] = sub_25A7EED88(v44, v45, (uint64_t *)v150);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v37);
        *(_WORD *)(v43 + 12) = 2048;
        v149[0] = (uint64_t)v145;
        sub_25A7F3270();
        _os_log_impl(&dword_25A7B3000, v41, v42, "%s could not get handle for pid %ld", (uint8_t *)v43, 0x16u);
        uint64_t v46 = v141;
        swift_arrayDestroy();
        uint64_t v47 = v46;
        os_signpost_type_t v36 = v142;
        MEMORY[0x261145500](v47, -1, -1);
        MEMORY[0x261145500](v43, -1, -1);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v37);
      }
      MEMORY[0x261145390](v36);

      (*(void (**)(char *, uint64_t))(v147 + 8))(v146, v144);
      return 0xD000000000000013;
    }
  }
  else
  {
    uint64_t v24 = sub_25A7F2080();
    uint64_t v25 = *(void *)(v24 - 8);
    MEMORY[0x270FA5388](v24);
    uint64_t v27 = (char *)&v138 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a1, v24);
    uint64_t v146 = v12;
    uint64_t v28 = sub_25A7F2EC0();
    os_log_type_t v29 = sub_25A7F3180();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = (void *)swift_slowAlloc();
      uint64_t v143 = &v138;
      os_signpost_type_t v32 = v31;
      v150[0] = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      unint64_t v142 = (os_log_t *)(v30 + 4);
      sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
      uint64_t v33 = sub_25A7F3390();
      v149[0] = sub_25A7EED88(v33, v34, (uint64_t *)v150);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
      *(_WORD *)(v30 + 12) = 2048;
      v149[0] = (uint64_t)v145;
      sub_25A7F3270();
      _os_log_impl(&dword_25A7B3000, v28, v29, "%s could not get identifier for pid %ld", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v32, -1, -1);
      MEMORY[0x261145500](v30, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    }
    (*(void (**)(char *, uint64_t))(v147 + 8))(v146, v9);
    return 0x6E6B6E752E6D6F63;
  }
  return a2;
}

uint64_t sub_25A7D02D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  _OWORD v7[2] = a1;
  return MEMORY[0x270FA2498](sub_25A7D0304, 0, 0);
}

uint64_t sub_25A7D0304()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = MEMORY[0x261144950]();
  uint64_t v4 = v3;
  v0[9] = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[10] = v5;
  void *v5 = v0;
  v5[1] = sub_25A7D03D0;
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[3];
  return MEMORY[0x270F573C0](v9, v7, v8, v2, v4, v6, v1);
}

uint64_t sub_25A7D03D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t NewInferenceProvider.requestStream(clientData:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v70 = a2;
  unint64_t v71 = a4;
  uint64_t v68 = a1;
  uint64_t v6 = sub_25A7F2EE0();
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v67 = (char *)v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_25A7F2DC0();
  uint64_t v63 = *(void *)(v73 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v73);
  uint64_t v64 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v72 = (char *)v57 - v10;
  uint64_t v11 = sub_25A7F2E30();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)v57 - v16;
  uint64_t v74 = v4;
  sub_25A7F2E50();
  sub_25A7F2E00();
  id v18 = sub_25A7F2E50();
  os_signpost_type_t v19 = sub_25A7F3230();
  char v20 = sub_25A7F3250();
  uint64_t v69 = a3;
  if (v20)
  {
    id v21 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v21(v15, v17, v11);
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v22 = 0;
    os_signpost_id_t v23 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v18, v19, v23, "requestStream", "full request", v22, 2u);
    uint64_t v24 = v22;
    a3 = v69;
    MEMORY[0x261145500](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  else
  {

    id v21 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  }
  v21(v15, v17, v11);
  sub_25A7F2EA0();
  swift_allocObject();
  uint64_t v25 = sub_25A7F2E90();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  uint64_t v26 = v73;
  uint64_t v27 = v74 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  uint64_t v28 = v63;
  os_log_type_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
  uint64_t v30 = v72;
  v29(v72, a3, v73);
  uint64_t v31 = sub_25A7F2EC0();
  os_log_type_t v32 = sub_25A7F31A0();
  int v33 = v32;
  if (os_log_type_enabled(v31, v32))
  {
    int v60 = v33;
    unint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v76 = v59;
    uint64_t v58 = v34;
    *(_DWORD *)unint64_t v34 = 136315138;
    v57[1] = v34 + 4;
    uint64_t v35 = sub_25A7F2080();
    uint64_t v62 = v25;
    uint64_t v36 = v35;
    v57[0] = v57;
    uint64_t v37 = *(void *)(v35 - 8);
    MEMORY[0x270FA5388](v35);
    uint64_t v61 = v27;
    uint64_t v39 = v29;
    long long v40 = (char *)v57 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v41 = sub_25A7F3390();
    unint64_t v43 = v42;
    uint64_t v44 = v40;
    os_log_type_t v29 = v39;
    uint64_t v45 = v36;
    uint64_t v27 = v61;
    uint64_t v25 = v62;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v44, v45);
    a3 = v69;
    uint64_t v75 = sub_25A7EED88(v41, v43, &v76);
    uint64_t v26 = v73;
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v72, v26);
    uint64_t v46 = v58;
    _os_log_impl(&dword_25A7B3000, v31, (os_log_type_t)v60, "%s executing stream request", v58, 0xCu);
    uint64_t v47 = v59;
    swift_arrayDestroy();
    MEMORY[0x261145500](v47, -1, -1);
    MEMORY[0x261145500](v46, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v26);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v67, v27, v66);
  v29(v64, a3, v26);
  sub_25A7F2590();
  swift_allocObject();
  uint64_t v48 = sub_25A7F2570();
  uint64_t v49 = MEMORY[0x270FA5388](v48);
  v57[-6] = v74;
  v57[-5] = v25;
  uint64_t v50 = v68;
  v57[-4] = a3;
  v57[-3] = v50;
  v57[-2] = v70;
  v57[-1] = v49;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464448);
  MEMORY[0x270FA5388](v51);
  (*(void (**)(char *, void))(v53 + 104))((char *)v57 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F680]);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464450);
  uint64_t v55 = v71;
  v71[3] = v54;
  v55[4] = sub_25A7EFD4C();
  __swift_allocate_boxed_opaque_existential_1(v55);
  sub_25A7F3130();
  swift_release();
  return swift_release();
}

uint64_t sub_25A7D0C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v35 = a5;
  uint64_t v32 = a1;
  uint64_t v33 = a4;
  uint64_t v10 = sub_25A7F2DC0();
  uint64_t v30 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v31 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464318);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v34 = v15;
  uint64_t v16 = sub_25A7F30D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
  uint64_t v17 = *(void *)(v29 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v29);
  os_signpost_type_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v17 + 16))(v19, a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v10);
  unint64_t v20 = (*(unsigned __int8 *)(v17 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v21 = (v18 + *(unsigned __int8 *)(v11 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  os_signpost_id_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  *((void *)v23 + 4) = a2;
  *((void *)v23 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v23[v20], v19, v29);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v31, v30);
  uint64_t v24 = (uint64_t *)&v23[v22];
  uint64_t v26 = v35;
  unint64_t v25 = v36;
  uint64_t *v24 = v35;
  v24[1] = v25;
  *(void *)&v23[(v22 + 23) & 0xFFFFFFFFFFFFFFF8] = v37;
  swift_retain();
  swift_retain();
  sub_25A7F0404(v26, v25);
  swift_retain();
  sub_25A7C2C34((uint64_t)v34, (uint64_t)&unk_26A464638, (uint64_t)v23);
  return sub_25A7F3100();
}

uint64_t sub_25A7D0F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[72] = v18;
  v8[71] = v17;
  v8[70] = a8;
  v8[69] = a7;
  v8[68] = a6;
  v8[67] = a5;
  v8[66] = a4;
  uint64_t v9 = sub_25A7F2670();
  v8[73] = v9;
  v8[74] = *(void *)(v9 - 8);
  v8[75] = swift_task_alloc();
  uint64_t v10 = sub_25A7F2660();
  v8[76] = v10;
  v8[77] = *(void *)(v10 - 8);
  v8[78] = swift_task_alloc();
  uint64_t v11 = sub_25A7F2110();
  v8[79] = v11;
  v8[80] = *(void *)(v11 - 8);
  v8[81] = swift_task_alloc();
  uint64_t v12 = sub_25A7F2C60();
  v8[82] = v12;
  v8[83] = *(void *)(v12 - 8);
  v8[84] = swift_task_alloc();
  v8[85] = swift_task_alloc();
  v8[86] = swift_task_alloc();
  v8[87] = swift_task_alloc();
  uint64_t v13 = sub_25A7F2E70();
  v8[88] = v13;
  v8[89] = *(void *)(v13 - 8);
  v8[90] = swift_task_alloc();
  v8[91] = swift_task_alloc();
  uint64_t v14 = sub_25A7F2E30();
  v8[92] = v14;
  v8[93] = *(void *)(v14 - 8);
  v8[94] = swift_task_alloc();
  v8[95] = swift_task_alloc();
  v8[96] = swift_task_alloc();
  v8[97] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7D1278, 0, 0);
}

uint64_t sub_25A7D1278()
{
  uint64_t v44 = v0;
  uint64_t v1 = sub_25A7F2080();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  sub_25A7F2D70();
  uint64_t v4 = sub_25A7F2060();
  unint64_t v6 = v5;
  uint64_t v42 = v4;
  v0[98] = v4;
  v0[99] = v5;
  uint64_t v41 = v1;
  long long v40 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v40(v3, v1);
  swift_task_dealloc();
  v0[100] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25A7F2E50();
  os_signpost_type_t v8 = sub_25A7F3230();
  if (sub_25A7F3250())
  {
    uint64_t v9 = v0[96];
    uint64_t v37 = v0[92];
    uint64_t v38 = v0[93];
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
    unint64_t v11 = (v38 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    ((void (*)(uint64_t, void))v10)(v9, v0[97]);
    os_signpost_type_t v36 = v8;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v43 = v13;
    *(_DWORD *)uint64_t v12 = 136446210;
    swift_bridgeObjectRetain();
    v0[65] = sub_25A7EED88(v42, v6, &v43);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v14 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v7, v36, v14, "requestStream", "first token requestIdentifier=%{public, signpost.description=attribute,public}s)", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v13, -1, -1);
    MEMORY[0x261145500](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v9, v37);
  }
  else
  {
    uint64_t v15 = v0[93];

    swift_bridgeObjectRelease_n();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    unint64_t v11 = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  v0[101] = v10;
  uint64_t v16 = v0[97];
  uint64_t v17 = v0[96];
  uint64_t v18 = v0[93];
  uint64_t v19 = v0[92];
  uint64_t v20 = v0[72];
  uint64_t v39 = v0[68];
  uint64_t v21 = v0[66];
  v0[102] = v11;
  v10(v17, v16, v19);
  sub_25A7F2EA0();
  swift_allocObject();
  uint64_t v22 = sub_25A7F2E90();
  os_signpost_id_t v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v0[103] = v23;
  v0[104] = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v23(v16, v19);
  v0[53] = v22;
  uint64_t v24 = swift_task_alloc();
  sub_25A7F2070();
  uint64_t v25 = sub_25A7F2060();
  uint64_t v27 = v26;
  v0[105] = v26;
  v40(v24, v41);
  swift_task_dealloc();
  uint64_t v28 = sub_25A7F2590();
  uint64_t v29 = MEMORY[0x263F611D8];
  v0[21] = v28;
  v0[22] = v29;
  v0[18] = v20;
  uint64_t v30 = (void *)swift_task_alloc();
  v0[106] = v30;
  v30[2] = v21;
  v30[3] = v0 + 53;
  v30[4] = v42;
  v30[5] = v6;
  v30[6] = v25;
  v30[7] = v27;
  v30[8] = v20;
  v30[9] = v39;
  swift_retain();
  uint64_t v31 = (void *)swift_task_alloc();
  v0[107] = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_25A7D16E0;
  uint64_t v32 = v0[71];
  uint64_t v33 = v0[70];
  uint64_t v34 = v0[69];
  return sub_25A7D68D0((uint64_t)v31, v33, v32, v34, (uint64_t)(v0 + 18), 0, (uint64_t)&unk_26A464648, (uint64_t)v30);
}

uint64_t sub_25A7D16E0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 864) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_25A7D1D4C;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v2 + 144);
    uint64_t v3 = sub_25A7D181C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25A7D181C()
{
  uint64_t v35 = v0;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v1 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v2 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    os_signpost_type_t v33 = v2;
    uint64_t v3 = *(void *)(v0 + 728);
    uint64_t v4 = *(void *)(v0 + 712);
    uint64_t v5 = *(void *)(v0 + 704);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5) == *MEMORY[0x263F90238])
    {
      char v6 = 0;
      char v7 = 0;
      os_signpost_type_t v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 712) + 8))(*(void *)(v0 + 728), *(void *)(v0 + 704));
      os_signpost_type_t v8 = "last token received requestIdentifier=%{public, signpost.description=attribute,public}s)";
      char v7 = 2;
      char v6 = 1;
    }
    uint64_t v29 = v8;
    unint64_t v10 = *(void *)(v0 + 792);
    uint64_t v11 = *(void *)(v0 + 784);
    uint64_t v31 = *(void *)(v0 + 760);
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
    uint64_t v30 = *(void *)(v0 + 736);
    (*(void (**)(void))(v0 + 808))(*(void *)(v0 + 768));
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v34 = v13;
    *(unsigned char *)uint64_t v12 = v7;
    *(unsigned char *)(v12 + 1) = v6;
    *(_WORD *)(v12 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 400) = sub_25A7EED88(v11, v10, &v34);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v14 = sub_25A7F2E10();
    uint64_t v9 = (void *)(v0 + 768);
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v1, v33, v14, "requestStream", v29, (uint8_t *)v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v13, -1, -1);
    MEMORY[0x261145500](v12, -1, -1);

    swift_release();
    v32(v31, v30);
  }
  else
  {
    uint64_t v9 = (void *)(v0 + 760);
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  (*(void (**)(void, void))(v0 + 824))(*v9, *(void *)(v0 + 736));
  sub_25A7F2560();
  swift_release();
  uint64_t v15 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v16 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    uint64_t v17 = *(void *)(v0 + 720);
    uint64_t v18 = *(void *)(v0 + 712);
    uint64_t v19 = *(void *)(v0 + 704);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v17, v19) == *MEMORY[0x263F90238])
    {
      uint64_t v20 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 712) + 8))(*(void *)(v0 + 720), *(void *)(v0 + 704));
      uint64_t v20 = "";
    }
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
    uint64_t v21 = (void *)(v0 + 768);
    uint64_t v23 = *(void *)(v0 + 752);
    uint64_t v24 = *(void *)(v0 + 736);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 808))(*(void *)(v0 + 768), v23, v24);
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    os_signpost_id_t v26 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v15, v16, v26, "requestStream", v20, v25, 2u);
    MEMORY[0x261145500](v25, -1, -1);

    v22(v23, v24);
  }
  else
  {
    uint64_t v21 = (void *)(v0 + 752);
  }
  (*(void (**)(void, void))(v0 + 824))(*v21, *(void *)(v0 + 736));
  *(void *)(v0 + 392) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
  sub_25A7F3120();
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
  uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

id sub_25A7D1D4C()
{
  uint64_t v120 = v0;
  uint64_t v1 = *(void **)(v0 + 864);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  *(void *)(v0 + 448) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464308);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 696);
    uint64_t v4 = *(void *)(v0 + 672);
    uint64_t v5 = *(void *)(v0 + 664);
    uint64_t v6 = *(void *)(v0 + 656);
    MEMORY[0x261145390](*(void *)(v0 + 864));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v4, v6);
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    uint64_t v7 = swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, v3, v6);
    *(void *)(v0 + 512) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
    sub_25A7F3120();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v6);
    uint64_t v9 = *(void *)(v0 + 448);
LABEL_18:
    MEMORY[0x261145390](v9);
    goto LABEL_19;
  }
  unint64_t v10 = *(void **)(v0 + 864);
  MEMORY[0x261145390](*(void *)(v0 + 448));
  *(void *)(v0 + 440) = v10;
  id v11 = v10;
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 640) + 88))(*(void *)(v0 + 648), *(void *)(v0 + 632)) == *MEMORY[0x263F61150])
    {
      uint64_t v12 = *(uint64_t **)(v0 + 648);
      uint64_t v13 = *(void *)(v0 + 640);
      uint64_t v14 = *(void *)(v0 + 632);
      MEMORY[0x261145390](*(void *)(v0 + 864));
      (*(void (**)(uint64_t *, uint64_t))(v13 + 96))(v12, v14);
      uint64_t v15 = *v12;
      uint64_t v16 = v12[1];
      uint64_t v17 = sub_25A7F2EC0();
      os_log_type_t v18 = sub_25A7F3170();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 134218240;
        *(void *)(v0 + 496) = v15;
        sub_25A7F3270();
        *(_WORD *)(v19 + 12) = 2048;
        *(void *)(v0 + 504) = v16;
        sub_25A7F3270();
        _os_log_impl(&dword_25A7B3000, v17, v18, "Request failed with maxContextLengthReached. input token count:%ld and maximum allowed:%ld", (uint8_t *)v19, 0x16u);
        MEMORY[0x261145500](v19, -1, -1);
      }
      uint64_t v20 = *(void *)(v0 + 624);
      uint64_t v21 = *(void *)(v0 + 616);
      uint64_t v22 = *(void *)(v0 + 608);
      uint64_t v23 = *(void **)(v0 + 600);
      uint64_t v24 = *(void *)(v0 + 592);
      uint64_t v25 = *(void *)(v0 + 584);

      sub_25A7F2650();
      os_signpost_id_t v26 = (char *)v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4644F0) + 64);
      *uint64_t v23 = v15;
      v23[1] = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v26, v20, v22);
      (*(void (**)(void *, void, uint64_t))(v24 + 104))(v23, *MEMORY[0x263F7F800], v25);
      sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
      uint64_t v27 = swift_allocError();
      sub_25A7F2640();
      *(void *)(v0 + 488) = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
      sub_25A7F3120();
      (*(void (**)(void *, uint64_t))(v24 + 8))(v23, v25);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      uint64_t v9 = *(void *)(v0 + 440);
      goto LABEL_18;
    }
    (*(void (**)(void, void))(*(void *)(v0 + 640) + 8))(*(void *)(v0 + 648), *(void *)(v0 + 632));
  }
  uint64_t v28 = *(void **)(v0 + 864);
  MEMORY[0x261145390](*(void *)(v0 + 440));
  *(void *)(v0 + 432) = v28;
  id v29 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645E0);
  int v30 = swift_dynamicCast();
  uint64_t v31 = *(void **)(v0 + 864);
  if (v30)
  {
    MEMORY[0x261145390](*(void *)(v0 + 864));
    sub_25A7EEEA0((long long *)(v0 + 264), v0 + 304);
    sub_25A7C56F4(v0 + 304, v0 + 224);
    sub_25A7C56F4(v0 + 304, v0 + 344);
    sub_25A7C56F4(v0 + 304, v0 + 184);
    uint64_t v32 = sub_25A7F2EC0();
    os_log_type_t v33 = sub_25A7F3170();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v115 = swift_slowAlloc();
      uint64_t v119 = v115;
      *(_DWORD *)uint64_t v34 = 136315650;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 224), *(void *)(v0 + 248));
      os_log_type_t type = v33;
      uint64_t v35 = sub_25A7F2430();
      *(void *)(v0 + 464) = sub_25A7EED88(v35, v36, &v119);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 224);
      *(_WORD *)(v34 + 12) = 2048;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 344), *(void *)(v0 + 368));
      uint64_t v37 = sub_25A7F2420();
      __swift_destroy_boxed_opaque_existential_1(v0 + 344);
      *(void *)(v0 + 472) = v37;
      sub_25A7F3270();
      *(_WORD *)(v34 + 22) = 2080;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 184), *(void *)(v0 + 208));
      uint64_t v38 = sub_25A7F2440();
      *(void *)(v0 + 480) = sub_25A7EED88(v38, v39, &v119);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 184);
      _os_log_impl(&dword_25A7B3000, v32, type, "Request failed: %s %ld %s", (uint8_t *)v34, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v115, -1, -1);
      MEMORY[0x261145500](v34, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + 344);

      __swift_destroy_boxed_opaque_existential_1(v0 + 224);
      __swift_destroy_boxed_opaque_existential_1(v0 + 184);
    }
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    uint64_t v117 = swift_allocError();
    uint64_t v67 = v66;
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 304), *(void *)(v0 + 328));
    sub_25A7F2440();
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 304), *(void *)(v0 + 328));
    sub_25A7F2430();
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 304), *(void *)(v0 + 328));
    id result = (id)sub_25A7F2420();
    if (!__OFADD__(result, 10000))
    {
      uint64_t v68 = *(void *)(v0 + 664);
      uint64_t v69 = *(void *)(v0 + 656);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25A7F46C0;
      *(void *)(inited + 32) = sub_25A7F3000();
      *(void *)(inited + 40) = v71;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 304), *(void *)(v0 + 328));
      *(void *)(inited + 48) = sub_25A7F33C0();
      *(void *)(inited + 56) = v72;
      sub_25A7C9EB8(inited);
      sub_25A7F2C50();
      (*(void (**)(uint64_t, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F56280], v69);
      *(void *)(v0 + 456) = v117;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
      sub_25A7F3120();
      __swift_destroy_boxed_opaque_existential_1(v0 + 304);
      uint64_t v9 = *(void *)(v0 + 432);
      goto LABEL_18;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  MEMORY[0x261145390](*(void *)(v0 + 432));
  long long v40 = (void *)sub_25A7F1FD0();
  *(void *)(v0 + 416) = v31;
  id v41 = v31;
  sub_25A7F3040();
  id v42 = objc_msgSend(v40, sel_domain);
  sub_25A7F3000();

  id result = objc_msgSend(v40, sel_code);
  if (__OFADD__(result, 20000))
  {
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v44 = *(void *)(v0 + 688);
  uint64_t v107 = *(void *)(v0 + 680);
  uint64_t v45 = *(void *)(v0 + 664);
  uint64_t v46 = *(void *)(v0 + 656);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
  uint64_t v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = xmmword_25A7F46C0;
  *(void *)(v47 + 32) = sub_25A7F3000();
  *(void *)(v47 + 40) = v48;
  unint64_t v110 = v40;
  id v49 = objc_msgSend(v40, sel_description);
  uint64_t v50 = sub_25A7F3000();
  uint64_t v52 = v51;

  *(void *)(v47 + 48) = v50;
  *(void *)(v47 + 56) = v52;
  sub_25A7C9EB8(v47);
  sub_25A7F2C50();
  (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v44, *MEMORY[0x263F56280], v46);
  uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
  v53(v107, v44, v46);
  uint64_t v54 = sub_25A7F2EC0();
  os_log_type_t v55 = sub_25A7F3170();
  BOOL v56 = os_log_type_enabled(v54, v55);
  uint64_t v57 = *(void *)(v0 + 680);
  uint64_t v58 = *(void *)(v0 + 664);
  uint64_t v59 = *(void *)(v0 + 656);
  if (v56)
  {
    uint64_t v116 = v53;
    int v60 = (uint8_t *)swift_slowAlloc();
    uint64_t typea = swift_slowAlloc();
    uint64_t v119 = typea;
    *(_DWORD *)int v60 = 136315138;
    sub_25A7F0F78(&qword_26A4645F0, MEMORY[0x263F562C0]);
    uint64_t v61 = sub_25A7F3390();
    *(void *)(v0 + 408) = sub_25A7EED88(v61, v62, &v119);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v63 = v59;
    uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    v64(v57, v63);
    _os_log_impl(&dword_25A7B3000, v54, v55, "Request failed: %s", v60, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](typea, -1, -1);
    uint64_t v65 = v60;
    uint64_t v53 = v116;
    MEMORY[0x261145500](v65, -1, -1);
  }
  else
  {

    uint64_t v101 = v59;
    uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    v64(v57, v101);
  }
  uint64_t v102 = *(void *)(v0 + 864);
  uint64_t v103 = *(void *)(v0 + 688);
  uint64_t v104 = *(void *)(v0 + 656);
  sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
  uint64_t v105 = swift_allocError();
  v53(v106, v103, v104);
  *(void *)(v0 + 384) = v105;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
  sub_25A7F3120();

  MEMORY[0x261145390](v102);
  v64(v103, v104);
LABEL_19:
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v73 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v74 = sub_25A7F3220();
  char v75 = sub_25A7F3250();
  uint64_t v76 = (_DWORD *)MEMORY[0x263F90238];
  if (v75)
  {
    os_signpost_type_t v118 = v74;
    uint64_t v77 = *(void *)(v0 + 728);
    uint64_t v78 = *(void *)(v0 + 712);
    uint64_t v79 = *(void *)(v0 + 704);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v78 + 88))(v77, v79) == *v76)
    {
      char v80 = 0;
      char v81 = 0;
      uint64_t v108 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 712) + 8))(*(void *)(v0 + 728), *(void *)(v0 + 704));
      uint64_t v108 = "last token received requestIdentifier=%{public, signpost.description=attribute,public}s)";
      char v81 = 2;
      char v80 = 1;
    }
    typeb = *(void (**)(uint64_t, uint64_t))(v0 + 824);
    unint64_t v83 = *(void *)(v0 + 792);
    uint64_t v84 = *(void *)(v0 + 784);
    uint64_t v109 = *(void *)(v0 + 736);
    uint64_t v111 = *(void *)(v0 + 760);
    (*(void (**)(void))(v0 + 808))(*(void *)(v0 + 768));
    uint64_t v85 = swift_slowAlloc();
    uint64_t v86 = swift_slowAlloc();
    uint64_t v119 = v86;
    *(unsigned char *)uint64_t v85 = v81;
    *(unsigned char *)(v85 + 1) = v80;
    *(_WORD *)(v85 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 400) = sub_25A7EED88(v84, v83, &v119);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v87 = sub_25A7F2E10();
    uint64_t v82 = (void *)(v0 + 768);
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v73, v118, v87, "requestStream", v108, (uint8_t *)v85, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v86, -1, -1);
    MEMORY[0x261145500](v85, -1, -1);

    swift_release();
    typeb(v111, v109);
    uint64_t v76 = (_DWORD *)MEMORY[0x263F90238];
  }
  else
  {
    uint64_t v82 = (void *)(v0 + 760);
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  (*(void (**)(void, void))(v0 + 824))(*v82, *(void *)(v0 + 736));
  sub_25A7F2560();
  swift_release();
  uint64_t v88 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v89 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    uint64_t v90 = *(void *)(v0 + 720);
    uint64_t v91 = *(void *)(v0 + 712);
    uint64_t v92 = *(void *)(v0 + 704);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v91 + 88))(v90, v92) == *v76)
    {
      os_log_type_t v93 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 712) + 8))(*(void *)(v0 + 720), *(void *)(v0 + 704));
      os_log_type_t v93 = "";
    }
    uint64_t v95 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
    int v94 = (void *)(v0 + 768);
    uint64_t v96 = *(void *)(v0 + 752);
    uint64_t v97 = *(void *)(v0 + 736);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 808))(*(void *)(v0 + 768), v96, v97);
    unint64_t v98 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v98 = 0;
    os_signpost_id_t v99 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v88, v89, v99, "requestStream", v93, v98, 2u);
    MEMORY[0x261145500](v98, -1, -1);

    v95(v96, v97);
  }
  else
  {
    int v94 = (void *)(v0 + 752);
  }
  (*(void (**)(void, void))(v0 + 824))(*v94, *(void *)(v0 + 736));
  *(void *)(v0 + 392) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
  sub_25A7F3120();
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
  uint64_t v100 = *(uint64_t (**)(void))(v0 + 8);
  return (id)v100();
}

uint64_t sub_25A7D2ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 760) = v27;
  *(void *)(v8 + 752) = v26;
  *(void *)(v8 + 744) = a8;
  *(void *)(v8 + 736) = a7;
  *(void *)(v8 + 728) = a6;
  *(void *)(v8 + 720) = a5;
  *(void *)(v8 + 712) = a4;
  *(void *)(v8 + 704) = a3;
  *(void *)(v8 + 696) = a2;
  uint64_t v9 = sub_25A7F2690();
  *(void *)(v8 + 768) = v9;
  *(void *)(v8 + 776) = *(void *)(v9 - 8);
  *(void *)(v8 + 784) = swift_task_alloc();
  *(void *)(v8 + 792) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2340();
  *(void *)(v8 + 800) = v10;
  *(void *)(v8 + 808) = *(void *)(v10 - 8);
  *(void *)(v8 + 816) = swift_task_alloc();
  *(void *)(v8 + 824) = swift_task_alloc();
  *(void *)(v8 + 832) = swift_task_alloc();
  *(void *)(v8 + 840) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464588);
  *(void *)(v8 + 848) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645D0);
  *(void *)(v8 + 856) = swift_task_alloc();
  sub_25A7F2A70();
  *(void *)(v8 + 864) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2A90();
  *(void *)(v8 + 872) = v11;
  *(void *)(v8 + 880) = *(void *)(v11 - 8);
  *(void *)(v8 + 888) = swift_task_alloc();
  *(void *)(v8 + 896) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2500();
  *(void *)(v8 + 904) = v12;
  *(void *)(v8 + 912) = *(void *)(v12 - 8);
  *(void *)(v8 + 920) = swift_task_alloc();
  uint64_t v13 = sub_25A7F26E0();
  *(void *)(v8 + 928) = v13;
  *(void *)(v8 + 936) = *(void *)(v13 - 8);
  *(void *)(v8 + 944) = swift_task_alloc();
  *(void *)(v8 + 952) = swift_task_alloc();
  *(void *)(v8 + 960) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645C8);
  *(void *)(v8 + 968) = swift_task_alloc();
  *(void *)(v8 + 976) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2490();
  *(void *)(v8 + 984) = v14;
  *(void *)(v8 + 992) = *(void *)(v14 - 8);
  *(void *)(v8 + 1000) = swift_task_alloc();
  *(void *)(v8 + 1008) = swift_task_alloc();
  uint64_t v15 = sub_25A7F2700();
  *(void *)(v8 + 1016) = v15;
  *(void *)(v8 + 1024) = *(void *)(v15 - 8);
  *(void *)(v8 + 1032) = swift_task_alloc();
  *(void *)(v8 + 1040) = swift_task_alloc();
  uint64_t v16 = sub_25A7F2550();
  *(void *)(v8 + 1048) = v16;
  *(void *)(v8 + 1056) = *(void *)(v16 - 8);
  *(void *)(v8 + 1064) = swift_task_alloc();
  *(void *)(v8 + 1072) = swift_task_alloc();
  *(void *)(v8 + 1080) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464388);
  *(void *)(v8 + 1088) = swift_task_alloc();
  *(void *)(v8 + 1096) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464370);
  *(void *)(v8 + 1104) = swift_task_alloc();
  *(void *)(v8 + 1112) = swift_task_alloc();
  uint64_t v17 = sub_25A7F23D0();
  *(void *)(v8 + 1120) = v17;
  *(void *)(v8 + 1128) = *(void *)(v17 - 8);
  *(void *)(v8 + 1136) = swift_task_alloc();
  uint64_t v18 = sub_25A7F28C0();
  *(void *)(v8 + 1144) = v18;
  *(void *)(v8 + 1152) = *(void *)(v18 - 8);
  *(void *)(v8 + 1160) = swift_task_alloc();
  *(void *)(v8 + 1168) = swift_task_alloc();
  uint64_t v19 = sub_25A7F2E70();
  *(void *)(v8 + 1176) = v19;
  *(void *)(v8 + 1184) = *(void *)(v19 - 8);
  *(void *)(v8 + 1192) = swift_task_alloc();
  *(void *)(v8 + 1200) = swift_task_alloc();
  uint64_t v20 = sub_25A7F2E30();
  *(void *)(v8 + 1208) = v20;
  *(void *)(v8 + 1216) = *(void *)(v20 - 8);
  *(void *)(v8 + 1224) = swift_task_alloc();
  *(void *)(v8 + 1232) = swift_task_alloc();
  *(void *)(v8 + 1240) = swift_task_alloc();
  *(void *)(v8 + 1248) = swift_task_alloc();
  *(void *)(v8 + 1256) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464378);
  *(void *)(v8 + 1264) = swift_task_alloc();
  uint64_t v21 = sub_25A7F2380();
  *(void *)(v8 + 1272) = v21;
  *(void *)(v8 + 1280) = *(void *)(v21 - 8);
  *(void *)(v8 + 1288) = swift_task_alloc();
  *(void *)(v8 + 1296) = swift_task_alloc();
  *(void *)(v8 + 1304) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  *(void *)(v8 + 1312) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  *(_DWORD *)(v8 + 1336) = *MEMORY[0x263F611A0];
  *(_DWORD *)(v8 + 1340) = *MEMORY[0x263F61190];
  *(_DWORD *)(v8 + 1344) = *MEMORY[0x263F61198];
  *(_DWORD *)(v8 + 1348) = *MEMORY[0x263F90238];
  *(_DWORD *)(v8 + 1352) = *MEMORY[0x263F61170];
  *(_DWORD *)(v8 + 1356) = *MEMORY[0x263F7F870];
  *(_DWORD *)(v8 + 1360) = *MEMORY[0x263F7F888];
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v8 + 1320) = v22;
  *uint64_t v22 = v8;
  v22[1] = sub_25A7D3744;
  uint64_t v23 = *(void *)(v8 + 1264);
  return sub_25A7C5C9C(v23);
}

uint64_t sub_25A7D3744()
{
  *(void *)(*(void *)v1 + 1328) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_25A7D6630;
  }
  else {
    id v2 = sub_25A7D3858;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7D3858()
{
  uint64_t v326 = v0;
  uint64_t v1 = *(void *)(v0 + 1280);
  uint64_t v2 = *(void *)(v0 + 1272);
  uint64_t v3 = *(void *)(v0 + 1264);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    sub_25A7BD1C4(v3, &qword_26A464378);
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
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
LABEL_78:
    return v4();
  }
  int v5 = *(_DWORD *)(v0 + 1336);
  uint64_t v6 = *(void *)(v0 + 1296);
  uint64_t v7 = *(void *)(v0 + 1288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v6, v3, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v7, v6, v2);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v7, v2);
  if (v8 == v5)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1280) + 96))(*(void *)(v0 + 1288), *(void *)(v0 + 1272));
    swift_retain();
    uint64_t v9 = sub_25A7F2E50();
    sub_25A7F2E80();
    os_signpost_type_t v10 = sub_25A7F3220();
    if (sub_25A7F3250())
    {
      int v11 = *(_DWORD *)(v0 + 1348);
      uint64_t v12 = *(void *)(v0 + 1200);
      uint64_t v13 = *(void *)(v0 + 1184);
      uint64_t v14 = *(void *)(v0 + 1176);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v13 + 88))(v12, v14) == v11)
      {
        uint64_t v15 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 1184) + 8))(*(void *)(v0 + 1200), *(void *)(v0 + 1176));
        uint64_t v15 = "token received";
      }
      uint64_t v46 = *(void *)(v0 + 1256);
      uint64_t v47 = *(void *)(v0 + 1248);
      uint64_t v48 = *(void *)(v0 + 1216);
      uint64_t v49 = *(void *)(v0 + 1208);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v47, v46, v49);
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      os_signpost_id_t v51 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v9, v10, v51, "requestStream", v15, v50, 2u);
      MEMORY[0x261145500](v50, -1, -1);

      swift_release();
      int v30 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
      v30(v46, v49);
      v30(v47, v49);
    }
    else
    {
      uint64_t v27 = *(void *)(v0 + 1256);
      uint64_t v28 = *(void *)(v0 + 1216);
      uint64_t v29 = *(void *)(v0 + 1208);

      swift_release();
      int v30 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      v30(v27, v29);
    }
    sub_25A7F2E50();
    sub_25A7F2E00();
    swift_bridgeObjectRetain_n();
    uint64_t v52 = sub_25A7F2E50();
    os_signpost_type_t v53 = sub_25A7F3230();
    if (sub_25A7F3250())
    {
      uint64_t v54 = *(void *)(v0 + 1248);
      uint64_t v291 = *(void *)(v0 + 1208);
      unint64_t v55 = *(void *)(v0 + 728);
      v297 = v30;
      uint64_t v56 = *(void *)(v0 + 720);
      os_signpost_type_t v285 = v53;
      uint64_t v57 = *(void (**)(uint64_t, void))(*(void *)(v0 + 1216) + 16);
      v57(v54, *(void *)(v0 + 1240));
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      v325[0] = v59;
      *(_DWORD *)uint64_t v58 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 688) = sub_25A7EED88(v56, v55, v325);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      os_signpost_id_t v60 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v52, v285, v60, "requestStream", "extend token requestIdentifier=%{public, signpost.description=attribute,public}s)", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v59, -1, -1);
      MEMORY[0x261145500](v58, -1, -1);

      uint64_t v61 = v297;
      v297(v54, v291);
    }
    else
    {
      uint64_t v62 = *(void *)(v0 + 1216);

      swift_bridgeObjectRelease_n();
      uint64_t v57 = *(void (**)(uint64_t, void))(v62 + 16);
      uint64_t v61 = v30;
    }
    uint64_t v63 = *(void *)(v0 + 1240);
    uint64_t v64 = *(void *)(v0 + 1208);
    uint64_t v301 = *(void *)(v0 + 1328);
    uint64_t v65 = *(uint64_t **)(v0 + 712);
    ((void (*)(void, uint64_t, uint64_t))v57)(*(void *)(v0 + 1248), v63, v64);
    sub_25A7F2EA0();
    swift_allocObject();
    uint64_t v66 = sub_25A7F2E90();
    v61(v63, v64);
    *uint64_t v65 = v66;
    swift_release();
    uint64_t v67 = sub_25A7F2080();
    uint64_t v68 = *(void *)(v67 - 8);
    uint64_t v69 = swift_task_alloc();
    swift_bridgeObjectRetain();
    sub_25A7F2070();
    sub_25A7F2060();
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v69, v67);
    uint64_t v70 = sub_25A7F2980();
    uint64_t v71 = MEMORY[0x263F7FA60];
    *(void *)(v0 + 200) = v70;
    *(void *)(v0 + 208) = v71;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 176));
    swift_bridgeObjectRetain();
    sub_25A7F2970();
    swift_task_dealloc();
    sub_25A7F28D0();
    sub_25A7F2580();
    swift_bridgeObjectRelease();
    uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464680);
    uint64_t v73 = *(void *)(v72 - 8);
    uint64_t v74 = swift_task_alloc();
    sub_25A7F0F78(&qword_26A464688, MEMORY[0x263F7FA20]);
    uint64_t v75 = sub_25A7F26B0();
    uint64_t v77 = *(void *)(v0 + 1296);
    uint64_t v78 = *(void *)(v0 + 1280);
    uint64_t v79 = *(void *)(v0 + 1272);
    uint64_t v315 = *(void *)(v0 + 1168);
    uint64_t v80 = *(void *)(v0 + 1152);
    uint64_t v81 = *(void *)(v0 + 1144);
    if (v301)
    {
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v315, v81);
LABEL_77:
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
      uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_78;
    }
    *(void *)(v0 + 552) = v75;
    *(void *)(v0 + 560) = v76;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
    sub_25A7F3110();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v72);
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v77, v79);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v315, v81);
    goto LABEL_82;
  }
  if (v8 == *(_DWORD *)(v0 + 1340))
  {
    v300 = (uint64_t *)(v0 + 640);
    uint64_t v16 = *(void *)(v0 + 1288);
    uint64_t v17 = *(void *)(v0 + 1136);
    uint64_t v18 = *(void *)(v0 + 1128);
    uint64_t v19 = *(void *)(v0 + 1120);
    uint64_t v20 = *(void *)(v0 + 1112);
    uint64_t v21 = *(void *)(v0 + 1104);
    uint64_t v22 = *(void *)(v0 + 1056);
    uint64_t v307 = *(void *)(v0 + 1096);
    uint64_t v313 = *(void *)(v0 + 1048);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1280) + 96))(v16, *(void *)(v0 + 1272));
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464380);
    uint64_t v24 = v16 + *(int *)(v23 + 48);
    uint64_t v25 = v16 + *(int *)(v23 + 64);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v17, v16, v19);
    sub_25A7F08A0(v24, v20, &qword_26A464370);
    sub_25A7F08A0(v25, v307, &qword_26A464388);
    sub_25A7C7164(v20, v21, &qword_26A464370);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v21, 1, v313) == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 1104), &qword_26A464370);
      uint64_t v26 = *(void *)(v0 + 1328);
    }
    else
    {
      uint64_t v308 = v0 + 416;
      v316 = (uint64_t *)(v0 + 376);
      uint64_t v82 = *(void *)(v0 + 1080);
      uint64_t v83 = *(void *)(v0 + 1072);
      uint64_t v84 = *(void *)(v0 + 1056);
      uint64_t v85 = *(void *)(v0 + 1048);
      (*(void (**)(uint64_t, void, uint64_t))(v84 + 32))(v82, *(void *)(v0 + 1104), v85);
      uint64_t v86 = *(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16);
      v86(v83, v82, v85);
      swift_bridgeObjectRetain_n();
      os_signpost_id_t v87 = sub_25A7F2EC0();
      os_log_type_t v88 = sub_25A7F3170();
      BOOL v89 = os_log_type_enabled(v87, v88);
      uint64_t v90 = *(void *)(v0 + 1072);
      if (v89)
      {
        uint64_t v279 = *(void *)(v0 + 1072);
        uint64_t v274 = *(void *)(v0 + 1064);
        uint64_t v286 = *(void *)(v0 + 1056);
        uint64_t v276 = *(void *)(v0 + 1048);
        unint64_t v91 = *(void *)(v0 + 728);
        uint64_t v92 = *(void *)(v0 + 720);
        uint64_t v93 = swift_slowAlloc();
        uint64_t v283 = swift_slowAlloc();
        v325[0] = v283;
        *(_DWORD *)uint64_t v93 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 656) = sub_25A7EED88(v92, v91, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v93 + 12) = 2082;
        v86(v274, v279, v276);
        uint64_t v94 = sub_25A7F3040();
        *(void *)(v0 + 664) = sub_25A7EED88(v94, v95, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        v287 = *(void (**)(uint64_t, uint64_t))(v286 + 8);
        v287(v279, v276);
        _os_log_impl(&dword_25A7B3000, v87, v88, "%s %{public}s", (uint8_t *)v93, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v283, -1, -1);
        MEMORY[0x261145500](v93, -1, -1);
      }
      else
      {
        uint64_t v110 = *(void *)(v0 + 1056);
        uint64_t v111 = *(void *)(v0 + 1048);

        swift_bridgeObjectRelease_n();
        v287 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
        v287(v90, v111);
      }
      uint64_t v112 = *(void *)(v0 + 992);
      uint64_t v113 = *(void *)(v0 + 984);
      uint64_t v114 = *(void *)(v0 + 976);
      sub_25A7F2530();
      uint64_t v115 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v112 + 48);
      if (v115(v114, 1, v113) == 1)
      {
        uint64_t v116 = *(void *)(v0 + 984);
        uint64_t v117 = *(void *)(v0 + 968);
        sub_25A7BD1C4(*(void *)(v0 + 976), &qword_26A4645C8);
        sub_25A7F2540();
        if (v115(v117, 1, v116) == 1)
        {
          uint64_t v118 = *(void *)(v0 + 952);
          uint64_t v119 = *(void *)(v0 + 936);
          uint64_t v120 = *(void *)(v0 + 928);
          sub_25A7BD1C4(*(void *)(v0 + 968), &qword_26A4645C8);
          sub_25A7C9D80(MEMORY[0x263F8EE78]);
          sub_25A7F26D0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645F8);
          unint64_t v121 = (*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80);
          uint64_t v122 = swift_allocObject();
          *(_OWORD *)(v122 + 16) = xmmword_25A7F46C0;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v119 + 16))(v122 + v121, v118, v120);
          sub_25A7F26F0();
          (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v118, v120);
        }
        else
        {
          uint64_t v174 = *(void *)(v0 + 1000);
          uint64_t v175 = *(void *)(v0 + 992);
          uint64_t v322 = *(void *)(v0 + 984);
          uint64_t v176 = *(void *)(v0 + 944);
          uint64_t v177 = *(void *)(v0 + 936);
          uint64_t v178 = *(void *)(v0 + 928);
          (*(void (**)(uint64_t, void))(v175 + 32))(v174, *(void *)(v0 + 968));
          sub_25A7F2470();
          sub_25A7F2480();
          sub_25A7C9D80(MEMORY[0x263F8EE78]);
          sub_25A7F26D0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645F8);
          unint64_t v179 = (*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80);
          uint64_t v180 = swift_allocObject();
          *(_OWORD *)(v180 + 16) = xmmword_25A7F46C0;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v177 + 16))(v180 + v179, v176, v178);
          sub_25A7F2520();
          sub_25A7F26F0();
          (*(void (**)(uint64_t, uint64_t))(v177 + 8))(v176, v178);
          (*(void (**)(uint64_t, uint64_t))(v175 + 8))(v174, v322);
        }
      }
      else
      {
        uint64_t v127 = *(void *)(v0 + 1008);
        uint64_t v128 = *(void *)(v0 + 992);
        uint64_t v319 = *(void *)(v0 + 984);
        uint64_t v129 = *(void *)(v0 + 960);
        uint64_t v130 = *(void *)(v0 + 936);
        uint64_t v280 = *(void *)(v0 + 928);
        (*(void (**)(uint64_t, void))(v128 + 32))(v127, *(void *)(v0 + 976));
        sub_25A7F2470();
        sub_25A7F2480();
        sub_25A7C9D80(MEMORY[0x263F8EE78]);
        sub_25A7F26D0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645F8);
        unint64_t v131 = (*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80);
        uint64_t v132 = swift_allocObject();
        *(_OWORD *)(v132 + 16) = xmmword_25A7F46C0;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v130 + 16))(v132 + v131, v129, v280);
        sub_25A7F2520();
        sub_25A7F26F0();
        (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v129, v280);
        (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v127, v319);
      }
      uint64_t v181 = *(void *)(v0 + 1144);
      (*(void (**)(void, void, void))(*(void *)(v0 + 1024) + 16))(*(void *)(v0 + 1032), *(void *)(v0 + 1040), *(void *)(v0 + 1016));
      uint64_t v182 = sub_25A7F2940();
      uint64_t v183 = MEMORY[0x263F7FA30];
      *(void *)(v0 + 160) = v182;
      *(void *)(v0 + 168) = v183;
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
      swift_bridgeObjectRetain();
      sub_25A7F2930();
      *(void *)(v0 + 400) = v181;
      *(void *)(v0 + 408) = sub_25A7F0F78(&qword_26A464688, MEMORY[0x263F7FA20]);
      __swift_allocate_boxed_opaque_existential_1(v316);
      sub_25A7F28D0();
      sub_25A7C56F4((uint64_t)v316, v308);
      swift_bridgeObjectRetain_n();
      uint64_t v184 = sub_25A7F2EC0();
      os_log_type_t v185 = sub_25A7F3180();
      BOOL v186 = os_log_type_enabled(v184, v185);
      unint64_t v187 = *(void *)(v0 + 728);
      if (v186)
      {
        uint64_t v188 = *(void *)(v0 + 720);
        uint64_t v189 = swift_slowAlloc();
        v325[0] = swift_slowAlloc();
        uint64_t v190 = v325[0];
        *(_DWORD *)uint64_t v189 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 632) = sub_25A7EED88(v188, v187, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v189 + 12) = 2080;
        sub_25A7C56F4(v308, v0 + 216);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A464690);
        uint64_t v191 = sub_25A7F3040();
        *(void *)(v0 + 648) = sub_25A7EED88(v191, v192, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v308);
        _os_log_impl(&dword_25A7B3000, v184, v185, "%s Emitting TG event: %s", (uint8_t *)v189, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v190, -1, -1);
        MEMORY[0x261145500](v189, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        __swift_destroy_boxed_opaque_existential_1(v308);
      }
      uint64_t v193 = *(void *)(v0 + 1328);
      uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464680);
      uint64_t v195 = *(void *)(v194 - 8);
      uint64_t v196 = swift_task_alloc();
      uint64_t v197 = sub_25A7F26B0();
      if (v193)
      {
        uint64_t v199 = *(void *)(v0 + 1280);
        uint64_t v304 = *(void *)(v0 + 1272);
        uint64_t v310 = *(void *)(v0 + 1296);
        uint64_t v200 = *(void *)(v0 + 1136);
        uint64_t v201 = *(void *)(v0 + 1128);
        uint64_t v202 = *(void *)(v0 + 1120);
        uint64_t v203 = *(void *)(v0 + 1112);
        uint64_t v204 = *(void *)(v0 + 1096);
        uint64_t v205 = *(void *)(v0 + 1080);
        uint64_t v206 = *(void *)(v0 + 1048);
        (*(void (**)(void, void))(*(void *)(v0 + 1024) + 8))(*(void *)(v0 + 1040), *(void *)(v0 + 1016));
        v287(v205, v206);
        sub_25A7BD1C4(v204, &qword_26A464388);
        sub_25A7BD1C4(v203, &qword_26A464370);
        (*(void (**)(uint64_t, uint64_t))(v201 + 8))(v200, v202);
        (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v310, v304);
        goto LABEL_76;
      }
      uint64_t v323 = *(void *)(v0 + 1080);
      uint64_t v311 = *(void *)(v0 + 1048);
      uint64_t v207 = *(void *)(v0 + 1040);
      uint64_t v208 = *(void *)(v0 + 1024);
      uint64_t v209 = *(void *)(v0 + 1016);
      *(void *)(v0 + 520) = v197;
      *(void *)(v0 + 528) = v198;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
      sub_25A7F3110();
      (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v196, v194);
      (*(void (**)(uint64_t, uint64_t))(v208 + 8))(v207, v209);
      v287(v323, v311);
      swift_task_dealloc();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v316);
      uint64_t v26 = 0;
    }
    uint64_t v210 = *(void *)(v0 + 1088);
    uint64_t v211 = *(void *)(v0 + 912);
    uint64_t v212 = *(void *)(v0 + 904);
    sub_25A7C7164(*(void *)(v0 + 1096), v210, &qword_26A464388);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v211 + 48))(v210, 1, v212) == 1)
    {
      uint64_t v213 = *(void *)(v0 + 1296);
      uint64_t v214 = *(void *)(v0 + 1280);
      uint64_t v215 = *(void *)(v0 + 1272);
      uint64_t v216 = *(void *)(v0 + 1136);
      uint64_t v217 = *(void *)(v0 + 1128);
      uint64_t v218 = *(void *)(v0 + 1120);
      uint64_t v219 = *(void *)(v0 + 1112);
      uint64_t v220 = *(void *)(v0 + 1088);
      sub_25A7BD1C4(*(void *)(v0 + 1096), &qword_26A464388);
      sub_25A7BD1C4(v219, &qword_26A464370);
      (*(void (**)(uint64_t, uint64_t))(v217 + 8))(v216, v218);
      (*(void (**)(uint64_t, uint64_t))(v214 + 8))(v213, v215);
      sub_25A7BD1C4(v220, &qword_26A464388);
      goto LABEL_82;
    }
    v316 = (uint64_t *)(v0 + 256);
    uint64_t v324 = v26;
    uint64_t v221 = *(void *)(v0 + 856);
    (*(void (**)(void, void, void))(*(void *)(v0 + 912) + 32))(*(void *)(v0 + 920), *(void *)(v0 + 1088), *(void *)(v0 + 904));
    sub_25A7F24D0();
    uint64_t v222 = sub_25A7F24C0();
    uint64_t v223 = *(void *)(v222 - 8);
    int v224 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v223 + 48))(v221, 1, v222);
    uint64_t v225 = *(void *)(v0 + 856);
    if (v224 == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 856), &qword_26A4645D0);
    }
    else
    {
      sub_25A7F24B0();
      (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v225, v222);
    }
    sub_25A7F2A60();
    sub_25A7F24E0();
    sub_25A7F24A0();
    sub_25A7F2200();
    sub_25A7F3040();
    uint64_t v226 = sub_25A7F24F0();
    int64_t v227 = *(void *)(v226 + 16);
    if (v227)
    {
      uint64_t *v300 = MEMORY[0x263F8EE78];
      sub_25A7EF538(0, v227, 0);
      uint64_t v228 = 0;
      uint64_t v229 = *v300;
      unint64_t v230 = *(void *)(*v300 + 16);
      do
      {
        uint64_t v231 = *(int *)(v226 + 4 * v228 + 32);
        uint64_t *v300 = v229;
        unint64_t v232 = *(void *)(v229 + 24);
        if (v230 >= v232 >> 1)
        {
          sub_25A7EF538(v232 > 1, v230 + 1, 1);
          uint64_t v229 = *v300;
        }
        ++v228;
        *(void *)(v229 + 16) = v230 + 1;
        *(void *)(v229 + 8 * v230++ + 32) = v231;
      }
      while (v227 != v228);
    }
    swift_bridgeObjectRelease();
    uint64_t v305 = *(void *)(v0 + 1144);
    uint64_t v233 = *(void *)(v0 + 896);
    uint64_t v234 = *(void *)(v0 + 888);
    uint64_t v235 = *(void *)(v0 + 880);
    uint64_t v236 = *(void *)(v0 + 872);
    sub_25A7C9EB8(MEMORY[0x263F8EE78]);
    sub_25A7F2A80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v235 + 16))(v234, v233, v236);
    uint64_t v237 = sub_25A7F2630();
    uint64_t v238 = MEMORY[0x263F7F738];
    *(void *)(v0 + 320) = v237;
    *(void *)(v0 + 328) = v238;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 296));
    swift_bridgeObjectRetain();
    sub_25A7F2620();
    *(void *)(v0 + 280) = v305;
    *(void *)(v0 + 288) = sub_25A7F0F78(&qword_26A464688, MEMORY[0x263F7FA20]);
    __swift_allocate_boxed_opaque_existential_1(v316);
    sub_25A7F28D0();
    if (qword_26A464180 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (byte_26A464188)
    {
      sub_25A7C56F4((uint64_t)v316, v0 + 336);
      swift_bridgeObjectRetain_n();
      v239 = sub_25A7F2EC0();
      os_log_type_t v240 = sub_25A7F3180();
      BOOL v241 = os_log_type_enabled(v239, v240);
      unint64_t v242 = *(void *)(v0 + 728);
      if (v241)
      {
        uint64_t v243 = *(void *)(v0 + 720);
        uint64_t v244 = swift_slowAlloc();
        uint64_t v245 = swift_slowAlloc();
        v325[0] = v245;
        *(_DWORD *)uint64_t v244 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 608) = sub_25A7EED88(v243, v242, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v244 + 12) = 2082;
        sub_25A7C56F4(v0 + 336, v0 + 96);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A464690);
        uint64_t v246 = sub_25A7F3040();
        *(void *)(v0 + 600) = sub_25A7EED88(v246, v247, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 336);
        v248 = "%s Emitting TG event: %{public}s";
        v249 = v239;
        os_log_type_t v250 = v240;
LABEL_70:
        _os_log_impl(&dword_25A7B3000, v249, v250, v248, (uint8_t *)v244, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v245, -1, -1);
        MEMORY[0x261145500](v244, -1, -1);

LABEL_74:
        uint64_t v258 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464680);
        uint64_t v278 = *(void *)(v258 - 8);
        uint64_t v282 = v258;
        uint64_t v312 = swift_task_alloc();
        uint64_t v259 = sub_25A7F26B0();
        uint64_t v261 = *(void *)(v0 + 1296);
        uint64_t v262 = *(void *)(v0 + 1280);
        uint64_t v299 = *(void *)(v0 + 1136);
        uint64_t v306 = *(void *)(v0 + 1272);
        uint64_t v263 = *(void *)(v0 + 1128);
        uint64_t v294 = *(void *)(v0 + 1112);
        uint64_t v296 = *(void *)(v0 + 1120);
        uint64_t v290 = *(void *)(v0 + 1096);
        uint64_t v284 = *(void *)(v0 + 920);
        uint64_t v264 = *(void *)(v0 + 912);
        uint64_t v265 = *(void *)(v0 + 904);
        uint64_t v266 = *(void *)(v0 + 896);
        uint64_t v267 = *(void *)(v0 + 880);
        uint64_t v268 = *(void *)(v0 + 872);
        if (!v324)
        {
          *(void *)(v0 + 536) = v259;
          *(void *)(v0 + 544) = v260;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
          sub_25A7F3110();
          (*(void (**)(uint64_t, uint64_t))(v278 + 8))(v312, v282);
          (*(void (**)(uint64_t, uint64_t))(v267 + 8))(v266, v268);
          (*(void (**)(uint64_t, uint64_t))(v264 + 8))(v284, v265);
          sub_25A7BD1C4(v290, &qword_26A464388);
          sub_25A7BD1C4(v294, &qword_26A464370);
          (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v299, v296);
          (*(void (**)(uint64_t, uint64_t))(v262 + 8))(v261, v306);
          swift_task_dealloc();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v316);
          goto LABEL_82;
        }
        (*(void (**)(uint64_t, uint64_t))(v267 + 8))(v266, v268);
        (*(void (**)(uint64_t, uint64_t))(v264 + 8))(v284, v265);
        sub_25A7BD1C4(v290, &qword_26A464388);
        sub_25A7BD1C4(v294, &qword_26A464370);
        (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v299, v296);
        (*(void (**)(uint64_t, uint64_t))(v262 + 8))(v261, v306);
LABEL_76:
        swift_task_dealloc();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v316);
        goto LABEL_77;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v257 = v0 + 336;
    }
    else
    {
      sub_25A7C56F4((uint64_t)v316, v0 + 16);
      swift_bridgeObjectRetain_n();
      v239 = sub_25A7F2EC0();
      os_log_type_t v251 = sub_25A7F3180();
      BOOL v252 = os_log_type_enabled(v239, v251);
      unint64_t v253 = *(void *)(v0 + 728);
      if (v252)
      {
        uint64_t v254 = *(void *)(v0 + 720);
        uint64_t v244 = swift_slowAlloc();
        uint64_t v245 = swift_slowAlloc();
        v325[0] = v245;
        *(_DWORD *)uint64_t v244 = 136315395;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 624) = sub_25A7EED88(v254, v253, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v244 + 12) = 2081;
        sub_25A7C56F4(v0 + 16, v0 + 456);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A464690);
        uint64_t v255 = sub_25A7F3040();
        *(void *)(v0 + 616) = sub_25A7EED88(v255, v256, v325);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        v248 = "%s Emitting TG event: %{private}s";
        v249 = v239;
        os_log_type_t v250 = v251;
        goto LABEL_70;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v257 = v0 + 16;
    }
    __swift_destroy_boxed_opaque_existential_1(v257);
    goto LABEL_74;
  }
  if (v8 != *(_DWORD *)(v0 + 1344))
  {
    uint64_t v96 = *(void *)(v0 + 1296);
    uint64_t v317 = *(void *)(v0 + 1288);
    uint64_t v97 = *(void *)(v0 + 1280);
    uint64_t v98 = *(void *)(v0 + 1272);
    uint64_t v99 = sub_25A7F2C60();
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    swift_allocError();
    v325[0] = 0;
    uint64_t v101 = v100;
    v325[1] = 0xE000000000000000;
    sub_25A7F32B0();
    *(void *)(v0 + 584) = 0;
    *(void *)(v0 + 592) = 0xE000000000000000;
    sub_25A7F3060();
    sub_25A7F3060();
    sub_25A7F3060();
    sub_25A7F3320();
    swift_bridgeObjectRetain();
    sub_25A7C9EB8(MEMORY[0x263F8EE78]);
    sub_25A7F2C50();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v99 - 8) + 104))(v101, *MEMORY[0x263F56280], v99);
    swift_willThrow();
    uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
    v102(v96, v98);
    v102(v317, v98);
    goto LABEL_77;
  }
  uint64_t v31 = *(void *)(v0 + 1288);
  uint64_t v32 = *(void *)(v0 + 832);
  uint64_t v33 = *(void *)(v0 + 824);
  uint64_t v34 = *(void *)(v0 + 808);
  uint64_t v35 = *(void *)(v0 + 800);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 1280) + 96))(v31, *(void *)(v0 + 1272));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v32, v31, v35);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v33, v32, v35);
  unint64_t v36 = sub_25A7F2EC0();
  os_log_type_t v37 = sub_25A7F3180();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v39 = *(void *)(v0 + 824);
  uint64_t v40 = *(void *)(v0 + 808);
  uint64_t v41 = *(void *)(v0 + 800);
  if (v38)
  {
    id v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v314 = swift_slowAlloc();
    v325[0] = v314;
    *(_DWORD *)id v42 = 136315138;
    sub_25A7F0F78(&qword_26A464618, MEMORY[0x263F61178]);
    uint64_t v43 = sub_25A7F3390();
    *(void *)(v0 + 672) = sub_25A7EED88(v43, v44, v325);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v45(v39, v41);
    _os_log_impl(&dword_25A7B3000, v36, v37, "requestStream completionReason: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v314, -1, -1);
    MEMORY[0x261145500](v42, -1, -1);
  }
  else
  {

    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v45(v39, v41);
  }
  v318 = v45;
  swift_retain();
  uint64_t v103 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v104 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    int v105 = *(_DWORD *)(v0 + 1348);
    uint64_t v106 = *(void *)(v0 + 1192);
    uint64_t v107 = *(void *)(v0 + 1184);
    uint64_t v108 = *(void *)(v0 + 1176);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v107 + 88))(v106, v108) == v105)
    {
      uint64_t v109 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 1184) + 8))(*(void *)(v0 + 1192), *(void *)(v0 + 1176));
      uint64_t v109 = "token received";
    }
    uint64_t v133 = *(void *)(v0 + 1248);
    uint64_t v134 = *(void *)(v0 + 1232);
    uint64_t v135 = *(void *)(v0 + 1216);
    uint64_t v136 = *(void *)(v0 + 1208);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 16))(v133, v134, v136);
    uint64_t v137 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v137 = 0;
    os_signpost_id_t v138 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v103, v104, v138, "requestStream", v109, v137, 2u);
    MEMORY[0x261145500](v137, -1, -1);

    swift_release();
    uint64_t v126 = *(void (**)(uint64_t, uint64_t))(v135 + 8);
    v126(v134, v136);
    v126(v133, v136);
  }
  else
  {
    uint64_t v123 = *(void *)(v0 + 1232);
    uint64_t v124 = *(void *)(v0 + 1216);
    uint64_t v125 = *(void *)(v0 + 1208);

    swift_release();
    uint64_t v126 = *(void (**)(uint64_t, uint64_t))(v124 + 8);
    v126(v123, v125);
  }
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v139 = sub_25A7F2E50();
  os_signpost_type_t v140 = sub_25A7F3230();
  v320 = v126;
  if (sub_25A7F3250())
  {
    uint64_t v141 = *(void *)(v0 + 1248);
    unint64_t v142 = *(void *)(v0 + 728);
    uint64_t v143 = *(void *)(v0 + 720);
    uint64_t v288 = *(void *)(v0 + 1208);
    v292 = *(void (**)(uint64_t, void))(*(void *)(v0 + 1216) + 16);
    v292(v141, *(void *)(v0 + 1224));
    uint64_t v144 = (uint8_t *)swift_slowAlloc();
    uint64_t v145 = swift_slowAlloc();
    v325[0] = v145;
    *(_DWORD *)uint64_t v144 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 680) = sub_25A7EED88(v143, v142, v325);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v146 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v139, v140, v146, "requestStream", "extend token requestIdentifier=%{public, signpost.description=attribute,public}s)", v144, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v145, -1, -1);
    MEMORY[0x261145500](v144, -1, -1);

    v126(v141, v288);
    unint64_t v147 = (void (*)(void, uint64_t, uint64_t))v292;
  }
  else
  {
    uint64_t v148 = *(void *)(v0 + 1216);

    swift_bridgeObjectRelease_n();
    unint64_t v147 = *(void (**)(void, uint64_t, uint64_t))(v148 + 16);
  }
  uint64_t v302 = *(void *)(v0 + 1328);
  unsigned int v281 = *(_DWORD *)(v0 + 1360);
  unsigned int v277 = *(_DWORD *)(v0 + 1356);
  unsigned int v272 = *(_DWORD *)(v0 + 1352);
  uint64_t v149 = *(void *)(v0 + 1224);
  uint64_t v150 = *(void *)(v0 + 1208);
  uint64_t v151 = *(void *)(v0 + 816);
  uint64_t v152 = *(void *)(v0 + 808);
  uint64_t v153 = *(void *)(v0 + 800);
  uint64_t v275 = *(void *)(v0 + 792);
  uint64_t v289 = *(void *)(v0 + 784);
  uint64_t v154 = *(void *)(v0 + 776);
  uint64_t v273 = *(void *)(v0 + 768);
  uint64_t v155 = *(uint64_t **)(v0 + 712);
  v147(*(void *)(v0 + 1248), v149, v150);
  sub_25A7F2EA0();
  swift_allocObject();
  uint64_t v156 = sub_25A7F2E90();
  v320(v149, v150);
  *uint64_t v155 = v156;
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v152 + 104))(v151, v272, v153);
  LOBYTE(v156) = sub_25A7F2330();
  v318(v151, v153);
  if (v156) {
    uint64_t v157 = v281;
  }
  else {
    uint64_t v157 = v277;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 104))(v275, v157, v273);
  uint64_t v158 = sub_25A7F2080();
  uint64_t v159 = *(void *)(v158 - 8);
  uint64_t v160 = swift_task_alloc();
  swift_bridgeObjectRetain();
  sub_25A7F2070();
  sub_25A7F2060();
  (*(void (**)(uint64_t, uint64_t))(v159 + 8))(v160, v158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 16))(v289, v275, v273);
  uint64_t v161 = sub_25A7F2960();
  uint64_t v162 = MEMORY[0x263F7FA58];
  *(void *)(v0 + 80) = v161;
  *(void *)(v0 + 88) = v162;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  sub_25A7F2950();
  swift_task_dealloc();
  sub_25A7F28D0();
  uint64_t v321 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464680);
  uint64_t v293 = *(void *)(v321 - 8);
  uint64_t v309 = swift_task_alloc();
  sub_25A7F0F78(&qword_26A464688, MEMORY[0x263F7FA20]);
  uint64_t v163 = v302;
  uint64_t v164 = sub_25A7F26B0();
  uint64_t v166 = *(void *)(v0 + 1280);
  uint64_t v295 = *(void *)(v0 + 1272);
  uint64_t v298 = *(void *)(v0 + 1296);
  uint64_t v167 = *(void *)(v0 + 1160);
  uint64_t v168 = *(void *)(v0 + 1152);
  uint64_t v303 = *(void *)(v0 + 1144);
  uint64_t v169 = *(void *)(v0 + 832);
  uint64_t v170 = *(void *)(v0 + 800);
  uint64_t v171 = *(void *)(v0 + 792);
  uint64_t v172 = *(void *)(v0 + 776);
  uint64_t v173 = *(void *)(v0 + 768);
  if (v163)
  {
    (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v171, v173);
    v318(v169, v170);
    (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v298, v295);
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v167, v303);
    goto LABEL_77;
  }
  *(void *)(v0 + 568) = v164;
  *(void *)(v0 + 576) = v165;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
  sub_25A7F3110();
  (*(void (**)(uint64_t, uint64_t))(v293 + 8))(v309, v321);
  (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v171, v173);
  v318(v169, v170);
  (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v298, v295);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v167, v303);
LABEL_82:
  v270 = (void *)swift_task_alloc();
  *(void *)(v0 + 1320) = v270;
  void *v270 = v0;
  v270[1] = sub_25A7D3744;
  uint64_t v271 = *(void *)(v0 + 1264);
  return sub_25A7C5C9C(v271);
}

uint64_t sub_25A7D6630()
{
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A7D68D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 136) = a8;
  *(void *)(v9 + 144) = v8;
  *(unsigned char *)(v9 + 280) = a6;
  *(void *)(v9 + 120) = a5;
  *(void *)(v9 + 128) = a7;
  *(void *)(v9 + 104) = a3;
  *(void *)(v9 + 112) = a4;
  *(void *)(v9 + 88) = a1;
  *(void *)(v9 + 96) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644C0);
  *(void *)(v9 + 152) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2DC0();
  *(void *)(v9 + 160) = v10;
  *(void *)(v9 + 168) = *(void *)(v10 - 8);
  *(void *)(v9 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7D69D0, 0, 0);
}

uint64_t sub_25A7D69D0()
{
  uint64_t v49 = v0;
  sub_25A7C1300();
  if (sub_25A7F31C0())
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 16))(*(void *)(v0 + 176), *(void *)(v0 + 112), *(void *)(v0 + 160));
    uint64_t v1 = sub_25A7F2EC0();
    os_log_type_t v2 = sub_25A7F3190();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v4 = *(void *)(v0 + 168);
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 160);
    if (v3)
    {
      os_log_type_t type = v2;
      uint64_t v43 = *(void *)(v0 + 160);
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v48 = v45;
      *(_DWORD *)uint64_t v7 = 136315138;
      buf = v7;
      uint64_t v8 = sub_25A7F2080();
      uint64_t v9 = *(void *)(v8 - 8);
      uint64_t v10 = swift_task_alloc();
      sub_25A7F2D70();
      uint64_t v11 = sub_25A7F2060();
      unint64_t v13 = v12;
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v8);
      swift_task_dealloc();
      *(void *)(v0 + 80) = sub_25A7EED88(v11, v13, &v48);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v43);
      _os_log_impl(&dword_25A7B3000, v1, type, "%s Fallback is enabled", buf, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v45, -1, -1);
      MEMORY[0x261145500](buf, -1, -1);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    }
    uint64_t v28 = sub_25A7F2C60();
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    swift_allocError();
    uint64_t v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25A7F46C0;
    *(void *)(inited + 32) = sub_25A7F3000();
    *(void *)(inited + 40) = v32;
    *(void *)(inited + 48) = 0xD00000000000001FLL;
    *(void *)(inited + 56) = 0x800000025A7F53F0;
    sub_25A7C9EB8(inited);
    sub_25A7F2C50();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v28 - 8) + 104))(v30, *MEMORY[0x263F56280], v28);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
    return v33();
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v15 = *(void *)(v0 + 152);
    uint64_t v16 = sub_25A7F2080();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = swift_task_alloc();
    sub_25A7F2D70();
    uint64_t v19 = sub_25A7F2060();
    uint64_t v21 = v20;
    *(void *)(v0 + 184) = v20;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v16);
    swift_task_dealloc();
    logMetric(logger:name:startInstant:)(v14 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, 0xD000000000000012, 0x800000025A7F53D0);
    uint64_t v22 = sub_25A7F2BB0();
    *(void *)(v0 + 192) = v22;
    uint64_t v23 = *(void *)(v22 - 8);
    *(void *)(v0 + 200) = v23;
    *(void *)(v0 + 208) = swift_task_alloc();
    sub_25A7F2BA0();
    sub_25A7F2D60();
    uint64_t v24 = sub_25A7F2C40();
    uint64_t v25 = *(void *)(v24 - 8);
    int v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v15, 1, v24);
    uint64_t v27 = *(void *)(v0 + 152);
    if (v26 == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 152), &qword_26A4644C0);
    }
    else
    {
      sub_25A7F2C20();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v24);
    }
    uint64_t v35 = *(void *)(v0 + 144);
    LOBYTE(v48) = v26 == 1;
    int8x16_t v46 = vextq_s8(*(int8x16_t *)(v0 + 112), *(int8x16_t *)(v0 + 112), 8uLL);
    long long v42 = *(_OWORD *)(v0 + 96);
    long long v44 = *(_OWORD *)(v0 + 128);
    sub_25A7F2B90();
    uint64_t v36 = swift_task_alloc();
    *(void *)(v0 + 216) = v36;
    (*(void (**)(void))(v23 + 16))();
    uint64_t v37 = swift_task_alloc();
    *(void *)(v0 + 224) = v37;
    *(_OWORD *)(v37 + 16) = v42;
    *(void *)(v37 + 32) = v35;
    *(void *)(v37 + 40) = v19;
    *(void *)(v37 + 48) = v21;
    *(int8x16_t *)(v37 + 56) = v46;
    *(_OWORD *)(v37 + 72) = v44;
    BOOL v38 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v38;
    *BOOL v38 = v0;
    v38[1] = sub_25A7D70FC;
    char v39 = *(unsigned char *)(v0 + 280);
    uint64_t v40 = *(void *)(v0 + 88);
    return sub_25A7DEF84(v40, v19, v21, v39, v36, (uint64_t)&unk_26A464660, v37);
  }
}

uint64_t sub_25A7D70FC()
{
  os_log_type_t v2 = (void *)*v1;
  v2[30] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[27];
  uint64_t v4 = v2[25];
  uint64_t v5 = v2[24];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v7 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v2[33] = v6;
    v2[34] = v7;
    v6(v3, v5);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v8 = sub_25A7F1334;
  }
  else
  {
    v2[31] = v6;
    v2[32] = v7;
    v6(v3, v5);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = sub_25A7F1348;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_25A7D72E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 136) = a8;
  *(void *)(v9 + 144) = v8;
  *(unsigned char *)(v9 + 280) = a6;
  *(void *)(v9 + 120) = a5;
  *(void *)(v9 + 128) = a7;
  *(void *)(v9 + 104) = a3;
  *(void *)(v9 + 112) = a4;
  *(void *)(v9 + 88) = a1;
  *(void *)(v9 + 96) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644C0);
  *(void *)(v9 + 152) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2DC0();
  *(void *)(v9 + 160) = v10;
  *(void *)(v9 + 168) = *(void *)(v10 - 8);
  *(void *)(v9 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7D73E0, 0, 0);
}

uint64_t sub_25A7D73E0()
{
  uint64_t v49 = v0;
  sub_25A7C1300();
  if (sub_25A7F31C0())
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 168) + 16))(*(void *)(v0 + 176), *(void *)(v0 + 112), *(void *)(v0 + 160));
    uint64_t v1 = sub_25A7F2EC0();
    os_log_type_t v2 = sub_25A7F3190();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v4 = *(void *)(v0 + 168);
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 160);
    if (v3)
    {
      os_log_type_t type = v2;
      uint64_t v43 = *(void *)(v0 + 160);
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v48 = v45;
      *(_DWORD *)uint64_t v7 = 136315138;
      buf = v7;
      uint64_t v8 = sub_25A7F2080();
      uint64_t v9 = *(void *)(v8 - 8);
      uint64_t v10 = swift_task_alloc();
      sub_25A7F2D70();
      uint64_t v11 = sub_25A7F2060();
      unint64_t v13 = v12;
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v8);
      swift_task_dealloc();
      *(void *)(v0 + 80) = sub_25A7EED88(v11, v13, &v48);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v43);
      _os_log_impl(&dword_25A7B3000, v1, type, "%s Fallback is enabled", buf, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v45, -1, -1);
      MEMORY[0x261145500](buf, -1, -1);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    }
    uint64_t v28 = sub_25A7F2C60();
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    swift_allocError();
    uint64_t v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25A7F46C0;
    *(void *)(inited + 32) = sub_25A7F3000();
    *(void *)(inited + 40) = v32;
    *(void *)(inited + 48) = 0xD00000000000001FLL;
    *(void *)(inited + 56) = 0x800000025A7F53F0;
    sub_25A7C9EB8(inited);
    sub_25A7F2C50();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v28 - 8) + 104))(v30, *MEMORY[0x263F56280], v28);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
    return v33();
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 144);
    uint64_t v15 = *(void *)(v0 + 152);
    uint64_t v16 = sub_25A7F2080();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = swift_task_alloc();
    sub_25A7F2D70();
    uint64_t v19 = sub_25A7F2060();
    uint64_t v21 = v20;
    *(void *)(v0 + 184) = v20;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v16);
    swift_task_dealloc();
    logMetric(logger:name:startInstant:)(v14 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, 0xD000000000000012, 0x800000025A7F53D0);
    uint64_t v22 = sub_25A7F2BB0();
    *(void *)(v0 + 192) = v22;
    uint64_t v23 = *(void *)(v22 - 8);
    *(void *)(v0 + 200) = v23;
    *(void *)(v0 + 208) = swift_task_alloc();
    sub_25A7F2BA0();
    sub_25A7F2D60();
    uint64_t v24 = sub_25A7F2C40();
    uint64_t v25 = *(void *)(v24 - 8);
    int v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v15, 1, v24);
    uint64_t v27 = *(void *)(v0 + 152);
    if (v26 == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 152), &qword_26A4644C0);
    }
    else
    {
      sub_25A7F2C20();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v24);
    }
    uint64_t v35 = *(void *)(v0 + 144);
    LOBYTE(v48) = v26 == 1;
    int8x16_t v46 = vextq_s8(*(int8x16_t *)(v0 + 112), *(int8x16_t *)(v0 + 112), 8uLL);
    long long v42 = *(_OWORD *)(v0 + 96);
    long long v44 = *(_OWORD *)(v0 + 128);
    sub_25A7F2B90();
    uint64_t v36 = swift_task_alloc();
    *(void *)(v0 + 216) = v36;
    (*(void (**)(void))(v23 + 16))();
    uint64_t v37 = swift_task_alloc();
    *(void *)(v0 + 224) = v37;
    *(_OWORD *)(v37 + 16) = v42;
    *(void *)(v37 + 32) = v35;
    *(void *)(v37 + 40) = v19;
    *(void *)(v37 + 48) = v21;
    *(int8x16_t *)(v37 + 56) = v46;
    *(_OWORD *)(v37 + 72) = v44;
    BOOL v38 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v38;
    *BOOL v38 = v0;
    v38[1] = sub_25A7D7B0C;
    char v39 = *(unsigned char *)(v0 + 280);
    uint64_t v40 = *(void *)(v0 + 88);
    return sub_25A7DF9C8(v40, v19, v21, v39, v36, (uint64_t)&unk_26A4644D0, v37);
  }
}

uint64_t sub_25A7D7B0C()
{
  os_log_type_t v2 = (void *)*v1;
  v2[30] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[27];
  uint64_t v4 = v2[25];
  uint64_t v5 = v2[24];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v7 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v2[33] = v6;
    v2[34] = v7;
    v6(v3, v5);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v8 = sub_25A7D7D88;
  }
  else
  {
    v2[31] = v6;
    v2[32] = v7;
    v6(v3, v5);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = sub_25A7D7CF0;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_25A7D7CF0()
{
  (*(void (**)(void, void))(v0 + 248))(*(void *)(v0 + 208), *(void *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A7D7D88()
{
  (*(void (**)(void, void))(v0 + 264))(*(void *)(v0 + 208), *(void *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t NewInferenceProvider.requestOneShot(clientData:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[13] = a3;
  v4[14] = v3;
  v4[11] = a1;
  v4[12] = a2;
  uint64_t v5 = sub_25A7F2DC0();
  v4[15] = v5;
  v4[16] = *(void *)(v5 - 8);
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  uint64_t v6 = sub_25A7F2EE0();
  v4[19] = v6;
  v4[20] = *(void *)(v6 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v7 = sub_25A7F2E30();
  v4[22] = v7;
  v4[23] = *(void *)(v7 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7D7FB8, 0, 0);
}

uint64_t sub_25A7D7FB8()
{
  uint64_t v63 = v0;
  uint64_t v1 = sub_25A7F2080();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  sub_25A7F2D70();
  uint64_t v4 = sub_25A7F2060();
  unint64_t v6 = v5;
  v0[26] = v5;
  uint64_t v46 = v1;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v45(v3, v1);
  swift_task_dealloc();
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25A7F2E50();
  os_signpost_type_t v8 = sub_25A7F3230();
  uint64_t v61 = v4;
  unint64_t v60 = v6;
  if (sub_25A7F3250())
  {
    uint64_t v9 = v0[24];
    uint64_t v58 = v0[23];
    uint64_t v52 = v0[22];
    os_log_type_t type = *(void (**)(uint64_t, void))(v58 + 16);
    type(v9, v0[25]);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v62 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    swift_bridgeObjectRetain();
    v0[10] = sub_25A7EED88(v4, v6, &v62);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v12 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v7, v8, v12, "requestOneShot", "full request requestIdentifier=%{public, signpost.description=attribute,public}s)", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v11, -1, -1);
    MEMORY[0x261145500](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v9, v52);
    unint64_t v13 = (void (*)(void, uint64_t, uint64_t))type;
  }
  else
  {
    uint64_t v14 = v0[23];

    swift_bridgeObjectRelease_n();
    unint64_t v13 = *(void (**)(void, uint64_t, uint64_t))(v14 + 16);
  }
  uint64_t v15 = v0[25];
  uint64_t v17 = v0[22];
  uint64_t v16 = v0[23];
  uint64_t v18 = v0[20];
  uint64_t v19 = v0[18];
  buf = (uint8_t *)v0[21];
  uint64_t v49 = v0[19];
  uint64_t v20 = v0[16];
  uint64_t v21 = v0[14];
  uint64_t v53 = v0[15];
  *(void *)uint64_t typea = v0[17];
  uint64_t v50 = v0[13];
  v13(v0[24], v15, v17);
  sub_25A7F2EA0();
  swift_allocObject();
  uint64_t v59 = sub_25A7F2E90();
  v0[27] = v59;
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint8_t *, uint64_t, uint64_t))(v18 + 16))(buf, v21 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, v49);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  v22(v19, v50, v53);
  uint64_t v23 = sub_25A7F2590();
  swift_allocObject();
  uint64_t v24 = sub_25A7F2570();
  v0[28] = v24;
  v22(*(void *)typea, v50, v53);
  uint64_t v25 = sub_25A7F2EC0();
  os_log_type_t v26 = sub_25A7F31A0();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v29 = v0[16];
  uint64_t v28 = v0[17];
  uint64_t v30 = v0[15];
  if (v27)
  {
    os_log_type_t typeb = v26;
    uint64_t v51 = v0[15];
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    uint64_t v62 = v54;
    bufa = v31;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v32 = swift_task_alloc();
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v33 = sub_25A7F3390();
    uint64_t v44 = v28;
    unint64_t v35 = v34;
    v45(v32, v46);
    swift_task_dealloc();
    v0[9] = sub_25A7EED88(v33, v35, &v62);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v44, v51);
    _os_log_impl(&dword_25A7B3000, v25, typeb, "%s executing one shot request", bufa, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v54, -1, -1);
    MEMORY[0x261145500](bufa, -1, -1);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  }
  uint64_t v36 = MEMORY[0x263F611D8];
  uint64_t v37 = v0[14];
  v0[5] = v23;
  v0[6] = v36;
  v0[2] = v24;
  BOOL v38 = (void *)swift_task_alloc();
  v0[29] = v38;
  v38[2] = v37;
  v38[3] = v59;
  v38[4] = v24;
  v38[5] = v61;
  v38[6] = v60;
  swift_retain();
  char v39 = (void *)swift_task_alloc();
  v0[30] = v39;
  void *v39 = v0;
  v39[1] = sub_25A7D8610;
  uint64_t v40 = v0[13];
  uint64_t v41 = v0[11];
  uint64_t v42 = v0[12];
  return sub_25A7D72E0((uint64_t)(v0 + 7), v41, v42, v40, (uint64_t)(v0 + 2), 1, (uint64_t)&unk_26A464470, (uint64_t)v38);
}

uint64_t sub_25A7D8610()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 248) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_25A7D8810;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    uint64_t v3 = sub_25A7D874C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25A7D874C()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_25A7D8810()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A7D88F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[73] = a7;
  v7[72] = a6;
  v7[71] = a5;
  v7[70] = a4;
  v7[69] = a3;
  v7[68] = a2;
  v7[67] = a1;
  uint64_t v8 = sub_25A7F2670();
  v7[74] = v8;
  v7[75] = *(void *)(v8 - 8);
  v7[76] = swift_task_alloc();
  v7[77] = swift_task_alloc();
  uint64_t v9 = sub_25A7F2660();
  v7[78] = v9;
  v7[79] = *(void *)(v9 - 8);
  v7[80] = swift_task_alloc();
  uint64_t v10 = sub_25A7F2110();
  v7[81] = v10;
  v7[82] = *(void *)(v10 - 8);
  v7[83] = swift_task_alloc();
  uint64_t v11 = sub_25A7F2C60();
  v7[84] = v11;
  v7[85] = *(void *)(v11 - 8);
  v7[86] = swift_task_alloc();
  v7[87] = swift_task_alloc();
  v7[88] = swift_task_alloc();
  sub_25A7F29A0();
  v7[89] = swift_task_alloc();
  uint64_t v12 = sub_25A7F2730();
  v7[90] = v12;
  v7[91] = *(void *)(v12 - 8);
  v7[92] = swift_task_alloc();
  sub_25A7F2780();
  v7[93] = swift_task_alloc();
  uint64_t v13 = sub_25A7F28B0();
  v7[94] = v13;
  v7[95] = *(void *)(v13 - 8);
  v7[96] = swift_task_alloc();
  uint64_t v14 = sub_25A7F2690();
  v7[97] = v14;
  v7[98] = *(void *)(v14 - 8);
  v7[99] = swift_task_alloc();
  v7[100] = swift_task_alloc();
  v7[101] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645C8);
  v7[102] = swift_task_alloc();
  v7[103] = swift_task_alloc();
  uint64_t v15 = sub_25A7F2490();
  v7[104] = v15;
  v7[105] = *(void *)(v15 - 8);
  v7[106] = swift_task_alloc();
  v7[107] = swift_task_alloc();
  uint64_t v16 = sub_25A7F2550();
  v7[108] = v16;
  v7[109] = *(void *)(v16 - 8);
  v7[110] = swift_task_alloc();
  v7[111] = swift_task_alloc();
  v7[112] = swift_task_alloc();
  uint64_t v17 = sub_25A7F2700();
  v7[113] = v17;
  v7[114] = *(void *)(v17 - 8);
  v7[115] = swift_task_alloc();
  v7[116] = swift_task_alloc();
  uint64_t v18 = sub_25A7F26E0();
  v7[117] = v18;
  v7[118] = *(void *)(v18 - 8);
  v7[119] = swift_task_alloc();
  v7[120] = swift_task_alloc();
  v7[121] = swift_task_alloc();
  uint64_t v19 = sub_25A7F2340();
  v7[122] = v19;
  v7[123] = *(void *)(v19 - 8);
  v7[124] = swift_task_alloc();
  v7[125] = swift_task_alloc();
  v7[126] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464588);
  v7[127] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645D0);
  v7[128] = swift_task_alloc();
  uint64_t v20 = sub_25A7F2A70();
  v7[129] = v20;
  v7[130] = *(void *)(v20 - 8);
  v7[131] = swift_task_alloc();
  uint64_t v21 = sub_25A7F2500();
  v7[132] = v21;
  v7[133] = *(void *)(v21 - 8);
  v7[134] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464388);
  v7[135] = swift_task_alloc();
  v7[136] = swift_task_alloc();
  uint64_t v22 = sub_25A7F23D0();
  v7[137] = v22;
  v7[138] = *(void *)(v22 - 8);
  v7[139] = swift_task_alloc();
  uint64_t v23 = sub_25A7F2E70();
  v7[140] = v23;
  v7[141] = *(void *)(v23 - 8);
  v7[142] = swift_task_alloc();
  v7[143] = swift_task_alloc();
  v7[144] = swift_task_alloc();
  v7[145] = swift_task_alloc();
  v7[146] = swift_task_alloc();
  v7[147] = swift_task_alloc();
  v7[148] = swift_task_alloc();
  v7[149] = swift_task_alloc();
  v7[150] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464378);
  v7[151] = swift_task_alloc();
  uint64_t v24 = sub_25A7F2380();
  v7[152] = v24;
  v7[153] = *(void *)(v24 - 8);
  v7[154] = swift_task_alloc();
  v7[155] = swift_task_alloc();
  uint64_t v25 = sub_25A7F2E30();
  v7[156] = v25;
  v7[157] = *(void *)(v25 - 8);
  v7[158] = swift_task_alloc();
  v7[159] = swift_task_alloc();
  v7[160] = swift_task_alloc();
  v7[161] = swift_task_alloc();
  v7[162] = swift_task_alloc();
  v7[163] = swift_task_alloc();
  v7[164] = swift_task_alloc();
  v7[165] = swift_task_alloc();
  v7[166] = swift_task_alloc();
  v7[167] = swift_task_alloc();
  v7[168] = swift_task_alloc();
  v7[169] = swift_task_alloc();
  v7[170] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645D8);
  v7[171] = swift_task_alloc();
  v7[172] = swift_task_alloc();
  v7[173] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464370);
  v7[174] = swift_task_alloc();
  v7[175] = swift_task_alloc();
  v7[176] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7D93A8, 0, 0);
}

uint64_t sub_25A7D93A8()
{
  uint64_t v32 = v0;
  uint64_t v1 = *(void *)(v0 + 1408);
  uint64_t v2 = *(void *)(v0 + 1384);
  uint64_t v3 = *(void *)(v0 + 872);
  uint64_t v4 = *(void *)(v0 + 864);
  *(void *)(v0 + 360) = 0;
  *(void *)(v0 + 368) = 0xE000000000000000;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v4);
  uint64_t v5 = sub_25A7F2A90();
  *(void *)(v0 + 1416) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  *(void *)(v0 + 1424) = v7;
  *(void *)(v0 + 1432) = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v7(v2, 1, 1, v5);
  *(void *)(v0 + 1440) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_25A7F2E50();
  os_signpost_type_t v9 = sub_25A7F3230();
  if (sub_25A7F3250())
  {
    uint64_t v28 = *(void *)(v0 + 1352);
    uint64_t v29 = *(void *)(v0 + 1248);
    uint64_t v30 = *(void *)(v0 + 1256);
    unint64_t v10 = *(void *)(v0 + 584);
    uint64_t v11 = *(void *)(v0 + 576);
    uint64_t v12 = *(void (**)(void))(v30 + 16);
    unint64_t v13 = (v30 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v12();
    os_signpost_type_t v27 = v9;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v31 = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 528) = sub_25A7EED88(v11, v10, &v31);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v16 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v8, v27, v16, "requestOneShot", "first token requestIdentifier=%{public, signpost.description=attribute,public}s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v15, -1, -1);
    MEMORY[0x261145500](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 1256);

    swift_bridgeObjectRelease_n();
    uint64_t v12 = *(void (**)(void))(v17 + 16);
    unint64_t v13 = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  }
  *(void *)(v0 + 1448) = v12;
  uint64_t v18 = *(void *)(v0 + 1360);
  uint64_t v19 = *(void *)(v0 + 1352);
  uint64_t v20 = *(void *)(v0 + 1256);
  uint64_t v21 = *(void *)(v0 + 1248);
  *(void *)(v0 + 1456) = v13;
  ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v19, v18, v21);
  *(void *)(v0 + 1464) = sub_25A7F2EA0();
  swift_allocObject();
  uint64_t v22 = sub_25A7F2E90();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  *(void *)(v0 + 1472) = v23;
  *(void *)(v0 + 1480) = (v20 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v23(v18, v21);
  *(void *)(v0 + 1488) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  *(_DWORD *)(v0 + 1520) = *MEMORY[0x263F611A0];
  *(_DWORD *)(v0 + 1524) = *MEMORY[0x263F61190];
  *(_DWORD *)(v0 + 1528) = *MEMORY[0x263F61198];
  *(_DWORD *)(v0 + 1532) = *MEMORY[0x263F61170];
  *(_DWORD *)(v0 + 1536) = *MEMORY[0x263F90238];
  *(unsigned char *)(v0 + 1540) = 0;
  *(void *)(v0 + 1496) = v22;
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 1504) = v24;
  void *v24 = v0;
  v24[1] = sub_25A7D9784;
  uint64_t v25 = *(void *)(v0 + 1208);
  return sub_25A7C5C9C(v25);
}

uint64_t sub_25A7D9784()
{
  *(void *)(*(void *)v1 + 1512) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25A7DD7C4;
  }
  else
  {
    uint64_t v2 = sub_25A7D98A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

id sub_25A7D98A0()
{
  uint64_t v459 = v0;
  uint64_t v1 = *(void *)(v0 + 1224);
  uint64_t v2 = *(void *)(v0 + 1216);
  uint64_t v3 = *(void *)(v0 + 1208);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    sub_25A7BD1C4(v3, &qword_26A464378);
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_25A7F2E50();
    sub_25A7F2E80();
    os_signpost_type_t v5 = sub_25A7F3220();
    if (sub_25A7F3250())
    {
      int v6 = *(_DWORD *)(v0 + 1536);
      uint64_t v7 = *(void *)(v0 + 1184);
      uint64_t v8 = *(void *)(v0 + 1128);
      uint64_t v9 = *(void *)(v0 + 1120);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      os_signpost_type_t v445 = v5;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == v6)
      {
        char v10 = 0;
        char v11 = 0;
        v388 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1184), *(void *)(v0 + 1120));
        v388 = "last token received requestIdentifier=%{public, signpost.description=attribute,public}s";
        char v11 = 2;
        char v10 = 1;
      }
      v407 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v24 = (uint64_t *)(v0 + 1352);
      uint64_t v394 = *(void *)(v0 + 1248);
      uint64_t v400 = *(void *)(v0 + 1312);
      unint64_t v45 = *(void *)(v0 + 584);
      uint64_t v46 = *(void *)(v0 + 576);
      (*(void (**)(void))(v0 + 1448))(*(void *)(v0 + 1352));
      uint64_t v47 = swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v458[0] = v48;
      *(unsigned char *)uint64_t v47 = v11;
      *(unsigned char *)(v47 + 1) = v10;
      *(_WORD *)(v47 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 504) = sub_25A7EED88(v46, v45, v458);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      os_signpost_id_t v49 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v4, v445, v49, "requestOneShot", v388, (uint8_t *)v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v48, -1, -1);
      MEMORY[0x261145500](v47, -1, -1);

      v407(v400, v394);
    }
    else
    {
      uint64_t v24 = (uint64_t *)(v0 + 1312);
      swift_bridgeObjectRelease_n();
    }
    uint64_t v50 = *v24;
    uint64_t v51 = *(void *)(v0 + 1408);
    uint64_t v52 = *(void *)(v0 + 1392);
    uint64_t v53 = *(void *)(v0 + 968);
    uint64_t v54 = *(void *)(v0 + 944);
    uint64_t v55 = *(void *)(v0 + 936);
    uint64_t v56 = *(void *)(v0 + 872);
    v447 = *(void **)(v0 + 864);
    (*(void (**)(uint64_t, void))(v0 + 1472))(v50, *(void *)(v0 + 1248));
    sub_25A7C9D80(MEMORY[0x263F8EE78]);
    sub_25A7F26D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645F8);
    unint64_t v57 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_25A7F46C0;
    unint64_t v413 = v57;
    uint64_t v59 = *(void (**)(unint64_t, uint64_t, uint64_t))(v54 + 16);
    v59(v58 + v57, v53, v55);
    sub_25A7F26F0();
    sub_25A7C7164(v51, v52, &qword_26A464370);
    if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v56 + 48))(v52, 1, v447) == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 1392), &qword_26A464370);
LABEL_39:
      uint64_t v141 = *(void *)(v0 + 808);
      uint64_t v142 = *(void *)(v0 + 800);
      uint64_t v143 = *(void *)(v0 + 784);
      uint64_t v144 = *(void *)(v0 + 776);
      if (*(unsigned char *)(v0 + 1540)) {
        uint64_t v145 = (unsigned int *)MEMORY[0x263F7F888];
      }
      else {
        uint64_t v145 = (unsigned int *)MEMORY[0x263F7F870];
      }
      (*(void (**)(void, void, void))(*(void *)(v0 + 784) + 104))(*(void *)(v0 + 808), *v145, *(void *)(v0 + 776));
      v436 = *(void (**)(uint64_t, uint64_t, uint64_t))(v143 + 16);
      v436(v142, v141, v144);
      os_signpost_id_t v146 = sub_25A7F2EC0();
      os_log_type_t v147 = sub_25A7F3170();
      BOOL v148 = os_log_type_enabled(v146, v147);
      uint64_t v149 = *(void *)(v0 + 800);
      if (v148)
      {
        uint64_t v150 = *(void *)(v0 + 792);
        uint64_t v151 = *(void *)(v0 + 784);
        uint64_t v152 = *(void *)(v0 + 776);
        uint64_t v153 = (uint8_t *)swift_slowAlloc();
        uint64_t v154 = swift_slowAlloc();
        v458[0] = v154;
        *(_DWORD *)uint64_t v153 = 136315138;
        v436(v150, v149, v152);
        uint64_t v155 = sub_25A7F3040();
        *(void *)(v0 + 480) = sub_25A7EED88(v155, v156, v458);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        v377 = *(void (**)(uint64_t, uint64_t))(v151 + 8);
        v377(v149, v152);
        _os_log_impl(&dword_25A7B3000, v146, v147, "Request finished with reason: %s", v153, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261145500](v154, -1, -1);
        MEMORY[0x261145500](v153, -1, -1);
      }
      else
      {
        uint64_t v157 = *(void *)(v0 + 784);
        uint64_t v158 = *(void *)(v0 + 776);

        v377 = *(void (**)(uint64_t, uint64_t))(v157 + 8);
        v377(v149, v158);
      }
      uint64_t v402 = *(void *)(v0 + 1368);
      uint64_t v408 = *(void *)(v0 + 1384);
      uint64_t v389 = *(void *)(v0 + 808);
      uint64_t v159 = *(void *)(v0 + 792);
      uint64_t v429 = *(void *)(v0 + 1512);
      uint64_t v160 = *(void *)(v0 + 736);
      uint64_t v161 = *(void *)(v0 + 728);
      uint64_t v380 = *(void *)(v0 + 720);
      uint64_t v385 = *(void *)(v0 + 776);
      (*(void (**)(void))(*(void *)(v0 + 912) + 16))();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A464600);
      sub_25A7F2770();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_25A7F46C0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A464608);
      sub_25A7F2750();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_25A7F46C0;
      sub_25A7F2710();
      (*(void (**)(uint64_t, void, uint64_t))(v161 + 104))(v160, *MEMORY[0x263F7F8F8], v380);
      sub_25A7F2740();
      v436(v159, v389, v385);
      sub_25A7F2760();
      sub_25A7F2990();
      sub_25A7C7164(v408, v402, &qword_26A4645D8);
      sub_25A7F2720();
      sub_25A7F28A0();
      sub_25A7F0F78(&qword_26A464610, MEMORY[0x263F7F978]);
      uint64_t v162 = v429;
      uint64_t v164 = sub_25A7F26B0();
      uint64_t v165 = *(void *)(v0 + 944);
      uint64_t v437 = *(void *)(v0 + 936);
      v450 = *(void **)(v0 + 968);
      uint64_t v166 = *(void *)(v0 + 912);
      uint64_t v422 = *(void *)(v0 + 904);
      uint64_t v430 = *(void *)(v0 + 928);
      uint64_t v409 = *(void *)(v0 + 776);
      uint64_t v415 = *(void *)(v0 + 808);
      uint64_t v167 = *(void *)(v0 + 768);
      uint64_t v168 = *(void *)(v0 + 760);
      uint64_t v169 = *(void *)(v0 + 752);
      if (!v162)
      {
        v396 = *(uint64_t **)(v0 + 536);
        uint64_t v177 = v164;
        uint64_t v390 = v163;
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v167, v169);
        v377(v415, v409);
        (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v430, v422);
        (*(void (**)(void *, uint64_t))(v165 + 8))(v450, v437);
        uint64_t *v396 = v177;
        v396[1] = v390;
        uint64_t v178 = sub_25A7F2E50();
        sub_25A7F2E80();
        os_signpost_type_t v179 = sub_25A7F3220();
        if (sub_25A7F3250())
        {
          int v180 = *(_DWORD *)(v0 + 1536);
          uint64_t v181 = *(void *)(v0 + 1176);
          uint64_t v182 = *(void *)(v0 + 1128);
          uint64_t v183 = *(void *)(v0 + 1120);
          swift_retain();
          sub_25A7F2EB0();
          swift_release();
          if ((*(unsigned int (**)(uint64_t, uint64_t))(v182 + 88))(v181, v183) == v180)
          {
            uint64_t v184 = "[Error] Interval already ended";
          }
          else
          {
            (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1176), *(void *)(v0 + 1120));
            uint64_t v184 = "";
          }
          uint64_t v197 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
          BOOL v186 = (void *)(v0 + 1352);
          uint64_t v198 = *(void *)(v0 + 1304);
          uint64_t v199 = *(void *)(v0 + 1248);
          (*(void (**)(void, uint64_t, uint64_t))(v0 + 1448))(*(void *)(v0 + 1352), v198, v199);
          uint64_t v200 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v200 = 0;
          os_signpost_id_t v201 = sub_25A7F2E10();
          _os_signpost_emit_with_name_impl(&dword_25A7B3000, v178, v179, v201, "requestOneShot", v184, v200, 2u);
          MEMORY[0x261145500](v200, -1, -1);

          v197(v198, v199);
        }
        else
        {
          BOOL v186 = (void *)(v0 + 1304);
        }
        uint64_t v202 = *(void *)(v0 + 1408);
        uint64_t v203 = *(void *)(v0 + 1384);
        (*(void (**)(void, void))(v0 + 1472))(*v186, *(void *)(v0 + 1248));
        sub_25A7F2560();
        sub_25A7BD1C4(v203, &qword_26A4645D8);
        sub_25A7BD1C4(v202, &qword_26A464370);
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
        uint64_t v196 = *(uint64_t (**)(void))(v0 + 8);
        goto LABEL_61;
      }
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v167, v169);
      v377(v415, v409);
      (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v430, v422);
      (*(void (**)(void *, uint64_t))(v165 + 8))(v450, v437);
      uint64_t v170 = sub_25A7F2E50();
      sub_25A7F2E80();
      os_signpost_type_t v171 = sub_25A7F3220();
      if ((sub_25A7F3250() & 1) == 0)
      {
        os_log_type_t v185 = (void *)(v0 + 1264);

LABEL_57:
        uint64_t v194 = *(void *)(v0 + 1408);
        uint64_t v195 = *(void *)(v0 + 1384);
        (*(void (**)(void, void))(v0 + 1472))(*v185, *(void *)(v0 + 1248));
        sub_25A7F2560();
        sub_25A7BD1C4(v195, &qword_26A4645D8);
        sub_25A7BD1C4(v194, &qword_26A464370);
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
        uint64_t v196 = *(uint64_t (**)(void))(v0 + 8);
LABEL_61:
        return (id)v196();
      }
      int v172 = *(_DWORD *)(v0 + 1536);
      uint64_t v173 = *(void *)(v0 + 1136);
      uint64_t v174 = *(void *)(v0 + 1128);
      uint64_t v175 = *(void *)(v0 + 1120);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v174 + 88))(v173, v175) == v172)
      {
        uint64_t v176 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1136), *(void *)(v0 + 1120));
        uint64_t v176 = "";
      }
      unint64_t v187 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
      os_log_type_t v185 = (void *)(v0 + 1352);
      uint64_t v189 = *(void *)(v0 + 1352);
      uint64_t v190 = *(void *)(v0 + 1264);
LABEL_56:
      uint64_t v191 = *(void *)(v0 + 1248);
      v188(v189, v190, v191);
      unint64_t v192 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v192 = 0;
      os_signpost_id_t v193 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v170, v171, v193, "requestOneShot", v176, v192, 2u);
      MEMORY[0x261145500](v192, -1, -1);

      v187(v190, v191);
      goto LABEL_57;
    }
    v448 = v59;
    uint64_t v60 = *(void *)(v0 + 896);
    uint64_t v61 = *(void *)(v0 + 888);
    uint64_t v62 = *(void *)(v0 + 872);
    uint64_t v63 = *(void *)(v0 + 864);
    (*(void (**)(uint64_t, void, uint64_t))(v62 + 32))(v60, *(void *)(v0 + 1392), v63);
    uint64_t v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16);
    v64(v61, v60, v63);
    swift_bridgeObjectRetain_n();
    uint64_t v65 = sub_25A7F2EC0();
    os_log_type_t v66 = sub_25A7F3170();
    BOOL v67 = os_log_type_enabled(v65, v66);
    uint64_t v68 = *(void *)(v0 + 888);
    if (v67)
    {
      uint64_t v372 = *(void *)(v0 + 888);
      uint64_t v373 = *(void *)(v0 + 880);
      uint64_t v375 = *(void *)(v0 + 872);
      uint64_t v69 = *(void *)(v0 + 864);
      unint64_t v70 = *(void *)(v0 + 584);
      uint64_t v71 = *(void *)(v0 + 576);
      os_log_type_t v378 = v66;
      uint64_t v72 = swift_slowAlloc();
      uint64_t v383 = swift_slowAlloc();
      v458[0] = v383;
      *(_DWORD *)uint64_t v72 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 488) = sub_25A7EED88(v71, v70, v458);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v72 + 12) = 2082;
      v64(v373, v372, v69);
      uint64_t v73 = sub_25A7F3040();
      *(void *)(v0 + 496) = sub_25A7EED88(v73, v74, v458);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v375 + 8);
      v75(v372, v69);
      _os_log_impl(&dword_25A7B3000, v65, v378, "%s %{public}s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v383, -1, -1);
      MEMORY[0x261145500](v72, -1, -1);
    }
    else
    {
      uint64_t v94 = *(void *)(v0 + 872);
      uint64_t v95 = *(void *)(v0 + 864);

      swift_bridgeObjectRelease_n();
      uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v94 + 8);
      v75(v68, v95);
    }
    uint64_t v96 = *(void *)(v0 + 840);
    uint64_t v97 = *(void *)(v0 + 832);
    uint64_t v98 = *(void *)(v0 + 824);
    sub_25A7F2530();
    uint64_t v99 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v96 + 48);
    if (v99(v98, 1, v97) == 1)
    {
      uint64_t v100 = *(void *)(v0 + 832);
      uint64_t v101 = *(void *)(v0 + 816);
      sub_25A7BD1C4(*(void *)(v0 + 824), &qword_26A4645C8);
      sub_25A7F2540();
      if (v99(v101, 1, v100) == 1)
      {
        uint64_t v102 = *(void *)(v0 + 816);
        v75(*(void *)(v0 + 896), *(void *)(v0 + 864));
        sub_25A7BD1C4(v102, &qword_26A4645C8);
        goto LABEL_39;
      }
      uint64_t v368 = *(void *)(v0 + 968);
      uint64_t v103 = *(void *)(v0 + 952);
      v434 = v75;
      uint64_t v104 = *(void *)(v0 + 944);
      uint64_t v105 = *(void *)(v0 + 936);
      uint64_t v371 = *(void *)(v0 + 920);
      uint64_t v376 = *(void *)(v0 + 912);
      uint64_t v379 = *(void *)(v0 + 904);
      uint64_t v384 = *(void *)(v0 + 928);
      uint64_t v369 = *(void *)(v0 + 896);
      uint64_t v374 = *(void *)(v0 + 864);
      uint64_t v106 = *(void *)(v0 + 848);
      uint64_t v107 = *(void *)(v0 + 840);
      uint64_t v370 = *(void *)(v0 + 832);
      uint64_t v108 = *(void *)(v0 + 816);
    }
    else
    {
      uint64_t v368 = *(void *)(v0 + 968);
      uint64_t v103 = *(void *)(v0 + 960);
      v434 = v75;
      uint64_t v104 = *(void *)(v0 + 944);
      uint64_t v105 = *(void *)(v0 + 936);
      uint64_t v371 = *(void *)(v0 + 920);
      uint64_t v376 = *(void *)(v0 + 912);
      uint64_t v379 = *(void *)(v0 + 904);
      uint64_t v384 = *(void *)(v0 + 928);
      uint64_t v369 = *(void *)(v0 + 896);
      uint64_t v374 = *(void *)(v0 + 864);
      uint64_t v106 = *(void *)(v0 + 856);
      uint64_t v107 = *(void *)(v0 + 840);
      uint64_t v370 = *(void *)(v0 + 832);
      uint64_t v108 = *(void *)(v0 + 824);
    }
    (*(void (**)(uint64_t, uint64_t))(v107 + 32))(v106, v108);
    sub_25A7F2470();
    sub_25A7F2480();
    sub_25A7C9D80(MEMORY[0x263F8EE78]);
    sub_25A7F26D0();
    (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v368, v105);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32))(v368, v103, v105);
    uint64_t v140 = swift_allocObject();
    *(_OWORD *)(v140 + 16) = xmmword_25A7F46C0;
    v448(v140 + v413, v368, v105);
    sub_25A7F2520();
    sub_25A7F26F0();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v106, v370);
    v434(v369, v374);
    (*(void (**)(uint64_t, uint64_t))(v376 + 8))(v384, v379);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v376 + 32))(v384, v371, v379);
    goto LABEL_39;
  }
  int v12 = *(_DWORD *)(v0 + 1520);
  uint64_t v13 = *(void *)(v0 + 1240);
  uint64_t v14 = *(void *)(v0 + 1232);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v13, v3, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v14, v13, v2);
  int v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v14, v2);
  if (v15 == v12)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1224) + 96))(*(void *)(v0 + 1232), *(void *)(v0 + 1216));
    sub_25A7F2580();
    swift_bridgeObjectRetain_n();
    os_signpost_id_t v16 = sub_25A7F2E50();
    sub_25A7F2E80();
    os_signpost_type_t v17 = sub_25A7F3220();
    if (sub_25A7F3250())
    {
      os_signpost_type_t v427 = v17;
      int v18 = *(_DWORD *)(v0 + 1536);
      uint64_t v19 = *(void *)(v0 + 1200);
      uint64_t v20 = *(void *)(v0 + 1128);
      uint64_t v21 = *(void *)(v0 + 1120);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 88))(v19, v21) == v18)
      {
        char v22 = 0;
        char v23 = 0;
        v406 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1200), *(void *)(v0 + 1120));
        v406 = "token received requestIdentifier=%{public, signpost.description=attribute,public}s";
        char v23 = 2;
        char v22 = 1;
      }
      v414 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v76 = (void *)(v0 + 1352);
      uint64_t v395 = *(void *)(v0 + 1248);
      uint64_t v401 = *(void *)(v0 + 1344);
      unint64_t v109 = *(void *)(v0 + 584);
      uint64_t v110 = *(void *)(v0 + 576);
      (*(void (**)(void))(v0 + 1448))(*(void *)(v0 + 1352));
      uint64_t v111 = swift_slowAlloc();
      uint64_t v112 = swift_slowAlloc();
      v458[0] = v112;
      *(unsigned char *)uint64_t v111 = v23;
      *(unsigned char *)(v111 + 1) = v22;
      *(_WORD *)(v111 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v111 + 4) = sub_25A7EED88(v110, v109, v458);
      swift_bridgeObjectRelease_n();
      os_signpost_id_t v113 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v16, v427, v113, "requestOneShot", v406, (uint8_t *)v111, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v112, -1, -1);
      MEMORY[0x261145500](v111, -1, -1);

      v414(v401, v395);
    }
    else
    {
      uint64_t v76 = (void *)(v0 + 1344);
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(void, void))(v0 + 1472))(*v76, *(void *)(v0 + 1248));
    sub_25A7F2E50();
    sub_25A7F2E00();
    uint64_t v114 = sub_25A7F2E50();
    os_signpost_type_t v115 = sub_25A7F3230();
    if (sub_25A7F3250())
    {
      uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v117 = *(void *)(v0 + 1352);
      uint64_t v118 = *(void *)(v0 + 1248);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 1448))(v117, *(void *)(v0 + 1336), v118);
      uint64_t v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v119 = 0;
      os_signpost_id_t v120 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v114, v115, v120, "requestOneShot", "extend token", v119, 2u);
      MEMORY[0x261145500](v119, -1, -1);

      v116(v117, v118);
    }
    else
    {
    }
    unint64_t v121 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
    uint64_t v122 = *(void *)(v0 + 1336);
    uint64_t v123 = *(void *)(v0 + 1248);
    uint64_t v124 = *(void *)(v0 + 1224);
    uint64_t v420 = *(void *)(v0 + 1216);
    uint64_t v428 = *(void *)(v0 + 1240);
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 1448))(*(void *)(v0 + 1352), v122, v123);
    swift_allocObject();
    uint64_t v125 = sub_25A7F2E90();
    swift_release();
    v121(v122, v123);
    sub_25A7F3060();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v428, v420);
    char v126 = *(unsigned char *)(v0 + 1540);
    goto LABEL_102;
  }
  if (v15 != *(_DWORD *)(v0 + 1524))
  {
    if (v15 == *(_DWORD *)(v0 + 1528))
    {
      uint64_t v77 = *(void *)(v0 + 1232);
      uint64_t v78 = *(void *)(v0 + 1008);
      uint64_t v79 = *(void *)(v0 + 1000);
      uint64_t v80 = *(void *)(v0 + 984);
      uint64_t v81 = *(void *)(v0 + 976);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 1224) + 96))(v77, *(void *)(v0 + 1216));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 32))(v78, v77, v81);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 16))(v79, v78, v81);
      uint64_t v82 = sub_25A7F2EC0();
      os_log_type_t v83 = sub_25A7F3180();
      BOOL v84 = os_log_type_enabled(v82, v83);
      uint64_t v85 = *(void *)(v0 + 1000);
      uint64_t v86 = *(void *)(v0 + 984);
      uint64_t v87 = *(void *)(v0 + 976);
      if (v84)
      {
        uint64_t v88 = swift_slowAlloc();
        uint64_t v89 = swift_slowAlloc();
        v458[0] = v89;
        *(_DWORD *)uint64_t v88 = 136315138;
        sub_25A7F0F78(&qword_26A464618, MEMORY[0x263F61178]);
        uint64_t v90 = sub_25A7F3390();
        *(void *)(v88 + 4) = sub_25A7EED88(v90, v91, v458);
        swift_bridgeObjectRelease();
        uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
        v92(v85, v87);
        uint64_t v93 = v92;
        _os_log_impl(&dword_25A7B3000, v82, v83, "requestOneShot completionReason: %s", (uint8_t *)v88, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261145500](v89, -1, -1);
        MEMORY[0x261145500](v88, -1, -1);
      }
      else
      {

        uint64_t v205 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
        v205(v85, v87);
        uint64_t v93 = v205;
      }
      char v438 = *(unsigned char *)(v0 + 1540);
      uint64_t v206 = *(void *)(v0 + 992);
      uint64_t v207 = *(void *)(v0 + 976);
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 984) + 104))(v206, *(unsigned int *)(v0 + 1532), v207);
      char v208 = sub_25A7F2330();
      v93(v206, v207);
      swift_bridgeObjectRetain_n();
      uint64_t v209 = sub_25A7F2E50();
      sub_25A7F2E80();
      os_signpost_type_t v210 = sub_25A7F3220();
      v456 = v93;
      if (sub_25A7F3250())
      {
        os_signpost_type_t v423 = v210;
        char v431 = v208;
        int v211 = *(_DWORD *)(v0 + 1536);
        uint64_t v212 = *(void *)(v0 + 1192);
        uint64_t v213 = *(void *)(v0 + 1128);
        uint64_t v214 = *(void *)(v0 + 1120);
        swift_retain();
        sub_25A7F2EB0();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v213 + 88))(v212, v214) == v211)
        {
          char v215 = 0;
          char v216 = 0;
          v403 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1192), *(void *)(v0 + 1120));
          v403 = "token received requestIdentifier=%{public, signpost.description=attribute,public}s";
          char v216 = 2;
          char v215 = 1;
        }
        v411 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
        uint64_t v220 = (void *)(v0 + 1352);
        uint64_t v392 = *(void *)(v0 + 1248);
        uint64_t v398 = *(void *)(v0 + 1328);
        unint64_t v279 = *(void *)(v0 + 584);
        uint64_t v280 = *(void *)(v0 + 576);
        (*(void (**)(void))(v0 + 1448))(*(void *)(v0 + 1352));
        uint64_t v281 = swift_slowAlloc();
        uint64_t v282 = swift_slowAlloc();
        v458[0] = v282;
        *(unsigned char *)uint64_t v281 = v216;
        *(unsigned char *)(v281 + 1) = v215;
        *(_WORD *)(v281 + 2) = 2082;
        swift_bridgeObjectRetain();
        *(void *)(v281 + 4) = sub_25A7EED88(v280, v279, v458);
        swift_bridgeObjectRelease_n();
        os_signpost_id_t v283 = sub_25A7F2E10();
        _os_signpost_emit_with_name_impl(&dword_25A7B3000, v209, v423, v283, "requestOneShot", v403, (uint8_t *)v281, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261145500](v282, -1, -1);
        MEMORY[0x261145500](v281, -1, -1);

        v411(v398, v392);
        char v208 = v431;
      }
      else
      {
        uint64_t v220 = (void *)(v0 + 1328);
        swift_bridgeObjectRelease_n();
      }
      char v126 = v208 | v438;
      (*(void (**)(void, void))(v0 + 1472))(*v220, *(void *)(v0 + 1248));
      sub_25A7F2E50();
      sub_25A7F2E00();
      uint64_t v284 = sub_25A7F2E50();
      os_signpost_type_t v285 = sub_25A7F3230();
      if (sub_25A7F3250())
      {
        uint64_t v286 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
        uint64_t v287 = *(void *)(v0 + 1352);
        uint64_t v288 = *(void *)(v0 + 1248);
        (*(void (**)(uint64_t, void, uint64_t))(v0 + 1448))(v287, *(void *)(v0 + 1320), v288);
        uint64_t v289 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v289 = 0;
        os_signpost_id_t v290 = sub_25A7F2E10();
        _os_signpost_emit_with_name_impl(&dword_25A7B3000, v284, v285, v290, "requestOneShot", "extend token", v289, 2u);
        MEMORY[0x261145500](v289, -1, -1);

        v286(v287, v288);
      }
      else
      {
      }
      v417 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v291 = *(void *)(v0 + 1320);
      uint64_t v292 = *(void *)(v0 + 1248);
      uint64_t v443 = *(void *)(v0 + 1240);
      uint64_t v293 = *(void *)(v0 + 1224);
      uint64_t v432 = *(void *)(v0 + 1216);
      uint64_t v294 = *(void *)(v0 + 1008);
      uint64_t v295 = *(void *)(v0 + 976);
      (*(void (**)(void, uint64_t, uint64_t))(v0 + 1448))(*(void *)(v0 + 1352), v291, v292);
      swift_allocObject();
      uint64_t v125 = sub_25A7F2E90();
      swift_release();
      v417(v291, v292);
      v456(v294, v295);
      (*(void (**)(uint64_t, uint64_t))(v293 + 8))(v443, v432);
      goto LABEL_102;
    }
    uint64_t v132 = *(void *)(v0 + 1240);
    uint64_t v435 = *(void *)(v0 + 1232);
    uint64_t v133 = *(void *)(v0 + 1224);
    uint64_t v134 = *(void *)(v0 + 1216);
    uint64_t v135 = *(void *)(v0 + 680);
    uint64_t v421 = *(void *)(v0 + 672);
    swift_bridgeObjectRelease();
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    uint64_t v449 = swift_allocError();
    uint64_t v137 = v136;
    v458[0] = 0;
    v458[1] = 0xE000000000000000;
    sub_25A7F32B0();
    *(void *)(v0 + 344) = 0;
    *(void *)(v0 + 352) = 0xE000000000000000;
    sub_25A7F3060();
    sub_25A7F3060();
    sub_25A7F3060();
    sub_25A7F3320();
    swift_bridgeObjectRetain();
    sub_25A7C9EB8(MEMORY[0x263F8EE78]);
    os_signpost_id_t v138 = (void *)v449;
    sub_25A7F2C50();
    (*(void (**)(uint64_t, void, uint64_t))(v135 + 104))(v137, *MEMORY[0x263F56280], v421);
    swift_willThrow();
    uint64_t v139 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
    v139(v132, v134);
    v139(v435, v134);
    goto LABEL_74;
  }
  uint64_t v25 = *(void *)(v0 + 1408);
  uint64_t v26 = *(void *)(v0 + 1400);
  uint64_t v27 = *(void *)(v0 + 1232);
  uint64_t v28 = *(void *)(v0 + 1224);
  uint64_t v29 = *(void *)(v0 + 1216);
  uint64_t v419 = *(void *)(v0 + 1112);
  uint64_t v30 = *(void *)(v0 + 1104);
  uint64_t v31 = *(void *)(v0 + 1096);
  uint64_t v32 = *(void *)(v0 + 1088);
  uint64_t v33 = *(void *)(v0 + 1064);
  uint64_t v433 = *(void *)(v0 + 1080);
  v446 = *(void **)(v0 + 1056);
  sub_25A7BD1C4(v25, &qword_26A464370);
  (*(void (**)(uint64_t, uint64_t))(v28 + 96))(v27, v29);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464380);
  uint64_t v35 = v27 + *(int *)(v34 + 48);
  uint64_t v36 = v27 + *(int *)(v34 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v419, v27, v31);
  sub_25A7F08A0(v35, v26, &qword_26A464370);
  sub_25A7F08A0(v36, v32, &qword_26A464388);
  sub_25A7C7164(v26, v25, &qword_26A464370);
  sub_25A7C7164(v32, v433, &qword_26A464388);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v33 + 48))(v433, 1, v446) != 1)
  {
    uint64_t v127 = *(void *)(v0 + 1024);
    (*(void (**)(void, void, void))(*(void *)(v0 + 1064) + 32))(*(void *)(v0 + 1072), *(void *)(v0 + 1080), *(void *)(v0 + 1056));
    sub_25A7F24D0();
    uint64_t v128 = sub_25A7F24C0();
    uint64_t v129 = *(void *)(v128 - 8);
    int v130 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v129 + 48))(v127, 1, v128);
    uint64_t v131 = *(void *)(v0 + 1024);
    if (v130 == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 1024), &qword_26A4645D0);
    }
    else
    {
      sub_25A7F24B0();
      (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v131, v128);
    }
    uint64_t v217 = *(void *)(v0 + 1016);
    sub_25A7F2A60();
    sub_25A7F24E0();
    sub_25A7F24A0();
    sub_25A7F2200();
    uint64_t v218 = sub_25A7F21F0();
    uint64_t v219 = *(void *)(v218 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v219 + 48))(v217, 1, v218) == 1)
    {
      sub_25A7BD1C4(*(void *)(v0 + 1016), &qword_26A464588);
LABEL_95:
      uint64_t v296 = sub_25A7F24F0();
      int64_t v297 = *(void *)(v296 + 16);
      if (v297)
      {
        uint64_t v298 = (uint64_t *)(v0 + 520);
        *(void *)(v0 + 520) = MEMORY[0x263F8EE78];
        sub_25A7EF538(0, v297, 0);
        uint64_t v299 = 0;
        uint64_t v300 = *(void *)(v0 + 520);
        unint64_t v301 = *(void *)(v300 + 16);
        do
        {
          uint64_t v302 = *(int *)(v296 + 4 * v299 + 32);
          *uint64_t v298 = v300;
          unint64_t v303 = *(void *)(v300 + 24);
          if (v301 >= v303 >> 1)
          {
            sub_25A7EF538(v303 > 1, v301 + 1, 1);
            uint64_t v300 = *v298;
          }
          ++v299;
          *(void *)(v300 + 16) = v301 + 1;
          *(void *)(v300 + 8 * v301++ + 32) = v302;
        }
        while (v297 != v299);
      }
      swift_bridgeObjectRelease();
      v426 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 1424);
      uint64_t v412 = *(void *)(v0 + 1384);
      uint64_t v418 = *(void *)(v0 + 1416);
      uint64_t v304 = *(void *)(v0 + 1376);
      uint64_t v305 = *(void *)(v0 + 1224);
      uint64_t v399 = *(void *)(v0 + 1216);
      uint64_t v405 = *(void *)(v0 + 1240);
      uint64_t v387 = *(void *)(v0 + 1400);
      uint64_t v393 = *(void *)(v0 + 1112);
      uint64_t v306 = *(void *)(v0 + 1104);
      uint64_t v382 = *(void *)(v0 + 1096);
      uint64_t v307 = *(void *)(v0 + 1088);
      uint64_t v308 = *(void *)(v0 + 1072);
      uint64_t v309 = *(void *)(v0 + 1064);
      uint64_t v310 = *(void *)(v0 + 1056);
      sub_25A7C9EB8(MEMORY[0x263F8EE78]);
      sub_25A7F2A80();
      (*(void (**)(uint64_t, uint64_t))(v309 + 8))(v308, v310);
      sub_25A7BD1C4(v307, &qword_26A464388);
      sub_25A7BD1C4(v387, &qword_26A464370);
      (*(void (**)(uint64_t, uint64_t))(v306 + 8))(v393, v382);
      (*(void (**)(uint64_t, uint64_t))(v305 + 8))(v405, v399);
      sub_25A7BD1C4(v412, &qword_26A4645D8);
      v426(v304, 0, 1, v418);
      sub_25A7F08A0(v304, v412, &qword_26A4645D8);
      goto LABEL_101;
    }
    uint64_t v221 = *(void **)(v0 + 1512);
    sub_25A7F21E0();
    if (!v221)
    {
      (*(void (**)(void, uint64_t))(v219 + 8))(*(void *)(v0 + 1016), v218);
      goto LABEL_95;
    }
    uint64_t v439 = *(void *)(v0 + 1216);
    v451 = *(void **)(v0 + 1240);
    uint64_t v410 = *(void *)(v0 + 1112);
    uint64_t v416 = *(void *)(v0 + 1224);
    uint64_t v222 = *(void *)(v0 + 1104);
    uint64_t v397 = *(void *)(v0 + 1400);
    uint64_t v404 = *(void *)(v0 + 1096);
    uint64_t v386 = *(void *)(v0 + 1072);
    uint64_t v391 = *(void *)(v0 + 1088);
    uint64_t v223 = *(void *)(v0 + 1064);
    uint64_t v381 = *(void *)(v0 + 1056);
    uint64_t v224 = *(void *)(v0 + 1048);
    uint64_t v225 = *(void *)(v0 + 1040);
    uint64_t v226 = *(void *)(v0 + 1032);
    uint64_t v424 = *(void *)(v0 + 1016);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v225 + 8))(v224, v226);
    os_signpost_id_t v138 = v221;
    (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v386, v381);
    sub_25A7BD1C4(v391, &qword_26A464388);
    sub_25A7BD1C4(v397, &qword_26A464370);
    (*(void (**)(uint64_t, uint64_t))(v222 + 8))(v410, v404);
    (*(void (**)(void *, uint64_t))(v416 + 8))(v451, v439);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v219 + 8))(v424, v218);
LABEL_74:
    *(void *)(v0 + 512) = v138;
    id v227 = v138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464308);
    if (swift_dynamicCast())
    {
      uint64_t v228 = *(void *)(v0 + 704);
      uint64_t v229 = *(void *)(v0 + 696);
      uint64_t v230 = *(void *)(v0 + 688);
      uint64_t v231 = *(void *)(v0 + 680);
      uint64_t v232 = *(void *)(v0 + 672);
      MEMORY[0x261145390](v138);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v231 + 32))(v229, v228, v232);
      v452 = *(void (**)(uint64_t, uint64_t, uint64_t))(v231 + 16);
      v452(v230, v229, v232);
      swift_bridgeObjectRetain_n();
      uint64_t v233 = sub_25A7F2EC0();
      os_log_type_t v234 = sub_25A7F3190();
      BOOL v235 = os_log_type_enabled(v233, v234);
      uint64_t v236 = *(void *)(v0 + 688);
      uint64_t v237 = *(void *)(v0 + 680);
      uint64_t v238 = *(void *)(v0 + 672);
      unint64_t v239 = *(void *)(v0 + 584);
      if (v235)
      {
        uint64_t v425 = *(void *)(v0 + 688);
        uint64_t v240 = *(void *)(v0 + 576);
        uint64_t v241 = swift_slowAlloc();
        uint64_t v440 = swift_slowAlloc();
        v458[0] = v440;
        *(_DWORD *)uint64_t v241 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 464) = sub_25A7EED88(v240, v239, v458);
        sub_25A7F3270();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v241 + 12) = 2080;
        sub_25A7F0F78(&qword_26A4645F0, MEMORY[0x263F562C0]);
        uint64_t v242 = sub_25A7F3390();
        *(void *)(v0 + 472) = sub_25A7EED88(v242, v243, v458);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        uint64_t v244 = *(void (**)(uint64_t, uint64_t))(v237 + 8);
        v244(v425, v238);
        _os_log_impl(&dword_25A7B3000, v233, v234, "Oneshot request %s failed: %s", (uint8_t *)v241, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v440, -1, -1);
        MEMORY[0x261145500](v241, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v244 = *(void (**)(uint64_t, uint64_t))(v237 + 8);
        v244(v236, v238);
      }
      uint64_t v272 = *(void *)(v0 + 696);
      uint64_t v273 = *(void *)(v0 + 672);
      sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
      swift_allocError();
      v452(v274, v272, v273);
      swift_willThrow();
      swift_release();
      v244(v272, v273);
      MEMORY[0x261145390](*(void *)(v0 + 512));
      uint64_t v170 = sub_25A7F2E50();
      sub_25A7F2E80();
      os_signpost_type_t v171 = sub_25A7F3220();
      if ((sub_25A7F3250() & 1) == 0)
      {
        os_log_type_t v185 = (void *)(v0 + 1296);

        goto LABEL_57;
      }
      int v275 = *(_DWORD *)(v0 + 1536);
      uint64_t v276 = *(void *)(v0 + 1168);
      uint64_t v277 = *(void *)(v0 + 1128);
      uint64_t v278 = *(void *)(v0 + 1120);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v277 + 88))(v276, v278) == v275)
      {
        uint64_t v176 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1168), *(void *)(v0 + 1120));
        uint64_t v176 = "";
      }
      unint64_t v187 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
      os_log_type_t v185 = (void *)(v0 + 1352);
      uint64_t v189 = *(void *)(v0 + 1352);
      uint64_t v190 = *(void *)(v0 + 1296);
      goto LABEL_56;
    }
    MEMORY[0x261145390](*(void *)(v0 + 512));
    *(void *)(v0 + 408) = v138;
    id v245 = v138;
    if (swift_dynamicCast())
    {
      if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 656) + 88))(*(void *)(v0 + 664), *(void *)(v0 + 648)) == *MEMORY[0x263F61150])
      {
        uint64_t v246 = *(uint64_t **)(v0 + 664);
        uint64_t v247 = *(void *)(v0 + 656);
        uint64_t v248 = *(void *)(v0 + 648);
        MEMORY[0x261145390](v138);
        (*(void (**)(uint64_t *, uint64_t))(v247 + 96))(v246, v248);
        uint64_t v249 = *v246;
        uint64_t v250 = v246[1];
        os_log_type_t v251 = sub_25A7F2EC0();
        os_log_type_t v252 = sub_25A7F3170();
        if (os_log_type_enabled(v251, v252))
        {
          uint64_t v253 = swift_slowAlloc();
          *(_DWORD *)uint64_t v253 = 134218240;
          *(void *)(v0 + 448) = v249;
          sub_25A7F3270();
          *(_WORD *)(v253 + 12) = 2048;
          *(void *)(v0 + 456) = v250;
          sub_25A7F3270();
          _os_log_impl(&dword_25A7B3000, v251, v252, "Request failed with maxContextLengthReached. input token count:%ld and maximum allowed:%ld", (uint8_t *)v253, 0x16u);
          MEMORY[0x261145500](v253, -1, -1);
        }
        uint64_t v254 = *(void *)(v0 + 640);
        uint64_t v255 = v251;
        uint64_t v256 = v250;
        uint64_t v257 = *(void *)(v0 + 632);
        uint64_t v441 = *(void *)(v0 + 624);
        uint64_t v258 = *(void **)(v0 + 616);
        v453 = *(void **)(v0 + 608);
        uint64_t v259 = *(void *)(v0 + 600);
        uint64_t v260 = *(void *)(v0 + 592);

        sub_25A7F2650();
        uint64_t v261 = (char *)v258 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4644F0) + 64);
        *uint64_t v258 = v249;
        v258[1] = v256;
        (*(void (**)(char *, uint64_t, uint64_t))(v257 + 16))(v261, v254, v441);
        (*(void (**)(void *, void, uint64_t))(v259 + 104))(v258, *MEMORY[0x263F7F800], v260);
        uint64_t v262 = *(void (**)(void *, void *, uint64_t))(v259 + 16);
        v262(v453, v258, v260);
        uint64_t v263 = sub_25A7F2EC0();
        os_log_type_t v264 = sub_25A7F3170();
        BOOL v265 = os_log_type_enabled(v263, v264);
        uint64_t v266 = *(void **)(v0 + 608);
        uint64_t v267 = *(void *)(v0 + 600);
        uint64_t v268 = *(void *)(v0 + 592);
        if (v265)
        {
          v269 = (uint8_t *)swift_slowAlloc();
          v442 = (void *)swift_slowAlloc();
          *(_DWORD *)v269 = 138412290;
          sub_25A7F0F78(&qword_26A4645E8, MEMORY[0x263F7F830]);
          swift_allocError();
          v262(v270, v266, v268);
          uint64_t v271 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v0 + 440) = v271;
          sub_25A7F3270();
          void *v442 = v271;
          v457 = *(void (**)(uint64_t, uint64_t))(v267 + 8);
          v457((uint64_t)v266, v268);
          _os_log_impl(&dword_25A7B3000, v263, v264, "tokenGenerationError: %@", v269, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644E8);
          swift_arrayDestroy();
          MEMORY[0x261145500](v442, -1, -1);
          MEMORY[0x261145500](v269, -1, -1);
        }
        else
        {

          v457 = *(void (**)(uint64_t, uint64_t))(v267 + 8);
          v457((uint64_t)v266, v268);
        }
        uint64_t v359 = *(void *)(v0 + 640);
        uint64_t v360 = *(void *)(v0 + 632);
        uint64_t v361 = *(void *)(v0 + 624);
        uint64_t v362 = *(void *)(v0 + 616);
        uint64_t v363 = *(void *)(v0 + 592);
        sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
        swift_allocError();
        sub_25A7F2640();
        swift_willThrow();
        swift_release();
        v457(v362, v363);
        (*(void (**)(uint64_t, uint64_t))(v360 + 8))(v359, v361);
        MEMORY[0x261145390](*(void *)(v0 + 408));
        uint64_t v170 = sub_25A7F2E50();
        sub_25A7F2E80();
        os_signpost_type_t v171 = sub_25A7F3220();
        if ((sub_25A7F3250() & 1) == 0)
        {
          os_log_type_t v185 = (void *)(v0 + 1288);

          goto LABEL_57;
        }
        int v364 = *(_DWORD *)(v0 + 1536);
        uint64_t v365 = *(void *)(v0 + 1160);
        uint64_t v366 = *(void *)(v0 + 1128);
        uint64_t v367 = *(void *)(v0 + 1120);
        swift_retain();
        sub_25A7F2EB0();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v366 + 88))(v365, v367) == v364)
        {
          uint64_t v176 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1160), *(void *)(v0 + 1120));
          uint64_t v176 = "";
        }
        unint64_t v187 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
        uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
        os_log_type_t v185 = (void *)(v0 + 1352);
        uint64_t v189 = *(void *)(v0 + 1352);
        uint64_t v190 = *(void *)(v0 + 1288);
        goto LABEL_56;
      }
      (*(void (**)(void, void))(*(void *)(v0 + 656) + 8))(*(void *)(v0 + 664), *(void *)(v0 + 648));
    }
    MEMORY[0x261145390](*(void *)(v0 + 408));
    *(void *)(v0 + 400) = v138;
    id v313 = v138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645E0);
    if (swift_dynamicCast())
    {
      MEMORY[0x261145390](v138);
      sub_25A7EEEA0((long long *)(v0 + 264), v0 + 144);
      sub_25A7C56F4(v0 + 144, v0 + 304);
      sub_25A7C56F4(v0 + 144, v0 + 224);
      sub_25A7C56F4(v0 + 144, v0 + 184);
      uint64_t v314 = sub_25A7F2EC0();
      os_log_type_t v315 = sub_25A7F3170();
      if (os_log_type_enabled(v314, v315))
      {
        uint64_t v316 = swift_slowAlloc();
        uint64_t v454 = swift_slowAlloc();
        v458[0] = v454;
        *(_DWORD *)uint64_t v316 = 136315650;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 304), *(void *)(v0 + 328));
        os_log_type_t v444 = v315;
        uint64_t v317 = sub_25A7F2430();
        *(void *)(v0 + 416) = sub_25A7EED88(v317, v318, v458);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 304);
        *(_WORD *)(v316 + 12) = 2048;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 224), *(void *)(v0 + 248));
        uint64_t v319 = sub_25A7F2420();
        __swift_destroy_boxed_opaque_existential_1(v0 + 224);
        *(void *)(v0 + 424) = v319;
        sub_25A7F3270();
        *(_WORD *)(v316 + 22) = 2080;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 184), *(void *)(v0 + 208));
        uint64_t v320 = sub_25A7F2440();
        *(void *)(v0 + 432) = sub_25A7EED88(v320, v321, v458);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 184);
        _os_log_impl(&dword_25A7B3000, v314, v444, "Request failed with PrivateMLClientError: %s %ld %s", (uint8_t *)v316, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v454, -1, -1);
        MEMORY[0x261145500](v316, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1(v0 + 224);

        __swift_destroy_boxed_opaque_existential_1(v0 + 304);
        __swift_destroy_boxed_opaque_existential_1(v0 + 184);
      }
      sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
      swift_allocError();
      uint64_t v332 = v331;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
      sub_25A7F2440();
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
      sub_25A7F2430();
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
      id result = (id)sub_25A7F2420();
      if (!__OFADD__(result, 30000))
      {
        uint64_t v333 = *(void *)(v0 + 680);
        uint64_t v334 = *(void *)(v0 + 672);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25A7F46C0;
        *(void *)(inited + 32) = sub_25A7F3000();
        *(void *)(inited + 40) = v336;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
        *(void *)(inited + 48) = sub_25A7F33C0();
        *(void *)(inited + 56) = v337;
        sub_25A7C9EB8(inited);
        sub_25A7F2C50();
        (*(void (**)(uint64_t, void, uint64_t))(v333 + 104))(v332, *MEMORY[0x263F56280], v334);
        swift_willThrow();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1(v0 + 144);
        MEMORY[0x261145390](*(void *)(v0 + 400));
        uint64_t v170 = sub_25A7F2E50();
        sub_25A7F2E80();
        os_signpost_type_t v171 = sub_25A7F3220();
        if ((sub_25A7F3250() & 1) == 0)
        {
          os_log_type_t v185 = (void *)(v0 + 1280);

          goto LABEL_57;
        }
        int v338 = *(_DWORD *)(v0 + 1536);
        uint64_t v339 = *(void *)(v0 + 1152);
        uint64_t v340 = *(void *)(v0 + 1128);
        uint64_t v341 = *(void *)(v0 + 1120);
        swift_retain();
        sub_25A7F2EB0();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v340 + 88))(v339, v341) == v338)
        {
          uint64_t v176 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1152), *(void *)(v0 + 1120));
          uint64_t v176 = "";
        }
        unint64_t v187 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
        uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
        os_log_type_t v185 = (void *)(v0 + 1352);
        uint64_t v189 = *(void *)(v0 + 1352);
        uint64_t v190 = *(void *)(v0 + 1280);
        goto LABEL_56;
      }
      __break(1u);
    }
    else
    {
      MEMORY[0x261145390](*(void *)(v0 + 400));
      id v322 = v138;
      id v323 = v138;
      uint64_t v324 = sub_25A7F2EC0();
      os_log_type_t v325 = sub_25A7F3170();
      if (os_log_type_enabled(v324, v325))
      {
        uint64_t v326 = (uint8_t *)swift_slowAlloc();
        uint64_t v327 = swift_slowAlloc();
        v458[0] = v327;
        *(_DWORD *)uint64_t v326 = 136315138;
        *(void *)(v0 + 384) = v138;
        id v328 = v138;
        uint64_t v329 = sub_25A7F3040();
        *(void *)(v0 + 376) = sub_25A7EED88(v329, v330, v458);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        MEMORY[0x261145390](v138);
        MEMORY[0x261145390](v138);
        _os_log_impl(&dword_25A7B3000, v324, v325, "Request failed: %s", v326, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261145500](v327, -1, -1);
        MEMORY[0x261145500](v326, -1, -1);
      }
      else
      {

        MEMORY[0x261145390](v138);
        MEMORY[0x261145390](v138);
      }
      v455 = v138;
      v342 = (void *)sub_25A7F1FD0();
      sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
      swift_allocError();
      uint64_t v344 = v343;
      *(void *)(v0 + 392) = v138;
      id v345 = v138;
      sub_25A7F3040();
      id v346 = objc_msgSend(v342, sel_domain);
      sub_25A7F3000();

      id result = objc_msgSend(v342, sel_code);
      if (!__OFADD__(result, 40000))
      {
        uint64_t v347 = *(void *)(v0 + 680);
        uint64_t v348 = *(void *)(v0 + 672);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
        uint64_t v349 = swift_initStackObject();
        *(_OWORD *)(v349 + 16) = xmmword_25A7F46C0;
        *(void *)(v349 + 32) = sub_25A7F3000();
        *(void *)(v349 + 40) = v350;
        id v351 = objc_msgSend(v342, sel_description);
        uint64_t v352 = sub_25A7F3000();
        uint64_t v354 = v353;

        *(void *)(v349 + 48) = v352;
        *(void *)(v349 + 56) = v354;
        sub_25A7C9EB8(v349);
        sub_25A7F2C50();
        (*(void (**)(uint64_t, void, uint64_t))(v347 + 104))(v344, *MEMORY[0x263F56280], v348);
        swift_willThrow();
        swift_release();
        MEMORY[0x261145390](v455);

        uint64_t v170 = sub_25A7F2E50();
        sub_25A7F2E80();
        os_signpost_type_t v171 = sub_25A7F3220();
        if ((sub_25A7F3250() & 1) == 0)
        {
          os_log_type_t v185 = (void *)(v0 + 1272);

          goto LABEL_57;
        }
        int v355 = *(_DWORD *)(v0 + 1536);
        uint64_t v356 = *(void *)(v0 + 1144);
        uint64_t v357 = *(void *)(v0 + 1128);
        uint64_t v358 = *(void *)(v0 + 1120);
        swift_retain();
        sub_25A7F2EB0();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v357 + 88))(v356, v358) == v355)
        {
          uint64_t v176 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1144), *(void *)(v0 + 1120));
          uint64_t v176 = "";
        }
        unint64_t v187 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
        uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
        os_log_type_t v185 = (void *)(v0 + 1352);
        uint64_t v189 = *(void *)(v0 + 1352);
        uint64_t v190 = *(void *)(v0 + 1272);
        goto LABEL_56;
      }
    }
    __break(1u);
    return result;
  }
  uint64_t v37 = *(void *)(v0 + 1400);
  uint64_t v38 = *(void *)(v0 + 1240);
  uint64_t v39 = *(void *)(v0 + 1224);
  uint64_t v40 = *(void *)(v0 + 1216);
  uint64_t v41 = *(void *)(v0 + 1112);
  uint64_t v42 = *(void *)(v0 + 1104);
  uint64_t v43 = *(void *)(v0 + 1096);
  uint64_t v44 = *(void *)(v0 + 1080);
  sub_25A7BD1C4(*(void *)(v0 + 1088), &qword_26A464388);
  sub_25A7BD1C4(v37, &qword_26A464370);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
  sub_25A7BD1C4(v44, &qword_26A464388);
LABEL_101:
  char v126 = *(unsigned char *)(v0 + 1540);
  uint64_t v125 = *(void *)(v0 + 1496);
LABEL_102:
  *(unsigned char *)(v0 + 1540) = v126 & 1;
  *(void *)(v0 + 1496) = v125;
  uint64_t v311 = (void *)swift_task_alloc();
  *(void *)(v0 + 1504) = v311;
  *uint64_t v311 = v0;
  v311[1] = sub_25A7D9784;
  uint64_t v312 = *(void *)(v0 + 1208);
  return (id)sub_25A7C5C9C(v312);
}

id sub_25A7DD7C4()
{
  uint64_t v134 = v0;
  uint64_t v1 = *(void **)(v0 + 1512);
  *(void *)(v0 + 512) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464308);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 704);
    uint64_t v4 = *(void *)(v0 + 696);
    uint64_t v5 = *(void *)(v0 + 688);
    uint64_t v6 = *(void *)(v0 + 680);
    uint64_t v7 = *(void *)(v0 + 672);
    MEMORY[0x261145390](v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v4, v3, v7);
    uint64_t v128 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v128(v5, v4, v7);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_25A7F2EC0();
    os_log_type_t v9 = sub_25A7F3190();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = *(void *)(v0 + 688);
    uint64_t v12 = *(void *)(v0 + 680);
    uint64_t v13 = *(void *)(v0 + 672);
    unint64_t v14 = *(void *)(v0 + 584);
    if (v10)
    {
      uint64_t v123 = *(void *)(v0 + 688);
      uint64_t v15 = *(void *)(v0 + 576);
      uint64_t v16 = swift_slowAlloc();
      uint64_t v125 = swift_slowAlloc();
      v133[0] = v125;
      *(_DWORD *)uint64_t v16 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 464) = sub_25A7EED88(v15, v14, v133);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2080;
      sub_25A7F0F78(&qword_26A4645F0, MEMORY[0x263F562C0]);
      uint64_t v17 = sub_25A7F3390();
      *(void *)(v0 + 472) = sub_25A7EED88(v17, v18, v133);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v19(v123, v13);
      _os_log_impl(&dword_25A7B3000, v8, v9, "Oneshot request %s failed: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v125, -1, -1);
      MEMORY[0x261145500](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v19(v11, v13);
    }
    uint64_t v47 = *(void *)(v0 + 696);
    uint64_t v48 = *(void *)(v0 + 672);
    sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
    swift_allocError();
    v128(v49, v47, v48);
    swift_willThrow();
    swift_release();
    v19(v47, v48);
    MEMORY[0x261145390](*(void *)(v0 + 512));
    uint64_t v50 = sub_25A7F2E50();
    sub_25A7F2E80();
    os_signpost_type_t v51 = sub_25A7F3220();
    if (sub_25A7F3250())
    {
      int v52 = *(_DWORD *)(v0 + 1536);
      uint64_t v53 = *(void *)(v0 + 1168);
      uint64_t v54 = *(void *)(v0 + 1128);
      uint64_t v55 = *(void *)(v0 + 1120);
      swift_retain();
      sub_25A7F2EB0();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v54 + 88))(v53, v55) == v52)
      {
        uint64_t v56 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1168), *(void *)(v0 + 1120));
        uint64_t v56 = "";
      }
      uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
      uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
      unint64_t v57 = (void *)(v0 + 1352);
      uint64_t v78 = *(void *)(v0 + 1352);
      uint64_t v79 = *(void *)(v0 + 1296);
LABEL_46:
      uint64_t v117 = *(void *)(v0 + 1248);
      v77(v78, v79, v117);
      uint64_t v118 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v118 = 0;
      os_signpost_id_t v119 = sub_25A7F2E10();
      _os_signpost_emit_with_name_impl(&dword_25A7B3000, v50, v51, v119, "requestOneShot", v56, v118, 2u);
      MEMORY[0x261145500](v118, -1, -1);

      v76(v79, v117);
      goto LABEL_47;
    }
    unint64_t v57 = (void *)(v0 + 1296);

    goto LABEL_47;
  }
  MEMORY[0x261145390](*(void *)(v0 + 512));
  *(void *)(v0 + 408) = v1;
  id v20 = v1;
  if (!swift_dynamicCast())
  {
LABEL_16:
    MEMORY[0x261145390](*(void *)(v0 + 408));
    *(void *)(v0 + 400) = v1;
    id v58 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645E0);
    if (swift_dynamicCast())
    {
      MEMORY[0x261145390](v1);
      sub_25A7EEEA0((long long *)(v0 + 264), v0 + 144);
      sub_25A7C56F4(v0 + 144, v0 + 304);
      sub_25A7C56F4(v0 + 144, v0 + 224);
      sub_25A7C56F4(v0 + 144, v0 + 184);
      uint64_t v59 = sub_25A7F2EC0();
      os_log_type_t v60 = sub_25A7F3170();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc();
        uint64_t v131 = swift_slowAlloc();
        v133[0] = v131;
        *(_DWORD *)uint64_t v61 = 136315650;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 304), *(void *)(v0 + 328));
        os_log_type_t v127 = v60;
        uint64_t v62 = sub_25A7F2430();
        *(void *)(v0 + 416) = sub_25A7EED88(v62, v63, v133);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 304);
        *(_WORD *)(v61 + 12) = 2048;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 224), *(void *)(v0 + 248));
        uint64_t v64 = sub_25A7F2420();
        __swift_destroy_boxed_opaque_existential_1(v0 + 224);
        *(void *)(v0 + 424) = v64;
        sub_25A7F3270();
        *(_WORD *)(v61 + 22) = 2080;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 184), *(void *)(v0 + 208));
        uint64_t v65 = sub_25A7F2440();
        *(void *)(v0 + 432) = sub_25A7EED88(v65, v66, v133);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 184);
        _os_log_impl(&dword_25A7B3000, v59, v127, "Request failed with PrivateMLClientError: %s %ld %s", (uint8_t *)v61, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x261145500](v131, -1, -1);
        MEMORY[0x261145500](v61, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1(v0 + 224);

        __swift_destroy_boxed_opaque_existential_1(v0 + 304);
        __swift_destroy_boxed_opaque_existential_1(v0 + 184);
      }
      sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
      swift_allocError();
      uint64_t v81 = v80;
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
      sub_25A7F2440();
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
      sub_25A7F2430();
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
      id result = (id)sub_25A7F2420();
      if (!__OFADD__(result, 30000))
      {
        uint64_t v83 = *(void *)(v0 + 680);
        uint64_t v84 = *(void *)(v0 + 672);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25A7F46C0;
        *(void *)(inited + 32) = sub_25A7F3000();
        *(void *)(inited + 40) = v86;
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 144), *(void *)(v0 + 168));
        *(void *)(inited + 48) = sub_25A7F33C0();
        *(void *)(inited + 56) = v87;
        sub_25A7C9EB8(inited);
        sub_25A7F2C50();
        (*(void (**)(uint64_t, void, uint64_t))(v83 + 104))(v81, *MEMORY[0x263F56280], v84);
        swift_willThrow();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1(v0 + 144);
        MEMORY[0x261145390](*(void *)(v0 + 400));
        uint64_t v50 = sub_25A7F2E50();
        sub_25A7F2E80();
        os_signpost_type_t v51 = sub_25A7F3220();
        if (sub_25A7F3250())
        {
          int v88 = *(_DWORD *)(v0 + 1536);
          uint64_t v89 = *(void *)(v0 + 1152);
          uint64_t v90 = *(void *)(v0 + 1128);
          uint64_t v91 = *(void *)(v0 + 1120);
          swift_retain();
          sub_25A7F2EB0();
          swift_release();
          if ((*(unsigned int (**)(uint64_t, uint64_t))(v90 + 88))(v89, v91) == v88)
          {
            uint64_t v56 = "[Error] Interval already ended";
          }
          else
          {
            (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1152), *(void *)(v0 + 1120));
            uint64_t v56 = "";
          }
          uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
          uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
          unint64_t v57 = (void *)(v0 + 1352);
          uint64_t v78 = *(void *)(v0 + 1352);
          uint64_t v79 = *(void *)(v0 + 1280);
          goto LABEL_46;
        }
        unint64_t v57 = (void *)(v0 + 1280);

        goto LABEL_47;
      }
      __break(1u);
    }
    else
    {
      MEMORY[0x261145390](*(void *)(v0 + 400));
      id v67 = v1;
      id v68 = v1;
      uint64_t v69 = sub_25A7F2EC0();
      os_log_type_t v70 = sub_25A7F3170();
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v71 = (uint8_t *)swift_slowAlloc();
        v133[0] = swift_slowAlloc();
        uint64_t v72 = v133[0];
        *(_DWORD *)uint64_t v71 = 136315138;
        *(void *)(v0 + 384) = v1;
        id v73 = v1;
        uint64_t v74 = sub_25A7F3040();
        *(void *)(v0 + 376) = sub_25A7EED88(v74, v75, v133);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        MEMORY[0x261145390](v1);
        MEMORY[0x261145390](v1);
        _os_log_impl(&dword_25A7B3000, v69, v70, "Request failed: %s", v71, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261145500](v72, -1, -1);
        MEMORY[0x261145500](v71, -1, -1);
      }
      else
      {

        MEMORY[0x261145390](v1);
        MEMORY[0x261145390](v1);
      }
      uint64_t v92 = (void *)sub_25A7F1FD0();
      sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
      swift_allocError();
      uint64_t v132 = v93;
      *(void *)(v0 + 392) = v1;
      id v94 = v1;
      sub_25A7F3040();
      id v95 = objc_msgSend(v92, sel_domain);
      sub_25A7F3000();

      id result = objc_msgSend(v92, sel_code);
      if (!__OFADD__(result, 40000))
      {
        uint64_t v96 = *(void *)(v0 + 680);
        uint64_t v97 = *(void *)(v0 + 672);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
        uint64_t v98 = swift_initStackObject();
        *(_OWORD *)(v98 + 16) = xmmword_25A7F46C0;
        *(void *)(v98 + 32) = sub_25A7F3000();
        *(void *)(v98 + 40) = v99;
        id v100 = objc_msgSend(v92, sel_description);
        uint64_t v101 = sub_25A7F3000();
        uint64_t v103 = v102;

        *(void *)(v98 + 48) = v101;
        *(void *)(v98 + 56) = v103;
        sub_25A7C9EB8(v98);
        sub_25A7F2C50();
        (*(void (**)(uint64_t, void, uint64_t))(v96 + 104))(v132, *MEMORY[0x263F56280], v97);
        swift_willThrow();
        swift_release();
        MEMORY[0x261145390](v1);

        uint64_t v50 = sub_25A7F2E50();
        sub_25A7F2E80();
        os_signpost_type_t v51 = sub_25A7F3220();
        if (sub_25A7F3250())
        {
          int v104 = *(_DWORD *)(v0 + 1536);
          uint64_t v105 = *(void *)(v0 + 1144);
          uint64_t v106 = *(void *)(v0 + 1128);
          uint64_t v107 = *(void *)(v0 + 1120);
          swift_retain();
          sub_25A7F2EB0();
          swift_release();
          if ((*(unsigned int (**)(uint64_t, uint64_t))(v106 + 88))(v105, v107) == v104)
          {
            uint64_t v56 = "[Error] Interval already ended";
          }
          else
          {
            (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1144), *(void *)(v0 + 1120));
            uint64_t v56 = "";
          }
          uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
          uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
          unint64_t v57 = (void *)(v0 + 1352);
          uint64_t v78 = *(void *)(v0 + 1352);
          uint64_t v79 = *(void *)(v0 + 1272);
          goto LABEL_46;
        }
        unint64_t v57 = (void *)(v0 + 1272);

        goto LABEL_47;
      }
    }
    __break(1u);
    return result;
  }
  if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 656) + 88))(*(void *)(v0 + 664), *(void *)(v0 + 648)) != *MEMORY[0x263F61150])
  {
    (*(void (**)(void, void))(*(void *)(v0 + 656) + 8))(*(void *)(v0 + 664), *(void *)(v0 + 648));
    goto LABEL_16;
  }
  uint64_t v21 = *(uint64_t **)(v0 + 664);
  uint64_t v22 = *(void *)(v0 + 656);
  uint64_t v23 = *(void *)(v0 + 648);
  MEMORY[0x261145390](v1);
  (*(void (**)(uint64_t *, uint64_t))(v22 + 96))(v21, v23);
  uint64_t v24 = *v21;
  uint64_t v25 = v21[1];
  uint64_t v26 = sub_25A7F2EC0();
  os_log_type_t v27 = sub_25A7F3170();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 134218240;
    *(void *)(v0 + 448) = v24;
    sub_25A7F3270();
    *(_WORD *)(v28 + 12) = 2048;
    *(void *)(v0 + 456) = v25;
    sub_25A7F3270();
    _os_log_impl(&dword_25A7B3000, v26, v27, "Request failed with maxContextLengthReached. input token count:%ld and maximum allowed:%ld", (uint8_t *)v28, 0x16u);
    MEMORY[0x261145500](v28, -1, -1);
  }
  uint64_t v29 = *(void *)(v0 + 640);
  uint64_t v30 = *(void *)(v0 + 632);
  uint64_t v126 = *(void *)(v0 + 624);
  uint64_t v31 = *(void **)(v0 + 616);
  uint64_t v129 = *(void *)(v0 + 608);
  uint64_t v32 = *(void *)(v0 + 600);
  uint64_t v33 = v26;
  uint64_t v34 = v25;
  uint64_t v35 = *(void *)(v0 + 592);

  sub_25A7F2650();
  uint64_t v36 = (char *)v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4644F0) + 64);
  *uint64_t v31 = v24;
  v31[1] = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v36, v29, v126);
  (*(void (**)(void *, void, uint64_t))(v32 + 104))(v31, *MEMORY[0x263F7F800], v35);
  uint64_t v37 = *(void (**)(uint64_t, void *, uint64_t))(v32 + 16);
  v37(v129, v31, v35);
  uint64_t v38 = sub_25A7F2EC0();
  os_log_type_t v39 = sub_25A7F3170();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v41 = *(void **)(v0 + 608);
  uint64_t v42 = *(void *)(v0 + 600);
  uint64_t v43 = *(void *)(v0 + 592);
  if (v40)
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v124 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 138412290;
    sub_25A7F0F78(&qword_26A4645E8, MEMORY[0x263F7F830]);
    swift_allocError();
    v37(v45, v41, v43);
    uint64_t v46 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 440) = v46;
    sub_25A7F3270();
    void *v124 = v46;
    int v130 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v130((uint64_t)v41, v43);
    _os_log_impl(&dword_25A7B3000, v38, v39, "tokenGenerationError: %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644E8);
    swift_arrayDestroy();
    MEMORY[0x261145500](v124, -1, -1);
    MEMORY[0x261145500](v44, -1, -1);
  }
  else
  {

    int v130 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v130((uint64_t)v41, v43);
  }
  uint64_t v108 = *(void *)(v0 + 640);
  uint64_t v109 = *(void *)(v0 + 632);
  uint64_t v110 = *(void *)(v0 + 624);
  uint64_t v111 = *(void *)(v0 + 616);
  uint64_t v112 = *(void *)(v0 + 592);
  sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
  swift_allocError();
  sub_25A7F2640();
  swift_willThrow();
  swift_release();
  v130(v111, v112);
  (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v110);
  MEMORY[0x261145390](*(void *)(v0 + 408));
  uint64_t v50 = sub_25A7F2E50();
  sub_25A7F2E80();
  os_signpost_type_t v51 = sub_25A7F3220();
  if (sub_25A7F3250())
  {
    int v113 = *(_DWORD *)(v0 + 1536);
    uint64_t v114 = *(void *)(v0 + 1160);
    uint64_t v115 = *(void *)(v0 + 1128);
    uint64_t v116 = *(void *)(v0 + 1120);
    swift_retain();
    sub_25A7F2EB0();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v115 + 88))(v114, v116) == v113)
    {
      uint64_t v56 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 1128) + 8))(*(void *)(v0 + 1160), *(void *)(v0 + 1120));
      uint64_t v56 = "";
    }
    uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v0 + 1472);
    uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1448);
    unint64_t v57 = (void *)(v0 + 1352);
    uint64_t v78 = *(void *)(v0 + 1352);
    uint64_t v79 = *(void *)(v0 + 1288);
    goto LABEL_46;
  }
  unint64_t v57 = (void *)(v0 + 1288);

LABEL_47:
  uint64_t v120 = *(void *)(v0 + 1408);
  uint64_t v121 = *(void *)(v0 + 1384);
  (*(void (**)(void, void))(v0 + 1472))(*v57, *(void *)(v0 + 1248));
  sub_25A7F2560();
  sub_25A7BD1C4(v121, &qword_26A4645D8);
  sub_25A7BD1C4(v120, &qword_26A464370);
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
  uint64_t v122 = *(uint64_t (**)(void))(v0 + 8);
  return (id)v122();
}

uint64_t sub_25A7DEF84(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 560) = v7;
  *(void *)(v8 + 552) = a7;
  *(void *)(v8 + 544) = a6;
  *(void *)(v8 + 536) = a5;
  *(unsigned char *)(v8 + 832) = a4;
  *(void *)(v8 + 528) = a3;
  *(void *)(v8 + 520) = a2;
  *(void *)(v8 + 512) = a1;
  uint64_t v9 = sub_25A7F2660();
  *(void *)(v8 + 568) = v9;
  *(void *)(v8 + 576) = *(void *)(v9 - 8);
  *(void *)(v8 + 584) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2110();
  *(void *)(v8 + 592) = v10;
  *(void *)(v8 + 600) = *(void *)(v10 - 8);
  *(void *)(v8 + 608) = swift_task_alloc();
  *(void *)(v8 + 616) = type metadata accessor for PrivateMLClientAlertService();
  *(void *)(v8 + 624) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2C60();
  *(void *)(v8 + 632) = v11;
  *(void *)(v8 + 640) = *(void *)(v11 - 8);
  *(void *)(v8 + 648) = swift_task_alloc();
  *(void *)(v8 + 656) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2670();
  *(void *)(v8 + 664) = v12;
  *(void *)(v8 + 672) = *(void *)(v12 - 8);
  *(void *)(v8 + 680) = swift_task_alloc();
  uint64_t v13 = sub_25A7F2EE0();
  *(void *)(v8 + 688) = v13;
  *(void *)(v8 + 696) = *(void *)(v13 - 8);
  *(void *)(v8 + 704) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2FA0();
  *(void *)(v8 + 712) = v14;
  *(void *)(v8 + 720) = *(void *)(v14 - 8);
  *(void *)(v8 + 728) = swift_task_alloc();
  uint64_t v15 = sub_25A7F2E30();
  *(void *)(v8 + 736) = v15;
  *(void *)(v8 + 744) = *(void *)(v15 - 8);
  *(void *)(v8 + 752) = swift_task_alloc();
  *(void *)(v8 + 760) = swift_task_alloc();
  uint64_t v16 = sub_25A7F25C0();
  *(void *)(v8 + 768) = v16;
  *(void *)(v8 + 776) = *(void *)(v16 - 8);
  *(void *)(v8 + 784) = swift_task_alloc();
  sub_25A7F25E0();
  *(void *)(v8 + 792) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7DF360, 0, 0);
}

uint64_t sub_25A7DF360()
{
  uint64_t v36 = v0;
  uint64_t v1 = v0[98];
  uint64_t v2 = v0[97];
  uint64_t v3 = v0[96];
  sub_25A7F2610();
  uint64_t v4 = *(void *)(sub_25A7F2BB0() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v4 + 16))();
  sub_25A7C9EB8(MEMORY[0x263F8EE78]);
  sub_25A7F25B0();
  swift_task_dealloc();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F611E8], v3);
  sub_25A7F25D0();
  uint64_t v5 = sub_25A7F25F0();
  v0[100] = v5;
  uint64_t v6 = v5;
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25A7F2E50();
  os_signpost_type_t v8 = sub_25A7F3240();
  char v9 = sub_25A7F3250();
  uint64_t v10 = v0[95];
  if (v9)
  {
    uint64_t v30 = v0[94];
    os_signpost_type_t v31 = v8;
    uint64_t v11 = v0[93];
    uint64_t v33 = v0[92];
    unint64_t v12 = v0[66];
    uint64_t v13 = v0[65];
    (*(void (**)(void))(v11 + 16))();
    uint64_t v32 = v10;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v35 = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_bridgeObjectRetain();
    v0[63] = sub_25A7EED88(v13, v12, &v35);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v16 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v7, v31, v16, "executeWithPrivateMLClient", "PrivateMLClient created requestIdentifier=%{public, signpost.description=attribute,public}s)", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v15, -1, -1);
    MEMORY[0x261145500](v14, -1, -1);

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v32, v33);
    v17(v30, v33);
  }
  else
  {
    uint64_t v18 = v0[93];
    uint64_t v19 = v0[92];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v10, v19);
  }
  uint64_t v20 = v0[88];
  uint64_t v21 = v0[87];
  uint64_t v22 = v0[86];
  uint64_t v23 = v0[70];
  uint64_t v24 = (int *)v0[68];
  uint64_t v25 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v0[101] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v23 + v25, v22);
  swift_bridgeObjectRetain();
  sub_25A7F2B80();
  sub_25A7F2F70();
  uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v24 + *v24);
  uint64_t v26 = (void *)swift_task_alloc();
  v0[102] = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_25A7DF8B4;
  uint64_t v27 = v0[91];
  uint64_t v28 = v0[64];
  return v34(v28, v6, v27);
}

uint64_t sub_25A7DF8B4()
{
  *(void *)(*(void *)v1 + 824) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7F134C;
  }
  else {
    uint64_t v2 = sub_25A7F1350;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7DF9C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 560) = v7;
  *(void *)(v8 + 552) = a7;
  *(void *)(v8 + 544) = a6;
  *(void *)(v8 + 536) = a5;
  *(unsigned char *)(v8 + 832) = a4;
  *(void *)(v8 + 528) = a3;
  *(void *)(v8 + 520) = a2;
  *(void *)(v8 + 512) = a1;
  uint64_t v9 = sub_25A7F2660();
  *(void *)(v8 + 568) = v9;
  *(void *)(v8 + 576) = *(void *)(v9 - 8);
  *(void *)(v8 + 584) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2110();
  *(void *)(v8 + 592) = v10;
  *(void *)(v8 + 600) = *(void *)(v10 - 8);
  *(void *)(v8 + 608) = swift_task_alloc();
  *(void *)(v8 + 616) = type metadata accessor for PrivateMLClientAlertService();
  *(void *)(v8 + 624) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2C60();
  *(void *)(v8 + 632) = v11;
  *(void *)(v8 + 640) = *(void *)(v11 - 8);
  *(void *)(v8 + 648) = swift_task_alloc();
  *(void *)(v8 + 656) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2670();
  *(void *)(v8 + 664) = v12;
  *(void *)(v8 + 672) = *(void *)(v12 - 8);
  *(void *)(v8 + 680) = swift_task_alloc();
  uint64_t v13 = sub_25A7F2EE0();
  *(void *)(v8 + 688) = v13;
  *(void *)(v8 + 696) = *(void *)(v13 - 8);
  *(void *)(v8 + 704) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2FA0();
  *(void *)(v8 + 712) = v14;
  *(void *)(v8 + 720) = *(void *)(v14 - 8);
  *(void *)(v8 + 728) = swift_task_alloc();
  uint64_t v15 = sub_25A7F2E30();
  *(void *)(v8 + 736) = v15;
  *(void *)(v8 + 744) = *(void *)(v15 - 8);
  *(void *)(v8 + 752) = swift_task_alloc();
  *(void *)(v8 + 760) = swift_task_alloc();
  uint64_t v16 = sub_25A7F25C0();
  *(void *)(v8 + 768) = v16;
  *(void *)(v8 + 776) = *(void *)(v16 - 8);
  *(void *)(v8 + 784) = swift_task_alloc();
  sub_25A7F25E0();
  *(void *)(v8 + 792) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7DFDA4, 0, 0);
}

uint64_t sub_25A7DFDA4()
{
  uint64_t v36 = v0;
  uint64_t v1 = v0[98];
  uint64_t v2 = v0[97];
  uint64_t v3 = v0[96];
  sub_25A7F2610();
  uint64_t v4 = *(void *)(sub_25A7F2BB0() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v4 + 16))();
  sub_25A7C9EB8(MEMORY[0x263F8EE78]);
  sub_25A7F25B0();
  swift_task_dealloc();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F611E8], v3);
  sub_25A7F25D0();
  uint64_t v5 = sub_25A7F25F0();
  v0[100] = v5;
  uint64_t v6 = v5;
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25A7F2E50();
  os_signpost_type_t v8 = sub_25A7F3240();
  char v9 = sub_25A7F3250();
  uint64_t v10 = v0[95];
  if (v9)
  {
    uint64_t v30 = v0[94];
    os_signpost_type_t v31 = v8;
    uint64_t v11 = v0[93];
    uint64_t v33 = v0[92];
    unint64_t v12 = v0[66];
    uint64_t v13 = v0[65];
    (*(void (**)(void))(v11 + 16))();
    uint64_t v32 = v10;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v35 = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_bridgeObjectRetain();
    v0[63] = sub_25A7EED88(v13, v12, &v35);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v16 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v7, v31, v16, "executeWithPrivateMLClient", "PrivateMLClient created requestIdentifier=%{public, signpost.description=attribute,public}s)", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v15, -1, -1);
    MEMORY[0x261145500](v14, -1, -1);

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v32, v33);
    v17(v30, v33);
  }
  else
  {
    uint64_t v18 = v0[93];
    uint64_t v19 = v0[92];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v10, v19);
  }
  uint64_t v20 = v0[88];
  uint64_t v21 = v0[87];
  uint64_t v22 = v0[86];
  uint64_t v23 = v0[70];
  uint64_t v24 = (int *)v0[68];
  uint64_t v25 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v0[101] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v23 + v25, v22);
  swift_bridgeObjectRetain();
  sub_25A7F2B80();
  sub_25A7F2F70();
  uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v24 + *v24);
  uint64_t v26 = (void *)swift_task_alloc();
  v0[102] = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_25A7E02F8;
  uint64_t v27 = v0[91];
  uint64_t v28 = v0[64];
  return v34(v28, v6, v27);
}

uint64_t sub_25A7E02F8()
{
  *(void *)(*(void *)v1 + 824) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7E0554;
  }
  else {
    uint64_t v2 = sub_25A7E040C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7E040C()
{
  uint64_t v1 = v0[91];
  uint64_t v2 = v0[90];
  uint64_t v3 = v0[89];
  sub_25A7F2F90();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25A7E0554()
{
  os_log_type_t v234 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 53;
  uint64_t v3 = (void *)v0[103];
  v0[60] = v3;
  uint64_t v4 = sub_25A7F2B70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = swift_task_alloc();
  id v7 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464308);
  if (!swift_dynamicCast()) {
    goto LABEL_22;
  }
  unsigned int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v6, v4);
  unsigned int v9 = v8;
  if (!MEMORY[0x263F610C8] || v8 != *MEMORY[0x263F610C8])
  {
    if (MEMORY[0x263F610D0] && v8 == *MEMORY[0x263F610D0])
    {
      uint64_t v207 = v2;
      uint64_t v228 = v1;
      MEMORY[0x261145390](v1[103]);
      (*(void (**)(uint64_t, uint64_t))(v5 + 96))(v6, v4);
      uint64_t v21 = sub_25A7F2B60();
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v23 = swift_task_alloc();
      uint64_t v211 = v22;
      uint64_t v215 = v21;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v23, v6, v21);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A464508);
      uint64_t v24 = swift_task_alloc();
      uint64_t v219 = v23;
      sub_25A7F2B50();
      uint64_t v25 = swift_task_alloc();
      uint64_t v26 = *MEMORY[0x263F610C0];
      uint64_t v27 = sub_25A7F2B40();
      uint64_t v28 = *(void *)(v27 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 104))(v25, v26, v27);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464510) - 8;
      uint64_t v30 = swift_task_alloc();
      uint64_t v31 = v30 + *(int *)(v29 + 56);
      sub_25A7C7164(v24, v30, &qword_26A464508);
      sub_25A7C7164(v25, v31, &qword_26A464508);
      uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48);
      if (v32(v30, 1, v27) == 1)
      {
        sub_25A7BD1C4(v25, &qword_26A464508);
        sub_25A7BD1C4(v24, &qword_26A464508);
        int v33 = v32(v31, 1, v27);
        uint64_t v34 = v228;
        if (v33 == 1)
        {
          sub_25A7BD1C4(v30, &qword_26A464508);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
LABEL_63:
          swift_bridgeObjectRetain_n();
          uint64_t v157 = sub_25A7F2EC0();
          os_log_type_t v158 = sub_25A7F3190();
          BOOL v159 = os_log_type_enabled(v157, v158);
          uint64_t v160 = v34;
          unint64_t v161 = v34[66];
          if (v159)
          {
            uint64_t v162 = v160[65];
            uint64_t v163 = (uint8_t *)swift_slowAlloc();
            uint64_t v164 = swift_slowAlloc();
            v233[0] = v164;
            *(_DWORD *)uint64_t v163 = 136380675;
            swift_bridgeObjectRetain();
            v160[56] = sub_25A7EED88(v162, v161, v233);
            sub_25A7F3270();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_25A7B3000, v157, v158, "%{private}s failed because nodes are busy.", v163, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x261145500](v164, -1, -1);
            MEMORY[0x261145500](v163, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v165 = v160[91];
          uint64_t v166 = v160[90];
          uint64_t v231 = v160[89];
          uint64_t v167 = v160[80];
          uint64_t v168 = v160[79];
          sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
          swift_allocError();
          uint64_t v170 = v169;
          sub_25A7F2B30();
          sub_25A7C9EB8(MEMORY[0x263F8EE78]);
          sub_25A7F2C50();
          (*(void (**)(uint64_t, void, uint64_t))(v167 + 104))(v170, *MEMORY[0x263F56268], v168);
          swift_willThrow();
          (*(void (**)(uint64_t, uint64_t))(v211 + 8))(v219, v215);
          swift_task_dealloc();
          swift_task_dealloc();
          MEMORY[0x261145390](v160[60]);
          sub_25A7F2F90();
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v165, v231);
          uint64_t v1 = v160;
          goto LABEL_75;
        }
      }
      else
      {
        uint64_t v120 = swift_task_alloc();
        sub_25A7C7164(v30, v120, &qword_26A464508);
        if (v32(v31, 1, v27) != 1)
        {
          uint64_t v154 = swift_task_alloc();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v154, v31, v27);
          sub_25A7F0358(&qword_26A464518, MEMORY[0x270FBEDF8]);
          char v155 = sub_25A7F2FE0();
          unint64_t v156 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
          v156(v154, v27);
          sub_25A7BD1C4(v25, &qword_26A464508);
          sub_25A7BD1C4(v24, &qword_26A464508);
          v156(v120, v27);
          swift_task_dealloc();
          swift_task_dealloc();
          sub_25A7BD1C4(v30, &qword_26A464508);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v34 = v228;
          if (v155) {
            goto LABEL_63;
          }
LABEL_55:
          uint64_t v121 = swift_task_alloc();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v211 + 16))(v121, v219, v215);
          swift_bridgeObjectRetain_n();
          uint64_t v122 = sub_25A7F2EC0();
          os_log_type_t v123 = sub_25A7F3190();
          BOOL v124 = os_log_type_enabled(v122, v123);
          unint64_t v125 = v34[66];
          if (v124)
          {
            uint64_t v126 = v228[65];
            uint64_t v127 = swift_slowAlloc();
            uint64_t v128 = swift_slowAlloc();
            v233[0] = v128;
            *(_DWORD *)uint64_t v127 = 136380931;
            swift_bridgeObjectRetain();
            v228[54] = sub_25A7EED88(v126, v125, v233);
            sub_25A7F3270();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v127 + 12) = 2080;
            uint64_t v129 = sub_25A7F2B30();
            v228[55] = sub_25A7EED88(v129, v130, v233);
            uint64_t v34 = v228;
            sub_25A7F3270();
            swift_bridgeObjectRelease();
            uint64_t typea = *(void (**)(uint64_t, uint64_t))(v211 + 8);
            typea(v121, v215);
            _os_log_impl(&dword_25A7B3000, v122, v123, "%{private}s denied due to availability. availabilityInfo: %s", (uint8_t *)v127, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x261145500](v128, -1, -1);
            MEMORY[0x261145500](v127, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            uint64_t typea = *(void (**)(uint64_t, uint64_t))(v211 + 8);
            typea(v121, v215);
          }
          uint64_t v131 = v34[82];
          uint64_t v224 = v34[81];
          uint64_t v132 = v34[80];
          uint64_t v133 = v34[79];
          swift_task_dealloc();
          sub_25A7F2B30();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_25A7F46C0;
          *(void *)(inited + 32) = sub_25A7F3000();
          *(void *)(inited + 40) = v135;
          swift_bridgeObjectRetain();
          *(void *)(inited + 48) = sub_25A7F2B30();
          *(void *)(inited + 56) = v136;
          sub_25A7C9EB8(inited);
          sub_25A7F2C50();
          (*(void (**)(uint64_t, void, uint64_t))(v132 + 104))(v131, *MEMORY[0x263F56280], v133);
          char v208 = *(void (**)(uint64_t, uint64_t, uint64_t))(v132 + 16);
          v208(v224, v131, v133);
          uint64_t v137 = sub_25A7F2EC0();
          os_log_type_t v138 = sub_25A7F3190();
          BOOL v139 = os_log_type_enabled(v137, v138);
          uint64_t v140 = v34[81];
          uint64_t v141 = v34[80];
          uint64_t v142 = v34[79];
          if (v139)
          {
            uint64_t v143 = (uint8_t *)swift_slowAlloc();
            uint64_t v144 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v143 = 138412290;
            sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
            swift_allocError();
            v208(v145, v140, v142);
            uint64_t v146 = _swift_stdlib_bridgeErrorToNSError();
            *uint64_t v207 = v146;
            sub_25A7F3270();
            *uint64_t v144 = v146;
            os_log_type_t v147 = *(void (**)(uint64_t, uint64_t))(v141 + 8);
            v147(v140, v142);
            _os_log_impl(&dword_25A7B3000, v137, v138, "inferenceError: %@", v143, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644E8);
            swift_arrayDestroy();
            MEMORY[0x261145500](v144, -1, -1);
            MEMORY[0x261145500](v143, -1, -1);
          }
          else
          {

            os_log_type_t v147 = *(void (**)(uint64_t, uint64_t))(v141 + 8);
            v147(v140, v142);
          }
          uint64_t v148 = v228[91];
          uint64_t v149 = v228[90];
          uint64_t v150 = v228[89];
          uint64_t v151 = v228[82];
          uint64_t v152 = v228[79];
          sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
          swift_allocError();
          v208(v153, v151, v152);
          swift_willThrow();
          v147(v151, v152);
          uint64_t v1 = v228;
          typea(v219, v215);
          swift_task_dealloc();
          swift_task_dealloc();
          MEMORY[0x261145390](v228[60]);
          sub_25A7F2F90();
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v148, v150);
          goto LABEL_75;
        }
        sub_25A7BD1C4(v25, &qword_26A464508);
        sub_25A7BD1C4(v24, &qword_26A464508);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v120, v27);
        swift_task_dealloc();
        uint64_t v34 = v228;
      }
      sub_25A7BD1C4(v30, &qword_26A464510);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      goto LABEL_55;
    }
    if (MEMORY[0x263F610B8] && v8 == *MEMORY[0x263F610B8])
    {
      unsigned int v220 = v8;
      MEMORY[0x261145390](v1[103]);
      (*(void (**)(uint64_t, uint64_t))(v5 + 96))(v6, v4);
      uint64_t v35 = sub_25A7F2AB0();
      uint64_t v36 = *(void *)(v35 - 8);
      uint64_t v216 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v216, v6, v35);
      sub_25A7C1300();
      if ((sub_25A7F3200() & 1) == 0)
      {
LABEL_71:
        uint64_t v225 = v5;
        uint64_t v172 = swift_task_alloc();
        uint64_t v209 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
        v209(v172, v216, v35);
        swift_bridgeObjectRetain_n();
        uint64_t v173 = sub_25A7F2EC0();
        uint64_t v174 = v1;
        os_log_type_t v175 = sub_25A7F3190();
        BOOL v176 = os_log_type_enabled(v173, v175);
        unint64_t v177 = v1[66];
        if (v176)
        {
          os_log_type_t typeb = v175;
          uint64_t v178 = v1[65];
          uint64_t v179 = v36;
          uint64_t v180 = swift_slowAlloc();
          uint64_t v202 = swift_slowAlloc();
          v233[0] = v202;
          *(_DWORD *)uint64_t v180 = 136315394;
          swift_bridgeObjectRetain();
          v1[50] = sub_25A7EED88(v178, v177, v233);
          sub_25A7F3270();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v180 + 12) = 2080;
          sub_25A7F0358(&qword_26A4644F8, MEMORY[0x270FBEDD8]);
          uint64_t v181 = sub_25A7F3390();
          v1[51] = sub_25A7EED88(v181, v182, v233);
          sub_25A7F3270();
          swift_bridgeObjectRelease();
          uint64_t v232 = *(void (**)(uint64_t, uint64_t))(v179 + 8);
          v232(v172, v35);
          _os_log_impl(&dword_25A7B3000, v173, typeb, "%s failed due to network error. networkErrorInfo: %s", (uint8_t *)v180, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x261145500](v202, -1, -1);
          MEMORY[0x261145500](v180, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          uint64_t v232 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
          v232(v172, v35);
        }
        uint64_t v183 = v35;
        uint64_t v184 = v1[91];
        uint64_t v185 = v174[90];
        *(void *)typec = v174[89];
        uint64_t v186 = v174[85];
        uint64_t v187 = v174[84];
        uint64_t v199 = v174[83];
        uint64_t v188 = v174[70] + v174[101];
        swift_task_dealloc();
        logMetric(logger:name:startInstant:)(v188, 0xD000000000000015, 0x800000025A7F5430);
        sub_25A7F0358(&qword_26A4644F8, MEMORY[0x270FBEDD8]);
        sub_25A7F3390();
        sub_25A7F2F60();
        sub_25A7F0358(&qword_26A464500, MEMORY[0x270FBEE10]);
        swift_allocError();
        uint64_t v190 = v189;
        v209(v189, v216, v183);
        (*(void (**)(uint64_t, void, uint64_t))(v225 + 104))(v190, v220, v4);
        sub_25A7F2650();
        (*(void (**)(uint64_t, void, uint64_t))(v187 + 104))(v186, *MEMORY[0x263F7F7E8], v199);
        sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
        swift_allocError();
        sub_25A7F2640();
        swift_willThrow();
        (*(void (**)(uint64_t, uint64_t))(v187 + 8))(v186, v199);
        v232(v216, v183);
        swift_task_dealloc();
        swift_task_dealloc();
        MEMORY[0x261145390](v174[60]);
        sub_25A7F2F90();
        swift_release();
        (*(void (**)(uint64_t, os_log_type_t *))(v185 + 8))(v184, *(os_log_type_t **)typec);
        uint64_t v1 = v174;
        goto LABEL_75;
      }
      uint64_t v212 = v36;
      uint64_t v37 = sub_25A7F2EC0();
      os_log_type_t v38 = sub_25A7F3180();
      if (os_log_type_enabled(v37, v38))
      {
        os_log_type_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v39 = 0;
        _os_log_impl(&dword_25A7B3000, v37, v38, "Test No Network ttr.", v39, 2u);
        MEMORY[0x261145500](v39, -1, -1);
      }
      uint64_t v40 = v1[78];
      uint64_t v41 = v1[77];

      *(void *)(v40 + *(int *)(v41 + 20)) = 1547038;
      sub_25A7F2ED0();
      sub_25A7F32B0();
      swift_bridgeObjectRelease();
      v233[0] = 0xD000000000000030;
      v233[1] = 0x800000025A7F5450;
      sub_25A7F0358(&qword_26A4644F8, MEMORY[0x270FBEDD8]);
      sub_25A7F3390();
      sub_25A7F3060();
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_25A7F31F0();
      if (v43)
      {
        uint64_t v44 = v42;
        unint64_t v45 = v43;
        uint64_t v46 = v35;
        uint64_t v47 = HIBYTE(v43) & 0xF;
        if ((v43 & 0x2000000000000000) == 0) {
          uint64_t v47 = v42 & 0xFFFFFFFFFFFFLL;
        }
        if (v47)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A4641E8);
          uint64_t v48 = swift_allocObject();
          *(_OWORD *)(v48 + 16) = xmmword_25A7F46C0;
          *(void *)(v48 + 32) = v44;
          *(void *)(v48 + 40) = v45;
LABEL_70:
          uint64_t v171 = v1[78];
          sub_25A7C1578(0xD000000000000030, 0x800000025A7F5450, v1[65], v1[66], v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_25A7F055C(v171, (uint64_t (*)(void))type metadata accessor for PrivateMLClientAlertService);
          uint64_t v35 = v46;
          uint64_t v36 = v212;
          goto LABEL_71;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v46 = v35;
      }
      uint64_t v48 = MEMORY[0x263F8EE78];
      goto LABEL_70;
    }
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
LABEL_22:
    swift_task_dealloc();
    uint64_t v49 = (void *)v1[103];
    MEMORY[0x261145390](v1[60]);
    v1[59] = v49;
    id v50 = v49;
    if (swift_dynamicCast())
    {
      if ((*(unsigned int (**)(void, void))(v1[75] + 88))(v1[76], v1[74]) == *MEMORY[0x263F61150])
      {
        os_signpost_type_t v51 = (uint64_t *)v1[76];
        uint64_t v52 = v1[75];
        uint64_t v53 = v1[74];
        MEMORY[0x261145390](v1[103]);
        (*(void (**)(uint64_t *, uint64_t))(v52 + 96))(v51, v53);
        uint64_t v55 = *v51;
        uint64_t v54 = v51[1];
        swift_bridgeObjectRetain_n();
        uint64_t v56 = sub_25A7F2EC0();
        os_log_type_t v57 = sub_25A7F3190();
        BOOL v58 = os_log_type_enabled(v56, v57);
        unint64_t v59 = v1[66];
        uint64_t v226 = v54;
        if (v58)
        {
          uint64_t v60 = v1[65];
          uint64_t v221 = v55;
          uint64_t v61 = swift_slowAlloc();
          uint64_t v62 = v1;
          uint64_t v63 = swift_slowAlloc();
          v233[0] = v63;
          *(_DWORD *)uint64_t v61 = 136315650;
          swift_bridgeObjectRetain();
          v62[47] = sub_25A7EED88(v60, v59, v233);
          sub_25A7F3270();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v61 + 12) = 2048;
          uint64_t v64 = v221;
          v62[48] = v221;
          sub_25A7F3270();
          *(_WORD *)(v61 + 22) = 2048;
          v62[49] = v226;
          sub_25A7F3270();
          _os_log_impl(&dword_25A7B3000, v56, v57, "%s failed with maxContextLengthReached. input token count:%ld and maximum allowed:%ld", (uint8_t *)v61, 0x20u);
          swift_arrayDestroy();
          uint64_t v65 = v63;
          uint64_t v1 = v62;
          MEMORY[0x261145500](v65, -1, -1);
          MEMORY[0x261145500](v61, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          uint64_t v64 = v55;
        }
        uint64_t v217 = v1[91];
        uint64_t v84 = v1[90];
        uint64_t v230 = v1[89];
        uint64_t v85 = (void *)v1[85];
        uint64_t v86 = v1[84];
        uint64_t v87 = v1[83];
        uint64_t v88 = v1[73];
        uint64_t v89 = v1;
        uint64_t v90 = v1[72];
        uint64_t v91 = v89[71];
        sub_25A7F2650();
        uint64_t v92 = (char *)v85 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A4644F0) + 64);
        *uint64_t v85 = v64;
        v85[1] = v226;
        (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v92, v88, v91);
        (*(void (**)(void *, void, uint64_t))(v86 + 104))(v85, *MEMORY[0x263F7F800], v87);
        sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
        swift_allocError();
        sub_25A7F2640();
        swift_willThrow();
        (*(void (**)(void *, uint64_t))(v86 + 8))(v85, v87);
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v88, v91);
        uint64_t v1 = v89;
        MEMORY[0x261145390](v89[59]);
        sub_25A7F2F90();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v217, v230);
        goto LABEL_75;
      }
      (*(void (**)(void, void))(v1[75] + 8))(v1[76], v1[74]);
    }
    unint64_t v66 = (void *)v1[103];
    MEMORY[0x261145390](v1[59]);
    swift_bridgeObjectRetain();
    id v67 = v66;
    swift_bridgeObjectRetain();
    id v68 = v66;
    uint64_t v69 = sub_25A7F2EC0();
    os_log_type_t v70 = sub_25A7F3190();
    BOOL v71 = os_log_type_enabled(v69, v70);
    uint64_t v72 = (void *)v1[103];
    unint64_t v73 = v1[66];
    if (v71)
    {
      uint64_t v213 = v1[65];
      uint64_t v74 = swift_slowAlloc();
      uint64_t v229 = v1;
      unint64_t v75 = (void *)swift_slowAlloc();
      uint64_t v222 = swift_slowAlloc();
      v233[0] = v222;
      *(_DWORD *)uint64_t v74 = 136315394;
      swift_bridgeObjectRetain();
      v229[52] = sub_25A7EED88(v213, v73, v233);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v74 + 12) = 2112;
      id v76 = v72;
      uint64_t v77 = _swift_stdlib_bridgeErrorToNSError();
      v229[46] = v77;
      sub_25A7F3270();
      *unint64_t v75 = v77;
      MEMORY[0x261145390](v72);
      MEMORY[0x261145390](v72);
      _os_log_impl(&dword_25A7B3000, v69, v70, "%s failed to execute private ML request error: %@", (uint8_t *)v74, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644E8);
      swift_arrayDestroy();
      uint64_t v78 = v75;
      uint64_t v1 = v229;
      MEMORY[0x261145500](v78, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x261145500](v222, -1, -1);
      MEMORY[0x261145500](v74, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      MEMORY[0x261145390](v72);
      MEMORY[0x261145390](v72);
    }
    uint64_t v79 = (void *)v1[103];
    uint64_t v80 = v1[91];
    uint64_t v81 = v1[90];
    uint64_t v82 = v1[89];
    logMetric(logger:name:startInstant:)(v1[70] + v1[101], 0xD000000000000015, 0x800000025A7F5430);
    v1[57] = v79;
    id v83 = v79;
    sub_25A7F3040();
    sub_25A7F2F60();
    swift_willThrow();
    sub_25A7F2F90();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v80, v82);
    goto LABEL_75;
  }
  MEMORY[0x261145390](v1[103]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 96))(v6, v4);
  uint64_t v10 = sub_25A7F2B20();
  uint64_t v11 = *(void *)(v10 - 8);
  id v227 = v1;
  uint64_t v12 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v6, v10);
  uint64_t v210 = v11;
  uint64_t v214 = v10;
  uint64_t v197 = swift_task_alloc();
  os_log_type_t type = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  type(v197, v12, v10);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_25A7F2EC0();
  os_log_type_t v14 = sub_25A7F3190();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v16 = v1[66];
  uint64_t v223 = v5;
  unsigned int v218 = v9;
  if (v15)
  {
    uint64_t v17 = v1[65];
    uint64_t v18 = swift_slowAlloc();
    uint64_t v196 = swift_slowAlloc();
    v233[0] = v196;
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    v1[61] = sub_25A7EED88(v17, v16, v233);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    sub_25A7F0358(&qword_26A464528, MEMORY[0x270FBEDE8]);
    uint64_t v19 = sub_25A7F3390();
    v1[62] = sub_25A7EED88(v19, v20, v233);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v197, v214);
    _os_log_impl(&dword_25A7B3000, v13, v14, "%s denied request due to rate limit. rateLimitInfo: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261145500](v196, -1, -1);
    MEMORY[0x261145500](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v197, v214);
  }
  uint64_t v198 = v1[91];
  uint64_t v200 = v1[90];
  uint64_t v201 = v1[89];
  uint64_t v193 = v1[85];
  uint64_t v194 = v1[84];
  uint64_t v195 = v1[83];
  uint64_t v93 = v1[70] + v1[101];
  swift_task_dealloc();
  logMetric(logger:name:startInstant:)(v93, 0xD000000000000015, 0x800000025A7F5430);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BBE8);
  uint64_t v94 = swift_initStackObject();
  *(_OWORD *)(v94 + 16) = xmmword_25A7F46D0;
  *(void *)(v94 + 32) = 0x4449656C646E7562;
  *(void *)(v94 + 40) = 0xE800000000000000;
  uint64_t v95 = sub_25A7F2AF0();
  if (v96) {
    uint64_t v97 = v95;
  }
  else {
    uint64_t v97 = 0;
  }
  unint64_t v98 = 0xE000000000000000;
  if (v96) {
    unint64_t v98 = v96;
  }
  *(void *)(v94 + 48) = v97;
  *(void *)(v94 + 56) = v98;
  *(void *)(v94 + 64) = 0x4965727574616566;
  *(void *)(v94 + 72) = 0xE900000000000044;
  uint64_t v99 = sub_25A7F2B10();
  if (v100) {
    uint64_t v101 = v99;
  }
  else {
    uint64_t v101 = 0;
  }
  if (v100) {
    unint64_t v102 = v100;
  }
  else {
    unint64_t v102 = 0xE000000000000000;
  }
  *(void *)(v94 + 80) = v101;
  *(void *)(v94 + 88) = v102;
  strcpy((char *)(v94 + 96), "workloadType");
  *(unsigned char *)(v94 + 109) = 0;
  *(_WORD *)(v94 + 110) = -5120;
  uint64_t v103 = sub_25A7F2AC0();
  if (v104) {
    uint64_t v105 = v103;
  }
  else {
    uint64_t v105 = 0;
  }
  if (v104) {
    unint64_t v106 = v104;
  }
  else {
    unint64_t v106 = 0xE000000000000000;
  }
  *(void *)(v94 + 112) = v105;
  *(void *)(v94 + 120) = v106;
  *(void *)(v94 + 128) = 0x746E756F63;
  *(void *)(v94 + 136) = 0xE500000000000000;
  v1[58] = sub_25A7F2AE0();
  *(void *)(v94 + 144) = sub_25A7F3390();
  *(void *)(v94 + 152) = v107;
  *(void *)(v94 + 160) = 0x6E6F697461727564;
  *(void *)(v94 + 168) = 0xE800000000000000;
  v1[44] = 0;
  v1[45] = 0xE000000000000000;
  sub_25A7F2B00();
  sub_25A7F3140();
  uint64_t v108 = v1[45];
  *(void *)(v94 + 176) = v1[44];
  *(void *)(v94 + 184) = v108;
  strcpy((char *)(v94 + 192), "retryAfterDate");
  *(unsigned char *)(v94 + 207) = -18;
  uint64_t v109 = sub_25A7F2050();
  uint64_t v110 = *(void *)(v109 - 8);
  uint64_t v111 = swift_task_alloc();
  sub_25A7F2AD0();
  sub_25A7F0358(&qword_26A464520, MEMORY[0x270FA9198]);
  uint64_t v112 = sub_25A7F3390();
  uint64_t v114 = v113;
  uint64_t v115 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
  v115(v111, v109);
  swift_task_dealloc();
  *(void *)(v94 + 208) = v112;
  *(void *)(v94 + 216) = v114;
  uint64_t v1 = v227;
  *(void *)(v94 + 224) = 0xD00000000000001ELL;
  *(void *)(v94 + 232) = 0x800000025A7F5490;
  v227[42] = 0;
  v227[43] = 0xE000000000000000;
  uint64_t v116 = swift_task_alloc();
  sub_25A7F2AD0();
  sub_25A7F2020();
  v115(v116, v109);
  sub_25A7F3140();
  swift_task_dealloc();
  uint64_t v117 = v227[43];
  *(void *)(v94 + 240) = v227[42];
  *(void *)(v94 + 248) = v117;
  sub_25A7C9EB8(v94);
  swift_bridgeObjectRelease();
  sub_25A7F0358(&qword_26A464500, MEMORY[0x270FBEE10]);
  swift_allocError();
  uint64_t v119 = v118;
  type(v118, v12, v214);
  (*(void (**)(uint64_t, void, uint64_t))(v223 + 104))(v119, v218, v4);
  sub_25A7F2650();
  (*(void (**)(uint64_t, void, uint64_t))(v194 + 104))(v193, *MEMORY[0x263F7F7F8], v195);
  sub_25A7F0F78(&qword_26A4644E0, MEMORY[0x263F562C0]);
  swift_allocError();
  sub_25A7F2640();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v193, v195);
  (*(void (**)(uint64_t, uint64_t))(v210 + 8))(v12, v214);
  swift_task_dealloc();
  swift_task_dealloc();
  MEMORY[0x261145390](v227[60]);
  sub_25A7F2F90();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v198, v201);
LABEL_75:
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
  uint64_t v191 = (uint64_t (*)(void))v1[1];
  return v191();
}

uint64_t sub_25A7E294C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 160) = v24;
  *(void *)(v8 + 168) = v25;
  *(_OWORD *)(v8 + 144) = v23;
  *(void *)(v8 + 128) = a7;
  *(void *)(v8 + 136) = a8;
  *(void *)(v8 + 112) = a5;
  *(void *)(v8 + 120) = a6;
  *(void *)(v8 + 96) = a3;
  *(void *)(v8 + 104) = a4;
  *(void *)(v8 + 80) = a1;
  *(void *)(v8 + 88) = a2;
  uint64_t v9 = sub_25A7F2BF0();
  *(void *)(v8 + 176) = v9;
  *(void *)(v8 + 184) = *(void *)(v9 - 8);
  *(void *)(v8 + 192) = swift_task_alloc();
  *(void *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464540);
  *(void *)(v8 + 208) = swift_task_alloc();
  uint64_t v10 = sub_25A7F29E0();
  *(void *)(v8 + 216) = v10;
  *(void *)(v8 + 224) = *(void *)(v10 - 8);
  *(void *)(v8 + 232) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2A50();
  *(void *)(v8 + 240) = v11;
  *(void *)(v8 + 248) = *(void *)(v11 - 8);
  *(void *)(v8 + 256) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2E30();
  *(void *)(v8 + 264) = v12;
  *(void *)(v8 + 272) = *(void *)(v12 - 8);
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 288) = swift_task_alloc();
  uint64_t v13 = sub_25A7F2EE0();
  *(void *)(v8 + 296) = v13;
  *(void *)(v8 + 304) = *(void *)(v13 - 8);
  *(void *)(v8 + 312) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2DC0();
  *(void *)(v8 + 320) = v14;
  *(void *)(v8 + 328) = *(void *)(v14 - 8);
  *(void *)(v8 + 336) = swift_task_alloc();
  *(void *)(v8 + 344) = swift_task_alloc();
  uint64_t v15 = sub_25A7F23D0();
  *(void *)(v8 + 352) = v15;
  *(void *)(v8 + 360) = *(void *)(v15 - 8);
  *(void *)(v8 + 368) = swift_task_alloc();
  uint64_t v16 = sub_25A7F2920();
  *(void *)(v8 + 376) = v16;
  *(void *)(v8 + 384) = *(void *)(v16 - 8);
  *(void *)(v8 + 392) = swift_task_alloc();
  uint64_t v17 = sub_25A7F2890();
  *(void *)(v8 + 400) = v17;
  *(void *)(v8 + 408) = *(void *)(v17 - 8);
  *(void *)(v8 + 416) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464548);
  *(void *)(v8 + 424) = swift_task_alloc();
  *(void *)(v8 + 432) = swift_task_alloc();
  *(void *)(v8 + 440) = swift_task_alloc();
  *(void *)(v8 + 448) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464550);
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  uint64_t v18 = sub_25A7F2AA0();
  *(void *)(v8 + 472) = v18;
  *(void *)(v8 + 480) = *(void *)(v18 - 8);
  *(void *)(v8 + 488) = swift_task_alloc();
  *(void *)(v8 + 496) = swift_task_alloc();
  *(void *)(v8 + 504) = swift_task_alloc();
  uint64_t v19 = sub_25A7F2850();
  *(void *)(v8 + 512) = v19;
  *(void *)(v8 + 520) = *(void *)(v19 - 8);
  *(void *)(v8 + 528) = swift_task_alloc();
  *(void *)(v8 + 536) = swift_task_alloc();
  uint64_t v20 = sub_25A7F26C0();
  *(void *)(v8 + 544) = v20;
  *(void *)(v8 + 552) = *(void *)(v20 - 8);
  *(void *)(v8 + 560) = swift_task_alloc();
  *(void *)(v8 + 568) = swift_task_alloc();
  *(void *)(v8 + 576) = swift_task_alloc();
  *(void *)(v8 + 584) = swift_task_alloc();
  *(void *)(v8 + 592) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7E2F78, 0, 0);
}

uint64_t sub_25A7E2F78()
{
  uint64_t v197 = v0;
  sub_25A7F0F78(&qword_26A464558, MEMORY[0x263F7F8B8]);
  sub_25A7F26A0();
  uint64_t v1 = *(void *)(v0 + 592);
  uint64_t v2 = *(void *)(v0 + 584);
  uint64_t v3 = *(void *)(v0 + 552);
  uint64_t v4 = *(void *)(v0 + 544);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 184) + 56);
  v5(*(void *)(v0 + 448), 1, 1, *(void *)(v0 + 176));
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v7 == *MEMORY[0x263F7F898])
  {
    v6(*(void *)(v0 + 576), *(void *)(v0 + 592), *(void *)(v0 + 544));
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_25A7F2EC0();
    os_log_type_t v9 = sub_25A7F3190();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = *(void *)(v0 + 576);
    if (!v10)
    {
      uint64_t v31 = *(void *)(v0 + 552);
      uint64_t v32 = *(void *)(v0 + 544);

      swift_bridgeObjectRelease_n();
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v18(v11, v32);
      goto LABEL_16;
    }
    os_log_type_t v184 = v9;
    uint64_t v12 = *(void *)(v0 + 552);
    uint64_t v170 = *(void *)(v0 + 560);
    uint64_t v173 = *(void *)(v0 + 544);
    uint64_t v166 = *(void *)(v0 + 576);
    uint64_t v14 = *(void *)(v0 + 128);
    unint64_t v13 = *(void *)(v0 + 136);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v179 = swift_slowAlloc();
    v196[0] = v179;
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_25A7EED88(v14, v13, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    v6(v170, v166, v173);
    uint64_t v16 = sub_25A7F3040();
    *(void *)(v0 + 64) = sub_25A7EED88(v16, v17, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v18(v166, v173);
    _os_log_impl(&dword_25A7B3000, v8, v184, "%s received unkown request payload %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261145500](v179, -1, -1);
    uint64_t v19 = v15;
    goto LABEL_15;
  }
  if (v7 == *MEMORY[0x263F7F8A0])
  {
    uint64_t v20 = *(void *)(v0 + 584);
    uint64_t v22 = *(void *)(v0 + 408);
    uint64_t v21 = *(void *)(v0 + 416);
    uint64_t v23 = *(void *)(v0 + 400);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 552) + 96))(v20, *(void *)(v0 + 544));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v21, v20, v23);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_25A7F2EC0();
    os_log_type_t v25 = sub_25A7F31A0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    unint64_t v27 = *(void *)(v0 + 136);
    if (v26)
    {
      uint64_t v28 = *(void *)(v0 + 128);
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v196[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_25A7EED88(v28, v27, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v24, v25, "%s received complete prompt request", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v30, -1, -1);
      MEMORY[0x261145500](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v45 = *(void *)(v0 + 408);
    uint64_t v44 = *(void *)(v0 + 416);
    uint64_t v46 = *(void *)(v0 + 400);
    uint64_t v47 = *(void **)(v0 + 144);
    sub_25A7F2880();
    sub_25A7F2860();
    sub_25A7F2870();
    __swift_project_boxed_opaque_existential_1(v47, v47[3]);
    sub_25A7F2A00();
    sub_25A7F2510();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  }
  else
  {
    if (v7 != *MEMORY[0x263F7F8A8])
    {
      v6(*(void *)(v0 + 568), *(void *)(v0 + 592), *(void *)(v0 + 544));
      swift_bridgeObjectRetain_n();
      uint64_t v48 = sub_25A7F2EC0();
      os_log_type_t v49 = sub_25A7F3190();
      BOOL v50 = os_log_type_enabled(v48, v49);
      uint64_t v51 = *(void *)(v0 + 568);
      if (!v50)
      {
        uint64_t v71 = *(void *)(v0 + 552);
        uint64_t v72 = *(void *)(v0 + 544);

        swift_bridgeObjectRelease_n();
        uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
        v18(v51, v72);
LABEL_16:
        uint64_t v59 = *(void *)(v0 + 592);
        uint64_t v60 = *(void *)(v0 + 584);
        uint64_t v61 = *(void *)(v0 + 544);
        uint64_t v62 = *(void *)(v0 + 448);
        sub_25A7F03B0();
        swift_allocError();
        unsigned char *v63 = 2;
        swift_willThrow();
        sub_25A7BD1C4(v62, &qword_26A464548);
        v18(v59, v61);
        v18(v60, v61);
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v95 = *(uint64_t (**)(void))(v0 + 8);
        return v95();
      }
      uint64_t v180 = v48;
      uint64_t v52 = *(void *)(v0 + 560);
      uint64_t v53 = *(void *)(v0 + 552);
      uint64_t v174 = *(void *)(v0 + 544);
      uint64_t v54 = *(void *)(v0 + 128);
      unint64_t v55 = *(void *)(v0 + 136);
      uint64_t v167 = *(void *)(v0 + 568);
      uint64_t v56 = swift_slowAlloc();
      uint64_t v191 = swift_slowAlloc();
      v196[0] = v191;
      *(_DWORD *)uint64_t v56 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 16) = sub_25A7EED88(v54, v55, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v56 + 12) = 2080;
      v6(v52, v167, v174);
      uint64_t v57 = sub_25A7F3040();
      *(void *)(v0 + 24) = sub_25A7EED88(v57, v58, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v18(v167, v174);
      uint64_t v8 = v180;
      _os_log_impl(&dword_25A7B3000, v180, v49, "%s received unkown request payload %s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v191, -1, -1);
      uint64_t v19 = v56;
LABEL_15:
      MEMORY[0x261145500](v19, -1, -1);

      goto LABEL_16;
    }
    uint64_t v33 = *(void *)(v0 + 584);
    uint64_t v35 = *(void *)(v0 + 384);
    uint64_t v34 = *(void *)(v0 + 392);
    uint64_t v36 = *(void *)(v0 + 376);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 552) + 96))(v33, *(void *)(v0 + 544));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v34, v33, v36);
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_25A7F2EC0();
    os_log_type_t v38 = sub_25A7F31A0();
    BOOL v39 = os_log_type_enabled(v37, v38);
    unint64_t v40 = *(void *)(v0 + 136);
    if (v39)
    {
      uint64_t v185 = *(void *)(v0 + 128);
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v196[0] = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 48) = sub_25A7EED88(v185, v40, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v37, v38, "%s received completePromptTemplate request", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v42, -1, -1);
      MEMORY[0x261145500](v41, -1, -1);
    }
    else
    {

      uint64_t v43 = swift_bridgeObjectRelease_n();
    }
    uint64_t v64 = *(void *)(v0 + 472);
    uint64_t v65 = *(void *)(v0 + 480);
    uint64_t v66 = *(void *)(v0 + 208);
    MEMORY[0x261144550](v43);
    int v67 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v66, 1, v64);
    uint64_t v68 = *(void *)(v0 + 480);
    if (v67 == 1)
    {
      uint64_t v69 = *(void *)(v0 + 208);
      sub_25A7F2A10();
      sub_25A7BD1C4(v69, &qword_26A464540);
      os_log_type_t v70 = *(void (**)(void, void, void))(v68 + 32);
    }
    else
    {
      unint64_t v73 = *(void (**)(void, void, void))(v68 + 32);
      v73(*(void *)(v0 + 488), *(void *)(v0 + 208), *(void *)(v0 + 472));
      os_log_type_t v70 = v73;
    }
    uint64_t v74 = *(void *)(v0 + 448);
    uint64_t v75 = *(void *)(v0 + 432);
    uint64_t v76 = *(void *)(v0 + 184);
    uint64_t v186 = *(void *)(v0 + 176);
    uint64_t v192 = *(void *)(v0 + 424);
    v70(*(void *)(v0 + 504), *(void *)(v0 + 488), *(void *)(v0 + 472));
    sub_25A7F28F0();
    sub_25A7F2900();
    sub_25A7F28E0();
    sub_25A7BD1C4(v74, &qword_26A464548);
    v5(v75, 0, 1, v186);
    sub_25A7F08A0(v75, v74, &qword_26A464548);
    sub_25A7C7164(v74, v192, &qword_26A464548);
    int v77 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v192, 1, v186);
    uint64_t v78 = *(void *)(v0 + 424);
    uint64_t v79 = *(void *)(v0 + 384);
    uint64_t v80 = *(void *)(v0 + 376);
    if (v77 == 1)
    {
      (*(void (**)(void, void))(v79 + 8))(*(void *)(v0 + 392), *(void *)(v0 + 376));
      sub_25A7BD1C4(v78, &qword_26A464548);
    }
    else
    {
      uint64_t v82 = *(void *)(v0 + 192);
      uint64_t v81 = *(void *)(v0 + 200);
      uint64_t v84 = *(void *)(v0 + 176);
      uint64_t v83 = *(void *)(v0 + 184);
      uint64_t v85 = *(void **)(v0 + 144);
      uint64_t v193 = *(void *)(v0 + 392);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v81, v78, v84);
      __swift_project_boxed_opaque_existential_1(v85, v85[3]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v82, v81, v84);
      sub_25A7F3040();
      sub_25A7F2510();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v81, v84);
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v193, v80);
    }
  }
  uint64_t v163 = *(void *)(v0 + 536);
  uint64_t v159 = *(void *)(v0 + 528);
  uint64_t v86 = *(void *)(v0 + 520);
  uint64_t v87 = *(void *)(v0 + 504);
  uint64_t v161 = *(void *)(v0 + 512);
  uint64_t v88 = *(void *)(v0 + 496);
  uint64_t v89 = *(void *)(v0 + 472);
  uint64_t v90 = *(void *)(v0 + 480);
  uint64_t v160 = *(void *)(v0 + 464);
  uint64_t v158 = *(void *)(v0 + 456);
  uint64_t v164 = *(void *)(v0 + 440);
  uint64_t v168 = *(void *)(v0 + 448);
  uint64_t v187 = *(void *)(v0 + 344);
  uint64_t v194 = *(void *)(v0 + 368);
  uint64_t v91 = *(void *)(v0 + 304);
  os_log_type_t v175 = *(char **)(v0 + 312);
  uint64_t v181 = *(void *)(v0 + 296);
  unint64_t v92 = *(void *)(v0 + 112);
  uint64_t v162 = *(void *)(v0 + 120);
  uint64_t v93 = *(void *)(v0 + 104);
  uint64_t v157 = *(void (**)(void))(*(void *)(v0 + 328) + 16);
  v157();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v88, v87, v89);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v159, v163, v161);
  sub_25A7C7164(v160, v158, &qword_26A464550);
  sub_25A7C7164(v168, v164, &qword_26A464548);
  uint64_t v94 = v162 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v175, v162 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, v181);
  sub_25A7F0404(v93, v92);
  sub_25A7E6B7C(v93, v92, v187, v88, v159, v158, v164, v175, v194);
  uint64_t v97 = *(void *)(v0 + 336);
  uint64_t v98 = *(void *)(v0 + 320);
  uint64_t v99 = *(void *)(v0 + 152);
  logMetric(logger:name:startInstant:)(v94, 0xD000000000000012, 0x800000025A7F54D0);
  ((void (*)(uint64_t, uint64_t, uint64_t))v157)(v97, v99, v98);
  unint64_t v100 = sub_25A7F2EC0();
  os_log_type_t v101 = sub_25A7F31A0();
  BOOL v102 = os_log_type_enabled(v100, v101);
  uint64_t v103 = *(void *)(v0 + 328);
  uint64_t v104 = *(void *)(v0 + 336);
  uint64_t v105 = *(void *)(v0 + 320);
  if (v102)
  {
    os_log_type_t v188 = v101;
    uint64_t v176 = *(void *)(v0 + 320);
    unint64_t v106 = (uint8_t *)swift_slowAlloc();
    uint64_t v182 = swift_slowAlloc();
    v196[0] = v182;
    uint64_t v171 = v106;
    *(_DWORD *)unint64_t v106 = 136315138;
    uint64_t v107 = sub_25A7F2080();
    uint64_t v108 = *(void *)(v107 - 8);
    uint64_t v109 = swift_task_alloc();
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v110 = sub_25A7F3390();
    unint64_t v112 = v111;
    (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v109, v107);
    swift_task_dealloc();
    *(void *)(v0 + 40) = sub_25A7EED88(v110, v112, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v104, v176);
    _os_log_impl(&dword_25A7B3000, v100, v188, "%s sending private ML request", v171, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v182, -1, -1);
    MEMORY[0x261145500](v171, -1, -1);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v104, v105);
  }
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v113 = sub_25A7F2E50();
  os_signpost_type_t v114 = sub_25A7F3240();
  char v115 = sub_25A7F3250();
  uint64_t v116 = *(void *)(v0 + 288);
  if (v115)
  {
    os_signpost_type_t v189 = v114;
    uint64_t v117 = *(void *)(v0 + 272);
    uint64_t v195 = *(void *)(v0 + 264);
    unint64_t v118 = *(void *)(v0 + 136);
    uint64_t v177 = *(void *)(v0 + 128);
    uint64_t v183 = *(void *)(v0 + 280);
    (*(void (**)(void))(v117 + 16))();
    uint64_t v119 = (uint8_t *)swift_slowAlloc();
    uint64_t v120 = swift_slowAlloc();
    v196[0] = v120;
    *(_DWORD *)uint64_t v119 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 32) = sub_25A7EED88(v177, v118, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v121 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v113, v189, v121, "executePrivateMLRequest", "request parsed requestIdentifier=%{public, signpost.description=attribute,public}s)", v119, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v120, -1, -1);
    MEMORY[0x261145500](v119, -1, -1);

    uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
    v122(v116, v195);
    v122(v183, v195);
  }
  else
  {
    uint64_t v124 = *(void *)(v0 + 264);
    uint64_t v123 = *(void *)(v0 + 272);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v116, v124);
  }
  uint64_t v125 = sub_25A7F2A20();
  uint64_t v127 = v126;
  *(void *)(v0 + 600) = v126;
  uint64_t v128 = sub_25A7F29F0();
  int64_t v129 = *(void *)(v128 + 16);
  if (v129)
  {
    uint64_t v165 = v127;
    uint64_t v169 = v125;
    uint64_t v130 = *(void *)(v0 + 248);
    uint64_t v131 = *(void *)(v0 + 224);
    v196[0] = MEMORY[0x263F8EE78];
    sub_25A7EF518(0, v129, 0);
    uint64_t v132 = *(void (**)(void, unint64_t, void))(v130 + 16);
    v130 += 16;
    uint64_t v190 = v132;
    unint64_t v133 = v128 + ((*(unsigned __int8 *)(v130 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 64));
    uint64_t v178 = *(void *)(v130 + 56);
    uint64_t v172 = (void (**)(void, void))(v130 - 8);
    while (1)
    {
      uint64_t v134 = *(void *)(v0 + 232);
      uint64_t v135 = *(void *)(v0 + 216);
      v190(*(void *)(v0 + 256), v133, *(void *)(v0 + 240));
      sub_25A7F2A30();
      uint64_t v136 = sub_25A7F29C0();
      uint64_t v138 = v137;
      (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v134, v135);
      unint64_t v139 = sub_25A7F2A40();
      if ((v139 & 0x8000000000000000) != 0) {
        break;
      }
      int v140 = v139;
      if (HIDWORD(v139)) {
        break;
      }
      (*v172)(*(void *)(v0 + 256), *(void *)(v0 + 240));
      uint64_t v141 = v196[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25A7EF518(0, *(void *)(v141 + 16) + 1, 1);
        uint64_t v141 = v196[0];
      }
      unint64_t v143 = *(void *)(v141 + 16);
      unint64_t v142 = *(void *)(v141 + 24);
      if (v143 >= v142 >> 1)
      {
        sub_25A7EF518(v142 > 1, v143 + 1, 1);
        uint64_t v141 = v196[0];
      }
      *(void *)(v141 + 16) = v143 + 1;
      uint64_t v144 = v141 + 24 * v143;
      *(void *)(v144 + 32) = v136;
      *(void *)(v144 + 40) = v138;
      *(_DWORD *)(v144 + 48) = v140;
      v133 += v178;
      if (!--v129)
      {
        swift_bridgeObjectRelease();
        uint64_t v127 = v165;
        uint64_t v125 = v169;
        goto LABEL_46;
      }
    }
    return sub_25A7F3330();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v141 = MEMORY[0x263F8EE78];
LABEL_46:
    *(void *)(v0 + 608) = v141;
    uint64_t v145 = *(void *)(v0 + 368);
    uint64_t v146 = *(void *)(v0 + 152);
    uint64_t v148 = *(void *)(v0 + 120);
    uint64_t v147 = *(void *)(v0 + 128);
    uint64_t v149 = *(void *)(v0 + 96);
    uint64_t v150 = swift_task_alloc();
    *(void *)(v0 + 616) = v150;
    long long v151 = *(_OWORD *)(v0 + 136);
    long long v152 = *(_OWORD *)(v0 + 160);
    *(void *)(v150 + 16) = v148;
    *(void *)(v150 + 24) = v146;
    *(void *)(v150 + 32) = v145;
    *(void *)(v150 + 40) = v147;
    *(_OWORD *)(v150 + 48) = v151;
    *(void *)(v150 + 64) = v149;
    *(_OWORD *)(v150 + 72) = v152;
    uint64_t v153 = (void *)swift_task_alloc();
    *(void *)(v0 + 624) = v153;
    *uint64_t v153 = v0;
    v153[1] = sub_25A7E4654;
    uint64_t v154 = *(void *)(v0 + 368);
    uint64_t v155 = *(void *)(v0 + 80);
    uint64_t v156 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270F57390](v155, v154, v125, v127, v141, &unk_26A464678, v150, v156);
  }
}

uint64_t sub_25A7E4654()
{
  *(void *)(*(void *)v1 + 632) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7F1344;
  }
  else {
    uint64_t v2 = sub_25A7F1338;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7E47C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 160) = v24;
  *(void *)(v8 + 168) = v25;
  *(_OWORD *)(v8 + 144) = v23;
  *(void *)(v8 + 128) = a7;
  *(void *)(v8 + 136) = a8;
  *(void *)(v8 + 112) = a5;
  *(void *)(v8 + 120) = a6;
  *(void *)(v8 + 96) = a3;
  *(void *)(v8 + 104) = a4;
  *(void *)(v8 + 80) = a1;
  *(void *)(v8 + 88) = a2;
  uint64_t v9 = sub_25A7F2BF0();
  *(void *)(v8 + 176) = v9;
  *(void *)(v8 + 184) = *(void *)(v9 - 8);
  *(void *)(v8 + 192) = swift_task_alloc();
  *(void *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464540);
  *(void *)(v8 + 208) = swift_task_alloc();
  uint64_t v10 = sub_25A7F29E0();
  *(void *)(v8 + 216) = v10;
  *(void *)(v8 + 224) = *(void *)(v10 - 8);
  *(void *)(v8 + 232) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2A50();
  *(void *)(v8 + 240) = v11;
  *(void *)(v8 + 248) = *(void *)(v11 - 8);
  *(void *)(v8 + 256) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2E30();
  *(void *)(v8 + 264) = v12;
  *(void *)(v8 + 272) = *(void *)(v12 - 8);
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 288) = swift_task_alloc();
  uint64_t v13 = sub_25A7F2EE0();
  *(void *)(v8 + 296) = v13;
  *(void *)(v8 + 304) = *(void *)(v13 - 8);
  *(void *)(v8 + 312) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2DC0();
  *(void *)(v8 + 320) = v14;
  *(void *)(v8 + 328) = *(void *)(v14 - 8);
  *(void *)(v8 + 336) = swift_task_alloc();
  *(void *)(v8 + 344) = swift_task_alloc();
  uint64_t v15 = sub_25A7F23D0();
  *(void *)(v8 + 352) = v15;
  *(void *)(v8 + 360) = *(void *)(v15 - 8);
  *(void *)(v8 + 368) = swift_task_alloc();
  uint64_t v16 = sub_25A7F2920();
  *(void *)(v8 + 376) = v16;
  *(void *)(v8 + 384) = *(void *)(v16 - 8);
  *(void *)(v8 + 392) = swift_task_alloc();
  uint64_t v17 = sub_25A7F2890();
  *(void *)(v8 + 400) = v17;
  *(void *)(v8 + 408) = *(void *)(v17 - 8);
  *(void *)(v8 + 416) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464548);
  *(void *)(v8 + 424) = swift_task_alloc();
  *(void *)(v8 + 432) = swift_task_alloc();
  *(void *)(v8 + 440) = swift_task_alloc();
  *(void *)(v8 + 448) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464550);
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  uint64_t v18 = sub_25A7F2AA0();
  *(void *)(v8 + 472) = v18;
  *(void *)(v8 + 480) = *(void *)(v18 - 8);
  *(void *)(v8 + 488) = swift_task_alloc();
  *(void *)(v8 + 496) = swift_task_alloc();
  *(void *)(v8 + 504) = swift_task_alloc();
  uint64_t v19 = sub_25A7F2850();
  *(void *)(v8 + 512) = v19;
  *(void *)(v8 + 520) = *(void *)(v19 - 8);
  *(void *)(v8 + 528) = swift_task_alloc();
  *(void *)(v8 + 536) = swift_task_alloc();
  uint64_t v20 = sub_25A7F26C0();
  *(void *)(v8 + 544) = v20;
  *(void *)(v8 + 552) = *(void *)(v20 - 8);
  *(void *)(v8 + 560) = swift_task_alloc();
  *(void *)(v8 + 568) = swift_task_alloc();
  *(void *)(v8 + 576) = swift_task_alloc();
  *(void *)(v8 + 584) = swift_task_alloc();
  *(void *)(v8 + 592) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7E4DEC, 0, 0);
}

uint64_t sub_25A7E4DEC()
{
  uint64_t v197 = v0;
  sub_25A7F0F78(&qword_26A464558, MEMORY[0x263F7F8B8]);
  sub_25A7F26A0();
  uint64_t v1 = *(void *)(v0 + 592);
  uint64_t v2 = *(void *)(v0 + 584);
  uint64_t v3 = *(void *)(v0 + 552);
  uint64_t v4 = *(void *)(v0 + 544);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 184) + 56);
  v5(*(void *)(v0 + 448), 1, 1, *(void *)(v0 + 176));
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v7 == *MEMORY[0x263F7F898])
  {
    v6(*(void *)(v0 + 576), *(void *)(v0 + 592), *(void *)(v0 + 544));
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_25A7F2EC0();
    os_log_type_t v9 = sub_25A7F3190();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = *(void *)(v0 + 576);
    if (!v10)
    {
      uint64_t v31 = *(void *)(v0 + 552);
      uint64_t v32 = *(void *)(v0 + 544);

      swift_bridgeObjectRelease_n();
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v18(v11, v32);
      goto LABEL_16;
    }
    os_log_type_t v184 = v9;
    uint64_t v12 = *(void *)(v0 + 552);
    uint64_t v170 = *(void *)(v0 + 560);
    uint64_t v173 = *(void *)(v0 + 544);
    uint64_t v166 = *(void *)(v0 + 576);
    uint64_t v14 = *(void *)(v0 + 128);
    unint64_t v13 = *(void *)(v0 + 136);
    uint64_t v15 = swift_slowAlloc();
    uint64_t v179 = swift_slowAlloc();
    v196[0] = v179;
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_25A7EED88(v14, v13, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    v6(v170, v166, v173);
    uint64_t v16 = sub_25A7F3040();
    *(void *)(v0 + 64) = sub_25A7EED88(v16, v17, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v18(v166, v173);
    _os_log_impl(&dword_25A7B3000, v8, v184, "%s received unkown request payload %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261145500](v179, -1, -1);
    uint64_t v19 = v15;
    goto LABEL_15;
  }
  if (v7 == *MEMORY[0x263F7F8A0])
  {
    uint64_t v20 = *(void *)(v0 + 584);
    uint64_t v22 = *(void *)(v0 + 408);
    uint64_t v21 = *(void *)(v0 + 416);
    uint64_t v23 = *(void *)(v0 + 400);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 552) + 96))(v20, *(void *)(v0 + 544));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v21, v20, v23);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_25A7F2EC0();
    os_log_type_t v25 = sub_25A7F31A0();
    BOOL v26 = os_log_type_enabled(v24, v25);
    unint64_t v27 = *(void *)(v0 + 136);
    if (v26)
    {
      uint64_t v28 = *(void *)(v0 + 128);
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v196[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_25A7EED88(v28, v27, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v24, v25, "%s received complete prompt request", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v30, -1, -1);
      MEMORY[0x261145500](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v45 = *(void *)(v0 + 408);
    uint64_t v44 = *(void *)(v0 + 416);
    uint64_t v46 = *(void *)(v0 + 400);
    uint64_t v47 = *(void **)(v0 + 144);
    sub_25A7F2880();
    sub_25A7F2860();
    sub_25A7F2870();
    __swift_project_boxed_opaque_existential_1(v47, v47[3]);
    sub_25A7F2A00();
    sub_25A7F2510();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  }
  else
  {
    if (v7 != *MEMORY[0x263F7F8A8])
    {
      v6(*(void *)(v0 + 568), *(void *)(v0 + 592), *(void *)(v0 + 544));
      swift_bridgeObjectRetain_n();
      uint64_t v48 = sub_25A7F2EC0();
      os_log_type_t v49 = sub_25A7F3190();
      BOOL v50 = os_log_type_enabled(v48, v49);
      uint64_t v51 = *(void *)(v0 + 568);
      if (!v50)
      {
        uint64_t v71 = *(void *)(v0 + 552);
        uint64_t v72 = *(void *)(v0 + 544);

        swift_bridgeObjectRelease_n();
        uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
        v18(v51, v72);
LABEL_16:
        uint64_t v59 = *(void *)(v0 + 592);
        uint64_t v60 = *(void *)(v0 + 584);
        uint64_t v61 = *(void *)(v0 + 544);
        uint64_t v62 = *(void *)(v0 + 448);
        sub_25A7F03B0();
        swift_allocError();
        unsigned char *v63 = 2;
        swift_willThrow();
        sub_25A7BD1C4(v62, &qword_26A464548);
        v18(v59, v61);
        v18(v60, v61);
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v95 = *(uint64_t (**)(void))(v0 + 8);
        return v95();
      }
      uint64_t v180 = v48;
      uint64_t v52 = *(void *)(v0 + 560);
      uint64_t v53 = *(void *)(v0 + 552);
      uint64_t v174 = *(void *)(v0 + 544);
      uint64_t v54 = *(void *)(v0 + 128);
      unint64_t v55 = *(void *)(v0 + 136);
      uint64_t v167 = *(void *)(v0 + 568);
      uint64_t v56 = swift_slowAlloc();
      uint64_t v191 = swift_slowAlloc();
      v196[0] = v191;
      *(_DWORD *)uint64_t v56 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 16) = sub_25A7EED88(v54, v55, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v56 + 12) = 2080;
      v6(v52, v167, v174);
      uint64_t v57 = sub_25A7F3040();
      *(void *)(v0 + 24) = sub_25A7EED88(v57, v58, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v18(v167, v174);
      uint64_t v8 = v180;
      _os_log_impl(&dword_25A7B3000, v180, v49, "%s received unkown request payload %s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261145500](v191, -1, -1);
      uint64_t v19 = v56;
LABEL_15:
      MEMORY[0x261145500](v19, -1, -1);

      goto LABEL_16;
    }
    uint64_t v33 = *(void *)(v0 + 584);
    uint64_t v35 = *(void *)(v0 + 384);
    uint64_t v34 = *(void *)(v0 + 392);
    uint64_t v36 = *(void *)(v0 + 376);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 552) + 96))(v33, *(void *)(v0 + 544));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v34, v33, v36);
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_25A7F2EC0();
    os_log_type_t v38 = sub_25A7F31A0();
    BOOL v39 = os_log_type_enabled(v37, v38);
    unint64_t v40 = *(void *)(v0 + 136);
    if (v39)
    {
      uint64_t v185 = *(void *)(v0 + 128);
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v196[0] = v42;
      *(_DWORD *)uint64_t v41 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 48) = sub_25A7EED88(v185, v40, v196);
      sub_25A7F3270();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v37, v38, "%s received completePromptTemplate request", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v42, -1, -1);
      MEMORY[0x261145500](v41, -1, -1);
    }
    else
    {

      uint64_t v43 = swift_bridgeObjectRelease_n();
    }
    uint64_t v64 = *(void *)(v0 + 472);
    uint64_t v65 = *(void *)(v0 + 480);
    uint64_t v66 = *(void *)(v0 + 208);
    MEMORY[0x261144550](v43);
    int v67 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v66, 1, v64);
    uint64_t v68 = *(void *)(v0 + 480);
    if (v67 == 1)
    {
      uint64_t v69 = *(void *)(v0 + 208);
      sub_25A7F2A10();
      sub_25A7BD1C4(v69, &qword_26A464540);
      os_log_type_t v70 = *(void (**)(void, void, void))(v68 + 32);
    }
    else
    {
      unint64_t v73 = *(void (**)(void, void, void))(v68 + 32);
      v73(*(void *)(v0 + 488), *(void *)(v0 + 208), *(void *)(v0 + 472));
      os_log_type_t v70 = v73;
    }
    uint64_t v74 = *(void *)(v0 + 448);
    uint64_t v75 = *(void *)(v0 + 432);
    uint64_t v76 = *(void *)(v0 + 184);
    uint64_t v186 = *(void *)(v0 + 176);
    uint64_t v192 = *(void *)(v0 + 424);
    v70(*(void *)(v0 + 504), *(void *)(v0 + 488), *(void *)(v0 + 472));
    sub_25A7F28F0();
    sub_25A7F2900();
    sub_25A7F28E0();
    sub_25A7BD1C4(v74, &qword_26A464548);
    v5(v75, 0, 1, v186);
    sub_25A7F08A0(v75, v74, &qword_26A464548);
    sub_25A7C7164(v74, v192, &qword_26A464548);
    int v77 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v192, 1, v186);
    uint64_t v78 = *(void *)(v0 + 424);
    uint64_t v79 = *(void *)(v0 + 384);
    uint64_t v80 = *(void *)(v0 + 376);
    if (v77 == 1)
    {
      (*(void (**)(void, void))(v79 + 8))(*(void *)(v0 + 392), *(void *)(v0 + 376));
      sub_25A7BD1C4(v78, &qword_26A464548);
    }
    else
    {
      uint64_t v82 = *(void *)(v0 + 192);
      uint64_t v81 = *(void *)(v0 + 200);
      uint64_t v84 = *(void *)(v0 + 176);
      uint64_t v83 = *(void *)(v0 + 184);
      uint64_t v85 = *(void **)(v0 + 144);
      uint64_t v193 = *(void *)(v0 + 392);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v81, v78, v84);
      __swift_project_boxed_opaque_existential_1(v85, v85[3]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v82, v81, v84);
      sub_25A7F3040();
      sub_25A7F2510();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v81, v84);
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v193, v80);
    }
  }
  uint64_t v163 = *(void *)(v0 + 536);
  uint64_t v159 = *(void *)(v0 + 528);
  uint64_t v86 = *(void *)(v0 + 520);
  uint64_t v87 = *(void *)(v0 + 504);
  uint64_t v161 = *(void *)(v0 + 512);
  uint64_t v88 = *(void *)(v0 + 496);
  uint64_t v89 = *(void *)(v0 + 472);
  uint64_t v90 = *(void *)(v0 + 480);
  uint64_t v160 = *(void *)(v0 + 464);
  uint64_t v158 = *(void *)(v0 + 456);
  uint64_t v164 = *(void *)(v0 + 440);
  uint64_t v168 = *(void *)(v0 + 448);
  uint64_t v187 = *(void *)(v0 + 344);
  uint64_t v194 = *(void *)(v0 + 368);
  uint64_t v91 = *(void *)(v0 + 304);
  os_log_type_t v175 = *(char **)(v0 + 312);
  uint64_t v181 = *(void *)(v0 + 296);
  unint64_t v92 = *(void *)(v0 + 112);
  uint64_t v162 = *(void *)(v0 + 120);
  uint64_t v93 = *(void *)(v0 + 104);
  uint64_t v157 = *(void (**)(void))(*(void *)(v0 + 328) + 16);
  v157();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v88, v87, v89);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v159, v163, v161);
  sub_25A7C7164(v160, v158, &qword_26A464550);
  sub_25A7C7164(v168, v164, &qword_26A464548);
  uint64_t v94 = v162 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v175, v162 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, v181);
  sub_25A7F0404(v93, v92);
  sub_25A7E6B7C(v93, v92, v187, v88, v159, v158, v164, v175, v194);
  uint64_t v97 = *(void *)(v0 + 336);
  uint64_t v98 = *(void *)(v0 + 320);
  uint64_t v99 = *(void *)(v0 + 152);
  logMetric(logger:name:startInstant:)(v94, 0xD000000000000012, 0x800000025A7F54D0);
  ((void (*)(uint64_t, uint64_t, uint64_t))v157)(v97, v99, v98);
  unint64_t v100 = sub_25A7F2EC0();
  os_log_type_t v101 = sub_25A7F31A0();
  BOOL v102 = os_log_type_enabled(v100, v101);
  uint64_t v103 = *(void *)(v0 + 328);
  uint64_t v104 = *(void *)(v0 + 336);
  uint64_t v105 = *(void *)(v0 + 320);
  if (v102)
  {
    os_log_type_t v188 = v101;
    uint64_t v176 = *(void *)(v0 + 320);
    unint64_t v106 = (uint8_t *)swift_slowAlloc();
    uint64_t v182 = swift_slowAlloc();
    v196[0] = v182;
    uint64_t v171 = v106;
    *(_DWORD *)unint64_t v106 = 136315138;
    uint64_t v107 = sub_25A7F2080();
    uint64_t v108 = *(void *)(v107 - 8);
    uint64_t v109 = swift_task_alloc();
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v110 = sub_25A7F3390();
    unint64_t v112 = v111;
    (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v109, v107);
    swift_task_dealloc();
    *(void *)(v0 + 40) = sub_25A7EED88(v110, v112, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v104, v176);
    _os_log_impl(&dword_25A7B3000, v100, v188, "%s sending private ML request", v171, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v182, -1, -1);
    MEMORY[0x261145500](v171, -1, -1);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v104, v105);
  }
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v113 = sub_25A7F2E50();
  os_signpost_type_t v114 = sub_25A7F3240();
  char v115 = sub_25A7F3250();
  uint64_t v116 = *(void *)(v0 + 288);
  if (v115)
  {
    os_signpost_type_t v189 = v114;
    uint64_t v117 = *(void *)(v0 + 272);
    uint64_t v195 = *(void *)(v0 + 264);
    unint64_t v118 = *(void *)(v0 + 136);
    uint64_t v177 = *(void *)(v0 + 128);
    uint64_t v183 = *(void *)(v0 + 280);
    (*(void (**)(void))(v117 + 16))();
    uint64_t v119 = (uint8_t *)swift_slowAlloc();
    uint64_t v120 = swift_slowAlloc();
    v196[0] = v120;
    *(_DWORD *)uint64_t v119 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 32) = sub_25A7EED88(v177, v118, v196);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v121 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v113, v189, v121, "executePrivateMLRequest", "request parsed requestIdentifier=%{public, signpost.description=attribute,public}s)", v119, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v120, -1, -1);
    MEMORY[0x261145500](v119, -1, -1);

    uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
    v122(v116, v195);
    v122(v183, v195);
  }
  else
  {
    uint64_t v124 = *(void *)(v0 + 264);
    uint64_t v123 = *(void *)(v0 + 272);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v116, v124);
  }
  uint64_t v125 = sub_25A7F2A20();
  uint64_t v127 = v126;
  *(void *)(v0 + 600) = v126;
  uint64_t v128 = sub_25A7F29F0();
  int64_t v129 = *(void *)(v128 + 16);
  if (v129)
  {
    uint64_t v165 = v127;
    uint64_t v169 = v125;
    uint64_t v130 = *(void *)(v0 + 248);
    uint64_t v131 = *(void *)(v0 + 224);
    v196[0] = MEMORY[0x263F8EE78];
    sub_25A7EF518(0, v129, 0);
    uint64_t v132 = *(void (**)(void, unint64_t, void))(v130 + 16);
    v130 += 16;
    uint64_t v190 = v132;
    unint64_t v133 = v128 + ((*(unsigned __int8 *)(v130 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 64));
    uint64_t v178 = *(void *)(v130 + 56);
    uint64_t v172 = (void (**)(void, void))(v130 - 8);
    while (1)
    {
      uint64_t v134 = *(void *)(v0 + 232);
      uint64_t v135 = *(void *)(v0 + 216);
      v190(*(void *)(v0 + 256), v133, *(void *)(v0 + 240));
      sub_25A7F2A30();
      uint64_t v136 = sub_25A7F29C0();
      uint64_t v138 = v137;
      (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v134, v135);
      unint64_t v139 = sub_25A7F2A40();
      if ((v139 & 0x8000000000000000) != 0) {
        break;
      }
      int v140 = v139;
      if (HIDWORD(v139)) {
        break;
      }
      (*v172)(*(void *)(v0 + 256), *(void *)(v0 + 240));
      uint64_t v141 = v196[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25A7EF518(0, *(void *)(v141 + 16) + 1, 1);
        uint64_t v141 = v196[0];
      }
      unint64_t v143 = *(void *)(v141 + 16);
      unint64_t v142 = *(void *)(v141 + 24);
      if (v143 >= v142 >> 1)
      {
        sub_25A7EF518(v142 > 1, v143 + 1, 1);
        uint64_t v141 = v196[0];
      }
      *(void *)(v141 + 16) = v143 + 1;
      uint64_t v144 = v141 + 24 * v143;
      *(void *)(v144 + 32) = v136;
      *(void *)(v144 + 40) = v138;
      *(_DWORD *)(v144 + 48) = v140;
      v133 += v178;
      if (!--v129)
      {
        swift_bridgeObjectRelease();
        uint64_t v127 = v165;
        uint64_t v125 = v169;
        goto LABEL_46;
      }
    }
    return sub_25A7F3330();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v141 = MEMORY[0x263F8EE78];
LABEL_46:
    *(void *)(v0 + 608) = v141;
    uint64_t v145 = *(void *)(v0 + 368);
    uint64_t v146 = *(void *)(v0 + 152);
    uint64_t v148 = *(void *)(v0 + 120);
    uint64_t v147 = *(void *)(v0 + 128);
    uint64_t v149 = *(void *)(v0 + 96);
    uint64_t v150 = swift_task_alloc();
    *(void *)(v0 + 616) = v150;
    long long v151 = *(_OWORD *)(v0 + 136);
    long long v152 = *(_OWORD *)(v0 + 160);
    *(void *)(v150 + 16) = v148;
    *(void *)(v150 + 24) = v146;
    *(void *)(v150 + 32) = v145;
    *(void *)(v150 + 40) = v147;
    *(_OWORD *)(v150 + 48) = v151;
    *(void *)(v150 + 64) = v149;
    *(_OWORD *)(v150 + 72) = v152;
    uint64_t v153 = (void *)swift_task_alloc();
    *(void *)(v0 + 624) = v153;
    *uint64_t v153 = v0;
    v153[1] = sub_25A7E64C4;
    uint64_t v154 = *(void *)(v0 + 368);
    uint64_t v155 = *(void *)(v0 + 80);
    uint64_t v156 = MEMORY[0x263F06F70];
    return MEMORY[0x270F57390](v155, v154, v125, v127, v141, &unk_26A464570, v150, v156);
  }
}

uint64_t sub_25A7E64C4()
{
  *(void *)(*(void *)v1 + 632) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7E68D4;
  }
  else {
    uint64_t v2 = sub_25A7E6630;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7E6630()
{
  uint64_t v1 = v0[74];
  uint64_t v2 = v0[69];
  uint64_t v14 = v0[67];
  uint64_t v15 = v0[68];
  uint64_t v3 = v0[65];
  uint64_t v4 = v0[63];
  uint64_t v13 = v0[64];
  uint64_t v5 = v0[60];
  uint64_t v6 = v0[58];
  uint64_t v7 = v0[59];
  uint64_t v8 = v0[45];
  uint64_t v12 = v0[46];
  uint64_t v9 = v0[44];
  sub_25A7BD1C4(v0[56], &qword_26A464548);
  sub_25A7BD1C4(v6, &qword_26A464550);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v15);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v9);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_25A7E68D4()
{
  uint64_t v1 = v0[69];
  uint64_t v14 = v0[68];
  uint64_t v15 = v0[74];
  uint64_t v2 = v0[67];
  uint64_t v3 = v0[65];
  uint64_t v5 = v0[63];
  uint64_t v4 = v0[64];
  uint64_t v6 = v0[59];
  uint64_t v7 = v0[60];
  uint64_t v8 = v0[58];
  uint64_t v9 = v0[45];
  uint64_t v12 = v0[44];
  uint64_t v13 = v0[46];
  sub_25A7BD1C4(v0[56], &qword_26A464548);
  sub_25A7BD1C4(v8, &qword_26A464550);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v15, v14);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v12);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_25A7E6B7C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v480 = a7;
  uint64_t v481 = a6;
  uint64_t v484 = a4;
  unint64_t v478 = a2;
  uint64_t v477 = a1;
  uint64_t v488 = a9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464588);
  MEMORY[0x270FA5388](v12 - 8);
  v457 = (char *)v442 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v498 = sub_25A7F29E0();
  uint64_t v454 = *(void *)(v498 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v498);
  v493 = (char *)v442 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v486 = (char *)v442 - v16;
  uint64_t v500 = sub_25A7F2A50();
  uint64_t v494 = *(void *)(v500 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v500);
  v503 = (char *)v442 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v483 = (char *)v442 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464548);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v456 = (uint64_t)v442 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v469 = sub_25A7F2BF0();
  uint64_t v468 = *(void *)(v469 - 8);
  MEMORY[0x270FA5388](v469);
  uint64_t v460 = (char *)v442 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644C0);
  MEMORY[0x270FA5388](v23 - 8);
  v467 = (char *)v442 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464590);
  MEMORY[0x270FA5388](v25 - 8);
  v451 = (void *)((char *)v442 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464550);
  MEMORY[0x270FA5388](v27 - 8);
  v466 = (char *)v442 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v464 = sub_25A7F2680();
  uint64_t v463 = *(void *)(v464 - 8);
  MEMORY[0x270FA5388](v464);
  v452 = (char *)v442 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v450 = sub_25A7F2220();
  uint64_t v449 = *(void *)(v450 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v450);
  v446 = (_DWORD *)((char *)v442 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v30);
  v447 = (void *)((char *)v442 - v32);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464598);
  MEMORY[0x270FA5388](v33 - 8);
  v462 = (char *)v442 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645A0);
  uint64_t v36 = MEMORY[0x270FA5388](v35 - 8);
  v455 = (void *)((char *)v442 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v36);
  v465 = (char *)v442 - v38;
  uint64_t v39 = sub_25A7F30D0();
  MEMORY[0x270FA5388](v39 - 8);
  v461 = (char *)v442 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v476 = sub_25A7F23D0();
  uint64_t v475 = *(void *)(v476 - 8);
  MEMORY[0x270FA5388](v476);
  v474 = (char *)v442 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_25A7F2DC0();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  v470 = (char *)v442 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v448 = (char *)v442 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v453 = (char *)v442 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  os_signpost_type_t v445 = (char *)v442 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v479 = (char *)v442 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v482 = (char *)v442 - v55;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v489 = (char *)v442 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v496 = (char *)v442 - v59;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v508 = (char *)v442 - v61;
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  v473 = (char *)v442 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  uint64_t v66 = (char *)v442 - v65;
  uint64_t v67 = MEMORY[0x270FA5388](v64);
  uint64_t v69 = (uint8_t *)v442 - v68;
  uint64_t v70 = MEMORY[0x270FA5388](v67);
  uint64_t v72 = (char *)v442 - v71;
  MEMORY[0x270FA5388](v70);
  uint64_t v74 = (char *)v442 - v73;
  uint64_t v490 = a5;
  sub_25A7F27F0();
  uint64_t v506 = a3;
  v517 = a8;
  uint64_t v504 = v42;
  v521 = v66;
  v520 = v69;
  if (v75)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v74, a3, v42);
    uint64_t v76 = sub_25A7F2EC0();
    os_log_type_t v77 = sub_25A7F31A0();
    uint64_t v78 = v43;
    int v79 = v77;
    if (os_log_type_enabled(v76, v77))
    {
      v519 = v72;
      uint64_t v80 = (uint8_t *)swift_slowAlloc();
      uint64_t v518 = swift_slowAlloc();
      v529 = (char *)v518;
      v516 = v80;
      *(_DWORD *)uint64_t v80 = 136315138;
      v515 = (void (*)(char *, uint64_t, uint64_t))(v80 + 4);
      uint64_t v81 = sub_25A7F2080();
      uint64_t v513 = (uint64_t)v442;
      uint64_t v82 = *(void *)(v81 - 8);
      MEMORY[0x270FA5388](v81);
      uint64_t v84 = (char *)v442 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
      LODWORD(v514) = v79;
      uint64_t v43 = v78;
      sub_25A7F2D70();
      sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
      uint64_t v85 = sub_25A7F3390();
      unint64_t v87 = v86;
      uint64_t v88 = v81;
      uint64_t v42 = v504;
      (*(void (**)(char *, uint64_t))(v82 + 8))(v84, v88);
      uint64_t v66 = v521;
      *(void *)&long long v526 = sub_25A7EED88(v85, v87, (uint64_t *)&v529);
      a3 = v506;
      sub_25A7F3270();
      uint64_t v72 = v519;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v74, v42);
      uint64_t v89 = v516;
      _os_log_impl(&dword_25A7B3000, v76, (os_log_type_t)v514, "%s max tokens not set will be overriden.", v516, 0xCu);
      uint64_t v90 = v518;
      swift_arrayDestroy();
      MEMORY[0x261145500](v90, -1, -1);
      MEMORY[0x261145500](v89, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v78 + 8))(v74, v42);
      uint64_t v43 = v78;
    }
    uint64_t v69 = v520;
  }
  uint64_t v91 = sub_25A7F27F0();
  v515 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
  v516 = (uint8_t *)(v43 + 16);
  if ((v92 & 1) == 0 && !v91)
  {
    v515(v72, a3, v42);
    uint64_t v93 = sub_25A7F2EC0();
    os_log_type_t v94 = sub_25A7F31A0();
    if (os_log_type_enabled(v93, v94))
    {
      v519 = v72;
      uint64_t v95 = (uint8_t *)swift_slowAlloc();
      uint64_t v514 = swift_slowAlloc();
      v529 = (char *)v514;
      uint64_t v518 = v43;
      *(_DWORD *)uint64_t v95 = 136315138;
      uint64_t v513 = (uint64_t)(v95 + 4);
      uint64_t v96 = sub_25A7F2080();
      v512 = v442;
      uint64_t v97 = *(void *)(v96 - 8);
      MEMORY[0x270FA5388](v96);
      uint64_t v99 = (char *)v442 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_25A7F2D70();
      sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
      uint64_t v100 = sub_25A7F3390();
      unint64_t v102 = v101;
      uint64_t v103 = v96;
      uint64_t v42 = v504;
      (*(void (**)(char *, uint64_t))(v97 + 8))(v99, v103);
      uint64_t v66 = v521;
      *(void *)&long long v526 = sub_25A7EED88(v100, v102, (uint64_t *)&v529);
      uint64_t v104 = v518;
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      uint64_t v43 = v104;
      (*(void (**)(char *, uint64_t))(v104 + 8))(v519, v42);
      _os_log_impl(&dword_25A7B3000, v93, v94, "%s max tokens is set to zero.", v95, 0xCu);
      uint64_t v105 = v514;
      swift_arrayDestroy();
      MEMORY[0x261145500](v105, -1, -1);
      MEMORY[0x261145500](v95, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v43 + 8))(v72, v42);
    }
    a3 = v506;
    uint64_t v69 = v520;
  }
  unint64_t v106 = v515;
  v515((char *)v69, a3, v42);
  v106(v66, a3, v42);
  uint64_t v107 = sub_25A7F2EC0();
  os_log_type_t v108 = sub_25A7F31A0();
  int v109 = v108;
  if (os_log_type_enabled(v107, v108))
  {
    uint64_t v110 = swift_slowAlloc();
    v519 = (char *)swift_slowAlloc();
    v529 = v519;
    *(_DWORD *)uint64_t v110 = 136315394;
    uint64_t v513 = v110 + 4;
    uint64_t v111 = sub_25A7F2080();
    uint64_t v112 = *(void *)(v111 - 8);
    MEMORY[0x270FA5388](v111);
    uint64_t v518 = v43;
    os_signpost_type_t v114 = (char *)v442 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
    LODWORD(v514) = v109;
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v115 = sub_25A7F3390();
    unint64_t v117 = v116;
    (*(void (**)(char *, uint64_t))(v112 + 8))(v114, v111);
    *(void *)&long long v526 = sub_25A7EED88(v115, v117, (uint64_t *)&v529);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    unint64_t v118 = *(void (**)(uint8_t *, uint64_t))(v518 + 8);
    v518 += 8;
    v118(v69, v504);
    *(_WORD *)(v110 + 12) = 2080;
    uint64_t v119 = v107;
    uint64_t v120 = v521;
    sub_25A7F2DA0();
    uint64_t v121 = sub_25A7F3150();
    unint64_t v123 = v122;
    swift_bridgeObjectRelease();
    *(void *)&long long v526 = sub_25A7EED88(v121, v123, (uint64_t *)&v529);
    uint64_t v42 = v504;
    sub_25A7F3270();
    a3 = v506;
    swift_bridgeObjectRelease();
    v510 = (void (*)(uint64_t, uint64_t))v118;
    v118((uint8_t *)v120, v42);
    _os_log_impl(&dword_25A7B3000, v119, (os_log_type_t)v514, "%s initializing private ML request asset identifiers: %s", (uint8_t *)v110, 0x16u);
    uint64_t v124 = MEMORY[0x263F8EE58];
    uint64_t v125 = (uint64_t)v519;
    swift_arrayDestroy();
    MEMORY[0x261145500](v125, -1, -1);
    MEMORY[0x261145500](v110, -1, -1);

    uint64_t v126 = (void *)&unk_25A7F4000;
  }
  else
  {

    uint64_t v126 = &unk_25A7F4000;
    uint64_t v127 = *(void (**)(uint8_t *, uint64_t))(v43 + 8);
    v127(v69, v42);
    v510 = (void (*)(uint64_t, uint64_t))v127;
    uint64_t v518 = v43 + 8;
    v127((uint8_t *)v66, v42);
    uint64_t v124 = MEMORY[0x263F8EE58];
  }
  unint64_t v472 = sub_25A7C1300();
  v509 = (char *)sub_25A7F31B0();
  int64_t v129 = v128;
  sub_25A7F20E0();
  swift_allocObject();
  uint64_t v514 = sub_25A7F20D0();
  uint64_t v130 = sub_25A7F2DA0();
  v485 = 0;
  uint64_t v501 = 0;
  v487 = 0;
  uint64_t v132 = 0;
  uint64_t v133 = *(void *)(v130 + 56);
  v505 = (void (*)(char *, char *))(v130 + 56);
  uint64_t v513 = v130;
  uint64_t v134 = 1 << *(unsigned char *)(v130 + 32);
  uint64_t v135 = -1;
  if (v134 < 64) {
    uint64_t v135 = ~(-1 << v134);
  }
  unint64_t v136 = v135 & v133;
  int64_t v507 = (unint64_t)(v134 + 63) >> 6;
  uint64_t v502 = 0xE300000000000000;
  unint64_t v491 = 0xE000000000000000;
  *(void *)&long long v131 = v126[125];
  long long v499 = v131;
  uint64_t v458 = v124 + 8;
  uint64_t v459 = 0x800000025A7F5590;
  *(void *)&long long v131 = 136315650;
  long long v471 = v131;
  v511 = (char *)0xE000000000000000;
  unint64_t v495 = 0xE000000000000000;
  uint64_t v492 = 5065804;
  uint64_t v137 = v497;
  v512 = v129;
  if ((v135 & v133) == 0) {
    goto LABEL_19;
  }
LABEL_18:
  v521 = (char *)((v136 - 1) & v136);
  for (unint64_t i = __clz(__rbit64(v136)) | ((void)v132 << 6); ; unint64_t i = __clz(__rbit64(v140)) + ((void)v132 << 6))
  {
    unint64_t v142 = (uint64_t *)(*(void *)(v513 + 48) + 16 * i);
    uint64_t v144 = *v142;
    uint64_t v143 = v142[1];
    swift_bridgeObjectRetain();
    v519 = (char *)v144;
    sub_25A7F20C0();
    if (v137)
    {
      swift_release();
      sub_25A7C1340(v477, v478);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_86:
      uint64_t v251 = sub_25A7F2EE0();
      (*(void (**)(char *, uint64_t))(*(void *)(v251 - 8) + 8))(v517, v251);
      sub_25A7BD1C4(v480, &qword_26A464548);
      sub_25A7BD1C4(v481, &qword_26A464550);
      uint64_t v252 = sub_25A7F2850();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v252 - 8) + 8))(v490, v252);
      uint64_t v253 = sub_25A7F2AA0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v253 - 8) + 8))(v484, v253);
      v510(a3, v42);
      return swift_release();
    }
    v520 = v132;
    if (v528)
    {
      unint64_t v145 = v143;
      sub_25A7EEEA0(&v526, (uint64_t)&v529);
      sub_25A7C56F4((uint64_t)&v529, (uint64_t)&v526);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645A8);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        uint64_t v146 = v508;
        v515(v508, a3, v42);
        unint64_t v147 = v145;
        swift_bridgeObjectRetain_n();
        uint64_t v148 = sub_25A7F2EC0();
        os_log_type_t v149 = sub_25A7F31A0();
        int v150 = v149;
        if (os_log_type_enabled(v148, v149))
        {
          uint64_t v151 = swift_slowAlloc();
          v511 = (char *)swift_slowAlloc();
          v522 = v511;
          *(_DWORD *)uint64_t v151 = v499;
          uint64_t v152 = sub_25A7F2080();
          v497 = v442;
          uint64_t v153 = *(void *)(v152 - 8);
          MEMORY[0x270FA5388](v152);
          uint64_t v155 = (char *)v442 - ((v154 + 15) & 0xFFFFFFFFFFFFFFF0);
          LODWORD(v501) = v150;
          sub_25A7F2D70();
          sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
          uint64_t v156 = sub_25A7F3390();
          unint64_t v158 = v157;
          uint64_t v159 = v155;
          uint64_t v137 = 0;
          uint64_t v42 = v504;
          (*(void (**)(char *, uint64_t))(v153 + 8))(v159, v152);
          uint64_t v160 = v506;
          *(void *)(v151 + 4) = sub_25A7EED88(v156, v158, (uint64_t *)&v522);
          swift_bridgeObjectRelease();
          v510((uint64_t)v508, v42);
          *(_WORD *)(v151 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v151 + 14) = sub_25A7EED88((uint64_t)v519, v147, (uint64_t *)&v522);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25A7B3000, v148, (os_log_type_t)v501, "%s resource is tokenizer %s", (uint8_t *)v151, 0x16u);
          uint64_t v161 = v511;
          swift_arrayDestroy();
          MEMORY[0x261145500](v161, -1, -1);
          MEMORY[0x261145500](v151, -1, -1);
        }
        else
        {
          uint64_t v160 = a3;

          v510((uint64_t)v146, v42);
          swift_bridgeObjectRelease_n();
        }
        uint64_t v124 = v147;
        v522 = v509;
        v523 = v512;
        swift_bridgeObjectRetain();
        sub_25A7F3060();
        swift_bridgeObjectRelease();
        uint64_t v501 = (uint64_t)v522;
        uint64_t v177 = v523;
        uint64_t v178 = (char *)&v531;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB70);
        if (swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          uint64_t v162 = v496;
          v515(v496, a3, v42);
          unint64_t v163 = v145;
          swift_bridgeObjectRetain_n();
          uint64_t v164 = sub_25A7F2EC0();
          os_log_type_t v165 = sub_25A7F31A0();
          int v166 = v165;
          if (os_log_type_enabled(v164, v165))
          {
            uint64_t v167 = swift_slowAlloc();
            uint64_t v502 = swift_slowAlloc();
            v522 = (char *)v502;
            *(_DWORD *)uint64_t v167 = v499;
            uint64_t v168 = sub_25A7F2080();
            uint64_t v492 = (uint64_t)v442;
            uint64_t v169 = *(void *)(v168 - 8);
            MEMORY[0x270FA5388](v168);
            uint64_t v171 = (char *)v442 - ((v170 + 15) & 0xFFFFFFFFFFFFFFF0);
            LODWORD(v497) = v166;
            sub_25A7F2D70();
            sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
            uint64_t v172 = sub_25A7F3390();
            unint64_t v174 = v173;
            os_log_type_t v175 = v171;
            uint64_t v137 = 0;
            uint64_t v42 = v504;
            (*(void (**)(char *, uint64_t))(v169 + 8))(v175, v168);
            uint64_t v160 = v506;
            *(void *)(v167 + 4) = sub_25A7EED88(v172, v174, (uint64_t *)&v522);
            swift_bridgeObjectRelease();
            v510((uint64_t)v496, v42);
            *(_WORD *)(v167 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)(v167 + 14) = sub_25A7EED88((uint64_t)v519, v163, (uint64_t *)&v522);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_25A7B3000, v164, (os_log_type_t)v497, "%s resource is model %s", (uint8_t *)v167, 0x16u);
            uint64_t v176 = v502;
            swift_arrayDestroy();
            MEMORY[0x261145500](v176, -1, -1);
            MEMORY[0x261145500](v167, -1, -1);
          }
          else
          {
            uint64_t v160 = a3;

            v510((uint64_t)v162, v42);
            swift_bridgeObjectRelease_n();
          }
          uint64_t v124 = v163;
          v522 = v509;
          v523 = v512;
          swift_bridgeObjectRetain();
          sub_25A7F3060();
          swift_bridgeObjectRelease();
          uint64_t v492 = (uint64_t)v522;
          uint64_t v177 = v523;
          uint64_t v178 = &v527;
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B32BB68);
          if (!swift_dynamicCast())
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645B0);
            if (swift_dynamicCast())
            {
              swift_bridgeObjectRelease();
              uint64_t v194 = v482;
              v515(v482, a3, v42);
              unint64_t v195 = v145;
              swift_bridgeObjectRetain_n();
              uint64_t v196 = sub_25A7F2EC0();
              os_log_type_t v197 = sub_25A7F31A0();
              int v198 = v197;
              if (os_log_type_enabled(v196, v197))
              {
                uint64_t v199 = swift_slowAlloc();
                v497 = (void *)swift_slowAlloc();
                v522 = (char *)v497;
                *(_DWORD *)uint64_t v199 = v499;
                uint64_t v200 = sub_25A7F2080();
                v485 = (char *)v442;
                uint64_t v201 = *(void *)(v200 - 8);
                MEMORY[0x270FA5388](v200);
                uint64_t v203 = (char *)v442 - ((v202 + 15) & 0xFFFFFFFFFFFFFFF0);
                LODWORD(v491) = v198;
                sub_25A7F2D70();
                sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
                uint64_t v204 = sub_25A7F3390();
                unint64_t v206 = v205;
                uint64_t v207 = v203;
                uint64_t v137 = 0;
                uint64_t v42 = v504;
                (*(void (**)(char *, uint64_t))(v201 + 8))(v207, v200);
                *(void *)(v199 + 4) = sub_25A7EED88(v204, v206, (uint64_t *)&v522);
                swift_bridgeObjectRelease();
                v510((uint64_t)v482, v42);
                *(_WORD *)(v199 + 12) = 2080;
                swift_bridgeObjectRetain();
                *(void *)(v199 + 14) = sub_25A7EED88((uint64_t)v519, v195, (uint64_t *)&v522);
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_25A7B3000, v196, (os_log_type_t)v491, "%s resource is draft %s", (uint8_t *)v199, 0x16u);
                char v208 = v497;
                swift_arrayDestroy();
                MEMORY[0x261145500](v208, -1, -1);
                MEMORY[0x261145500](v199, -1, -1);
              }
              else
              {

                v510((uint64_t)v194, v42);
                swift_bridgeObjectRelease_n();
              }
              uint64_t v124 = v195;
              v522 = v509;
              v523 = v512;
              swift_bridgeObjectRetain();
              sub_25A7F3060();
              swift_bridgeObjectRelease();
              v485 = v522;
              unint64_t v491 = (unint64_t)v523;
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v529);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v524);
              uint64_t v132 = v520;
              unint64_t v136 = (unint64_t)v521;
              a3 = v506;
            }
            else
            {
              uint64_t v124 = (uint64_t)v479;
              v515(v479, a3, v42);
              swift_bridgeObjectRetain_n();
              unint64_t v209 = v145;
              swift_bridgeObjectRetain();
              uint64_t v210 = sub_25A7F2EC0();
              os_log_type_t v211 = sub_25A7F31A0();
              int v212 = v211;
              if (os_log_type_enabled(v210, v211))
              {
                uint64_t v213 = swift_slowAlloc();
                v497 = (void *)swift_slowAlloc();
                v524 = v497;
                *(_DWORD *)uint64_t v213 = v471;
                uint64_t v214 = sub_25A7F2080();
                int v444 = v212;
                uint64_t v215 = v214;
                v442[1] = v442;
                uint64_t v216 = *(void *)(v214 - 8);
                MEMORY[0x270FA5388](v214);
                unsigned int v218 = (char *)v442 - ((v217 + 15) & 0xFFFFFFFFFFFFFFF0);
                os_log_t v443 = v210;
                sub_25A7F2D70();
                sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
                uint64_t v219 = sub_25A7F3390();
                unint64_t v221 = v220;
                uint64_t v222 = v218;
                uint64_t v137 = 0;
                uint64_t v42 = v504;
                (*(void (**)(char *, uint64_t))(v216 + 8))(v222, v215);
                unint64_t v223 = (unint64_t)v512;
                *(void *)(v213 + 4) = sub_25A7EED88(v219, v221, (uint64_t *)&v524);
                swift_bridgeObjectRelease();
                v510(v124, v42);
                *(_WORD *)(v213 + 12) = 2080;
                swift_bridgeObjectRetain();
                *(void *)(v213 + 14) = sub_25A7EED88((uint64_t)v519, v209, (uint64_t *)&v524);
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v213 + 22) = 2080;
                swift_bridgeObjectRetain();
                *(void *)(v213 + 24) = sub_25A7EED88((uint64_t)v509, v223, (uint64_t *)&v524);
                swift_bridgeObjectRelease_n();
                os_log_t v224 = v443;
                _os_log_impl(&dword_25A7B3000, v443, (os_log_type_t)v444, "%s resource is default %s server scope: %s", (uint8_t *)v213, 0x20u);
                uint64_t v124 = (uint64_t)v497;
                swift_arrayDestroy();
                MEMORY[0x261145500](v124, -1, -1);
                uint64_t v225 = v213;
                a3 = v506;
                MEMORY[0x261145500](v225, -1, -1);
              }
              else
              {
                v510(v124, v42);

                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();
              }
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v529);
              uint64_t v132 = v520;
              unint64_t v136 = (unint64_t)v521;
            }
LABEL_55:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v526);
            if (v136) {
              goto LABEL_18;
            }
            goto LABEL_19;
          }
          swift_bridgeObjectRelease();
          uint64_t v179 = v489;
          v515(v489, a3, v42);
          unint64_t v180 = v145;
          swift_bridgeObjectRetain_n();
          uint64_t v181 = sub_25A7F2EC0();
          os_log_type_t v182 = sub_25A7F31A0();
          int v183 = v182;
          if (os_log_type_enabled(v181, v182))
          {
            uint64_t v184 = swift_slowAlloc();
            v497 = (void *)swift_slowAlloc();
            v522 = (char *)v497;
            *(_DWORD *)uint64_t v184 = v499;
            uint64_t v185 = sub_25A7F2080();
            v487 = (char *)v442;
            uint64_t v186 = *(void *)(v185 - 8);
            MEMORY[0x270FA5388](v185);
            os_log_type_t v188 = (char *)v442 - ((v187 + 15) & 0xFFFFFFFFFFFFFFF0);
            LODWORD(v495) = v183;
            sub_25A7F2D70();
            sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
            uint64_t v189 = sub_25A7F3390();
            unint64_t v191 = v190;
            uint64_t v192 = v188;
            uint64_t v137 = 0;
            uint64_t v42 = v504;
            (*(void (**)(char *, uint64_t))(v186 + 8))(v192, v185);
            uint64_t v160 = v506;
            *(void *)(v184 + 4) = sub_25A7EED88(v189, v191, (uint64_t *)&v522);
            swift_bridgeObjectRelease();
            v510((uint64_t)v489, v42);
            *(_WORD *)(v184 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)(v184 + 14) = sub_25A7EED88((uint64_t)v519, v180, (uint64_t *)&v522);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_25A7B3000, v181, (os_log_type_t)v495, "%s resource is adaptor %s", (uint8_t *)v184, 0x16u);
            uint64_t v193 = v497;
            swift_arrayDestroy();
            MEMORY[0x261145500](v193, -1, -1);
            MEMORY[0x261145500](v184, -1, -1);
          }
          else
          {
            uint64_t v160 = a3;

            v510((uint64_t)v179, v42);
            swift_bridgeObjectRelease_n();
          }
          uint64_t v124 = v180;
          v522 = v509;
          v523 = v512;
          swift_bridgeObjectRetain();
          sub_25A7F3060();
          swift_bridgeObjectRelease();
          v487 = v522;
          uint64_t v177 = v523;
          uint64_t v178 = &v525;
        }
      }
      *((void *)v178 - 32) = v177;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v529);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v524);
      uint64_t v132 = v520;
      unint64_t v136 = (unint64_t)v521;
      a3 = v160;
      goto LABEL_55;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A7BD1C4((uint64_t)&v526, &qword_26A464428);
    uint64_t v226 = v473;
    v515(v473, a3, v42);
    swift_bridgeObjectRetain();
    id v227 = sub_25A7F2EC0();
    os_log_type_t v228 = sub_25A7F31A0();
    int v229 = v228;
    if (os_log_type_enabled(v227, v228))
    {
      uint64_t v230 = swift_slowAlloc();
      uint64_t v502 = v143;
      uint64_t v231 = v230;
      v511 = (char *)swift_slowAlloc();
      v529 = v511;
      *(_DWORD *)uint64_t v231 = v499;
      uint64_t v232 = sub_25A7F2080();
      v497 = v442;
      uint64_t v233 = *(void *)(v232 - 8);
      MEMORY[0x270FA5388](v232);
      uint64_t v235 = (char *)v442 - ((v234 + 15) & 0xFFFFFFFFFFFFFFF0);
      LODWORD(v501) = v229;
      sub_25A7F2D70();
      sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
      uint64_t v236 = sub_25A7F3390();
      unint64_t v238 = v237;
      unint64_t v239 = v235;
      uint64_t v137 = 0;
      uint64_t v42 = v504;
      (*(void (**)(char *, uint64_t))(v233 + 8))(v239, v232);
      a3 = v506;
      *(void *)(v231 + 4) = sub_25A7EED88(v236, v238, (uint64_t *)&v529);
      swift_bridgeObjectRelease();
      v510((uint64_t)v226, v42);
      *(_WORD *)(v231 + 12) = 2080;
      unint64_t v240 = v502;
      swift_bridgeObjectRetain();
      *(void *)(v231 + 14) = sub_25A7EED88((uint64_t)v519, v240, (uint64_t *)&v529);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A7B3000, v227, (os_log_type_t)v501, "%s found no resource for identifier %s", (uint8_t *)v231, 0x16u);
      uint64_t v241 = v511;
      swift_arrayDestroy();
      MEMORY[0x261145500](v241, -1, -1);
      MEMORY[0x261145500](v231, -1, -1);
    }
    else
    {

      v510((uint64_t)v226, v42);
      swift_bridgeObjectRelease_n();
    }
    if (qword_26A464190 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (byte_26A464198 == 1)
    {
      swift_bridgeObjectRelease();
      sub_25A7F03B0();
      swift_allocError();
      *uint64_t v419 = 1;
      swift_willThrow();
      swift_release();
      sub_25A7C1340(v477, v478);
      goto LABEL_86;
    }
    uint64_t v242 = sub_25A7F31E0();
    if (!v242) {
      goto LABEL_169;
    }
    uint64_t v243 = v242;
    if (!*(void *)(v242 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_169:
      swift_bridgeObjectRelease();
      uint64_t v420 = v445;
      uint64_t v421 = v504;
      v515(v445, a3, v504);
      uint64_t v422 = sub_25A7F2EC0();
      os_log_type_t v423 = sub_25A7F31A0();
      if (os_log_type_enabled(v422, v423))
      {
        uint64_t v424 = (uint8_t *)swift_slowAlloc();
        v521 = (char *)swift_slowAlloc();
        v529 = v521;
        v520 = v424;
        *(_DWORD *)uint64_t v424 = 136315138;
        v519 = (char *)(v424 + 4);
        uint64_t v425 = sub_25A7F2080();
        v516 = (uint8_t *)v442;
        uint64_t v426 = *(void *)(v425 - 8);
        MEMORY[0x270FA5388](v425);
        uint64_t v428 = (char *)v442 - ((v427 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_25A7F2D70();
        sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
        uint64_t v429 = sub_25A7F3390();
        unint64_t v431 = v430;
        uint64_t v432 = v425;
        a3 = v506;
        (*(void (**)(char *, uint64_t))(v426 + 8))(v428, v432);
        uint64_t v433 = v517;
        *(void *)&long long v526 = sub_25A7EED88(v429, v431, (uint64_t *)&v529);
        sub_25A7F3270();
        swift_bridgeObjectRelease();
        v434 = v510;
        v510((uint64_t)v445, v504);
        uint64_t v435 = v520;
        _os_log_impl(&dword_25A7B3000, v422, v423, "%s no or empty override catalog", v520, 0xCu);
        v436 = v521;
        swift_arrayDestroy();
        MEMORY[0x261145500](v436, -1, -1);
        uint64_t v437 = v435;
        uint64_t v421 = v504;
        MEMORY[0x261145500](v437, -1, -1);
      }
      else
      {

        v434 = v510;
        v510((uint64_t)v420, v421);
        uint64_t v433 = v517;
      }
      sub_25A7F03B0();
      swift_allocError();
      *char v438 = 1;
      swift_willThrow();
      swift_release();
      sub_25A7C1340(v477, v478);
      uint64_t v439 = sub_25A7F2EE0();
      (*(void (**)(char *, uint64_t))(*(void *)(v439 - 8) + 8))(v433, v439);
      sub_25A7BD1C4(v480, &qword_26A464548);
      sub_25A7BD1C4(v481, &qword_26A464550);
      uint64_t v440 = sub_25A7F2850();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v440 - 8) + 8))(v490, v440);
      uint64_t v441 = sub_25A7F2AA0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v441 - 8) + 8))(v484, v441);
      v434(a3, v421);
      return swift_release();
    }
    sub_25A7C45C0(0x6D614E6C65646F6DLL, 0xE900000000000065);
    if (v244) {
      swift_bridgeObjectRetain();
    }
    v529 = v509;
    v530 = (char *)v512;
    swift_bridgeObjectRetain();
    sub_25A7F3060();
    swift_bridgeObjectRelease();
    uint64_t v492 = (uint64_t)v529;
    uint64_t v245 = *(void *)(v243 + 16);
    uint64_t v502 = (uint64_t)v530;
    if (v245)
    {
      sub_25A7C45C0(0xD000000000000010, v459);
      if (v246) {
        swift_bridgeObjectRetain();
      }
    }
    v529 = v509;
    v530 = (char *)v512;
    swift_bridgeObjectRetain();
    sub_25A7F3060();
    swift_bridgeObjectRelease();
    v487 = v529;
    unint64_t v495 = (unint64_t)v530;
    if (*(void *)(v243 + 16))
    {
      sub_25A7C45C0(0x657A696E656B6F54, 0xED0000656D614E72);
      a3 = v506;
      if (v247) {
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      a3 = v506;
    }
    uint64_t v124 = 0x7466617244;
    v529 = v509;
    v530 = (char *)v512;
    swift_bridgeObjectRetain();
    sub_25A7F3060();
    swift_bridgeObjectRelease();
    uint64_t v501 = (uint64_t)v529;
    v511 = v530;
    if (*(void *)(v243 + 16))
    {
      unint64_t v248 = sub_25A7C45C0(0x646F4D7466617264, 0xEE00656D614E6C65);
      if (v249)
      {
        uint64_t v124 = *(void *)(*(void *)(v243 + 56) + 16 * v248);
        swift_bridgeObjectRetain();
      }
    }
    uint64_t v250 = (char *)v512;
    swift_bridgeObjectRelease();
    v529 = v509;
    v530 = v250;
    swift_bridgeObjectRetain();
    sub_25A7F3060();
    swift_bridgeObjectRelease();
    v485 = v529;
    unint64_t v491 = (unint64_t)v530;
    uint64_t v42 = v504;
    uint64_t v132 = v520;
    unint64_t v136 = (unint64_t)v521;
    if (v521) {
      goto LABEL_18;
    }
LABEL_19:
    if (__OFADD__(v132++, 1))
    {
      __break(1u);
      goto LABEL_174;
    }
    if ((uint64_t)v132 >= v507) {
      goto LABEL_88;
    }
    unint64_t v140 = *((void *)v505 + (void)v132);
    if (!v140) {
      break;
    }
LABEL_29:
    v521 = (char *)((v140 - 1) & v140);
  }
  uint64_t v141 = v132 + 1;
  if ((uint64_t)(v132 + 1) >= v507) {
    goto LABEL_88;
  }
  unint64_t v140 = *((void *)v505 + (void)v141);
  if (v140) {
    goto LABEL_28;
  }
  uint64_t v141 = v132 + 2;
  if ((uint64_t)(v132 + 2) >= v507) {
    goto LABEL_88;
  }
  unint64_t v140 = *((void *)v505 + (void)v141);
  if (v140)
  {
LABEL_28:
    uint64_t v132 = v141;
    goto LABEL_29;
  }
  uint64_t v141 = v132 + 3;
  if ((uint64_t)(v132 + 3) < v507)
  {
    unint64_t v140 = *((void *)v505 + (void)v141);
    if (!v140)
    {
      while (1)
      {
        uint64_t v132 = v141 + 1;
        if (__OFADD__(v141, 1)) {
          break;
        }
        if ((uint64_t)v132 >= v507) {
          goto LABEL_88;
        }
        unint64_t v140 = *((void *)v505 + (void)v132);
        ++v141;
        if (v140) {
          goto LABEL_29;
        }
      }
LABEL_174:
      __break(1u);
LABEL_175:
      uint64_t v137 = sub_25A7BC4B4(0, v137[2] + 1, 1, v137);
      *(void *)uint64_t v132 = v137;
LABEL_134:
      unint64_t v343 = v137[2];
      unint64_t v342 = v137[3];
      if (v343 >= v342 >> 1)
      {
        uint64_t v137 = sub_25A7BC4B4((void *)(v342 > 1), v343 + 1, 1, v137);
        *(void *)uint64_t v132 = v137;
      }
      v137[2] = v343 + 1;
      uint64_t v344 = &v137[2 * v343];
      v344[4] = v124;
      v344[5] = v42;
      ((void (*)(char **, void))v136)(&v529, 0);
      uint64_t v308 = v504;
      goto LABEL_137;
    }
    goto LABEL_28;
  }
LABEL_88:
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v255 = sub_25A7F2080();
  uint64_t v256 = *(void *)(v255 - 8);
  int64_t v257 = *(void *)(v256 + 64);
  MEMORY[0x270FA5388](v255);
  v521 = (char *)((v257 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7F2D70();
  sub_25A7F2DB0();
  uint64_t v258 = v474;
  sub_25A7F22D0();
  uint64_t v259 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v475 + 32))(v488, v258, v476);
  v520 = (uint8_t *)v442;
  MEMORY[0x270FA5388](v259);
  uint64_t v260 = (char *)v442 - ((v257 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A7F2D70();
  uint64_t v261 = sub_25A7F2D90();
  sub_25A7CE90C((uint64_t)v260, v261, 0);
  uint64_t v262 = *(void (**)(char *, char *))(v256 + 8);
  v509 = (char *)v255;
  v508 = (char *)(v256 + 8);
  v505 = v262;
  v262(v260, (char *)v255);
  uint64_t v263 = sub_25A7F2230();
  int64_t v507 = v257;
  MEMORY[0x270FA5388](v263);
  os_log_type_t v264 = (char *)((char *)v442 - v521);
  sub_25A7F2D70();
  uint64_t v265 = sub_25A7F2D50();
  v529 = (char *)sub_25A7CE90C((uint64_t)v264, v265, 1);
  v530 = v266;
  strcpy((char *)&v526, "com.unknown.");
  BYTE13(v526) = 0;
  HIWORD(v526) = -5120;
  sub_25A7F05BC();
  if (sub_25A7F3290()) {
    swift_bridgeObjectRelease();
  }
  uint64_t v267 = v500;
  v505(v264, v509);
  sub_25A7F22B0();
  sub_25A7F2250();
  sub_25A7F2190();
  sub_25A7F21A0();
  sub_25A7F29B0();
  sub_25A7F21B0();
  unint64_t v268 = sub_25A7F2820();
  if (v269) {
    unint64_t v268 = 0;
  }
  uint64_t v270 = v518;
  if ((v268 & 0x8000000000000000) != 0) {
    goto LABEL_176;
  }
  uint64_t v271 = v517;
  if (HIDWORD(v268)) {
    goto LABEL_176;
  }
  sub_25A7F2120();
  sub_25A7F22A0();
  sub_25A7F27D0();
  sub_25A7F2150();
  unint64_t v272 = sub_25A7F27F0();
  if ((v273 & 1) == 0)
  {
    if ((v272 & 0x8000000000000000) == 0 && !HIDWORD(v272))
    {
      LOBYTE(v529) = 0;
      sub_25A7F23B0();
      goto LABEL_98;
    }
LABEL_176:
    sub_25A7F3330();
    __break(1u);
    goto LABEL_177;
  }
LABEL_98:
  sub_25A7F27E0();
  sub_25A7F2170();
  sub_25A7F2810();
  sub_25A7F2240();
  uint64_t v274 = sub_25A7F27C0();
  if ((v275 & 1) == 0 && v274 < 0) {
    goto LABEL_176;
  }
  uint64_t v276 = sub_25A7F2130();
  MEMORY[0x270FA5388](v276);
  sub_25A7F2D80();
  sub_25A7F23C0();
  sub_25A7F2830();
  sub_25A7F2320();
  sub_25A7F2800();
  sub_25A7F2180();
  sub_25A7F23A0();
  sub_25A7F30F0();
  sub_25A7F2160();
  uint64_t v277 = (uint64_t)v462;
  sub_25A7F2840();
  uint64_t v278 = sub_25A7F27B0();
  uint64_t v279 = *(void *)(v278 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v279 + 48))(v277, 1, v278) == 1)
  {
    sub_25A7BD1C4(v277, &qword_26A464598);
    uint64_t v280 = sub_25A7F2790();
    uint64_t v281 = (uint64_t)v465;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v280 - 8) + 56))(v465, 1, 1, v280);
    uint64_t v282 = (uint64_t)v467;
    goto LABEL_105;
  }
  uint64_t v281 = (uint64_t)v465;
  sub_25A7F27A0();
  (*(void (**)(uint64_t, uint64_t))(v279 + 8))(v277, v278);
  uint64_t v283 = sub_25A7F2790();
  uint64_t v284 = *(void *)(v283 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v284 + 56))(v281, 0, 1, v283);
  os_signpost_type_t v285 = v455;
  sub_25A7C7164(v281, (uint64_t)v455, &qword_26A4645A0);
  int v286 = (*(uint64_t (**)(void *, uint64_t))(v284 + 88))(v285, v283);
  uint64_t v282 = (uint64_t)v467;
  if (v286 == *MEMORY[0x263F7F928])
  {
    (*(void (**)(void *, uint64_t))(v284 + 96))(v285, v283);
    uint64_t v287 = v447;
    void *v447 = *v285;
    (*(void (**)(void *, void, uint64_t))(v449 + 104))(v287, *MEMORY[0x263F61158], v450);
    sub_25A7F2280();
LABEL_105:
    uint64_t v288 = (uint64_t)v466;
  }
  else
  {
    uint64_t v288 = (uint64_t)v466;
    if (v286 == *MEMORY[0x263F7F930])
    {
      uint64_t v518 = v270;
      uint64_t v296 = v467;
      int64_t v297 = v455;
      (*(void (**)(void *, uint64_t))(v284 + 96))(v455, v283);
      unint64_t v298 = *v297;
      if ((*v297 & 0x8000000000000000) != 0 || HIDWORD(v298)) {
        goto LABEL_176;
      }
      uint64_t v282 = (uint64_t)v296;
      uint64_t v299 = v446;
      _DWORD *v446 = v298;
      (*(void (**)(_DWORD *, void, uint64_t))(v449 + 104))(v299, *MEMORY[0x263F61160], v450);
      sub_25A7F2280();
      uint64_t v270 = v518;
    }
    else if (v286 == *MEMORY[0x263F7F938])
    {
      (*(void (**)(void *, void, uint64_t))(v449 + 104))(v447, *MEMORY[0x263F61168], v450);
      sub_25A7F2280();
    }
    else
    {
      (*(void (**)(void *, uint64_t))(v284 + 8))(v455, v283);
    }
  }
  sub_25A7BD1C4(v281, &qword_26A4645A0);
  sub_25A7C7164(v481, v288, &qword_26A464550);
  uint64_t v289 = v463;
  uint64_t v290 = v464;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v463 + 48))(v288, 1, v464) == 1)
  {
    sub_25A7BD1C4(v288, &qword_26A464550);
  }
  else
  {
    uint64_t v518 = v270;
    uint64_t v291 = v288;
    uint64_t v292 = v452;
    (*(void (**)(char *, uint64_t, uint64_t))(v289 + 32))(v452, v291, v290);
    Constraints.toTMLConstraints(logger:)(v271, v451);
    if (v137)
    {
      swift_release();
      sub_25A7C1340(v477, v478);
      uint64_t v293 = sub_25A7F2EE0();
      (*(void (**)(char *, uint64_t))(*(void *)(v293 - 8) + 8))(v271, v293);
      sub_25A7BD1C4(v480, &qword_26A464548);
      sub_25A7BD1C4(v481, &qword_26A464550);
      uint64_t v294 = sub_25A7F2850();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v294 - 8) + 8))(v490, v294);
      uint64_t v295 = sub_25A7F2AA0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v295 - 8) + 8))(v484, v295);
      v510(v506, v504);
      (*(void (**)(char *, uint64_t))(v289 + 8))(v292, v290);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v475 + 8))(v488, v476);
    }
    sub_25A7F21C0();
    (*(void (**)(char *, uint64_t))(v289 + 8))(v292, v290);
  }
  sub_25A7F2D60();
  uint64_t v300 = sub_25A7F2C40();
  uint64_t v301 = *(void *)(v300 - 8);
  int v302 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v301 + 48))(v282, 1, v300);
  if (v302 == 1)
  {
    sub_25A7BD1C4(v282, &qword_26A4644C0);
  }
  else
  {
    sub_25A7F2C20();
    (*(void (**)(uint64_t, uint64_t))(v301 + 8))(v282, v300);
  }
  unint64_t v303 = v483;
  LOBYTE(v529) = v302 == 1;
  sub_25A7F2290();
  uint64_t v304 = v456;
  sub_25A7C7164(v480, v456, &qword_26A464548);
  uint64_t v305 = v468;
  uint64_t v306 = v469;
  int v307 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v468 + 48))(v304, 1, v469);
  uint64_t v308 = v504;
  v497 = v137;
  if (v307 == 1)
  {
    sub_25A7BD1C4(v304, &qword_26A464548);
    uint64_t v309 = sub_25A7F29F0();
    uint64_t v310 = *(void *)(v309 + 16);
    if (v310)
    {
      v519 = *(char **)(v494 + 16);
      unint64_t v311 = (*(unsigned __int8 *)(v494 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v494 + 80);
      uint64_t v502 = v309;
      unint64_t v312 = v309 + v311;
      uint64_t v513 = *(void *)(v494 + 72);
      v512 = (void *)(v454 + 8);
      v520 = (uint8_t *)(v494 + 16);
      v511 = (char *)(v494 + 8);
      id v313 = &qword_26A4645C0;
      uint64_t v314 = v303;
      ((void (*)(char *, unint64_t, uint64_t))v519)(v303, v309 + v311, v267);
      while (1)
      {
        uint64_t v315 = __swift_instantiateConcreteTypeFromMangledName(v313);
        v521 = (char *)v442;
        MEMORY[0x270FA5388](v315 - 8);
        uint64_t v317 = (char *)v442 - ((v316 + 15) & 0xFFFFFFFFFFFFFFF0);
        unint64_t v318 = v313;
        uint64_t v319 = v486;
        sub_25A7F2A30();
        sub_25A7F29D0();
        ((void (*)(char *, uint64_t))*v512)(v319, v498);
        uint64_t v320 = sub_25A7F20A0();
        uint64_t v321 = *(void *)(v320 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v321 + 48))(v317, 1, v320) == 1)
        {
          sub_25A7BD1C4((uint64_t)v317, v318);
          id v313 = v318;
        }
        else
        {
          uint64_t v322 = sub_25A7F2090();
          uint64_t v324 = v323;
          (*(void (**)(char *, uint64_t))(v321 + 8))(v317, v320);
          os_log_type_t v325 = (void (*)(char **, void))sub_25A7F2300();
          uint64_t v327 = v326;
          id v328 = *v326;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v327 = v328;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            id v328 = sub_25A7BC4B4(0, v328[2] + 1, 1, v328);
            *uint64_t v327 = v328;
          }
          unint64_t v331 = v328[2];
          unint64_t v330 = v328[3];
          if (v331 >= v330 >> 1)
          {
            id v328 = sub_25A7BC4B4((void *)(v330 > 1), v331 + 1, 1, v328);
            *uint64_t v327 = v328;
          }
          v328[2] = v331 + 1;
          uint64_t v332 = &v328[2 * v331];
          v332[4] = v322;
          v332[5] = v324;
          v325(&v529, 0);
          uint64_t v314 = v483;
          id v313 = &qword_26A4645C0;
        }
        uint64_t v267 = v500;
        (*(void (**)(char *, uint64_t))v511)(v314, v500);
        v312 += v513;
        if (!--v310) {
          break;
        }
        ((void (*)(char *, unint64_t, uint64_t))v519)(v314, v312, v267);
      }
      swift_bridgeObjectRelease();
      uint64_t v338 = v506;
      uint64_t v308 = v504;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v338 = v506;
    }
    uint64_t v358 = v448;
    v515(v448, v338, v308);
    uint64_t v359 = sub_25A7F2EC0();
    os_log_type_t v360 = sub_25A7F31A0();
    if (os_log_type_enabled(v359, v360))
    {
      uint64_t v361 = (uint8_t *)swift_slowAlloc();
      uint64_t v362 = swift_slowAlloc();
      v521 = (char *)v362;
      v519 = (char *)v442;
      v529 = (char *)v362;
      *(_DWORD *)uint64_t v361 = 136315138;
      v520 = v361 + 4;
      MEMORY[0x270FA5388](v362);
      int v364 = (char *)v442 - ((v363 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_25A7F2D70();
      sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
      uint64_t v365 = (uint64_t)v509;
      uint64_t v366 = sub_25A7F3390();
      unint64_t v368 = v367;
      v505(v364, (char *)v365);
      *(void *)&long long v526 = sub_25A7EED88(v366, v368, (uint64_t *)&v529);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      v510((uint64_t)v358, v504);
      _os_log_impl(&dword_25A7B3000, v359, v360, "%s Setup CompletePrompt.", v361, 0xCu);
      uint64_t v369 = v521;
      swift_arrayDestroy();
      uint64_t v267 = v500;
      MEMORY[0x261145500](v369, -1, -1);
      MEMORY[0x261145500](v361, -1, -1);
    }
    else
    {

      v510((uint64_t)v358, v308);
    }
    uint64_t v357 = v497;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v305 + 32))(v460, v304, v306);
    uint64_t v333 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4645C0);
    MEMORY[0x270FA5388](v333 - 8);
    v335 = (char *)v442 - ((v334 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25A7F2BE0();
    uint64_t v336 = sub_25A7F20A0();
    uint64_t v337 = *(void *)(v336 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v337 + 48))(v335, 1, v336) != 1)
    {
      uint64_t v124 = sub_25A7F2090();
      uint64_t v42 = v339;
      (*(void (**)(char *, uint64_t))(v337 + 8))(v335, v336);
      unint64_t v136 = sub_25A7F2300();
      uint64_t v132 = v340;
      uint64_t v137 = *(void **)v340;
      char v341 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)uint64_t v132 = v137;
      if ((v341 & 1) == 0) {
        goto LABEL_175;
      }
      goto LABEL_134;
    }
    sub_25A7BD1C4((uint64_t)v335, &qword_26A4645C0);
LABEL_137:
    id v345 = v460;
    sub_25A7F2BC0();
    sub_25A7F2270();
    sub_25A7F2BD0();
    sub_25A7F22F0();
    id v346 = v453;
    v515(v453, v506, v308);
    uint64_t v347 = sub_25A7F2EC0();
    os_log_type_t v348 = sub_25A7F31A0();
    if (os_log_type_enabled(v347, v348))
    {
      uint64_t v349 = (uint8_t *)swift_slowAlloc();
      uint64_t v350 = swift_slowAlloc();
      v520 = (uint8_t *)v442;
      v529 = (char *)v350;
      *(_DWORD *)uint64_t v349 = 136315138;
      v521 = (char *)(v349 + 4);
      MEMORY[0x270FA5388](v350);
      uint64_t v352 = (char *)v442 - ((v351 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_25A7F2D70();
      sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
      uint64_t v353 = (uint64_t)v509;
      uint64_t v354 = sub_25A7F3390();
      unint64_t v356 = v355;
      v505(v352, (char *)v353);
      *(void *)&long long v526 = sub_25A7EED88(v354, v356, (uint64_t *)&v529);
      sub_25A7F3270();
      swift_bridgeObjectRelease();
      v510((uint64_t)v453, v504);
      _os_log_impl(&dword_25A7B3000, v347, v348, "%s Setup PromptTemplate.", v349, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261145500](v350, -1, -1);
      MEMORY[0x261145500](v349, -1, -1);

      (*(void (**)(char *, uint64_t))(v468 + 8))(v460, v469);
    }
    else
    {
      v510((uint64_t)v346, v308);

      (*(void (**)(char *, uint64_t))(v468 + 8))(v345, v469);
    }
    uint64_t v357 = v497;
    uint64_t v267 = v500;
  }
  v512 = (void *)sub_25A7F2A20();
  v511 = v370;
  uint64_t v371 = sub_25A7F29F0();
  int64_t v372 = *(void *)(v371 + 16);
  if (v372)
  {
    v497 = v357;
    v529 = (char *)MEMORY[0x263F8EE78];
    sub_25A7EF518(0, v372, 0);
    v521 = *(char **)(v494 + 16);
    unint64_t v373 = (*(unsigned __int8 *)(v494 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v494 + 80);
    uint64_t v502 = v371;
    unint64_t v374 = v371 + v373;
    v520 = *(uint8_t **)(v494 + 72);
    v519 = (char *)(v454 + 8);
    v494 += 16;
    uint64_t v513 = v494 - 8;
    while (1)
    {
      ((void (*)(char *, unint64_t, uint64_t))v521)(v503, v374, v267);
      uint64_t v375 = v493;
      sub_25A7F2A30();
      uint64_t v376 = sub_25A7F29C0();
      uint64_t v378 = v377;
      (*(void (**)(char *, uint64_t))v519)(v375, v498);
      unint64_t v379 = sub_25A7F2A40();
      if ((v379 & 0x8000000000000000) != 0) {
        goto LABEL_176;
      }
      int v380 = v379;
      if (HIDWORD(v379)) {
        goto LABEL_176;
      }
      (*(void (**)(char *, uint64_t))v513)(v503, v267);
      uint64_t v381 = (uint64_t)v529;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25A7EF518(0, *(void *)(v381 + 16) + 1, 1);
        uint64_t v381 = (uint64_t)v529;
      }
      unint64_t v383 = *(void *)(v381 + 16);
      unint64_t v382 = *(void *)(v381 + 24);
      if (v383 >= v382 >> 1)
      {
        sub_25A7EF518(v382 > 1, v383 + 1, 1);
        uint64_t v381 = (uint64_t)v529;
      }
      *(void *)(v381 + 16) = v383 + 1;
      uint64_t v384 = v381 + 24 * v383;
      *(void *)(v384 + 32) = v376;
      *(void *)(v384 + 40) = v378;
      *(_DWORD *)(v384 + 48) = v380;
      v374 += (unint64_t)v520;
      --v372;
      uint64_t v267 = v500;
      if (!v372)
      {
        swift_bridgeObjectRelease();
        uint64_t v357 = v497;
        goto LABEL_157;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v381 = MEMORY[0x263F8EE78];
LABEL_157:
  uint64_t v385 = v506;
  uint64_t v386 = v470;
  if (*(void *)(v381 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464350);
    uint64_t v387 = sub_25A7F3360();
  }
  else
  {
    uint64_t v387 = MEMORY[0x263F8EE80];
  }
  v529 = (char *)v387;
  sub_25A7F0610(v381, 1, &v529);
  v497 = v357;
  if (v357)
  {
LABEL_177:
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  uint64_t v388 = v488;
  sub_25A7F2260();
  sub_25A7F22E0();
  sub_25A7F2310();
  uint64_t v389 = v457;
  sub_25A7F21D0();
  uint64_t v390 = sub_25A7F21F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v390 - 8) + 56))(v389, 0, 1, v390);
  sub_25A7F2210();
  uint64_t v391 = v475;
  uint64_t v392 = v474;
  uint64_t v393 = v476;
  (*(void (**)(char *, uint64_t, uint64_t))(v475 + 16))(v474, v388, v476);
  uint64_t v394 = (uint8_t *)sub_25A7F2140();
  unint64_t v396 = v395;
  (*(void (**)(char *, uint64_t))(v391 + 8))(v392, v393);
  uint64_t v397 = v504;
  v515(v386, v385, v504);
  swift_bridgeObjectRetain();
  uint64_t v398 = v517;
  uint64_t v399 = sub_25A7F2EC0();
  os_log_type_t v400 = sub_25A7F3180();
  if (os_log_type_enabled(v399, v400))
  {
    uint64_t v401 = swift_slowAlloc();
    uint64_t v402 = swift_slowAlloc();
    v521 = (char *)v402;
    v516 = (uint8_t *)v442;
    v529 = (char *)v402;
    *(_DWORD *)uint64_t v401 = 136315395;
    v519 = (char *)(v401 + 4);
    MEMORY[0x270FA5388](v402);
    v520 = v394;
    uint64_t v404 = (char *)v442 - ((v403 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v405 = v397;
    uint64_t v406 = (uint64_t)v509;
    uint64_t v407 = sub_25A7F3390();
    unint64_t v409 = v408;
    v505(v404, (char *)v406);
    *(void *)&long long v526 = sub_25A7EED88(v407, v409, (uint64_t *)&v529);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    uint64_t v410 = (uint64_t (*)(uint64_t, uint64_t))v510;
    v510((uint64_t)v470, v405);
    *(_WORD *)(v401 + 12) = 2081;
    swift_bridgeObjectRetain();
    *(void *)&long long v526 = sub_25A7EED88((uint64_t)v520, v396, (uint64_t *)&v529);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A7B3000, v399, v400, "%s initialized request %{private}s", (uint8_t *)v401, 0x16u);
    v411 = v521;
    swift_arrayDestroy();
    MEMORY[0x261145500](v411, -1, -1);
    MEMORY[0x261145500](v401, -1, -1);
    swift_release();
    sub_25A7C1340(v477, v478);

    uint64_t v412 = sub_25A7F2EE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v412 - 8) + 8))(v517, v412);
    sub_25A7BD1C4(v480, &qword_26A464548);
    sub_25A7BD1C4(v481, &qword_26A464550);
    uint64_t v413 = sub_25A7F2850();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v413 - 8) + 8))(v490, v413);
    uint64_t v414 = sub_25A7F2AA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v414 - 8) + 8))(v484, v414);
    return v410(v506, v405);
  }
  else
  {
    swift_release();
    sub_25A7C1340(v477, v478);
    swift_bridgeObjectRelease_n();

    uint64_t v415 = (uint64_t (*)(uint64_t, uint64_t))v510;
    v510((uint64_t)v386, v397);
    uint64_t v416 = sub_25A7F2EE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v416 - 8) + 8))(v398, v416);
    sub_25A7BD1C4(v480, &qword_26A464548);
    sub_25A7BD1C4(v481, &qword_26A464550);
    uint64_t v417 = sub_25A7F2850();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v417 - 8) + 8))(v490, v417);
    uint64_t v418 = sub_25A7F2AA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v418 - 8) + 8))(v484, v418);
    return v415(v385, v397);
  }
}

uint64_t sub_25A7EBC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 192) = v19;
  *(_OWORD *)(v8 + 176) = v18;
  *(void *)(v8 + 160) = a7;
  *(void *)(v8 + 168) = a8;
  *(void *)(v8 + 144) = a5;
  *(void *)(v8 + 152) = a6;
  *(void *)(v8 + 128) = a3;
  *(void *)(v8 + 136) = a4;
  *(void *)(v8 + 112) = a1;
  *(void *)(v8 + 120) = a2;
  uint64_t v9 = sub_25A7F2E30();
  *(void *)(v8 + 200) = v9;
  *(void *)(v8 + 208) = *(void *)(v9 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  *(void *)(v8 + 224) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2F50();
  *(void *)(v8 + 232) = v10;
  *(void *)(v8 + 240) = *(void *)(v10 - 8);
  *(void *)(v8 + 248) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2360();
  *(void *)(v8 + 256) = v11;
  *(void *)(v8 + 264) = *(void *)(v11 - 8);
  *(void *)(v8 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 288) = _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  *(void *)(v8 + 296) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644C0);
  *(void *)(v8 + 304) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2390();
  *(void *)(v8 + 312) = v12;
  *(void *)(v8 + 320) = *(void *)(v12 - 8);
  *(void *)(v8 + 328) = swift_task_alloc();
  uint64_t v13 = sub_25A7F3310();
  *(void *)(v8 + 336) = v13;
  *(void *)(v8 + 344) = *(void *)(v13 - 8);
  *(void *)(v8 + 352) = swift_task_alloc();
  *(void *)(v8 + 360) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2EE0();
  *(void *)(v8 + 368) = v14;
  *(void *)(v8 + 376) = *(void *)(v14 - 8);
  *(void *)(v8 + 384) = swift_task_alloc();
  *(void *)(v8 + 392) = swift_task_alloc();
  *(void *)(v8 + 400) = swift_task_alloc();
  *(void *)(v8 + 408) = _s18InstrumentedTokensVMa(0);
  *(void *)(v8 + 416) = swift_task_alloc();
  uint64_t v15 = sub_25A7F2DC0();
  *(void *)(v8 + 424) = v15;
  *(void *)(v8 + 432) = *(void *)(v15 - 8);
  *(void *)(v8 + 440) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7EC018, 0, 0);
}

uint64_t sub_25A7EC018()
{
  unint64_t v102 = v0;
  uint64_t v85 = (long long *)(v0 + 2);
  uint64_t v87 = (uint64_t)(v0 + 7);
  uint64_t v1 = v0[16] + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(void, void, void))(v0[54] + 16))(v0[55], v0[17], v0[53]);
  uint64_t v97 = v1;
  uint64_t v2 = sub_25A7F2EC0();
  os_log_type_t v3 = sub_25A7F31A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v83 = v0[55];
    uint64_t v88 = v0[54];
    uint64_t v94 = v0[53];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    v101[0] = v91;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = sub_25A7F2080();
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = swift_task_alloc();
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v8 = sub_25A7F3390();
    unint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
    swift_task_dealloc();
    v0[13] = sub_25A7EED88(v8, v10, v101);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v83, v94);
    _os_log_impl(&dword_25A7B3000, v2, v3, "%s waiting for private ML response tokens", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v91, -1, -1);
    MEMORY[0x261145500](v4, -1, -1);
  }
  else
  {
    uint64_t v12 = v0[54];
    uint64_t v11 = v0[55];
    uint64_t v13 = v0[53];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  uint64_t v14 = v0[45];
  uint64_t v15 = v0[42];
  uint64_t v16 = v0[43];
  uint64_t v17 = v0[40];
  uint64_t v81 = v0[41];
  uint64_t v18 = v0[38];
  uint64_t v19 = v0[39];
  uint64_t v89 = v0[21];
  uint64_t v20 = v0[15];
  uint64_t v21 = v0[16];
  uint64_t v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[47] + 16);
  v84(v0[50], v97, v0[46]);
  uint64_t v22 = sub_25A7F2080();
  uint64_t v95 = *(void *)(v22 - 8);
  uint64_t v98 = v22;
  uint64_t v65 = swift_task_alloc();
  sub_25A7F22C0();
  uint64_t v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v80(v14, v21 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v81, v20, v19);
  sub_25A7C56F4(v89, (uint64_t)v85);
  sub_25A7F2D60();
  uint64_t v23 = sub_25A7F2C40();
  uint64_t v24 = *(void *)(v23 - 8);
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v18, 1, v23);
  uint64_t v26 = v0[38];
  if (v25 == 1)
  {
    sub_25A7BD1C4(v0[38], &qword_26A4644C0);
    int v82 = 0;
  }
  else
  {
    int v82 = sub_25A7F2C20();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v23);
  }
  BOOL v77 = v25 == 1;
  uint64_t v28 = (int *)v0[51];
  uint64_t v27 = v0[52];
  uint64_t v75 = v0[49];
  uint64_t v67 = v0[48];
  uint64_t v70 = v0[47];
  uint64_t v90 = v0[46];
  uint64_t v60 = v0[45];
  uint64_t v29 = v0[43];
  uint64_t v92 = v0[44];
  uint64_t v64 = v29;
  uint64_t v30 = v0[42];
  uint64_t v31 = v0[40];
  uint64_t v62 = v0[37];
  uint64_t v78 = v0[35];
  uint64_t v79 = v0[34];
  uint64_t v73 = v0[33];
  uint64_t v74 = v0[32];
  uint64_t v68 = v0[31];
  uint64_t v71 = v0[30];
  uint64_t v72 = v0[29];
  uint64_t v33 = v0[19];
  uint64_t v32 = v0[20];
  uint64_t v76 = (int *)v0[36];
  uint64_t v63 = v33;
  (*(void (**)(uint64_t, void))(v70 + 32))(v27, v0[50]);
  uint64_t v34 = v27 + v28[5];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 32))(v34, v65, v98);
  uint64_t v35 = (void *)(v27 + v28[6]);
  *uint64_t v35 = v33;
  v35[1] = v32;
  uint64_t v36 = v27 + v28[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v36, v60, v30);
  (*(void (**)(void))(v31 + 32))();
  uint64_t v37 = v27 + v28[9];
  sub_25A7EEEA0(v85, v37);
  uint64_t v38 = v27 + v28[10];
  *(_DWORD *)uint64_t v38 = v82;
  *(unsigned char *)(v38 + 4) = v77;
  swift_task_dealloc();
  v84(v75, v27, v90);
  uint64_t v86 = swift_task_alloc();
  uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 16);
  v61(v86, v34, v98);
  v80(v92, v36, v30);
  uint64_t v39 = sub_25A7F2F20();
  uint64_t v40 = *(void (**)(void))(*(void *)(v39 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v40)(v78, 1, 1, v39);
  swift_bridgeObjectRetain_n();
  sub_25A7F2370();
  sub_25A7C56F4(v37, v87);
  uint64_t v69 = v62 + v76[9];
  v40();
  uint64_t v66 = v76[13];
  *(void *)(v62 + v66) = 0;
  v84(v62, v75, v90);
  v61(v62 + v76[5], v86, v98);
  uint64_t v41 = (void *)(v62 + v76[6]);
  *uint64_t v41 = v63;
  v41[1] = v32;
  v80(v62 + v76[7], v92, v30);
  sub_25A7C56F4(v87, v62 + v76[11]);
  v84(v67, v75, v90);
  swift_bridgeObjectRetain();
  LOBYTE(v101[0]) = v77;
  sub_25A7F2F30();
  __swift_destroy_boxed_opaque_existential_1(v87);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v92, v30);
  (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v86, v98);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v75, v90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 32))(v62 + v76[8], v68, v72);
  sub_25A7C5C34(v78, v69);
  *(void *)(v62 + v66) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v62 + v76[10], v79, v74);
  uint64_t v42 = v62 + v76[12];
  *(_DWORD *)uint64_t v42 = v82;
  *(unsigned char *)(v42 + 4) = v77;
  swift_task_dealloc();
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v43 = sub_25A7F2E50();
  os_signpost_type_t v44 = sub_25A7F3240();
  char v45 = sub_25A7F3250();
  uint64_t v46 = v0[28];
  if (v45)
  {
    uint64_t v93 = v0[27];
    os_signpost_type_t v96 = v44;
    uint64_t v47 = v0[26];
    uint64_t v99 = v0[25];
    uint64_t v48 = v0[19];
    unint64_t v49 = v0[20];
    (*(void (**)(void))(v47 + 16))();
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v101[0] = v51;
    *(_DWORD *)uint64_t v50 = 136446210;
    swift_bridgeObjectRetain();
    v0[12] = sub_25A7EED88(v48, v49, v101);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v52 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v43, v96, v52, "executePrivateMLRequest", "waiting for tokens requestIdentifier=%{public, signpost.description=attribute,public}s)", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v51, -1, -1);
    MEMORY[0x261145500](v50, -1, -1);

    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v53(v46, v99);
    v53(v93, v99);
  }
  else
  {
    uint64_t v54 = v0[25];
    uint64_t v55 = v0[26];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v46, v54);
  }
  uint64_t v100 = (uint64_t (*)(uint64_t, uint64_t))(v0[23] + *(int *)v0[23]);
  uint64_t v56 = (void *)swift_task_alloc();
  v0[56] = v56;
  *uint64_t v56 = v0;
  v56[1] = sub_25A7ECB08;
  uint64_t v57 = v0[37];
  uint64_t v58 = v0[14];
  return v100(v58, v57);
}

uint64_t sub_25A7ECB08()
{
  *(void *)(*(void *)v1 + 456) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7F1340;
  }
  else {
    uint64_t v2 = sub_25A7F1330;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7ECC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 192) = v19;
  *(_OWORD *)(v8 + 176) = v18;
  *(void *)(v8 + 160) = a7;
  *(void *)(v8 + 168) = a8;
  *(void *)(v8 + 144) = a5;
  *(void *)(v8 + 152) = a6;
  *(void *)(v8 + 128) = a3;
  *(void *)(v8 + 136) = a4;
  *(void *)(v8 + 112) = a1;
  *(void *)(v8 + 120) = a2;
  uint64_t v9 = sub_25A7F2E30();
  *(void *)(v8 + 200) = v9;
  *(void *)(v8 + 208) = *(void *)(v9 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  *(void *)(v8 + 224) = swift_task_alloc();
  uint64_t v10 = sub_25A7F2F50();
  *(void *)(v8 + 232) = v10;
  *(void *)(v8 + 240) = *(void *)(v10 - 8);
  *(void *)(v8 + 248) = swift_task_alloc();
  uint64_t v11 = sub_25A7F2360();
  *(void *)(v8 + 256) = v11;
  *(void *)(v8 + 264) = *(void *)(v11 - 8);
  *(void *)(v8 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464360);
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 288) = _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  *(void *)(v8 + 296) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4644C0);
  *(void *)(v8 + 304) = swift_task_alloc();
  uint64_t v12 = sub_25A7F2390();
  *(void *)(v8 + 312) = v12;
  *(void *)(v8 + 320) = *(void *)(v12 - 8);
  *(void *)(v8 + 328) = swift_task_alloc();
  uint64_t v13 = sub_25A7F3310();
  *(void *)(v8 + 336) = v13;
  *(void *)(v8 + 344) = *(void *)(v13 - 8);
  *(void *)(v8 + 352) = swift_task_alloc();
  *(void *)(v8 + 360) = swift_task_alloc();
  uint64_t v14 = sub_25A7F2EE0();
  *(void *)(v8 + 368) = v14;
  *(void *)(v8 + 376) = *(void *)(v14 - 8);
  *(void *)(v8 + 384) = swift_task_alloc();
  *(void *)(v8 + 392) = swift_task_alloc();
  *(void *)(v8 + 400) = swift_task_alloc();
  *(void *)(v8 + 408) = _s18InstrumentedTokensVMa(0);
  *(void *)(v8 + 416) = swift_task_alloc();
  uint64_t v15 = sub_25A7F2DC0();
  *(void *)(v8 + 424) = v15;
  *(void *)(v8 + 432) = *(void *)(v15 - 8);
  *(void *)(v8 + 440) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7ED020, 0, 0);
}

uint64_t sub_25A7ED020()
{
  unint64_t v102 = v0;
  uint64_t v85 = (long long *)(v0 + 2);
  uint64_t v87 = (uint64_t)(v0 + 7);
  uint64_t v1 = v0[16] + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(void, void, void))(v0[54] + 16))(v0[55], v0[17], v0[53]);
  uint64_t v97 = v1;
  uint64_t v2 = sub_25A7F2EC0();
  os_log_type_t v3 = sub_25A7F31A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v83 = v0[55];
    uint64_t v88 = v0[54];
    uint64_t v94 = v0[53];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    v101[0] = v91;
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v5 = sub_25A7F2080();
    uint64_t v6 = *(void *)(v5 - 8);
    uint64_t v7 = swift_task_alloc();
    sub_25A7F2D70();
    sub_25A7F0358((unint64_t *)&qword_26A464390, MEMORY[0x270FA96A8]);
    uint64_t v8 = sub_25A7F3390();
    unint64_t v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
    swift_task_dealloc();
    v0[13] = sub_25A7EED88(v8, v10, v101);
    sub_25A7F3270();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v83, v94);
    _os_log_impl(&dword_25A7B3000, v2, v3, "%s waiting for private ML response tokens", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v91, -1, -1);
    MEMORY[0x261145500](v4, -1, -1);
  }
  else
  {
    uint64_t v12 = v0[54];
    uint64_t v11 = v0[55];
    uint64_t v13 = v0[53];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  uint64_t v14 = v0[45];
  uint64_t v15 = v0[42];
  uint64_t v16 = v0[43];
  uint64_t v17 = v0[40];
  uint64_t v81 = v0[41];
  uint64_t v18 = v0[38];
  uint64_t v19 = v0[39];
  uint64_t v89 = v0[21];
  uint64_t v20 = v0[15];
  uint64_t v21 = v0[16];
  uint64_t v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[47] + 16);
  v84(v0[50], v97, v0[46]);
  uint64_t v22 = sub_25A7F2080();
  uint64_t v95 = *(void *)(v22 - 8);
  uint64_t v98 = v22;
  uint64_t v65 = swift_task_alloc();
  sub_25A7F22C0();
  uint64_t v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v80(v14, v21 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v81, v20, v19);
  sub_25A7C56F4(v89, (uint64_t)v85);
  sub_25A7F2D60();
  uint64_t v23 = sub_25A7F2C40();
  uint64_t v24 = *(void *)(v23 - 8);
  int v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v18, 1, v23);
  uint64_t v26 = v0[38];
  if (v25 == 1)
  {
    sub_25A7BD1C4(v0[38], &qword_26A4644C0);
    int v82 = 0;
  }
  else
  {
    int v82 = sub_25A7F2C20();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v23);
  }
  BOOL v77 = v25 == 1;
  uint64_t v28 = (int *)v0[51];
  uint64_t v27 = v0[52];
  uint64_t v75 = v0[49];
  uint64_t v67 = v0[48];
  uint64_t v70 = v0[47];
  uint64_t v90 = v0[46];
  uint64_t v60 = v0[45];
  uint64_t v29 = v0[43];
  uint64_t v92 = v0[44];
  uint64_t v64 = v29;
  uint64_t v30 = v0[42];
  uint64_t v31 = v0[40];
  uint64_t v62 = v0[37];
  uint64_t v78 = v0[35];
  uint64_t v79 = v0[34];
  uint64_t v73 = v0[33];
  uint64_t v74 = v0[32];
  uint64_t v68 = v0[31];
  uint64_t v71 = v0[30];
  uint64_t v72 = v0[29];
  uint64_t v33 = v0[19];
  uint64_t v32 = v0[20];
  uint64_t v76 = (int *)v0[36];
  uint64_t v63 = v33;
  (*(void (**)(uint64_t, void))(v70 + 32))(v27, v0[50]);
  uint64_t v34 = v27 + v28[5];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 32))(v34, v65, v98);
  uint64_t v35 = (void *)(v27 + v28[6]);
  *uint64_t v35 = v33;
  v35[1] = v32;
  uint64_t v36 = v27 + v28[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v36, v60, v30);
  (*(void (**)(void))(v31 + 32))();
  uint64_t v37 = v27 + v28[9];
  sub_25A7EEEA0(v85, v37);
  uint64_t v38 = v27 + v28[10];
  *(_DWORD *)uint64_t v38 = v82;
  *(unsigned char *)(v38 + 4) = v77;
  swift_task_dealloc();
  v84(v75, v27, v90);
  uint64_t v86 = swift_task_alloc();
  uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 16);
  v61(v86, v34, v98);
  v80(v92, v36, v30);
  uint64_t v39 = sub_25A7F2F20();
  uint64_t v40 = *(void (**)(void))(*(void *)(v39 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v40)(v78, 1, 1, v39);
  swift_bridgeObjectRetain_n();
  sub_25A7F2370();
  sub_25A7C56F4(v37, v87);
  uint64_t v69 = v62 + v76[9];
  v40();
  uint64_t v66 = v76[13];
  *(void *)(v62 + v66) = 0;
  v84(v62, v75, v90);
  v61(v62 + v76[5], v86, v98);
  uint64_t v41 = (void *)(v62 + v76[6]);
  *uint64_t v41 = v63;
  v41[1] = v32;
  v80(v62 + v76[7], v92, v30);
  sub_25A7C56F4(v87, v62 + v76[11]);
  v84(v67, v75, v90);
  swift_bridgeObjectRetain();
  LOBYTE(v101[0]) = v77;
  sub_25A7F2F30();
  __swift_destroy_boxed_opaque_existential_1(v87);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v92, v30);
  (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v86, v98);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v75, v90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 32))(v62 + v76[8], v68, v72);
  sub_25A7C5C34(v78, v69);
  *(void *)(v62 + v66) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v62 + v76[10], v79, v74);
  uint64_t v42 = v62 + v76[12];
  *(_DWORD *)uint64_t v42 = v82;
  *(unsigned char *)(v42 + 4) = v77;
  swift_task_dealloc();
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v43 = sub_25A7F2E50();
  os_signpost_type_t v44 = sub_25A7F3240();
  char v45 = sub_25A7F3250();
  uint64_t v46 = v0[28];
  if (v45)
  {
    uint64_t v93 = v0[27];
    os_signpost_type_t v96 = v44;
    uint64_t v47 = v0[26];
    uint64_t v99 = v0[25];
    uint64_t v48 = v0[19];
    unint64_t v49 = v0[20];
    (*(void (**)(void))(v47 + 16))();
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v101[0] = v51;
    *(_DWORD *)uint64_t v50 = 136446210;
    swift_bridgeObjectRetain();
    v0[12] = sub_25A7EED88(v48, v49, v101);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v52 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v43, v96, v52, "executePrivateMLRequest", "waiting for tokens requestIdentifier=%{public, signpost.description=attribute,public}s)", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v51, -1, -1);
    MEMORY[0x261145500](v50, -1, -1);

    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v53(v46, v99);
    v53(v93, v99);
  }
  else
  {
    uint64_t v54 = v0[25];
    uint64_t v55 = v0[26];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v46, v54);
  }
  uint64_t v100 = (uint64_t (*)(uint64_t, uint64_t))(v0[23] + *(int *)v0[23]);
  uint64_t v56 = (void *)swift_task_alloc();
  v0[56] = v56;
  *uint64_t v56 = v0;
  v56[1] = sub_25A7EDB10;
  uint64_t v57 = v0[37];
  uint64_t v58 = v0[14];
  return v100(v58, v57);
}

uint64_t sub_25A7EDB10()
{
  *(void *)(*(void *)v1 + 456) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A7EDDA0;
  }
  else {
    uint64_t v2 = sub_25A7EDC24;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A7EDC24()
{
  uint64_t v1 = v0[52];
  uint64_t v2 = v0[37];
  sub_25A7EDF1C(v0[22], v2, v0[16], v0[19], v0[20]);
  sub_25A7F055C(v2, _s18InstrumentedTokensV13AsyncIteratorVMa);
  sub_25A7F055C(v1, _s18InstrumentedTokensVMa);
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
  os_log_type_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A7EDDA0()
{
  uint64_t v1 = v0[52];
  uint64_t v2 = v0[37];
  sub_25A7EDF1C(v0[22], v2, v0[16], v0[19], v0[20]);
  sub_25A7F055C(v2, _s18InstrumentedTokensV13AsyncIteratorVMa);
  sub_25A7F055C(v1, _s18InstrumentedTokensVMa);
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
  os_log_type_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25A7EDF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v7 = sub_25A7F2E30();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v23[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v23[-v12];
  _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  sub_25A7F2F80();
  sub_25A7F2E50();
  sub_25A7F2E00();
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_25A7F2E50();
  int v15 = sub_25A7F3240();
  if (sub_25A7F3250())
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v25 = v7;
    uint64_t v16 = swift_slowAlloc();
    int v24 = v15;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v27 = v18;
    *(_DWORD *)uint64_t v17 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_25A7EED88(a4, a5, &v27);
    sub_25A7F3270();
    swift_bridgeObjectRelease_n();
    os_signpost_id_t v19 = sub_25A7F2E10();
    _os_signpost_emit_with_name_impl(&dword_25A7B3000, v14, (os_signpost_type_t)v24, v19, "executePrivateMLRequest", "request complete requestIdentifier=%{public, signpost.description=attribute,public}s)", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261145500](v18, -1, -1);
    MEMORY[0x261145500](v17, -1, -1);

    uint64_t v20 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    uint64_t v21 = v25;
    v20(v13, v25);
    return ((uint64_t (*)(unsigned char *, uint64_t))v20)(v11, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
  }
}

uint64_t NewInferenceProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  uint64_t v2 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant;
  uint64_t v4 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  uint64_t v6 = sub_25A7F2E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t NewInferenceProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  uint64_t v2 = sub_25A7F2EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant;
  uint64_t v4 = sub_25A7F3310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  uint64_t v6 = sub_25A7F2E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v7, v8);
}

uint64_t sub_25A7EE3F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25A7F2EE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_26B32BB78 != -1) {
    swift_once();
  }
  uint64_t v8 = v6 + v7;
  uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26B32BBF8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  sub_25A7F32E0();
  v10((uint64_t)v5, v8, v2);
  uint64_t result = sub_25A7F2E40();
  *a1 = v6;
  return result;
}

uint64_t sub_25A7EE568(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A7F133C;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return MEMORY[0x270FA2498](sub_25A7CA968, 0, 0);
}

uint64_t sub_25A7EE628(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A7F133C;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return MEMORY[0x270FA2498](sub_25A7CAB40, 0, 0);
}

uint64_t sub_25A7EE6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_25A7F133C;
  return MEMORY[0x270F4C2C0](a1, a2, a3, a4, a5);
}

uint64_t sub_25A7EE7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return NewInferenceProvider.requestStream(clientData:configuration:)(a1, a2, a3, a4);
}

uint64_t sub_25A7EE7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A7EE888;
  return NewInferenceProvider.requestOneShot(clientData:configuration:)(a1, a2, a3);
}

uint64_t sub_25A7EE888(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_25A7EE998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_25A7F133C;
  return MEMORY[0x270F4C2B8](a1, a2, a3, a4, a5);
}

uint64_t sub_25A7EEA64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25A7C36D4;
  return MEMORY[0x270F4C2A8](a1, a2, a3);
}

uint64_t sub_25A7EEB14(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25A7F133C;
  return NewInferenceProvider.prewarmHint(_:)(a1);
}

void sub_25A7EEBAC()
{
  qword_26A4643F8 = (uint64_t)&unk_27085BF00;
}

void sub_25A7EEBC0()
{
  qword_26A464400 = (uint64_t)&unk_27085BF40;
}

uint64_t sub_25A7EEBD4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_25A7F33A0();
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
    if (v12 || (sub_25A7F33A0() & 1) != 0) {
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

uint64_t sub_25A7EEC9C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_25A7EECD8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_25A7EECE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25A7EED10(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25A7EED88(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25A7F3270();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25A7EED88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25A7EEF94(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25A7F1068((uint64_t)v12, *a3);
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
      sub_25A7F1068((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25A7EEEA0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25A7EEEB8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  long long v9 = *(_OWORD *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 24);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_25A7C36D4;
  *(void *)(v6 + 64) = v5;
  *(_OWORD *)(v6 + 32) = v7;
  *(_OWORD *)(v6 + 48) = v9;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v4;
  return MEMORY[0x270FA2498](sub_25A7D0304, 0, 0);
}

uint64_t sub_25A7EEF94(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25A7F3280();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25A7EF150(a5, a6);
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
  uint64_t v8 = sub_25A7F32D0();
  if (!v8)
  {
    sub_25A7F3330();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25A7F3370();
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

uint64_t sub_25A7EF150(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25A7EF1E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25A7EF3C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25A7EF3C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25A7EF1E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25A7EF360(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25A7F32C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25A7F3330();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25A7F3070();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25A7F3370();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25A7F3330();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25A7EF360(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A464698);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25A7EF3C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464698);
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
  uint64_t result = sub_25A7F3370();
  __break(1u);
  return result;
}

uint64_t sub_25A7EF518(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A7EF558(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_25A7EF538(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A7EF6F4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25A7EF558(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464578);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 4;
  uint64_t v13 = a4 + 4;
  size_t v14 = 3 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v10 + 4, a4 + 4, v14 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464580);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25A7F3370();
  __break(1u);
  return result;
}

uint64_t sub_25A7EF6F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A464620);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25A7F3370();
  __break(1u);
  return result;
}

uint64_t sub_25A7EF854(unint64_t a1)
{
  if (a1 >= 8) {
    return 7;
  }
  else {
    return (0x605040302010007uLL >> (8 * a1));
  }
}

uint64_t sub_25A7EF87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_25A7F25C0();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_25A7F25E0();
  v3[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7EF96C, 0, 0);
}

uint64_t sub_25A7EF96C()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  sub_25A7F2610();
  uint64_t v4 = *(void *)(sub_25A7F2BB0() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v4 + 16))();
  sub_25A7C9EB8(MEMORY[0x263F8EE78]);
  sub_25A7F25B0();
  swift_task_dealloc();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, *MEMORY[0x263F611E8], v2);
  sub_25A7F25D0();
  uint64_t v5 = sub_25A7F25F0();
  v0[9] = v5;
  uint64_t v6 = v5;
  uint64_t v9 = (uint64_t (*)(uint64_t))(v0[3] + *(int *)v0[3]);
  int64_t v7 = (void *)swift_task_alloc();
  v0[10] = v7;
  *int64_t v7 = v0;
  v7[1] = sub_25A7EFBC8;
  return v9(v6);
}

uint64_t sub_25A7EFBC8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A7EFCC4, 0, 0);
}

uint64_t sub_25A7EFCC4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A7EFD3C(uint64_t a1)
{
  return sub_25A7D0C40(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

unint64_t sub_25A7EFD4C()
{
  unint64_t result = qword_26A464458;
  if (!qword_26A464458)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A464450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A464458);
  }
  return result;
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

uint64_t sub_25A7EFE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  int64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_25A7F133C;
  return sub_25A7D88F0(a1, a2, v6, v7, v8, v9, v10);
}

unint64_t sub_25A7EFEE8()
{
  unint64_t result = qword_26A464480[0];
  if (!qword_26A464480[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A464480);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ErrorCodeDifferentiator(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ErrorCodeDifferentiator(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A7F0098);
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

ValueMetadata *type metadata accessor for ErrorCodeDifferentiator()
{
  return &type metadata for ErrorCodeDifferentiator;
}

uint64_t sub_25A7F00D0()
{
  return type metadata accessor for NewInferenceProvider();
}

uint64_t type metadata accessor for NewInferenceProvider()
{
  uint64_t result = qword_26B32BBB0;
  if (!qword_26B32BBB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25A7F0124()
{
  uint64_t result = sub_25A7F2EE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25A7F3310();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_25A7F2E60();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for NewInferenceProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NewInferenceProvider);
}

uint64_t dispatch thunk of NewInferenceProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_25A7F0254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3[2];
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  uint64_t v10 = v3[5];
  uint64_t v11 = v3[6];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_25A7C36D4;
  return sub_25A7E47C0(a1, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t sub_25A7F0358(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_25A7F03A0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_25A7F03B0()
{
  unint64_t result = qword_26A464560;
  if (!qword_26A464560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A464560);
  }
  return result;
}

uint64_t sub_25A7F0404(uint64_t a1, unint64_t a2)
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

uint64_t sub_25A7F045C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_25A7F133C;
  return sub_25A7ECC1C(a1, a2, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_25A7F055C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25A7F05BC()
{
  unint64_t result = qword_26A4645B8;
  if (!qword_26A4645B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4645B8);
  }
  return result;
}

uint64_t sub_25A7F0610(uint64_t result, char a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v6 = result;
    uint64_t v8 = *(void *)(result + 32);
    uint64_t v7 = *(void *)(result + 40);
    int v44 = *(_DWORD *)(result + 48);
    uint64_t v9 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_25A7C45C0(v8, v7);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    char v15 = v10;
    if (v9[3] < v14)
    {
      sub_25A7C4A44(v14, a2 & 1);
      unint64_t v16 = sub_25A7C45C0(v8, v7);
      if ((v15 & 1) != (v17 & 1))
      {
LABEL_27:
        unint64_t result = sub_25A7F33B0();
        __break(1u);
        return result;
      }
      unint64_t v11 = v16;
      uint64_t v18 = (void *)*a3;
      if ((v15 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      uint64_t v19 = 4 * v11;
      int v20 = *(_DWORD *)(v18[7] + 4 * v11);
      swift_bridgeObjectRelease();
      *(_DWORD *)(v18[7] + v19) = v20;
      uint64_t v21 = v3 - 1;
      if (v3 == 1) {
        return swift_bridgeObjectRelease();
      }
LABEL_16:
      for (uint64_t i = (_DWORD *)(v6 + 72); ; i += 6)
      {
        uint64_t v30 = *((void *)i - 2);
        uint64_t v29 = *((void *)i - 1);
        int v31 = *i;
        uint64_t v32 = (void *)*a3;
        swift_bridgeObjectRetain();
        unint64_t v33 = sub_25A7C45C0(v30, v29);
        uint64_t v35 = v32[2];
        BOOL v36 = (v34 & 1) == 0;
        BOOL v24 = __OFADD__(v35, v36);
        uint64_t v37 = v35 + v36;
        if (v24) {
          break;
        }
        char v38 = v34;
        if (v32[3] < v37)
        {
          sub_25A7C4A44(v37, 1);
          unint64_t v33 = sub_25A7C45C0(v30, v29);
          if ((v38 & 1) != (v39 & 1)) {
            goto LABEL_27;
          }
        }
        uint64_t v40 = (void *)*a3;
        if (v38)
        {
          uint64_t v27 = 4 * v33;
          int v28 = *(_DWORD *)(v40[7] + 4 * v33);
          swift_bridgeObjectRelease();
          *(_DWORD *)(v40[7] + v27) = v28;
        }
        else
        {
          v40[(v33 >> 6) + 8] |= 1 << v33;
          uint64_t v41 = (uint64_t *)(v40[6] + 16 * v33);
          *uint64_t v41 = v30;
          v41[1] = v29;
          *(_DWORD *)(v40[7] + 4 * v33) = v31;
          uint64_t v42 = v40[2];
          BOOL v24 = __OFADD__(v42, 1);
          uint64_t v43 = v42 + 1;
          if (v24) {
            goto LABEL_26;
          }
          v40[2] = v43;
        }
        if (!--v21) {
          return swift_bridgeObjectRelease();
        }
      }
      goto LABEL_25;
    }
    if (a2)
    {
      uint64_t v18 = (void *)*a3;
      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25A7C50A4();
      uint64_t v18 = (void *)*a3;
      if (v15) {
        goto LABEL_9;
      }
    }
LABEL_12:
    v18[(v11 >> 6) + 8] |= 1 << v11;
    uint64_t v22 = (uint64_t *)(v18[6] + 16 * v11);
    *uint64_t v22 = v8;
    v22[1] = v7;
    *(_DWORD *)(v18[7] + 4 * v11) = v44;
    uint64_t v23 = v18[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v18[2] = v25;
    uint64_t v21 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_25A7F08A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A7F0904()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A464630);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_25A7F2DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v12 = v3 | v8 | 7;
  unint64_t v10 = (*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  sub_25A7C1340(*(void *)(v0 + v10), *(void *)(v0 + v10 + 8));
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v10 + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v12);
}

uint64_t sub_25A7F0AA4(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A464630) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_25A7F2DC0() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[4];
  uint64_t v11 = v1[5];
  uint64_t v12 = (uint64_t)v1 + v7;
  uint64_t v13 = *(void *)((char *)v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_25A7F133C;
  return sub_25A7D0F6C(a1, v8, v9, v10, v11, (uint64_t)v1 + v4, v12, v13);
}

uint64_t sub_25A7F0C60()
{
  return MEMORY[0x270FA1FB0](v0, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E628], MEMORY[0x263F8E658]);
}

uint64_t sub_25A7F0C84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_25A7F133C;
  return sub_25A7D2ED4(a1, a2, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_25A7F0D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3[2];
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  uint64_t v10 = v3[5];
  uint64_t v11 = v3[6];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_25A7F133C;
  return sub_25A7E294C(a1, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t sub_25A7F0E78(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_25A7F133C;
  return sub_25A7EBC14(a1, a2, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_25A7F0F78(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25A7F0FC0()
{
  unint64_t result = qword_26B32BBD8;
  if (!qword_26B32BBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BBD8);
  }
  return result;
}

unint64_t sub_25A7F1014()
{
  unint64_t result = qword_26B32BBD0;
  if (!qword_26B32BBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B32BBD0);
  }
  return result;
}

uint64_t sub_25A7F1068(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

unsigned char *storeEnumTagSinglePayload for PrivateMLClientInferenceProviderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x25A7F11F4);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateMLClientInferenceProviderError()
{
  return &type metadata for PrivateMLClientInferenceProviderError;
}

unint64_t sub_25A7F1234()
{
  unint64_t result = qword_26A4646A0;
  if (!qword_26A4646A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4646A0);
  }
  return result;
}

unint64_t sub_25A7F1288()
{
  unint64_t result = qword_26A4646A8;
  if (!qword_26A4646A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4646A8);
  }
  return result;
}

unint64_t sub_25A7F12DC()
{
  unint64_t result = qword_26A4646B0;
  if (!qword_26A4646B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4646B0);
  }
  return result;
}

uint64_t sub_25A7F1354()
{
  uint64_t v0 = sub_25A7F2EE0();
  __swift_allocate_value_buffer(v0, qword_26B32BB80);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B32BB80);
  swift_bridgeObjectRetain();
  return sub_25A7F2ED0();
}

uint64_t static Logger.viewCycle.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B32BBF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A7F2EE0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B32BB80);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t InferenceProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  InferenceProvider.init()();
  return v0;
}

void *InferenceProvider.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25A7F2EE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_25A7F2E60();
  uint64_t v6 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B32BBF0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v2, (uint64_t)qword_26B32BB80);
  uint64_t v9 = sub_25A7F2EC0();
  os_log_type_t v10 = sub_25A7F3170();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_25A7B3000, v9, v10, "Using NewInferenceProvider", v11, 2u);
    MEMORY[0x261145500](v11, -1, -1);
  }

  uint64_t v12 = type metadata accessor for NewInferenceProvider();
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_26B32BB78 != -1) {
    swift_once();
  }
  uint64_t v15 = v13 + v14;
  uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_26B32BBF8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v17(v15, v16, v2);
  sub_25A7F32E0();
  v17((uint64_t)v5, v15, v2);
  sub_25A7F2E40();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v13 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster, v8, v20);
  v1[5] = v12;
  v1[6] = sub_25A7F1798();
  v1[2] = v13;
  return v1;
}

unint64_t sub_25A7F1798()
{
  unint64_t result = qword_26A4646C8;
  if (!qword_26A4646C8)
  {
    type metadata accessor for NewInferenceProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A4646C8);
  }
  return result;
}

uint64_t InferenceProvider.loadIn(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25A7F1814, 0, 0);
}

uint64_t sub_25A7F1814()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A7F18D4;
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  return MEMORY[0x270F4C298](v6, v5, v2, v3);
}

uint64_t sub_25A7F18D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t InferenceProvider.loadOut(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25A7F19EC, 0, 0);
}

uint64_t sub_25A7F19EC()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A7F1EEC;
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  return MEMORY[0x270F4C2A0](v6, v5, v2, v3);
}

uint64_t InferenceProvider.requestStream(clientData:configuration:)()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  return sub_25A7F2C70();
}

uint64_t InferenceProvider.requestOneShot(clientData:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_25A7F1B44, 0, 0);
}

uint64_t sub_25A7F1B44()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A7F1C08;
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];
  return MEMORY[0x270F4C290](v7, v5, v6, v2, v3);
}

uint64_t sub_25A7F1C08(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t InferenceProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t InferenceProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

void *sub_25A7F1D70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  unint64_t result = InferenceProvider.init()();
  *a1 = v2;
  return result;
}

uint64_t sub_25A7F1DAC(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_25A7F1814, 0, 0);
}

uint64_t sub_25A7F1DD4(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_25A7F19EC, 0, 0);
}

uint64_t sub_25A7F1DFC()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 16), *(void *)(*(void *)v0 + 40));
  return sub_25A7F2C70();
}

uint64_t sub_25A7F1E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_25A7F1B44, 0, 0);
}

uint64_t type metadata accessor for InferenceProvider()
{
  return self;
}

uint64_t method lookup function for InferenceProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InferenceProvider);
}

uint64_t dispatch thunk of InferenceProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_25A7F1EF0()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_25A7F1F00()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_25A7F1F10()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_25A7F1F20()
{
  return MEMORY[0x270EEE3D8]();
}

uint64_t sub_25A7F1F30()
{
  return MEMORY[0x270EEE418]();
}

uint64_t sub_25A7F1F40()
{
  return MEMORY[0x270EEE4B8]();
}

uint64_t sub_25A7F1F50()
{
  return MEMORY[0x270EEE528]();
}

uint64_t sub_25A7F1F60()
{
  return MEMORY[0x270EEE540]();
}

uint64_t sub_25A7F1F70()
{
  return MEMORY[0x270EEE5B0]();
}

uint64_t sub_25A7F1F80()
{
  return MEMORY[0x270EEE600]();
}

uint64_t sub_25A7F1F90()
{
  return MEMORY[0x270EEE608]();
}

uint64_t sub_25A7F1FA0()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_25A7F1FB0()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_25A7F1FC0()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_25A7F1FD0()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_25A7F1FE0()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_25A7F1FF0()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_25A7F2000()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_25A7F2010()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_25A7F2020()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_25A7F2030()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_25A7F2040()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_25A7F2050()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_25A7F2060()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_25A7F2070()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_25A7F2080()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_25A7F2090()
{
  return MEMORY[0x270EF0D88]();
}

uint64_t sub_25A7F20A0()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_25A7F20B0()
{
  return MEMORY[0x270F4BC68]();
}

uint64_t sub_25A7F20C0()
{
  return MEMORY[0x270F4BC88]();
}

uint64_t sub_25A7F20D0()
{
  return MEMORY[0x270F4BC98]();
}

uint64_t sub_25A7F20E0()
{
  return MEMORY[0x270F4BCA0]();
}

uint64_t sub_25A7F20F0()
{
  return MEMORY[0x270F4BCD8]();
}

uint64_t sub_25A7F2100()
{
  return MEMORY[0x270F4BDB8]();
}

uint64_t sub_25A7F2110()
{
  return MEMORY[0x270F57148]();
}

uint64_t sub_25A7F2120()
{
  return MEMORY[0x270F57150]();
}

uint64_t sub_25A7F2130()
{
  return MEMORY[0x270F57158]();
}

uint64_t sub_25A7F2140()
{
  return MEMORY[0x270F57160]();
}

uint64_t sub_25A7F2150()
{
  return MEMORY[0x270F57168]();
}

uint64_t sub_25A7F2160()
{
  return MEMORY[0x270F57170]();
}

uint64_t sub_25A7F2170()
{
  return MEMORY[0x270F57178]();
}

uint64_t sub_25A7F2180()
{
  return MEMORY[0x270F57180]();
}

uint64_t sub_25A7F2190()
{
  return MEMORY[0x270F57188]();
}

uint64_t sub_25A7F21A0()
{
  return MEMORY[0x270F57190]();
}

uint64_t sub_25A7F21B0()
{
  return MEMORY[0x270F57198]();
}

uint64_t sub_25A7F21C0()
{
  return MEMORY[0x270F571A0]();
}

uint64_t sub_25A7F21D0()
{
  return MEMORY[0x270F571A8]();
}

uint64_t sub_25A7F21E0()
{
  return MEMORY[0x270F571B0]();
}

uint64_t sub_25A7F21F0()
{
  return MEMORY[0x270F571B8]();
}

uint64_t sub_25A7F2200()
{
  return MEMORY[0x270F571C0]();
}

uint64_t sub_25A7F2210()
{
  return MEMORY[0x270F571C8]();
}

uint64_t sub_25A7F2220()
{
  return MEMORY[0x270F571D0]();
}

uint64_t sub_25A7F2230()
{
  return MEMORY[0x270F571D8]();
}

uint64_t sub_25A7F2240()
{
  return MEMORY[0x270F571E0]();
}

uint64_t sub_25A7F2250()
{
  return MEMORY[0x270F571E8]();
}

uint64_t sub_25A7F2260()
{
  return MEMORY[0x270F571F0]();
}

uint64_t sub_25A7F2270()
{
  return MEMORY[0x270F571F8]();
}

uint64_t sub_25A7F2280()
{
  return MEMORY[0x270F57200]();
}

uint64_t sub_25A7F2290()
{
  return MEMORY[0x270F57208]();
}

uint64_t sub_25A7F22A0()
{
  return MEMORY[0x270F57210]();
}

uint64_t sub_25A7F22B0()
{
  return MEMORY[0x270F57218]();
}

uint64_t sub_25A7F22C0()
{
  return MEMORY[0x270F57220]();
}

uint64_t sub_25A7F22D0()
{
  return MEMORY[0x270F57228]();
}

uint64_t sub_25A7F22E0()
{
  return MEMORY[0x270F57230]();
}

uint64_t sub_25A7F22F0()
{
  return MEMORY[0x270F57238]();
}

uint64_t sub_25A7F2300()
{
  return MEMORY[0x270F57240]();
}

uint64_t sub_25A7F2310()
{
  return MEMORY[0x270F57248]();
}

uint64_t sub_25A7F2320()
{
  return MEMORY[0x270F57250]();
}

uint64_t sub_25A7F2330()
{
  return MEMORY[0x270F57258]();
}

uint64_t sub_25A7F2340()
{
  return MEMORY[0x270F57260]();
}

uint64_t sub_25A7F2360()
{
  return MEMORY[0x270F57270]();
}

uint64_t sub_25A7F2370()
{
  return MEMORY[0x270F57278]();
}

uint64_t sub_25A7F2380()
{
  return MEMORY[0x270F57280]();
}

uint64_t sub_25A7F2390()
{
  return MEMORY[0x270F57288]();
}

uint64_t sub_25A7F23A0()
{
  return MEMORY[0x270F57290]();
}

uint64_t sub_25A7F23B0()
{
  return MEMORY[0x270F57298]();
}

uint64_t sub_25A7F23C0()
{
  return MEMORY[0x270F572A0]();
}

uint64_t sub_25A7F23D0()
{
  return MEMORY[0x270F572A8]();
}

uint64_t sub_25A7F23E0()
{
  return MEMORY[0x270F572B0]();
}

uint64_t sub_25A7F23F0()
{
  return MEMORY[0x270F572B8]();
}

uint64_t sub_25A7F2400()
{
  return MEMORY[0x270F572C0]();
}

uint64_t sub_25A7F2410()
{
  return MEMORY[0x270F572C8]();
}

uint64_t sub_25A7F2420()
{
  return MEMORY[0x270F572D0]();
}

uint64_t sub_25A7F2430()
{
  return MEMORY[0x270F572D8]();
}

uint64_t sub_25A7F2440()
{
  return MEMORY[0x270F572E0]();
}

uint64_t sub_25A7F2450()
{
  return MEMORY[0x270F572E8]();
}

uint64_t sub_25A7F2460()
{
  return MEMORY[0x270F572F0]();
}

uint64_t sub_25A7F2470()
{
  return MEMORY[0x270F572F8]();
}

uint64_t sub_25A7F2480()
{
  return MEMORY[0x270F57300]();
}

uint64_t sub_25A7F2490()
{
  return MEMORY[0x270F57308]();
}

uint64_t sub_25A7F24A0()
{
  return MEMORY[0x270F57310]();
}

uint64_t sub_25A7F24B0()
{
  return MEMORY[0x270F57318]();
}

uint64_t sub_25A7F24C0()
{
  return MEMORY[0x270F57320]();
}

uint64_t sub_25A7F24D0()
{
  return MEMORY[0x270F57328]();
}

uint64_t sub_25A7F24E0()
{
  return MEMORY[0x270F57330]();
}

uint64_t sub_25A7F24F0()
{
  return MEMORY[0x270F57338]();
}

uint64_t sub_25A7F2500()
{
  return MEMORY[0x270F57340]();
}

uint64_t sub_25A7F2510()
{
  return MEMORY[0x270F57348]();
}

uint64_t sub_25A7F2520()
{
  return MEMORY[0x270F57350]();
}

uint64_t sub_25A7F2530()
{
  return MEMORY[0x270F57358]();
}

uint64_t sub_25A7F2540()
{
  return MEMORY[0x270F57360]();
}

uint64_t sub_25A7F2550()
{
  return MEMORY[0x270F57368]();
}

uint64_t sub_25A7F2560()
{
  return MEMORY[0x270F57370]();
}

uint64_t sub_25A7F2570()
{
  return MEMORY[0x270F57378]();
}

uint64_t sub_25A7F2580()
{
  return MEMORY[0x270F57380]();
}

uint64_t sub_25A7F2590()
{
  return MEMORY[0x270F57388]();
}

uint64_t sub_25A7F25B0()
{
  return MEMORY[0x270F57398]();
}

uint64_t sub_25A7F25C0()
{
  return MEMORY[0x270F573A0]();
}

uint64_t sub_25A7F25D0()
{
  return MEMORY[0x270F573A8]();
}

uint64_t sub_25A7F25E0()
{
  return MEMORY[0x270F573B0]();
}

uint64_t sub_25A7F25F0()
{
  return MEMORY[0x270F573B8]();
}

uint64_t sub_25A7F2610()
{
  return MEMORY[0x270F573C8]();
}

uint64_t sub_25A7F2620()
{
  return MEMORY[0x270F7EB48]();
}

uint64_t sub_25A7F2630()
{
  return MEMORY[0x270F7EB50]();
}

uint64_t sub_25A7F2640()
{
  return MEMORY[0x270F7EC10]();
}

uint64_t sub_25A7F2650()
{
  return MEMORY[0x270F7EC20]();
}

uint64_t sub_25A7F2660()
{
  return MEMORY[0x270F7EC30]();
}

uint64_t sub_25A7F2670()
{
  return MEMORY[0x270F7EC38]();
}

uint64_t sub_25A7F2680()
{
  return MEMORY[0x270F7EC58]();
}

uint64_t sub_25A7F2690()
{
  return MEMORY[0x270F7EC80]();
}

uint64_t sub_25A7F26A0()
{
  return MEMORY[0x270F7EC88]();
}

uint64_t sub_25A7F26B0()
{
  return MEMORY[0x270F7EC90]();
}

uint64_t sub_25A7F26C0()
{
  return MEMORY[0x270F7EC98]();
}

uint64_t sub_25A7F26D0()
{
  return MEMORY[0x270F7ECE0]();
}

uint64_t sub_25A7F26E0()
{
  return MEMORY[0x270F7ECF8]();
}

uint64_t sub_25A7F26F0()
{
  return MEMORY[0x270F7ED00]();
}

uint64_t sub_25A7F2700()
{
  return MEMORY[0x270F7ED10]();
}

uint64_t sub_25A7F2710()
{
  return MEMORY[0x270F7ED80]();
}

uint64_t sub_25A7F2720()
{
  return MEMORY[0x270F7EDD0]();
}

uint64_t sub_25A7F2730()
{
  return MEMORY[0x270F7EDE0]();
}

uint64_t sub_25A7F2740()
{
  return MEMORY[0x270F7EDF0]();
}

uint64_t sub_25A7F2750()
{
  return MEMORY[0x270F7EDF8]();
}

uint64_t sub_25A7F2760()
{
  return MEMORY[0x270F7EE18]();
}

uint64_t sub_25A7F2770()
{
  return MEMORY[0x270F7EE38]();
}

uint64_t sub_25A7F2780()
{
  return MEMORY[0x270F7EE40]();
}

uint64_t sub_25A7F2790()
{
  return MEMORY[0x270F7EE58]();
}

uint64_t sub_25A7F27A0()
{
  return MEMORY[0x270F7EE68]();
}

uint64_t sub_25A7F27B0()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_25A7F27C0()
{
  return MEMORY[0x270F7EE98]();
}

uint64_t sub_25A7F27D0()
{
  return MEMORY[0x270F7EEA0]();
}

uint64_t sub_25A7F27E0()
{
  return MEMORY[0x270F7EEB8]();
}

uint64_t sub_25A7F27F0()
{
  return MEMORY[0x270F7EEC0]();
}

uint64_t sub_25A7F2800()
{
  return MEMORY[0x270F7EED0]();
}

uint64_t sub_25A7F2810()
{
  return MEMORY[0x270F7EED8]();
}

uint64_t sub_25A7F2820()
{
  return MEMORY[0x270F7EEE0]();
}

uint64_t sub_25A7F2830()
{
  return MEMORY[0x270F7EEF8]();
}

uint64_t sub_25A7F2840()
{
  return MEMORY[0x270F7EF08]();
}

uint64_t sub_25A7F2850()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_25A7F2860()
{
  return MEMORY[0x270F7EFF0]();
}

uint64_t sub_25A7F2870()
{
  return MEMORY[0x270F7F000]();
}

uint64_t sub_25A7F2880()
{
  return MEMORY[0x270F7F010]();
}

uint64_t sub_25A7F2890()
{
  return MEMORY[0x270F7F028]();
}

uint64_t sub_25A7F28A0()
{
  return MEMORY[0x270F7F030]();
}

uint64_t sub_25A7F28B0()
{
  return MEMORY[0x270F7F038]();
}

uint64_t sub_25A7F28C0()
{
  return MEMORY[0x270F7F0F8]();
}

uint64_t sub_25A7F28D0()
{
  return MEMORY[0x270F7F100]();
}

uint64_t sub_25A7F28E0()
{
  return MEMORY[0x270F7F108]();
}

uint64_t sub_25A7F28F0()
{
  return MEMORY[0x270F7F110]();
}

uint64_t sub_25A7F2900()
{
  return MEMORY[0x270F7F120]();
}

uint64_t sub_25A7F2910()
{
  return MEMORY[0x270F7F130]();
}

uint64_t sub_25A7F2920()
{
  return MEMORY[0x270F7F148]();
}

uint64_t sub_25A7F2930()
{
  return MEMORY[0x270F7F170]();
}

uint64_t sub_25A7F2940()
{
  return MEMORY[0x270F7F178]();
}

uint64_t sub_25A7F2950()
{
  return MEMORY[0x270F7F1B0]();
}

uint64_t sub_25A7F2960()
{
  return MEMORY[0x270F7F1B8]();
}

uint64_t sub_25A7F2970()
{
  return MEMORY[0x270F7F1C0]();
}

uint64_t sub_25A7F2980()
{
  return MEMORY[0x270F7F1C8]();
}

uint64_t sub_25A7F2990()
{
  return MEMORY[0x270F7F1F0]();
}

uint64_t sub_25A7F29A0()
{
  return MEMORY[0x270F7F1F8]();
}

uint64_t sub_25A7F29B0()
{
  return MEMORY[0x270F7F368]();
}

uint64_t sub_25A7F29C0()
{
  return MEMORY[0x270F7F390]();
}

uint64_t sub_25A7F29D0()
{
  return MEMORY[0x270F7F400]();
}

uint64_t sub_25A7F29E0()
{
  return MEMORY[0x270F7F438]();
}

uint64_t sub_25A7F29F0()
{
  return MEMORY[0x270F7F488]();
}

uint64_t sub_25A7F2A00()
{
  return MEMORY[0x270F7F498]();
}

uint64_t sub_25A7F2A10()
{
  return MEMORY[0x270F7F4A0]();
}

uint64_t sub_25A7F2A20()
{
  return MEMORY[0x270F7F530]();
}

uint64_t sub_25A7F2A30()
{
  return MEMORY[0x270F7F540]();
}

uint64_t sub_25A7F2A40()
{
  return MEMORY[0x270F7F548]();
}

uint64_t sub_25A7F2A50()
{
  return MEMORY[0x270F7F560]();
}

uint64_t sub_25A7F2A60()
{
  return MEMORY[0x270F7F588]();
}

uint64_t sub_25A7F2A70()
{
  return MEMORY[0x270F7F5A0]();
}

uint64_t sub_25A7F2A80()
{
  return MEMORY[0x270F7F5B0]();
}

uint64_t sub_25A7F2A90()
{
  return MEMORY[0x270F7F5D8]();
}

uint64_t sub_25A7F2AA0()
{
  return MEMORY[0x270F7F5E0]();
}

uint64_t sub_25A7F2AB0()
{
  return MEMORY[0x270F56EF0]();
}

uint64_t sub_25A7F2AC0()
{
  return MEMORY[0x270F56EF8]();
}

uint64_t sub_25A7F2AD0()
{
  return MEMORY[0x270F56F00]();
}

uint64_t sub_25A7F2AE0()
{
  return MEMORY[0x270F56F08]();
}

uint64_t sub_25A7F2AF0()
{
  return MEMORY[0x270F56F10]();
}

uint64_t sub_25A7F2B00()
{
  return MEMORY[0x270F56F18]();
}

uint64_t sub_25A7F2B10()
{
  return MEMORY[0x270F56F20]();
}

uint64_t sub_25A7F2B20()
{
  return MEMORY[0x270F56F28]();
}

uint64_t sub_25A7F2B30()
{
  return MEMORY[0x270F56F30]();
}

uint64_t sub_25A7F2B40()
{
  return MEMORY[0x270F56F38]();
}

uint64_t sub_25A7F2B50()
{
  return MEMORY[0x270F56F40]();
}

uint64_t sub_25A7F2B60()
{
  return MEMORY[0x270F56F48]();
}

uint64_t sub_25A7F2B70()
{
  return MEMORY[0x270F56F50]();
}

uint64_t sub_25A7F2B80()
{
  return MEMORY[0x270F56F60]();
}

uint64_t sub_25A7F2B90()
{
  return MEMORY[0x270F56F68]();
}

uint64_t sub_25A7F2BA0()
{
  return MEMORY[0x270F56F70]();
}

uint64_t sub_25A7F2BB0()
{
  return MEMORY[0x270F56F78]();
}

uint64_t sub_25A7F2BC0()
{
  return MEMORY[0x270F7F780]();
}

uint64_t sub_25A7F2BD0()
{
  return MEMORY[0x270F7F788]();
}

uint64_t sub_25A7F2BE0()
{
  return MEMORY[0x270F7F800]();
}

uint64_t sub_25A7F2BF0()
{
  return MEMORY[0x270F7F808]();
}

uint64_t sub_25A7F2C00()
{
  return MEMORY[0x270F7F8B0]();
}

uint64_t sub_25A7F2C10()
{
  return MEMORY[0x270F7F8B8]();
}

uint64_t sub_25A7F2C20()
{
  return MEMORY[0x270F4C190]();
}

uint64_t sub_25A7F2C30()
{
  return MEMORY[0x270F4C198]();
}

uint64_t sub_25A7F2C40()
{
  return MEMORY[0x270F4C1A0]();
}

uint64_t sub_25A7F2C50()
{
  return MEMORY[0x270F4C1D0]();
}

uint64_t sub_25A7F2C60()
{
  return MEMORY[0x270F4C210]();
}

uint64_t sub_25A7F2C70()
{
  return MEMORY[0x270F4C288]();
}

uint64_t sub_25A7F2CC0()
{
  return MEMORY[0x270F4C2B0]();
}

uint64_t sub_25A7F2CF0()
{
  return MEMORY[0x270F4C310]();
}

uint64_t sub_25A7F2D00()
{
  return MEMORY[0x270F4C318]();
}

uint64_t sub_25A7F2D10()
{
  return MEMORY[0x270F4C320]();
}

uint64_t sub_25A7F2D20()
{
  return MEMORY[0x270F4C328]();
}

uint64_t sub_25A7F2D30()
{
  return MEMORY[0x270F4C330]();
}

uint64_t sub_25A7F2D40()
{
  return MEMORY[0x270F4C338]();
}

uint64_t sub_25A7F2D50()
{
  return MEMORY[0x270F4C340]();
}

uint64_t sub_25A7F2D60()
{
  return MEMORY[0x270F4C348]();
}

uint64_t sub_25A7F2D70()
{
  return MEMORY[0x270F4C350]();
}

uint64_t sub_25A7F2D80()
{
  return MEMORY[0x270F4C358]();
}

uint64_t sub_25A7F2D90()
{
  return MEMORY[0x270F4C368]();
}

uint64_t sub_25A7F2DA0()
{
  return MEMORY[0x270F4C370]();
}

uint64_t sub_25A7F2DB0()
{
  return MEMORY[0x270F4C378]();
}

uint64_t sub_25A7F2DC0()
{
  return MEMORY[0x270F4C388]();
}

uint64_t sub_25A7F2DD0()
{
  return MEMORY[0x270F2F270]();
}

uint64_t sub_25A7F2DE0()
{
  return MEMORY[0x270F2F428]();
}

uint64_t sub_25A7F2DF0()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_25A7F2E00()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25A7F2E10()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_25A7F2E20()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25A7F2E30()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25A7F2E40()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_25A7F2E50()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_25A7F2E60()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_25A7F2E70()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_25A7F2E80()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_25A7F2E90()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_25A7F2EA0()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_25A7F2EB0()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_25A7F2EC0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A7F2ED0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25A7F2EE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A7F2EF0()
{
  return MEMORY[0x270F2F720]();
}

uint64_t sub_25A7F2F00()
{
  return MEMORY[0x270F2F728]();
}

uint64_t sub_25A7F2F10()
{
  return MEMORY[0x270F2F730]();
}

uint64_t sub_25A7F2F20()
{
  return MEMORY[0x270F2F738]();
}

uint64_t sub_25A7F2F30()
{
  return MEMORY[0x270F2F790]();
}

uint64_t sub_25A7F2F40()
{
  return MEMORY[0x270F2F798]();
}

uint64_t sub_25A7F2F50()
{
  return MEMORY[0x270F2F7A0]();
}

uint64_t sub_25A7F2F60()
{
  return MEMORY[0x270F2F7A8]();
}

uint64_t sub_25A7F2F70()
{
  return MEMORY[0x270F2F7B8]();
}

uint64_t sub_25A7F2F80()
{
  return MEMORY[0x270F2F7C8]();
}

uint64_t sub_25A7F2F90()
{
  return MEMORY[0x270F2F7E8]();
}

uint64_t sub_25A7F2FA0()
{
  return MEMORY[0x270F2F7F8]();
}

uint64_t sub_25A7F2FB0()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_25A7F2FC0()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25A7F2FD0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A7F2FE0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A7F2FF0()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_25A7F3000()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_25A7F3010()
{
  return MEMORY[0x270EF1A08]();
}

uint64_t sub_25A7F3020()
{
  return MEMORY[0x270EF1AA0]();
}

uint64_t sub_25A7F3030()
{
  return MEMORY[0x270EF1AD8]();
}

uint64_t sub_25A7F3040()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A7F3050()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A7F3060()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A7F3070()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A7F3080()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_25A7F3090()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25A7F30A0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25A7F30B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A7F30C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A7F30D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A7F30F0()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t sub_25A7F3100()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_25A7F3110()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_25A7F3120()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_25A7F3130()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_25A7F3140()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25A7F3150()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_25A7F3160()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25A7F3170()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A7F3180()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A7F3190()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A7F31A0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A7F31B0()
{
  return MEMORY[0x270F573D0]();
}

uint64_t sub_25A7F31C0()
{
  return MEMORY[0x270F573D8]();
}

uint64_t sub_25A7F31D0()
{
  return MEMORY[0x270F573E0]();
}

uint64_t sub_25A7F31E0()
{
  return MEMORY[0x270F573E8]();
}

uint64_t sub_25A7F31F0()
{
  return MEMORY[0x270F573F0]();
}

uint64_t sub_25A7F3200()
{
  return MEMORY[0x270F573F8]();
}

uint64_t sub_25A7F3210()
{
  return MEMORY[0x270F57400]();
}

uint64_t sub_25A7F3220()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25A7F3230()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25A7F3240()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_25A7F3250()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_25A7F3260()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A7F3270()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A7F3280()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A7F3290()
{
  return MEMORY[0x270EF25A8]();
}

uint64_t sub_25A7F32B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A7F32C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A7F32D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A7F32E0()
{
  return MEMORY[0x270FA2168]();
}

uint64_t sub_25A7F32F0()
{
  return MEMORY[0x270FA2188]();
}

uint64_t sub_25A7F3300()
{
  return MEMORY[0x270FA2198]();
}

uint64_t sub_25A7F3310()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25A7F3320()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A7F3330()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A7F3340()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A7F3350()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A7F3360()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A7F3370()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A7F3380()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25A7F3390()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A7F33A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A7F33B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A7F33C0()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_25A7F33D0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A7F33E0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A7F33F0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A7F3400()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A7F3420()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A7F3430()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A7F3440()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A7F3450()
{
  return MEMORY[0x270EF2A08]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C0](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54F8](userNotification, responseFlags, timeout);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}