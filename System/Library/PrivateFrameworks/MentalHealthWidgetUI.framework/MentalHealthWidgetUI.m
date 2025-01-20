uint64_t sub_2561D14F0()
{
  uint64_t v0;

  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s8SentinelCMa()
{
  return self;
}

id sub_2561D1524()
{
  _s8SentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B2AD960 = (uint64_t)result;
  return result;
}

void sub_2561D157C()
{
  qword_269F50D60 = 0x40AC200000000000;
}

double sub_2561D1590()
{
  if (qword_269F50D50 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_269F50D60 * 24.0;
  *(double *)&qword_269F50D68 = *(double *)&qword_269F50D60 * 24.0;
  return result;
}

uint64_t sub_2561D15EC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2561D160C(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_2561D160C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2561D2C98(0, (unint64_t *)&qword_269F50D70, (uint64_t (*)(uint64_t))sub_2561D1C34, MEMORY[0x263F8E0F8]);
  sub_2561D1C34();
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 72);
  unint64_t v12 = (*(unsigned __int8 *)(*(void *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  sub_2561D1C34();
  uint64_t v17 = *(void *)(v16 - 8);
  unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v19 = (char *)v13 + v18;
  v20 = (char *)a4 + v18;
  if (a1)
  {
    if (v13 < a4 || v19 >= &v20[*(void *)(v17 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v21 = *(void *)(v17 + 72) * v8;
  v22 = &v19[v21];
  unint64_t v23 = (unint64_t)&v20[v21];
  if (v20 >= v22 || (unint64_t)v19 >= v23)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2561DB840();
  __break(1u);
  return result;
}

uint64_t sub_2561D1878(uint64_t a1)
{
  uint64_t v2 = sub_2561DB330();
  MEMORY[0x270FA5388](v2 - 8);
  v39 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2561DB3E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v38 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v37 = (char *)&v29 - v9;
  MEMORY[0x270FA5388](v8);
  v35 = (char *)&v29 - v10;
  sub_2561D1C34();
  uint64_t v36 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  size_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = MEMORY[0x263F8EE78];
  if (v15)
  {
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_2561D15EC(0, v15, 0);
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v17 = v5 + 16;
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    uint64_t v30 = *(void *)(v17 + 56);
    v31 = v18;
    v20 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v29 = v12 + 32;
    uint64_t v33 = v4;
    uint64_t v34 = v17;
    uint64_t v32 = v12;
    uint64_t v21 = v37;
    do
    {
      v22 = v35;
      v31(v35, v19, v4);
      if (qword_269F50D50 != -1) {
        swift_once();
      }
      sub_2561DB3C0();
      unint64_t v23 = v38;
      sub_2561DB3C0();
      sub_2561DB310();
      v24 = *v20;
      (*v20)(v23, v4);
      v24(v21, v4);
      sub_2561DB6A0();
      v24(v22, v4);
      uint64_t v16 = v40;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2561D15EC(0, *(void *)(v16 + 16) + 1, 1);
        uint64_t v16 = v40;
      }
      uint64_t v25 = v32;
      unint64_t v27 = *(void *)(v16 + 16);
      unint64_t v26 = *(void *)(v16 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_2561D15EC(v26 > 1, v27 + 1, 1);
        uint64_t v16 = v40;
      }
      *(void *)(v16 + 16) = v27 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v16+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v27, v14, v36);
      uint64_t v40 = v16;
      v19 += v30;
      --v15;
      uint64_t v4 = v33;
    }
    while (v15);
  }
  return v16;
}

void sub_2561D1C34()
{
  if (!qword_26B2AD838)
  {
    unint64_t v0 = sub_2561DB6B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2AD838);
    }
  }
}

unint64_t sub_2561D1C94(uint64_t a1, unint64_t a2)
{
  unint64_t v133 = a2;
  uint64_t v124 = a1;
  uint64_t v89 = sub_2561DB380();
  uint64_t v93 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  v88 = (char *)&v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_2561DB4E0();
  uint64_t v91 = *(void *)(v92 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v92);
  v90 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v87 = (char *)&v87 - v5;
  uint64_t v105 = sub_2561DB460();
  uint64_t v127 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  v104 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_2561DB420();
  v130 = *(unsigned int (***)(void, void, void))(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v121 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_2561DB430();
  uint64_t v8 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  v119 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_2561DB410();
  uint64_t v10 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v116 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D2C98(0, &qword_26B2AD840, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v97 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v115 = (uint64_t)&v87 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)&v87 - v17;
  uint64_t v19 = sub_2561DB3E0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v96 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v129 = (char *)&v87 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v128 = (char *)&v87 - v26;
  MEMORY[0x270FA5388](v25);
  v28 = (char *)&v87 - v27;
  uint64_t v29 = sub_2561DB3F0();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v87 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_2561DB470();
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v34 = (char *)&v87 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v32, *MEMORY[0x263F07740], v29);
  v132 = v34;
  sub_2561DB400();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  v35 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  uint64_t v102 = v20 + 16;
  v101 = v35;
  v35(v28, (char *)v133, v19);
  unsigned int v114 = *MEMORY[0x263F07780];
  v113 = *(void (**)(char *, void, uint64_t))(v10 + 104);
  unsigned int v112 = *MEMORY[0x263F07800];
  v111 = (void (**)(char *, void, uint64_t))(v8 + 104);
  unsigned int v110 = *MEMORY[0x263F077E0];
  v109 = (void (**)(char *, void, uint64_t))(v130 + 13);
  v108 = (void (**)(char *, uint64_t))(v130 + 1);
  v107 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v117 = v10 + 104;
  v106 = (void (**)(char *, uint64_t))(v10 + 8);
  v130 = (unsigned int (**)(void, void, void))(v20 + 48);
  v125 = (void (**)(char *, uint64_t, uint64_t))(v20 + 32);
  unsigned int v100 = *MEMORY[0x263F07870];
  v99 = (void (**)(char *, void, uint64_t))(v127 + 104);
  v98 = (void (**)(char *, uint64_t))(v127 + 8);
  unint64_t v36 = MEMORY[0x263F8EE78];
  uint64_t v103 = v20;
  v123 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v37 = 7;
  v131 = v18;
  v126 = v28;
  while (1)
  {
    uint64_t v127 = v37;
    unint64_t v133 = v36;
    uint64_t v40 = v116;
    uint64_t v41 = v118;
    v113(v116, v114, v118);
    uint64_t v42 = v19;
    v43 = v119;
    uint64_t v44 = v120;
    (*v111)(v119, v112, v120);
    v46 = v121;
    uint64_t v45 = v122;
    (*v109)(v121, v110, v122);
    uint64_t v47 = (uint64_t)v131;
    sub_2561DB450();
    (*v108)(v46, v45);
    v48 = v43;
    uint64_t v19 = v42;
    (*v107)(v48, v44);
    (*v106)(v40, v41);
    uint64_t v49 = v115;
    sub_2561D2CFC(v47, v115);
    v50 = *v130;
    if ((*v130)(v49, 1, v42) == 1) {
      break;
    }
    v51 = *v125;
    v52 = v128;
    (*v125)(v128, v49, v19);
    v101(v129, v52, v19);
    unint64_t v53 = v133;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v53 = sub_2561D9948(0, *(void *)(v53 + 16) + 1, 1, v53);
    }
    uint64_t v54 = (uint64_t)v97;
    v55 = v96;
    unint64_t v57 = *(void *)(v53 + 16);
    unint64_t v56 = *(void *)(v53 + 24);
    if (v57 >= v56 >> 1) {
      unint64_t v53 = sub_2561D9948(v56 > 1, v57 + 1, 1, v53);
    }
    *(void *)(v53 + 16) = v57 + 1;
    unint64_t v58 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
    unint64_t v133 = v53;
    v51((char *)(v53 + v58 + *(void *)(v103 + 72) * v57), (uint64_t)v129, v19);
    v59 = v104;
    uint64_t v60 = v105;
    (*v99)(v104, v100, v105);
    v61 = v126;
    sub_2561DB440();
    (*v98)(v59, v60);
    if (v50(v54, 1, v19) == 1)
    {
      uint64_t v62 = (uint64_t)v131;
      if (qword_269F50D58 != -1) {
        swift_once();
      }
      v39 = v126;
      sub_2561DB3C0();
      v38 = *v123;
      (*v123)(v128, v19);
      sub_2561D2D90(v62);
      v38(v39, v19);
      sub_2561D2D90(v54);
      unint64_t v36 = v133;
    }
    else
    {
      v38 = *v123;
      (*v123)(v128, v19);
      sub_2561D2D90((uint64_t)v131);
      v38(v61, v19);
      v51(v55, v54, v19);
      v39 = v61;
      unint64_t v36 = v133;
    }
    v51(v39, (uint64_t)v55, v19);
    uint64_t v37 = v127 - 1;
    if (v127 == 1)
    {
      v38(v39, v19);
LABEL_24:
      (*(void (**)(char *, uint64_t))(v94 + 8))(v132, v95);
      return v36;
    }
  }
  sub_2561D2D90(v49);
  uint64_t v63 = sub_2561DB350();
  if ((v64 & 1) == 0)
  {
    uint64_t v65 = v63;
    uint64_t v66 = sub_2561DB360();
    if ((v67 & 1) == 0)
    {
      uint64_t v68 = v66;
      v69 = v87;
      sub_2561DB4C0();
      v70 = sub_2561DB4D0();
      os_log_type_t v71 = sub_2561DB780();
      BOOL v72 = os_log_type_enabled(v70, v71);
      unint64_t v36 = v133;
      if (v72)
      {
        uint64_t v73 = swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        v135 = (unsigned int (**)(void, void, void))v74;
        *(_DWORD *)uint64_t v73 = 136315650;
        uint64_t v134 = sub_2561D9E88(0xD00000000000001CLL, 0x80000002561DBC60, (uint64_t *)&v135);
        sub_2561DB7C0();
        *(_WORD *)(v73 + 12) = 2048;
        uint64_t v134 = v65;
        sub_2561DB7C0();
        *(_WORD *)(v73 + 22) = 2048;
        uint64_t v134 = v68;
        sub_2561DB7C0();
        _os_log_impl(&dword_2561CF000, v70, v71, "[%s] Next Date nil for scheduleTime: %ld:%ld", (uint8_t *)v73, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x25A2A2890](v74, -1, -1);
        MEMORY[0x25A2A2890](v73, -1, -1);

        unint64_t v36 = v133;
        (*(void (**)(char *, uint64_t))(v91 + 8))(v69, v92);
        uint64_t v75 = (uint64_t)v131;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v91 + 8))(v69, v92);
        uint64_t v75 = v47;
      }
      sub_2561D2D90(v75);
      (*v123)(v126, v19);
      goto LABEL_24;
    }
  }
  v76 = v90;
  sub_2561DB4C0();
  uint64_t v77 = v93;
  v78 = v88;
  uint64_t v79 = v89;
  (*(void (**)(char *, uint64_t, uint64_t))(v93 + 16))(v88, v124, v89);
  v80 = sub_2561DB4D0();
  os_log_type_t v81 = sub_2561DB780();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = swift_slowAlloc();
    v130 = (unsigned int (**)(void, void, void))swift_slowAlloc();
    v135 = v130;
    *(_DWORD *)uint64_t v82 = 136315394;
    uint64_t v134 = sub_2561D9E88(0xD00000000000001CLL, 0x80000002561DBC60, (uint64_t *)&v135);
    sub_2561DB7C0();
    *(_WORD *)(v82 + 12) = 2080;
    sub_2561D2E1C();
    uint64_t v83 = sub_2561DB850();
    uint64_t v134 = sub_2561D9E88(v83, v84, (uint64_t *)&v135);
    sub_2561DB7C0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v78, v79);
    _os_log_impl(&dword_2561CF000, v80, v81, "[%s] DateComponent doesn't contain hour and/or minute %s", (uint8_t *)v82, 0x16u);
    v85 = v130;
    swift_arrayDestroy();
    MEMORY[0x25A2A2890](v85, -1, -1);
    MEMORY[0x25A2A2890](v82, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v79);
  }
  (*(void (**)(char *, uint64_t))(v91 + 8))(v76, v92);
  sub_2561D2D90((uint64_t)v131);
  (*v123)(v126, v19);
  (*(void (**)(char *, uint64_t))(v94 + 8))(v132, v95);
  return v133;
}

