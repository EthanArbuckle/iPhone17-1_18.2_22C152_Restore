uint64_t *sub_22E08492C()
{
  if (qword_2685BF660 != -1) {
    swift_once();
  }
  return &qword_2685D7BC8;
}

unint64_t sub_22E084990()
{
  uint64_t v2 = qword_2685C3648;
  if (!qword_2685C3648)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2685C3648);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_22E0849F8()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7BD0 = result;
  qword_2685D7BD8 = v1;
  return result;
}

uint64_t *sub_22E084A3C()
{
  if (qword_2685BF668 != -1) {
    swift_once();
  }
  return &qword_2685D7BD0;
}

uint64_t sub_22E084AA0()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7BE0 = result;
  qword_2685D7BE8 = v1;
  return result;
}

uint64_t sub_22E084AE4()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7BF0 = result;
  qword_2685D7BF8 = v1;
  return result;
}

uint64_t *sub_22E084B28()
{
  if (qword_2685BF678 != -1) {
    swift_once();
  }
  return &qword_2685D7BF0;
}

uint64_t sub_22E084B8C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3678);
  sub_22E0F7E50();
  v18 = v0;
  uint64_t *v0 = sub_22DF97554();
  v18[1] = v1;
  v18[2] = 1;
  v18[3] = sub_22DF97554();
  v18[4] = v2;
  v18[5] = 1;
  v18[6] = sub_22DF97554();
  v18[7] = v3;
  v18[8] = 9;
  v18[9] = sub_22DF97554();
  v18[10] = v4;
  v18[11] = 9;
  v18[12] = sub_22DF97554();
  v18[13] = v5;
  v18[14] = 9;
  v18[15] = sub_22DF97554();
  v18[16] = v6;
  v18[17] = 10;
  v18[18] = sub_22DF97554();
  v18[19] = v7;
  v18[20] = 9;
  v18[21] = sub_22DF97554();
  v18[22] = v8;
  v18[23] = 8;
  v18[24] = sub_22DF97554();
  v18[25] = v9;
  v18[26] = 13;
  v18[27] = sub_22DF97554();
  v18[28] = v10;
  v18[29] = 11;
  v18[30] = sub_22DF97554();
  v18[31] = v11;
  v18[32] = 12;
  v18[33] = sub_22DF97554();
  v18[34] = v12;
  v18[35] = 14;
  v18[36] = sub_22DF97554();
  v18[37] = v13;
  v18[38] = 3;
  v18[39] = sub_22DF97554();
  v18[40] = v14;
  v18[41] = 10;
  v18[42] = sub_22DF97554();
  v18[43] = v15;
  v18[44] = 7;
  v18[45] = sub_22DF97554();
  v18[46] = v16;
  v18[47] = 6;
  sub_22DE04404();
  type metadata accessor for INDeviceCategory();
  uint64_t result = sub_22E0F74D0();
  qword_2685D7C00 = result;
  return result;
}

uint64_t *sub_22E084E1C()
{
  if (qword_2685BF680 != -1) {
    swift_once();
  }
  return &qword_2685D7C00;
}

uint64_t sub_22E084E80()
{
  uint64_t v12 = sub_22E0F7E50();
  uint64_t v11 = v0;
  uint64_t *v0 = BinarySettingIdentifier.rawValue.getter();
  v11[1] = v1;
  v11[2] = BinarySettingIdentifier.rawValue.getter();
  v11[3] = v2;
  v11[4] = BinarySettingIdentifier.rawValue.getter();
  v11[5] = v3;
  v11[6] = BinarySettingIdentifier.rawValue.getter();
  v11[7] = v4;
  v11[8] = BinarySettingIdentifier.rawValue.getter();
  v11[9] = v5;
  v11[10] = BinarySettingIdentifier.rawValue.getter();
  v11[11] = v6;
  v11[12] = BinarySettingIdentifier.rawValue.getter();
  v11[13] = v7;
  uint64_t v8 = BinarySettingIdentifier.rawValue.getter();
  uint64_t result = v12;
  v11[14] = v8;
  v11[15] = v10;
  sub_22DE04404();
  qword_2685D7C08 = v12;
  return result;
}

uint64_t *sub_22E084FC0()
{
  if (qword_2685BF688 != -1) {
    swift_once();
  }
  return &qword_2685D7C08;
}

uint64_t sub_22E085024()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7C10 = result;
  qword_2685D7C18 = v1;
  return result;
}

uint64_t *sub_22E085068()
{
  if (qword_2685BF690 != -1) {
    swift_once();
  }
  return &qword_2685D7C10;
}

uint64_t sub_22E0850CC()
{
  uint64_t v10 = sub_22E0F7E50();
  uint64_t v9 = v0;
  uint64_t *v0 = sub_22E0F7610();
  v9[1] = v1;
  v9[2] = sub_22E0F7610();
  v9[3] = v2;
  uint64_t v3 = sub_22E085068();
  sub_22DE58A58(v3, v9 + 4);
  v9[6] = sub_22E0F7610();
  v9[7] = v4;
  v9[8] = sub_22E0F7610();
  v9[9] = v5;
  uint64_t v6 = sub_22E0F7610();
  uint64_t result = v10;
  v9[10] = v6;
  v9[11] = v8;
  sub_22DE04404();
  qword_2685D7C20 = v10;
  return result;
}

uint64_t sub_22E085204()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7C28 = result;
  qword_2685D7C30 = v1;
  return result;
}

uint64_t *sub_22E085248()
{
  if (qword_2685BF6A0 != -1) {
    swift_once();
  }
  return &qword_2685D7C28;
}

uint64_t sub_22E0852AC()
{
  uint64_t v5 = sub_22E0F7E50();
  uint64_t v4 = v0;
  uint64_t v1 = sub_22E0F7610();
  uint64_t result = v5;
  *uint64_t v4 = v1;
  v4[1] = v3;
  sub_22DE04404();
  qword_2685D7C38 = v5;
  return result;
}

uint64_t sub_22E08532C()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7C40 = result;
  qword_2685D7C48 = v1;
  return result;
}

uint64_t sub_22E085370()
{
  uint64_t v5 = sub_22E0F7E50();
  uint64_t v4 = v0;
  uint64_t v1 = sub_22DEDDDFC();
  sub_22DE58A58(v1, v4);
  uint64_t v2 = sub_22DEDDEA4();
  sub_22DE58A58(v2, v4 + 2);
  uint64_t result = v5;
  sub_22DE04404();
  qword_2685D7C50 = v5;
  return result;
}

uint64_t *sub_22E0853DC()
{
  if (qword_2685BF6B8 != -1) {
    swift_once();
  }
  return &qword_2685D7C50;
}

id sub_22E085440(void *a1)
{
  v86 = a1;
  v81 = "ConverterUtils | Determined connected HEADPHONES device";
  v82 = "ConverterUtils | Determined connected CARPLAY device";
  v83 = "ConverterUtils | DEVICE STATE UNAVAILABLE.";
  v84 = "ConverterUtils | Determined sidekick experience.";
  v85 = "ConverterUtils | NOT A SIDEKICK experience: %@";
  v110 = 0;
  char v97 = 0;
  uint64_t v87 = sub_22E0F6F00();
  v88 = *(void **)(v87 - 8);
  uint64_t v89 = v87 - 8;
  unint64_t v90 = (v88[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v86, v1, v2, v3);
  v91 = (char *)&v29 - v90;
  unint64_t v92 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5, (char *)&v29 - v90, v6, v7);
  v93 = (char *)&v29 - v92;
  v110 = v8;
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  sub_22DE647F4(v8, v104);
  if (v104[3])
  {
    p_dst = &__dst;
    sub_22DE126F8(v104, &__dst);
    uint64_t v80 = v106;
    uint64_t v79 = v107;
    __swift_project_boxed_opaque_existential_1(p_dst, v106);
    if (sub_22E0F5F90())
    {
      uint64_t v108 = sub_22E0F7610();
      uint64_t v109 = v9;
      swift_bridgeObjectRelease();
      int v75 = sub_22E0F79B0();
      id v77 = (id)*sub_22DF13AC0();
      id v10 = v77;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
      uint64_t v76 = sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();
    }
    else
    {
      v73 = &__dst;
      uint64_t v67 = v106;
      uint64_t v66 = v107;
      __swift_project_boxed_opaque_existential_1(&__dst, v106);
      sub_22E0F5F50();
      uint64_t v11 = *MEMORY[0x263F756C8];
      v68 = (void (*)(char *, uint64_t, uint64_t))v88[13];
      v69 = v88 + 13;
      v68(v91, v11, v87);
      unint64_t v70 = sub_22DE5C0FC();
      int v74 = sub_22E0F7E80();
      v72 = (void (*)(char *, uint64_t))v88[1];
      v71 = v88 + 1;
      v72(v91, v87);
      v72(v93, v87);
      sub_22DE1268C((uint64_t)v73, (uint64_t)&v94);
      if (v74)
      {
        int v65 = 1;
      }
      else
      {
        uint64_t v63 = v95;
        uint64_t v62 = v96;
        __swift_project_boxed_opaque_existential_1(&v94, v95);
        sub_22E0F5F50();
        v68(v91, *MEMORY[0x263F756E0], v87);
        int v64 = sub_22E0F7E80();
        v72(v91, v87);
        v72(v93, v87);
        int v65 = v64;
      }
      int v61 = v65;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v94);
      if (v61)
      {
        uint64_t v108 = sub_22E0F7610();
        uint64_t v109 = v12;
        swift_bridgeObjectRelease();
        int v58 = sub_22E0F79B0();
        id v60 = (id)*sub_22DF13AC0();
        id v13 = v60;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
        uint64_t v59 = sub_22E0F7E50();
        sub_22E0F7340();
        swift_bridgeObjectRelease();
      }
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&__dst);
  }
  else
  {
    sub_22DE585B0((uint64_t)v104);
    int v55 = sub_22E0F79B0();
    id v57 = (id)*sub_22DF13AC0();
    id v14 = v57;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v56 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();
  }
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  sub_22DE647F4(v86, &v99);
  if (v100)
  {
    v52 = &v99;
    uint64_t v51 = v100;
    uint64_t v50 = v101;
    __swift_project_boxed_opaque_existential_1(&v99, v100);
    int v53 = sub_22E0F5F30();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
    int v54 = v53 & 1;
  }
  else
  {
    sub_22DE585B0((uint64_t)&v99);
    int v54 = 2;
  }
  int v49 = v54;
  if (v54 == 2 || (int v48 = v49, v97 = v48 & 1, (v48 & 1) == 0))
  {
    int v42 = sub_22E0F7990();
    id v44 = (id)*sub_22DF13AC0();
    id v17 = v44;
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v41 = sub_22E0F7E50();
    v39 = v18;
    v36 = &v98;
    sub_22DE647F4(v86, &v98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3680);
    uint64_t v37 = sub_22E0F7590();
    uint64_t v38 = v19;
    v39[3] = MEMORY[0x263F8D310];
    unint64_t v20 = sub_22DE103A4();
    uint64_t v21 = v37;
    uint64_t v22 = v38;
    v23 = v39;
    unint64_t v24 = v20;
    uint64_t v25 = v41;
    v39[4] = v24;
    uint64_t *v23 = v21;
    v23[1] = v22;
    sub_22DE04404();
    uint64_t v43 = v25;
    sub_22E0F7340();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v102 = sub_22E0F7610();
    uint64_t v103 = v15;
    swift_bridgeObjectRelease();
    int v45 = sub_22E0F7990();
    id v47 = (id)*sub_22DF13AC0();
    id v16 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v46 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();
  }
  sub_22DFB4828();
  v34 = &v108;
  uint64_t v31 = v108;
  uint64_t v32 = v109;
  swift_bridgeObjectRetain();
  v33 = &v102;
  uint64_t v29 = v102;
  uint64_t v30 = v103;
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_22DF017CC();
  id v35 = sub_22DF920B4(v31, v32, v29, v30, v26, v27 & 1);
  sub_22DE0D044();
  sub_22DE0D044();
  return v35;
}

uint64_t sub_22E085EF8(uint64_t a1)
{
  uint64_t v32 = a1;
  uint64_t v50 = 0;
  uint64_t v33 = sub_22E0F66E0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = v33 - 8;
  unint64_t v36 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v33, v2, v3, v4);
  uint64_t v37 = (char *)&v10 - v36;
  uint64_t v50 = a1;
  uint64_t v39 = sub_22E0F66D0();
  uint64_t v40 = v5;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_22E0F7610();
  uint64_t v41 = v6;
  swift_bridgeObjectRetain();
  v47[0] = v39;
  v47[1] = v40;
  uint64_t v48 = v38;
  uint64_t v49 = v41;
  if (v40)
  {
    sub_22DE58A58(v47, v42);
    if (v49)
    {
      uint64_t v25 = v42[0];
      uint64_t v28 = v42[1];
      swift_bridgeObjectRetain();
      uint64_t v29 = v47;
      uint64_t v26 = v48;
      uint64_t v27 = v49;
      swift_bridgeObjectRetain();
      int v30 = sub_22E0F7620();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DE0D044();
      int v31 = v30;
      goto LABEL_7;
    }
    sub_22DE0D044();
    goto LABEL_9;
  }
  if (v49)
  {
LABEL_9:
    sub_22DE5875C();
    int v31 = 0;
    goto LABEL_7;
  }
  sub_22DE0D044();
  int v31 = 1;
LABEL_7:
  int v24 = v31;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v37, v32, v33);
  if ((v24 & 1) == 0)
  {
    uint64_t v20 = sub_22E0F66D0();
    uint64_t v21 = v7;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_22E0F7610();
    uint64_t v22 = v8;
    swift_bridgeObjectRetain();
    v44[0] = v20;
    v44[1] = v21;
    uint64_t v45 = v19;
    uint64_t v46 = v22;
    if (v21)
    {
      sub_22DE58A58(v44, v43);
      if (v46)
      {
        uint64_t v12 = v43[0];
        uint64_t v15 = v43[1];
        swift_bridgeObjectRetain();
        uint64_t v13 = v45;
        id v16 = v44;
        uint64_t v14 = v46;
        swift_bridgeObjectRetain();
        int v17 = sub_22E0F7620();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_22DE0D044();
        int v18 = v17;
LABEL_18:
        int v11 = v18;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v23 = v11;
        goto LABEL_21;
      }
      sub_22DE0D044();
    }
    else if (!v46)
    {
      sub_22DE0D044();
      int v18 = 1;
      goto LABEL_18;
    }
    sub_22DE5875C();
    int v18 = 0;
    goto LABEL_18;
  }
  int v23 = 1;
LABEL_21:
  int v10 = v23;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
  return v10 & 1;
}

uint64_t sub_22E0863C0(uint64_t a1, uint64_t a2)
{
  v9[2] = a1;
  v9[3] = a2;
  uint64_t v6 = *sub_22E084E1C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = type metadata accessor for INDeviceCategory();
  MEMORY[0x230F9BAF0](v9, v8, v6, MEMORY[0x263F8D310], v2, MEMORY[0x263F8D320]);
  sub_22DE0D044();
  uint64_t v7 = v9[0];
  swift_bridgeObjectRelease();
  return v7;
}

id sub_22E08647C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_22E08B27C(a1, a2, a3, a4);
}

id sub_22E0864DC()
{
  int v64 = 0;
  uint64_t v63 = 0;
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C00B0);
  unint64_t v29 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v0, v1, v2, v3);
  uint64_t v53 = (uint64_t)&v28 - v29;
  unint64_t v30 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v28 - v29, v5, v6, v7);
  uint64_t v52 = (uint64_t)&v28 - v30;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0C00);
  unint64_t v31 = (*(void *)(*(void *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8, v9, v10, v11);
  uint64_t v43 = (char *)&v28 - v31;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0C08);
  unint64_t v32 = (*(void *)(*(void *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12, v13, v14, v15);
  int v42 = (char *)&v28 - v32;
  uint64_t v45 = 0;
  uint64_t v59 = sub_22E0F58B0();
  int v55 = *(void **)(v59 - 8);
  uint64_t v56 = v59 - 8;
  unint64_t v33 = (v55[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v45, v16, v17, v18);
  id v57 = (char *)&v28 - v33;
  int v64 = (char *)&v28 - v33;
  unint64_t v34 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20, v21, v22, v23);
  int v58 = (char *)&v28 - v34;
  uint64_t v63 = (char *)&v28 - v34;
  uint64_t v35 = sub_22E0F5AE0();
  uint64_t v24 = *(void *)(v35 - 8);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v24 + 56);
  uint64_t v36 = v24 + 56;
  unsigned int v49 = 1;
  v37(v42, 1);
  uint64_t v38 = sub_22E0F5B10();
  uint64_t v25 = *(void *)(v38 - 8);
  uint64_t v40 = *(void (**)(char *, void))(v25 + 56);
  uint64_t v39 = v25 + 56;
  v40(v43, v49);
  uint64_t v44 = 1;
  int v41 = 1;
  unsigned int v48 = 0;
  sub_22E0F58A0();
  ((void (*)(char *, void, void, uint64_t))v37)(v42, v49, v49, v35);
  ((void (*)(char *, void, void, uint64_t))v40)(v43, v49, v49, v38);
  sub_22E0F58A0();
  unint64_t v54 = sub_22DEF9820();
  sub_22DEF9760();
  id v47 = (void (*)(uint64_t, char *, uint64_t))v55[2];
  uint64_t v46 = v55 + 2;
  v47(v52, v58, v59);
  uint64_t v51 = (void (*)(uint64_t, void, void, uint64_t))v55[7];
  uint64_t v50 = v55 + 7;
  v51(v52, v48, v49, v59);
  v47(v53, v57, v59);
  v51(v53, v48, v49, v59);
  id v26 = sub_22DF7DEE8(v52, v53);
  id v62 = sub_22DEF9888(v26);
  int v61 = (void (*)(char *, uint64_t))v55[1];
  id v60 = v55 + 1;
  v61(v57, v59);
  v61(v58, v59);
  return v62;
}

uint64_t sub_22E086A78(uint64_t a1)
{
  uint64_t v293 = a1;
  v244 = "Fatal error";
  v245 = "Unexpectedly found nil while unwrapping an Optional value";
  v246 = "SiriSettingsIntents/ConverterUtils.swift";
  v312 = 0;
  v311 = 0;
  v310 = 0;
  v309 = 0;
  uint64_t v305 = 0;
  char v306 = 0;
  uint64_t v301 = 0;
  char v302 = 0;
  id v300 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C00B0);
  unint64_t v247 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1, v2, v3, v4);
  uint64_t v248 = (uint64_t)&v127 - v247;
  unint64_t v249 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v247, v6, v7, v8);
  uint64_t v250 = (uint64_t)&v127 - v249;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3688);
  unint64_t v251 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9, v10, v11, v12);
  uint64_t v252 = (uint64_t)&v127 - v251;
  unint64_t v253 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v251, v14, v15, v16);
  uint64_t v254 = (uint64_t)&v127 - v253;
  unint64_t v255 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v253, v18, v19, v20);
  uint64_t v256 = (uint64_t)&v127 - v255;
  unint64_t v257 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v255, v22, v23, v24);
  uint64_t v258 = (uint64_t)&v127 - v257;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0C00);
  unint64_t v259 = (*(void *)(*(void *)(v25 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25, v26, v27, v28);
  v260 = (char *)&v127 - v259;
  unint64_t v261 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v259, v30, v31, v32);
  v262 = (char *)&v127 - v261;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0C08);
  unint64_t v263 = (*(void *)(*(void *)(v33 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v33, v34, v35, v36);
  v264 = (char *)&v127 - v263;
  unint64_t v265 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v263, v38, v39, v40);
  v266 = (char *)&v127 - v265;
  uint64_t v291 = 0;
  uint64_t v267 = sub_22E0F58B0();
  v268 = *(void **)(v267 - 8);
  uint64_t v269 = v267 - 8;
  unint64_t v270 = (v268[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v267, v41, v42, v43);
  v271 = (char *)&v127 - v270;
  v312 = (char *)&v127 - v270;
  unint64_t v272 = (v44 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v45, v46, v47, v48);
  v273 = (char *)&v127 - v272;
  v311 = (char *)&v127 - v272;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3690);
  uint64_t v274 = *(void *)(*(void *)(v49 - 8) + 64);
  unint64_t v275 = (v274 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v49, v50, v51, v52);
  uint64_t v276 = (uint64_t)&v127 - v275;
  unint64_t v277 = (v53 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v275, v54, v55, v56);
  uint64_t v278 = (uint64_t)&v127 - v277;
  unint64_t v279 = (v57 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v277, v58, v59, v60);
  uint64_t v280 = (uint64_t)&v127 - v279;
  unint64_t v281 = (v61 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v279, v62, v63, v64);
  uint64_t v282 = (uint64_t)&v127 - v281;
  unint64_t v283 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v281, v66, v67, v68);
  uint64_t v284 = (uint64_t)&v127 - v283;
  unint64_t v285 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v283, v70, v71, v72);
  uint64_t v286 = (uint64_t)&v127 - v285;
  unint64_t v287 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v285, v74, v75, v76);
  uint64_t v288 = (uint64_t)&v127 - v287;
  unint64_t v289 = (v77 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v127 - v287, v78, v79, v80);
  uint64_t v290 = (uint64_t)&v127 - v289;
  unint64_t v292 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685C3650) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v291, v81, v82, v83);
  uint64_t v299 = (uint64_t)&v127 - v292;
  uint64_t v298 = sub_22E0F6760();
  uint64_t v296 = *(void *)(v298 - 8);
  uint64_t v297 = v298 - 8;
  unint64_t v294 = (*(void *)(v296 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v293, v299, v84, v85);
  v295 = (char *)&v127 - v294;
  v310 = (char *)&v127 - v294;
  v309 = v86;
  sub_22E08AC74(v86, v87);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v296 + 48))(v299, 1, v298) == 1)
  {
    uint64_t v127 = 0;
    sub_22E08AACC(v299);
    return v127;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v296 + 32))(v295, v299, v298);
  sub_22E0F6740();
  uint64_t v239 = sub_22E0F67A0();
  uint64_t v240 = *(void *)(v239 - 8);
  uint64_t v241 = v239 - 8;
  v242 = *(unsigned int (**)(uint64_t, uint64_t))(v240 + 48);
  uint64_t v243 = v240 + 48;
  if (v242(v290, 1) == 1)
  {
    uint64_t v128 = 0;
    sub_22E08AD9C(v290);
    uint64_t v237 = v128;
    int v238 = 1;
  }
  else
  {
    uint64_t v235 = sub_22E0F6790();
    int v236 = v88;
    (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v290, v239);
    uint64_t v237 = v235;
    int v238 = v236;
  }
  uint64_t v307 = v237;
  char v308 = v238 & 1;
  BOOL v234 = (v238 & 1) == 0;
  if (v238)
  {
    uint64_t v228 = 0;
    int v229 = 1;
LABEL_15:
    int v225 = v229;
    uint64_t v226 = v228;
    uint64_t v305 = v228;
    unsigned int v227 = 1;
    char v306 = v229 & 1;
    sub_22E0F6720();
    if (((unsigned int (*)(uint64_t, void, uint64_t))v242)(v286, v227, v239) == 1)
    {
      uint64_t v129 = 0;
      sub_22E08AD9C(v286);
      uint64_t v223 = v129;
      int v224 = 1;
    }
    else
    {
      uint64_t v221 = sub_22E0F6790();
      int v222 = v92;
      (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v286, v239);
      uint64_t v223 = v221;
      int v224 = v222;
    }
    uint64_t v303 = v223;
    char v304 = v224 & 1;
    BOOL v220 = (v224 & 1) == 0;
    if (v224)
    {
      uint64_t v214 = 0;
      int v215 = 1;
      goto LABEL_28;
    }
    sub_22E0F6720();
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v242)(v284, 1, v239) == 1)
    {
      uint64_t result = sub_22E08AD9C(v284);
      __break(1u);
    }
    else
    {
      uint64_t v218 = sub_22E0F6790();
      int v219 = v93;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v240 + 8))(v284, v239);
      if (v219)
      {
        LOBYTE(v123) = 2;
        uint64_t v124 = 455;
        LODWORD(v125) = 0;
        uint64_t result = sub_22E0F7CA0();
        __break(1u);
      }
      else
      {
        uint64_t v217 = v218;
      }
      uint64_t v216 = v217 + 1;
      if (!__OFADD__(v217, 1))
      {
        uint64_t v214 = v216;
        int v215 = 0;
LABEL_28:
        int v204 = v215;
        uint64_t v205 = v214;
        uint64_t v301 = v214;
        unsigned int v213 = 1;
        char v302 = v215 & 1;
        uint64_t v209 = 0;
        uint64_t v206 = sub_22E0F5AE0();
        uint64_t v95 = *(void *)(v206 - 8);
        v207 = *(void (**)(char *, void))(v95 + 56);
        uint64_t v208 = v95 + 56;
        v207(v266, v213);
        uint64_t v210 = sub_22E0F5B10();
        uint64_t v96 = *(void *)(v210 - 8);
        v211 = *(void (**)(char *, void))(v96 + 56);
        uint64_t v212 = v96 + 56;
        v211(v262, v213);
        sub_22E0F6740();
        if (((unsigned int (*)(uint64_t, void, uint64_t))v242)(v282, v213, v239) == 1)
        {
          uint64_t v130 = 0;
          sub_22E08AD9C(v282);
          uint64_t v202 = v130;
          int v203 = 1;
        }
        else
        {
          uint64_t v200 = sub_22E0F6780();
          int v201 = v97;
          (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v282, v239);
          uint64_t v202 = v200;
          int v203 = v201;
        }
        int v198 = v203;
        uint64_t v199 = v202;
        sub_22E0F6740();
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v242)(v280, 1, v239) == 1)
        {
          uint64_t v131 = 0;
          sub_22E08AD9C(v280);
          uint64_t v196 = v131;
          int v197 = 1;
        }
        else
        {
          uint64_t v194 = sub_22E0F6770();
          int v195 = v98;
          (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v280, v239);
          uint64_t v196 = v194;
          int v197 = v195;
        }
        int v187 = v197;
        uint64_t v188 = v196;
        sub_22E0F6750();
        uint64_t v189 = sub_22E0F67D0();
        uint64_t v190 = *(void *)(v189 - 8);
        uint64_t v191 = v189 - 8;
        v192 = *(unsigned int (**)(uint64_t, uint64_t))(v190 + 48);
        uint64_t v193 = v190 + 48;
        if (v192(v258, 1) == 1)
        {
          uint64_t v132 = 0;
          sub_22E08AE4C(v258);
          uint64_t v185 = v132;
          int v186 = 1;
        }
        else
        {
          uint64_t v183 = sub_22E0F67C0();
          int v184 = v99;
          (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v258, v189);
          uint64_t v185 = v183;
          int v186 = v184;
        }
        int v181 = v186;
        uint64_t v182 = v185;
        sub_22E0F6750();
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v192)(v256, 1, v189) == 1)
        {
          uint64_t v133 = 0;
          sub_22E08AE4C(v256);
          uint64_t v179 = v133;
          int v180 = 1;
        }
        else
        {
          uint64_t v177 = sub_22E0F67B0();
          int v178 = v100;
          (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v256, v189);
          uint64_t v179 = v177;
          int v180 = v178;
        }
        int v174 = 1;
        unsigned int v176 = 1;
        v175 = &v105;
        uint64_t v105 = v188;
        char v106 = v187 & 1;
        uint64_t v107 = v182;
        char v108 = v181 & 1;
        uint64_t v109 = v179;
        char v110 = v180 & 1;
        uint64_t v111 = 0;
        char v112 = 1;
        uint64_t v113 = 0;
        char v114 = 1;
        uint64_t v115 = 0;
        char v116 = 1;
        uint64_t v117 = 0;
        char v118 = 1;
        uint64_t v119 = 0;
        char v120 = 1;
        uint64_t v121 = 0;
        char v122 = 1;
        uint64_t v123 = 0;
        LOBYTE(v124) = 1;
        uint64_t v125 = 0;
        char v126 = 1;
        sub_22E0F58A0();
        ((void (*)(char *, void, void, uint64_t))v207)(v264, v176, v176, v206);
        ((void (*)(char *, void, void, uint64_t))v211)(v260, v176, v176, v210);
        sub_22E0F6720();
        if (((unsigned int (*)(uint64_t, void, uint64_t))v242)(v278, v176, v239) == 1)
        {
          uint64_t v134 = 0;
          sub_22E08AD9C(v278);
          uint64_t v172 = v134;
          int v173 = 1;
        }
        else
        {
          uint64_t v170 = sub_22E0F6780();
          int v171 = v101;
          (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v278, v239);
          uint64_t v172 = v170;
          int v173 = v171;
        }
        int v168 = v173;
        uint64_t v169 = v172;
        sub_22E0F6720();
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v242)(v276, 1, v239) == 1)
        {
          uint64_t v135 = 0;
          sub_22E08AD9C(v276);
          uint64_t v166 = v135;
          int v167 = 1;
        }
        else
        {
          uint64_t v164 = sub_22E0F6770();
          int v165 = v102;
          (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v276, v239);
          uint64_t v166 = v164;
          int v167 = v165;
        }
        int v162 = v167;
        uint64_t v163 = v166;
        sub_22E0F6730();
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v192)(v254, 1, v189) == 1)
        {
          uint64_t v136 = 0;
          sub_22E08AE4C(v254);
          uint64_t v160 = v136;
          int v161 = 1;
        }
        else
        {
          uint64_t v158 = sub_22E0F67C0();
          int v159 = v103;
          (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v254, v189);
          uint64_t v160 = v158;
          int v161 = v159;
        }
        int v156 = v161;
        uint64_t v157 = v160;
        sub_22E0F6730();
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v192)(v252, 1, v189) == 1)
        {
          uint64_t v137 = 0;
          sub_22E08AE4C(v252);
          uint64_t v154 = v137;
          int v155 = 1;
        }
        else
        {
          uint64_t v152 = sub_22E0F67B0();
          int v153 = v104;
          (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v252, v189);
          uint64_t v154 = v152;
          int v155 = v153;
        }
        int v138 = 1;
        unsigned int v143 = 1;
        v139 = &v105;
        uint64_t v105 = v163;
        char v106 = v162 & 1;
        uint64_t v107 = v157;
        char v108 = v156 & 1;
        uint64_t v109 = v154;
        char v110 = v155 & 1;
        uint64_t v146 = 0;
        uint64_t v111 = 0;
        char v112 = 1;
        uint64_t v113 = 0;
        char v114 = 1;
        uint64_t v115 = 0;
        char v116 = 1;
        uint64_t v117 = 0;
        char v118 = 1;
        uint64_t v119 = 0;
        char v120 = 1;
        uint64_t v121 = 0;
        char v122 = 1;
        uint64_t v123 = 0;
        LOBYTE(v124) = 1;
        uint64_t v125 = 0;
        char v126 = 1;
        sub_22E0F58A0();
        sub_22DEF9760();
        v141 = (void (*)(uint64_t, char *, uint64_t))v268[2];
        v140 = v268 + 2;
        v141(v250, v273, v267);
        v145 = (void (*)(uint64_t))v268[7];
        v144 = v268 + 7;
        unsigned int v142 = 0;
        v145(v250);
        v141(v248, v271, v267);
        ((void (*)(uint64_t, void, void, uint64_t))v145)(v248, v142, v143, v267);
        id v147 = sub_22DF7DEE8(v250, v248);
        id v300 = v147;
        sub_22DEF9820();
        id v150 = sub_22DEF9888(v147);
        v149 = (void (*)(char *, uint64_t))v268[1];
        v148 = v268 + 1;
        v149(v271, v267);
        v149(v273, v267);
        (*(void (**)(char *, uint64_t))(v296 + 8))(v295, v298);
        return (uint64_t)v150;
      }
    }
    __break(1u);
    goto LABEL_60;
  }
  sub_22E0F6740();
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v242)(v288, 1, v239) != 1)
  {
    uint64_t v232 = sub_22E0F6790();
    int v233 = v89;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v240 + 8))(v288, v239);
    if (v233)
    {
      LOBYTE(v123) = 2;
      uint64_t v124 = 454;
      LODWORD(v125) = 0;
      uint64_t result = sub_22E0F7CA0();
      __break(1u);
    }
    else
    {
      uint64_t v231 = v232;
    }
    uint64_t v230 = v231 + 1;
    if (__OFADD__(v231, 1)) {
      goto LABEL_61;
    }
    uint64_t v228 = v230;
    int v229 = 0;
    goto LABEL_15;
  }
  uint64_t result = sub_22E08AD9C(v288);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

id sub_22E08880C(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_22E08B3B0(a1, a2);
}

id sub_22E088864(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v67 = 0;
  uint64_t v66 = 0;
  uint64_t v65 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C00B0);
  unint64_t v29 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1, v2, v3, v4);
  uint64_t v55 = (uint64_t)&v29 - v29;
  unint64_t v30 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v29 - v29, v6, v7, v8);
  uint64_t v54 = (uint64_t)&v29 - v30;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0C00);
  unint64_t v31 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9, v10, v11, v12);
  uint64_t v45 = (char *)&v29 - v31;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0C08);
  unint64_t v32 = (*(void *)(*(void *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13, v14, v15, v16);
  uint64_t v44 = (char *)&v29 - v32;
  uint64_t v47 = 0;
  uint64_t v61 = sub_22E0F58B0();
  uint64_t v57 = *(void **)(v61 - 8);
  uint64_t v58 = v61 - 8;
  uint64_t v34 = v57[8];
  unint64_t v33 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v47, v17, v18, v19);
  uint64_t v59 = (char *)&v29 - v33;
  uint64_t v67 = (char *)&v29 - v33;
  unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20, v21, v22, v23);
  uint64_t v60 = (char *)&v29 - v35;
  uint64_t v66 = (char *)&v29 - v35;
  uint64_t v65 = v24;
  uint64_t v37 = sub_22E0F5AE0();
  uint64_t v25 = *(void *)(v37 - 8);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v25 + 56);
  uint64_t v38 = v25 + 56;
  unsigned int v51 = 1;
  v39(v44, 1);
  uint64_t v40 = sub_22E0F5B10();
  uint64_t v26 = *(void *)(v40 - 8);
  uint64_t v42 = *(void (**)(char *, void))(v26 + 56);
  uint64_t v41 = v26 + 56;
  v42(v45, v51);
  uint64_t v46 = 1;
  int v43 = 1;
  unsigned int v50 = 0;
  sub_22E0F58A0();
  ((void (*)(char *, void, void, uint64_t))v39)(v44, v51, v51, v37);
  ((void (*)(char *, void, void, uint64_t))v42)(v45, v51, v51, v40);
  sub_22E0F58A0();
  unint64_t v56 = sub_22DEF9820();
  sub_22DEF9760();
  uint64_t v49 = (void (*)(uint64_t, char *, uint64_t))v57[2];
  uint64_t v48 = v57 + 2;
  v49(v54, v60, v61);
  uint64_t v53 = (void (*)(uint64_t, void, void, uint64_t))v57[7];
  uint64_t v52 = v57 + 7;
  v53(v54, v50, v51, v61);
  v49(v55, v59, v61);
  v53(v55, v50, v51, v61);
  id v27 = sub_22DF7DEE8(v54, v55);
  id v64 = sub_22DEF9888(v27);
  uint64_t v63 = (void (*)(char *, uint64_t))v57[1];
  uint64_t v62 = v57 + 1;
  v63(v59, v61);
  v63(v60, v61);
  return v64;
}

uint64_t sub_22E088E34()
{
  return 0;
}

uint64_t sub_22E088E50()
{
  sub_22E0853DC();
  swift_bridgeObjectRetain();
  sub_22E0F66D0();
  if (!v0)
  {
    sub_22E0F7610();
    sub_22DE0D044();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B78);
  sub_22DEF33AC();
  char v2 = sub_22E0F76A0();
  sub_22DE0D044();
  sub_22DE09E50();
  return v2 & 1;
}

uint64_t sub_22E088F70(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v1 = sub_22E085068();
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_22E0F66D0();
  uint64_t v9 = v2;
  swift_bridgeObjectRetain();
  v11[0] = v7;
  v11[1] = v8;
  v11[2] = v6;
  uint64_t v12 = v9;
  if (!v8)
  {
    if (!v12)
    {
      sub_22DE0D044();
      char v5 = 1;
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  sub_22DE58A58(v11, &v10);
  if (!v12)
  {
    sub_22DE0D044();
LABEL_8:
    sub_22DE5875C();
    char v5 = 0;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DE0D044();
  char v5 = v4;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22E089120(uint64_t a1)
{
  uint64_t v200 = a1;
  uint64_t v154 = sub_22DEEAA8C;
  int v155 = sub_22DEEAA8C;
  int v156 = sub_22DEEAA8C;
  uint64_t v157 = sub_22DEEAA8C;
  uint64_t v158 = sub_22DEEAA8C;
  int v159 = sub_22DEEAA8C;
  uint64_t v160 = sub_22DEEAA8C;
  int v161 = sub_22DEEAA8C;
  int v162 = sub_22DEEAA8C;
  uint64_t v163 = sub_22DEEAA8C;
  uint64_t v164 = sub_22DEEAA8C;
  unint64_t v251 = 0;
  uint64_t v250 = 0;
  uint64_t v248 = 0;
  uint64_t v249 = 0;
  uint64_t v233 = 0;
  uint64_t v165 = 0;
  uint64_t v230 = 0;
  uint64_t v227 = 0;
  uint64_t v224 = 0;
  uint64_t v221 = 0;
  uint64_t v218 = 0;
  uint64_t v215 = 0;
  uint64_t v212 = 0;
  uint64_t v209 = 0;
  uint64_t v206 = 0;
  uint64_t v203 = 0;
  uint64_t v169 = sub_22E0F66E0();
  uint64_t v194 = *(void *)(v169 - 8);
  uint64_t v168 = v169 - 8;
  unint64_t v166 = (*(void *)(v194 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v169, v1, v2, v3);
  int v167 = (char *)&v55 - v166;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B40);
  uint64_t v191 = *(void *)(*(void *)(v4 - 8) + 64);
  unint64_t v170 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4, v5, v6, v169);
  int v171 = (char *)&v55 - v170;
  unint64_t v172 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v170, v7, v8, v9);
  int v173 = (char *)&v55 - v172;
  unint64_t v174 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v172, v10, v11, v12);
  v175 = (char *)&v55 - v174;
  unint64_t v176 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v174, v13, v14, v15);
  uint64_t v177 = (char *)&v55 - v176;
  unint64_t v178 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v176, v16, v17, v18);
  uint64_t v179 = (char *)&v55 - v178;
  unint64_t v180 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v178, v19, v20, v21);
  int v181 = (char *)&v55 - v180;
  unint64_t v182 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v180, v22, v23, v24);
  uint64_t v183 = (char *)&v55 - v182;
  unint64_t v184 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v182, v25, v26, v27);
  uint64_t v185 = (char *)&v55 - v184;
  unint64_t v186 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v184, v28, v29, v30);
  int v187 = (char *)&v55 - v186;
  unint64_t v188 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v186, v31, v32, v33);
  uint64_t v189 = (char *)&v55 - v188;
  unint64_t v190 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v55 - v188, v34, v35, v36);
  v192 = (char *)&v55 - v190;
  unint64_t v193 = (v191 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v40 = MEMORY[0x270FA5388]((char *)&v55 - v190, v37, v38, v39);
  int v195 = (char *)&v55 - v193;
  unint64_t v251 = (char *)&v55 - v193;
  uint64_t v250 = v200;
  uint64_t v196 = *(void (**)(double))(v194 + 56);
  uint64_t v197 = v194 + 56;
  v196(v40);
  uint64_t v41 = sub_22DF25D98();
  uint64_t v198 = *v41;
  uint64_t v199 = v41[1];
  swift_bridgeObjectRetain();
  uint64_t v248 = v198;
  uint64_t v249 = v199;
  swift_retain();
  sub_22E0F6980();
  swift_release();
  if (!v247) {
    goto LABEL_124;
  }
  int v153 = v245;
  sub_22E08AEFC((uint64_t)v246, (uint64_t)v245);
  uint64_t v152 = 0;
  sub_22E0F6CA0();
  if (swift_dynamicCast())
  {
    uint64_t v150 = v244;
    uint64_t v203 = v244;
    swift_retain();
    sub_22E0F6AA0();
    uint64_t v151 = v202;
    swift_release();
    if (!v151 || (v149 = v151, uint64_t v147 = v151, v148 = sub_22E0F6820(), swift_release(), !v148))
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v192, 1, 1, v169);
      goto LABEL_11;
    }
    uint64_t v146 = v148;
    uint64_t v42 = v165;
    uint64_t v201 = v148;
    uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
    sub_22DEF221C();
    uint64_t result = sub_22E0F7670();
    if (!v42)
    {
      sub_22DE09E50();
LABEL_11:
      sub_22E08AF94(v192, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
LABEL_125:
      if ((*(uint64_t (**)(char *, uint64_t, uint64_t))(v194 + 48))(v195, 1, v169) == 0)
      {
        (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v167, v195, v169);
        uint64_t v57 = sub_22E0F66C0();
        uint64_t v58 = v54;
        (*(void (**)(char *, uint64_t))(v194 + 8))(v167, v169);
        uint64_t v59 = v57;
        uint64_t v60 = v58;
      }
      else
      {
        uint64_t v59 = 0;
        uint64_t v60 = 0;
      }
      uint64_t v56 = v60;
      uint64_t v55 = v59;
      swift_bridgeObjectRelease();
      sub_22DEEA9DC((uint64_t)v195);
      uint64_t v63 = v55;
      uint64_t v64 = v56;
      return v63;
    }
    __break(1u);
    goto LABEL_131;
  }
  uint64_t v144 = 0;
  sub_22E0F6DA0();
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v136 = 0;
    sub_22E0F6B10();
    if (swift_dynamicCast())
    {
      uint64_t v134 = v242;
      uint64_t v209 = v242;
      swift_retain();
      sub_22E0F6D40();
      uint64_t v135 = v208;
      swift_release();
      if (v135 && (v133 = v135, uint64_t v131 = v135, v132 = sub_22E0F6820(), swift_release(), v132))
      {
        uint64_t v130 = v132;
        uint64_t v45 = v165;
        uint64_t v207 = v132;
        uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v45) {
          goto LABEL_132;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v187, 1, 1, v169);
      }
      sub_22E08AF94(v187, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v128 = 0;
    sub_22E0F6BC0();
    if (swift_dynamicCast())
    {
      uint64_t v126 = v241;
      uint64_t v212 = v241;
      swift_retain();
      sub_22E0F6D40();
      uint64_t v127 = v211;
      swift_release();
      if (v127 && (v125 = v127, uint64_t v123 = v127, v124 = sub_22E0F6820(), swift_release(), v124))
      {
        uint64_t v122 = v124;
        uint64_t v46 = v165;
        uint64_t v210 = v124;
        uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v46) {
          goto LABEL_133;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v185, 1, 1, v169);
      }
      sub_22E08AF94(v185, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v120 = 0;
    sub_22E0F6A80();
    if (swift_dynamicCast())
    {
      uint64_t v118 = v240;
      uint64_t v215 = v240;
      swift_retain();
      sub_22E0F6D40();
      uint64_t v119 = v214;
      swift_release();
      if (v119 && (v117 = v119, uint64_t v115 = v119, v116 = sub_22E0F6820(), swift_release(), v116))
      {
        uint64_t v114 = v116;
        uint64_t v47 = v165;
        uint64_t v213 = v116;
        uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v47) {
          goto LABEL_134;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v183, 1, 1, v169);
      }
      sub_22E08AF94(v183, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v112 = 0;
    sub_22E0F6C90();
    if (swift_dynamicCast())
    {
      uint64_t v110 = v239;
      uint64_t v218 = v239;
      swift_retain();
      sub_22E0F6DE0();
      uint64_t v111 = v217;
      swift_release();
      if (v111 && (v109 = v111, uint64_t v107 = v111, v108 = sub_22E0F6820(), swift_release(), v108))
      {
        uint64_t v106 = v108;
        uint64_t v48 = v165;
        uint64_t v216 = v108;
        uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v48) {
          goto LABEL_135;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v181, 1, 1, v169);
      }
      sub_22E08AF94(v181, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v104 = 0;
    sub_22E0F6E00();
    if (swift_dynamicCast())
    {
      uint64_t v102 = v238;
      uint64_t v221 = v238;
      swift_retain();
      sub_22E0F6E20();
      uint64_t v103 = v220;
      swift_release();
      if (v103 && (v101 = v103, uint64_t v99 = v103, v100 = sub_22E0F6820(), swift_release(), v100))
      {
        uint64_t v98 = v100;
        uint64_t v49 = v165;
        uint64_t v219 = v100;
        uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v49) {
          goto LABEL_136;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v179, 1, 1, v169);
      }
      sub_22E08AF94(v179, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v96 = 0;
    sub_22E0F6D10();
    if (swift_dynamicCast())
    {
      uint64_t v94 = v237;
      uint64_t v224 = v237;
      swift_retain();
      sub_22E0F6DE0();
      uint64_t v95 = v223;
      swift_release();
      if (v95 && (v93 = v95, v91 = v95, uint64_t v92 = sub_22E0F6820(), swift_release(), v92))
      {
        uint64_t v90 = v92;
        uint64_t v50 = v165;
        uint64_t v222 = v92;
        uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v50) {
          goto LABEL_137;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v177, 1, 1, v169);
      }
      sub_22E08AF94(v177, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v88 = 0;
    sub_22E0F6DF0();
    if (swift_dynamicCast())
    {
      uint64_t v86 = v236;
      uint64_t v227 = v236;
      swift_retain();
      sub_22E0F6E20();
      uint64_t v87 = v226;
      swift_release();
      if (v87 && (v85 = v87, uint64_t v83 = v87, v84 = sub_22E0F6820(), swift_release(), v84))
      {
        uint64_t v82 = v84;
        uint64_t v51 = v165;
        uint64_t v225 = v84;
        uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v51) {
          goto LABEL_138;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v175, 1, 1, v169);
      }
      sub_22E08AF94(v175, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v80 = 0;
    sub_22E0F6D00();
    if (swift_dynamicCast())
    {
      uint64_t v78 = v235;
      uint64_t v230 = v235;
      swift_retain();
      sub_22E0F6DE0();
      uint64_t v79 = v229;
      swift_release();
      if (v79 && (v77 = v79, uint64_t v75 = v79, v76 = sub_22E0F6820(), swift_release(), v76))
      {
        uint64_t v74 = v76;
        uint64_t v52 = v165;
        uint64_t v228 = v76;
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v52) {
          goto LABEL_139;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v173, 1, 1, v169);
      }
      sub_22E08AF94(v173, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    uint64_t v72 = 0;
    sub_22E0F6AD0();
    if (swift_dynamicCast())
    {
      uint64_t v70 = v234;
      uint64_t v233 = v234;
      swift_retain();
      sub_22E0F6AA0();
      uint64_t v71 = v232;
      swift_release();
      if (v71 && (v69 = v71, uint64_t v67 = v71, v68 = sub_22E0F6820(), swift_release(), v68))
      {
        uint64_t v66 = v68;
        uint64_t v53 = v165;
        uint64_t v231 = v68;
        uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
        sub_22DEF221C();
        uint64_t result = sub_22E0F7670();
        if (v53) {
          goto LABEL_140;
        }
        sub_22DE09E50();
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v171, 1, 1, v169);
      }
      sub_22E08AF94(v171, v195);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
      sub_22DE585B0((uint64_t)v246);
      goto LABEL_125;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
LABEL_124:
    uint64_t v62 = 0;
    sub_22DE585B0((uint64_t)v246);
    swift_bridgeObjectRelease();
    sub_22DEEA9DC((uint64_t)v195);
    uint64_t v63 = v62;
    uint64_t v64 = v62;
    return v63;
  }
  uint64_t v142 = v243;
  uint64_t v206 = v243;
  swift_retain();
  sub_22E0F6AA0();
  uint64_t v143 = v205;
  swift_release();
  if (!v143 || (v141 = v143, uint64_t v139 = v143, v140 = sub_22E0F6820(), swift_release(), !v140))
  {
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v196)(v189, 1, 1, v169);
    goto LABEL_22;
  }
  uint64_t v138 = v140;
  uint64_t v44 = v165;
  uint64_t v204 = v140;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B60);
  sub_22DEF221C();
  uint64_t result = sub_22E0F7670();
  if (!v44)
  {
    sub_22DE09E50();
LABEL_22:
    sub_22E08AF94(v189, v195);
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v245);
    sub_22DE585B0((uint64_t)v246);
    goto LABEL_125;
  }
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
  return result;
}

uint64_t sub_22E08A7FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v25 = a1;
  double v40 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v19 = 0;
  uint64_t v26 = sub_22E0F6560();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v18 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v2, v3, v4);
  uint64_t v27 = (char *)&v17 - v18;
  uint64_t v32 = sub_22E0F64A0();
  uint64_t v30 = *(void *)(v32 - 8);
  uint64_t v31 = v32 - 8;
  unint64_t v20 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v19, v5, v6, v7);
  uint64_t v28 = (char *)&v17 - v20;
  unint64_t v21 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8, (char *)&v17 - v20, v10, v11);
  uint64_t v33 = (char *)&v17 - v21;
  double v40 = (char *)&v17 - v21;
  uint64_t v37 = sub_22E0F65B0();
  uint64_t v34 = *(void *)(v37 - 8);
  uint64_t v35 = v37 - 8;
  unint64_t v22 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = MEMORY[0x270FA5388](v25, v12, v13, v14);
  uint64_t v36 = (char *)&v17 - v22;
  uint64_t v39 = (char *)&v17 - v22;
  uint64_t v38 = v15;
  sub_22E0F65A0();
  sub_22E0F6490();
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v27, v25, v26);
  sub_22E0F6480();
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v28, v33, v32);
  sub_22E0F6590();
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v29, v36, v37);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v36, v37);
}

uint64_t sub_22E08AACC(uint64_t a1)
{
  uint64_t v3 = sub_22E0F6760();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_22E08AB7C()
{
  return sub_22E088E50() & 1;
}

uint64_t sub_22E08ABA0(uint64_t a1)
{
  uint64_t v3 = sub_22E0F6AC0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_22E08AC50(uint64_t a1)
{
  return sub_22E088F70(a1) & 1;
}

void *sub_22E08AC74(const void *a1, void *a2)
{
  uint64_t v6 = sub_22E0F6760();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3650);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_22E08AD9C(uint64_t a1)
{
  uint64_t v3 = sub_22E0F67A0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_22E08AE4C(uint64_t a1)
{
  uint64_t v3 = sub_22E0F67D0();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_22E08AEFC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    *(void *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

void *sub_22E08AF94(const void *a1, void *a2)
{
  uint64_t v7 = sub_22E0F66E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B40);
      memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B40);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

void *type metadata accessor for ConverterUtils()
{
  return &unk_26E1DF830;
}

id sub_22E08B1D8(uint64_t a1)
{
  return objc_msgSend(v1, sel_initWithInteger_, a1);
}

id sub_22E08B200(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = (id)sub_22E0F7540();
  id v9 = objc_msgSend(v5, sel_initWithSettingId_targetDevice_targetApp_);

  swift_bridgeObjectRelease();
  return v9;
}

id sub_22E08B27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v8 = sub_22E0F7540();
    swift_bridgeObjectRelease();
    id v9 = (void *)v8;
  }
  else
  {
    id v9 = 0;
  }
  if (a4)
  {
    uint64_t v6 = sub_22E0F7540();
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithDeviceName_deviceModel_deviceCategory_, v9);

  return v5;
}

id sub_22E08B3B0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v5 = sub_22E0F7540();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v3 = (id)sub_22E0F7540();
  id v4 = objc_msgSend(v7, sel_initWithIdentifier_displayString_, v6);

  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22E08B490()
{
  type metadata accessor for SetAXColorFiltersBlueYellowHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7C58 = result;
  return result;
}

uint64_t type metadata accessor for SetAXColorFiltersBlueYellowHandler()
{
  return self;
}

uint64_t *sub_22E08B4F8()
{
  if (qword_2685BF6C0 != -1) {
    swift_once();
  }
  return &qword_2685D7C58;
}

uint64_t sub_22E08B55C(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE6D468();
  swift_release();
  id v4 = sub_22DF0A2D0();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E08B770, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E08B770);
}

uint64_t sub_22E08B700()
{
  return swift_release();
}

uint64_t sub_22E08B770()
{
  return sub_22E08B700();
}

uint64_t sub_22E08B798(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E08B55C(a1, a2, a3);
}

uint64_t *sub_22E08B7BC()
{
  if (qword_2685BF6C8 != -1) {
    swift_once();
  }
  return &qword_2685D7C60;
}

uint64_t sub_22E08B820()
{
  type metadata accessor for GetAutoCorrectHandler();
  uint64_t result = sub_22DE0D464();
  qword_2685D7C60 = result;
  return result;
}

uint64_t type metadata accessor for GetAutoCorrectHandler()
{
  return self;
}

uint64_t sub_22E08B87C(uint64_t a1, void (*a2)(id))
{
  sub_22E0F7990();
  id v4 = (id)*sub_22DF136D8();
  id v2 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  sub_22DFE69F0();
  id v6 = sub_22DF963F0();
  swift_bridgeObjectRelease();
  a2(v6);

  return swift_release();
}

uint64_t sub_22E08B998(uint64_t a1, void (*a2)(id))
{
  return sub_22E08B87C(a1, a2);
}

uint64_t *sub_22E08B9BC()
{
  if (qword_2685BF6D0 != -1) {
    swift_once();
  }
  return &qword_2685C3698;
}

uint64_t sub_22E08BA20()
{
  return sub_22E0F7610();
}

uint64_t sub_22E08BBB0()
{
  type metadata accessor for SettingsIntentConfirmationConfigProvider();
  uint64_t result = sub_22E08BC0C();
  qword_2685C3698 = result;
  return result;
}

uint64_t type metadata accessor for SettingsIntentConfirmationConfigProvider()
{
  return self;
}

uint64_t sub_22E08BC0C()
{
  return sub_22E08BC80();
}

uint64_t static SettingsIntentConfirmationConfigProvider.shared.getter()
{
  uint64_t v1 = *sub_22E08B9BC();
  swift_retain();
  return v1;
}

uint64_t sub_22E08BC80()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C36A0);
  sub_22E0F7E50();
  uint64_t v5 = v0;
  unsigned char *v0 = 29;
  char v1 = sub_22E08C3E4();
  sub_22E08C3EC(2, 0, v1, (uint64_t)sub_22E08CD18, 0, (uint64_t)sub_22E08CD94, 0, (uint64_t)sub_22E08CDAC, (uint64_t)v7, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 8, v7, 0x60uLL);
  v5[104] = 0;
  sub_22E08C3EC(1, 1, 0, (uint64_t)sub_22E08CE84, 0, (uint64_t)sub_22E08CF00, 0, (uint64_t)sub_22E08CF88, (uint64_t)v8, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 112, v8, 0x60uLL);
  v5[208] = 51;
  sub_22E08C3EC(2, 1, 4, (uint64_t)sub_22E08D01C, 0, (uint64_t)sub_22E08CF00, 0, (uint64_t)sub_22E08D098, (uint64_t)v9, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 216, v9, 0x60uLL);
  v5[312] = 16;
  sub_22E08C3EC(2, 1, 1, (uint64_t)sub_22E08D12C, 0, (uint64_t)sub_22E08CF00, 0, (uint64_t)sub_22E08D1A8, (uint64_t)v10, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 320, v10, 0x60uLL);
  v5[416] = 35;
  sub_22E08C3EC(1, 0, 5, (uint64_t)sub_22E08D23C, 0, (uint64_t)sub_22E08CD94, 0, (uint64_t)sub_22E08D2B8, (uint64_t)v11, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 424, v11, 0x60uLL);
  v5[520] = 36;
  sub_22E08C3EC(1, 0, 6, (uint64_t)sub_22E08D34C, 0, (uint64_t)sub_22E08CD94, 0, (uint64_t)sub_22E08D3C8, (uint64_t)v12, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 528, v12, 0x60uLL);
  v5[624] = 45;
  sub_22E08C3EC(2, 1, 3, (uint64_t)sub_22E08D45C, 0, (uint64_t)sub_22E08CD94, 0, (uint64_t)sub_22E08D744, (uint64_t)v13, 0, (uint64_t)sub_22E08D82C, 0, (uint64_t)sub_22E08CE40, 0);
  memcpy(v5 + 632, v13, 0x60uLL);
  v5[728] = 26;
  char v2 = sub_22E08C3E4();
  sub_22E08C3EC(2, 0, v2, (uint64_t)sub_22E08D83C, 0, (uint64_t)sub_22E08CD94, 0, (uint64_t)sub_22E08D854, (uint64_t)v14, 0, (uint64_t)sub_22DE5AE0C, 0, (uint64_t)sub_22E08D8B8, 0);
  memcpy(v5 + 736, v14, 0x60uLL);
  sub_22DE04404();
  sub_22DF5FF30();
  uint64_t v3 = sub_22E0F74D0();
  uint64_t result = v6;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = 5;
  return result;
}

uint64_t sub_22E08C3E4()
{
  return 2;
}

uint64_t sub_22E08C3EC@<X0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  memset(__b, 0, sizeof(__b));
  __b[0] = a1;
  LOBYTE(__b[1]) = a2 & 1;
  BYTE1(__b[1]) = a3;
  swift_retain();
  swift_retain();
  __b[2] = a4;
  __b[3] = a5;
  swift_retain();
  swift_retain();
  __b[4] = a6;
  __b[5] = a7;
  swift_retain();
  swift_retain();
  __b[6] = a8;
  __b[7] = a10;
  swift_retain();
  swift_retain();
  __b[8] = a11;
  __b[9] = a12;
  swift_retain();
  swift_retain();
  __b[10] = a13;
  __b[11] = a14;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_22E08DAF8();
  uint64_t result = a1;
  *(void *)a9 = a1;
  *(unsigned char *)(a9 + 8) = a2 & 1;
  *(unsigned char *)(a9 + 9) = a3;
  *(void *)(a9 + 16) = a4;
  *(void *)(a9 + 24) = a5;
  *(void *)(a9 + 32) = a6;
  *(void *)(a9 + 40) = a7;
  *(void *)(a9 + 48) = a8;
  *(void *)(a9 + 56) = a10;
  *(void *)(a9 + 64) = a11;
  *(void *)(a9 + 72) = a12;
  *(void *)(a9 + 80) = a13;
  *(void *)(a9 + 88) = a14;
  return result;
}

uint64_t sub_22E08C6C4()
{
  return 2;
}

void *sub_22E08C6E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  memset(__b, 0, 0x40uLL);
  __b[8] = a1;
  LODWORD(__b[0]) = a1;
  BYTE4(__b[0]) = BYTE4(a1) & 1;
  __b[1] = a2;
  LOBYTE(__b[2]) = a3 & 1;
  LOBYTE(__b[5]) = a4 & 1;
  BYTE1(__b[5]) = a7;
  swift_retain();
  swift_retain();
  __b[6] = a8;
  __b[7] = a10;
  swift_retain();
  swift_retain();
  __b[3] = a5;
  __b[4] = a6;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = __b;
  sub_22E08DB54();
  *(_DWORD *)a9 = a1;
  *(unsigned char *)(a9 + 4) = BYTE4(a1) & 1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3 & 1;
  *(void *)(a9 + 24) = a5;
  *(void *)(a9 + 32) = a6;
  *(unsigned char *)(a9 + 40) = a4 & 1;
  *(unsigned char *)(a9 + 41) = a7;
  *(void *)(a9 + 48) = a8;
  *(void *)(a9 + 56) = a10;
  return result;
}

uint64_t sub_22E08C900()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "AirplaneModeConfirmationCount";
  *(void *)(v0 + 8) = 29;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "CellularDataConfirmationCount";
  *(void *)(v0 + 32) = 29;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "";
  *(void *)(v0 + 56) = 0;
  *(unsigned char *)(v0 + 64) = 2;
  *(void *)(v0 + 72) = "SpokenMessagesConfirmationCount";
  *(void *)(v0 + 80) = 31;
  *(unsigned char *)(v0 + 88) = 2;
  *(void *)(v0 + 96) = "WifiConfirmationCount";
  *(void *)(v0 + 104) = 21;
  *(unsigned char *)(v0 + 112) = 2;
  *(void *)(v0 + 120) = "PersonalHotspotConfirmation";
  *(void *)(v0 + 128) = 27;
  *(unsigned char *)(v0 + 136) = 2;
  *(void *)(v0 + 144) = "PersonalHotspotDiscoverabilityConfirmation";
  *(void *)(v0 + 152) = 42;
  *(unsigned char *)(v0 + 160) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_16;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_16;
    case 3:
      unsigned __int8 v4 = 3;
      goto LABEL_16;
    case 4:
      unsigned __int8 v4 = 4;
      goto LABEL_16;
    case 5:
      unsigned __int8 v4 = 5;
      goto LABEL_16;
    case 6:
      unsigned __int8 v4 = 6;
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  return 7;
}

uint64_t sub_22E08CB90()
{
  return sub_22E0F7E80() & 1;
}

uint64_t sub_22E08CBDC()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E08CC1C()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E08CC64()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E08CCAC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E08C900();
  *a1 = result;
  return result;
}

uint64_t sub_22E08CCE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E08BA20();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E08CD18()
{
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE65BBC();
  swift_release();
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08CD94()
{
  return 2;
}

uint64_t sub_22E08CDAC(void (*a1)(void))
{
  swift_retain();
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE65BBC();
  swift_release();
  a1(v2 & 1);
  return swift_release();
}

uint64_t sub_22E08CE40()
{
  return sub_22E08C6C4();
}

uint64_t sub_22E08CE84()
{
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE653CC();
  swift_release();
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08CF00(void *a1)
{
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  if ((*(uint64_t (**)(uint64_t))(v3 + 8))(v4)) {
    return 0;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08CF88(void (*a1)(void))
{
  swift_retain();
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE653CC();
  swift_release();
  a1(v2 & 1);
  return swift_release();
}

uint64_t sub_22E08D01C()
{
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE67B54();
  swift_release();
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08D098(void (*a1)(void))
{
  swift_retain();
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE67B54();
  swift_release();
  a1(v2 & 1);
  return swift_release();
}

uint64_t sub_22E08D12C()
{
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE6776C();
  swift_release();
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08D1A8(void (*a1)(void))
{
  swift_retain();
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE6776C();
  swift_release();
  a1(v2 & 1);
  return swift_release();
}

uint64_t sub_22E08D23C()
{
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE657B0();
  swift_release();
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08D2B8(void (*a1)(void))
{
  swift_retain();
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE657B0();
  swift_release();
  a1(v2 & 1);
  return swift_release();
}

uint64_t sub_22E08D34C()
{
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE65848();
  swift_release();
  if (v2) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08D3C8(void (*a1)(void))
{
  swift_retain();
  sub_22DE641E0();
  swift_retain();
  char v2 = sub_22DE65848();
  swift_release();
  a1(v2 & 1);
  return swift_release();
}

uint64_t sub_22E08D45C(void *a1)
{
  id v1 = a1;
  if (a1)
  {
    id v17 = objc_msgSend(a1, sel_settingMetadata);
    if (v17 && (id v16 = objc_msgSend(v17, sel_targetApp), v17, v16))
    {
      id v15 = objc_msgSend(v16, sel_bundleIdentifier);
      if (v15)
      {
        uint64_t v11 = sub_22E0F7550();
        uint64_t v12 = v2;

        uint64_t v13 = v11;
        uint64_t v14 = v12;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }

      uint64_t v9 = v13;
      uint64_t v10 = v14;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
    if (v10)
    {
      sub_22DE641E0();
      swift_retain();
      char v8 = sub_22DE6E9DC(v9, v10);
      swift_release();
      if (v8) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      swift_bridgeObjectRelease();

      return v7;
    }
  }
  sub_22DE641E0();
  swift_retain();
  char v5 = sub_22DE6FB1C();
  swift_release();
  if (v5) {
    return 1;
  }
  else {
    return 2;
  }
}

uint64_t sub_22E08D744(uint64_t a1, uint64_t a2)
{
  sub_22DE641E0();
  swift_retain();
  swift_retain();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_22DE6F950((uint64_t)sub_22E08EFF8, v5);
  swift_release();
  return swift_release();
}

uint64_t sub_22E08D800(char a1, uint64_t (*a2)(void))
{
  return a2(a1 & 1);
}

uint64_t sub_22E08D82C()
{
  return 3;
}

uint64_t sub_22E08D83C()
{
  return 0;
}

uint64_t sub_22E08D854(void (*a1)(void))
{
  return swift_release();
}

uint64_t sub_22E08D8B8(void *a1)
{
  id v16 = a1;
  id v1 = a1;
  if (a1
    && (id v9 = objc_msgSend(a1, sel_settingMetadata),
        a1,
        v9 && (id v8 = objc_msgSend(v9, sel_targetDevice), v9, v8)))
  {
    id v5 = objc_msgSend(v8, sel_deviceCategory);

    id v6 = v5;
    char v7 = 0;
  }
  else
  {
    id v6 = 0;
    char v7 = 1;
  }
  id v12 = v6;
  char v13 = v7 & 1;
  uint64_t v14 = 5;
  char v15 = 0;
  if (v7 & 1) != 0 || (sub_22DE113DC((uint64_t)&v12, (uint64_t)&v11), (v15))
  {
    char v4 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v4 = sub_22E0F7530();
  }
  if (v4) {
    return 0;
  }
  else {
    return 2;
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E08DAF8()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E08DB54()
{
}

unint64_t sub_22E08DB8C()
{
  uint64_t v2 = qword_2685C36A8;
  if (!qword_2685C36A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C36A8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E08DC0C@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  char v22 = 0;
  uint64_t v21 = 0;
  char v22 = *a1;
  uint64_t v21 = v2;
  uint64_t v5 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  char v19 = v22;
  unint64_t v3 = sub_22DF5FF30();
  MEMORY[0x230F9BAF0](v20, &v19, v5, &type metadata for BinarySettingIdentifier, &unk_26E1DF920, v3);
  uint64_t v6 = v20[0];
  uint64_t v7 = v20[1];
  uint64_t v8 = v20[2];
  uint64_t v9 = v20[3];
  uint64_t v10 = v20[4];
  uint64_t v11 = v20[5];
  uint64_t v12 = v20[6];
  uint64_t v13 = v20[7];
  uint64_t v14 = v20[8];
  uint64_t v15 = v20[9];
  uint64_t v16 = v20[10];
  uint64_t v18 = v20[11];
  swift_bridgeObjectRelease();
  uint64_t result = v8;
  *a2 = v6;
  a2[1] = v7;
  a2[2] = v8;
  a2[3] = v9;
  a2[4] = v10;
  a2[5] = v11;
  a2[6] = v12;
  a2[7] = v13;
  a2[8] = v14;
  a2[9] = v15;
  a2[10] = v16;
  a2[11] = v18;
  return result;
}

uint64_t sub_22E08DD64@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  char v21 = 0;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  char v21 = *a1;
  char v6 = v21;
  uint64_t v20 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C36B0);
  sub_22E0F7E50();
  uint64_t v5 = v3;
  *unint64_t v3 = 7;
  sub_22E08DEFC(v22);
  memcpy(v5 + 8, v22, 0x40uLL);
  sub_22DE04404();
  unint64_t v7 = sub_22DFA9D14();
  uint64_t v19 = sub_22E0F74D0();
  char v17 = v6;
  MEMORY[0x230F9BAF0](v18, &v17, v19, &type metadata for NumericSettingIdentifier, &unk_26E1DF9B8, v7);
  uint64_t v8 = v18[0];
  uint64_t v9 = v18[1];
  uint64_t v10 = v18[2];
  uint64_t v11 = v18[3];
  uint64_t v12 = v18[4];
  uint64_t v13 = v18[5];
  uint64_t v14 = v18[6];
  uint64_t v16 = v18[7];
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v8;
  a2[1] = v9;
  a2[2] = v10;
  a2[3] = v11;
  a2[4] = v12;
  a2[5] = v13;
  a2[6] = v14;
  a2[7] = v16;
  return result;
}

void *sub_22E08DEFC@<X0>(void *a1@<X8>)
{
  sub_22DE641E0();
  swift_retain();
  char v9 = sub_22DE7254C();
  swift_release();
  if (v9)
  {
    int v6 = 0;
    char v7 = 1;
  }
  else
  {
    int v6 = 1120403456;
    char v7 = 0;
  }
  if (v9)
  {
    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = 3;
    char v5 = 0;
  }
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = v9 & 1;
  char v1 = sub_22E08C3E4();
  LODWORD(v10) = v6;
  BYTE4(v10) = v7 & 1;
  sub_22E08C6E4(v10, v4, v5 & 1, 0, (uint64_t)sub_22E08E110, v3, v1, (uint64_t)sub_22E08E11C, (uint64_t)v11, 0);
  return memcpy(a1, v11, 0x40uLL);
}

uint64_t sub_22E08E0B8()
{
  return 0;
}

uint64_t sub_22E08E0E4()
{
  return swift_deallocObject();
}

uint64_t sub_22E08E110()
{
  return sub_22E08E0B8();
}

float sub_22E08E11C()
{
  sub_22DE641E0();
  swift_retain();
  float v1 = sub_22DE6A564();
  swift_release();
  return v1;
}

uint64_t SettingsIntentConfirmationConfigProvider.deinit()
{
  sub_22DE09E50();
  return v1;
}

uint64_t SettingsIntentConfirmationConfigProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for SettingsIntentConfirmationConfigProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_22E08E208()
{
  return swift_release();
}

uint64_t sub_22E08E260(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  swift_retain();
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  swift_retain();
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  swift_retain();
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  swift_retain();
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  uint64_t v13 = *(void *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 88);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v14;
  return result;
}

uint64_t sub_22E08E374(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8) & 1;
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  swift_retain();
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  swift_release();
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  swift_retain();
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  swift_release();
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  swift_retain();
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  swift_release();
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  swift_retain();
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  swift_release();
  uint64_t v12 = *(void *)(a2 + 80);
  uint64_t v13 = *(void *)(a2 + 88);
  swift_retain();
  *(void *)(a1 + 80) = v12;
  *(void *)(a1 + 88) = v13;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy96_8(void *a1, const void *a2)
{
}

uint64_t sub_22E08E4E8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8) & 1;
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  uint64_t v2 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v2;
  swift_release();
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_release();
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_release();
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_release();
  return a1;
}

uint64_t sub_22E08E5C8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 96))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 16))) {
        int v3 = *(void *)(a1 + 16);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_22E08E6E0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 96) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 96) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 16) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for SettingsIntentConfirmationConfigProvider.BinarySettingConfirmationConfig()
{
  return &unk_26E1DF920;
}

uint64_t sub_22E08E91C()
{
  return swift_release();
}

uint64_t sub_22E08E950(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  swift_retain();
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  return result;
}

uint64_t sub_22E08E9F8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  swift_retain();
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40) & 1;
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  swift_retain();
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy64_8(void *a1, const void *a2)
{
}

uint64_t sub_22E08EAEC(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v2 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v2;
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40) & 1;
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v3 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v3;
  swift_release();
  return a1;
}

uint64_t sub_22E08EB84(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 24) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 24);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_22E08ECE0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 64) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 64) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 24) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for SettingsIntentConfirmationConfigProvider.NumericSettingConfirmationConfig()
{
  return &unk_26E1DF9B8;
}

void *type metadata accessor for SettingsIntentConfirmationConfigProvider.ConfirmationCountDefaultsKeys()
{
  return &unk_26E1DFA60;
}

unint64_t sub_22E08EF20()
{
  return sub_22E08EF38();
}

unint64_t sub_22E08EF38()
{
  uint64_t v2 = qword_2685C36B8;
  if (!qword_2685C36B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C36B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E08EFB8()
{
  return swift_deallocObject();
}

uint64_t sub_22E08EFF8(char a1)
{
  return sub_22E08D800(a1 & 1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t *sub_22E08F008()
{
  if (qword_2685BF6D8 != -1) {
    swift_once();
  }
  return &qword_2685D7C68;
}

uint64_t sub_22E08F06C()
{
  type metadata accessor for ButtonProvider();
  uint64_t result = sub_22DE0D464();
  qword_2685D7C68 = result;
  return result;
}

uint64_t type metadata accessor for ButtonProvider()
{
  return self;
}

id sub_22E08F0C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = a1;
  v44._countAndFlagsBits = a2;
  v44._object = a3;
  uint64_t v61 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v58 = 0;
  char v54 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C36C0);
  unint64_t v42 = (*(void *)(*(void *)(v41 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v44._object, v44._countAndFlagsBits, v4, v5);
  int v43 = (id *)((char *)&v15 - v42);
  uint64_t v61 = v6;
  uint64_t v59 = v7;
  uint64_t v60 = v8;
  uint64_t v58 = v3;
  swift_bridgeObjectRetain();
  Swift::String v55 = v44;
  if (v44._object)
  {
    Swift::String v56 = v55;
  }
  else
  {
    v56._countAndFlagsBits = sub_22E0F7610();
    v56._object = v9;
    sub_22DE0D044();
  }
  BinarySettingIdentifier.init(rawValue:)(v56);
  int v39 = v57;
  if (v57 == 64) {
    return 0;
  }
  int v38 = v39;
  char v54 = v39;
  char v53 = v39;
  uint64_t v36 = sub_22DFCD3CC();
  uint64_t v37 = v10;
  if (!v10) {
    return 0;
  }
  uint64_t v34 = v36;
  uint64_t v35 = v37;
  uint64_t v30 = v37;
  uint64_t v31 = v36;
  uint64_t v51 = v36;
  uint64_t v52 = v37;
  uint64_t v32 = *(void *)(v40 + qword_2685D69C0);
  swift_retain();
  uint64_t v33 = type metadata accessor for SettingsBinarySetting();
  swift_bridgeObjectRetain();
  Swift::String v49 = v44;
  if (v44._object)
  {
    Swift::String v50 = v49;
  }
  else
  {
    v50._countAndFlagsBits = sub_22E0F7610();
    v50._object = v11;
    sub_22DE0D044();
  }
  uint64_t v29 = SettingsBinarySetting.__allocating_init(settingId:value:)(v50._countAndFlagsBits, (uint64_t)v50._object, 0);
  swift_bridgeObjectRetain();
  Swift::String v47 = v44;
  if (v44._object)
  {
    Swift::String v48 = v47;
  }
  else
  {
    v48._countAndFlagsBits = sub_22E0F7610();
    v48._object = v12;
    sub_22DE0D044();
  }
  object = v48._object;
  BOOL v26 = sub_22E081390(v48._countAndFlagsBits, (uint64_t)v48._object);
  swift_bridgeObjectRelease();
  sub_22E0AF440(v29, 0, v26);
  swift_release();
  swift_release();
  uint64_t v27 = sub_22E0F7F50();
  uint64_t v28 = v13;
  if (!v13)
  {
    sub_22DE58518(v43);
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v23 = v27;
  uint64_t v24 = v28;
  uint64_t v20 = v28;
  uint64_t v21 = v27;
  uint64_t v45 = v27;
  uint64_t v46 = v28;
  sub_22DE58518(v43);
  id v22 = sub_22E091D58(v21, v20, v31, v30);
  if (v22)
  {
    id v19 = v22;
    id v18 = v22;
  }
  else
  {
    id v18 = 0;
  }
  id v16 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

id sub_22E08F5D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v391 = a1;
  v400._uint64_t countAndFlagsBits = a2;
  v400._object = a3;
  uint64_t v350 = 0;
  v351 = sub_22E092650;
  v352 = sub_22DE09AD8;
  v353 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v354 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v355 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  v356 = sub_22E09275C;
  v357 = sub_22DE09AD8;
  v358 = sub_22DEF32C8;
  v359 = sub_22DE09AD8;
  v360 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v361 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v362 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  v363 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v364 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v365 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  v366 = sub_22E092320;
  v367 = sub_22DE09AD8;
  v368 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v369 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v370 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  v371 = sub_22E09242C;
  v372 = sub_22DE09AD8;
  v373 = sub_22DEF32C8;
  v374 = sub_22DE09AD8;
  v375 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v376 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v377 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  v378 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v379 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v380 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  v381 = sub_22DEF32C8;
  v382 = sub_22DE09AD8;
  v383 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v384 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  v385 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  uint64_t v472 = 0;
  uint64_t v470 = 0;
  uint64_t v471 = 0;
  uint64_t v469 = 0;
  uint64_t v386 = 0;
  char v453 = 0;
  uint64_t v449 = 0;
  uint64_t v450 = 0;
  uint64_t v441 = 0;
  uint64_t v442 = 0;
  uint64_t v439 = 0;
  uint64_t v440 = 0;
  char v433 = 0;
  uint64_t v427 = 0;
  uint64_t v428 = 0;
  uint64_t v418 = 0;
  uint64_t v419 = 0;
  uint64_t v416 = 0;
  uint64_t v417 = 0;
  char v410 = 0;
  uint64_t v407 = 0;
  uint64_t v408 = 0;
  uint64_t v401 = 0;
  uint64_t v402 = 0;
  uint64_t v4 = sub_22E0F7100();
  unint64_t v387 = (*(void *)(*(void *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4, v5, v6, v7);
  uint64_t v388 = (uint64_t)v131 - v387;
  unint64_t v389 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v131 - v387, v9, v10, v11);
  uint64_t v390 = (uint64_t)v131 - v389;
  uint64_t v392 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C36C0);
  uint64_t v396 = *(void *)(*(void *)(v392 - 8) + 64);
  unint64_t v393 = (v396 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v400._object, v400._countAndFlagsBits, v12, v13);
  v394 = (id *)((char *)v131 - v393);
  unint64_t v395 = (v396 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = MEMORY[0x270FA5388](v14, v15, (char *)v131 - v393, v16);
  v397 = (id *)((char *)v131 - v395);
  unint64_t v398 = (v396 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x270FA5388](v17, v18, (char *)v131 - v395, v19);
  v399 = (id *)((char *)v131 - v398);
  uint64_t v472 = v21;
  uint64_t v470 = v22;
  uint64_t v471 = v20;
  uint64_t v469 = v3;
  swift_bridgeObjectRetain();
  Swift::String v466 = v400;
  if (v400._object)
  {
    Swift::String v467 = v466;
  }
  else
  {
    v467._uint64_t countAndFlagsBits = sub_22E0F7610();
    v467._object = v23;
    sub_22DE0D044();
  }
  BinarySettingIdentifier.init(rawValue:)(v467);
  int v349 = v468;
  if (v468 != 64)
  {
    int v348 = v349;
    char v410 = v349;
    char v409 = v349;
    uint64_t v346 = sub_22DFCD3CC();
    uint64_t v347 = v24;
    if (v24)
    {
      uint64_t v344 = v346;
      uint64_t v345 = v347;
      uint64_t v340 = v347;
      uint64_t v341 = v346;
      uint64_t v407 = v346;
      uint64_t v408 = v347;
      swift_retain();
      uint64_t v342 = *(void *)(v391 + qword_2685D7B80);
      swift_retain();
      swift_release();
      uint64_t v343 = type metadata accessor for SettingsBinarySetting();
      swift_bridgeObjectRetain();
      Swift::String v405 = v400;
      if (v400._object)
      {
        Swift::String v406 = v405;
      }
      else
      {
        v406._uint64_t countAndFlagsBits = sub_22E0F7610();
        v406._object = v25;
        sub_22DE0D044();
      }
      uint64_t v339 = SettingsBinarySetting.__allocating_init(settingId:value:)(v406._countAndFlagsBits, (uint64_t)v406._object, 0);
      swift_bridgeObjectRetain();
      Swift::String v403 = v400;
      if (v400._object)
      {
        Swift::String v404 = v403;
      }
      else
      {
        v404._uint64_t countAndFlagsBits = sub_22E0F7610();
        v404._object = v26;
        sub_22DE0D044();
      }
      object = v404._object;
      BOOL v336 = sub_22E081390(v404._countAndFlagsBits, (uint64_t)v404._object);
      swift_bridgeObjectRelease();
      sub_22E0AF440(v339, 0, v336);
      swift_release();
      swift_release();
      uint64_t v337 = sub_22E0F7F50();
      uint64_t v338 = v27;
      sub_22DE58518(v399);
      if (v338)
      {
        uint64_t v333 = v337;
        uint64_t v334 = v338;
        uint64_t v331 = v338;
        uint64_t v401 = v337;
        uint64_t v402 = v338;
        id v332 = sub_22E091D58(v337, v338, v341, v340);
        if (v332)
        {
          id v330 = v332;
          id v329 = v332;
        }
        else
        {
          id v329 = 0;
        }
        id v327 = v329;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v327;
      }
      swift_bridgeObjectRelease();
    }
    return (id)v350;
  }
  swift_bridgeObjectRetain();
  Swift::String v463 = v400;
  if (v400._object)
  {
    Swift::String v464 = v463;
  }
  else
  {
    v464._uint64_t countAndFlagsBits = sub_22E0F7610();
    v464._object = v28;
    sub_22DE0D044();
  }
  NumericSettingIdentifier.init(rawValue:)(v464);
  int v326 = v465;
  if (v465 == 12)
  {
    swift_bridgeObjectRetain();
    Swift::String v461 = v400;
    if (v400._object)
    {
      Swift::String v462 = v461;
    }
    else
    {
      v462._uint64_t countAndFlagsBits = sub_22E0F7610();
      v462._object = v72;
      sub_22DE0D044();
    }
    int v239 = sub_22E021E18();
    if (v239 == 5)
    {
      int v155 = sub_22E0F7990();
      os_log_t v154 = (os_log_t)*sub_22DF13B88();
      uint64_t v115 = v154;
      swift_bridgeObjectRetain();
      uint64_t v144 = 32;
      uint64_t v145 = 7;
      uint64_t v116 = swift_allocObject();
      uint64_t v117 = v400._object;
      uint64_t v146 = v116;
      *(void *)(v116 + 16) = v400._countAndFlagsBits;
      *(void *)(v116 + 24) = v117;
      uint64_t v141 = &v459;
      uint64_t v459 = 12;
      unint64_t v139 = sub_22DE0862C();
      unint64_t v140 = sub_22DE086A8();
      sub_22DE08724();
      sub_22E0F76B0();
      uint32_t v142 = v460;
      uint64_t v143 = 17;
      uint64_t v148 = swift_allocObject();
      *(unsigned char *)(v148 + 16) = 32;
      uint64_t v149 = swift_allocObject();
      *(unsigned char *)(v149 + 16) = 8;
      uint64_t v118 = swift_allocObject();
      uint64_t v119 = v146;
      uint64_t v147 = v118;
      *(void *)(v118 + 16) = v381;
      *(void *)(v118 + 24) = v119;
      uint64_t v120 = swift_allocObject();
      uint64_t v121 = v147;
      uint64_t v151 = v120;
      *(void *)(v120 + 16) = v382;
      *(void *)(v120 + 24) = v121;
      uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
      uint64_t v150 = sub_22E0F7E50();
      uint64_t v152 = v122;
      swift_retain();
      uint64_t v123 = v148;
      uint64_t v124 = v152;
      *uint64_t v152 = v383;
      v124[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v123;
      swift_retain();
      uint64_t v125 = v149;
      uint64_t v126 = v152;
      v152[2] = v384;
      v126[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v125;
      swift_retain();
      uint64_t v127 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v151;
      uint64_t v128 = v152;
      v152[4] = v385;
      v128[5] = v127;
      sub_22DE04404();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v154, (os_log_type_t)v155))
      {
        uint64_t v129 = v386;
        uint64_t v132 = (uint8_t *)sub_22E0F7AB0();
        v131[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
        uint64_t v133 = sub_22DE087A0(0);
        uint64_t v134 = sub_22DE087A0(1);
        uint64_t v135 = &v458;
        v458 = v132;
        uint64_t v136 = &v457;
        uint64_t v457 = v133;
        uint64_t v137 = &v456;
        uint64_t v456 = v134;
        sub_22DE087FC(2, &v458);
        sub_22DE087FC(1, v135);
        v454 = v383;
        uint64_t v455 = v148;
        sub_22DE08810(&v454, (uint64_t)v135, (uint64_t)v136, (uint64_t)v137);
        uint64_t v138 = v129;
        if (v129)
        {
          __break(1u);
        }
        else
        {
          v454 = v384;
          uint64_t v455 = v149;
          sub_22DE08810(&v454, (uint64_t)&v458, (uint64_t)&v457, (uint64_t)&v456);
          v131[0] = 0;
          v454 = v385;
          uint64_t v455 = v151;
          sub_22DE08810(&v454, (uint64_t)&v458, (uint64_t)&v457, (uint64_t)&v456);
          _os_log_impl(&dword_22DE00000, v154, (os_log_type_t)v155, "Identifier is neither binary nor numeric: %s", v132, v142);
          sub_22DE0885C(v133);
          sub_22DE0885C(v134);
          sub_22E0F7A90();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      return (id)v350;
    }
    else
    {
      int v238 = v239;
      int v219 = v239;
      char v453 = v239;
      int v237 = sub_22E0F7990();
      os_log_t v236 = (os_log_t)*sub_22DF13B88();
      uint64_t v73 = v236;
      uint64_t v225 = 17;
      uint64_t v227 = 7;
      uint64_t v228 = swift_allocObject();
      *(unsigned char *)(v228 + 16) = v219;
      uint64_t v222 = &v451;
      uint64_t v451 = 12;
      unint64_t v220 = sub_22DE0862C();
      unint64_t v221 = sub_22DE086A8();
      unint64_t v223 = sub_22DE08724();
      sub_22E0F76B0();
      uint32_t v224 = v452;
      uint64_t v230 = swift_allocObject();
      *(unsigned char *)(v230 + 16) = 32;
      uint64_t v231 = swift_allocObject();
      *(unsigned char *)(v231 + 16) = 8;
      uint64_t v226 = 32;
      uint64_t v74 = swift_allocObject();
      uint64_t v75 = v228;
      uint64_t v229 = v74;
      *(void *)(v74 + 16) = v366;
      *(void *)(v74 + 24) = v75;
      uint64_t v76 = swift_allocObject();
      uint64_t v77 = v229;
      uint64_t v233 = v76;
      *(void *)(v76 + 16) = v367;
      *(void *)(v76 + 24) = v77;
      uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
      uint64_t v232 = sub_22E0F7E50();
      uint64_t v234 = v78;
      swift_retain();
      uint64_t v79 = v230;
      uint64_t v80 = v234;
      *uint64_t v234 = v368;
      v80[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v79;
      swift_retain();
      uint64_t v81 = v231;
      uint64_t v82 = v234;
      v234[2] = v369;
      v82[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
      swift_retain();
      uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v233;
      uint64_t v84 = v234;
      v234[4] = v370;
      v84[5] = v83;
      sub_22DE04404();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v236, (os_log_type_t)v237))
      {
        uint64_t v85 = v386;
        uint64_t v212 = (uint8_t *)sub_22E0F7AB0();
        uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
        uint64_t v213 = sub_22DE087A0(0);
        uint64_t v214 = sub_22DE087A0(1);
        uint64_t v215 = &v438;
        v438 = v212;
        uint64_t v216 = &v437;
        uint64_t v437 = v213;
        uint64_t v217 = &v436;
        uint64_t v436 = v214;
        sub_22DE087FC(2, &v438);
        sub_22DE087FC(1, v215);
        v434 = v368;
        uint64_t v435 = v230;
        sub_22DE08810(&v434, (uint64_t)v215, (uint64_t)v216, (uint64_t)v217);
        uint64_t v218 = v85;
        if (v85)
        {
          __break(1u);
        }
        else
        {
          v434 = v369;
          uint64_t v435 = v231;
          sub_22DE08810(&v434, (uint64_t)&v438, (uint64_t)&v437, (uint64_t)&v436);
          uint64_t v209 = 0;
          v434 = v370;
          uint64_t v435 = v233;
          sub_22DE08810(&v434, (uint64_t)&v438, (uint64_t)&v437, (uint64_t)&v436);
          uint64_t v208 = 0;
          _os_log_impl(&dword_22DE00000, v236, (os_log_type_t)v237, "Providing button for identifier: %s", v212, v224);
          sub_22DE0885C(v213);
          sub_22DE0885C(v214);
          sub_22E0F7A90();
          swift_release();
          swift_release();
          swift_release();
          uint64_t v210 = v208;
        }
      }
      else
      {
        uint64_t v86 = v386;
        swift_release();
        swift_release();
        swift_release();
        uint64_t v210 = v86;
      }
      uint64_t v200 = v210;

      uint64_t v203 = *(void *)(v391 + qword_2685D7B80);
      swift_retain();
      uint64_t v201 = 0;
      type metadata accessor for SettingsBinarySetting();
      sub_22E021A20();
      sub_22E0F70E0();
      sub_22E021A20();
      sub_22E0F70E0();
      char v87 = sub_22DE1085C();
      uint64_t v202 = sub_22E0D1D78(v390, v87 & 1, v388);
      sub_22E0AF440(v202, v201, 0);
      swift_release();
      swift_release();
      uint64_t v204 = sub_22E0F7F50();
      uint64_t v205 = v88;
      uint64_t v449 = v204;
      uint64_t v450 = v88;
      sub_22DE58518(v394);
      uint64_t v206 = sub_22E0218BC();
      uint64_t v207 = v89;
      if (v89)
      {
        uint64_t v198 = v206;
        uint64_t v199 = v207;
        uint64_t v196 = v207;
        uint64_t v197 = v206;
        uint64_t v441 = v206;
        uint64_t v442 = v207;
        swift_bridgeObjectRetain();
        if (v205)
        {
          uint64_t v194 = v204;
          uint64_t v195 = v205;
          uint64_t v192 = v205;
          uint64_t v439 = v204;
          uint64_t v440 = v205;
          id v193 = sub_22E091D58(v204, v205, v197, v196);
          if (v193)
          {
            id v191 = v193;
            id v190 = v193;
          }
          else
          {
            id v190 = 0;
          }
          id v189 = v190;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v189;
        }
        swift_bridgeObjectRelease();
      }
      int v188 = sub_22E0F7990();
      os_log_t v187 = (os_log_t)*sub_22DF13B88();
      uint64_t v90 = v187;
      uint64_t v173 = 17;
      uint64_t v176 = 7;
      uint64_t v170 = swift_allocObject();
      *(unsigned char *)(v170 + 16) = v219;
      swift_bridgeObjectRetain();
      uint64_t v175 = 32;
      uint64_t v91 = swift_allocObject();
      uint64_t v92 = v205;
      uint64_t v177 = v91;
      *(void *)(v91 + 16) = v204;
      *(void *)(v91 + 24) = v92;
      v447[1] = (unsigned char *)22;
      sub_22E0F76B0();
      uint32_t v169 = v448;
      uint64_t v179 = swift_allocObject();
      int v172 = 32;
      *(unsigned char *)(v179 + 16) = 32;
      uint64_t v180 = swift_allocObject();
      int v174 = 8;
      *(unsigned char *)(v180 + 16) = 8;
      uint64_t v93 = swift_allocObject();
      uint64_t v94 = v170;
      uint64_t v171 = v93;
      *(void *)(v93 + 16) = v371;
      *(void *)(v93 + 24) = v94;
      uint64_t v95 = swift_allocObject();
      uint64_t v96 = v171;
      uint64_t v181 = v95;
      *(void *)(v95 + 16) = v372;
      *(void *)(v95 + 24) = v96;
      uint64_t v182 = swift_allocObject();
      *(unsigned char *)(v182 + 16) = v172;
      uint64_t v183 = swift_allocObject();
      *(unsigned char *)(v183 + 16) = v174;
      uint64_t v97 = swift_allocObject();
      uint64_t v98 = v177;
      uint64_t v178 = v97;
      *(void *)(v97 + 16) = v373;
      *(void *)(v97 + 24) = v98;
      uint64_t v99 = swift_allocObject();
      uint64_t v100 = v178;
      uint64_t v185 = v99;
      *(void *)(v99 + 16) = v374;
      *(void *)(v99 + 24) = v100;
      uint64_t v184 = sub_22E0F7E50();
      unint64_t v186 = v101;
      swift_retain();
      uint64_t v102 = v179;
      uint64_t v103 = v186;
      *unint64_t v186 = v375;
      v103[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v102;
      swift_retain();
      uint64_t v104 = v180;
      uint64_t v105 = v186;
      v186[2] = v376;
      v105[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v104;
      swift_retain();
      uint64_t v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v181;
      uint64_t v107 = v186;
      v186[4] = v377;
      v107[5] = v106;
      swift_retain();
      uint64_t v108 = v182;
      uint64_t v109 = v186;
      v186[6] = v378;
      v109[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v108;
      swift_retain();
      uint64_t v110 = v183;
      uint64_t v111 = v186;
      v186[8] = v379;
      v111[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v110;
      swift_retain();
      uint64_t v112 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v185;
      uint64_t v113 = v186;
      v186[10] = v380;
      v113[11] = v112;
      sub_22DE04404();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v187, (os_log_type_t)v188))
      {
        uint64_t v114 = v200;
        int v161 = (uint8_t *)sub_22E0F7AB0();
        uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
        uint64_t v162 = sub_22DE087A0(0);
        uint64_t v163 = sub_22DE087A0(2);
        uint64_t v165 = v447;
        v447[0] = v161;
        unint64_t v166 = &v446;
        uint64_t v446 = v162;
        int v167 = &v445;
        uint64_t v445 = v163;
        unsigned int v164 = 2;
        sub_22DE087FC(2, v447);
        sub_22DE087FC(v164, v165);
        v443 = v375;
        uint64_t v444 = v179;
        sub_22DE08810(&v443, (uint64_t)v165, (uint64_t)v166, (uint64_t)v167);
        uint64_t v168 = v114;
        if (v114)
        {
          __break(1u);
        }
        else
        {
          v443 = v376;
          uint64_t v444 = v180;
          sub_22DE08810(&v443, (uint64_t)v447, (uint64_t)&v446, (uint64_t)&v445);
          uint64_t v159 = 0;
          v443 = v377;
          uint64_t v444 = v181;
          sub_22DE08810(&v443, (uint64_t)v447, (uint64_t)&v446, (uint64_t)&v445);
          uint64_t v158 = 0;
          v443 = v378;
          uint64_t v444 = v182;
          sub_22DE08810(&v443, (uint64_t)v447, (uint64_t)&v446, (uint64_t)&v445);
          uint64_t v157 = 0;
          v443 = v379;
          uint64_t v444 = v183;
          sub_22DE08810(&v443, (uint64_t)v447, (uint64_t)&v446, (uint64_t)&v445);
          uint64_t v156 = 0;
          v443 = v380;
          uint64_t v444 = v185;
          sub_22DE08810(&v443, (uint64_t)v447, (uint64_t)&v446, (uint64_t)&v445);
          _os_log_impl(&dword_22DE00000, v187, (os_log_type_t)v188, "Failed. Punchout: %s, Text: %s", v161, v169);
          sub_22DE0885C(v162);
          sub_22DE0885C(v163);
          sub_22E0F7A90();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      swift_bridgeObjectRelease();
      return (id)v350;
    }
  }
  else
  {
    int v325 = v326;
    int v306 = v326;
    char v433 = v326;
    int v324 = sub_22E0F7990();
    os_log_t v323 = (os_log_t)*sub_22DF13B88();
    uint64_t v29 = v323;
    uint64_t v312 = 17;
    uint64_t v314 = 7;
    uint64_t v315 = swift_allocObject();
    *(unsigned char *)(v315 + 16) = v306;
    v309 = &v431;
    uint64_t v431 = 12;
    unint64_t v307 = sub_22DE0862C();
    unint64_t v308 = sub_22DE086A8();
    unint64_t v310 = sub_22DE08724();
    sub_22E0F76B0();
    uint32_t v311 = v432;
    uint64_t v317 = swift_allocObject();
    *(unsigned char *)(v317 + 16) = 32;
    uint64_t v318 = swift_allocObject();
    *(unsigned char *)(v318 + 16) = 8;
    uint64_t v313 = 32;
    uint64_t v30 = swift_allocObject();
    uint64_t v31 = v315;
    uint64_t v316 = v30;
    *(void *)(v30 + 16) = v351;
    *(void *)(v30 + 24) = v31;
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v316;
    uint64_t v320 = v32;
    *(void *)(v32 + 16) = v352;
    *(void *)(v32 + 24) = v33;
    uint64_t v322 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
    uint64_t v319 = sub_22E0F7E50();
    v321 = v34;
    swift_retain();
    uint64_t v35 = v317;
    uint64_t v36 = v321;
    *v321 = v353;
    v36[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v35;
    swift_retain();
    uint64_t v37 = v318;
    int v38 = v321;
    v321[2] = v354;
    v38[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v37;
    swift_retain();
    int v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v320;
    uint64_t v40 = v321;
    v321[4] = v355;
    v40[5] = v39;
    sub_22DE04404();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v323, (os_log_type_t)v324))
    {
      uint64_t v41 = v386;
      uint64_t v299 = (uint8_t *)sub_22E0F7AB0();
      uint64_t v298 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
      uint64_t v300 = sub_22DE087A0(0);
      uint64_t v301 = sub_22DE087A0(1);
      char v302 = &v415;
      v415 = v299;
      uint64_t v303 = &v414;
      uint64_t v414 = v300;
      char v304 = &v413;
      uint64_t v413 = v301;
      sub_22DE087FC(2, &v415);
      sub_22DE087FC(1, v302);
      v411 = v353;
      uint64_t v412 = v317;
      sub_22DE08810(&v411, (uint64_t)v302, (uint64_t)v303, (uint64_t)v304);
      uint64_t v305 = v41;
      if (v41)
      {
        __break(1u);
      }
      else
      {
        v411 = v354;
        uint64_t v412 = v318;
        sub_22DE08810(&v411, (uint64_t)&v415, (uint64_t)&v414, (uint64_t)&v413);
        uint64_t v296 = 0;
        v411 = v355;
        uint64_t v412 = v320;
        sub_22DE08810(&v411, (uint64_t)&v415, (uint64_t)&v414, (uint64_t)&v413);
        uint64_t v295 = 0;
        _os_log_impl(&dword_22DE00000, v323, (os_log_type_t)v324, "Providing button for identifier: %s", v299, v311);
        sub_22DE0885C(v300);
        sub_22DE0885C(v301);
        sub_22E0F7A90();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v297 = v295;
      }
    }
    else
    {
      uint64_t v42 = v386;
      swift_release();
      swift_release();
      swift_release();
      uint64_t v297 = v42;
    }
    uint64_t v292 = v297;

    uint64_t v293 = *(void *)(v391 + qword_2685D7B80);
    swift_retain();
    uint64_t v294 = type metadata accessor for SettingsNumericSetting();
    swift_bridgeObjectRetain();
    Swift::String v429 = v400;
    if (v400._object)
    {
      Swift::String v430 = v429;
    }
    else
    {
      v430._uint64_t countAndFlagsBits = sub_22E0F7610();
      v430._object = v43;
      sub_22DE0D044();
    }
    unint64_t v285 = v430._object;
    uint64_t countAndFlagsBits = v430._countAndFlagsBits;
    uint64_t v284 = 0;
    sub_22DE63C04();
    Swift::String v44 = (void *)sub_22E0F7A20();
    uint64_t v287 = SettingsNumericSetting.__allocating_init(settingId:value:)(countAndFlagsBits, (uint64_t)v285, v44);
    sub_22E0AEBB8(v287, 0);
    swift_release();
    swift_release();
    uint64_t v288 = sub_22E0F7F50();
    uint64_t v289 = v45;
    uint64_t v427 = v288;
    uint64_t v428 = v45;
    sub_22DE58518(v397);
    char v426 = v306;
    uint64_t v290 = sub_22E00B5B0();
    uint64_t v291 = v46;
    if (v46)
    {
      uint64_t v282 = v290;
      uint64_t v283 = v291;
      uint64_t v280 = v291;
      uint64_t v281 = v290;
      uint64_t v418 = v290;
      uint64_t v419 = v291;
      swift_bridgeObjectRetain();
      if (v289)
      {
        uint64_t v278 = v288;
        uint64_t v279 = v289;
        uint64_t v276 = v289;
        uint64_t v416 = v288;
        uint64_t v417 = v289;
        id v277 = sub_22E091D58(v288, v289, v281, v280);
        if (v277)
        {
          id v275 = v277;
          id v274 = v277;
        }
        else
        {
          id v274 = 0;
        }
        id v273 = v274;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v273;
      }
      swift_bridgeObjectRelease();
    }
    int v272 = sub_22E0F7990();
    os_log_t v271 = (os_log_t)*sub_22DF13B88();
    Swift::String v47 = v271;
    uint64_t v257 = 17;
    uint64_t v260 = 7;
    uint64_t v254 = swift_allocObject();
    *(unsigned char *)(v254 + 16) = v306;
    swift_bridgeObjectRetain();
    uint64_t v259 = 32;
    uint64_t v48 = swift_allocObject();
    uint64_t v49 = v289;
    uint64_t v261 = v48;
    *(void *)(v48 + 16) = v288;
    *(void *)(v48 + 24) = v49;
    v424[1] = (unsigned char *)22;
    sub_22E0F76B0();
    uint32_t v253 = v425;
    uint64_t v263 = swift_allocObject();
    int v256 = 32;
    *(unsigned char *)(v263 + 16) = 32;
    uint64_t v264 = swift_allocObject();
    int v258 = 8;
    *(unsigned char *)(v264 + 16) = 8;
    uint64_t v50 = swift_allocObject();
    uint64_t v51 = v254;
    uint64_t v255 = v50;
    *(void *)(v50 + 16) = v356;
    *(void *)(v50 + 24) = v51;
    uint64_t v52 = swift_allocObject();
    uint64_t v53 = v255;
    uint64_t v265 = v52;
    *(void *)(v52 + 16) = v357;
    *(void *)(v52 + 24) = v53;
    uint64_t v266 = swift_allocObject();
    *(unsigned char *)(v266 + 16) = v256;
    uint64_t v267 = swift_allocObject();
    *(unsigned char *)(v267 + 16) = v258;
    uint64_t v54 = swift_allocObject();
    uint64_t v55 = v261;
    uint64_t v262 = v54;
    *(void *)(v54 + 16) = v358;
    *(void *)(v54 + 24) = v55;
    uint64_t v56 = swift_allocObject();
    uint64_t v57 = v262;
    uint64_t v269 = v56;
    *(void *)(v56 + 16) = v359;
    *(void *)(v56 + 24) = v57;
    uint64_t v268 = sub_22E0F7E50();
    unint64_t v270 = v58;
    swift_retain();
    uint64_t v59 = v263;
    uint64_t v60 = v270;
    *unint64_t v270 = v360;
    v60[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v59;
    swift_retain();
    uint64_t v61 = v264;
    uint64_t v62 = v270;
    v270[2] = v361;
    v62[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v61;
    swift_retain();
    uint64_t v63 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v265;
    uint64_t v64 = v270;
    v270[4] = v362;
    v64[5] = v63;
    swift_retain();
    uint64_t v65 = v266;
    uint64_t v66 = v270;
    v270[6] = v363;
    v66[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v65;
    swift_retain();
    uint64_t v67 = v267;
    uint64_t v68 = v270;
    v270[8] = v364;
    v68[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v67;
    swift_retain();
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v269;
    uint64_t v70 = v270;
    v270[10] = v365;
    v70[11] = v69;
    sub_22DE04404();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v271, (os_log_type_t)v272))
    {
      uint64_t v71 = v292;
      v245 = (uint8_t *)sub_22E0F7AB0();
      uint64_t v244 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
      uint64_t v246 = sub_22DE087A0(0);
      uint64_t v247 = sub_22DE087A0(2);
      uint64_t v249 = v424;
      v424[0] = v245;
      uint64_t v250 = &v423;
      uint64_t v423 = v246;
      unint64_t v251 = &v422;
      uint64_t v422 = v247;
      unsigned int v248 = 2;
      sub_22DE087FC(2, v424);
      sub_22DE087FC(v248, v249);
      v420 = v360;
      uint64_t v421 = v263;
      sub_22DE08810(&v420, (uint64_t)v249, (uint64_t)v250, (uint64_t)v251);
      uint64_t v252 = v71;
      if (v71)
      {
        __break(1u);
      }
      else
      {
        v420 = v361;
        uint64_t v421 = v264;
        sub_22DE08810(&v420, (uint64_t)v424, (uint64_t)&v423, (uint64_t)&v422);
        uint64_t v243 = 0;
        v420 = v362;
        uint64_t v421 = v265;
        sub_22DE08810(&v420, (uint64_t)v424, (uint64_t)&v423, (uint64_t)&v422);
        uint64_t v242 = 0;
        v420 = v363;
        uint64_t v421 = v266;
        sub_22DE08810(&v420, (uint64_t)v424, (uint64_t)&v423, (uint64_t)&v422);
        uint64_t v241 = 0;
        v420 = v364;
        uint64_t v421 = v267;
        sub_22DE08810(&v420, (uint64_t)v424, (uint64_t)&v423, (uint64_t)&v422);
        uint64_t v240 = 0;
        v420 = v365;
        uint64_t v421 = v269;
        sub_22DE08810(&v420, (uint64_t)v424, (uint64_t)&v423, (uint64_t)&v422);
        _os_log_impl(&dword_22DE00000, v271, (os_log_type_t)v272, "Failed. Punchout: %s, Text: %s", v245, v253);
        sub_22DE0885C(v246);
        sub_22DE0885C(v247);
        sub_22E0F7A90();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    swift_bridgeObjectRelease();
    return (id)v350;
  }
}

uint64_t sub_22E091C50()
{
  return sub_22E0F7590();
}

uint64_t sub_22E091C84()
{
  return sub_22E0F7590();
}

uint64_t sub_22E091CDC()
{
  return sub_22E0F7590();
}

uint64_t sub_22E091D10()
{
  return sub_22E0F7590();
}

id sub_22E091D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v26 = a3;
  uint64_t v25 = a4;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v35 = 0;
  id v34 = 0;
  id v33 = 0;
  unint64_t v20 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v29 = (char *)&v12 - v20;
  uint64_t v38 = MEMORY[0x270FA5388](v21, v22, v26, v25);
  uint64_t v39 = v5;
  uint64_t v36 = v6;
  uint64_t v37 = v7;
  uint64_t v35 = v4;
  uint64_t v28 = 0;
  sub_22E092954();
  id v23 = sub_22DE234EC();
  id v34 = v23;
  swift_bridgeObjectRetain();
  id v24 = (id)sub_22E0F7540();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setText_, v24);

  sub_22DF5B1C0();
  id v27 = sub_22DE234EC();
  id v33 = v27;
  sub_22E0F5900();
  uint64_t v30 = sub_22E0F5910();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = v30 - 8;
  if ((*(unsigned int (**)(char *, uint64_t))(v31 + 48))(v29, 1) == 1)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v18 = sub_22E0F58E0();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v30);
    uint64_t v19 = v18;
  }
  objc_msgSend(v27, sel_setPunchOutUri_, v19);

  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3750);
  uint64_t v14 = sub_22E0F7E50();
  uint64_t v13 = v8;
  id v9 = v27;
  uint64_t v10 = v14;
  *uint64_t v13 = v27;
  sub_22DE04404();
  uint64_t v16 = v10;
  id v17 = (id)sub_22E0F7700();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setCommands_, v17);

  return v23;
}

BOOL sub_22E092014(unsigned char *a1)
{
  if (*a1 == 64)
  {
    uint64_t v3 = 0;
  }
  else
  {
    sub_22DFCD3CC();
    uint64_t v3 = v1;
  }
  sub_22DE0D044();
  return v3 != 0;
}

BOOL sub_22E0920F8(unsigned char *a1)
{
  if (*a1 == 12)
  {
    uint64_t v3 = 0;
  }
  else
  {
    sub_22E00B5B0();
    uint64_t v3 = v1;
  }
  sub_22DE0D044();
  return v3 != 0;
}

uint64_t sub_22E0921DC()
{
  return swift_deallocObject();
}

uint64_t sub_22E09221C()
{
  return swift_deallocObject();
}

uint64_t sub_22E092248()
{
  return swift_deallocObject();
}

uint64_t sub_22E092274()
{
  return swift_deallocObject();
}

uint64_t sub_22E0922B4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0922F4()
{
  return swift_deallocObject();
}

uint64_t sub_22E092320()
{
  return sub_22E091CDC();
}

uint64_t sub_22E092328()
{
  return swift_deallocObject();
}

uint64_t sub_22E092354()
{
  return swift_deallocObject();
}

uint64_t sub_22E092380()
{
  return swift_deallocObject();
}

uint64_t sub_22E0923C0()
{
  return swift_deallocObject();
}

uint64_t sub_22E092400()
{
  return swift_deallocObject();
}

uint64_t sub_22E09242C()
{
  return sub_22E091D10();
}

uint64_t sub_22E092434()
{
  return swift_deallocObject();
}

uint64_t sub_22E092474()
{
  return swift_deallocObject();
}

uint64_t sub_22E0924A0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0924CC()
{
  return swift_deallocObject();
}

uint64_t sub_22E09250C()
{
  return swift_deallocObject();
}

uint64_t sub_22E09254C()
{
  return swift_deallocObject();
}

uint64_t sub_22E092578()
{
  return swift_deallocObject();
}

uint64_t sub_22E0925A4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0925E4()
{
  return swift_deallocObject();
}

uint64_t sub_22E092624()
{
  return swift_deallocObject();
}

uint64_t sub_22E092650()
{
  return sub_22E091C50();
}

uint64_t sub_22E092658()
{
  return swift_deallocObject();
}

uint64_t sub_22E092684()
{
  return swift_deallocObject();
}

uint64_t sub_22E0926B0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0926F0()
{
  return swift_deallocObject();
}

uint64_t sub_22E092730()
{
  return swift_deallocObject();
}

uint64_t sub_22E09275C()
{
  return sub_22E091C84();
}

uint64_t sub_22E092764()
{
  return swift_deallocObject();
}

uint64_t sub_22E0927A4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0927D0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0927FC()
{
  return swift_deallocObject();
}

uint64_t sub_22E09283C()
{
  return swift_deallocObject();
}

uint64_t sub_22E09287C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0928A8()
{
  return swift_deallocObject();
}

uint64_t sub_22E0928D4()
{
  return swift_deallocObject();
}

uint64_t sub_22E092914()
{
  return swift_deallocObject();
}

unint64_t sub_22E092954()
{
  uint64_t v2 = qword_2685C36E0;
  if (!qword_2685C36E0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2685C36E0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_22E0929BC()
{
  type metadata accessor for SetEnvironmentHandler();
  uint64_t v2 = sub_22DE0F78C();
  char v0 = sub_22DE1085C();
  uint64_t result = sub_22DE0F7BC(v2, v0 & 1);
  qword_2685D7C70 = result;
  return result;
}

uint64_t type metadata accessor for SetEnvironmentHandler()
{
  return self;
}

uint64_t *sub_22E092A38()
{
  if (qword_2685BF6E0 != -1) {
    swift_once();
  }
  return &qword_2685D7C70;
}

uint64_t sub_22E092A9C(uint64_t a1, void (*a2)(id))
{
  swift_retain();
  sub_22DFE69F0();
  id v4 = sub_22DFC98B8();
  swift_bridgeObjectRelease();
  a2(v4);

  return swift_release();
}

BOOL sub_22E092B4C(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  uint64_t v23 = sub_22E0F59E0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = v23 - 8;
  unint64_t v26 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v2, v3, v4);
  id v27 = (char *)&v15 - v26;
  unint64_t v29 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685C03D0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28, v5, v6, v7);
  uint64_t v30 = (char *)&v15 - v29;
  unint64_t v31 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v12 = MEMORY[0x270FA5388](v9, (char *)&v15 - v29, v10, v11);
  uint64_t v32 = (char *)&v15 - v31;
  uint64_t v35 = v13;
  uint64_t v34 = v1;
  id v33 = objc_msgSend(v13, sel_temporalEventTrigger, v12);
  if (v33)
  {
    id v22 = v33;
    id v19 = v33;
    id v20 = objc_msgSend(v33, sel_dateComponentsRange);

    id v21 = objc_msgSend(v20, sel_startDate);
    if (v21)
    {
      id v18 = v21;
      id v17 = v21;
      sub_22E0F59B0();
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v30, v27, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v30, 0, 1, v23);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v30, 1, 1, v23);
    }
    sub_22DF4E410(v30, v32);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v32, 1, 1, v23);
  }
  BOOL v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v32, 1, v23) != 1;
  BOOL v15 = v16;
  sub_22DE82340((uint64_t)v32);
  return v15;
}

uint64_t sub_22E092E98(uint64_t a1, void (*a2)(id))
{
  return sub_22E092A9C(a1, a2);
}

uint64_t sub_22E092EBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E092FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22E0F6380();
  (*(void (**)(uint64_t))(a3 + 32))(a2);
  sub_22E093AC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v6 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_22E093084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_22E094228(a1, a2, a3);
  uint64_t v5 = sub_22E0F7A40();

  return v5;
}

uint64_t sub_22E0930F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v66 = a4;
  uint64_t v67 = a1;
  uint64_t v80 = a2;
  uint64_t v81 = a3;
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v94 = 0;
  uint64_t v93 = 0;
  uint64_t v92 = 0;
  uint64_t v68 = 0;
  uint64_t v95 = 0;
  unint64_t v96 = 0;
  uint64_t v90 = a2;
  uint64_t v69 = sub_22E0F7AC0();
  unint64_t v70 = (*(void *)(*(void *)(v69 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v69, v80, v5, v6);
  uint64_t v71 = (uint64_t)&v30 - v70;
  uint64_t v72 = *(void *)(v7 - 8);
  uint64_t v73 = v7 - 8;
  unint64_t v74 = (*(void *)(v72 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v30 - v70, v7, v8, v9);
  uint64_t v75 = (char *)&v30 - v74;
  unint64_t v76 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v30 - v74, v11, v12, v13);
  uint64_t v77 = (char *)&v30 - v76;
  uint64_t v94 = (char *)&v30 - v76;
  unint64_t v78 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v15, v16, v17, v18);
  uint64_t v79 = (char *)&v30 - v78;
  uint64_t v93 = (char *)&v30 - v78;
  uint64_t v92 = a1;
  uint64_t v84 = sub_22E0F6380();
  uint64_t v87 = v19;
  (*(void (**)(void))(v81 + 32))();
  uint64_t v82 = v20;
  uint64_t v83 = v21;
  uint64_t v85 = sub_22E093AC0();
  uint64_t v86 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v88 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v88)
  {
    uint64_t v98 = 0;
    id v65 = self;
    uint64_t v97 = sub_22E0F6390();
    if (v97)
    {
      uint64_t v89 = v97;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
      sub_22E0F7E50();
      uint64_t v89 = sub_22E0F74D0();
      sub_22DE09E50();
    }
    uint64_t v59 = v89;
    uint64_t v63 = sub_22E0F74A0();
    swift_bridgeObjectRelease();
    uint64_t v60 = 0;
    type metadata accessor for WritingOptions();
    uint64_t v61 = sub_22E0F7E50();
    sub_22DE0B474();
    sub_22E0F7B30();
    v91[0] = v98;
    id v64 = objc_msgSend(v65, sel_dataWithJSONObject_options_error_, v63, v91[1], v91);
    id v62 = v91[0];
    id v23 = v91[0];
    uint64_t v24 = v98;
    uint64_t v98 = v62;

    swift_unknownObjectRelease();
    if (v64)
    {
      id v58 = v64;
      id v52 = v64;
      uint64_t v53 = sub_22E0F5950();
      unint64_t v54 = v25;

      uint64_t v55 = v53;
      unint64_t v56 = v54;
      uint64_t v57 = v68;
    }
    else
    {
      uint64_t v34 = 0;
      unint64_t v35 = 0xF000000000000000;
      id v32 = v98;
      id v33 = (id)sub_22E0F58C0();

      swift_willThrow();
      uint64_t v36 = 0;

      uint64_t v55 = v34;
      unint64_t v56 = v35;
      uint64_t v57 = v36;
    }
    uint64_t v49 = v57;
    unint64_t v50 = v56;
    uint64_t v51 = v55;
    if ((v56 & 0xF000000000000000) != 0xF000000000000000)
    {
      uint64_t v47 = v51;
      unint64_t v48 = v50;
      unint64_t v26 = v49;
      unint64_t v44 = v50;
      uint64_t v43 = v51;
      uint64_t v95 = v51;
      unint64_t v96 = v50;
      sub_22E0F57F0();
      uint64_t v45 = sub_22E0F57E0();
      sub_22E0F57D0();
      uint64_t v46 = v26;
      if (v26)
      {
        id v31 = v46;
        swift_release();

        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56))(v71, 1, 1, v80);
      }
      else
      {
        swift_release();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v72 + 56))(v71, 0, 1, v80);
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v71, 1, v80) != 1)
      {
        uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
        uint64_t v37 = v72 + 32;
        v38(v77, v71, v80);
        uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v72 + 16);
        uint64_t v39 = v72 + 16;
        v40(v75, v77, v80);
        v38(v79, (uint64_t)v75, v80);
        uint64_t v42 = *(void (**)(char *, uint64_t))(v72 + 8);
        uint64_t v41 = v72 + 8;
        v42(v77, v80);
        sub_22DE83548(v43, v44);
        v40(v66, v79, v80);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v66, 0, 1, v80);
        uint64_t v27 = sub_22E0F63A0();
        (*(void (**)(uint64_t))(*(void *)(v27 - 8) + 8))(v67);
        return ((uint64_t (*)(char *, uint64_t))v42)(v79, v80);
      }
      sub_22E0942C0(v71, v80);
      sub_22DE83548(v43, v44);
    }
  }
  uint64_t v29 = sub_22E0F63A0();
  (*(void (**)(uint64_t))(*(void *)(v29 - 8) + 8))(v67);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v66, 1, 1, v80);
}

uint64_t sub_22E093AC0()
{
  return sub_22E0F75F0();
}

id sub_22E093C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  uint64_t v14 = 0;
  uint64_t v15 = a1;
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = a1 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1, a2, a3, a4);
  uint64_t v13 = (char *)&v6 - v7;
  uint64_t v14 = v4;
  sub_22E09436C();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v10, v11);
  return sub_22E093D5C(v13, v11, v12);
}

id sub_22E093D5C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v26[3] = a1;
  id v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  (*(void (**)(void))(a3 + 32))();
  sub_22E093AC0();
  id v18 = (id)sub_22E0F7540();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_initWithIdentifier_, v18);

  id v3 = v19;
  id v4 = v19;
  id v27 = 0;
  uint64_t v20 = self;
  sub_22E0F5820();
  sub_22E0F5810();
  uint64_t v24 = sub_22E0F5800();
  unint64_t v25 = v5;
  swift_release();
  id v15 = (id)sub_22E0F5930();
  sub_22DE83548(v24, v25);
  type metadata accessor for ReadingOptions();
  sub_22E0F7E50();
  sub_22DE0B5AC();
  sub_22E0F7B30();
  v26[0] = 0;
  id v16 = objc_msgSend(v20, sel_JSONObjectWithData_options_error_, v15, v26[1], v26);
  id v14 = v26[0];
  id v6 = v26[0];
  unint64_t v7 = v27;
  id v27 = v14;

  if (v16)
  {
    sub_22E0F7B10();
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = v27;
    uint64_t v10 = (void *)sub_22E0F58C0();

    swift_willThrow();
    memset(v28, 0, sizeof(v28));
    uint64_t v29 = 0;
  }
  if (v29)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3760);
    if (swift_dynamicCast()) {
      id v12 = v26[2];
    }
    else {
      id v12 = 0;
    }
    uint64_t v13 = v12;
  }
  else
  {
    sub_22DE585B0((uint64_t)v28);
    uint64_t v13 = 0;
  }
  v26[4] = v13;
  if (!v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
    sub_22E0F7E50();
    sub_22E0F74D0();
    sub_22DE09E50();
  }
  sub_22E0F7CB0();
  id v11 = (id)sub_22E0F74A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setUserData_, v11);

  (*(void (**)(void *))(*(void *)(a2 - 8) + 8))(a1);
  return v19;
}

id sub_22E094228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = self;
  id v9 = sub_22E093C78(a2, a3, (uint64_t)v8, v3);
  id v10 = objc_msgSend(v8, sel_runSiriKitExecutorCommandWithContext_payload_, a1);

  return v10;
}

uint64_t sub_22E0942C0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  }
  return a1;
}

unint64_t sub_22E09436C()
{
  uint64_t v2 = qword_2685C3758;
  if (!qword_2685C3758)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2685C3758);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_22E0943D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = sub_22E094228(a1, a2, a3);
  id v5 = self;
  id v3 = v7;
  id v6 = objc_msgSend(v5, sel_wrapCommandInStartLocalRequest_, v7);
  swift_unknownObjectRelease();

  return v6;
}

uint64_t sub_22E094474()
{
  return swift_bridgeObjectRelease();
}

void *sub_22E0944A8(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[3] = v6;
  return result;
}

void *sub_22E094510(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_22E094590(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

void *type metadata accessor for DIIdentifier()
{
  return &unk_26E1E0088;
}

uint64_t sub_22E094608(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

id sub_22E094630()
{
  uint64_t v1 = (void *)*sub_22DF298D4();
  id result = v1;
  qword_2685D7C78 = (uint64_t)v1;
  return result;
}

uint64_t *sub_22E094668()
{
  if (qword_2685BF6E8 != -1) {
    swift_once();
  }
  return &qword_2685D7C78;
}

void *sub_22E0946CC()
{
  uint64_t v2 = (void *)*sub_22E094668();
  id v0 = v2;
  return v2;
}

uint64_t sub_22E0946FC()
{
  id v9 = 0;
  uint64_t SettingFlow = type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
  unint64_t v6 = (*(void *)(*(void *)(SettingFlow - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5[1], v0, v1, v2);
  id v8 = (char *)v5 - v6;
  id v9 = v3;
  sub_22E094818(v3, (char *)v5 - v6);
  return sub_22E0F7590();
}

uint64_t type metadata accessor for GetSettingFlowStrategy.IntentConversionError()
{
  uint64_t v1 = qword_2685C37C8;
  if (!qword_2685C37C8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *sub_22E094818(const void *a1, void *a2)
{
  uint64_t SettingFlow = type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    uint64_t v2 = sub_22E0F63B0();
    (*(void (**)(void *, const void *))(*(void *)(v2 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a2, a1, *(void *)(*(void *)(SettingFlow - 8) + 64));
  }
  return a2;
}

uint64_t sub_22E09494C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
  sub_22E0F7E50();
  unint64_t v6 = v0;
  id v7 = (id)*MEMORY[0x263F08320];
  id v1 = (id)*MEMORY[0x263F08320];
  *unint64_t v6 = sub_22E0F7550();
  v6[1] = v2;
  uint64_t v3 = sub_22E0946FC();
  v6[5] = MEMORY[0x263F8D310];
  v6[2] = v3;
  v6[3] = v4;
  sub_22DE04404();

  return sub_22E0F74D0();
}

uint64_t sub_22E094A28()
{
  return sub_22E0F7EE0();
}

unint64_t sub_22E094A58()
{
  uint64_t v2 = qword_2685C3768;
  if (!qword_2685C3768)
  {
    type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3768);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E094ADC()
{
  return sub_22E0F7ED0();
}

uint64_t sub_22E094B0C()
{
  return sub_22E09494C();
}

uint64_t sub_22E094B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v97 = a1;
  uint64_t v3 = v2;
  uint64_t v4 = v97;
  uint64_t v117 = v3;
  uint64_t v121 = "GetSettingFlowStrategy: actionForInput.";
  uint64_t v98 = "GetSettingFlowStrategy: not a compatible type of parse. Ignoring.";
  uint64_t v99 = "GetSettingFlowStrategy: %@ handling NLV3Intent.";
  uint64_t v100 = "GetSettingFlowStrategy: Error parsing uso parse.";
  uint64_t v140 = 0;
  uint64_t v139 = 0;
  uint32_t v142 = 0;
  uint64_t v101 = 0;
  id v136 = 0;
  id v135 = 0;
  BOOL v134 = 0;
  uint64_t v141 = 0;
  id v131 = 0;
  BOOL v130 = 0;
  uint64_t v119 = 0;
  uint64_t v102 = sub_22E0F6430();
  uint64_t v103 = *(void *)(v102 - 8);
  uint64_t v104 = v102 - 8;
  unint64_t v105 = (*(void *)(v103 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v5, v6, v7);
  uint64_t v106 = (uint64_t)v49 - v105;
  uint64_t v107 = sub_22E0F63E0();
  uint64_t v108 = *(void *)(v107 - 8);
  uint64_t v109 = v107 - 8;
  unint64_t v110 = (*(void *)(v108 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119, v8, v9, v10);
  uint64_t v111 = (char *)v49 - v110;
  uint32_t v142 = (char *)v49 - v110;
  uint64_t v112 = sub_22E0F6E80();
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = v112 - 8;
  unint64_t v115 = (*(void *)(v113 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119, v11, v12, v13);
  uint64_t v116 = (char *)v49 - v115;
  uint64_t v141 = (char *)v49 - v115;
  uint64_t v128 = sub_22E0F63B0();
  uint64_t v125 = *(void *)(v128 - 8);
  uint64_t v126 = v128 - 8;
  unint64_t v118 = (*(void *)(v125 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v128, v14, v15, v16);
  uint64_t v127 = (char *)v49 - v118;
  uint64_t v140 = v4;
  uint64_t v139 = v17;
  int v122 = sub_22E0F7990();
  id v124 = (id)*sub_22DF151C8();
  id v18 = v124;
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v123 = sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22E0F6360();
  int v129 = (*(uint64_t (**)(char *, uint64_t))(v125 + 88))(v127, v128);
  if (v129 == *MEMORY[0x263F6FF50])
  {
    (*(void (**)(char *, uint64_t))(v125 + 96))(v127, v128);
    (*(void (**)(char *, char *, uint64_t))(v113 + 32))(v116, v127, v112);
    uint64_t v141 = v116;
    uint64_t v94 = v133;
    memset(v133, 0, sizeof(v133));
    uint64_t v93 = &v132;
    sub_22DEDDFB8(&v132);
    id v95 = sub_22DEF4A3C((uint64_t)v116, v94, v93);
    sub_22DE585B0((uint64_t)v93);
    sub_22DE585B0((uint64_t)v94);
    id v131 = v95;
    id v19 = v95;
    if (v95)
    {
      id v92 = v95;
      id v90 = v95;
      self;
      uint64_t v91 = swift_dynamicCastObjCClass();
      if (v91)
      {
        uint64_t v89 = (void *)v91;
      }
      else
      {
        int v88 = 0;

        uint64_t v89 = v88;
      }
      id v87 = v89;
    }
    else
    {
      id v87 = 0;
    }
    BOOL v84 = v87 != 0;
    BOOL v130 = v87 != 0;

    int v82 = sub_22E0F7990();
    id v83 = (id)*sub_22DF151C8();
    id v20 = v83;
    uint64_t v85 = sub_22E0F7E50();
    uint64_t v86 = v21;
    if (v84)
    {
      uint64_t v81 = sub_22E0F7610();
      uint64_t v80 = v22;
      v86[3] = MEMORY[0x263F8D310];
      unint64_t v23 = sub_22DE103A4();
      uint64_t v24 = v80;
      unint64_t v25 = v86;
      unint64_t v26 = v23;
      uint64_t v27 = v81;
    }
    else
    {
      uint64_t v79 = sub_22E0F7610();
      uint64_t v78 = v28;
      v86[3] = MEMORY[0x263F8D310];
      unint64_t v29 = sub_22DE103A4();
      uint64_t v24 = v78;
      unint64_t v25 = v86;
      unint64_t v26 = v29;
      uint64_t v27 = v79;
    }
    v86[4] = v26;
    *unint64_t v25 = v27;
    v25[1] = v24;
    uint64_t v30 = v85;
    sub_22DE04404();
    uint64_t v77 = v30;
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    if (v84) {
      sub_22E0F6010();
    }
    else {
      sub_22E0F6020();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v113 + 8))(v116, v112);
  }
  else if (v129 == *MEMORY[0x263F6FF80])
  {
    id v31 = v101;
    id v32 = v111;
    (*(void (**)(char *, uint64_t))(v125 + 96))(v127, v128);
    (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v32, v127, v107);
    uint32_t v142 = v32;
    sub_22E0F63D0();
    uint64_t v73 = v138;
    sub_22E0F63C0();
    unint64_t v74 = &v137;
    sub_22DEDDFB8(&v137);
    id v75 = sub_22DF64508(v106, v73, v74);
    unint64_t v76 = v31;
    if (v31)
    {
      id v55 = v76;
      sub_22DE585B0((uint64_t)&v137);
      sub_22DE585B0((uint64_t)v138);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v102);
      id v45 = v55;
      id v136 = v55;
      int v52 = sub_22E0F79A0();
      id v54 = (id)*sub_22DF151C8();
      id v46 = v54;
      uint64_t v53 = sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      sub_22E0F6020();
      return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    }
    else
    {
      id v72 = v75;
      sub_22DE585B0((uint64_t)&v137);
      sub_22DE585B0((uint64_t)v138);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v102);
      id v135 = v72;
      id v33 = v72;
      if (v72)
      {
        id v71 = v72;
        id v69 = v72;
        self;
        uint64_t v70 = swift_dynamicCastObjCClass();
        if (v70)
        {
          uint64_t v68 = (void *)v70;
        }
        else
        {
          uint64_t v67 = 0;

          uint64_t v68 = v67;
        }
        id v66 = v68;
      }
      else
      {
        id v66 = 0;
      }
      BOOL v63 = v66 != 0;
      BOOL v134 = v66 != 0;

      int v61 = sub_22E0F7990();
      id v62 = (id)*sub_22DF151C8();
      id v34 = v62;
      uint64_t v64 = sub_22E0F7E50();
      id v65 = v35;
      if (v63)
      {
        uint64_t v60 = sub_22E0F7610();
        uint64_t v59 = v36;
        v65[3] = MEMORY[0x263F8D310];
        unint64_t v37 = sub_22DE103A4();
        uint64_t v38 = v59;
        uint64_t v39 = v65;
        unint64_t v40 = v37;
        uint64_t v41 = v60;
      }
      else
      {
        uint64_t v58 = sub_22E0F7610();
        uint64_t v57 = v42;
        v65[3] = MEMORY[0x263F8D310];
        unint64_t v43 = sub_22DE103A4();
        uint64_t v38 = v57;
        uint64_t v39 = v65;
        unint64_t v40 = v43;
        uint64_t v41 = v58;
      }
      v65[4] = v40;
      uint64_t *v39 = v41;
      v39[1] = v38;
      uint64_t v44 = v64;
      sub_22DE04404();
      uint64_t v56 = v44;
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      if (v63) {
        sub_22E0F6010();
      }
      else {
        sub_22E0F6020();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    }
  }
  else
  {
    v49[3] = sub_22E0F7990();
    id v51 = (id)*sub_22DF151C8();
    id v47 = v51;
    uint64_t v50 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    sub_22E0F6020();
    return (*(uint64_t (**)(char *, uint64_t))(v125 + 8))(v127, v128);
  }
}

uint64_t sub_22E095A40(uint64_t a1, uint64_t a2)
{
  v3[32] = a1;
  v3[22] = v3;
  v3[23] = 0;
  v3[24] = 0;
  v3[25] = 0;
  v3[26] = 0;
  v3[27] = 0;
  v3[29] = 0;
  v3[30] = 0;
  v3[31] = 0;
  uint64_t v4 = sub_22E0F6430();
  v3[33] = v4;
  v3[34] = *(void *)(v4 - 8);
  v3[35] = swift_task_alloc();
  uint64_t v5 = sub_22E0F63E0();
  v3[36] = v5;
  v3[37] = *(void *)(v5 - 8);
  v3[38] = swift_task_alloc();
  uint64_t v6 = sub_22E0F6E80();
  v3[39] = v6;
  v3[40] = *(void *)(v6 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  uint64_t v7 = sub_22E0F63B0();
  v3[43] = v7;
  v3[44] = *(void *)(v7 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[23] = a1;
  v3[24] = a2;
  v3[25] = v2;
  return MEMORY[0x270FA2498](sub_22E095CF4, 0);
}

uint64_t sub_22E095CF4()
{
  uint64_t v75 = v0[46];
  uint64_t v73 = v0[44];
  uint64_t v74 = v0[43];
  uint64_t v71 = v0[32];
  v0[22] = v0;
  sub_22E0F7990();
  uint64_t v70 = (void *)*sub_22DF151C8();
  id v1 = v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v72 = *(void (**)(void))(v73 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v75, v71, v74);
  int v76 = (*(uint64_t (**)(uint64_t, uint64_t))(v73 + 88))(v75, v74);
  if (v76 == *MEMORY[0x263F6FF50])
  {
    uint64_t v65 = v69[46];
    uint64_t v67 = v69[42];
    uint64_t v66 = v69[39];
    uint64_t v64 = v69[40];
    (*(void (**)(void))(v69[44] + 96))();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v67, v65, v66);
    v69[30] = v67;
    v69[12] = 0;
    v69[13] = 0;
    v69[14] = 0;
    v69[15] = 0;
    v69[16] = 0;
    sub_22DEDDFB8(v69 + 17);
    id v68 = sub_22DEF4A3C(v67, v69 + 12, v69 + 17);
    sub_22DE585B0((uint64_t)(v69 + 17));
    sub_22DE585B0((uint64_t)(v69 + 12));
    if (v68)
    {
      self;
      uint64_t v63 = swift_dynamicCastObjCClass();
      if (v63)
      {
        uint64_t v62 = v63;
      }
      else
      {

        uint64_t v62 = 0;
      }
      uint64_t v61 = v62;
    }
    else
    {
      uint64_t v61 = 0;
    }
    if (v61)
    {
      uint64_t v2 = v69[42];
      uint64_t v3 = v69[40];
      uint64_t v4 = v69[39];
      v69[31] = v61;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
      uint64_t v60 = v61;
      goto LABEL_22;
    }
    uint64_t v58 = v69[42];
    uint64_t v53 = v69[41];
    uint64_t v59 = v69[39];
    uint64_t v52 = v69[40];
    id v57 = (id)*sub_22DF151C8();
    id v5 = v57;
    sub_22E0F79A0();
    sub_22E0F7E50();
    uint64_t v56 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v53, v58, v59);
    sub_22DEF4E94();
    uint64_t v54 = sub_22E0F75A0();
    uint64_t v55 = v7;
    v56[3] = MEMORY[0x263F8D310];
    v56[4] = sub_22DE103A4();
    *uint64_t v56 = v54;
    v56[1] = v55;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
    sub_22E096BFC();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v58, v59);
LABEL_25:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = v51;
    uint64_t v16 = *(uint64_t (**)(uint64_t))(v69[22] + 8);
    return v16(v15);
  }
  if (v76 != *MEMORY[0x263F6FF80])
  {
    uint64_t v37 = v69[46];
    uint64_t v30 = v69[45];
    uint64_t v38 = v69[43];
    uint64_t v35 = v69[32];
    uint64_t v36 = v69[44];
    id v34 = (id)*sub_22DF151C8();
    id v12 = v34;
    sub_22E0F79A0();
    sub_22E0F7E50();
    id v33 = v13;
    ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v30, v35, v38);
    uint64_t v31 = sub_22E0F7590();
    uint64_t v32 = v14;
    v33[3] = MEMORY[0x263F8D310];
    v33[4] = sub_22DE103A4();
    uint64_t *v33 = v31;
    v33[1] = v32;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
    sub_22E096BFC();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v38);
    goto LABEL_25;
  }
  uint64_t v47 = v69[46];
  uint64_t v8 = v69[38];
  uint64_t v48 = v69[36];
  uint64_t v49 = v69[35];
  uint64_t v46 = v69[37];
  (*(void (**)(void))(v69[44] + 96))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v8, v47, v48);
  v69[26] = v8;
  sub_22E0F63D0();
  sub_22E0F63C0();
  sub_22DEDDFB8(v69 + 7);
  id v50 = sub_22DF64508(v49, v69 + 2, v69 + 7);
  uint64_t v45 = v69[35];
  uint64_t v44 = v69[33];
  uint64_t v43 = v69[34];
  sub_22DE585B0((uint64_t)(v69 + 7));
  sub_22DE585B0((uint64_t)(v69 + 2));
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
  if (v50)
  {
    self;
    uint64_t v42 = swift_dynamicCastObjCClass();
    if (v42)
    {
      uint64_t v41 = v42;
    }
    else
    {

      uint64_t v41 = 0;
    }
    uint64_t v40 = v41;
  }
  else
  {
    uint64_t v40 = 0;
  }
  if (!v40)
  {
    type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
    sub_22E096BFC();
    uint64_t v39 = (void *)swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v28 = v69[38];
    uint64_t v29 = v69[36];
    uint64_t v27 = v69[37];
    id v17 = v39;
    v69[27] = v39;
    id v26 = (id)*sub_22DF151C8();
    id v18 = v26;
    sub_22E0F79A0();
    sub_22E0F7E50();
    unint64_t v25 = v19;
    id v20 = v39;
    v69[28] = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0008);
    uint64_t v23 = sub_22E0F7590();
    uint64_t v24 = v21;
    v25[3] = MEMORY[0x263F8D310];
    v25[4] = sub_22DE103A4();
    *unint64_t v25 = v23;
    v25[1] = v24;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
    sub_22E096BFC();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
    goto LABEL_25;
  }
  uint64_t v9 = v69[38];
  uint64_t v10 = v69[37];
  uint64_t v11 = v69[36];
  v69[29] = v40;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  uint64_t v60 = v40;
LABEL_22:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = v60;
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v69[22] + 8);
  return v16(v15);
}

unint64_t sub_22E096BFC()
{
  uint64_t v2 = qword_2685C3778[0];
  if (!qword_2685C3778[0])
  {
    type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2685C3778);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E096C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22E094B24(a1, a2);
}

uint64_t sub_22E096CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E095A40(a1, a2);
}

uint64_t sub_22E096D64()
{
  return sub_22E0F6260();
}

uint64_t type metadata accessor for GetSettingFlowStrategy()
{
  return self;
}

void *sub_22E096DC8()
{
  return sub_22E0946CC();
}

uint64_t sub_22E096DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66498](a1, a2, a3, SettingFlowStrategy, a5);
}

uint64_t sub_22E096EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66490](a1, a2, a3, SettingFlowStrategy, a5);
}

uint64_t sub_22E096F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66488](a1, a2, a3, SettingFlowStrategy, a5);
}

uint64_t sub_22E097074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_22DE632A8;
  return MEMORY[0x270F66480](a1, a2, a3, a4, SettingFlowStrategy, a6);
}

uint64_t sub_22E097158(uint64_t a1, void *a2)
{
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  unint64_t v2 = sub_22E097204();
  uint64_t v3 = sub_22DF4FC28(a1, a2, SettingFlowStrategy, v2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v9 + 8);
  return v4(v3);
}

unint64_t sub_22E097204()
{
  uint64_t v2 = qword_2685C37B8;
  if (!qword_2685C37B8)
  {
    type metadata accessor for GetSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C37B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E097288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_22DE632A8;
  return MEMORY[0x270F66790](a1, a2, a3, a4, SettingFlowStrategy, a6);
}

void *sub_22E09736C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E0974B4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      uint64_t v3 = sub_22E0F63B0();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 16))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22E0974B4(uint64_t a1)
{
  type metadata accessor for GetSettingFlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    uint64_t v1 = sub_22E0F63B0();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  return a1;
}

void *sub_22E09758C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E0974B4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      uint64_t v3 = sub_22E0F63B0();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 32))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

unint64_t sub_22E0976D4()
{
  return sub_22E0976EC();
}

unint64_t sub_22E0976EC()
{
  uint64_t v2 = qword_2685C37D8;
  if (!qword_2685C37D8)
  {
    type metadata accessor for GetSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C37D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E097770()
{
  return sub_22E097788();
}

unint64_t sub_22E097788()
{
  uint64_t v2 = qword_2685C37E0;
  if (!qword_2685C37E0)
  {
    type metadata accessor for GetSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C37E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09780C(uint64_t a1)
{
  unint64_t result = sub_22E0976EC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22E097838()
{
  return sub_22E096BFC();
}

unint64_t sub_22E097850()
{
  return sub_22E097868();
}

unint64_t sub_22E097868()
{
  uint64_t v2 = qword_2685C37E8;
  if (!qword_2685C37E8)
  {
    type metadata accessor for GetSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C37E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0978EC()
{
  type metadata accessor for SetAXColorFiltersGreenRedHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7C80 = result;
  return result;
}

uint64_t type metadata accessor for SetAXColorFiltersGreenRedHandler()
{
  return self;
}

uint64_t *sub_22E097954()
{
  if (qword_2685BF6F0 != -1) {
    swift_once();
  }
  return &qword_2685D7C80;
}

uint64_t sub_22E0979B8(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE6D3D4();
  swift_release();
  uint64_t v4 = sub_22DF0A224();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E097BCC, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E097BCC);
}

uint64_t sub_22E097B5C()
{
  return swift_release();
}

uint64_t sub_22E097BCC()
{
  return sub_22E097B5C();
}

uint64_t sub_22E097BF4(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0979B8(a1, a2, a3);
}

id sub_22E097C18()
{
  uint64_t v1 = (void *)*sub_22DF0369C();
  id result = v1;
  qword_2685D7C88 = (uint64_t)v1;
  return result;
}

uint64_t *sub_22E097C50()
{
  if (qword_2685BF6F8 != -1) {
    swift_once();
  }
  return &qword_2685D7C88;
}

void *sub_22E097CB4()
{
  uint64_t v2 = (void *)*sub_22E097C50();
  id v0 = v2;
  return v2;
}

uint64_t sub_22E097CE4()
{
  uint64_t v9 = 0;
  uint64_t v7 = type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
  unint64_t v6 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5[1], v0, v1, v2);
  BOOL v8 = (char *)v5 - v6;
  uint64_t v9 = v3;
  sub_22E097E00(v3, (char *)v5 - v6);
  return sub_22E0F7590();
}

uint64_t type metadata accessor for OpenSettingFlowStrategy.IntentConversionError()
{
  uint64_t v1 = qword_2685C3850;
  if (!qword_2685C3850) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *sub_22E097E00(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    uint64_t v2 = sub_22E0F63B0();
    (*(void (**)(void *, const void *))(*(void *)(v2 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a2, a1, *(void *)(*(void *)(v6 - 8) + 64));
  }
  return a2;
}

uint64_t sub_22E097F34()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
  sub_22E0F7E50();
  uint64_t v6 = v0;
  id v7 = (id)*MEMORY[0x263F08320];
  id v1 = (id)*MEMORY[0x263F08320];
  *uint64_t v6 = sub_22E0F7550();
  v6[1] = v2;
  uint64_t v3 = sub_22E097CE4();
  v6[5] = MEMORY[0x263F8D310];
  v6[2] = v3;
  v6[3] = v4;
  sub_22DE04404();

  return sub_22E0F74D0();
}

uint64_t sub_22E098010()
{
  return sub_22E0F7EE0();
}

unint64_t sub_22E098040()
{
  uint64_t v2 = qword_2685C37F0;
  if (!qword_2685C37F0)
  {
    type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C37F0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0980C4()
{
  return sub_22E0F7ED0();
}

uint64_t sub_22E0980F4()
{
  return sub_22E097F34();
}

uint64_t sub_22E09810C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v97 = a1;
  uint64_t v3 = v2;
  uint64_t v4 = v97;
  uint64_t v117 = v3;
  uint64_t v121 = "OpenSettingFlowStrategy: actionForInput.";
  uint64_t v98 = "OpenSettingFlowStrategy: not a compatible type of parse. Ignoring.";
  uint64_t v99 = "OpenSettingFlowStrategy: %@ handling NLV3Intent.";
  uint64_t v100 = "OpenSettingFlowStrategy: Error parsing uso parse.";
  uint64_t v140 = 0;
  uint64_t v139 = 0;
  uint32_t v142 = 0;
  uint64_t v101 = 0;
  id v136 = 0;
  id v135 = 0;
  BOOL v134 = 0;
  uint64_t v141 = 0;
  id v131 = 0;
  BOOL v130 = 0;
  uint64_t v119 = 0;
  uint64_t v102 = sub_22E0F6430();
  uint64_t v103 = *(void *)(v102 - 8);
  uint64_t v104 = v102 - 8;
  unint64_t v105 = (*(void *)(v103 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v5, v6, v7);
  uint64_t v106 = (uint64_t)v49 - v105;
  uint64_t v107 = sub_22E0F63E0();
  uint64_t v108 = *(void *)(v107 - 8);
  uint64_t v109 = v107 - 8;
  unint64_t v110 = (*(void *)(v108 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119, v8, v9, v10);
  uint64_t v111 = (char *)v49 - v110;
  uint32_t v142 = (char *)v49 - v110;
  uint64_t v112 = sub_22E0F6E80();
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = v112 - 8;
  unint64_t v115 = (*(void *)(v113 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119, v11, v12, v13);
  uint64_t v116 = (char *)v49 - v115;
  uint64_t v141 = (char *)v49 - v115;
  uint64_t v128 = sub_22E0F63B0();
  uint64_t v125 = *(void *)(v128 - 8);
  uint64_t v126 = v128 - 8;
  unint64_t v118 = (*(void *)(v125 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v128, v14, v15, v16);
  uint64_t v127 = (char *)v49 - v118;
  uint64_t v140 = v4;
  uint64_t v139 = v17;
  int v122 = sub_22E0F7990();
  id v124 = (id)*sub_22DF15350();
  id v18 = v124;
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v123 = sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22E0F6360();
  int v129 = (*(uint64_t (**)(char *, uint64_t))(v125 + 88))(v127, v128);
  if (v129 == *MEMORY[0x263F6FF50])
  {
    (*(void (**)(char *, uint64_t))(v125 + 96))(v127, v128);
    (*(void (**)(char *, char *, uint64_t))(v113 + 32))(v116, v127, v112);
    uint64_t v141 = v116;
    uint64_t v94 = v133;
    memset(v133, 0, sizeof(v133));
    uint64_t v93 = &v132;
    sub_22DEDDFB8(&v132);
    id v95 = sub_22DEF4A3C((uint64_t)v116, v94, v93);
    sub_22DE585B0((uint64_t)v93);
    sub_22DE585B0((uint64_t)v94);
    id v131 = v95;
    id v19 = v95;
    if (v95)
    {
      id v92 = v95;
      id v90 = v95;
      self;
      uint64_t v91 = swift_dynamicCastObjCClass();
      if (v91)
      {
        uint64_t v89 = (void *)v91;
      }
      else
      {
        int v88 = 0;

        uint64_t v89 = v88;
      }
      id v87 = v89;
    }
    else
    {
      id v87 = 0;
    }
    BOOL v84 = v87 != 0;
    BOOL v130 = v87 != 0;

    int v82 = sub_22E0F7990();
    id v83 = (id)*sub_22DF15350();
    id v20 = v83;
    uint64_t v85 = sub_22E0F7E50();
    uint64_t v86 = v21;
    if (v84)
    {
      uint64_t v81 = sub_22E0F7610();
      uint64_t v80 = v22;
      v86[3] = MEMORY[0x263F8D310];
      unint64_t v23 = sub_22DE103A4();
      uint64_t v24 = v80;
      unint64_t v25 = v86;
      unint64_t v26 = v23;
      uint64_t v27 = v81;
    }
    else
    {
      uint64_t v79 = sub_22E0F7610();
      uint64_t v78 = v28;
      v86[3] = MEMORY[0x263F8D310];
      unint64_t v29 = sub_22DE103A4();
      uint64_t v24 = v78;
      unint64_t v25 = v86;
      unint64_t v26 = v29;
      uint64_t v27 = v79;
    }
    v86[4] = v26;
    *unint64_t v25 = v27;
    v25[1] = v24;
    uint64_t v30 = v85;
    sub_22DE04404();
    uint64_t v77 = v30;
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    if (v84) {
      sub_22E0F6010();
    }
    else {
      sub_22E0F6020();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v113 + 8))(v116, v112);
  }
  else if (v129 == *MEMORY[0x263F6FF80])
  {
    uint64_t v31 = v101;
    uint64_t v32 = v111;
    (*(void (**)(char *, uint64_t))(v125 + 96))(v127, v128);
    (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v32, v127, v107);
    uint32_t v142 = v32;
    sub_22E0F63D0();
    uint64_t v73 = v138;
    sub_22E0F63C0();
    uint64_t v74 = &v137;
    sub_22DEDDFB8(&v137);
    id v75 = sub_22DF64508(v106, v73, v74);
    int v76 = v31;
    if (v31)
    {
      id v55 = v76;
      sub_22DE585B0((uint64_t)&v137);
      sub_22DE585B0((uint64_t)v138);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v102);
      id v45 = v55;
      id v136 = v55;
      int v52 = sub_22E0F79A0();
      id v54 = (id)*sub_22DF15350();
      id v46 = v54;
      uint64_t v53 = sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      sub_22E0F6020();
      return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    }
    else
    {
      id v72 = v75;
      sub_22DE585B0((uint64_t)&v137);
      sub_22DE585B0((uint64_t)v138);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v102);
      id v135 = v72;
      id v33 = v72;
      if (v72)
      {
        id v71 = v72;
        id v69 = v72;
        self;
        uint64_t v70 = swift_dynamicCastObjCClass();
        if (v70)
        {
          id v68 = (void *)v70;
        }
        else
        {
          uint64_t v67 = 0;

          id v68 = v67;
        }
        id v66 = v68;
      }
      else
      {
        id v66 = 0;
      }
      BOOL v63 = v66 != 0;
      BOOL v134 = v66 != 0;

      int v61 = sub_22E0F7990();
      id v62 = (id)*sub_22DF15350();
      id v34 = v62;
      uint64_t v64 = sub_22E0F7E50();
      uint64_t v65 = v35;
      if (v63)
      {
        uint64_t v60 = sub_22E0F7610();
        uint64_t v59 = v36;
        v65[3] = MEMORY[0x263F8D310];
        unint64_t v37 = sub_22DE103A4();
        uint64_t v38 = v59;
        uint64_t v39 = v65;
        unint64_t v40 = v37;
        uint64_t v41 = v60;
      }
      else
      {
        uint64_t v58 = sub_22E0F7610();
        uint64_t v57 = v42;
        v65[3] = MEMORY[0x263F8D310];
        unint64_t v43 = sub_22DE103A4();
        uint64_t v38 = v57;
        uint64_t v39 = v65;
        unint64_t v40 = v43;
        uint64_t v41 = v58;
      }
      v65[4] = v40;
      uint64_t *v39 = v41;
      v39[1] = v38;
      uint64_t v44 = v64;
      sub_22DE04404();
      uint64_t v56 = v44;
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      if (v63) {
        sub_22E0F6010();
      }
      else {
        sub_22E0F6020();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    }
  }
  else
  {
    v49[3] = sub_22E0F7990();
    id v51 = (id)*sub_22DF15350();
    id v47 = v51;
    uint64_t v50 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    sub_22E0F6020();
    return (*(uint64_t (**)(char *, uint64_t))(v125 + 8))(v127, v128);
  }
}

uint64_t sub_22E099028(uint64_t a1, uint64_t a2)
{
  v3[32] = a1;
  v3[22] = v3;
  v3[23] = 0;
  v3[24] = 0;
  v3[25] = 0;
  v3[26] = 0;
  v3[27] = 0;
  v3[29] = 0;
  v3[30] = 0;
  v3[31] = 0;
  uint64_t v4 = sub_22E0F6430();
  v3[33] = v4;
  v3[34] = *(void *)(v4 - 8);
  v3[35] = swift_task_alloc();
  uint64_t v5 = sub_22E0F63E0();
  v3[36] = v5;
  v3[37] = *(void *)(v5 - 8);
  v3[38] = swift_task_alloc();
  uint64_t v6 = sub_22E0F6E80();
  v3[39] = v6;
  v3[40] = *(void *)(v6 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  uint64_t v7 = sub_22E0F63B0();
  v3[43] = v7;
  v3[44] = *(void *)(v7 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[23] = a1;
  v3[24] = a2;
  v3[25] = v2;
  return MEMORY[0x270FA2498](sub_22E0992DC, 0);
}

uint64_t sub_22E0992DC()
{
  uint64_t v75 = v0[46];
  uint64_t v73 = v0[44];
  uint64_t v74 = v0[43];
  uint64_t v71 = v0[32];
  v0[22] = v0;
  sub_22E0F7990();
  uint64_t v70 = (void *)*sub_22DF15350();
  id v1 = v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v72 = *(void (**)(void))(v73 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v75, v71, v74);
  int v76 = (*(uint64_t (**)(uint64_t, uint64_t))(v73 + 88))(v75, v74);
  if (v76 == *MEMORY[0x263F6FF50])
  {
    uint64_t v65 = v69[46];
    uint64_t v67 = v69[42];
    uint64_t v66 = v69[39];
    uint64_t v64 = v69[40];
    (*(void (**)(void))(v69[44] + 96))();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v67, v65, v66);
    v69[30] = v67;
    v69[12] = 0;
    v69[13] = 0;
    v69[14] = 0;
    v69[15] = 0;
    v69[16] = 0;
    sub_22DEDDFB8(v69 + 17);
    id v68 = sub_22DEF4A3C(v67, v69 + 12, v69 + 17);
    sub_22DE585B0((uint64_t)(v69 + 17));
    sub_22DE585B0((uint64_t)(v69 + 12));
    if (v68)
    {
      self;
      uint64_t v63 = swift_dynamicCastObjCClass();
      if (v63)
      {
        uint64_t v62 = v63;
      }
      else
      {

        uint64_t v62 = 0;
      }
      uint64_t v61 = v62;
    }
    else
    {
      uint64_t v61 = 0;
    }
    if (v61)
    {
      uint64_t v2 = v69[42];
      uint64_t v3 = v69[40];
      uint64_t v4 = v69[39];
      v69[31] = v61;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
      uint64_t v60 = v61;
      goto LABEL_22;
    }
    uint64_t v58 = v69[42];
    uint64_t v53 = v69[41];
    uint64_t v59 = v69[39];
    uint64_t v52 = v69[40];
    id v57 = (id)*sub_22DF15350();
    id v5 = v57;
    sub_22E0F79A0();
    sub_22E0F7E50();
    uint64_t v56 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v53, v58, v59);
    sub_22DEF4E94();
    uint64_t v54 = sub_22E0F75A0();
    uint64_t v55 = v7;
    v56[3] = MEMORY[0x263F8D310];
    v56[4] = sub_22DE103A4();
    *uint64_t v56 = v54;
    v56[1] = v55;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
    sub_22E09A1E4();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v58, v59);
LABEL_25:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = v51;
    uint64_t v16 = *(uint64_t (**)(uint64_t))(v69[22] + 8);
    return v16(v15);
  }
  if (v76 != *MEMORY[0x263F6FF80])
  {
    uint64_t v37 = v69[46];
    uint64_t v30 = v69[45];
    uint64_t v38 = v69[43];
    uint64_t v35 = v69[32];
    uint64_t v36 = v69[44];
    id v34 = (id)*sub_22DF15350();
    id v12 = v34;
    sub_22E0F79A0();
    sub_22E0F7E50();
    id v33 = v13;
    ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v30, v35, v38);
    uint64_t v31 = sub_22E0F7590();
    uint64_t v32 = v14;
    v33[3] = MEMORY[0x263F8D310];
    v33[4] = sub_22DE103A4();
    uint64_t *v33 = v31;
    v33[1] = v32;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
    sub_22E09A1E4();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v38);
    goto LABEL_25;
  }
  uint64_t v47 = v69[46];
  uint64_t v8 = v69[38];
  uint64_t v48 = v69[36];
  uint64_t v49 = v69[35];
  uint64_t v46 = v69[37];
  (*(void (**)(void))(v69[44] + 96))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v8, v47, v48);
  v69[26] = v8;
  sub_22E0F63D0();
  sub_22E0F63C0();
  sub_22DEDDFB8(v69 + 7);
  id v50 = sub_22DF64508(v49, v69 + 2, v69 + 7);
  uint64_t v45 = v69[35];
  uint64_t v44 = v69[33];
  uint64_t v43 = v69[34];
  sub_22DE585B0((uint64_t)(v69 + 7));
  sub_22DE585B0((uint64_t)(v69 + 2));
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
  if (v50)
  {
    self;
    uint64_t v42 = swift_dynamicCastObjCClass();
    if (v42)
    {
      uint64_t v41 = v42;
    }
    else
    {

      uint64_t v41 = 0;
    }
    uint64_t v40 = v41;
  }
  else
  {
    uint64_t v40 = 0;
  }
  if (!v40)
  {
    type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
    sub_22E09A1E4();
    uint64_t v39 = (void *)swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v28 = v69[38];
    uint64_t v29 = v69[36];
    uint64_t v27 = v69[37];
    id v17 = v39;
    v69[27] = v39;
    id v26 = (id)*sub_22DF15350();
    id v18 = v26;
    sub_22E0F79A0();
    sub_22E0F7E50();
    unint64_t v25 = v19;
    id v20 = v39;
    v69[28] = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0008);
    uint64_t v23 = sub_22E0F7590();
    uint64_t v24 = v21;
    v25[3] = MEMORY[0x263F8D310];
    v25[4] = sub_22DE103A4();
    *unint64_t v25 = v23;
    v25[1] = v24;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
    sub_22E09A1E4();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
    goto LABEL_25;
  }
  uint64_t v9 = v69[38];
  uint64_t v10 = v69[37];
  uint64_t v11 = v69[36];
  v69[29] = v40;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  uint64_t v60 = v40;
LABEL_22:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = v60;
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v69[22] + 8);
  return v16(v15);
}

unint64_t sub_22E09A1E4()
{
  uint64_t v2 = qword_2685C3800[0];
  if (!qword_2685C3800[0])
  {
    type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2685C3800);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09A268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22E09810C(a1, a2);
}

uint64_t sub_22E09A28C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E099028(a1, a2);
}

uint64_t sub_22E09A34C()
{
  return sub_22E0F6260();
}

uint64_t type metadata accessor for OpenSettingFlowStrategy()
{
  return self;
}

void *sub_22E09A3B0()
{
  return sub_22E097CB4();
}

uint64_t sub_22E09A3C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for OpenSettingFlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66498](a1, a2, a3, v7, a5);
}

uint64_t sub_22E09A4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for OpenSettingFlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66490](a1, a2, a3, v7, a5);
}

uint64_t sub_22E09A580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for OpenSettingFlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66488](a1, a2, a3, v7, a5);
}

uint64_t sub_22E09A65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  uint64_t v8 = type metadata accessor for OpenSettingFlowStrategy();
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_22DE632A8;
  return MEMORY[0x270F66480](a1, a2, a3, a4, v8, a6);
}

uint64_t sub_22E09A740(uint64_t a1, void *a2)
{
  uint64_t v7 = type metadata accessor for OpenSettingFlowStrategy();
  unint64_t v2 = sub_22E09A7EC();
  uint64_t v3 = sub_22DF4FC28(a1, a2, v7, v2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v9 + 8);
  return v4(v3);
}

unint64_t sub_22E09A7EC()
{
  uint64_t v2 = qword_2685C3840;
  if (!qword_2685C3840)
  {
    type metadata accessor for OpenSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3840);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09A870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  uint64_t v8 = type metadata accessor for OpenSettingFlowStrategy();
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_22DE632A8;
  return MEMORY[0x270F66790](a1, a2, a3, a4, v8, a6);
}

void *sub_22E09A954(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E09AA9C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      uint64_t v3 = sub_22E0F63B0();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 16))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22E09AA9C(uint64_t a1)
{
  type metadata accessor for OpenSettingFlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    uint64_t v1 = sub_22E0F63B0();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  return a1;
}

void *sub_22E09AB74(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E09AA9C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      uint64_t v3 = sub_22E0F63B0();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 32))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

unint64_t sub_22E09ACBC()
{
  return sub_22E09ACD4();
}

unint64_t sub_22E09ACD4()
{
  uint64_t v2 = qword_2685C3860;
  if (!qword_2685C3860)
  {
    type metadata accessor for OpenSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3860);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09AD58()
{
  return sub_22E09AD70();
}

unint64_t sub_22E09AD70()
{
  uint64_t v2 = qword_2685C3868;
  if (!qword_2685C3868)
  {
    type metadata accessor for OpenSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3868);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09ADF4(uint64_t a1)
{
  unint64_t result = sub_22E09ACD4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22E09AE20()
{
  return sub_22E09A1E4();
}

unint64_t sub_22E09AE38()
{
  return sub_22E09AE50();
}

unint64_t sub_22E09AE50()
{
  uint64_t v2 = qword_2685C3870;
  if (!qword_2685C3870)
  {
    type metadata accessor for OpenSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3870);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_22E09AED4()
{
  if (qword_2685BF700 != -1) {
    swift_once();
  }
  return &qword_2685D7C90;
}

uint64_t sub_22E09AF38()
{
  type metadata accessor for GetAXColorFiltersGreenRedHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7C90 = result;
  return result;
}

uint64_t type metadata accessor for GetAXColorFiltersGreenRedHandler()
{
  return self;
}

void sub_22E09AFA0(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  uint64_t v5 = sub_22DF08018();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  id v7 = a1;
  swift_retain();
  swift_retain();
  id v18 = a1;
  uint64_t v19 = v3;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E09B3AC, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);

  swift_release();
  swift_release();
}

void sub_22E09B174(void *a1, uint64_t a2, void (*a3)(id))
{
  id v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  BOOL v15 = sub_22DE6D3D4();
  swift_release();
  if (v15) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  id v11 = sub_22DF962A0(v14, 0, 0, v12, 0, 0);

  sub_22E0F7990();
  id v10 = (id)*sub_22DF136D8();
  id v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v9 = v4;
  id v5 = v11;
  sub_22DE10250();
  sub_22DE10320();
  uint64_t v7 = sub_22E0F75A0();
  uint64_t v8 = v6;
  v9[3] = MEMORY[0x263F8D310];
  void v9[4] = sub_22DE103A4();
  *uint64_t v9 = v7;
  v9[1] = v8;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();
}

void sub_22E09B3AC()
{
  sub_22E09B174(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E09B3E0(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *sub_22E09B404()
{
  if (qword_2685BF708 != -1) {
    swift_once();
  }
  return &qword_2685D7C98;
}

uint64_t sub_22E09B468()
{
  type metadata accessor for GetShakeMouseHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7C98 = result;
  return result;
}

uint64_t type metadata accessor for GetShakeMouseHandler()
{
  return self;
}

uint64_t sub_22E09B4D0(uint64_t a1, void (*a2)(id))
{
  sub_22E0F7990();
  id v4 = (id)*sub_22DF136D8();
  id v2 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  sub_22DFE69F0();
  id v6 = sub_22DF963F0();
  swift_bridgeObjectRelease();
  a2(v6);

  return swift_release();
}

uint64_t sub_22E09B5EC(uint64_t a1, void (*a2)(id))
{
  return sub_22E09B4D0(a1, a2);
}

uint64_t *sub_22E09B610()
{
  if (qword_2685BF710 != -1) {
    swift_once();
  }
  return &qword_2685D7CA0;
}

uint64_t *sub_22E09B674()
{
  if (qword_2685BF718 != -1) {
    swift_once();
  }
  return &qword_2685D7CB0;
}

void *sub_22E09B6D8()
{
  return &unk_22E1050E8;
}

void *sub_22E09B6E4()
{
  return &unk_22E1050E0;
}

uint64_t sub_22E09B6F0()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7CA0 = result;
  qword_2685D7CA8 = v1;
  return result;
}

uint64_t sub_22E09B734()
{
  type metadata accessor for GetFocusModeHandler();
  uint64_t v2 = sub_22DE0F78C();
  uint64_t v0 = sub_22E075C78();
  uint64_t result = sub_22E09B7B4(v2, 1, v0);
  qword_2685D7CB0 = result;
  return result;
}

uint64_t type metadata accessor for GetFocusModeHandler()
{
  return self;
}

uint64_t sub_22E09B7B4(uint64_t a1, char a2, uint64_t a3)
{
  return sub_22E09B814(a1, a2 & 1, a3);
}

uint64_t sub_22E09B814(uint64_t a1, char a2, uint64_t a3)
{
  swift_retain();
  *(void *)(v3 + 24) = a1;
  *(unsigned char *)(v3 + 16) = a2 & 1;
  swift_retain();
  *(void *)(v3 + 32) = a3;
  swift_release();
  swift_release();
  return v8;
}

void sub_22E09B8B8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22E0F7990();
  id v4 = (id)*sub_22DF136D8();
  id v3 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22E09B990(a1, a2, a3);
}

void sub_22E09B990(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  sub_22E0F7990();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  id v5 = sub_22DF09174();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 16);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E09BC68, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

uint64_t sub_22E09BB68(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_retain();
  swift_retain();
  id v4 = a2;
  swift_retain();
  id v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a2;
  v10[5] = a1;
  sub_22DE76CB4(a2, (void (*)(void, void))sub_22E09CFA8, (uint64_t)v10);
  swift_release();
  return swift_release();
}

uint64_t sub_22E09BC68()
{
  return sub_22E09BB68(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_22E09BC9C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, void *a5)
{
  if (a2 == -1)
  {
    uint64_t v24 = (void *)*sub_22DF136D8();
    id v5 = v24;
    sub_22E0F79A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    swift_retain();
    id v25 = sub_22DF96254(4);
    a3();

    return swift_release();
  }
  else if (a2 == 100)
  {
    id v23 = objc_msgSend(a5, sel_settingMetadata);
    if (v23)
    {
      id v20 = objc_msgSend(v23, sel_settingId);
      sub_22E0F7550();
      uint64_t v21 = v7;

      uint64_t v22 = v21;
    }
    else
    {
      uint64_t v22 = 0;
    }
    sub_22DE0D044();
    if (v22)
    {
      swift_retain();
      uint64_t v19 = sub_22E0E2858();
      swift_release();
      if (v19)
      {
        sub_22E09B610();
        swift_bridgeObjectRetain();
        id v18 = (id)sub_22E0F7540();
        swift_bridgeObjectRelease();
        objc_msgSend(v19, sel_setBool_forKey_, 1, v18);
      }
    }
    id v16 = (id)*sub_22DF136D8();
    id v8 = v16;
    sub_22E0F7990();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v17 = sub_22DF963F0();
    swift_bridgeObjectRelease();
    ((void (*)(id))a3)(v17);

    return swift_release();
  }
  else
  {
    id v15 = objc_msgSend(a5, sel_settingMetadata);
    if (v15)
    {
      id v12 = objc_msgSend(v15, sel_settingId);
      sub_22E0F7550();
      uint64_t v13 = v9;

      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = 0;
    }
    sub_22DE0D044();
    if (v14)
    {
      swift_retain();
      id v11 = sub_22E0E2858();
      swift_release();
      if (v11)
      {
        sub_22E09B610();
        swift_bridgeObjectRetain();
        id v10 = (id)sub_22E0F7540();
        swift_bridgeObjectRelease();
        objc_msgSend(v11, sel_setBool_forKey_, 0, v10);
      }
    }
    swift_retain();
    ((void (*)(uint64_t))a3)(a1);
    return swift_release();
  }
}

uint64_t sub_22E09C250(uint64_t a1)
{
  v2[12] = v1;
  v2[11] = a1;
  v2[8] = v2;
  v2[9] = 0;
  v2[10] = 0;
  v2[2] = 0;
  v2[3] = 0;
  v2[9] = a1;
  v2[10] = v1;
  return MEMORY[0x270FA2498](sub_22E09C2A8, 0);
}

uint64_t sub_22E09C2A8()
{
  uint64_t v12 = v0[12];
  v0[8] = v0;
  id v7 = (id)*sub_22DF136D8();
  id v1 = v7;
  sub_22E0F7990();
  v0[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  uint64_t v2 = sub_22DF09174();
  uint64_t v10 = *v2;
  uint64_t v8 = v2[1];
  unsigned int v9 = *((unsigned __int8 *)v2 + 16);
  id v11 = (void *)*sub_22DF136D8();
  id v3 = v11;
  sub_22DF070B8(v10, v8, v9, (uint64_t)v11, *(unsigned char *)(v12 + 16) & 1);

  v0[14] = *(void *)(v12 + 24);
  swift_retain();
  id v4 = (void *)swift_task_alloc();
  v13[15] = v4;
  *id v4 = v13[8];
  v4[1] = sub_22E09C450;
  uint64_t v5 = v13[11];
  return sub_22DE78880(v5);
}

uint64_t sub_22E09C450(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)*v2;
  v4[8] = *v2;
  v4[16] = a1;
  v4[17] = a2;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22E09C590, 0);
}

uint64_t sub_22E09C590()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[16];
  v0[8] = v0;
  v0[2] = v2;
  v0[3] = v1;
  if (v1 == -1)
  {
    uint64_t v49 = *(void **)(v52 + 128);
    uint64_t v44 = (void *)*sub_22DF136D8();
    id v3 = v44;
    sub_22E0F79A0();
    sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    id v4 = sub_22DF09174();
    uint64_t v47 = *v4;
    uint64_t v45 = v4[1];
    unsigned int v46 = *((unsigned __int8 *)v4 + 16);
    uint64_t v48 = (void *)*sub_22DF136D8();
    id v5 = v48;
    sub_22DF072EC(v47, v45, v46, v48);

    id v50 = sub_22DF96254(4);
    id v51 = v50;
  }
  else if (*(void *)(v52 + 136) == 100)
  {
    id v43 = objc_msgSend(*(id *)(v52 + 88), sel_settingMetadata);
    if (v43)
    {
      id v38 = objc_msgSend(v43, sel_settingId);
      uint64_t v39 = sub_22E0F7550();
      uint64_t v40 = v6;

      uint64_t v41 = v39;
      uint64_t v42 = v40;
    }
    else
    {
      uint64_t v41 = 0;
      uint64_t v42 = 0;
    }
    *(void *)(v52 + 48) = v41;
    *(void *)(v52 + 56) = v42;
    if (*(void *)(v52 + 56))
    {
      sub_22DE0D044();
      swift_retain();
      uint64_t v37 = sub_22E0E2858();
      swift_release();
      if (v37)
      {
        sub_22E09B610();
        swift_bridgeObjectRetain();
        id v36 = (id)sub_22E0F7540();
        swift_bridgeObjectRelease();
        objc_msgSend(v37, sel_setBool_forKey_, 1, v36);
      }
    }
    else
    {
      sub_22DE0D044();
    }
    id v34 = *(id *)(v52 + 128);
    id v29 = (id)*sub_22DF136D8();
    id v7 = v29;
    sub_22E0F7990();
    sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    uint64_t v8 = sub_22DF09174();
    uint64_t v32 = *v8;
    uint64_t v30 = v8[1];
    unsigned int v31 = *((unsigned __int8 *)v8 + 16);
    id v33 = (id)*sub_22DF136D8();
    id v9 = v33;
    sub_22DF072EC(v32, v30, v31, v33);

    sub_22DFE69F0();
    id v35 = sub_22DF963F0();
    swift_bridgeObjectRelease();

    id v51 = v35;
  }
  else
  {
    id v28 = objc_msgSend(*(id *)(v52 + 88), sel_settingMetadata);
    if (v28)
    {
      id v23 = objc_msgSend(v28, sel_settingId);
      uint64_t v24 = sub_22E0F7550();
      uint64_t v25 = v10;

      uint64_t v26 = v24;
      uint64_t v27 = v25;
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    *(void *)(v52 + 32) = v26;
    *(void *)(v52 + 40) = v27;
    if (*(void *)(v52 + 40))
    {
      sub_22DE0D044();
      swift_retain();
      uint64_t v22 = sub_22E0E2858();
      swift_release();
      if (v22)
      {
        sub_22E09B610();
        swift_bridgeObjectRetain();
        id v21 = (id)sub_22E0F7540();
        swift_bridgeObjectRelease();
        objc_msgSend(v22, sel_setBool_forKey_, 0, v21);
      }
    }
    else
    {
      sub_22DE0D044();
    }
    id v20 = *(id *)(v52 + 128);
    id v11 = sub_22DF09174();
    uint64_t v18 = *v11;
    uint64_t v16 = v11[1];
    unsigned int v17 = *((unsigned __int8 *)v11 + 16);
    id v19 = (id)*sub_22DF136D8();
    id v12 = v19;
    sub_22DF072EC(v18, v16, v17, v19);

    id v13 = v20;
    id v51 = *(id *)(v52 + 128);
  }
  uint64_t v14 = *(uint64_t (**)(id))(*(void *)(v52 + 64) + 8);
  return v14(v51);
}

uint64_t sub_22E09CDD8()
{
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22E09CE18()
{
  return swift_deallocClassInstance();
}

void sub_22E09CE58(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_22E09CE7C(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E09CEA0(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22DED20F8;
  return sub_22E09C250(a1);
}

uint64_t sub_22E09CF58()
{
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E09CFA8(uint64_t a1, uint64_t a2)
{
  return sub_22E09BC9C(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t *sub_22E09CFBC()
{
  if (qword_2685BF720 != -1) {
    swift_once();
  }
  return &qword_2685D7CB8;
}

uint64_t sub_22E09D020()
{
  type metadata accessor for GetLocationServicesHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7CB8 = result;
  return result;
}

uint64_t type metadata accessor for GetLocationServicesHandler()
{
  return self;
}

void sub_22E09D088(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v5 = sub_22DF0891C();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  id v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E09D52C, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22E09D258(uint64_t a1, void *a2, void (*a3)(id))
{
  swift_retain();
  char v18 = sub_22DE65BBC();
  swift_release();
  sub_22DE10250();
  id v15 = sub_22DE07498(3, 0);
  sub_22DE102B8();
  sub_22E0F7E50();
  unsigned int v17 = v3;
  id v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  *unsigned int v17 = sub_22DF961EC(v19, 0, 0, v13, 0, 0);
  sub_22DE04404();
  id v8 = (id)sub_22E0F7700();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_22E0F7990();
  id v12 = (id)*sub_22DF136D8();
  id v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  id v11 = v5;
  id v6 = v15;
  sub_22DE10320();
  uint64_t v9 = sub_22E0F75A0();
  uint64_t v10 = v7;
  void v11[3] = MEMORY[0x263F8D310];
  v11[4] = sub_22DE103A4();
  *id v11 = v9;
  v11[1] = v10;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();
}

void sub_22E09D52C()
{
  sub_22E09D258(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E09D560(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E09D584()
{
  type metadata accessor for SetShakeMouseHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7CC0 = result;
  return result;
}

uint64_t type metadata accessor for SetShakeMouseHandler()
{
  return self;
}

uint64_t *sub_22E09D5EC()
{
  if (qword_2685BF728 != -1) {
    swift_once();
  }
  return &qword_2685D7CC0;
}

uint64_t sub_22E09D650(uint64_t a1, void (*a2)(id))
{
  sub_22E0F7990();
  id v4 = (id)*sub_22DF136D8();
  id v2 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  sub_22DFE69F0();
  id v6 = sub_22DEF8130();
  swift_bridgeObjectRelease();
  a2(v6);

  return swift_release();
}

uint64_t sub_22E09D784(uint64_t a1, void (*a2)(id))
{
  return sub_22E09D650(a1, a2);
}

uint64_t sub_22E09D7A8()
{
  return sub_22E0F7590();
}

uint64_t sub_22E09D7CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
  sub_22E0F7E50();
  id v6 = v0;
  id v7 = (id)*MEMORY[0x263F08320];
  id v1 = (id)*MEMORY[0x263F08320];
  *id v6 = sub_22E0F7550();
  v6[1] = v2;
  uint64_t v3 = sub_22E09D7A8();
  v6[5] = MEMORY[0x263F8D310];
  v6[2] = v3;
  v6[3] = v4;
  sub_22DE04404();

  return sub_22E0F74D0();
}

uint64_t sub_22E09D89C()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E09D8D4()
{
  uint64_t v2 = qword_2685C3888;
  if (!qword_2685C3888)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3888);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09D954()
{
  return sub_22E09D89C();
}

uint64_t sub_22E09D96C()
{
  return sub_22E0F7EE0();
}

unint64_t sub_22E09D99C()
{
  uint64_t v2 = qword_2685C3890;
  if (!qword_2685C3890)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3890);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09DA1C()
{
  return sub_22E0F7ED0();
}

uint64_t sub_22E09DA4C()
{
  return sub_22E09D7CC();
}

uint64_t sub_22E09DA64()
{
  return sub_22E0F7590();
}

uint64_t sub_22E09DA88()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
  sub_22E0F7E50();
  id v6 = v0;
  id v7 = (id)*MEMORY[0x263F08320];
  id v1 = (id)*MEMORY[0x263F08320];
  *id v6 = sub_22E0F7550();
  v6[1] = v2;
  uint64_t v3 = sub_22E09DA64();
  v6[5] = MEMORY[0x263F8D310];
  v6[2] = v3;
  v6[3] = v4;
  sub_22DE04404();

  return sub_22E0F74D0();
}

uint64_t sub_22E09DB58()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E09DB90()
{
  uint64_t v2 = qword_2685C3898;
  if (!qword_2685C3898)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3898);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09DC10()
{
  return sub_22E09DB58();
}

uint64_t sub_22E09DC28()
{
  return sub_22E0F7EE0();
}

unint64_t sub_22E09DC58()
{
  uint64_t v2 = qword_2685C38A0;
  if (!qword_2685C38A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09DCD8()
{
  return sub_22E0F7ED0();
}

uint64_t sub_22E09DD08()
{
  return sub_22E09DA88();
}

void *type metadata accessor for PatternExecutionResultError()
{
  return &unk_26E1E0238;
}

void *type metadata accessor for RF2ExecutionError()
{
  return &unk_26E1E02C8;
}

unint64_t sub_22E09DD48()
{
  return sub_22DE59160();
}

unint64_t sub_22E09DD60()
{
  return sub_22E09DD78();
}

unint64_t sub_22E09DD78()
{
  uint64_t v2 = qword_2685C38A8;
  if (!qword_2685C38A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09DDF8()
{
  return sub_22DE58EAC();
}

unint64_t sub_22E09DE10()
{
  return sub_22E09DE28();
}

unint64_t sub_22E09DE28()
{
  uint64_t v2 = qword_2685C38B0;
  if (!qword_2685C38B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38B0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09DEA8(uint64_t a1, uint64_t a2, void *a3)
{
  sub_22DFA3484();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
  sub_22E0F7E50();
  id v11 = v3;
  *uint64_t v3 = sub_22DFA3510();
  v11[1] = v4;
  swift_bridgeObjectRetain();
  v11[5] = MEMORY[0x263F8D310];
  v11[2] = a1;
  void v11[3] = a2;
  v11[6] = sub_22DFA3510();
  v11[7] = v5;
  id v6 = a3;
  v11[11] = sub_22DE63C04();
  v11[8] = (uint64_t)a3;
  sub_22DE04404();
  sub_22E0F74D0();
  return sub_22E0F6370();
}

uint64_t sub_22E09DFF0()
{
  sub_22DE5E1E4();
  sub_22DF13804();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  uint64_t result = sub_22E0F7A80();
  qword_2685C38B8 = result;
  return result;
}

uint64_t *sub_22E09E070()
{
  if (qword_2685BF730 != -1) {
    swift_once();
  }
  return &qword_2685C38B8;
}

uint64_t sub_22E09E0D4()
{
  sub_22E0F7610();
  uint64_t v0 = sub_22DE5AC94();
  uint64_t result = sub_22E092EBC(v0);
  qword_2685D7CC8 = result;
  qword_2685D7CD0 = v2;
  qword_2685D7CD8 = v3;
  qword_2685D7CE0 = v4;
  return result;
}

uint64_t *sub_22E09E140()
{
  if (qword_2685BF738 != -1) {
    swift_once();
  }
  return &qword_2685D7CC8;
}

uint64_t sub_22E09E1A4()
{
  id v1 = sub_22E09E140();
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_22E09E228()
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v3 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v2 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_22E09E3C8()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E09E424()
{
  uint64_t v2 = qword_2685C38C0;
  if (!qword_2685C38C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38C0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09E4A4()
{
  return sub_22E0F7610();
}

uint64_t sub_22E09E530()
{
  return sub_22E09E3C8();
}

uint64_t sub_22E09E550()
{
  return sub_22E09E4A4();
}

uint64_t sub_22E09E570@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E09E228();
  *a1 = result;
  return result;
}

uint64_t sub_22E09E59C()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E09E5CC()
{
  uint64_t v2 = qword_2685C38C8;
  if (!qword_2685C38C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09E64C()
{
  return sub_22E0F7F90();
}

uint64_t sub_22E09E67C(uint64_t a1)
{
  uint64_t v11 = a1;
  id v28 = 0;
  uint64_t v27 = 0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3908);
  uint64_t v12 = *(void *)(v22 - 8);
  uint64_t v13 = v22 - 8;
  unint64_t v14 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11, v2, v3, v4);
  unsigned int v17 = (char *)v9 - v14;
  id v28 = v5;
  uint64_t v27 = v1;
  uint64_t v15 = v5[3];
  uint64_t v16 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v15);
  sub_22E09E5CC();
  sub_22E0F7F70();
  uint64_t v6 = v19;
  uint64_t v20 = v18[2];
  uint64_t v21 = v18[3];
  swift_bridgeObjectRetain();
  char v26 = 0;
  sub_22E0F7DC0();
  uint64_t v23 = v6;
  uint64_t v24 = v6;
  if (v6)
  {
    v9[1] = v24;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v22);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v23;
    v9[3] = v18[4];
    void v9[4] = v18[5];
    swift_bridgeObjectRetain();
    char v25 = 1;
    sub_22E0F7DC0();
    v9[5] = v7;
    uint64_t v10 = v7;
    if (v7) {
      v9[0] = v10;
    }
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v22);
  }
}

uint64_t sub_22E09E900(uint64_t a1)
{
  swift_allocObject();
  uint64_t v5 = sub_22E09E990(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t sub_22E09E990(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3900);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = v28 - 8;
  unint64_t v31 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v27, v2, v3, v4);
  uint64_t v32 = (char *)v18 - v31;
  uint64_t v41 = v5;
  uint64_t v40 = v1;
  char v42 = 0;
  uint64_t v34 = v5[3];
  uint64_t v35 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v34);
  sub_22E09E5CC();
  uint64_t v6 = v33;
  sub_22E0F7F60();
  uint64_t v36 = v6;
  uint64_t v37 = v6;
  if (v6)
  {
    v18[7] = v37;
    v18[4] = v37;
    if ((v42 & 3) == 3)
    {
      swift_release();
    }
    else
    {
      if (v42) {
        sub_22DE0D044();
      }
      v18[3] = v26;
      v18[2] = v26;
      type metadata accessor for UndoNumericSetting();
      swift_deallocPartialClassInstance();
    }
    __swift_destroy_boxed_opaque_existential_0(v27);
    return v18[1];
  }
  else
  {
    char v39 = 0;
    uint64_t v7 = sub_22E0F7D30();
    uint64_t v22 = 0;
    uint64_t v23 = v7;
    uint64_t v24 = v8;
    uint64_t v25 = 0;
    uint64_t v9 = v26;
    char v42 = 1;
    *(void *)(v26 + 16) = v7;
    *(void *)(v9 + 24) = v8;
    char v38 = 1;
    uint64_t v10 = sub_22E0F7D30();
    void v18[8] = 0;
    uint64_t v19 = v10;
    uint64_t v20 = v11;
    uint64_t v21 = 0;
    uint64_t v12 = v26;
    uint64_t v13 = v28;
    unint64_t v14 = v32;
    uint64_t v15 = v29;
    uint64_t v16 = v20;
    char v42 = 3;
    *(void *)(v26 + 32) = v19;
    *(void *)(v12 + 40) = v16;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v14, v13);
    __swift_destroy_boxed_opaque_existential_0(v27);
    return v26;
  }
}

uint64_t sub_22E09ECD4()
{
  return sub_22E09E1A4();
}

uint64_t sub_22E09ECEC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22E09E900(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_22E09ED4C(uint64_t a1)
{
  return sub_22E09E67C(a1);
}

uint64_t type metadata accessor for UndoNumericSetting()
{
  return self;
}

void *type metadata accessor for UndoNumericSetting.CodingKeys()
{
  return &unk_26E1E0358;
}

unint64_t sub_22E09EDE4()
{
  return sub_22E09EDFC();
}

unint64_t sub_22E09EDFC()
{
  uint64_t v2 = qword_2685C38D0;
  if (!qword_2685C38D0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09EE7C()
{
  return sub_22E09EE94();
}

unint64_t sub_22E09EE94()
{
  uint64_t v2 = qword_2685C38D8;
  if (!qword_2685C38D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09EF14()
{
  return sub_22E09EF2C();
}

unint64_t sub_22E09EF2C()
{
  uint64_t v2 = qword_2685C38E0;
  if (!qword_2685C38E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09EFAC(void *a1)
{
  a1[1] = sub_22E09EFF0();
  a1[2] = sub_22E09F074();
  unint64_t result = sub_22E09F0F8();
  a1[3] = result;
  return result;
}

unint64_t sub_22E09EFF0()
{
  uint64_t v2 = qword_2685C38E8;
  if (!qword_2685C38E8)
  {
    type metadata accessor for UndoNumericSetting();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09F074()
{
  uint64_t v2 = qword_2685C38F0;
  if (!qword_2685C38F0)
  {
    type metadata accessor for UndoNumericSetting();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09F0F8()
{
  uint64_t v2 = qword_2685C38F8;
  if (!qword_2685C38F8)
  {
    type metadata accessor for UndoNumericSetting();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C38F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E09F17C()
{
  uint64_t v1 = *sub_22DE869D4();
  swift_retain();
  return v1;
}

uint64_t sub_22E09F1AC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v31 = a1;
  uint64_t v56 = 0;
  uint64_t v55 = 0;
  uint64_t v54 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v46 = 0;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3910);
  uint64_t v35 = *(void *)(v38 - 8);
  uint64_t v36 = v38 - 8;
  unint64_t v22 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v38, v2, v3, v4);
  uint64_t v37 = (char *)&v21 - v22;
  uint64_t v56 = (char *)&v21 - v22;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3918);
  uint64_t v40 = *(void *)(v43 - 8);
  uint64_t v41 = v43 - 8;
  unint64_t v23 = (*(void *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v31, v5, v6, v7);
  uint64_t v27 = (char *)&v21 - v23;
  unint64_t v24 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9, (char *)&v21 - v23, v10, v11);
  char v42 = (char *)&v21 - v24;
  uint64_t v55 = (char *)&v21 - v24;
  uint64_t v54 = v12;
  uint64_t v45 = &v53;
  sub_22E0F63C0();
  uint64_t v44 = &v52;
  sub_22E0F5F20();
  uint64_t v26 = v51;
  sub_22DE1268C((uint64_t)v45, (uint64_t)v51);
  uint64_t v25 = v50;
  sub_22DE1268C((uint64_t)v44, (uint64_t)v50);
  uint64_t v13 = sub_22DE85508();
  sub_22E09F5F8(v26, (uint64_t)v25, v13, v42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3920);
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v27, v42, v43);
  uint64_t v39 = sub_22E0F5DB0();
  uint64_t v49 = v39;
  uint64_t v30 = 0;
  uint64_t SettingFlowStrategy = type metadata accessor for GetSettingFlowStrategy();
  uint64_t v14 = sub_22DE0D464();
  uint64_t v29 = &v48;
  uint64_t v48 = v14;
  swift_retain();
  sub_22E09FE38();
  sub_22E0F6040();
  sub_22E0F7290();
  sub_22E0F7610();
  uint64_t v34 = sub_22E0F7270();
  uint64_t v47 = v34;
  uint64_t v33 = sub_22E0F6030();
  uint64_t v46 = v33;
  swift_retain();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3930);
  v32[3] = v15;
  unint64_t v16 = sub_22E09FEBC();
  unsigned int v17 = v32;
  unint64_t v18 = v16;
  uint64_t v19 = v33;
  v32[4] = v18;
  *unsigned int v17 = v19;
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v38);
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v43);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
}

uint64_t sub_22E09F5F8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v98 = a4;
  uint64_t v103 = a1;
  uint64_t v102 = a2;
  uint64_t v101 = a3;
  uint64_t v127 = 0;
  uint64_t v126 = 0;
  uint64_t v125 = 0;
  uint64_t v124 = 0;
  uint64_t v118 = 0;
  uint64_t v91 = 0;
  unint64_t v34 = (*(void *)(*(void *)(sub_22E0F7260() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v4, v5, v6);
  uint64_t v67 = (char *)&v33 - v34;
  uint64_t v44 = sub_22E0F5A40();
  uint64_t v41 = *(void *)(v44 - 8);
  uint64_t v42 = v44 - 8;
  unint64_t v35 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v44, v7, v8, v9);
  uint64_t v43 = (char *)&v33 - v35;
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3918);
  uint64_t v76 = *(void *)(v105 - 8);
  uint64_t v77 = v105 - 8;
  uint64_t v37 = *(void *)(v76 + 64);
  unint64_t v36 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v91, v102, v101, v10);
  int v88 = (char *)&v33 - v36;
  unint64_t v38 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11, v12, v13, (char *)&v33 - v36);
  uint64_t v104 = (char *)&v33 - v38;
  uint64_t v127 = (char *)&v33 - v38;
  uint64_t v126 = v14;
  uint64_t v125 = v15;
  uint64_t v124 = v16;
  unint64_t v92 = sub_22DE5E790();
  unint64_t v93 = sub_22DE10250();
  sub_22E0F5DA0();
  (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v104, v88, v105);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0690);
  int v49 = 1;
  uint64_t v68 = sub_22E0F7610();
  uint64_t v61 = v17;
  uint64_t v40 = v103[3];
  uint64_t v39 = v103[4];
  __swift_project_boxed_opaque_existential_1(v103, v40);
  sub_22E0F5F40();
  uint64_t v45 = sub_22E0F5A20();
  uint64_t v46 = v18;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v44);
  uint64_t v54 = v123;
  v123[0] = v45;
  v123[1] = v46;
  uint64_t v47 = 1;
  uint64_t v19 = sub_22E0F7610();
  char v53 = v122;
  v122[0] = v19;
  v122[1] = v20;
  uint64_t v21 = sub_22E0F7610();
  char v52 = v121;
  v121[0] = v21;
  v121[1] = v22;
  unint64_t v48 = sub_22DE86214();
  uint64_t v50 = MEMORY[0x263F8D310];
  sub_22DE861F8();
  uint64_t v62 = sub_22E0F7AF0();
  uint64_t v63 = v23;
  sub_22DE0D044();
  sub_22DE0D044();
  sub_22DE0D044();
  uint64_t v64 = v120;
  sub_22DE1268C(v102, (uint64_t)v120);
  uint64_t v65 = v119;
  sub_22DE1268C((uint64_t)v103, (uint64_t)v119);
  uint64_t v66 = sub_22DE86290();
  sub_22DE862EC();
  uint64_t v55 = sub_22DE8642C();
  uint64_t v56 = sub_22DE8634C();
  uint64_t v57 = sub_22DE86384();
  uint64_t v58 = sub_22DE86464();
  uint64_t v59 = sub_22DE863F4();
  uint64_t v60 = sub_22DE8649C();
  unint64_t v24 = sub_22DE864D4();
  uint64_t v97 = sub_22E04607C(v68, v61, v62, v63, (uint64_t)v64, (uint64_t)v65, v66, v67, v55, v56, v57, v58, v59, v60, v24);
  uint64_t v118 = v97;
  uint64_t v100 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  uint64_t v99 = v76 + 16;
  v100(v88, v104, v105);
  uint64_t SettingIntentStrategy = type metadata accessor for ConfirmGetSettingIntentStrategy();
  id v69 = v117;
  sub_22DE1268C((uint64_t)v103, (uint64_t)v117);
  uint64_t v70 = v116;
  sub_22DE1268C(v102, (uint64_t)v116);
  swift_retain();
  uint64_t v71 = sub_22E09F17C();
  id v72 = v115;
  sub_22DE8653C((uint64_t)v115);
  uint64_t v73 = v114;
  sub_22DE8657C(v114);
  uint64_t v25 = sub_22DED6058((uint64_t)v69, (uint64_t)v70, v71, v97, (uint64_t)v72, (uint64_t)v73);
  uint64_t v75 = &v113;
  uint64_t v113 = v25;
  unint64_t v26 = sub_22E09FF40();
  uint64_t v78 = sub_22DE88F58((uint64_t)v75, v101, v105, SettingIntentStrategy, v26);
  uint64_t v79 = v27;
  swift_release();
  uint64_t v107 = *(void (**)(char *, uint64_t))(v76 + 8);
  uint64_t v106 = v76 + 8;
  v107(v88, v105);
  sub_22E0F5D90();
  v100(v88, v104, v105);
  uint64_t SettingHandleIntentFlowStrategy = type metadata accessor for GetSettingHandleIntentFlowStrategy();
  uint64_t v85 = v112;
  sub_22DE1268C((uint64_t)v103, (uint64_t)v112);
  uint64_t v80 = v111;
  sub_22DE1268C(v102, (uint64_t)v111);
  swift_retain();
  uint64_t v81 = sub_22DE86058();
  uint64_t v82 = sub_22DE8675C();
  id v83 = v110;
  sub_22DE8653C((uint64_t)v110);
  BOOL v84 = v109;
  sub_22DE8657C(v109);
  uint64_t v28 = sub_22E09F17C();
  uint64_t v29 = sub_22DE5E43C((uint64_t)v85, (uint64_t)v80, v81, v82, v97, (uint64_t)v83, (uint64_t)v84, v28);
  id v87 = &v108;
  uint64_t v108 = v29;
  sub_22E09FFC4();
  uint64_t v89 = sub_22DE8678C();
  uint64_t v90 = v30;
  swift_release();
  v107(v88, v105);
  sub_22E0F5D70();
  sub_22E0F7290();
  uint64_t v94 = sub_22E0F7270();
  uint64_t v95 = sub_22E0F5D50();
  uint64_t v96 = v31;
  swift_release();
  sub_22E0F5D80();
  swift_release();
  v100(v98, v104, v105);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v102);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v103);
  return ((uint64_t (*)(char *, uint64_t))v107)(v104, v105);
}

unint64_t sub_22E09FE38()
{
  uint64_t v2 = qword_2685C3928;
  if (!qword_2685C3928)
  {
    type metadata accessor for GetSettingFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3928);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09FEBC()
{
  uint64_t v2 = qword_2685C3938;
  if (!qword_2685C3938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2685C3930);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3938);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09FF40()
{
  uint64_t v2 = qword_2685C3940;
  if (!qword_2685C3940)
  {
    type metadata accessor for ConfirmGetSettingIntentStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3940);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E09FFC4()
{
  uint64_t v2 = qword_2685C3948;
  if (!qword_2685C3948)
  {
    type metadata accessor for GetSettingHandleIntentFlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3948);
    return WitnessTable;
  }
  return v2;
}

void *type metadata accessor for GetSetting()
{
  return &unk_26E1E03A0;
}

BOOL sub_22E0A005C()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "OpenSettingIntent#OpenSettingSpokenOnly";
  *(void *)(v0 + 8) = 39;
  *(unsigned char *)(v0 + 16) = 2;
  sub_22DE04404();
  uint64_t v2 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 != 0;
}

uint64_t sub_22E0A0140()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0A0174()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A01C0()
{
  uint64_t v2 = qword_2685C3950;
  if (!qword_2685C3950)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3950);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A0240()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A0280()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A02C8()
{
  return sub_22E0F76D0();
}

BOOL sub_22E0A0310@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_22E0A005C();
  *a1 = result;
  return result;
}

uint64_t sub_22E0A0350@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0A0140();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0A0380(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsSetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t sub_22E0A0490(uint64_t a1, uint64_t a2)
{
  v3[9] = v2;
  v3[8] = a2;
  v3[7] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  v3[6] = 0;
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_22E0A04F4, 0);
}

uint64_t sub_22E0A04F4()
{
  uint64_t v4 = (void (*)(void *))v0[7];
  v0[4] = v0;
  v0[6] = sub_22DE8F97C();
  v4(v0 + 6);
  uint64_t v10 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[10] = v1;
  uint64_t v5 = v0[6];
  swift_retain();
  uint64_t v8 = sub_22E0A0380(v5);
  v0[11] = v8;
  swift_release();
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v6 + 96) = v2;
  *uint64_t v2 = *(void *)(v6 + 32);
  v2[1] = sub_22DE9BDC8;
  return v9(v10, v7, v8);
}

uint64_t sub_22E0A0640(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0A069C(a1, a2, a3);
}

uint64_t sub_22E0A069C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7010();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0A0868(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E0A0490(a1, a2);
}

void *type metadata accessor for OpenSettingIntentCATPatternsIdentifiers()
{
  return &unk_26E1E0430;
}

void *type metadata accessor for OpenSettingIntentOpenSettingSpokenOnlyParameters()
{
  return &unk_26E1E04A8;
}

uint64_t sub_22E0A0950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_22DED20F8;
  return v11(a1, a2, a3, a4);
}

uint64_t type metadata accessor for OpenSettingIntentCATPatternsExecutor()
{
  uint64_t v1 = qword_2685C3970;
  if (!qword_2685C3970) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0A0AEC()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0A0B60()
{
  return type metadata accessor for OpenSettingIntentCATPatternsExecutor();
}

unint64_t sub_22E0A0B7C()
{
  return sub_22E0A0B94();
}

unint64_t sub_22E0A0B94()
{
  uint64_t v2 = qword_2685C3980;
  if (!qword_2685C3980)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3980);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_22E0A0C14()
{
  if (qword_26AF39790 != -1) {
    swift_once();
  }
  return &qword_26AF397A0;
}

uint64_t sub_22E0A0C78()
{
  type metadata accessor for AppearanceUtils();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE8B61C(v0);
  qword_26AF397A0 = result;
  return result;
}

uint64_t type metadata accessor for AppearanceUtils()
{
  return self;
}

uint64_t static AppearanceUtils.shared.getter()
{
  uint64_t v1 = *sub_22E0A0C14();
  swift_retain();
  return v1;
}

uint64_t sub_22E0A0D10()
{
  uint64_t result = sub_22E0A0D64(0, 0);
  word_2685D7CF8 = result & 0x101;
  return result;
}

uint64_t sub_22E0A0D64(char a1, char a2)
{
  LOBYTE(v3) = a1 & 1;
  HIBYTE(v3) = a2 & 1;
  return v3;
}

__int16 *sub_22E0A0D88()
{
  if (qword_2685BF748 != -1) {
    swift_once();
  }
  return &word_2685D7CF8;
}

uint64_t sub_22E0A0DEC()
{
  uint64_t result = sub_22E0A0D64(1, 1);
  word_26AF39F80 = result & 0x101;
  return result;
}

__int16 *sub_22E0A0E44()
{
  if (qword_26AF39780 != -1) {
    swift_once();
  }
  return &word_26AF39F80;
}

BOOL sub_22E0A0EA8(__int16 a1)
{
  char v5 = a1;
  char v6 = HIBYTE(a1);
  swift_retain();
  char v7 = sub_22DE72224();
  swift_release();
  swift_retain();
  if (v7)
  {
    BOOL v3 = sub_22DE72134(v6 & 1);
    swift_release();
    return v3;
  }
  else
  {
    BOOL v2 = sub_22DE72010(v5 & 1);
    swift_release();
    return v2;
  }
}

uint64_t sub_22E0A0FB8(unsigned __int8 *a1)
{
  int v6 = *a1;
  if (v6 == 64)
  {
    return 2;
  }
  else
  {
    switch(v6)
    {
      case 1u:
        __int16 v7 = *sub_22E0A0E44() & 0x101;
        if (sub_22E0A0EA8(v7)) {
          BOOL v3 = sub_22E0A0E44();
        }
        else {
          BOOL v3 = sub_22E0A0D88();
        }
        return *(unsigned char *)v3 & 1 | ((*((unsigned char *)v3 + 1) & 1) << 8);
      case 2u:
        __int16 v2 = sub_22E0A0D64(0, 0);
        return v2 & 1 | ((HIBYTE(v2) & 1) << 8);
      case 3u:
        __int16 v1 = sub_22E0A0D64(1, 1);
        return v1 & 1 | ((HIBYTE(v1) & 1) << 8);
      default:
        return 2;
    }
  }
}

BOOL sub_22E0A1164()
{
  uint64_t v9 = v0;
  unsigned __int8 v8 = 1;
  char v4 = sub_22E0A0FB8(&v8);
  if (v4 == 2) {
    char v3 = 2;
  }
  else {
    char v3 = v4 & 1;
  }
  char v6 = v3;
  char v7 = 0;
  if (v3 == 2) {
    return v7 == 2;
  }
  sub_22DE58504(&v6, &v5);
  if (v7 == 2) {
    return 0;
  }
  return sub_22DE5CC00(v5 & 1, v7 & 1);
}

uint64_t AppearanceUtils.deinit()
{
  swift_release();
  return v1;
}

uint64_t AppearanceUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for AppearanceUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppearanceUtils.isDarkModeOn()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))() & 1;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_22E0A1368(unsigned __int16 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 65281) >> 16) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = *((unsigned __int8 *)a1 + 2);
    }
    else {
      int v6 = v8 == 2 ? a1[1] : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 16)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *(unsigned __int8 *)a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_22E0A151C(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 65281) >> 16) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    if (v7)
    {
      if (v7 == 1)
      {
        *(unsigned char *)(result + 2) = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 2) = v4;
      }
      else
      {
        *(_DWORD *)(result + 2) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        *(unsigned char *)(result + 2) = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 2) = 0;
      }
      else
      {
        *(_DWORD *)(result + 2) = 0;
      }
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

void *type metadata accessor for AppearanceUtils.Appearance()
{
  return &unk_26E1E0538;
}

uint64_t sub_22E0A1774()
{
  type metadata accessor for SetNightShiftHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D00 = result;
  return result;
}

uint64_t type metadata accessor for SetNightShiftHandler()
{
  return self;
}

uint64_t *sub_22E0A17DC()
{
  if (qword_2685BF758 != -1) {
    swift_once();
  }
  return &qword_2685D7D00;
}

uint64_t sub_22E0A1840(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v53 = 0;
  uint64_t v56 = a1;
  uint64_t v54 = a2;
  uint64_t v55 = a3;
  id v3 = a1;
  char v52 = a1;
  unint64_t v32 = sub_22DE09B30();
  id v33 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  char v34 = v4;

  id v48 = v33;
  char v49 = v34 & 1;
  uint64_t v50 = 1;
  char v51 = 0;
  if (v34 & 1) != 0 || (sub_22DE113DC((uint64_t)&v48, (uint64_t)v35), (v51))
  {
    char v27 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v27 = sub_22E0F7530();
  }
  if (v27) {
    goto LABEL_26;
  }
  id v5 = a1;
  id v47 = a1;
  id v25 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  char v26 = v6;

  id v43 = v25;
  char v44 = v26 & 1;
  uint64_t v45 = 2;
  char v46 = 0;
  if (v26 & 1) != 0 || (sub_22DE113DC((uint64_t)&v43, (uint64_t)v36), (v46))
  {
    char v24 = 0;
  }
  else
  {
    v35[3] = v36[0];
    v35[2] = v45;
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v24 = sub_22E0F7530();
  }
  if (v24) {
    goto LABEL_26;
  }
  id v7 = a1;
  id v42 = a1;
  id v22 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  char v23 = v8;

  id v38 = v22;
  char v39 = v23 & 1;
  uint64_t v40 = 4;
  char v41 = 0;
  if (v23 & 1) != 0 || (sub_22DE113DC((uint64_t)&v38, (uint64_t)&v37), (v41))
  {
    char v21 = 0;
  }
  else
  {
    v36[3] = v37;
    v36[2] = v40;
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v21 = sub_22E0F7530();
  }
  if (v21)
  {
LABEL_26:
    sub_22E0F7990();
    id v13 = (id)*sub_22DF136D8();
    id v11 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    char v14 = sub_22DE64E88();
    swift_release();
    id v12 = sub_22DF0AE20();
    uint64_t v15 = *v12;
    uint64_t v16 = v12[1];
    unsigned int v17 = *((unsigned __int8 *)v12 + 16);
    char v18 = *(unsigned char *)(v30 + 24);
    swift_retain();
    sub_22DEF7BD0(v14 & 1, a1, v15, v16, v17, v18 & 1, a2, a3, (uint64_t)sub_22E0A1E90, v30, 0, 1, 0, 0);
    return sub_22DE0C6FC((uint64_t)sub_22E0A1E90);
  }
  else
  {
    sub_22E0F7990();
    id v19 = (id)*sub_22DF136D8();
    id v9 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v20 = sub_22DEF8130();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v20);

    return swift_release();
  }
}

uint64_t sub_22E0A1E20(char a1)
{
  return swift_release();
}

uint64_t sub_22E0A1E90(char a1)
{
  return sub_22E0A1E20(a1 & 1);
}

uint64_t sub_22E0A1EB8(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0A1840(a1, a2, a3);
}

uint64_t sub_22E0A1EDC()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "GetSettingIntent#DescribeBinarySettingState";
  *(void *)(v0 + 8) = 43;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "GetSettingIntent#DescribeMultiSettingState";
  *(void *)(v0 + 32) = 42;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "GetSettingIntent#DescribeNumericSettingState";
  *(void *)(v0 + 56) = 44;
  *(unsigned char *)(v0 + 64) = 2;
  *(void *)(v0 + 72) = "GetSettingIntent#DescribeNumericSettingStateSpokenOnly";
  *(void *)(v0 + 80) = 54;
  *(unsigned char *)(v0 + 88) = 2;
  *(void *)(v0 + 96) = "GetSettingIntent#HotspotDiscoverabilityPrompt";
  *(void *)(v0 + 104) = 45;
  *(unsigned char *)(v0 + 112) = 2;
  *(void *)(v0 + 120) = "GetSettingIntent#SiriCannotChangeSetting";
  *(void *)(v0 + 128) = 40;
  *(unsigned char *)(v0 + 136) = 2;
  *(void *)(v0 + 144) = "GetSettingIntent#TargetDeviceNotFoundReadBattery";
  *(void *)(v0 + 152) = 48;
  *(unsigned char *)(v0 + 160) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_16;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_16;
    case 3:
      unsigned __int8 v4 = 3;
      goto LABEL_16;
    case 4:
      unsigned __int8 v4 = 4;
      goto LABEL_16;
    case 5:
      unsigned __int8 v4 = 5;
      goto LABEL_16;
    case 6:
      unsigned __int8 v4 = 6;
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  return 7;
}

uint64_t sub_22E0A2168()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0A22FC()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A2348()
{
  uint64_t v2 = qword_2685C3988;
  if (!qword_2685C3988)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3988);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A23C8()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A2408()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A2450()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A2498@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0A1EDC();
  *a1 = result;
  return result;
}

uint64_t sub_22E0A24D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0A2168();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0A2504(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 64) = v4;
  *(void *)(v5 + 56) = a4;
  *(unsigned char *)(v5 + 106) = a3 & 1;
  *(unsigned char *)(v5 + 105) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 104) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = a1;
  *(unsigned char *)(v5 + 104) = a2;
  *(unsigned char *)(v5 + 112) = a3 & 1;
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270FA2498](sub_22E0A2594, 0);
}

uint64_t sub_22E0A2594()
{
  uint64_t v21 = v0[6];
  v0[2] = v0;
  uint64_t v18 = sub_22E0F7610();
  uint64_t v19 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  id v20 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v20[1] = v3;
  swift_retain();
  if (v21)
  {
    uint64_t v16 = *(void *)(v17 + 48);
    v20[5] = type metadata accessor for SettingsBinarySetting();
    v20[2] = v16;
  }
  else
  {
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = 0;
    v20[5] = 0;
  }
  int v15 = *(unsigned __int8 *)(v17 + 105);
  v20[6] = sub_22E0F7610();
  v20[7] = v4;
  if (v15 == 2)
  {
    v20[8] = 0;
    v20[9] = 0;
    v20[10] = 0;
    v20[11] = 0;
  }
  else
  {
    char v5 = *(unsigned char *)(v17 + 105);
    v20[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v20 + 64) = v5 & 1;
  }
  uint64_t v14 = *(void *)(v17 + 56);
  char v13 = *(unsigned char *)(v17 + 106);
  void v20[12] = sub_22E0F7610();
  v20[13] = v6;
  v20[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v20 + 112) = v13 & 1;
  v20[18] = sub_22E0F7610();
  v20[19] = v7;
  swift_retain();
  if (v14)
  {
    uint64_t v12 = *(void *)(v17 + 56);
    v20[23] = sub_22E0F7180();
    v20[20] = v12;
  }
  else
  {
    v20[20] = 0;
    v20[21] = 0;
    v20[22] = 0;
    v20[23] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v10 = sub_22E0F7C10();
  *(void *)(v17 + 80) = v10;
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v17 + 88) = v8;
  *char v8 = *(void *)(v17 + 16);
  v8[1] = sub_22E0A29D0;
  return v11(v18, v19, v10);
}

uint64_t sub_22E0A29D0(uint64_t a1)
{
  uint64_t v6 = *v2;
  *(void *)(v6 + 16) = *v2;
  *(void *)(v6 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_22E0A2BBC, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(v6 + 16) + 8);
    return v3(a1);
  }
}

uint64_t sub_22E0A2BBC()
{
  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_22E0A2C80()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "first1#first1#dialog1";
  *(void *)(v0 + 8) = 21;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "first1#first1#dialog2";
  *(void *)(v0 + 32) = 21;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "first1#first2#dialog1";
  *(void *)(v0 + 56) = 21;
  *(unsigned char *)(v0 + 64) = 2;
  *(void *)(v0 + 72) = "first1#first2#dialog2";
  *(void *)(v0 + 80) = 21;
  *(unsigned char *)(v0 + 88) = 2;
  *(void *)(v0 + 96) = "first1#first3#dialog1";
  *(void *)(v0 + 104) = 21;
  *(unsigned char *)(v0 + 112) = 2;
  *(void *)(v0 + 120) = "first1#first3#dialog2";
  *(void *)(v0 + 128) = 21;
  *(unsigned char *)(v0 + 136) = 2;
  *(void *)(v0 + 144) = "first2#dialog1";
  *(void *)(v0 + 152) = 14;
  *(unsigned char *)(v0 + 160) = 2;
  *(void *)(v0 + 168) = "first2#dialog2";
  *(void *)(v0 + 176) = 14;
  *(unsigned char *)(v0 + 184) = 2;
  *(void *)(v0 + 192) = "first3#dialog1";
  *(void *)(v0 + 200) = 14;
  *(unsigned char *)(v0 + 208) = 2;
  *(void *)(v0 + 216) = "first3#dialog2";
  *(void *)(v0 + 224) = 14;
  *(unsigned char *)(v0 + 232) = 2;
  *(void *)(v0 + 240) = "first4#dialog1";
  *(void *)(v0 + 248) = 14;
  *(unsigned char *)(v0 + 256) = 2;
  *(void *)(v0 + 264) = "first4#dialog2";
  *(void *)(v0 + 272) = 14;
  *(unsigned char *)(v0 + 280) = 2;
  *(void *)(v0 + 288) = "first5#all1#dialog1";
  *(void *)(v0 + 296) = 19;
  *(unsigned char *)(v0 + 304) = 2;
  *(void *)(v0 + 312) = "first5#all1#dialog2";
  *(void *)(v0 + 320) = 19;
  *(unsigned char *)(v0 + 328) = 2;
  *(void *)(v0 + 336) = "first5#all2#dialog1";
  *(void *)(v0 + 344) = 19;
  *(unsigned char *)(v0 + 352) = 2;
  *(void *)(v0 + 360) = "first5#all2#dialog2";
  *(void *)(v0 + 368) = 19;
  *(unsigned char *)(v0 + 376) = 2;
  *(void *)(v0 + 384) = "first6#dialog1";
  *(void *)(v0 + 392) = 14;
  *(unsigned char *)(v0 + 400) = 2;
  *(void *)(v0 + 408) = "first6#dialog2";
  *(void *)(v0 + 416) = 14;
  *(unsigned char *)(v0 + 424) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_38:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_38;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_38;
    case 3:
      unsigned __int8 v4 = 3;
      goto LABEL_38;
    case 4:
      unsigned __int8 v4 = 4;
      goto LABEL_38;
    case 5:
      unsigned __int8 v4 = 5;
      goto LABEL_38;
    case 6:
      unsigned __int8 v4 = 6;
      goto LABEL_38;
    case 7:
      unsigned __int8 v4 = 7;
      goto LABEL_38;
    case 8:
      unsigned __int8 v4 = 8;
      goto LABEL_38;
    case 9:
      unsigned __int8 v4 = 9;
      goto LABEL_38;
    case 10:
      unsigned __int8 v4 = 10;
      goto LABEL_38;
    case 11:
      unsigned __int8 v4 = 11;
      goto LABEL_38;
    case 12:
      unsigned __int8 v4 = 12;
      goto LABEL_38;
    case 13:
      unsigned __int8 v4 = 13;
      goto LABEL_38;
    case 14:
      unsigned __int8 v4 = 14;
      goto LABEL_38;
    case 15:
      unsigned __int8 v4 = 15;
      goto LABEL_38;
    case 16:
      unsigned __int8 v4 = 16;
      goto LABEL_38;
    case 17:
      unsigned __int8 v4 = 17;
      goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  return 18;
}

uint64_t sub_22E0A31C0()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0A3538()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A3584()
{
  uint64_t v2 = qword_2685C3998;
  if (!qword_2685C3998)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3998);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A3604()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A3644()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A368C()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A36D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0A2C80();
  *a1 = result;
  return result;
}

uint64_t sub_22E0A370C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0A31C0();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0A3740(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 64) = v4;
  *(void *)(v5 + 56) = a4;
  *(unsigned char *)(v5 + 106) = a3 & 1;
  *(unsigned char *)(v5 + 105) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 104) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = a1;
  *(unsigned char *)(v5 + 104) = a2;
  *(unsigned char *)(v5 + 112) = a3 & 1;
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270FA2498](sub_22E0A37D0, 0);
}

uint64_t sub_22E0A37D0()
{
  uint64_t v22 = v0[6];
  v0[2] = v0;
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v21 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v21[1] = v3;
  swift_retain();
  if (v22)
  {
    uint64_t v17 = *(void *)(v18 + 48);
    v21[5] = type metadata accessor for SettingsBinarySetting();
    v21[2] = v17;
  }
  else
  {
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = 0;
    v21[5] = 0;
  }
  int v16 = *(unsigned __int8 *)(v18 + 105);
  v21[6] = sub_22E0F7610();
  v21[7] = v4;
  if (v16 == 2)
  {
    v21[8] = 0;
    v21[9] = 0;
    v21[10] = 0;
    v21[11] = 0;
  }
  else
  {
    char v5 = *(unsigned char *)(v18 + 105);
    v21[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v21 + 64) = v5 & 1;
  }
  uint64_t v15 = *(void *)(v18 + 56);
  char v14 = *(unsigned char *)(v18 + 106);
  v21[12] = sub_22E0F7610();
  v21[13] = v6;
  v21[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v21 + 112) = v14 & 1;
  v21[18] = sub_22E0F7610();
  v21[19] = v7;
  swift_retain();
  if (v15)
  {
    uint64_t v13 = *(void *)(v18 + 56);
    v21[23] = sub_22E0F7180();
    v21[20] = v13;
  }
  else
  {
    v21[20] = 0;
    v21[21] = 0;
    v21[22] = 0;
    v21[23] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v11 = sub_22E0F7C10();
  *(void *)(v18 + 80) = v11;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                    + (int)*MEMORY[0x263F6D0C0]);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v18 + 88) = v8;
  unint64_t v9 = sub_22E0A3584();
  *char v8 = *(void *)(v18 + 16);
  v8[1] = sub_22E0A29D0;
  return v12(v19, v20, v11, &unk_26E1E0688, v9);
}

uint64_t sub_22E0A3C24(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 64) = v4;
  *(void *)(v5 + 56) = a4;
  *(unsigned char *)(v5 + 106) = a3 & 1;
  *(unsigned char *)(v5 + 105) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 104) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = a1;
  *(unsigned char *)(v5 + 104) = a2;
  *(unsigned char *)(v5 + 112) = a3 & 1;
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270FA2498](sub_22E0A3CB4, 0);
}

uint64_t sub_22E0A3CB4()
{
  uint64_t v21 = v0[6];
  v0[2] = v0;
  uint64_t v18 = sub_22E0F7610();
  uint64_t v19 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v20 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v20[1] = v3;
  swift_retain();
  if (v21)
  {
    uint64_t v16 = *(void *)(v17 + 48);
    v20[5] = type metadata accessor for SettingsMultiSetting();
    v20[2] = v16;
  }
  else
  {
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = 0;
    v20[5] = 0;
  }
  int v15 = *(unsigned __int8 *)(v17 + 105);
  v20[6] = sub_22E0F7610();
  v20[7] = v4;
  if (v15 == 2)
  {
    v20[8] = 0;
    v20[9] = 0;
    v20[10] = 0;
    v20[11] = 0;
  }
  else
  {
    char v5 = *(unsigned char *)(v17 + 105);
    v20[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v20 + 64) = v5 & 1;
  }
  uint64_t v14 = *(void *)(v17 + 56);
  char v13 = *(unsigned char *)(v17 + 106);
  void v20[12] = sub_22E0F7610();
  v20[13] = v6;
  v20[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v20 + 112) = v13 & 1;
  v20[18] = sub_22E0F7610();
  v20[19] = v7;
  swift_retain();
  if (v14)
  {
    uint64_t v12 = *(void *)(v17 + 56);
    v20[23] = sub_22E0F7180();
    v20[20] = v12;
  }
  else
  {
    v20[20] = 0;
    v20[21] = 0;
    v20[22] = 0;
    v20[23] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v10 = sub_22E0F7C10();
  *(void *)(v17 + 80) = v10;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v17 + 88) = v8;
  *char v8 = *(void *)(v17 + 16);
  v8[1] = sub_22E0A29D0;
  return v11(v18, v19, v10);
}

uint64_t sub_22E0A40F0()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "first1#dialog1";
  *(void *)(v0 + 8) = 14;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "first1#dialog2";
  *(void *)(v0 + 32) = 14;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "first2#dialog1";
  *(void *)(v0 + 56) = 14;
  *(unsigned char *)(v0 + 64) = 2;
  *(void *)(v0 + 72) = "first2#dialog2";
  *(void *)(v0 + 80) = 14;
  *(unsigned char *)(v0 + 88) = 2;
  *(void *)(v0 + 96) = "first3#all1#dialog1";
  *(void *)(v0 + 104) = 19;
  *(unsigned char *)(v0 + 112) = 2;
  *(void *)(v0 + 120) = "first3#all1#dialog2";
  *(void *)(v0 + 128) = 19;
  *(unsigned char *)(v0 + 136) = 2;
  *(void *)(v0 + 144) = "first3#all2#dialog1";
  *(void *)(v0 + 152) = 19;
  *(unsigned char *)(v0 + 160) = 2;
  *(void *)(v0 + 168) = "first3#all2#dialog2";
  *(void *)(v0 + 176) = 19;
  *(unsigned char *)(v0 + 184) = 2;
  *(void *)(v0 + 192) = "first4#dialog1";
  *(void *)(v0 + 200) = 14;
  *(unsigned char *)(v0 + 208) = 2;
  *(void *)(v0 + 216) = "first4#dialog2";
  *(void *)(v0 + 224) = 14;
  *(unsigned char *)(v0 + 232) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_22:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_22;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_22;
    case 3:
      unsigned __int8 v4 = 3;
      goto LABEL_22;
    case 4:
      unsigned __int8 v4 = 4;
      goto LABEL_22;
    case 5:
      unsigned __int8 v4 = 5;
      goto LABEL_22;
    case 6:
      unsigned __int8 v4 = 6;
      goto LABEL_22;
    case 7:
      unsigned __int8 v4 = 7;
      goto LABEL_22;
    case 8:
      unsigned __int8 v4 = 8;
      goto LABEL_22;
    case 9:
      unsigned __int8 v4 = 9;
      goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  return 10;
}

uint64_t sub_22E0A4430()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0A4648()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A4694()
{
  uint64_t v2 = qword_2685C39B0;
  if (!qword_2685C39B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C39B0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A4714()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A4754()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A479C()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A47E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0A40F0();
  *a1 = result;
  return result;
}

uint64_t sub_22E0A481C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0A4430();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0A4850(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 64) = v4;
  *(void *)(v5 + 56) = a4;
  *(unsigned char *)(v5 + 106) = a3 & 1;
  *(unsigned char *)(v5 + 105) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 104) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = a1;
  *(unsigned char *)(v5 + 104) = a2;
  *(unsigned char *)(v5 + 112) = a3 & 1;
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270FA2498](sub_22E0A48E0, 0);
}

uint64_t sub_22E0A48E0()
{
  uint64_t v22 = v0[6];
  v0[2] = v0;
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v21 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v21[1] = v3;
  swift_retain();
  if (v22)
  {
    uint64_t v17 = *(void *)(v18 + 48);
    v21[5] = type metadata accessor for SettingsMultiSetting();
    v21[2] = v17;
  }
  else
  {
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = 0;
    v21[5] = 0;
  }
  int v16 = *(unsigned __int8 *)(v18 + 105);
  v21[6] = sub_22E0F7610();
  v21[7] = v4;
  if (v16 == 2)
  {
    v21[8] = 0;
    v21[9] = 0;
    v21[10] = 0;
    v21[11] = 0;
  }
  else
  {
    char v5 = *(unsigned char *)(v18 + 105);
    v21[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v21 + 64) = v5 & 1;
  }
  uint64_t v15 = *(void *)(v18 + 56);
  char v14 = *(unsigned char *)(v18 + 106);
  v21[12] = sub_22E0F7610();
  v21[13] = v6;
  v21[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v21 + 112) = v14 & 1;
  v21[18] = sub_22E0F7610();
  v21[19] = v7;
  swift_retain();
  if (v15)
  {
    uint64_t v13 = *(void *)(v18 + 56);
    v21[23] = sub_22E0F7180();
    v21[20] = v13;
  }
  else
  {
    v21[20] = 0;
    v21[21] = 0;
    v21[22] = 0;
    v21[23] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v11 = sub_22E0F7C10();
  *(void *)(v18 + 80) = v11;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                    + (int)*MEMORY[0x263F6D0C0]);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v18 + 88) = v8;
  unint64_t v9 = sub_22E0A4694();
  *char v8 = *(void *)(v18 + 16);
  v8[1] = sub_22E0A29D0;
  return v12(v19, v20, v11, &unk_26E1E0718, v9);
}

uint64_t sub_22E0A4D34(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  *(void *)(v6 + 64) = v5;
  *(unsigned char *)(v6 + 107) = a5 & 1;
  *(unsigned char *)(v6 + 106) = a4 & 1;
  *(unsigned char *)(v6 + 105) = a3 & 1;
  *(void *)(v6 + 56) = a2;
  *(void *)(v6 + 48) = a1;
  *(void *)(v6 + 16) = v6;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = 0;
  *(unsigned char *)(v6 + 104) = 0;
  *(unsigned char *)(v6 + 112) = 0;
  *(unsigned char *)(v6 + 120) = 0;
  *(void *)(v6 + 40) = 0;
  *(void *)(v6 + 24) = a1;
  *(void *)(v6 + 32) = a2;
  *(unsigned char *)(v6 + 104) = a3 & 1;
  *(unsigned char *)(v6 + 112) = a4 & 1;
  *(unsigned char *)(v6 + 120) = a5 & 1;
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x270FA2498](sub_22E0A4DF4, 0);
}

uint64_t sub_22E0A4DF4()
{
  uint64_t v23 = v0[6];
  v0[2] = v0;
  uint64_t v20 = sub_22E0F7610();
  uint64_t v21 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v22 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v22[1] = v3;
  swift_retain();
  if (v23)
  {
    uint64_t v18 = *(void *)(v19 + 48);
    v22[5] = type metadata accessor for SettingsNumericSetting();
    v22[2] = v18;
  }
  else
  {
    v22[2] = 0;
    v22[3] = 0;
    v22[4] = 0;
    v22[5] = 0;
  }
  uint64_t v17 = *(void *)(v19 + 56);
  v22[6] = sub_22E0F7610();
  v22[7] = v4;
  swift_retain();
  if (v17)
  {
    uint64_t v16 = *(void *)(v19 + 56);
    v22[11] = sub_22E0F7180();
    v22[8] = v16;
  }
  else
  {
    v22[8] = 0;
    v22[9] = 0;
    v22[10] = 0;
    v22[11] = 0;
  }
  char v13 = *(unsigned char *)(v19 + 107);
  char v11 = *(unsigned char *)(v19 + 106);
  char v10 = *(unsigned char *)(v19 + 105);
  v22[12] = sub_22E0F7610();
  v22[13] = v5;
  uint64_t v12 = MEMORY[0x263F8D4F8];
  v22[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v22 + 112) = v10 & 1;
  v22[18] = sub_22E0F7610();
  v22[19] = v6;
  v22[23] = v12;
  *((unsigned char *)v22 + 160) = v11 & 1;
  v22[24] = sub_22E0F7610();
  v22[25] = v7;
  v22[29] = v12;
  *((unsigned char *)v22 + 208) = v13 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v14 = sub_22E0F7C10();
  *(void *)(v19 + 80) = v14;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v19 + 88) = v8;
  *char v8 = *(void *)(v19 + 16);
  v8[1] = sub_22E0A5218;
  return v15(v20, v21, v14);
}

uint64_t sub_22E0A5218(uint64_t a1)
{
  uint64_t v6 = *v2;
  *(void *)(v6 + 16) = *v2;
  *(void *)(v6 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_22E0A5410, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(v6 + 16) + 8);
    return v3(a1);
  }
}

uint64_t sub_22E0A5410()
{
  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_22E0A54D8()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "dialog1";
  *(void *)(v0 + 8) = 7;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "dialog2";
  *(void *)(v0 + 32) = 7;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "dialog3";
  *(void *)(v0 + 56) = 7;
  *(unsigned char *)(v0 + 64) = 2;
  *(void *)(v0 + 72) = "dialog4";
  *(void *)(v0 + 80) = 7;
  *(unsigned char *)(v0 + 88) = 2;
  *(void *)(v0 + 96) = "dialog5";
  *(void *)(v0 + 104) = 7;
  *(unsigned char *)(v0 + 112) = 2;
  *(void *)(v0 + 120) = "dialog6";
  *(void *)(v0 + 128) = 7;
  *(unsigned char *)(v0 + 136) = 2;
  *(void *)(v0 + 144) = "dialog7";
  *(void *)(v0 + 152) = 7;
  *(unsigned char *)(v0 + 160) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_16;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_16;
    case 3:
      unsigned __int8 v4 = 3;
      goto LABEL_16;
    case 4:
      unsigned __int8 v4 = 4;
      goto LABEL_16;
    case 5:
      unsigned __int8 v4 = 5;
      goto LABEL_16;
    case 6:
      unsigned __int8 v4 = 6;
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  return 7;
}

uint64_t sub_22E0A5750()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0A58E4()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A5930()
{
  uint64_t v2 = qword_2685C39C8;
  if (!qword_2685C39C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C39C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A59B0()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A59F0()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A5A38()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A5A80@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0A54D8();
  *a1 = result;
  return result;
}

uint64_t sub_22E0A5AB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0A5750();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0A5AEC(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  *(void *)(v6 + 64) = v5;
  *(unsigned char *)(v6 + 107) = a5 & 1;
  *(unsigned char *)(v6 + 106) = a4 & 1;
  *(unsigned char *)(v6 + 105) = a3 & 1;
  *(void *)(v6 + 56) = a2;
  *(void *)(v6 + 48) = a1;
  *(void *)(v6 + 16) = v6;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = 0;
  *(unsigned char *)(v6 + 104) = 0;
  *(unsigned char *)(v6 + 112) = 0;
  *(unsigned char *)(v6 + 120) = 0;
  *(void *)(v6 + 40) = 0;
  *(void *)(v6 + 24) = a1;
  *(void *)(v6 + 32) = a2;
  *(unsigned char *)(v6 + 104) = a3 & 1;
  *(unsigned char *)(v6 + 112) = a4 & 1;
  *(unsigned char *)(v6 + 120) = a5 & 1;
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x270FA2498](sub_22E0A5BAC, 0);
}

uint64_t sub_22E0A5BAC()
{
  uint64_t v24 = v0[6];
  v0[2] = v0;
  uint64_t v21 = sub_22E0F7610();
  uint64_t v22 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v23 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v23[1] = v3;
  swift_retain();
  if (v24)
  {
    uint64_t v19 = *(void *)(v20 + 48);
    v23[5] = type metadata accessor for SettingsNumericSetting();
    v23[2] = v19;
  }
  else
  {
    v23[2] = 0;
    v23[3] = 0;
    v23[4] = 0;
    v23[5] = 0;
  }
  uint64_t v18 = *(void *)(v20 + 56);
  v23[6] = sub_22E0F7610();
  v23[7] = v4;
  swift_retain();
  if (v18)
  {
    uint64_t v17 = *(void *)(v20 + 56);
    v23[11] = sub_22E0F7180();
    v23[8] = v17;
  }
  else
  {
    v23[8] = 0;
    v23[9] = 0;
    v23[10] = 0;
    v23[11] = 0;
  }
  char v14 = *(unsigned char *)(v20 + 107);
  char v12 = *(unsigned char *)(v20 + 106);
  char v11 = *(unsigned char *)(v20 + 105);
  v23[12] = sub_22E0F7610();
  v23[13] = v5;
  uint64_t v13 = MEMORY[0x263F8D4F8];
  v23[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v23 + 112) = v11 & 1;
  v23[18] = sub_22E0F7610();
  v23[19] = v6;
  v23[23] = v13;
  *((unsigned char *)v23 + 160) = v12 & 1;
  v23[24] = sub_22E0F7610();
  v23[25] = v7;
  v23[29] = v13;
  *((unsigned char *)v23 + 208) = v14 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v15 = sub_22E0F7C10();
  *(void *)(v20 + 80) = v15;
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                    + (int)*MEMORY[0x263F6D0C0]);
  char v8 = (void *)swift_task_alloc();
  *(void *)(v20 + 88) = v8;
  unint64_t v9 = sub_22E0A5930();
  *char v8 = *(void *)(v20 + 16);
  v8[1] = sub_22E0A5218;
  return v16(v21, v22, v15, &unk_26E1E07A8, v9);
}

uint64_t sub_22E0A5FE8(uint64_t a1, uint64_t a2)
{
  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[5] = 0;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_22E0A6044, 0);
}

uint64_t sub_22E0A6044()
{
  uint64_t v16 = v0[6];
  v0[2] = v0;
  uint64_t v13 = sub_22E0F7610();
  uint64_t v14 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v15 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v15[1] = v3;
  swift_retain();
  if (v16)
  {
    uint64_t v11 = v12[6];
    v15[5] = type metadata accessor for SettingsNumericSetting();
    v15[2] = v11;
  }
  else
  {
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = 0;
    v15[5] = 0;
  }
  uint64_t v10 = v12[7];
  v15[6] = sub_22E0F7610();
  v15[7] = v4;
  swift_retain();
  if (v10)
  {
    uint64_t v9 = v12[7];
    v15[11] = sub_22E0F7180();
    v15[8] = v9;
  }
  else
  {
    v15[8] = 0;
    v15[9] = 0;
    v15[10] = 0;
    v15[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v12[10] = v7;
  char v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  uint64_t v5 = (void *)swift_task_alloc();
  v12[11] = v5;
  *uint64_t v5 = v12[2];
  v5[1] = sub_22DF40B70;
  return v8(v13, v14, v7);
}

uint64_t sub_22E0A632C()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A6378()
{
  uint64_t v2 = qword_2685C39E0;
  if (!qword_2685C39E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C39E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A63F8()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A6438()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A6480()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A64C8(uint64_t a1, uint64_t a2)
{
  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[5] = 0;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_22E0A6524, 0);
}

uint64_t sub_22E0A6524()
{
  uint64_t v17 = v0[6];
  v0[2] = v0;
  uint64_t v14 = sub_22E0F7610();
  uint64_t v15 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v16 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v16[1] = v3;
  swift_retain();
  if (v17)
  {
    uint64_t v12 = v13[6];
    v16[5] = type metadata accessor for SettingsNumericSetting();
    v16[2] = v12;
  }
  else
  {
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = 0;
    v16[5] = 0;
  }
  uint64_t v11 = v13[7];
  v16[6] = sub_22E0F7610();
  v16[7] = v4;
  swift_retain();
  if (v11)
  {
    uint64_t v10 = v13[7];
    v16[11] = sub_22E0F7180();
    v16[8] = v10;
  }
  else
  {
    v16[8] = 0;
    v16[9] = 0;
    v16[10] = 0;
    v16[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v13[10] = v8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                   + (int)*MEMORY[0x263F6D0C0]);
  uint64_t v5 = (void *)swift_task_alloc();
  v13[11] = v5;
  unint64_t v6 = sub_22E0A6378();
  *uint64_t v5 = v13[2];
  v5[1] = sub_22DF40B70;
  return v9(v14, v15, v8, &unk_26E1E0838, v6);
}

uint64_t sub_22E0A6824()
{
  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_22E0A6860, 0);
}

uint64_t sub_22E0A6860()
{
  v0[2] = v0;
  uint64_t v8 = sub_22E0F7610();
  uint64_t v5 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v6 = sub_22E0F7C10();
  v0[6] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 56) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22DE99D98;
  return v7(v8, v5, v6);
}

uint64_t sub_22E0A699C()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A69E8()
{
  uint64_t v2 = qword_2685C39F8[0];
  if (!qword_2685C39F8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2685C39F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A6A68()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A6AA8()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A6AF0()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A6B38()
{
  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_22E0A6B74, 0);
}

uint64_t sub_22E0A6B74()
{
  v0[2] = v0;
  uint64_t v9 = sub_22E0F7610();
  uint64_t v6 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v0[6] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                   + (int)*MEMORY[0x263F6D0C0]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 56) = v2;
  unint64_t v3 = sub_22E0A69E8();
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_22DE99D98;
  return v8(v9, v6, v7, &unk_26E1E08C8, v3);
}

uint64_t sub_22E0A6CC8(uint64_t a1, char a2, char a3)
{
  *(void *)(v4 + 48) = v3;
  *(unsigned char *)(v4 + 90) = a3 & 1;
  *(unsigned char *)(v4 + 89) = a2 & 1;
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 16) = v4;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 88) = 0;
  *(unsigned char *)(v4 + 96) = 0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 24) = a1;
  *(unsigned char *)(v4 + 88) = a2 & 1;
  *(unsigned char *)(v4 + 96) = a3 & 1;
  *(void *)(v4 + 32) = v3;
  return MEMORY[0x270FA2498](sub_22E0A6D58, 0);
}

uint64_t sub_22E0A6D58()
{
  uint64_t v18 = v0[5];
  v0[2] = v0;
  uint64_t v15 = sub_22E0F7610();
  uint64_t v16 = v1;
  v0[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v17 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v17[1] = v3;
  swift_retain();
  if (v18)
  {
    uint64_t v13 = *(void *)(v14 + 40);
    v17[5] = type metadata accessor for SettingsBinarySetting();
    v17[2] = v13;
  }
  else
  {
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = 0;
    v17[5] = 0;
  }
  char v10 = *(unsigned char *)(v14 + 90);
  char v8 = *(unsigned char *)(v14 + 89);
  v17[6] = sub_22E0F7610();
  v17[7] = v4;
  uint64_t v9 = MEMORY[0x263F8D4F8];
  v17[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v17 + 64) = v8 & 1;
  v17[12] = sub_22E0F7610();
  v17[13] = v5;
  v17[17] = v9;
  *((unsigned char *)v17 + 112) = v10 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v11 = sub_22E0F7C10();
  *(void *)(v14 + 64) = v11;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v14 + 72) = v6;
  *uint64_t v6 = *(void *)(v14 + 16);
  v6[1] = sub_22E0A7030;
  return v12(v15, v16, v11);
}

uint64_t sub_22E0A7030(uint64_t a1)
{
  uint64_t v6 = *v2;
  *(void *)(v6 + 16) = *v2;
  *(void *)(v6 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_22E0A7210, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(v6 + 16) + 8);
    return v3(a1);
  }
}

uint64_t sub_22E0A7210()
{
  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_22E0A72D0()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A731C()
{
  uint64_t v2 = qword_2685C3A10;
  if (!qword_2685C3A10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A10);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A739C()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A73DC()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A7424()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A746C(uint64_t a1, char a2, char a3)
{
  *(void *)(v4 + 48) = v3;
  *(unsigned char *)(v4 + 90) = a3 & 1;
  *(unsigned char *)(v4 + 89) = a2 & 1;
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 16) = v4;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 88) = 0;
  *(unsigned char *)(v4 + 96) = 0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 24) = a1;
  *(unsigned char *)(v4 + 88) = a2 & 1;
  *(unsigned char *)(v4 + 96) = a3 & 1;
  *(void *)(v4 + 32) = v3;
  return MEMORY[0x270FA2498](sub_22E0A74FC, 0);
}

uint64_t sub_22E0A74FC()
{
  uint64_t v19 = v0[5];
  v0[2] = v0;
  uint64_t v16 = sub_22E0F7610();
  uint64_t v17 = v1;
  v0[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v18 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v18[1] = v3;
  swift_retain();
  if (v19)
  {
    uint64_t v14 = *(void *)(v15 + 40);
    v18[5] = type metadata accessor for SettingsBinarySetting();
    v18[2] = v14;
  }
  else
  {
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = 0;
    v18[5] = 0;
  }
  char v11 = *(unsigned char *)(v15 + 90);
  char v9 = *(unsigned char *)(v15 + 89);
  v18[6] = sub_22E0F7610();
  v18[7] = v4;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  v18[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v18 + 64) = v9 & 1;
  v18[12] = sub_22E0F7610();
  v18[13] = v5;
  v18[17] = v10;
  *((unsigned char *)v18 + 112) = v11 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v12 = sub_22E0F7C10();
  *(void *)(v15 + 64) = v12;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                    + (int)*MEMORY[0x263F6D0C0]);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v15 + 72) = v6;
  unint64_t v7 = sub_22E0A731C();
  *uint64_t v6 = *(void *)(v15 + 16);
  v6[1] = sub_22E0A7030;
  return v13(v16, v17, v12, &unk_26E1E0958, v7);
}

uint64_t sub_22E0A77EC(uint64_t a1)
{
  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return MEMORY[0x270FA2498](sub_22E0A78CC, 0);
}

uint64_t sub_22E0A78CC()
{
  uint64_t v15 = (void *)v0[7];
  uint64_t v14 = (const void *)v0[5];
  v0[2] = v0;
  uint64_t v11 = sub_22E0F7610();
  uint64_t v12 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v13 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v13[1] = v3;
  sub_22DE5A4C4(v14, v15);
  uint64_t v16 = sub_22E0F7100();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    sub_22DE58794(v10[7]);
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  else
  {
    uint64_t v9 = v10[7];
    v13[5] = v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v9, v16);
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v10[9] = v7;
  char v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  uint64_t v5 = (void *)swift_task_alloc();
  v10[10] = v5;
  *uint64_t v5 = v10[2];
  v5[1] = sub_22DF3E3AC;
  return v8(v11, v12, v7);
}

uint64_t sub_22E0A7B6C()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0A7BB8()
{
  uint64_t v2 = qword_2685C3A28;
  if (!qword_2685C3A28)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A28);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A7C38()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0A7C78()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0A7CC0()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0A7D08(uint64_t a1)
{
  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return MEMORY[0x270FA2498](sub_22E0A7DE8, 0);
}

uint64_t sub_22E0A7DE8()
{
  uint64_t v16 = (void *)v0[7];
  uint64_t v15 = (const void *)v0[5];
  v0[2] = v0;
  uint64_t v12 = sub_22E0F7610();
  uint64_t v13 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v14 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v14[1] = v3;
  sub_22DE5A4C4(v15, v16);
  uint64_t v17 = sub_22E0F7100();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v18 + 48))(v16, 1) == 1)
  {
    sub_22DE58794(v11[7]);
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = 0;
    v14[5] = 0;
  }
  else
  {
    uint64_t v10 = v11[7];
    v14[5] = v17;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 32))(boxed_opaque_existential_1, v10, v17);
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v11[9] = v8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                   + (int)*MEMORY[0x263F6D0C0]);
  uint64_t v5 = (void *)swift_task_alloc();
  v11[10] = v5;
  unint64_t v6 = sub_22E0A7BB8();
  *uint64_t v5 = v11[2];
  v5[1] = sub_22DF3E3AC;
  return v9(v12, v13, v8, &unk_26E1E09E8, v6);
}

uint64_t type metadata accessor for GetSettingIntentCATsSimple()
{
  uint64_t v1 = qword_2685C3A38;
  if (!qword_2685C3A38) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0A8118()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0A818C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0A81E8(a1, a2, a3);
}

uint64_t sub_22E0A81E8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7110();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0A83B4(char a1, uint64_t a2)
{
  return sub_22E0A840C(a1 & 1, a2);
}

uint64_t sub_22E0A840C(int a1, uint64_t a2)
{
  int v10 = a1;
  uint64_t v11 = a2;
  uint64_t v18 = 0;
  char v17 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = sub_22E0F7260();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v8 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v4 = MEMORY[0x270FA5388](v14, v11, v14, v3);
  uint64_t v9 = (char *)&v7 - v8;
  char v17 = v10 & 1;
  uint64_t v16 = v5;
  uint64_t v18 = v2;
  (*(void (**)(double))(v12 + 16))(v4);
  uint64_t v15 = sub_22E0F7120();
  swift_retain();
  uint64_t v18 = v15;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
  swift_release();
  return v15;
}

uint64_t sub_22E0A854C()
{
  return type metadata accessor for GetSettingIntentCATsSimple();
}

void *type metadata accessor for GetSettingIntentCATsSimple.Properties()
{
  return &unk_26E1E05F8;
}

uint64_t sub_22E0A857C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xEE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 17) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 238;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 18;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22E0A872C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xEE)
  {
    unsigned int v5 = ((a3 + 17) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xEE)
  {
    unsigned int v4 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 17;
    }
  }
  return result;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeBinarySettingStateDialogIds()
{
  return &unk_26E1E0688;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeMultiSettingStateDialogIds()
{
  return &unk_26E1E0718;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeNumericSettingStateDialogIds()
{
  return &unk_26E1E07A8;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeNumericSettingStateSpokenOnlyDialogIds()
{
  return &unk_26E1E0838;
}

void *type metadata accessor for GetSettingIntentCATsSimple.HotspotDiscoverabilityPromptDialogIds()
{
  return &unk_26E1E08C8;
}

void *type metadata accessor for GetSettingIntentCATsSimple.SiriCannotChangeSettingDialogIds()
{
  return &unk_26E1E0958;
}

void *type metadata accessor for GetSettingIntentCATsSimple.TargetDeviceNotFoundReadBatteryDialogIds()
{
  return &unk_26E1E09E8;
}

unint64_t sub_22E0A89FC()
{
  return sub_22E0A8A14();
}

unint64_t sub_22E0A8A14()
{
  uint64_t v2 = qword_2685C3A48;
  if (!qword_2685C3A48)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8A94()
{
  return sub_22E0A8AAC();
}

unint64_t sub_22E0A8AAC()
{
  uint64_t v2 = qword_2685C3A50;
  if (!qword_2685C3A50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8B2C()
{
  return sub_22E0A8B44();
}

unint64_t sub_22E0A8B44()
{
  uint64_t v2 = qword_2685C3A58;
  if (!qword_2685C3A58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8BC4()
{
  return sub_22E0A8BDC();
}

unint64_t sub_22E0A8BDC()
{
  uint64_t v2 = qword_2685C3A60;
  if (!qword_2685C3A60)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8C5C()
{
  return sub_22E0A8C74();
}

unint64_t sub_22E0A8C74()
{
  uint64_t v2 = qword_2685C3A68;
  if (!qword_2685C3A68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8CF4()
{
  return sub_22E0A8D0C();
}

unint64_t sub_22E0A8D0C()
{
  uint64_t v2 = qword_2685C3A70;
  if (!qword_2685C3A70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8D8C()
{
  return sub_22E0A8DA4();
}

unint64_t sub_22E0A8DA4()
{
  uint64_t v2 = qword_2685C3A78;
  if (!qword_2685C3A78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0A8E24()
{
  return sub_22E0A8E3C();
}

unint64_t sub_22E0A8E3C()
{
  uint64_t v2 = qword_2685C3A80;
  if (!qword_2685C3A80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A80);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0A8EBC()
{
  type metadata accessor for SetAXMotionCuesHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D18 = result;
  return result;
}

uint64_t type metadata accessor for SetAXMotionCuesHandler()
{
  return self;
}

uint64_t *sub_22E0A8F24()
{
  if (qword_2685BF760 != -1) {
    swift_once();
  }
  return &qword_2685D7D18;
}

void sub_22E0A8F88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  unsigned int v5 = sub_22DF0A62C();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  id v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0A9284, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

uint64_t sub_22E0A9158(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  swift_retain();
  char v6 = sub_22DE6D590();
  swift_release();
  id v4 = sub_22DF0A62C();
  uint64_t v9 = *v4;
  uint64_t v10 = v4[1];
  unsigned int v11 = *((unsigned __int8 *)v4 + 16);
  char v12 = *(unsigned char *)(a1 + 24);
  swift_retain();
  sub_22DEF7BD0(v6 & 1, a2, v9, v10, v11, v12 & 1, a3, a4, (uint64_t)sub_22E0A934C, a1, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0A934C);
}

uint64_t sub_22E0A9284()
{
  return sub_22E0A9158(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_22E0A92B8()
{
  return swift_release();
}

void sub_22E0A9328(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0A934C()
{
  return sub_22E0A92B8();
}

uint64_t sub_22E0A9374(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v10 = sub_22E0F7100();
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v9 = v10 - 8;
  unint64_t v6 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10, v11, v10, v2);
  id v7 = (char *)&v5 - v6;
  uint64_t v14 = v3;
  uint64_t v13 = v1;
  (*(void (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier, v7, v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v10);
  return v12;
}

uint64_t sub_22E0A94A8()
{
  uint64_t v3 = OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  uint64_t v1 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

uint64_t sub_22E0A951C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  swift_beginAccess();
  uint64_t v2 = sub_22E0F7100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v4);
  return swift_endAccess();
}

uint64_t sub_22E0A95A8(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v13 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v6 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v3 = MEMORY[0x270FA5388](v13, v12, v13, v2);
  uint64_t v8 = (char *)&v5 - v6;
  (*(void (**)(double))(v10 + 16))(v3);
  uint64_t v7 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  uint64_t v9 = &v14;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 40))(v7, v8, v13);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v12, v13);
}

uint64_t (*sub_22E0A96E8())()
{
  return sub_22DE10544;
}

uint64_t sub_22E0A974C(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v18 = 0;
  uint64_t v17 = 0;
  uint64_t v13 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v7 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v14, v2, v3, v4);
  uint64_t v12 = (char *)&v7 - v7;
  uint64_t v18 = v5;
  uint64_t v17 = v1;
  *(void *)(v1 + 16) = 0;
  uint64_t v8 = v5 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  uint64_t v9 = &v16;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v8, v13);
  swift_endAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v1 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier, v12, v13);
  swift_release();
  return v15;
}

uint64_t sub_22E0A989C@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v7 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v6 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier;
    uint64_t v4 = sub_22E0F7100();
    a1[3] = v4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_1, v3);
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    a1[3] = 0;
  }
  return result;
}

uint64_t SettingsSetting.init(from:)(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v20 = sub_22E0F7100();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = v20 - 8;
  unint64_t v23 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20, v2, v3, v4);
  uint64_t v24 = (char *)v12 - v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3A88);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = v26 - 8;
  unint64_t v29 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25, v5, v6, v7);
  uint64_t v30 = (char *)v12 - v29;
  uint64_t v37 = v8;
  uint64_t v36 = v1;
  *(void *)(v1 + 16) = 0;
  uint64_t v32 = v8[3];
  uint64_t v33 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v32);
  sub_22E0A9D08();
  uint64_t v9 = v31;
  sub_22E0F7F60();
  uint64_t v34 = v9;
  uint64_t v35 = v9;
  if (v9)
  {
    uint64_t v14 = v35;
    uint64_t v15 = v19;
  }
  else
  {
    sub_22DF24950();
    uint64_t v10 = v34;
    sub_22E0F7D70();
    uint64_t v17 = v10;
    uint64_t v18 = v10;
    if (!v10)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v19 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier, v24, v20);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
      __swift_destroy_boxed_opaque_existential_0(v25);
      return v19;
    }
    uint64_t v13 = v18;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
    uint64_t v14 = v13;
    uint64_t v15 = v19;
  }
  v12[1] = v15;
  v12[2] = v14;
  sub_22DE63C6C((id *)(v15 + 16));
  type metadata accessor for SettingsSetting();
  swift_deallocPartialClassInstance();
  __swift_destroy_boxed_opaque_existential_0(v25);
  return v16;
}

unint64_t sub_22E0A9D08()
{
  uint64_t v2 = qword_2685C3A90;
  if (!qword_2685C3A90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3A90);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for SettingsSetting()
{
  uint64_t v1 = qword_2685C3AB8;
  if (!qword_2685C3AB8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0A9E00(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v24 = sub_22E0F7100();
  uint64_t v20 = *(void *)(v24 - 8);
  uint64_t v21 = v24 - 8;
  unint64_t v12 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v2, v3, v4);
  uint64_t v26 = (char *)v11 - v12;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3A98);
  uint64_t v14 = *(void *)(v23 - 8);
  uint64_t v15 = v23 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13, v5, v6, v7);
  uint64_t v19 = (char *)v11 - v16;
  uint64_t v30 = v8;
  uint64_t v29 = v1;
  uint64_t v17 = v8[3];
  uint64_t v18 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v17);
  sub_22E0A9D08();
  sub_22E0F7F70();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v26, v22 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier, v24);
  sub_22DF24D80();
  uint64_t v9 = v25;
  sub_22E0F7E00();
  uint64_t v27 = v9;
  uint64_t v28 = v9;
  if (v9) {
    v11[1] = v28;
  }
  (*(void (**)(char *, uint64_t))(v20 + 8))(v26, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v23);
}

uint64_t SettingsSetting.deinit()
{
  sub_22DE63C6C((id *)(v0 + 16));
  uint64_t v3 = OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier;
  uint64_t v1 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

void *sub_22E0AA12C()
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v0 + 16);
  id v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_22E0AA188(void *a1)
{
  id v2 = a1;
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;

  swift_endAccess();
}

uint64_t (*sub_22E0AA1FC())()
{
  return sub_22DF03854;
}

uint64_t sub_22E0AA260(uint64_t a1)
{
  return sub_22E0A9374(a1);
}

uint64_t sub_22E0AA2AC()
{
  type metadata accessor for SettingsSetting();
  swift_retain();
  return sub_22E0AA2F8(v1);
}

uint64_t sub_22E0AA2F8(uint64_t a1)
{
  return sub_22E0A974C(a1);
}

uint64_t sub_22E0AA344()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E0AA3AC()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0AA3EC@<X0>(void **a1@<X8>)
{
  *a1 = sub_22E0AA12C();
  return swift_release();
}

uint64_t sub_22E0AA448(id *a1)
{
  sub_22E0AB560(a1, &v3);
  id v2 = v3;
  swift_retain();
  sub_22E0AA188(v2);
  return swift_release();
}

uint64_t sub_22E0AA4B0(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  v8[1] = 0;
  uint64_t v16 = sub_22E0F7100();
  uint64_t v13 = *(void *)(v16 - 8);
  uint64_t v14 = v16 - 8;
  unint64_t v9 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1, v2, v3);
  uint64_t v10 = (uint64_t)v8 - v9;
  uint64_t v19 = v4;
  type metadata accessor for SettingsSetting.Builder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v10, v15, v16);
  uint64_t v5 = sub_22E0AA260(v10);
  uint64_t v6 = v11;
  uint64_t v12 = v5;
  uint64_t v18 = v5;
  swift_retain();
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v6 + 136))(v12);
  swift_retain();
  uint64_t v20 = v17;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v16);
  swift_release();
  return v17;
}

uint64_t type metadata accessor for SettingsSetting.Builder()
{
  uint64_t v1 = qword_2685C3AC8;
  if (!qword_2685C3AC8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

BOOL sub_22E0AA694()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "identifier";
  *(void *)(v0 + 8) = 10;
  *(unsigned char *)(v0 + 16) = 2;
  sub_22DE04404();
  uint64_t v2 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 != 0;
}

uint64_t sub_22E0AA778()
{
  swift_bridgeObjectRetain();
  if (sub_22E0AA694())
  {
    swift_bridgeObjectRelease();
    char v1 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_22E0AA800()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0AA834()
{
  return sub_22E0AA800();
}

uint64_t sub_22E0AA84C()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0AA898()
{
  uint64_t v2 = qword_2685C3AA0;
  if (!qword_2685C3AA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3AA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0AA918()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0AA958()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0AA9A0()
{
  return sub_22E0F76D0();
}

BOOL sub_22E0AA9E8@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_22E0AA694();
  *a1 = result;
  return result;
}

uint64_t sub_22E0AAA28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0AA800();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0AAA58()
{
  return sub_22E0AA834();
}

uint64_t sub_22E0AAA70@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0AA778();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22E0AAAA4()
{
  return sub_22E0F7F80();
}

uint64_t sub_22E0AAAD4()
{
  return sub_22E0F7F90();
}

uint64_t SettingsSetting.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SettingsSetting.__allocating_init(from:)(uint64_t a1)
{
  swift_allocObject();
  uint64_t v5 = SettingsSetting.init(from:)(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t sub_22E0AABFC()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_22E0AAC24()
{
  return (*(uint64_t (**)(void))(v0 + 104))() & 1;
}

void *sub_22E0AAC50()
{
  return sub_22E0AA12C();
}

void sub_22E0AAC74(void *a1)
{
}

void (*sub_22E0AAC98(void *a1))(void **a1, char a2)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_22E0AA1FC();
  return sub_22DFE5D10;
}

uint64_t sub_22E0AAD0C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

unint64_t sub_22E0AAD54()
{
  return sub_22E0AAD6C();
}

unint64_t sub_22E0AAD6C()
{
  uint64_t v2 = qword_2685C3AA8;
  if (!qword_2685C3AA8)
  {
    type metadata accessor for SettingsSetting();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3AA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0AADF0()
{
  return sub_22E0AAE08();
}

unint64_t sub_22E0AAE08()
{
  uint64_t v2 = qword_2685C3AB0;
  if (!qword_2685C3AB0)
  {
    type metadata accessor for SettingsSetting();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3AB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0AAE8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 160))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_22E0AAEFC()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152))();
}

uint64_t sub_22E0AAF7C@<X0>(void **a1@<X8>)
{
  return sub_22E0AA3EC(a1);
}

uint64_t sub_22E0AAF94(id *a1)
{
  return sub_22E0AA448(a1);
}

uint64_t sub_22E0AAFAC()
{
  return type metadata accessor for SettingsSetting();
}

uint64_t sub_22E0AAFC8()
{
  uint64_t updated = sub_22E0F7100();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for SettingsSetting()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SettingsSetting.catTypeName.getter()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static SettingsSetting.isDialogType.getter()
{
  return (*(uint64_t (**)(void))(v0 + 104))() & 1;
}

uint64_t dispatch thunk of SettingsSetting.mockGlobals.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of SettingsSetting.mockGlobals.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SettingsSetting.mockGlobals.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SettingsSetting.getProperty(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SettingsSetting.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SettingsSetting.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_22E0AB288()
{
  return type metadata accessor for SettingsSetting.Builder();
}

uint64_t sub_22E0AB2A4()
{
  uint64_t updated = sub_22E0F7100();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

void *type metadata accessor for SettingsSetting.CodingKeys()
{
  return &unk_26E1E0AA0;
}

unint64_t sub_22E0AB398()
{
  return sub_22E0AB3B0();
}

unint64_t sub_22E0AB3B0()
{
  uint64_t v2 = qword_2685C3AD8;
  if (!qword_2685C3AD8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3AD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0AB430()
{
  return sub_22E0AB448();
}

unint64_t sub_22E0AB448()
{
  uint64_t v2 = qword_2685C3AE0;
  if (!qword_2685C3AE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3AE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0AB4C8()
{
  return sub_22E0AB4E0();
}

unint64_t sub_22E0AB4E0()
{
  uint64_t v2 = qword_2685C3AE8[0];
  if (!qword_2685C3AE8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2685C3AE8);
    return WitnessTable;
  }
  return v2;
}

void *sub_22E0AB560(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t *sub_22E0AB598()
{
  if (qword_2685BF768 != -1) {
    swift_once();
  }
  return &qword_2685D7D30;
}

uint64_t sub_22E0AB5FC()
{
  type metadata accessor for GetAXColorFiltersBlueYellowHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D30 = result;
  return result;
}

uint64_t type metadata accessor for GetAXColorFiltersBlueYellowHandler()
{
  return self;
}

void sub_22E0AB664(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  uint64_t v5 = sub_22DF080C4();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  id v7 = a1;
  swift_retain();
  swift_retain();
  uint64_t v18 = a1;
  uint64_t v19 = v3;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0ABA70, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);

  swift_release();
  swift_release();
}

void sub_22E0AB838(void *a1, uint64_t a2, void (*a3)(id))
{
  id v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  BOOL v15 = sub_22DE6D468();
  swift_release();
  if (v15) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  id v11 = sub_22DF962A0(v14, 0, 0, v12, 0, 0);

  sub_22E0F7990();
  id v10 = (id)*sub_22DF136D8();
  id v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v9 = v4;
  id v5 = v11;
  sub_22DE10250();
  sub_22DE10320();
  uint64_t v7 = sub_22E0F75A0();
  uint64_t v8 = v6;
  v9[3] = MEMORY[0x263F8D310];
  void v9[4] = sub_22DE103A4();
  *uint64_t v9 = v7;
  v9[1] = v8;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();
}

void sub_22E0ABA70()
{
  sub_22E0AB838(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0ABAA4(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0ABAC8()
{
  type metadata accessor for SetAXAutoBrightnessHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D38 = result;
  return result;
}

uint64_t type metadata accessor for SetAXAutoBrightnessHandler()
{
  return self;
}

uint64_t *sub_22E0ABB30()
{
  if (qword_2685BF770 != -1) {
    swift_once();
  }
  return &qword_2685D7D38;
}

uint64_t sub_22E0ABB94(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE70368();
  swift_release();
  id v4 = sub_22DF09E80();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0ABDA8, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0ABDA8);
}

uint64_t sub_22E0ABD38()
{
  return swift_release();
}

uint64_t sub_22E0ABDA8()
{
  return sub_22E0ABD38();
}

uint64_t sub_22E0ABDD0(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0ABB94(a1, a2, a3);
}

uint64_t *sub_22E0ABDF4()
{
  if (qword_2685BF778 != -1) {
    swift_once();
  }
  return &qword_2685D7D40;
}

uint64_t sub_22E0ABE58()
{
  type metadata accessor for GetSmartSiriVolumeHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D40 = result;
  return result;
}

uint64_t type metadata accessor for GetSmartSiriVolumeHandler()
{
  return self;
}

void sub_22E0ABEC0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v5 = sub_22DF08F70();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0AC364, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22E0AC090(uint64_t a1, void *a2, void (*a3)(id))
{
  swift_retain();
  char v18 = sub_22DE7254C();
  swift_release();
  sub_22DE10250();
  id v15 = sub_22DE07498(3, 0);
  sub_22DE102B8();
  sub_22E0F7E50();
  uint64_t v17 = v3;
  id v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  *uint64_t v17 = sub_22DF961EC(v19, 0, 0, v13, 0, 0);
  sub_22DE04404();
  id v8 = (id)sub_22E0F7700();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_22E0F7990();
  id v12 = (id)*sub_22DF136D8();
  id v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v11 = v5;
  id v6 = v15;
  sub_22DE10320();
  uint64_t v9 = sub_22E0F75A0();
  uint64_t v10 = v7;
  void v11[3] = MEMORY[0x263F8D310];
  v11[4] = sub_22DE103A4();
  *uint64_t v11 = v9;
  v11[1] = v10;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();
}

void sub_22E0AC364()
{
  sub_22E0AC090(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0AC398(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0AC3BC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AC488(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](sub_22E0AC4C8, 0);
}

uint64_t sub_22E0AC4C8()
{
  v0[2] = v0;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v0[7] = v8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  id v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *id v2 = v5[2];
  v2[1] = sub_22DF02398;
  uint64_t v3 = v5[4];
  return v9(v3, v6, v7, v8);
}

uint64_t sub_22E0AC608()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AC6BC(uint64_t a1, uint64_t a2, char a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_22E0F7180();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  if (a3 == 2)
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  else
  {
    v10[17] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v10 + 112) = a3 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AC97C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 72) = v4;
  *(unsigned char *)(v5 + 113) = a4;
  *(void *)(v5 + 64) = a3;
  *(void *)(v5 + 56) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(void *)(v5 + 32) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(unsigned char *)(v5 + 112) = a4;
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270FA2498](sub_22E0AC9EC, 0);
}

uint64_t sub_22E0AC9EC()
{
  uint64_t v20 = v0[7];
  v0[2] = v0;
  uint64_t v17 = sub_22E0F7610();
  uint64_t v18 = v1;
  v0[10] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  id v19 = v2;
  *id v2 = sub_22E0F7610();
  v19[1] = v3;
  swift_retain();
  if (v20)
  {
    uint64_t v15 = *(void *)(v16 + 56);
    v19[5] = type metadata accessor for SettingsBinarySetting();
    v19[2] = v15;
  }
  else
  {
    v19[2] = 0;
    v19[3] = 0;
    v19[4] = 0;
    v19[5] = 0;
  }
  uint64_t v14 = *(void *)(v16 + 64);
  v19[6] = sub_22E0F7610();
  v19[7] = v4;
  swift_retain();
  if (v14)
  {
    uint64_t v13 = *(void *)(v16 + 64);
    v19[11] = sub_22E0F7180();
    v19[8] = v13;
  }
  else
  {
    v19[8] = 0;
    v19[9] = 0;
    v19[10] = 0;
    v19[11] = 0;
  }
  int v12 = *(unsigned __int8 *)(v16 + 113);
  v19[12] = sub_22E0F7610();
  v19[13] = v5;
  if (v12 == 2)
  {
    v19[14] = 0;
    v19[15] = 0;
    v19[16] = 0;
    v19[17] = 0;
  }
  else
  {
    char v6 = *(unsigned char *)(v16 + 113);
    v19[17] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v19 + 112) = v6 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v10 = sub_22E0F7C10();
  *(void *)(v16 + 88) = v10;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v16 + 96) = v7;
  *uint64_t v7 = *(void *)(v16 + 16);
  v7[1] = sub_22E0ACDB0;
  uint64_t v8 = *(void *)(v16 + 48);
  return v11(v8, v17, v18, v10);
}

uint64_t sub_22E0ACDB0()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_22E0ACF88, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v2 = *(uint64_t (**)(void))(*(void *)(v4 + 16) + 8);
    return v2();
  }
}

uint64_t sub_22E0ACF88()
{
  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_22E0AD044(uint64_t a1, uint64_t a2, char a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_22E0F7180();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  if (a3 == 2)
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  else
  {
    v10[17] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v10 + 112) = a3 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AD2EC(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F7180();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AD480(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](sub_22E0AD4D0, 0);
}

uint64_t sub_22E0AD4D0()
{
  uint64_t v14 = v0[6];
  v0[2] = v0;
  uint64_t v11 = sub_22E0F7610();
  uint64_t v12 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v13 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v13[1] = v3;
  swift_retain();
  if (v14)
  {
    uint64_t v9 = v10[6];
    v13[5] = sub_22E0F7180();
    v13[2] = v9;
  }
  else
  {
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v10[9] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v10[10] = v4;
  *uint64_t v4 = v10[2];
  v4[1] = sub_22DF02A4C;
  uint64_t v5 = v10[5];
  return v8(v5, v11, v12, v7);
}

uint64_t sub_22E0AD6E8(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F7180();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AD864()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AD930(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](sub_22E0AD970, 0);
}

uint64_t sub_22E0AD970()
{
  v0[2] = v0;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v0[7] = v8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = sub_22DF02398;
  uint64_t v3 = v5[4];
  return v9(v3, v6, v7, v8);
}

uint64_t sub_22E0ADAB0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0ADB64(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsBinarySetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0ADCF8(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](sub_22E0ADD48, 0);
}

uint64_t sub_22E0ADD48()
{
  uint64_t v14 = v0[6];
  v0[2] = v0;
  uint64_t v11 = sub_22E0F7610();
  uint64_t v12 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v13 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v13[1] = v3;
  swift_retain();
  if (v14)
  {
    uint64_t v9 = v10[6];
    v13[5] = type metadata accessor for SettingsBinarySetting();
    v13[2] = v9;
  }
  else
  {
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v10[9] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v10[10] = v4;
  *uint64_t v4 = v10[2];
  v4[1] = sub_22DF02A4C;
  uint64_t v5 = v10[5];
  return v8(v5, v11, v12, v7);
}

uint64_t sub_22E0ADF60(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsBinarySetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AE0DC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AE1A8(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](sub_22E0AE1E8, 0);
}

uint64_t sub_22E0AE1E8()
{
  v0[2] = v0;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v0[7] = v8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = sub_22DF02398;
  uint64_t v3 = v5[4];
  return v9(v3, v6, v7, v8);
}

uint64_t sub_22E0AE328()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AE3DC(uint64_t a1, char a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsNumericSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  if (a2 == 2)
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  else
  {
    v7[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v7 + 64) = a2 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AE600(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 56) = v3;
  *(unsigned char *)(v4 + 97) = a3;
  *(void *)(v4 + 48) = a2;
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 16) = v4;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 96) = 0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 24) = a2;
  *(unsigned char *)(v4 + 96) = a3;
  *(void *)(v4 + 32) = v3;
  return MEMORY[0x270FA2498](sub_22E0AE660, 0);
}

uint64_t sub_22E0AE660()
{
  uint64_t v17 = v0[6];
  v0[2] = v0;
  uint64_t v14 = sub_22E0F7610();
  uint64_t v15 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v16 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v16[1] = v3;
  swift_retain();
  if (v17)
  {
    uint64_t v12 = *(void *)(v13 + 48);
    v16[5] = type metadata accessor for SettingsNumericSetting();
    v16[2] = v12;
  }
  else
  {
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = 0;
    v16[5] = 0;
  }
  int v11 = *(unsigned __int8 *)(v13 + 97);
  v16[6] = sub_22E0F7610();
  v16[7] = v4;
  if (v11 == 2)
  {
    v16[8] = 0;
    v16[9] = 0;
    v16[10] = 0;
    v16[11] = 0;
  }
  else
  {
    char v5 = *(unsigned char *)(v13 + 97);
    v16[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v16 + 64) = v5 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v9 = sub_22E0F7C10();
  *(void *)(v13 + 72) = v9;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v13 + 80) = v6;
  *uint64_t v6 = *(void *)(v13 + 16);
  v6[1] = sub_22E0AE938;
  uint64_t v7 = *(void *)(v13 + 40);
  return v10(v7, v14, v15, v9);
}

uint64_t sub_22E0AE938()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_22E0AEB00, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 16) + 8);
    return v2();
  }
}

uint64_t sub_22E0AEB00()
{
  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_22E0AEBB8(uint64_t a1, char a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsNumericSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  if (a2 == 2)
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  else
  {
    v7[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v7 + 64) = a2 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AEDC4(uint64_t a1, uint64_t a2, char a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = type metadata accessor for SettingsMultiSetting();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  v10[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v10 + 112) = a3 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AF058(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 72) = v4;
  *(unsigned char *)(v5 + 113) = a4 & 1;
  *(void *)(v5 + 64) = a3;
  *(void *)(v5 + 56) = a2;
  *(void *)(v5 + 48) = a1;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(void *)(v5 + 32) = 0;
  *(unsigned char *)(v5 + 112) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(unsigned char *)(v5 + 112) = a4 & 1;
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x270FA2498](sub_22E0AF0DC, 0);
}

uint64_t sub_22E0AF0DC()
{
  uint64_t v19 = v0[7];
  v0[2] = v0;
  uint64_t v16 = sub_22E0F7610();
  uint64_t v17 = v1;
  v0[10] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v18 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v18[1] = v3;
  swift_retain();
  if (v19)
  {
    uint64_t v14 = *(void *)(v15 + 56);
    v18[5] = type metadata accessor for SettingsBinarySetting();
    v18[2] = v14;
  }
  else
  {
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = 0;
    v18[5] = 0;
  }
  uint64_t v13 = *(void *)(v15 + 64);
  v18[6] = sub_22E0F7610();
  v18[7] = v4;
  swift_retain();
  if (v13)
  {
    uint64_t v12 = *(void *)(v15 + 64);
    v18[11] = type metadata accessor for SettingsMultiSetting();
    void v18[8] = v12;
  }
  else
  {
    void v18[8] = 0;
    void v18[9] = 0;
    v18[10] = 0;
    v18[11] = 0;
  }
  char v9 = *(unsigned char *)(v15 + 113);
  v18[12] = sub_22E0F7610();
  v18[13] = v5;
  v18[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v18 + 112) = v9 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v10 = sub_22E0F7C10();
  *(void *)(v15 + 88) = v10;
  int v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v15 + 96) = v6;
  *uint64_t v6 = *(void *)(v15 + 16);
  v6[1] = sub_22E0ACDB0;
  uint64_t v7 = *(void *)(v15 + 48);
  return v11(v7, v16, v17, v10);
}

uint64_t sub_22E0AF440(uint64_t a1, uint64_t a2, char a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = type metadata accessor for SettingsMultiSetting();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  v10[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v10 + 112) = a3 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AF6BC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AF788(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](sub_22E0AF7C8, 0);
}

uint64_t sub_22E0AF7C8()
{
  v0[2] = v0;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v0[7] = v8;
  char v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = sub_22DF02398;
  uint64_t v3 = v5[4];
  return v9(v3, v6, v7, v8);
}

uint64_t sub_22E0AF908()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AF9BC(char a1, char a2, char a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v12 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v12[1] = v4;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  v12[5] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v12 + 16) = a1 & 1;
  v12[6] = sub_22E0F7610();
  v12[7] = v5;
  v12[11] = v10;
  *((unsigned char *)v12 + 64) = a2 & 1;
  v12[12] = sub_22E0F7610();
  v12[13] = v6;
  v12[17] = v10;
  *((unsigned char *)v12 + 112) = a3 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0AFBB8(uint64_t a1, char a2, char a3, char a4)
{
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 83) = a4 & 1;
  *(unsigned char *)(v5 + 82) = a3 & 1;
  *(unsigned char *)(v5 + 81) = a2 & 1;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 16) = v5;
  *(unsigned char *)(v5 + 80) = 0;
  *(unsigned char *)(v5 + 88) = 0;
  *(unsigned char *)(v5 + 96) = 0;
  *(void *)(v5 + 24) = 0;
  *(unsigned char *)(v5 + 80) = a2 & 1;
  *(unsigned char *)(v5 + 88) = a3 & 1;
  *(unsigned char *)(v5 + 96) = a4 & 1;
  *(void *)(v5 + 24) = v4;
  return MEMORY[0x270FA2498](sub_22E0AFC5C, 0);
}

uint64_t sub_22E0AFC5C()
{
  char v12 = *(unsigned char *)(v0 + 83);
  char v10 = *(unsigned char *)(v0 + 82);
  char v9 = *(unsigned char *)(v0 + 81);
  *(void *)(v0 + 16) = v0;
  uint64_t v15 = sub_22E0F7610();
  uint64_t v16 = v1;
  *(void *)(v0 + 48) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v13 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v13[1] = v3;
  uint64_t v11 = MEMORY[0x263F8D4F8];
  v13[5] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v13 + 16) = v9 & 1;
  v13[6] = sub_22E0F7610();
  v13[7] = v4;
  v13[11] = v11;
  *((unsigned char *)v13 + 64) = v10 & 1;
  v13[12] = sub_22E0F7610();
  v13[13] = v5;
  v13[17] = v11;
  *((unsigned char *)v13 + 112) = v12 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v17 = sub_22E0F7C10();
  *(void *)(v0 + 56) = v17;
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v6 = (void *)swift_task_alloc();
  v14[8] = v6;
  *uint64_t v6 = v14[2];
  v6[1] = sub_22E0AFEB0;
  uint64_t v7 = v14[4];
  return v18(v7, v15, v16, v17);
}

uint64_t sub_22E0AFEB0()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_22E0B0088, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 16) + 8);
    return v2();
  }
}

uint64_t sub_22E0B0088()
{
  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_22E0B0144(char a1, char a2, char a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  char v12 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v12[1] = v4;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  v12[5] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v12 + 16) = a1 & 1;
  v12[6] = sub_22E0F7610();
  v12[7] = v5;
  v12[11] = v10;
  *((unsigned char *)v12 + 64) = a2 & 1;
  v12[12] = sub_22E0F7610();
  v12[13] = v6;
  v12[17] = v10;
  *((unsigned char *)v12 + 112) = a3 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B0328(char a1, char a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  char v9 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v9[1] = v3;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  v9[5] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v9 + 16) = a1 & 1;
  void v9[6] = sub_22E0F7610();
  v9[7] = v4;
  v9[11] = v7;
  *((unsigned char *)v9 + 64) = a2 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SettingIntentCATs()
{
  uint64_t v1 = qword_2685C3B40;
  if (!qword_2685C3B40) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0B0530()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0B05A4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0B0600(a1, a2, a3);
}

uint64_t sub_22E0B0600(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7010();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0B07CC()
{
  return type metadata accessor for SettingIntentCATs();
}

BOOL sub_22E0B07E8()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "ClarityUIIntent#CannotDo";
  *(void *)(v0 + 8) = 24;
  *(unsigned char *)(v0 + 16) = 2;
  sub_22DE04404();
  uint64_t v2 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 != 0;
}

uint64_t sub_22E0B08CC()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0B0900()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0B094C()
{
  uint64_t v2 = qword_2685C3B50[0];
  if (!qword_2685C3B50[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2685C3B50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0B09CC()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0B0A0C()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0B0A54()
{
  return sub_22E0F76D0();
}

BOOL sub_22E0B0A9C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_22E0B07E8();
  *a1 = result;
  return result;
}

uint64_t sub_22E0B0ADC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0B08CC();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0B0B0C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B0BD8(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](sub_22E0B0C18, 0);
}

uint64_t sub_22E0B0C18()
{
  v0[2] = v0;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v0[7] = v8;
  char v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = sub_22DF02398;
  uint64_t v3 = v5[4];
  return v9(v3, v6, v7, v8);
}

uint64_t sub_22E0B0D58()
{
  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_22E0B0D94, 0);
}

uint64_t sub_22E0B0D94()
{
  v0[2] = v0;
  uint64_t v8 = sub_22E0F7610();
  uint64_t v5 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v6 = sub_22E0F7C10();
  v0[6] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D048] + (int)*MEMORY[0x263F6D048]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 56) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22DE99D98;
  return v7(v8, v5, v6);
}

uint64_t sub_22E0B0ED0()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ClarityUIIntentCATs()
{
  uint64_t v1 = qword_2685C3B68;
  if (!qword_2685C3B68) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0B0FFC()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0B1070(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0B10CC(a1, a2, a3);
}

uint64_t sub_22E0B10CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7010();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0B1298()
{
  return type metadata accessor for ClarityUIIntentCATs();
}

void *type metadata accessor for ClarityUIIntentCATs.Properties()
{
  return &unk_26E1E0BA8;
}

unint64_t sub_22E0B12C8()
{
  return sub_22E0B12E0();
}

unint64_t sub_22E0B12E0()
{
  uint64_t v2 = qword_2685C3B78;
  if (!qword_2685C3B78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3B78);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_22E0B1360()
{
  if (qword_2685BF780 != -1) {
    swift_once();
  }
  return &qword_2685D7D68;
}

uint64_t sub_22E0B13C4()
{
  type metadata accessor for GetAXOnOffLabelsHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D68 = result;
  return result;
}

uint64_t type metadata accessor for GetAXOnOffLabelsHandler()
{
  return self;
}

void sub_22E0B142C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  uint64_t v5 = sub_22DF08420();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  id v7 = a1;
  swift_retain();
  swift_retain();
  uint64_t v18 = a1;
  uint64_t v19 = v3;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0B1838, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);

  swift_release();
  swift_release();
}

void sub_22E0B1600(void *a1, uint64_t a2, void (*a3)(id))
{
  id v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  BOOL v15 = sub_22DE6CDF4();
  swift_release();
  if (v15) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  id v11 = sub_22DF962A0(v14, 0, 0, v12, 0, 0);

  sub_22E0F7990();
  id v10 = (id)*sub_22DF136D8();
  id v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v9 = v4;
  id v5 = v11;
  sub_22DE10250();
  sub_22DE10320();
  uint64_t v7 = sub_22E0F75A0();
  uint64_t v8 = v6;
  v9[3] = MEMORY[0x263F8D310];
  void v9[4] = sub_22DE103A4();
  *uint64_t v9 = v7;
  v9[1] = v8;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();
}

void sub_22E0B1838()
{
  sub_22E0B1600(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0B186C(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0B1890()
{
  type metadata accessor for SetAXButtonShapesHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D70 = result;
  return result;
}

uint64_t type metadata accessor for SetAXButtonShapesHandler()
{
  return self;
}

uint64_t *sub_22E0B18F8()
{
  if (qword_2685BF788 != -1) {
    swift_once();
  }
  return &qword_2685D7D70;
}

uint64_t sub_22E0B195C(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE6CD20();
  swift_release();
  id v4 = sub_22DF09FD8();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0B1B70, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0B1B70);
}

uint64_t sub_22E0B1B00()
{
  return swift_release();
}

uint64_t sub_22E0B1B70()
{
  return sub_22E0B1B00();
}

uint64_t sub_22E0B1B98(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0B195C(a1, a2, a3);
}

uint64_t *sub_22E0B1BBC()
{
  if (qword_2685BF790 != -1) {
    swift_once();
  }
  return &qword_2685D7D78;
}

uint64_t sub_22E0B1C20()
{
  type metadata accessor for GetAXInvertColorsHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D78 = result;
  return result;
}

uint64_t type metadata accessor for GetAXInvertColorsHandler()
{
  return self;
}

void sub_22E0B1C88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v5 = sub_22DF08374();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0B212C, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22E0B1E58(uint64_t a1, void *a2, void (*a3)(id))
{
  swift_retain();
  BOOL v18 = sub_22DE6D104();
  swift_release();
  sub_22DE10250();
  id v15 = sub_22DE07498(3, 0);
  sub_22DE102B8();
  sub_22E0F7E50();
  uint64_t v17 = v3;
  id v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  *uint64_t v17 = sub_22DF961EC(v19, 0, 0, v13, 0, 0);
  sub_22DE04404();
  id v8 = (id)sub_22E0F7700();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_22E0F7990();
  id v12 = (id)*sub_22DF136D8();
  id v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v11 = v5;
  id v6 = v15;
  sub_22DE10320();
  uint64_t v9 = sub_22E0F75A0();
  uint64_t v10 = v7;
  void v11[3] = MEMORY[0x263F8D310];
  v11[4] = sub_22DE103A4();
  *uint64_t v11 = v9;
  v11[1] = v10;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();
}

void sub_22E0B212C()
{
  sub_22E0B1E58(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0B2160(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0B2184(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  id v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F70D0();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2318(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  id v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F70D0();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2494()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2560()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2614(uint64_t a1, char a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  v7[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v7 + 64) = a2 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B280C(uint64_t a1, char a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  v7[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v7 + 64) = a2 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B29EC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2AB8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2B6C(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsMultiSetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2D00(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsMultiSetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B2E7C(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v102 = a1;
  unsigned int v85 = a2;
  unsigned int v86 = a3;
  uint64_t v87 = a4;
  int v88 = a5;
  int v89 = a6;
  uint64_t v90 = a7;
  uint64_t v91 = a8;
  uint64_t v92 = a9;
  uint64_t v112 = 0;
  char v111 = 0;
  char v110 = 0;
  uint64_t v109 = 0;
  uint64_t v108 = 0;
  char v107 = 0;
  uint64_t v106 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v103 = 0;
  unint64_t v93 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v102, v85, v86, v87);
  uint64_t v94 = (char *)v70 - v93;
  uint64_t v112 = v10;
  int v98 = 1;
  char v111 = v11 & 1;
  char v110 = v12 & 1;
  uint64_t v109 = v13;
  uint64_t v108 = v14;
  char v107 = v15 & 1;
  uint64_t v106 = v16;
  uint64_t v104 = v17;
  uint64_t v105 = v18;
  uint64_t v103 = v9;
  uint64_t v95 = sub_22DE8BE38();
  uint64_t v96 = v19;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v100 = 7;
  uint64_t v99 = sub_22E0F7E50();
  uint64_t v101 = v20;
  uint64_t v21 = sub_22E0F7610();
  uint64_t v22 = v101;
  *uint64_t v101 = v21;
  v22[1] = v23;
  swift_retain();
  if (v102)
  {
    uint64_t v84 = v102;
    uint64_t v83 = v102;
    uint64_t v24 = type metadata accessor for SettingsBinarySetting();
    uint64_t v25 = v101;
    uint64_t v26 = v83;
    v101[5] = v24;
    v25[2] = v26;
  }
  else
  {
    id v69 = v101;
    v101[2] = 0;
    v69[3] = 0;
    v69[4] = 0;
    v69[5] = 0;
  }
  int v82 = 1;
  uint64_t v27 = sub_22E0F7610();
  char v28 = v85;
  char v29 = v82;
  uint64_t v30 = v101;
  v101[6] = v27;
  v30[7] = v31;
  uint64_t v81 = MEMORY[0x263F8D4F8];
  v30[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v30 + 64) = v28 & v29;
  uint64_t v32 = sub_22E0F7610();
  uint64_t v33 = v81;
  char v34 = v86;
  char v35 = v82;
  uint64_t v36 = v101;
  v101[12] = v32;
  v36[13] = v37;
  v36[17] = v33;
  *((unsigned char *)v36 + 112) = v34 & v35;
  uint64_t v38 = sub_22E0F7610();
  char v39 = v101;
  v101[18] = v38;
  v39[19] = v40;
  swift_retain();
  if (v87)
  {
    uint64_t v80 = v87;
    uint64_t v79 = v87;
    uint64_t v41 = sub_22E0F7180();
    id v42 = v101;
    uint64_t v43 = v79;
    v101[23] = v41;
    v42[20] = v43;
  }
  else
  {
    uint64_t v68 = v101;
    v101[20] = 0;
    v68[21] = 0;
    v68[22] = 0;
    v68[23] = 0;
  }
  uint64_t v74 = v101 + 26;
  unsigned int v75 = 1;
  uint64_t v44 = sub_22E0F7610();
  uint64_t v45 = v101;
  uint64_t v46 = v44;
  id v47 = v88;
  uint64_t v49 = v48;
  uint64_t v50 = v94;
  v101[24] = v46;
  v45[25] = v49;
  sub_22DE5A4C4(v47, v50);
  uint64_t v76 = sub_22E0F7100();
  uint64_t v77 = *(void *)(v76 - 8);
  uint64_t v78 = v76 - 8;
  if ((*(unsigned int (**)(char *, void))(v77 + 48))(v94, v75) == 1)
  {
    sub_22DE58794((uint64_t)v94);
    uint64_t v67 = v101;
    v101[26] = 0;
    v67[27] = 0;
    v67[28] = 0;
    v67[29] = 0;
  }
  else
  {
    char v51 = v74;
    v101[29] = v76;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
    (*(void (**)(uint64_t *, char *, uint64_t))(v77 + 32))(boxed_opaque_existential_1, v94, v76);
  }
  int v73 = 1;
  uint64_t v53 = sub_22E0F7610();
  char v54 = v89;
  char v55 = v73;
  uint64_t v56 = v101;
  v101[30] = v53;
  v56[31] = v57;
  v56[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v56 + 256) = v54 & v55;
  uint64_t v58 = sub_22E0F7610();
  uint64_t v59 = v101;
  v101[36] = v58;
  v59[37] = v60;
  swift_retain();
  if (v90)
  {
    uint64_t v72 = v90;
    uint64_t v71 = v90;
    uint64_t v61 = sub_22E0F70D0();
    uint64_t v62 = v101;
    uint64_t v63 = v71;
    v101[41] = v61;
    v62[38] = v63;
  }
  else
  {
    uint64_t v66 = v101;
    v101[38] = 0;
    v66[39] = 0;
    v66[40] = 0;
    v66[41] = 0;
  }
  uint64_t v64 = v99;
  sub_22DE04404();
  v70[0] = v64;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  v70[1] = sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B3454@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v81 = a8;
  uint64_t v97 = a1;
  unsigned int v82 = a2;
  unsigned int v83 = a3;
  uint64_t v84 = a4;
  unsigned int v85 = a5;
  int v86 = a6;
  uint64_t v87 = a7;
  uint64_t v105 = 0;
  char v104 = 0;
  char v103 = 0;
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  char v100 = 0;
  uint64_t v99 = 0;
  uint64_t v98 = 0;
  unint64_t v88 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  int v89 = (char *)v66 - v88;
  uint64_t v105 = MEMORY[0x270FA5388](v97, v82, v83, v84);
  int v93 = 1;
  char v104 = v9 & 1;
  char v103 = v10 & 1;
  uint64_t v102 = v11;
  uint64_t v101 = v12;
  char v100 = v13 & 1;
  uint64_t v99 = v14;
  uint64_t v98 = v8;
  uint64_t v90 = sub_22DE8BE38();
  uint64_t v91 = v15;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v95 = 7;
  uint64_t v94 = sub_22E0F7E50();
  uint64_t v96 = v16;
  uint64_t v17 = sub_22E0F7610();
  uint64_t v18 = v96;
  *uint64_t v96 = v17;
  v18[1] = v19;
  swift_retain();
  if (v97)
  {
    uint64_t v80 = v97;
    uint64_t v79 = v97;
    uint64_t v20 = type metadata accessor for SettingsBinarySetting();
    uint64_t v21 = v96;
    uint64_t v22 = v79;
    v96[5] = v20;
    v21[2] = v22;
  }
  else
  {
    uint64_t v65 = v96;
    v96[2] = 0;
    v65[3] = 0;
    v65[4] = 0;
    v65[5] = 0;
  }
  int v78 = 1;
  uint64_t v23 = sub_22E0F7610();
  char v24 = v82;
  char v25 = v78;
  uint64_t v26 = v96;
  v96[6] = v23;
  v26[7] = v27;
  uint64_t v77 = MEMORY[0x263F8D4F8];
  v26[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v26 + 64) = v24 & v25;
  uint64_t v28 = sub_22E0F7610();
  uint64_t v29 = v77;
  char v30 = v83;
  char v31 = v78;
  uint64_t v32 = v96;
  v96[12] = v28;
  v32[13] = v33;
  v32[17] = v29;
  *((unsigned char *)v32 + 112) = v30 & v31;
  uint64_t v34 = sub_22E0F7610();
  char v35 = v96;
  v96[18] = v34;
  v35[19] = v36;
  swift_retain();
  if (v84)
  {
    uint64_t v76 = v84;
    uint64_t v75 = v84;
    uint64_t v37 = sub_22E0F7180();
    uint64_t v38 = v96;
    uint64_t v39 = v75;
    v96[23] = v37;
    v38[20] = v39;
  }
  else
  {
    uint64_t v64 = v96;
    v96[20] = 0;
    v64[21] = 0;
    v64[22] = 0;
    v64[23] = 0;
  }
  uint64_t v70 = v96 + 26;
  unsigned int v71 = 1;
  uint64_t v40 = sub_22E0F7610();
  uint64_t v41 = v96;
  uint64_t v42 = v40;
  uint64_t v43 = v85;
  uint64_t v45 = v44;
  uint64_t v46 = v89;
  v96[24] = v42;
  v41[25] = v45;
  sub_22DE5A4C4(v43, v46);
  uint64_t v72 = sub_22E0F7100();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = v72 - 8;
  if ((*(unsigned int (**)(char *, void))(v73 + 48))(v89, v71) == 1)
  {
    sub_22DE58794((uint64_t)v89);
    uint64_t v63 = v96;
    v96[26] = 0;
    v63[27] = 0;
    v63[28] = 0;
    v63[29] = 0;
  }
  else
  {
    id v47 = v70;
    v96[29] = v72;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
    (*(void (**)(uint64_t *, char *, uint64_t))(v73 + 32))(boxed_opaque_existential_1, v89, v72);
  }
  int v69 = 1;
  uint64_t v49 = sub_22E0F7610();
  char v50 = v86;
  char v51 = v69;
  char v52 = v96;
  v96[30] = v49;
  v52[31] = v53;
  v52[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v52 + 256) = v50 & v51;
  uint64_t v54 = sub_22E0F7610();
  char v55 = v96;
  v96[36] = v54;
  v55[37] = v56;
  swift_retain();
  if (v87)
  {
    uint64_t v68 = v87;
    uint64_t v67 = v87;
    uint64_t v57 = sub_22E0F70D0();
    uint64_t v58 = v96;
    uint64_t v59 = v67;
    v96[41] = v57;
    v58[38] = v59;
  }
  else
  {
    uint64_t v62 = v96;
    v96[38] = 0;
    v62[39] = 0;
    v62[40] = 0;
    v62[41] = 0;
  }
  uint64_t v60 = v94;
  sub_22DE04404();
  v66[1] = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  v66[2] = sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B39EC(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v101 = a1;
  unsigned int v84 = a2;
  unsigned int v85 = a3;
  uint64_t v86 = a4;
  uint64_t v87 = a5;
  int v88 = a6;
  uint64_t v89 = a7;
  uint64_t v90 = a8;
  uint64_t v92 = a9;
  uint64_t v111 = 0;
  char v110 = 0;
  char v109 = 0;
  uint64_t v108 = 0;
  uint64_t v107 = 0;
  char v106 = 0;
  uint64_t v105 = 0;
  uint64_t v103 = 0;
  uint64_t v104 = 0;
  uint64_t v102 = 0;
  unint64_t v91 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v101, v84, v85, v86);
  int v93 = (char *)v69 - v91;
  uint64_t v111 = v10;
  int v97 = 1;
  char v110 = v11 & 1;
  char v109 = v12 & 1;
  uint64_t v108 = v13;
  uint64_t v107 = v14;
  char v106 = v15 & 1;
  uint64_t v105 = v16;
  uint64_t v103 = v17;
  uint64_t v104 = a9;
  uint64_t v102 = v9;
  uint64_t v94 = sub_22E0F7610();
  uint64_t v95 = v18;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v99 = 7;
  uint64_t v98 = sub_22E0F7E50();
  char v100 = v19;
  uint64_t v20 = sub_22E0F7610();
  uint64_t v21 = v100;
  *char v100 = v20;
  v21[1] = v22;
  swift_retain();
  if (v101)
  {
    uint64_t v83 = v101;
    uint64_t v82 = v101;
    uint64_t v23 = type metadata accessor for SettingsBinarySetting();
    char v24 = v100;
    uint64_t v25 = v82;
    v100[5] = v23;
    v24[2] = v25;
  }
  else
  {
    uint64_t v68 = v100;
    v100[2] = 0;
    v68[3] = 0;
    v68[4] = 0;
    v68[5] = 0;
  }
  int v81 = 1;
  uint64_t v26 = sub_22E0F7610();
  char v27 = v84;
  char v28 = v81;
  uint64_t v29 = v100;
  v100[6] = v26;
  v29[7] = v30;
  uint64_t v80 = MEMORY[0x263F8D4F8];
  v29[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v29 + 64) = v27 & v28;
  uint64_t v31 = sub_22E0F7610();
  uint64_t v32 = v80;
  char v33 = v85;
  char v34 = v81;
  char v35 = v100;
  v100[12] = v31;
  v35[13] = v36;
  v35[17] = v32;
  *((unsigned char *)v35 + 112) = v33 & v34;
  uint64_t v37 = sub_22E0F7610();
  uint64_t v38 = v100;
  v100[18] = v37;
  v38[19] = v39;
  swift_retain();
  if (v86)
  {
    uint64_t v79 = v86;
    uint64_t v78 = v86;
    uint64_t v40 = sub_22E0F7180();
    uint64_t v41 = v100;
    uint64_t v42 = v78;
    v100[23] = v40;
    v41[20] = v42;
  }
  else
  {
    uint64_t v67 = v100;
    v100[20] = 0;
    v67[21] = 0;
    v67[22] = 0;
    v67[23] = 0;
  }
  uint64_t v73 = v100 + 26;
  unsigned int v74 = 1;
  uint64_t v43 = sub_22E0F7610();
  uint64_t v44 = v100;
  uint64_t v45 = v43;
  uint64_t v46 = v87;
  uint64_t v48 = v47;
  uint64_t v49 = v93;
  v100[24] = v45;
  v44[25] = v48;
  sub_22DE5A4C4(v46, v49);
  uint64_t v75 = sub_22E0F7100();
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = v75 - 8;
  if ((*(unsigned int (**)(char *, void))(v76 + 48))(v93, v74) == 1)
  {
    sub_22DE58794((uint64_t)v93);
    uint64_t v66 = v100;
    v100[26] = 0;
    v66[27] = 0;
    v66[28] = 0;
    v66[29] = 0;
  }
  else
  {
    char v50 = v73;
    v100[29] = v75;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v50);
    (*(void (**)(uint64_t *, char *, uint64_t))(v76 + 32))(boxed_opaque_existential_1, v93, v75);
  }
  int v72 = 1;
  uint64_t v52 = sub_22E0F7610();
  char v53 = v88;
  char v54 = v72;
  char v55 = v100;
  v100[30] = v52;
  v55[31] = v56;
  v55[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v55 + 256) = v53 & v54;
  uint64_t v57 = sub_22E0F7610();
  uint64_t v58 = v100;
  v100[36] = v57;
  v58[37] = v59;
  swift_retain();
  if (v89)
  {
    uint64_t v71 = v89;
    uint64_t v70 = v89;
    uint64_t v60 = sub_22E0F70D0();
    uint64_t v61 = v100;
    uint64_t v62 = v70;
    v100[41] = v60;
    v61[38] = v62;
  }
  else
  {
    uint64_t v65 = v100;
    v100[38] = 0;
    v65[39] = 0;
    v65[40] = 0;
    v65[41] = 0;
  }
  uint64_t v63 = v98;
  sub_22DE04404();
  v69[0] = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  v69[1] = sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B3FD4@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v81 = a8;
  uint64_t v97 = a1;
  unsigned int v82 = a2;
  unsigned int v83 = a3;
  uint64_t v84 = a4;
  unsigned int v85 = a5;
  int v86 = a6;
  uint64_t v87 = a7;
  uint64_t v105 = 0;
  char v104 = 0;
  char v103 = 0;
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  char v100 = 0;
  uint64_t v99 = 0;
  uint64_t v98 = 0;
  unint64_t v88 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v89 = (char *)v66 - v88;
  uint64_t v105 = MEMORY[0x270FA5388](v97, v82, v83, v84);
  int v93 = 1;
  char v104 = v9 & 1;
  char v103 = v10 & 1;
  uint64_t v102 = v11;
  uint64_t v101 = v12;
  char v100 = v13 & 1;
  uint64_t v99 = v14;
  uint64_t v98 = v8;
  uint64_t v90 = sub_22E0F7610();
  uint64_t v91 = v15;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v95 = 7;
  uint64_t v94 = sub_22E0F7E50();
  uint64_t v96 = v16;
  uint64_t v17 = sub_22E0F7610();
  uint64_t v18 = v96;
  *uint64_t v96 = v17;
  v18[1] = v19;
  swift_retain();
  if (v97)
  {
    uint64_t v80 = v97;
    uint64_t v79 = v97;
    uint64_t v20 = type metadata accessor for SettingsBinarySetting();
    uint64_t v21 = v96;
    uint64_t v22 = v79;
    v96[5] = v20;
    v21[2] = v22;
  }
  else
  {
    uint64_t v65 = v96;
    v96[2] = 0;
    v65[3] = 0;
    v65[4] = 0;
    v65[5] = 0;
  }
  int v78 = 1;
  uint64_t v23 = sub_22E0F7610();
  char v24 = v82;
  char v25 = v78;
  uint64_t v26 = v96;
  v96[6] = v23;
  v26[7] = v27;
  uint64_t v77 = MEMORY[0x263F8D4F8];
  v26[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v26 + 64) = v24 & v25;
  uint64_t v28 = sub_22E0F7610();
  uint64_t v29 = v77;
  char v30 = v83;
  char v31 = v78;
  uint64_t v32 = v96;
  v96[12] = v28;
  v32[13] = v33;
  v32[17] = v29;
  *((unsigned char *)v32 + 112) = v30 & v31;
  uint64_t v34 = sub_22E0F7610();
  char v35 = v96;
  v96[18] = v34;
  v35[19] = v36;
  swift_retain();
  if (v84)
  {
    uint64_t v76 = v84;
    uint64_t v75 = v84;
    uint64_t v37 = sub_22E0F7180();
    uint64_t v38 = v96;
    uint64_t v39 = v75;
    v96[23] = v37;
    v38[20] = v39;
  }
  else
  {
    uint64_t v64 = v96;
    v96[20] = 0;
    v64[21] = 0;
    v64[22] = 0;
    v64[23] = 0;
  }
  uint64_t v70 = v96 + 26;
  unsigned int v71 = 1;
  uint64_t v40 = sub_22E0F7610();
  uint64_t v41 = v96;
  uint64_t v42 = v40;
  uint64_t v43 = v85;
  uint64_t v45 = v44;
  uint64_t v46 = v89;
  v96[24] = v42;
  v41[25] = v45;
  sub_22DE5A4C4(v43, v46);
  uint64_t v72 = sub_22E0F7100();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = v72 - 8;
  if ((*(unsigned int (**)(char *, void))(v73 + 48))(v89, v71) == 1)
  {
    sub_22DE58794((uint64_t)v89);
    uint64_t v63 = v96;
    v96[26] = 0;
    v63[27] = 0;
    v63[28] = 0;
    v63[29] = 0;
  }
  else
  {
    uint64_t v47 = v70;
    v96[29] = v72;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
    (*(void (**)(uint64_t *, char *, uint64_t))(v73 + 32))(boxed_opaque_existential_1, v89, v72);
  }
  int v69 = 1;
  uint64_t v49 = sub_22E0F7610();
  char v50 = v86;
  char v51 = v69;
  uint64_t v52 = v96;
  v96[30] = v49;
  v52[31] = v53;
  v52[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v52 + 256) = v50 & v51;
  uint64_t v54 = sub_22E0F7610();
  char v55 = v96;
  v96[36] = v54;
  v55[37] = v56;
  swift_retain();
  if (v87)
  {
    uint64_t v68 = v87;
    uint64_t v67 = v87;
    uint64_t v57 = sub_22E0F70D0();
    uint64_t v58 = v96;
    uint64_t v59 = v67;
    v96[41] = v57;
    v58[38] = v59;
  }
  else
  {
    uint64_t v62 = v96;
    v96[38] = 0;
    v62[39] = 0;
    v62[40] = 0;
    v62[41] = 0;
  }
  uint64_t v60 = v94;
  sub_22DE04404();
  v66[1] = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  v66[2] = sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B457C(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v110 = a1;
  unsigned int v93 = a2;
  unsigned int v94 = a3;
  uint64_t v95 = a4;
  uint64_t v96 = a5;
  int v97 = a6;
  uint64_t v98 = a7;
  int v99 = a8;
  uint64_t v101 = a9;
  uint64_t v102 = a10;
  uint64_t v121 = 0;
  char v120 = 0;
  char v119 = 0;
  uint64_t v118 = 0;
  uint64_t v117 = 0;
  char v116 = 0;
  uint64_t v115 = 0;
  char v114 = 0;
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  uint64_t v111 = 0;
  unint64_t v100 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v110, v93, v94, v95);
  char v103 = (char *)&v76 - v100;
  uint64_t v121 = v11;
  int v107 = 1;
  char v120 = v12 & 1;
  char v119 = v13 & 1;
  uint64_t v118 = v14;
  uint64_t v117 = v15;
  char v116 = v16 & 1;
  uint64_t v115 = v17;
  char v114 = v18 & 1;
  uint64_t v112 = a9;
  uint64_t v113 = a10;
  uint64_t v111 = v10;
  uint64_t v104 = sub_22E0F7610();
  uint64_t v105 = v19;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v108 = sub_22E0F7E50();
  char v109 = v20;
  uint64_t v21 = sub_22E0F7610();
  uint64_t v22 = v109;
  *char v109 = v21;
  v22[1] = v23;
  swift_retain();
  if (v110)
  {
    uint64_t v92 = v110;
    uint64_t v91 = v110;
    uint64_t v24 = type metadata accessor for SettingsMultiSetting();
    char v25 = v109;
    uint64_t v26 = v91;
    uint64_t v109[5] = v24;
    v25[2] = v26;
  }
  else
  {
    uint64_t v75 = v109;
    v109[2] = 0;
    v75[3] = 0;
    v75[4] = 0;
    v75[5] = 0;
  }
  int v90 = 1;
  uint64_t v27 = sub_22E0F7610();
  char v28 = v93;
  char v29 = v90;
  char v30 = v109;
  v109[6] = v27;
  v30[7] = v31;
  uint64_t v89 = MEMORY[0x263F8D4F8];
  v30[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v30 + 64) = v28 & v29;
  uint64_t v32 = sub_22E0F7610();
  uint64_t v33 = v89;
  char v34 = v94;
  char v35 = v90;
  uint64_t v36 = v109;
  v109[12] = v32;
  v36[13] = v37;
  v36[17] = v33;
  *((unsigned char *)v36 + 112) = v34 & v35;
  uint64_t v38 = sub_22E0F7610();
  uint64_t v39 = v109;
  v109[18] = v38;
  v39[19] = v40;
  swift_retain();
  if (v95)
  {
    uint64_t v88 = v95;
    uint64_t v87 = v95;
    uint64_t v41 = sub_22E0F7180();
    uint64_t v42 = v109;
    uint64_t v43 = v87;
    v109[23] = v41;
    v42[20] = v43;
  }
  else
  {
    uint64_t v74 = v109;
    v109[20] = 0;
    v74[21] = 0;
    v74[22] = 0;
    v74[23] = 0;
  }
  unsigned int v82 = v109 + 26;
  unsigned int v83 = 1;
  uint64_t v44 = sub_22E0F7610();
  uint64_t v45 = v109;
  uint64_t v46 = v44;
  uint64_t v47 = v96;
  uint64_t v49 = v48;
  char v50 = v103;
  v109[24] = v46;
  v45[25] = v49;
  sub_22DE5A4C4(v47, v50);
  uint64_t v84 = sub_22E0F7100();
  uint64_t v85 = *(void *)(v84 - 8);
  uint64_t v86 = v84 - 8;
  if ((*(unsigned int (**)(char *, void))(v85 + 48))(v103, v83) == 1)
  {
    sub_22DE58794((uint64_t)v103);
    uint64_t v73 = v109;
    v109[26] = 0;
    v73[27] = 0;
    v73[28] = 0;
    v73[29] = 0;
  }
  else
  {
    char v51 = v82;
    v109[29] = v84;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
    (*(void (**)(uint64_t *, char *, uint64_t))(v85 + 32))(boxed_opaque_existential_1, v103, v84);
  }
  int v81 = 1;
  uint64_t v53 = sub_22E0F7610();
  char v54 = v97;
  char v55 = v81;
  uint64_t v56 = v109;
  v109[30] = v53;
  v56[31] = v57;
  v56[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v56 + 256) = v54 & v55;
  uint64_t v58 = sub_22E0F7610();
  uint64_t v59 = v109;
  v109[36] = v58;
  v59[37] = v60;
  swift_retain();
  if (v98)
  {
    uint64_t v80 = v98;
    uint64_t v79 = v98;
    uint64_t v61 = sub_22E0F70D0();
    uint64_t v62 = v109;
    uint64_t v63 = v79;
    v109[41] = v61;
    v62[38] = v63;
  }
  else
  {
    uint64_t v72 = v109;
    v109[38] = 0;
    v72[39] = 0;
    v72[40] = 0;
    v72[41] = 0;
  }
  HIDWORD(v76) = 1;
  uint64_t v64 = sub_22E0F7610();
  char v65 = BYTE4(v76);
  char v66 = v99;
  uint64_t v67 = v109;
  uint64_t v68 = v64;
  uint64_t v69 = v108;
  v109[42] = v68;
  v67[43] = v70;
  v67[47] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v67 + 352) = v66 & v65;
  sub_22DE04404();
  uint64_t v77 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v78 = sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B4BDC@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v92 = a9;
  uint64_t v108 = a1;
  unsigned int v93 = a2;
  unsigned int v94 = a3;
  uint64_t v95 = a4;
  uint64_t v96 = a5;
  int v97 = a6;
  uint64_t v98 = a7;
  int v99 = a8;
  uint64_t v117 = 0;
  char v116 = 0;
  char v115 = 0;
  uint64_t v114 = 0;
  uint64_t v113 = 0;
  char v112 = 0;
  uint64_t v111 = 0;
  char v110 = 0;
  uint64_t v109 = 0;
  unint64_t v100 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v101 = (char *)&v74 - v100;
  uint64_t v117 = MEMORY[0x270FA5388](v108, v93, v94, v95);
  int v105 = 1;
  char v116 = v10 & 1;
  char v115 = v11 & 1;
  uint64_t v114 = v12;
  uint64_t v113 = v13;
  char v112 = v14 & 1;
  uint64_t v111 = v15;
  char v110 = v16 & 1;
  uint64_t v109 = v9;
  uint64_t v102 = sub_22E0F7610();
  uint64_t v103 = v17;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v106 = sub_22E0F7E50();
  int v107 = v18;
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v107;
  *int v107 = v19;
  v20[1] = v21;
  swift_retain();
  if (v108)
  {
    uint64_t v91 = v108;
    uint64_t v90 = v108;
    uint64_t v22 = type metadata accessor for SettingsMultiSetting();
    uint64_t v23 = v107;
    uint64_t v24 = v90;
    v107[5] = v22;
    v23[2] = v24;
  }
  else
  {
    uint64_t v73 = v107;
    v107[2] = 0;
    v73[3] = 0;
    v73[4] = 0;
    v73[5] = 0;
  }
  int v89 = 1;
  uint64_t v25 = sub_22E0F7610();
  char v26 = v93;
  char v27 = v89;
  char v28 = v107;
  v107[6] = v25;
  v28[7] = v29;
  uint64_t v88 = MEMORY[0x263F8D4F8];
  v28[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v28 + 64) = v26 & v27;
  uint64_t v30 = sub_22E0F7610();
  uint64_t v31 = v88;
  char v32 = v94;
  char v33 = v89;
  char v34 = v107;
  v107[12] = v30;
  v34[13] = v35;
  v34[17] = v31;
  *((unsigned char *)v34 + 112) = v32 & v33;
  uint64_t v36 = sub_22E0F7610();
  uint64_t v37 = v107;
  v107[18] = v36;
  v37[19] = v38;
  swift_retain();
  if (v95)
  {
    uint64_t v87 = v95;
    uint64_t v86 = v95;
    uint64_t v39 = sub_22E0F7180();
    uint64_t v40 = v107;
    uint64_t v41 = v86;
    v107[23] = v39;
    v40[20] = v41;
  }
  else
  {
    uint64_t v72 = v107;
    v107[20] = 0;
    v72[21] = 0;
    v72[22] = 0;
    v72[23] = 0;
  }
  int v81 = v107 + 26;
  unsigned int v82 = 1;
  uint64_t v42 = sub_22E0F7610();
  uint64_t v43 = v107;
  uint64_t v44 = v42;
  uint64_t v45 = v96;
  uint64_t v47 = v46;
  uint64_t v48 = v101;
  v107[24] = v44;
  v43[25] = v47;
  sub_22DE5A4C4(v45, v48);
  uint64_t v83 = sub_22E0F7100();
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v85 = v83 - 8;
  if ((*(unsigned int (**)(char *, void))(v84 + 48))(v101, v82) == 1)
  {
    sub_22DE58794((uint64_t)v101);
    unsigned int v71 = v107;
    v107[26] = 0;
    v71[27] = 0;
    v71[28] = 0;
    v71[29] = 0;
  }
  else
  {
    uint64_t v49 = v81;
    v107[29] = v83;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
    (*(void (**)(uint64_t *, char *, uint64_t))(v84 + 32))(boxed_opaque_existential_1, v101, v83);
  }
  int v80 = 1;
  uint64_t v51 = sub_22E0F7610();
  char v52 = v97;
  char v53 = v80;
  char v54 = v107;
  v107[30] = v51;
  v54[31] = v55;
  v54[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v54 + 256) = v52 & v53;
  uint64_t v56 = sub_22E0F7610();
  uint64_t v57 = v107;
  v107[36] = v56;
  v57[37] = v58;
  swift_retain();
  if (v98)
  {
    uint64_t v79 = v98;
    uint64_t v78 = v98;
    uint64_t v59 = sub_22E0F70D0();
    uint64_t v60 = v107;
    uint64_t v61 = v78;
    v107[41] = v59;
    v60[38] = v61;
  }
  else
  {
    uint64_t v70 = v107;
    v107[38] = 0;
    v70[39] = 0;
    v70[40] = 0;
    v70[41] = 0;
  }
  int v75 = 1;
  uint64_t v62 = sub_22E0F7610();
  char v63 = v75;
  char v64 = v99;
  char v65 = v107;
  uint64_t v66 = v62;
  uint64_t v67 = v106;
  v107[42] = v66;
  v65[43] = v68;
  v65[47] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v65 + 352) = v64 & v63;
  sub_22DE04404();
  uint64_t v76 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v77 = sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B51F8(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v110 = a1;
  unsigned int v93 = a2;
  unsigned int v94 = a3;
  uint64_t v95 = a4;
  uint64_t v96 = a5;
  int v97 = a6;
  uint64_t v98 = a7;
  int v99 = a8;
  uint64_t v101 = a9;
  uint64_t v102 = a10;
  uint64_t v121 = 0;
  char v120 = 0;
  char v119 = 0;
  uint64_t v118 = 0;
  uint64_t v117 = 0;
  char v116 = 0;
  uint64_t v115 = 0;
  char v114 = 0;
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  uint64_t v111 = 0;
  unint64_t v100 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v110, v93, v94, v95);
  uint64_t v103 = (char *)&v76 - v100;
  uint64_t v121 = v11;
  int v107 = 1;
  char v120 = v12 & 1;
  char v119 = v13 & 1;
  uint64_t v118 = v14;
  uint64_t v117 = v15;
  char v116 = v16 & 1;
  uint64_t v115 = v17;
  char v114 = v18 & 1;
  uint64_t v112 = a9;
  uint64_t v113 = a10;
  uint64_t v111 = v10;
  uint64_t v104 = sub_22E0F7610();
  uint64_t v105 = v19;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v108 = sub_22E0F7E50();
  uint64_t v109 = v20;
  uint64_t v21 = sub_22E0F7610();
  uint64_t v22 = v109;
  *uint64_t v109 = v21;
  v22[1] = v23;
  swift_retain();
  if (v110)
  {
    uint64_t v92 = v110;
    uint64_t v91 = v110;
    uint64_t v24 = type metadata accessor for SettingsMultiSetting();
    uint64_t v25 = v109;
    uint64_t v26 = v91;
    uint64_t v109[5] = v24;
    v25[2] = v26;
  }
  else
  {
    int v75 = v109;
    v109[2] = 0;
    v75[3] = 0;
    v75[4] = 0;
    v75[5] = 0;
  }
  int v90 = 1;
  uint64_t v27 = sub_22E0F7610();
  char v28 = v93;
  char v29 = v90;
  uint64_t v30 = v109;
  v109[6] = v27;
  v30[7] = v31;
  uint64_t v89 = MEMORY[0x263F8D4F8];
  v30[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v30 + 64) = v28 & v29;
  uint64_t v32 = sub_22E0F7610();
  uint64_t v33 = v89;
  char v34 = v94;
  char v35 = v90;
  uint64_t v36 = v109;
  v109[12] = v32;
  v36[13] = v37;
  v36[17] = v33;
  *((unsigned char *)v36 + 112) = v34 & v35;
  uint64_t v38 = sub_22E0F7610();
  uint64_t v39 = v109;
  v109[18] = v38;
  v39[19] = v40;
  swift_retain();
  if (v95)
  {
    uint64_t v88 = v95;
    uint64_t v87 = v95;
    uint64_t v41 = sub_22E0F7180();
    uint64_t v42 = v109;
    uint64_t v43 = v87;
    v109[23] = v41;
    v42[20] = v43;
  }
  else
  {
    uint64_t v74 = v109;
    v109[20] = 0;
    v74[21] = 0;
    v74[22] = 0;
    v74[23] = 0;
  }
  unsigned int v82 = v109 + 26;
  unsigned int v83 = 1;
  uint64_t v44 = sub_22E0F7610();
  uint64_t v45 = v109;
  uint64_t v46 = v44;
  uint64_t v47 = v96;
  uint64_t v49 = v48;
  char v50 = v103;
  v109[24] = v46;
  v45[25] = v49;
  sub_22DE5A4C4(v47, v50);
  uint64_t v84 = sub_22E0F7100();
  uint64_t v85 = *(void *)(v84 - 8);
  uint64_t v86 = v84 - 8;
  if ((*(unsigned int (**)(char *, void))(v85 + 48))(v103, v83) == 1)
  {
    sub_22DE58794((uint64_t)v103);
    uint64_t v73 = v109;
    v109[26] = 0;
    v73[27] = 0;
    v73[28] = 0;
    v73[29] = 0;
  }
  else
  {
    uint64_t v51 = v82;
    v109[29] = v84;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
    (*(void (**)(uint64_t *, char *, uint64_t))(v85 + 32))(boxed_opaque_existential_1, v103, v84);
  }
  int v81 = 1;
  uint64_t v53 = sub_22E0F7610();
  char v54 = v97;
  char v55 = v81;
  uint64_t v56 = v109;
  v109[30] = v53;
  v56[31] = v57;
  v56[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v56 + 256) = v54 & v55;
  uint64_t v58 = sub_22E0F7610();
  uint64_t v59 = v109;
  v109[36] = v58;
  v59[37] = v60;
  swift_retain();
  if (v98)
  {
    uint64_t v80 = v98;
    uint64_t v79 = v98;
    uint64_t v61 = sub_22E0F70D0();
    uint64_t v62 = v109;
    uint64_t v63 = v79;
    v109[41] = v61;
    v62[38] = v63;
  }
  else
  {
    uint64_t v72 = v109;
    v109[38] = 0;
    v72[39] = 0;
    v72[40] = 0;
    v72[41] = 0;
  }
  HIDWORD(v76) = 1;
  uint64_t v64 = sub_22E0F7610();
  char v65 = BYTE4(v76);
  char v66 = v99;
  uint64_t v67 = v109;
  uint64_t v68 = v64;
  uint64_t v69 = v108;
  v109[42] = v68;
  v67[43] = v70;
  v67[47] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v67 + 352) = v66 & v65;
  sub_22DE04404();
  uint64_t v77 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v78 = sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B5858@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v92 = a9;
  uint64_t v108 = a1;
  unsigned int v93 = a2;
  unsigned int v94 = a3;
  uint64_t v95 = a4;
  uint64_t v96 = a5;
  int v97 = a6;
  uint64_t v98 = a7;
  int v99 = a8;
  uint64_t v117 = 0;
  char v116 = 0;
  char v115 = 0;
  uint64_t v114 = 0;
  uint64_t v113 = 0;
  char v112 = 0;
  uint64_t v111 = 0;
  char v110 = 0;
  uint64_t v109 = 0;
  unint64_t v100 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v101 = (char *)&v74 - v100;
  uint64_t v117 = MEMORY[0x270FA5388](v108, v93, v94, v95);
  int v105 = 1;
  char v116 = v10 & 1;
  char v115 = v11 & 1;
  uint64_t v114 = v12;
  uint64_t v113 = v13;
  char v112 = v14 & 1;
  uint64_t v111 = v15;
  char v110 = v16 & 1;
  uint64_t v109 = v9;
  uint64_t v102 = sub_22E0F7610();
  uint64_t v103 = v17;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v106 = sub_22E0F7E50();
  int v107 = v18;
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v107;
  *int v107 = v19;
  v20[1] = v21;
  swift_retain();
  if (v108)
  {
    uint64_t v91 = v108;
    uint64_t v90 = v108;
    uint64_t v22 = type metadata accessor for SettingsMultiSetting();
    uint64_t v23 = v107;
    uint64_t v24 = v90;
    v107[5] = v22;
    v23[2] = v24;
  }
  else
  {
    uint64_t v73 = v107;
    v107[2] = 0;
    v73[3] = 0;
    v73[4] = 0;
    v73[5] = 0;
  }
  int v89 = 1;
  uint64_t v25 = sub_22E0F7610();
  char v26 = v93;
  char v27 = v89;
  char v28 = v107;
  v107[6] = v25;
  v28[7] = v29;
  uint64_t v88 = MEMORY[0x263F8D4F8];
  v28[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v28 + 64) = v26 & v27;
  uint64_t v30 = sub_22E0F7610();
  uint64_t v31 = v88;
  char v32 = v94;
  char v33 = v89;
  char v34 = v107;
  v107[12] = v30;
  v34[13] = v35;
  v34[17] = v31;
  *((unsigned char *)v34 + 112) = v32 & v33;
  uint64_t v36 = sub_22E0F7610();
  uint64_t v37 = v107;
  v107[18] = v36;
  v37[19] = v38;
  swift_retain();
  if (v95)
  {
    uint64_t v87 = v95;
    uint64_t v86 = v95;
    uint64_t v39 = sub_22E0F7180();
    uint64_t v40 = v107;
    uint64_t v41 = v86;
    v107[23] = v39;
    v40[20] = v41;
  }
  else
  {
    uint64_t v72 = v107;
    v107[20] = 0;
    v72[21] = 0;
    v72[22] = 0;
    v72[23] = 0;
  }
  int v81 = v107 + 26;
  unsigned int v82 = 1;
  uint64_t v42 = sub_22E0F7610();
  uint64_t v43 = v107;
  uint64_t v44 = v42;
  uint64_t v45 = v96;
  uint64_t v47 = v46;
  uint64_t v48 = v101;
  v107[24] = v44;
  v43[25] = v47;
  sub_22DE5A4C4(v45, v48);
  uint64_t v83 = sub_22E0F7100();
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v85 = v83 - 8;
  if ((*(unsigned int (**)(char *, void))(v84 + 48))(v101, v82) == 1)
  {
    sub_22DE58794((uint64_t)v101);
    unsigned int v71 = v107;
    v107[26] = 0;
    v71[27] = 0;
    v71[28] = 0;
    v71[29] = 0;
  }
  else
  {
    uint64_t v49 = v81;
    v107[29] = v83;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
    (*(void (**)(uint64_t *, char *, uint64_t))(v84 + 32))(boxed_opaque_existential_1, v101, v83);
  }
  int v80 = 1;
  uint64_t v51 = sub_22E0F7610();
  char v52 = v97;
  char v53 = v80;
  char v54 = v107;
  v107[30] = v51;
  v54[31] = v55;
  v54[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v54 + 256) = v52 & v53;
  uint64_t v56 = sub_22E0F7610();
  uint64_t v57 = v107;
  v107[36] = v56;
  v57[37] = v58;
  swift_retain();
  if (v98)
  {
    uint64_t v79 = v98;
    uint64_t v78 = v98;
    uint64_t v59 = sub_22E0F70D0();
    uint64_t v60 = v107;
    uint64_t v61 = v78;
    v107[41] = v59;
    v60[38] = v61;
  }
  else
  {
    uint64_t v70 = v107;
    v107[38] = 0;
    v70[39] = 0;
    v70[40] = 0;
    v70[41] = 0;
  }
  int v75 = 1;
  uint64_t v62 = sub_22E0F7610();
  char v63 = v75;
  char v64 = v99;
  char v65 = v107;
  uint64_t v66 = v62;
  uint64_t v67 = v106;
  v107[42] = v66;
  v65[43] = v68;
  v65[47] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v65 + 352) = v64 & v63;
  sub_22DE04404();
  uint64_t v76 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v77 = sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B5E74(uint64_t a1, char a2, uint64_t a3, char a4)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v13 = v4;
  *uint64_t v4 = sub_22E0F7610();
  v13[1] = v5;
  swift_retain();
  if (a1)
  {
    v13[5] = type metadata accessor for SettingsBinarySetting();
    v13[2] = a1;
  }
  else
  {
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  v13[6] = sub_22E0F7610();
  v13[7] = v6;
  v13[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v13 + 64) = a2 & 1;
  v13[12] = sub_22E0F7610();
  v13[13] = v7;
  swift_retain();
  if (a3)
  {
    v13[17] = sub_22E0F7180();
    v13[14] = a3;
  }
  else
  {
    v13[14] = 0;
    v13[15] = 0;
    v13[16] = 0;
    v13[17] = 0;
  }
  v13[18] = sub_22E0F7610();
  v13[19] = v8;
  v13[23] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v13 + 160) = a4 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B6160(uint64_t a1, char a2, uint64_t a3, char a4)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v13 = v4;
  *uint64_t v4 = sub_22E0F7610();
  v13[1] = v5;
  swift_retain();
  if (a1)
  {
    v13[5] = type metadata accessor for SettingsBinarySetting();
    v13[2] = a1;
  }
  else
  {
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  v13[6] = sub_22E0F7610();
  v13[7] = v6;
  v13[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v13 + 64) = a2 & 1;
  v13[12] = sub_22E0F7610();
  v13[13] = v7;
  swift_retain();
  if (a3)
  {
    v13[17] = sub_22E0F7180();
    v13[14] = a3;
  }
  else
  {
    v13[14] = 0;
    v13[15] = 0;
    v13[16] = 0;
    v13[17] = 0;
  }
  v13[18] = sub_22E0F7610();
  v13[19] = v8;
  v13[23] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v13 + 160) = a4 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B6434(uint64_t a1, unsigned int a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v81 = a1;
  unsigned int v67 = a2;
  uint64_t v68 = a3;
  uint64_t v69 = a4;
  uint64_t v70 = a5;
  uint64_t v71 = a6;
  uint64_t v72 = a7;
  uint64_t v89 = 0;
  char v88 = 0;
  uint64_t v87 = 0;
  uint64_t v86 = 0;
  uint64_t v85 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v82 = 0;
  unint64_t v73 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v74 = (char *)v54 - v73;
  uint64_t v89 = MEMORY[0x270FA5388](v81, v67, v68, v69);
  int v78 = 1;
  char v88 = v8 & 1;
  uint64_t v87 = v9;
  uint64_t v86 = v10;
  uint64_t v85 = v11;
  uint64_t v83 = v12;
  uint64_t v84 = v13;
  uint64_t v82 = v7;
  uint64_t v75 = sub_22E0F7610();
  uint64_t v76 = v14;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v79 = sub_22E0F7E50();
  int v80 = v15;
  uint64_t v16 = sub_22E0F7610();
  uint64_t v17 = v80;
  *int v80 = v16;
  v17[1] = v18;
  swift_retain();
  if (v81)
  {
    uint64_t v66 = v81;
    uint64_t v65 = v81;
    uint64_t v19 = type metadata accessor for SettingsBinarySetting();
    uint64_t v20 = v80;
    uint64_t v21 = v65;
    v80[5] = v19;
    v20[2] = v21;
  }
  else
  {
    char v53 = v80;
    v80[2] = 0;
    v53[3] = 0;
    v53[4] = 0;
    v53[5] = 0;
  }
  int v64 = 1;
  uint64_t v22 = sub_22E0F7610();
  char v23 = v67;
  char v24 = v64;
  uint64_t v25 = v80;
  v80[6] = v22;
  v25[7] = v26;
  v25[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v25 + 64) = v23 & v24;
  uint64_t v27 = sub_22E0F7610();
  char v28 = v80;
  v80[12] = v27;
  v28[13] = v29;
  swift_retain();
  if (v68)
  {
    uint64_t v63 = v68;
    uint64_t v62 = v68;
    uint64_t v30 = sub_22E0F7180();
    uint64_t v31 = v80;
    uint64_t v32 = v62;
    v80[17] = v30;
    v31[14] = v32;
  }
  else
  {
    char v52 = v80;
    v80[14] = 0;
    v52[15] = 0;
    v52[16] = 0;
    v52[17] = 0;
  }
  uint64_t v57 = v80 + 20;
  unsigned int v58 = 1;
  uint64_t v33 = sub_22E0F7610();
  char v34 = v80;
  uint64_t v35 = v33;
  uint64_t v36 = v69;
  uint64_t v38 = v37;
  uint64_t v39 = v74;
  v80[18] = v35;
  v34[19] = v38;
  sub_22DE5A4C4(v36, v39);
  uint64_t v59 = sub_22E0F7100();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = v59 - 8;
  if ((*(unsigned int (**)(char *, void))(v60 + 48))(v74, v58) == 1)
  {
    sub_22DE58794((uint64_t)v74);
    uint64_t v51 = v80;
    v80[20] = 0;
    v51[21] = 0;
    v51[22] = 0;
    v51[23] = 0;
  }
  else
  {
    uint64_t v40 = v57;
    v80[23] = v59;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
    (*(void (**)(uint64_t *, char *, uint64_t))(v60 + 32))(boxed_opaque_existential_1, v74, v59);
  }
  uint64_t v42 = sub_22E0F7610();
  uint64_t v43 = v80;
  v80[24] = v42;
  v43[25] = v44;
  swift_retain();
  if (v70)
  {
    uint64_t v56 = v70;
    uint64_t v55 = v70;
    uint64_t v45 = sub_22E0F70D0();
    uint64_t v46 = v80;
    uint64_t v47 = v55;
    v80[29] = v45;
    v46[26] = v47;
  }
  else
  {
    char v50 = v80;
    v80[26] = 0;
    v50[27] = 0;
    v50[28] = 0;
    v50[29] = 0;
  }
  uint64_t v48 = v79;
  sub_22DE04404();
  v54[0] = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  v54[1] = sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B692C@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, const void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v65 = a6;
  uint64_t v78 = a1;
  unsigned int v66 = a2;
  uint64_t v67 = a3;
  uint64_t v68 = a4;
  uint64_t v69 = a5;
  uint64_t v84 = 0;
  char v83 = 0;
  uint64_t v82 = 0;
  uint64_t v81 = 0;
  uint64_t v80 = 0;
  uint64_t v79 = 0;
  unint64_t v70 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v78, v66, v67, v68);
  uint64_t v71 = (char *)v52 - v70;
  uint64_t v84 = v7;
  int v75 = 1;
  char v83 = v8 & 1;
  uint64_t v82 = v9;
  uint64_t v81 = v10;
  uint64_t v80 = v11;
  uint64_t v79 = v6;
  uint64_t v72 = sub_22E0F7610();
  uint64_t v73 = v12;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v76 = sub_22E0F7E50();
  uint64_t v77 = v13;
  uint64_t v14 = sub_22E0F7610();
  uint64_t v15 = v77;
  *uint64_t v77 = v14;
  v15[1] = v16;
  swift_retain();
  if (v78)
  {
    uint64_t v64 = v78;
    uint64_t v63 = v78;
    uint64_t v17 = type metadata accessor for SettingsBinarySetting();
    uint64_t v18 = v77;
    uint64_t v19 = v63;
    v77[5] = v17;
    v18[2] = v19;
  }
  else
  {
    uint64_t v51 = v77;
    v77[2] = 0;
    v51[3] = 0;
    v51[4] = 0;
    v51[5] = 0;
  }
  int v62 = 1;
  uint64_t v20 = sub_22E0F7610();
  char v21 = v66;
  char v22 = v62;
  char v23 = v77;
  v77[6] = v20;
  v23[7] = v24;
  v23[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v23 + 64) = v21 & v22;
  uint64_t v25 = sub_22E0F7610();
  uint64_t v26 = v77;
  v77[12] = v25;
  v26[13] = v27;
  swift_retain();
  if (v67)
  {
    uint64_t v61 = v67;
    uint64_t v60 = v67;
    uint64_t v28 = sub_22E0F7180();
    uint64_t v29 = v77;
    uint64_t v30 = v60;
    v77[17] = v28;
    v29[14] = v30;
  }
  else
  {
    char v50 = v77;
    v77[14] = 0;
    v50[15] = 0;
    v50[16] = 0;
    v50[17] = 0;
  }
  uint64_t v55 = v77 + 20;
  unsigned int v56 = 1;
  uint64_t v31 = sub_22E0F7610();
  uint64_t v32 = v77;
  uint64_t v33 = v31;
  char v34 = v68;
  uint64_t v36 = v35;
  uint64_t v37 = v71;
  v77[18] = v33;
  v32[19] = v36;
  sub_22DE5A4C4(v34, v37);
  uint64_t v57 = sub_22E0F7100();
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v59 = v57 - 8;
  if ((*(unsigned int (**)(char *, void))(v58 + 48))(v71, v56) == 1)
  {
    sub_22DE58794((uint64_t)v71);
    uint64_t v49 = v77;
    v77[20] = 0;
    v49[21] = 0;
    v49[22] = 0;
    v49[23] = 0;
  }
  else
  {
    uint64_t v38 = v55;
    v77[23] = v57;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
    (*(void (**)(uint64_t *, char *, uint64_t))(v58 + 32))(boxed_opaque_existential_1, v71, v57);
  }
  uint64_t v40 = sub_22E0F7610();
  uint64_t v41 = v77;
  v77[24] = v40;
  v41[25] = v42;
  swift_retain();
  if (v69)
  {
    uint64_t v54 = v69;
    uint64_t v53 = v69;
    uint64_t v43 = sub_22E0F70D0();
    uint64_t v44 = v77;
    uint64_t v45 = v53;
    v77[29] = v43;
    v44[26] = v45;
  }
  else
  {
    uint64_t v48 = v77;
    v77[26] = 0;
    v48[27] = 0;
    v48[28] = 0;
    v48[29] = 0;
  }
  uint64_t v46 = v76;
  sub_22DE04404();
  v52[1] = v46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  v52[2] = sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B6DE8(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F7180();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B6F7C(uint64_t a1)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F7180();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B70F8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v14 = v4;
  *uint64_t v4 = sub_22E0F7610();
  v14[1] = v5;
  swift_bridgeObjectRetain();
  v14[5] = MEMORY[0x263F8D310];
  v14[2] = a1;
  v14[3] = a2;
  v14[6] = sub_22E0F7610();
  v14[7] = v6;
  uint64_t v12 = MEMORY[0x263F8D4F8];
  v14[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v14 + 64) = a3 & 1;
  v14[12] = sub_22E0F7610();
  v14[13] = v7;
  v14[17] = v12;
  *((unsigned char *)v14 + 112) = a4 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B7308(uint64_t a1, uint64_t a2, char a3, char a4)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v14 = v4;
  *uint64_t v4 = sub_22E0F7610();
  v14[1] = v5;
  swift_bridgeObjectRetain();
  v14[5] = MEMORY[0x263F8D310];
  v14[2] = a1;
  v14[3] = a2;
  v14[6] = sub_22E0F7610();
  v14[7] = v6;
  uint64_t v12 = MEMORY[0x263F8D4F8];
  v14[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v14 + 64) = a3 & 1;
  v14[12] = sub_22E0F7610();
  v14[13] = v7;
  v14[17] = v12;
  *((unsigned char *)v14 + 112) = a4 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B7500(uint64_t a1, char a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = sub_22E0F7180();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  if (a2 == 2)
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  else
  {
    v7[11] = MEMORY[0x263F8D4F8];
    *((unsigned char *)v7 + 64) = a2 & 1;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B770C(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_bridgeObjectRetain();
  v7[5] = MEMORY[0x263F8D310];
  v7[2] = a1;
  v7[3] = a2;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B7864(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_bridgeObjectRetain();
  v7[5] = MEMORY[0x263F8D310];
  v7[2] = a1;
  v7[3] = a2;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B79A4(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B7BD4(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B7DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsMultiSetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_22E0F7180();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  swift_retain();
  if (a3)
  {
    v10[17] = sub_22E0F70D0();
    v10[14] = a3;
  }
  else
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B80B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsMultiSetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_22E0F7180();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  swift_retain();
  if (a3)
  {
    v10[17] = sub_22E0F70D0();
    v10[14] = a3;
  }
  else
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B836C(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B859C(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B87B4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B8880()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B8934()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B8A00()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B8AB4(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B8CE4(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B8EFC(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsMultiSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7020();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0B912C(uint64_t a1, uint64_t a2)
{
  sub_22E0F7610();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v7 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsMultiSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_22E0F7610();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_22E0F7180();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  sub_22E0F7C10();
  sub_22E0F7030();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SetBinarySettingIntentCATs()
{
  uint64_t v1 = qword_2685C3B80;
  if (!qword_2685C3B80) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0B93BC()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0B9430(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0B948C(a1, a2, a3);
}

uint64_t sub_22E0B948C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7010();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0B9658()
{
  return type metadata accessor for SetBinarySettingIntentCATs();
}

void __swiftcall BinarySettingModel.init(settingId:graphicIcon:label:secondLabel:oldValue:updatedValue:url:directInvocationId:deviceCategoryInt:)(SiriSettingsIntents::BinarySettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String label, Swift::String secondLabel, Swift::Bool oldValue, Swift::Bool updatedValue, Swift::String_optional url, Swift::String_optional directInvocationId, Swift::Int deviceCategoryInt)
{
  uint64_t countAndFlagsBits = settingId._countAndFlagsBits;
  object = settingId._object;
  uint64_t v11 = graphicIcon._countAndFlagsBits;
  uint64_t v17 = graphicIcon._object;
  uint64_t v12 = label._countAndFlagsBits;
  unint64_t v16 = label._object;
  uint64_t v13 = secondLabel._countAndFlagsBits;
  unint64_t v15 = secondLabel._object;
  memset(__b, 0, sizeof(__b));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[0] = countAndFlagsBits;
  __b[1] = object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[2] = v11;
  __b[3] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[4] = v12;
  __b[5] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[6] = v13;
  __b[7] = v15;
  LOWORD(__b[8]) = __PAIR16__(updatedValue, oldValue) & 0x101;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(Swift::String_optional *)&void __b[9] = url;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(Swift::String_optional *)&__b[11] = directInvocationId;
  __b[13] = deviceCategoryInt;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->settingId._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->settingId._object = object;
  retstr->graphicIcon._uint64_t countAndFlagsBits = v11;
  retstr->graphicIcon._object = v17;
  retstr->label._uint64_t countAndFlagsBits = v12;
  retstr->label._object = v16;
  retstr->secondLabel._uint64_t countAndFlagsBits = v13;
  retstr->secondLabel._object = v15;
  retstr->oldValue = oldValue;
  retstr->updatedValue = updatedValue;
  retstr->url = url;
  retstr->directInvocationId = directInvocationId;
  retstr->deviceCategoryInt = deviceCategoryInt;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0B99D8();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E0B99D8()
{
}

void __swiftcall NumericSettingModel.init(settingId:graphicIcon:leftIconName:rightIconName:label:oldValue:updatedValue:minValue:maxValue:step:url:deviceCategoryInt:)(SiriSettingsIntents::NumericSettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String leftIconName, Swift::String rightIconName, Swift::String label, Swift::Double oldValue, Swift::Double updatedValue, Swift::Double minValue, Swift::Double maxValue, Swift::Double step, Swift::String_optional url, Swift::Int deviceCategoryInt)
{
  uint64_t countAndFlagsBits = settingId._countAndFlagsBits;
  object = settingId._object;
  uint64_t v14 = graphicIcon._countAndFlagsBits;
  uint64_t v23 = graphicIcon._object;
  uint64_t v15 = leftIconName._countAndFlagsBits;
  uint64_t v22 = leftIconName._object;
  uint64_t v16 = rightIconName._countAndFlagsBits;
  uint64_t v21 = rightIconName._object;
  *(Swift::Double *)&v17._uint64_t countAndFlagsBits = oldValue;
  *(Swift::Double *)&v17._object = updatedValue;
  *(Swift::Double *)&v18._uint64_t countAndFlagsBits = minValue;
  *(Swift::Double *)&v18._object = maxValue;
  memset(__b, 0, sizeof(__b));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[0]._uint64_t countAndFlagsBits = countAndFlagsBits;
  __b[0]._object = object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[1]._uint64_t countAndFlagsBits = v14;
  __b[1]._object = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[2]._uint64_t countAndFlagsBits = v15;
  __b[2]._object = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[3]._uint64_t countAndFlagsBits = v16;
  __b[3]._object = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[4] = label;
  __b[5] = v17;
  __b[6] = v18;
  *(Swift::Double *)&__b[7]._uint64_t countAndFlagsBits = step;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(Swift::String_optional *)&__b[7]._object = url;
  __b[8]._object = (void *)deviceCategoryInt;
  v26[0]._uint64_t countAndFlagsBits = countAndFlagsBits;
  v26[0]._object = object;
  v26[1]._uint64_t countAndFlagsBits = v14;
  v26[1]._object = v23;
  v26[2]._uint64_t countAndFlagsBits = v15;
  v26[2]._object = v22;
  v26[3]._uint64_t countAndFlagsBits = v16;
  v26[3]._object = v21;
  v26[4] = label;
  id v26[5] = v17;
  v26[6] = v18;
  *(Swift::Double *)&v26[7]._uint64_t countAndFlagsBits = step;
  *(Swift::String_optional *)&v26[7]._object = url;
  v26[8]._object = (void *)deviceCategoryInt;
  sub_22E03E924((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(retstr, v26, sizeof(SiriSettingsIntents::NumericSettingModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0B9DB0();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E0B9DB0()
{
}

uint64_t sub_22E0B9E18()
{
  uint64_t result = sub_22E0F7610();
  qword_2685C3B90 = result;
  qword_2685C3B98 = v1;
  return result;
}

uint64_t *sub_22E0B9E5C()
{
  if (qword_2685BF798 != -1) {
    swift_once();
  }
  return &qword_2685C3B90;
}

uint64_t static SnippetModels.bundleName.getter()
{
  uint64_t v1 = *sub_22E0B9E5C();
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_22E0B9EFC()
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v1 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v1 & 1) == 0;
}

uint64_t sub_22E0B9FF4()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E0BA02C()
{
  uint64_t v2 = qword_2685C3BA0;
  if (!qword_2685C3BA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BA0AC()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0BA0E0()
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v3 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v2 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_22E0BA280()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E0BA2DC()
{
  uint64_t v2 = qword_2685C3BA8;
  if (!qword_2685C3BA8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BA8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BA35C()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0BA3E8()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E0BA420()
{
  uint64_t v2 = qword_2685C3BB0;
  if (!qword_2685C3BB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BA4A0()
{
  return sub_22E0B9FF4();
}

uint64_t sub_22E0BA4B8()
{
  return sub_22E0BA0AC();
}

BOOL sub_22E0BA4D0@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_22E0B9EFC();
  *a1 = result;
  return result;
}

uint64_t sub_22E0BA504()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0BA534()
{
  uint64_t v2 = qword_2685C3BB8;
  if (!qword_2685C3BB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BA5B4()
{
  return sub_22E0F7F90();
}

uint64_t sub_22E0BA5E4()
{
  return sub_22E0BA280();
}

uint64_t sub_22E0BA604()
{
  return sub_22E0BA35C();
}

uint64_t sub_22E0BA624@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0BA0E0();
  *a1 = result;
  return result;
}

uint64_t sub_22E0BA650()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0BA680()
{
  uint64_t v2 = qword_2685C3BC0;
  if (!qword_2685C3BC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BA700()
{
  return sub_22E0F7F90();
}

uint64_t sub_22E0BA730()
{
  return sub_22E0BA3E8();
}

uint64_t sub_22E0BA748()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0BA778()
{
  uint64_t v2 = qword_2685C3BC8;
  if (!qword_2685C3BC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BC8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BA7F8()
{
  return sub_22E0F7F90();
}

uint64_t SnippetModels.encode(to:)(void *a1)
{
  uint64_t v60 = a1;
  uint64_t v78 = 0;
  uint64_t v77 = 0;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3BD0);
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = v46 - 8;
  unint64_t v49 = (*(void *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v46, v2, v3, v4);
  char v50 = (char *)v15 - v49;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3BD8);
  uint64_t v52 = *(void *)(v51 - 8);
  uint64_t v53 = v51 - 8;
  unint64_t v54 = (*(void *)(v52 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v51, v5, v6, v7);
  uint64_t v55 = (char *)v15 - v54;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3BE0);
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v60, v8, v9, v10);
  uint64_t v61 = (char *)v15 - v59;
  uint64_t v78 = v11;
  uint64_t v64 = v79;
  sub_22DEDB334(v1, v79);
  uint64_t v77 = v1;
  uint64_t v62 = v60[3];
  uint64_t v63 = v60[4];
  __swift_project_boxed_opaque_existential_1(v60, v62);
  sub_22E0BA680();
  sub_22E0F7F70();
  uint64_t v65 = __dst;
  sub_22DEDB334(v64, __dst);
  if (sub_22E0BAEA8((uint64_t)v65) == 1)
  {
    uint64_t v20 = (const void *)nullsub_1(__dst);
    sub_22E03E924((uint64_t)v20);
    id v19 = &v76;
    char v76 = 1;
    sub_22E0BA778();
    sub_22E0F7D90();
    uint64_t v21 = v75;
    memcpy(v75, v20, 0x90uLL);
    sub_22E0BAEB4();
    uint64_t v13 = v45;
    sub_22E0F7E00();
    uint64_t v22 = v13;
    uint64_t v23 = v13;
    if (!v13)
    {
      (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v46);
      sub_22E03E9A4((uint64_t)v20);
      uint64_t v24 = v22;
      goto LABEL_6;
    }
    v15[1] = v23;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v46);
    sub_22E03E9A4((uint64_t)v20);
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v61, v56);
  }
  else
  {
    uint64_t v25 = nullsub_1(__dst);
    uint64_t v27 = *(void *)v25;
    uint64_t v28 = *(void *)(v25 + 8);
    uint64_t v29 = *(void *)(v25 + 16);
    uint64_t v30 = *(void *)(v25 + 24);
    uint64_t v31 = *(void *)(v25 + 32);
    uint64_t v32 = *(void *)(v25 + 40);
    uint64_t v33 = *(void *)(v25 + 48);
    uint64_t v34 = *(void *)(v25 + 56);
    int v35 = *(unsigned __int8 *)(v25 + 64);
    int v36 = *(unsigned __int8 *)(v25 + 65);
    uint64_t v37 = *(void *)(v25 + 72);
    uint64_t v38 = *(void *)(v25 + 80);
    uint64_t v39 = *(void *)(v25 + 88);
    uint64_t v40 = *(void *)(v25 + 96);
    uint64_t v41 = *(void *)(v25 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v26 = &v74;
    char v74 = 0;
    sub_22E0BA534();
    sub_22E0F7D90();
    uint64_t v42 = v66;
    v66[0] = v27;
    v66[1] = v28;
    v66[2] = v29;
    void v66[3] = v30;
    v66[4] = v31;
    v66[5] = v32;
    v66[6] = v33;
    v66[7] = v34;
    char v67 = v35 & 1;
    char v68 = v36 & 1;
    uint64_t v69 = v37;
    uint64_t v70 = v38;
    uint64_t v71 = v39;
    uint64_t v72 = v40;
    uint64_t v73 = v41;
    sub_22E0BAF34();
    uint64_t v12 = v45;
    sub_22E0F7E00();
    uint64_t v43 = v12;
    uint64_t v44 = v12;
    if (!v12)
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v24 = v43;
LABEL_6:
      uint64_t v18 = v24;
      return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v61, v56);
    }
    uint64_t v16 = v44;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v61, v56);
    uint64_t v17 = v16;
  }
  return result;
}

uint64_t sub_22E0BAEA8(uint64_t a1)
{
  return *(unsigned char *)(a1 + 144) & 1;
}

unint64_t sub_22E0BAEB4()
{
  uint64_t v2 = qword_2685C3BE8;
  if (!qword_2685C3BE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0BAF34()
{
  uint64_t v2 = qword_2685C3BF0;
  if (!qword_2685C3BF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3BF0);
    return WitnessTable;
  }
  return v2;
}

uint64_t SnippetModels.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v79 = a1;
  uint64_t v125 = 0;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3BF8);
  uint64_t v70 = *(void *)(v69 - 8);
  uint64_t v71 = v69 - 8;
  unint64_t v72 = (*(void *)(v70 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v69, v2, v3, v4);
  uint64_t v73 = (char *)&v24 - v72;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C00);
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = v74 - 8;
  unint64_t v77 = (*(void *)(v75 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v74, v5, v6, v7);
  uint64_t v78 = (char *)&v24 - v77;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C08);
  uint64_t v81 = *(void *)(v80 - 8);
  uint64_t v82 = v80 - 8;
  unint64_t v83 = (*(void *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v79, v8, v9, v10);
  uint64_t v84 = (char *)&v24 - v83;
  uint64_t v125 = v11;
  uint64_t v86 = v11[3];
  uint64_t v87 = v11[4];
  __swift_project_boxed_opaque_existential_1(v11, v86);
  sub_22E0BA680();
  uint64_t v12 = v85;
  sub_22E0F7F60();
  uint64_t v88 = v12;
  uint64_t v89 = v12;
  if (v12)
  {
    uint64_t v37 = v89;
  }
  else
  {
    uint64_t v13 = sub_22E0F7D80();
    uint64_t v64 = &v120;
    uint64_t v120 = v13;
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C10);
    sub_22E0BB8E8();
    uint64_t v121 = sub_22E0F7B20();
    uint64_t v122 = v14;
    uint64_t v123 = v15;
    uint64_t v124 = v16;
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C20);
    unint64_t v66 = sub_22E0BB96C();
    sub_22E0F7930();
    int v67 = v119;
    if (v119 == 2) {
      goto LABEL_14;
    }
    int v62 = v67;
    int v55 = v67;
    uint64_t v60 = v121;
    uint64_t v56 = v122;
    uint64_t v57 = v123;
    uint64_t v58 = v124;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    unint64_t v59 = v118;
    v118[0] = v60;
    v118[1] = v56;
    v118[2] = v57;
    v118[3] = v58;
    int v61 = sub_22E0F7950();
    sub_22E0BB9F0();
    swift_unknownObjectRelease();
    if ((v61 & 1) == 0)
    {
LABEL_14:
      uint64_t v31 = 0;
      uint64_t v35 = sub_22E0F7C00();
      int v29 = 1;
      uint64_t v36 = swift_allocError();
      uint64_t v34 = v22;
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C30);
      uint64_t v30 = (char *)v34 + *(int *)(v23 + 48);
      void *v34 = &type metadata for SnippetModels;
      uint64_t v32 = sub_22E0F7D00();
      uint64_t v33 = sub_22E0F7610();
      sub_22E0F7BF0();
      (*(void (**)(void *, void))(*(void *)(v35 - 8) + 104))(v34, *MEMORY[0x263F8DCB0]);
      swift_willThrow();
      sub_22E0BB9F0();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
      uint64_t v37 = v36;
    }
    else if (v55)
    {
      uint64_t v45 = &v117;
      char v117 = v55 & 1;
      sub_22E0BA778();
      uint64_t v19 = v88;
      sub_22E0F7CF0();
      uint64_t v46 = v19;
      uint64_t v47 = v19;
      if (v19)
      {
        uint64_t v26 = v47;
        sub_22E0BB9F0();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
        uint64_t v37 = v26;
      }
      else
      {
        sub_22E0BBA1C();
        uint64_t v20 = v46;
        sub_22E0F7D70();
        uint64_t v43 = v20;
        uint64_t v44 = v20;
        if (!v20)
        {
          uint64_t v40 = v114;
          uint64_t v41 = 144;
          memcpy(v114, v116, sizeof(v114));
          uint64_t v42 = v115;
          memcpy(v115, v114, 0x90uLL);
          sub_22E0451C4((uint64_t)v115);
          sub_22DEDB334(v42, __dst);
          (*(void (**)(char *, uint64_t))(v70 + 8))(v73, v69);
          uint64_t v49 = v43;
          goto LABEL_13;
        }
        uint64_t v25 = v44;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v73, v69);
        sub_22E0BB9F0();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
        uint64_t v37 = v25;
      }
    }
    else
    {
      uint64_t v52 = &v113;
      char v113 = v55 & 1;
      sub_22E0BA534();
      uint64_t v17 = v88;
      sub_22E0F7CF0();
      uint64_t v53 = v17;
      uint64_t v54 = v17;
      if (v17)
      {
        uint64_t v28 = v54;
        sub_22E0BB9F0();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
        uint64_t v37 = v28;
      }
      else
      {
        sub_22E0BBDBC();
        uint64_t v18 = v53;
        sub_22E0F7D70();
        uint64_t v50 = v18;
        uint64_t v51 = v18;
        if (!v18)
        {
          uint64_t v48 = v90;
          v90[0] = v98;
          v90[1] = v99;
          v90[2] = v100;
          v90[3] = v101;
          v90[4] = v102;
          v90[5] = v103;
          v90[6] = v104;
          v90[7] = v105;
          char v91 = v106 & 1;
          char v92 = v107 & 1;
          uint64_t v93 = v108;
          uint64_t v94 = v109;
          uint64_t v95 = v110;
          uint64_t v96 = v111;
          uint64_t v97 = v112;
          sub_22DEDB114((uint64_t)v90);
          sub_22DEDB334(v48, __dst);
          (*(void (**)(char *, uint64_t))(v75 + 8))(v78, v74);
          uint64_t v49 = v50;
LABEL_13:
          uint64_t v39 = v49;
          sub_22E0BB9F0();
          (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
          uint64_t v38 = __dst;
          sub_22E0BBA9C(__dst, v68);
          __swift_destroy_boxed_opaque_existential_0(v79);
          uint64_t result = (uint64_t)v38;
          sub_22E0BBD08();
          return result;
        }
        uint64_t v27 = v51;
        (*(void (**)(char *, uint64_t))(v75 + 8))(v78, v74);
        sub_22E0BB9F0();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v84, v80);
        uint64_t v37 = v27;
      }
    }
  }
  uint64_t v24 = v37;
  return __swift_destroy_boxed_opaque_existential_0(v79);
}

unint64_t sub_22E0BB8E8()
{
  uint64_t v2 = qword_2685C3C18;
  if (!qword_2685C3C18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2685C3C10);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0BB96C()
{
  uint64_t v2 = qword_2685C3C28;
  if (!qword_2685C3C28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2685C3C20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C28);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E0BB9F0()
{
}

unint64_t sub_22E0BBA1C()
{
  uint64_t v2 = qword_2685C3C38;
  if (!qword_2685C3C38)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C38);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BBA9C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  uint64_t v11 = a1[7];
  uint64_t v12 = a1[8];
  uint64_t v13 = a1[9];
  uint64_t v14 = a1[10];
  uint64_t v15 = a1[11];
  uint64_t v16 = a1[12];
  uint64_t v17 = a1[13];
  uint64_t v18 = a1[14];
  uint64_t v19 = a1[15];
  uint64_t v20 = a1[16];
  uint64_t v21 = a1[17];
  char v5 = a1[18] & 1;
  sub_22E0BBC40();
  uint64_t result = a2;
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v8;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v10;
  *(void *)(a2 + 56) = v11;
  *(void *)(a2 + 64) = v12;
  *(void *)(a2 + 72) = v13;
  *(void *)(a2 + 80) = v14;
  *(void *)(a2 + 88) = v15;
  *(void *)(a2 + 96) = v16;
  *(void *)(a2 + 104) = v17;
  *(void *)(a2 + 112) = v18;
  *(void *)(a2 + 120) = v19;
  *(void *)(a2 + 128) = v20;
  *(void *)(a2 + 136) = v21;
  *(unsigned char *)(a2 + 144) = v5;
  return result;
}

uint64_t sub_22E0BBC40()
{
  return swift_bridgeObjectRetain();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E0BBD08()
{
}

unint64_t sub_22E0BBDBC()
{
  uint64_t v2 = qword_2685C3C40;
  if (!qword_2685C3C40)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C40);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BBE3C()
{
  return static SnippetModels.bundleName.getter();
}

uint64_t sub_22E0BBE54()
{
  return sub_22E0F5B20() & 1;
}

uint64_t sub_22E0BBE70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SnippetModels.init(from:)(a1, a2);
}

uint64_t sub_22E0BBEC8(void *a1)
{
  return SnippetModels.encode(to:)(a1);
}

uint64_t BinarySettingModel.settingId.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.graphicIcon.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.label.getter()
{
  uint64_t v2 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.secondLabel.getter()
{
  uint64_t v2 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.oldValue.getter()
{
  return *(unsigned char *)(v0 + 64) & 1;
}

uint64_t BinarySettingModel.updatedValue.getter()
{
  return *(unsigned char *)(v0 + 65) & 1;
}

uint64_t BinarySettingModel.url.getter()
{
  uint64_t v2 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.directInvocationId.getter()
{
  uint64_t v2 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.deviceCategoryInt.getter()
{
  return *(void *)(v0 + 104);
}

BOOL sub_22E0BC0E4(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    case 6:
      uint64_t v4 = 6;
      break;
    case 7:
      uint64_t v4 = 7;
      break;
    case 8:
      uint64_t v4 = 8;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    case 6:
      uint64_t v3 = 6;
      break;
    case 7:
      uint64_t v3 = 7;
      break;
    case 8:
      uint64_t v3 = 8;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_22E0BC29C()
{
  return sub_22E0F7F40();
}

uint64_t sub_22E0BC3B8()
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v10 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 0;
LABEL_20:
    swift_bridgeObjectRelease();
    return v11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v9 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 1;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v8 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 2;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v7 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 3;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v6 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 4;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v5 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 5;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v4 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 6;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v3 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 7;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v2 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v11 = 8;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 9;
}

uint64_t sub_22E0BC984()
{
  return 9;
}

uint64_t sub_22E0BC99C()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E0BC9E8()
{
  uint64_t v2 = qword_2685C3C48;
  if (!qword_2685C3C48)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C48);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BCA68()
{
  return sub_22E0F7610();
}

BOOL sub_22E0BCC54(char *a1, char *a2)
{
  return sub_22E0BC0E4(*a1, *a2);
}

uint64_t sub_22E0BCC78()
{
  return sub_22E0BC99C();
}

uint64_t sub_22E0BCC94()
{
  return sub_22E0BC29C();
}

uint64_t sub_22E0BCCB0()
{
  return sub_22E0BCA68();
}

uint64_t sub_22E0BCCCC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0BC3B8();
  *a1 = result;
  return result;
}

uint64_t sub_22E0BCCF8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0BC984();
  *a1 = result;
  return result;
}

uint64_t sub_22E0BCD24()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0BCD54()
{
  uint64_t v2 = qword_2685C3C50;
  if (!qword_2685C3C50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BCDD4()
{
  return sub_22E0F7F90();
}

uint64_t BinarySettingModel.encode(to:)(uint64_t a1)
{
  uint64_t v37 = a1;
  uint64_t v73 = 0;
  unint64_t v72 = 0;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C58);
  uint64_t v38 = *(void *)(v60 - 8);
  uint64_t v39 = v60 - 8;
  unint64_t v40 = (*(void *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v37, v2, v3, v4);
  uint64_t v56 = (char *)v14 - v40;
  uint64_t v73 = v5;
  uint64_t v58 = *v1;
  uint64_t v59 = v1[1];
  uint64_t v41 = v1[2];
  uint64_t v42 = v1[3];
  uint64_t v43 = v1[4];
  uint64_t v44 = v1[5];
  uint64_t v45 = v1[6];
  uint64_t v46 = v1[7];
  int v47 = *((unsigned __int8 *)v1 + 64);
  int v48 = *((unsigned __int8 *)v1 + 65);
  uint64_t v49 = v1[9];
  uint64_t v50 = v1[10];
  uint64_t v51 = v1[11];
  uint64_t v52 = v1[12];
  uint64_t v53 = v1[13];
  unint64_t v72 = v1;
  uint64_t v54 = v5[3];
  uint64_t v55 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v54);
  sub_22E0BCD54();
  sub_22E0F7F70();
  uint64_t v6 = v57;
  swift_bridgeObjectRetain();
  char v71 = 0;
  sub_22E0F7DC0();
  uint64_t v61 = v6;
  uint64_t v62 = v6;
  if (v6)
  {
    uint64_t v19 = v62;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
    uint64_t v20 = v19;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v61;
    swift_bridgeObjectRetain();
    char v70 = 1;
    sub_22E0F7DC0();
    uint64_t v35 = v7;
    uint64_t v36 = v7;
    if (v7)
    {
      uint64_t v18 = v36;
      swift_bridgeObjectRelease();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
      uint64_t v20 = v18;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v35;
      swift_bridgeObjectRetain();
      char v69 = 2;
      sub_22E0F7DC0();
      uint64_t v33 = v8;
      uint64_t v34 = v8;
      if (v8)
      {
        uint64_t v17 = v34;
        swift_bridgeObjectRelease();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
        uint64_t v20 = v17;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v33;
        swift_bridgeObjectRetain();
        char v68 = 3;
        sub_22E0F7DC0();
        uint64_t v31 = v9;
        uint64_t v32 = v9;
        if (v9)
        {
          uint64_t v16 = v32;
          swift_bridgeObjectRelease();
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
          uint64_t v20 = v16;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v10 = v31;
          char v67 = 4;
          sub_22E0F7DD0();
          uint64_t v29 = v10;
          uint64_t v30 = v10;
          if (v10)
          {
            uint64_t v15 = v30;
            uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
            uint64_t v20 = v15;
          }
          else
          {
            char v66 = 5;
            sub_22E0F7DD0();
            uint64_t v27 = 0;
            uint64_t v28 = 0;
            swift_bridgeObjectRetain();
            char v65 = 6;
            sub_22E0F7DA0();
            uint64_t v25 = 0;
            uint64_t v26 = 0;
            swift_bridgeObjectRelease();
            uint64_t v11 = v25;
            swift_bridgeObjectRetain();
            char v64 = 7;
            sub_22E0F7DA0();
            uint64_t v23 = v11;
            uint64_t v24 = v11;
            if (v11)
            {
              v14[1] = v24;
              swift_bridgeObjectRelease();
              return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v12 = v23;
              char v63 = 8;
              sub_22E0F7DF0();
              uint64_t v21 = v12;
              uint64_t v22 = v12;
              if (v12) {
                v14[0] = v22;
              }
              return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v56, v60);
            }
          }
        }
      }
    }
  }
  return result;
}

void *BinarySettingModel.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char v91 = &v121;
  uint64_t v90 = a2;
  uint64_t v92 = a1;
  uint64_t v112 = 0;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C60);
  uint64_t v94 = *(void *)(v93 - 8);
  uint64_t v95 = v93 - 8;
  unint64_t v96 = (*(void *)(v94 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v92, v2, v3, v4);
  uint64_t v97 = (char *)v40 - v96;
  *char v5 = 0;
  uint64_t v112 = v6;
  uint64_t v99 = v6[3];
  uint64_t v100 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v99);
  sub_22E0BCD54();
  uint64_t v7 = v98;
  sub_22E0F7F60();
  uint64_t v101 = v7;
  uint64_t v102 = v7;
  if (v7)
  {
    v40[11] = v102;
    v40[1] = v102;
    uint64_t result = (void *)__swift_destroy_boxed_opaque_existential_0(v92);
    if (*(_WORD *)v91)
    {
      uint64_t result = v113;
      sub_22DE0D044();
    }
    if ((*(_WORD *)v91 & 2) != 0)
    {
      uint64_t result = v114;
      sub_22DE0D044();
    }
    if ((*(_WORD *)v91 & 4) != 0)
    {
      uint64_t result = v115;
      sub_22DE0D044();
    }
    if ((*(_WORD *)v91 & 8) != 0)
    {
      uint64_t result = v116;
      sub_22DE0D044();
    }
    if ((*(_WORD *)v91 & 0x40) != 0)
    {
      uint64_t result = v119;
      sub_22DE0D044();
    }
    if ((*(_WORD *)v91 & 0x80) != 0)
    {
      uint64_t result = v120;
      sub_22DE0D044();
    }
  }
  else
  {
    char v111 = 0;
    uint64_t v8 = sub_22E0F7D30();
    uint64_t v86 = 0;
    uint64_t v87 = v8;
    uint64_t v88 = v9;
    uint64_t v89 = 0;
    uint64_t v81 = v9;
    uint64_t v80 = v8;
    *(_WORD *)char v91 = 1;
    swift_bridgeObjectRetain();
    v113[0] = v80;
    v113[1] = v81;
    char v110 = 1;
    uint64_t v10 = sub_22E0F7D30();
    uint64_t v82 = 0;
    uint64_t v83 = v10;
    uint64_t v84 = v11;
    uint64_t v85 = 0;
    uint64_t v75 = v11;
    uint64_t v74 = v10;
    *(_WORD *)char v91 = 3;
    swift_bridgeObjectRetain();
    v114[0] = v74;
    v114[1] = v75;
    char v109 = 2;
    uint64_t v12 = sub_22E0F7D30();
    uint64_t v76 = 0;
    uint64_t v77 = v12;
    uint64_t v78 = v13;
    uint64_t v79 = 0;
    uint64_t v69 = v13;
    uint64_t v68 = v12;
    *(_WORD *)char v91 = 7;
    swift_bridgeObjectRetain();
    v115[0] = v68;
    v115[1] = v69;
    char v108 = 3;
    uint64_t v14 = sub_22E0F7D30();
    uint64_t v70 = 0;
    uint64_t v71 = v14;
    uint64_t v72 = v15;
    uint64_t v73 = 0;
    uint64_t v64 = v15;
    uint64_t v63 = v14;
    *(_WORD *)char v91 = 15;
    swift_bridgeObjectRetain();
    v116[0] = v63;
    v116[1] = v64;
    char v107 = 4;
    int v16 = sub_22E0F7D40();
    uint64_t v65 = 0;
    int v66 = v16;
    uint64_t v67 = 0;
    int v59 = v16;
    char v117 = v16 & 1;
    char v106 = 5;
    int v17 = sub_22E0F7D40();
    uint64_t v60 = 0;
    int v61 = v17;
    uint64_t v62 = 0;
    int v54 = v17;
    char v118 = v17 & 1;
    char v105 = 6;
    uint64_t v18 = sub_22E0F7D10();
    uint64_t v55 = 0;
    uint64_t v56 = v18;
    uint64_t v57 = v19;
    uint64_t v58 = 0;
    uint64_t v49 = v19;
    uint64_t v48 = v18;
    *(_WORD *)char v91 = 79;
    swift_bridgeObjectRetain();
    v119[0] = v48;
    v119[1] = v49;
    char v104 = 7;
    uint64_t v20 = sub_22E0F7D10();
    uint64_t v50 = 0;
    uint64_t v51 = v20;
    uint64_t v52 = v21;
    uint64_t v53 = 0;
    uint64_t v44 = v21;
    uint64_t v43 = v20;
    *(_WORD *)char v91 = 207;
    swift_bridgeObjectRetain();
    v120[0] = v43;
    v120[1] = v44;
    char v103 = 8;
    uint64_t v22 = sub_22E0F7D60();
    uint64_t v45 = 0;
    uint64_t v46 = v22;
    uint64_t v47 = 0;
    uint64_t v41 = v22;
    uint64_t v42 = v113;
    v120[2] = v22;
    (*(void (**)(char *, uint64_t))(v94 + 8))(v97, v93);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = v81;
    uint64_t v24 = v74;
    uint64_t v25 = v75;
    uint64_t v26 = v68;
    uint64_t v27 = v69;
    uint64_t v28 = v63;
    uint64_t v29 = v64;
    char v30 = v59;
    char v31 = v54;
    uint64_t v32 = v48;
    uint64_t v33 = v49;
    uint64_t v34 = v43;
    uint64_t v35 = v44;
    uint64_t v36 = v90;
    uint64_t v37 = v41;
    uint64_t v38 = v92;
    *uint64_t v90 = v80;
    v36[1] = v23;
    v36[2] = v24;
    v36[3] = v25;
    void v36[4] = v26;
    v36[5] = v27;
    v36[6] = v28;
    v36[7] = v29;
    *((unsigned char *)v36 + 64) = v30 & 1;
    *((unsigned char *)v36 + 65) = v31 & 1;
    v36[9] = v32;
    v36[10] = v33;
    v36[11] = v34;
    v36[12] = v35;
    v36[13] = v37;
    __swift_destroy_boxed_opaque_existential_0(v38);
    uint64_t result = v42;
    sub_22E0B99D8();
  }
  return result;
}

uint64_t sub_22E0BE2B4()
{
  return BinarySettingModel.settingId.getter();
}

uint64_t sub_22E0BE2CC()
{
  return BinarySettingModel.graphicIcon.getter();
}

uint64_t sub_22E0BE2E4()
{
  return BinarySettingModel.label.getter();
}

uint64_t sub_22E0BE2FC()
{
  return BinarySettingModel.url.getter();
}

void *sub_22E0BE314@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return BinarySettingModel.init(from:)(a1, a2);
}

uint64_t sub_22E0BE36C(uint64_t a1)
{
  return BinarySettingModel.encode(to:)(a1);
}

uint64_t NumericSettingModel.settingId.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.graphicIcon.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.leftIconName.getter()
{
  uint64_t v2 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.rightIconName.getter()
{
  uint64_t v2 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.label.getter()
{
  uint64_t v2 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v2;
}

double NumericSettingModel.oldValue.getter()
{
  return *(double *)(v0 + 80);
}

double NumericSettingModel.updatedValue.getter()
{
  return *(double *)(v0 + 88);
}

double NumericSettingModel.minValue.getter()
{
  return *(double *)(v0 + 96);
}

double NumericSettingModel.maxValue.getter()
{
  return *(double *)(v0 + 104);
}

double NumericSettingModel.step.getter()
{
  return *(double *)(v0 + 112);
}

uint64_t NumericSettingModel.url.getter()
{
  uint64_t v2 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.deviceCategoryInt.getter()
{
  return *(void *)(v0 + 136);
}

BOOL sub_22E0BE5C8(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    case 6:
      uint64_t v4 = 6;
      break;
    case 7:
      uint64_t v4 = 7;
      break;
    case 8:
      uint64_t v4 = 8;
      break;
    case 9:
      uint64_t v4 = 9;
      break;
    case 10:
      uint64_t v4 = 10;
      break;
    case 11:
      uint64_t v4 = 11;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    case 6:
      uint64_t v3 = 6;
      break;
    case 7:
      uint64_t v3 = 7;
      break;
    case 8:
      uint64_t v3 = 8;
      break;
    case 9:
      uint64_t v3 = 9;
      break;
    case 10:
      uint64_t v3 = 10;
      break;
    case 11:
      uint64_t v3 = 11;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_22E0BE7E0()
{
  return sub_22E0F7F40();
}

uint64_t sub_22E0BE92C()
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v13 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 0;
LABEL_26:
    swift_bridgeObjectRelease();
    return v14;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v12 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 1;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v11 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 2;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v10 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 3;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v9 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 4;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v8 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 5;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v7 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 6;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v6 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 7;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v5 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 8;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v4 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 9;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v3 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 10;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v2 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v14 = 11;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 12;
}

uint64_t sub_22E0BF0C0()
{
  return 12;
}

uint64_t sub_22E0BF0D8()
{
  return sub_22E0F7BD0();
}

unint64_t sub_22E0BF124()
{
  uint64_t v2 = qword_2685C3C68;
  if (!qword_2685C3C68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BF1A4()
{
  return sub_22E0F7610();
}

BOOL sub_22E0BF414(char *a1, char *a2)
{
  return sub_22E0BE5C8(*a1, *a2);
}

uint64_t sub_22E0BF438()
{
  return sub_22E0BF0D8();
}

uint64_t sub_22E0BF454()
{
  return sub_22E0BE7E0();
}

uint64_t sub_22E0BF470()
{
  return sub_22E0BF1A4();
}

uint64_t sub_22E0BF48C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0BE92C();
  *a1 = result;
  return result;
}

uint64_t sub_22E0BF4B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0BF0C0();
  *a1 = result;
  return result;
}

uint64_t sub_22E0BF4E4()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0BF514()
{
  uint64_t v2 = qword_2685C3C70;
  if (!qword_2685C3C70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C70);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0BF594()
{
  return sub_22E0F7F90();
}

uint64_t NumericSettingModel.encode(to:)(uint64_t a1)
{
  uint64_t v43 = a1;
  uint64_t v85 = 0;
  uint64_t v84 = 0;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C78);
  uint64_t v44 = *(void *)(v69 - 8);
  uint64_t v45 = v69 - 8;
  unint64_t v46 = (*(void *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v43, v2, v3, v4);
  uint64_t v65 = (char *)v14 - v46;
  uint64_t v85 = v5;
  uint64_t v67 = *v1;
  uint64_t v68 = v1[1];
  uint64_t v47 = v1[2];
  uint64_t v48 = v1[3];
  uint64_t v49 = v1[4];
  uint64_t v50 = v1[5];
  uint64_t v51 = v1[6];
  uint64_t v52 = v1[7];
  uint64_t v53 = v1[8];
  uint64_t v54 = v1[9];
  uint64_t v55 = v1[10];
  uint64_t v56 = v1[11];
  uint64_t v57 = v1[12];
  uint64_t v58 = v1[13];
  uint64_t v59 = v1[14];
  uint64_t v60 = v1[15];
  uint64_t v61 = v1[16];
  uint64_t v62 = v1[17];
  uint64_t v84 = v1;
  uint64_t v63 = v5[3];
  uint64_t v64 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v63);
  sub_22E0BF514();
  sub_22E0F7F70();
  uint64_t v6 = v66;
  swift_bridgeObjectRetain();
  char v83 = 0;
  sub_22E0F7DC0();
  uint64_t v70 = v6;
  uint64_t v71 = v6;
  if (v6)
  {
    uint64_t v19 = v71;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
    uint64_t v20 = v19;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v70;
    swift_bridgeObjectRetain();
    char v82 = 1;
    sub_22E0F7DC0();
    uint64_t v41 = v7;
    uint64_t v42 = v7;
    if (v7)
    {
      uint64_t v18 = v42;
      swift_bridgeObjectRelease();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
      uint64_t v20 = v18;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v41;
      swift_bridgeObjectRetain();
      char v81 = 2;
      sub_22E0F7DC0();
      uint64_t v39 = v8;
      uint64_t v40 = v8;
      if (v8)
      {
        uint64_t v17 = v40;
        swift_bridgeObjectRelease();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
        uint64_t v20 = v17;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v39;
        swift_bridgeObjectRetain();
        char v80 = 3;
        sub_22E0F7DC0();
        uint64_t v37 = v9;
        uint64_t v38 = v9;
        if (v9)
        {
          uint64_t v16 = v38;
          swift_bridgeObjectRelease();
          uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
          uint64_t v20 = v16;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v10 = v37;
          swift_bridgeObjectRetain();
          char v79 = 4;
          sub_22E0F7DC0();
          uint64_t v35 = v10;
          uint64_t v36 = v10;
          if (v10)
          {
            uint64_t v15 = v36;
            swift_bridgeObjectRelease();
            uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
            uint64_t v20 = v15;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v11 = v35;
            char v78 = 5;
            sub_22E0F7DE0();
            uint64_t v33 = v11;
            uint64_t v34 = v11;
            if (v11)
            {
              v14[7] = v34;
              return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
            }
            else
            {
              char v77 = 6;
              sub_22E0F7DE0();
              uint64_t v31 = 0;
              uint64_t v32 = 0;
              char v76 = 7;
              sub_22E0F7DE0();
              uint64_t v29 = 0;
              uint64_t v30 = 0;
              char v75 = 8;
              sub_22E0F7DE0();
              uint64_t v27 = 0;
              uint64_t v28 = 0;
              char v74 = 9;
              sub_22E0F7DE0();
              uint64_t v25 = 0;
              uint64_t v26 = 0;
              swift_bridgeObjectRetain();
              char v73 = 10;
              sub_22E0F7DA0();
              uint64_t v23 = 0;
              uint64_t v24 = 0;
              swift_bridgeObjectRelease();
              uint64_t v12 = v23;
              char v72 = 11;
              sub_22E0F7DF0();
              uint64_t v21 = v12;
              uint64_t v22 = v12;
              if (v12) {
                v14[1] = v22;
              }
              return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v65, v69);
            }
          }
        }
      }
    }
  }
  return result;
}

void *NumericSettingModel.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v90 = a1;
  uint64_t v114 = 0;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3C80);
  uint64_t v92 = *(void *)(v91 - 8);
  uint64_t v93 = v91 - 8;
  unint64_t v94 = (*(void *)(v92 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v90, v2, v3, v4);
  uint64_t v95 = (char *)v26 - v94;
  __int16 v121 = 0;
  uint64_t v114 = v5;
  uint64_t v97 = v5[3];
  uint64_t v98 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v97);
  sub_22E0BF514();
  uint64_t v6 = v96;
  sub_22E0F7F60();
  uint64_t v99 = v6;
  uint64_t v100 = v6;
  if (v6)
  {
    v26[13] = v100;
    v26[0] = v100;
    uint64_t result = (void *)__swift_destroy_boxed_opaque_existential_0(v90);
    if (v121)
    {
      uint64_t result = v115;
      sub_22DE0D044();
    }
    if ((v121 & 2) != 0)
    {
      uint64_t result = v116;
      sub_22DE0D044();
    }
    if ((v121 & 4) != 0)
    {
      uint64_t result = v117;
      sub_22DE0D044();
    }
    if ((v121 & 8) != 0)
    {
      uint64_t result = v118;
      sub_22DE0D044();
    }
    if ((v121 & 0x10) != 0)
    {
      uint64_t result = v119;
      sub_22DE0D044();
    }
    if ((v121 & 0x400) != 0)
    {
      uint64_t result = v120;
      sub_22DE0D044();
    }
  }
  else
  {
    char v113 = 0;
    uint64_t v7 = sub_22E0F7D30();
    uint64_t v85 = 0;
    uint64_t v86 = v7;
    uint64_t v87 = v8;
    uint64_t v88 = 0;
    uint64_t v80 = v8;
    uint64_t v79 = v7;
    __int16 v121 = 1;
    swift_bridgeObjectRetain();
    v115[0] = v79;
    v115[1] = v80;
    char v112 = 1;
    uint64_t v9 = sub_22E0F7D30();
    uint64_t v81 = 0;
    uint64_t v82 = v9;
    uint64_t v83 = v10;
    uint64_t v84 = 0;
    uint64_t v74 = v10;
    uint64_t v73 = v9;
    __int16 v121 = 3;
    swift_bridgeObjectRetain();
    v116[0] = v73;
    v116[1] = v74;
    char v111 = 2;
    uint64_t v11 = sub_22E0F7D30();
    uint64_t v75 = 0;
    uint64_t v76 = v11;
    uint64_t v77 = v12;
    uint64_t v78 = 0;
    uint64_t v68 = v12;
    uint64_t v67 = v11;
    __int16 v121 = 7;
    swift_bridgeObjectRetain();
    v117[0] = v67;
    v117[1] = v68;
    char v110 = 3;
    uint64_t v13 = sub_22E0F7D30();
    uint64_t v69 = 0;
    uint64_t v70 = v13;
    uint64_t v71 = v14;
    uint64_t v72 = 0;
    uint64_t v62 = v14;
    uint64_t v61 = v13;
    __int16 v121 = 15;
    swift_bridgeObjectRetain();
    v118[0] = v61;
    v118[1] = v62;
    char v109 = 4;
    uint64_t v15 = sub_22E0F7D30();
    uint64_t v63 = 0;
    uint64_t v64 = v15;
    uint64_t v65 = v16;
    uint64_t v66 = 0;
    uint64_t v57 = v16;
    uint64_t v56 = v15;
    __int16 v121 = 31;
    swift_bridgeObjectRetain();
    v119[0] = v56;
    v119[1] = v57;
    char v108 = 5;
    sub_22E0F7D50();
    uint64_t v58 = 0;
    uint64_t v59 = v17;
    uint64_t v60 = 0;
    uint64_t v52 = v17;
    void v119[2] = v17;
    char v107 = 6;
    sub_22E0F7D50();
    uint64_t v53 = 0;
    uint64_t v54 = v18;
    uint64_t v55 = 0;
    uint64_t v48 = v18;
    v119[3] = v18;
    char v106 = 7;
    sub_22E0F7D50();
    uint64_t v49 = 0;
    uint64_t v50 = v19;
    uint64_t v51 = 0;
    uint64_t v44 = v19;
    v119[4] = v19;
    char v105 = 8;
    sub_22E0F7D50();
    uint64_t v45 = 0;
    uint64_t v46 = v20;
    uint64_t v47 = 0;
    uint64_t v40 = v20;
    v119[5] = v20;
    char v104 = 9;
    sub_22E0F7D50();
    uint64_t v41 = 0;
    uint64_t v42 = v21;
    uint64_t v43 = 0;
    uint64_t v35 = v21;
    v119[6] = v21;
    char v103 = 10;
    uint64_t v22 = sub_22E0F7D10();
    uint64_t v36 = 0;
    uint64_t v37 = v22;
    uint64_t v38 = v23;
    uint64_t v39 = 0;
    uint64_t v31 = v23;
    uint64_t v30 = v22;
    __int16 v121 = 1055;
    swift_bridgeObjectRetain();
    v120[0] = v30;
    v120[1] = v31;
    char v102 = 11;
    uint64_t v24 = sub_22E0F7D60();
    uint64_t v32 = 0;
    uint64_t v33 = v24;
    uint64_t v34 = 0;
    uint64_t v27 = v24;
    uint64_t v29 = v115;
    v120[2] = v24;
    (*(void (**)(char *, uint64_t))(v92 + 8))(v95, v91);
    uint64_t v28 = v101;
    v101[0] = v79;
    v101[1] = v80;
    v101[2] = v73;
    v101[3] = v74;
    v101[4] = v67;
    v101[5] = v68;
    v101[6] = v61;
    v101[7] = v62;
    v101[8] = v56;
    v101[9] = v57;
    v101[10] = v52;
    v101[11] = v48;
    v101[12] = v44;
    v101[13] = v40;
    v101[14] = v35;
    v101[15] = v30;
    v101[16] = v31;
    v101[17] = v27;
    sub_22E03E924((uint64_t)v101);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v89, v28, 0x90uLL);
    __swift_destroy_boxed_opaque_existential_0(v90);
    uint64_t result = v29;
    sub_22E0B9DB0();
  }
  return result;
}

uint64_t sub_22E0C0BF8()
{
  return NumericSettingModel.settingId.getter();
}

uint64_t sub_22E0C0C10()
{
  return NumericSettingModel.graphicIcon.getter();
}

uint64_t sub_22E0C0C28()
{
  return NumericSettingModel.label.getter();
}

uint64_t sub_22E0C0C40()
{
  return NumericSettingModel.url.getter();
}

unint64_t sub_22E0C0C58()
{
  return sub_22E0C0C70();
}

unint64_t sub_22E0C0C70()
{
  uint64_t v2 = qword_2685C3C88;
  if (!qword_2685C3C88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C0CF0()
{
  return sub_22E0C0D08();
}

unint64_t sub_22E0C0D08()
{
  uint64_t v2 = qword_2685C3C90;
  if (!qword_2685C3C90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C0D88(uint64_t a1)
{
  unint64_t result = sub_22E0C0DB4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22E0C0DB4()
{
  uint64_t v2 = qword_2685C3C98;
  if (!qword_2685C3C98)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3C98);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C0E34()
{
  return sub_22E0BBDBC();
}

unint64_t sub_22E0C0E4C()
{
  return sub_22E0BAF34();
}

unint64_t sub_22E0C0E64(uint64_t a1)
{
  unint64_t result = sub_22E0C0E90();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22E0C0E90()
{
  uint64_t v2 = qword_2685C3CA0;
  if (!qword_2685C3CA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CA0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C0F10()
{
  return sub_22E0BBA1C();
}

unint64_t sub_22E0C0F28()
{
  return sub_22E0BAEB4();
}

void *sub_22E0C0F40@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return NumericSettingModel.init(from:)(a1, a2);
}

uint64_t sub_22E0C0F98(uint64_t a1)
{
  return NumericSettingModel.encode(to:)(a1);
}

uint64_t destroy for SnippetModels()
{
  return sub_22DEDB26C();
}

uint64_t initializeWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  uint64_t v12 = a2[8];
  uint64_t v13 = a2[9];
  uint64_t v14 = a2[10];
  uint64_t v15 = a2[11];
  uint64_t v16 = a2[12];
  uint64_t v17 = a2[13];
  uint64_t v18 = a2[14];
  uint64_t v19 = a2[15];
  uint64_t v20 = a2[16];
  uint64_t v21 = a2[17];
  char v5 = a2[18] & 1;
  sub_22E0BBC40();
  uint64_t result = a1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v20;
  *(void *)(a1 + 136) = v21;
  *(unsigned char *)(a1 + 144) = v5;
  return result;
}

uint64_t assignWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
{
  uint64_t v11 = *a2;
  uint64_t v13 = a2[1];
  uint64_t v14 = a2[2];
  uint64_t v15 = a2[3];
  uint64_t v16 = a2[4];
  uint64_t v17 = a2[5];
  uint64_t v18 = a2[6];
  uint64_t v19 = a2[7];
  uint64_t v20 = a2[8];
  uint64_t v21 = a2[9];
  uint64_t v2 = a2[10];
  uint64_t v12 = a2[11];
  uint64_t v3 = a2[12];
  uint64_t v4 = a2[13];
  uint64_t v5 = a2[14];
  uint64_t v6 = a2[15];
  uint64_t v7 = a2[16];
  uint64_t v8 = a2[17];
  char v9 = *((unsigned char *)a2 + 144);
  sub_22E0BBC40();
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v13;
  *(void *)(a1 + 16) = v14;
  *(void *)(a1 + 24) = v15;
  *(void *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = v17;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v19;
  *(void *)(a1 + 64) = v20;
  *(void *)(a1 + 72) = v21;
  *(void *)(a1 + 80) = v2;
  *(void *)(a1 + 88) = v12;
  *(void *)(a1 + 96) = v3;
  *(void *)(a1 + 104) = v4;
  *(void *)(a1 + 112) = v5;
  *(void *)(a1 + 120) = v6;
  *(void *)(a1 + 128) = v7;
  *(void *)(a1 + 136) = v8;
  *(unsigned char *)(a1 + 144) = v9 & 1;
  sub_22DEDB26C();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy145_8(void *a1, const void *a2)
{
}

uint64_t assignWithTake for SnippetModels(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *(void *)(a2 + 8);
  uint64_t v14 = *(void *)(a2 + 16);
  uint64_t v15 = *(void *)(a2 + 24);
  uint64_t v16 = *(void *)(a2 + 32);
  uint64_t v17 = *(void *)(a2 + 40);
  uint64_t v18 = *(void *)(a2 + 48);
  uint64_t v19 = *(void *)(a2 + 56);
  uint64_t v20 = *(void *)(a2 + 64);
  uint64_t v2 = *(void *)(a2 + 72);
  uint64_t v3 = *(void *)(a2 + 80);
  uint64_t v4 = *(void *)(a2 + 88);
  uint64_t v5 = *(void *)(a2 + 96);
  uint64_t v6 = *(void *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 112);
  uint64_t v8 = *(void *)(a2 + 120);
  uint64_t v9 = *(void *)(a2 + 128);
  uint64_t v10 = *(void *)(a2 + 136);
  char v11 = *(unsigned char *)(a2 + 144);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v13;
  *(void *)(a1 + 16) = v14;
  *(void *)(a1 + 24) = v15;
  *(void *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = v17;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v19;
  *(void *)(a1 + 64) = v20;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v3;
  *(void *)(a1 + 88) = v4;
  *(void *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = v6;
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 128) = v9;
  *(void *)(a1 + 136) = v10;
  *(unsigned char *)(a1 + 144) = v11 & 1;
  sub_22DEDB26C();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetModels(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 145))
    {
      int v4 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v2 = *(unsigned __int8 *)(a1 + 144) ^ 0xFF;
      if (v2 >= 0xFE) {
        unsigned int v2 = -1;
      }
      int v4 = v2;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SnippetModels(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (unsigned char *)(result + 145);
  if (a2 > 0xFE)
  {
    *(void *)(result + 120) = 0;
    *(void *)(result + 112) = 0;
    *(void *)(result + 104) = 0;
    *(void *)(result + 96) = 0;
    *(void *)(result + 88) = 0;
    *(void *)(result + 80) = 0;
    *(void *)(result + 72) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 136) = 0;
    *(void *)(result + 128) = 0;
    *(unsigned char *)(result + 144) = 0;
    if (a3 >= 0xFF) {
      *uint64_t v3 = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *uint64_t v3 = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 144) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_22E0C19A0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 144) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetModels()
{
  return &type metadata for SnippetModels;
}

void *type metadata accessor for SnippetModels.CodingKeys()
{
  return &unk_26E1E0DA0;
}

void *type metadata accessor for SnippetModels.BinarySettingCodingKeys()
{
  return &unk_26E1E0E30;
}

void *type metadata accessor for SnippetModels.NumericSettingCodingKeys()
{
  return &unk_26E1E0EC0;
}

uint64_t sub_22E0C1A00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_22E0C1A28(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_22E0C1A50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_22E0C1A78(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t destroy for BinarySettingModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v9 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return result;
}

uint64_t assignWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64) & 1;
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65) & 1;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy112_8(void *a1, const void *a2)
{
}

uint64_t assignWithTake for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64) & 1;
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65) & 1;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return result;
}

uint64_t getEnumTagSinglePayload for BinarySettingModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BinarySettingModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    *(void *)(result + 96) = 0;
    *(void *)(result + 104) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 112) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 112) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BinarySettingModel()
{
  return &type metadata for BinarySettingModel;
}

void *type metadata accessor for BinarySettingModel.CodingKeys()
{
  return &unk_26E1E0FF0;
}

uint64_t destroy for NumericSettingModel()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NumericSettingModel(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  uint64_t v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  a1[4] = a2[4];
  uint64_t v5 = a2[5];
  swift_bridgeObjectRetain();
  a1[5] = v5;
  a1[6] = a2[6];
  uint64_t v6 = a2[7];
  swift_bridgeObjectRetain();
  a1[7] = v6;
  a1[8] = a2[8];
  uint64_t v7 = a2[9];
  swift_bridgeObjectRetain();
  a1[9] = v7;
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  uint64_t v9 = a2[16];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  a1[16] = v9;
  a1[17] = a2[17];
  return result;
}

void *assignWithCopy for NumericSettingModel(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v5 = a2[5];
  swift_bridgeObjectRetain();
  a1[5] = v5;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  uint64_t v6 = a2[7];
  swift_bridgeObjectRetain();
  a1[7] = v6;
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  uint64_t v7 = a2[9];
  swift_bridgeObjectRetain();
  a1[9] = v7;
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  uint64_t v8 = a2[16];
  swift_bridgeObjectRetain();
  a1[16] = v8;
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  a1[17] = a2[17];
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy144_8(void *a1, const void *a2)
{
}

void *assignWithTake for NumericSettingModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  a1[17] = a2[17];
  return result;
}

uint64_t getEnumTagSinglePayload for NumericSettingModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 144))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

void *storeEnumTagSinglePayload for NumericSettingModel(void *result, int a2, int a3)
{
  int v3 = result + 18;
  if (a2 < 0)
  {
    result[15] = 0;
    result[14] = 0;
    result[13] = 0;
    result[12] = 0;
    result[11] = 0;
    result[10] = 0;
    result[9] = 0;
    result[8] = 0;
    result[7] = 0;
    result[6] = 0;
    result[5] = 0;
    result[4] = 0;
    result[3] = 0;
    result[2] = 0;
    result[1] = 0;
    *uint64_t result = a2 + 0x80000000;
    result[17] = 0;
    result[16] = 0;
    if (a3 < 0) {
      *int v3 = 1;
    }
  }
  else
  {
    if (a3 < 0) {
      *int v3 = 0;
    }
    if (a2) {
      result[1] = (a2 - 1);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NumericSettingModel()
{
  return &type metadata for NumericSettingModel;
}

void *type metadata accessor for NumericSettingModel.CodingKeys()
{
  return &unk_26E1E1128;
}

unint64_t sub_22E0C29AC()
{
  return sub_22E0C29C4();
}

unint64_t sub_22E0C29C4()
{
  uint64_t v2 = qword_2685C3CA8;
  if (!qword_2685C3CA8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2A44()
{
  return sub_22E0C2A5C();
}

unint64_t sub_22E0C2A5C()
{
  uint64_t v2 = qword_2685C3CB0;
  if (!qword_2685C3CB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2ADC()
{
  return sub_22E0C2AF4();
}

unint64_t sub_22E0C2AF4()
{
  uint64_t v2 = qword_2685C3CB8;
  if (!qword_2685C3CB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CB8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2B74()
{
  return sub_22E0C2B8C();
}

unint64_t sub_22E0C2B8C()
{
  uint64_t v2 = qword_2685C3CC0;
  if (!qword_2685C3CC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CC0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2C0C()
{
  return sub_22E0C2C24();
}

unint64_t sub_22E0C2C24()
{
  uint64_t v2 = qword_2685C3CC8;
  if (!qword_2685C3CC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CC8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2CA4()
{
  return sub_22E0C2CBC();
}

unint64_t sub_22E0C2CBC()
{
  uint64_t v2 = qword_2685C3CD0;
  if (!qword_2685C3CD0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CD0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2D3C()
{
  return sub_22E0C2D54();
}

unint64_t sub_22E0C2D54()
{
  uint64_t v2 = qword_2685C3CD8;
  if (!qword_2685C3CD8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2DD4()
{
  return sub_22E0C2DEC();
}

unint64_t sub_22E0C2DEC()
{
  uint64_t v2 = qword_2685C3CE0;
  if (!qword_2685C3CE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2E6C()
{
  return sub_22E0C2E84();
}

unint64_t sub_22E0C2E84()
{
  uint64_t v2 = qword_2685C3CE8;
  if (!qword_2685C3CE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2F04()
{
  return sub_22E0C2F1C();
}

unint64_t sub_22E0C2F1C()
{
  uint64_t v2 = qword_2685C3CF0;
  if (!qword_2685C3CF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C2F9C()
{
  return sub_22E0C2FB4();
}

unint64_t sub_22E0C2FB4()
{
  uint64_t v2 = qword_2685C3CF8;
  if (!qword_2685C3CF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3CF8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C3034()
{
  return sub_22E0C304C();
}

unint64_t sub_22E0C304C()
{
  uint64_t v2 = qword_2685C3D00;
  if (!qword_2685C3D00)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C30CC()
{
  return sub_22E0C30E4();
}

unint64_t sub_22E0C30E4()
{
  uint64_t v2 = qword_2685C3D08;
  if (!qword_2685C3D08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D08);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C3164()
{
  return sub_22E0C317C();
}

unint64_t sub_22E0C317C()
{
  uint64_t v2 = qword_2685C3D10;
  if (!qword_2685C3D10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C31FC()
{
  return sub_22E0C3214();
}

unint64_t sub_22E0C3214()
{
  uint64_t v2 = qword_2685C3D18;
  if (!qword_2685C3D18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D18);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_22E0C3294()
{
  if (qword_2685BF7A0 != -1) {
    swift_once();
  }
  return &qword_2685D7D90;
}

uint64_t sub_22E0C32F8()
{
  type metadata accessor for GetBatteryHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22E0C3364(v0, 1, 2);
  qword_2685D7D90 = result;
  return result;
}

uint64_t type metadata accessor for GetBatteryHandler()
{
  return self;
}

uint64_t sub_22E0C3364(uint64_t a1, char a2, char a3)
{
  return sub_22E0C33C4(a1, a2 & 1, a3);
}

uint64_t sub_22E0C33C4(uint64_t a1, char a2, char a3)
{
  swift_retain();
  *(void *)(v3 + 16) = a1;
  *(unsigned char *)(v3 + 24) = a2 & 1;
  *(unsigned char *)(v3 + 25) = a3;
  swift_release();
  return v8;
}

void sub_22E0C3458(void *a1, void (*a2)(void), uint64_t a3)
{
  id v193 = a1;
  uint64_t v162 = a2;
  uint64_t v163 = a3;
  id v189 = "GetBatteryHandler handling intent %@";
  uint64_t v181 = 0;
  uint64_t v165 = sub_22E0C5138;
  unint64_t v166 = sub_22E0C4CB4;
  int v167 = sub_22DE09AD8;
  uint64_t v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  uint32_t v169 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  uint64_t v170 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  uint64_t v171 = sub_22E0C5058;
  int v172 = sub_22DE09AD8;
  uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  int v174 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09B24;
  uint64_t v176 = "Missing device category.";
  uint64_t v177 = "Attempting to read battery from a HomePod. Returning.";
  uint64_t v178 = "Missing target device deviceCategory";
  uint64_t v179 = "Missing setting metadata";
  v214[1] = 0;
  id v213 = 0;
  uint64_t v212 = 0;
  id v207 = 0;
  uint64_t v180 = 0;
  id v195 = 0;
  v214[4] = a1;
  v214[2] = a2;
  v214[3] = a3;
  int v190 = sub_22E0F7990();
  id v192 = (id)*sub_22DF136D8();
  id v3 = v192;
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v188 = sub_22E0F7E50();
  unint64_t v186 = v4;
  id v5 = v193;
  uint64_t v183 = v214;
  v214[0] = v193;
  unint64_t v182 = sub_22DE5E790();
  sub_22DE8747C();
  uint64_t v184 = sub_22E0F75A0();
  uint64_t v185 = v6;
  v186[3] = MEMORY[0x263F8D310];
  unint64_t v7 = sub_22DE103A4();
  uint64_t v8 = v184;
  uint64_t v9 = v185;
  uint64_t v10 = v186;
  unint64_t v11 = v7;
  uint64_t v12 = v188;
  v186[4] = v11;
  *uint64_t v10 = v8;
  v10[1] = v9;
  sub_22DE04404();
  uint64_t v191 = v12;
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v194 = objc_msgSend(v193, sel_settingMetadata);
  if (v194)
  {
    id v161 = v194;
    id v159 = v194;
    id v213 = v194;
    id v160 = objc_msgSend(v194, sel_targetDevice);
    if (v160)
    {
      id v158 = v160;
      id v154 = v160;
      id v155 = objc_msgSend(v160, sel_deviceCategory);

      uint64_t v156 = (uint64_t)v155;
      int v157 = 0;
    }
    else
    {
      uint64_t v156 = 0;
      int v157 = 1;
    }
    uint64_t v153 = v156;
    if (v157)
    {
      int v61 = sub_22E0F79A0();
      id v63 = (id)*sub_22DF136D8();
      id v54 = v63;
      uint64_t v62 = sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_22DE10250();
      id v64 = sub_22DE07498(6, 0);
      v162();

      swift_release();
    }
    else
    {
      uint64_t v152 = v153;
      uint64_t v148 = v153;
      uint64_t v212 = v153;
      uint64_t v151 = &v211;
      uint64_t v211 = v153;
      uint64_t v149 = &v210;
      uint64_t v210 = 6;
      uint64_t v150 = type metadata accessor for INDeviceCategory();
      sub_22DE0B9D8();
      if (sub_22E0F7E80())
      {
        int v144 = sub_22E0F79A0();
        id v146 = (id)*sub_22DF136D8();
        id v13 = v146;
        uint64_t v145 = sub_22E0F7E50();
        sub_22E0F7340();
        swift_bridgeObjectRelease();

        swift_retain();
        sub_22DE10250();
        id v147 = sub_22DE07498(6, 0);
        v162();

        swift_release();
      }
      else
      {
        uint64_t v141 = *(void *)(v164 + 16);
        swift_retain();
        id v142 = sub_22DE75CE8(v148, 0);
        int v143 = v14;
        swift_release();
        if (v143)
        {
          int v131 = sub_22E0F79A0();
          os_log_t v130 = (os_log_t)*sub_22DF136D8();
          uint64_t v27 = v130;
          id v28 = v159;
          uint64_t v121 = 7;
          uint64_t v122 = swift_allocObject();
          *(void *)(v122 + 16) = v159;
          char v116 = &v208;
          uint64_t v208 = 12;
          unint64_t v114 = sub_22DE0862C();
          unint64_t v115 = sub_22DE086A8();
          unint64_t v117 = sub_22DE08724();
          sub_22E0F76B0();
          uint32_t v118 = v209;
          uint64_t v119 = 17;
          uint64_t v124 = swift_allocObject();
          *(unsigned char *)(v124 + 16) = 32;
          uint64_t v125 = swift_allocObject();
          *(unsigned char *)(v125 + 16) = 8;
          uint64_t v120 = 32;
          uint64_t v29 = swift_allocObject();
          uint64_t v30 = v122;
          uint64_t v123 = v29;
          *(void *)(v29 + 16) = v166;
          *(void *)(v29 + 24) = v30;
          uint64_t v31 = swift_allocObject();
          uint64_t v32 = v123;
          uint64_t v127 = v31;
          *(void *)(v31 + 16) = v167;
          *(void *)(v31 + 24) = v32;
          uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
          uint64_t v126 = sub_22E0F7E50();
          uint64_t v128 = v33;
          swift_retain();
          uint64_t v34 = v124;
          uint64_t v35 = v128;
          *uint64_t v128 = v168;
          v35[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v34;
          swift_retain();
          uint64_t v36 = v125;
          uint64_t v37 = v128;
          v128[2] = v169;
          v37[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
          swift_retain();
          uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v127;
          uint64_t v39 = v128;
          v128[4] = v170;
          v39[5] = v38;
          sub_22DE04404();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v130, (os_log_type_t)v131))
          {
            char v107 = (uint8_t *)sub_22E0F7AB0();
            uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
            uint64_t v108 = sub_22DE087A0(0);
            uint64_t v109 = sub_22DE087A0(1);
            char v110 = &v200;
            uint64_t v200 = v107;
            char v111 = &v199;
            uint64_t v199 = v108;
            char v112 = &v198;
            uint64_t v198 = v109;
            sub_22DE087FC(2, &v200);
            sub_22DE087FC(1, &v200);
            uint64_t v196 = v168;
            uint64_t v197 = v124;
            sub_22DE08810(&v196, (uint64_t)&v200, (uint64_t)&v199, (uint64_t)&v198);
            uint64_t v113 = v180;
            if (v180)
            {
              __break(1u);
            }
            else
            {
              uint64_t v196 = v169;
              uint64_t v197 = v125;
              sub_22DE08810(&v196, (uint64_t)&v200, (uint64_t)&v199, (uint64_t)&v198);
              uint64_t v104 = 0;
              uint64_t v196 = v170;
              uint64_t v197 = v127;
              sub_22DE08810(&v196, (uint64_t)&v200, (uint64_t)&v199, (uint64_t)&v198);
              uint64_t v103 = 0;
              _os_log_impl(&dword_22DE00000, v130, (os_log_type_t)v131, "Unable to determine the device's battery level from setting metadata%s", v107, v118);
              sub_22DE0885C(v108);
              sub_22DE0885C(v109);
              sub_22E0F7A90();
              swift_release();
              swift_release();
              swift_release();
              uint64_t v105 = 0;
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            uint64_t v105 = v180;
          }
          uint64_t v101 = v105;

          id v102 = objc_msgSend(v193, sel_settingMetadata);
          if (v102
            && (id v100 = v102,
                id v98 = v102,
                id v99 = objc_msgSend(v102, sel_targetDevice),
                v102,
                v99))
          {
            id v97 = v99;
            id v93 = v99;
            id v94 = objc_msgSend(v99, sel_deviceCategory);

            id v95 = v94;
            int v96 = 0;
          }
          else
          {
            id v95 = 0;
            int v96 = 1;
          }
          id v92 = v95;
          if (v96)
          {
            int v65 = sub_22E0F79A0();
            id v67 = (id)*sub_22DF136D8();
            id v53 = v67;
            uint64_t v66 = sub_22E0F7E50();
            sub_22E0F7340();
            swift_bridgeObjectRelease();

            swift_retain();
            sub_22DE10250();
            id v68 = sub_22DE07498(6, 0);
            v162();

            swift_release();
          }
          else
          {
            id v91 = v92;
            id v77 = v92;
            id v207 = v92;
            int v90 = sub_22E0F79A0();
            os_log_t v89 = (os_log_t)*sub_22DF136D8();
            uint64_t v40 = v89;
            uint64_t v81 = 7;
            uint64_t v82 = swift_allocObject();
            *(void *)(v82 + 16) = v92;
            v205[1] = (unsigned char *)12;
            sub_22E0F76B0();
            uint32_t v78 = v206;
            uint64_t v79 = 17;
            uint64_t v84 = swift_allocObject();
            *(unsigned char *)(v84 + 16) = 32;
            uint64_t v85 = swift_allocObject();
            *(unsigned char *)(v85 + 16) = 8;
            uint64_t v80 = 32;
            uint64_t v41 = swift_allocObject();
            uint64_t v42 = v82;
            uint64_t v83 = v41;
            *(void *)(v41 + 16) = v171;
            *(void *)(v41 + 24) = v42;
            uint64_t v43 = swift_allocObject();
            uint64_t v44 = v83;
            uint64_t v87 = v43;
            *(void *)(v43 + 16) = v172;
            *(void *)(v43 + 24) = v44;
            uint64_t v86 = sub_22E0F7E50();
            uint64_t v88 = v45;
            swift_retain();
            uint64_t v46 = v84;
            uint64_t v47 = v88;
            const void *v88 = v173;
            v47[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v46;
            swift_retain();
            uint64_t v48 = v85;
            uint64_t v49 = v88;
            v88[2] = v174;
            v49[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v48;
            swift_retain();
            uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v87;
            uint64_t v51 = v88;
            v88[4] = v175;
            v51[5] = v50;
            sub_22DE04404();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v89, (os_log_type_t)v90))
            {
              uint64_t v73 = (uint8_t *)sub_22E0F7AB0();
              uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
              uint64_t v74 = sub_22DE087A0(0);
              uint64_t v75 = sub_22DE087A0(1);
              v205[0] = v73;
              uint64_t v204 = v74;
              uint64_t v203 = v75;
              sub_22DE087FC(2, v205);
              sub_22DE087FC(1, v205);
              uint64_t v201 = v173;
              uint64_t v202 = v84;
              sub_22DE08810(&v201, (uint64_t)v205, (uint64_t)&v204, (uint64_t)&v203);
              uint64_t v76 = v101;
              if (v101)
              {
                __break(1u);
              }
              else
              {
                uint64_t v201 = v174;
                uint64_t v202 = v85;
                sub_22DE08810(&v201, (uint64_t)v205, (uint64_t)&v204, (uint64_t)&v203);
                uint64_t v71 = 0;
                uint64_t v201 = v175;
                uint64_t v202 = v87;
                sub_22DE08810(&v201, (uint64_t)v205, (uint64_t)&v204, (uint64_t)&v203);
                _os_log_impl(&dword_22DE00000, v89, (os_log_type_t)v90, "Can not find connected device category%s", v73, v78);
                sub_22DE0885C(v74);
                sub_22DE0885C(v75);
                sub_22E0F7A90();
                swift_release();
                swift_release();
                swift_release();
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }

            swift_retain();
            sub_22DFE69F0();
            uint64_t v69 = v52;
            id v70 = sub_22DF963F0();
            swift_bridgeObjectRelease();
            ((void (*)(id))v162)(v70);

            swift_release();
          }
        }
        else
        {
          id v140 = v142;
          uint64_t v15 = v180;
          uint64_t v16 = v132;
          id v138 = v142;
          id v195 = v142;
          uint64_t v17 = sub_22DF08D6C();
          uint64_t v133 = *v17;
          uint64_t v134 = v17[1];
          unsigned int v135 = *((unsigned __int8 *)v17 + 16);
          id v136 = (id)*sub_22DF136D8();
          id v18 = v136;
          int v139 = *(unsigned __int8 *)(v164 + 24);
          id v19 = v193;
          swift_retain();
          uint64_t v137 = v57;
          MEMORY[0x270FA5388](v133, v134, v135, v136);
          v56[2] = v20;
          v56[3] = v138;
          v56[4] = v162;
          v56[5] = v21;
          sub_22DF06BCC(v22, v23, v24, v25, v139 & 1, v26, (uint64_t)v56, MEMORY[0x263F8EE60] + 8, v16);
          if (v15)
          {
            __break(1u);
          }
          else
          {

            swift_release();
          }
        }
      }
    }
  }
  else
  {
    v57[3] = sub_22E0F79A0();
    id v59 = (id)*sub_22DF136D8();
    id v55 = v59;
    uint64_t v58 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DE10250();
    id v60 = sub_22DE07498(6, 0);
    v162();

    swift_release();
  }
}

uint64_t sub_22E0C4C20(void *a1)
{
  id v1 = a1;
  sub_22DE59244();
  sub_22DE592AC();
  return sub_22E0F75A0();
}

uint64_t sub_22E0C4C74()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C4CB4()
{
  return sub_22E0C4C20(*(void **)(v0 + 16));
}

uint64_t sub_22E0C4CBC()
{
  return sub_22E0F7590();
}

void sub_22E0C4CF8(void *a1, uint64_t a2, void (*a3)(id))
{
  id v12 = objc_msgSend(a1, sel_settingMetadata);
  sub_22DF1DD0C();
  sub_22DE63C04();
  id v3 = sub_22E084178(a2);
  id v11 = sub_22DF92C4C(v3);
  uint64_t v10 = sub_22DE78878();
  uint64_t v4 = sub_22DE78878();
  id v18 = sub_22DF962A0(v12, v11, v10, v4, 0, 0);

  sub_22E0F7990();
  uint64_t v16 = (void *)*sub_22DF136D8();
  id v5 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v15 = v6;
  id v7 = v18;
  sub_22DE10250();
  sub_22DE10320();
  uint64_t v13 = sub_22E0F75A0();
  uint64_t v14 = v8;
  v15[3] = MEMORY[0x263F8D310];
  v15[4] = sub_22DE103A4();
  *uint64_t v15 = v13;
  v15[1] = v14;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v18);
  swift_release();
}

void sub_22E0C4F30(void *a1, void (*a2)(void), uint64_t a3)
{
}

uint64_t sub_22E0C4F54()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C4F80()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C4FAC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C4FEC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C502C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C5058()
{
  return sub_22E0C4CBC();
}

uint64_t sub_22E0C5060()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C508C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C50B8()
{
  return swift_deallocObject();
}

uint64_t sub_22E0C50F8()
{
  return swift_deallocObject();
}

void sub_22E0C5138()
{
  sub_22E0C4CF8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

uint64_t *sub_22E0C516C()
{
  if (qword_2685BF7A8 != -1) {
    swift_once();
  }
  return &qword_2685D7D98;
}

uint64_t sub_22E0C51D0()
{
  type metadata accessor for GetAXDifferentiateWithoutColorHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7D98 = result;
  return result;
}

uint64_t type metadata accessor for GetAXDifferentiateWithoutColorHandler()
{
  return self;
}

void sub_22E0C5238(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v5 = sub_22DF0821C();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  id v7 = a1;
  swift_retain();
  swift_retain();
  id v18 = a1;
  uint64_t v19 = v3;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0C5644, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);

  swift_release();
  swift_release();
}

void sub_22E0C540C(void *a1, uint64_t a2, void (*a3)(id))
{
  id v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  BOOL v15 = sub_22DE6D070();
  swift_release();
  if (v15) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  id v11 = sub_22DF962A0(v14, 0, 0, v12, 0, 0);

  sub_22E0F7990();
  id v10 = (id)*sub_22DF136D8();
  id v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v9 = v4;
  id v5 = v11;
  sub_22DE10250();
  sub_22DE10320();
  uint64_t v7 = sub_22E0F75A0();
  uint64_t v8 = v6;
  v9[3] = MEMORY[0x263F8D310];
  void v9[4] = sub_22DE103A4();
  *uint64_t v9 = v7;
  v9[1] = v8;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();
}

void sub_22E0C5644()
{
  sub_22E0C540C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0C5678(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0C569C()
{
  type metadata accessor for SetAXReduceWhitePointHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7DA0 = result;
  return result;
}

uint64_t type metadata accessor for SetAXReduceWhitePointHandler()
{
  return self;
}

uint64_t *sub_22E0C5704()
{
  if (qword_2685BF7B0 != -1) {
    swift_once();
  }
  return &qword_2685D7DA0;
}

uint64_t sub_22E0C5768(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v53 = 0;
  uint64_t v56 = a1;
  id v54 = a2;
  uint64_t v55 = a3;
  id v3 = a1;
  uint64_t v52 = a1;
  unint64_t v32 = sub_22DE09B30();
  id v33 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  char v34 = v4;

  id v48 = v33;
  char v49 = v34 & 1;
  uint64_t v50 = 1;
  char v51 = 0;
  if (v34 & 1) != 0 || (sub_22DE113DC((uint64_t)&v48, (uint64_t)v35), (v51))
  {
    char v27 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v27 = sub_22E0F7530();
  }
  if (v27) {
    goto LABEL_26;
  }
  id v5 = a1;
  id v47 = a1;
  id v25 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  char v26 = v6;

  id v43 = v25;
  char v44 = v26 & 1;
  uint64_t v45 = 2;
  char v46 = 0;
  if (v26 & 1) != 0 || (sub_22DE113DC((uint64_t)&v43, (uint64_t)v36), (v46))
  {
    char v24 = 0;
  }
  else
  {
    v35[3] = v36[0];
    v35[2] = v45;
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v24 = sub_22E0F7530();
  }
  if (v24) {
    goto LABEL_26;
  }
  id v7 = a1;
  id v42 = a1;
  id v22 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  char v23 = v8;

  id v38 = v22;
  char v39 = v23 & 1;
  uint64_t v40 = 4;
  char v41 = 0;
  if (v23 & 1) != 0 || (sub_22DE113DC((uint64_t)&v38, (uint64_t)&v37), (v41))
  {
    char v21 = 0;
  }
  else
  {
    v36[3] = v37;
    v36[2] = v40;
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v21 = sub_22E0F7530();
  }
  if (v21)
  {
LABEL_26:
    sub_22E0F7990();
    id v13 = (id)*sub_22DF136D8();
    id v11 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    BOOL v14 = sub_22DE6D6A8();
    swift_release();
    uint64_t v12 = sub_22DF0A7CC();
    uint64_t v15 = *v12;
    uint64_t v16 = v12[1];
    unsigned int v17 = *((unsigned __int8 *)v12 + 16);
    char v18 = *(unsigned char *)(v30 + 24);
    swift_retain();
    sub_22DEF7BD0(v14, a1, v15, v16, v17, v18 & 1, a2, a3, (uint64_t)sub_22E0C5DB8, v30, 0, 1, 0, 0);
    return sub_22DE0C6FC((uint64_t)sub_22E0C5DB8);
  }
  else
  {
    sub_22E0F7990();
    id v19 = (id)*sub_22DF136D8();
    id v9 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v20 = sub_22DEF8130();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v20);

    return swift_release();
  }
}

uint64_t sub_22E0C5D48()
{
  return swift_release();
}

uint64_t sub_22E0C5DB8()
{
  return sub_22E0C5D48();
}

uint64_t sub_22E0C5DE0(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0C5768(a1, a2, a3);
}

uint64_t sub_22E0C5E04()
{
  type metadata accessor for SetAXSwitchControlHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7DA8 = result;
  return result;
}

uint64_t type metadata accessor for SetAXSwitchControlHandler()
{
  return self;
}

uint64_t *sub_22E0C5E6C()
{
  if (qword_2685BF7B8 != -1) {
    swift_once();
  }
  return &qword_2685D7DA8;
}

void sub_22E0C5ED0(void *a1, uint64_t a2, uint64_t a3)
{
  id v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v5 = sub_22DF0B5B0();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  id v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0C61CC, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

uint64_t sub_22E0C60A0(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  swift_retain();
  BOOL v6 = sub_22DE6D8A4();
  swift_release();
  id v4 = sub_22DF0A4D4();
  uint64_t v9 = *v4;
  uint64_t v10 = v4[1];
  unsigned int v11 = *((unsigned __int8 *)v4 + 16);
  char v12 = *(unsigned char *)(a1 + 24);
  swift_retain();
  sub_22DEF7BD0(v6, a2, v9, v10, v11, v12 & 1, a3, a4, (uint64_t)sub_22E0C6294, a1, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0C6294);
}

uint64_t sub_22E0C61CC()
{
  return sub_22E0C60A0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_22E0C6200()
{
  return swift_release();
}

void sub_22E0C6270(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_22E0C6294()
{
  return sub_22E0C6200();
}

id sub_22E0C62BC()
{
  id v1 = (void *)*sub_22DF1E5CC();
  id result = v1;
  qword_2685D7DB0 = (uint64_t)v1;
  return result;
}

uint64_t *sub_22E0C62F4()
{
  if (qword_2685BF7C0 != -1) {
    swift_once();
  }
  return &qword_2685D7DB0;
}

void *sub_22E0C6358()
{
  uint64_t v2 = (void *)*sub_22E0C62F4();
  id v0 = v2;
  return v2;
}

uint64_t sub_22E0C6388()
{
  uint64_t v9 = 0;
  uint64_t v7 = type metadata accessor for FlowStrategy.IntentConversionError();
  unint64_t v6 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5[1], v0, v1, v2);
  id v8 = (char *)v5 - v6;
  uint64_t v9 = v3;
  sub_22E0C64A4(v3, (char *)v5 - v6);
  return sub_22E0F7590();
}

uint64_t type metadata accessor for FlowStrategy.IntentConversionError()
{
  uint64_t v1 = qword_2685C3D78;
  if (!qword_2685C3D78) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *sub_22E0C64A4(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for FlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    uint64_t v2 = sub_22E0F63B0();
    (*(void (**)(void *, const void *))(*(void *)(v2 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a2, a1, *(void *)(*(void *)(v6 - 8) + 64));
  }
  return a2;
}

uint64_t sub_22E0C65D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0238);
  sub_22E0F7E50();
  uint64_t v6 = v0;
  id v7 = (id)*MEMORY[0x263F08320];
  id v1 = (id)*MEMORY[0x263F08320];
  *uint64_t v6 = sub_22E0F7550();
  v6[1] = v2;
  uint64_t v3 = sub_22E0C6388();
  v6[5] = MEMORY[0x263F8D310];
  v6[2] = v3;
  v6[3] = v4;
  sub_22DE04404();

  return sub_22E0F74D0();
}

uint64_t sub_22E0C66B4()
{
  return sub_22E0F7EE0();
}

unint64_t sub_22E0C66E4()
{
  uint64_t v2 = qword_2685C3D20;
  if (!qword_2685C3D20)
  {
    type metadata accessor for FlowStrategy.IntentConversionError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0C6768()
{
  return sub_22E0F7ED0();
}

uint64_t sub_22E0C6798()
{
  return sub_22E0C65D8();
}

uint64_t sub_22E0C67B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v97 = a1;
  uint64_t v3 = v2;
  uint64_t v4 = v97;
  uint64_t v117 = v3;
  uint64_t v121 = "FlowStrategy: actionForInput.";
  id v98 = "FlowStrategy: not a compatible type of parse. Ignoring.";
  id v99 = "FlowStrategy: %@ handling NLV3Intent.";
  id v100 = "FlowStrategy: Error parsing uso parse.";
  uint64_t v140 = 0;
  uint64_t v139 = 0;
  id v142 = 0;
  uint64_t v101 = 0;
  id v136 = 0;
  id v135 = 0;
  BOOL v134 = 0;
  uint64_t v141 = 0;
  id v131 = 0;
  BOOL v130 = 0;
  uint64_t v119 = 0;
  uint64_t v102 = sub_22E0F6430();
  uint64_t v103 = *(void *)(v102 - 8);
  uint64_t v104 = v102 - 8;
  unint64_t v105 = (*(void *)(v103 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v5, v6, v7);
  uint64_t v106 = (uint64_t)v49 - v105;
  uint64_t v107 = sub_22E0F63E0();
  uint64_t v108 = *(void *)(v107 - 8);
  uint64_t v109 = v107 - 8;
  unint64_t v110 = (*(void *)(v108 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119, v8, v9, v10);
  char v111 = (char *)v49 - v110;
  id v142 = (char *)v49 - v110;
  uint64_t v112 = sub_22E0F6E80();
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = v112 - 8;
  unint64_t v115 = (*(void *)(v113 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v119, v11, v12, v13);
  char v116 = (char *)v49 - v115;
  uint64_t v141 = (char *)v49 - v115;
  uint64_t v128 = sub_22E0F63B0();
  uint64_t v125 = *(void *)(v128 - 8);
  uint64_t v126 = v128 - 8;
  unint64_t v118 = (*(void *)(v125 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v128, v14, v15, v16);
  uint64_t v127 = (char *)v49 - v118;
  uint64_t v140 = v4;
  uint64_t v139 = v17;
  int v122 = sub_22E0F7990();
  id v124 = (id)*sub_22DF14C48();
  id v18 = v124;
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v123 = sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22E0F6360();
  int v129 = (*(uint64_t (**)(char *, uint64_t))(v125 + 88))(v127, v128);
  if (v129 == *MEMORY[0x263F6FF50])
  {
    (*(void (**)(char *, uint64_t))(v125 + 96))(v127, v128);
    (*(void (**)(char *, char *, uint64_t))(v113 + 32))(v116, v127, v112);
    uint64_t v141 = v116;
    id v94 = v133;
    memset(v133, 0, sizeof(v133));
    id v93 = &v132;
    sub_22DEDDFB8(&v132);
    id v95 = sub_22DEF4A3C((uint64_t)v116, v94, v93);
    sub_22DE585B0((uint64_t)v93);
    sub_22DE585B0((uint64_t)v94);
    id v131 = v95;
    id v19 = v95;
    if (v95)
    {
      id v92 = v95;
      id v90 = v95;
      self;
      uint64_t v91 = swift_dynamicCastObjCClass();
      if (v91)
      {
        os_log_t v89 = (void *)v91;
      }
      else
      {
        uint64_t v88 = 0;

        os_log_t v89 = v88;
      }
      id v87 = v89;
    }
    else
    {
      id v87 = 0;
    }
    BOOL v84 = v87 != 0;
    BOOL v130 = v87 != 0;

    int v82 = sub_22E0F7990();
    id v83 = (id)*sub_22DF14C48();
    id v20 = v83;
    uint64_t v85 = sub_22E0F7E50();
    uint64_t v86 = v21;
    if (v84)
    {
      uint64_t v81 = sub_22E0F7610();
      uint64_t v80 = v22;
      v86[3] = MEMORY[0x263F8D310];
      unint64_t v23 = sub_22DE103A4();
      uint64_t v24 = v80;
      id v25 = v86;
      unint64_t v26 = v23;
      uint64_t v27 = v81;
    }
    else
    {
      uint64_t v79 = sub_22E0F7610();
      uint64_t v78 = v28;
      v86[3] = MEMORY[0x263F8D310];
      unint64_t v29 = sub_22DE103A4();
      uint64_t v24 = v78;
      id v25 = v86;
      unint64_t v26 = v29;
      uint64_t v27 = v79;
    }
    v86[4] = v26;
    *id v25 = v27;
    v25[1] = v24;
    uint64_t v30 = v85;
    sub_22DE04404();
    uint64_t v77 = v30;
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    if (v84) {
      sub_22E0F6010();
    }
    else {
      sub_22E0F6020();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v113 + 8))(v116, v112);
  }
  else if (v129 == *MEMORY[0x263F6FF80])
  {
    uint64_t v31 = v101;
    unint64_t v32 = v111;
    (*(void (**)(char *, uint64_t))(v125 + 96))(v127, v128);
    (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v32, v127, v107);
    id v142 = v32;
    sub_22E0F63D0();
    uint64_t v73 = v138;
    sub_22E0F63C0();
    uint64_t v74 = &v137;
    sub_22DEDDFB8(&v137);
    id v75 = sub_22DF64508(v106, v73, v74);
    uint64_t v76 = v31;
    if (v31)
    {
      id v55 = v76;
      sub_22DE585B0((uint64_t)&v137);
      sub_22DE585B0((uint64_t)v138);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v102);
      id v45 = v55;
      id v136 = v55;
      int v52 = sub_22E0F79A0();
      id v54 = (id)*sub_22DF14C48();
      id v46 = v54;
      uint64_t v53 = sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      sub_22E0F6020();
      return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    }
    else
    {
      id v72 = v75;
      sub_22DE585B0((uint64_t)&v137);
      sub_22DE585B0((uint64_t)v138);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v102);
      id v135 = v72;
      id v33 = v72;
      if (v72)
      {
        id v71 = v72;
        id v69 = v72;
        self;
        uint64_t v70 = swift_dynamicCastObjCClass();
        if (v70)
        {
          id v68 = (void *)v70;
        }
        else
        {
          id v67 = 0;

          id v68 = v67;
        }
        id v66 = v68;
      }
      else
      {
        id v66 = 0;
      }
      BOOL v63 = v66 != 0;
      BOOL v134 = v66 != 0;

      int v61 = sub_22E0F7990();
      id v62 = (id)*sub_22DF14C48();
      id v34 = v62;
      uint64_t v64 = sub_22E0F7E50();
      int v65 = v35;
      if (v63)
      {
        uint64_t v60 = sub_22E0F7610();
        uint64_t v59 = v36;
        v65[3] = MEMORY[0x263F8D310];
        unint64_t v37 = sub_22DE103A4();
        uint64_t v38 = v59;
        char v39 = v65;
        unint64_t v40 = v37;
        uint64_t v41 = v60;
      }
      else
      {
        uint64_t v58 = sub_22E0F7610();
        uint64_t v57 = v42;
        v65[3] = MEMORY[0x263F8D310];
        unint64_t v43 = sub_22DE103A4();
        uint64_t v38 = v57;
        char v39 = v65;
        unint64_t v40 = v43;
        uint64_t v41 = v58;
      }
      v65[4] = v40;
      uint64_t *v39 = v41;
      v39[1] = v38;
      uint64_t v44 = v64;
      sub_22DE04404();
      uint64_t v56 = v44;
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      if (v63) {
        sub_22E0F6010();
      }
      else {
        sub_22E0F6020();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    }
  }
  else
  {
    v49[3] = sub_22E0F7990();
    id v51 = (id)*sub_22DF14C48();
    id v47 = v51;
    uint64_t v50 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    sub_22E0F6020();
    return (*(uint64_t (**)(char *, uint64_t))(v125 + 8))(v127, v128);
  }
}

uint64_t sub_22E0C76CC(uint64_t a1, uint64_t a2)
{
  v3[32] = a1;
  v3[22] = v3;
  v3[23] = 0;
  v3[24] = 0;
  v3[25] = 0;
  v3[26] = 0;
  v3[27] = 0;
  v3[29] = 0;
  v3[30] = 0;
  v3[31] = 0;
  uint64_t v4 = sub_22E0F6430();
  v3[33] = v4;
  v3[34] = *(void *)(v4 - 8);
  v3[35] = swift_task_alloc();
  uint64_t v5 = sub_22E0F63E0();
  v3[36] = v5;
  v3[37] = *(void *)(v5 - 8);
  v3[38] = swift_task_alloc();
  uint64_t v6 = sub_22E0F6E80();
  v3[39] = v6;
  v3[40] = *(void *)(v6 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  uint64_t v7 = sub_22E0F63B0();
  v3[43] = v7;
  v3[44] = *(void *)(v7 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[23] = a1;
  v3[24] = a2;
  v3[25] = v2;
  return MEMORY[0x270FA2498](sub_22E0C7980, 0);
}

uint64_t sub_22E0C7980()
{
  uint64_t v75 = v0[46];
  uint64_t v73 = v0[44];
  uint64_t v74 = v0[43];
  uint64_t v71 = v0[32];
  v0[22] = v0;
  sub_22E0F7990();
  uint64_t v70 = (void *)*sub_22DF14C48();
  id v1 = v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  id v72 = *(void (**)(void))(v73 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v75, v71, v74);
  int v76 = (*(uint64_t (**)(uint64_t, uint64_t))(v73 + 88))(v75, v74);
  if (v76 == *MEMORY[0x263F6FF50])
  {
    uint64_t v65 = v69[46];
    uint64_t v67 = v69[42];
    uint64_t v66 = v69[39];
    uint64_t v64 = v69[40];
    (*(void (**)(void))(v69[44] + 96))();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v67, v65, v66);
    v69[30] = v67;
    v69[12] = 0;
    v69[13] = 0;
    v69[14] = 0;
    v69[15] = 0;
    v69[16] = 0;
    sub_22DEDDFB8(v69 + 17);
    id v68 = sub_22DEF4A3C(v67, v69 + 12, v69 + 17);
    sub_22DE585B0((uint64_t)(v69 + 17));
    sub_22DE585B0((uint64_t)(v69 + 12));
    if (v68)
    {
      self;
      uint64_t v63 = swift_dynamicCastObjCClass();
      if (v63)
      {
        uint64_t v62 = v63;
      }
      else
      {

        uint64_t v62 = 0;
      }
      uint64_t v61 = v62;
    }
    else
    {
      uint64_t v61 = 0;
    }
    if (v61)
    {
      uint64_t v2 = v69[42];
      uint64_t v3 = v69[40];
      uint64_t v4 = v69[39];
      v69[31] = v61;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
      uint64_t v60 = v61;
      goto LABEL_22;
    }
    uint64_t v58 = v69[42];
    uint64_t v53 = v69[41];
    uint64_t v59 = v69[39];
    uint64_t v52 = v69[40];
    id v57 = (id)*sub_22DF14C48();
    id v5 = v57;
    sub_22E0F79A0();
    sub_22E0F7E50();
    uint64_t v56 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v53, v58, v59);
    sub_22DEF4E94();
    uint64_t v54 = sub_22E0F75A0();
    uint64_t v55 = v7;
    v56[3] = MEMORY[0x263F8D310];
    v56[4] = sub_22DE103A4();
    *uint64_t v56 = v54;
    v56[1] = v55;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for FlowStrategy.IntentConversionError();
    sub_22DFBA7B0();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v58, v59);
LABEL_25:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = v51;
    uint64_t v16 = *(uint64_t (**)(uint64_t))(v69[22] + 8);
    return v16(v15);
  }
  if (v76 != *MEMORY[0x263F6FF80])
  {
    uint64_t v37 = v69[46];
    uint64_t v30 = v69[45];
    uint64_t v38 = v69[43];
    uint64_t v35 = v69[32];
    uint64_t v36 = v69[44];
    id v34 = (id)*sub_22DF14C48();
    id v12 = v34;
    sub_22E0F79A0();
    sub_22E0F7E50();
    id v33 = v13;
    ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v30, v35, v38);
    uint64_t v31 = sub_22E0F7590();
    uint64_t v32 = v14;
    v33[3] = MEMORY[0x263F8D310];
    v33[4] = sub_22DE103A4();
    uint64_t *v33 = v31;
    v33[1] = v32;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for FlowStrategy.IntentConversionError();
    sub_22DFBA7B0();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v38);
    goto LABEL_25;
  }
  uint64_t v47 = v69[46];
  uint64_t v8 = v69[38];
  uint64_t v48 = v69[36];
  uint64_t v49 = v69[35];
  uint64_t v46 = v69[37];
  (*(void (**)(void))(v69[44] + 96))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v8, v47, v48);
  v69[26] = v8;
  sub_22E0F63D0();
  sub_22E0F63C0();
  sub_22DEDDFB8(v69 + 7);
  id v50 = sub_22DF64508(v49, v69 + 2, v69 + 7);
  uint64_t v45 = v69[35];
  uint64_t v44 = v69[33];
  uint64_t v43 = v69[34];
  sub_22DE585B0((uint64_t)(v69 + 7));
  sub_22DE585B0((uint64_t)(v69 + 2));
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
  if (v50)
  {
    self;
    uint64_t v42 = swift_dynamicCastObjCClass();
    if (v42)
    {
      uint64_t v41 = v42;
    }
    else
    {

      uint64_t v41 = 0;
    }
    uint64_t v40 = v41;
  }
  else
  {
    uint64_t v40 = 0;
  }
  if (!v40)
  {
    type metadata accessor for FlowStrategy.IntentConversionError();
    sub_22DFBA7B0();
    char v39 = (void *)swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v28 = v69[38];
    uint64_t v29 = v69[36];
    uint64_t v27 = v69[37];
    id v17 = v39;
    v69[27] = v39;
    id v26 = (id)*sub_22DF14C48();
    id v18 = v26;
    sub_22E0F79A0();
    sub_22E0F7E50();
    id v25 = v19;
    id v20 = v39;
    v69[28] = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0008);
    uint64_t v23 = sub_22E0F7590();
    uint64_t v24 = v21;
    v25[3] = MEMORY[0x263F8D310];
    v25[4] = sub_22DE103A4();
    *id v25 = v23;
    v25[1] = v24;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for FlowStrategy.IntentConversionError();
    sub_22DFBA7B0();
    swift_allocError();
    v72();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
    goto LABEL_25;
  }
  uint64_t v9 = v69[38];
  uint64_t v10 = v69[37];
  uint64_t v11 = v69[36];
  v69[29] = v40;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  uint64_t v60 = v40;
LABEL_22:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = v60;
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v69[22] + 8);
  return v16(v15);
}

uint64_t sub_22E0C8888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22E0C67B0(a1, a2);
}

uint64_t sub_22E0C88AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E0C76CC(a1, a2);
}

uint64_t sub_22E0C896C()
{
  return sub_22E0F6260();
}

uint64_t type metadata accessor for FlowStrategy()
{
  return self;
}

void *sub_22E0C89D0()
{
  return sub_22E0C6358();
}

uint64_t sub_22E0C89E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for FlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66498](a1, a2, a3, v7, a5);
}

uint64_t sub_22E0C8AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for FlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66490](a1, a2, a3, v7, a5);
}

uint64_t sub_22E0C8BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for FlowStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66488](a1, a2, a3, v7, a5);
}

uint64_t sub_22E0C8C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  uint64_t v8 = type metadata accessor for FlowStrategy();
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_22DE632A8;
  return MEMORY[0x270F66480](a1, a2, a3, a4, v8, a6);
}

uint64_t sub_22E0C8D60(uint64_t a1, void *a2)
{
  uint64_t v7 = type metadata accessor for FlowStrategy();
  unint64_t v2 = sub_22E0C8E0C();
  uint64_t v3 = sub_22DF4FC28(a1, a2, v7, v2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v9 + 8);
  return v4(v3);
}

unint64_t sub_22E0C8E0C()
{
  uint64_t v2 = qword_2685C3D68;
  if (!qword_2685C3D68)
  {
    type metadata accessor for FlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0C8E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = v6;
  *(void *)(v6 + 16) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 24) = v7;
  uint64_t v8 = type metadata accessor for FlowStrategy();
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = sub_22DE632A8;
  return MEMORY[0x270F66790](a1, a2, a3, a4, v8, a6);
}

void *sub_22E0C8F74(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E0C90BC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      uint64_t v3 = sub_22E0F63B0();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 16))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_22E0C90BC(uint64_t a1)
{
  type metadata accessor for FlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    uint64_t v1 = sub_22E0F63B0();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  return a1;
}

void *sub_22E0C9194(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22E0C90BC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      uint64_t v3 = sub_22E0F63B0();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 32))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

unint64_t sub_22E0C92DC()
{
  return sub_22E0C92F4();
}

unint64_t sub_22E0C92F4()
{
  uint64_t v2 = qword_2685C3D88;
  if (!qword_2685C3D88)
  {
    type metadata accessor for FlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C9378()
{
  return sub_22E0C9390();
}

unint64_t sub_22E0C9390()
{
  uint64_t v2 = qword_2685C3D90;
  if (!qword_2685C3D90)
  {
    type metadata accessor for FlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D90);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0C9414(uint64_t a1)
{
  unint64_t result = sub_22E0C92F4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22E0C9440()
{
  return sub_22DFBA7B0();
}

unint64_t sub_22E0C9458()
{
  return sub_22E0C9470();
}

unint64_t sub_22E0C9470()
{
  uint64_t v2 = qword_2685C3D98;
  if (!qword_2685C3D98)
  {
    type metadata accessor for FlowStrategy();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3D98);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_22E0C94F4()
{
  if (qword_2685BF7C8 != -1) {
    swift_once();
  }
  return &qword_2685D7DB8;
}

uint64_t sub_22E0C9558()
{
  type metadata accessor for MacNavigationHandler();
  uint64_t result = sub_22DE0D464();
  qword_2685D7DB8 = result;
  return result;
}

uint64_t type metadata accessor for MacNavigationHandler()
{
  return self;
}

uint64_t sub_22E0C95B4()
{
  sub_22E0F7990();
  id v2 = (id)*sub_22DF136D8();
  id v0 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  return 0;
}

uint64_t sub_22E0C9674(void *a1)
{
  uint64_t v37 = 0;
  uint64_t v38 = a1;
  id v1 = a1;
  if (a1 && (id v29 = objc_msgSend(a1, sel_settingMetadata), a1, v29))
  {
    id v24 = objc_msgSend(v29, sel_settingId);
    uint64_t v25 = sub_22E0F7550();
    uint64_t v26 = v2;

    uint64_t v27 = v25;
    uint64_t v28 = v26;
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_22E021A20();
  uint64_t v23 = v3;
  swift_bridgeObjectRetain();
  v35[0] = v27;
  v35[1] = v28;
  v35[2] = v22;
  uint64_t v36 = v23;
  if (v28)
  {
    sub_22DE58A58(v35, &v31);
    if (v36)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v20 = sub_22E0F7620();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DE0D044();
      char v21 = v20;
      goto LABEL_13;
    }
    sub_22DE0D044();
    goto LABEL_15;
  }
  if (v36)
  {
LABEL_15:
    sub_22DE5875C();
    char v21 = 0;
    goto LABEL_13;
  }
  sub_22DE0D044();
  char v21 = 1;
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v4 = a1;
  if ((v21 & 1) == 0)
  {
    id v5 = a1;
    if (a1 && (id v18 = objc_msgSend(a1, sel_settingMetadata), a1, v18))
    {
      id v13 = objc_msgSend(v18, sel_settingId);
      uint64_t v14 = sub_22E0F7550();
      uint64_t v15 = v6;

      uint64_t v16 = v14;
      uint64_t v17 = v15;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_22E021A20();
    uint64_t v12 = v7;
    swift_bridgeObjectRetain();
    v33[0] = v16;
    v33[1] = v17;
    v33[2] = v11;
    uint64_t v34 = v12;
    if (v17)
    {
      sub_22DE58A58(v33, &v32);
      if (v34)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v9 = sub_22E0F7620();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_22DE0D044();
        char v10 = v9;
LABEL_29:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v19 = v10;
        goto LABEL_33;
      }
      sub_22DE0D044();
    }
    else if (!v34)
    {
      sub_22DE0D044();
      char v10 = 1;
      goto LABEL_29;
    }
    sub_22DE5875C();
    char v10 = 0;
    goto LABEL_29;
  }
  char v19 = 1;
LABEL_33:

  return v19 & 1;
}

BOOL sub_22E0C9B7C(void *a1)
{
  char v9 = a1;
  uint64_t v8 = v1;
  char v6 = sub_22E0C9674(a1);
  swift_retain();
  id v2 = a1;
  if (v6)
  {
    BOOL v4 = 1;
  }
  else
  {
    sub_22E0C9C60(a1, &v7);
    BOOL v4 = v7 != 64;
  }
  swift_release();

  return v4;
}

void sub_22E0C9C60(void *a1@<X0>, char *a2@<X8>)
{
  id v2 = a1;
  if (a1 && (id v16 = objc_msgSend(a1, sel_settingMetadata), a1, v16))
  {
    id v13 = objc_msgSend(v16, sel_settingId);
    v14._uint64_t countAndFlagsBits = sub_22E0F7550();
    v14._object = v3;

    Swift::String v15 = v14;
  }
  else
  {
    Swift::String v15 = (Swift::String)0;
  }
  if (v15._object)
  {
    sub_22E0F7E50();
    uint64_t v12 = v4;
    *BOOL v4 = BinarySettingIdentifier.rawValue.getter();
    v12[1] = v5;
    v12[2] = BinarySettingIdentifier.rawValue.getter();
    void v12[3] = v6;
    v12[4] = BinarySettingIdentifier.rawValue.getter();
    v12[5] = v7;
    v12[6] = BinarySettingIdentifier.rawValue.getter();
    v12[7] = v8;
    sub_22DE04404();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0B78);
    sub_22DEF33AC();
    if (sub_22E0F76A0())
    {
      swift_bridgeObjectRetain();
      BinarySettingIdentifier.init(rawValue:)(v15);
      char v11 = v19;
    }
    else
    {
      char v11 = 64;
    }
    *a2 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22E0F7990();
    id v10 = (id)*sub_22DF136D8();
    id v9 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    *a2 = 64;
  }
}

uint64_t sub_22E0C9FB4()
{
  type metadata accessor for SetVoiceOverHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7DC0 = result;
  return result;
}

uint64_t type metadata accessor for SetVoiceOverHandler()
{
  return self;
}

uint64_t *sub_22E0CA01C()
{
  if (qword_2685BF7D0 != -1) {
    swift_once();
  }
  return &qword_2685D7DC0;
}

uint64_t sub_22E0CA080(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  uint64_t v17 = (void *)*sub_22DF136D8();
  id v3 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22DFA3DA4();
  swift_retain();
  id v19 = objc_msgSend(a1, sel_settingMetadata);
  uint64_t v20 = sub_22DFA3E64(v19);

  swift_release();
  if (v20)
  {
    sub_22E0F79A0();
    id v7 = (id)*sub_22DF136D8();
    id v6 = v7;
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v8 = sub_22DEF8130();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v8);

    return swift_release();
  }
  else
  {
    swift_retain();
    BOOL v9 = sub_22DE6C458();
    swift_release();
    BOOL v4 = sub_22DF0AF78();
    uint64_t v10 = *v4;
    uint64_t v11 = v4[1];
    unsigned int v12 = *((unsigned __int8 *)v4 + 16);
    char v13 = *(unsigned char *)(v16 + 24);
    swift_retain();
    sub_22DEF7BD0(v9, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0CA3D0, v16, 0, 1, 0, 0);
    return sub_22DE0C6FC((uint64_t)sub_22E0CA3D0);
  }
}

uint64_t sub_22E0CA360()
{
  return swift_release();
}

uint64_t sub_22E0CA3D0()
{
  return sub_22E0CA360();
}

uint64_t sub_22E0CA3F8(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0CA080(a1, a2, a3);
}

uint64_t sub_22E0CA41C(void *a1)
{
  v11[5] = a1;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v1 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  v11[4] = objc_msgSend(a1, sel_action);
  void v11[3] = (id)1;
  type metadata accessor for INSettingAction();
  sub_22DF1DB00();
  char v10 = sub_22E0F7E80();
  id v2 = a1;
  if (v10)
  {
    v11[0] = objc_msgSend(a1, sel_numericValue);
    BOOL v7 = v11[0] == 0;
    sub_22DE63C6C(v11);
    BOOL v6 = v7;
  }
  else
  {
    BOOL v6 = 0;
  }

  id v3 = a1;
  if (v6)
  {
    void v11[2] = objc_msgSend(a1, sel_boundedValue);
    v11[1] = 0;
    type metadata accessor for INBoundedSettingValue();
    sub_22DE0BDF0();
    char v5 = sub_22E0F7E80();
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

id sub_22E0CA650()
{
  sub_22DE0D63C();
  id v2 = sub_22DE07498(9, 0);
  sub_22DFE69F0();
  id v1 = (id)sub_22E0F7540();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setErrorDetail_, v1);

  return v2;
}

void sub_22E0CA6F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, void (*a7)(void), uint64_t a8, double a9, double a10, double a11, double a12, uint64_t a13, uint64_t a14)
{
  double v40 = a9;
  double v41 = a10;
  double v42 = a11;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  unsigned int v46 = a5;
  int v47 = a6;
  uint64_t v48 = a7;
  uint64_t v49 = a8;
  uint64_t v50 = a13;
  uint64_t v51 = a14;
  uint64_t v52 = sub_22E0CE8FC;
  uint64_t v53 = "[handleNumericSettingIntent] Unable to determine the requested value of the setting";
  uint64_t v56 = 0;
  uint64_t v54 = 0;
  uint64_t v70 = a1;
  double v69 = a9;
  double v68 = a10;
  double v67 = a11;
  double v66 = a12;
  uint64_t v65 = a2;
  uint64_t v62 = a3;
  uint64_t v63 = a4;
  char v64 = a5;
  char v61 = a6 & 1;
  uint64_t v59 = a7;
  uint64_t v60 = a8;
  uint64_t v57 = a13;
  uint64_t v58 = a14;
  uint64_t v55 = sub_22E0CAAA0(a1, a9, a10, a11, a12);
  if (v14)
  {
    v31[3] = sub_22E0F79A0();
    id v32 = (id)*sub_22DF136D8();
    id v29 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    id v33 = sub_22E0CAA4C(0, 8);
    v48();

    swift_release();
  }
  else
  {
    uint64_t v39 = v55;
    uint64_t v15 = v34;
    uint64_t v35 = v55;
    uint64_t v56 = v55;
    id v36 = (id)*sub_22DF136D8();
    id v16 = v36;
    swift_retain();
    swift_retain();
    uint64_t v37 = v31;
    double v17 = MEMORY[0x270FA5388](v44, v45, v46, v36);
    uint64_t v38 = v30;
    v30[2] = v18;
    v30[3] = v19;
    v30[4] = v20;
    v30[5] = v21;
    v30[6] = v48;
    v30[7] = v49;
    v30[8] = v22;
    v30[9] = v23;
    *(double *)&v30[10] = v17;
    sub_22DF06BCC(v24, v25, v26, v27, v47 & 1, v28, (uint64_t)v30, MEMORY[0x263F8EE60] + 8, v15);
    swift_release();
    swift_release();
  }
}

id sub_22E0CAA4C(uint64_t a1, uint64_t a2)
{
  return sub_22DE07498(a2, 0);
}

uint64_t sub_22E0CAAA0(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v108 = 0;
  uint64_t v89 = 0;
  uint64_t v113 = a1;
  double v112 = a2;
  double v111 = a3;
  double v110 = a4;
  double v109 = a5;
  uint64_t v82 = sub_22DF28E7C(a3, a4);
  if (v5)
  {
    uint64_t v62 = swift_allocObject();
    uint64_t v108 = v62 + 16;
    id v63 = objc_msgSend(a1, sel_numericValue);
    if (v63 && (id v61 = objc_msgSend(v63, sel_value), v63, v61))
    {
      objc_msgSend(v61, sel_doubleValue);
      double v60 = v8;

      *(double *)(v62 + 16) = sub_22DFA84D8(v60);
      *(unsigned char *)(v62 + 24) = 0;
    }
    else
    {
      *(void *)(v62 + 16) = 0;
      *(unsigned char *)(v62 + 24) = 1;
    }
    os_log_type_t v59 = sub_22E0F7990();
    os_log_t log = (os_log_t)*sub_22DF136D8();
    BOOL v9 = log;
    swift_retain();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v62;
    *(double *)(v27 + 24) = a5;
    uint64_t v29 = swift_allocObject();
    *(double *)(v29 + 16) = a2;
    id v10 = a1;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = a1;
    uint64_t v33 = swift_allocObject();
    *(double *)(v33 + 16) = a5;
    uint64_t v35 = swift_allocObject();
    *(double *)(v35 + 16) = a3;
    uint64_t v37 = swift_allocObject();
    *(double *)(v37 + 16) = a4;
    uint64_t v106 = 62;
    sub_22DE0862C();
    sub_22DE086A8();
    sub_22DE08724();
    sub_22E0F76B0();
    uint32_t v26 = v107;
    uint64_t v39 = swift_allocObject();
    *(unsigned char *)(v39 + 16) = 0;
    uint64_t v40 = swift_allocObject();
    *(unsigned char *)(v40 + 16) = 8;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_22E0CEA4C;
    *(void *)(v28 + 24) = v27;
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = sub_22DF1D8A0;
    *(void *)(v41 + 24) = v28;
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = 0;
    uint64_t v43 = swift_allocObject();
    *(unsigned char *)(v43 + 16) = 8;
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = sub_22DF1C6D8;
    *(void *)(v30 + 24) = v29;
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = sub_22DF1D8A0;
    *(void *)(v44 + 24) = v30;
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 0;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 8;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = sub_22E0CEAE8;
    *(void *)(v32 + 24) = v31;
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = sub_22E0CF25C;
    *(void *)(v47 + 24) = v32;
    uint64_t v48 = swift_allocObject();
    *(unsigned char *)(v48 + 16) = 0;
    uint64_t v49 = swift_allocObject();
    *(unsigned char *)(v49 + 16) = 8;
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_22DF1C6D8;
    *(void *)(v34 + 24) = v33;
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = sub_22DF1D8A0;
    *(void *)(v50 + 24) = v34;
    uint64_t v51 = swift_allocObject();
    *(unsigned char *)(v51 + 16) = 0;
    uint64_t v52 = swift_allocObject();
    *(unsigned char *)(v52 + 16) = 8;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = sub_22DF1C6D8;
    *(void *)(v36 + 24) = v35;
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = sub_22DF1D8A0;
    *(void *)(v53 + 24) = v36;
    uint64_t v54 = swift_allocObject();
    *(unsigned char *)(v54 + 16) = 0;
    uint64_t v55 = swift_allocObject();
    *(unsigned char *)(v55 + 16) = 8;
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = sub_22DF1C6D8;
    *(void *)(v38 + 24) = v37;
    uint64_t v56 = swift_allocObject();
    *(void *)(v56 + 16) = sub_22DF1D8A0;
    *(void *)(v56 + 24) = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
    sub_22E0F7E50();
    uint64_t v57 = v11;
    swift_retain();
    *uint64_t v57 = sub_22DE09A64;
    v57[1] = v39;
    swift_retain();
    v57[2] = sub_22DE09A64;
    v57[3] = v40;
    swift_retain();
    _DWORD v57[4] = sub_22DF1D8EC;
    v57[5] = v41;
    swift_retain();
    v57[6] = sub_22DE09A64;
    v57[7] = v42;
    swift_retain();
    v57[8] = sub_22DE09A64;
    v57[9] = v43;
    swift_retain();
    v57[10] = sub_22DF1D8EC;
    v57[11] = v44;
    swift_retain();
    v57[12] = sub_22DE09A64;
    v57[13] = v45;
    swift_retain();
    v57[14] = sub_22DE09A64;
    v57[15] = v46;
    swift_retain();
    v57[16] = sub_22E0CF2A8;
    v57[17] = v47;
    swift_retain();
    v57[18] = sub_22DE09A64;
    v57[19] = v48;
    swift_retain();
    v57[20] = sub_22DE09A64;
    v57[21] = v49;
    swift_retain();
    v57[22] = sub_22DF1D8EC;
    v57[23] = v50;
    swift_retain();
    v57[24] = sub_22DE09A64;
    v57[25] = v51;
    swift_retain();
    v57[26] = sub_22DE09A64;
    v57[27] = v52;
    swift_retain();
    v57[28] = sub_22DF1D8EC;
    v57[29] = v53;
    swift_retain();
    v57[30] = sub_22DE09A64;
    v57[31] = v54;
    swift_retain();
    v57[32] = sub_22DE09A64;
    v57[33] = v55;
    swift_retain();
    v57[34] = sub_22DF1D8EC;
    v57[35] = v56;
    sub_22DE04404();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v59))
    {
      uint64_t v23 = (uint8_t *)sub_22E0F7AB0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
      uint64_t v24 = sub_22DE087A0(0);
      uint64_t v25 = sub_22DE087A0(0);
      v94[0] = v23;
      uint64_t v93 = v24;
      uint64_t v92 = v25;
      sub_22DE087FC(0, v94);
      sub_22DE087FC(6, v94);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v39;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v40;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
      uint64_t v91 = v41;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v42;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v43;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
      uint64_t v91 = v44;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v45;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v46;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22E0CF2A8;
      uint64_t v91 = v47;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v48;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v49;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
      uint64_t v91 = v50;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v51;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v52;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
      uint64_t v91 = v53;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v54;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v91 = v55;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      id v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
      uint64_t v91 = v56;
      sub_22DE08810(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      _os_log_impl(&dword_22DE00000, log, v59, "[getRequestedValue] specified value: %f, currentValue: %f, indent.action: %ld, defaultAdjustment: %f, min: %f, max: %f", v23, v26);
      sub_22DE0885C(v24);
      sub_22DE0885C(v25);
      sub_22E0F7A90();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    id v22 = objc_msgSend(a1, sel_action);
    if (v22 == (id)2)
    {
      double v98 = a4;
      swift_beginAccess();
      double v20 = *(double *)(v62 + 16);
      char v21 = *(unsigned char *)(v62 + 24);
      swift_endAccess();
      double v95 = v20;
      char v96 = v21 & 1;
      if (v21) {
        double v97 = a5;
      }
      else {
        double v97 = v95;
      }
      *(double *)&v94[1] = a2 + v97;
      sub_22E0F7EC0();
      uint64_t v19 = v99;
      swift_release();
      return v19;
    }
    else if (v22 == (id)3)
    {
      double v104 = a3;
      swift_beginAccess();
      double v17 = *(double *)(v62 + 16);
      char v18 = *(unsigned char *)(v62 + 24);
      swift_endAccess();
      double v101 = v17;
      char v102 = v18 & 1;
      if (v18) {
        double v103 = a5;
      }
      else {
        double v103 = v101;
      }
      double v100 = a2 - v103;
      sub_22E0F7EB0();
      uint64_t v16 = v105;
      swift_release();
      return v16;
    }
    else
    {
      swift_beginAccess();
      uint64_t v13 = *(void *)(v62 + 16);
      char v14 = *(unsigned char *)(v62 + 24);
      swift_endAccess();
      uint64_t v15 = sub_22E0CEB74(v13, v14 & 1);
      swift_release();
      return v15;
    }
  }
  else
  {
    uint64_t v89 = v82;
    os_log_type_t v76 = sub_22E0F79A0();
    osos_log_t log = (os_log_t)*sub_22DF136D8();
    BOOL v6 = oslog;
    uint64_t v69 = swift_allocObject();
    *(void *)(v69 + 16) = v82;
    v87[1] = (unsigned char *)12;
    sub_22DE0862C();
    sub_22DE086A8();
    sub_22DE08724();
    sub_22E0F76B0();
    uint32_t size = v88;
    uint64_t v71 = swift_allocObject();
    *(unsigned char *)(v71 + 16) = 0;
    uint64_t v72 = swift_allocObject();
    *(unsigned char *)(v72 + 16) = 8;
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = sub_22DF1C6D8;
    *(void *)(v70 + 24) = v69;
    uint64_t v73 = swift_allocObject();
    *(void *)(v73 + 16) = sub_22DF1D8A0;
    *(void *)(v73 + 24) = v70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
    sub_22E0F7E50();
    uint64_t v74 = v7;
    swift_retain();
    *uint64_t v74 = sub_22DE09A64;
    v74[1] = v71;
    swift_retain();
    v74[2] = sub_22DE09A64;
    v74[3] = v72;
    swift_retain();
    v74[4] = sub_22DF1D8EC;
    v74[5] = v73;
    sub_22DE04404();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v76))
    {
      buf = (uint8_t *)sub_22E0F7AB0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
      uint64_t v66 = sub_22DE087A0(0);
      uint64_t v67 = sub_22DE087A0(0);
      v87[0] = buf;
      uint64_t v86 = v66;
      uint64_t v85 = v67;
      sub_22DE087FC(0, v87);
      sub_22DE087FC(1, v87);
      id v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v84 = v71;
      sub_22DE08810(&v83, (uint64_t)v87, (uint64_t)&v86, (uint64_t)&v85);
      id v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
      uint64_t v84 = v72;
      sub_22DE08810(&v83, (uint64_t)v87, (uint64_t)&v86, (uint64_t)&v85);
      id v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
      uint64_t v84 = v73;
      sub_22DE08810(&v83, (uint64_t)v87, (uint64_t)&v86, (uint64_t)&v85);
      _os_log_impl(&dword_22DE00000, oslog, v76, "[getRequestedValue] use boundedValue: %f", buf, size);
      sub_22DE0885C(v66);
      sub_22DE0885C(v67);
      sub_22E0F7A90();
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

    return v82;
  }
}

id sub_22E0CC460(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  sub_22DE0D63C();
  id v12 = sub_22DE07498(3, 0);
  objc_msgSend(v12, sel_setOldValue_, a2);
  objc_msgSend(v12, sel_setUpdatedValue_, a3);
  id v5 = a4;
  objc_msgSend(v12, sel_setMinValue_, a4);

  id v6 = a5;
  objc_msgSend(v12, sel_setMaxValue_, a5);

  return v12;
}

SiriSettingsIntents::NumericSettingIdentifier_optional sub_22E0CC55C(void *a1)
{
  id v1 = a1;
  unint64_t v2 = sub_22DE86190();
  v7._uint64_t countAndFlagsBits = SettingIntent.settingIdentifier.getter(v2, (uint64_t)&protocol witness table for INSetNumericSettingIntent);
  v7._object = v3;

  if (v7._object)
  {
    Swift::String v8 = v7;
  }
  else
  {
    v8._uint64_t countAndFlagsBits = sub_22E0F7610();
    v8._object = v4;
    sub_22DE0D044();
  }
  return NumericSettingIdentifier.init(rawValue:)(v8);
}

BOOL sub_22E0CC63C(void *a1, void *a2)
{
  double v21 = 0.0;
  uint64_t v23 = a1;
  id v22 = a2;
  id v19 = objc_msgSend(a1, sel_numericValue);
  if (v19 && (id v17 = objc_msgSend(v19, sel_value), v19, v17))
  {
    objc_msgSend(v17, sel_doubleValue);
    double v14 = v2;

    double v15 = v14;
    char v16 = 0;
  }
  else
  {
    double v15 = 0.0;
    char v16 = 1;
  }
  if (v16) {
    goto LABEL_20;
  }
  double v21 = v15;
  id v20 = objc_msgSend(a2, sel_maxValue);
  if (v20)
  {
    id v12 = v20;
    id v3 = v20;
    sub_22DE63C6C(&v20);
    id v13 = objc_msgSend(v12, sel_value);

    if (v13)
    {
      objc_msgSend(v13, sel_doubleValue);
      double v9 = v4;

      double v10 = v9;
      char v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    sub_22DE63C6C(&v20);
  }
  double v10 = 0.0;
  char v11 = 1;
LABEL_15:
  if (v11)
  {
LABEL_20:
    sub_22E0F79A0();
    id v7 = (id)*sub_22DF136D8();
    id v5 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    return 0;
  }
  return v10 < v15;
}

BOOL sub_22E0CC94C(void *a1, void *a2)
{
  double v21 = 0.0;
  uint64_t v23 = a1;
  id v22 = a2;
  id v19 = objc_msgSend(a1, sel_numericValue);
  if (v19 && (id v17 = objc_msgSend(v19, sel_value), v19, v17))
  {
    objc_msgSend(v17, sel_doubleValue);
    double v14 = v2;

    double v15 = v14;
    char v16 = 0;
  }
  else
  {
    double v15 = 0.0;
    char v16 = 1;
  }
  if (v16) {
    goto LABEL_20;
  }
  double v21 = v15;
  id v20 = objc_msgSend(a2, sel_minValue);
  if (v20)
  {
    id v12 = v20;
    id v3 = v20;
    sub_22DE63C6C(&v20);
    id v13 = objc_msgSend(v12, sel_value);

    if (v13)
    {
      objc_msgSend(v13, sel_doubleValue);
      double v9 = v4;

      double v10 = v9;
      char v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    sub_22DE63C6C(&v20);
  }
  double v10 = 0.0;
  char v11 = 1;
LABEL_15:
  if (v11)
  {
LABEL_20:
    sub_22E0F79A0();
    id v7 = (id)*sub_22DF136D8();
    id v5 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    return 0;
  }
  return v15 < v10;
}

uint64_t sub_22E0CCC5C(void (*a1)(void), uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  double v193 = a6;
  double v195 = a7;
  int v172 = a1;
  uint64_t v171 = a2;
  unint64_t v166 = a3;
  uint64_t v167 = a4;
  uint64_t v168 = a5;
  double v169 = a8;
  double v170 = a9;
  uint64_t v200 = sub_22DF1C6D8;
  uint64_t v202 = sub_22DF1D8A0;
  uint32_t v206 = sub_22DF1C6D8;
  uint64_t v210 = sub_22DF1D8A0;
  uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  uint64_t v214 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  uint64_t v216 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
  uint64_t v218 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  unint64_t v220 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DE09A64;
  unint64_t v223 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22DF1D8EC;
  uint64_t v165 = "[handleNumericSettingIntent] Failed to execute set value callback.";
  double v250 = 0.0;
  uint64_t v249 = 0;
  uint64_t v247 = 0;
  uint64_t v248 = 0;
  uint64_t v245 = 0;
  uint64_t v246 = 0;
  uint64_t v244 = 0;
  uint64_t v243 = 0;
  uint64_t v242 = 0;
  id v235 = 0;
  uint64_t v173 = sub_22E0F7E10();
  uint64_t v174 = *(void *)(v173 - 8);
  uint64_t v175 = v173 - 8;
  uint64_t v176 = *(void *)(v174 + 64);
  unint64_t v177 = (v176 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v172, v171, v166, v167);
  uint64_t v178 = (char *)v97 - v177;
  unint64_t v179 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10, v11, v12, v13);
  uint64_t v180 = (char *)v97 - v179;
  unint64_t v181 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v15, v16, v17, v18);
  unint64_t v182 = (char *)v97 - v181;
  unint64_t v183 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20, v21, v22, v23);
  uint64_t v184 = (char *)v97 - v183;
  unint64_t v185 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25, v26, v27, v28);
  unint64_t v186 = (char *)v97 - v185;
  unint64_t v187 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v30, v31, v32, v33);
  uint64_t v188 = (char *)v97 - v187;
  unint64_t v189 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35, v36, v37, v38);
  int v190 = (char *)v97 - v189;
  unint64_t v191 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v44 = MEMORY[0x270FA5388](v40, v41, v42, v43);
  id v192 = (char *)v97 - v191;
  double v250 = v44;
  uint64_t v249 = v45;
  uint64_t v247 = v46;
  uint64_t v248 = v47;
  uint64_t v245 = v48;
  uint64_t v246 = v49;
  uint64_t v244 = v50;
  uint64_t v243 = v51;
  uint64_t v242 = v52;
  int v228 = sub_22E0F7990();
  os_log_t v227 = (os_log_t)*sub_22DF136D8();
  uint64_t v53 = v227;
  uint64_t v194 = 24;
  uint64_t v208 = 7;
  uint64_t v201 = swift_allocObject();
  *(double *)(v201 + 16) = v193;
  uint64_t v209 = swift_allocObject();
  *(double *)(v209 + 16) = v195;
  uint64_t v198 = &v240;
  uint64_t v240 = 22;
  unint64_t v196 = sub_22DE0862C();
  unint64_t v197 = sub_22DE086A8();
  sub_22DE08724();
  sub_22E0F76B0();
  uint32_t v199 = v241;
  uint64_t v204 = 17;
  uint64_t v213 = swift_allocObject();
  *(unsigned char *)(v213 + 16) = 0;
  uint64_t v215 = swift_allocObject();
  int v205 = 8;
  *(unsigned char *)(v215 + 16) = 8;
  uint64_t v207 = 32;
  uint64_t v54 = swift_allocObject();
  uint64_t v55 = v201;
  uint64_t v203 = v54;
  *(void *)(v54 + 16) = v200;
  *(void *)(v54 + 24) = v55;
  uint64_t v56 = swift_allocObject();
  uint64_t v57 = v203;
  uint64_t v217 = v56;
  *(void *)(v56 + 16) = v202;
  *(void *)(v56 + 24) = v57;
  uint64_t v219 = swift_allocObject();
  *(unsigned char *)(v219 + 16) = 0;
  uint64_t v221 = swift_allocObject();
  *(unsigned char *)(v221 + 16) = v205;
  uint64_t v58 = swift_allocObject();
  uint64_t v59 = v209;
  uint64_t v211 = v58;
  *(void *)(v58 + 16) = v206;
  *(void *)(v58 + 24) = v59;
  uint64_t v60 = swift_allocObject();
  uint64_t v61 = v211;
  uint64_t v224 = v60;
  *(void *)(v60 + 16) = v210;
  *(void *)(v60 + 24) = v61;
  uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF930);
  uint64_t v222 = sub_22E0F7E50();
  uint64_t v225 = v62;
  swift_retain();
  uint64_t v63 = v213;
  char v64 = v225;
  *uint64_t v225 = v212;
  v64[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v63;
  swift_retain();
  uint64_t v65 = v215;
  uint64_t v66 = v225;
  v225[2] = v214;
  void v66[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v65;
  swift_retain();
  uint64_t v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v217;
  double v68 = v225;
  v225[4] = v216;
  v68[5] = v67;
  swift_retain();
  uint64_t v69 = v219;
  uint64_t v70 = v225;
  v225[6] = v218;
  v70[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v69;
  swift_retain();
  uint64_t v71 = v221;
  uint64_t v72 = v225;
  v225[8] = v220;
  v72[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v71;
  swift_retain();
  uint64_t v73 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v224;
  uint64_t v74 = v225;
  v225[10] = v223;
  v74[11] = v73;
  sub_22DE04404();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v227, (os_log_type_t)v228))
  {
    int v157 = (uint8_t *)sub_22E0F7AB0();
    uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BF970);
    uint64_t v156 = 0;
    uint64_t v158 = sub_22DE087A0(0);
    uint64_t v159 = sub_22DE087A0(v156);
    id v160 = &v233;
    uint64_t v233 = v157;
    id v161 = &v232;
    uint64_t v232 = v158;
    uint64_t v162 = &v231;
    uint64_t v231 = v159;
    sub_22DE087FC(0, &v233);
    sub_22DE087FC(2, v160);
    uint64_t v75 = v164;
    uint64_t v229 = v212;
    uint64_t v230 = v213;
    sub_22DE08810(&v229, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162);
    uint64_t v163 = v75;
    if (v75)
    {
      __break(1u);
    }
    else
    {
      uint64_t v229 = v214;
      uint64_t v230 = v215;
      sub_22DE08810(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
      uint64_t v153 = 0;
      uint64_t v76 = v153;
      uint64_t v229 = v216;
      uint64_t v230 = v217;
      sub_22DE08810(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
      uint64_t v152 = v76;
      uint64_t v229 = v218;
      uint64_t v230 = v219;
      sub_22DE08810(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
      uint64_t v151 = 0;
      uint64_t v229 = v220;
      uint64_t v230 = v221;
      sub_22DE08810(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
      uint64_t v150 = 0;
      uint64_t v229 = v223;
      uint64_t v230 = v224;
      sub_22DE08810(&v229, (uint64_t)&v233, (uint64_t)&v232, (uint64_t)&v231);
      uint64_t v149 = 0;
      _os_log_impl(&dword_22DE00000, v227, (os_log_type_t)v228, "[handleNumericSettingIntent] Requested value: %f, current value: %f", v157, v199);
      uint64_t v148 = 0;
      sub_22DE0885C(v158);
      sub_22DE0885C(v159);
      sub_22E0F7A90();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      id v154 = v149;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    id v154 = v164;
  }
  id v147 = v154;

  if (v193 == v195)
  {
    uint64_t v143 = (uint64_t)v147;
    goto LABEL_14;
  }
  swift_retain();
  sub_22DE63C04();
  id v77 = sub_22DF92C0C();
  uint64_t v78 = v147;
  id v144 = v77;
  v172();
  uint64_t v145 = (uint64_t)v78;
  id v146 = v78;
  if (!v78)
  {

    swift_release();
    uint64_t v143 = v145;
LABEL_14:
    uint64_t v130 = v143;
    swift_retain();
    uint64_t v131 = 0;
    unint64_t v132 = sub_22DF1DD0C();
    unint64_t v133 = sub_22DE63C04();
    double v136 = sub_22DFA83DC(v195);
    uint64_t v141 = (_DWORD *)MEMORY[0x263F8E210];
    uint64_t v79 = *MEMORY[0x263F8E210];
    BOOL v134 = *(void (**)(char *, uint64_t, uint64_t))(v174 + 104);
    uint64_t v135 = v174 + 104;
    v134(v192, v79, v173);
    double v239 = v136;
    uint64_t v137 = *(void (**)(char *, char *, uint64_t))(v174 + 16);
    uint64_t v138 = v174 + 16;
    v137(v190, v192, v173);
    uint64_t v139 = *(uint64_t (**)(char *, uint64_t))(v174 + 88);
    uint64_t v140 = v174 + 88;
    int v142 = v139(v190, v173);
    if (v142 == *v141)
    {
      double v239 = round(v136);
      goto LABEL_28;
    }
    if (v142 == *MEMORY[0x263F8E208])
    {
      double v239 = rint(v136);
      goto LABEL_28;
    }
    if (v142 == *MEMORY[0x263F8E218]) {
      goto LABEL_25;
    }
    if (v142 == *MEMORY[0x263F8E220]) {
      goto LABEL_27;
    }
    if (v142 == *MEMORY[0x263F8E1F8])
    {
      double v239 = trunc(v136);
      goto LABEL_28;
    }
    if (v142 != *MEMORY[0x263F8E200])
    {
      sub_22E0F7820();
      (*(void (**)(char *, uint64_t))(v174 + 8))(v190, v173);
      goto LABEL_28;
    }
    if (sub_22E0F7830()) {
LABEL_27:
    }
      double v239 = floor(v136);
    else {
LABEL_25:
    }
      double v239 = ceil(v136);
LABEL_28:
    double v125 = v239;
    uint64_t v123 = *(void (**)(char *, uint64_t))(v174 + 8);
    uint64_t v124 = v174 + 8;
    v123(v192, v173);
    id v80 = sub_22DF92C0C();
    id v126 = sub_22DF92C4C(v80);
    double v127 = sub_22DFA83DC(v193);
    uint64_t v128 = (_DWORD *)MEMORY[0x263F8E210];
    v134(v188, *MEMORY[0x263F8E210], v173);
    double v238 = v127;
    v137(v186, v188, v173);
    int v129 = v139(v186, v173);
    if (v129 != *v128)
    {
      if (v129 == *MEMORY[0x263F8E208])
      {
        double v238 = rint(v127);
        goto LABEL_43;
      }
      if (v129 == *MEMORY[0x263F8E218]) {
        goto LABEL_40;
      }
      if (v129 != *MEMORY[0x263F8E220])
      {
        if (v129 == *MEMORY[0x263F8E1F8])
        {
          double v238 = trunc(v127);
          goto LABEL_43;
        }
        if (v129 != *MEMORY[0x263F8E200])
        {
          sub_22E0F7820();
          v123(v186, v173);
LABEL_43:
          double v118 = v238;
          v123(v188, v173);
          id v81 = sub_22DF92C0C();
          id v119 = sub_22DF92C4C(v81);
          double v120 = sub_22DFA83DC(v169);
          uint64_t v121 = (_DWORD *)MEMORY[0x263F8E210];
          v134(v184, *MEMORY[0x263F8E210], v173);
          double v237 = v120;
          v137(v182, v184, v173);
          int v122 = v139(v182, v173);
          if (v122 == *v121)
          {
            double v237 = round(v120);
            goto LABEL_58;
          }
          if (v122 == *MEMORY[0x263F8E208])
          {
            double v237 = rint(v120);
            goto LABEL_58;
          }
          if (v122 == *MEMORY[0x263F8E218]) {
            goto LABEL_55;
          }
          if (v122 == *MEMORY[0x263F8E220]) {
            goto LABEL_57;
          }
          if (v122 == *MEMORY[0x263F8E1F8])
          {
            double v237 = trunc(v120);
            goto LABEL_58;
          }
          if (v122 != *MEMORY[0x263F8E200])
          {
            sub_22E0F7820();
            v123(v182, v173);
            goto LABEL_58;
          }
          if (sub_22E0F7830()) {
LABEL_57:
          }
            double v237 = floor(v120);
          else {
LABEL_55:
          }
            double v237 = ceil(v120);
LABEL_58:
          double v113 = v237;
          v123(v184, v173);
          id v82 = sub_22DF92C0C();
          id v114 = sub_22DF92C4C(v82);
          double v115 = sub_22DFA83DC(v170);
          char v116 = (_DWORD *)MEMORY[0x263F8E210];
          v134(v180, *MEMORY[0x263F8E210], v173);
          double v236 = v115;
          v137(v178, v180, v173);
          int v117 = v139(v178, v173);
          if (v117 != *v116)
          {
            if (v117 == *MEMORY[0x263F8E208])
            {
              double v236 = rint(v115);
              goto LABEL_73;
            }
            if (v117 == *MEMORY[0x263F8E218]) {
              goto LABEL_70;
            }
            if (v117 != *MEMORY[0x263F8E220])
            {
              if (v117 == *MEMORY[0x263F8E1F8])
              {
                double v236 = trunc(v115);
                goto LABEL_73;
              }
              if (v117 != *MEMORY[0x263F8E200])
              {
                sub_22E0F7820();
                v123(v178, v173);
LABEL_73:
                double v109 = v236;
                v123(v180, v173);
                id v83 = sub_22DF92C0C();
                id v110 = sub_22DF92C4C(v83);
                id v111 = sub_22E0CC460(0, (uint64_t)v126, (uint64_t)v119, v114, v110);

                ((void (*)(id))v166)(v111);
                swift_release();
                uint64_t result = v130;
                uint64_t v112 = v130;
                return result;
              }
              if ((sub_22E0F7830() & 1) == 0)
              {
LABEL_70:
                double v236 = ceil(v115);
                goto LABEL_73;
              }
            }
            double v236 = floor(v115);
            goto LABEL_73;
          }
          double v236 = round(v115);
          goto LABEL_73;
        }
        if ((sub_22E0F7830() & 1) == 0)
        {
LABEL_40:
          double v238 = ceil(v127);
          goto LABEL_43;
        }
      }
      double v238 = floor(v127);
      goto LABEL_43;
    }
    double v238 = round(v127);
    goto LABEL_43;
  }
  id v107 = v146;
  uint64_t v108 = 0;

  swift_release();
  id v85 = v107;
  id v235 = v107;
  int v103 = sub_22E0F79A0();
  id v105 = (id)*sub_22DF136D8();
  id v86 = v105;
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v102 = sub_22E0F7E50();
  double v100 = v87;
  id v88 = v107;
  v97[1] = &v234;
  id v234 = v107;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0008);
  uint64_t v98 = sub_22E0F7590();
  uint64_t v99 = v89;
  v100[3] = MEMORY[0x263F8D310];
  unint64_t v90 = sub_22DE103A4();
  uint64_t v91 = v98;
  uint64_t v92 = v99;
  uint64_t v93 = v100;
  unint64_t v94 = v90;
  uint64_t v95 = v102;
  v100[4] = v94;
  uint64_t *v93 = v91;
  v93[1] = v92;
  sub_22DE04404();
  uint64_t v104 = v95;
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  uint64_t v96 = sub_22DEF82C8();
  id v106 = sub_22E0CAA4C(0, v96);
  v166();

  swift_release();
  return v108;
}

uint64_t sub_22E0CE8FC()
{
  return sub_22E0CCC5C(*(void (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void (**)(void))(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(double *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 72), *(double *)(v0 + 80));
}

uint64_t sub_22E0CE944()
{
  return swift_deallocObject();
}

double sub_22E0CE970(uint64_t a1, double a2)
{
  swift_beginAccess();
  double v5 = *(double *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 24);
  swift_endAccess();
  if (v6) {
    return a2;
  }
  else {
    return v5;
  }
}

uint64_t sub_22E0CEA0C()
{
  return swift_deallocObject();
}

double sub_22E0CEA4C()
{
  return sub_22E0CE970(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_22E0CEA58()
{
  return swift_deallocObject();
}

void sub_22E0CEA84(void *a1)
{
}

uint64_t sub_22E0CEAA8()
{
  return swift_deallocObject();
}

void sub_22E0CEAE8()
{
  sub_22E0CEA84(*(void **)(v0 + 16));
}

uint64_t sub_22E0CEAF0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CEB1C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CEB48()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CEB74(uint64_t a1, char a2)
{
  if (a2) {
    return a1;
  }
  sub_22E0F7EC0();
  sub_22E0F7EB0();
  return v4;
}

uint64_t sub_22E0CEC84()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CECB0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CECDC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a1;
  uint64_t v21 = a6;
  v13[1] = a7;
  uint64_t v14 = sub_22E0CF6BC;
  uint64_t v25 = a6;
  uint64_t v18 = *(void *)(a6 - 8);
  uint64_t v19 = a6 - 8;
  v13[0] = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](a1, a2, a3, a4);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = sub_22E0F7C90() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  sub_22E0CEE6C(v20, v14, (uint64_t)v22, v21, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v15);
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  *v17 += v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_22E0CEE44()
{
  return sub_22E0F7AD0();
}

uint64_t sub_22E0CEE6C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t sub_22E0CEF9C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22E0CEFC4()
{
  return swift_deallocObject();
}

void *sub_22E0CF004(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1;
  sub_22E0F7AD0();
  uint64_t result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_22E0CF070()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF0B0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF0DC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF108()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF148()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF188()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF1B4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF1E0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_22E0CF21C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF25C@<X0>(uint64_t *a1@<X8>)
{
  return sub_22E0CF1E0(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_22E0CF268()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF2A8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = sub_22DF8001C();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return sub_22E0CECDC(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_22E0CF31C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF348()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF374()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF3B4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF3F4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF420()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF44C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF48C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF4CC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF4F8()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF524()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF564()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF5A4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF5D0()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF5FC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF628()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF668()
{
  return swift_deallocObject();
}

void *type metadata accessor for SetNumericIntentHandlerUtil()
{
  return &unk_26E1E1940;
}

uint64_t sub_22E0CF6BC()
{
  return sub_22E0CEE44();
}

uint64_t sub_22E0CF6EC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF718()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF744()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF770()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF79C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF7DC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF81C()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF848()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF874()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF8B4()
{
  return swift_deallocObject();
}

uint64_t sub_22E0CF8F4()
{
  type metadata accessor for SetAXColorFiltersGrayscaleHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7DC8 = result;
  return result;
}

uint64_t type metadata accessor for SetAXColorFiltersGrayscaleHandler()
{
  return self;
}

uint64_t *sub_22E0CF95C()
{
  if (qword_2685BF7D8 != -1) {
    swift_once();
  }
  return &qword_2685D7DC8;
}

uint64_t sub_22E0CF9C0(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE6D26C();
  swift_release();
  unint64_t v4 = sub_22DF0A130();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0CFBD4, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0CFBD4);
}

uint64_t sub_22E0CFB64()
{
  return swift_release();
}

uint64_t sub_22E0CFBD4()
{
  return sub_22E0CFB64();
}

uint64_t sub_22E0CFBFC(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0CF9C0(a1, a2, a3);
}

uint64_t sub_22E0CFC20()
{
  type metadata accessor for SetAXIncreaseContrastHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7DD0 = result;
  return result;
}

uint64_t type metadata accessor for SetAXIncreaseContrastHandler()
{
  return self;
}

uint64_t *sub_22E0CFC88()
{
  if (qword_2685BF7E0 != -1) {
    swift_once();
  }
  return &qword_2685D7DD0;
}

uint64_t sub_22E0CFCEC(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE6CF9C();
  swift_release();
  unint64_t v4 = sub_22DF0A4D4();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0CFF00, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0CFF00);
}

uint64_t sub_22E0CFE90()
{
  return swift_release();
}

uint64_t sub_22E0CFF00()
{
  return sub_22E0CFE90();
}

uint64_t sub_22E0CFF28(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0CFCEC(a1, a2, a3);
}

uint64_t sub_22E0CFF4C()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "SetLabeledSettingIntent#ConnectToWifi";
  *(void *)(v0 + 8) = 37;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "SetLabeledSettingIntent#EnvironmentErrors";
  *(void *)(v0 + 32) = 41;
  *(unsigned char *)(v0 + 40) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  if (!v3)
  {
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  if (v3 == 1)
  {
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_22E0D0084()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0D0110()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0D015C()
{
  uint64_t v2 = qword_2685C3DA0;
  if (!qword_2685C3DA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3DA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D01DC()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0D021C()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0D0264()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0D02AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0CFF4C();
  *a1 = result;
  return result;
}

uint64_t sub_22E0D02E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0D0084();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0D031C()
{
  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_22E0D0358, 0);
}

uint64_t sub_22E0D0358()
{
  v0[2] = v0;
  uint64_t v8 = sub_22E0F7610();
  uint64_t v5 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v6 = sub_22E0F7C10();
  v0[6] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 56) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22DE99D98;
  return v7(v8, v5, v6);
}

uint64_t sub_22E0D0494()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0D04E0()
{
  uint64_t v2 = qword_2685C3DB0[0];
  if (!qword_2685C3DB0[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2685C3DB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D0560()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0D05A0()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0D05E8()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0D0630()
{
  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return MEMORY[0x270FA2498](sub_22E0D066C, 0);
}

uint64_t sub_22E0D066C()
{
  v0[2] = v0;
  uint64_t v9 = sub_22E0F7610();
  uint64_t v6 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v0[6] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                   + (int)*MEMORY[0x263F6D0C0]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 56) = v2;
  unint64_t v3 = sub_22E0D04E0();
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_22DE99D98;
  return v8(v9, v6, v7, &unk_26E1E1C40, v3);
}

uint64_t sub_22E0D07C0(uint64_t a1)
{
  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return MEMORY[0x270FA2498](sub_22E0D08A0, 0);
}

uint64_t sub_22E0D08A0()
{
  uint64_t v15 = (void *)v0[7];
  uint64_t v14 = (const void *)v0[5];
  v0[2] = v0;
  uint64_t v11 = sub_22E0F7610();
  uint64_t v12 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  char v13 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v13[1] = v3;
  sub_22DE5A4C4(v14, v15);
  uint64_t v16 = sub_22E0F7100();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    sub_22DE58794(v10[7]);
    void v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  else
  {
    uint64_t v9 = v10[7];
    v13[5] = v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v9, v16);
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v7 = sub_22E0F7C10();
  v10[9] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D0C8] + (int)*MEMORY[0x263F6D0C8]);
  uint64_t v5 = (void *)swift_task_alloc();
  v10[10] = v5;
  *uint64_t v5 = v10[2];
  v5[1] = sub_22DF3E3AC;
  return v8(v11, v12, v7);
}

uint64_t sub_22E0D0B40()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "Status";
  *(void *)(v0 + 8) = 6;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "dialog1";
  *(void *)(v0 + 32) = 7;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "dialog2";
  *(void *)(v0 + 56) = 7;
  *(unsigned char *)(v0 + 64) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_8:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_8;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_22E0D0CB8()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0D0D8C()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0D0DD8()
{
  uint64_t v2 = qword_2685C3DC8;
  if (!qword_2685C3DC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3DC8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D0E58()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0D0E98()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0D0EE0()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0D0F28@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0D0B40();
  *a1 = result;
  return result;
}

uint64_t sub_22E0D0F60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0D0CB8();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0D0F94(uint64_t a1)
{
  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return MEMORY[0x270FA2498](sub_22E0D1074, 0);
}

uint64_t sub_22E0D1074()
{
  uint64_t v16 = (void *)v0[7];
  uint64_t v15 = (const void *)v0[5];
  v0[2] = v0;
  uint64_t v12 = sub_22E0F7610();
  uint64_t v13 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v14 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v14[1] = v3;
  sub_22DE5A4C4(v15, v16);
  uint64_t v17 = sub_22E0F7100();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v18 + 48))(v16, 1) == 1)
  {
    sub_22DE58794(v11[7]);
    v14[2] = 0;
    v14[3] = 0;
    void v14[4] = 0;
    v14[5] = 0;
  }
  else
  {
    uint64_t v10 = v11[7];
    v14[5] = v17;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 32))(boxed_opaque_existential_1, v10, v17);
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  uint64_t v8 = sub_22E0F7C10();
  v11[9] = v8;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x263F6D0C0]
                                                                                   + (int)*MEMORY[0x263F6D0C0]);
  uint64_t v5 = (void *)swift_task_alloc();
  v11[10] = v5;
  unint64_t v6 = sub_22E0D0DD8();
  *uint64_t v5 = v11[2];
  v5[1] = sub_22DF3E3AC;
  return v9(v12, v13, v8, &unk_26E1E1CD0, v6);
}

uint64_t type metadata accessor for SetLabeledSettingIntentCATsSimple()
{
  uint64_t v1 = qword_2685C3DD8;
  if (!qword_2685C3DD8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0D13A4()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0D1418(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0D1474(a1, a2, a3);
}

uint64_t sub_22E0D1474(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7110();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0D1640(char a1, uint64_t a2)
{
  return sub_22E0D1698(a1 & 1, a2);
}

uint64_t sub_22E0D1698(int a1, uint64_t a2)
{
  int v10 = a1;
  uint64_t v11 = a2;
  uint64_t v18 = 0;
  char v17 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = sub_22E0F7260();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v8 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v4 = MEMORY[0x270FA5388](v14, v11, v14, v3);
  uint64_t v9 = (char *)&v7 - v8;
  char v17 = v10 & 1;
  uint64_t v16 = v5;
  uint64_t v18 = v2;
  (*(void (**)(double))(v12 + 16))(v4);
  uint64_t v15 = sub_22E0F7120();
  swift_retain();
  uint64_t v18 = v15;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
  swift_release();
  return v15;
}

uint64_t sub_22E0D17D8()
{
  return type metadata accessor for SetLabeledSettingIntentCATsSimple();
}

void *type metadata accessor for SetLabeledSettingIntentCATsSimple.Properties()
{
  return &unk_26E1E1BB0;
}

void *type metadata accessor for SetLabeledSettingIntentCATsSimple.ConnectToWifiDialogIds()
{
  return &unk_26E1E1C40;
}

void *type metadata accessor for SetLabeledSettingIntentCATsSimple.EnvironmentErrorsDialogIds()
{
  return &unk_26E1E1CD0;
}

unint64_t sub_22E0D1830()
{
  return sub_22E0D1848();
}

unint64_t sub_22E0D1848()
{
  uint64_t v2 = qword_2685C3DE8;
  if (!qword_2685C3DE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3DE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0D18C8()
{
  return sub_22E0D18E0();
}

unint64_t sub_22E0D18E0()
{
  uint64_t v2 = qword_2685C3DF0;
  if (!qword_2685C3DF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3DF0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0D1960()
{
  return sub_22E0D1978();
}

unint64_t sub_22E0D1978()
{
  uint64_t v2 = qword_2685C3DF8;
  if (!qword_2685C3DF8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3DF8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D19F8()
{
  type metadata accessor for SetAssistiveTouchHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7DE8 = result;
  return result;
}

uint64_t type metadata accessor for SetAssistiveTouchHandler()
{
  return self;
}

uint64_t *sub_22E0D1A60()
{
  if (qword_2685BF7E8 != -1) {
    swift_once();
  }
  return &qword_2685D7DE8;
}

uint64_t sub_22E0D1AC4(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  BOOL v8 = sub_22DE65F48();
  swift_release();
  double v4 = sub_22DF09D28();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0D1CD8, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0D1CD8);
}

uint64_t sub_22E0D1C68(char a1)
{
  return swift_release();
}

uint64_t sub_22E0D1CD8(char a1)
{
  return sub_22E0D1C68(a1 & 1);
}

uint64_t sub_22E0D1D00(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0D1AC4(a1, a2, a3);
}

uint64_t sub_22E0D1D24(uint64_t a1, uint64_t a2)
{
  return sub_22E0D2300(a1, a2);
}

uint64_t sub_22E0D1D78(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v25 = a1;
  unsigned int v19 = a2;
  uint64_t v24 = a3;
  uint64_t v33 = 0;
  char v32 = 0;
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  v11[1] = 0;
  uint64_t v26 = sub_22E0F7100();
  uint64_t v22 = *(void **)(v26 - 8);
  uint64_t v23 = v26 - 8;
  uint64_t v13 = v22[8];
  unint64_t v12 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](0, v19, v24, v3);
  uint64_t v17 = (uint64_t)v11 - v12;
  unint64_t v14 = v12;
  MEMORY[0x270FA5388](v4, v5, v6, (char *)v11 - v12);
  uint64_t v18 = (uint64_t)v11 - v14;
  uint64_t v33 = v7;
  char v32 = v8 & 1;
  uint64_t v31 = v9;
  type metadata accessor for SettingsBinarySetting.Builder();
  uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t))v22[2];
  uint64_t v15 = v22 + 2;
  v16(v18, v25, v26);
  v16(v17, v24, v26);
  uint64_t v20 = sub_22E0D1D24(v18, v17);
  uint64_t v21 = sub_22E0D2570(v19 & 1);
  swift_release();
  uint64_t v30 = v21;
  swift_retain();
  uint64_t v29 = sub_22E0D2660(v21);
  swift_retain();
  uint64_t v34 = v29;
  swift_release();
  uint64_t v28 = (void (*)(uint64_t, uint64_t))v22[1];
  uint64_t v27 = v22 + 1;
  v28(v24, v26);
  v28(v25, v26);
  swift_release();
  return v29;
}

uint64_t sub_22E0D1FAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  swift_beginAccess();
  uint64_t v2 = sub_22E0F7100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v4);
  return swift_endAccess();
}

uint64_t sub_22E0D2038(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v13 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v6 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v3 = MEMORY[0x270FA5388](v13, v12, v13, v2);
  char v8 = (char *)&v5 - v6;
  (*(void (**)(double))(v10 + 16))(v3);
  uint64_t v7 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  uint64_t v9 = &v14;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 40))(v7, v8, v13);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v12, v13);
}

uint64_t (*sub_22E0D2178())()
{
  return sub_22DE10544;
}

uint64_t sub_22E0D21DC()
{
  uint64_t v2 = (char *)(v0 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_22E0D223C(char a1)
{
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  swift_beginAccess();
  *uint64_t v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_22E0D229C())()
{
  return sub_22DE10544;
}

uint64_t sub_22E0D2300(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a1;
  uint64_t v10 = a2;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  uint64_t v14 = sub_22E0F7100();
  uint64_t v11 = *(void *)(v14 - 8);
  uint64_t v12 = v14 - 8;
  v7[0] = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (uint64_t)v7 - v7[0];
  uint64_t v19 = MEMORY[0x270FA5388](v13, v10, v3, v4);
  uint64_t v18 = v5;
  swift_retain();
  swift_retain();
  uint64_t v20 = v2;
  *(unsigned char *)(v2 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value) = 0;
  swift_release();
  char v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v7[2] = v11 + 16;
  v8(v9, v13, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v2 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name, v9, v14);
  swift_release();
  v8(v9, v10, v14);
  uint64_t v17 = sub_22E0A9374(v9);
  swift_retain();
  uint64_t v20 = v17;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  uint64_t v15 = v11 + 8;
  v16(v10, v14);
  v16(v13, v14);
  swift_release();
  return v17;
}

uint64_t type metadata accessor for SettingsBinarySetting.Builder()
{
  uint64_t v1 = qword_2685C3E30;
  if (!qword_2685C3E30) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0D2570(char a1)
{
  swift_retain();
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  swift_beginAccess();
  *uint64_t v4 = a1 & 1;
  swift_endAccess();
  swift_release();
  swift_retain();
  return v5;
}

uint64_t sub_22E0D2614()
{
  type metadata accessor for SettingsBinarySetting();
  swift_retain();
  return sub_22E0D2660(v1);
}

uint64_t sub_22E0D2660(uint64_t a1)
{
  return sub_22E0D2A94(a1);
}

uint64_t type metadata accessor for SettingsBinarySetting()
{
  uint64_t v1 = qword_2685C3E20;
  if (!qword_2685C3E20) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0D2724()
{
  return sub_22E0D2770();
}

uint64_t sub_22E0D2770()
{
  if (!"SiriSettingsIntents.Builder")
  {
    sub_22E0F7CA0();
    __break(1u);
  }
  uint64_t result = sub_22DF0593C((uint64_t)"SiriSettingsIntents.Builder", 27, (unint64_t)"init(identifier:)", 17, 2, (unint64_t)"SiriSettingsIntents/SettingsBinarySetting.swift", 47, 2, v1, 0xDuLL, 0xBuLL);
  __break(1u);
  return result;
}

uint64_t sub_22E0D288C()
{
  uint64_t v3 = OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  uint64_t v1 = sub_22E0F7100();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
}

uint64_t sub_22E0D28F8()
{
  uint64_t v3 = sub_22E0A94A8();
  uint64_t v2 = OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  uint64_t v0 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v0 - 8) + 8))(v3 + v2);
  return v3;
}

uint64_t sub_22E0D2978()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E0D29E0()
{
  return sub_22E0F7610();
}

uint64_t SettingsBinarySetting.name.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
  uint64_t v2 = sub_22E0F7100();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t sub_22E0D2A94(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v13 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v7 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (char *)&v6 - v7;
  uint64_t v24 = MEMORY[0x270FA5388](v20, v2, v3, v4);
  swift_retain();
  swift_retain();
  uint64_t v25 = v1;
  uint64_t v8 = v20 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  uint64_t v9 = &v23;
  uint64_t v14 = 32;
  uint64_t v15 = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v8, v13);
  swift_endAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v1 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v12, v13);
  swift_release();
  uint64_t v16 = (unsigned __int8 *)(v20 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  uint64_t v17 = &v22;
  swift_beginAccess();
  int v18 = *v16;
  swift_endAccess();
  *(unsigned char *)(v19 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_value) = v18 & 1;
  swift_release();
  swift_retain();
  uint64_t v21 = sub_22E0A974C(v20);
  swift_retain();
  uint64_t v25 = v21;
  swift_release();
  swift_release();
  return v21;
}

uint64_t sub_22E0D2C90@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v9 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = v8 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
    uint64_t v6 = sub_22E0F7100();
    a1[3] = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_22E0F7610();
    swift_bridgeObjectRetain();
    char v4 = sub_22E0F7620();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v4)
    {
      uint64_t result = swift_bridgeObjectRelease();
      char v3 = *(unsigned char *)(v8 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_value);
      a1[3] = MEMORY[0x263F8D4F8];
      *(unsigned char *)a1 = v3 & 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_retain();
      sub_22E0A989C(a1);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22E0D2EB8()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0D2F04()
{
  uint64_t v2 = qword_2685C3E00;
  if (!qword_2685C3E00)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3E00);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D2F84()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0D2FC4()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0D300C()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0D3054()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0D3084()
{
  uint64_t v2 = qword_2685C3E08;
  if (!qword_2685C3E08)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3E08);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D3104()
{
  return sub_22E0F7F90();
}

uint64_t sub_22E0D3134(void *a1)
{
  swift_allocObject();
  uint64_t v5 = sub_22E0D31C4(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t sub_22E0D31C4(void *a1)
{
  double v44 = a1;
  uint64_t v56 = 0;
  uint64_t v54 = 0;
  uint64_t v53 = 0;
  uint64_t v35 = sub_22E0F7100();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = v35 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35, v2, v3, v4);
  uint64_t v39 = (char *)v16 - v38;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3E10);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v40 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v44, v5, v6, v7);
  uint64_t v45 = (char *)v16 - v43;
  uint64_t v56 = (char *)v16 - v43;
  char v55 = 0;
  uint64_t v53 = v8;
  swift_retain();
  swift_retain();
  uint64_t v54 = v1;
  uint64_t v47 = v44[3];
  uint64_t v48 = v44[4];
  __swift_project_boxed_opaque_existential_1(v44, v47);
  sub_22E0D3084();
  uint64_t v9 = v46;
  sub_22E0F7F60();
  uint64_t v49 = v9;
  uint64_t v50 = v9;
  if (v9)
  {
    uint64_t v20 = v50;
    swift_release();
    swift_release();
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v31 = &v52;
    char v52 = 0;
    sub_22DF24950();
    uint64_t v10 = v49;
    sub_22E0F7D70();
    uint64_t v32 = v10;
    uint64_t v33 = v10;
    if (v10)
    {
      uint64_t v19 = v33;
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
      uint64_t v21 = v19;
    }
    else
    {
      int v27 = 1;
      char v55 = 1;
      (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v34 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v39, v35);
      swift_release();
      uint64_t v11 = v32;
      v51[46] = v27;
      int v12 = sub_22E0F7D40();
      uint64_t v28 = v11;
      int v29 = v12;
      uint64_t v30 = v11;
      if (v11)
      {
        uint64_t v18 = v30;
        swift_release();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
        uint64_t v21 = v18;
      }
      else
      {
        *(unsigned char *)(v34 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_value) = v29 & 1;
        swift_release();
        char v23 = v51;
        sub_22DE1268C((uint64_t)v44, (uint64_t)v51);
        uint64_t v13 = v28;
        char v55 = 7;
        uint64_t v14 = SettingsSetting.init(from:)((uint64_t)v23);
        uint64_t v24 = v13;
        uint64_t v25 = v14;
        uint64_t v26 = v13;
        if (!v13)
        {
          uint64_t v22 = v25;
          swift_retain();
          uint64_t v54 = v22;
          (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
          swift_release();
          return v22;
        }
        uint64_t v17 = v26;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
        uint64_t v21 = v17;
      }
    }
  }
  v16[3] = v21;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  if ((v55 & 4) == 0)
  {
    if (v55) {
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v54 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v35);
    }
    v16[2] = v54;
    type metadata accessor for SettingsBinarySetting();
    swift_deallocPartialClassInstance();
  }
  return v16[1];
}

uint64_t sub_22E0D3774(void *a1)
{
  uint64_t v36 = a1;
  unint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v25 = sub_22E0F7100();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = v25 - 8;
  unint64_t v28 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25, v2, v3, v4);
  int v29 = (char *)v14 - v28;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3E18);
  uint64_t v6 = v30;
  uint64_t v31 = v5;
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5 - 8;
  unint64_t v34 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v36, v7, v8, v9);
  uint64_t v35 = (char *)v14 - v34;
  unint64_t v43 = (char *)v14 - v34;
  uint64_t v42 = v10;
  uint64_t v41 = v1;
  swift_retain();
  sub_22E0A9E00((uint64_t)v36);
  uint64_t v37 = v6;
  uint64_t v38 = v6;
  if (v6)
  {
    uint64_t v15 = v38;
    uint64_t result = swift_release();
    uint64_t v16 = v15;
  }
  else
  {
    swift_release();
    uint64_t v19 = v36[3];
    uint64_t v20 = v36[4];
    __swift_project_boxed_opaque_existential_1(v36, v19);
    sub_22E0D3084();
    sub_22E0F7F70();
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v29, v24 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v25);
    uint64_t v21 = &v40;
    char v40 = 0;
    sub_22DF24D80();
    uint64_t v11 = v37;
    sub_22E0F7E00();
    uint64_t v22 = v11;
    uint64_t v23 = v11;
    if (v11)
    {
      v14[1] = v23;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v35, v31);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
      uint64_t v12 = v22;
      char v39 = 1;
      sub_22E0F7DD0();
      uint64_t v17 = v12;
      uint64_t v18 = v12;
      if (v12) {
        v14[0] = v18;
      }
      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v35, v31);
    }
  }
  return result;
}

uint64_t sub_22E0D3B20()
{
  return sub_22E0D3B6C();
}

uint64_t sub_22E0D3B6C()
{
  if (!"SiriSettingsIntents.SettingsBinarySetting")
  {
    sub_22E0F7CA0();
    __break(1u);
  }
  uint64_t result = sub_22DF0593C((uint64_t)"SiriSettingsIntents.SettingsBinarySetting", 41, (unint64_t)"init(builder:)", 14, 2, (unint64_t)"SiriSettingsIntents/SettingsBinarySetting.swift", 47, 2, v1, 0xBuLL, 0xEuLL);
  __break(1u);
  return result;
}

uint64_t sub_22E0D3C84()
{
  uint64_t v3 = OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
  uint64_t v1 = sub_22E0F7100();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
}

uint64_t SettingsBinarySetting.deinit()
{
  uint64_t v3 = SettingsSetting.deinit();
  uint64_t v2 = OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
  uint64_t v0 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v0 - 8) + 8))(v3 + v2);
  return v3;
}

uint64_t SettingsBinarySetting.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E0D3DD8()
{
  return type metadata accessor for SettingsBinarySetting();
}

uint64_t sub_22E0D3DF4()
{
  uint64_t updated = sub_22E0F7100();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for SettingsBinarySetting()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_22E0D3F0C()
{
  return type metadata accessor for SettingsBinarySetting.Builder();
}

uint64_t sub_22E0D3F28()
{
  uint64_t updated = sub_22E0F7100();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

void *type metadata accessor for SettingsBinarySetting.CodingKeys()
{
  return &unk_26E1E1D88;
}

unint64_t sub_22E0D4028()
{
  return sub_22E0D4040();
}

unint64_t sub_22E0D4040()
{
  uint64_t v2 = qword_2685C3E40;
  if (!qword_2685C3E40)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3E40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0D40C0()
{
  return sub_22E0D40D8();
}

unint64_t sub_22E0D40D8()
{
  uint64_t v2 = qword_2685C3E48;
  if (!qword_2685C3E48)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3E48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0D4158()
{
  return sub_22E0D4170();
}

unint64_t sub_22E0D4170()
{
  uint64_t v2 = qword_2685C3E50;
  if (!qword_2685C3E50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3E50);
    return WitnessTable;
  }
  return v2;
}

uint64_t static SirikitLocalizedAppName.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a1;
  uint64_t v99 = a2;
  uint64_t v3 = v2;
  uint64_t v4 = v72;
  uint64_t v85 = v3;
  uint64_t v109 = 0;
  uint64_t v108 = 0;
  uint64_t v107 = 0;
  uint64_t v73 = sub_22E0F7100();
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v75 = v73 - 8;
  unint64_t v76 = (*(void *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v73, v5, v6, v7);
  id v77 = &v43[-v76];
  unint64_t v78 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v43[-v76], v9, v10, v11);
  uint64_t v79 = &v43[-v78];
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C1550);
  unint64_t v81 = (*(void *)(*(void *)(v80 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v80, v12, v13, v14);
  id v82 = &v43[-v81];
  unint64_t v83 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16, v17, v18, v19);
  uint64_t v84 = &v43[-v83];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  uint64_t v95 = *(void *)(*(void *)(v20 - 8) + 64);
  unint64_t v86 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20, v99, v21, v22);
  id v87 = &v43[-v86];
  unint64_t v88 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v43[-v86], v23, v24, v25);
  uint64_t v89 = &v43[-v88];
  unint64_t v90 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v43[-v88], v26, v27, v28);
  uint64_t v91 = &v43[-v90];
  unint64_t v92 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v43[-v90], v29, v30, v31);
  uint64_t v93 = &v43[-v92];
  unint64_t v94 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v43[-v92], v32, v33, v34);
  uint64_t v96 = &v43[-v94];
  unint64_t v97 = (v95 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v43[-v94], v35, v36, v37);
  uint64_t v98 = &v43[-v97];
  uint64_t v109 = v4;
  uint64_t v108 = v38;
  uint64_t v107 = v39;
  id v100 = (id)sub_22E0F71A0();
  id v40 = v100;
  id v101 = (id)sub_22E0F71A0();
  id v41 = v101;
  id v105 = v100;
  id v106 = v101;
  if (v100)
  {
    sub_22E0AB560(&v105, &v104);
    if (v106)
    {
      id v103 = v104;
      uint64_t v69 = &v105;
      id v102 = v106;
      sub_22E0F7000();
      int v70 = sub_22E0F7A30();

      sub_22DE63C6C(v69);
      int v71 = v70;
      goto LABEL_7;
    }

    goto LABEL_9;
  }
  if (v106)
  {
LABEL_9:
    sub_22E0D4D74(&v105);
    int v71 = 0;
    goto LABEL_7;
  }
  sub_22DE63C6C(&v105);
  int v71 = 1;
LABEL_7:
  int v68 = v71;

  swift_retain();
  swift_retain();
  if ((v68 & 1) == 0)
  {
    int v58 = 0;
    goto LABEL_20;
  }
  sub_22E0F71B0();
  sub_22E0F71B0();
  uint64_t v65 = &v84[*(int *)(v80 + 48)];
  sub_22DE5A4C4(v98, v84);
  sub_22DE5A4C4(v96, v65);
  uint64_t v66 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48);
  uint64_t v67 = v74 + 48;
  if (v66(v84, 1, v73) == 1)
  {
    if (v66(v65, 1, v73) != 1) {
      goto LABEL_18;
    }
    sub_22DE58794((uint64_t)v84);
    int v64 = 1;
  }
  else
  {
    sub_22DE5A4C4(v84, v93);
    if (v66(v65, 1, v73) == 1)
    {
      (*(void (**)(unsigned char *, uint64_t))(v74 + 8))(v93, v73);
LABEL_18:
      sub_22DF2E51C((uint64_t)v84);
      int v64 = 0;
      goto LABEL_17;
    }
    uint64_t v60 = *(void (**)(unsigned char *, char *, uint64_t))(v74 + 32);
    uint64_t v59 = v74 + 32;
    v60(v79, v93, v73);
    v60(v77, v65, v73);
    sub_22DF2E6D4();
    int v63 = sub_22E0F7530();
    uint64_t v62 = *(void (**)(unsigned char *, uint64_t))(v74 + 8);
    uint64_t v61 = v74 + 8;
    v62(v77, v73);
    v62(v79, v73);
    sub_22DE58794((uint64_t)v84);
    int v64 = v63;
  }
LABEL_17:
  int v57 = v64;
  sub_22DE58794((uint64_t)v96);
  sub_22DE58794((uint64_t)v98);
  int v58 = v57;
LABEL_20:
  int v56 = v58;
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  if ((v56 & 1) == 0)
  {
    int v46 = 0;
    goto LABEL_31;
  }
  sub_22E0F7190();
  sub_22E0F7190();
  uint64_t v53 = &v82[*(int *)(v80 + 48)];
  sub_22DE5A4C4(v91, v82);
  sub_22DE5A4C4(v89, v53);
  uint64_t v54 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48);
  uint64_t v55 = v74 + 48;
  if (v54(v82, 1, v73) == 1)
  {
    if (v54(v53, 1, v73) != 1) {
      goto LABEL_28;
    }
    sub_22DE58794((uint64_t)v82);
    int v52 = 1;
  }
  else
  {
    sub_22DE5A4C4(v82, v87);
    if (v54(v53, 1, v73) == 1)
    {
      (*(void (**)(unsigned char *, uint64_t))(v74 + 8))(v87, v73);
LABEL_28:
      sub_22DF2E51C((uint64_t)v82);
      int v52 = 0;
      goto LABEL_27;
    }
    uint64_t v48 = *(void (**)(unsigned char *, char *, uint64_t))(v74 + 32);
    uint64_t v47 = v74 + 32;
    v48(v79, v87, v73);
    v48(v77, v53, v73);
    sub_22DF2E6D4();
    int v51 = sub_22E0F7530();
    uint64_t v50 = *(void (**)(unsigned char *, uint64_t))(v74 + 8);
    uint64_t v49 = v74 + 8;
    v50(v77, v73);
    v50(v79, v73);
    sub_22DE58794((uint64_t)v82);
    int v52 = v51;
  }
LABEL_27:
  int v45 = v52;
  sub_22DE58794((uint64_t)v89);
  sub_22DE58794((uint64_t)v91);
  int v46 = v45;
LABEL_31:
  int v44 = v46;
  swift_release();
  swift_release();
  return v44 & 1;
}

id *sub_22E0D4D74(id *a1)
{
  return a1;
}

uint64_t sub_22E0D4DAC(uint64_t *a1, uint64_t *a2)
{
  return static SirikitLocalizedAppName.== infix(_:_:)(*a1, *a2) & 1;
}

uint64_t *sub_22E0D4DD0()
{
  if (qword_2685BF7F0 != -1) {
    swift_once();
  }
  return &qword_2685D7E10;
}

uint64_t sub_22E0D4E34()
{
  type metadata accessor for SetHandlerProvider();
  uint64_t result = sub_22E0D4E90();
  qword_2685D7E10 = result;
  return result;
}

uint64_t type metadata accessor for SetHandlerProvider()
{
  return self;
}

uint64_t sub_22E0D4E90()
{
  return sub_22E0D5138();
}

uint64_t sub_22E0D4ECC()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_22E0D4F1C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0D4F7C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_22E0D4FCC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0D502C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_22E0D507C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22E0D50DC())()
{
  return sub_22DE10544;
}

uint64_t sub_22E0D5138()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3E58);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C22E0);
  sub_22DFA9D14();
  v0[3] = sub_22E0F74D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3E60);
  sub_22E0F7E50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C2828);
  sub_22DFA48C8();
  v0[4] = sub_22E0F74D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3E68);
  sub_22E0F7E50();
  uint64_t v67 = v1;
  *uint64_t v1 = 0;
  uint64_t v5 = *sub_22DFB3B64();
  swift_retain();
  *((void *)v67 + 4) = type metadata accessor for SetAirplaneModeHandler();
  *((void *)v67 + 5) = &off_26E1DCBF0;
  *((void *)v67 + 1) = v5;
  v67[48] = 1;
  uint64_t v6 = *sub_22DFA2CB8();
  swift_retain();
  uint64_t v8 = type metadata accessor for SetAppearanceHandler();
  *((void *)v67 + 10) = v8;
  *((void *)v67 + 11) = &off_26E1DC580;
  *((void *)v67 + 7) = v6;
  v67[96] = 2;
  uint64_t v7 = *sub_22DFA2CB8();
  swift_retain();
  *((void *)v67 + 16) = v8;
  *((void *)v67 + 17) = &off_26E1DC580;
  *((void *)v67 + 13) = v7;
  v67[144] = 3;
  uint64_t v9 = *sub_22DFA2CB8();
  swift_retain();
  *((void *)v67 + 22) = v8;
  *((void *)v67 + 23) = &off_26E1DC580;
  *((void *)v67 + 19) = v9;
  v67[192] = 4;
  uint64_t v10 = *sub_22E0D1A60();
  swift_retain();
  *((void *)v67 + 28) = type metadata accessor for SetAssistiveTouchHandler();
  *((void *)v67 + 29) = &off_26E1E1CE0;
  *((void *)v67 + 25) = v10;
  v67[240] = 7;
  uint64_t v11 = *sub_22E0E0D18();
  swift_retain();
  *((void *)v67 + 34) = type metadata accessor for SetAutoAnswerHandler();
  *((void *)v67 + 35) = &off_26E1E1FD8;
  *((void *)v67 + 31) = v11;
  v67[288] = 8;
  uint64_t v12 = *sub_22E0ABB30();
  swift_retain();
  *((void *)v67 + 40) = type metadata accessor for SetAXAutoBrightnessHandler();
  *((void *)v67 + 41) = &off_26E1E0AD8;
  *((void *)v67 + 37) = v12;
  v67[336] = 9;
  uint64_t v13 = *sub_22E07A338();
  swift_retain();
  *((void *)v67 + 46) = type metadata accessor for SetAutoCorrectHandler();
  *((void *)v67 + 47) = &off_26E1DF718;
  *((void *)v67 + 43) = v13;
  v67[384] = 10;
  uint64_t v14 = *sub_22DFB077C();
  swift_retain();
  *((void *)v67 + 52) = type metadata accessor for SetBassHandler();
  *((void *)v67 + 53) = &off_26E1DCBA0;
  *((void *)v67 + 49) = v14;
  v67[432] = 11;
  uint64_t v15 = *sub_22E0DAF18();
  swift_retain();
  *((void *)v67 + 58) = type metadata accessor for SetBassReduceHandler();
  *((void *)v67 + 59) = &off_26E1E1E08;
  *((void *)v67 + 55) = v15;
  v67[480] = 12;
  uint64_t v16 = *sub_22DFDFF38();
  swift_retain();
  *((void *)v67 + 64) = type metadata accessor for SetBluetoothHandler();
  *((void *)v67 + 65) = &off_26E1DD870;
  *((void *)v67 + 61) = v16;
  v67[528] = 13;
  uint64_t v17 = *sub_22E08B4F8();
  swift_retain();
  *((void *)v67 + 70) = type metadata accessor for SetAXColorFiltersBlueYellowHandler();
  *((void *)v67 + 71) = &off_26E1DF840;
  *((void *)v67 + 67) = v17;
  v67[576] = 14;
  uint64_t v18 = *sub_22DF25A90();
  swift_retain();
  *((void *)v67 + 76) = type metadata accessor for SetAXBoldTextHandler();
  *((void *)v67 + 77) = &off_26E1D96C8;
  *((void *)v67 + 73) = v18;
  v67[624] = 15;
  uint64_t v19 = *sub_22E0B18F8();
  swift_retain();
  *((void *)v67 + 82) = type metadata accessor for SetAXButtonShapesHandler();
  *((void *)v67 + 83) = &off_26E1E0BE0;
  *((void *)v67 + 79) = v19;
  v67[672] = 16;
  uint64_t v20 = *sub_22E0D6614();
  swift_retain();
  *((void *)v67 + 88) = type metadata accessor for SetCellularDataHandler();
  *((void *)v67 + 89) = &off_26E1E1D98;
  *((void *)v67 + 85) = v20;
  v67[720] = 17;
  uint64_t v21 = *sub_22DFE62F0();
  swift_retain();
  *((void *)v67 + 94) = type metadata accessor for SetAXClassicInvertColorsHandler();
  *((void *)v67 + 95) = &off_26E1DD9C8;
  *((void *)v67 + 91) = v21;
  v67[768] = 18;
  uint64_t v22 = *sub_22DFA7EB0();
  swift_retain();
  *((void *)v67 + 100) = type metadata accessor for SetAXColorFiltersColorTintHandler();
  *((void *)v67 + 101) = &off_26E1DC988;
  *((void *)v67 + 97) = v22;
  v67[816] = 19;
  uint64_t v23 = *sub_22DEDD3D4();
  swift_retain();
  *((void *)v67 + 106) = type metadata accessor for SetConversationAwarenessHandler();
  *((void *)v67 + 107) = &off_26E1D7410;
  *((void *)v67 + 103) = v23;
  v67[864] = 20;
  uint64_t v24 = *sub_22DFA81DC();
  swift_retain();
  *((void *)v67 + 112) = type metadata accessor for SetDictationHandler();
  *((void *)v67 + 113) = &off_26E1DC9B0;
  *((void *)v67 + 109) = v24;
  v67[912] = 21;
  uint64_t v25 = *sub_22DFD6DA0();
  swift_retain();
  *((void *)v67 + 118) = type metadata accessor for SetAXDifferentiateWithoutColorHandler();
  *((void *)v67 + 119) = &off_26E1DD670;
  *((void *)v67 + 115) = v25;
  v67[960] = 23;
  uint64_t v26 = *sub_22E0DE14C();
  swift_retain();
  *((void *)v67 + 124) = type metadata accessor for SetFlashlightHandler();
  *((void *)v67 + 125) = &off_26E1E1F10;
  *((void *)v67 + 121) = v26;
  v67[1008] = 24;
  uint64_t v27 = *sub_22E0CF95C();
  swift_retain();
  *((void *)v67 + 130) = type metadata accessor for SetAXColorFiltersGrayscaleHandler();
  *((void *)v67 + 131) = &off_26E1E1AE0;
  *((void *)v67 + 127) = v27;
  v67[1056] = 25;
  uint64_t v28 = *sub_22E097954();
  swift_retain();
  *((void *)v67 + 136) = type metadata accessor for SetAXColorFiltersGreenRedHandler();
  *((void *)v67 + 137) = &off_26E1E00A0;
  *((void *)v67 + 133) = v28;
  v67[1104] = 26;
  uint64_t v29 = *sub_22DF4F3D0();
  swift_retain();
  *((void *)v67 + 142) = type metadata accessor for SetHeySiriHandler();
  *((void *)v67 + 143) = &off_26E1DAC18;
  *((void *)v67 + 139) = v29;
  v67[1152] = 27;
  uint64_t v30 = *sub_22E0CFC88();
  swift_retain();
  *((void *)v67 + 148) = type metadata accessor for SetAXIncreaseContrastHandler();
  *((void *)v67 + 149) = &off_26E1E1B08;
  *((void *)v67 + 145) = v30;
  v67[1200] = 28;
  uint64_t v31 = *sub_22DFC8C40();
  swift_retain();
  *((void *)v67 + 154) = type metadata accessor for SetAXInvertColorsHandler();
  *((void *)v67 + 155) = &off_26E1DD398;
  *((void *)v67 + 151) = v31;
  v67[1248] = 29;
  uint64_t v32 = *sub_22E07C200();
  swift_retain();
  *((void *)v67 + 160) = type metadata accessor for SetLocationServicesHandler();
  *((void *)v67 + 161) = &off_26E1DF790;
  *((void *)v67 + 157) = v32;
  v67[1296] = 31;
  uint64_t v33 = *sub_22E0A17DC();
  swift_retain();
  *((void *)v67 + 166) = type metadata accessor for SetNightShiftHandler();
  *((void *)v67 + 167) = &off_26E1E0550;
  *((void *)v67 + 163) = v33;
  v67[1344] = 34;
  uint64_t v34 = *sub_22DFC93A8();
  swift_retain();
  *((void *)v67 + 172) = type metadata accessor for SetAXOnOffLabelsHandler();
  *((void *)v67 + 173) = &off_26E1DD3C0;
  *((void *)v67 + 169) = v34;
  v67[1392] = 35;
  uint64_t v35 = *sub_22DE893E8();
  swift_retain();
  uint64_t v36 = type metadata accessor for SetPersonalHotspotHandler();
  *((void *)v67 + 178) = v36;
  *((void *)v67 + 179) = &off_26E1D70F0;
  *((void *)v67 + 175) = v35;
  v67[1440] = 36;
  uint64_t v37 = *sub_22DE893E8();
  swift_retain();
  *((void *)v67 + 184) = v36;
  *((void *)v67 + 185) = &off_26E1D70F0;
  *((void *)v67 + 181) = v37;
  v67[1488] = 37;
  uint64_t v38 = *sub_22E07C584();
  swift_retain();
  *((void *)v67 + 190) = type metadata accessor for SetPersonalizedVolumeHandler();
  *((void *)v67 + 191) = &off_26E1DF7E0;
  *((void *)v67 + 187) = v38;
  v67[1536] = 38;
  uint64_t v39 = *sub_22DE10C24();
  swift_retain();
  *((void *)v67 + 196) = type metadata accessor for SetLowPowerModeHandler();
  *((void *)v67 + 197) = &off_26E1D6628;
  *((void *)v67 + 193) = v39;
  v67[1584] = 39;
  uint64_t v40 = *sub_22DE11460();
  swift_retain();
  *((void *)v67 + 202) = type metadata accessor for SetAXColorFiltersRedGreenHandler();
  *((void *)v67 + 203) = &off_26E1D6650;
  *((void *)v67 + 199) = v40;
  v67[1632] = 40;
  uint64_t v41 = *sub_22DEDD968();
  swift_retain();
  *((void *)v67 + 208) = type metadata accessor for SetAXReduceTransparencyHandler();
  *((void *)v67 + 209) = &off_26E1D7450;
  *((void *)v67 + 205) = v41;
  v67[1680] = 41;
  uint64_t v42 = *sub_22E0C5704();
  swift_retain();
  *((void *)v67 + 214) = type metadata accessor for SetAXReduceWhitePointHandler();
  *((void *)v67 + 215) = &off_26E1E1318;
  *((void *)v67 + 211) = v42;
  v67[1728] = 42;
  uint64_t v43 = *sub_22DFA7C8C();
  swift_retain();
  *((void *)v67 + 220) = type metadata accessor for SetSiriHandler();
  *((void *)v67 + 221) = &off_26E1DC960;
  *((void *)v67 + 217) = v43;
  v67[1776] = 43;
  uint64_t v44 = *sub_22DF26D34();
  swift_retain();
  *((void *)v67 + 226) = type metadata accessor for SetSmartSiriVolumeHandler();
  *((void *)v67 + 227) = &off_26E1D9710;
  *((void *)v67 + 223) = v44;
  v67[1824] = 45;
  uint64_t v45 = *sub_22DF47DF4();
  swift_retain();
  *((void *)v67 + 232) = type metadata accessor for SetAnnounceNotificationsHandler();
  *((void *)v67 + 233) = &off_26E1DA948;
  *((void *)v67 + 229) = v45;
  v67[1872] = 47;
  uint64_t v46 = *sub_22E0C5E6C();
  swift_retain();
  *((void *)v67 + 238) = type metadata accessor for SetAXSwitchControlHandler();
  *((void *)v67 + 239) = &off_26E1E1340;
  *((void *)v67 + 235) = v46;
  v67[1920] = 48;
  uint64_t v47 = *sub_22DFA8560();
  swift_retain();
  *((void *)v67 + 244) = type metadata accessor for SetAXVoiceControlHandler();
  *((void *)v67 + 245) = &off_26E1DCA00;
  *((void *)v67 + 241) = v47;
  v67[1968] = 49;
  uint64_t v48 = *sub_22E0CA01C();
  swift_retain();
  *((void *)v67 + 250) = type metadata accessor for SetVoiceOverHandler();
  *((void *)v67 + 251) = &off_26E1E1368;
  *((void *)v67 + 247) = v48;
  v67[2016] = 50;
  uint64_t v49 = *sub_22E0228D4();
  swift_retain();
  *((void *)v67 + 256) = type metadata accessor for SetVpnHandler();
  *((void *)v67 + 257) = &off_26E1DF0C0;
  *((void *)v67 + 253) = v49;
  v67[2064] = 51;
  uint64_t v50 = *sub_22DEFB394();
  swift_retain();
  *((void *)v67 + 262) = type metadata accessor for SetWifiHandler();
  *((void *)v67 + 263) = &off_26E1D8168;
  *((void *)v67 + 259) = v50;
  v67[2112] = 52;
  uint64_t v51 = *sub_22DF25514();
  swift_retain();
  *((void *)v67 + 268) = type metadata accessor for SetZoomHandler();
  *((void *)v67 + 269) = &off_26E1D9670;
  *((void *)v67 + 265) = v51;
  v67[2160] = 53;
  uint64_t v52 = *sub_22E09D5EC();
  swift_retain();
  *((void *)v67 + 274) = type metadata accessor for SetShakeMouseHandler();
  *((void *)v67 + 275) = &off_26E1E0190;
  *((void *)v67 + 271) = v52;
  v67[2208] = 60;
  uint64_t v53 = *sub_22E075CA8();
  swift_retain();
  uint64_t v60 = type metadata accessor for SetFocusModeHandler();
  *((void *)v67 + 280) = v60;
  *((void *)v67 + 281) = &off_26E1DF610;
  *((void *)v67 + 277) = v53;
  v67[2256] = 62;
  uint64_t v54 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 286) = v60;
  *((void *)v67 + 287) = &off_26E1DF610;
  *((void *)v67 + 283) = v54;
  v67[2304] = 59;
  uint64_t v55 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 292) = v60;
  *((void *)v67 + 293) = &off_26E1DF610;
  *((void *)v67 + 289) = v55;
  v67[2352] = 58;
  uint64_t v56 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 298) = v60;
  *((void *)v67 + 299) = &off_26E1DF610;
  *((void *)v67 + 295) = v56;
  v67[2400] = 56;
  uint64_t v57 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 304) = v60;
  *((void *)v67 + 305) = &off_26E1DF610;
  *((void *)v67 + 301) = v57;
  v67[2448] = 61;
  uint64_t v58 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 310) = v60;
  *((void *)v67 + 311) = &off_26E1DF610;
  *((void *)v67 + 307) = v58;
  v67[2496] = 57;
  uint64_t v59 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 316) = v60;
  *((void *)v67 + 317) = &off_26E1DF610;
  *((void *)v67 + 313) = v59;
  v67[2544] = 22;
  uint64_t v61 = *sub_22E075CA8();
  swift_retain();
  *((void *)v67 + 322) = v60;
  *((void *)v67 + 323) = &off_26E1DF610;
  *((void *)v67 + 319) = v61;
  v67[2592] = 5;
  uint64_t v62 = *sub_22E0E2B48();
  swift_retain();
  uint64_t v64 = type metadata accessor for SetNoiseManagementHandler();
  *((void *)v67 + 328) = v64;
  *((void *)v67 + 329) = &off_26E1E20F8;
  *((void *)v67 + 325) = v62;
  v67[2640] = 6;
  uint64_t v63 = *sub_22E0E2B48();
  swift_retain();
  *((void *)v67 + 334) = v64;
  *((void *)v67 + 335) = &off_26E1E20F8;
  *((void *)v67 + 331) = v63;
  v67[2688] = 32;
  uint64_t v65 = *sub_22E0E2B48();
  swift_retain();
  *((void *)v67 + 340) = v64;
  *((void *)v67 + 341) = &off_26E1E20F8;
  *((void *)v67 + 337) = v65;
  v67[2736] = 46;
  uint64_t v66 = *sub_22DEFBD70();
  swift_retain();
  *((void *)v67 + 346) = type metadata accessor for SetStandByHandler();
  *((void *)v67 + 347) = &off_26E1D8190;
  *((void *)v67 + 343) = v66;
  v67[2784] = 63;
  uint64_t v68 = *sub_22E0226DC();
  swift_retain();
  *((void *)v67 + 352) = type metadata accessor for SetReduceLoudSoundsHandler();
  *((void *)v67 + 353) = &off_26E1DF098;
  *((void *)v67 + 349) = v68;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C0F58);
  sub_22DF5FF30();
  v0[2] = sub_22E0F74D0();
  sub_22DFAD304();
  swift_retain();
  type metadata accessor for SetSoundAnalysisHandler();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3E70);
  sub_22E0F7500();
  swift_endAccess();
  sub_22E0A8F24();
  swift_retain();
  type metadata accessor for SetAXMotionCuesHandler();
  swift_beginAccess();
  sub_22E0F7500();
  swift_endAccess();
  sub_22E0F7E50();
  uint64_t v74 = v2;
  *uint64_t v2 = 1;
  uint64_t v69 = *sub_22DFDF7E8();
  swift_retain();
  uint64_t v70 = type metadata accessor for SetDisplayBrightnessHandler();
  *((void *)v74 + 4) = v70;
  *((void *)v74 + 5) = &off_26E1DD808;
  *((void *)v74 + 1) = v69;
  v74[48] = 2;
  uint64_t v71 = *sub_22DFDF7E8();
  swift_retain();
  *((void *)v74 + 10) = v70;
  *((void *)v74 + 11) = &off_26E1DD808;
  *((void *)v74 + 7) = v71;
  v74[96] = 7;
  uint64_t v72 = *sub_22DF15D30();
  swift_retain();
  uint64_t v73 = type metadata accessor for SetSiriVolumeHandler();
  *((void *)v74 + 16) = v73;
  *((void *)v74 + 17) = &off_26E1D9098;
  *((void *)v74 + 13) = v72;
  v74[144] = 8;
  uint64_t v75 = *sub_22DF15D30();
  swift_retain();
  *((void *)v74 + 22) = v73;
  *((void *)v74 + 23) = &off_26E1D9098;
  *((void *)v74 + 19) = v75;
  sub_22DE04404();
  uint64_t v76 = sub_22E0F74D0();
  swift_beginAccess();
  *(void *)(v80 + 24) = v76;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_22E0F7E50();
  id v77 = v3;
  *uint64_t v3 = 1;
  uint64_t v78 = *sub_22DF2E7E4();
  swift_retain();
  v77[4] = type metadata accessor for SetWifiNetworkHandler();
  v77[5] = &off_26E1D9878;
  v77[1] = v78;
  sub_22DE04404();
  uint64_t v79 = sub_22E0F74D0();
  swift_beginAccess();
  *(void *)(v80 + 32) = v79;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v80;
}

uint64_t sub_22E0D634C(char *a1)
{
  char v9 = 0;
  uint64_t v8 = 0;
  char v9 = *a1;
  char v4 = v9;
  uint64_t v8 = v1;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v7 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C0F58);
  unint64_t v2 = sub_22DF5FF30();
  MEMORY[0x230F9BAF0](&v7, v6, &type metadata for BinarySettingIdentifier, v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0D6404(char *a1)
{
  char v9 = 0;
  uint64_t v8 = 0;
  char v9 = *a1;
  char v4 = v9;
  uint64_t v8 = v1;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v7 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C22E0);
  unint64_t v2 = sub_22DFA9D14();
  MEMORY[0x230F9BAF0](&v7, v6, &type metadata for NumericSettingIdentifier, v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0D64BC(char a1)
{
  char v9 = a1 & 1;
  uint64_t v8 = v1;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  swift_endAccess();
  char v7 = a1 & 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C2828);
  unint64_t v2 = sub_22DFA48C8();
  MEMORY[0x230F9BAF0](&v7, v6, &unk_26E1DC748, v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0D6588()
{
  sub_22DE09E50();
  sub_22DE09E50();
  sub_22DE09E50();
  return v1;
}

uint64_t sub_22E0D65D4()
{
  return swift_deallocClassInstance();
}

uint64_t *sub_22E0D6614()
{
  if (qword_2685BF7F8 != -1) {
    swift_once();
  }
  return &qword_2685D7E18;
}

uint64_t sub_22E0D6678()
{
  type metadata accessor for SetCellularDataHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E18 = result;
  return result;
}

uint64_t type metadata accessor for SetCellularDataHandler()
{
  return self;
}

uint64_t sub_22E0D66E0(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  uint64_t v35 = (void *)*sub_22DF136D8();
  id v3 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  char v36 = sub_22DE6772C();
  swift_release();
  if (v36)
  {
    swift_retain();
    char v30 = sub_22DE653CC();
    swift_release();
    id v4 = a1;
    if (v30)
    {
      objc_msgSend(a1, sel_binaryValue);
      type metadata accessor for INBinarySettingValue();
      sub_22DE0BB64();
      char v29 = sub_22E0F7E80();
      id v5 = a1;
      if (v29)
      {
        char v28 = 1;
      }
      else
      {
        objc_msgSend(a1, sel_binaryValue);
        char v28 = sub_22E0F7E80();
      }

      char v27 = v28;
    }
    else
    {
      char v27 = 0;
    }

    if (v27)
    {
      sub_22E0F79A0();
      id v14 = (id)*sub_22DF136D8();
      id v10 = v14;
      sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      id v15 = sub_22DEF6C14(7, 0);
      a2();

      return swift_release();
    }
    else
    {
      swift_retain();
      char v26 = sub_22DE66EA4();
      swift_release();
      swift_retain();
      if (v26)
      {
        char v25 = 1;
      }
      else
      {
        swift_retain();
        char v24 = sub_22DE66BE4();
        swift_release();
        char v25 = v24;
      }
      swift_release();
      if (v25)
      {
        sub_22E0F7990();
        id v16 = (id)*sub_22DF136D8();
        id v8 = v16;
        sub_22E0F7E50();
        sub_22E0F7340();
        swift_bridgeObjectRelease();

        swift_retain();
        char v17 = sub_22DE6776C();
        swift_release();
        char v9 = sub_22DF0AB28();
        uint64_t v18 = *v9;
        uint64_t v19 = v9[1];
        unsigned int v20 = *((unsigned __int8 *)v9 + 16);
        char v21 = *(unsigned char *)(v34 + 24);
        swift_retain();
        sub_22DEF7BD0(v17 & 1, a1, v18, v19, v20, v21 & 1, a2, a3, (uint64_t)sub_22E0D6DB0, v34, 0, 1, 0, 0);
        return sub_22DE0C6FC((uint64_t)sub_22E0D6DB0);
      }
      else
      {
        sub_22E0F79A0();
        id v22 = (id)*sub_22DF136D8();
        id v6 = v22;
        sub_22E0F7E50();
        sub_22E0F7340();
        swift_bridgeObjectRelease();

        swift_retain();
        id v23 = sub_22DEF6C14(6, 0);
        a2();

        return swift_release();
      }
    }
  }
  else
  {
    sub_22E0F79A0();
    id v12 = (id)*sub_22DF136D8();
    id v11 = v12;
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    id v13 = sub_22DEF6C14(7, 0);
    a2();

    return swift_release();
  }
}

uint64_t sub_22E0D6D40(char a1)
{
  return swift_release();
}

uint64_t sub_22E0D6DB0(char a1)
{
  return sub_22E0D6D40(a1 & 1);
}

uint64_t sub_22E0D6DD8(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0D66E0(a1, a2, a3);
}

uint64_t sub_22E0D6DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a3;
  uint64_t v59 = a1;
  uint64_t v87 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = v59;
  uint64_t v86 = v4;
  uint64_t v93 = "ConfirmNumericSettingIntentStrategy actionForInput.";
  uint64_t v91 = &dword_22DE00000;
  uint64_t v60 = "ConfirmNumericSettingIntentStrategy actionForInput is not uso, treating it as CANCEL.";
  uint64_t v61 = "ConfirmNumericSettingIntentStrategy actionForInput is ignore: no applicable action.";
  uint64_t v62 = "ConfirmNumericSettingIntentStrategy actionForInput is ignore.";
  uint64_t v63 = "ConfirmNumericSettingIntentStrategy actionForInput is handle.";
  uint64_t v64 = "ConfirmSettingsIntentStrategy actionForInput is handle.";
  uint64_t v103 = 0;
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  id v105 = 0;
  id v104 = 0;
  uint64_t v89 = 0;
  uint64_t v65 = sub_22E0F5E80();
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v67 = v65 - 8;
  unint64_t v68 = (*(void *)(v66 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v6, v7, v8);
  uint64_t v69 = (char *)v38 - v68;
  unint64_t v70 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10, (char *)v38 - v68, v11, v12);
  uint64_t v71 = (char *)v38 - v70;
  unint64_t v72 = (*(void *)(*(void *)(type metadata accessor for SettingsNLIntent() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v89, v13, v14, v15);
  uint64_t v73 = (uint64_t)v38 - v72;
  uint64_t v74 = sub_22E0F6E80();
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = v74 - 8;
  unint64_t v77 = (*(void *)(v75 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v89, v16, v17, v18);
  uint64_t v78 = (uint64_t)v38 - v77;
  unint64_t v79 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20, (char *)v38 - v77, v21, v22);
  uint64_t v80 = (char *)v38 - v79;
  id v105 = (char *)v38 - v79;
  uint64_t v81 = sub_22E0F63E0();
  uint64_t v82 = *(void *)(v81 - 8);
  uint64_t v83 = v81 - 8;
  unint64_t v84 = (*(void *)(v82 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v89, v23, v24, v25);
  uint64_t v85 = (char *)v38 - v84;
  id v104 = (char *)v38 - v84;
  uint64_t v99 = sub_22E0F63B0();
  uint64_t v96 = *(void *)(v99 - 8);
  uint64_t v97 = v99 - 8;
  unint64_t v88 = (*(void *)(v96 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v99, v87, v26, v27);
  uint64_t v98 = (char *)v38 - v88;
  uint64_t v103 = v5;
  uint64_t v102 = v28;
  uint64_t v101 = v29;
  id v95 = (id)*sub_22DF15044();
  id v30 = v95;
  int v92 = sub_22E0F7990();
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v94 = sub_22E0F7E50();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  sub_22E0F6360();
  int v100 = (*(uint64_t (**)(char *, uint64_t))(v96 + 88))(v98, v99);
  if (v100 == *MEMORY[0x263F6FF50])
  {
    uint64_t v34 = v73;
    (*(void (**)(char *, uint64_t))(v96 + 96))(v98, v99);
    (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v80, v98, v74);
    id v105 = v80;
    id v48 = (id)*sub_22DF15044();
    id v35 = v48;
    int v46 = sub_22E0F7990();
    uint64_t v47 = sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, char *, uint64_t))(v75 + 16))(v78, v80, v74);
    sub_22DF96BDC(v78, v34);
    sub_22DF96C3C((uint64_t)v71);
    sub_22DED6BC0(v73);
    (*(void (**)(char *, void, uint64_t))(v66 + 104))(v69, *MEMORY[0x263F6F758], v65);
    sub_22DED6C1C();
    int v51 = sub_22E0F7E80();
    uint64_t v50 = *(void (**)(char *, uint64_t))(v66 + 8);
    uint64_t v49 = v66 + 8;
    v50(v69, v65);
    v50(v71, v65);
    if (v51) {
      sub_22E0F6020();
    }
    else {
      sub_22E0F6010();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v80, v74);
  }
  else if (v100 == *MEMORY[0x263F6FF80])
  {
    (*(void (**)(char *, uint64_t))(v96 + 96))(v98, v99);
    (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v85, v98, v81);
    id v104 = v85;
    if (sub_22E0D787C((uint64_t)v85))
    {
      id v57 = (id)*sub_22DF15044();
      id v31 = v57;
      int v55 = sub_22E0F7990();
      uint64_t v56 = sub_22E0F7E50();
      sub_22E0F7330();
      swift_bridgeObjectRelease();

      sub_22E0F6010();
    }
    else
    {
      id v54 = (id)*sub_22DF15044();
      id v33 = v54;
      int v52 = sub_22E0F7990();
      uint64_t v53 = sub_22E0F7E50();
      sub_22E0F7330();
      swift_bridgeObjectRelease();

      sub_22E0F6020();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v85, v81);
  }
  else
  {
    id v40 = (id)*sub_22DF15044();
    id v36 = v40;
    v38[1] = sub_22E0F7990();
    uint64_t v41 = 0;
    uint64_t v39 = sub_22E0F7E50();
    int v42 = 2;
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v96 + 8))(v98, v99);
    id v45 = (id)*sub_22DF15044();
    id v37 = v45;
    int v43 = sub_22E0F7990();
    uint64_t v44 = sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    return sub_22E0F6020();
  }
}

uint64_t sub_22E0D787C(uint64_t a1)
{
  uint64_t v53 = a1;
  uint64_t v2 = v1;
  uint64_t v3 = v53;
  uint64_t v72 = v2;
  uint64_t v100 = 0;
  uint64_t v99 = 0;
  uint64_t v83 = 0;
  uint64_t v54 = sub_22E0F63E0();
  int v55 = *(void **)(v54 - 8);
  uint64_t v56 = v54 - 8;
  unint64_t v57 = (v55[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v4, v5, v6);
  uint64_t v58 = &v33[-v57];
  unint64_t v59 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8, &v33[-v57], v9, v10);
  uint64_t v60 = &v33[-v59];
  uint64_t v75 = sub_22E0F6430();
  uint64_t v73 = *(void *)(v75 - 8);
  uint64_t v74 = v75 - 8;
  unint64_t v61 = (*(void *)(v73 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v75, v11, v12, v13);
  uint64_t v62 = &v33[-v61];
  unint64_t v63 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v33[-v61], v15, v16, v17);
  uint64_t v64 = &v33[-v63];
  unint64_t v65 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v33[-v63], v19, v20, v21);
  uint64_t v76 = &v33[-v65];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0A20);
  uint64_t v69 = *(void *)(*(void *)(v22 - 8) + 64);
  unint64_t v66 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v23, v24, v25);
  uint64_t v67 = &v33[-v66];
  unint64_t v68 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v33[-v66], v26, v27, v28);
  unint64_t v70 = &v33[-v68];
  unint64_t v71 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v33[-v68], v29, v30, v31);
  unint64_t v84 = &v33[-v71];
  uint64_t v100 = v3;
  uint64_t v99 = v72;
  sub_22E0F63D0();
  uint64_t v82 = sub_22E0F6420();
  unint64_t v77 = *(void (**)(unsigned char *, uint64_t))(v73 + 8);
  uint64_t v78 = v73 + 8;
  v77(v76, v75);
  swift_bridgeObjectRetain();
  uint64_t v81 = &v97;
  uint64_t v97 = v82;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0A28);
  unint64_t v80 = sub_22DED75C4();
  sub_22E0F7940();
  sub_22DE09E50();
  swift_bridgeObjectRelease();
  uint64_t v85 = sub_22E0F6560();
  uint64_t v86 = *(void *)(v85 - 8);
  uint64_t v87 = v85 - 8;
  unint64_t v88 = *(unsigned int (**)(unsigned char *, uint64_t))(v86 + 48);
  uint64_t v89 = v86 + 48;
  if (v88(v84, 1) == 1)
  {
    sub_22DED7648((uint64_t)v84);
    int v52 = 2;
  }
  else
  {
    int v51 = sub_22E0F64E0();
    (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v84, v85);
    int v52 = v51 & 1;
  }
  char v96 = v52;
  if (v52 == 2) {
    unsigned __int8 v98 = 0;
  }
  else {
    unsigned __int8 v98 = v96 & 1;
  }
  int v50 = v98;
  id v48 = (void (*)(unsigned char *, uint64_t, uint64_t))v55[2];
  uint64_t v49 = v55 + 2;
  v48(v60, v53, v54);
  if (v50)
  {
    int v47 = 1;
  }
  else
  {
    sub_22E0F63D0();
    uint64_t v46 = sub_22E0F6420();
    v77(v64, v75);
    swift_bridgeObjectRetain();
    id v45 = &v94;
    uint64_t v94 = v46;
    sub_22E0F7940();
    sub_22DE09E50();
    swift_bridgeObjectRelease();
    if (((unsigned int (*)(unsigned char *, uint64_t, uint64_t))v88)(v70, 1, v85) == 1)
    {
      sub_22DED7648((uint64_t)v70);
      int v44 = 2;
    }
    else
    {
      int v43 = sub_22E0F64F0();
      (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v70, v85);
      int v44 = v43 & 1;
    }
    char v93 = v44;
    if (v44 == 2) {
      unsigned __int8 v95 = 0;
    }
    else {
      unsigned __int8 v95 = v93 & 1;
    }
    int v47 = v95;
  }
  int v42 = v47;
  id v40 = (void (*)(unsigned char *, uint64_t))v55[1];
  uint64_t v41 = v55 + 1;
  v40(v60, v54);
  v48(v58, v53, v54);
  if (v42)
  {
    int v39 = 1;
  }
  else
  {
    sub_22E0F63D0();
    uint64_t v38 = sub_22E0F6420();
    v77(v62, v75);
    swift_bridgeObjectRetain();
    id v37 = &v91;
    uint64_t v91 = v38;
    sub_22E0F7940();
    sub_22DE09E50();
    swift_bridgeObjectRelease();
    if (((unsigned int (*)(unsigned char *, uint64_t, uint64_t))v88)(v67, 1, v85) == 1)
    {
      sub_22DED7648((uint64_t)v67);
      int v36 = 2;
    }
    else
    {
      int v35 = sub_22E0F6500();
      (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v67, v85);
      int v36 = v35 & 1;
    }
    char v90 = v36;
    if (v36 == 2) {
      unsigned __int8 v92 = 0;
    }
    else {
      unsigned __int8 v92 = v90 & 1;
    }
    int v39 = v92;
  }
  int v34 = v39;
  v40(v58, v54);
  return v34 & 1;
}

uint64_t sub_22E0D81A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = v3;
  v4[8] = a3;
  v4[7] = a2;
  v4[6] = a1;
  v4[2] = v4;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0A40);
  v4[10] = swift_task_alloc();
  uint64_t v5 = sub_22E0F5E80();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  uint64_t v6 = sub_22E0F63B0();
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return MEMORY[0x270FA2498](sub_22E0D8390, 0);
}

uint64_t sub_22E0D8390()
{
  uint64_t v35 = v0[17];
  uint64_t v34 = v0[16];
  uint64_t v36 = v0[15];
  uint64_t v38 = v0[14];
  uint64_t v41 = v0[13];
  uint64_t v39 = v0[12];
  uint64_t v40 = v0[11];
  v0[2] = v0;
  id v33 = (void *)*sub_22DF15044();
  id v1 = v33;
  sub_22E0F7990();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  uint64_t v32 = v2;
  sub_22E0F6360();
  uint64_t v30 = sub_22E0F7590();
  uint64_t v31 = v3;
  v32[3] = MEMORY[0x263F8D310];
  v32[4] = sub_22DE103A4();
  *uint64_t v32 = v30;
  v32[1] = v31;
  sub_22DE04404();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  sub_22E0F6360();
  sub_22E0D8BDC(v35, v38);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
  id v37 = *(void (**)(void))(v39 + 104);
  ((void (*)(uint64_t, void, uint64_t))v37)(v41, *MEMORY[0x263F6F758], v40);
  sub_22E0D9A88();
  char v43 = sub_22E0F7530();
  int v42 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
  v42(v41, v40);
  if (v43)
  {
    uint64_t v11 = v29[14];
    uint64_t v10 = v29[11];
    id v9 = (id)*sub_22DF15044();
    id v6 = v9;
    sub_22E0F79A0();
    sub_22E0F7E50();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    type metadata accessor for FlowStrategy.IntentConversionError();
    sub_22DFBA7B0();
    swift_allocError();
    sub_22E0F6360();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v42(v11, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v29[2] + 8);
  }
  else
  {
    uint64_t v27 = v29[13];
    uint64_t v26 = v29[11];
    v37();
    sub_22DED6C1C();
    char v28 = sub_22E0F7E80();
    v42(v27, v26);
    if (v28)
    {
      uint64_t v24 = v29[14];
      uint64_t v25 = v29[11];
      uint64_t v23 = v29[10];
      id v19 = (id)*sub_22DF15044();
      id v4 = v19;
      sub_22E0F7990();
      sub_22E0F7E50();
      sub_22E0F7330();
      swift_bridgeObjectRelease();

      unsigned int v20 = *MEMORY[0x263F6FC98];
      uint64_t v22 = sub_22E0F6210();
      uint64_t v21 = *(void *)(v22 - 8);
      (*(void (**)(uint64_t, void))(v21 + 104))(v23, v20);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685C31D8);
      sub_22E0F62C0();
      sub_22DE86190();
      sub_22E0F6200();
      v42(v24, v25);
    }
    else
    {
      uint64_t v17 = v29[14];
      uint64_t v18 = v29[11];
      uint64_t v16 = v29[10];
      id v12 = (id)*sub_22DF15044();
      id v5 = v12;
      sub_22E0F7990();
      sub_22E0F7E50();
      sub_22E0F7330();
      swift_bridgeObjectRelease();

      unsigned int v13 = *MEMORY[0x263F6FC90];
      uint64_t v15 = sub_22E0F6210();
      uint64_t v14 = *(void *)(v15 - 8);
      (*(void (**)(uint64_t, void))(v14 + 104))(v16, v13);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v16, 0, 1, v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685C31D8);
      sub_22E0F62C0();
      sub_22DE86190();
      sub_22E0F6200();
      v42(v17, v18);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v29[2] + 8);
  }
  return v7();
}

uint64_t sub_22E0D8BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v95 = a2;
  uint64_t v128 = a1;
  char v96 = "ConfirmNumericSettingIntentStrategy received unsupported parse object: %@.";
  uint64_t v120 = 0;
  uint64_t v97 = sub_22DED8D94;
  unsigned __int8 v98 = sub_22DED8E5C;
  uint64_t v99 = sub_22DED8EA0;
  uint64_t v100 = "ConfirmNumericSettingIntentStrategy userDialogAct is UserCancelled";
  uint64_t v101 = "ConfirmNumericSettingIntentStrategy userDialogAct is UserRejected";
  uint64_t v102 = "ConfirmNumericSettingIntentStrategy userDialogAct is UserAccepted";
  uint64_t v144 = 0;
  uint64_t v143 = 0;
  id v146 = 0;
  uint64_t v103 = 0;
  uint64_t v145 = 0;
  uint64_t v104 = sub_22E0F6430();
  uint64_t v105 = *(void *)(v104 - 8);
  uint64_t v106 = v104 - 8;
  unint64_t v107 = (*(void *)(v105 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v108 = &v55[-v107];
  unint64_t v109 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7, &v55[-v107], v8, v9);
  id v110 = &v55[-v109];
  unint64_t v111 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11, &v55[-v109], v12, v13);
  uint64_t v112 = &v55[-v111];
  uint64_t v113 = sub_22E0F63E0();
  uint64_t v114 = *(void *)(v113 - 8);
  uint64_t v115 = v113 - 8;
  unint64_t v116 = (*(void *)(v114 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v120, v14, v15, v16);
  int v117 = &v55[-v116];
  id v146 = &v55[-v116];
  unint64_t v118 = (*(void *)(*(void *)(type metadata accessor for SettingsNLIntent() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v120, v17, v18, v19);
  id v119 = &v55[-v118];
  uint64_t v121 = sub_22E0F6E80();
  uint64_t v122 = *(void *)(v121 - 8);
  uint64_t v123 = v121 - 8;
  unint64_t v124 = (*(void *)(v122 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v120, v20, v21, v22);
  double v125 = &v55[-v124];
  unint64_t v126 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, &v55[-v124], v25, v26);
  double v127 = &v55[-v126];
  uint64_t v145 = &v55[-v126];
  uint64_t v137 = sub_22E0F63B0();
  uint64_t v135 = *(void *)(v137 - 8);
  uint64_t v136 = v137 - 8;
  uint64_t v130 = *(void *)(v135 + 64);
  unint64_t v129 = (v130 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v137, v128, v137, v27);
  uint64_t v131 = &v55[-v129];
  unint64_t v132 = (v130 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v31 = MEMORY[0x270FA5388](&v55[-v129], v28, v29, v30);
  uint64_t v138 = &v55[-v132];
  uint64_t v144 = v32;
  uint64_t v143 = v2;
  unint64_t v133 = *(void (**)(double))(v135 + 16);
  uint64_t v134 = v135 + 16;
  v133(v31);
  int v139 = (*(uint64_t (**)(unsigned char *, uint64_t))(v135 + 88))(v138, v137);
  if (v139 == *MEMORY[0x263F6FF50])
  {
    id v33 = v119;
    (*(void (**)(unsigned char *, uint64_t))(v135 + 96))(v138, v137);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v122 + 32))(v127, v138, v121);
    uint64_t v145 = v127;
    (*(void (**)(unsigned char *))(v122 + 16))(v125);
    sub_22DF96BDC((uint64_t)v125, (uint64_t)v33);
    sub_22DF96C3C(v95);
    sub_22DED6BC0((uint64_t)v119);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v122 + 8))(v127, v121);
  }
  if (v139 == *MEMORY[0x263F6FF80])
  {
    uint64_t v35 = v103;
    uint64_t v36 = v117;
    (*(void (**)(unsigned char *, uint64_t))(v135 + 96))(v138, v137);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v114 + 32))(v36, v138, v113);
    id v146 = v36;
    sub_22E0F63D0();
    uint64_t v90 = sub_22E0F6420();
    unint64_t v88 = *(void (**)(unsigned char *, uint64_t))(v105 + 8);
    uint64_t v89 = v105 + 8;
    v88(v112, v104);
    uint64_t v142 = v90;
    uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0A28);
    unint64_t v92 = sub_22DED8DD8();
    uint64_t result = sub_22E0F7690();
    uint64_t v93 = v35;
    int v94 = result;
    if (v35)
    {
      __break(1u);
    }
    else
    {
      int v87 = v94;
      sub_22DE09E50();
      if (v87)
      {
        int v82 = sub_22E0F7990();
        id v84 = (id)*sub_22DF15044();
        id v37 = v84;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
        uint64_t v85 = 0;
        uint64_t v83 = sub_22E0F7E50();
        sub_22E0F7340();
        swift_bridgeObjectRelease();

        unsigned int v86 = *MEMORY[0x263F6F770];
        uint64_t v38 = sub_22E0F5E80();
        (*(void (**)(uint64_t, void))(*(void *)(v38 - 8) + 104))(v95, v86);
        return (*(uint64_t (**)(unsigned char *, uint64_t))(v114 + 8))(v117, v113);
      }
      uint64_t v39 = v93;
      sub_22E0F63D0();
      uint64_t v79 = sub_22E0F6420();
      v88(v110, v104);
      uint64_t v141 = v79;
      uint64_t result = sub_22E0F7690();
      uint64_t v80 = v39;
      int v81 = result;
      if (!v39)
      {
        int v78 = v81;
        sub_22DE09E50();
        if (v78)
        {
          int v73 = sub_22E0F7990();
          id v75 = (id)*sub_22DF15044();
          id v40 = v75;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
          uint64_t v76 = 0;
          uint64_t v74 = sub_22E0F7E50();
          sub_22E0F7340();
          swift_bridgeObjectRelease();

          unsigned int v77 = *MEMORY[0x263F6F760];
          uint64_t v41 = sub_22E0F5E80();
          (*(void (**)(uint64_t, void))(*(void *)(v41 - 8) + 104))(v95, v77);
          return (*(uint64_t (**)(unsigned char *, uint64_t))(v114 + 8))(v117, v113);
        }
        uint64_t v42 = v80;
        sub_22E0F63D0();
        uint64_t v71 = sub_22E0F6420();
        v88(v108, v104);
        uint64_t v140 = v71;
        uint64_t result = sub_22E0F7690();
        int v72 = result;
        if (!v42)
        {
          int v70 = v72;
          sub_22DE09E50();
          if (v70)
          {
            int v65 = sub_22E0F7990();
            id v67 = (id)*sub_22DF15044();
            id v43 = v67;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
            uint64_t v68 = 0;
            uint64_t v66 = sub_22E0F7E50();
            sub_22E0F7340();
            swift_bridgeObjectRelease();

            unsigned int v69 = *MEMORY[0x263F6F768];
            uint64_t v44 = sub_22E0F5E80();
            (*(void (**)(uint64_t, void))(*(void *)(v44 - 8) + 104))(v95, v69);
            return (*(uint64_t (**)(unsigned char *, uint64_t))(v114 + 8))(v117, v113);
          }
          (*(void (**)(unsigned char *, uint64_t))(v114 + 8))(v117, v113);
          goto LABEL_15;
        }
LABEL_19:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  int v62 = sub_22E0F79A0();
  id v64 = (id)*sub_22DF15044();
  id v45 = v64;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  uint64_t v61 = sub_22E0F7E50();
  unint64_t v59 = v46;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v133)(v131, v128, v137);
  uint64_t v57 = sub_22E0F7590();
  uint64_t v58 = v47;
  v59[3] = MEMORY[0x263F8D310];
  unint64_t v48 = sub_22DE103A4();
  uint64_t v49 = v57;
  uint64_t v50 = v58;
  int v51 = v59;
  unint64_t v52 = v48;
  uint64_t v53 = v61;
  v59[4] = v52;
  *int v51 = v49;
  v51[1] = v50;
  sub_22DE04404();
  uint64_t v63 = v53;
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  (*(void (**)(unsigned char *, uint64_t))(v135 + 8))(v138, v137);
LABEL_15:
  unsigned int v56 = *MEMORY[0x263F6F758];
  uint64_t v54 = sub_22E0F5E80();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v54 - 8) + 104))(v95, v56);
}

unint64_t sub_22E0D9A88()
{
  uint64_t v2 = qword_2685C3E80;
  if (!qword_2685C3E80)
  {
    sub_22E0F5E80();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3E80);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0D9B0C(uint64_t a1, uint64_t a2)
{
  v3[13] = v2;
  v3[12] = a2;
  v3[11] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C31D8);
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  sub_22E0F5FD0();
  v3[17] = swift_task_alloc();
  uint64_t v5 = sub_22E0F6340();
  v3[18] = v5;
  v3[19] = *(void *)(v5 - 8);
  v3[20] = swift_task_alloc();
  v3[8] = a2;
  v3[9] = v2;
  return MEMORY[0x270FA2498](sub_22E0D9CC8, 0);
}

uint64_t sub_22E0D9CC8()
{
  uint64_t v5 = v0[13];
  v0[7] = v0;
  id v4 = (id)*sub_22DF15044();
  id v1 = v4;
  sub_22E0F7990();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  v0[21] = *(void *)(v5 + 104);
  swift_retain();
  uint64_t v9 = sub_22E0F62B0();
  v0[22] = v9;
  uint64_t v7 = sub_22E0F62C0();
  v0[23] = v7;
  uint64_t v8 = sub_22E0F62A0();
  v0[24] = v8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v6 + 200) = v2;
  *uint64_t v2 = *(void *)(v6 + 56);
  v2[1] = sub_22E0D9E78;
  return sub_22E02E43C(v9, v7, v8);
}

uint64_t sub_22E0D9E78(uint64_t a1)
{
  uint64_t v6 = *v2;
  *(void *)(v6 + 56) = *v2;
  *(void *)(v6 + 208) = a1;
  *(void *)(v6 + 216) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_22DFDA354;
  }
  else
  {
    uint64_t v5 = *(void **)(v6 + 184);

    swift_release();
    swift_release();
    uint64_t v3 = sub_22E0DA02C;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0DA02C()
{
  uint64_t v1 = v0[26];
  uint64_t v10 = v0[16];
  uint64_t v9 = v0[15];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v7 = v0[12];
  v0[7] = v0;
  v0[10] = v1;
  sub_22E0F5FB0();
  swift_retain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v10, v7, v11);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = v12;
  *(void *)(v8 + 24) = v10;
  sub_22E0F6310();
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  sub_22DE1268C(v12 + 152, (uint64_t)(v0 + 2));
  uint64_t v14 = v0[5];
  uint64_t v15 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v14);
  uint64_t v2 = (void *)swift_task_alloc();
  v13[28] = v2;
  *uint64_t v2 = v13[7];
  v2[1] = sub_22DFDA0E0;
  uint64_t v3 = v13[26];
  uint64_t v4 = v13[20];
  uint64_t v5 = v13[11];
  return MEMORY[0x270F67AD8](v5, v3, v4, v14, v15);
}

uint64_t sub_22E0DA214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = a1;
  uint64_t v11 = a2;
  uint64_t v13 = a3;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  unint64_t v12 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685C02A8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v19, v11, v4, v5);
  uint64_t v18 = (uint64_t)&v10 - v12;
  uint64_t v23 = v6;
  uint64_t v22 = v7;
  uint64_t v21 = a3;
  uint64_t v17 = *(void *)(v7 + 96);
  swift_retain();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C31D8);
  uint64_t v16 = (void *)sub_22E0F62C0();
  id v15 = (id)sub_22E0F62A0();
  sub_22DF502C8(v16, (uint64_t)v15, v18);

  swift_release();
  uint64_t v8 = *(void (**)(uint64_t, void))(*(void *)(sub_22E0F6120() - 8) + 56);
  int v20 = 1;
  v8(v18, 0);
  sub_22E0F6320();
  return sub_22E0F6330();
}

uint64_t sub_22E0DA390(uint64_t a1)
{
  return sub_22E0DA214(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E0DA39C(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](sub_22E0DA3F0, 0);
}

uint64_t sub_22E0DA3F0()
{
  *(void *)(v0 + 16) = v0;
  uint64_t v6 = (void *)*sub_22DF15044();
  id v1 = v6;
  sub_22E0F7990();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  uint64_t v2 = (void *)swift_task_alloc();
  v7[8] = v2;
  *uint64_t v2 = v7[2];
  v2[1] = sub_22DEDB504;
  uint64_t v3 = v7[6];
  uint64_t v4 = v7[5];
  return sub_22E0DA530(v4, v3);
}

uint64_t sub_22E0DA530(uint64_t a1, uint64_t a2)
{
  v3[13] = v2;
  v3[12] = a2;
  v3[11] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C31D8);
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  sub_22E0F5FD0();
  v3[17] = swift_task_alloc();
  uint64_t v5 = sub_22E0F6340();
  v3[18] = v5;
  v3[19] = *(void *)(v5 - 8);
  v3[20] = swift_task_alloc();
  v3[8] = a2;
  v3[9] = v2;
  return MEMORY[0x270FA2498](sub_22E0DA6EC, 0);
}

uint64_t sub_22E0DA6EC()
{
  uint64_t v5 = v0[13];
  v0[7] = v0;
  id v4 = (id)*sub_22DF15044();
  id v1 = v4;
  sub_22E0F7990();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7330();
  swift_bridgeObjectRelease();

  v0[21] = *(void *)(v5 + 104);
  swift_retain();
  uint64_t v9 = sub_22E0F62B0();
  v0[22] = v9;
  uint64_t v7 = sub_22E0F62C0();
  v0[23] = v7;
  uint64_t v8 = sub_22E0F62A0();
  v0[24] = v8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v6 + 200) = v2;
  *uint64_t v2 = *(void *)(v6 + 56);
  v2[1] = sub_22E0D9E78;
  return sub_22E02F118(v9, v7, v8);
}

uint64_t sub_22E0DA89C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22E0D6DFC(a1, a2, a3);
}

uint64_t sub_22E0DA8C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  id v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *id v4 = *(void *)(v6 + 16);
  v4[1] = sub_22DE632A8;
  return sub_22E0D81A0(a1, a2, a3);
}

uint64_t sub_22E0DA988(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DE632A8;
  return sub_22E0D9B0C(a1, a2);
}

uint64_t sub_22E0DAA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v8 + 24) = v5;
  uint64_t v6 = type metadata accessor for ConfirmNumericSettingIntentStrategy();
  *uint64_t v5 = *(void *)(v8 + 16);
  v5[1] = sub_22DE632A8;
  return MEMORY[0x270F66410](a1, a2, v6, a4);
}

uint64_t type metadata accessor for ConfirmNumericSettingIntentStrategy()
{
  return self;
}

uint64_t sub_22E0DAB44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v8 + 24) = v5;
  uint64_t v6 = type metadata accessor for ConfirmNumericSettingIntentStrategy();
  *uint64_t v5 = *(void *)(v8 + 16);
  v5[1] = sub_22DE632A8;
  return MEMORY[0x270F66418](a1, a2, v6, a4);
}

uint64_t sub_22E0DAC18(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DE632A8;
  return sub_22E0DA530(a1, a2);
}

uint64_t sub_22E0DACD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DE632A8;
  return sub_22E0DA39C(a1, a2);
}

uint64_t sub_22E0DAD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 24) = v6;
  uint64_t v7 = type metadata accessor for ConfirmNumericSettingIntentStrategy();
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = sub_22DE632A8;
  return MEMORY[0x270F66408](a1, a2, a3, v7, a5);
}

uint64_t sub_22E0DAE74(void *a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  type metadata accessor for AuthenticationHandler();
  sub_22DE1268C(a2, (uint64_t)v7);
  uint64_t v2 = sub_22DE0F78C();
  sub_22DFA0B9C((uint64_t)v7, v2);
  char v6 = sub_22DFA0E10(a1);
  swift_release();
  return v6 & 1;
}

void *type metadata accessor for SettingsDeviceUnlockUtil()
{
  return &unk_26E1E1DD0;
}

uint64_t *sub_22E0DAF18()
{
  if (qword_2685BF800 != -1) {
    swift_once();
  }
  return &qword_2685D7E20;
}

uint64_t sub_22E0DAF7C()
{
  type metadata accessor for SetBassReduceHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E20 = result;
  return result;
}

uint64_t type metadata accessor for SetBassReduceHandler()
{
  return self;
}

uint64_t sub_22E0DAFE4(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v31 = 0;
  uint64_t v34 = a1;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  sub_22E0F7990();
  uint64_t v22 = (void *)*sub_22DF136D8();
  id v3 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22DFA3DA4();
  swift_retain();
  id v24 = objc_msgSend(a1, sel_settingMetadata);
  char v25 = sub_22DFA3E64(v24);

  swift_release();
  if (v25)
  {
    sub_22E0F79A0();
    id v8 = (id)*sub_22DF136D8();
    id v7 = v8;
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v9 = sub_22DEF8130();
    swift_bridgeObjectRelease();
    a2(v9);

    return swift_release();
  }
  else
  {
    id v18 = objc_msgSend(a1, sel_settingMetadata);
    if (v18 && (id v17 = objc_msgSend(v18, sel_targetDevice), v18, v17))
    {
      id v14 = objc_msgSend(v17, sel_deviceCategory);

      id v15 = v14;
      char v16 = 0;
    }
    else
    {
      id v15 = 0;
      char v16 = 1;
    }
    id v27 = v15;
    char v28 = v16 & 1;
    uint64_t v29 = 6;
    char v30 = 0;
    if (v16 & 1) != 0 || (sub_22DE113DC((uint64_t)&v27, (uint64_t)&v26), (v30))
    {
      char v13 = 0;
    }
    else
    {
      type metadata accessor for INDeviceCategory();
      sub_22DE09D28();
      char v13 = sub_22E0F7530();
    }
    if (v13)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      id v4 = a1;
      uint64_t v12 = (void *)swift_allocObject();
      v12[2] = v21;
      void v12[3] = a2;
      v12[4] = a3;
      v12[5] = a1;
      sub_22DE758BC();
      swift_release();
    }
    else
    {
      sub_22E0F79A0();
      id v10 = (id)*sub_22DF136D8();
      id v5 = v10;
      sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_22DFE69F0();
      id v11 = sub_22DEF8130();
      swift_bridgeObjectRelease();
      a2(v11);
    }
    return swift_release();
  }
}

uint64_t sub_22E0DB524(char a1, uint64_t a2, void (*a3)(void), uint64_t a4, void *a5)
{
  BOOL v26 = a1 == 2;
  swift_retain();
  if (a1 == 2)
  {
    swift_retain();
    char v25 = sub_22DE758E0();
    swift_release();
    char v34 = v25;
  }
  else
  {
    char v34 = a1;
  }
  swift_release();
  if (v34 == 2)
  {
    sub_22E0F79A0();
    id v13 = (id)*sub_22DF136D8();
    id v12 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    id v14 = sub_22DEF6C14(7, 0);
    a3();

    return swift_release();
  }
  else
  {
    id v24 = objc_msgSend(a5, sel_binaryValue);
    if (v24 == (id)1)
    {
      uint64_t v32 = 2;
    }
    else if (v24 == (id)2)
    {
      uint64_t v32 = 1;
    }
    else
    {
      if (v24 != (id)3)
      {
        sub_22E0F79A0();
        id v22 = (id)*sub_22DF136D8();
        id v5 = v22;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
        sub_22E0F7E50();
        uint64_t v21 = v6;
        id v7 = a5;
        sub_22DE09B30();
        sub_22DE58B14();
        uint64_t v19 = sub_22E0F75A0();
        uint64_t v20 = v8;
        v21[3] = MEMORY[0x263F8D310];
        v21[4] = sub_22DE103A4();
        *uint64_t v21 = v19;
        v21[1] = v20;
        sub_22DE04404();
        sub_22E0F7340();
        swift_bridgeObjectRelease();

        swift_retain();
        id v23 = sub_22DEF6C14(7, 0);
        a3();

        return swift_release();
      }
      uint64_t v32 = 3;
    }
    id v10 = sub_22DF0A924();
    uint64_t v15 = *v10;
    uint64_t v16 = v10[1];
    unsigned int v17 = *((unsigned __int8 *)v10 + 16);
    char v18 = *(unsigned char *)(a2 + 24);
    swift_retain();
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = v26;
    *(void *)(v11 + 24) = a2;
    sub_22DEF7BD0(v34 & 1, a5, v15, v16, v17, v18 & 1, a3, a4, (uint64_t)sub_22E0DBB98, v11, v32, 0, 0, 0);
    return sub_22DE0C6FC((uint64_t)sub_22E0DBB98);
  }
}

uint64_t sub_22E0DBA10()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22E0DBA60(char a1)
{
  return sub_22E0DB524(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_22E0DBA74(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_retain();
    sub_22DE75A4C();
  }
  else
  {
    swift_retain();
    sub_22DE64CA8();
  }
  return swift_release();
}

uint64_t sub_22E0DBB34(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0DAFE4(a1, a2, a3);
}

uint64_t sub_22E0DBB58()
{
  return swift_deallocObject();
}

uint64_t sub_22E0DBB98(char a1)
{
  return sub_22E0DBA74(a1 & 1, *(unsigned char *)(v1 + 16) & 1);
}

uint64_t sub_22E0DBBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a1;
  uint64_t v23 = a2;
  uint64_t v22 = a3;
  uint64_t v32 = 0;
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v11 = 0;
  uint64_t v25 = sub_22E0F7100();
  uint64_t v20 = *(void **)(v25 - 8);
  uint64_t v21 = v25 - 8;
  uint64_t v13 = v20[8];
  unint64_t v12 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](0, v23, v22, v3);
  uint64_t v17 = (uint64_t)&v11 - v12;
  unint64_t v14 = v12;
  MEMORY[0x270FA5388](v4, v5, v6, (char *)&v11 - v12);
  uint64_t v18 = (uint64_t)&v11 - v14;
  uint64_t v32 = v7;
  uint64_t v31 = v8;
  uint64_t v30 = v9;
  type metadata accessor for SettingsNumericSetting.Builder();
  uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t))v20[2];
  uint64_t v15 = v20 + 2;
  v16(v18, v24, v25);
  swift_retain();
  v16(v17, v22, v25);
  uint64_t v19 = sub_22E0DBE60(v18, v23, v17);
  uint64_t v29 = v19;
  swift_retain();
  uint64_t v28 = sub_22E0DC488(v19);
  swift_retain();
  uint64_t v33 = v28;
  swift_release();
  id v27 = (void (*)(uint64_t, uint64_t))v20[1];
  BOOL v26 = v20 + 1;
  v27(v22, v25);
  swift_release();
  v27(v24, v25);
  swift_release();
  return v28;
}

uint64_t type metadata accessor for SettingsNumericSetting.Builder()
{
  uint64_t v1 = qword_2685C3F08;
  if (!qword_2685C3F08) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0DBE60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22E0DC220(a1, a2, a3);
}

uint64_t sub_22E0DBEBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  swift_beginAccess();
  uint64_t v2 = sub_22E0F7100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v4);
  return swift_endAccess();
}

uint64_t sub_22E0DBF48(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v13 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v6 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v3 = MEMORY[0x270FA5388](v13, v12, v13, v2);
  uint64_t v8 = (char *)&v5 - v6;
  (*(void (**)(double))(v10 + 16))(v3);
  uint64_t v7 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  uint64_t v9 = &v14;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 40))(v7, v8, v13);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v12, v13);
}

uint64_t (*sub_22E0DC088())()
{
  return sub_22DE10544;
}

uint64_t sub_22E0DC0EC()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_22E0DC14C(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_22E0DC1BC())()
{
  return sub_22DE10544;
}

uint64_t sub_22E0DC220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v11 = a3;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v20 = 0;
  uint64_t v16 = sub_22E0F7100();
  uint64_t v12 = *(void *)(v16 - 8);
  uint64_t v13 = v16 - 8;
  v8[0] = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)v8 - v8[0];
  uint64_t v22 = MEMORY[0x270FA5388](v15, v14, v11, v4);
  uint64_t v21 = v5;
  uint64_t v20 = v6;
  swift_retain();
  swift_retain();
  uint64_t v23 = v3;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  void v8[2] = v12 + 16;
  v9(v10, v15, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v3 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name, v10, v16);
  swift_release();
  swift_retain();
  *(void *)(v8[1] + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value) = v14;
  swift_release();
  v9(v10, v11, v16);
  uint64_t v19 = sub_22E0A9374(v10);
  swift_retain();
  uint64_t v23 = v19;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  uint64_t v17 = v12 + 8;
  v18(v11, v16);
  swift_release();
  v18(v15, v16);
  swift_release();
  return v19;
}

uint64_t sub_22E0DC43C()
{
  type metadata accessor for SettingsNumericSetting();
  swift_retain();
  return sub_22E0DC488(v1);
}

uint64_t sub_22E0DC488(uint64_t a1)
{
  return sub_22E0DC8E8(a1);
}

uint64_t type metadata accessor for SettingsNumericSetting()
{
  uint64_t v1 = qword_2685C3EF8;
  if (!qword_2685C3EF8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0DC54C()
{
  return sub_22E0DC598();
}

uint64_t sub_22E0DC598()
{
  if (!"SiriSettingsIntents.Builder")
  {
    sub_22E0F7CA0();
    __break(1u);
  }
  uint64_t result = sub_22DF0593C((uint64_t)"SiriSettingsIntents.Builder", 27, (unint64_t)"init(identifier:)", 17, 2, (unint64_t)"SiriSettingsIntents/SettingsNumericSetting.swift", 48, 2, v1, 0xDuLL, 0xBuLL);
  __break(1u);
  return result;
}

uint64_t sub_22E0DC6B4()
{
  uint64_t v3 = OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  uint64_t v1 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return swift_release();
}

uint64_t sub_22E0DC738()
{
  uint64_t v3 = sub_22E0A94A8();
  uint64_t v2 = OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  uint64_t v0 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v0 - 8) + 8))(v3 + v2);
  swift_release();
  return v3;
}

uint64_t sub_22E0DC7CC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E0DC834()
{
  return sub_22E0F7610();
}

uint64_t SettingsNumericSetting.name.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
  uint64_t v2 = sub_22E0F7100();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t sub_22E0DC8E8(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v13 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v7 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (char *)&v6 - v7;
  uint64_t v24 = MEMORY[0x270FA5388](v20, v2, v3, v4);
  swift_retain();
  swift_retain();
  uint64_t v25 = v1;
  uint64_t v8 = v20 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  uint64_t v9 = &v23;
  uint64_t v14 = 32;
  uint64_t v15 = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v8, v13);
  swift_endAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v1 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v12, v13);
  swift_release();
  uint64_t v16 = (uint64_t *)(v20 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value);
  uint64_t v17 = &v22;
  swift_beginAccess();
  uint64_t v18 = *v16;
  swift_retain();
  swift_endAccess();
  *(void *)(v19 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value) = v18;
  swift_release();
  swift_retain();
  uint64_t v21 = sub_22E0A974C(v20);
  swift_retain();
  uint64_t v25 = v21;
  swift_release();
  swift_release();
  return v21;
}

uint64_t sub_22E0DCAE4@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  sub_22E0F7610();
  swift_bridgeObjectRetain();
  char v9 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = v8 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
    uint64_t v6 = sub_22E0F7100();
    a1[3] = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_22E0F7610();
    swift_bridgeObjectRetain();
    char v4 = sub_22E0F7620();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v4)
    {
      uint64_t v3 = *(void *)(v8 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value);
      swift_retain();
      uint64_t result = sub_22E0F6FB0();
      a1[3] = result;
      *a1 = v3;
    }
    else
    {
      swift_retain();
      sub_22E0A989C(a1);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22E0DCD10()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0DCD5C()
{
  uint64_t v2 = qword_2685C3ED8;
  if (!qword_2685C3ED8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3ED8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0DCDDC()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0DCE1C()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0DCE64()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0DCEAC()
{
  return sub_22E0F7F80();
}

unint64_t sub_22E0DCEDC()
{
  uint64_t v2 = qword_2685C3EE0;
  if (!qword_2685C3EE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3EE0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0DCF5C()
{
  return sub_22E0F7F90();
}

uint64_t sub_22E0DCF8C(void *a1)
{
  swift_allocObject();
  uint64_t v5 = sub_22E0DD01C(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t sub_22E0DD01C(void *a1)
{
  uint64_t v44 = a1;
  uint64_t v58 = 0;
  uint64_t v56 = 0;
  uint64_t v55 = 0;
  uint64_t v35 = sub_22E0F7100();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = v35 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35, v2, v3, v4);
  uint64_t v39 = (char *)v15 - v38;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3EE8);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v40 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v44, v5, v6, v7);
  id v45 = (char *)v15 - v43;
  uint64_t v58 = (char *)v15 - v43;
  char v57 = 0;
  uint64_t v55 = v8;
  swift_retain();
  swift_retain();
  uint64_t v56 = v1;
  uint64_t v47 = v44[3];
  uint64_t v48 = v44[4];
  __swift_project_boxed_opaque_existential_1(v44, v47);
  sub_22E0DCEDC();
  uint64_t v9 = v46;
  sub_22E0F7F60();
  uint64_t v49 = v9;
  uint64_t v50 = v9;
  if (v9)
  {
    uint64_t v19 = v50;
    swift_release();
    swift_release();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v31 = &v54;
    char v54 = 0;
    sub_22DF24950();
    uint64_t v10 = v49;
    sub_22E0F7D70();
    uint64_t v32 = v10;
    uint64_t v33 = v10;
    if (v10)
    {
      uint64_t v18 = v33;
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
      uint64_t v20 = v18;
    }
    else
    {
      int v26 = 1;
      char v57 = 1;
      (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v34 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v39, v35);
      swift_release();
      uint64_t v28 = sub_22E0F6FB0();
      id v27 = &v52;
      char v52 = v26;
      sub_22DFE6180();
      uint64_t v11 = v32;
      sub_22E0F7D70();
      uint64_t v29 = v11;
      uint64_t v30 = v11;
      if (v11)
      {
        uint64_t v17 = v30;
        swift_release();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
        uint64_t v20 = v17;
      }
      else
      {
        char v57 = 3;
        *(void *)(v34 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value) = v53;
        swift_release();
        char v22 = v51;
        sub_22DE1268C((uint64_t)v44, (uint64_t)v51);
        uint64_t v12 = v29;
        char v57 = 7;
        uint64_t v13 = SettingsSetting.init(from:)((uint64_t)v22);
        uint64_t v23 = v12;
        uint64_t v24 = v13;
        uint64_t v25 = v12;
        if (!v12)
        {
          uint64_t v21 = v24;
          swift_retain();
          uint64_t v56 = v21;
          (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
          swift_release();
          return v21;
        }
        uint64_t v16 = v25;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v40);
        uint64_t v20 = v16;
      }
    }
  }
  void v15[2] = v20;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  if ((v57 & 4) == 0)
  {
    if (v57) {
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v56 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v35);
    }
    if ((v57 & 2) != 0) {
      swift_release();
    }
    v15[1] = v56;
    type metadata accessor for SettingsNumericSetting();
    swift_deallocPartialClassInstance();
  }
  return v15[0];
}

uint64_t sub_22E0DD61C(void *a1)
{
  uint64_t v40 = a1;
  uint64_t v48 = 0;
  uint64_t v47 = 0;
  uint64_t v46 = 0;
  uint64_t v29 = sub_22E0F7100();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = v29 - 8;
  unint64_t v32 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v29, v2, v3, v4);
  uint64_t v33 = (char *)v14 - v32;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C3EF0);
  uint64_t v6 = v34;
  uint64_t v35 = v5;
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v40, v7, v8, v9);
  uint64_t v39 = (char *)v14 - v38;
  uint64_t v48 = (char *)v14 - v38;
  uint64_t v47 = v10;
  uint64_t v46 = v1;
  swift_retain();
  sub_22E0A9E00((uint64_t)v40);
  uint64_t v41 = v6;
  uint64_t v42 = v6;
  if (v6)
  {
    uint64_t v15 = v42;
    uint64_t result = swift_release();
    uint64_t v16 = v15;
  }
  else
  {
    swift_release();
    uint64_t v23 = v40[3];
    uint64_t v24 = v40[4];
    __swift_project_boxed_opaque_existential_1(v40, v23);
    sub_22E0DCEDC();
    sub_22E0F7F70();
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v33, v28 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v29);
    uint64_t v25 = &v45;
    char v45 = 0;
    sub_22DF24D80();
    uint64_t v11 = v41;
    sub_22E0F7E00();
    uint64_t v26 = v11;
    uint64_t v27 = v11;
    if (v11)
    {
      v14[1] = v27;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v39, v35);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);
      uint64_t v17 = *(void *)(v28 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value);
      swift_retain();
      uint64_t v20 = &v44;
      uint64_t v44 = v17;
      uint64_t v18 = &v43;
      char v43 = 1;
      uint64_t v19 = sub_22E0F6FB0();
      sub_22DFE6204();
      uint64_t v12 = v26;
      sub_22E0F7E00();
      uint64_t v21 = v12;
      uint64_t v22 = v12;
      if (v12) {
        v14[0] = v22;
      }
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v39, v35);
    }
  }
  return result;
}

uint64_t sub_22E0DDA48()
{
  return sub_22E0DDA94();
}

uint64_t sub_22E0DDA94()
{
  if (!"SiriSettingsIntents.SettingsNumericSetting")
  {
    sub_22E0F7CA0();
    __break(1u);
  }
  uint64_t result = sub_22DF0593C((uint64_t)"SiriSettingsIntents.SettingsNumericSetting", 42, (unint64_t)"init(builder:)", 14, 2, (unint64_t)"SiriSettingsIntents/SettingsNumericSetting.swift", 48, 2, v1, 0xBuLL, 0xEuLL);
  __break(1u);
  return result;
}

uint64_t sub_22E0DDBAC()
{
  uint64_t v3 = OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
  uint64_t v1 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return swift_release();
}

uint64_t SettingsNumericSetting.deinit()
{
  uint64_t v3 = SettingsSetting.deinit();
  uint64_t v2 = OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
  uint64_t v0 = sub_22E0F7100();
  (*(void (**)(uint64_t))(*(void *)(v0 - 8) + 8))(v3 + v2);
  swift_release();
  return v3;
}

uint64_t SettingsNumericSetting.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E0DDD2C()
{
  return type metadata accessor for SettingsNumericSetting();
}

uint64_t sub_22E0DDD48()
{
  uint64_t updated = sub_22E0F7100();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for SettingsNumericSetting()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_22E0DDE64()
{
  return type metadata accessor for SettingsNumericSetting.Builder();
}

uint64_t sub_22E0DDE80()
{
  uint64_t updated = sub_22E0F7100();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

void *type metadata accessor for SettingsNumericSetting.CodingKeys()
{
  return &unk_26E1E1ED8;
}

unint64_t sub_22E0DDF84()
{
  return sub_22E0DDF9C();
}

unint64_t sub_22E0DDF9C()
{
  uint64_t v2 = qword_2685C3F18;
  if (!qword_2685C3F18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3F18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0DE01C()
{
  return sub_22E0DE034();
}

unint64_t sub_22E0DE034()
{
  uint64_t v2 = qword_2685C3F20;
  if (!qword_2685C3F20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3F20);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22E0DE0B4()
{
  return sub_22E0DE0CC();
}

unint64_t sub_22E0DE0CC()
{
  uint64_t v2 = qword_2685C3F28;
  if (!qword_2685C3F28)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C3F28);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_22E0DE14C()
{
  if (qword_2685BF808 != -1) {
    swift_once();
  }
  return &qword_2685D7E48;
}

uint64_t sub_22E0DE1B0()
{
  type metadata accessor for SetFlashlightHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E48 = result;
  return result;
}

uint64_t type metadata accessor for SetFlashlightHandler()
{
  return self;
}

uint64_t sub_22E0DE218(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  uint64_t v37 = (void *)*sub_22DF136D8();
  id v3 = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  uint64_t v38 = sub_22DE6C64C();
  swift_release();
  usleep(0x30D40u);
  if (sub_22DE6C770())
  {
    if (sub_22DE6C880())
    {
      BOOL v32 = sub_22DE6C950() > 0.0;
      char v31 = sub_22DE6C7B0();
      id v4 = a1;
      if (v32)
      {
        char v28 = 0;
      }
      else
      {
        objc_msgSend(a1, sel_binaryValue);
        type metadata accessor for INBinarySettingValue();
        sub_22DE0BB64();
        char v30 = sub_22E0F7E80();
        id v5 = a1;
        if (v30)
        {
          char v29 = 1;
        }
        else
        {
          objc_msgSend(a1, sel_binaryValue);
          char v29 = sub_22E0F7E80();
        }

        char v28 = v29;
      }

      if (v28) {
        char v27 = v31;
      }
      else {
        char v27 = 0;
      }
      if (v27)
      {
        sub_22E0F7990();
        id v25 = (id)*sub_22DF136D8();
        id v6 = v25;
        sub_22E0F7E50();
        sub_22E0F7340();
        swift_bridgeObjectRelease();

        swift_retain();
        sub_22DFE69F0();
        id v26 = sub_22DEF8130();
        swift_bridgeObjectRelease();
        ((void (*)(id))a2)(v26);

        swift_release();
        return swift_release();
      }
      else
      {
        id v24 = sub_22DE6CA30();
        if (v24)
        {
          objc_msgSend(v24, sel_floatValue);
          float v21 = v8;

          float v22 = v21;
          char v23 = 0;
        }
        else
        {
          float v22 = 0.0;
          char v23 = 1;
        }
        if (v23) {
          float v39 = 1.0;
        }
        else {
          float v39 = v22;
        }
        uint64_t v9 = sub_22DF0ABD4();
        uint64_t v17 = *v9;
        uint64_t v18 = v9[1];
        unsigned int v19 = *((unsigned __int8 *)v9 + 16);
        char v20 = *(unsigned char *)(v36 + 24);
        swift_retain();
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = v38;
        *(float *)(v10 + 24) = v39;
        sub_22DEF7BD0(v32, a1, v17, v18, v19, v20 & 1, a2, a3, (uint64_t)sub_22E0DE9FC, v10, 0, 1, 0, 0);
        sub_22DE0C6FC((uint64_t)sub_22E0DE9FC);
        return swift_release();
      }
    }
    else
    {
      sub_22E0F7990();
      id v15 = (id)*sub_22DF136D8();
      id v11 = v15;
      sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      id v16 = sub_22DEF6C14(7, 0);
      a2();

      swift_release();
      return swift_release();
    }
  }
  else
  {
    sub_22E0F7990();
    id v13 = (id)*sub_22DF136D8();
    id v12 = v13;
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v14 = sub_22DEF8130();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v14);

    swift_release();
    return swift_release();
  }
}

uint64_t sub_22E0DE90C(char a1, float a2)
{
  if (a1) {
    return sub_22DE6CA6C(a2);
  }
  else {
    return sub_22DE6CA6C(0.0);
  }
}

uint64_t sub_22E0DE9BC()
{
  return swift_deallocObject();
}

uint64_t sub_22E0DE9FC(char a1)
{
  return sub_22E0DE90C(a1 & 1, *(float *)(v1 + 24));
}

uint64_t sub_22E0DEA2C(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0DE218(a1, a2, a3);
}

uint64_t *sub_22E0DEA50()
{
  if (qword_2685BF818 != -1) {
    swift_once();
  }
  return &qword_2685C3F30;
}

uint64_t *sub_22E0DEAB4()
{
  if (qword_2685BF810 != -1) {
    swift_once();
  }
  return &qword_2685D7E50;
}

uint64_t sub_22E0DEB18()
{
  type metadata accessor for GetStandByHandler();
  sub_22DE8653C((uint64_t)v1);
  uint64_t result = sub_22DEFBD18(1, (uint64_t)v1);
  qword_2685D7E50 = result;
  return result;
}

void sub_22E0DEB6C(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v33 = 0;
  uint64_t v36 = a1;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  sub_22DE10250();
  id v19 = sub_22DE07498(7, 0);
  id v32 = v19;
  id v3 = a1;
  char v31 = a1;
  unint64_t v4 = sub_22DE5E790();
  id v21 = SettingIntent.deviceCategory.getter(v4, (uint64_t)&protocol witness table for INGetSettingIntent);
  char v22 = v5;

  id v27 = v21;
  char v28 = v22 & 1;
  uint64_t v29 = 1;
  char v30 = 0;
  if (v22 & 1) != 0 || (sub_22DE113DC((uint64_t)&v27, (uint64_t)&v23), (v30))
  {
    char v16 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v16 = sub_22E0F7530();
  }
  swift_retain();
  if (v16)
  {
    sub_22DE1268C(v18 + 24, (uint64_t)v24);
    uint64_t v13 = v25;
    uint64_t v12 = v26;
    __swift_project_boxed_opaque_existential_1(v24, v25);
    char v14 = (*(uint64_t (**)(uint64_t))(v12 + 48))(v13);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
    char v15 = v14;
  }
  else
  {
    char v15 = 0;
  }
  swift_release();
  sub_22E0F7990();
  if (v15)
  {
    id v10 = (id)*sub_22DF136D8();
    id v6 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    sub_22DFE69F0();
    id v11 = (id)sub_22E0F7540();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setErrorDetail_, v11);
  }
  else
  {
    id v8 = (id)*sub_22DF136D8();
    id v7 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    sub_22DFE69F0();
    id v9 = (id)sub_22E0F7540();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setErrorDetail_, v9);
  }
  swift_retain();
  a2(v19);
  swift_release();
}

void sub_22E0DEF78(void *a1, void (*a2)(void), uint64_t a3)
{
}

uint64_t sub_22E0DEF9C()
{
  type metadata accessor for StandBySettings();
  uint64_t v0 = sub_22E0DF024();
  uint64_t result = sub_22E0DF054(v0, v1);
  qword_2685C3F30 = result;
  return result;
}

uint64_t type metadata accessor for GetStandByHandler()
{
  return self;
}

uint64_t type metadata accessor for StandBySettings()
{
  return self;
}

uint64_t sub_22E0DF024()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0DF054(uint64_t a1, uint64_t a2)
{
  return sub_22E0DF188(a1, a2);
}

uint64_t static StandBySettings.shared.getter()
{
  uint64_t v1 = *sub_22E0DEA50();
  swift_retain();
  return v1;
}

uint64_t sub_22E0DF0E0()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7E58 = result;
  qword_2685D7E60 = v1;
  return result;
}

uint64_t *sub_22E0DF124()
{
  if (qword_2685BF820 != -1) {
    swift_once();
  }
  return &qword_2685D7E58;
}

uint64_t sub_22E0DF188(uint64_t a1, uint64_t a2)
{
  sub_22DE82FFC();
  swift_bridgeObjectRetain();
  *(void *)(v5 + 16) = sub_22DE75A04(a1, a2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22E0DF208(uint64_t a1)
{
  uint64_t v17 = 0;
  char v14 = 0;
  uint64_t v18 = a1;
  uint64_t v16 = a1;
  uint64_t v15 = 1;
  type metadata accessor for INDeviceCategory();
  sub_22DE0B9D8();
  if ((sub_22E0F7E80() & 1) == 0)
  {
    char v5 = 0;
    return v5 & 1;
  }
  id v9 = *(void **)(v10 + 16);
  id v1 = v9;
  if (!v9) {
    goto LABEL_11;
  }
  char v14 = v9;
  sub_22E0DF124();
  swift_bridgeObjectRetain();
  id v7 = (id)sub_22E0F7540();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v9, sel_objectForKey_, v7);

  if (v8)
  {
    sub_22E0F7B10();
    sub_22DE83638((uint64_t)v11, (uint64_t)v12);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    uint64_t v13 = 0;
  }
  BOOL v6 = v13 != 0;
  sub_22DE585B0((uint64_t)v12);
  if (!v6)
  {

LABEL_11:
    char v5 = 1;
    return v5 & 1;
  }
  sub_22E0DF124();
  swift_bridgeObjectRetain();
  id v3 = (id)sub_22E0F7540();
  swift_bridgeObjectRelease();
  unsigned __int8 v4 = objc_msgSend(v9, sel_BOOLForKey_, v3);

  char v5 = v4;
  return v5 & 1;
}

uint64_t StandBySettings.deinit()
{
  sub_22DE63C6C((id *)(v0 + 16));
  return v2;
}

uint64_t StandBySettings.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for StandBySettings()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StandBySettings.standByEnabled(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))() & 1;
}

uint64_t *sub_22E0DF554()
{
  if (qword_2685BF828 != -1) {
    swift_once();
  }
  return &qword_2685D7E68;
}

uint64_t sub_22E0DF5B8()
{
  type metadata accessor for GetAssistiveTouchHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E68 = result;
  return result;
}

uint64_t type metadata accessor for GetAssistiveTouchHandler()
{
  return self;
}

void sub_22E0DF620(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  char v5 = sub_22DF07C64();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  id v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0DFAC4, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22E0DF7F0(uint64_t a1, void *a2, void (*a3)(id))
{
  swift_retain();
  BOOL v18 = sub_22DE65F48();
  swift_release();
  sub_22DE10250();
  id v15 = sub_22DE07498(3, 0);
  sub_22DE102B8();
  sub_22E0F7E50();
  uint64_t v17 = v3;
  id v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  *uint64_t v17 = sub_22DF961EC(v19, 0, 0, v13, 0, 0);
  sub_22DE04404();
  id v8 = (id)sub_22E0F7700();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_22E0F7990();
  id v12 = (id)*sub_22DF136D8();
  id v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  id v11 = v5;
  id v6 = v15;
  sub_22DE10320();
  uint64_t v9 = sub_22E0F75A0();
  uint64_t v10 = v7;
  void v11[3] = MEMORY[0x263F8D310];
  v11[4] = sub_22DE103A4();
  *id v11 = v9;
  v11[1] = v10;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();
}

void sub_22E0DFAC4()
{
  sub_22E0DF7F0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0DFAF8(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *sub_22E0DFB1C()
{
  if (qword_2685BF830 != -1) {
    swift_once();
  }
  return &qword_2685D7E70;
}

uint64_t sub_22E0DFB80()
{
  type metadata accessor for GetPersonalHotspotHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E70 = result;
  return result;
}

uint64_t type metadata accessor for GetPersonalHotspotHandler()
{
  return self;
}

void sub_22E0DFBE8(void *a1, void (*a2)(void), uint64_t a3)
{
  id v39 = a1;
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v42 = v3;
  char v43 = "GetPersonalHotspotHandler handling intent; Siri cannot change setting: Personal Hotspot";
  uint64_t v44 = "GetPersonalHotspotHandler handling intent";
  char v45 = "Device doesn't support personal hotspot.";
  uint64_t v46 = sub_22E0E06F8;
  uint64_t v47 = 0;
  int v51 = a1;
  uint64_t v49 = a2;
  uint64_t v50 = a3;
  uint64_t v48 = v3;
  sub_22DFA68E0();
  if (SettingsFeatureFlagsImpl.isGetSetHotspotEnabled()())
  {
    int v34 = sub_22E0F7990();
    id v36 = (id)*sub_22DF136D8();
    id v4 = v36;
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v35 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v37 = *(void *)(v42 + 16);
    swift_retain();
    int v38 = sub_22DE65B7C();
    swift_release();
    if (v38)
    {
      uint64_t v5 = v26;
      id v6 = sub_22DF07BB8();
      uint64_t v27 = *v6;
      uint64_t v28 = v6[1];
      unsigned int v29 = *((unsigned __int8 *)v6 + 16);
      id v30 = (id)*sub_22DF136D8();
      id v7 = v30;
      int v32 = *(unsigned __int8 *)(v42 + 24);
      id v8 = v39;
      swift_retain();
      swift_retain();
      char v31 = v19;
      MEMORY[0x270FA5388](v27, v28, v29, v30);
      v18[2] = v9;
      v18[3] = v42;
      v18[4] = v40;
      v18[5] = v10;
      sub_22DF06BCC(v11, v12, v13, v14, v32 & 1, v15, (uint64_t)v18, MEMORY[0x263F8EE60] + 8, v5);

      swift_release();
      swift_release();
    }
    else
    {
      int v22 = sub_22E0F79A0();
      id v24 = (id)*sub_22DF136D8();
      id v16 = v24;
      uint64_t v23 = sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_22DE10250();
      id v25 = sub_22DE07498(6, 0);
      v40();

      swift_release();
    }
  }
  else
  {
    v19[1] = sub_22E0F7990();
    id v20 = (id)*sub_22DF136D8();
    id v17 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v21 = sub_22DF963F0();
    swift_bridgeObjectRelease();
    ((void (*)(id))v40)(v21);

    swift_release();
  }
}

void sub_22E0E0014(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  id v43 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  int v51 = a1;
  uint64_t v50 = a2;
  uint64_t v48 = a3;
  uint64_t v49 = a4;
  id v4 = a1;
  uint64_t v47 = a1;
  unint64_t v5 = sub_22DE5E790();
  uint64_t v36 = SettingIntent.settingIdentifier.getter(v5, (uint64_t)&protocol witness table for INGetSettingIntent);
  uint64_t v37 = v6;

  swift_bridgeObjectRetain();
  char v46 = 36;
  uint64_t v35 = BinarySettingIdentifier.rawValue.getter();
  uint64_t v38 = v7;
  swift_bridgeObjectRetain();
  v44[0] = v36;
  v44[1] = v37;
  void v44[2] = v35;
  uint64_t v45 = v38;
  if (v37)
  {
    sub_22DE58A58(v44, &v39);
    if (v45)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v31 = sub_22E0F7620();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DE0D044();
      char v32 = v31;
      goto LABEL_7;
    }
    sub_22DE0D044();
    goto LABEL_9;
  }
  if (v45)
  {
LABEL_9:
    sub_22DE5875C();
    char v32 = 0;
    goto LABEL_7;
  }
  sub_22DE0D044();
  char v32 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32)
  {
    swift_retain();
    sub_22DE65848();
    swift_release();
    uint64_t v40 = sub_22DFE69F0();
    uint64_t v41 = v8;
    swift_retain();
    sub_22DE65758(1);
    swift_release();
    swift_retain();
    id v30 = sub_22DF963F0();
    a3();

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    char v29 = sub_22DE657B0();
    swift_release();
    swift_retain();
    if (v29)
    {
      swift_retain();
      char v27 = sub_22DE65848();
      swift_release();
      char v28 = v27 ^ 1;
    }
    else
    {
      char v28 = 0;
    }
    swift_release();
    if (v28)
    {
      sub_22E0F7990();
      id v25 = (id)*sub_22DF136D8();
      id v9 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
      sub_22E0F7E50();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_22DE657F0(1);
      swift_release();
      swift_retain();
      sub_22DFE69F0();
      id v26 = sub_22DF963F0();
      swift_bridgeObjectRelease();
      ((void (*)(id))a3)(v26);

      swift_release();
    }
    else
    {
      sub_22DE10250();
      id v21 = sub_22DE07498(3, 0);
      id v43 = v21;
      sub_22DE102B8();
      sub_22E0F7E50();
      int v22 = v10;
      id v23 = objc_msgSend(a1, sel_settingMetadata);
      swift_retain();
      char v24 = sub_22DE657B0();
      swift_release();
      if (v24) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = 2;
      }
      *int v22 = sub_22DF961EC(v23, 0, 0, v20, 0, 0);
      sub_22DE04404();
      id v15 = (id)sub_22E0F7700();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_setSettingResponseDatas_, v15);

      sub_22E0F7990();
      id v19 = (id)*sub_22DF136D8();
      id v11 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
      sub_22E0F7E50();
      BOOL v18 = v12;
      id v13 = v21;
      id v42 = v21;
      sub_22DE10320();
      uint64_t v16 = sub_22E0F75A0();
      uint64_t v17 = v14;
      v18[3] = MEMORY[0x263F8D310];
      v18[4] = sub_22DE103A4();
      uint64_t *v18 = v16;
      v18[1] = v17;
      sub_22DE04404();
      sub_22E0F7340();
      swift_bridgeObjectRelease();

      swift_retain();
      ((void (*)(id))a3)(v21);
      swift_release();
    }
  }
}

void sub_22E0E06F8()
{
  sub_22E0E0014(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40));
}

void sub_22E0E072C(void *a1, void (*a2)(void), uint64_t a3)
{
}

uint64_t *sub_22E0E0750()
{
  if (qword_2685BF838 != -1) {
    swift_once();
  }
  return &qword_2685D7E78;
}

uint64_t sub_22E0E07B4()
{
  type metadata accessor for GetAirplaneModeHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E78 = result;
  return result;
}

uint64_t type metadata accessor for GetAirplaneModeHandler()
{
  return self;
}

void sub_22E0E081C(void *a1, uint64_t a2, uint64_t a3)
{
  id v25 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v22 = v3;
  sub_22E0F7990();
  id v8 = (id)*sub_22DF136D8();
  id v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  unint64_t v5 = sub_22DF07B0C();
  uint64_t v9 = *v5;
  uint64_t v13 = v5[1];
  unsigned int v14 = *((unsigned __int8 *)v5 + 16);
  id v15 = (id)*sub_22DF136D8();
  id v6 = v15;
  char v16 = *(unsigned char *)(v3 + 24);
  swift_retain();
  id v7 = a1;
  swift_retain();
  uint64_t v18 = v3;
  id v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  sub_22DF06BCC(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22E0E0CC0, (uint64_t)v17, MEMORY[0x263F8EE60] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22E0E09EC(uint64_t a1, void *a2, void (*a3)(id))
{
  swift_retain();
  char v18 = sub_22DE653CC();
  swift_release();
  sub_22DE10250();
  id v15 = sub_22DE07498(3, 0);
  sub_22DE102B8();
  sub_22E0F7E50();
  uint64_t v17 = v3;
  id v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  *uint64_t v17 = sub_22DF961EC(v19, 0, 0, v13, 0, 0);
  sub_22DE04404();
  id v8 = (id)sub_22E0F7700();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_22E0F7990();
  id v12 = (id)*sub_22DF136D8();
  id v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  id v11 = v5;
  id v6 = v15;
  sub_22DE10320();
  uint64_t v9 = sub_22E0F75A0();
  uint64_t v10 = v7;
  void v11[3] = MEMORY[0x263F8D310];
  v11[4] = sub_22DE103A4();
  *id v11 = v9;
  v11[1] = v10;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();
}

void sub_22E0E0CC0()
{
  sub_22E0E09EC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22E0E0CF4(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *sub_22E0E0D18()
{
  if (qword_2685BF840 != -1) {
    swift_once();
  }
  return &qword_2685D7E80;
}

uint64_t sub_22E0E0D7C()
{
  type metadata accessor for SetAutoAnswerHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7E80 = result;
  return result;
}

uint64_t type metadata accessor for SetAutoAnswerHandler()
{
  return self;
}

uint64_t sub_22E0E0DE4(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_22E0F7990();
  id v6 = (id)*sub_22DF136D8();
  id v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  char v8 = sub_22DE6D978();
  swift_release();
  id v4 = sub_22DF09B24();
  uint64_t v10 = *v4;
  uint64_t v11 = v4[1];
  unsigned int v12 = *((unsigned __int8 *)v4 + 16);
  char v13 = *(unsigned char *)(v7 + 24);
  swift_retain();
  sub_22DEF7BD0(v8 & 1, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22E0E0FF8, v7, 0, 1, 0, 0);
  return sub_22DE0C6FC((uint64_t)sub_22E0E0FF8);
}

uint64_t sub_22E0E0F88(char a1)
{
  return swift_release();
}

uint64_t sub_22E0E0FF8(char a1)
{
  return sub_22E0E0F88(a1 & 1);
}

uint64_t sub_22E0E1020(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0E0DE4(a1, a2, a3);
}

uint64_t sub_22E0E1044()
{
  return sub_22E0E1060() & 1;
}

uint64_t sub_22E0E1060()
{
  return 0;
}

uint64_t *sub_22E0E1080()
{
  if (qword_2685BF848 != -1) {
    swift_once();
  }
  return &qword_2685C3F40;
}

id sub_22E0E10E4()
{
  type metadata accessor for SetNumericIntentHandler();
  uint64_t v3 = sub_22DF1E6DC();
  uint64_t v2 = sub_22DF1E70C();
  uint64_t v0 = sub_22E0E1168();
  id result = sub_22E0E1198(v3, v2, v0);
  qword_2685C3F40 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for SetNumericIntentHandler()
{
  return self;
}

uint64_t sub_22E0E1168()
{
  uint64_t v1 = *sub_22DE0D4A0();
  swift_retain();
  return v1;
}

id sub_22E0E1198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone(v3);
  return sub_22E0E121C(a1, a2, a3);
}

void *static SetNumericIntentHandler.shared.getter()
{
  uint64_t v2 = (void *)*sub_22E0E1080();
  id v0 = v2;
  return v2;
}

id sub_22E0E121C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  uint64_t v15 = a3;
  id v4 = v3;
  id v5 = v3;
  id v6 = v3;
  id v18 = v3;
  swift_retain();
  *(void *)&v9[OBJC_IVAR____TtC19SiriSettingsIntents23SetNumericIntentHandler_setHandlerProvider] = a1;

  swift_retain();
  *(void *)&v9[OBJC_IVAR____TtC19SiriSettingsIntents23SetNumericIntentHandler_confirmationConfigProvider] = a2;

  swift_retain();
  *(void *)&v9[OBJC_IVAR____TtC19SiriSettingsIntents23SetNumericIntentHandler_setupHandler] = a3;

  v14.receiver = v18;
  v14.super_class = (Class)type metadata accessor for SetNumericIntentHandler();
  id v13 = objc_msgSendSuper2(&v14, sel_init);
  id v7 = v13;
  id v18 = v13;
  swift_release();
  swift_release();
  swift_release();

  return v13;
}

uint64_t sub_22E0E1344(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v57 = 0;
  char v52 = 0;
  uint64_t v60 = a1;
  uint64_t v58 = a2;
  uint64_t v59 = a3;
  sub_22E0F7990();
  id v42 = (id)*sub_22DF136D8();
  id v3 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  sub_22E0CC55C(a1);
  if (v56 == 12) {
    goto LABEL_12;
  }
  char v52 = v56;
  swift_retain();
  char v48 = v56;
  sub_22E0D6404(&v48);
  swift_release();
  if (!v50)
  {
    sub_22DE585B0((uint64_t)v49);
LABEL_12:
    id v23 = (id)*sub_22DF136D8();
    id v12 = v23;
    sub_22E0F7980();
    sub_22E0F7E50();
    uint64_t v22 = v13;
    id v14 = a1;
    id v55 = a1;
    unint64_t v15 = sub_22DE86190();
    uint64_t v18 = SettingIntent.settingIdentifier.getter(v15, (uint64_t)&protocol witness table for INSetNumericSettingIntent);
    uint64_t v19 = v16;

    uint64_t v53 = v18;
    uint64_t v54 = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C0CD0);
    uint64_t v20 = sub_22E0F7590();
    uint64_t v21 = v17;
    v22[3] = MEMORY[0x263F8D310];
    v22[4] = sub_22DE103A4();
    *uint64_t v22 = v20;
    v22[1] = v21;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DE0D63C();
    id v24 = sub_22DE07498(8, 0);
    a2();

    return swift_release();
  }
  sub_22DE126F8(v49, __dst);
  char v39 = sub_22E0CA41C(a1);
  sub_22DE1268C((uint64_t)__dst, (uint64_t)v45);
  if (v39)
  {
    uint64_t v37 = v46;
    uint64_t v36 = v47;
    __swift_project_boxed_opaque_existential_1(v45, v46);
    int v38 = (*(uint64_t (**)(uint64_t))(v36 + 16))(v37) ^ 1;
  }
  else
  {
    LOBYTE(v38) = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  if (v38)
  {
    id v34 = (id)*sub_22DF136D8();
    id v4 = v34;
    sub_22E0F79A0();
    sub_22E0F7E50();
    uint64_t v33 = v5;
    id v6 = a1;
    sub_22DE86190();
    sub_22DF1629C();
    uint64_t v31 = sub_22E0F75A0();
    uint64_t v32 = v7;
    void v33[3] = MEMORY[0x263F8D310];
    unsigned char v33[4] = sub_22DE103A4();
    uint64_t *v33 = v31;
    v33[1] = v32;
    sub_22DE04404();
    sub_22E0F7330();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DE0D63C();
    id v35 = sub_22DE07498(8, 0);
    a2();

    swift_release();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)__dst);
  }
  else
  {
    sub_22E0F7990();
    id v28 = (id)*sub_22DF136D8();
    id v9 = v28;
    sub_22E0F7E50();
    char v27 = v10;
    sub_22DE1268C((uint64_t)__dst, (uint64_t)v44);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C22E0);
    uint64_t v25 = sub_22E0F7590();
    uint64_t v26 = v11;
    v27[3] = MEMORY[0x263F8D310];
    v27[4] = sub_22DE103A4();
    *char v27 = v25;
    v27[1] = v26;
    sub_22DE04404();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v29 = __dst[4];
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    swift_retain();
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = a2;
    *(void *)(v30 + 24) = a3;
    (*(void (**)(void *, uint64_t (*)(void *)))(v29 + 8))(a1, sub_22E0E1B94);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)__dst);
  }
}

uint64_t sub_22E0E19D4(void *a1, void (*a2)(void *))
{
  sub_22E0F7990();
  id v10 = (id)*sub_22DF136D8();
  id v2 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
  sub_22E0F7E50();
  id v9 = v3;
  id v4 = a1;
  sub_22DE0D63C();
  sub_22E03E7E8();
  uint64_t v7 = sub_22E0F75A0();
  uint64_t v8 = v5;
  v9[3] = MEMORY[0x263F8D310];
  void v9[4] = sub_22DE103A4();
  *id v9 = v7;
  v9[1] = v8;
  sub_22DE04404();
  sub_22E0F7340();
  swift_bridgeObjectRelease();

  swift_retain();
  a2(a1);
  return swift_release();
}

uint64_t sub_22E0E1B54()
{
  return swift_deallocObject();
}

uint64_t sub_22E0E1B94(void *a1)
{
  return sub_22E0E19D4(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_22E0E1C58()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22E0E1C98(void *a1, void (*a2)(void))
{
  swift_retain();
  id v5 = sub_22E0E1DE0(a1);
  a2();

  return swift_release();
}

id sub_22E0E1DE0(void *a1)
{
  uint64_t v42 = 0;
  char v39 = 0;
  id v37 = 0;
  id v43 = a1;
  sub_22E0CC55C(a1);
  if (v41 == 12
    || (char v39 = v41,
        swift_retain(),
        char v38 = v41,
        sub_22E08DD64(&v38, v44),
        swift_release(),
        sub_22E07FCB0(v44, __src),
        !__src[3]))
  {
    sub_22E0F7990();
    id v18 = (id)*sub_22DF136D8();
    id v7 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    uint64_t v17 = v8;
    id v9 = a1;
    uint64_t v40 = a1;
    sub_22DE86190();
    sub_22DF1629C();
    uint64_t v15 = sub_22E0F75A0();
    uint64_t v16 = v10;
    v17[3] = MEMORY[0x263F8D310];
    v17[4] = sub_22DE103A4();
    *uint64_t v17 = v15;
    v17[1] = v16;
    sub_22DE04404();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    sub_22DE0D63C();
    return sub_22DE07498(2, 0);
  }
  else
  {
    memcpy(__dst, __src, sizeof(__dst));
    uint64_t v1 = sub_22DF0BB10();
    uint64_t v30 = *v1;
    uint64_t v28 = v1[1];
    unsigned int v29 = *((unsigned __int8 *)v1 + 16);
    id v31 = (id)*sub_22DF136D8();
    id v2 = v31;
    has_malloc_uint32_t size = _swift_stdlib_has_malloc_size();
    sub_22DF070B8(v30, v28, v29, (uint64_t)v31, has_malloc_size & 1);

    sub_22DE0D63C();
    id v34 = sub_22DE07498(2, 0);
    id v37 = v34;
    sub_22DF1DD0C();
    sub_22DE63C04();
    uint64_t v32 = (void (*)(uint64_t))__dst[6];
    uint64_t v4 = swift_retain();
    v32(v4);
    id v33 = sub_22E00992C();
    swift_release();
    id v36 = objc_msgSend(v34, sel_oldValue);
    BOOL v27 = v36 != 0;
    sub_22DE63C6C(&v36);
    if (v27)
    {
      id v26 = objc_msgSend(v34, sel_oldValue);
      if (v26)
      {
        id v25 = v26;
      }
      else
      {
        LOBYTE(v12) = 2;
        uint64_t v13 = 85;
        LODWORD(v14) = 0;
        sub_22E0F7CA0();
        __break(1u);
      }
      objc_msgSend(v25, sel_unit, v12, v13, v14);
    }
    id v19 = sub_22DF92C4C(v33);
    objc_msgSend(v34, sel_setOldValue_);

    id v5 = sub_22DF0BB10();
    uint64_t v22 = *v5;
    uint64_t v20 = v5[1];
    unsigned int v21 = *((unsigned __int8 *)v5 + 16);
    id v23 = (id)*sub_22DF136D8();
    id v6 = v23;
    sub_22DF072EC(v22, v20, v21, v23);

    sub_22E07FD78((uint64_t)__dst);
    return v34;
  }
}

uint64_t sub_22E0E22C0()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id SetNumericIntentHandler.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SetNumericIntentHandler.init()()
{
  if (!"SiriSettingsIntents.SetNumericIntentHandler")
  {
    sub_22E0F7CA0();
    __break(1u);
  }
  uint64_t result = sub_22DF0593C((uint64_t)"SiriSettingsIntents.SetNumericIntentHandler", 43, (unint64_t)"init()", 6, 2, (unint64_t)"SiriSettingsIntents/SetNumericIntentHandler.swift", 49, 2, v1, 0xCuLL, 0xEuLL);
  __break(1u);
  return result;
}

id SetNumericIntentHandler.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetNumericIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SetNumericIntentHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SetNumericIntentHandler.handle(intent:completion:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x70))();
}

uint64_t dispatch thunk of SetNumericIntentHandler.confirm(intent:completion:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x78))();
}

uint64_t sub_22E0E25D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_22E0E25FC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))() & 1;
}

uint64_t *sub_22E0E2628()
{
  if (qword_2685BF850 != -1) {
    swift_once();
  }
  return &qword_2685C3FF0;
}

uint64_t *sub_22E0E268C()
{
  if (qword_2685BF858 != -1) {
    swift_once();
  }
  return &qword_2685C3FF8;
}

uint64_t *sub_22E0E26F0()
{
  if (qword_2685BF860 != -1) {
    swift_once();
  }
  return &qword_2685D7E88;
}

uint64_t *sub_22E0E2754()
{
  if (qword_2685BF868 != -1) {
    swift_once();
  }
  return &qword_2685D7E98;
}

uint64_t sub_22E0E27B8()
{
  type metadata accessor for SettingsUserDefaultsProvider();
  uint64_t v0 = sub_22E0E27F0();
  uint64_t result = sub_22E0DF054(v0, v1);
  qword_2685C3FF0 = result;
  return result;
}

uint64_t sub_22E0E27F0()
{
  return sub_22E0F7610();
}

uint64_t static SettingsUserDefaultsProvider.shared.getter()
{
  uint64_t v1 = *sub_22E0E2628();
  swift_retain();
  return v1;
}

void *sub_22E0E2858()
{
  id v3 = *(void **)(v0 + 16);
  id v1 = v3;
  return v3;
}

uint64_t SettingsUserDefaultsProvider.deinit()
{
  sub_22DE63C6C((id *)(v0 + 16));
  return v2;
}

uint64_t SettingsUserDefaultsProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22E0E2904()
{
  type metadata accessor for NotificationsUserDefaultsProvider();
  uint64_t v0 = sub_22E0E293C();
  uint64_t result = sub_22E0DF054(v0, v1);
  qword_2685C3FF8 = result;
  return result;
}

uint64_t sub_22E0E293C()
{
  return sub_22E0F7610();
}

uint64_t static NotificationsUserDefaultsProvider.shared.getter()
{
  uint64_t v1 = *sub_22E0E268C();
  swift_retain();
  return v1;
}

uint64_t sub_22E0E29A4()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7E88 = result;
  qword_2685D7E90 = v1;
  return result;
}

uint64_t sub_22E0E29E8()
{
  uint64_t result = sub_22E0F7610();
  qword_2685D7E98 = result;
  qword_2685D7EA0 = v1;
  return result;
}

uint64_t type metadata accessor for SettingsUserDefaultsProvider()
{
  return self;
}

uint64_t type metadata accessor for NotificationsUserDefaultsProvider()
{
  return self;
}

uint64_t NotificationsUserDefaultsProvider.deinit()
{
  sub_22DE63C6C((id *)(v0 + 16));
  return v2;
}

uint64_t NotificationsUserDefaultsProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for SettingsUserDefaultsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for NotificationsUserDefaultsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t *sub_22E0E2B48()
{
  if (qword_2685BF870 != -1) {
    swift_once();
  }
  return &qword_2685D7EA8;
}

uint64_t sub_22E0E2BAC()
{
  type metadata accessor for SetNoiseManagementHandler();
  uint64_t v0 = sub_22DE0F78C();
  uint64_t result = sub_22DE0F7BC(v0, 1);
  qword_2685D7EA8 = result;
  return result;
}

uint64_t type metadata accessor for SetNoiseManagementHandler()
{
  return self;
}

uint64_t sub_22E0E2C14(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0E2C64(a1, a2, a3);
}

uint64_t sub_22E0E2C64(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v79 = 0;
  int v82 = a1;
  uint64_t v80 = a2;
  uint64_t v81 = a3;
  id v52 = objc_msgSend(a1, sel_settingMetadata);
  if (v52 && (id v48 = objc_msgSend(v52, sel_targetDevice), v52, v48))
  {
    id v45 = objc_msgSend(v48, sel_deviceCategory);

    id v46 = v45;
    char v47 = 0;
  }
  else
  {
    id v46 = 0;
    char v47 = 1;
  }
  id v75 = v46;
  char v76 = v47 & 1;
  uint64_t v77 = 6;
  char v78 = 0;
  if (v47 & 1) != 0 || (sub_22DE113DC((uint64_t)&v75, (uint64_t)&v53), (v78))
  {
    char v44 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v44 = sub_22E0F7530();
  }
  if (v44)
  {
    sub_22E0F79A0();
    id v42 = (id)*sub_22DF136D8();
    id v3 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DE0A020();
    id v43 = sub_22DE07498(7, 0);
    a2();

    return swift_release();
  }
  id v41 = objc_msgSend(a1, sel_settingMetadata);
  if (v41)
  {
    id v36 = objc_msgSend(v41, sel_settingId);
    uint64_t v37 = sub_22E0F7550();
    uint64_t v38 = v5;

    uint64_t v39 = v37;
    uint64_t v40 = v38;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
  }
  swift_bridgeObjectRetain();
  char v74 = 32;
  uint64_t v34 = BinarySettingIdentifier.rawValue.getter();
  uint64_t v35 = v6;
  swift_bridgeObjectRetain();
  v73[0] = v39;
  v73[1] = v40;
  uint64_t v69 = v34;
  uint64_t v70 = v35;
  sub_22DE58A58(v73, &v71);
  if (v70)
  {
    sub_22DE58A58(&v69, &v54);
    if (v72)
    {
      swift_bridgeObjectRetain();
      char v32 = sub_22E0F7620();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DE0D044();
      sub_22DE0D044();
      char v33 = v32;
      goto LABEL_25;
    }
    sub_22DE0D044();
    goto LABEL_27;
  }
  if (v72)
  {
LABEL_27:
    sub_22DE5875C();
    char v33 = 0;
    goto LABEL_25;
  }
  sub_22DE0D044();
  char v33 = 1;
LABEL_25:
  swift_bridgeObjectRelease();
  if (v33)
  {
    swift_bridgeObjectRelease();
    sub_22E0E36A8(a1, (uint64_t)a2, a3);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v68 = 5;
  uint64_t v30 = BinarySettingIdentifier.rawValue.getter();
  uint64_t v31 = v7;
  swift_bridgeObjectRetain();
  v67[0] = v39;
  v67[1] = v40;
  uint64_t v63 = v30;
  uint64_t v64 = v31;
  sub_22DE58A58(v67, &v65);
  if (v64)
  {
    sub_22DE58A58(&v63, &v55);
    if (v66)
    {
      swift_bridgeObjectRetain();
      char v28 = sub_22E0F7620();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DE0D044();
      sub_22DE0D044();
      char v29 = v28;
      goto LABEL_36;
    }
    sub_22DE0D044();
    goto LABEL_38;
  }
  if (v66)
  {
LABEL_38:
    sub_22DE5875C();
    char v29 = 0;
    goto LABEL_36;
  }
  sub_22DE0D044();
  char v29 = 1;
LABEL_36:
  swift_bridgeObjectRelease();
  if (v29)
  {
    swift_bridgeObjectRelease();
    sub_22E0E434C(a1, (uint64_t)a2, a3);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v62 = 6;
  uint64_t v26 = BinarySettingIdentifier.rawValue.getter();
  uint64_t v27 = v8;
  swift_bridgeObjectRetain();
  v61[0] = v39;
  v61[1] = v40;
  uint64_t v57 = v26;
  uint64_t v58 = v27;
  sub_22DE58A58(v61, &v59);
  if (v58)
  {
    sub_22DE58A58(&v57, v56);
    if (v60)
    {
      swift_bridgeObjectRetain();
      char v24 = sub_22E0F7620();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_22DE0D044();
      sub_22DE0D044();
      char v25 = v24;
      goto LABEL_47;
    }
    sub_22DE0D044();
    goto LABEL_49;
  }
  if (v60)
  {
LABEL_49:
    sub_22DE5875C();
    char v25 = 0;
    goto LABEL_47;
  }
  sub_22DE0D044();
  char v25 = 1;
LABEL_47:
  swift_bridgeObjectRelease();
  if (v25)
  {
    swift_bridgeObjectRelease();
    sub_22E0E4C88(a1, (uint64_t)a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_22E0F7990();
    id v21 = (id)*sub_22DF136D8();
    id v9 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    uint64_t v22 = v10;
    id v23 = objc_msgSend(a1, sel_settingMetadata);
    if (v23)
    {
      id v16 = objc_msgSend(v23, sel_settingId);
      uint64_t v17 = sub_22E0F7550();
      uint64_t v18 = v11;

      uint64_t v19 = v17;
      uint64_t v20 = v18;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
    }
    v56[2] = v19;
    v56[3] = v20;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C0CD0);
    uint64_t v13 = sub_22E0F7590();
    uint64_t v14 = v12;
    v22[3] = MEMORY[0x263F8D310];
    v22[4] = sub_22DE103A4();
    *uint64_t v22 = v13;
    v22[1] = v14;
    sub_22DE04404();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22DFE69F0();
    id v15 = sub_22DEF8130();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v15);

    swift_release();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_22E0E36A8(void *a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  swift_retain();
  id v3 = a1;
  swift_retain();
  id v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  void v9[4] = a1;
  v9[5] = v8;
  sub_22DE7DC58((uint64_t)sub_22E0E4DCC, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_22E0E379C(unsigned int a1, void (*a2)(void), uint64_t a3, void *a4, uint64_t a5)
{
  unsigned int v57 = a1;
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  id v55 = a4;
  uint64_t v56 = a5;
  uint64_t v50 = "SetNoiseManagementHandler noise cancellation state: %@.";
  int v51 = &unk_2685C40A0;
  id v52 = "SetNoiseManagementHandler failed to read noise cancellation.";
  char v66 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  char v61 = 0;
  unint64_t v58 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685BF910) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v57, v53, v54, v55);
  uint64_t v59 = (char *)v33 - v58;
  char v66 = v5;
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  uint64_t v63 = v8;
  uint64_t v62 = v9;
  if (v5 == 2)
  {
    void v33[3] = sub_22E0F79A0();
    id v35 = (id)*sub_22DF136D8();
    id v32 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    id v36 = 0;
    uint64_t v34 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    id v37 = sub_22DEF6C14(7, v36);
    v53();
  }
  else
  {
    unsigned int v49 = v57;
    unsigned int v47 = v57;
    unsigned int v46 = 1;
    char v61 = v57 & 1;
    int v43 = sub_22E0F7990();
    id v45 = (id)*sub_22DF136D8();
    id v10 = v45;
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v42 = sub_22E0F7E50();
    uint64_t v40 = v11;
    char v60 = v47 & v46;
    uint64_t v38 = sub_22E0F75A0();
    uint64_t v39 = v12;
    v40[3] = MEMORY[0x263F8D310];
    unint64_t v13 = sub_22DE103A4();
    uint64_t v14 = v38;
    uint64_t v15 = v39;
    id v16 = v40;
    unint64_t v17 = v13;
    uint64_t v18 = v42;
    v40[4] = v17;
    *id v16 = v14;
    v16[1] = v15;
    sub_22DE04404();
    uint64_t v44 = v18;
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v19 = sub_22E0F77F0();
    (*(void (**)(char *, void))(*(void *)(v19 - 8) + 56))(v59, v46);
    id v20 = v55;
    swift_retain();
    swift_retain();
    uint64_t v21 = swift_allocObject();
    char v22 = v46;
    char v23 = v47;
    id v24 = v55;
    uint64_t v25 = v56;
    uint64_t v26 = v53;
    uint64_t v27 = v54;
    uint64_t v28 = (uint64_t)v51;
    uint64_t v29 = v21;
    uint64_t v30 = (uint64_t)v59;
    uint64_t v48 = v29;
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = 0;
    *(unsigned char *)(v29 + 32) = v23 & v22;
    *(void *)(v29 + 40) = v24;
    *(void *)(v29 + 48) = v25;
    *(void *)(v29 + 56) = v26;
    *(void *)(v29 + 64) = v27;
    sub_22DE07220(v30, v28, v29, MEMORY[0x263F8EE60] + 8);
  }
  return swift_release();
}

uint64_t sub_22E0E3B70(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = a8;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 72) = a6;
  *(void *)(v8 + 64) = a5;
  *(unsigned char *)(v8 + 113) = a4 & 1;
  *(void *)(v8 + 32) = v8;
  *(unsigned char *)(v8 + 112) = 0;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 56) = 0;
  *(unsigned char *)(v8 + 112) = a4 & 1;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 16) = a7;
  *(void *)(v8 + 24) = a8;
  return MEMORY[0x270FA2498](sub_22E0E3C0C, 0);
}

uint64_t sub_22E0E3C0C()
{
  uint64_t v6 = *(void *)(v0 + 72);
  *(void *)(v0 + 32) = v0;
  uint64_t v1 = sub_22DF0B2B8();
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  char v9 = *((unsigned char *)v1 + 16);
  char v10 = *(unsigned char *)(v6 + 24);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = *(void *)(v0 + 32);
  v2[1] = sub_22E0E3D68;
  uint64_t v3 = *(void *)(v0 + 64);
  char v4 = *(unsigned char *)(v0 + 113) & 1;
  return sub_22DEF6C70(v4, v3, v7, v8, v9, v10 & 1, (uint64_t)&unk_2685C40B0, v6);
}

uint64_t sub_22E0E3D68(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 32) = *v1;
  *(void *)(v3 + 104) = a1;
  swift_task_dealloc();
  sub_22DE0C6FC((uint64_t)&unk_2685C40B0);
  return MEMORY[0x270FA2498](sub_22E0E3EB8, 0);
}

uint64_t sub_22E0E3EB8()
{
  id v4 = (id)v0[13];
  uint64_t v3 = (void (*)(id))v0[10];
  v0[4] = v0;
  v0[7] = v4;
  swift_retain();
  v3(v4);
  swift_release();

  uint64_t v1 = *(uint64_t (**)(void))(v0[4] + 8);
  return v1();
}

uint64_t sub_22E0E3F9C(char a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a2;
  *(unsigned char *)(v2 + 65) = a1 & 1;
  *(void *)(v2 + 16) = v2;
  *(unsigned char *)(v2 + 64) = 0;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 64) = a1 & 1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_22E0E3FFC, 0);
}

uint64_t sub_22E0E3FFC()
{
  uint64_t v1 = v0[4];
  v0[2] = v0;
  v0[5] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_22E0E40C8;
  char v3 = *(unsigned char *)(v5 + 65) & 1;
  return sub_22DE7D760(v3);
}

uint64_t sub_22E0E40C8()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_22E0E4274, 0);
  }
  else
  {
    swift_release();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 16) + 8);
    return v2();
  }
}

uint64_t sub_22E0E4274()
{
  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

id sub_22E0E4318()
{
  return sub_22DEF6C14(7, 0);
}

uint64_t sub_22E0E434C(void *a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  swift_retain();
  id v3 = a1;
  swift_retain();
  char v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  void v9[4] = a1;
  v9[5] = v8;
  sub_22DE7E1BC((uint64_t)sub_22E0E4E30, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_22E0E4440(unsigned int a1, void (*a2)(void), uint64_t a3, void *a4, uint64_t a5)
{
  unsigned int v57 = a1;
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  id v55 = a4;
  uint64_t v56 = a5;
  uint64_t v50 = "SetNoiseManagementHandler audio transparency state: %@.";
  int v51 = &unk_2685C4080;
  id v52 = "SetNoiseManagementHandler failed to read audio transparency";
  char v66 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  char v61 = 0;
  unint64_t v58 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685BF910) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v57, v53, v54, v55);
  uint64_t v59 = (char *)v33 - v58;
  char v66 = v5;
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  uint64_t v63 = v8;
  uint64_t v62 = v9;
  if (v5 == 2)
  {
    void v33[3] = sub_22E0F79A0();
    id v35 = (id)*sub_22DF136D8();
    id v32 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    id v36 = 0;
    uint64_t v34 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    id v37 = sub_22DEF6C14(7, v36);
    v53();
  }
  else
  {
    unsigned int v49 = v57;
    unsigned int v47 = v57;
    unsigned int v46 = 1;
    char v61 = v57 & 1;
    int v43 = sub_22E0F7990();
    id v45 = (id)*sub_22DF136D8();
    id v10 = v45;
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v42 = sub_22E0F7E50();
    uint64_t v40 = v11;
    char v60 = v47 & v46;
    uint64_t v38 = sub_22E0F75A0();
    uint64_t v39 = v12;
    v40[3] = MEMORY[0x263F8D310];
    unint64_t v13 = sub_22DE103A4();
    uint64_t v14 = v38;
    uint64_t v15 = v39;
    id v16 = v40;
    unint64_t v17 = v13;
    uint64_t v18 = v42;
    v40[4] = v17;
    *id v16 = v14;
    v16[1] = v15;
    sub_22DE04404();
    uint64_t v44 = v18;
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v19 = sub_22E0F77F0();
    (*(void (**)(char *, void))(*(void *)(v19 - 8) + 56))(v59, v46);
    id v20 = v55;
    swift_retain();
    swift_retain();
    uint64_t v21 = swift_allocObject();
    char v22 = v46;
    char v23 = v47;
    id v24 = v55;
    uint64_t v25 = v56;
    uint64_t v26 = v53;
    uint64_t v27 = v54;
    uint64_t v28 = (uint64_t)v51;
    uint64_t v29 = v21;
    uint64_t v30 = (uint64_t)v59;
    uint64_t v48 = v29;
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = 0;
    *(unsigned char *)(v29 + 32) = v23 & v22;
    *(void *)(v29 + 40) = v24;
    *(void *)(v29 + 48) = v25;
    *(void *)(v29 + 56) = v26;
    *(void *)(v29 + 64) = v27;
    sub_22DE07220(v30, v28, v29, MEMORY[0x263F8EE60] + 8);
  }
  return swift_release();
}

uint64_t sub_22E0E4814(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = a8;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 72) = a6;
  *(void *)(v8 + 64) = a5;
  *(unsigned char *)(v8 + 113) = a4 & 1;
  *(void *)(v8 + 32) = v8;
  *(unsigned char *)(v8 + 112) = 0;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 56) = 0;
  *(unsigned char *)(v8 + 112) = a4 & 1;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 16) = a7;
  *(void *)(v8 + 24) = a8;
  return MEMORY[0x270FA2498](sub_22E0E48B0, 0);
}

uint64_t sub_22E0E48B0()
{
  uint64_t v6 = *(void *)(v0 + 72);
  *(void *)(v0 + 32) = v0;
  uint64_t v1 = sub_22DF0B458();
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  char v9 = *((unsigned char *)v1 + 16);
  char v10 = *(unsigned char *)(v6 + 24);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = *(void *)(v0 + 32);
  v2[1] = sub_22E0E4A0C;
  uint64_t v3 = *(void *)(v0 + 64);
  char v4 = *(unsigned char *)(v0 + 113) & 1;
  return sub_22DEF6C70(v4, v3, v7, v8, v9, v10 & 1, (uint64_t)&unk_2685C4090, v6);
}

uint64_t sub_22E0E4A0C(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 32) = *v1;
  *(void *)(v3 + 104) = a1;
  swift_task_dealloc();
  sub_22DE0C6FC((uint64_t)&unk_2685C4090);
  return MEMORY[0x270FA2498](sub_22E0E3EB8, 0);
}

uint64_t sub_22E0E4B5C(char a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a2;
  *(unsigned char *)(v2 + 65) = a1 & 1;
  *(void *)(v2 + 16) = v2;
  *(unsigned char *)(v2 + 64) = 0;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 64) = a1 & 1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_22E0E4BBC, 0);
}

uint64_t sub_22E0E4BBC()
{
  uint64_t v1 = v0[4];
  v0[2] = v0;
  v0[5] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_22E0E40C8;
  char v3 = *(unsigned char *)(v5 + 65) & 1;
  return sub_22DE7DF70(v3);
}

uint64_t sub_22E0E4C88(void *a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  swift_retain();
  id v3 = a1;
  swift_retain();
  char v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  void v9[4] = a1;
  v9[5] = v8;
  sub_22DE7E5A0((uint64_t)sub_22E0E5268, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_22E0E4D7C()
{
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E0E4DCC(unsigned int a1)
{
  return sub_22E0E379C(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_22E0E4DE0()
{
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E0E4E30(unsigned int a1)
{
  return sub_22E0E4440(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_22E0E4E44(unsigned int a1, void (*a2)(void), uint64_t a3, void *a4, uint64_t a5)
{
  unsigned int v57 = a1;
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  id v55 = a4;
  uint64_t v56 = a5;
  uint64_t v50 = "SetNoiseManagementHandler auto ANC state: %@.";
  int v51 = &unk_2685C4060;
  id v52 = "SetNoiseManagementHandler failed to read auto ANC";
  char v66 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  char v61 = 0;
  unint64_t v58 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685BF910) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v57, v53, v54, v55);
  uint64_t v59 = (char *)v33 - v58;
  char v66 = v5;
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  uint64_t v63 = v8;
  uint64_t v62 = v9;
  if (v5 == 2)
  {
    void v33[3] = sub_22E0F79A0();
    id v35 = (id)*sub_22DF136D8();
    id v32 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    id v36 = 0;
    uint64_t v34 = sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    swift_retain();
    id v37 = sub_22DEF6C14(7, v36);
    v53();
  }
  else
  {
    unsigned int v49 = v57;
    unsigned int v47 = v57;
    unsigned int v46 = 1;
    char v61 = v57 & 1;
    int v43 = sub_22E0F7990();
    id v45 = (id)*sub_22DF136D8();
    id v10 = v45;
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    uint64_t v42 = sub_22E0F7E50();
    uint64_t v40 = v11;
    char v60 = v47 & v46;
    uint64_t v38 = sub_22E0F75A0();
    uint64_t v39 = v12;
    v40[3] = MEMORY[0x263F8D310];
    unint64_t v13 = sub_22DE103A4();
    uint64_t v14 = v38;
    uint64_t v15 = v39;
    id v16 = v40;
    unint64_t v17 = v13;
    uint64_t v18 = v42;
    v40[4] = v17;
    *id v16 = v14;
    v16[1] = v15;
    sub_22DE04404();
    uint64_t v44 = v18;
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v19 = sub_22E0F77F0();
    (*(void (**)(char *, void))(*(void *)(v19 - 8) + 56))(v59, v46);
    id v20 = v55;
    swift_retain();
    swift_retain();
    uint64_t v21 = swift_allocObject();
    char v22 = v46;
    char v23 = v47;
    id v24 = v55;
    uint64_t v25 = v56;
    uint64_t v26 = v53;
    uint64_t v27 = v54;
    uint64_t v28 = (uint64_t)v51;
    uint64_t v29 = v21;
    uint64_t v30 = (uint64_t)v59;
    uint64_t v48 = v29;
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = 0;
    *(unsigned char *)(v29 + 32) = v23 & v22;
    *(void *)(v29 + 40) = v24;
    *(void *)(v29 + 48) = v25;
    *(void *)(v29 + 56) = v26;
    *(void *)(v29 + 64) = v27;
    sub_22DE07220(v30, v28, v29, MEMORY[0x263F8EE60] + 8);
  }
  return swift_release();
}

uint64_t sub_22E0E5218()
{
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E0E5268(unsigned int a1)
{
  return sub_22E0E4E44(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_22E0E527C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = a8;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 72) = a6;
  *(void *)(v8 + 64) = a5;
  *(unsigned char *)(v8 + 113) = a4 & 1;
  *(void *)(v8 + 32) = v8;
  *(unsigned char *)(v8 + 112) = 0;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 56) = 0;
  *(unsigned char *)(v8 + 112) = a4 & 1;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 16) = a7;
  *(void *)(v8 + 24) = a8;
  return MEMORY[0x270FA2498](sub_22E0E5318, 0);
}

uint64_t sub_22E0E5318()
{
  uint64_t v6 = *(void *)(v0 + 72);
  *(void *)(v0 + 32) = v0;
  uint64_t v1 = sub_22DF0B504();
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  char v9 = *((unsigned char *)v1 + 16);
  char v10 = *(unsigned char *)(v6 + 24);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = *(void *)(v0 + 32);
  v2[1] = sub_22E0E5474;
  uint64_t v3 = *(void *)(v0 + 64);
  char v4 = *(unsigned char *)(v0 + 113) & 1;
  return sub_22DEF6C70(v4, v3, v7, v8, v9, v10 & 1, (uint64_t)&unk_2685C4070, v6);
}

uint64_t sub_22E0E5474(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 32) = *v1;
  *(void *)(v3 + 104) = a1;
  swift_task_dealloc();
  sub_22DE0C6FC((uint64_t)&unk_2685C4070);
  return MEMORY[0x270FA2498](sub_22E0E3EB8, 0);
}

uint64_t sub_22E0E55C4(char a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a2;
  *(unsigned char *)(v2 + 65) = a1 & 1;
  *(void *)(v2 + 16) = v2;
  *(unsigned char *)(v2 + 64) = 0;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 64) = a1 & 1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_22E0E5624, 0);
}

uint64_t sub_22E0E5624()
{
  uint64_t v1 = v0[4];
  v0[2] = v0;
  v0[5] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 48) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_22E0E40C8;
  char v3 = *(unsigned char *)(v5 + 65) & 1;
  return sub_22DE7E354(v3);
}

uint64_t sub_22E0E56F0(uint64_t a1)
{
  v2[40] = v1;
  v2[39] = a1;
  v2[34] = v2;
  v2[35] = 0;
  v2[36] = 0;
  v2[35] = a1;
  v2[36] = v1;
  return MEMORY[0x270FA2498](sub_22E0E5748, 0);
}

uint64_t sub_22E0E5748()
{
  uint64_t v1 = *(void **)(v0 + 312);
  *(void *)(v0 + 272) = v0;
  id v54 = objc_msgSend(v1, sel_settingMetadata);
  if (v54 && (id v52 = objc_msgSend(v54, sel_targetDevice), v54, v52))
  {
    id v49 = objc_msgSend(v52, sel_deviceCategory);

    id v50 = v49;
    char v51 = 0;
  }
  else
  {
    id v50 = 0;
    char v51 = 1;
  }
  *(void *)(v53 + 112) = v50;
  *(unsigned char *)(v53 + 120) = v51 & 1;
  *(void *)(v53 + 128) = 6;
  *(unsigned char *)(v53 + 136) = 0;
  if ((*(unsigned char *)(v53 + 120) & 1) == 0)
  {
    sub_22DE113DC(v53 + 112, v53 + 256);
    if (*(unsigned char *)(v53 + 136)) {
      goto LABEL_16;
    }
    *(void *)(v53 + 296) = *(void *)(v53 + 256);
    *(void *)(v53 + 304) = *(void *)(v53 + 128);
    type metadata accessor for INDeviceCategory();
    sub_22DE09D28();
    char v2 = sub_22E0F7530();
    if ((v2 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_14:
    sub_22E0F79A0();
    unsigned int v47 = (void *)*sub_22DF136D8();
    id v3 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    id v48 = sub_22DEF6C14(7, 0);
LABEL_62:
    uint64_t v19 = *(uint64_t (**)(id))(*(void *)(v53 + 272) + 8);
    return v19(v48);
  }
  if (*(unsigned char *)(v53 + 136)) {
    goto LABEL_14;
  }
LABEL_16:
  id v46 = objc_msgSend(*(id *)(v53 + 312), sel_settingMetadata);
  if (v46)
  {
    id v41 = objc_msgSend(v46, sel_settingId);
    uint64_t v42 = sub_22E0F7550();
    uint64_t v43 = v4;

    uint64_t v44 = v42;
    uint64_t v45 = v43;
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
  }
  *(void *)(v53 + 328) = v45;
  swift_bridgeObjectRetain();
  uint64_t v39 = BinarySettingIdentifier.rawValue.getter();
  uint64_t v40 = v5;
  swift_bridgeObjectRetain();
  *(void *)(v53 + 144) = v44;
  *(void *)(v53 + 152) = v45;
  *(void *)(v53 + 16) = v39;
  *(void *)(v53 + 24) = v40;
  sub_22DE58A58((void *)(v53 + 144), (void *)(v53 + 32));
  if (!*(void *)(v53 + 24))
  {
    if (!*(void *)(v53 + 40))
    {
      sub_22DE0D044();
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
LABEL_26:
    sub_22DE5875C();
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  sub_22DE58A58((void *)(v53 + 16), (void *)(v53 + 240));
  if (!*(void *)(v53 + 40))
  {
    sub_22DE0D044();
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  char v38 = sub_22E0F7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DE0D044();
  sub_22DE0D044();
  swift_bridgeObjectRelease();
  if ((v38 & 1) == 0)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v36 = BinarySettingIdentifier.rawValue.getter();
    uint64_t v37 = v9;
    swift_bridgeObjectRetain();
    *(void *)(v53 + 160) = v44;
    *(void *)(v53 + 168) = v45;
    *(void *)(v53 + 48) = v36;
    *(void *)(v53 + 56) = v37;
    sub_22DE58A58((void *)(v53 + 160), (void *)(v53 + 64));
    if (*(void *)(v53 + 56))
    {
      sub_22DE58A58((void *)(v53 + 48), (void *)(v53 + 224));
      if (*(void *)(v53 + 72))
      {
        swift_bridgeObjectRetain();
        char v35 = sub_22E0F7620();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_22DE0D044();
        sub_22DE0D044();
        swift_bridgeObjectRelease();
        if ((v35 & 1) == 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          uint64_t v33 = BinarySettingIdentifier.rawValue.getter();
          uint64_t v34 = v12;
          swift_bridgeObjectRetain();
          *(void *)(v53 + 176) = v44;
          *(void *)(v53 + 184) = v45;
          *(void *)(v53 + 80) = v33;
          *(void *)(v53 + 88) = v34;
          sub_22DE58A58((void *)(v53 + 176), (void *)(v53 + 96));
          if (*(void *)(v53 + 88))
          {
            sub_22DE58A58((void *)(v53 + 80), (void *)(v53 + 208));
            if (*(void *)(v53 + 104))
            {
              swift_bridgeObjectRetain();
              char v32 = sub_22E0F7620();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_22DE0D044();
              sub_22DE0D044();
              swift_bridgeObjectRelease();
              if ((v32 & 1) == 0)
              {
LABEL_57:
                id v29 = *(id *)(v53 + 312);
                swift_bridgeObjectRelease();
                sub_22E0F7990();
                id v28 = (id)*sub_22DF136D8();
                id v15 = v28;
                __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
                sub_22E0F7E50();
                uint64_t v30 = v16;
                id v31 = objc_msgSend(v29, sel_settingMetadata);
                if (v31)
                {
                  id v23 = objc_msgSend(v31, sel_settingId);
                  uint64_t v24 = sub_22E0F7550();
                  uint64_t v25 = v17;

                  uint64_t v26 = v24;
                  uint64_t v27 = v25;
                }
                else
                {
                  uint64_t v26 = 0;
                  uint64_t v27 = 0;
                }
                *(void *)(v53 + 192) = v26;
                *(void *)(v53 + 200) = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2685C0CD0);
                uint64_t v20 = sub_22E0F7590();
                uint64_t v21 = v18;
                v30[3] = MEMORY[0x263F8D310];
                v30[4] = sub_22DE103A4();
                *uint64_t v30 = v20;
                v30[1] = v21;
                sub_22DE04404();
                sub_22E0F7340();
                swift_bridgeObjectRelease();

                id v22 = sub_22DEF6C14(7, 0);
                swift_bridgeObjectRelease();
                id v48 = v22;
                goto LABEL_62;
              }
              goto LABEL_54;
            }
            sub_22DE0D044();
          }
          else if (!*(void *)(v53 + 104))
          {
            sub_22DE0D044();
            swift_bridgeObjectRelease();
LABEL_54:
            swift_bridgeObjectRelease();
            unint64_t v13 = (void *)swift_task_alloc();
            *(void *)(v53 + 368) = v13;
            *unint64_t v13 = *(void *)(v53 + 272);
            v13[1] = sub_22E0E68A0;
            uint64_t v14 = *(void *)(v53 + 312);
            return sub_22E0E7994(v14);
          }
          sub_22DE5875C();
          swift_bridgeObjectRelease();
          goto LABEL_57;
        }
        goto LABEL_41;
      }
      sub_22DE0D044();
    }
    else if (!*(void *)(v53 + 72))
    {
      sub_22DE0D044();
      swift_bridgeObjectRelease();
LABEL_41:
      swift_bridgeObjectRelease();
      char v10 = (void *)swift_task_alloc();
      *(void *)(v53 + 352) = v10;
      *char v10 = *(void *)(v53 + 272);
      v10[1] = sub_22E0E66E4;
      uint64_t v11 = *(void *)(v53 + 312);
      return sub_22E0E71F8(v11);
    }
    sub_22DE5875C();
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
LABEL_28:
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v53 + 336) = v6;
  *uint64_t v6 = *(void *)(v53 + 272);
  v6[1] = sub_22E0E6528;
  uint64_t v7 = *(void *)(v53 + 312);
  return sub_22E0E6A5C(v7);
}

uint64_t sub_22E0E6528(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 272) = *v1;
  *(void *)(v3 + 344) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22E0E6644, 0);
}

uint64_t sub_22E0E6644()
{
  *(void *)(v0 + 272) = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 344);
  char v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 272) + 8);
  return v2(v1);
}

uint64_t sub_22E0E66E4(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 272) = *v1;
  *(void *)(v3 + 360) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22E0E6800, 0);
}

uint64_t sub_22E0E6800()
{
  *(void *)(v0 + 272) = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 360);
  char v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 272) + 8);
  return v2(v1);
}

uint64_t sub_22E0E68A0(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 272) = *v1;
  *(void *)(v3 + 376) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22E0E69BC, 0);
}

uint64_t sub_22E0E69BC()
{
  *(void *)(v0 + 272) = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 376);
  char v2 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 272) + 8);
  return v2(v1);
}

uint64_t sub_22E0E6A5C(uint64_t a1)
{
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 80) = 0;
  *(unsigned char *)(v2 + 88) = 0;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_22E0E6AB4, 0);
}

uint64_t sub_22E0E6AB4()
{
  uint64_t v1 = v0[6];
  v0[2] = v0;
  v0[7] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 64) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22E0E6B70;
  return sub_22DE7DCD4();
}

uint64_t sub_22E0E6B70(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = *v1;
  *(unsigned char *)(v3 + 82) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22E0E6CAC, 0);
}

uint64_t sub_22E0E6CAC()
{
  int v1 = *(unsigned __int8 *)(v0 + 82);
  *(void *)(v0 + 16) = v0;
  *(unsigned char *)(v0 + 80) = v1;
  if (v1 == 2)
  {
    sub_22E0F79A0();
    id v12 = (id)*sub_22DF136D8();
    id v9 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    id v10 = sub_22DEF6C14(7, 0);
    uint64_t v11 = *(uint64_t (**)(id))(*(void *)(v23 + 16) + 8);
    return v11(v10);
  }
  else
  {
    char v18 = *(unsigned char *)(v23 + 82);
    uint64_t v17 = *(void *)(v23 + 48);
    *(unsigned char *)(v23 + 88) = v18 & 1;
    sub_22E0F7990();
    id v16 = (id)*sub_22DF136D8();
    id v2 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    id v15 = v3;
    *(unsigned char *)(v23 + 81) = v18 & 1;
    uint64_t v13 = sub_22E0F75A0();
    uint64_t v14 = v4;
    void v15[3] = MEMORY[0x263F8D310];
    v15[4] = sub_22DE103A4();
    *id v15 = v13;
    v15[1] = v14;
    sub_22DE04404();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v5 = sub_22DF0B2B8();
    uint64_t v19 = *v5;
    uint64_t v20 = v5[1];
    char v21 = *((unsigned char *)v5 + 16);
    char v22 = *(unsigned char *)(v17 + 24);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v23 + 72) = v6;
    *uint64_t v6 = *(void *)(v23 + 16);
    v6[1] = sub_22E0E7054;
    uint64_t v7 = *(void *)(v23 + 40);
    return sub_22DEF6C70(v18 & 1, v7, v19, v20, v21, v22 & 1, (uint64_t)&unk_2685C4028, v17);
  }
}

uint64_t sub_22E0E7054(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  sub_22DE0C6FC((uint64_t)&unk_2685C4028);
  id v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t sub_22E0E71F8(uint64_t a1)
{
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 80) = 0;
  *(unsigned char *)(v2 + 88) = 0;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_22E0E7250, 0);
}

uint64_t sub_22E0E7250()
{
  uint64_t v1 = v0[6];
  v0[2] = v0;
  v0[7] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 64) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22E0E730C;
  return sub_22DE7E238();
}

uint64_t sub_22E0E730C(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = *v1;
  *(unsigned char *)(v3 + 82) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22E0E7448, 0);
}

uint64_t sub_22E0E7448()
{
  int v1 = *(unsigned __int8 *)(v0 + 82);
  *(void *)(v0 + 16) = v0;
  *(unsigned char *)(v0 + 80) = v1;
  if (v1 == 2)
  {
    sub_22E0F79A0();
    id v12 = (id)*sub_22DF136D8();
    id v9 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    id v10 = sub_22DEF6C14(7, 0);
    uint64_t v11 = *(uint64_t (**)(id))(*(void *)(v23 + 16) + 8);
    return v11(v10);
  }
  else
  {
    char v18 = *(unsigned char *)(v23 + 82);
    uint64_t v17 = *(void *)(v23 + 48);
    *(unsigned char *)(v23 + 88) = v18 & 1;
    sub_22E0F7990();
    id v16 = (id)*sub_22DF136D8();
    id v2 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    id v15 = v3;
    *(unsigned char *)(v23 + 81) = v18 & 1;
    uint64_t v13 = sub_22E0F75A0();
    uint64_t v14 = v4;
    void v15[3] = MEMORY[0x263F8D310];
    v15[4] = sub_22DE103A4();
    *id v15 = v13;
    v15[1] = v14;
    sub_22DE04404();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v5 = sub_22DF0B458();
    uint64_t v19 = *v5;
    uint64_t v20 = v5[1];
    char v21 = *((unsigned char *)v5 + 16);
    char v22 = *(unsigned char *)(v17 + 24);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v23 + 72) = v6;
    *uint64_t v6 = *(void *)(v23 + 16);
    v6[1] = sub_22E0E77F0;
    uint64_t v7 = *(void *)(v23 + 40);
    return sub_22DEF6C70(v18 & 1, v7, v19, v20, v21, v22 & 1, (uint64_t)&unk_2685C4038, v17);
  }
}

uint64_t sub_22E0E77F0(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  sub_22DE0C6FC((uint64_t)&unk_2685C4038);
  id v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t sub_22E0E7994(uint64_t a1)
{
  *(void *)(v2 + 48) = v1;
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 16) = v2;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 80) = 0;
  *(unsigned char *)(v2 + 88) = 0;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_22E0E79EC, 0);
}

uint64_t sub_22E0E79EC()
{
  uint64_t v1 = v0[6];
  v0[2] = v0;
  v0[7] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 64) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_22E0E7AA8;
  return sub_22DE7E61C();
}

uint64_t sub_22E0E7AA8(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = *v1;
  *(unsigned char *)(v3 + 82) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_22E0E7BE4, 0);
}

uint64_t sub_22E0E7BE4()
{
  int v1 = *(unsigned __int8 *)(v0 + 82);
  *(void *)(v0 + 16) = v0;
  *(unsigned char *)(v0 + 80) = v1;
  if (v1 == 2)
  {
    sub_22E0F79A0();
    id v12 = (id)*sub_22DF136D8();
    id v9 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    id v10 = sub_22DEF6C14(7, 0);
    uint64_t v11 = *(uint64_t (**)(id))(*(void *)(v23 + 16) + 8);
    return v11(v10);
  }
  else
  {
    char v18 = *(unsigned char *)(v23 + 82);
    uint64_t v17 = *(void *)(v23 + 48);
    *(unsigned char *)(v23 + 88) = v18 & 1;
    sub_22E0F7990();
    id v16 = (id)*sub_22DF136D8();
    id v2 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2685C0D30);
    sub_22E0F7E50();
    id v15 = v3;
    *(unsigned char *)(v23 + 81) = v18 & 1;
    uint64_t v13 = sub_22E0F75A0();
    uint64_t v14 = v4;
    void v15[3] = MEMORY[0x263F8D310];
    v15[4] = sub_22DE103A4();
    *id v15 = v13;
    v15[1] = v14;
    sub_22DE04404();
    sub_22E0F7340();
    swift_bridgeObjectRelease();

    uint64_t v5 = sub_22DF0B504();
    uint64_t v19 = *v5;
    uint64_t v20 = v5[1];
    char v21 = *((unsigned char *)v5 + 16);
    char v22 = *(unsigned char *)(v17 + 24);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v23 + 72) = v6;
    *uint64_t v6 = *(void *)(v23 + 16);
    v6[1] = sub_22E0E7F8C;
    uint64_t v7 = *(void *)(v23 + 40);
    return sub_22DEF6C70(v18 & 1, v7, v19, v20, v21, v22 & 1, (uint64_t)&unk_2685C4048, v17);
  }
}

uint64_t sub_22E0E7F8C(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  sub_22DE0C6FC((uint64_t)&unk_2685C4048);
  id v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t sub_22E0E8130(char a1)
{
  *(void *)(v1 + 16) = v1;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = *(void *)(v1 + 16);
  v2[1] = sub_22DE0A34C;
  return sub_22E0E3F9C(a1 & 1, v4);
}

uint64_t sub_22E0E81F0(char a1)
{
  *(void *)(v1 + 16) = v1;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = *(void *)(v1 + 16);
  v2[1] = sub_22DE0A34C;
  return sub_22E0E4B5C(a1 & 1, v4);
}

uint64_t sub_22E0E82B0(char a1)
{
  *(void *)(v1 + 16) = v1;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = *(void *)(v1 + 16);
  v2[1] = sub_22DE0A34C;
  return sub_22E0E55C4(a1 & 1, v4);
}

uint64_t sub_22E0E8370(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0E2C14(a1, a2, a3);
}

uint64_t sub_22E0E8394(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22E0E2C64(a1, a2, a3);
}

uint64_t sub_22E0E83B8(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *id v2 = *(void *)(v4 + 16);
  v2[1] = sub_22DED20F8;
  return sub_22E0E56F0(a1);
}

uint64_t sub_22E0E8470()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E0E84C8(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  char v8 = *(unsigned char *)(v1 + 32);
  uint64_t v9 = *(void *)(v1 + 40);
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v11 = *(void *)(v1 + 56);
  uint64_t v12 = *(void *)(v1 + 64);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DE0A34C;
  return sub_22E0E527C(a1, v6, v7, v8 & 1, v9, v10, v11, v12);
}

uint64_t sub_22E0E85D4(char a1)
{
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_22DE0A34C;
  return sub_22E0E55C4(a1 & 1, v4);
}

uint64_t sub_22E0E8694()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E0E86EC(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  char v8 = *(unsigned char *)(v1 + 32);
  uint64_t v9 = *(void *)(v1 + 40);
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v11 = *(void *)(v1 + 56);
  uint64_t v12 = *(void *)(v1 + 64);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DE0A34C;
  return sub_22E0E4814(a1, v6, v7, v8 & 1, v9, v10, v11, v12);
}

uint64_t sub_22E0E87F8(char a1)
{
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_22DE0A34C;
  return sub_22E0E4B5C(a1 & 1, v4);
}

uint64_t sub_22E0E88B8()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22E0E8910(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  char v8 = *(unsigned char *)(v1 + 32);
  uint64_t v9 = *(void *)(v1 + 40);
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v11 = *(void *)(v1 + 56);
  uint64_t v12 = *(void *)(v1 + 64);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DE0A34C;
  return sub_22E0E3B70(a1, v6, v7, v8 & 1, v9, v10, v11, v12);
}

uint64_t sub_22E0E8A1C(char a1)
{
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = *(void *)(v1 + 16);
  v2[1] = sub_22DE0A34C;
  return sub_22E0E3F9C(a1 & 1, v4);
}

uint64_t sub_22E0E8ADC()
{
  sub_22E0F7E50();
  *(void *)uint64_t v0 = "SetNumericSettingIntent#ConfirmMaximumVolume";
  *(void *)(v0 + 8) = 44;
  *(unsigned char *)(v0 + 16) = 2;
  *(void *)(v0 + 24) = "SetNumericSettingIntent#RetainingCurrentNumericValue";
  *(void *)(v0 + 32) = 52;
  *(unsigned char *)(v0 + 40) = 2;
  *(void *)(v0 + 48) = "SetNumericSettingIntent#NoNeedToChangeNumericValueTo";
  *(void *)(v0 + 56) = 52;
  *(unsigned char *)(v0 + 64) = 2;
  *(void *)(v0 + 72) = "SetNumericSettingIntent#UnspecifiedActionForSupportedNumericSetting";
  *(void *)(v0 + 80) = 67;
  *(unsigned char *)(v0 + 88) = 2;
  *(void *)(v0 + 96) = "SetNumericSettingIntent#ConfirmDisableSmartVolume";
  *(void *)(v0 + 104) = 49;
  *(unsigned char *)(v0 + 112) = 2;
  *(void *)(v0 + 120) = "SetNumericSettingIntent#ChangedNumericValueToSpokenOnly";
  *(void *)(v0 + 128) = 55;
  *(unsigned char *)(v0 + 136) = 2;
  *(void *)(v0 + 144) = "SetNumericSettingIntent#ChangedNumericValueTo";
  *(void *)(v0 + 152) = 45;
  *(unsigned char *)(v0 + 160) = 2;
  sub_22DE04404();
  uint64_t v3 = sub_22E0F7CE0();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      unsigned __int8 v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      unsigned __int8 v4 = 1;
      goto LABEL_16;
    case 2:
      unsigned __int8 v4 = 2;
      goto LABEL_16;
    case 3:
      unsigned __int8 v4 = 3;
      goto LABEL_16;
    case 4:
      unsigned __int8 v4 = 4;
      goto LABEL_16;
    case 5:
      unsigned __int8 v4 = 5;
      goto LABEL_16;
    case 6:
      unsigned __int8 v4 = 6;
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  return 7;
}

uint64_t sub_22E0E8D64()
{
  return sub_22E0F7610();
}

uint64_t sub_22E0E8EF8()
{
  return sub_22E0F7E80() & 1;
}

unint64_t sub_22E0E8F44()
{
  uint64_t v2 = qword_2685C40B8;
  if (!qword_2685C40B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C40B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22E0E8FC4()
{
  return sub_22E0F76C0();
}

uint64_t sub_22E0E9004()
{
  return sub_22E0F76E0();
}

uint64_t sub_22E0E904C()
{
  return sub_22E0F76D0();
}

uint64_t sub_22E0E9094@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E0E8ADC();
  *a1 = result;
  return result;
}

uint64_t sub_22E0E90CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E0E8D64();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22E0E9100(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  unsigned __int8 v4 = v1;
  *uint64_t v1 = sub_22E0F7610();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_22E0F7180();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t sub_22E0E9210()
{
  char v60 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  unint64_t v54 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1, v2, v3, v4);
  uint64_t v55 = (char *)v38 - v54;
  char v60 = v0;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v57 = sub_22E0F7E50();
  unint64_t v58 = v5;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v58;
  *unint64_t v58 = v6;
  v7[1] = v8;
  uint64_t v59 = *v0;
  swift_retain();
  if (v59)
  {
    uint64_t v52 = v59;
    uint64_t v51 = v59;
    uint64_t v9 = type metadata accessor for SettingsNumericSettingAction();
    uint64_t v10 = v58;
    uint64_t v11 = v51;
    v58[5] = v9;
    v10[2] = v11;
  }
  else
  {
    uint64_t v37 = v58;
    v58[2] = 0;
    v37[3] = 0;
    v37[4] = 0;
    v37[5] = 0;
  }
  uint64_t v12 = sub_22E0F7610();
  uint64_t v13 = v58;
  uint64_t v14 = v53;
  v58[6] = v12;
  v13[7] = v15;
  uint64_t v50 = *(void *)(v14 + 8);
  swift_retain();
  if (v50)
  {
    uint64_t v49 = v50;
    uint64_t v48 = v50;
    uint64_t v16 = sub_22E0F7180();
    uint64_t v17 = v58;
    uint64_t v18 = v48;
    v58[11] = v16;
    v17[8] = v18;
  }
  else
  {
    uint64_t v36 = v58;
    v58[8] = 0;
    v36[9] = 0;
    v36[10] = 0;
    v36[11] = 0;
  }
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v58;
  uint64_t v21 = v53;
  v58[12] = v19;
  v20[13] = v22;
  uint64_t v47 = *(void *)(v21 + 16);
  swift_retain();
  if (v47)
  {
    uint64_t v46 = v47;
    uint64_t v45 = v47;
    uint64_t v23 = type metadata accessor for SettingsNumericSetting();
    uint64_t v24 = v58;
    uint64_t v25 = v45;
    v58[17] = v23;
    v24[14] = v25;
  }
  else
  {
    char v35 = v58;
    v58[14] = 0;
    v35[15] = 0;
    v35[16] = 0;
    v35[17] = 0;
  }
  uint64_t v39 = v58 + 20;
  unsigned int v41 = 1;
  uint64_t v26 = sub_22E0F7610();
  uint64_t v27 = v58;
  v58[18] = v26;
  v27[19] = v28;
  uint64_t v40 = 0;
  uint64_t v29 = type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters();
  sub_22DE5A4C4((const void *)(v53 + *(int *)(v29 + 28)), v55);
  uint64_t v42 = sub_22E0F7100();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = v42 - 8;
  if ((*(unsigned int (**)(char *, void))(v43 + 48))(v55, v41) == 1)
  {
    sub_22DE58794((uint64_t)v55);
    uint64_t v34 = v58;
    v58[20] = 0;
    v34[21] = 0;
    v34[22] = 0;
    v34[23] = 0;
  }
  else
  {
    uint64_t v30 = v39;
    v58[23] = v42;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
    (*(void (**)(uint64_t *, char *, uint64_t))(v43 + 32))(boxed_opaque_existential_1, v55, v42);
  }
  uint64_t v32 = v57;
  sub_22DE04404();
  v38[1] = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters()
{
  uint64_t v1 = qword_2685C4130;
  if (!qword_2685C4130) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

char *sub_22E0E9634@<X0>(char *a1@<X8>)
{
  uint64_t v12 = a1;
  uint64_t v13 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = (*(void *)(*(void *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters()
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1, v2, v3);
  uint64_t v4 = (char *)&v8 - v9;
  uint64_t v11 = v4;
  uint64_t v13 = (char *)&v8 - v9;
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  uint64_t v10 = *(int *)(v5 + 28);
  uint64_t v6 = sub_22E0F7100();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 56))(&v11[v10], 1);
  return sub_22E0F3D9C(v11, v12);
}

uint64_t sub_22E0E9724()
{
  uint64_t v65 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  unint64_t v59 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1, v2, v3, v4);
  char v60 = (char *)v43 - v59;
  uint64_t v65 = v0;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v62 = sub_22E0F7E50();
  uint64_t v63 = v5;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v63;
  *uint64_t v63 = v6;
  v7[1] = v8;
  uint64_t v64 = *v0;
  swift_retain();
  if (v64)
  {
    uint64_t v57 = v64;
    uint64_t v56 = v64;
    uint64_t v9 = type metadata accessor for SettingsNumericSettingAction();
    uint64_t v10 = v63;
    uint64_t v11 = v56;
    v63[5] = v9;
    v10[2] = v11;
  }
  else
  {
    uint64_t v42 = v63;
    v63[2] = 0;
    v42[3] = 0;
    v42[4] = 0;
    v42[5] = 0;
  }
  uint64_t v12 = sub_22E0F7610();
  uint64_t v13 = v63;
  uint64_t v14 = v58;
  v63[6] = v12;
  v13[7] = v15;
  uint64_t v55 = *(void *)(v14 + 8);
  swift_retain();
  if (v55)
  {
    uint64_t v54 = v55;
    uint64_t v53 = v55;
    uint64_t v16 = sub_22E0F7180();
    uint64_t v17 = v63;
    uint64_t v18 = v53;
    v63[11] = v16;
    v17[8] = v18;
  }
  else
  {
    unsigned int v41 = v63;
    v63[8] = 0;
    v41[9] = 0;
    v41[10] = 0;
    v41[11] = 0;
  }
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v63;
  uint64_t v21 = v58;
  v63[12] = v19;
  v20[13] = v22;
  uint64_t v52 = *(void *)(v21 + 16);
  swift_retain();
  if (v52)
  {
    uint64_t v51 = v52;
    uint64_t v50 = v52;
    uint64_t v23 = type metadata accessor for SettingsNumericSetting();
    uint64_t v24 = v63;
    uint64_t v25 = v50;
    v63[17] = v23;
    v24[14] = v25;
  }
  else
  {
    uint64_t v40 = v63;
    v63[14] = 0;
    v40[15] = 0;
    v40[16] = 0;
    v40[17] = 0;
  }
  unsigned int v46 = 1;
  uint64_t v26 = sub_22E0F7610();
  uint64_t v27 = v63;
  uint64_t v28 = v58;
  char v29 = v46;
  v63[18] = v26;
  v27[19] = v30;
  LOBYTE(v28) = *(unsigned char *)(v28 + 24);
  v27[23] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v27 + 160) = v28 & v29;
  uint64_t v44 = v27 + 26;
  uint64_t v31 = sub_22E0F7610();
  uint64_t v32 = v63;
  v63[24] = v31;
  v32[25] = v33;
  uint64_t v45 = 0;
  uint64_t v34 = type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters();
  sub_22DE5A4C4((const void *)(v58 + *(int *)(v34 + 32)), v60);
  uint64_t v47 = sub_22E0F7100();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = v47 - 8;
  if ((*(unsigned int (**)(char *, void))(v48 + 48))(v60, v46) == 1)
  {
    sub_22DE58794((uint64_t)v60);
    uint64_t v39 = v63;
    v63[26] = 0;
    v39[27] = 0;
    v39[28] = 0;
    v39[29] = 0;
  }
  else
  {
    char v35 = v44;
    v63[29] = v47;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, char *, uint64_t))(v48 + 32))(boxed_opaque_existential_1, v60, v47);
  }
  uint64_t v37 = v62;
  sub_22DE04404();
  v43[1] = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters()
{
  uint64_t v1 = qword_2685C4140;
  if (!qword_2685C4140) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *sub_22E0E9B88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, const void *a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 24) = a4 & 1;
  uint64_t v6 = type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters();
  return sub_22DED4390(a5, (void *)(a6 + *(int *)(v6 + 32)));
}

uint64_t sub_22E0E9BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v3;
  *uint64_t v3 = sub_22E0F7610();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsNumericSettingAction();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_22E0F7180();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_22E0F7610();
  v10[13] = v6;
  swift_retain();
  if (a3)
  {
    v10[17] = type metadata accessor for SettingsNumericSetting();
    v10[14] = a3;
  }
  else
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t sub_22E0E9E2C()
{
  return 0;
}

uint64_t sub_22E0E9E7C(uint64_t a1, __int16 a2)
{
  char v8 = a2;
  char v9 = HIBYTE(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  sub_22E0F7E50();
  uint64_t v10 = v2;
  *uint64_t v2 = sub_22E0F7610();
  v10[1] = v3;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsNumericSettingAction();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_22E0F7610();
  v10[7] = v4;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  v10[11] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v10 + 64) = v8 & 1;
  v10[12] = sub_22E0F7610();
  v10[13] = v5;
  v10[17] = v7;
  *((unsigned char *)v10 + 112) = v9 & 1;
  sub_22DE04404();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t sub_22E0EA080()
{
  char v60 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  unint64_t v54 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1, v2, v3, v4);
  uint64_t v55 = (char *)v38 - v54;
  char v60 = v0;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v57 = sub_22E0F7E50();
  uint64_t v58 = v5;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v58;
  *uint64_t v58 = v6;
  v7[1] = v8;
  uint64_t v59 = *v0;
  swift_retain();
  if (v59)
  {
    uint64_t v52 = v59;
    uint64_t v51 = v59;
    uint64_t v9 = type metadata accessor for SettingsNumericSettingAction();
    uint64_t v10 = v58;
    uint64_t v11 = v51;
    v58[5] = v9;
    v10[2] = v11;
  }
  else
  {
    uint64_t v37 = v58;
    v58[2] = 0;
    v37[3] = 0;
    v37[4] = 0;
    v37[5] = 0;
  }
  uint64_t v12 = sub_22E0F7610();
  uint64_t v13 = v58;
  uint64_t v14 = v53;
  v58[6] = v12;
  v13[7] = v15;
  uint64_t v50 = *(void *)(v14 + 8);
  swift_retain();
  if (v50)
  {
    uint64_t v49 = v50;
    uint64_t v48 = v50;
    uint64_t v16 = sub_22E0F7180();
    uint64_t v17 = v58;
    uint64_t v18 = v48;
    v58[11] = v16;
    v17[8] = v18;
  }
  else
  {
    uint64_t v36 = v58;
    v58[8] = 0;
    v36[9] = 0;
    v36[10] = 0;
    v36[11] = 0;
  }
  uint64_t v19 = sub_22E0F7610();
  uint64_t v20 = v58;
  uint64_t v21 = v53;
  v58[12] = v19;
  v20[13] = v22;
  uint64_t v47 = *(void *)(v21 + 16);
  swift_retain();
  if (v47)
  {
    uint64_t v46 = v47;
    uint64_t v45 = v47;
    uint64_t v23 = type metadata accessor for SettingsNumericSetting();
    uint64_t v24 = v58;
    uint64_t v25 = v45;
    v58[17] = v23;
    v24[14] = v25;
  }
  else
  {
    char v35 = v58;
    v58[14] = 0;
    v35[15] = 0;
    v35[16] = 0;
    v35[17] = 0;
  }
  uint64_t v39 = v58 + 20;
  unsigned int v41 = 1;
  uint64_t v26 = sub_22E0F7610();
  uint64_t v27 = v58;
  v58[18] = v26;
  v27[19] = v28;
  uint64_t v40 = 0;
  uint64_t v29 = type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  sub_22DE5A4C4((const void *)(v53 + *(int *)(v29 + 40)), v55);
  uint64_t v42 = sub_22E0F7100();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = v42 - 8;
  if ((*(unsigned int (**)(char *, void))(v43 + 48))(v55, v41) == 1)
  {
    sub_22DE58794((uint64_t)v55);
    uint64_t v34 = v58;
    v58[20] = 0;
    v34[21] = 0;
    v34[22] = 0;
    v34[23] = 0;
  }
  else
  {
    uint64_t v30 = v39;
    v58[23] = v42;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
    (*(void (**)(uint64_t *, char *, uint64_t))(v43 + 32))(boxed_opaque_existential_1, v55, v42);
  }
  uint64_t v32 = v57;
  sub_22DE04404();
  v38[1] = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters()
{
  uint64_t v1 = qword_2685C4150;
  if (!qword_2685C4150) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

char *sub_22E0EA4A4@<X0>(char *a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v18 = 0;
  v8[1] = 0;
  uint64_t v11 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  unint64_t v9 = (*(void *)(*((void *)v11 - 1) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1, v2, v3);
  uint64_t v4 = (char *)v8 - v9;
  uint64_t v16 = v4;
  uint64_t v18 = (char *)v8 - v9;
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  uint64_t v10 = *(int *)(v5 + 28);
  uint64_t v13 = sub_22E0F7100();
  uint64_t v6 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 56);
  uint64_t v14 = v6 + 56;
  unsigned int v12 = 1;
  v15(&v16[v10], 1);
  ((void (*)(char *, void, void, uint64_t))v15)(&v16[v11[8]], v12, v12, v13);
  ((void (*)(char *, void, void, uint64_t))v15)(&v16[v11[9]], v12, v12, v13);
  ((void (*)(char *, void, void, uint64_t))v15)(&v16[v11[10]], v12, v12, v13);
  return sub_22E0F3920(v16, v17);
}

uint64_t sub_22E0EA638()
{
  char v78 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  unint64_t v72 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1, v2, v3, v4);
  int v73 = (char *)v54 - v72;
  char v78 = v0;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB0);
  uint64_t v75 = sub_22E0F7E50();
  char v76 = v5;
  uint64_t v6 = sub_22E0F7610();
  uint64_t v7 = v76;
  *char v76 = v6;
  v7[1] = v8;
  uint64_t v77 = *v0;
  swift_retain();
  if (v77)
  {
    uint64_t v70 = v77;
    uint64_t v69 = v77;
    uint64_t v9 = type metadata accessor for SettingsNumericSettingAction();
    uint64_t v10 = v76;
    uint64_t v11 = v69;
    v76[5] = v9;
    v10[2] = v11;
  }
  else
  {
    uint64_t v53 = v76;
    v76[2] = 0;
    v53[3] = 0;
    v53[4] = 0;
    v53[5] = 0;
  }
  uint64_t v12 = sub_22E0F7610();
  uint64_t v13 = v76;
  uint64_t v14 = v71;
  v76[6] = v12;
  v13[7] = v15;
  uint64_t v68 = *(void *)(v14 + 8);
  swift_retain();
  if (v68)
  {
    uint64_t v67 = v68;
    uint64_t v66 = v68;
    uint64_t v16 = sub_22E0F7180();
    uint64_t v17 = v76;
    uint64_t v18 = v66;
    v76[11] = v16;
    v17[8] = v18;
  }
  else
  {
    uint64_t v52 = v76;
    v76[8] = 0;
    v52[9] = 0;
    v52[10] = 0;
    v52[11] = 0;
  }
  int v64 = 1;
  uint64_t v19 = sub_22E0F7610();
  char v20 = v64;
  uint64_t v21 = v76;
  uint64_t v22 = v71;
  v76[12] = v19;
  v21[13] = v23;
  LOBYTE(v22) = *(unsigned char *)(v22 + 16);
  uint64_t v63 = MEMORY[0x263F8D4F8];
  v21[17] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v21 + 112) = v22 & v20;
  uint64_t v24 = sub_22E0F7610();
  uint64_t v25 = v63;
  char v26 = v64;
  uint64_t v27 = v76;
  uint64_t v28 = v71;
  v76[18] = v24;
  v27[19] = v29;
  LOBYTE(v28) = *(unsigned char *)(v28 + 17);
  v27[23] = v25;
  *((unsigned char *)v27 + 160) = v28 & v26;
  uint64_t v30 = sub_22E0F7610();
  uint64_t v31 = v76;
  uint64_t v32 = v71;
  v76[24] = v30;
  v31[25] = v33;
  uint64_t v65 = *(void *)(v32 + 24);
  swift_retain();
  if (v65)
  {
    uint64_t v62 = v65;
    uint64_t v61 = v65;
    uint64_t v34 = type metadata accessor for SettingsNumericSetting();
    char v35 = v76;
    uint64_t v36 = v61;
    v76[29] = v34;
    v35[26] = v36;
  }
  else
  {
    uint64_t v51 = v76;
    v76[26] = 0;
    v51[27] = 0;
    v51[28] = 0;
    v51[29] = 0;
  }
  unsigned int v57 = 1;
  uint64_t v37 = sub_22E0F7610();
  char v38 = v76;
  uint64_t v39 = v71;
  char v40 = v57;
  v76[30] = v37;
  v38[31] = v41;
  LOBYTE(v39) = *(unsigned char *)(v39 + 32);
  v38[35] = MEMORY[0x263F8D4F8];
  *((unsigned char *)v38 + 256) = v39 & v40;
  uint64_t v55 = v38 + 38;
  uint64_t v42 = sub_22E0F7610();
  uint64_t v43 = v76;
  v76[36] = v42;
  v43[37] = v44;
  uint64_t v56 = 0;
  uint64_t v45 = type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters();
  sub_22DE5A4C4((const void *)(v71 + *(int *)(v45 + 40)), v73);
  uint64_t v58 = sub_22E0F7100();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  if ((*(unsigned int (**)(char *, void))(v59 + 48))(v73, v57) == 1)
  {
    sub_22DE58794((uint64_t)v73);
    uint64_t v50 = v76;
    v76[38] = 0;
    v50[39] = 0;
    v50[40] = 0;
    v50[41] = 0;
  }
  else
  {
    uint64_t v46 = v55;
    v76[41] = v58;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v46);
    (*(void (**)(uint64_t *, char *, uint64_t))(v59 + 32))(boxed_opaque_existential_1, v73, v58);
  }
  uint64_t v48 = v75;
  sub_22DE04404();
  v54[1] = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFEB8);
  return sub_22E0F7C10();
}

uint64_t type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters()
{
  uint64_t v1 = qword_2685C4160;
  if (!qword_2685C4160) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *sub_22E0EAB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, const void *a7@<X6>, uint64_t a8@<X8>)
{
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 16) = a3 & 1;
  *(unsigned char *)(a8 + 17) = a4 & 1;
  *(void *)(a8 + 24) = a5;
  *(unsigned char *)(a8 + 32) = a6 & 1;
  uint64_t v8 = type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters();
  return sub_22DED4390(a7, (void *)(a8 + *(int *)(v8 + 40)));
}

uint64_t sub_22E0EAB98(uint64_t a1, uint64_t a2)
{
  v3[9] = v2;
  v3[8] = a2;
  v3[7] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  v3[6] = 0;
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_22E0EABFC, 0);
}

uint64_t sub_22E0EABFC()
{
  uint64_t v4 = (void (*)(void *))v0[7];
  v0[4] = v0;
  v0[6] = sub_22DE8F97C();
  v4(v0 + 6);
  uint64_t v10 = sub_22E0F7610();
  uint64_t v7 = v1;
  v0[10] = v1;
  uint64_t v5 = v0[6];
  swift_retain();
  uint64_t v8 = sub_22E0E9100(v5);
  v0[11] = v8;
  swift_release();
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v6 + 96) = v2;
  *uint64_t v2 = *(void *)(v6 + 32);
  v2[1] = sub_22DE9BDC8;
  return v9(v10, v7, v8);
}

uint64_t sub_22E0EAD48(uint64_t a1, uint64_t a2)
{
  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_22E0EAE54, 0);
}

uint64_t sub_22E0EAE54()
{
  uint64_t v1 = (char *)v0[10];
  uint64_t v6 = v1;
  uint64_t v7 = (char *)v0[9];
  uint64_t v5 = (void (*)(char *))v0[6];
  v0[4] = v0;
  sub_22E0E9634(v1);
  v5(v6);
  uint64_t v12 = sub_22E0F7610();
  uint64_t v9 = v2;
  v0[11] = v2;
  sub_22E0EB2E4(v6, v7);
  uint64_t v10 = sub_22E0E9210();
  v0[12] = v10;
  sub_22E0EB4A4((uint64_t)v7);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v8 + 104) = v3;
  *uint64_t v3 = *(void *)(v8 + 32);
  v3[1] = sub_22E0EAFAC;
  return v11(v12, v9, v10);
}

uint64_t sub_22E0EAFAC(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[4] = *v2;
  v5[14] = a1;
  v5[15] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_22E0EB204;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_22E0EB140;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0EB140()
{
  uint64_t v1 = v0[10];
  v0[4] = v0;
  sub_22E0EB4A4(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0[4] + 8);
  uint64_t v3 = v0[14];
  return v2(v3);
}

uint64_t sub_22E0EB204()
{
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0EB4A4(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 32) + 8);
  return v1();
}

char *sub_22E0EB2E4(char *a1, char *a2)
{
  uint64_t v4 = *(void *)a1;
  swift_retain();
  *(void *)a2 = v4;
  uint64_t v5 = *((void *)a1 + 1);
  swift_retain();
  *((void *)a2 + 1) = v5;
  uint64_t v7 = *((void *)a1 + 2);
  swift_retain();
  *((void *)a2 + 2) = v7;
  uint64_t v8 = *(int *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters() + 28);
  uint64_t v10 = sub_22E0F7100();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(&a1[v8], 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a2[v8], &a1[v8], *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 16))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(&a2[v8], 0, 1, v10);
  }
  return a2;
}

uint64_t sub_22E0EB4A4(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(int *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters() + 28);
  uint64_t v4 = sub_22E0F7100();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1 + v2, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1 + v2, v4);
  }
  return a1;
}

uint64_t sub_22E0EB59C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 64) = v3;
  *(void *)(v4 + 56) = a3;
  *(void *)(v4 + 48) = a2;
  *(unsigned char *)(v4 + 137) = a1 & 1;
  *(void *)(v4 + 32) = v4;
  *(unsigned char *)(v4 + 136) = 0;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  *(void *)(v4 + 72) = swift_task_alloc();
  type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters();
  *(void *)(v4 + 80) = swift_task_alloc();
  *(void *)(v4 + 88) = swift_task_alloc();
  *(unsigned char *)(v4 + 136) = a1 & 1;
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270FA2498](sub_22E0EB718, 0);
}

uint64_t sub_22E0EB718()
{
  uint64_t v8 = *(uint64_t **)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v6 = *(const void **)(v0 + 72);
  uint64_t v7 = *(void (**)(uint64_t *))(v0 + 48);
  char v5 = *(unsigned char *)(v0 + 137);
  *(void *)(v0 + 32) = v0;
  uint64_t v1 = sub_22E0F7100();
  (*(void (**)(const void *, uint64_t))(*(void *)(v1 - 8) + 56))(v6, 1);
  sub_22E0E9B88(0, 0, 0, v5 & 1, v6, (uint64_t)v8);
  v7(v8);
  uint64_t v14 = sub_22E0F7610();
  uint64_t v11 = v2;
  *(void *)(v0 + 96) = v2;
  sub_22E0EBC48(v8, v9);
  uint64_t v12 = sub_22E0E9724();
  *(void *)(v0 + 104) = v12;
  sub_22E0EBE14(v9);
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v10 + 112) = v3;
  *uint64_t v3 = *(void *)(v10 + 32);
  v3[1] = sub_22E0EB8E8;
  return v13(v14, v11, v12);
}

uint64_t sub_22E0EB8E8(uint64_t a1)
{
  char v5 = (void *)*v2;
  v5[4] = *v2;
  v5[15] = a1;
  v5[16] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_22E0EBB54;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_22E0EBA7C;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0EBA7C()
{
  uint64_t v1 = v0[11];
  v0[4] = v0;
  sub_22E0EBE14(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0[4] + 8);
  uint64_t v3 = v0[15];
  return v2(v3);
}

uint64_t sub_22E0EBB54()
{
  uint64_t v3 = *(void *)(v0 + 88);
  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0EBE14(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 32) + 8);
  return v1();
}

uint64_t sub_22E0EBC48(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  *(void *)a2 = v4;
  uint64_t v5 = a1[1];
  swift_retain();
  *(void *)(a2 + 8) = v5;
  uint64_t v6 = a1[2];
  swift_retain();
  *(void *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 24) = *((unsigned char *)a1 + 24);
  uint64_t v8 = *(int *)(type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters() + 32);
  uint64_t v10 = sub_22E0F7100();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 48))((uint64_t)a1 + v8, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy((void *)(a2 + v8), (char *)a1 + v8, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 16))();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(a2 + v8, 0, 1, v10);
  }
  return a2;
}

uint64_t sub_22E0EBE14(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(int *)(type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters() + 32);
  uint64_t v4 = sub_22E0F7100();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1 + v2, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1 + v2, v4);
  }
  return a1;
}

uint64_t sub_22E0EBF0C(uint64_t a1, uint64_t a2)
{
  v3[11] = v2;
  v3[10] = a2;
  v3[9] = a1;
  v3[7] = v3;
  v3[5] = 0;
  v3[6] = 0;
  v3[8] = 0;
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = 0;
  v3[5] = a1;
  v3[6] = a2;
  v3[8] = v2;
  return MEMORY[0x270FA2498](sub_22E0EBF78, 0);
}

uint64_t sub_22E0EBF78()
{
  uint64_t v6 = (void (*)(void *))v0[9];
  v0[7] = v0;
  v0[2] = sub_22E0E9E2C();
  v0[3] = v1;
  v0[4] = v2;
  v6(v0 + 2);
  uint64_t v14 = sub_22E0F7610();
  uint64_t v11 = v3;
  v0[12] = v3;
  uint64_t v7 = v0[2];
  uint64_t v8 = v0[3];
  uint64_t v9 = v0[4];
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_22E0E9BE4(v7, v8, v9);
  v0[13] = v12;
  swift_release();
  swift_release();
  swift_release();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v10 + 112) = v4;
  *uint64_t v4 = *(void *)(v10 + 56);
  v4[1] = sub_22E0EC104;
  return v13(v14, v11, v12);
}

uint64_t sub_22E0EC104(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[7] = *v2;
  v5[15] = a1;
  v5[16] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_22E0EC33C;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_22E0EC298;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0EC298()
{
  *(void *)(v0 + 56) = v0;
  sub_22E0EC3F8();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 56) + 8);
  uint64_t v2 = *(void *)(v4 + 120);
  return v1(v2);
}

uint64_t sub_22E0EC33C()
{
  *(void *)(v0 + 56) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0EC3F8();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v3 + 56) + 8);
  return v1();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22E0EC3F8()
{
}

uint64_t sub_22E0EC43C(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 80) = v4;
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 64) = a3;
  *(unsigned char *)(v5 + 43) = a2 & 1;
  *(unsigned char *)(v5 + 42) = a1 & 1;
  *(void *)(v5 + 48) = v5;
  *(unsigned char *)(v5 + 128) = 0;
  *(unsigned char *)(v5 + 136) = 0;
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  *(void *)(v5 + 56) = 0;
  *(void *)(v5 + 32) = 0;
  *(_WORD *)(v5 + 40) = 0;
  *(unsigned char *)(v5 + 128) = a1 & 1;
  *(unsigned char *)(v5 + 136) = a2 & 1;
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 56) = v4;
  return MEMORY[0x270FA2498](sub_22E0EC4F0, 0);
}

uint64_t sub_22E0EC4F0()
{
  uint64_t v7 = *(void (**)(uint64_t))(v0 + 64);
  *(void *)(v0 + 48) = v0;
  sub_22E0EA054();
  *(void *)(v0 + 32) = v1;
  *(unsigned char *)(v0 + 40) = v2 & 1;
  *(unsigned char *)(v0 + 41) = v3 & 1;
  v7(v0 + 32);
  uint64_t v15 = sub_22E0F7610();
  uint64_t v12 = v4;
  *(void *)(v0 + 88) = v4;
  uint64_t v10 = *(void *)(v0 + 32);
  char v8 = *(unsigned char *)(v0 + 40);
  char v9 = *(unsigned char *)(v0 + 41);
  swift_retain();
  LOBYTE(v16) = v8 & 1;
  HIBYTE(v16) = v9 & 1;
  uint64_t v13 = sub_22E0E9E7C(v10, v16);
  *(void *)(v0 + 96) = v13;
  swift_release();
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v11 + 104) = v5;
  *uint64_t v5 = *(void *)(v11 + 48);
  v5[1] = sub_22E0EC6BC;
  return v14(v15, v12, v13);
}

uint64_t sub_22E0EC6BC(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[6] = *v2;
  v5[14] = a1;
  v5[15] = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v3 = sub_22E0EC8FC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v3 = sub_22E0EC850;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0EC850()
{
  *(void *)(v0 + 48) = v0;
  sub_22DE58A00();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 48) + 8);
  uint64_t v2 = *(void *)(v4 + 112);
  return v1(v2);
}

uint64_t sub_22E0EC8FC()
{
  *(void *)(v0 + 48) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22DE58A00();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v3 + 48) + 8);
  return v1();
}

uint64_t sub_22E0EC9C0(uint64_t a1, uint64_t a2)
{
  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return MEMORY[0x270FA2498](sub_22E0ECACC, 0);
}

uint64_t sub_22E0ECACC()
{
  uint64_t v1 = (char *)v0[10];
  uint64_t v6 = (uint64_t *)v1;
  uint64_t v7 = (char *)v0[9];
  uint64_t v5 = (void (*)(uint64_t *))v0[6];
  v0[4] = v0;
  sub_22E0EA4A4(v1);
  v5(v6);
  uint64_t v12 = sub_22E0F7610();
  uint64_t v9 = v2;
  v0[11] = v2;
  sub_22E0ECF5C(v6, v7);
  uint64_t v10 = sub_22E0EA080();
  v0[12] = v10;
  sub_22E0ED410((uint64_t)v7);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v8 + 104) = v3;
  *uint64_t v3 = *(void *)(v8 + 32);
  v3[1] = sub_22E0ECC24;
  return v11(v12, v9, v10);
}

uint64_t sub_22E0ECC24(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[4] = *v2;
  v5[14] = a1;
  v5[15] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_22E0ECE7C;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_22E0ECDB8;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0ECDB8()
{
  uint64_t v1 = v0[10];
  v0[4] = v0;
  sub_22E0ED410(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0[4] + 8);
  uint64_t v3 = v0[14];
  return v2(v3);
}

uint64_t sub_22E0ECE7C()
{
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0ED410(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 32) + 8);
  return v1();
}

char *sub_22E0ECF5C(uint64_t *a1, char *a2)
{
  uint64_t v13 = *a1;
  swift_retain();
  *(void *)a2 = v13;
  uint64_t v14 = a1[1];
  swift_retain();
  *((void *)a2 + 1) = v14;
  uint64_t v16 = a1[2];
  swift_retain();
  *((void *)a2 + 2) = v16;
  uint64_t v17 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  uint64_t v18 = v17[7];
  uint64_t v20 = sub_22E0F7100();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned int (**)(void))(v21 + 48);
  if (((unsigned int (*)(char *, uint64_t))v22)((char *)a1 + v18, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a2[v18], (char *)a1 + v18, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v21 + 16))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(&a2[v18], 0, 1, v20);
  }
  uint64_t __dst = &a2[v17[8]];
  __src = (char *)a1 + v17[8];
  if (v22())
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(__dst, __src, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(__dst, __src, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
  }
  uint64_t v9 = &a2[v17[9]];
  uint64_t v10 = (char *)a1 + v17[9];
  if (v22())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v9, v10, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v9, v10, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v9, 0, 1, v20);
  }
  uint64_t v7 = &a2[v17[10]];
  uint64_t v8 = (char *)a1 + v17[10];
  if (v22())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v7, v8, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v7, v8, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v7, 0, 1, v20);
  }
  return a2;
}

uint64_t sub_22E0ED410(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  uint64_t v6 = v5[7];
  uint64_t v8 = sub_22E0F7100();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(void))(v9 + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v10)(a1 + v6, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1 + v6, v8);
  }
  uint64_t v4 = a1 + v5[8];
  if (!v10()) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
  }
  uint64_t v3 = a1 + v5[9];
  if (!v10()) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v8);
  }
  uint64_t v2 = a1 + v5[10];
  if (!v10()) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
  }
  return a1;
}

uint64_t sub_22E0ED670(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 64) = v5;
  *(void *)(v6 + 56) = a5;
  *(void *)(v6 + 48) = a4;
  *(unsigned char *)(v6 + 139) = a3 & 1;
  *(unsigned char *)(v6 + 138) = a2 & 1;
  *(unsigned char *)(v6 + 137) = a1 & 1;
  *(void *)(v6 + 32) = v6;
  *(unsigned char *)(v6 + 136) = 0;
  *(unsigned char *)(v6 + 144) = 0;
  *(unsigned char *)(v6 + 152) = 0;
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
  *(void *)(v6 + 72) = swift_task_alloc();
  type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters();
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(unsigned char *)(v6 + 136) = a1 & 1;
  *(unsigned char *)(v6 + 144) = a2 & 1;
  *(unsigned char *)(v6 + 152) = a3 & 1;
  *(void *)(v6 + 16) = a4;
  *(void *)(v6 + 24) = a5;
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x270FA2498](sub_22E0ED84C, 0);
}

uint64_t sub_22E0ED84C()
{
  uint64_t v10 = *(uint64_t **)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 80);
  uint64_t v8 = *(const void **)(v0 + 72);
  uint64_t v9 = *(void (**)(uint64_t *))(v0 + 48);
  char v7 = *(unsigned char *)(v0 + 139);
  char v6 = *(unsigned char *)(v0 + 138);
  char v5 = *(unsigned char *)(v0 + 137);
  *(void *)(v0 + 32) = v0;
  uint64_t v1 = sub_22E0F7100();
  (*(void (**)(const void *, uint64_t))(*(void *)(v1 - 8) + 56))(v8, 1);
  sub_22E0EAB28(0, 0, v5 & 1, v6 & 1, 0, v7 & 1, v8, (uint64_t)v10);
  v9(v10);
  uint64_t v16 = sub_22E0F7610();
  uint64_t v13 = v2;
  *(void *)(v0 + 96) = v2;
  sub_22E0EDDB4(v10, v11);
  uint64_t v14 = sub_22E0EA638();
  *(void *)(v0 + 104) = v14;
  sub_22E0EDF90(v11);
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x263F6D050] + (int)*MEMORY[0x263F6D050]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v12 + 112) = v3;
  *uint64_t v3 = *(void *)(v12 + 32);
  v3[1] = sub_22E0EDA44;
  return v15(v16, v13, v14);
}

uint64_t sub_22E0EDA44(uint64_t a1)
{
  char v5 = (void *)*v2;
  v5[4] = *v2;
  v5[15] = a1;
  v5[16] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_22E0EDCB8;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_22E0EDBD8;
  }
  return MEMORY[0x270FA2498](v3, 0);
}

uint64_t sub_22E0EDBD8()
{
  uint64_t v1 = v0[11];
  v0[4] = v0;
  sub_22E0EDF90(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0[4] + 8);
  uint64_t v3 = v0[15];
  return v2(v3);
}

uint64_t sub_22E0EDCB8()
{
  uint64_t v3 = *(void *)(v0 + 88);
  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0EDF90(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v0 + 32) + 8);
  return v1();
}

uint64_t sub_22E0EDDB4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  *(void *)a2 = v4;
  uint64_t v5 = a1[1];
  swift_retain();
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = *((unsigned char *)a1 + 16);
  *(unsigned char *)(a2 + 17) = *((unsigned char *)a1 + 17);
  uint64_t v6 = a1[3];
  swift_retain();
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  uint64_t v8 = *(int *)(type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters() + 40);
  uint64_t v10 = sub_22E0F7100();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 48))((uint64_t)a1 + v8, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy((void *)(a2 + v8), (char *)a1 + v8, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 16))();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(a2 + v8, 0, 1, v10);
  }
  return a2;
}

uint64_t sub_22E0EDF90(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(int *)(type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters() + 40);
  uint64_t v4 = sub_22E0F7100();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1 + v2, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1 + v2, v4);
  }
  return a1;
}

uint64_t sub_22E0EE088(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_22E0EE0E4(a1, a2, a3);
}

uint64_t sub_22E0EE0E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  id v19 = a3;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = sub_22E0F7260();
  uint64_t v20 = *(void *)(v23 - 8);
  uint64_t v21 = v23 - 8;
  unint64_t v15 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v23, v4, v5, v6);
  uint64_t v17 = (char *)&v14 - v15;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFED0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24, v7, v19, v8);
  uint64_t v18 = (char *)&v14 - v16;
  uint64_t v28 = v9;
  uint64_t v27 = v10;
  uint64_t v26 = v11;
  uint64_t v29 = v3;
  sub_22DE0F54C(v9, (char *)&v14 - v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v22, v23);
  id v12 = v19;
  uint64_t v25 = sub_22E0F7010();
  swift_retain();
  uint64_t v29 = v25;

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v23);
  sub_22DE0F674(v24);
  swift_release();
  return v25;
}

uint64_t sub_22E0EE2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E0EAB98(a1, a2);
}

uint64_t sub_22E0EE370(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E0EAD48(a1, a2);
}

uint64_t sub_22E0EE430(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = *(void *)(v3 + 16);
  v4[1] = sub_22DEA7CDC;
  return sub_22E0EB59C(a1 & 1, a2, a3);
}

uint64_t sub_22E0EE4FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E0EBF0C(a1, a2);
}

uint64_t sub_22E0EE5BC(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = *(void *)(v4 + 16);
  v5[1] = sub_22DEA7CDC;
  return sub_22E0EC43C(a1 & 1, a2 & 1, a3, a4);
}

uint64_t sub_22E0EE694(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = sub_22DEA7CDC;
  return sub_22E0EC9C0(a1, a2);
}

uint64_t sub_22E0EE754(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v6;
  *uint64_t v6 = *(void *)(v5 + 16);
  v6[1] = sub_22DEA7CDC;
  return sub_22E0ED670(a1 & 1, a2 & 1, a3 & 1, a4, a5);
}

void *type metadata accessor for SetNumericSettingIntentCATPatternsIdentifiers()
{
  return &unk_26E1E2218;
}

void *type metadata accessor for SetNumericSettingIntentConfirmMaximumVolumeParameters()
{
  return &unk_26E1E2290;
}

uint64_t sub_22E0EE860()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E0EE888(char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    int v7 = -1;
    if (*(void *)a1 < 0x100000000uLL) {
      int v7 = *(void *)a1;
    }
    int v3 = v7 - 1;
    if (v7 - 1 < 0) {
      int v3 = -1;
    }
    return (v3 + 1);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a2 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
      return (*(unsigned int (**)(char *, void, uint64_t))(*(void *)(v5 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v5);
    }
    else {
      __break(1u);
    }
  }
  return v6;
}

uint64_t sub_22E0EE9C8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22E0EE9F0(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  if (a3 == 2147483646)
  {
    *(void *)uint64_t result = a2;
  }
  else
  {
    uint64_t result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a3 == *(_DWORD *)(*((void *)result - 1) + 84)) {
      return (char *)(*(uint64_t (**)(char *, void, void, char *))(*((void *)result - 1) + 56))(&v4[*(int *)(a4 + 28)], a2, a2, result);
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22E0EEAF0()
{
  uint64_t v2 = sub_22DEADEF8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t sub_22E0EEBE0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v17 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v17 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    swift_retain();
    *(void *)a1 = v12;
    return *(void *)a1 + ((v17 + 16) & ~(unint64_t)v17);
  }
  else
  {
    uint64_t v5 = *a2;
    swift_retain();
    *(void *)a1 = v5;
    uint64_t v6 = a2[1];
    swift_retain();
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[2];
    swift_retain();
    *(void *)(a1 + 16) = v7;
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t __dst = (void *)(a1 + *(int *)(a3 + 32));
    __src = (char *)a2 + *(int *)(a3 + 32);
    uint64_t v10 = sub_22E0F7100();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(__src, 1))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(__dst, __src, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(__dst, __src, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    return a1;
  }
}

uint64_t sub_22E0EEE10(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = *(int *)(a2 + 32);
  uint64_t v6 = sub_22E0F7100();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 48))(a1 + v4, 1);
  if (!result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1 + v4, v6);
  }
  return result;
}

uint64_t sub_22E0EEEFC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  swift_retain();
  *(void *)a1 = v5;
  uint64_t v6 = a2[1];
  swift_retain();
  *(void *)(a1 + 8) = v6;
  uint64_t v8 = a2[2];
  swift_retain();
  *(void *)(a1 + 16) = v8;
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v12 = sub_22E0F7100();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v13 + 48))((uint64_t)a2 + v10, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy((void *)(a1 + v10), (char *)a2 + v10, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v13 + 16))();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(a1 + v10, 0, 1, v12);
  }
  return a1;
}

uint64_t sub_22E0EF0C0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  swift_retain();
  *(void *)a1 = v6;
  swift_release();
  uint64_t v7 = a2[1];
  swift_retain();
  *(void *)(a1 + 8) = v7;
  swift_release();
  uint64_t v8 = a2[2];
  swift_retain();
  *(void *)(a1 + 16) = v8;
  swift_release();
  *(unsigned char *)(a1 + 24) = a2[3] & 1;
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v13 = sub_22E0F7100();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t))v15)(a1 + v11, 1))
  {
    if (v15((char *)a2 + v11, 1, v13))
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy((void *)(a1 + v11), (char *)a2 + v11, *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v14 + 16))();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(a1 + v11, 0, 1, v13);
    }
  }
  else if (v15((char *)a2 + v11, 1, v13))
  {
    (*(void (**)(void))(v14 + 8))();
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy((void *)(a1 + v11), (char *)a2 + v11, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(a1 + v11, (uint64_t)a2 + v11, v13);
  }
  return a1;
}

uint64_t sub_22E0EF408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v8 = sub_22E0F7100();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v9 + 48))(a2 + v6, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy((void *)(a1 + v6), (const void *)(a2 + v6), *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v9 + 32))();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(a1 + v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_22E0EF588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24) & 1;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v10 = sub_22E0F7100();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t))v12)(a1 + v8, 1))
  {
    if (v12(a2 + v8, 1, v10))
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy((void *)(a1 + v8), (const void *)(a2 + v8), *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v11 + 32))();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(a1 + v8, 0, 1, v10);
    }
  }
  else if (v12(a2 + v8, 1, v10))
  {
    (*(void (**)(void))(v11 + 8))();
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy((void *)(a1 + v8), (const void *)(a2 + v8), *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(a1 + v8, a2 + v8, v10);
  }
  return a1;
}

uint64_t sub_22E0EF88C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E0EF8B4(char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    int v7 = -1;
    if (*(void *)a1 < 0x100000000uLL) {
      int v7 = *(void *)a1;
    }
    int v3 = v7 - 1;
    if (v7 - 1 < 0) {
      int v3 = -1;
    }
    return (v3 + 1);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a2 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
      return (*(unsigned int (**)(char *, void, uint64_t))(*(void *)(v5 - 8) + 48))(&a1[*(int *)(a3 + 32)], a2, v5);
    }
    else {
      __break(1u);
    }
  }
  return v6;
}

uint64_t sub_22E0EF9F4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22E0EFA1C(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  if (a3 == 2147483646)
  {
    *(void *)uint64_t result = a2;
  }
  else
  {
    uint64_t result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a3 == *(_DWORD *)(*((void *)result - 1) + 84)) {
      return (char *)(*(uint64_t (**)(char *, void, void, char *))(*((void *)result - 1) + 56))(&v4[*(int *)(a4 + 32)], a2, a2, result);
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22E0EFB1C()
{
  uint64_t v2 = sub_22DEADEF8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void *sub_22E0EFC18(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_retain();
  *a1 = v3;
  uint64_t v4 = a2[1];
  swift_retain();
  a1[1] = v4;
  uint64_t v7 = a2[2];
  swift_retain();
  uint64_t result = a1;
  a1[2] = v7;
  return result;
}

uint64_t sub_22E0EFC8C()
{
  return swift_release();
}

void *sub_22E0EFCCC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_retain();
  *a1 = v3;
  swift_release();
  uint64_t v4 = a2[1];
  swift_retain();
  a1[1] = v4;
  swift_release();
  uint64_t v6 = a2[2];
  swift_retain();
  a1[2] = v6;
  swift_release();
  return a1;
}

void *sub_22E0EFD7C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_22E0EFDE8(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24))
    {
      int v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (!HIDWORD(*(void *)a1)) {
        int v4 = *(void *)a1;
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_22E0EFF18(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

void *type metadata accessor for SetNumericSettingIntentUnspecifiedActionForSupportedNumericSettingParameters()
{
  return &unk_26E1E2310;
}

uint64_t sub_22E0F0134(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  uint64_t result = a1;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(unsigned char *)(a1 + 9) = *((unsigned char *)a2 + 9);
  return result;
}

uint64_t sub_22E0F0184(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_retain();
  *(void *)a1 = v3;
  swift_release();
  uint64_t result = a1;
  *(unsigned char *)(a1 + 8) = a2[1] & 1;
  *(unsigned char *)(a1 + 9) = *((unsigned char *)a2 + 9) & 1;
  return result;
}

uint64_t sub_22E0F01F4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t result = a1;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8) & 1;
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9) & 1;
  return result;
}

uint64_t sub_22E0F0250(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFE && *(unsigned char *)(a1 + 10))
    {
      int v5 = *(void *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (*(void *)a1 < 0x100000000uLL) {
        int v4 = *(void *)a1;
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

void *sub_22E0F03CC(void *result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = result;
  int v4 = (char *)result + 10;
  if (a2 > 0x7FFFFFFE)
  {
    uint64_t result = 0;
    *((_WORD *)v3 + 4) = 0;
    *uint64_t v3 = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *int v4 = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *int v4 = 0;
    }
    if (a2) {
      *uint64_t result = a2;
    }
  }
  return result;
}

void *type metadata accessor for SetNumericSettingIntentConfirmDisableSmartVolumeParameters()
{
  return &unk_26E1E2398;
}

unint64_t sub_22E0F059C(void *a1, uint64_t *a2, int *a3)
{
  int v27 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v27 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    swift_retain();
    *a1 = v22;
    return *a1 + ((v27 + 16) & ~(unint64_t)v27);
  }
  else
  {
    uint64_t v14 = *a2;
    swift_retain();
    *a1 = v14;
    uint64_t v15 = a2[1];
    swift_retain();
    a1[1] = v15;
    uint64_t v16 = a2[2];
    swift_retain();
    a1[2] = v16;
    uint64_t __dst = (char *)a1 + a3[7];
    __src = (char *)a2 + a3[7];
    uint64_t v19 = sub_22E0F7100();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned int (**)(void))(v20 + 48);
    if (((unsigned int (*)(char *, uint64_t))v21)(__src, 1))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(__dst, __src, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(__dst, __src, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    uint64_t v12 = (char *)a1 + a3[8];
    uint64_t v13 = (char *)a2 + a3[8];
    if (v21())
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v12, v13, *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v12, v13, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v19);
    }
    uint64_t v10 = (char *)a1 + a3[9];
    uint64_t v11 = (char *)a2 + a3[9];
    if (v21())
    {
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v10, v11, *(void *)(*(void *)(v5 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v10, v11, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v10, 0, 1, v19);
    }
    uint64_t v8 = (char *)a1 + a3[10];
    uint64_t v9 = (char *)a2 + a3[10];
    if (v21())
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v8, v9, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v8, v9, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v8, 0, 1, v19);
    }
    return (unint64_t)a1;
  }
}

uint64_t sub_22E0F0AB4(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = a2[7];
  uint64_t v9 = sub_22E0F7100();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(void))(v10 + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v11)(a1 + v7, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1 + v7, v9);
  }
  uint64_t v5 = a1 + a2[8];
  if (!v11()) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v5, v9);
  }
  uint64_t v4 = a1 + a2[9];
  if (!v11()) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v9);
  }
  uint64_t v3 = a1 + a2[10];
  uint64_t result = ((uint64_t (*)(void))v11)();
  if (!result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v3, v9);
  }
  return result;
}

char *sub_22E0F0D04(char *a1, uint64_t *a2, int *a3)
{
  uint64_t v14 = *a2;
  swift_retain();
  *(void *)a1 = v14;
  uint64_t v15 = a2[1];
  swift_retain();
  *((void *)a1 + 1) = v15;
  uint64_t v17 = a2[2];
  swift_retain();
  *((void *)a1 + 2) = v17;
  uint64_t v19 = a3[7];
  uint64_t v21 = sub_22E0F7100();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(void))(v22 + 48);
  if (((unsigned int (*)(char *, uint64_t))v23)((char *)a2 + v19, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a1[v19], (char *)a2 + v19, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v22 + 16))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(&a1[v19], 0, 1, v21);
  }
  uint64_t __dst = &a1[a3[8]];
  __src = (char *)a2 + a3[8];
  if (v23())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(__dst, __src, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, __src, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
  }
  uint64_t v10 = &a1[a3[9]];
  uint64_t v11 = (char *)a2 + a3[9];
  if (v23())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v10, v11, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v10, v11, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v10, 0, 1, v21);
  }
  uint64_t v8 = &a1[a3[10]];
  uint64_t v9 = (char *)a2 + a3[10];
  if (v23())
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v8, v9, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v8, v9, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v8, 0, 1, v21);
  }
  return a1;
}

char *sub_22E0F11AC(char *a1, char *a2, int *a3)
{
  uint64_t v18 = *(void *)a2;
  swift_retain();
  *(void *)a1 = v18;
  swift_release();
  uint64_t v19 = *((void *)a2 + 1);
  swift_retain();
  *((void *)a1 + 1) = v19;
  swift_release();
  uint64_t v21 = *((void *)a2 + 2);
  swift_retain();
  *((void *)a1 + 2) = v21;
  swift_release();
  uint64_t v23 = a3[7];
  uint64_t v25 = sub_22E0F7100();
  uint64_t v26 = *(void *)(v25 - 8);
  int v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (((unsigned int (*)(char *, uint64_t))v27)(&a1[v23], 1))
  {
    if (v27(&a2[v23], 1, v25))
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(&a1[v23], &a2[v23], *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v26 + 16))();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(&a1[v23], 0, 1, v25);
    }
  }
  else if (v27(&a2[v23], 1, v25))
  {
    (*(void (**)(void))(v26 + 8))();
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a1[v23], &a2[v23], *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(&a1[v23], &a2[v23], v25);
  }
  uint64_t v16 = &a1[a3[8]];
  __src = &a2[a3[8]];
  if (((unsigned int (*)(void))v27)())
  {
    if (v27(__src, 1, v25))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v16, __src, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v16, __src, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v16, 0, 1, v25);
    }
  }
  else if (v27(__src, 1, v25))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v25);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v16, __src, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v16, __src, v25);
  }
  uint64_t v14 = &a1[a3[9]];
  uint64_t v15 = &a2[a3[9]];
  if (((unsigned int (*)(void))v27)())
  {
    if (v27(v15, 1, v25))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v14, v15, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v14, v15, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v14, 0, 1, v25);
    }
  }
  else if (v27(v15, 1, v25))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v25);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v14, v15, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v14, v15, v25);
  }
  uint64_t v12 = &a1[a3[10]];
  uint64_t v13 = &a2[a3[10]];
  if (((unsigned int (*)(void))v27)())
  {
    if (v27(v13, 1, v25))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v12, v13, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v12, v13, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v12, 0, 1, v25);
    }
  }
  else if (v27(v13, 1, v25))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v25);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v12, v13, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v12, v13, v25);
  }
  return a1;
}

char *sub_22E0F1AC0(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  *((void *)a1 + 2) = a2[2];
  uint64_t v16 = a3[7];
  uint64_t v18 = sub_22E0F7100();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(void))(v19 + 48);
  if (((unsigned int (*)(char *, uint64_t))v20)((char *)a2 + v16, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a1[v16], (char *)a2 + v16, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v19 + 32))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(&a1[v16], 0, 1, v18);
  }
  uint64_t __dst = &a1[a3[8]];
  __src = (char *)a2 + a3[8];
  if (v20())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(__dst, __src, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(__dst, __src, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  uint64_t v10 = &a1[a3[9]];
  uint64_t v11 = (char *)a2 + a3[9];
  if (v20())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v10, v11, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v10, v11, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  }
  uint64_t v8 = &a1[a3[10]];
  uint64_t v9 = (char *)a2 + a3[10];
  if (v20())
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v8, v9, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v8, v9, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v8, 0, 1, v18);
  }
  return a1;
}

char *sub_22E0F1F2C(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_release();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  swift_release();
  uint64_t v20 = a3[7];
  uint64_t v22 = sub_22E0F7100();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  if (((unsigned int (*)(char *, uint64_t))v24)(&a1[v20], 1))
  {
    if (v24(&a2[v20], 1, v22))
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(&a1[v20], &a2[v20], *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v23 + 32))();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(&a1[v20], 0, 1, v22);
    }
  }
  else if (v24(&a2[v20], 1, v22))
  {
    (*(void (**)(void))(v23 + 8))();
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a1[v20], &a2[v20], *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(&a1[v20], &a2[v20], v22);
  }
  uint64_t v16 = &a1[a3[8]];
  __src = &a2[a3[8]];
  if (((unsigned int (*)(void))v24)())
  {
    if (v24(__src, 1, v22))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v16, __src, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v16, __src, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v16, 0, 1, v22);
    }
  }
  else if (v24(__src, 1, v22))
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v22);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v16, __src, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v16, __src, v22);
  }
  uint64_t v14 = &a1[a3[9]];
  uint64_t v15 = &a2[a3[9]];
  if (((unsigned int (*)(void))v24)())
  {
    if (v24(v15, 1, v22))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v14, v15, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v14, v15, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v14, 0, 1, v22);
    }
  }
  else if (v24(v15, 1, v22))
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v22);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v14, v15, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v14, v15, v22);
  }
  uint64_t v12 = &a1[a3[10]];
  uint64_t v13 = &a2[a3[10]];
  if (((unsigned int (*)(void))v24)())
  {
    if (v24(v13, 1, v22))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
      memcpy(v12, v13, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v12, v13, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v12, 0, 1, v22);
    }
  }
  else if (v24(v13, 1, v22))
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v22);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v12, v13, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v12, v13, v22);
  }
  return a1;
}

uint64_t sub_22E0F27FC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E0F2824(char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    int v7 = -1;
    if (*(void *)a1 < 0x100000000uLL) {
      int v7 = *(void *)a1;
    }
    int v3 = v7 - 1;
    if (v7 - 1 < 0) {
      int v3 = -1;
    }
    return (v3 + 1);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a2 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
      return (*(unsigned int (**)(char *, void, uint64_t))(*(void *)(v5 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v5);
    }
    else {
      __break(1u);
    }
  }
  return v6;
}

uint64_t sub_22E0F2964()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22E0F298C(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  if (a3 == 2147483646)
  {
    *(void *)uint64_t result = a2;
  }
  else
  {
    uint64_t result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a3 == *(_DWORD *)(*((void *)result - 1) + 84)) {
      return (char *)(*(uint64_t (**)(char *, void, void, char *))(*((void *)result - 1) + 56))(&v4[*(int *)(a4 + 28)], a2, a2, result);
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22E0F2A8C()
{
  uint64_t v2 = sub_22DEADEF8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_22E0F2BA0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22E0F2BC8(char *a1, unsigned int a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    int v7 = -1;
    if (*(void *)a1 < 0x100000000uLL) {
      int v7 = *(void *)a1;
    }
    int v3 = v7 - 1;
    if (v7 - 1 < 0) {
      int v3 = -1;
    }
    return (v3 + 1);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a2 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
      return (*(unsigned int (**)(char *, void, uint64_t))(*(void *)(v5 - 8) + 48))(&a1[*(int *)(a3 + 40)], a2, v5);
    }
    else {
      __break(1u);
    }
  }
  return v6;
}

uint64_t sub_22E0F2D08()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22E0F2D30(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  if (a3 == 2147483646)
  {
    *(void *)uint64_t result = a2;
  }
  else
  {
    uint64_t result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    if (a3 == *(_DWORD *)(*((void *)result - 1) + 84)) {
      return (char *)(*(uint64_t (**)(char *, void, void, char *))(*((void *)result - 1) + 56))(&v4[*(int *)(a4 + 40)], a2, a2, result);
    }
    else {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22E0F2E30()
{
  uint64_t v2 = sub_22DEADEF8();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_22E0F2F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_22DED20F8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_22E0F3060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_22DED20F8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_22E0F3184(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = v5;
  uint64_t v12 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 24) + **(int **)(a5 + 24));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v6;
  *unsigned int v6 = *(void *)(v5 + 16);
  v6[1] = sub_22DED20F8;
  return v12(a1 & 1, a2, a3, a4, a5);
}

uint64_t sub_22E0F32B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_22DED20F8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_22E0F33D8(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = v6;
  uint64_t v14 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 40)
                                                                                   + **(int **)(a6 + 40));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v7;
  *uint64_t v7 = *(void *)(v6 + 16);
  v7[1] = sub_22DED20F8;
  return v14(a1 & 1, a2 & 1, a3, a4, a5, a6);
}

uint64_t sub_22E0F3514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 48) + **(int **)(a4 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *uint64_t v5 = *(void *)(v7 + 16);
  v5[1] = sub_22DED20F8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_22E0F3638(char a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 16) = v7;
  uint64_t v16 = (uint64_t (*)(void, void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 56)
                                                                                           + **(int **)(a7 + 56));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v8;
  *uint64_t v8 = *(void *)(v7 + 16);
  v8[1] = sub_22DED20F8;
  return v16(a1 & 1, a2 & 1, a3 & 1, a4, a5, a6, a7);
}

uint64_t type metadata accessor for SetNumericSettingIntentCATPatternsExecutor()
{
  uint64_t v1 = qword_2685C41A8;
  if (!qword_2685C41A8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_22E0F37F8()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_22E0F386C()
{
  return type metadata accessor for SetNumericSettingIntentCATPatternsExecutor();
}

unint64_t sub_22E0F3888()
{
  return sub_22E0F38A0();
}

unint64_t sub_22E0F38A0()
{
  uint64_t v2 = qword_2685C41B8;
  if (!qword_2685C41B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2685C41B8);
    return WitnessTable;
  }
  return v2;
}

char *sub_22E0F3920(void *a1, char *a2)
{
  *(void *)a2 = *a1;
  *((void *)a2 + 1) = a1[1];
  *((void *)a2 + 2) = a1[2];
  uint64_t v14 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  uint64_t v15 = v14[7];
  uint64_t v17 = sub_22E0F7100();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(void))(v18 + 48);
  if (((unsigned int (*)(char *, uint64_t))v19)((char *)a1 + v15, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a2[v15], (char *)a1 + v15, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v18 + 32))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(&a2[v15], 0, 1, v17);
  }
  uint64_t __dst = &a2[v14[8]];
  __src = (char *)a1 + v14[8];
  if (v19())
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(__dst, __src, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(__dst, __src, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
  }
  uint64_t v9 = &a2[v14[9]];
  uint64_t v10 = (char *)a1 + v14[9];
  if (v19())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v9, v10, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v9, v10, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v9, 0, 1, v17);
  }
  uint64_t v7 = &a2[v14[10]];
  uint64_t v8 = (char *)a1 + v14[10];
  if (v19())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(v7, v8, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v7, v8, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v7, 0, 1, v17);
  }
  return a2;
}

char *sub_22E0F3D9C(char *a1, char *a2)
{
  *(void *)a2 = *(void *)a1;
  *((void *)a2 + 1) = *((void *)a1 + 1);
  *((void *)a2 + 2) = *((void *)a1 + 2);
  uint64_t v5 = *(int *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters() + 28);
  uint64_t v7 = sub_22E0F7100();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 48))(&a1[v5], 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2685BFFA8);
    memcpy(&a2[v5], &a1[v5], *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v8 + 32))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(&a2[v5], 0, 1, v7);
  }
  return a2;
}

id sub_22E0F3F24()
{
  sub_22DFCE3E4();
  type metadata accessor for ResourceBundleClass();
  id result = sub_22DFCF4C0();
  qword_2685C41C0 = (uint64_t)result;
  return result;
}

uint64_t *sub_22E0F3F6C()
{
  if (qword_2685BF878 != -1) {
    swift_once();
  }
  return &qword_2685C41C0;
}

uint64_t sub_22E0F3FD0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7EC0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7EC0);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4060()
{
  if (qword_2685BF880 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7EC0);
}

uint64_t sub_22E0F40D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7ED8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7ED8);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4160()
{
  if (qword_2685BF888 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7ED8);
}

uint64_t sub_22E0F41D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7EF0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7EF0);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4260()
{
  if (qword_2685BF890 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7EF0);
}

uint64_t sub_22E0F42D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F08);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F08);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4360()
{
  if (qword_2685BF898 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F08);
}

uint64_t sub_22E0F43D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F20);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F20);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4460()
{
  if (qword_2685BF8A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F20);
}

uint64_t sub_22E0F44D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F38);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F38);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4560()
{
  if (qword_2685BF8A8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F38);
}

uint64_t sub_22E0F45D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F50);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F50);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4660()
{
  if (qword_2685BF8B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F50);
}

uint64_t sub_22E0F46D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F68);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F68);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4760()
{
  if (qword_2685BF8B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F68);
}

uint64_t sub_22E0F47D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F80);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F80);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4860()
{
  if (qword_2685BF8C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F80);
}

uint64_t sub_22E0F48D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7F98);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7F98);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4960()
{
  if (qword_2685BF8C8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7F98);
}

uint64_t sub_22E0F49D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7FB0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7FB0);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4A60()
{
  if (qword_2685BF8D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7FB0);
}

uint64_t sub_22E0F4AD0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7FC8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7FC8);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4B60()
{
  if (qword_2685BF8D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7FC8);
}

uint64_t sub_22E0F4BD0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7FE0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7FE0);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4C60()
{
  if (qword_2685BF8E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7FE0);
}

uint64_t sub_22E0F4CD0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D7FF8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D7FF8);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4D60()
{
  if (qword_2685BF8E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D7FF8);
}

uint64_t sub_22E0F4DD0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D8010);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D8010);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4E60()
{
  if (qword_2685BF8F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D8010);
}

uint64_t sub_22E0F4ED0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D8028);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D8028);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F4F60()
{
  if (qword_2685BF8F8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D8028);
}

uint64_t sub_22E0F4FD0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D8040);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D8040);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F5060()
{
  if (qword_2685BF900 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D8040);
}

uint64_t sub_22E0F50D0()
{
  uint64_t v2 = sub_22E0F72D0();
  __swift_allocate_value_buffer(v2, qword_2685D8058);
  __swift_project_value_buffer(v2, (uint64_t)qword_2685D8058);
  sub_22E0F7610();
  id v0 = (id)*sub_22E0F3F6C();
  return sub_22E0F72C0();
}

uint64_t sub_22E0F5160()
{
  if (qword_2685BF908 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22E0F72D0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2685D8058);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  if (qword_2685D6960 == -1)
  {
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2685D6960, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_2685D6954 > a2) {
    return 1;
  }
  return dword_2685D6954 >= a2 && dword_2685D6958 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_2685D6968 == -1)
  {
    if (qword_2685D6970) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_2685D6968, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2685D6970) {
      return _availability_version_check();
    }
  }
  if (qword_2685D6960 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_2685D6960, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_2685D6954 > a3) {
    return 1;
  }
  return dword_2685D6954 >= a3 && dword_2685D6958 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_2685D6970;
  if (qword_2685D6970) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_2685D6970 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        id result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          int v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x230F9CA80](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2685D6954, &dword_2685D6958);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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

uint64_t sub_22E0F57D0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_22E0F57E0()
{
  return MEMORY[0x270EEDE00]();
}

uint64_t sub_22E0F57F0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_22E0F5800()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_22E0F5810()
{
  return MEMORY[0x270EEDF10]();
}

uint64_t sub_22E0F5820()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_22E0F5830()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_22E0F5840()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_22E0F5850()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_22E0F5860()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_22E0F5870()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_22E0F5880()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_22E0F5890()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_22E0F58A0()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_22E0F58B0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22E0F58C0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22E0F58D0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_22E0F58E0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22E0F58F0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22E0F5900()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_22E0F5910()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22E0F5920()
{
  return MEMORY[0x270EEFF80]();
}

uint64_t sub_22E0F5930()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22E0F5940()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_22E0F5950()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22E0F5960()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_22E0F5970()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_22E0F5980()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_22E0F5990()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_22E0F59A0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22E0F59B0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22E0F59C0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22E0F59D0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22E0F59E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22E0F59F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22E0F5A00()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22E0F5A10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22E0F5A20()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_22E0F5A30()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_22E0F5A40()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22E0F5A50()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_22E0F5A60()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_22E0F5A70()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_22E0F5A80()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_22E0F5A90()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_22E0F5AA0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_22E0F5AB0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_22E0F5AC0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22E0F5AD0()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_22E0F5AE0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22E0F5AF0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_22E0F5B00()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_22E0F5B10()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_22E0F5B20()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_22E0F5B30()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_22E0F5B40()
{
  return MEMORY[0x270F73CA0]();
}

uint64_t sub_22E0F5B50()
{
  return MEMORY[0x270F73CB0]();
}

uint64_t sub_22E0F5B60()
{
  return MEMORY[0x270F73D00]();
}

uint64_t sub_22E0F5B70()
{
  return MEMORY[0x270F73E40]();
}

uint64_t sub_22E0F5B80()
{
  return MEMORY[0x270F73FF8]();
}

uint64_t sub_22E0F5B90()
{
  return MEMORY[0x270F74000]();
}

uint64_t sub_22E0F5BA0()
{
  return MEMORY[0x270F74128]();
}

uint64_t sub_22E0F5BB0()
{
  return MEMORY[0x270F75438]();
}

uint64_t sub_22E0F5BC0()
{
  return MEMORY[0x270F75450]();
}

uint64_t sub_22E0F5BD0()
{
  return MEMORY[0x270F75548]();
}

uint64_t sub_22E0F5BE0()
{
  return MEMORY[0x270F75570]();
}

uint64_t sub_22E0F5BF0()
{
  return MEMORY[0x270F755D0]();
}

uint64_t sub_22E0F5C00()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_22E0F5C20()
{
  return MEMORY[0x270F66360]();
}

uint64_t sub_22E0F5CF0()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_22E0F5D00()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_22E0F5D10()
{
  return MEMORY[0x270F66980]();
}

uint64_t sub_22E0F5D20()
{
  return MEMORY[0x270F66988]();
}

uint64_t sub_22E0F5D30()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_22E0F5D40()
{
  return MEMORY[0x270F66A88]();
}

uint64_t sub_22E0F5D50()
{
  return MEMORY[0x270F66A98]();
}

uint64_t sub_22E0F5D60()
{
  return MEMORY[0x270F66AF8]();
}

uint64_t sub_22E0F5D70()
{
  return MEMORY[0x270F66B48]();
}

uint64_t sub_22E0F5D80()
{
  return MEMORY[0x270F66B50]();
}

uint64_t sub_22E0F5D90()
{
  return MEMORY[0x270F66B58]();
}

uint64_t sub_22E0F5DA0()
{
  return MEMORY[0x270F66B90]();
}

uint64_t sub_22E0F5DB0()
{
  return MEMORY[0x270F66B98]();
}

uint64_t sub_22E0F5DC0()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_22E0F5DD0()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_22E0F5DE0()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_22E0F5E00()
{
  return MEMORY[0x270F66CD8]();
}

uint64_t sub_22E0F5E20()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_22E0F5E30()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_22E0F5E40()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_22E0F5E50()
{
  return MEMORY[0x270F66DC8]();
}

uint64_t sub_22E0F5E60()
{
  return MEMORY[0x270F66DD0]();
}

uint64_t sub_22E0F5E70()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_22E0F5E80()
{
  return MEMORY[0x270F66E38]();
}

uint64_t sub_22E0F5E90()
{
  return MEMORY[0x270F66F18]();
}

uint64_t sub_22E0F5EA0()
{
  return MEMORY[0x270F66F28]();
}

uint64_t sub_22E0F5EB0()
{
  return MEMORY[0x270F67008]();
}

uint64_t sub_22E0F5EC0()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_22E0F5ED0()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_22E0F5EE0()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_22E0F5EF0()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_22E0F5F00()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_22E0F5F10()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_22E0F5F20()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_22E0F5F30()
{
  return MEMORY[0x270F67198]();
}

uint64_t sub_22E0F5F40()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_22E0F5F50()
{
  return MEMORY[0x270F671B0]();
}

uint64_t sub_22E0F5F60()
{
  return MEMORY[0x270F671C0]();
}

uint64_t sub_22E0F5F70()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_22E0F5F80()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_22E0F5F90()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_22E0F5FA0()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_22E0F5FB0()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_22E0F5FC0()
{
  return MEMORY[0x270F67310]();
}

uint64_t sub_22E0F5FD0()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_22E0F5FE0()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_22E0F5FF0()
{
  return MEMORY[0x270F673D0]();
}

uint64_t sub_22E0F6000()
{
  return MEMORY[0x270F67420]();
}

uint64_t sub_22E0F6010()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_22E0F6020()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_22E0F6030()
{
  return MEMORY[0x270F67600]();
}

uint64_t sub_22E0F6040()
{
  return MEMORY[0x270F67608]();
}

uint64_t sub_22E0F6050()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_22E0F6060()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_22E0F6070()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_22E0F6080()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_22E0F6090()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_22E0F60A0()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_22E0F60B0()
{
  return MEMORY[0x270F677A8]();
}

uint64_t sub_22E0F60C0()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_22E0F60D0()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_22E0F60E0()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_22E0F60F0()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_22E0F6100()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_22E0F6110()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_22E0F6120()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_22E0F6130()
{
  return MEMORY[0x270F67880]();
}

uint64_t sub_22E0F6140()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_22E0F6150()
{
  return MEMORY[0x270F678D0]();
}

uint64_t sub_22E0F6160()
{
  return MEMORY[0x270F678E8]();
}

uint64_t sub_22E0F6170()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_22E0F6180()
{
  return MEMORY[0x270F67958]();
}

uint64_t sub_22E0F6190()
{
  return MEMORY[0x270F67960]();
}

uint64_t sub_22E0F61A0()
{
  return MEMORY[0x270F67970]();
}

uint64_t sub_22E0F61C0()
{
  return MEMORY[0x270F67AF8]();
}

uint64_t sub_22E0F61D0()
{
  return MEMORY[0x270F67B00]();
}

uint64_t sub_22E0F61E0()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_22E0F61F0()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_22E0F6200()
{
  return MEMORY[0x270F67B68]();
}

uint64_t sub_22E0F6210()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_22E0F6220()
{
  return MEMORY[0x270F67C00]();
}

uint64_t sub_22E0F6230()
{
  return MEMORY[0x270F67C08]();
}

uint64_t sub_22E0F6260()
{
  return MEMORY[0x270F67C20]();
}

uint64_t sub_22E0F6280()
{
  return MEMORY[0x270F67D18]();
}

uint64_t sub_22E0F6290()
{
  return MEMORY[0x270F67D20]();
}

uint64_t sub_22E0F62A0()
{
  return MEMORY[0x270F67D28]();
}

uint64_t sub_22E0F62B0()
{
  return MEMORY[0x270F67D30]();
}

uint64_t sub_22E0F62C0()
{
  return MEMORY[0x270F67D40]();
}

uint64_t sub_22E0F62D0()
{
  return MEMORY[0x270F67D48]();
}

uint64_t sub_22E0F62E0()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_22E0F62F0()
{
  return MEMORY[0x270F67E28]();
}

uint64_t sub_22E0F6300()
{
  return MEMORY[0x270F67E30]();
}

uint64_t sub_22E0F6310()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_22E0F6320()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_22E0F6330()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_22E0F6340()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_22E0F6350()
{
  return MEMORY[0x270F67F58]();
}

uint64_t sub_22E0F6360()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_22E0F6370()
{
  return MEMORY[0x270F68250]();
}

uint64_t sub_22E0F6380()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_22E0F6390()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_22E0F63A0()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_22E0F63B0()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_22E0F63C0()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_22E0F63D0()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_22E0F63E0()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_22E0F63F0()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_22E0F6400()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_22E0F6410()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_22E0F6420()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_22E0F6430()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_22E0F6440()
{
  return MEMORY[0x270F6A5D8]();
}

uint64_t sub_22E0F6450()
{
  return MEMORY[0x270F6A5E0]();
}

uint64_t sub_22E0F6460()
{
  return MEMORY[0x270F6A600]();
}

uint64_t sub_22E0F6470()
{
  return MEMORY[0x270F6A608]();
}

uint64_t sub_22E0F6480()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_22E0F6490()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_22E0F64A0()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_22E0F64B0()
{
  return MEMORY[0x270F6A748]();
}

uint64_t sub_22E0F64C0()
{
  return MEMORY[0x270F6A750]();
}

uint64_t sub_22E0F64D0()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_22E0F64E0()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_22E0F64F0()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_22E0F6500()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_22E0F6510()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_22E0F6520()
{
  return MEMORY[0x270F6A818]();
}

uint64_t sub_22E0F6530()
{
  return MEMORY[0x270F6A830]();
}

uint64_t sub_22E0F6540()
{
  return MEMORY[0x270F6A848]();
}

uint64_t sub_22E0F6550()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_22E0F6560()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_22E0F6570()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_22E0F6580()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_22E0F6590()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_22E0F65A0()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_22E0F65B0()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_22E0F65C0()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_22E0F65D0()
{
  return MEMORY[0x270F6BF80]();
}

uint64_t sub_22E0F65E0()
{
  return MEMORY[0x270F6BF98]();
}

uint64_t sub_22E0F65F0()
{
  return MEMORY[0x270F6BFB8]();
}

uint64_t sub_22E0F6600()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_22E0F6610()
{
  return MEMORY[0x270F6BFD0]();
}

uint64_t sub_22E0F6620()
{
  return MEMORY[0x270F6BFF0]();
}

uint64_t sub_22E0F6630()
{
  return MEMORY[0x270F6C100]();
}

uint64_t sub_22E0F6640()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_22E0F6650()
{
  return MEMORY[0x270F6C188]();
}

uint64_t sub_22E0F6660()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_22E0F6670()
{
  return MEMORY[0x270F6C838]();
}

uint64_t sub_22E0F6680()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_22E0F6690()
{
  return MEMORY[0x270F6C960]();
}

uint64_t sub_22E0F66A0()
{
  return MEMORY[0x270F6C988]();
}

uint64_t sub_22E0F66B0()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_22E0F66C0()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_22E0F66D0()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_22E0F66E0()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_22E0F66F0()
{
  return MEMORY[0x270F6CA60]();
}

uint64_t sub_22E0F6700()
{
  return MEMORY[0x270F6CA68]();
}

uint64_t sub_22E0F6710()
{
  return MEMORY[0x270F6CA70]();
}

uint64_t sub_22E0F6720()
{
  return MEMORY[0x270F6CAD0]();
}

uint64_t sub_22E0F6730()
{
  return MEMORY[0x270F6CAD8]();
}

uint64_t sub_22E0F6740()
{
  return MEMORY[0x270F6CAE8]();
}

uint64_t sub_22E0F6750()
{
  return MEMORY[0x270F6CAF0]();
}

uint64_t sub_22E0F6760()
{
  return MEMORY[0x270F6CB28]();
}

uint64_t sub_22E0F6770()
{
  return MEMORY[0x270F6CBA0]();
}

uint64_t sub_22E0F6780()
{
  return MEMORY[0x270F6CBB0]();
}

uint64_t sub_22E0F6790()
{
  return MEMORY[0x270F6CBB8]();
}

uint64_t sub_22E0F67A0()
{
  return MEMORY[0x270F6CBD0]();
}

uint64_t sub_22E0F67B0()
{
  return MEMORY[0x270F6CBE0]();
}

uint64_t sub_22E0F67C0()
{
  return MEMORY[0x270F6CBE8]();
}

uint64_t sub_22E0F67D0()
{
  return MEMORY[0x270F6CBF0]();
}

uint64_t sub_22E0F67E0()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_22E0F67F0()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_22E0F6800()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_22E0F6810()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_22E0F6820()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_22E0F6830()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_22E0F6840()
{
  return MEMORY[0x270F6CE08]();
}

uint64_t sub_22E0F6850()
{
  return MEMORY[0x270F6CE18]();
}

uint64_t sub_22E0F6860()
{
  return MEMORY[0x270F6CE38]();
}

uint64_t sub_22E0F6870()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_22E0F6880()
{
  return MEMORY[0x270F6CED0]();
}

uint64_t sub_22E0F6890()
{
  return MEMORY[0x270F6CEF0]();
}

uint64_t sub_22E0F68A0()
{
  return MEMORY[0x270F6D020]();
}

uint64_t sub_22E0F68B0()
{
  return MEMORY[0x270F6D030]();
}

uint64_t sub_22E0F68C0()
{
  return MEMORY[0x270F6D038]();
}

uint64_t sub_22E0F68D0()
{
  return MEMORY[0x270F6D040]();
}

uint64_t sub_22E0F68E0()
{
  return MEMORY[0x270F6D0F8]();
}

uint64_t sub_22E0F68F0()
{
  return MEMORY[0x270F6D108]();
}

uint64_t sub_22E0F6900()
{
  return MEMORY[0x270F6D110]();
}

uint64_t sub_22E0F6910()
{
  return MEMORY[0x270F6D118]();
}

uint64_t sub_22E0F6920()
{
  return MEMORY[0x270F6D120]();
}

uint64_t sub_22E0F6930()
{
  return MEMORY[0x270F6D128]();
}

uint64_t sub_22E0F6940()
{
  return MEMORY[0x270F6D1C0]();
}

uint64_t sub_22E0F6950()
{
  return MEMORY[0x270F6D1D0]();
}

uint64_t sub_22E0F6960()
{
  return MEMORY[0x270F6D1D8]();
}

uint64_t sub_22E0F6970()
{
  return MEMORY[0x270F6D1E0]();
}

uint64_t sub_22E0F6980()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_22E0F6990()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_22E0F69A0()
{
  return MEMORY[0x270F65440]();
}

uint64_t sub_22E0F69B0()
{
  return MEMORY[0x270F6D260]();
}

uint64_t sub_22E0F69C0()
{
  return MEMORY[0x270F6D270]();
}

uint64_t sub_22E0F69D0()
{
  return MEMORY[0x270F6D288]();
}

uint64_t sub_22E0F69E0()
{
  return MEMORY[0x270F6D2B8]();
}

uint64_t sub_22E0F69F0()
{
  return MEMORY[0x270F6D2C0]();
}

uint64_t sub_22E0F6A00()
{
  return MEMORY[0x270F6D310]();
}

uint64_t sub_22E0F6A10()
{
  return MEMORY[0x270F6D318]();
}

uint64_t sub_22E0F6A20()
{
  return MEMORY[0x270F6D350]();
}

uint64_t sub_22E0F6A30()
{
  return MEMORY[0x270F6D3E0]();
}

uint64_t sub_22E0F6A40()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_22E0F6A50()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_22E0F6A60()
{
  return MEMORY[0x270F6D468]();
}

uint64_t sub_22E0F6A70()
{
  return MEMORY[0x270F6D488]();
}

uint64_t sub_22E0F6A80()
{
  return MEMORY[0x270F6D4E8]();
}

uint64_t sub_22E0F6A90()
{
  return MEMORY[0x270F6D508]();
}

uint64_t sub_22E0F6AA0()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_22E0F6AB0()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_22E0F6AC0()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_22E0F6AD0()
{
  return MEMORY[0x270F6D638]();
}

uint64_t sub_22E0F6AE0()
{
  return MEMORY[0x270F6D910]();
}

uint64_t sub_22E0F6AF0()
{
  return MEMORY[0x270F6D940]();
}

uint64_t sub_22E0F6B00()
{
  return MEMORY[0x270F6D9E0]();
}

uint64_t sub_22E0F6B10()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_22E0F6B20()
{
  return MEMORY[0x270F6DA68]();
}

uint64_t sub_22E0F6B30()
{
  return MEMORY[0x270F6DAB8]();
}

uint64_t sub_22E0F6B40()
{
  return MEMORY[0x270F6DBF0]();
}

uint64_t sub_22E0F6B50()
{
  return MEMORY[0x270F6DC08]();
}

uint64_t sub_22E0F6B60()
{
  return MEMORY[0x270F6DC38]();
}

uint64_t sub_22E0F6B70()
{
  return MEMORY[0x270F6DC40]();
}

uint64_t sub_22E0F6B80()
{
  return MEMORY[0x270F6DC48]();
}

uint64_t sub_22E0F6B90()
{
  return MEMORY[0x270F6DC50]();
}

uint64_t sub_22E0F6BA0()
{
  return MEMORY[0x270F6DCA8]();
}

uint64_t sub_22E0F6BB0()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_22E0F6BC0()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_22E0F6BD0()
{
  return MEMORY[0x270F6DD18]();
}

uint64_t sub_22E0F6BE0()
{
  return MEMORY[0x270F6DE08]();
}

uint64_t sub_22E0F6BF0()
{
  return MEMORY[0x270F6DE10]();
}

uint64_t sub_22E0F6C00()
{
  return MEMORY[0x270F6DE20]();
}

uint64_t sub_22E0F6C10()
{
  return MEMORY[0x270F6DE30]();
}

uint64_t sub_22E0F6C20()
{
  return MEMORY[0x270F6DF80]();
}

uint64_t sub_22E0F6C30()
{
  return MEMORY[0x270F6DF88]();
}

uint64_t sub_22E0F6C40()
{
  return MEMORY[0x270F6E080]();
}

uint64_t sub_22E0F6C50()
{
  return MEMORY[0x270F6E088]();
}

uint64_t sub_22E0F6C60()
{
  return MEMORY[0x270F6E130]();
}

uint64_t sub_22E0F6C70()
{
  return MEMORY[0x270F6E138]();
}

uint64_t sub_22E0F6C80()
{
  return MEMORY[0x270F6E140]();
}

uint64_t sub_22E0F6C90()
{
  return MEMORY[0x270F6E1A0]();
}

uint64_t sub_22E0F6CA0()
{
  return MEMORY[0x270F6E1D0]();
}

uint64_t sub_22E0F6CB0()
{
  return MEMORY[0x270F6E1E0]();
}

uint64_t sub_22E0F6CC0()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_22E0F6CD0()
{
  return MEMORY[0x270F6E2E0]();
}

uint64_t sub_22E0F6CE0()
{
  return MEMORY[0x270F6E2E8]();
}

uint64_t sub_22E0F6CF0()
{
  return MEMORY[0x270F6E2F0]();
}

uint64_t sub_22E0F6D00()
{
  return MEMORY[0x270F6E360]();
}

uint64_t sub_22E0F6D10()
{
  return MEMORY[0x270F6E380]();
}

uint64_t sub_22E0F6D20()
{
  return MEMORY[0x270F6E410]();
}

uint64_t sub_22E0F6D30()
{
  return MEMORY[0x270F6E418]();
}

uint64_t sub_22E0F6D40()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_22E0F6D50()
{
  return MEMORY[0x270F6E4D8]();
}

uint64_t sub_22E0F6D60()
{
  return MEMORY[0x270F6E4E0]();
}

uint64_t sub_22E0F6D70()
{
  return MEMORY[0x270F6EAD0]();
}

uint64_t sub_22E0F6D80()
{
  return MEMORY[0x270F6EAD8]();
}

uint64_t sub_22E0F6D90()
{
  return MEMORY[0x270F6EAE8]();
}

uint64_t sub_22E0F6DA0()
{
  return MEMORY[0x270F6EB88]();
}

uint64_t sub_22E0F6DB0()
{
  return MEMORY[0x270F6EBB0]();
}

uint64_t sub_22E0F6DC0()
{
  return MEMORY[0x270F6EE38]();
}

uint64_t sub_22E0F6DD0()
{
  return MEMORY[0x270F6EE40]();
}

uint64_t sub_22E0F6DE0()
{
  return MEMORY[0x270F6EE50]();
}

uint64_t sub_22E0F6DF0()
{
  return MEMORY[0x270F6F0C0]();
}

uint64_t sub_22E0F6E00()
{
  return MEMORY[0x270F6F0C8]();
}

uint64_t sub_22E0F6E10()
{
  return MEMORY[0x270F6F0D8]();
}

uint64_t sub_22E0F6E20()
{
  return MEMORY[0x270F6F0E8]();
}

uint64_t sub_22E0F6E30()
{
  return MEMORY[0x270F6F320]();
}

uint64_t sub_22E0F6E40()
{
  return MEMORY[0x270F6F330]();
}

uint64_t sub_22E0F6E50()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_22E0F6E60()
{
  return MEMORY[0x270F6F358]();
}

uint64_t sub_22E0F6E70()
{
  return MEMORY[0x270F6F368]();
}

uint64_t sub_22E0F6E80()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_22E0F6E90()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t sub_22E0F6EA0()
{
  return MEMORY[0x270F65DF8]();
}

uint64_t sub_22E0F6EB0()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_22E0F6EC0()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_22E0F6ED0()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_22E0F6EE0()
{
  return MEMORY[0x270F729C0]();
}

uint64_t sub_22E0F6EF0()
{
  return MEMORY[0x270F729C8]();
}

uint64_t sub_22E0F6F00()
{
  return MEMORY[0x270F72A08]();
}

uint64_t sub_22E0F6F10()
{
  return MEMORY[0x270F72A40]();
}

uint64_t sub_22E0F6F20()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_22E0F6F30()
{
  return MEMORY[0x270F72AE0]();
}

uint64_t sub_22E0F6F40()
{
  return MEMORY[0x270F72AE8]();
}

uint64_t sub_22E0F6F50()
{
  return MEMORY[0x270F72C20]();
}

uint64_t sub_22E0F6F60()
{
  return MEMORY[0x270F64A88]();
}

uint64_t sub_22E0F6F70()
{
  return MEMORY[0x270F64A90]();
}

uint64_t sub_22E0F6F80()
{
  return MEMORY[0x270F64AB0]();
}

uint64_t sub_22E0F6F90()
{
  return MEMORY[0x270F64C60]();
}

uint64_t sub_22E0F6FA0()
{
  return MEMORY[0x270F64C70]();
}

uint64_t sub_22E0F6FB0()
{
  return MEMORY[0x270F64C80]();
}

uint64_t sub_22E0F6FC0()
{
  return MEMORY[0x270F64E40]();
}

uint64_t sub_22E0F6FD0()
{
  return MEMORY[0x270F64E48]();
}

uint64_t sub_22E0F6FE0()
{
  return MEMORY[0x270F64E60]();
}

uint64_t sub_22E0F6FF0()
{
  return MEMORY[0x270F64E80]();
}

uint64_t sub_22E0F7000()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_22E0F7010()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t sub_22E0F7020()
{
  return MEMORY[0x270F64EB0]();
}

uint64_t sub_22E0F7030()
{
  return MEMORY[0x270F64EB8]();
}

uint64_t sub_22E0F7040()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t sub_22E0F7050()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t sub_22E0F7060()
{
  return MEMORY[0x270F64ED0]();
}

uint64_t sub_22E0F7070()
{
  return MEMORY[0x270F64ED8]();
}

uint64_t sub_22E0F7080()
{
  return MEMORY[0x270F64EE0]();
}

uint64_t sub_22E0F7090()
{
  return MEMORY[0x270F64EF0]();
}

uint64_t sub_22E0F70A0()
{
  return MEMORY[0x270F64F00]();
}

uint64_t sub_22E0F70B0()
{
  return MEMORY[0x270F64F10]();
}

uint64_t sub_22E0F70C0()
{
  return MEMORY[0x270F64F18]();
}

uint64_t sub_22E0F70D0()
{
  return MEMORY[0x270F64F20]();
}

uint64_t sub_22E0F70E0()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t sub_22E0F70F0()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t sub_22E0F7100()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_22E0F7110()
{
  return MEMORY[0x270F64FC8]();
}

uint64_t sub_22E0F7120()
{
  return MEMORY[0x270F64FD0]();
}

uint64_t sub_22E0F7130()
{
  return MEMORY[0x270F64FD8]();
}

uint64_t sub_22E0F7140()
{
  return MEMORY[0x270F64FE8]();
}

uint64_t sub_22E0F7150()
{
  return MEMORY[0x270F64FF8]();
}

uint64_t sub_22E0F7160()
{
  return MEMORY[0x270F650B8]();
}

uint64_t sub_22E0F7170()
{
  return MEMORY[0x270F650C0]();
}

uint64_t sub_22E0F7180()
{
  return MEMORY[0x270F650C8]();
}

uint64_t sub_22E0F7190()
{
  return MEMORY[0x270F650D8]();
}

uint64_t sub_22E0F71A0()
{
  return MEMORY[0x270F650E0]();
}

uint64_t sub_22E0F71B0()
{
  return MEMORY[0x270F650E8]();
}

uint64_t sub_22E0F71C0()
{
  return MEMORY[0x270F650F0]();
}

uint64_t sub_22E0F71D0()
{
  return MEMORY[0x270F650F8]();
}

uint64_t sub_22E0F71E0()
{
  return MEMORY[0x270F65100]();
}

uint64_t sub_22E0F71F0()
{
  return MEMORY[0x270F65108]();
}

uint64_t sub_22E0F7200()
{
  return MEMORY[0x270F65118]();
}

uint64_t sub_22E0F7210()
{
  return MEMORY[0x270F65120]();
}

uint64_t sub_22E0F7220()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_22E0F7230()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_22E0F7240()
{
  return MEMORY[0x270F65168]();
}

uint64_t sub_22E0F7250()
{
  return MEMORY[0x270F65170]();
}

uint64_t sub_22E0F7260()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_22E0F7270()
{
  return MEMORY[0x270F63AD0]();
}

uint64_t sub_22E0F7280()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t sub_22E0F7290()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_22E0F72A0()
{
  return MEMORY[0x270F652F8]();
}

uint64_t sub_22E0F72B0()
{
  return MEMORY[0x270F66048]();
}

uint64_t sub_22E0F72C0()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_22E0F72D0()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_22E0F72E0()
{
  return MEMORY[0x270F660A0]();
}

uint64_t sub_22E0F72F0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_22E0F7300()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_22E0F7310()
{
  return MEMORY[0x270F70700]();
}

uint64_t sub_22E0F7320()
{
  return MEMORY[0x270F70718]();
}

uint64_t sub_22E0F7330()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_22E0F7340()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_22E0F7350()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_22E0F7360()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_22E0F7370()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_22E0F7380()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_22E0F7390()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_22E0F73A0()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_22E0F73B0()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_22E0F73C0()
{
  return MEMORY[0x270F70A18]();
}

uint64_t sub_22E0F73D0()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_22E0F73E0()
{
  return MEMORY[0x270F70A58]();
}

uint64_t sub_22E0F73F0()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_22E0F7400()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_22E0F7410()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_22E0F7420()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_22E0F7430()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_22E0F7440()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22E0F7450()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22E0F7460()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22E0F7470()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_22E0F7480()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22E0F7490()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_22E0F74A0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22E0F74B0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22E0F74C0()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_22E0F74D0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22E0F74E0()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_22E0F74F0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_22E0F7500()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_22E0F7510()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_22E0F7520()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_22E0F7530()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22E0F7540()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22E0F7550()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22E0F7560()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_22E0F7570()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22E0F7580()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22E0F7590()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22E0F75A0()
{
  return MEMORY[0x270F9D5E8]();
}

uint64_t sub_22E0F75B0()
{
  return MEMORY[0x270F9D5F0]();
}

uint64_t sub_22E0F75C0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22E0F75D0()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_22E0F75E0()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_22E0F75F0()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_22E0F7600()
{
  return MEMORY[0x270F9D6D0]();
}

uint64_t sub_22E0F7610()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_22E0F7620()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_22E0F7630()
{
  return MEMORY[0x270F9D7D0]();
}

uint64_t sub_22E0F7640()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22E0F7650()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22E0F7660()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_22E0F7670()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_22E0F7680()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_22E0F7690()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_22E0F76A0()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_22E0F76B0()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_22E0F76C0()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t sub_22E0F76D0()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t sub_22E0F76E0()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t sub_22E0F76F0()
{
  return MEMORY[0x270F9DB98]();
}

uint64_t sub_22E0F7700()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22E0F7710()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22E0F7720()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_22E0F7730()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22E0F7740()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22E0F7750()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_22E0F7760()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22E0F7770()
{
  return MEMORY[0x270FA1450]();
}

uint64_t sub_22E0F7780()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22E0F7790()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_22E0F77A0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_22E0F77B0()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_22E0F77C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22E0F77D0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22E0F77E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22E0F77F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22E0F7800()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_22E0F7810()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_22E0F7820()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t sub_22E0F7830()
{
  return MEMORY[0x270F9DD98]();
}

uint64_t sub_22E0F7840()
{
  return MEMORY[0x270F9DDC8]();
}

uint64_t sub_22E0F7850()
{
  return MEMORY[0x270F9DDD0]();
}

uint64_t sub_22E0F7860()
{
  return MEMORY[0x270EF1C40]();
}

uint64_t sub_22E0F7870()
{
  return MEMORY[0x270F9DE08]();
}

uint64_t sub_22E0F7880()
{
  return MEMORY[0x270F9DE40]();
}

uint64_t sub_22E0F7890()
{
  return MEMORY[0x270F9DE90]();
}

uint64_t sub_22E0F78A0()
{
  return MEMORY[0x270F9DE98]();
}

uint64_t sub_22E0F78B0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22E0F78C0()
{
  return MEMORY[0x270F9DED0]();
}

uint64_t sub_22E0F78D0()
{
  return MEMORY[0x270F9DEE8]();
}

uint64_t sub_22E0F78E0()
{
  return MEMORY[0x270F9DF78]();
}

uint64_t sub_22E0F78F0()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_22E0F7900()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22E0F7910()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22E0F7920()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22E0F7930()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_22E0F7940()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_22E0F7950()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_22E0F7960()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t sub_22E0F7970()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22E0F7980()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22E0F7990()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22E0F79A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22E0F79B0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22E0F79C0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_22E0F79D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22E0F79E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22E0F79F0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_22E0F7A00()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_22E0F7A10()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_22E0F7A20()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_22E0F7A30()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22E0F7A40()
{
  return MEMORY[0x270F68448]();
}

uint64_t sub_22E0F7A50()
{
  return MEMORY[0x270EF2248]();
}

uint64_t sub_22E0F7A60()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_22E0F7A70()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_22E0F7A80()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_22E0F7A90()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_22E0F7AA0()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_22E0F7AB0()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_22E0F7AC0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22E0F7AD0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22E0F7AE0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22E0F7AF0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_22E0F7B00()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22E0F7B10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22E0F7B20()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_22E0F7B30()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t sub_22E0F7B40()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t sub_22E0F7B50()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t sub_22E0F7B60()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t sub_22E0F7B70()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t sub_22E0F7B80()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t sub_22E0F7B90()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t sub_22E0F7BA0()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t sub_22E0F7BB0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22E0F7BC0()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_22E0F7BD0()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_22E0F7BE0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22E0F7BF0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_22E0F7C00()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_22E0F7C10()
{
  return MEMORY[0x270F9EAC0]();
}

uint64_t sub_22E0F7C20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22E0F7C30()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_22E0F7C40()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22E0F7C50()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22E0F7C60()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22E0F7C70()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22E0F7C80()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t sub_22E0F7C90()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_22E0F7CA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22E0F7CB0()
{
  return MEMORY[0x270F9F008]();
}

uint64_t sub_22E0F7CC0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22E0F7CD0()
{
  return MEMORY[0x270F9F220]();
}

uint64_t sub_22E0F7CE0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22E0F7CF0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_22E0F7D00()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_22E0F7D10()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_22E0F7D20()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_22E0F7D30()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22E0F7D40()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_22E0F7D50()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_22E0F7D60()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_22E0F7D70()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22E0F7D80()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_22E0F7D90()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_22E0F7DA0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_22E0F7DB0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_22E0F7DC0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22E0F7DD0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_22E0F7DE0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_22E0F7DF0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_22E0F7E00()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22E0F7E10()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_22E0F7E20()
{
  return MEMORY[0x270F9F780]();
}

uint64_t sub_22E0F7E30()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_22E0F7E40()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_22E0F7E50()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_22E0F7E60()
{
  return MEMORY[0x270FA14F0]();
}

uint64_t sub_22E0F7E70()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22E0F7E80()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_22E0F7EA0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22E0F7EB0()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_22E0F7EC0()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_22E0F7ED0()
{
  return MEMORY[0x270EF2668]();
}

uint64_t sub_22E0F7EE0()
{
  return MEMORY[0x270EF2670]();
}

uint64_t sub_22E0F7EF0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22E0F7F00()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22E0F7F10()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22E0F7F20()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22E0F7F30()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22E0F7F40()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t sub_22E0F7F50()
{
  return MEMORY[0x270F651A0]();
}

uint64_t sub_22E0F7F60()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22E0F7F70()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22E0F7F80()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t sub_22E0F7F90()
{
  return MEMORY[0x270FA00B8]();
}

uint64_t sub_22E0F7FA0()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t sub_22E0F7FB0()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t sub_22E0F7FC0()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t sub_22E0F7FD0()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t sub_22E0F7FE0()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t sub_22E0F7FF0()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t sub_22E0F8000()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t sub_22E0F8010()
{
  return MEMORY[0x270FA0100]();
}

uint64_t sub_22E0F8020()
{
  return MEMORY[0x270FA0108]();
}

uint64_t sub_22E0F8030()
{
  return MEMORY[0x270FA0110]();
}

uint64_t sub_22E0F8040()
{
  return MEMORY[0x270FA0118]();
}

uint64_t AFGetFlashlightLevel()
{
  return MEMORY[0x270F0ED48]();
}

uint64_t AFMontaraRestricted()
{
  return MEMORY[0x270F0EE38]();
}

uint64_t BKSDisplayBrightnessIsBrightnessLevelControlAvailable()
{
  return MEMORY[0x270F10440]();
}

uint64_t BKSDisplayBrightnessSetAutoBrightnessEnabled()
{
  return MEMORY[0x270F10450]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x270EF51E0]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x270EF51F8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x270F83068]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientSetInCarState()
{
  return MEMORY[0x270F4B630]();
}

uint64_t _AXDarkenSystemColors()
{
  return MEMORY[0x270F90520]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSAssistiveTouchScannerSetEnabled()
{
  return MEMORY[0x270F905B8]();
}

uint64_t _AXSAutoBrightnessEnabled()
{
  return MEMORY[0x270F905F8]();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  return MEMORY[0x270F90630]();
}

uint64_t _AXSBlueYellowFilterSetEnabled()
{
  return MEMORY[0x270F90638]();
}

uint64_t _AXSButtonShapesEnabled()
{
  return MEMORY[0x270F90640]();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  return MEMORY[0x270F90680]();
}

uint64_t _AXSClassicInvertColorsSetEnabled()
{
  return MEMORY[0x270F90688]();
}

uint64_t _AXSColorTintFilterEnabled()
{
  return MEMORY[0x270F906A0]();
}

uint64_t _AXSColorTintSetEnabled()
{
  return MEMORY[0x270F906A8]();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return MEMORY[0x270F906B0]();
}

uint64_t _AXSCommandAndControlCarPlaySetEnabled()
{
  return MEMORY[0x270F906B8]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x270F906C8]();
}

uint64_t _AXSDifferentiateWithoutColorEnabled()
{
  return MEMORY[0x270F90710]();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x270F90738]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x270F90740]();
}

uint64_t _AXSGrayscaleEnabled()
{
  return MEMORY[0x270F90780]();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return MEMORY[0x270F90788]();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  return MEMORY[0x270F90790]();
}

uint64_t _AXSGreenRedFilterSetEnabled()
{
  return MEMORY[0x270F90798]();
}

uint64_t _AXSIncreaseButtonLegibility()
{
  return MEMORY[0x270F90878]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x270F90880]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x270F90898]();
}

uint64_t _AXSMotionCuesMode()
{
  return MEMORY[0x270F90908]();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  return MEMORY[0x270F90988]();
}

uint64_t _AXSRedGreenFilterSetEnabled()
{
  return MEMORY[0x270F90990]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x270F909A0]();
}

uint64_t _AXSSetButtonShapesEnabled()
{
  return MEMORY[0x270F909F0]();
}

uint64_t _AXSSetDarkenSystemColors()
{
  return MEMORY[0x270F90A08]();
}

uint64_t _AXSSetDifferentiateWithoutColorEnabled()
{
  return MEMORY[0x270F90A10]();
}

uint64_t _AXSSetEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x270F90A18]();
}

uint64_t _AXSSetEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x270F90A20]();
}

uint64_t _AXSSetIncreaseButtonLegibility()
{
  return MEMORY[0x270F90A38]();
}

uint64_t _AXSSetMotionCuesModeAndShowBanner()
{
  return MEMORY[0x270F90A50]();
}

uint64_t _AXSSetReduceWhitePointEnabled()
{
  return MEMORY[0x270F90A78]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x270F90B80]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

void rewind(FILE *a1)
{
}

long double round(long double __x)
{
  MEMORY[0x270EDB288](__x);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x270FA01A8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}