void sub_2561D2C98(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_2561D2CFC(uint64_t a1, uint64_t a2)
{
  sub_2561D2C98(0, &qword_26B2AD840, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2561D2D90(uint64_t a1)
{
  sub_2561D2C98(0, &qword_26B2AD840, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2561D2E1C()
{
  unint64_t result = qword_269F50D78;
  if (!qword_269F50D78)
  {
    sub_2561DB380();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F50D78);
  }
  return result;
}

ValueMetadata *type metadata accessor for SOMWidgetRelevanceDateHelper()
{
  return &type metadata for SOMWidgetRelevanceDateHelper;
}

uint64_t MentalHealthLauncherComplicationView.init(overriddenWidgetFamily:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (uint64_t)a2 + *(int *)(type metadata accessor for MentalHealthLauncherComplicationView() + 20);
  return sub_2561D4480(a1, v4);
}

uint64_t MentalHealthLauncherComplicationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  v20[1] = a1;
  sub_2561D609C(0, &qword_269F50D80, MEMORY[0x263F19B20]);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v20 - v3;
  sub_2561D4578(0);
  v20[0] = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = sub_2561DB6C0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for MentalHealthLauncherComplicationView();
  sub_2561D63F0(v1 + *(int *)(v16 + 20), (uint64_t)v11, &qword_26B2AD760, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_2561D56D8((uint64_t)v11, &qword_26B2AD760, MEMORY[0x263F8D8F0]);
    sub_2561D4A60((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  }
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (MEMORY[0x263F1FCE8])
  {
    if (v17 != *MEMORY[0x263F1FCE8] && v17 != *MEMORY[0x263F1FD00]) {
      goto LABEL_6;
    }
  }
  else if (v17 != *MEMORY[0x263F1FD00])
  {
LABEL_6:
    swift_storeEnumTagMultiPayload();
    sub_2561D4D54();
    sub_2561DB580();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  sub_2561D32B8((uint64_t)v7);
  sub_2561D62CC((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))sub_2561D4578);
  swift_storeEnumTagMultiPayload();
  sub_2561D4D54();
  sub_2561DB580();
  return sub_2561D626C((uint64_t)v7, (uint64_t (*)(void))sub_2561D4578);
}

uint64_t sub_2561D32B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v29 - v2;
  uint64_t v33 = sub_2561DB6C0();
  uint64_t v4 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v31 = (uint64_t)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2561DB670();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_2561DB680();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D46A8(0);
  uint64_t v30 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D6104();
  sub_2561DB7B0();
  v29[1] = sub_2561DB650();
  uint64_t v35 = MEMORY[0x263F8EE78];
  sub_2561D6144(&qword_26B2AD910, MEMORY[0x263F46300]);
  sub_2561D4514(0, &qword_26B2AD938, MEMORY[0x263F46300], MEMORY[0x263F8D488]);
  sub_2561D618C();
  sub_2561DB7E0();
  if (qword_26B2AD930 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_26B2AD780;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  sub_2561DB390();
  sub_2561DB660();
  if (qword_26B2AD900 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_26B2AD8F8;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  int v17 = (uint64_t *)&v13[*(int *)(v30 + 36)];
  *int v17 = KeyPath;
  v17[1] = v15;
  unint64_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  swift_retain();
  v18(v10, v7);
  uint64_t v19 = v32;
  uint64_t v20 = sub_2561D38A8();
  uint64_t v22 = v21;
  uint64_t v23 = type metadata accessor for MentalHealthLauncherComplicationView();
  sub_2561D63F0(v19 + *(int *)(v23 + 20), (uint64_t)v3, &qword_26B2AD760, MEMORY[0x263F8D8F0]);
  uint64_t v24 = v33;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v3, 1, v33) == 1)
  {
    sub_2561D56D8((uint64_t)v3, &qword_26B2AD760, MEMORY[0x263F8D8F0]);
    uint64_t v25 = v31;
    sub_2561D4A60(v31);
  }
  else
  {
    uint64_t v25 = v31;
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v31, v3, v24);
  }
  int v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v25, v24);
  if (MEMORY[0x263F1FCE8] && v26 == *MEMORY[0x263F1FCE8])
  {
    char v27 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v25, v24);
    char v27 = 0;
  }
  sub_2561D3B34(v20, v22, v27, v34);
  swift_bridgeObjectRelease();
  return sub_2561D626C((uint64_t)v13, (uint64_t (*)(void))sub_2561D46A8);
}

uint64_t sub_2561D38A8()
{
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v11 - v2;
  uint64_t v4 = sub_2561DB6C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MentalHealthLauncherComplicationView();
  sub_2561D63F0(v0 + *(int *)(v8 + 20), (uint64_t)v3, &qword_26B2AD760, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2561D56D8((uint64_t)v3, &qword_26B2AD760, MEMORY[0x263F8D8F0]);
    sub_2561D4A60((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (MEMORY[0x263F1FCE8] && v9 == *MEMORY[0x263F1FCE8])
  {
    if (qword_26B2AD780 != -1) {
      swift_once();
    }
    return sub_2561DB390();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return 0;
  }
}

uint64_t sub_2561D3B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  void v29[2] = a4;
  sub_2561D46A8(0);
  uint64_t v30 = v8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D46F0(0, qword_269F50DD0, (uint64_t (*)(uint64_t))sub_2561D45C0, (uint64_t (*)(uint64_t))sub_2561D46A8, MEMORY[0x263F19B20]);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)v29 - v11;
  sub_2561D45C0();
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 - 8);
  uint64_t v16 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v29[1] = v29;
    MEMORY[0x270FA5388](v16);
    v29[-4] = a1;
    v29[-3] = a2;
    LOBYTE(v29[-2]) = a3 & 1;
    sub_2561D46F0(0, &qword_269F50D98, (uint64_t (*)(uint64_t))sub_2561D47F0, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
    uint64_t v20 = v19;
    unint64_t v21 = sub_2561D486C();
    unint64_t v22 = sub_2561D4944();
    uint64_t v23 = v30;
    sub_2561DB5E0();
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v18, v14);
    swift_storeEnumTagMultiPayload();
    uint64_t v31 = v23;
    uint64_t v32 = v20;
    unint64_t v33 = v21;
    unint64_t v34 = v22;
    swift_getOpaqueTypeConformance2();
    sub_2561DB580();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  else
  {
    sub_2561D62CC(v4, (uint64_t)v10, (uint64_t (*)(void))sub_2561D46A8);
    sub_2561D62CC((uint64_t)v10, (uint64_t)v12, (uint64_t (*)(void))sub_2561D46A8);
    swift_storeEnumTagMultiPayload();
    sub_2561D46F0(255, &qword_269F50D98, (uint64_t (*)(uint64_t))sub_2561D47F0, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
    uint64_t v26 = v25;
    unint64_t v27 = sub_2561D486C();
    unint64_t v28 = sub_2561D4944();
    uint64_t v31 = v30;
    uint64_t v32 = v26;
    unint64_t v33 = v27;
    unint64_t v34 = v28;
    swift_getOpaqueTypeConformance2();
    sub_2561DB580();
    return sub_2561D626C((uint64_t)v10, (uint64_t (*)(void))sub_2561D46A8);
  }
}

uint64_t sub_2561D3F38()
{
  return sub_2561DB620();
}

uint64_t sub_2561D3F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v36 = a3;
  uint64_t v35 = a4;
  uint64_t v31 = sub_2561DB490();
  uint64_t v6 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D47F0();
  uint64_t v33 = *(void *)(v9 - 8);
  uint64_t v34 = v9;
  MEMORY[0x270FA5388]();
  uint64_t v32 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  sub_2561D6340();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_2561DB5C0();
  uint64_t v13 = v12;
  char v15 = v14;
  if (qword_26B2AD900 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2561DB5B0();
  uint64_t v18 = v17;
  char v20 = v19;
  uint64_t v22 = v21;
  sub_2561D6394(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  uint64_t v37 = v16;
  uint64_t v38 = v18;
  char v39 = v20 & 1;
  uint64_t v40 = v22;
  uint64_t v23 = v31;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F55090], v31);
  sub_2561D63A4(0, &qword_26B2AD950, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2561DBCA0;
  *(void *)(v24 + 32) = 0xD000000000000020;
  *(void *)(v24 + 40) = 0x80000002561DBF70;
  *(void *)(v24 + 48) = 0x6C6562614CLL;
  *(void *)(v24 + 56) = 0xE500000000000000;
  uint64_t v25 = MEMORY[0x263F1A830];
  uint64_t v26 = MEMORY[0x263F1A820];
  unint64_t v27 = v32;
  sub_2561DB5D0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v23);
  sub_2561D6394(v37, v38, v39);
  swift_bridgeObjectRelease();
  uint64_t v37 = v25;
  uint64_t v38 = v26;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v34;
  sub_2561DB630();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v27, v28);
}

uint64_t sub_2561D42C0()
{
  uint64_t result = sub_2561DB640();
  qword_26B2AD8F8 = result;
  return result;
}

uint64_t sub_2561D42E0()
{
  uint64_t v0 = sub_2561DB490();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F55090], v0);
  uint64_t v4 = sub_2561DB750();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_26B2AD920 = v4;
  *(void *)algn_26B2AD928 = v6;
  return result;
}

uint64_t sub_2561D43EC()
{
  return sub_2561DB510();
}

uint64_t sub_2561D4410()
{
  return sub_2561DB510();
}

uint64_t type metadata accessor for MentalHealthLauncherComplicationView()
{
  uint64_t result = qword_26B2AD6A8;
  if (!qword_26B2AD6A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2561D4480(uint64_t a1, uint64_t a2)
{
  sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2561D4514(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_2561D4578(uint64_t a1)
{
}

void sub_2561D45C0()
{
  if (!qword_269F50D90)
  {
    sub_2561D46A8(255);
    sub_2561D46F0(255, &qword_269F50D98, (uint64_t (*)(uint64_t))sub_2561D47F0, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
    sub_2561D486C();
    sub_2561D4944();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_269F50D90);
    }
  }
}

void sub_2561D46A8(uint64_t a1)
{
}

void sub_2561D46F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4(255);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_2561D4774()
{
  if (!qword_26B2AD8E8)
  {
    sub_2561D63A4(255, &qword_26B2AD908, MEMORY[0x263F1B440], MEMORY[0x263F8D8F0]);
    unint64_t v0 = sub_2561DB590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2AD8E8);
    }
  }
}

void sub_2561D47F0()
{
  if (!qword_26B2AD8F0)
  {
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2AD8F0);
    }
  }
}

unint64_t sub_2561D486C()
{
  unint64_t result = qword_26B2AD8D0;
  if (!qword_26B2AD8D0)
  {
    sub_2561D46A8(255);
    sub_2561D6144(&qword_26B2AD918, MEMORY[0x263F46310]);
    sub_2561D6144(&qword_26B2AD8E0, (void (*)(uint64_t))sub_2561D4774);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2AD8D0);
  }
  return result;
}

unint64_t sub_2561D4944()
{
  unint64_t result = qword_269F50DA0;
  if (!qword_269F50DA0)
  {
    sub_2561D46F0(255, &qword_269F50D98, (uint64_t (*)(uint64_t))sub_2561D47F0, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
    swift_getOpaqueTypeConformance2();
    sub_2561D6144(&qword_269F50DA8, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F50DA0);
  }
  return result;
}

uint64_t sub_2561D4A60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2561DB530();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
  sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (void *)((char *)v19 - v9);
  sub_2561D63F0(v2, (uint64_t)v19 - v9, &qword_26B2AD740, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_2561DB6C0();
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    uint64_t v13 = *v10;
    os_log_type_t v14 = sub_2561DB790();
    char v15 = sub_2561DB5A0();
    os_log_type_t v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      v19[1] = v13;
      *(_DWORD *)uint64_t v17 = 136315138;
      v19[2] = sub_2561D9E88(0x6146746567646957, 0xEC000000796C696DLL, &v20);
      sub_2561DB7C0();
      _os_log_impl(&dword_2561CF000, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A2890](v18, -1, -1);
      MEMORY[0x25A2A2890](v17, -1, -1);
    }

    sub_2561DB520();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_2561D4D54()
{
  unint64_t result = qword_269F50DB0;
  if (!qword_269F50DB0)
  {
    sub_2561D4578(255);
    sub_2561D46A8(255);
    sub_2561D46F0(255, &qword_269F50D98, (uint64_t (*)(uint64_t))sub_2561D47F0, MEMORY[0x263F1A470], MEMORY[0x263F18E28]);
    sub_2561D486C();
    sub_2561D4944();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F50DB0);
  }
  return result;
}

uint64_t sub_2561D4E58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for MentalHealthLauncherComplicationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2561DB6C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2561DB6C0();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for MentalHealthLauncherComplicationView(uint64_t a1, uint64_t a2)
{
  sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2561DB6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2561DB6C0();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

void *initializeWithCopy for MentalHealthLauncherComplicationView(void *a1, void *a2, uint64_t a3)
{
  sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2561DB6C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2561DB6C0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

void *assignWithCopy for MentalHealthLauncherComplicationView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2561D56D8((uint64_t)a1, &qword_26B2AD740, MEMORY[0x263F185C8]);
    sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], v6);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2561DB6C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_2561DB6C0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_11;
  }
  if (v15)
  {
LABEL_11:
    sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_2561D56D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  sub_2561D4514(0, a2, MEMORY[0x263F1FD10], a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *initializeWithTake for MentalHealthLauncherComplicationView(char *a1, char *a2, uint64_t a3)
{
  sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_2561DB6C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2561DB6C0();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithTake for MentalHealthLauncherComplicationView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F185C8];
    sub_2561D56D8((uint64_t)a1, &qword_26B2AD740, MEMORY[0x263F185C8]);
    sub_2561D4514(0, &qword_26B2AD740, MEMORY[0x263F1FD10], v6);
    uint64_t v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_2561DB6C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_2561DB6C0();
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_10;
  }
  if (v17)
  {
LABEL_10:
    sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthLauncherComplicationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2561D5C0C);
}

uint64_t sub_2561D5C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2561D4514(0, &qword_269F50DB8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for MentalHealthLauncherComplicationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2561D5D78);
}

uint64_t sub_2561D5D78(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2561D4514(0, &qword_269F50DB8, MEMORY[0x263F1FD10], MEMORY[0x263F185D0]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    sub_2561D4514(0, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_2561D5EDC()
{
  sub_2561D4514(319, &qword_26B2AD740, MEMORY[0x263F1FD10], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_2561D4514(319, &qword_26B2AD760, MEMORY[0x263F1FD10], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_2561D6008()
{
  unint64_t result = qword_269F50DC0;
  if (!qword_269F50DC0)
  {
    sub_2561D609C(255, &qword_269F50DC8, MEMORY[0x263F19B28]);
    sub_2561D4D54();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F50DC0);
  }
  return result;
}

void sub_2561D609C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    sub_2561D4578(255);
    unint64_t v7 = a3(a1, v6, MEMORY[0x263F1BA08]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_2561D6104()
{
  unint64_t result = qword_26B2AD948;
  if (!qword_26B2AD948)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B2AD948);
  }
  return result;
}

uint64_t sub_2561D6144(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2561D618C()
{
  unint64_t result = qword_26B2AD940;
  if (!qword_26B2AD940)
  {
    sub_2561D4514(255, &qword_26B2AD938, MEMORY[0x263F46300], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2AD940);
  }
  return result;
}

uint64_t sub_2561D6214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2561DB4F0();
  *a1 = result;
  return result;
}

uint64_t sub_2561D6240()
{
  return sub_2561DB500();
}

uint64_t sub_2561D626C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2561D62CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2561D6334@<X0>(uint64_t a1@<X8>)
{
  return sub_2561D3F58(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_2561D6340()
{
  unint64_t result = qword_26B2AD778;
  if (!qword_26B2AD778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2AD778);
  }
  return result;
}

uint64_t sub_2561D6394(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

void sub_2561D63A4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2561D63F0(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_2561D4514(0, a3, MEMORY[0x263F1FD10], a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_2561D646C(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v49 = sub_2561DB4E0();
  uint64_t v1 = *(void *)(v49 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v49);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  unint64_t v7 = (char *)&v48 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v48 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v48 - v11;
  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v14)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(v14, sel_features);

  if (!v16)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unsigned int v17 = objc_msgSend(v16, sel_chamomile);

  if (!v17)
  {
    sub_2561DB4C0();
    uint64_t v24 = sub_2561DB4D0();
    os_log_type_t v25 = sub_2561DB7A0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_2561CF000, v24, v25, "[MentalHealthLauncherComplication] not available because chamomile feature disabled", v26, 2u);
      MEMORY[0x25A2A2890](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v12, v49);
    goto LABEL_12;
  }
  id v18 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v18) {
    goto LABEL_26;
  }
  char v19 = v18;
  unsigned __int8 v20 = objc_msgSend(v18, sel_tinkerModeEnabled);

  if (v20)
  {
    sub_2561DB4C0();
    uint64_t v21 = sub_2561DB4D0();
    os_log_type_t v22 = sub_2561DB7A0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_2561CF000, v21, v22, "[MentalHealthLauncherComplication] not available in tinker mode", v23, 2u);
      MEMORY[0x25A2A2890](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v49);
LABEL_12:
    sub_2561D731C();
    sub_2561D724C();
    uint64_t v28 = v27;
    sub_2561D70C4();
    uint64_t v30 = v29;
    uint64_t v31 = sub_2561D98B4(&qword_26B2AD768, (void (*)(uint64_t))sub_2561D70C4);
    unint64_t v32 = sub_2561D6340();
    uint64_t v33 = MEMORY[0x263F8D310];
    uint64_t v51 = v30;
    uint64_t v52 = MEMORY[0x263F8D310];
    uint64_t v53 = v31;
    unint64_t v54 = v32;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v51 = v28;
    uint64_t v52 = v33;
    uint64_t v53 = OpaqueTypeConformance2;
    unint64_t v54 = v32;
    swift_getOpaqueTypeConformance2();
    sub_2561DB550();
    swift_bridgeObjectRelease();
    return;
  }
  id v35 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v35) {
    goto LABEL_27;
  }
  int v36 = v35;
  unsigned __int8 v37 = objc_msgSend(v35, sel_isiPad);

  if ((v37 & 1) == 0)
  {
LABEL_18:
    sub_2561DB4C0();
    uint64_t v42 = sub_2561DB4D0();
    os_log_type_t v43 = sub_2561DB7A0();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_2561CF000, v42, v43, "[MentalHealthLauncherComplication] is available", v44, 2u);
      MEMORY[0x25A2A2890](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v49);
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
  id v38 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v38) {
    goto LABEL_28;
  }
  char v39 = v38;
  id v40 = objc_msgSend(v38, sel_features);

  if (v40)
  {
    unsigned __int8 v41 = objc_msgSend(v40, sel_stanley);

    if ((v41 & 1) == 0)
    {
      sub_2561DB4C0();
      uint64_t v45 = sub_2561DB4D0();
      os_log_type_t v46 = sub_2561DB7A0();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl(&dword_2561CF000, v45, v46, "[MentalHealthLauncherComplication] not available on iPad because stanley feature disabled", v47, 2u);
        MEMORY[0x25A2A2890](v47, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v7, v49);
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_29:
  __break(1u);
}

MentalHealthWidgetUI::MentalHealthLauncherComplication __swiftcall MentalHealthLauncherComplication.init()()
{
  *unint64_t v0 = 0xD000000000000020;
  v0[1] = 0x80000002561DBDB0;
  return result;
}

id MentalHealthLauncherComplication.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  sub_2561D70C4();
  uint64_t v2 = v1;
  uint64_t v37 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D724C();
  uint64_t v42 = v5;
  uint64_t v38 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D731C();
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  MEMORY[0x270FA5388](v8);
  int v36 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561D742C();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v39 = (uint64_t)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone(MEMORY[0x263F55050]);
  swift_bridgeObjectRetain();
  id v47 = objc_msgSend(v12, sel_init);
  sub_2561D7198();
  uint64_t v13 = type metadata accessor for MentalHealthLauncherComplicationView();
  uint64_t v14 = sub_2561D98B4(&qword_26B2AD6A0, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView);
  uint64_t v43 = v13;
  uint64_t v44 = v14;
  swift_getOpaqueTypeConformance2();
  sub_2561D7A24();
  sub_2561DB6F0();
  if (qword_26B2AD780 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_2561DB390();
  uint64_t v44 = v15;
  uint64_t v16 = sub_2561D98B4(&qword_26B2AD768, (void (*)(uint64_t))sub_2561D70C4);
  unint64_t v17 = sub_2561D6340();
  uint64_t v18 = MEMORY[0x263F8D310];
  sub_2561DB560();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v2);
  id v47 = (id)sub_2561DB390();
  uint64_t v48 = v19;
  uint64_t v43 = v2;
  uint64_t v44 = v18;
  uint64_t v45 = v16;
  unint64_t v46 = v17;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v36;
  uint64_t v22 = v42;
  sub_2561DB540();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v22);
  sub_2561DA520(0, &qword_26B2AD820, MEMORY[0x263F1FD10], MEMORY[0x263F8E0F8]);
  uint64_t v23 = sub_2561DB6C0();
  uint64_t v24 = *(void *)(v23 - 8);
  unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_2561DBDA0;
  (*(void (**)(unint64_t, void, uint64_t))(v24 + 104))(v26 + v25, *MEMORY[0x263F1FD00], v23);
  uint64_t v27 = v39;
  sub_2561D646C(v39);
  swift_bridgeObjectRelease();
  uint64_t v28 = v41;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v41);
  id result = objc_msgSend(self, sel_sharedBehavior);
  if (result)
  {
    uint64_t v30 = result;
    objc_msgSend(result, sel_tinkerModeEnabled);

    uint64_t v43 = v22;
    uint64_t v44 = MEMORY[0x263F8D310];
    uint64_t v45 = OpaqueTypeConformance2;
    unint64_t v46 = v17;
    uint64_t v31 = swift_getOpaqueTypeConformance2();
    uint64_t v43 = v28;
    uint64_t v44 = v31;
    swift_getOpaqueTypeConformance2();
    uint64_t v32 = v34;
    sub_2561DB570();
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v27, v32);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2561D70C4()
{
  if (!qword_26B2AD770)
  {
    sub_2561D7198();
    type metadata accessor for MentalHealthLauncherComplicationView();
    sub_2561D98B4(&qword_26B2AD6A0, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView);
    swift_getOpaqueTypeConformance2();
    unint64_t v0 = sub_2561DB700();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2AD770);
    }
  }
}

void sub_2561D7198()
{
  if (!qword_26B2AD758)
  {
    type metadata accessor for MentalHealthLauncherComplicationView();
    sub_2561D98B4(&qword_26B2AD6A0, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2AD758);
    }
  }
}

void sub_2561D724C()
{
  if (!qword_26B2AD750)
  {
    sub_2561D70C4();
    sub_2561D98B4(&qword_26B2AD768, (void (*)(uint64_t))sub_2561D70C4);
    sub_2561D6340();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2AD750);
    }
  }
}

void sub_2561D731C()
{
  if (!qword_26B2AD748)
  {
    sub_2561D724C();
    sub_2561D70C4();
    sub_2561D98B4(&qword_26B2AD768, (void (*)(uint64_t))sub_2561D70C4);
    sub_2561D6340();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2AD748);
    }
  }
}

void sub_2561D742C()
{
  if (!qword_26B2AD958)
  {
    sub_2561D731C();
    sub_2561D724C();
    sub_2561D70C4();
    sub_2561D98B4(&qword_26B2AD768, (void (*)(uint64_t))sub_2561D70C4);
    sub_2561D6340();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B2AD958);
    }
  }
}

uint64_t sub_2561D7574@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  v30[0] = (uint64_t (*)(uint64_t))MEMORY[0x263F551D8];
  v30[1] = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2561DA520(0, &qword_26B2AD8A8, MEMORY[0x263F551D8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v30 - v3;
  uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x263F55278];
  sub_2561DA520(0, &qword_26B2AD8B0, MEMORY[0x263F55278], v1);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v30 - v7;
  uint64_t v9 = (uint64_t (*)(uint64_t))MEMORY[0x263F06EA8];
  sub_2561DA520(0, &qword_26B2AD8A0, MEMORY[0x263F06EA8], v1);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)v30 - v11;
  uint64_t v13 = (uint64_t (*)(uint64_t))MEMORY[0x263F1FD10];
  sub_2561DA520(0, &qword_26B2AD760, MEMORY[0x263F1FD10], v1);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v30 - v15;
  uint64_t v17 = type metadata accessor for MentalHealthLauncherComplicationView();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  unsigned __int8 v20 = (uint64_t *)((char *)v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v30 - v21;
  uint64_t v23 = sub_2561DB6C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v16, 1, 1, v23);
  uint64_t *v20 = swift_getKeyPath();
  sub_2561DA520(0, &qword_26B2AD740, v13, MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  sub_2561D4480((uint64_t)v16, (uint64_t)v20 + *(int *)(v17 + 20));
  sub_2561DADC0((uint64_t)v20, (uint64_t)v22);
  uint64_t v24 = *MEMORY[0x263F55258];
  uint64_t v25 = sub_2561DB4B0();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v8, v24, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v8, 0, 1, v25);
  uint64_t v27 = sub_2561DB4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v4, 1, 1, v27);
  sub_2561DB3A0();
  sub_2561DAE24((uint64_t)v4, &qword_26B2AD8A8, v30[0]);
  sub_2561DAE24((uint64_t)v8, &qword_26B2AD8B0, v5);
  uint64_t v28 = sub_2561DB3B0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v12, 0, 1, v28);
  sub_2561D98B4(&qword_26B2AD6A0, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView);
  sub_2561DB5F0();
  sub_2561DAE24((uint64_t)v12, &qword_26B2AD8A0, v9);
  return sub_2561DAE94((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for MentalHealthLauncherComplicationView);
}

unint64_t sub_2561D7A24()
{
  unint64_t result = qword_26B2AD738;
  if (!qword_26B2AD738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2AD738);
  }
  return result;
}

uint64_t sub_2561D7A78()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2561D7A94(void *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x80000002561DBDB0;
}

void *initializeBufferWithCopyOfBuffer for MentalHealthLauncherComplication(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MentalHealthLauncherComplication()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for MentalHealthLauncherComplication(void *a1, void *a2)
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

void *assignWithTake for MentalHealthLauncherComplication(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthLauncherComplication(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MentalHealthLauncherComplication(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MentalHealthLauncherComplication()
{
  return &type metadata for MentalHealthLauncherComplication;
}

uint64_t sub_2561D7C08()
{
  return swift_getOpaqueTypeConformance2();
}

void **initializeBufferWithCopyOfBuffer for MentalHealthLauncherComplicationTimelineProvider(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for MentalHealthLauncherComplicationTimelineProvider(id *a1)
{
}

void **assignWithCopy for MentalHealthLauncherComplicationTimelineProvider(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void **assignWithTake for MentalHealthLauncherComplicationTimelineProvider(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthLauncherComplicationTimelineProvider(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MentalHealthLauncherComplicationTimelineProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthLauncherComplicationTimelineProvider()
{
  return &type metadata for MentalHealthLauncherComplicationTimelineProvider;
}

uint64_t sub_2561D7E9C(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2561DB3D0();
  a2(v5);
  return sub_2561DAE94((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
}

uint64_t sub_2561D7F44(uint64_t a1)
{
  uint64_t v4 = *v1;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_2561DB2EC;
  return sub_2561D7FE4(a1, v4);
}

uint64_t sub_2561D7FE4(uint64_t a1, uint64_t a2)
{
  v2[22] = a1;
  v2[23] = a2;
  uint64_t v3 = sub_2561DB3E0();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = swift_task_alloc();
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2561DA520(0, &qword_26B2AD830, MEMORY[0x263F079C8], MEMORY[0x263F8D8F0]);
  v2[27] = swift_task_alloc();
  sub_2561DA520(0, &qword_26B2AD828, MEMORY[0x263F07920], v4);
  v2[28] = swift_task_alloc();
  uint64_t v5 = sub_2561DB380();
  v2[29] = v5;
  v2[30] = *(void *)(v5 - 8);
  v2[31] = swift_task_alloc();
  uint64_t v6 = sub_2561DB300();
  v2[32] = v6;
  v2[33] = *(void *)(v6 - 8);
  v2[34] = swift_task_alloc();
  sub_2561DB330();
  v2[35] = swift_task_alloc();
  sub_2561DAC78(0, (unint64_t *)&qword_26B2AD838, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
  v2[36] = v7;
  v2[37] = *(void *)(v7 - 8);
  v2[38] = swift_task_alloc();
  uint64_t v8 = sub_2561DB4E0();
  v2[39] = v8;
  v2[40] = *(void *)(v8 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2561D8354, 0, 0);
}

uint64_t sub_2561D8354()
{
  uint64_t v112 = v0;
  sub_2561DB4C0();
  uint64_t v1 = sub_2561DB4D0();
  os_log_type_t v2 = sub_2561DB7A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 368);
    uint64_t v4 = *(void *)(v0 + 312);
    uint64_t v5 = *(void *)(v0 + 320);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v111[0] = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v0 + 168) = sub_2561D9E88(0xD000000000000030, 0x80000002561DBE20, v111);
    sub_2561DB7C0();
    _os_log_impl(&dword_2561CF000, v1, v2, "[%{public}s] Retrieving widget relevance entries", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2A2890](v7, -1, -1);
    MEMORY[0x25A2A2890](v6, -1, -1);

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v8(v3, v4);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 368);
    uint64_t v10 = *(void *)(v0 + 312);
    uint64_t v11 = *(void *)(v0 + 320);

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v8(v9, v10);
  }
  id v12 = *(void **)(v0 + 184);
  *(void *)(v0 + 128) = MEMORY[0x263F8EE78];
  if (!objc_msgSend(v12, sel_hasAnyStateOfMindReminderEnabled))
  {
    sub_2561DB4C0();
    unsigned __int8 v20 = sub_2561DB4D0();
    os_log_type_t v21 = sub_2561DB7A0();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v23 = *(void *)(v0 + 328);
    uint64_t v24 = *(void *)(v0 + 312);
    if (!v22)
    {

      v8(v23, v24);
      goto LABEL_35;
    }
    uint64_t v25 = swift_slowAlloc();
    unsigned int v110 = v8;
    uint64_t v26 = swift_slowAlloc();
    v111[0] = v26;
    *(_DWORD *)uint64_t v25 = 136446466;
    *(void *)(v0 + 96) = sub_2561D9E88(0xD000000000000030, 0x80000002561DBE20, v111);
    sub_2561DB7C0();
    *(_WORD *)(v25 + 12) = 2048;
    *(void *)(v0 + 88) = 0;
    sub_2561DB7C0();
    _os_log_impl(&dword_2561CF000, v20, v21, "[%{public}s] No enabled reminders so no Smart Stack relevance entries are provided (Count: %ld)", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2A2890](v26, -1, -1);
    MEMORY[0x25A2A2890](v25, -1, -1);

    uint64_t v27 = v23;
    goto LABEL_33;
  }
  unsigned int v110 = v8;
  if (objc_msgSend(*(id *)(v0 + 184), sel_endOfDayNotificationsEnabled))
  {
    sub_2561DB4C0();
    uint64_t v13 = sub_2561DB4D0();
    os_log_type_t v14 = sub_2561DB7A0();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = *(void *)(v0 + 360);
    uint64_t v17 = *(void *)(v0 + 312);
    if (v15)
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v111[0] = v19;
      *(_DWORD *)uint64_t v18 = 136446210;
      *(void *)(v0 + 160) = sub_2561D9E88(0xD000000000000030, 0x80000002561DBE20, v111);
      sub_2561DB7C0();
      _os_log_impl(&dword_2561CF000, v13, v14, "[%{public}s] Bedtime relevance added", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A2890](v19, -1, -1);
      MEMORY[0x25A2A2890](v18, -1, -1);

      v110(v16, v17);
    }
    else
    {

      v8(v16, v17);
    }
    uint64_t v28 = *(void *)(v0 + 272);
    uint64_t v30 = *(void *)(v0 + 256);
    uint64_t v29 = *(void *)(v0 + 264);
    sub_2561DB2F0();
    sub_2561DB320();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    sub_2561DB6A0();
    unint64_t v31 = *(void *)(v0 + 128);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v31 = sub_2561D9BDC(0, *(void *)(v31 + 16) + 1, 1, v31);
    }
    unint64_t v33 = *(void *)(v31 + 16);
    unint64_t v32 = *(void *)(v31 + 24);
    if (v33 >= v32 >> 1) {
      unint64_t v31 = sub_2561D9BDC(v32 > 1, v33 + 1, 1, v31);
    }
    uint64_t v35 = *(void *)(v0 + 296);
    uint64_t v34 = *(void *)(v0 + 304);
    uint64_t v36 = *(void *)(v0 + 288);
    *(void *)(v31 + 16) = v33 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v35 + 32))(v31+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v33, v34, v36);
    *(void *)(v0 + 128) = v31;
  }
  if (objc_msgSend(*(id *)(v0 + 184), sel_middayNotificationsEnabled))
  {
    sub_2561DB4C0();
    uint64_t v37 = sub_2561DB4D0();
    os_log_type_t v38 = sub_2561DB7A0();
    BOOL v39 = os_log_type_enabled(v37, v38);
    uint64_t v40 = *(void *)(v0 + 352);
    uint64_t v41 = *(void *)(v0 + 312);
    if (v39)
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v111[0] = v43;
      *(_DWORD *)uint64_t v42 = 136446210;
      *(void *)(v0 + 152) = sub_2561D9E88(0xD000000000000030, 0x80000002561DBE20, v111);
      sub_2561DB7C0();
      _os_log_impl(&dword_2561CF000, v37, v38, "[%{public}s] Midday relevance added", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A2890](v43, -1, -1);
      MEMORY[0x25A2A2890](v42, -1, -1);
    }

    v110(v40, v41);
    uint64_t v45 = *(void *)(v0 + 240);
    uint64_t v44 = *(void *)(v0 + 248);
    uint64_t v47 = *(void *)(v0 + 224);
    uint64_t v46 = *(void *)(v0 + 232);
    unint64_t v48 = *(void *)(v0 + 208);
    uint64_t v49 = *(void *)(v0 + 216);
    uint64_t v50 = *(void *)(v0 + 192);
    uint64_t v51 = *(void *)(v0 + 200);
    uint64_t v52 = sub_2561DB470();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v47, 1, 1, v52);
    uint64_t v53 = sub_2561DB480();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v49, 1, 1, v53);
    LOBYTE(v106) = 1;
    uint64_t v105 = 0;
    LOBYTE(v104) = 1;
    uint64_t v103 = 0;
    LOBYTE(v102) = 1;
    uint64_t v101 = 0;
    LOBYTE(v100) = 1;
    uint64_t v99 = 0;
    LOBYTE(v98) = 1;
    uint64_t v97 = 0;
    LOBYTE(v96) = 1;
    uint64_t v95 = 0;
    LOBYTE(v94) = 1;
    uint64_t v93 = 0;
    LOBYTE(v92) = 1;
    uint64_t v91 = 0;
    LOBYTE(v90) = 0;
    uint64_t v89 = 0;
    LOBYTE(v88) = 0;
    uint64_t v87 = 12;
    LOBYTE(v86) = 1;
    uint64_t v85 = 0;
    sub_2561DB370();
    sub_2561DB3D0();
    unint64_t v54 = sub_2561D1C94(v44, v48);
    (*(void (**)(unint64_t, uint64_t))(v51 + 8))(v48, v50);
    uint64_t v55 = sub_2561D1878(v54);
    swift_bridgeObjectRelease();
    sub_2561D9234(v55);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  }
  id v56 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0 + 184), sel_customReminderSchedule, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100,
            v101,
            v102,
            v103,
            v104,
            v105,
            v106));
  sub_2561DA584();
  unint64_t v57 = sub_2561DB770();

  if (v57 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_2561DB830();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v58 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v58)
  {
    v59 = *(void **)(v0 + 184);
    sub_2561D940C(v59);
    sub_2561D9234(v60);
    sub_2561DB4C0();
    uint64_t v61 = *(void *)(v0 + 128);
    id v62 = v59;
    swift_bridgeObjectRetain_n();
    id v63 = v62;
    char v64 = sub_2561DB4D0();
    os_log_type_t v65 = sub_2561DB7A0();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = *(void **)(v0 + 184);
      uint64_t v67 = swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      v111[0] = v68;
      *(_DWORD *)uint64_t v67 = 136446722;
      *(void *)(v0 + 104) = sub_2561D9E88(0xD000000000000030, 0x80000002561DBE20, v111);
      sub_2561DB7C0();
      *(_WORD *)(v67 + 12) = 2048;
      id v69 = objc_msgSend(v66, sel_customReminderSchedule);
      unint64_t v70 = sub_2561DB770();

      os_log_type_t v71 = *(void **)(v0 + 184);
      if (v70 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v72 = sub_2561DB830();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v72 = *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }

      uint64_t v107 = *(void *)(v0 + 312);
      uint64_t v108 = *(void *)(v0 + 344);
      uint64_t v73 = *(void **)(v0 + 184);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 112) = v72;
      sub_2561DB7C0();

      *(_WORD *)(v67 + 22) = 2048;
      uint64_t v74 = *(void *)(v61 + 16);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 120) = v74;
      sub_2561DB7C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2561CF000, v64, v65, "[%{public}s] Widget relevance provided (including %ld custom scheduled reminders) (Count: %ld)", (uint8_t *)v67, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25A2A2890](v68, -1, -1);
      MEMORY[0x25A2A2890](v67, -1, -1);

      v110(v108, v107);
      goto LABEL_35;
    }
    uint64_t v78 = *(void *)(v0 + 344);
    uint64_t v24 = *(void *)(v0 + 312);
    uint64_t v82 = *(void **)(v0 + 184);
    swift_bridgeObjectRelease_n();

    goto LABEL_32;
  }
  sub_2561DB4C0();
  uint64_t v75 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  char v64 = sub_2561DB4D0();
  os_log_type_t v76 = sub_2561DB7A0();
  BOOL v77 = os_log_type_enabled(v64, v76);
  uint64_t v78 = *(void *)(v0 + 336);
  uint64_t v24 = *(void *)(v0 + 312);
  if (!v77)
  {
    swift_bridgeObjectRelease();
LABEL_32:

    uint64_t v27 = v78;
LABEL_33:
    uint64_t v81 = v24;
    goto LABEL_34;
  }
  uint64_t v109 = *(void *)(v0 + 336);
  uint64_t v79 = swift_slowAlloc();
  uint64_t v80 = swift_slowAlloc();
  v111[0] = v80;
  *(_DWORD *)uint64_t v79 = 136446466;
  *(void *)(v0 + 136) = sub_2561D9E88(0xD000000000000030, 0x80000002561DBE20, v111);
  sub_2561DB7C0();
  *(_WORD *)(v79 + 12) = 2048;
  *(void *)(v0 + 144) = *(void *)(v75 + 16);
  sub_2561DB7C0();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_2561CF000, v64, v76, "[%{public}s] Widget relevance provided (no custom scheduled reminders) (Count: %ld)", (uint8_t *)v79, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x25A2A2890](v80, -1, -1);
  MEMORY[0x25A2A2890](v79, -1, -1);

  uint64_t v27 = v109;
  uint64_t v81 = v24;
LABEL_34:
  v110(v27, v81);
LABEL_35:
  swift_beginAccess();
  sub_2561DB690();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v83 = *(uint64_t (**)(void))(v0 + 8);
  return v83();
}

uint64_t sub_2561D9114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2561DB2EC;
  return MEMORY[0x270F07728](a1, a2, a3);
}

uint64_t sub_2561D91C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2561DB3E0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_2561D9234(uint64_t a1)
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
    int64_t v24 = v4 + v2;
  }
  else {
    int64_t v24 = v4;
  }
  unint64_t v3 = sub_2561D9BDC(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  sub_2561DAC78(0, (unint64_t *)&qword_26B2AD838, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
  uint64_t v13 = *(void *)(*(void *)(v11 - 8) + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(v11 - 8) + 80);
  uint64_t v14 = (v12 + 32) & ~v12;
  unint64_t v15 = v3 + v14 + v13 * v9;
  unint64_t v16 = a1 + v14;
  uint64_t v17 = v13 * v8;
  unint64_t v18 = v15 + v17;
  unint64_t v19 = v16 + v17;
  if (v16 < v18 && v15 < v19) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v21 = *(void *)(v3 + 16);
  BOOL v22 = __OFADD__(v21, v8);
  uint64_t v23 = v21 + v8;
  if (!v22)
  {
    *(void *)(v3 + 16) = v23;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2561DB840();
  __break(1u);
  return result;
}

void sub_2561D940C(void *a1)
{
  uint64_t v22 = sub_2561DB3E0();
  uint64_t v2 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  int64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2561DB380();
  uint64_t v5 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x263F8EE78];
  id v8 = objc_msgSend(a1, sel_customReminderSchedule);
  sub_2561DA584();
  unint64_t v9 = sub_2561DB770();

  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_2561DB830();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (v10 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v20 = v9 & 0xC000000000000001;
    uint64_t v12 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v13 = (void (**)(char *, uint64_t))(v5 + 8);
    unint64_t v14 = v9;
    do
    {
      if (v20) {
        id v15 = (id)MEMORY[0x25A2A2500](v11, v9);
      }
      else {
        id v15 = *(id *)(v9 + 8 * v11 + 32);
      }
      unint64_t v16 = v15;
      ++v11;
      id v17 = objc_msgSend(v15, sel_dateComponents, v20);
      sub_2561DB340();

      sub_2561DB3D0();
      unint64_t v18 = sub_2561D1C94((uint64_t)v7, (unint64_t)v4);
      (*v12)(v4, v22);
      (*v13)(v7, v21);
      uint64_t v19 = sub_2561D1878(v18);
      swift_bridgeObjectRelease();
      sub_2561D9234(v19);

      unint64_t v9 = v14;
    }
    while (v10 != v11);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2561D96D8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2561D9778;
  return sub_2561D7FE4(a1, v4);
}

uint64_t sub_2561D9778()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2561D986C()
{
  return sub_2561D98B4(&qword_26B2AD8B8, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
}

uint64_t sub_2561D98B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for MentalHealthLauncherComplicationTimelineEntry()
{
  uint64_t result = qword_26B2AD8C0;
  if (!qword_26B2AD8C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2561D9948(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_2561DA520(0, &qword_269F50E00, MEMORY[0x263F07490], MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(sub_2561DB3E0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2561DB820();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2561DB3E0() - 8);
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
    sub_2561DA5C4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2561D9BDC(char a1, int64_t a2, char a3, unint64_t a4)
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
  uint64_t v10 = MEMORY[0x263F8EE60];
  if (!v9)
  {
    size_t v14 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2561DA71C();
  sub_2561DAC78(0, (unint64_t *)&qword_26B2AD838, v10 + 8, MEMORY[0x263F1FCA0]);
  uint64_t v12 = *(void *)(*(void *)(v11 - 8) + 72);
  unint64_t v13 = (*(unsigned __int8 *)(*(void *)(v11 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80);
  size_t v14 = (void *)swift_allocObject();
  size_t v15 = _swift_stdlib_malloc_size(v14);
  if (!v12 || (v15 - v13 == 0x8000000000000000 ? (BOOL v16 = v12 == -1) : (BOOL v16 = 0), v16))
  {
LABEL_29:
    uint64_t result = sub_2561DB820();
    __break(1u);
    return result;
  }
  v14[2] = v8;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_19:
  sub_2561DAC78(0, (unint64_t *)&qword_26B2AD838, v10 + 8, MEMORY[0x263F1FCA0]);
  uint64_t v18 = *(void *)(v17 - 8);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v20 = (unint64_t)v14 + v19;
  if (a1)
  {
    if ((unint64_t)v14 < a4 || v20 >= a4 + v19 + *(void *)(v18 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v14 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2561DAA4C(0, v8, v20, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v14;
}

uint64_t sub_2561D9E88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2561D9F5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2561DAC1C((uint64_t)v12, *a3);
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
      sub_2561DAC1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2561D9F5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2561DB7D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2561DA118(a5, a6);
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
  uint64_t v8 = sub_2561DB810();
  if (!v8)
  {
    sub_2561DB820();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2561DB840();
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

uint64_t sub_2561DA118(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2561DA1B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2561DA3B0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2561DA3B0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2561DA1B0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2561DA328(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2561DB7F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2561DB820();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2561DB760();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2561DB840();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2561DB820();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2561DA328(uint64_t a1, uint64_t a2)
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
  sub_2561DAC78(0, &qword_269F50E08, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2561DA3B0(char a1, int64_t a2, char a3, char *a4)
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
    sub_2561DAC78(0, &qword_269F50E08, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_2561DB840();
  __break(1u);
  return result;
}

void sub_2561DA520(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_2561DA584()
{
  unint64_t result = qword_269F50DF8;
  if (!qword_269F50DF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F50DF8);
  }
  return result;
}

uint64_t sub_2561DA5C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2561DB3E0() - 8);
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
  uint64_t result = sub_2561DB840();
  __break(1u);
  return result;
}

void sub_2561DA71C()
{
  if (!qword_269F50D70)
  {
    sub_2561DAC78(255, (unint64_t *)&qword_26B2AD838, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
    unint64_t v0 = sub_2561DB860();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F50D70);
    }
  }
}

uint64_t sub_2561DA79C(uint64_t a1, void (*a2)(char *))
{
  BOOL v16 = a2;
  uint64_t v2 = sub_2561DB720();
  MEMORY[0x270FA5388](v2 - 8);
  sub_2561DACC4();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_2561DB3D0();
  sub_2561DA520(0, &qword_269F50E18, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry, MEMORY[0x263F8E0F8]);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2561DBDA0;
  sub_2561DAD58((uint64_t)v11, v13 + v12);
  sub_2561DB710();
  sub_2561D98B4(&qword_26B2AD8B8, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
  sub_2561DB730();
  v16(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2561DAE94((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
  return swift_release();
}

uint64_t sub_2561DAA4C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    sub_2561DAC78(0, (unint64_t *)&qword_26B2AD838, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F1FCA0]);
    uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 72);
    unint64_t v10 = a4
        + ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80))
        + v9 * a1;
    unint64_t v11 = a3 + v9 * v4;
    if (v10 >= v11 || v10 + v9 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v11;
    }
  }
  uint64_t result = sub_2561DB840();
  __break(1u);
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

uint64_t sub_2561DAC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2561DAC78(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2561DACC4()
{
  if (!qword_269F50E10)
  {
    type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
    sub_2561D98B4(&qword_26B2AD8B8, (void (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
    unint64_t v0 = sub_2561DB740();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F50E10);
    }
  }
}

uint64_t sub_2561DAD58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2561DADC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MentalHealthLauncherComplicationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2561DAE24(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2561DA520(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2561DAE94(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2561DAEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_2561DAF60(uint64_t a1)
{
  uint64_t v2 = sub_2561DB3E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_2561DAFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2561DB028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2561DB08C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2561DB0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2561DB154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2561DB168);
}

uint64_t sub_2561DB168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_2561DB1D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2561DB1E8);
}

uint64_t sub_2561DB1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2561DB3E0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_2561DB258()
{
  uint64_t result = sub_2561DB3E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2561DB2F0()
{
  return MEMORY[0x270EE1358]();
}

uint64_t sub_2561DB300()
{
  return MEMORY[0x270EE1360]();
}

uint64_t sub_2561DB310()
{
  return MEMORY[0x270EE1368]();
}

uint64_t sub_2561DB320()
{
  return MEMORY[0x270EE1388]();
}

uint64_t sub_2561DB330()
{
  return MEMORY[0x270EE1390]();
}

uint64_t sub_2561DB340()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_2561DB350()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_2561DB360()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_2561DB370()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_2561DB380()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2561DB390()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2561DB3A0()
{
  return MEMORY[0x270F4A460]();
}

uint64_t sub_2561DB3B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2561DB3C0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2561DB3D0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2561DB3E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2561DB3F0()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_2561DB400()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_2561DB410()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_2561DB420()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_2561DB430()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_2561DB440()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2561DB450()
{
  return MEMORY[0x270EF13F0]();
}

uint64_t sub_2561DB460()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2561DB470()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2561DB480()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2561DB490()
{
  return MEMORY[0x270F4A480]();
}

uint64_t sub_2561DB4A0()
{
  return MEMORY[0x270F4A528]();
}

uint64_t sub_2561DB4B0()
{
  return MEMORY[0x270F4A608]();
}

uint64_t sub_2561DB4C0()
{
  return MEMORY[0x270F350F8]();
}

uint64_t sub_2561DB4D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2561DB4E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2561DB4F0()
{
  return MEMORY[0x270F008B8]();
}

uint64_t sub_2561DB500()
{
  return MEMORY[0x270F008C0]();
}

uint64_t sub_2561DB510()
{
  return MEMORY[0x270F07370]();
}

uint64_t sub_2561DB520()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2561DB530()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2561DB540()
{
  return MEMORY[0x270F073F8]();
}

uint64_t sub_2561DB550()
{
  return MEMORY[0x270F07400]();
}

uint64_t sub_2561DB560()
{
  return MEMORY[0x270F07410]();
}

uint64_t sub_2561DB570()
{
  return MEMORY[0x270F07420]();
}

uint64_t sub_2561DB580()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2561DB590()
{
  return MEMORY[0x270F02798]();
}

uint64_t sub_2561DB5A0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2561DB5B0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2561DB5C0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2561DB5D0()
{
  return MEMORY[0x270F4A610]();
}

uint64_t sub_2561DB5E0()
{
  return MEMORY[0x270F07430]();
}

uint64_t sub_2561DB5F0()
{
  return MEMORY[0x270F07458]();
}

uint64_t sub_2561DB600()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2561DB610()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2561DB620()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2561DB630()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2561DB640()
{
  return MEMORY[0x270F04438]();
}

uint64_t sub_2561DB650()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2561DB660()
{
  return MEMORY[0x270F38068]();
}

uint64_t sub_2561DB670()
{
  return MEMORY[0x270F38070]();
}

uint64_t sub_2561DB680()
{
  return MEMORY[0x270F38078]();
}

uint64_t sub_2561DB690()
{
  return MEMORY[0x270F074A8]();
}

uint64_t sub_2561DB6A0()
{
  return MEMORY[0x270F07578]();
}

uint64_t sub_2561DB6B0()
{
  return MEMORY[0x270F07580]();
}

uint64_t sub_2561DB6C0()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_2561DB6D0()
{
  return MEMORY[0x270F076E8]();
}

uint64_t sub_2561DB6F0()
{
  return MEMORY[0x270F07788]();
}

uint64_t sub_2561DB700()
{
  return MEMORY[0x270F07790]();
}

uint64_t sub_2561DB710()
{
  return MEMORY[0x270F077B0]();
}

uint64_t sub_2561DB720()
{
  return MEMORY[0x270F077B8]();
}

uint64_t sub_2561DB730()
{
  return MEMORY[0x270F079F0]();
}

uint64_t sub_2561DB740()
{
  return MEMORY[0x270F079F8]();
}

uint64_t sub_2561DB750()
{
  return MEMORY[0x270F4A618]();
}

uint64_t sub_2561DB760()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2561DB770()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2561DB780()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2561DB790()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2561DB7A0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2561DB7B0()
{
  return MEMORY[0x270F4A648]();
}

uint64_t sub_2561DB7C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2561DB7D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2561DB7E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2561DB7F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2561DB800()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2561DB810()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2561DB820()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2561DB830()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2561DB840()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2561DB850()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2561DB860()
{
  return MEMORY[0x270F9F4F8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}