uint64_t sub_1D76169D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_38();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_4_3();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
    sub_1D758B1EC(a3, v3);
    sub_1D75EE174(a1, v8, qword_1EA82C420);
    swift_storeEnumTagMultiPayload();
    sub_1D760F4F4(v3);
    swift_release();
    v9 = OUTLINED_FUNCTION_11_3();
    return v10(v9);
  }
  return result;
}

uint64_t sub_1D7616AF0(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
  return sub_1D7660B60();
}

uint64_t sub_1D7616B2C(void *a1)
{
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  OUTLINED_FUNCTION_9_9();
  return v1();
}

uint64_t sub_1D7616B80()
{
  uint64_t v0 = *(void *)(sub_1D760C40C() + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D7616BB0(uint64_t a1)
{
  sub_1D758B1EC(a1, (uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBA0);
  return sub_1D7660B60();
}

uint64_t sub_1D7616BEC()
{
  type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_38();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_73_0();
  uint64_t v1 = OUTLINED_FUNCTION_11_3();
  v2(v1);
  return sub_1D7660B60();
}

uint64_t sub_1D7616C7C()
{
  return sub_1D7660B60();
}

uint64_t sub_1D7616CF4@<X0>(_OWORD *a1@<X8>)
{
  sub_1D760C40C();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1D761A7CC(v2);
  swift_bridgeObjectRelease();
  uint64_t v5 = v3;
  sub_1D761A760(&v5);
  swift_bridgeObjectRelease();
  sub_1D75EF1EC(v5, a1);
  return swift_release();
}

void sub_1D7616D8C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v124 = v1;
  v123 = v3;
  v4 = (void *)*v0;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_8();
  uint64_t v6 = v4[10];
  uint64_t v7 = v4[11];
  uint64_t v116 = type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_0_5();
  uint64_t v115 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_14_6();
  v114 = v10;
  OUTLINED_FUNCTION_15_8();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_82_0();
  v113 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C2D0);
  uint64_t v14 = OUTLINED_FUNCTION_23_0(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_14_6();
  v118 = v15;
  OUTLINED_FUNCTION_15_8();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_82_0();
  uint64_t v112 = v17;
  uint64_t v119 = type metadata accessor for TunnelInterfaceParameters();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_14_6();
  uint64_t v117 = v19;
  OUTLINED_FUNCTION_15_8();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_82_0();
  uint64_t v120 = v21;
  uint64_t v122 = v6;
  uint64_t v121 = v7;
  type metadata accessor for TunnelEndpoint.State();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  OUTLINED_FUNCTION_0_5();
  uint64_t v24 = v23;
  OUTLINED_FUNCTION_38();
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  v28 = (char *)&v110 - v27;
  v133 = v0;
  unsigned int v29 = *((unsigned __int8 *)v0 + v4[23]);
  v30 = (uint64_t *)((char *)&v110 + *(int *)(v26 + 48) - v27);
  *((unsigned char *)&v110 - v27) = v29;
  sub_1D761E470();
  if (v29 >> 5 == 1)
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (v29)
    {
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v45 = *v30;
        v46 = v123;
        __swift_project_boxed_opaque_existential_0Tm(v123, v123[3]);
        OUTLINED_FUNCTION_9_9();
        v47();
        OUTLINED_FUNCTION_127_0();
        OUTLINED_FUNCTION_5();
        sub_1D761A650();
        swift_endAccess();
        swift_bridgeObjectRelease();
        uint64_t v48 = *((void *)&v131 + 1);
        sub_1D75940B4((uint64_t)&v130, (uint64_t *)&unk_1EA82C500);
        if (v48)
        {
          __swift_project_boxed_opaque_existential_0Tm(v46, v46[3]);
          OUTLINED_FUNCTION_9_9();
          v49();
          sub_1D758B1EC((uint64_t)v46, (uint64_t)&v130);
          *((void *)&v132 + 1) = v45;
          OUTLINED_FUNCTION_127_0();
          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_149_0();
          swift_endAccess();
          uint64_t v50 = v2;
          swift_storeEnumTagMultiPayload();
          uint64_t v51 = v46[4];
          __swift_project_boxed_opaque_existential_0Tm(v46, v46[3]);
          uint64_t v52 = OUTLINED_FUNCTION_55();
          swift_weakInit();
          sub_1D758B1EC((uint64_t)v46, (uint64_t)&v130);
          v53 = (void *)OUTLINED_FUNCTION_40_2();
          uint64_t v54 = v121;
          v53[2] = v122;
          v53[3] = v54;
          v53[4] = v52;
          sub_1D758AB78(&v130, (uint64_t)(v53 + 5));
          v55 = *(void (**)(void))(v51 + 24);
          swift_retain();
          OUTLINED_FUNCTION_162_0();
          v55();
          swift_release();
          sub_1D761E4CC(v50, (void (*)(void))type metadata accessor for TunnelMessage);
          swift_release();
        }
        goto LABEL_27;
      }
    }
    else if (EnumCaseMultiPayload == 3)
    {
      __swift_project_boxed_opaque_existential_0Tm(v123, v123[3]);
      OUTLINED_FUNCTION_9_9();
      v43();
      uint64_t v44 = sub_1D760C44C();
      sub_1D75B53F8(v44, &v127);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v128 + 1))
      {
        long long v130 = v127;
        long long v131 = v128;
        long long v132 = v129;
        sub_1D7618578();
        sub_1D75B8E3C((uint64_t)&v130);
      }
      else
      {
        sub_1D75940B4((uint64_t)&v127, (uint64_t *)&unk_1EA82BA30);
      }
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v29 >> 5 != 3) {
    goto LABEL_26;
  }
  if (v29 == 96)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      int v111 = *(unsigned __int16 *)((char *)v30
                                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88) + 64));
      uint64_t v56 = v120;
      sub_1D761E98C();
      uint64_t v57 = sub_1D7660430();
      v114 = &v110;
      OUTLINED_FUNCTION_0_5();
      MEMORY[0x1F4188790](v58);
      v123 = v60;
      v61 = (void (*)(void))v60[4];
      v118 = (char *)&v110 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
      v61();
      os_log_type_t v62 = sub_1D7660DD0();
      if (qword_1EA82AA50 != -1) {
        swift_once();
      }
      v63 = qword_1EA82C240;
      if (os_log_type_enabled((os_log_t)qword_1EA82C240, v62))
      {
        OUTLINED_FUNCTION_125_0();
        v64 = (uint8_t *)OUTLINED_FUNCTION_14_0();
        uint64_t v65 = OUTLINED_FUNCTION_11_4();
        uint64_t v110 = v57;
        *(void *)&long long v130 = v65;
        *(_DWORD *)v64 = 136446210;
        uint64_t v66 = sub_1D760C1AC();
        uint64_t v68 = sub_1D758DBE8(v66, v67, (uint64_t *)&v130);
        OUTLINED_FUNCTION_154_0(v68);
        uint64_t v56 = v120;
        sub_1D7661020();
        OUTLINED_FUNCTION_177();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D757C000, v63, v62, "%{public}s: Client received handshake response", v64, 0xCu);
        swift_arrayDestroy();
        uint64_t v57 = v110;
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      uint64_t v69 = v119;
      uint64_t v70 = *(int *)(v119 + 24);
      unsigned int v71 = *(unsigned __int16 *)(v56 + v70);
      uint64_t v72 = v121;
      uint64_t v73 = v122;
      unsigned __int16 v74 = (*(uint64_t (**)(uint64_t, uint64_t))(v121 + 16))(v122, v121);
      uint64_t v75 = v117;
      sub_1D761E470();
      if (v71 >= v74)
      {
        unsigned int v76 = *(unsigned __int16 *)(v75 + *(int *)(v69 + 24));
        unsigned __int16 v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 24))(v73, v72);
        sub_1D761E4CC(v75, (void (*)(void))type metadata accessor for TunnelInterfaceParameters);
        if (v76 <= v77)
        {
          uint64_t v88 = sub_1D7660410();
          unint64_t v90 = v89;
          __int16 v91 = sub_1D75EEFE4(v88, v89);
          sub_1D75933F0(v88, v90);
          v92 = v118;
          if ((v91 & 0x1FF) == 0xFD
            && (uint64_t v93 = sub_1D7660410(),
                unint64_t v95 = v94,
                __int16 v96 = sub_1D75EEFE4(v93, v94),
                sub_1D75933F0(v93, v95),
                (v96 & 0x1FF) == 0xFD))
          {
            uint64_t v97 = v112;
            sub_1D761E470();
            uint64_t v98 = OUTLINED_FUNCTION_87_0();
            __swift_storeEnumTagSinglePayload(v98, v99, v100, v119);
            sub_1D760C588(v97);
            uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C2A0);
            uint64_t v102 = OUTLINED_FUNCTION_23_0(v101);
            MEMORY[0x1F4188790](v102);
            OUTLINED_FUNCTION_51();
            OUTLINED_FUNCTION_28();
            v103();
            uint64_t v104 = OUTLINED_FUNCTION_87_0();
            __swift_storeEnumTagSinglePayload(v104, v105, v106, v57);
            sub_1D760BF64(v97);
            sub_1D760C0BC(v111);
            *((unsigned char *)v133 + *(void *)(*v133 + 184)) = -96;
            v107 = v113;
            unsigned char *v113 = 0;
            OUTLINED_FUNCTION_118_0();
            sub_1D760F9B0(v107);
            OUTLINED_FUNCTION_6();
            v108();
            OUTLINED_FUNCTION_152_0();
            v109();
          }
          else
          {
            *(void *)&long long v130 = 0;
            *((void *)&v130 + 1) = 0xE000000000000000;
            sub_1D7661100();
            OUTLINED_FUNCTION_76_0();
            OUTLINED_FUNCTION_177_0();
            sub_1D7661200();
            sub_1D7660BC0();
            sub_1D7661200();
            sub_1D7660BC0();
            sub_1D75AF4C0();
            OUTLINED_FUNCTION_0();
            OUTLINED_FUNCTION_34_4();
            long long v127 = v130;
            sub_1D75B0D60();
            OUTLINED_FUNCTION_3_0();
            OUTLINED_FUNCTION_28_5();
            swift_willThrow();
            ((void (*)(char *, uint64_t))v123[1])(v92, v57);
          }
          goto LABEL_32;
        }
      }
      else
      {
        sub_1D761E4CC(v75, (void (*)(void))type metadata accessor for TunnelInterfaceParameters);
      }
      OUTLINED_FUNCTION_180_0();
      OUTLINED_FUNCTION_76_0();
      OUTLINED_FUNCTION_177_0();
      LOWORD(v127) = *(_WORD *)(v56 + v70);
      sub_1D7661500();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      sub_1D75AF4C0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_34_4();
      long long v127 = v130;
      sub_1D75B0D60();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_28_5();
      swift_willThrow();
      ((void (*)(char *, uint64_t))v123[1])(v118, v57);
LABEL_32:
      sub_1D761E4CC(v56, (void (*)(void))type metadata accessor for TunnelInterfaceParameters);
      goto LABEL_27;
    }
LABEL_26:
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_0();
    sub_1D7661690();
    long long v127 = v130;
    uint64_t v125 = 0;
    unint64_t v126 = 0xE000000000000000;
    sub_1D7661100();
    OUTLINED_FUNCTION_177_0();
    sub_1D7661200();
    sub_1D7660BC0();
    sub_1D75B0D60();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_147_0();
    sub_1D76616A0();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, TupleTypeMetadata2);
    goto LABEL_27;
  }
  if (v29 != 97 || swift_getEnumCaseMultiPayload()) {
    goto LABEL_26;
  }
  unsigned int v31 = *(unsigned __int16 *)v30;
  uint64_t v32 = v30[1];
  os_log_type_t v33 = sub_1D7660DD0();
  if (qword_1EA82AA50 != -1) {
    swift_once();
  }
  v34 = qword_1EA82C240;
  BOOL v35 = os_log_type_enabled((os_log_t)qword_1EA82C240, v33);
  v36 = v133;
  uint64_t v37 = (uint64_t)v118;
  if (v35)
  {
    OUTLINED_FUNCTION_125_0();
    v38 = (uint8_t *)OUTLINED_FUNCTION_14_0();
    *(void *)&long long v130 = OUTLINED_FUNCTION_11_4();
    *(_DWORD *)v38 = 136446210;
    uint64_t v39 = sub_1D760C1AC();
    uint64_t v41 = sub_1D758DBE8(v39, v40, (uint64_t *)&v130);
    OUTLINED_FUNCTION_154_0(v41);
    v36 = v133;
    uint64_t v37 = (uint64_t)v118;
    sub_1D7661020();
    OUTLINED_FUNCTION_177();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D757C000, v34, v33, "%{public}s: Server received handshake request", v38, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  if (v31 < (*(unsigned __int16 (**)(void))(v121 + 16))())
  {
    OUTLINED_FUNCTION_180_0();
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_177_0();
    LOWORD(v127) = v31;
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7660BC0();
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_34_4();
    long long v127 = v130;
    sub_1D75B0D60();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_28_5();
    swift_willThrow();
LABEL_27:
    OUTLINED_FUNCTION_4_0();
    return;
  }
  sub_1D760C52C(v37);
  uint64_t v78 = v119;
  OUTLINED_FUNCTION_57_1(v37, 1, v119);
  if (v79)
  {
    __break(1u);
  }
  else
  {
    unsigned int v80 = *(unsigned __int16 *)(v37 + *(int *)(v78 + 24));
    sub_1D761E4CC(v37, (void (*)(void))type metadata accessor for TunnelInterfaceParameters);
    uint64_t v81 = (uint64_t)v36 + *(void *)(*v36 + 192);
    swift_beginAccess();
    OUTLINED_FUNCTION_57_1(v81, 1, v78);
    v82 = v123;
    if (!v79)
    {
      if (v80 >= v31) {
        __int16 v83 = v31;
      }
      else {
        __int16 v83 = v80;
      }
      *(_WORD *)(v81 + *(int *)(v78 + 24)) = v83;
      uint64_t v84 = (uint64_t)v36 + *(void *)(*v36 + 144);
      *(void *)uint64_t v84 = v32;
      *(unsigned char *)(v84 + 8) = 0;
      sub_1D760C304((uint64_t)&v127);
      OUTLINED_FUNCTION_144_0(&v127, *((uint64_t *)&v128 + 1));
      OUTLINED_FUNCTION_9_9();
      v85();
      sub_1D758B1EC((uint64_t)v82, (uint64_t)&v130);
      *((void *)&v132 + 1) = v32;
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_149_0();
      swift_endAccess();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v127);
      *((unsigned char *)v36 + *(void *)(*v36 + 184)) = -96;
      v86 = v114;
      *(unsigned char *)v114 = 0x80;
      OUTLINED_FUNCTION_118_0();
      sub_1D760F9B0(v86);
      OUTLINED_FUNCTION_6();
      v87();
      goto LABEL_27;
    }
  }
  __break(1u);
}

void sub_1D7617E44()
{
  OUTLINED_FUNCTION_97();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v22 = *(void *)(*(void *)v3 + 88);
  uint64_t v23 = *(void *)(*(void *)v3 + 80);
  type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_38();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_114_0();
  uint64_t v7 = *v5;
  uint64_t v24 = (void (*)(uint64_t))v5[1];
  uint64_t v8 = v5[2];
  uint64_t v9 = sub_1D76609E0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3_13();
  *uint64_t v2 = sub_1D760C4CC();
  (*(void (**)(id *, void, uint64_t))(v11 + 104))(v2, *MEMORY[0x1E4FBCBE8], v9);
  LOBYTE(v5) = sub_1D7660A00();
  OUTLINED_FUNCTION_42_1();
  uint64_t v14 = v13();
  if (v5)
  {
    if (*(void *)(v7 + 16))
    {
      sub_1D760C304((uint64_t)v25);
      uint64_t v15 = v26;
      uint64_t v16 = v27;
      __swift_project_boxed_opaque_existential_0Tm(v25, v26);
      uint64_t v17 = swift_allocObject();
      swift_weakInit();
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = v23;
      v18[3] = v22;
      v18[4] = v7;
      v18[5] = v24;
      v18[6] = v8;
      v18[7] = v17;
      uint64_t v19 = *(void (**)(uint64_t, uint64_t (*)(void *), void *, uint64_t, uint64_t))(v16 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      v19(v7, sub_1D761E460, v18, v15, v16);
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
    }
    else
    {
      v24(v14);
      OUTLINED_FUNCTION_119_0();
      swift_storeEnumTagMultiPayload();
      sub_1D760F4F4(v1);
      uint64_t v20 = OUTLINED_FUNCTION_119_0();
      v21(v20);
    }
    OUTLINED_FUNCTION_84();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1D76180BC(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = type metadata accessor for TunnelEndpoint.Event();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v12 - v8;
  a3(v7);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (a1)
    {
      sub_1D760C304((uint64_t)v9);
      *((void *)v9 + 5) = a1;
      swift_storeEnumTagMultiPayload();
      id v11 = a1;
      sub_1D760F4F4(v9);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    swift_storeEnumTagMultiPayload();
    sub_1D760F4F4(v9);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

void sub_1D761823C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_17_9();
  uint64_t v7 = *(void *)(v6 + 80);
  OUTLINED_FUNCTION_17_9();
  uint64_t v9 = *(void *)(v8 + 88);
  uint64_t v10 = type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_0_5();
  uint64_t v12 = v11;
  OUTLINED_FUNCTION_38();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = sub_1D7661000();
  OUTLINED_FUNCTION_23_0(v16);
  OUTLINED_FUNCTION_38();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_114_0();
  if (!*(void *)(v5 + 16))
  {
    sub_1D758B1EC(v3, (uint64_t)v15);
    swift_storeEnumTagMultiPayload();
    sub_1D760F4F4(v15);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
    goto LABEL_5;
  }
  sub_1D760BCE0(v1);
  OUTLINED_FUNCTION_57_1(v1, 1, v7);
  if (!v18)
  {
    sub_1D758B1EC(v3, (uint64_t)v23);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v0;
    sub_1D758AB78(v23, v19 + 24);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v9 + 64);
    swift_retain();
    v20(v5, sub_1D761E414, v19, v7, v9);
    swift_release();
    OUTLINED_FUNCTION_6();
    v21();
LABEL_5:
    OUTLINED_FUNCTION_4_0();
    return;
  }
  __break(1u);
}

uint64_t sub_1D761843C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TunnelEndpoint.Event();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (uint64_t *)((char *)&v11 - v7);
  if (a1)
  {
    *uint64_t v8 = a1;
    swift_storeEnumTagMultiPayload();
    id v9 = a1;
  }
  else
  {
    sub_1D758B1EC(a3, (uint64_t)&v11 - v7);
    swift_storeEnumTagMultiPayload();
  }
  sub_1D760F4F4(v8);
  return (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_1D7618578()
{
  OUTLINED_FUNCTION_97();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_17_9();
  OUTLINED_FUNCTION_17_9();
  type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_38();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_72_0();
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  OUTLINED_FUNCTION_9_9();
  v6();
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_117();
  sub_1D761A544();
  sub_1D75940B4((uint64_t)v48, (uint64_t *)&unk_1EA82BA30);
  swift_endAccess();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  OUTLINED_FUNCTION_9_9();
  v7();
  sub_1D75B93BC((uint64_t)v4, (uint64_t)v48);
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_117();
  sub_1D75B4628();
  swift_endAccess();
  os_log_type_t v8 = sub_1D7660DD0();
  if (qword_1EA82AA50 != -1) {
    swift_once();
  }
  id v9 = &unk_1EA82C000;
  uint64_t v10 = qword_1EA82C240;
  sub_1D75B93BC((uint64_t)v4, (uint64_t)v48);
  OUTLINED_FUNCTION_104();
  if (os_log_type_enabled(v10, v8))
  {
    OUTLINED_FUNCTION_104();
    uint64_t v11 = OUTLINED_FUNCTION_11_4();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446722;
    uint64_t v12 = sub_1D760C1AC();
    v46[0] = sub_1D758DBE8(v12, v13, v44);
    sub_1D7661020();
    OUTLINED_FUNCTION_36_1();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_1D758B1EC((uint64_t)v48, (uint64_t)v46);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBA0);
    uint64_t v14 = sub_1D7660B60();
    v46[0] = sub_1D758DBE8(v14, v15, v44);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    sub_1D75B8E3C((uint64_t)v48);
    *(_WORD *)(v11 + 22) = 2048;
    uint64_t v16 = *(void *)(sub_1D760C40C() + 16);
    swift_release();
    swift_bridgeObjectRelease();
    v46[0] = v16;
    id v9 = &unk_1EA82C000;
    sub_1D7661020();
    swift_release();
    _os_log_impl(&dword_1D757C000, v10, v8, "%{public}s: Starting packet transfer on new connection %s. Current connection pool count = %ld", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {
    swift_release();
    sub_1D75B8E3C((uint64_t)v48);
    swift_release();
  }
  sub_1D758B1EC((uint64_t)v4, v1);
  OUTLINED_FUNCTION_155();
  swift_storeEnumTagMultiPayload();
  sub_1D760F4F4(v1);
  OUTLINED_FUNCTION_45();
  v17();
  uint64_t v18 = v2 + *(void *)(*(void *)v2 + 144);
  if (*(unsigned char *)(v18 + 8))
  {
    sub_1D7661260();
    __break(1u);
  }
  else
  {
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = v4[5];
    os_log_type_t v21 = sub_1D7660DD0();
    uint64_t v22 = *((void *)v9 + 72);
    if (v19 >= v20)
    {
      sub_1D75B93BC((uint64_t)v4, (uint64_t)v48);
      sub_1D75B93BC((uint64_t)v4, (uint64_t)v46);
      OUTLINED_FUNCTION_104();
      if (os_log_type_enabled(v22, v21))
      {
        OUTLINED_FUNCTION_104();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v45 = OUTLINED_FUNCTION_98_0();
        *(_DWORD *)uint64_t v33 = 136447234;
        uint64_t v34 = sub_1D760C1AC();
        uint64_t v36 = OUTLINED_FUNCTION_92_0(v34, v35);
        OUTLINED_FUNCTION_120_0(v36);
        OUTLINED_FUNCTION_36_1();
        swift_bridgeObjectRelease();
        *(_WORD *)(v33 + 12) = 2080;
        sub_1D760C304((uint64_t)v44);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBA0);
        uint64_t v37 = OUTLINED_FUNCTION_160_0();
        uint64_t v39 = sub_1D758DBE8(v37, v38, &v45);
        OUTLINED_FUNCTION_120_0(v39);
        OUTLINED_FUNCTION_36_1();
        swift_bridgeObjectRelease();
        *(_WORD *)(v33 + 22) = 2080;
        sub_1D758B1EC((uint64_t)v48, (uint64_t)v44);
        uint64_t v40 = OUTLINED_FUNCTION_160_0();
        v44[0] = OUTLINED_FUNCTION_92_0(v40, v41);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        sub_1D75B8E3C((uint64_t)v48);
        *(_WORD *)(v33 + 32) = 2048;
        uint64_t v42 = v47;
        sub_1D75B8E3C((uint64_t)v46);
        v44[0] = v42;
        sub_1D7661020();
        *(_WORD *)(v33 + 42) = 2048;
        v44[0] = v19;
        sub_1D7661020();
        _os_log_impl(&dword_1D757C000, v22, v21, "%{public}s: Not migrating from %s to new connection %s because priority %ld is lower than %ld", (uint8_t *)v33, 0x34u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        sub_1D75B8E3C((uint64_t)v46);
        OUTLINED_FUNCTION_36_1();
        sub_1D75B8E3C((uint64_t)v48);
      }
    }
    else
    {
      sub_1D75B93BC((uint64_t)v4, (uint64_t)v48);
      sub_1D75B93BC((uint64_t)v4, (uint64_t)v46);
      OUTLINED_FUNCTION_104();
      if (os_log_type_enabled(v22, v21))
      {
        OUTLINED_FUNCTION_104();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v45 = OUTLINED_FUNCTION_98_0();
        *(_DWORD *)uint64_t v23 = 136447234;
        uint64_t v24 = sub_1D760C1AC();
        uint64_t v26 = OUTLINED_FUNCTION_92_0(v24, v25);
        OUTLINED_FUNCTION_121_0(v26);
        OUTLINED_FUNCTION_36_1();
        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 12) = 2080;
        sub_1D760C304((uint64_t)v44);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBA0);
        uint64_t v27 = OUTLINED_FUNCTION_160_0();
        uint64_t v29 = sub_1D758DBE8(v27, v28, &v45);
        OUTLINED_FUNCTION_121_0(v29);
        OUTLINED_FUNCTION_36_1();
        swift_bridgeObjectRelease();
        *(_WORD *)(v23 + 22) = 2080;
        sub_1D758B1EC((uint64_t)v48, (uint64_t)v44);
        uint64_t v30 = OUTLINED_FUNCTION_160_0();
        v44[0] = OUTLINED_FUNCTION_92_0(v30, v31);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        sub_1D75B8E3C((uint64_t)v48);
        *(_WORD *)(v23 + 32) = 2048;
        uint64_t v32 = v47;
        sub_1D75B8E3C((uint64_t)v46);
        v44[0] = v32;
        sub_1D7661020();
        *(_WORD *)(v23 + 42) = 2048;
        v44[0] = v19;
        sub_1D7661020();
        _os_log_impl(&dword_1D757C000, v22, v21, "%{public}s: Migrating tunnel connection from %s to new connection %s because priority %ld is higher than %ld", (uint8_t *)v23, 0x34u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
      }
      else
      {
        sub_1D75B8E3C((uint64_t)v46);
        OUTLINED_FUNCTION_36_1();
        sub_1D75B8E3C((uint64_t)v48);
      }
      sub_1D758B1EC((uint64_t)v4, (uint64_t)v48);
      sub_1D760C358(v48);
      uint64_t v43 = v2 + *(void *)(*(void *)v2 + 144);
      *(void *)uint64_t v43 = v4[5];
      *(unsigned char *)(v43 + 8) = 0;
    }
    OUTLINED_FUNCTION_84();
  }
}

uint64_t sub_1D7618DB4(id a1)
{
  uint64_t v3 = &unk_1EA82C000;
  uint64_t v4 = &unk_1D7665000;
  uint64_t v5 = &unk_1D7665000;
  if (a1)
  {
    id v6 = a1;
    os_log_type_t v7 = sub_1D7660DB0();
    OUTLINED_FUNCTION_146_0();
    if (!v8) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_145_0())
    {
      id v9 = a1;
      id v10 = a1;
      swift_retain();
      uint64_t v11 = swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136446466;
      uint64_t isa = (uint64_t)v1[2].isa;
      unint64_t v13 = (unint64_t)v1[3].isa;
      swift_bridgeObjectRetain();
      sub_1D758DBE8(isa, v13, v51);
      OUTLINED_FUNCTION_69();
      sub_1D7661020();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      uint64_t v52 = a1;
      id v14 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
      uint64_t v15 = sub_1D7660B60();
      uint64_t v52 = (void *)sub_1D758DBE8(v15, v16, v51);
      uint64_t v5 = (void *)&unk_1D7665000;
      sub_1D7661020();
      uint64_t v4 = (void *)&unk_1D7665000;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D757C000, v1, v7, "%{public}s: Cancelling TunnelEndpoint due to error %{public}s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      uint64_t v3 = &unk_1EA82C000;
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
  }
  else
  {
    os_log_type_t v17 = sub_1D7660DD0();
    OUTLINED_FUNCTION_146_0();
    if (!v8) {
      swift_once();
    }
    if (OUTLINED_FUNCTION_145_0())
    {
      swift_retain();
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      v51[0] = OUTLINED_FUNCTION_11_4();
      *(_DWORD *)uint64_t v18 = 136446210;
      uint64_t v19 = (uint64_t)v1[2].isa;
      unint64_t v20 = (unint64_t)v1[3].isa;
      swift_bridgeObjectRetain();
      sub_1D758DBE8(v19, v20, v51);
      OUTLINED_FUNCTION_105_0();
      uint64_t v4 = &unk_1D7665000;
      uint64_t v5 = &unk_1D7665000;
      sub_1D7661020();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v1, v17, "%{public}s: Cancelling TunnelEndpoint", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v3 = &unk_1EA82C000;
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
  }
  *((unsigned char *)&v1->isa + *((void *)v1->isa + 23)) = -95;
  sub_1D760C6C0();
  OUTLINED_FUNCTION_40_1();
  sub_1D760C610();
  if (sub_1D760C678())
  {
    swift_getObjectType();
    sub_1D7660F40();
    swift_unknownObjectRelease();
  }
  sub_1D760C698();
  if (a1 && (uint64_t v21 = sub_1D760C62C()) != 0)
  {
    uint64_t v22 = (void (*)(id))v21;
    id v23 = a1;
    os_log_type_t v24 = sub_1D7660DB0();
    OUTLINED_FUNCTION_146_0();
    if (!v8) {
      swift_once();
    }
    unint64_t v25 = *((void *)v3 + 72);
    os_log_type_t v26 = v24;
    if (os_log_type_enabled(v25, v24))
    {
      id v27 = a1;
      swift_retain();
      id v28 = a1;
      swift_retain();
      uint64_t v29 = v4;
      uint64_t v30 = swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = v29[185];
      uint64_t v31 = sub_1D760C1AC();
      sub_1D758DBE8(v31, v32, v51);
      OUTLINED_FUNCTION_69();
      sub_1D7661020();
      OUTLINED_FUNCTION_36_1();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      uint64_t v52 = a1;
      id v33 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
      uint64_t v34 = sub_1D7660B60();
      sub_1D758DBE8(v34, v35, v51);
      OUTLINED_FUNCTION_69();
      sub_1D7661020();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D757C000, v25, v26, "%{public}s: failed with error: %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    v22(a1);
    sub_1D75940A4((uint64_t)v22);
  }
  else
  {
    os_log_type_t v36 = sub_1D7660DD0();
    OUTLINED_FUNCTION_146_0();
    if (!v8) {
      swift_once();
    }
    uint64_t v37 = *((void *)v3 + 72);
    if (os_log_type_enabled(v37, v36))
    {
      OUTLINED_FUNCTION_104();
      unint64_t v38 = (uint8_t *)swift_slowAlloc();
      v51[0] = OUTLINED_FUNCTION_11_4();
      *(_DWORD *)unint64_t v38 = v5[186];
      uint64_t v39 = sub_1D760C1AC();
      sub_1D758DBE8(v39, v40, v51);
      OUTLINED_FUNCTION_105_0();
      sub_1D7661020();
      OUTLINED_FUNCTION_36_1();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v37, v36, "%{public}s: cancelled", v38, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
  }
  OUTLINED_FUNCTION_40_1();
  sub_1D760C65C();
  uint64_t v52 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v41 = sub_1D760C40C();
  uint64_t v42 = sub_1D760A9B0(v41);
  swift_bridgeObjectRelease();
  sub_1D7619630(v42);
  uint64_t v43 = sub_1D760C44C();
  uint64_t v44 = sub_1D760A9B0(v43);
  swift_bridgeObjectRelease();
  sub_1D7619630(v44);
  uint64_t v45 = sub_1D760C48C();
  sub_1D7619710(v45);
  uint64_t v46 = v52[2];
  if (v46)
  {
    uint64_t v47 = (uint64_t)(v52 + 4);
    do
    {
      sub_1D758B1EC(v47, (uint64_t)v51);
      __swift_project_boxed_opaque_existential_0Tm(v51, v51[3]);
      uint64_t v48 = OUTLINED_FUNCTION_85();
      v49(v48);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v51);
      v47 += 40;
      --v46;
    }
    while (v46);
  }
  return swift_bridgeObjectRelease();
}

void sub_1D761948C()
{
}

void sub_1D76194CC()
{
}

void sub_1D7619500()
{
  OUTLINED_FUNCTION_97();
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *v0;
  uint64_t v7 = *(void *)(*v0 + 16);
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  char v8 = v4;
  id v9 = v3;
  id v10 = v2;
  uint64_t v11 = v1;
  if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v5 > *(void *)(v6 + 24) >> 1) {
    uint64_t v6 = v10();
  }
  if (!*(void *)(v11 + 16))
  {
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v12 = *(void *)(v6 + 16);
  uint64_t v13 = (*(void *)(v6 + 24) >> 1) - v12;
  uint64_t v14 = *(void *)(v8(0) - 8);
  if (v13 < v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v9(v11 + v15, v5, v6 + v15 + *(void *)(v14 + 72) * v12);
  if (!v5)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v6;
    OUTLINED_FUNCTION_84();
    return;
  }
  uint64_t v16 = *(void *)(v6 + 16);
  BOOL v17 = __OFADD__(v16, v5);
  uint64_t v18 = v16 + v5;
  if (!v17)
  {
    *(void *)(v6 + 16) = v18;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1D7619630(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v4 + v2 > *(void *)(v3 + 24) >> 1)
  {
    sub_1D75D05D8();
    uint64_t v3 = v6;
  }
  if (!*(void *)(a1 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1D75D1A9C(a1 + 32, v2);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_1D7619710(uint64_t result)
{
  uint64_t v3 = *(void *)(result + 16);
  uint64_t v4 = (void *)*v1;
  uint64_t v5 = *(void *)(*v1 + 16);
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v6 = result;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = (uint64_t)v4;
  if (!isUniquelyReferenced_nonNull_native || (uint64_t v8 = v4[3] >> 1, v8 < v5 + v3))
  {
    sub_1D75D05D8();
    uint64_t v4 = v9;
    *uint64_t v1 = (uint64_t)v9;
    uint64_t v8 = v9[3] >> 1;
  }
  uint64_t v10 = v4[2];
  uint64_t v11 = v8 - v10;
  uint64_t result = sub_1D761E138((uint64_t)&v45, (uint64_t)&v4[5 * v10 + 4], v8 - v10, v6);
  if (result < v3) {
    goto LABEL_14;
  }
  if (result)
  {
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, result);
    uint64_t v15 = v13 + result;
    if (v14)
    {
      __break(1u);
      goto LABEL_19;
    }
    v4[2] = v15;
  }
  if (result != v11)
  {
    return sub_1D7609BD8();
  }
LABEL_15:
  uint64_t v2 = v4[2];
  uint64_t v4 = v45;
  uint64_t v12 = v46;
  uint64_t v6 = v48;
  uint64_t v37 = v46;
  if (!v49)
  {
LABEL_19:
    int64_t v19 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_72;
    }
    int64_t v20 = (unint64_t)(v47 + 64) >> 6;
    uint64_t v18 = v6;
    if (v19 < v20)
    {
      unint64_t v21 = *(void *)(v12 + 8 * v19);
      if (v21)
      {
LABEL_22:
        unint64_t v16 = (v21 - 1) & v21;
        unint64_t v17 = __clz(__rbit64(v21)) + (v19 << 6);
        uint64_t v6 = v19;
        goto LABEL_17;
      }
      uint64_t v22 = v6 + 2;
      uint64_t v18 = v6 + 1;
      if (v6 + 2 < v20)
      {
        unint64_t v21 = *(void *)(v12 + 8 * v22);
        if (v21)
        {
LABEL_25:
          int64_t v19 = v22;
          goto LABEL_22;
        }
        uint64_t v18 = v6 + 2;
        if (v6 + 3 < v20)
        {
          unint64_t v21 = *(void *)(v37 + 8 * (v6 + 3));
          if (v21)
          {
            int64_t v19 = v6 + 3;
            goto LABEL_22;
          }
          uint64_t v22 = v6 + 4;
          uint64_t v18 = v6 + 3;
          if (v6 + 4 < v20)
          {
            unint64_t v21 = *(void *)(v37 + 8 * v22);
            if (v21) {
              goto LABEL_25;
            }
            int64_t v19 = v6 + 5;
            uint64_t v18 = v6 + 4;
            if (v6 + 5 < v20)
            {
              unint64_t v21 = *(void *)(v37 + 8 * v19);
              if (v21) {
                goto LABEL_22;
              }
              uint64_t v18 = v20 - 1;
              int64_t v23 = v6 + 6;
              while (v23 < v20)
              {
                unint64_t v21 = *(void *)(v37 + 8 * v23++);
                if (v21)
                {
                  int64_t v19 = v23 - 1;
                  goto LABEL_22;
                }
              }
            }
          }
        }
      }
    }
    unint64_t v16 = 0;
    uint64_t v44 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    goto LABEL_38;
  }
  unint64_t v16 = (v49 - 1) & v49;
  unint64_t v17 = __clz(__rbit64(v49)) | (v48 << 6);
LABEL_17:
  sub_1D758B1EC(v4[7] + 40 * v17, (uint64_t)&v42);
  uint64_t v18 = v6;
LABEL_38:
  uint64_t v48 = v18;
  unint64_t v49 = v16;
  sub_1D75EE174((uint64_t)&v42, (uint64_t)&v40, (uint64_t *)&unk_1EA82C500);
  if (!v41)
  {
LABEL_70:
    sub_1D75940B4((uint64_t)&v42, (uint64_t *)&unk_1EA82C500);
    sub_1D7609BD8();
    return sub_1D75940B4((uint64_t)&v40, (uint64_t *)&unk_1EA82C500);
  }
  while (1)
  {
    sub_1D75940B4((uint64_t)&v40, (uint64_t *)&unk_1EA82C500);
    uint64_t v24 = *v1;
    uint64_t v25 = *(void *)(*v1 + 24) >> 1;
    if (v25 < v2 + 1)
    {
      sub_1D75D05D8();
      uint64_t v24 = v36;
      *uint64_t v1 = v36;
      uint64_t v25 = *(void *)(v36 + 24) >> 1;
    }
    sub_1D75EE174((uint64_t)&v42, (uint64_t)&v38, (uint64_t *)&unk_1EA82C500);
    if (v39) {
      break;
    }
LABEL_67:
    sub_1D75940B4((uint64_t)&v38, (uint64_t *)&unk_1EA82C500);
LABEL_69:
    *(void *)(*v1 + 16) = v2;
    sub_1D75EE174((uint64_t)&v42, (uint64_t)&v40, (uint64_t *)&unk_1EA82C500);
    if (!v41) {
      goto LABEL_70;
    }
  }
  uint64_t v26 = v24 + 32;
  while (1)
  {
    sub_1D758AB78(&v38, (uint64_t)&v40);
    if (v2 >= v25)
    {
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v40);
      goto LABEL_69;
    }
    sub_1D75940B4((uint64_t)&v42, (uint64_t *)&unk_1EA82C500);
    uint64_t result = sub_1D758AB78(&v40, v26 + 40 * v2);
    int64_t v27 = v48;
    if (!v49) {
      break;
    }
    unint64_t v28 = (v49 - 1) & v49;
    unint64_t v29 = __clz(__rbit64(v49)) | (v48 << 6);
LABEL_46:
    sub_1D758B1EC(v45[7] + 40 * v29, (uint64_t)&v42);
    int64_t v30 = v27;
LABEL_66:
    ++v2;
    uint64_t v48 = v30;
    unint64_t v49 = v28;
    sub_1D75EE174((uint64_t)&v42, (uint64_t)&v38, (uint64_t *)&unk_1EA82C500);
    if (!v39) {
      goto LABEL_67;
    }
  }
  int64_t v31 = v48 + 1;
  if (!__OFADD__(v48, 1))
  {
    int64_t v32 = (unint64_t)(v47 + 64) >> 6;
    int64_t v30 = v48;
    if (v31 >= v32) {
      goto LABEL_65;
    }
    unint64_t v33 = *(void *)(v46 + 8 * v31);
    if (v33) {
      goto LABEL_50;
    }
    int64_t v34 = v48 + 2;
    int64_t v30 = v48 + 1;
    if (v48 + 2 >= v32) {
      goto LABEL_65;
    }
    unint64_t v33 = *(void *)(v46 + 8 * v34);
    if (!v33)
    {
      int64_t v30 = v48 + 2;
      if (v48 + 3 >= v32) {
        goto LABEL_65;
      }
      unint64_t v33 = *(void *)(v46 + 8 * (v48 + 3));
      if (v33)
      {
        int64_t v31 = v48 + 3;
        goto LABEL_50;
      }
      int64_t v34 = v48 + 4;
      int64_t v30 = v48 + 3;
      if (v48 + 4 >= v32) {
        goto LABEL_65;
      }
      unint64_t v33 = *(void *)(v46 + 8 * v34);
      if (!v33)
      {
        int64_t v31 = v48 + 5;
        int64_t v30 = v48 + 4;
        if (v48 + 5 >= v32) {
          goto LABEL_65;
        }
        unint64_t v33 = *(void *)(v46 + 8 * v31);
        if (!v33)
        {
          int64_t v30 = v32 - 1;
          int64_t v35 = v48 + 6;
          while (v35 < v32)
          {
            unint64_t v33 = *(void *)(v46 + 8 * v35++);
            if (v33)
            {
              int64_t v31 = v35 - 1;
              goto LABEL_50;
            }
          }
LABEL_65:
          unint64_t v28 = 0;
          uint64_t v44 = 0;
          long long v42 = 0u;
          long long v43 = 0u;
          goto LABEL_66;
        }
        goto LABEL_50;
      }
    }
    int64_t v31 = v34;
LABEL_50:
    unint64_t v28 = (v33 - 1) & v33;
    unint64_t v29 = __clz(__rbit64(v33)) + (v31 << 6);
    int64_t v27 = v31;
    goto LABEL_46;
  }
  __break(1u);
LABEL_72:
  __break(1u);
  return result;
}

uint64_t TunnelEndpoint.deinit()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  sub_1D7661000();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_6();
  v1();
  sub_1D75940B4(v0 + *(void *)(*(void *)v0 + 112), (uint64_t *)&unk_1EA82C2A0);
  OUTLINED_FUNCTION_1_9();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + *(void *)(v2 + 136));
  OUTLINED_FUNCTION_1_9();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_9();

  OUTLINED_FUNCTION_1_9();
  sub_1D75940B4(v0 + *(void *)(v4 + 192), &qword_1EA82C2D0);
  OUTLINED_FUNCTION_1_9();
  sub_1D75940A4(*(void *)(v0 + *(void *)(v5 + 200)));
  OUTLINED_FUNCTION_1_9();
  sub_1D75940A4(*(void *)(v0 + *(void *)(v6 + 208)));
  OUTLINED_FUNCTION_1_9();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_1_9();
  uint64_t v8 = *(void *)(v7 + 224);
  uint64_t v9 = *(void *)(v0 + v8);
  *(void *)(v0 + v8) = 0;
  if (v9)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native()) {
        break;
      }
      OUTLINED_FUNCTION_8_12();
      uint64_t v11 = *(void *)(v9 + *(void *)(v10 + 224));
      swift_retain();
      swift_release();
      uint64_t v9 = v11;
    }
    while (v11);
  }
  swift_release();
  return v0;
}

uint64_t TunnelEndpoint.__deallocating_deinit()
{
  TunnelEndpoint.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1D7619E68@<X0>(uint64_t a1@<X8>)
{
  return sub_1D760BAC8(a1);
}

uint64_t sub_1D7619E8C@<X0>(uint64_t a1@<X8>)
{
  return sub_1D760BF08(a1);
}

uint64_t sub_1D7619EB0()
{
  return sub_1D760C078() & 0x1FFFF;
}

void sub_1D7619EE0()
{
}

void sub_1D7619F04()
{
}

void sub_1D7619F28()
{
}

void sub_1D7619F4C()
{
}

uint64_t sub_1D7619F7C(uint64_t a1, uint64_t *a2)
{
  return sub_1D760B9F4(a1, a2);
}

uint64_t sub_1D7619FA0(uint64_t a1)
{
  return sub_1D760B918(a1);
}

uint64_t sub_1D7619FC4()
{
  return sub_1D760F430();
}

uint64_t sub_1D7619FE8(void (*a1)(uint64_t *__return_ptr))
{
  a1(&v2);
  swift_bridgeObjectRetain();
  sub_1D7660BC0();
  swift_bridgeObjectRelease_n();
  return 0x5F6E6F6374;
}

uint64_t sub_1D761A064()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEADE8);
  swift_arrayDestroy();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

void sub_1D761A0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_91_0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = *v11;
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_1D75B6C7C(v13);
  OUTLINED_FUNCTION_89_0();
  if (v16)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_10_7();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C540);
    OUTLINED_FUNCTION_20_5();

    sub_1D758CB98((_OWORD *)(*(void *)(a10 + 56) + 32 * v17), v15);
    type metadata accessor for RPTrustedHostInfoKey(0);
    sub_1D761EEB0();
    sub_1D7661240();
    OUTLINED_FUNCTION_88_0();
    OUTLINED_FUNCTION_30_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    _OWORD *v15 = 0u;
    v15[1] = 0u;
    OUTLINED_FUNCTION_30_6();
  }
}

void sub_1D761A1C0()
{
  OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_96_0();
  unint64_t v2 = sub_1D75B6C1C();
  OUTLINED_FUNCTION_89_0();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_10_7();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEADA8);
    OUTLINED_FUNCTION_20_5();
    OUTLINED_FUNCTION_167_0();
    uint64_t v3 = *(void *)(v1 + 56) + 40 * v2;
    long long v4 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)uint64_t v0 = *(_OWORD *)v3;
    *(_OWORD *)(v0 + 16) = v4;
    *(unsigned char *)(v0 + 32) = *(unsigned char *)(v3 + 32);
    sub_1D7661240();
    OUTLINED_FUNCTION_88_0();
    OUTLINED_FUNCTION_30_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(unsigned char *)(v0 + 32) = 0;
    *(_OWORD *)uint64_t v0 = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    OUTLINED_FUNCTION_30_6();
  }
}

void sub_1D761A2A0()
{
  OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_96_0();
  unint64_t v2 = sub_1D75B6C1C();
  OUTLINED_FUNCTION_89_0();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_10_7();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BA10);
    OUTLINED_FUNCTION_20_5();
    OUTLINED_FUNCTION_167_0();
    sub_1D758CB98((_OWORD *)(*(void *)(v1 + 56) + 32 * v2), v0);
    sub_1D7661240();
    OUTLINED_FUNCTION_88_0();
    OUTLINED_FUNCTION_30_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    *uint64_t v0 = 0u;
    v0[1] = 0u;
    OUTLINED_FUNCTION_30_6();
  }
}

void sub_1D761A374()
{
  OUTLINED_FUNCTION_91_0();
  sub_1D75B6D10(v1);
  if (v2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v3 = *v0;
    *uint64_t v0 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BAD0);
    sub_1D7661220();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEADE0);
    sub_1D7661240();
    *uint64_t v0 = v3;
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_30_6();
}

void sub_1D761A450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_91_0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = *v11;
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_1D758C92C(v13);
  OUTLINED_FUNCTION_89_0();
  if (v16)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_10_7();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEADC0);
    OUTLINED_FUNCTION_20_5();
    sub_1D758CBA8(*(void *)(a10 + 48) + 40 * v17);
    sub_1D758CB98((_OWORD *)(*(void *)(a10 + 56) + 32 * v17), v15);
    sub_1D7661240();
    OUTLINED_FUNCTION_88_0();
    OUTLINED_FUNCTION_30_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    _OWORD *v15 = 0u;
    v15[1] = 0u;
    OUTLINED_FUNCTION_30_6();
  }
}

void sub_1D761A544()
{
  OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_95_0();
  unint64_t v2 = sub_1D75B6D54();
  OUTLINED_FUNCTION_89_0();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_10_7();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C510);
    OUTLINED_FUNCTION_20_5();
    OUTLINED_FUNCTION_168();
    uint64_t v3 = (_OWORD *)(*(void *)(v1 + 56) + 48 * v2);
    long long v4 = v3[1];
    *uint64_t v0 = *v3;
    v0[1] = v4;
    v0[2] = v3[2];
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BA40);
    sub_1D75B2374((unint64_t *)&unk_1EA82C2B0, (uint64_t *)&unk_1EA82BA40);
    OUTLINED_FUNCTION_147_0();
    sub_1D7661240();
    OUTLINED_FUNCTION_88_0();
    OUTLINED_FUNCTION_30_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    v0[1] = 0u;
    v0[2] = 0u;
    *uint64_t v0 = 0u;
    OUTLINED_FUNCTION_30_6();
  }
}

void sub_1D761A650()
{
  OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_95_0();
  unint64_t v2 = sub_1D75B6D54();
  OUTLINED_FUNCTION_89_0();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_10_7();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BA50);
    OUTLINED_FUNCTION_20_5();
    OUTLINED_FUNCTION_168();
    sub_1D758AB78((long long *)(*(void *)(v1 + 56) + 40 * v2), v0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BA40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBA0);
    sub_1D75B2374((unint64_t *)&unk_1EA82C2B0, (uint64_t *)&unk_1EA82BA40);
    OUTLINED_FUNCTION_147_0();
    sub_1D7661240();
    OUTLINED_FUNCTION_88_0();
    OUTLINED_FUNCTION_30_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(v0 + 32) = 0;
    *(_OWORD *)uint64_t v0 = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    OUTLINED_FUNCTION_30_6();
  }
}

uint64_t sub_1D761A760(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1D761E348(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_1D761A974(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_1D761A7CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C520);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 48);
  uint64_t v5 = sub_1D761DF30((uint64_t)&v7, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_1D7609BD8();
  if (v5 != v1)
  {
    __break(1u);
    return MEMORY[0x1E4FBC860];
  }
  return v3;
}

void sub_1D761A8B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBF8);
      uint64_t v7 = (void *)swift_allocObject();
      size_t v8 = _swift_stdlib_malloc_size(v7);
      v7[2] = v5;
      v7[3] = 2 * ((uint64_t)(v8 - 32) / 96);
    }
    if (v4 != a3)
    {
      sub_1D75D1788();
      return;
    }
    goto LABEL_9;
  }
}

uint64_t sub_1D761A974(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1D76614F0();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_1D761B050(0, v3, 1, v2);
      }
      return result;
    }
    goto LABEL_127;
  }
  uint64_t v5 = result;
  uint64_t v112 = v1;
  uint64_t result = sub_1D75EEEE4(v3 / 2);
  uint64_t v103 = result;
  uint64_t v104 = v3;
  v107 = v6;
  if (v3 <= 0)
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
    unint64_t v38 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_92:
    uint64_t result = v8;
    if (v38 < 2)
    {
LABEL_103:
      uint64_t result = swift_bridgeObjectRelease();
      if (v104 >= -1)
      {
        *(void *)(v103 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_132;
    }
    uint64_t v92 = *v2;
    while (1)
    {
      unint64_t v93 = v38 - 2;
      if (v38 < 2) {
        break;
      }
      if (!v92) {
        goto LABEL_136;
      }
      uint64_t v94 = result;
      uint64_t v95 = *(void *)(result + 32 + 16 * v93);
      uint64_t v96 = *(void *)(result + 32 + 16 * (v38 - 1) + 8);
      uint64_t v97 = v112;
      uint64_t result = sub_1D761B154((char *)(v92 + 48 * v95), (char *)(v92 + 48 * *(void *)(result + 32 + 16 * (v38 - 1))), v92 + 48 * v96, v107);
      uint64_t v112 = v97;
      if (v97) {
        goto LABEL_89;
      }
      if (v96 < v95) {
        goto LABEL_122;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1D761B45C(v94);
        uint64_t v94 = result;
      }
      if (v93 >= *(void *)(v94 + 16)) {
        goto LABEL_123;
      }
      uint64_t v98 = (void *)(v94 + 32 + 16 * v93);
      *uint64_t v98 = v95;
      v98[1] = v96;
      unint64_t v99 = *(void *)(v94 + 16);
      if (v38 > v99) {
        goto LABEL_124;
      }
      memmove((void *)(v94 + 32 + 16 * (v38 - 1)), (const void *)(v94 + 32 + 16 * v38), 16 * (v99 - v38));
      uint64_t result = v94;
      *(void *)(v94 + 16) = v99 - 1;
      unint64_t v38 = v99 - 1;
      if (v99 <= 2) {
        goto LABEL_103;
      }
    }
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
    return result;
  }
  uint64_t v102 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = MEMORY[0x1E4FBC860];
  while (1)
  {
    uint64_t v9 = v7++;
    uint64_t v105 = v9;
    if (v7 < v3)
    {
      uint64_t v10 = *v2;
      sub_1D75B93BC(*v2 + 48 * v7, (uint64_t)v110);
      sub_1D75B93BC(v10 + 48 * v9, (uint64_t)v108);
      uint64_t v11 = v111;
      uint64_t v12 = v109;
      sub_1D75B8E3C((uint64_t)v108);
      uint64_t result = sub_1D75B8E3C((uint64_t)v110);
      uint64_t v7 = v9 + 2;
      if (v9 + 2 < v3)
      {
        uint64_t v100 = v8;
        uint64_t v13 = v10 + 48 * v9 + 48;
        while (1)
        {
          sub_1D75B93BC(v13 + 48, (uint64_t)v110);
          sub_1D75B93BC(v13, (uint64_t)v108);
          BOOL v14 = v109 >= v111;
          sub_1D75B8E3C((uint64_t)v108);
          uint64_t result = sub_1D75B8E3C((uint64_t)v110);
          if (v12 < v11 == v14) {
            break;
          }
          ++v7;
          v13 += 48;
          if (v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
        uint64_t v8 = v100;
        uint64_t v9 = v105;
      }
      if (v12 < v11)
      {
        if (v7 < v9) {
          goto LABEL_129;
        }
        if (v9 < v7)
        {
          uint64_t v15 = (long long *)(v10 + 48 * v7 - 48);
          uint64_t v16 = (long long *)(v10 + 48 * v9);
          uint64_t v17 = v7;
          uint64_t v18 = v9;
          do
          {
            if (v18 != --v17)
            {
              if (!v10) {
                goto LABEL_135;
              }
              long long v19 = *v16;
              long long v20 = v16[1];
              long long v21 = v16[2];
              long long v23 = v15[1];
              long long v22 = v15[2];
              *uint64_t v16 = *v15;
              v16[1] = v23;
              v16[2] = v22;
              v15[1] = v20;
              v15[2] = v21;
              long long *v15 = v19;
            }
            ++v18;
            v15 -= 3;
            v16 += 3;
          }
          while (v18 < v17);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v9)) {
        goto LABEL_126;
      }
      if (v7 - v9 < v102)
      {
        if (__OFADD__(v9, v102)) {
          goto LABEL_130;
        }
        if (v9 + v102 >= v3) {
          uint64_t v24 = v3;
        }
        else {
          uint64_t v24 = v9 + v102;
        }
        if (v24 < v9) {
          goto LABEL_131;
        }
        if (v7 != v24)
        {
          uint64_t v101 = v8;
          uint64_t v25 = 48 * v7;
          do
          {
            uint64_t v26 = v9;
            uint64_t v27 = v25;
            do
            {
              uint64_t v28 = *v2 + v27;
              sub_1D75B93BC(v28, (uint64_t)v110);
              sub_1D75B93BC(v28 - 48, (uint64_t)v108);
              uint64_t v29 = v111;
              uint64_t v30 = v109;
              sub_1D75B8E3C((uint64_t)v108);
              uint64_t result = sub_1D75B8E3C((uint64_t)v110);
              if (v30 >= v29) {
                break;
              }
              if (!*v2) {
                goto LABEL_133;
              }
              int64_t v31 = (long long *)(*v2 + v27);
              long long v33 = v31[1];
              long long v32 = v31[2];
              long long v34 = *v31;
              long long v35 = *(v31 - 2);
              *int64_t v31 = *(v31 - 3);
              v31[1] = v35;
              v31[2] = *(v31 - 1);
              *(v31 - 3) = v34;
              *(v31 - 2) = v33;
              *(v31 - 1) = v32;
              v27 -= 48;
              ++v26;
            }
            while (v7 != v26);
            ++v7;
            v25 += 48;
            uint64_t v9 = v105;
          }
          while (v7 != v24);
          uint64_t v7 = v24;
          uint64_t v8 = v101;
        }
      }
    }
    if (v7 < v9) {
      goto LABEL_125;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1D761B364(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    unint64_t v37 = *(void *)(v8 + 16);
    unint64_t v36 = *(void *)(v8 + 24);
    unint64_t v38 = v37 + 1;
    if (v37 >= v36 >> 1)
    {
      uint64_t result = (uint64_t)sub_1D761B364((char *)(v36 > 1), v37 + 1, 1, (char *)v8);
      uint64_t v8 = result;
    }
    *(void *)(v8 + 16) = v38;
    uint64_t v39 = v8 + 32;
    long long v40 = (uint64_t *)(v8 + 32 + 16 * v37);
    *long long v40 = v9;
    v40[1] = v7;
    if (v37) {
      break;
    }
    unint64_t v38 = 1;
LABEL_84:
    uint64_t v3 = v2[1];
    if (v7 >= v3) {
      goto LABEL_92;
    }
  }
  uint64_t v106 = v7;
  while (1)
  {
    unint64_t v41 = v38 - 1;
    if (v38 >= 4)
    {
      unint64_t v46 = v39 + 16 * v38;
      uint64_t v47 = *(void *)(v46 - 64);
      uint64_t v48 = *(void *)(v46 - 56);
      BOOL v52 = __OFSUB__(v48, v47);
      uint64_t v49 = v48 - v47;
      if (v52) {
        goto LABEL_110;
      }
      uint64_t v51 = *(void *)(v46 - 48);
      uint64_t v50 = *(void *)(v46 - 40);
      BOOL v52 = __OFSUB__(v50, v51);
      uint64_t v44 = v50 - v51;
      char v45 = v52;
      if (v52) {
        goto LABEL_111;
      }
      unint64_t v53 = v38 - 2;
      uint64_t v54 = (uint64_t *)(v39 + 16 * (v38 - 2));
      uint64_t v56 = *v54;
      uint64_t v55 = v54[1];
      BOOL v52 = __OFSUB__(v55, v56);
      uint64_t v57 = v55 - v56;
      if (v52) {
        goto LABEL_112;
      }
      BOOL v52 = __OFADD__(v44, v57);
      uint64_t v58 = v44 + v57;
      if (v52) {
        goto LABEL_114;
      }
      if (v58 >= v49)
      {
        unsigned int v76 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v78 = *v76;
        uint64_t v77 = v76[1];
        BOOL v52 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v52) {
          goto LABEL_120;
        }
        BOOL v69 = v44 < v79;
        goto LABEL_73;
      }
    }
    else
    {
      if (v38 != 3)
      {
        uint64_t v70 = *(void *)(v8 + 32);
        uint64_t v71 = *(void *)(v8 + 40);
        BOOL v52 = __OFSUB__(v71, v70);
        uint64_t v63 = v71 - v70;
        char v64 = v52;
        goto LABEL_67;
      }
      uint64_t v43 = *(void *)(v8 + 32);
      uint64_t v42 = *(void *)(v8 + 40);
      BOOL v52 = __OFSUB__(v42, v43);
      uint64_t v44 = v42 - v43;
      char v45 = v52;
    }
    if (v45) {
      goto LABEL_113;
    }
    unint64_t v53 = v38 - 2;
    uint64_t v59 = (uint64_t *)(v39 + 16 * (v38 - 2));
    uint64_t v61 = *v59;
    uint64_t v60 = v59[1];
    BOOL v62 = __OFSUB__(v60, v61);
    uint64_t v63 = v60 - v61;
    char v64 = v62;
    if (v62) {
      goto LABEL_115;
    }
    uint64_t v65 = (uint64_t *)(v39 + 16 * v41);
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v52 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v52) {
      goto LABEL_117;
    }
    if (__OFADD__(v63, v68)) {
      goto LABEL_119;
    }
    if (v63 + v68 >= v44)
    {
      BOOL v69 = v44 < v68;
LABEL_73:
      if (v69) {
        unint64_t v41 = v53;
      }
      goto LABEL_75;
    }
LABEL_67:
    if (v64) {
      goto LABEL_116;
    }
    uint64_t v72 = (uint64_t *)(v39 + 16 * v41);
    uint64_t v74 = *v72;
    uint64_t v73 = v72[1];
    BOOL v52 = __OFSUB__(v73, v74);
    uint64_t v75 = v73 - v74;
    if (v52) {
      goto LABEL_118;
    }
    if (v75 < v63) {
      goto LABEL_84;
    }
LABEL_75:
    unint64_t v80 = v41 - 1;
    if (v41 - 1 >= v38)
    {
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
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
      goto LABEL_121;
    }
    uint64_t v81 = *v2;
    if (!*v2) {
      goto LABEL_134;
    }
    uint64_t v82 = v8;
    __int16 v83 = v2;
    uint64_t v84 = (uint64_t *)(v39 + 16 * v80);
    uint64_t v85 = *v84;
    uint64_t v86 = v39;
    unint64_t v87 = v41;
    uint64_t v88 = (void *)(v39 + 16 * v41);
    uint64_t v89 = v88[1];
    uint64_t v90 = v112;
    uint64_t result = sub_1D761B154((char *)(v81 + 48 * *v84), (char *)(v81 + 48 * *v88), v81 + 48 * v89, v107);
    uint64_t v112 = v90;
    if (v90) {
      break;
    }
    if (v89 < v85) {
      goto LABEL_107;
    }
    if (v87 > *(void *)(v82 + 16)) {
      goto LABEL_108;
    }
    *uint64_t v84 = v85;
    *(void *)(v86 + 16 * v80 + 8) = v89;
    unint64_t v91 = *(void *)(v82 + 16);
    if (v87 >= v91) {
      goto LABEL_109;
    }
    uint64_t v8 = v82;
    unint64_t v38 = v91 - 1;
    uint64_t result = (uint64_t)memmove(v88, v88 + 2, 16 * (v91 - 1 - v87));
    uint64_t v39 = v86;
    *(void *)(v82 + 16) = v91 - 1;
    uint64_t v2 = v83;
    uint64_t v7 = v106;
    if (v91 <= 2) {
      goto LABEL_84;
    }
  }
LABEL_89:
  uint64_t result = swift_bridgeObjectRelease();
  if (v104 < -1) {
    goto LABEL_128;
  }
  *(void *)(v103 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D761B050(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v7 = result;
    uint64_t v8 = 48 * a3;
    while (2)
    {
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      do
      {
        uint64_t v11 = *a4 + v10;
        sub_1D75B93BC(v11, (uint64_t)v21);
        sub_1D75B93BC(v11 - 48, (uint64_t)v19);
        uint64_t v12 = v22;
        uint64_t v13 = v20;
        sub_1D75B8E3C((uint64_t)v19);
        uint64_t result = sub_1D75B8E3C((uint64_t)v21);
        if (v13 >= v12) {
          break;
        }
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        BOOL v14 = (long long *)(*a4 + v10);
        long long v16 = v14[1];
        long long v15 = v14[2];
        long long v17 = *v14;
        long long v18 = *(v14 - 2);
        *BOOL v14 = *(v14 - 3);
        v14[1] = v18;
        v14[2] = *(v14 - 1);
        *(v14 - 3) = v17;
        *(v14 - 2) = v16;
        *(v14 - 1) = v15;
        v10 -= 48;
        ++v9;
      }
      while (v5 != v9);
      ++v5;
      v8 += 48;
      if (v5 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_1D761B154(char *a1, char *a2, unint64_t a3, char *a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  if (v9 >= v11)
  {
    sub_1D75D155C(a2, (uint64_t)(a3 - (void)a2) / 48, a4);
    uint64_t v12 = &v4[48 * v11];
    if (v7 < v6 && v10 >= 48)
    {
      uint64_t v22 = (char *)(a3 - 48);
      unint64_t v38 = v4;
      do
      {
        long long v23 = v22 + 48;
        uint64_t v24 = v12 - 48;
        sub_1D75B93BC((uint64_t)(v12 - 48), (uint64_t)v36);
        uint64_t v25 = v6 - 48;
        sub_1D75B93BC((uint64_t)(v6 - 48), (uint64_t)v34);
        uint64_t v26 = v37;
        unint64_t v27 = (unint64_t)v12;
        uint64_t v28 = v35;
        sub_1D75B8E3C((uint64_t)v34);
        sub_1D75B8E3C((uint64_t)v36);
        if (v28 >= v26)
        {
          BOOL v29 = v23 != (char *)v27 || (unint64_t)v22 >= v27;
          uint64_t v25 = v24;
          uint64_t v12 = v24;
        }
        else
        {
          BOOL v29 = v23 != v6 || v22 >= v6;
          v6 -= 48;
          uint64_t v12 = (char *)v27;
        }
        unint64_t v4 = v38;
        if (v29)
        {
          long long v30 = *(_OWORD *)v25;
          long long v31 = *((_OWORD *)v25 + 2);
          *((_OWORD *)v22 + 1) = *((_OWORD *)v25 + 1);
          *((_OWORD *)v22 + 2) = v31;
          *(_OWORD *)uint64_t v22 = v30;
        }
        v22 -= 48;
      }
      while (v12 > v4 && v6 > v7);
    }
  }
  else
  {
    sub_1D75D155C(a1, (a2 - a1) / 48, a4);
    uint64_t v12 = &v4[48 * v9];
    if ((unint64_t)v6 < a3 && v8 >= 48)
    {
      do
      {
        sub_1D75B93BC((uint64_t)v6, (uint64_t)v36);
        sub_1D75B93BC((uint64_t)v4, (uint64_t)v34);
        uint64_t v13 = v37;
        uint64_t v14 = v35;
        sub_1D75B8E3C((uint64_t)v34);
        sub_1D75B8E3C((uint64_t)v36);
        if (v14 >= v13)
        {
          BOOL v15 = v7 == v4;
          long long v16 = v4;
          v4 += 48;
          if (v15 && v7 < v4) {
            goto LABEL_16;
          }
        }
        else
        {
          BOOL v15 = v7 == v6;
          long long v16 = v6;
          v6 += 48;
          if (v15 && v7 < v6) {
            goto LABEL_16;
          }
        }
        long long v19 = *(_OWORD *)v16;
        long long v20 = *((_OWORD *)v16 + 2);
        *((_OWORD *)v7 + 1) = *((_OWORD *)v16 + 1);
        *((_OWORD *)v7 + 2) = v20;
        *(_OWORD *)uint64_t v7 = v19;
LABEL_16:
        v7 += 48;
      }
      while (v4 < v12 && (unint64_t)v6 < a3);
    }
    uint64_t v6 = v7;
  }
  sub_1D75D155C(v4, (v12 - v4) / 48, v6);
  return 1;
}

char *sub_1D761B364(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C528);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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

char *sub_1D761B45C(uint64_t a1)
{
  return sub_1D761B364(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t type metadata accessor for TunnelEndpoint.Event()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1D761B488()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D761B4C0()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D761B4F8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D761B530()
{
  return sub_1D760EB20(v0[4], v0[2], v0[3]);
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

unint64_t sub_1D761B558()
{
  unint64_t result = qword_1EA82C300[0];
  if (!qword_1EA82C300[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA82C300);
  }
  return result;
}

uint64_t sub_1D761B5A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1D760BCE0(a1);
}

uint64_t sub_1D761B5D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1D760BF08(a1);
}

uint64_t sub_1D761B614@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D760C1AC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelConnectionType(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelConnectionType(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1D761B6B0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D761B6CC(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

void type metadata accessor for TunnelConnectionType()
{
}

void type metadata accessor for TunnelConnectionPriority()
{
}

uint64_t dispatch thunk of AnyTunnelEndpoint.localTunnelInterface.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.remoteAddress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.serverRSDPort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() & 0x1FFFF;
}

uint64_t dispatch thunk of AnyTunnelEndpoint.startPacketTransfer(errorHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.establishServerTunnel(localParameters:remoteAddress:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.finishEstablishingServerTunnel(serverRSDPort:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.establishClientTunnel(mtu:completion:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))(a1 & 0x1FFFF);
}

uint64_t dispatch thunk of AnyTunnelEndpoint.clientInjectAdditionalConnection(_:priority:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.serverInjectAdditionalConnection(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AnyTunnelEndpoint.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

void sub_1D761B7F8()
{
  sub_1D7661000();
  if (v0 <= 0x3F)
  {
    sub_1D761BD98(319, &qword_1EA82C388, MEMORY[0x1F418D9B0]);
    if (v1 <= 0x3F)
    {
      sub_1D761BD98(319, qword_1EA82C390, (void (*)(uint64_t))type metadata accessor for TunnelInterfaceParameters);
      if (v2 <= 0x3F) {
        swift_initClassMetadata2();
      }
    }
  }
}

uint64_t type metadata accessor for TunnelEndpoint()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for TunnelEndpoint(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TunnelEndpoint);
}

uint64_t dispatch thunk of TunnelEndpoint.serverInjectAdditionalConnection(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TunnelEndpoint.clientInjectAdditionalConnection(_:priority:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of TunnelEndpoint.localTunnelInterface.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of TunnelEndpoint.localInterface.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of TunnelEndpoint.localInterface.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of TunnelEndpoint.localInterface.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of TunnelEndpoint.remoteAddress.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of TunnelEndpoint.remoteAddress.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of TunnelEndpoint.remoteAddress.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of TunnelEndpoint.serverRSDPort.getter()
{
  OUTLINED_FUNCTION_1_9();
  return (*(uint64_t (**)(void))(v0 + 304))() & 0x1FFFF;
}

uint64_t dispatch thunk of TunnelEndpoint.serverRSDPort.setter()
{
  OUTLINED_FUNCTION_1_9();
  return (*(uint64_t (**)(void))(v0 + 312))(v1 & 0x1FFFF);
}

uint64_t dispatch thunk of TunnelEndpoint.serverRSDPort.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of TunnelEndpoint.loggingPrefix.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of TunnelEndpoint.loggingPrefix.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of TunnelEndpoint.loggingPrefix.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of TunnelEndpoint.__allocating_init(connection:workQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 640))();
}

uint64_t dispatch thunk of TunnelEndpoint.__allocating_init(id:connection:workQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 648))();
}

uint64_t dispatch thunk of TunnelEndpoint.__allocating_init(id:connectionObject:workQueue:priority:)()
{
  return (*(uint64_t (**)(void))(v0 + 656))();
}

uint64_t dispatch thunk of TunnelEndpoint.establishClientTunnel(mtu:completion:)()
{
  OUTLINED_FUNCTION_1_9();
  return (*(uint64_t (**)(void))(v0 + 664))(v1 & 0x1FFFF);
}

uint64_t dispatch thunk of TunnelEndpoint.establishServerTunnel(localParameters:remoteAddress:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of TunnelEndpoint.finishEstablishingServerTunnel(serverRSDPort:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of TunnelEndpoint.startPacketTransfer(errorHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of TunnelEndpoint.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

void sub_1D761BD98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1D7661000();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1D761BDEC(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    unsigned int v5 = -1;
    return v5 + 1;
  }
  if (a2 >= 0x7B)
  {
    if (a2 + 133 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 133) >> 8 < 0xFF) {
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
    unsigned int v5 = (*a1 | (v4 << 8)) - 134;
    return v5 + 1;
  }
LABEL_17:
  unsigned int v5 = ((*a1 >> 5) & 0xFFFFFF87 | (8 * ((*a1 >> 1) & 0xF))) ^ 0x7F;
  if (v5 >= 0x7A) {
    unsigned int v5 = -1;
  }
  return v5 + 1;
}

unsigned char *sub_1D761BE84(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 133 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 133) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7B) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7A)
  {
    unsigned int v6 = ((a2 - 123) >> 8) + 1;
    *uint64_t result = a2 - 123;
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
        JUMPOUT(0x1D761BF5CLL);
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
          *uint64_t result = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_1D761BF84(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 <= 0x3F) {
    return v1 >> 5;
  }
  else {
    return (v1 | 0xFFFFFFFE) + 2 * (v1 >> 5);
  }
}

unsigned char *sub_1D761BFA0(unsigned char *result)
{
  *result &= 0x1Fu;
  return result;
}

unsigned char *sub_1D761BFB0(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    LOBYTE(v2) = *result & 1 | (32 * a2);
  }
  else {
    int v2 = (a2 & 1 | (32 * (a2 >> 1))) + 32;
  }
  *uint64_t result = v2;
  return result;
}

uint64_t type metadata accessor for TunnelEndpoint.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1D761BFFC(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t *sub_1D761C060(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
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
        *int v3 = v12;
      }
      else
      {
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *int v3 = *a2;
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

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1D761C2D8(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  return a1;
}

uint64_t sub_1D761C314(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
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

uint64_t sub_1D761C354(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for RankedTunnelConnection()
{
}

void sub_1D761C3AC()
{
  v1[4] = MEMORY[0x1E4FBAD90] + 64;
  v1[5] = MEMORY[0x1E4FBAD90] + 64;
  v1[6] = "0";
  sub_1D761DA54();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[7] = v1;
    v1[8] = &unk_1D7668CC8;
    v1[9] = &unk_1D7668D58;
    v1[10] = &unk_1D7668C98;
    v1[11] = "0";
    v1[12] = "0";
    v1[13] = &unk_1D7668C98;
    v1[14] = "0";
    v1[15] = &unk_1D7668D70;
    swift_initEnumMetadataMultiPayload();
  }
}

char *sub_1D761C498(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *(char **)a2;
    *(void *)a1 = *(void *)a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 0xAu:
        long long v7 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v7;
        (**(void (***)(void *, const void *))(v7 - 8))(a1, a2);
        uint64_t v8 = (void *)*((void *)a2 + 5);
        id v9 = v8;
        *((void *)a1 + 5) = v8;
        goto LABEL_17;
      case 3u:
        long long v13 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v13;
        (**(void (***)(void *, const void *))(v13 - 8))(a1, a2);
        uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
        BOOL v15 = &a1[v14];
        long long v16 = (void **)&a2[v14];
        __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          long long v17 = *v16;
          id v18 = v17;
          *(void *)BOOL v15 = v17;
        }
        else
        {
          uint64_t v23 = type metadata accessor for TunnelMessage();
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v24 = sub_1D7660430();
            uint64_t v25 = *(void (**)(char *, void **, uint64_t))(*(void *)(v24 - 8) + 16);
            v25(v15, v16, v24);
            uint64_t v26 = type metadata accessor for TunnelInterfaceParameters();
            v25(&v15[*(int *)(v26 + 20)], (void **)((char *)v16 + *(int *)(v26 + 20)), v24);
            *(_WORD *)&v15[*(int *)(v26 + 24)] = *(_WORD *)((char *)v16 + *(int *)(v26 + 24));
            uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
            v25(&v15[*(int *)(v27 + 48)], (void **)((char *)v16 + *(int *)(v27 + 48)), v24);
            *(_WORD *)&v15[*(int *)(v27 + 64)] = *(_WORD *)((char *)v16 + *(int *)(v27 + 64));
            swift_storeEnumTagMultiPayload();
          }
          else
          {
            memcpy(v15, v16, *(void *)(*(void *)(v23 - 8) + 64));
          }
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_17;
      case 5u:
        uint64_t v11 = *((void *)a2 + 2);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((void *)a1 + 2) = v11;
        swift_bridgeObjectRetain();
        swift_retain();
        goto LABEL_17;
      case 6u:
      case 9u:
        long long v19 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v19;
        (**(void (***)(void *, const void *))(v19 - 8))(a1, a2);
        goto LABEL_17;
      case 7u:
        long long v20 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v20;
        (**(void (***)(void *, const void *))(v20 - 8))(a1, a2);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        swift_bridgeObjectRetain();
        goto LABEL_17;
      case 8u:
        long long v12 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v12;
        (**(void (***)(void *, const void *))(v12 - 8))(a1, a2);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        goto LABEL_17;
      case 0xBu:
        long long v21 = *(void **)a2;
        id v22 = v21;
        *(void *)a1 = v21;
LABEL_17:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void sub_1D761C9A8(void **a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 0xAu:
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
      unint64_t v2 = a1[5];
      goto LABEL_8;
    case 3u:
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
      a1 = (void **)((char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48));
      __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
      if (swift_getEnumCaseMultiPayload() == 1) {
        goto LABEL_7;
      }
      type metadata accessor for TunnelMessage();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v3 = sub_1D7660430();
        uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
        ((void (*)(void *__return_ptr, void **, uint64_t))v6)((void *)(v3 - 8), a1, v3);
        uint64_t v4 = type metadata accessor for TunnelInterfaceParameters();
        v6((char *)a1 + *(int *)(v4 + 20), v3);
        int v5 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88) + 48);
        v6(v5, v3);
      }
      break;
    case 5u:
      swift_bridgeObjectRelease();
      swift_release();
      return;
    case 6u:
    case 8u:
    case 9u:
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
      return;
    case 7u:
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
      swift_bridgeObjectRelease();
      return;
    case 0xBu:
LABEL_7:
      unint64_t v2 = *a1;
LABEL_8:

      break;
    default:
      return;
  }
}

char *sub_1D761CBDC(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 0xAu:
      long long v6 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v6;
      (**(void (***)(void *, const void *))(v6 - 8))(a1, a2);
      long long v7 = (void *)*((void *)a2 + 5);
      id v8 = v7;
      *((void *)a1 + 5) = v7;
      goto LABEL_15;
    case 3u:
      long long v11 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v11;
      (**(void (***)(void *, const void *))(v11 - 8))(a1, a2);
      uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
      long long v13 = &a1[v12];
      uint64_t v14 = (void **)&a2[v12];
      __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        BOOL v15 = *v14;
        id v16 = v15;
        *(void *)long long v13 = v15;
      }
      else
      {
        uint64_t v21 = type metadata accessor for TunnelMessage();
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v22 = sub_1D7660430();
          uint64_t v23 = *(void (**)(char *, void **, uint64_t))(*(void *)(v22 - 8) + 16);
          v23(v13, v14, v22);
          uint64_t v24 = type metadata accessor for TunnelInterfaceParameters();
          v23(&v13[*(int *)(v24 + 20)], (void **)((char *)v14 + *(int *)(v24 + 20)), v22);
          *(_WORD *)&v13[*(int *)(v24 + 24)] = *(_WORD *)((char *)v14 + *(int *)(v24 + 24));
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
          v23(&v13[*(int *)(v25 + 48)], (void **)((char *)v14 + *(int *)(v25 + 48)), v22);
          *(_WORD *)&v13[*(int *)(v25 + 64)] = *(_WORD *)((char *)v14 + *(int *)(v25 + 64));
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v13, v14, *(void *)(*(void *)(v21 - 8) + 64));
        }
      }
      swift_storeEnumTagMultiPayload();
      goto LABEL_15;
    case 5u:
      uint64_t v9 = *((void *)a2 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((void *)a1 + 2) = v9;
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_15;
    case 6u:
    case 9u:
      long long v17 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v17;
      (**(void (***)(void *, const void *))(v17 - 8))(a1, a2);
      goto LABEL_15;
    case 7u:
      long long v18 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v18;
      (**(void (***)(void *, const void *))(v18 - 8))(a1, a2);
      *((void *)a1 + 5) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      goto LABEL_15;
    case 8u:
      long long v10 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v10;
      (**(void (***)(void *, const void *))(v10 - 8))(a1, a2);
      *((void *)a1 + 5) = *((void *)a2 + 5);
      goto LABEL_15;
    case 0xBu:
      long long v19 = *(void **)a2;
      id v20 = v19;
      *(void *)a1 = v19;
LABEL_15:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_1D761D0A8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
      case 0xAu:
        uint64_t v6 = a2[3];
        a1[3] = v6;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v6 - 8))(a1, a2);
        long long v7 = (void *)a2[5];
        id v8 = v7;
        a1[5] = v7;
        goto LABEL_16;
      case 3u:
        uint64_t v12 = a2[3];
        a1[3] = v12;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v12 - 8))(a1, a2);
        uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
        uint64_t v14 = (void *)((char *)a1 + v13);
        BOOL v15 = (void **)((char *)a2 + v13);
        __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          id v16 = *v15;
          id v17 = v16;
          *uint64_t v14 = v16;
        }
        else
        {
          uint64_t v22 = type metadata accessor for TunnelMessage();
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v23 = sub_1D7660430();
            uint64_t v24 = *(void (**)(void *, void **, uint64_t))(*(void *)(v23 - 8) + 16);
            v24(v14, v15, v23);
            uint64_t v25 = type metadata accessor for TunnelInterfaceParameters();
            v24((void *)((char *)v14 + *(int *)(v25 + 20)), (void **)((char *)v15 + *(int *)(v25 + 20)), v23);
            *(_WORD *)((char *)v14 + *(int *)(v25 + 24)) = *(_WORD *)((char *)v15 + *(int *)(v25 + 24));
            uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
            v24((void *)((char *)v14 + *(int *)(v26 + 48)), (void **)((char *)v15 + *(int *)(v26 + 48)), v23);
            *(_WORD *)((char *)v14 + *(int *)(v26 + 64)) = *(_WORD *)((char *)v15 + *(int *)(v26 + 64));
            swift_storeEnumTagMultiPayload();
          }
          else
          {
            memcpy(v14, v15, *(void *)(*(void *)(v22 - 8) + 64));
          }
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_16;
      case 5u:
        *a1 = *a2;
        uint64_t v9 = a2[1];
        uint64_t v10 = a2[2];
        a1[1] = v9;
        a1[2] = v10;
        swift_bridgeObjectRetain();
        swift_retain();
        goto LABEL_16;
      case 6u:
      case 9u:
        uint64_t v18 = a2[3];
        a1[3] = v18;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v18 - 8))(a1, a2);
        goto LABEL_16;
      case 7u:
        uint64_t v19 = a2[3];
        a1[3] = v19;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v19 - 8))(a1, a2);
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        goto LABEL_16;
      case 8u:
        uint64_t v11 = a2[3];
        a1[3] = v11;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v11 - 8))(a1, a2);
        a1[5] = a2[5];
        goto LABEL_16;
      case 0xBu:
        id v20 = (void *)*a2;
        id v21 = v20;
        *a1 = v20;
LABEL_16:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v5 + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_1D761D5E0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    long long v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    *((void *)a1 + 4) = *((void *)a2 + 4);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v11 = type metadata accessor for TunnelMessage();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v12 = sub_1D7660430();
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
        v13(v8, v9, v12);
        uint64_t v14 = type metadata accessor for TunnelInterfaceParameters();
        v13(&v8[*(int *)(v14 + 20)], &v9[*(int *)(v14 + 20)], v12);
        *(_WORD *)&v8[*(int *)(v14 + 24)] = *(_WORD *)&v9[*(int *)(v14 + 24)];
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
        v13(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v12);
        *(_WORD *)&v8[*(int *)(v15 + 64)] = *(_WORD *)&v9[*(int *)(v15 + 64)];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_1D761D7F0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(_OWORD *, uint64_t))(v5 + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
      id v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        uint64_t v11 = type metadata accessor for TunnelMessage();
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v12 = sub_1D7660430();
          uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
          v13(v8, v9, v12);
          uint64_t v14 = type metadata accessor for TunnelInterfaceParameters();
          v13(&v8[*(int *)(v14 + 20)], &v9[*(int *)(v14 + 20)], v12);
          *(_WORD *)&v8[*(int *)(v14 + 24)] = *(_WORD *)&v9[*(int *)(v14 + 24)];
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
          v13(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v12);
          *(_WORD *)&v8[*(int *)(v15 + 64)] = *(_WORD *)&v9[*(int *)(v15 + 64)];
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
        }
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
  }
  return a1;
}

void sub_1D761DA54()
{
  if (!qword_1EA82C4B0)
  {
    type metadata accessor for TunnelMessage();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBDEC030);
    unint64_t v0 = sub_1D7661780();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA82C4B0);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for TunnelConnectionType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x1D761DB94);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TunnelConnectionType.CodingKeys()
{
  return &type metadata for TunnelConnectionType.CodingKeys;
}

ValueMetadata *type metadata accessor for TunnelConnectionType.MigratableCodingKeys()
{
  return &type metadata for TunnelConnectionType.MigratableCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TunnelConnectionType.SinglePathCodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1D761DC78);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TunnelConnectionType.SinglePathCodingKeys()
{
  return &type metadata for TunnelConnectionType.SinglePathCodingKeys;
}

unint64_t sub_1D761DCB4()
{
  unint64_t result = qword_1EA82C4C0;
  if (!qword_1EA82C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4C0);
  }
  return result;
}

unint64_t sub_1D761DD04()
{
  unint64_t result = qword_1EA82C4C8;
  if (!qword_1EA82C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4C8);
  }
  return result;
}

unint64_t sub_1D761DD54()
{
  unint64_t result = qword_1EA82C4D0;
  if (!qword_1EA82C4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4D0);
  }
  return result;
}

unint64_t sub_1D761DDA4()
{
  unint64_t result = qword_1EA82C4D8;
  if (!qword_1EA82C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4D8);
  }
  return result;
}

unint64_t sub_1D761DDF4()
{
  unint64_t result = qword_1EA82C4E0;
  if (!qword_1EA82C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4E0);
  }
  return result;
}

unint64_t sub_1D761DE44()
{
  unint64_t result = qword_1EA82C4E8;
  if (!qword_1EA82C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4E8);
  }
  return result;
}

unint64_t sub_1D761DE94()
{
  unint64_t result = qword_1EA82C4F0;
  if (!qword_1EA82C4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4F0);
  }
  return result;
}

unint64_t sub_1D761DEE4()
{
  unint64_t result = qword_1EA82C4F8;
  if (!qword_1EA82C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C4F8);
  }
  return result;
}

uint64_t sub_1D761DF30(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v13 = 0;
LABEL_36:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_23:
    ++v13;
    unint64_t result = sub_1D75B93BC(*(void *)(a4 + 56) + 48 * v16, (uint64_t)v23);
    long long v21 = v23[1];
    long long v20 = v23[2];
    *uint64_t v11 = v23[0];
    v11[1] = v21;
    v11[2] = v20;
    v11 += 3;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v22;
      goto LABEL_36;
    }
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_15;
  }
  int64_t v12 = v17 + 1;
  if (v17 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_22;
  }
  int64_t v12 = v17 + 2;
  if (v17 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_22;
  }
  int64_t v19 = v17 + 4;
  int64_t v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_15:
    int64_t v17 = v19;
LABEL_22:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1D761E138(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
    uint64_t v13 = 0;
LABEL_36:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_23:
    ++v13;
    sub_1D758B1EC(*(void *)(a4 + 56) + 40 * v16, (uint64_t)v21);
    sub_1D758AB78(v21, (uint64_t)v22);
    unint64_t result = sub_1D758AB78(v22, v11);
    v11 += 40;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v20;
      goto LABEL_36;
    }
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_15;
  }
  int64_t v12 = v17 + 1;
  if (v17 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_22;
  }
  int64_t v12 = v17 + 2;
  if (v17 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_22;
  }
  int64_t v19 = v17 + 4;
  int64_t v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_15:
    int64_t v17 = v19;
LABEL_22:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1D761E348(uint64_t a1)
{
}

uint64_t sub_1D761E35C(uint64_t a1)
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
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1D761E3DC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  uint64_t v1 = OUTLINED_FUNCTION_123_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1D761E414(void *a1)
{
  return sub_1D761843C(a1, *(void *)(v1 + 16), v1 + 24);
}

uint64_t sub_1D761E420()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_123_0();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1D761E460(void *a1)
{
  return sub_1D76180BC(a1, *(void *)(v1 + 32), *(void (**)(uint64_t))(v1 + 40));
}

uint64_t sub_1D761E470()
{
  uint64_t v1 = OUTLINED_FUNCTION_158_0();
  v2(v1);
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = OUTLINED_FUNCTION_7_8();
  v4(v3);
  return v0;
}

uint64_t sub_1D761E4BC(void *a1)
{
  return sub_1D761689C(a1, *(void *)(v1 + 32), v1 + 40);
}

uint64_t sub_1D761E4CC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_6();
  v3();
  return a1;
}

unsigned char **sub_1D761E530(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_1D75D1FB8(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_1D761E53C()
{
  return sub_1D75D1C00(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1D761E544(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_1D75D1C28(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t objectdestroy_82Tm()
{
  type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_19_7();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = v0 + v3;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 0xAu:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      uint64_t v7 = *(void **)(v6 + 40);
      goto LABEL_6;
    case 3u:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      v6 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
      __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
      if (OUTLINED_FUNCTION_142_0() == 1) {
        goto LABEL_5;
      }
      type metadata accessor for TunnelMessage();
      if (OUTLINED_FUNCTION_142_0() == 1)
      {
        sub_1D7660430();
        OUTLINED_FUNCTION_2_2();
        unint64_t v9 = *(void (**)(void))(v8 + 8);
        OUTLINED_FUNCTION_45();
        v9();
        type metadata accessor for TunnelInterfaceParameters();
        OUTLINED_FUNCTION_45();
        v9();
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
        uint64_t v11 = OUTLINED_FUNCTION_178_0(v10);
        ((void (*)(uint64_t))v9)(v11);
      }
      break;
    case 5u:
      swift_bridgeObjectRelease();
      swift_release();
      break;
    case 6u:
    case 8u:
    case 9u:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      break;
    case 7u:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      swift_bridgeObjectRelease();
      break;
    case 0xBu:
LABEL_5:
      uint64_t v7 = *(void **)v6;
LABEL_6:

      break;
    default:
      break;
  }
  return MEMORY[0x1F4186498](v0, v3 + v5, v2 | 7);
}

uint64_t sub_1D761E744()
{
  return sub_1D7616BEC();
}

uint64_t sub_1D761E788()
{
  return sub_1D7616C7C();
}

uint64_t sub_1D761E7A8()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D761E7E0()
{
  return sub_1D7616BB0(v0 + 16);
}

uint64_t sub_1D761E7FC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D761E834()
{
  return sub_1D7616AF0(*(void **)(v0 + 16));
}

uint64_t sub_1D761E85C()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  uint64_t v1 = OUTLINED_FUNCTION_123_0();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1D761E88C()
{
  return sub_1D7616BB0(v0 + 16);
}

uint64_t sub_1D761E8AC()
{
  return sub_1D7619FE8(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

uint64_t sub_1D761E8B4()
{
  return sub_1D7616B80();
}

uint64_t sub_1D761E8D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1D763A78C(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_1D761E8DC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D763A55C(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_1D761E8F4()
{
  return sub_1D7616B2C((void *)(v0 + 16));
}

uint64_t sub_1D761E924(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D761E98C()
{
  uint64_t v2 = OUTLINED_FUNCTION_158_0();
  v3(v2);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_1D761E9E4(uint64_t a1)
{
  return sub_1D76169D4(a1, *(void *)(v1 + 32), v1 + 40);
}

uint64_t sub_1D761EA08()
{
  return objectdestroy_79Tm(88);
}

uint64_t objectdestroy_79Tm(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v1 + 40);
  return MEMORY[0x1F4186498](v1, a1, 7);
}

void sub_1D761EA60(void *a1, char a2)
{
  sub_1D7616664(a1, a2 & 1, *(void *)(v2 + 32), v2 + 40);
}

uint64_t sub_1D761EA74(uint64_t *a1)
{
  return sub_1D7616514(a1);
}

uint64_t sub_1D761EA80()
{
  return sub_1D761631C(v0);
}

uint64_t sub_1D761EA88()
{
  return sub_1D7616450();
}

uint64_t sub_1D761EA90()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D761EAA0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t sub_1D761EAF0@<X0>(_WORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1D761EB20(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D763A5BC(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_1D761EB30@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1D761EB60(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D763A61C(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_1D761EB80(void *a1)
{
  return sub_1D7616224(a1);
}

uint64_t sub_1D761EBA8(uint64_t a1)
{
  return sub_1D761611C(a1);
}

unint64_t sub_1D761EBD0()
{
  unint64_t result = qword_1EA82C530;
  if (!qword_1EA82C530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C530);
  }
  return result;
}

uint64_t sub_1D761EC1C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1D761EC64()
{
  type metadata accessor for TunnelEndpoint.Event();
  OUTLINED_FUNCTION_19_7();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v5 = *(void *)(v4 + 64);
  swift_release();
  uint64_t v6 = v0 + v3;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
    case 0xAu:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      uint64_t v7 = *(void **)(v6 + 40);
      goto LABEL_6;
    case 3u:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      v6 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C418) + 48);
      __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
      if (OUTLINED_FUNCTION_142_0() == 1) {
        goto LABEL_5;
      }
      type metadata accessor for TunnelMessage();
      if (OUTLINED_FUNCTION_142_0() == 1)
      {
        sub_1D7660430();
        OUTLINED_FUNCTION_2_2();
        unint64_t v9 = *(void (**)(void))(v8 + 8);
        OUTLINED_FUNCTION_45();
        v9();
        type metadata accessor for TunnelInterfaceParameters();
        OUTLINED_FUNCTION_45();
        v9();
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BE88);
        uint64_t v11 = OUTLINED_FUNCTION_178_0(v10);
        ((void (*)(uint64_t))v9)(v11);
      }
      break;
    case 5u:
      swift_bridgeObjectRelease();
      swift_release();
      break;
    case 6u:
    case 8u:
    case 9u:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      break;
    case 7u:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + v3);
      swift_bridgeObjectRelease();
      break;
    case 0xBu:
LABEL_5:
      uint64_t v7 = *(void **)v6;
LABEL_6:

      break;
    default:
      break;
  }
  return MEMORY[0x1F4186498](v0, v3 + v5, v2 | 7);
}

uint64_t sub_1D761EE5C()
{
  OUTLINED_FUNCTION_33_5();
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_1D760F810(v2, v3);
}

unint64_t sub_1D761EEB0()
{
  unint64_t result = qword_1EA82AEE0;
  if (!qword_1EA82AEE0)
  {
    type metadata accessor for RPTrustedHostInfoKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82AEE0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_18_8(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1D7661020();
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return sub_1D7661220();
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  return objectdestroy_79Tm(80);
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_27_5(uint64_t result)
{
  *(unsigned char *)(result + 16) = 34;
  return result;
}

uint64_t OUTLINED_FUNCTION_31_3(uint64_t a1, unint64_t a2)
{
  return sub_1D758DBE8(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_33_5()
{
  return type metadata accessor for TunnelEndpoint.Event() - 8;
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_37_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (void *)(v3 + a3);
  uint64_t v5 = *(void *)(v3 + a3);
  void *v4 = a1;
  v4[1] = a2;
  return sub_1D75940A4(v5);
}

uint64_t OUTLINED_FUNCTION_38_4(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_1D7661020();
}

uint64_t OUTLINED_FUNCTION_39_3()
{
  *(void *)(v1 + 40) = v0;
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return sub_1D758B1EC(v0 - 192, v0 - 240);
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  *(_WORD *)uint64_t v0 = 258;
  *(unsigned char *)(v0 + 2) = 34;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_57_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

__n128 OUTLINED_FUNCTION_61_1(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_63_0(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 336);
  a1[2] = *(void *)(v1 + 352);
  a1[3] = v4;
  a1[4] = v2;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return sub_1D7661020();
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  *(void *)(v0 + 504) = 0x5F6E6F6374;
  *(void *)(v0 + 512) = 0xE500000000000000;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_75(uint64_t result)
{
  *(unsigned char *)(result + 16) = 8;
  return result;
}

void OUTLINED_FUNCTION_76_0()
{
  uint64_t v1 = *(void *)(v0 - 136);
  *(void *)(v0 - 144) = *(void *)(v0 - 144);
  *(void *)(v0 - 136) = v1;
}

void *OUTLINED_FUNCTION_77_0()
{
  return __swift_project_boxed_opaque_existential_0Tm((void *)(v1 - 192), v0);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  *(unsigned char *)(v0 + 3) = 8;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_81_0(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 336);
  a1[2] = *(void *)(v1 + 352);
  a1[3] = v4;
  a1[4] = v2;
  return sub_1D758AB78((long long *)(v3 - 240), (uint64_t)(a1 + 5));
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_1D7661560();
}

uint64_t OUTLINED_FUNCTION_84_0()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_88_0()
{
  uint64_t result = *v0;
  *uint64_t v0 = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_93_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_94_0()
{
  *(_WORD *)(v2 + 22) = v1;
  return v0;
}

uint64_t OUTLINED_FUNCTION_96_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_98_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_99_0(uint64_t a1)
{
  *(void *)(v1 + 544) = a1;
  return v1 + 544;
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_101_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_103_0(uint64_t a1)
{
  *uint64_t v1 = a1;
  return sub_1D7661020();
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  uint64_t v2 = v0[63];
  unint64_t v3 = v0[64];
  return sub_1D758DBE8(v2, v3, v0 + 58);
}

uint64_t OUTLINED_FUNCTION_106_0(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + 336);
  *(void *)(result + 16) = *(void *)(v1 + 352);
  *(void *)(result + 24) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_115_0(uint64_t result)
{
  *(void *)(v1 + 464) = result;
  *(_WORD *)uint64_t v2 = 514;
  *(unsigned char *)(v2 + 2) = 34;
  return result;
}

uint64_t OUTLINED_FUNCTION_117()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_119_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_120_0(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return sub_1D7661020();
}

uint64_t OUTLINED_FUNCTION_121_0(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return sub_1D7661020();
}

uint64_t OUTLINED_FUNCTION_122_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_123_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_124_0()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_125_0()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_130(uint64_t a1)
{
  *(void *)(v1 + 544) = a1;
  return v1 + 544;
}

uint64_t OUTLINED_FUNCTION_132_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_133_0()
{
  return sub_1D75AF4C0();
}

uint64_t OUTLINED_FUNCTION_134_0()
{
  return v0 - 240;
}

uint64_t OUTLINED_FUNCTION_135_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_136_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_141_0()
{
  return sub_1D760C304(v0 - 240);
}

uint64_t OUTLINED_FUNCTION_142_0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_143_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + a1);
  sub_1D75A74B4(v2);
  return v2;
}

BOOL OUTLINED_FUNCTION_145_0()
{
  unint64_t v3 = *(NSObject **)(v1 + 576);
  return os_log_type_enabled(v3, v0);
}

uint64_t OUTLINED_FUNCTION_149_0()
{
  return sub_1D75B4628();
}

uint64_t OUTLINED_FUNCTION_151_0()
{
  uint64_t v3 = *(void *)(v0 + 320);
  return sub_1D758B1EC(v1 - 192, v3);
}

void OUTLINED_FUNCTION_153_0()
{
  uint64_t v1 = v0[1];
  v0[19] = *v0;
  v0[20] = v1;
}

uint64_t OUTLINED_FUNCTION_154_0(uint64_t a1)
{
  *(void *)(v1 - 192) = a1;
  return v1 - 192;
}

uint64_t OUTLINED_FUNCTION_156_0()
{
  return sub_1D7661560();
}

uint64_t OUTLINED_FUNCTION_158_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_160_0()
{
  return sub_1D7660B60();
}

uint64_t OUTLINED_FUNCTION_164_0()
{
  return sub_1D7660A50();
}

uint64_t OUTLINED_FUNCTION_165_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_166_0()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_167_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_168()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_170_0()
{
  return sub_1D7660A50();
}

uint64_t OUTLINED_FUNCTION_171_0()
{
  return sub_1D758B1EC(v0 - 136, v0 - 192);
}

uint64_t OUTLINED_FUNCTION_172_0()
{
  return sub_1D7660A50();
}

uint64_t OUTLINED_FUNCTION_173_0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_174_0()
{
  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_175_0()
{
  return 1029;
}

uint64_t OUTLINED_FUNCTION_176_0()
{
  return 1030;
}

uint64_t OUTLINED_FUNCTION_177_0()
{
  return sub_1D7660BC0();
}

uint64_t OUTLINED_FUNCTION_178_0(uint64_t a1)
{
  return v1 + *(int *)(a1 + 48);
}

uint64_t OUTLINED_FUNCTION_179_0()
{
  return sub_1D7661690();
}

uint64_t OUTLINED_FUNCTION_180_0()
{
  *(void *)(v0 - 144) = 0;
  *(void *)(v0 - 136) = 0xE000000000000000;
  return sub_1D7661100();
}

uint64_t OUTLINED_FUNCTION_181_0@<X0>(__int16 a1@<W8>)
{
  *(_WORD *)uint64_t v1 = a1;
  *(unsigned char *)(v1 + 2) = 34;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_182_0(__int16 a1)
{
  *(_WORD *)(v2 - 96) = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_183_0()
{
  return sub_1D76612D0();
}

void OUTLINED_FUNCTION_186_0()
{
  *(_WORD *)(v1 + 12) = 2082;
  *(_WORD *)(v2 - 96) = v0;
}

void OUTLINED_FUNCTION_188_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_190_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x20u);
}

void sub_1D761FBAC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1D765FD50();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_1D761FC10(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

uint64_t sub_1D761FC3C()
{
  sub_1D75AEF50(0, (unint64_t *)&qword_1EBDEC4C0);
  uint64_t result = sub_1D7660FE0();
  qword_1EA82C548 = result;
  return result;
}

uint64_t RPPairableHostBrowser.state.getter@<X0>(void *a1@<X8>)
{
  sub_1D75B3E6C(&v4);
  id v2 = v4;
  sub_1D75B440C(v4);
  sub_1D75DE7A0(v2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

id sub_1D761FD24()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C568);
  swift_allocObject();
  uint64_t v1 = v0;
  *(void *)&v1[OBJC_IVAR___RPPairableHostBrowser__stateStorage] = sub_1D75B42AC(1, MEMORY[0x1E4FBC860], MEMORY[0x1E4FBC860]);
  sub_1D7660260();
  sub_1D7660240();
  sub_1D7660280();
  uint64_t v2 = swift_dynamicCastClassUnconditional();
  uint64_t v3 = MEMORY[0x1E4F77AD0];
  id v4 = (uint64_t *)&v1[OBJC_IVAR___RPPairableHostBrowser_connection];
  uint64_t *v4 = v2;
  v4[1] = v3;

  v6.receiver = v1;
  v6.super_class = (Class)RPPairableHostBrowser;
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t RPPairableHostBrowser.registerInvalidationHandler(onQueue:handler:)(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v7 = a1;
  }
  else
  {
    if (qword_1EA82AAC0 != -1) {
      swift_once();
    }
    id v7 = (id)qword_1EA82CAA0;
  }
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a2;
  v8[4] = a3;
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR___RPPairableHostBrowser__stateStorage);
  uint64_t v10 = *(os_unfair_lock_s **)(v9 + 16);
  id v11 = v7;
  swift_retain_n();
  id v12 = v11;
  swift_retain();
  id v13 = a1;
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  int64_t v14 = *(char **)(v9 + 24);
  uint64_t v15 = *(void *)(v9 + 32);
  uint64_t v16 = *(void *)(v9 + 40);
  if ((unint64_t)(v14 - 1) >= 2)
  {
    sub_1D75B440C(*(id *)(v9 + 24));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1D75B440C(v14);
    sub_1D76200BC(v14, (uint64_t)v12, a2, a3);
    sub_1D75DE7A0(v14);
  }
  else
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = sub_1D76216B4;
    *(void *)(v17 + 24) = v8;
    swift_retain();
    sub_1D75B440C(v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v24 = v10;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1D75CFDA0();
      uint64_t v16 = v22;
    }
    unint64_t v18 = *(void *)(v16 + 16);
    if (v18 >= *(void *)(v16 + 24) >> 1)
    {
      sub_1D75CFDA0();
      uint64_t v16 = v23;
    }
    *(void *)(v16 + 16) = v18 + 1;
    uint64_t v19 = v16 + 16 * v18;
    *(void *)(v19 + 32) = sub_1D76216F8;
    *(void *)(v19 + 40) = v17;
    uint64_t v10 = v24;
  }
  uint64_t v20 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v14;
  *(void *)(v9 + 32) = v15;
  *(void *)(v9 + 40) = v16;
  sub_1D75DE7A0(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v10);
  swift_release();

  return swift_release_n();
}

uint64_t sub_1D76200BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = a1;
  aBlock[4] = sub_1D75EE1DC;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D75D6460;
  aBlock[3] = &block_descriptor_28_0;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_1D7660950();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  id v13 = a1;
  sub_1D7660930();
  uint64_t v14 = sub_1D7660910();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = MEMORY[0x1E4FBC860];
  sub_1D75AEEF0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
  sub_1D75ABCA4();
  sub_1D7661090();
  MEMORY[0x1D9473560](0, v12, v17, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

void RPPairableHostBrowser.registerHostDiscoveredHandler(on:handler:)(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v7 = a1;
  }
  else
  {
    if (qword_1EA82AAC0 != -1) {
      swift_once();
    }
    id v7 = (id)qword_1EA82CAA0;
  }
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a2;
  v8[4] = a3;
  uint64_t v9 = *(void **)(v3 + OBJC_IVAR___RPPairableHostBrowser__stateStorage);
  swift_retain();
  id v10 = a1;
  id v11 = v7;
  swift_retain();
  sub_1D75DDF04(v9, (uint64_t)sub_1D76217F0, (uint64_t)v8);
  swift_release();
}

uint64_t sub_1D762047C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = a1;
  aBlock[4] = sub_1D75EE2AC;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D75D6460;
  aBlock[3] = &block_descriptor_10;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_1D7660950();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  id v13 = a1;
  sub_1D7660930();
  uint64_t v14 = sub_1D7660910();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = MEMORY[0x1E4FBC860];
  sub_1D75AEEF0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
  sub_1D75ABCA4();
  sub_1D7661090();
  MEMORY[0x1D9473560](0, v12, v17, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_1D7620728(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(void *, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(a3, a6, v12);

  return swift_release();
}

Swift::Void __swiftcall RPPairableHostBrowser.startBrowsing()()
{
  swift_getObjectType();
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___RPPairableHostBrowser__stateStorage];
  uint64_t v2 = v0;
  sub_1D75DE058(v1, v2);
  *(void *)(swift_allocObject() + 16) = v2;
  uint64_t v3 = v2;
  sub_1D75A4B7C();
  swift_release();
}

void sub_1D7620890(id *a1)
{
  if (*a1 == (id)1)
  {
    swift_allocObject();
    swift_unknownObjectWeakInit();
    type metadata accessor for DeviceServiceEvent(0);
    sub_1D75EDE1C(&qword_1EA82BF38);
    sub_1D75EDE1C(&qword_1EA82BF40);
    sub_1D76601C0();
    swift_release();
    sub_1D76600D0();
    sub_1D75DE7A0(*a1);
    *a1 = (id)2;
  }
  else
  {
    sub_1D7661100();
    sub_1D7660BC0();
    sub_1D76617F0();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7660BC0();
    sub_1D7660BC0();
    sub_1D7660BC0();
    sub_1D7661260();
    __break(1u);
  }
}

void sub_1D7620AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PairableHostInfo(0);
  MEMORY[0x1F4188790](v4 - 8);
  objc_super v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DeviceServiceEvent(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v35 - v10;
  MEMORY[0x1F4188790](v9);
  id v13 = (char *)&v35 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BF48);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (void **)((char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v17 = MEMORY[0x1D9474D50](a2 + 16);
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    sub_1D7621974(a1, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = *v16;
      os_log_type_t v20 = sub_1D7660DD0();
      if (qword_1EA82AA60 != -1) {
        swift_once();
      }
      long long v21 = qword_1EA82C548;
      if (os_log_type_enabled((os_log_t)qword_1EA82C548, v20))
      {
        id v22 = v19;
        id v23 = v19;
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        uint64_t v36 = (uint64_t)v19;
        uint64_t v37 = v25;
        *(_DWORD *)uint64_t v24 = 136446210;
        id v26 = v19;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
        uint64_t v27 = sub_1D7660B60();
        uint64_t v36 = sub_1D758DBE8(v27, v28, &v37);
        sub_1D7661020();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1D757C000, v21, v20, "Receieved XPC error from service: %{public}s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v25, -1, -1);
        MEMORY[0x1D9474C60](v24, -1, -1);
      }
      id v29 = v19;
      sub_1D7620FB4(v19);
    }
    else
    {
      sub_1D76219DC();
      sub_1D7621A88();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_1D7660DB0();
        if (qword_1EA82AA60 != -1) {
          swift_once();
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBD0);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_1D7664B10;
        sub_1D7621A88();
        uint64_t v31 = sub_1D7660B60();
        uint64_t v33 = v32;
        *(void *)(v30 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v30 + 64) = sub_1D75D4054();
        *(void *)(v30 + 32) = v31;
        *(void *)(v30 + 40) = v33;
        sub_1D7660010();
        swift_bridgeObjectRelease();

        sub_1D7621A30((uint64_t)v13, (void (*)(void))type metadata accessor for DeviceServiceEvent);
        uint64_t v34 = (uint64_t)v11;
      }
      else
      {
        sub_1D76219DC();
        sub_1D762100C();

        sub_1D7621A30((uint64_t)v6, (void (*)(void))type metadata accessor for PairableHostInfo);
        uint64_t v34 = (uint64_t)v13;
      }
      sub_1D7621A30(v34, (void (*)(void))type metadata accessor for DeviceServiceEvent);
    }
  }
}

void sub_1D7620FB4(void *a1)
{
  uint64_t v3 = *(void **)&v1[OBJC_IVAR___RPPairableHostBrowser__stateStorage];
  id v4 = a1;
  sub_1D75DE158(v3, a1, v1);
}

void sub_1D762100C()
{
  uint64_t v1 = type metadata accessor for PairableHostInfo(0);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 24;
  sub_1D7621A88();
  id v4 = objc_allocWithZone((Class)RPPairableHost);
  id v5 = sub_1D75EAB40((uint64_t)v3);
  objc_super v6 = *(void **)(v0 + OBJC_IVAR___RPPairableHostBrowser__stateStorage);
  uint64_t v7 = (os_unfair_lock_s *)v6[2];
  id v8 = v5;
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  uint64_t v10 = (void *)v6[3];
  uint64_t v9 = v6[4];
  uint64_t v11 = v6[5];
  v14[0] = v10;
  v14[1] = v9;
  v14[2] = v11;
  sub_1D75B440C(v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1D7621418((uint64_t)v14, (uint64_t)v8);
  uint64_t v12 = (void *)v6[3];
  v6[3] = v10;
  v6[4] = v9;
  v6[5] = v11;
  sub_1D75DE7A0(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v7);
}

void sub_1D7621194(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    id v1 = *(id *)a1;
    id v2 = *(id *)a1;
    sub_1D7660DB0();
    if (qword_1EA82AA60 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBD0);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1D7664B10;
    id v4 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
    uint64_t v5 = sub_1D7660B60();
    uint64_t v7 = v6;
    *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v3 + 64) = sub_1D75D4054();
    *(void *)(v3 + 32) = v5;
    *(void *)(v3 + 40) = v7;
    sub_1D7660010();
    swift_bridgeObjectRelease();
    id v8 = v1;
    sub_1D7620FB4(v1);
    sub_1D75ABBB4(v1, 1);
    sub_1D75ABBB4(v1, 1);
  }
}

Swift::Void __swiftcall RPPairableHostBrowser.cancel()()
{
  sub_1D7660DD0();
  if (qword_1EA82AA60 != -1) {
    swift_once();
  }
  sub_1D7660010();
  sub_1D7620FB4(0);
}

uint64_t sub_1D7621418(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = v2 + 40;
    do
    {
      uint64_t v6 = *(void (**)(uint64_t *))(v5 - 8);
      uint64_t v7 = a2;
      swift_retain();
      v6(&v7);
      swift_release();
      v5 += 16;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1D76214A8(uint64_t a1, id a2)
{
  id v4 = *(void **)a1;
  id v5 = a2;
  sub_1D75DE7A0(v4);
  *(void *)a1 = a2;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = v6 + 40;
    do
    {
      uint64_t v9 = *(void (**)(id *))(v8 - 8);
      id v12 = a2;
      swift_retain();
      v9(&v12);
      swift_release();
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = MEMORY[0x1E4FBC860];
  *(void *)(a1 + 16) = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v10;
  return sub_1D76600C0();
}

uint64_t sub_1D76215DC()
{
  return sub_1D762163C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75CFDA0);
}

uint64_t sub_1D76215F4()
{
  return sub_1D762163C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D00F0);
}

uint64_t sub_1D762160C()
{
  return sub_1D762163C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D027C);
}

uint64_t sub_1D7621624()
{
  return sub_1D762163C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D02B0);
}

uint64_t sub_1D762163C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *id v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *id v1 = result;
  }
  return result;
}

uint64_t sub_1D7621698(uint64_t a1)
{
  return sub_1D762176C(a1, (uint64_t (*)(BOOL))sub_1D75CFDA0);
}

uint64_t sub_1D76216B4(void *a1)
{
  return sub_1D76200BC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1D76216C0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D76216F8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1D7621724(uint64_t a1)
{
  return sub_1D762176C(a1, (uint64_t (*)(BOOL))sub_1D75D00F0);
}

uint64_t sub_1D762173C(uint64_t a1)
{
  return sub_1D762176C(a1, (uint64_t (*)(BOOL))sub_1D75D027C);
}

uint64_t sub_1D7621754(uint64_t a1)
{
  return sub_1D762176C(a1, (uint64_t (*)(BOOL))sub_1D75D02B0);
}

uint64_t sub_1D762176C(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  uint64_t v1 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1D76217F0(void *a1)
{
  return sub_1D762047C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1D76217FC()
{
  uint64_t v1 = OUTLINED_FUNCTION_5_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

void sub_1D762182C(uint64_t a1)
{
}

uint64_t _s5StateOwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) < 2) {
    LODWORD(v3) = 0;
  }
  if (v3 >= 3) {
    return (v3 - 2);
  }
  else {
    return 0;
  }
}

uint64_t _s5StateOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RPPairableHostBrowser.State()
{
  return &type metadata for RPPairableHostBrowser.State;
}

uint64_t type metadata accessor for RPPairableHostBrowser(uint64_t a1)
{
  return sub_1D75AEF50(a1, &qword_1EA82C560);
}

uint64_t sub_1D762190C()
{
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = OUTLINED_FUNCTION_5_1();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1D762193C()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_5_1();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

void sub_1D762196C(uint64_t a1)
{
  sub_1D7620AD4(a1, v1);
}

uint64_t sub_1D7621974(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BF48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D76219DC()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_17();
  v3(v2);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_1D7621A30(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1D7621A88()
{
  uint64_t v2 = OUTLINED_FUNCTION_3_17();
  v3(v2);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_1D7621ADC()
{
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_1D7621B2C()
{
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t _s19MutableStateStorageVwxx(void **a1)
{
  uint64_t v1 = (char *)*a1;
  if ((unint64_t)(v1 - 1) >= 2) {

  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s19MutableStateStorageVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  if ((unint64_t)(*(void *)a2 - 1) >= 2) {
    id v5 = v4;
  }
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  *a1 = v4;
  a1[1] = v6;
  a1[2] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void **_s19MutableStateStorageVwca(void **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  id v5 = *(void **)a2;
  unint64_t v6 = *(void *)a2 - 1;
  if ((char *)*a1 - 1 >= (char *)2)
  {
    if (v6 >= 2)
    {
      id v8 = v5;
      *a1 = v5;
    }
    else
    {
      sub_1D7621CD8((uint64_t)a1);
      *a1 = *(void **)a2;
    }
  }
  else
  {
    if (v6 >= 2) {
      id v7 = v5;
    }
    *a1 = v5;
  }
  a1[1] = *(void **)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = *(void **)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1D7621CD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char **_s19MutableStateStorageVwta(char **a1, char **a2)
{
  uint64_t v4 = *a1;
  id v5 = *a2;
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if ((unint64_t)(*a2 - 1) >= 2)
    {
      *a1 = v5;

      goto LABEL_6;
    }
    sub_1D7621CD8((uint64_t)a1);
  }
  *a1 = v5;
LABEL_6:
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s19MutableStateStorageVMa()
{
  return &_s19MutableStateStorageVN;
}

BOOL NWInterface.isValidForNetworkControlChannel.getter()
{
  if (qword_1EA82A938 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_1EA82B178;
  uint64_t v1 = unk_1EA82B180;
  if (byte_1EA82B189) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  __int16 v3 = v2 | byte_1EA82B188;
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_1D758C360(v0, v1, v3);
  swift_bridgeObjectRelease();
  if (v3) {
    return 1;
  }
  uint64_t v5 = sub_1D7660490();
  return !InterfaceIndexCorrespondsToAppleNCMInterface(v5);
}

uint64_t TunnelPacket.init(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1D75934F4(a1, a2);
  if (sub_1D765FF00() < 40)
  {
    sub_1D75AF4C0();
    sub_1D7661640();
    unint64_t v24 = v26;
    unint64_t v25 = v27;
    sub_1D75B0D60();
    OUTLINED_FUNCTION_3_7();
    OUTLINED_FUNCTION_0();
    sub_1D76616A0();
    swift_willThrow();
LABEL_4:
    OUTLINED_FUNCTION_49_1();
    return OUTLINED_FUNCTION_49_1();
  }
  sub_1D75934F4(a1, a2);
  IPv6Header.init(_:)(a1, a2, (uint64_t)&v26);
  if (v3) {
    goto LABEL_4;
  }
  unint64_t v8 = v26;
  unint64_t v23 = v27;
  char v22 = v28;
  uint64_t v9 = v29;
  unint64_t v10 = v30;
  uint64_t v12 = v31;
  unint64_t v11 = v32;
  sub_1D75934F4(v29, v30);
  sub_1D75934F4(v12, v11);
  if (qword_1EA82AA68 != -1) {
    swift_once();
  }
  unint64_t v21 = v8;
  if (byte_1EA83A380 == 1)
  {
    unint64_t v26 = v8;
    unint64_t v27 = v23;
    char v28 = v22;
    uint64_t v29 = v9;
    unint64_t v30 = v10;
    uint64_t v31 = v12;
    unint64_t v32 = v11;
    sub_1D75934F4(a1, a2);
    sub_1D75934F4(v9, v10);
    sub_1D75934F4(v12, v11);
    sub_1D762461C((uint64_t)&v26, a1, a2, &v24);
    uint64_t v14 = v24;
    unint64_t v13 = v25;
    uint64_t v15 = v9;
    unint64_t v16 = v10;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = v9;
    unint64_t v16 = v10;
    unint64_t v13 = 0xF000000000000000;
  }
  unint64_t v33 = v13;
  uint64_t v17 = v15;
  sub_1D75934F4(v15, v16);
  sub_1D75934F4(v12, v11);
  uint64_t v20 = v14;
  sub_1D75DD424(v14, v33);
  sub_1D75934F4(a1, a2);
  OUTLINED_FUNCTION_49_1();
  sub_1D75933F0(v17, v16);
  sub_1D75933F0(v12, v11);
  sub_1D75933F0(v17, v16);
  sub_1D75933F0(v12, v11);
  uint64_t v18 = v14;
  unint64_t v19 = v33;
  sub_1D75DD450(v18, v33);
  uint64_t result = OUTLINED_FUNCTION_49_1();
  *(_DWORD *)a3 = 30;
  *(void *)(a3 + 8) = v21;
  *(void *)(a3 + 16) = v23;
  *(unsigned char *)(a3 + 24) = v22;
  *(void *)(a3 + 32) = v17;
  *(void *)(a3 + 40) = v16;
  *(void *)(a3 + 48) = v12;
  *(void *)(a3 + 56) = v11;
  *(void *)(a3 + 64) = v20;
  *(void *)(a3 + 72) = v19;
  *(void *)(a3 + 80) = a1;
  *(void *)(a3 + 88) = a2;
  return result;
}

void sub_1D7622158(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1D75B5350(a1, (uint64_t)v30);
  if (v31)
  {
    OUTLINED_FUNCTION_2_18();
    OUTLINED_FUNCTION_29_6();
    uint64_t v28 = v4;
    char v6 = v5 ^ 1;
  }
  else
  {
    sub_1D758C5F8((uint64_t)v30, &qword_1EBDEC4D0);
    uint64_t v28 = 0;
    char v6 = 1;
  }
  char v27 = v6;
  sub_1D75B5350(a1, (uint64_t)v30);
  if (v31)
  {
    OUTLINED_FUNCTION_2_18();
    OUTLINED_FUNCTION_29_6();
    uint64_t v26 = v7;
    char v9 = v8 ^ 1;
  }
  else
  {
    sub_1D758C5F8((uint64_t)v30, &qword_1EBDEC4D0);
    uint64_t v26 = 0;
    char v9 = 1;
  }
  OUTLINED_FUNCTION_52_2();
  sub_1D75B5350(a1, v10);
  if (v31)
  {
    int v11 = OUTLINED_FUNCTION_2_18();
    if (v11) {
      uint64_t v12 = v29;
    }
    else {
      uint64_t v12 = 0;
    }
    char v13 = v11 ^ 1;
  }
  else
  {
    sub_1D758C5F8((uint64_t)v30, &qword_1EBDEC4D0);
    uint64_t v12 = 0;
    char v13 = 1;
  }
  OUTLINED_FUNCTION_52_2();
  sub_1D75B5350(a1, v14);
  if (v31)
  {
    int v15 = OUTLINED_FUNCTION_2_18();
    if (v15) {
      uint64_t v16 = v29;
    }
    else {
      uint64_t v16 = 0;
    }
    char v17 = v15 ^ 1;
  }
  else
  {
    sub_1D758C5F8((uint64_t)v30, &qword_1EBDEC4D0);
    uint64_t v16 = 0;
    char v17 = 1;
  }
  OUTLINED_FUNCTION_51_2();
  sub_1D75B5350(a1, v18);
  if (v31)
  {
    int v19 = OUTLINED_FUNCTION_2_18();
    if (v19) {
      uint64_t v20 = v29;
    }
    else {
      uint64_t v20 = 0;
    }
    char v21 = v19 ^ 1;
  }
  else
  {
    sub_1D758C5F8((uint64_t)v30, &qword_1EBDEC4D0);
    uint64_t v20 = 0;
    char v21 = 1;
  }
  OUTLINED_FUNCTION_51_2();
  sub_1D75B5350(a1, v22);
  swift_bridgeObjectRelease();
  if (v31)
  {
    OUTLINED_FUNCTION_2_18();
    OUTLINED_FUNCTION_29_6();
    char v25 = v24 ^ 1;
  }
  else
  {
    sub_1D758C5F8((uint64_t)v30, &qword_1EBDEC4D0);
    uint64_t v23 = 0;
    char v25 = 1;
  }
  *(void *)a2 = v28;
  *(unsigned char *)(a2 + 8) = v27;
  *(void *)(a2 + 16) = v26;
  *(unsigned char *)(a2 + 24) = v9;
  *(void *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 56) = v17;
  *(void *)(a2 + 64) = v20;
  *(unsigned char *)(a2 + 72) = v21;
  *(void *)(a2 + 80) = v23;
  *(unsigned char *)(a2 + 88) = v25;
}

void sub_1D7622404(void *a1@<X8>)
{
}

uint64_t sub_1D762240C(unsigned int a1, int a2)
{
  return a2 | a1;
}

void sub_1D7622414(void *a1@<X8>)
{
}

uint64_t sub_1D762241C(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

BOOL sub_1D7622424(unsigned __int8 *a1, unsigned __int8 a2)
{
  int v3 = (*v2 & a2);
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

BOOL sub_1D7622454(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

void sub_1D7622480(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  if ((*v2 & a2) != 0) {
    *v2 &= ~a2;
  }
  OUTLINED_FUNCTION_39_4(a1);
}

uint64_t sub_1D76224A0(unsigned __int8 a1)
{
  char v2 = *v1;
  if ((*v1 & a1) != 0) {
    *uint64_t v1 = v2 & ~a1;
  }
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

void sub_1D76224D0(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  *v2 |= a2;
  OUTLINED_FUNCTION_39_4(a1);
}

uint64_t sub_1D76224E8(char a1)
{
  char v2 = *v1;
  *v1 |= a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_1D7622510(uint64_t result)
{
  *v1 |= result;
  return result;
}

void sub_1D7622520(uint64_t a1)
{
  OUTLINED_FUNCTION_53_2(*v1 | a1);
}

uint64_t sub_1D762252C(uint64_t result)
{
  *v1 ^= result;
  return result;
}

void sub_1D762253C(uint64_t a1)
{
  OUTLINED_FUNCTION_53_2(*v1 ^ a1);
}

void sub_1D7622548(void *a1@<X8>)
{
}

uint64_t sub_1D7622550(int a1, int a2)
{
  return a2 & ~a1;
}

BOOL sub_1D7622558(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1D7622564(unsigned __int8 a1, unsigned __int8 a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1D7622574(char a1)
{
  return a1 == 0;
}

BOOL sub_1D7622580(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1D762258C(uint64_t result)
{
  *v1 &= ~(_BYTE)result;
  return result;
}

void sub_1D762259C(uint64_t a1)
{
  OUTLINED_FUNCTION_53_2(*v1 & ~a1);
}

uint64_t sub_1D76225A8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    char v5 = (uint64_t *)(a1 + 32);
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

uint64_t sub_1D7622600(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    LODWORD(v2) = 0;
    uint64_t v3 = (unsigned __int8 *)(a1 + 32);
    do
    {
      int v5 = *v3++;
      int v4 = v5;
      if ((v5 & ~v2) == 0) {
        int v4 = 0;
      }
      uint64_t v2 = v4 | v2;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t TunnelInterfaceParameters.init(address:netmask:mtu:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1D7660430();
  OUTLINED_FUNCTION_16();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  v10(a4, a1, v8);
  uint64_t v11 = type metadata accessor for TunnelInterfaceParameters();
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v10)(a4 + *(int *)(v11 + 20), a2, v8);
  *(_WORD *)(a4 + *(int *)(v11 + 24)) = a3;
  return result;
}

uint64_t sub_1D7622704(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = sub_1D7660430();
  uint64_t v11 = MEMORY[0x1E4F38990];
  _OWORD v23[3] = v10;
  v23[4] = MEMORY[0x1E4F38990];
  __swift_allocate_boxed_opaque_existential_0(v23);
  OUTLINED_FUNCTION_16();
  char v13 = *(void (**)(void))(v12 + 16);
  v13();
  uint64_t v14 = type metadata accessor for TunnelInterfaceParameters();
  uint64_t v15 = a2 + *(int *)(v14 + 20);
  v22[3] = v10;
  v22[4] = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
  ((void (*)(uint64_t *, uint64_t, uint64_t))v13)(boxed_opaque_existential_0, v15, v10);
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, void, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 56))(a1, v23, v22, *(unsigned __int16 *)(a2 + *(int *)(v14 + 24)), a3 | ((HIDWORD(a3) & 1) << 32), a4, a5, a6, a7);
  return sub_1D7625930(a2);
}

uint64_t sub_1D7622838@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for TunnelInterfaceParameters();
  uint64_t v2 = sub_1D7660410();
  unint64_t v4 = v3;
  uint64_t v5 = sub_1D7660410();
  unint64_t v7 = v6;
  unint64_t v27 = v6;
  sub_1D75934F4(v5, v6);
  uint64_t v8 = sub_1D765FF00();
  if (v8 != sub_1D765FF00())
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v9 = sub_1D765FF00();
  sub_1D75933F0(v5, v7);
  if (v9 < 0)
  {
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
LABEL_61:
    __break(1u);
  }
  uint64_t v26 = a1;
  if (!v9) {
    goto LABEL_39;
  }
  uint64_t v10 = 0;
  while (2)
  {
    if (v9 == v10)
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    uint64_t v11 = v10++;
    switch(v27 >> 62)
    {
      case 1uLL:
        if (v11 >= v5 >> 32 || v11 < (int)v5) {
          goto LABEL_44;
        }
        if (!sub_1D765FCE0()) {
          goto LABEL_58;
        }
        if (!__OFSUB__(v11, sub_1D765FD10())) {
          goto LABEL_21;
        }
        goto LABEL_46;
      case 2uLL:
        if (v11 < *(void *)(v5 + 16)) {
          goto LABEL_43;
        }
        if (v11 >= *(void *)(v5 + 24)) {
          goto LABEL_45;
        }
        if (!sub_1D765FCE0()) {
          goto LABEL_59;
        }
        if (__OFSUB__(v11, sub_1D765FD10())) {
          goto LABEL_47;
        }
LABEL_21:
        switch(v4 >> 62)
        {
          case 1uLL:
            if (v11 < (int)v2 || v11 >= v2 >> 32) {
              goto LABEL_50;
            }
            if (!sub_1D765FCE0()) {
              goto LABEL_60;
            }
            if (!__OFSUB__(v11, sub_1D765FD10())) {
              goto LABEL_37;
            }
            goto LABEL_52;
          case 2uLL:
            if (v11 < *(void *)(v2 + 16)) {
              goto LABEL_49;
            }
            if (v11 >= *(void *)(v2 + 24)) {
              goto LABEL_51;
            }
            if (!sub_1D765FCE0()) {
              goto LABEL_61;
            }
            if (__OFSUB__(v11, sub_1D765FD10())) {
              goto LABEL_53;
            }
LABEL_37:
            sub_1D765FE90();
            if (v9 != v10) {
              continue;
            }
            unint64_t v7 = v27;
            break;
          case 3uLL:
            goto LABEL_57;
          default:
            if (v11 < (unint64_t)BYTE6(v4)) {
              goto LABEL_37;
            }
            goto LABEL_48;
        }
        break;
      case 3uLL:
        goto LABEL_56;
      default:
        if (v11 < (unint64_t)BYTE6(v27)) {
          goto LABEL_21;
        }
        goto LABEL_42;
    }
    break;
  }
LABEL_39:
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C2A0);
  MEMORY[0x1F4188790](v14 - 8);
  OUTLINED_FUNCTION_1_7();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
  MEMORY[0x1F4188790](v18 - 8);
  OUTLINED_FUNCTION_1_7();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_1D76604A0();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  sub_1D75934F4(v5, v7);
  sub_1D7660440();
  uint64_t v23 = sub_1D7660430();
  if (__swift_getEnumTagSinglePayload(v17, 1, v23) == 1)
  {
    sub_1D758C5F8(v17, (uint64_t *)&unk_1EA82C2A0);
    sub_1D7661260();
    __break(1u);
    JUMPOUT(0x1D7622DE4);
  }
  sub_1D75933F0(v2, v4);
  OUTLINED_FUNCTION_16();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v26, v17, v23);
  return sub_1D75933F0(v5, v7);
}

uint64_t sub_1D7622E04()
{
  if (qword_1EA82A8F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_1EA82B0A8;
  uint64_t v1 = unk_1EA82B0B0;
  if (byte_1EA82B0B9) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  __int16 v3 = v2 | byte_1EA82B0B8;
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_1D758C360(v0, v1, v3);
  uint64_t result = swift_bridgeObjectRelease();
  byte_1EA83A380 = v3 & 1;
  return result;
}

uint64_t sub_1D7622EC8()
{
  return 91;
}

unsigned char *sub_1D76230AC@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1D76230B8()
{
  return sub_1D7622EC8();
}

uint64_t sub_1D76230C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_33_2();
  *a1 = result;
  return result;
}

uint64_t sub_1D76230E8(unsigned __int8 *a1)
{
  return sub_1D765ACE4(*a1, *v1);
}

uint64_t sub_1D76230F4@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D762240C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1D7623124@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D7657EE4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1D7623154@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D762241C(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1D7623184(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1D7622424(a1, *a2);
}

uint64_t sub_1D762318C@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D76224A0(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_1D76231C0@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D76224E8(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_1D76231F4(unsigned __int8 *a1)
{
  return sub_1D7622510(*a1);
}

uint64_t sub_1D76231FC(unsigned __int8 *a1)
{
  return sub_1D7657EF8(*a1);
}

uint64_t sub_1D7623204(unsigned __int8 *a1)
{
  return sub_1D762252C(*a1);
}

uint64_t sub_1D762320C@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D7622550(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1D762323C(char *a1)
{
  return sub_1D7657F18(*a1, *v1);
}

BOOL sub_1D7623248(unsigned __int8 *a1)
{
  return sub_1D7622564(*a1, *v1);
}

BOOL sub_1D7623254(unsigned __int8 *a1)
{
  return sub_1D7657F34(*a1, *v1);
}

BOOL sub_1D7623260()
{
  return sub_1D7622574(*v0);
}

uint64_t sub_1D7623268(unsigned __int8 *a1)
{
  return sub_1D762258C(*a1);
}

unsigned __int8 *sub_1D7623270@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1D7623280(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1D762328C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1D7622600(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1D76232B4()
{
  if (OUTLINED_FUNCTION_50_2() < 20)
  {
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_33_6();
    sub_1D7661100();
    swift_bridgeObjectRelease();
    sub_1D765FF00();
    OUTLINED_FUNCTION_17_10();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_17_10();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_2();
    sub_1D75B0D60();
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_10_8();
LABEL_13:
    sub_1D76616A0();
    swift_willThrow();
    return OUTLINED_FUNCTION_3_12();
  }
  OUTLINED_FUNCTION_26_4();
  switch(v9)
  {
    case 1:
      uint64_t v11 = v5 + 2;
      uint64_t v12 = v6;
      uint64_t v10 = v5;
      goto LABEL_8;
    case 2:
      uint64_t v10 = *(void *)(v0 + 16);
      uint64_t v11 = v10 + 2;
      if (__OFADD__(v10, 2)) {
        goto LABEL_176;
      }
      uint64_t v12 = *(void *)(v0 + 24);
LABEL_8:
      if (v12 < v11 || v10 >= v11)
      {
LABEL_12:
        sub_1D75AF4C0();
        sub_1D7661640();
        sub_1D75B0D60();
        OUTLINED_FUNCTION_3_7();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_27_6();
        goto LABEL_13;
      }
      uint64_t v108 = v8;
      if (v7)
      {
        if (v7 == 1)
        {
          if (v6 < (int)v0) {
            goto LABEL_177;
          }
          OUTLINED_FUNCTION_8_13();
          __int16 v15 = OUTLINED_FUNCTION_32_4();
          if (v2) {
            goto LABEL_191;
          }
          __int16 v16 = v15;
          uint64_t v4 = 0;
          OUTLINED_FUNCTION_3_12();
          uint64_t v17 = v5;
        }
        else
        {
          OUTLINED_FUNCTION_7_11();
          swift_retain();
          __int16 v21 = OUTLINED_FUNCTION_36_5();
          if (v2) {
            goto LABEL_192;
          }
          __int16 v22 = v21;
          OUTLINED_FUNCTION_22_5();
          swift_release();
          uint64_t v17 = *(void *)(v0 + 16);
          __int16 v16 = v22;
        }
      }
      else
      {
        uint64_t v18 = OUTLINED_FUNCTION_5_13();
        uint64_t v2 = v4;
        __int16 v16 = sub_1D75F04E4(v18, v19, v20, 0);
        OUTLINED_FUNCTION_6_11();
      }
      BOOL v23 = __OFADD__(v17, 2);
      uint64_t v24 = v17 + 2;
      if (v23)
      {
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
        goto LABEL_186;
      }
      uint64_t v25 = v24 + 2;
      if (__OFADD__(v24, 2)) {
        goto LABEL_175;
      }
      uint64_t v26 = v7;
      switch(v7)
      {
        case 1u:
          if (v24 >= (int)v0) {
            goto LABEL_38;
          }
          goto LABEL_12;
        case 2u:
          OUTLINED_FUNCTION_14_7();
          if (v28 != v23) {
            goto LABEL_12;
          }
          if (v7 == 2) {
            uint64_t v27 = *(void *)(v0 + 24);
          }
          else {
LABEL_38:
          }
            uint64_t v27 = v6;
          goto LABEL_39;
        case 3u:
          if (v24 < 0) {
            goto LABEL_12;
          }
          if (v25 > 0 || __OFSUB__(v24, v25)) {
            goto LABEL_12;
          }
          uint64_t v107 = v7;
          uint64_t v30 = OUTLINED_FUNCTION_3_18();
          goto LABEL_49;
        default:
          if (v24 < 0) {
            goto LABEL_12;
          }
          uint64_t v27 = v108;
LABEL_39:
          if (v24 >= v25 || v27 < v25) {
            goto LABEL_12;
          }
          uint64_t v107 = v26;
          if (v7)
          {
            if (v7 == 1)
            {
              if (v6 < (int)v0) {
                goto LABEL_182;
              }
              OUTLINED_FUNCTION_8_13();
              __int16 v106 = OUTLINED_FUNCTION_30_7();
              if (v2) {
                goto LABEL_191;
              }
              uint64_t v4 = 0;
              OUTLINED_FUNCTION_3_12();
              uint64_t v34 = v5;
            }
            else
            {
              OUTLINED_FUNCTION_7_11();
              swift_retain();
              uint64_t v35 = OUTLINED_FUNCTION_23_3();
              uint64_t v2 = v4;
              __int16 v106 = sub_1D75F05BC(v35, v36, v37, 2);
              if (v4) {
                goto LABEL_192;
              }
              OUTLINED_FUNCTION_22_5();
              swift_release();
              OUTLINED_FUNCTION_37_2();
            }
          }
          else
          {
            uint64_t v30 = OUTLINED_FUNCTION_5_13();
LABEL_49:
            uint64_t v2 = v4;
            __int16 v106 = sub_1D75F04E4(v30, v31, v32, 2);
            OUTLINED_FUNCTION_6_11();
          }
          BOOL v23 = __OFADD__(v34, 4);
          uint64_t v38 = v34 + 4;
          if (v23) {
            goto LABEL_178;
          }
          uint64_t v39 = v38 + 4;
          uint64_t v40 = v107;
          if (__OFADD__(v38, 4)) {
            goto LABEL_179;
          }
          switch(v107)
          {
            case 1:
              if (v38 >= (int)v0) {
                goto LABEL_68;
              }
              goto LABEL_12;
            case 2:
              OUTLINED_FUNCTION_14_7();
              if (v28 != v23) {
                goto LABEL_12;
              }
              if (v7 == 2) {
                uint64_t v41 = *(void *)(v0 + 24);
              }
              else {
LABEL_68:
              }
                uint64_t v41 = v6;
              goto LABEL_69;
            case 3:
              if (v38 < 0) {
                goto LABEL_12;
              }
              if (v39 > 0 || __OFSUB__(v38, v39)) {
                goto LABEL_12;
              }
              uint64_t v43 = OUTLINED_FUNCTION_3_18();
              goto LABEL_79;
            default:
              if (v38 < 0) {
                goto LABEL_12;
              }
              uint64_t v41 = v108;
LABEL_69:
              if (v38 >= v39 || v41 < v39) {
                goto LABEL_12;
              }
              uint64_t v107 = v40;
              if (v7)
              {
                if (v7 == 1)
                {
                  if (v6 < (int)v0) {
                    goto LABEL_185;
                  }
                  OUTLINED_FUNCTION_8_13();
                  uint64_t v47 = OUTLINED_FUNCTION_31_4();
                  int v105 = sub_1D7626F2C(v47, v48, v49, v50);
                  if (v2) {
                    goto LABEL_191;
                  }
                  uint64_t v4 = 0;
                  OUTLINED_FUNCTION_3_12();
                  uint64_t v51 = v5;
                }
                else
                {
                  OUTLINED_FUNCTION_7_11();
                  swift_retain();
                  uint64_t v52 = OUTLINED_FUNCTION_23_3();
                  int v105 = sub_1D7626F2C(v52, v53, v54, 4);
                  if (v4) {
                    goto LABEL_192;
                  }
                  OUTLINED_FUNCTION_22_5();
                  swift_release();
                  OUTLINED_FUNCTION_37_2();
                }
              }
              else
              {
                uint64_t v43 = OUTLINED_FUNCTION_5_13();
LABEL_79:
                int v105 = sub_1D7626DF8(v43, v44, v45, 4);
                OUTLINED_FUNCTION_6_11();
              }
              BOOL v23 = __OFADD__(v51, 8);
              uint64_t v55 = v51 + 8;
              if (v23) {
                goto LABEL_180;
              }
              uint64_t v56 = v55 + 4;
              uint64_t v57 = v107;
              if (__OFADD__(v55, 4)) {
                goto LABEL_181;
              }
              switch(v107)
              {
                case 1:
                  if (v55 >= (int)v0) {
                    goto LABEL_98;
                  }
                  goto LABEL_12;
                case 2:
                  OUTLINED_FUNCTION_14_7();
                  if (v28 != v23) {
                    goto LABEL_12;
                  }
                  if (v7 == 2) {
                    uint64_t v58 = *(void *)(v0 + 24);
                  }
                  else {
LABEL_98:
                  }
                    uint64_t v58 = v6;
                  goto LABEL_99;
                case 3:
                  if (v55 < 0) {
                    goto LABEL_12;
                  }
                  if (v56 > 0 || __OFSUB__(v55, v56)) {
                    goto LABEL_12;
                  }
                  uint64_t v60 = OUTLINED_FUNCTION_3_18();
                  goto LABEL_109;
                default:
                  if (v55 < 0) {
                    goto LABEL_12;
                  }
                  uint64_t v58 = v108;
LABEL_99:
                  if (v55 >= v56 || v58 < v56) {
                    goto LABEL_12;
                  }
                  uint64_t v107 = v57;
                  if (v7)
                  {
                    if (v7 == 1)
                    {
                      if (v6 < (int)v0)
                      {
LABEL_188:
                        __break(1u);
                        goto LABEL_189;
                      }
                      OUTLINED_FUNCTION_8_13();
                      uint64_t v64 = OUTLINED_FUNCTION_20_6();
                      int v104 = sub_1D7626F2C(v64, v65, v66, 8);
                      if (v4) {
                        goto LABEL_191;
                      }
                      uint64_t v4 = 0;
                      OUTLINED_FUNCTION_3_12();
                      uint64_t v67 = v5;
                    }
                    else
                    {
                      OUTLINED_FUNCTION_7_11();
                      swift_retain();
                      uint64_t v68 = OUTLINED_FUNCTION_23_3();
                      int v104 = sub_1D7626F2C(v68, v69, v70, 8);
                      if (v4) {
                        goto LABEL_192;
                      }
                      OUTLINED_FUNCTION_22_5();
                      swift_release();
                      OUTLINED_FUNCTION_37_2();
                    }
                  }
                  else
                  {
                    uint64_t v60 = OUTLINED_FUNCTION_5_13();
LABEL_109:
                    int v104 = sub_1D7626DF8(v60, v61, v62, 8);
                    OUTLINED_FUNCTION_6_11();
                  }
                  BOOL v23 = __OFADD__(v67, 13);
                  uint64_t v71 = v67 + 13;
                  if (v23) {
                    goto LABEL_183;
                  }
                  uint64_t v72 = v71 + 1;
                  uint64_t v73 = v107;
                  if (__OFADD__(v71, 1)) {
                    goto LABEL_184;
                  }
                  switch(v107)
                  {
                    case 1:
                      if (v71 >= (int)v0) {
                        goto LABEL_128;
                      }
                      goto LABEL_12;
                    case 2:
                      OUTLINED_FUNCTION_14_7();
                      if (v28 != v23) {
                        goto LABEL_12;
                      }
                      if (v7 == 2) {
                        uint64_t v74 = *(void *)(v0 + 24);
                      }
                      else {
LABEL_128:
                      }
                        uint64_t v74 = v6;
                      goto LABEL_129;
                    case 3:
                      if (v71 < 0) {
                        goto LABEL_12;
                      }
                      if (v72 > 0 || __OFSUB__(v71, v72)) {
                        goto LABEL_12;
                      }
                      uint64_t v76 = OUTLINED_FUNCTION_3_18();
                      goto LABEL_139;
                    default:
                      if (v71 < 0) {
                        goto LABEL_12;
                      }
                      uint64_t v74 = v108;
LABEL_129:
                      if (v71 >= v72 || v74 < v72) {
                        goto LABEL_12;
                      }
                      uint64_t v107 = v73;
                      if (v7)
                      {
                        if (v7 == 1)
                        {
                          if (v6 < (int)v0)
                          {
LABEL_189:
                            __break(1u);
                            goto LABEL_190;
                          }
                          OUTLINED_FUNCTION_8_13();
                          uint64_t v80 = OUTLINED_FUNCTION_20_6();
                          char v103 = sub_1D7626EB4(v80, v81, v82, 13);
                          if (!v4)
                          {
                            uint64_t v4 = 0;
                            OUTLINED_FUNCTION_3_12();
                            uint64_t v83 = v5;
                            goto LABEL_142;
                          }
LABEL_191:
                          OUTLINED_FUNCTION_3_12();
                          __break(1u);
                          goto LABEL_192;
                        }
                        OUTLINED_FUNCTION_7_11();
                        swift_retain();
                        uint64_t v84 = OUTLINED_FUNCTION_23_3();
                        char v103 = sub_1D7626EB4(v84, v85, v86, 13);
                        if (v4) {
                          goto LABEL_192;
                        }
                        OUTLINED_FUNCTION_22_5();
                        swift_release();
                        OUTLINED_FUNCTION_37_2();
                      }
                      else
                      {
                        uint64_t v76 = OUTLINED_FUNCTION_5_13();
LABEL_139:
                        char v103 = sub_1D7626D40(v76, v77, v78, 13);
                        OUTLINED_FUNCTION_6_11();
                      }
LABEL_142:
                      BOOL v23 = __OFADD__(v83, 14);
                      uint64_t v87 = v83 + 14;
                      if (v23)
                      {
LABEL_186:
                        __break(1u);
                        goto LABEL_187;
                      }
                      uint64_t v88 = v87 + 2;
                      uint64_t v89 = v108;
                      if (__OFADD__(v87, 2))
                      {
LABEL_187:
                        __break(1u);
                        goto LABEL_188;
                      }
                      switch(v107)
                      {
                        case 1:
                          if (v87 >= (int)v0) {
                            goto LABEL_158;
                          }
                          goto LABEL_12;
                        case 2:
                          OUTLINED_FUNCTION_14_7();
                          if (v28 != v23) {
                            goto LABEL_12;
                          }
                          if (v7 == 2) {
                            uint64_t v90 = *(void *)(v0 + 24);
                          }
                          else {
LABEL_158:
                          }
                            uint64_t v90 = v6;
                          goto LABEL_159;
                        case 3:
                          if (v87 < 0) {
                            goto LABEL_12;
                          }
                          if (v88 > 0 || __OFSUB__(v87, v88)) {
                            goto LABEL_12;
                          }
                          uint64_t v92 = OUTLINED_FUNCTION_3_18();
                          goto LABEL_169;
                        default:
                          if (v87 < 0) {
                            goto LABEL_12;
                          }
                          uint64_t v90 = v108;
LABEL_159:
                          if (v87 >= v88 || v90 < v88) {
                            goto LABEL_12;
                          }
                          if (!v7)
                          {
                            uint64_t v93 = v3 & 0xFFFFFFFFFFFFLL;
                            uint64_t v92 = v0;
LABEL_169:
                            __int16 v99 = sub_1D75F04E4(v92, v93, v89, 14);
                            uint64_t result = OUTLINED_FUNCTION_3_12();
                            goto LABEL_173;
                          }
                          if (v7 != 1)
                          {
                            uint64_t v100 = *(void *)(v0 + 16);
                            uint64_t v101 = *(void *)(v0 + 24);
                            swift_retain();
                            swift_retain();
                            __int16 v102 = sub_1D75F05BC(v100, v101, v3 & 0x3FFFFFFFFFFFFFFFLL, 14);
                            if (!v4)
                            {
                              __int16 v99 = v102;
                              swift_release();
                              swift_release();
                              goto LABEL_172;
                            }
                            while (1)
                            {
LABEL_192:
                              swift_release();
                              swift_release();
                              __break(1u);
                            }
                          }
                          if (v6 < (int)v0)
                          {
LABEL_190:
                            __break(1u);
                            goto LABEL_191;
                          }
                          OUTLINED_FUNCTION_8_13();
                          uint64_t v95 = OUTLINED_FUNCTION_20_6();
                          __int16 v98 = sub_1D75F05BC(v95, v96, v97, 14);
                          if (v4) {
                            goto LABEL_191;
                          }
                          __int16 v99 = v98;
                          OUTLINED_FUNCTION_3_12();
LABEL_172:
                          uint64_t result = OUTLINED_FUNCTION_3_12();
LABEL_173:
                          *(_WORD *)uint64_t v1 = v16;
                          *(_WORD *)(v1 + 2) = v106;
                          *(_DWORD *)(v1 + 4) = v105;
                          *(_DWORD *)(v1 + 8) = v104;
                          *(_WORD *)(v1 + 12) = v99;
                          *(unsigned char *)(v1 + 14) = v103;
                          return result;
                      }
                  }
              }
          }
      }
    case 3:
      goto LABEL_12;
    default:
      uint64_t v10 = 0;
      uint64_t v11 = 2;
      uint64_t v12 = v8;
      goto LABEL_8;
  }
}

uint64_t sub_1D7623BF8()
{
  if (OUTLINED_FUNCTION_50_2() < 16)
  {
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_33_6();
    sub_1D7661100();
    swift_bridgeObjectRelease();
    sub_1D765FF00();
    OUTLINED_FUNCTION_17_10();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_17_10();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_2();
    sub_1D75B0D60();
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_10_8();
LABEL_13:
    sub_1D76616A0();
    swift_willThrow();
    return OUTLINED_FUNCTION_3_12();
  }
  OUTLINED_FUNCTION_26_4();
  switch(v9)
  {
    case 1:
      uint64_t v11 = v5 + 2;
      uint64_t v12 = v6;
      uint64_t v10 = v5;
      goto LABEL_8;
    case 2:
      uint64_t v10 = *(void *)(v0 + 16);
      uint64_t v11 = v10 + 2;
      if (__OFADD__(v10, 2)) {
        goto LABEL_86;
      }
      uint64_t v12 = *(void *)(v0 + 24);
LABEL_8:
      if (v12 < v11 || v10 >= v11)
      {
LABEL_12:
        sub_1D75AF4C0();
        sub_1D7661640();
        sub_1D75B0D60();
        OUTLINED_FUNCTION_3_7();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_27_6();
        goto LABEL_13;
      }
      uint64_t v56 = v1;
      if (v7)
      {
        if (v7 == 1)
        {
          if (v6 < (int)v0)
          {
LABEL_87:
            __break(1u);
            goto LABEL_88;
          }
          uint64_t v15 = v8;
          OUTLINED_FUNCTION_8_13();
          __int16 v55 = OUTLINED_FUNCTION_32_4();
          if (v2) {
            goto LABEL_92;
          }
          uint64_t v4 = 0;
          OUTLINED_FUNCTION_3_12();
          uint64_t v16 = v5;
        }
        else
        {
          uint64_t v15 = v8;
          OUTLINED_FUNCTION_7_11();
          swift_retain();
          __int16 v55 = OUTLINED_FUNCTION_36_5();
          if (v2) {
            goto LABEL_93;
          }
          OUTLINED_FUNCTION_22_5();
          swift_release();
          uint64_t v16 = *(void *)(v0 + 16);
        }
      }
      else
      {
        uint64_t v17 = OUTLINED_FUNCTION_5_13();
        uint64_t v15 = v18;
        uint64_t v2 = v4;
        __int16 v55 = sub_1D75F04E4(v17, v19, v18, 0);
        OUTLINED_FUNCTION_6_11();
      }
      BOOL v20 = __OFADD__(v16, 2);
      uint64_t v21 = v16 + 2;
      if (v20)
      {
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
        goto LABEL_87;
      }
      uint64_t v22 = v21 + 2;
      if (__OFADD__(v21, 2)) {
        goto LABEL_85;
      }
      switch(v7)
      {
        case 1:
          if (v21 >= (int)v0) {
            goto LABEL_38;
          }
          goto LABEL_12;
        case 2:
          OUTLINED_FUNCTION_14_7();
          if (v24 != v20) {
            goto LABEL_12;
          }
          if (v7 == 2) {
            uint64_t v23 = *(void *)(v0 + 24);
          }
          else {
LABEL_38:
          }
            uint64_t v23 = v6;
          goto LABEL_39;
        case 3:
          if (v21 < 0) {
            goto LABEL_12;
          }
          if (v22 > 0 || __OFSUB__(v21, v22)) {
            goto LABEL_12;
          }
          uint64_t v54 = v15;
          uint64_t v26 = OUTLINED_FUNCTION_3_18();
          goto LABEL_49;
        default:
          if (v21 < 0) {
            goto LABEL_12;
          }
          uint64_t v23 = v15;
LABEL_39:
          if (v21 >= v22 || v23 < v22) {
            goto LABEL_12;
          }
          uint64_t v54 = v15;
          if (v7)
          {
            if (v7 == 1)
            {
              if (v6 < (int)v0)
              {
LABEL_90:
                __break(1u);
                goto LABEL_91;
              }
              OUTLINED_FUNCTION_8_13();
              __int16 v30 = OUTLINED_FUNCTION_30_7();
              if (!v2)
              {
                __int16 v31 = v30;
                uint64_t v4 = 0;
                OUTLINED_FUNCTION_3_12();
                uint64_t v32 = v5;
                goto LABEL_52;
              }
LABEL_92:
              OUTLINED_FUNCTION_3_12();
              __break(1u);
              goto LABEL_93;
            }
            uint64_t v33 = *(void *)(v0 + 16);
            uint64_t v34 = *(void *)(v0 + 24);
            swift_retain();
            swift_retain();
            uint64_t v35 = v33;
            uint64_t v2 = v4;
            __int16 v36 = sub_1D75F05BC(v35, v34, v3 & 0x3FFFFFFFFFFFFFFFLL, 2);
            if (v4) {
              goto LABEL_93;
            }
            __int16 v31 = v36;
            uint64_t v4 = 0;
            swift_release();
            swift_release();
            uint64_t v32 = *(void *)(v0 + 16);
          }
          else
          {
            uint64_t v26 = OUTLINED_FUNCTION_5_13();
            uint64_t v28 = v15;
LABEL_49:
            uint64_t v2 = v4;
            __int16 v31 = sub_1D75F04E4(v26, v27, v28, 2);
            OUTLINED_FUNCTION_6_11();
          }
LABEL_52:
          BOOL v20 = __OFADD__(v32, 4);
          uint64_t v37 = v32 + 4;
          if (v20)
          {
LABEL_88:
            __break(1u);
            goto LABEL_89;
          }
          uint64_t v38 = v37 + 2;
          uint64_t v39 = v54;
          if (__OFADD__(v37, 2))
          {
LABEL_89:
            __break(1u);
            goto LABEL_90;
          }
          switch(v7)
          {
            case 1:
              if (v37 >= (int)v0) {
                goto LABEL_68;
              }
              goto LABEL_12;
            case 2:
              OUTLINED_FUNCTION_14_7();
              if (v24 != v20) {
                goto LABEL_12;
              }
              if (v7 == 2) {
                uint64_t v40 = *(void *)(v0 + 24);
              }
              else {
LABEL_68:
              }
                uint64_t v40 = v6;
              goto LABEL_69;
            case 3:
              if (v37 < 0) {
                goto LABEL_12;
              }
              if (v38 > 0 || __OFSUB__(v37, v38)) {
                goto LABEL_12;
              }
              uint64_t v42 = OUTLINED_FUNCTION_3_18();
              goto LABEL_79;
            default:
              if (v37 < 0) {
                goto LABEL_12;
              }
              uint64_t v40 = v54;
LABEL_69:
              if (v37 >= v38 || v40 < v38) {
                goto LABEL_12;
              }
              if (!v7)
              {
                uint64_t v43 = v3 & 0xFFFFFFFFFFFFLL;
                uint64_t v42 = v0;
LABEL_79:
                __int16 v50 = sub_1D75F04E4(v42, v43, v39, 4);
                uint64_t result = OUTLINED_FUNCTION_3_12();
                goto LABEL_83;
              }
              if (v7 != 1)
              {
                uint64_t v51 = *(void *)(v0 + 16);
                uint64_t v52 = *(void *)(v0 + 24);
                swift_retain();
                swift_retain();
                __int16 v53 = sub_1D75F05BC(v51, v52, v3 & 0x3FFFFFFFFFFFFFFFLL, 4);
                if (!v4)
                {
                  __int16 v50 = v53;
                  swift_release();
                  swift_release();
                  goto LABEL_82;
                }
                while (1)
                {
LABEL_93:
                  swift_release();
                  swift_release();
                  __break(1u);
                }
              }
              if (v6 < (int)v0)
              {
LABEL_91:
                __break(1u);
                goto LABEL_92;
              }
              OUTLINED_FUNCTION_8_13();
              uint64_t v45 = OUTLINED_FUNCTION_31_4();
              __int16 v49 = sub_1D75F05BC(v45, v46, v47, v48);
              if (v2) {
                goto LABEL_92;
              }
              __int16 v50 = v49;
              OUTLINED_FUNCTION_3_12();
LABEL_82:
              uint64_t result = OUTLINED_FUNCTION_3_12();
LABEL_83:
              *uint64_t v56 = v55;
              v56[1] = v31;
              v56[2] = v50;
              return result;
          }
      }
    case 3:
      goto LABEL_12;
    default:
      uint64_t v10 = 0;
      uint64_t v11 = 2;
      uint64_t v12 = v8;
      goto LABEL_8;
  }
}

uint64_t sub_1D762418C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v4 = v3;
  if (sub_1D765FF00() < 16)
  {
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_33_6();
    sub_1D7661100();
    sub_1D7660BC0();
    sub_1D765FF00();
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_0();
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_2();
    sub_1D75B0D60();
    OUTLINED_FUNCTION_18_9();
    OUTLINED_FUNCTION_10_8();
LABEL_13:
    sub_1D76616A0();
    swift_willThrow();
    return OUTLINED_FUNCTION_3_12();
  }
  unint64_t v8 = a2 >> 62;
  uint64_t v9 = a1 >> 32;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v11 = (int)a1 + 1;
      uint64_t v12 = a1 >> 32;
      uint64_t v10 = (int)a1;
      goto LABEL_8;
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v11 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_56;
      }
      uint64_t v12 = *(void *)(a1 + 24);
LABEL_8:
      if (v12 < v11 || v10 >= v11)
      {
LABEL_12:
        sub_1D75AF4C0();
        sub_1D7661640();
        sub_1D75B0D60();
        OUTLINED_FUNCTION_3_7();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_27_6();
        goto LABEL_13;
      }
      if (v8)
      {
        if (v8 == 1)
        {
          if (v9 < (int)a1)
          {
LABEL_57:
            __break(1u);
            goto LABEL_58;
          }
          OUTLINED_FUNCTION_8_13();
          char v39 = sub_1D7626EB4((int)a1, a1 >> 32, v3, 0);
          if (v3)
          {
LABEL_59:
            OUTLINED_FUNCTION_3_12();
            __break(1u);
            goto LABEL_60;
          }
          uint64_t v4 = 0;
          OUTLINED_FUNCTION_3_12();
          uint64_t v15 = (int)a1;
        }
        else
        {
          uint64_t v20 = *(void *)(a1 + 16);
          uint64_t v19 = *(void *)(a1 + 24);
          swift_retain();
          swift_retain();
          char v39 = sub_1D7626EB4(v20, v19, a2 & 0x3FFFFFFFFFFFFFFFLL, 0);
          if (v4) {
            goto LABEL_60;
          }
          OUTLINED_FUNCTION_22_5();
          swift_release();
          uint64_t v15 = *(void *)(a1 + 16);
        }
      }
      else
      {
        uint64_t v16 = OUTLINED_FUNCTION_41_3();
        char v39 = sub_1D7626D40(v16, v17, v18, 0);
        uint64_t v15 = 0;
      }
      BOOL v21 = __OFADD__(v15, 1);
      uint64_t v22 = v15 + 1;
      if (v21)
      {
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        goto LABEL_57;
      }
      uint64_t v23 = v22 + 1;
      if (__OFADD__(v22, 1)) {
        goto LABEL_55;
      }
      switch((int)v8)
      {
        case 1:
          if (v22 >= (int)a1) {
            goto LABEL_38;
          }
          goto LABEL_12;
        case 2:
          OUTLINED_FUNCTION_14_7();
          if (v25 != v21) {
            goto LABEL_12;
          }
          if (v8 == 2) {
            uint64_t v24 = *(void *)(a1 + 24);
          }
          else {
LABEL_38:
          }
            uint64_t v24 = a1 >> 32;
          goto LABEL_39;
        case 3:
          if (v22 < 0) {
            goto LABEL_12;
          }
          if (v23 > 0 || __OFSUB__(v22, v23)) {
            goto LABEL_12;
          }
          uint64_t v27 = OUTLINED_FUNCTION_3_18();
          goto LABEL_49;
        default:
          if (v22 < 0) {
            goto LABEL_12;
          }
          uint64_t v24 = BYTE6(a2);
LABEL_39:
          if (v22 >= v23 || v24 < v23) {
            goto LABEL_12;
          }
          if (!v8)
          {
            uint64_t v27 = OUTLINED_FUNCTION_41_3();
LABEL_49:
            char v35 = sub_1D7626D40(v27, v28, v29, 1);
            uint64_t result = OUTLINED_FUNCTION_3_12();
            goto LABEL_53;
          }
          if (v8 != 1)
          {
            uint64_t v37 = *(void *)(a1 + 16);
            uint64_t v36 = *(void *)(a1 + 24);
            swift_retain();
            swift_retain();
            char v38 = sub_1D7626EB4(v37, v36, a2 & 0x3FFFFFFFFFFFFFFFLL, 1);
            if (!v4)
            {
              char v35 = v38;
              swift_release();
              swift_release();
              goto LABEL_52;
            }
            while (1)
            {
LABEL_60:
              swift_release();
              swift_release();
              __break(1u);
            }
          }
          if (v9 < (int)a1)
          {
LABEL_58:
            __break(1u);
            goto LABEL_59;
          }
          OUTLINED_FUNCTION_8_13();
          uint64_t v31 = OUTLINED_FUNCTION_20_6();
          char v34 = sub_1D7626EB4(v31, v32, v33, 1);
          if (v4) {
            goto LABEL_59;
          }
          char v35 = v34;
          OUTLINED_FUNCTION_3_12();
LABEL_52:
          uint64_t result = OUTLINED_FUNCTION_3_12();
LABEL_53:
          *a3 = v39;
          a3[1] = v35;
          return result;
      }
    case 3uLL:
      goto LABEL_12;
    default:
      uint64_t v10 = 0;
      uint64_t v11 = 1;
      uint64_t v12 = BYTE6(a2);
      goto LABEL_8;
  }
}

uint64_t sub_1D762461C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v7 = *(unsigned __int8 *)(a1 + 16);
  sub_1D75934F4(a2, a3);
  sub_1D75F7D7C(40, a2, a3, (uint64_t *)&v15);
  uint64_t v9 = v15;
  unint64_t v8 = v16;
  if (v7 == 6)
  {
    OUTLINED_FUNCTION_21_9();
    sub_1D76232B4();
    OUTLINED_FUNCTION_38_5();
    OUTLINED_FUNCTION_47();
    uint64_t result = OUTLINED_FUNCTION_48_2();
    if (!v8)
    {
      unint64_t v7 = v15;
      unint64_t v11 = v16 | ((unint64_t)WORD2(v16) << 32) | ((unint64_t)BYTE6(v16) << 48);
      goto LABEL_12;
    }
LABEL_9:
    unint64_t v11 = v8 | 0x6000000000000000;
    goto LABEL_12;
  }
  if (v7 == 58)
  {
    uint64_t v12 = OUTLINED_FUNCTION_21_9();
    sub_1D762418C(v12, v13, v14);
    OUTLINED_FUNCTION_38_5();
    OUTLINED_FUNCTION_47();
    uint64_t result = OUTLINED_FUNCTION_48_2();
    if (!v8)
    {
      unint64_t v7 = (unsigned __int16)v15;
      unint64_t v11 = 0x4000000000000000;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (v7 != 17)
  {
    OUTLINED_FUNCTION_38_5();
    sub_1D75933F0(v9, v8);
    OUTLINED_FUNCTION_47();
    uint64_t result = OUTLINED_FUNCTION_48_2();
    unint64_t v11 = 0x8000000000000000;
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_21_9();
  sub_1D7623BF8();
  OUTLINED_FUNCTION_38_5();
  OUTLINED_FUNCTION_47();
  uint64_t result = OUTLINED_FUNCTION_48_2();
  if (v8) {
    goto LABEL_9;
  }
  unint64_t v7 = v15 | ((unint64_t)WORD2(v15) << 32);
  unint64_t v11 = 0x2000000000000000;
LABEL_12:
  *a4 = v7;
  a4[1] = v11;
  return result;
}

uint64_t type metadata accessor for TunnelInterfaceParameters()
{
  uint64_t result = qword_1EA82C588;
  if (!qword_1EA82C588) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TunnelPacket.protocolFamily.getter()
{
  return *v0;
}

uint64_t TunnelPacket.length.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  unint64_t v2 = *(void *)(v0 + 88);
  uint64_t result = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      BOOL v4 = __OFSUB__(HIDWORD(v1), v1);
      int v5 = HIDWORD(v1) - v1;
      if (v4)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x1D7624810);
      }
      return v5;
    case 2uLL:
      uint64_t v8 = v1 + 16;
      uint64_t v6 = *(void *)(v1 + 16);
      uint64_t v7 = *(void *)(v8 + 8);
      uint64_t result = v7 - v6;
      if (!__OFSUB__(v7, v6)) {
        return result;
      }
      goto LABEL_8;
    case 3uLL:
      return result;
    default:
      return BYTE6(v2);
  }
}

uint64_t TunnelPacket.ipHeader.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  unint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  unint64_t v6 = *(void *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 8);
  *(unsigned char *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  sub_1D75934F4(v3, v4);
  return sub_1D75934F4(v5, v6);
}

uint64_t TunnelPacket.transportProtocolHeader.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  unint64_t v3 = *(void *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_1D75DD424(v2, v3);
}

uint64_t TunnelPacket.packetData.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  sub_1D75934F4(v1, *(void *)(v0 + 88));
  return v1;
}

uint64_t TunnelPacket.packetData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1D75933F0(*(void *)(v2 + 80), *(void *)(v2 + 88));
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*TunnelPacket.packetData.modify())(void)
{
  return nullsub_1;
}

uint64_t TunnelPacket.init(data:ipHeader:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  char v9 = *((unsigned char *)a3 + 16);
  uint64_t v10 = a3[3];
  unint64_t v11 = a3[4];
  uint64_t v12 = a3[5];
  unint64_t v13 = a3[6];
  sub_1D75934F4(a1, a2);
  sub_1D75934F4(v10, v11);
  sub_1D75934F4(v12, v13);
  if (qword_1EA82AA68 != -1) {
    swift_once();
  }
  if (byte_1EA83A380 == 1)
  {
    v16[0] = v7;
    v16[1] = v8;
    char v17 = v9;
    uint64_t v18 = v10;
    unint64_t v19 = v11;
    uint64_t v20 = v12;
    unint64_t v21 = v13;
    uint64_t result = sub_1D762461C((uint64_t)v16, a1, a2, (unint64_t *)&v22);
    long long v15 = v22;
  }
  else
  {
    sub_1D75933F0(a1, a2);
    sub_1D75933F0(v10, v11);
    uint64_t result = OUTLINED_FUNCTION_46_3();
    long long v15 = xmmword_1D76655F0;
  }
  *(_DWORD *)a4 = 30;
  *(void *)(a4 + 8) = v7;
  *(void *)(a4 + 16) = v8;
  *(unsigned char *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = v10;
  *(void *)(a4 + 40) = v11;
  *(void *)(a4 + 48) = v12;
  *(void *)(a4 + 56) = v13;
  *(_OWORD *)(a4 + 64) = v15;
  *(void *)(a4 + 80) = a1;
  *(void *)(a4 + 88) = a2;
  return result;
}

BOOL TunnelPacket.isValidPacket.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  unint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = 0;
  switch(v2 >> 62)
  {
    case 1uLL:
      LODWORD(v3) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1)) {
        goto LABEL_14;
      }
      uint64_t v3 = (int)v3;
LABEL_6:
      uint64_t v8 = *(void *)(v0 + 8);
      uint64_t v9 = *(void *)(v0 + 16);
      BOOL v7 = __OFADD__(v8, v9);
      uint64_t v10 = v8 + v9;
      if (v7)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        JUMPOUT(0x1D7624AC4);
      }
      return *(_DWORD *)v0 == 30 && v3 == v10;
    case 2uLL:
      uint64_t v6 = v1 + 16;
      uint64_t v5 = *(void *)(v1 + 16);
      uint64_t v4 = *(void *)(v6 + 8);
      BOOL v7 = __OFSUB__(v4, v5);
      uint64_t v3 = v4 - v5;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_15;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v3 = BYTE6(v2);
      goto LABEL_6;
  }
}

uint64_t TunnelPacket.isValidInboundPacket(localInterface:remoteAddress:)(uint64_t a1, uint64_t a2)
{
  void (*v53)(void *__return_ptr, uint64_t, uint64_t);
  void v54[4];
  void v55[3];
  uint64_t v56;
  uint64_t v57;

  int v5 = *v2;
  uint64_t result = TunnelPacket.length.getter();
  uint64_t v7 = *((void *)v2 + 1);
  uint64_t v8 = *((void *)v2 + 2);
  BOOL v9 = __OFADD__(v7, v8);
  uint64_t v10 = v7 + v8;
  if (v9)
  {
    __break(1u);
  }
  else
  {
    uint64_t v50 = a2;
    uint64_t v52 = a1;
    int v46 = v5;
    uint64_t v11 = *((void *)v2 + 4);
    unint64_t v12 = *((void *)v2 + 5);
    uint64_t v13 = *((void *)v2 + 6);
    unint64_t v14 = *((void *)v2 + 7);
    uint64_t v15 = *((void *)v2 + 8);
    unint64_t v16 = *((void *)v2 + 9);
    uint64_t v17 = *((void *)v2 + 10);
    unint64_t v44 = *((void *)v2 + 11);
    uint64_t v45 = result;
    uint64_t v43 = v10;
    sub_1D7660430();
    OUTLINED_FUNCTION_0_5();
    uint64_t v19 = v18;
    MEMORY[0x1F4188790](v20);
    OUTLINED_FUNCTION_34_5();
    uint64_t v47 = v21;
    (*(void (**)(int *, uint64_t))(v19 + 16))(v2, v50);
    sub_1D75934F4(v11, v12);
    uint64_t v48 = v13;
    sub_1D75934F4(v13, v14);
    sub_1D75DD424(v15, v16);
    sub_1D75934F4(v17, v44);
    if (v46 == 30 && v45 == v43)
    {
      sub_1D75934F4(v11, v12);
      uint64_t v24 = sub_1D7660410();
      char v23 = MEMORY[0x1D9472580](v11, v12, v24, v25);
      OUTLINED_FUNCTION_46_3();
      sub_1D75933F0(v11, v12);
    }
    else
    {
      char v23 = 0;
    }
    (*(void (**)(int *, uint64_t))(v19 + 8))(v2, v47);
    sub_1D75933F0(v11, v12);
    sub_1D75933F0(v48, v14);
    sub_1D75DD450(v15, v16);
    sub_1D75933F0(v17, v44);
    uint64_t v26 = *((void *)v2 + 4);
    unint64_t v27 = *((void *)v2 + 5);
    uint64_t v28 = *((void *)v2 + 6);
    unint64_t v29 = *((void *)v2 + 7);
    uint64_t v30 = *((void *)v2 + 8);
    unint64_t v31 = *((void *)v2 + 9);
    uint64_t v32 = *((void *)v2 + 10);
    unint64_t v33 = *((void *)v2 + 11);
    sub_1D758B1EC(v52, (uint64_t)v55);
    if (v23)
    {
      uint64_t v35 = v56;
      uint64_t v34 = v57;
      __swift_project_boxed_opaque_existential_0Tm(v55, v56);
      uint64_t v49 = v26;
      uint64_t v36 = v26;
      uint64_t v37 = v32;
      uint64_t v51 = v30;
      __int16 v53 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v34 + 48);
      sub_1D75934F4(v36, v27);
      sub_1D75934F4(v28, v29);
      sub_1D75DD424(v30, v31);
      unint64_t v38 = v33;
      sub_1D75934F4(v32, v33);
      sub_1D75934F4(v28, v29);
      v53(v54, v35, v34);
      __swift_project_boxed_opaque_existential_0Tm(v54, v54[3]);
      uint64_t v39 = sub_1D7660820();
      unint64_t v41 = v40;
      char v42 = MEMORY[0x1D9472580](v28, v29, v39, v40);
      OUTLINED_FUNCTION_46_3();
      sub_1D75933F0(v39, v41);
      sub_1D75933F0(v49, v27);
      OUTLINED_FUNCTION_46_3();
      sub_1D75DD450(v51, v31);
      sub_1D75933F0(v37, v38);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v54);
    }
    else
    {
      char v42 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v55);
    return v42 & 1;
  }
  return result;
}

uint64_t TunnelPacket.isValidOutboundPacket(localInterface:remoteAddress:)(uint64_t a1, void **a2)
{
  void (*v48)(void *__return_ptr, uint64_t, uint64_t);
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void **v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void v58[4];
  void v59[3];
  uint64_t v60;
  uint64_t v61;

  int v5 = *v2;
  uint64_t result = TunnelPacket.length.getter();
  uint64_t v7 = *((void *)v2 + 1);
  uint64_t v8 = *((void *)v2 + 2);
  uint64_t v9 = v7 + v8;
  if (__OFADD__(v7, v8))
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = result;
    __int16 v53 = a2;
    uint64_t v12 = *((void *)v2 + 4);
    unint64_t v11 = *((void *)v2 + 5);
    uint64_t v13 = *((void *)v2 + 6);
    unint64_t v14 = *((void *)v2 + 7);
    unint64_t v15 = *((void *)v2 + 9);
    uint64_t v51 = *((void *)v2 + 8);
    uint64_t v16 = *((void *)v2 + 10);
    unint64_t v17 = *((void *)v2 + 11);
    uint64_t v57 = v16;
    sub_1D758B1EC(a1, (uint64_t)v59);
    BOOL v18 = v5 == 30 && v10 == v9;
    __int16 v55 = v13;
    uint64_t v56 = v12;
    uint64_t v50 = v14;
    uint64_t v54 = v11;
    uint64_t v52 = v15;
    if (v18)
    {
      uint64_t v23 = v60;
      uint64_t v24 = v61;
      uint64_t v47 = __swift_project_boxed_opaque_existential_0Tm(v59, v60);
      uint64_t v48 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v24 + 48);
      uint64_t v49 = v17;
      sub_1D75934F4(v12, v11);
      sub_1D75934F4(v13, v14);
      sub_1D75DD424(v51, v15);
      sub_1D75934F4(v57, v17);
      sub_1D75934F4(v12, v11);
      v48(v58, v23, v24);
      __swift_project_boxed_opaque_existential_0Tm(v58, v58[3]);
      uint64_t v25 = sub_1D7660820();
      unint64_t v27 = v26;
      char v22 = MEMORY[0x1D9472580](v12, v11, v25, v26);
      sub_1D75933F0(v12, v11);
      sub_1D75933F0(v25, v27);
      sub_1D75933F0(v12, v11);
      sub_1D75933F0(v55, v14);
      unint64_t v17 = v49;
      uint64_t v20 = v51;
      sub_1D75DD450(v51, v15);
      uint64_t v21 = v57;
      unint64_t v19 = v49;
      sub_1D75933F0(v57, v49);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v58);
    }
    else
    {
      unint64_t v19 = v17;
      uint64_t v20 = v51;
      uint64_t v21 = v57;
      char v22 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
    uint64_t v28 = sub_1D7660430();
    OUTLINED_FUNCTION_0_5();
    uint64_t v30 = v29;
    MEMORY[0x1F4188790](v31);
    OUTLINED_FUNCTION_34_5();
    (*(void (**)(unint64_t, void **, uint64_t))(v30 + 16))(v17, v53, v28);
    if (v22)
    {
      sub_1D75934F4(v56, v54);
      __int16 v53 = &v47;
      sub_1D75934F4(v55, v50);
      sub_1D75DD424(v20, v52);
      sub_1D75934F4(v21, v19);
      uint64_t v32 = OUTLINED_FUNCTION_42_2();
      sub_1D75934F4(v32, v33);
      uint64_t v34 = sub_1D7660410();
      unint64_t v36 = v35;
      uint64_t v37 = OUTLINED_FUNCTION_42_2();
      char v38 = MEMORY[0x1D9472580](v37);
      sub_1D75933F0(v34, v36);
      uint64_t v39 = OUTLINED_FUNCTION_42_2();
      sub_1D75933F0(v39, v40);
      uint64_t v41 = OUTLINED_FUNCTION_35_3();
      v42(v41);
      sub_1D75933F0(v56, v54);
      uint64_t v43 = OUTLINED_FUNCTION_42_2();
      sub_1D75933F0(v43, v44);
      sub_1D75DD450(v20, v52);
      sub_1D75933F0(v57, v19);
    }
    else
    {
      uint64_t v45 = OUTLINED_FUNCTION_35_3();
      v46(v45);
      char v38 = 0;
    }
    return v38 & 1;
  }
  return result;
}

uint64_t ReadPacketGroup.packets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ReadPacketGroup.finalize.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t sub_1D7625134(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73736572646461 && a2 == 0xE700000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6B73616D74656ELL && a2 == 0xE700000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 7697517 && a2 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1D7661560();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1D762527C(char a1)
{
  if (!a1) {
    return 0x73736572646461;
  }
  if (a1 == 1) {
    return 0x6B73616D74656ELL;
  }
  return 7697517;
}

uint64_t sub_1D76252CC()
{
  return sub_1D762527C(*v0);
}

uint64_t sub_1D76252D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D7625134(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D76252FC(uint64_t a1)
{
  unint64_t v2 = sub_1D76254FC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7625338(uint64_t a1)
{
  unint64_t v2 = sub_1D76254FC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TunnelInterfaceParameters.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C570);
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_1_7();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1D76254FC();
  sub_1D76617C0();
  sub_1D7660430();
  sub_1D7625888(&qword_1EA82BEB0);
  OUTLINED_FUNCTION_24_5();
  if (!v1)
  {
    type metadata accessor for TunnelInterfaceParameters();
    OUTLINED_FUNCTION_24_5();
    sub_1D76614C0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

unint64_t sub_1D76254FC()
{
  unint64_t result = qword_1EA82C578;
  if (!qword_1EA82C578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C578);
  }
  return result;
}

uint64_t TunnelInterfaceParameters.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C580);
  OUTLINED_FUNCTION_0_5();
  uint64_t v36 = v5;
  uint64_t v37 = v4;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_1_7();
  uint64_t v6 = type metadata accessor for TunnelInterfaceParameters();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_1_7();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1D76254FC();
  sub_1D76617A0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  uint64_t v32 = v6;
  uint64_t v33 = v10;
  uint64_t v11 = sub_1D7660430();
  uint64_t v34 = v30;
  OUTLINED_FUNCTION_0_5();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v16);
  unint64_t v31 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v17 = (char *)v30 - v31;
  char v40 = 0;
  sub_1D7625888(&qword_1EA82BE80);
  OUTLINED_FUNCTION_19_8();
  v30[2] = v13;
  uint64_t v18 = v13 + 32;
  unint64_t v19 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  uint64_t v20 = v33;
  v30[0] = v19;
  v30[1] = v18;
  v19(v33, v17, v11);
  OUTLINED_FUNCTION_43_2();
  uint64_t v34 = v30;
  MEMORY[0x1F4188790](v21);
  char v22 = (char *)v30 - v31;
  char v39 = 1;
  OUTLINED_FUNCTION_19_8();
  uint64_t v23 = v20;
  uint64_t v24 = v32;
  uint64_t v25 = v23;
  ((void (*)(uint64_t, char *, uint64_t))v30[0])(v23 + *(int *)(v32 + 20), v22, v11);
  OUTLINED_FUNCTION_43_2();
  char v38 = 2;
  __int16 v26 = sub_1D76613B0();
  uint64_t v27 = OUTLINED_FUNCTION_44_3();
  v28(v27);
  *(_WORD *)(v25 + *(int *)(v24 + 24)) = v26;
  sub_1D76258CC(v25, v35);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return sub_1D7625930(v25);
}

uint64_t sub_1D7625888(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1D7660430();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D76258CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TunnelInterfaceParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D7625930(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TunnelInterfaceParameters();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D762598C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TunnelInterfaceParameters.init(from:)(a1, a2);
}

uint64_t sub_1D76259A4(void *a1)
{
  return TunnelInterfaceParameters.encode(to:)(a1);
}

uint64_t destroy for TunnelPacket(void *a1)
{
  sub_1D75933F0(a1[4], a1[5]);
  sub_1D75933F0(a1[6], a1[7]);
  unint64_t v2 = a1[9];
  if (v2 >> 60 != 15) {
    sub_1D75DD464(a1[8], v2);
  }
  uint64_t v3 = a1[10];
  unint64_t v4 = a1[11];
  return sub_1D75933F0(v3, v4);
}

uint64_t initializeWithCopy for TunnelPacket(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  unint64_t v5 = *(void *)(a2 + 40);
  sub_1D75934F4(v4, v5);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  unint64_t v7 = *(void *)(a2 + 56);
  sub_1D75934F4(v6, v7);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = (uint64_t *)(a2 + 64);
  unint64_t v9 = *(void *)(a2 + 72);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 64) = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v10 = *v8;
    sub_1D75DD438(*v8, *(void *)(a2 + 72));
    *(void *)(a1 + 64) = v10;
    *(void *)(a1 + 72) = v9;
  }
  uint64_t v12 = *(void *)(a2 + 80);
  unint64_t v11 = *(void *)(a2 + 88);
  sub_1D75934F4(v12, v11);
  *(void *)(a1 + 80) = v12;
  *(void *)(a1 + 88) = v11;
  return a1;
}

uint64_t assignWithCopy for TunnelPacket(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  unint64_t v5 = *(void *)(a2 + 40);
  sub_1D75934F4(v4, v5);
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  sub_1D75933F0(v6, v7);
  uint64_t v8 = *(void *)(a2 + 48);
  unint64_t v9 = *(void *)(a2 + 56);
  sub_1D75934F4(v8, v9);
  uint64_t v10 = *(void *)(a1 + 48);
  unint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  sub_1D75933F0(v10, v11);
  uint64_t v12 = (uint64_t *)(a2 + 64);
  unint64_t v13 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_1D75DD438(*v12, *(void *)(a2 + 72));
      uint64_t v16 = *(void *)(a1 + 64);
      unint64_t v17 = *(void *)(a1 + 72);
      *(void *)(a1 + 64) = v15;
      *(void *)(a1 + 72) = v13;
      sub_1D75DD464(v16, v17);
      goto LABEL_8;
    }
    sub_1D7625C00(a1 + 64);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 64) = *(_OWORD *)v12;
    goto LABEL_8;
  }
  uint64_t v14 = *v12;
  sub_1D75DD438(*v12, *(void *)(a2 + 72));
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 72) = v13;
LABEL_8:
  uint64_t v19 = *(void *)(a2 + 80);
  unint64_t v18 = *(void *)(a2 + 88);
  sub_1D75934F4(v19, v18);
  uint64_t v20 = *(void *)(a1 + 80);
  unint64_t v21 = *(void *)(a1 + 88);
  *(void *)(a1 + 80) = v19;
  *(void *)(a1 + 88) = v18;
  sub_1D75933F0(v20, v21);
  return a1;
}

uint64_t sub_1D7625C00(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for TunnelPacket(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_1D75933F0(v4, v5);
  uint64_t v6 = *(void *)(a1 + 48);
  unint64_t v7 = *(void *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_1D75933F0(v6, v7);
  uint64_t v8 = (void *)(a2 + 64);
  unint64_t v9 = *(void *)(a1 + 72);
  if (v9 >> 60 != 15)
  {
    unint64_t v10 = *(void *)(a2 + 72);
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      *(void *)(a1 + 64) = *v8;
      *(void *)(a1 + 72) = v10;
      sub_1D75DD464(v11, v9);
      goto LABEL_6;
    }
    sub_1D7625C00(a1 + 64);
  }
  *(_OWORD *)(a1 + 64) = *(_OWORD *)v8;
LABEL_6:
  uint64_t v12 = *(void *)(a1 + 80);
  unint64_t v13 = *(void *)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  sub_1D75933F0(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelPacket(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 96))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 40) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 40) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2)
    {
      *(void *)(result + 32) = 0;
      *(void *)(result + 40) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for TunnelPacket()
{
}

void *__swift_memcpy15_4(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 7) = *(uint64_t *)((char *)a2 + 7);
  *uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.TCPSegmentHeader(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 15)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.TCPSegmentHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 14) = 0;
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 15) = v3;
  return result;
}

void type metadata accessor for TunnelPacket.TCPSegmentHeader()
{
}

uint64_t __swift_memcpy6_2(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.UDPDatagramHeader(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 6)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.UDPDatagramHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
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
  *(unsigned char *)(result + 6) = v3;
  return result;
}

void type metadata accessor for TunnelPacket.UDPDatagramHeader()
{
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.ICMPv6Header(unsigned __int16 *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 0xFFFF) <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if ((a2 + 0xFFFF) < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        return 0;
      }
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }
  }
  return 0;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.ICMPv6Header(uint64_t result, int a2, int a3)
{
  if ((a3 + 0xFFFF) <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if ((a3 + 0xFFFF) < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 1) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 1;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        return result;
      case 2:
        *(_WORD *)(result + 2) = v6;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)(result + 2) = v6;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *(unsigned char *)(result + 2) = 0;
      break;
    case 2:
      *(_WORD *)(result + 2) = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1D7625FD0);
    case 4:
      *(_DWORD *)(result + 2) = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for TunnelPacket.ICMPv6Header()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for TunnelPacket.TransportProtocolHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1D75DD438(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

void destroy for TunnelPacket.TransportProtocolHeader(uint64_t a1)
{
}

uint64_t *assignWithCopy for TunnelPacket.TransportProtocolHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1D75DD438(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1D75DD464(v5, v6);
  return a1;
}

uint64_t *assignWithTake for TunnelPacket.TransportProtocolHeader(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1D75DD464(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.TransportProtocolHeader(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xC && *(unsigned char *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 11;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 1) & 0xFFFFFFF7 | (8
                                                                           * ((*(void *)(a1 + 8) & 0x1000000000000000) != 0))) ^ 0xF;
      if (v2 >= 0xB) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.TransportProtocolHeader(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)uint64_t result = a2 - 12;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 3) & 1) - 2 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_1D762616C(uint64_t a1)
{
  return *(void *)(a1 + 8) >> 61;
}

uint64_t sub_1D7626178(uint64_t result)
{
  *(void *)(result + 8) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1D7626188(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = *(void *)(result + 8) & 0xFFFFFFFFFFFFFFFLL | (a2 << 61);
  return result;
}

void type metadata accessor for TunnelPacket.TransportProtocolHeader()
{
}

uint64_t destroy for ReadPacketGroup()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void type metadata accessor for ReadPacketGroup()
{
}

uint64_t _s19RemotePairingDevice15ReadPacketGroupVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *_s19RemotePairingDevice15ReadPacketGroupVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s19RemotePairingDevice15ReadPacketGroupVwta_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

void type metadata accessor for ReadPacketDataGroup()
{
}

void *__swift_memcpy89_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

uint64_t getEnumTagSinglePayload for TunnelInterfaceStatistics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 89)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceStatistics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 89) = v3;
  return result;
}

void type metadata accessor for TunnelInterfaceStatistics()
{
}

uint64_t dispatch thunk of static TunnelInterface.defaultMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static TunnelInterface.minSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static TunnelInterface.maxSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static TunnelInterface.maxSupportedPendingPackets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TunnelInterface.interfaceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TunnelInterface.address.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TunnelInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, unint64_t))(a9 + 56))(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32));
}

uint64_t dispatch thunk of TunnelInterface.writePackets(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of TunnelInterface.readPackets(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of TunnelInterface.getInterfaceStatistics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t *initializeBufferWithCopyOfBuffer for TunnelInterfaceParameters(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1D7660430();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    *(_WORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_WORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D7660430();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  return v7(v5, v4);
}

uint64_t initializeWithCopy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D7660430();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D7660430();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D7660430();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1D7660430();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D76268BC);
}

uint64_t sub_1D76268BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D7660430();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D7626918);
}

uint64_t sub_1D7626918(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1D7660430();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_1D7626964()
{
  uint64_t result = sub_1D7660430();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for TunnelPacket.TCPSegmentHeader.Flags()
{
}

unsigned char *storeEnumTagSinglePayload for TunnelInterfaceParameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1D7626AD8);
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

ValueMetadata *type metadata accessor for TunnelInterfaceParameters.CodingKeys()
{
  return &type metadata for TunnelInterfaceParameters.CodingKeys;
}

unint64_t sub_1D7626B14()
{
  unint64_t result = qword_1EA82C598;
  if (!qword_1EA82C598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C598);
  }
  return result;
}

unint64_t sub_1D7626B64()
{
  unint64_t result = qword_1EA82C5A0;
  if (!qword_1EA82C5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C5A0);
  }
  return result;
}

unint64_t sub_1D7626BB4()
{
  unint64_t result = qword_1EA82C5A8;
  if (!qword_1EA82C5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C5A8);
  }
  return result;
}

unint64_t sub_1D7626C04()
{
  unint64_t result = qword_1EA82C5B0;
  if (!qword_1EA82C5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C5B0);
  }
  return result;
}

unint64_t sub_1D7626C54()
{
  unint64_t result = qword_1EA82C5B8;
  if (!qword_1EA82C5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C5B8);
  }
  return result;
}

unint64_t sub_1D7626CA4()
{
  unint64_t result = qword_1EA82C5C0;
  if (!qword_1EA82C5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C5C0);
  }
  return result;
}

unint64_t sub_1D7626CF4()
{
  unint64_t result = qword_1EA82C5C8;
  if (!qword_1EA82C5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C5C8);
  }
  return result;
}

uint64_t sub_1D7626D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  __int16 v6 = a2;
  char v7 = BYTE2(a2);
  char v8 = BYTE3(a2);
  char v9 = BYTE4(a2);
  char v10 = BYTE5(a2);
  return *((unsigned __int8 *)&v5 + a4);
}

uint64_t sub_1D7626DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  __int16 v6 = a2;
  char v7 = BYTE2(a2);
  char v8 = BYTE3(a2);
  char v9 = BYTE4(a2);
  char v10 = BYTE5(a2);
  return bswap32(*(_DWORD *)((char *)&v5 + a4));
}

uint64_t sub_1D7626EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1D765FCE0();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = sub_1D765FD10();
    if (__OFSUB__(a1, result))
    {
      __break(1u);
      goto LABEL_8;
    }
    uint64_t v9 = v7 + a1 - result;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t result = sub_1D765FD00();
  if (v9) {
    return *(unsigned __int8 *)(v9 + a4);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1D7626F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1D765FCE0();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = sub_1D765FD10();
    if (__OFSUB__(a1, result))
    {
      __break(1u);
      goto LABEL_8;
    }
    uint64_t v9 = v7 + a1 - result;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t result = sub_1D765FD00();
  if (v9) {
    return bswap32(*(_DWORD *)(v9 + a4));
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_5_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_10()
{
  return sub_1D7661500();
}

uint64_t OUTLINED_FUNCTION_18_9()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_19_8()
{
  return sub_1D7661380();
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return sub_1D75F05BC(v1, v2, v0, 2);
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33_6()
{
  return sub_1D7661640();
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_5()
{
  return sub_1D75933F0(v1, v0);
}

void OUTLINED_FUNCTION_39_4(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = v2;
}

void OUTLINED_FUNCTION_40_3(void *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_41_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  return sub_1D75933F0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_51_2()
{
  return 0x73726F727245;
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return 0x74656B636150;
}

void OUTLINED_FUNCTION_53_2(uint64_t a1@<X8>)
{
  *uint64_t v1 = a1;
}

uint64_t sub_1D76271BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
    sub_1D75A6590();
    uint64_t v2 = v10;
    unsigned int v4 = (unint64_t *)(a1 + 120);
    do
    {
      uint64_t v5 = *(v4 - 1);
      unint64_t v6 = *v4;
      sub_1D75934F4(v5, *v4);
      unint64_t v7 = *(void *)(v10 + 16);
      if (v7 >= *(void *)(v10 + 24) >> 1) {
        sub_1D75A6590();
      }
      v4 += 12;
      *(void *)(v10 + 16) = v7 + 1;
      uint64_t v8 = v10 + 16 * v7;
      *(void *)(v8 + 32) = v5;
      *(void *)(v8 + 40) = v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1D7627298()
{
  sub_1D75AEF50(0, (unint64_t *)&qword_1EBDEC4C0);
  uint64_t result = sub_1D7660FE0();
  qword_1EA82C5D0 = result;
  return result;
}

uint64_t sub_1D7627314()
{
  if (qword_1EA82AA80 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (byte_1EA82C5DA) {
    __int16 v1 = 16032;
  }
  else {
    __int16 v1 = 4096;
  }
  word_1EA82C5D8 = v1;
  return result;
}

uint64_t sub_1D76273A0()
{
  uint64_t result = sub_1D76273C4();
  byte_1EA82C5DA = result & 1;
  return result;
}

uint64_t sub_1D76273C4()
{
  type metadata accessor for SkywalkChannelVirtualInterface();
  sub_1D75AEF50(0, (unint64_t *)&qword_1EBDEC4B0);
  uint64_t v0 = sub_1D7660920();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCB40], v0);
  unsigned int v4 = (void *)sub_1D7660EC0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v5 = sub_1D762766C();

  if (!v5)
  {
    sub_1D7660DD0();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    sub_1D7660010();
    return 0;
  }
  if (!NEVirtualInterfaceSetMTU())
  {
    sub_1D7660DD0();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    sub_1D7660010();
    swift_release();
    return 0;
  }
  NEVirtualInterfaceInvalidate();
  sub_1D7660DD0();
  if (qword_1EA82AA70 != -1) {
    swift_once();
  }
  sub_1D7660010();
  swift_release();
  return 1;
}

uint64_t sub_1D762766C()
{
  sub_1D7660A50();
  sub_1D75B45A0();
  sub_1D75B45A0();
  uint64_t v0 = (void *)sub_1D7660A10();
  swift_bridgeObjectRelease();
  uint64_t NexusExtendedWithOptions = NEVirtualInterfaceCreateNexusExtendedWithOptions();

  uint64_t result = 0;
  if (NexusExtendedWithOptions)
  {
    type metadata accessor for _ManagedOpaqueCFTypeWrapper();
    swift_allocObject();
    return _ManagedOpaqueCFTypeWrapper.init(retainedValue:)(NexusExtendedWithOptions);
  }
  return result;
}

uint64_t static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.getter()
{
  if (qword_1EA82AA80 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_4();
  return byte_1EA82C5DA;
}

uint64_t static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.setter(char a1)
{
  if (qword_1EA82AA80 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  byte_1EA82C5DA = a1 & 1;
  return result;
}

uint64_t (*static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.modify())()
{
  if (qword_1EA82AA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static SkywalkChannelVirtualInterface.minSupportedMTU.getter()
{
  return 1280;
}

uint64_t sub_1D7627944()
{
  if (qword_1EA82AA78 != -1) {
    uint64_t result = swift_once();
  }
  if ((((unsigned __int16)word_1EA82C5D8 - 32) & 0xFFFF0000) != 0) {
    __break(1u);
  }
  else {
    word_1EA82C5DC = word_1EA82C5D8 - 32;
  }
  return result;
}

uint64_t static SkywalkChannelVirtualInterface.maxSupportedMTU.getter()
{
  if (qword_1EA82AA88 != -1) {
    swift_once();
  }
  return (unsigned __int16)word_1EA82C5DC;
}

uint64_t static SkywalkChannelVirtualInterface.maxSupportedPendingPackets.getter()
{
  if (qword_1EA82A8E0 != -1) {
    swift_once();
  }
  uint64_t v0 = OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_11(v0, v1, v2, v3, v4, v5, v6, v7, v13, v14, v15, v16, v17[0], v17[1], v18);
  unint64_t v8 = sub_1D7595FCC();
  char v10 = v9;
  sub_1D759CCA4((uint64_t)v17);
  if (v8 <= 1) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = v8;
  }
  if (v11 >= 0x400) {
    unsigned int v11 = 1024;
  }
  if (v10 & 1 | (HIDWORD(v8) != 0)) {
    return 32;
  }
  else {
    return v11;
  }
}

uint64_t static SkywalkChannelVirtualInterface.defaultMTU.getter()
{
  if (qword_1EA82A8E8 != -1) {
    swift_once();
  }
  uint64_t v0 = OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_11(v0, v1, v2, v3, v4, v5, v6, v7, v13, v14, v15, v16, v17[0], v17[1], v18);
  unint64_t v8 = sub_1D7595FCC();
  char v10 = v9;
  sub_1D759CCA4((uint64_t)v17);
  if ((v10 & 1) != 0 || v8 >> 16)
  {
    if (qword_1EA82AA88 != -1) {
      swift_once();
    }
    return (unsigned __int16)word_1EA82C5DC;
  }
  else
  {
    if (qword_1EA82AA88 != -1) {
      swift_once();
    }
    unsigned int v11 = (unsigned __int16)v8;
    if ((unsigned __int16)v8 <= 0x500u) {
      unsigned int v11 = 1280;
    }
    if ((unsigned __int16)word_1EA82C5DC >= (unsigned __int16)v8) {
      return v11;
    }
    else {
      return (unsigned __int16)word_1EA82C5DC;
    }
  }
}

uint64_t sub_1D7627BB4()
{
  uint64_t v0 = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  uint64_t result = nw_context_activate();
  qword_1EA82C5E0 = v0;
  return result;
}

uint64_t SkywalkChannelVirtualInterface.interfaceName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SkywalkChannelVirtualInterface.address.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D758B1EC(v1 + 32, a1);
}

uint64_t SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(uint64_t *a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  SkywalkChannelVirtualInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32), a6, a7);
  return v14;
}

uint64_t SkywalkChannelVirtualInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  unint64_t v9 = v8;
  uint64_t v10 = v7;
  uint64_t v74 = a6;
  uint64_t v72 = a5;
  uint64_t v78 = a2;
  uint64_t v15 = *(uint64_t **)v7;
  *(void *)(v7 + 152) = 0;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(void *)(v7 + 120) = 0;
  if (qword_1EA82A8F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = qword_1EA82B0A8;
  uint64_t v17 = unk_1EA82B0B0;
  if (byte_1EA82B0B9) {
    __int16 v18 = 256;
  }
  else {
    __int16 v18 = 0;
  }
  __int16 v19 = v18 | byte_1EA82B0B8;
  swift_bridgeObjectRetain();
  LOBYTE(v19) = sub_1D758C360(v16, v17, v19);
  swift_bridgeObjectRelease();
  if (v19)
  {
    uint64_t v20 = sub_1D7628AC8(v78, a1);
    unint64_t v21 = *(void **)(v10 + 152);
    *(void *)(v10 + 152) = v20;
  }
  if ((a4 & 0x10000) != 0) {
    a4 = static SkywalkChannelVirtualInterface.defaultMTU.getter();
  }
  if ((((unsigned __int16)a4 + 32) & 0x10000) != 0)
  {
    __break(1u);
LABEL_57:
    swift_once();
LABEL_14:
    *(void *)(v10 + 144) = qword_1EA82C5E0;
    char v85 = 0;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    sub_1D7661100();
    swift_bridgeObjectRelease();
    uint64_t v81 = 0xD000000000000029;
    unint64_t v82 = 0x80000001D7674AF0;
    sub_1D7660BC0();
    sub_1D7660B70();
    swift_bridgeObjectRelease();
    uint64_t v27 = os_transaction_create();
    swift_release();
    if (!v27)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1D75AF4C0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_1_15();
      OUTLINED_FUNCTION_12_7();
      OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_2_1();
      swift_willThrow();
      uint64_t v39 = a4;
      uint64_t v23 = v76;
      sub_1D76292C0(&v85, v39, v9);
      swift_bridgeObjectRelease();
      swift_release();

      goto LABEL_44;
    }
    unint64_t v70 = v9;
    uint64_t v71 = a4;
    uint64_t v28 = v78;
    uint64_t v69 = a1;
    uint64_t v68 = v27;
    if (!a7)
    {
      sub_1D7660DD0();
      uint64_t v40 = v75;
      if (qword_1EA82AA70 != -1) {
        swift_once();
      }
      sub_1D7660010();
      goto LABEL_33;
    }
    os_log_type_t v29 = sub_1D7660DD0();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    uint64_t v30 = qword_1EA82C5D0;
    if (os_log_type_enabled((os_log_t)qword_1EA82C5D0, v29))
    {
      swift_bridgeObjectRetain_n();
      unint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v81 = swift_slowAlloc();
      *(_DWORD *)unint64_t v31 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v83 = OUTLINED_FUNCTION_14_8();
      uint64_t v28 = v78;
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D757C000, v30, v29, "Physical interface name is:%{public}s", v31, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    uint64_t v32 = (void *)sub_1D7660AE0();
    uint64_t v33 = NEVirtualInterfaceSetDelegateInterface();

    if (v33)
    {
      os_log_type_t v34 = sub_1D7660DD0();
      if (OUTLINED_FUNCTION_25_4(v34))
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        OUTLINED_FUNCTION_32_5(4.8149e-34);
        uint64_t v36 = OUTLINED_FUNCTION_14_8();
        OUTLINED_FUNCTION_11_6(v36);
        swift_bridgeObjectRelease_n();
        uint64_t v37 = "Assigned %s as the delegate interface on virtual interface successfully";
LABEL_30:
        _os_log_impl(&dword_1D757C000, v33, v29, v37, v35, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        uint64_t v28 = v78;
        OUTLINED_FUNCTION_1();
LABEL_32:
        uint64_t v40 = v75;
LABEL_33:
        sub_1D758B1EC(v28, (uint64_t)&v81);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BC58);
        sub_1D7660B60();
        sub_1D758B1EC(v40, (uint64_t)&v81);
        sub_1D7660B60();
        uint64_t v23 = v76;
        uint64_t v43 = (void *)sub_1D7660AE0();
        unint64_t v44 = (void *)sub_1D7660AE0();
        int v45 = NEVirtualInterfaceAddAddress();

        if (v45)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (NEVirtualInterfaceSetRankNever())
          {
            uint64_t v46 = v78;
            unint64_t v47 = v70;
            if (!NEVirtualInterfaceUpdateAdHocService() || !NEVirtualInterfaceSetMTU())
            {
              swift_bridgeObjectRelease();
              sub_1D75AF4C0();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_1_15();
              OUTLINED_FUNCTION_12_7();
              OUTLINED_FUNCTION_3_7();
              OUTLINED_FUNCTION_28_6();
              OUTLINED_FUNCTION_2_1();
              swift_willThrow();
              swift_unknownObjectRelease();
              OUTLINED_FUNCTION_27_7();
              swift_bridgeObjectRelease();
              swift_release();

              __swift_destroy_boxed_opaque_existential_0Tm(v75);
              uint64_t v52 = 0xD000000000000034;
              goto LABEL_46;
            }
            if ((v72 & 0x100000000) != 0 || NEVirtualInterfaceSetMaxPendingPackets())
            {
              *(void *)(v10 + 16) = v71;
              *(void *)(v10 + 24) = v47;
              sub_1D758B1EC(v46, v10 + 32);
              uint64_t v48 = v69;
              *(void *)(v10 + 72) = v23;
              *(void *)(v10 + 80) = v48;
              *(void *)(v10 + 128) = v68;
              swift_bridgeObjectRetain();
              swift_retain();
              uint64_t v74 = v48;
              swift_unknownObjectRetain();
              swift_unknownObjectRetain();
              uint64_t v49 = sub_1D7629484();
              if (!v67)
              {
                uint64_t v73 = v49;
                swift_unknownObjectRelease();
                uint64_t v53 = *(void *)(v10 + 144);
                sub_1D7660900();
                uint64_t v77 = &v66;
                OUTLINED_FUNCTION_0_5();
                MEMORY[0x1F4188790](v54);
                OUTLINED_FUNCTION_1_7();
                uint64_t v57 = v56 - v55;
                *(void *)(v56 - v55) = 10;
                (*(void (**)(uint64_t, void))(v58 + 104))(v56 - v55, *MEMORY[0x1E4FBCAE0]);
                type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol();
                swift_allocObject();
                uint64_t v59 = v74;
                swift_unknownObjectRetain();
                uint64_t v60 = sub_1D765B92C((uint64_t)v73, v59, v71, v47, v53, v57);
                swift_unknownObjectRelease();
                *(void *)(v10 + 136) = v60;
                uint64_t v61 = swift_allocObject();
                swift_weakInit();
                uint64_t v62 = *(void *)(v60 + 16);
                *(void *)(v60 + 16) = sub_1D762B988;
                *(void *)(v60 + 24) = v61;
                sub_1D75940A4(v62);
                uint64_t v63 = *(void *)(v10 + 136);
                uint64_t v64 = swift_allocObject();
                swift_weakInit();
                uint64_t v65 = *(void *)(v63 + 32);
                *(void *)(v63 + 32) = sub_1D762B990;
                *(void *)(v63 + 40) = v64;
                sub_1D75940A4(v65);
                swift_bridgeObjectRelease();
                swift_release();

                __swift_destroy_boxed_opaque_existential_0Tm(v75);
                __swift_destroy_boxed_opaque_existential_0Tm(v78);
                return v10;
              }
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              sub_1D76292C0(&v85, v71, v47);
              swift_bridgeObjectRelease();
              swift_release();

              __swift_destroy_boxed_opaque_existential_0Tm(v75);
              __swift_destroy_boxed_opaque_existential_0Tm(v46);
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_0Tm(v10 + 32);
              swift_release();

              int v50 = 1;
LABEL_47:
              sub_1D75940A4(*(void *)(v10 + 88));
              sub_1D7628A84(*(void *)(v10 + 104));
              if (v50) {
                swift_unknownObjectRelease();
              }
              if (v23) {
                swift_unknownObjectRelease();
              }

              swift_deallocPartialClassInstance();
              return v10;
            }
            swift_bridgeObjectRelease();
            sub_1D75AF4C0();
            OUTLINED_FUNCTION_0();
            OUTLINED_FUNCTION_1_15();
            OUTLINED_FUNCTION_12_7();
            OUTLINED_FUNCTION_3_7();
            OUTLINED_FUNCTION_2_1();
            swift_willThrow();
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_27_7();
            swift_bridgeObjectRelease();
            swift_release();

            uint64_t v38 = v75;
LABEL_45:
            __swift_destroy_boxed_opaque_existential_0Tm(v38);
            uint64_t v52 = v78;
LABEL_46:
            __swift_destroy_boxed_opaque_existential_0Tm(v52);
            int v50 = 0;
            goto LABEL_47;
          }
          unint64_t v51 = v70;
          swift_bridgeObjectRelease();
          sub_1D75AF4C0();
          OUTLINED_FUNCTION_0();
          OUTLINED_FUNCTION_1_15();
          OUTLINED_FUNCTION_12_7();
          OUTLINED_FUNCTION_3_7();
        }
        else
        {
          unint64_t v51 = v70;
          swift_bridgeObjectRelease();
          uint64_t v74 = (uint64_t *)sub_1D75AF4C0();
          OUTLINED_FUNCTION_0();
          sub_1D7661690();
          uint64_t v83 = v81;
          unint64_t v84 = v82;
          uint64_t v79 = 0;
          unint64_t v80 = 0xE000000000000000;
          sub_1D7661100();
          sub_1D7660BC0();
          sub_1D7660BC0();
          swift_bridgeObjectRelease();
          sub_1D7660BC0();
          sub_1D7660BC0();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_18_4(0x6F742027u);
          sub_1D7660BC0();
          sub_1D75B0D60();
          swift_allocError();
        }
        sub_1D76616A0();
        swift_willThrow();
        swift_unknownObjectRelease();
        sub_1D76292C0(&v85, v71, v51);
        swift_bridgeObjectRelease();
        swift_release();

LABEL_44:
        uint64_t v38 = v75;
        goto LABEL_45;
      }
    }
    else
    {
      os_log_type_t v41 = sub_1D7660DC0();
      if (OUTLINED_FUNCTION_25_4(v41))
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        OUTLINED_FUNCTION_32_5(4.8149e-34);
        uint64_t v42 = OUTLINED_FUNCTION_14_8();
        OUTLINED_FUNCTION_11_6(v42);
        swift_bridgeObjectRelease_n();
        uint64_t v37 = "Failed to set %s as the delegate interface on virtual interface";
        goto LABEL_30;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  LODWORD(v73) = a4;
  uint64_t v22 = sub_1D762766C();
  uint64_t v23 = v22;
  uint64_t v77 = v15;
  if (!v22)
  {
    swift_bridgeObjectRelease();
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1_15();
    OUTLINED_FUNCTION_12_7();
    OUTLINED_FUNCTION_3_7();
    OUTLINED_FUNCTION_2_1();
    swift_willThrow();

    uint64_t v38 = a3;
    goto LABEL_45;
  }
  unint64_t v67 = v9;
  uint64_t v76 = v22;
  uint64_t result = NEVirtualInterfaceCopyName();
  if (result)
  {
    uint64_t v25 = (void *)result;
    uint64_t v75 = a3;
    a4 = sub_1D7660B10();
    unint64_t v9 = v26;

    if (qword_1EA82AA90 == -1) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D7628A84(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1D7628AC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1D765FD90();
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v8);
  unint64_t v9 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v10 = objc_msgSend(self, sel_defaultManager);
  id v11 = objc_msgSend(v10, sel_URLsForDirectory_inDomains_, 13, 1);

  uint64_t v12 = sub_1D7660D00();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC90);
  MEMORY[0x1F4188790](v13 - 8);
  OUTLINED_FUNCTION_8();
  sub_1D75EEFD8(v12, (uint64_t)v10);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v3) == 1)
  {
    sub_1D75DD594((uint64_t)v10, (uint64_t *)&unk_1EA82BC90);
    sub_1D7660DB0();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    sub_1D7660010();
    return 0;
  }
  uint64_t v15 = OUTLINED_FUNCTION_26_5();
  uint64_t v88 = v16;
  uint64_t v89 = a2;
  uint64_t v87 = v17;
  ((void (*)(uint64_t))v17)(v15);
  uint64_t v95 = 0;
  unint64_t v96 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BC58);
  sub_1D7661200();
  sub_1D7660BC0();
  uint64_t v93 = 58;
  unint64_t v94 = 0xE100000000000000;
  uint64_t v91 = 45;
  unint64_t v92 = 0xE100000000000000;
  sub_1D75DD5E4();
  sub_1D7661040();
  uint64_t v18 = swift_bridgeObjectRelease();
  v82[3] = (uint64_t)v82;
  MEMORY[0x1F4188790](v18);
  uint64_t v86 = v7;
  __int16 v19 = (char *)v82 - v9;
  uint64_t v83 = (char *)v82 - v9;
  sub_1D765FD70();
  swift_bridgeObjectRelease();
  sub_1D7660DF0();
  char v85 = v82;
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_1_7();
  uint64_t v23 = v22 - v21;
  uint64_t v25 = *(void (**)(void))(v24 + 104);
  uint64_t v84 = v23;
  v25();
  uint64_t v95 = sub_1D765FD80();
  unint64_t v96 = v26;
  uint64_t v27 = v5;
  uint64_t v28 = sub_1D7660B50();
  uint64_t v29 = v3;
  OUTLINED_FUNCTION_0_5();
  uint64_t v31 = v30;
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_1_7();
  uint64_t v35 = v34 - v33;
  sub_1D7660B40();
  uint64_t v36 = sub_1D7661050();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v35, v28);
  uint64_t result = swift_bridgeObjectRelease();
  if (v36)
  {
    uint64_t v38 = sub_1D75AEF50(0, (unint64_t *)&unk_1EA82BCA0);
    v82[2] = (uint64_t)v82;
    uint64_t v39 = v86;
    MEMORY[0x1F4188790](v38);
    v82[1] = v27;
    uint64_t v41 = v27 + 16;
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
    uint64_t v90 = v19;
    v40((char *)v82 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v29);
    unint64_t v42 = (*(unsigned __int8 *)(v41 + 64) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 64);
    unint64_t v43 = swift_allocObject() + v42;
    uint64_t v44 = v29;
    v87(v43, (char *)v82 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
    int v45 = v89;
    uint64_t v14 = sub_1D7660E20();
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_1D7660DB0();
    os_log_type_t v47 = v46;
    uint64_t v48 = (void (*)(void))v40;
    if (v14)
    {
      if (qword_1EA82AA70 != -1) {
        uint64_t v46 = swift_once();
      }
      uint64_t v49 = qword_1EA82C5D0;
      uint64_t v50 = MEMORY[0x1F4188790](v46);
      uint64_t v58 = OUTLINED_FUNCTION_6_4(v50, v51, v52, v53, v54, v55, v56, v57, v82[0]);
      ((void (*)(char *))v48)(v58);
      if (os_log_type_enabled(v49, v47))
      {
        uint64_t v59 = swift_slowAlloc();
        uint64_t v60 = swift_slowAlloc();
        uint64_t v89 = v82;
        uint64_t v95 = v60;
        *(_DWORD *)uint64_t v59 = 136315138;
        sub_1D75DD724((unint64_t *)&unk_1EA82C660, MEMORY[0x1F418B840]);
        uint64_t v61 = sub_1D7661500();
        uint64_t v63 = (void (*)(void))v62;
        uint64_t v64 = sub_1D758DBE8(v61, v62, &v95);
        OUTLINED_FUNCTION_19_4(v64);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v65 = OUTLINED_FUNCTION_4_4();
        ((void (*)(uint64_t))v63)(v65);
        uint64_t v66 = "Successfully created packet tracing logger at %s";
LABEL_15:
        _os_log_impl(&dword_1D757C000, v49, v47, v66, (uint8_t *)v59, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_8_6();
        v63();
        OUTLINED_FUNCTION_8_6();
        v63();
        OUTLINED_FUNCTION_22_6();
        return v14;
      }
    }
    else
    {
      if (qword_1EA82AA70 != -1) {
        uint64_t v46 = swift_once();
      }
      uint64_t v49 = qword_1EA82C5D0;
      uint64_t v67 = MEMORY[0x1F4188790](v46);
      uint64_t v75 = OUTLINED_FUNCTION_6_4(v67, v68, v69, v70, v71, v72, v73, v74, v82[0]);
      ((void (*)(char *))v48)(v75);
      if (os_log_type_enabled(v49, v47))
      {
        uint64_t v59 = swift_slowAlloc();
        uint64_t v76 = swift_slowAlloc();
        uint64_t v89 = v82;
        uint64_t v95 = v76;
        *(_DWORD *)uint64_t v59 = 136315138;
        uint64_t v63 = (void (*)(void))(v59 + 12);
        sub_1D75DD724((unint64_t *)&unk_1EA82C660, MEMORY[0x1F418B840]);
        uint64_t v77 = sub_1D7661500();
        uint64_t v79 = sub_1D758DBE8(v77, v78, &v95);
        OUTLINED_FUNCTION_19_4(v79);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v80 = OUTLINED_FUNCTION_4_4();
        ((void (*)(uint64_t))(v59 + 12))(v80);
        uint64_t v66 = "Failed to create packet tracing logger at %s";
        goto LABEL_15;
      }
    }
    uint64_t v81 = OUTLINED_FUNCTION_4_4();
    ((void (*)(uint64_t))v48)(v81);
    OUTLINED_FUNCTION_8_6();
    v48();
    ((void (*)(char *, uint64_t))v48)(v83, v44);
    return v14;
  }
  __break(1u);
  return result;
}

unsigned char *sub_1D76292C0(unsigned char *result, uint64_t a2, unint64_t a3)
{
  if ((*result & 1) == 0)
  {
    os_log_type_t v5 = sub_1D7660DB0();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_1EA82C5D0;
    if (os_log_type_enabled((os_log_t)qword_1EA82C5D0, v5))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v10 = v8;
      *(_DWORD *)uint64_t v7 = 136446210;
      if (a3)
      {
        unint64_t v9 = a3;
      }
      else
      {
        a2 = 0x6E776F6E6B6E753CLL;
        unint64_t v9 = 0xE90000000000003ELL;
      }
      swift_bridgeObjectRetain();
      sub_1D758DBE8(a2, v9, &v10);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v6, v5, "Cleaning up virtual interface %{public}s due to throwing init", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v8, -1, -1);
      MEMORY[0x1D9474C60](v7, -1, -1);
    }
    return (unsigned char *)NEVirtualInterfaceInvalidate();
  }
  return result;
}

ValueMetadata *sub_1D7629484()
{
  uint64_t v0 = NEVirtualInterfaceCopyNexusInstances();
  if (!v0) {
    __break(1u);
  }
  uint64_t v1 = (void *)v0;
  type metadata accessor for CFUUID(0);
  sub_1D7660CF0();

  sub_1D75AF4C0();
  OUTLINED_FUNCTION_0();
  sub_1D7661690();
  sub_1D75B0D60();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0();
  sub_1D76616A0();
  swift_willThrow();
  return &type metadata for RemotePairingError;
}

uint64_t sub_1D76296DC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void *)(result + 88);
    if (v1)
    {
      uint64_t v2 = *(void *)(result + 96);
      *(void *)(result + 88) = 0;
      *(void *)(result + 96) = 0;
      swift_retain();
      sub_1D75940A4(v1);
      SkywalkChannelVirtualInterface.readPackets(completion:)(v1, v2);
      sub_1D75940A4(v1);
    }
    return swift_release();
  }
  return result;
}

void SkywalkChannelVirtualInterface.readPackets(completion:)(uint64_t a1, uint64_t a2)
{
  os_log_type_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  v7[4] = sub_1D762BF18;
  v7[5] = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1D75D6460;
  v7[3] = &block_descriptor_11;
  uint64_t v6 = _Block_copy(v7);
  swift_retain();
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v6);
}

void *sub_1D7629868()
{
  swift_beginAccess();
  uint64_t result = (void *)swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = result[13];
    if (v2)
    {
      uint64_t v4 = result[14];
      uint64_t v3 = result[15];
      result[13] = 0;
      result[14] = 0;
      result[15] = 0;
      sub_1D762C280(v2);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1D7628A84(v2);
      os_log_type_t v5 = (void *)swift_allocObject();
      v5[2] = v1;
      v5[3] = v3;
      v5[4] = v2;
      v5[5] = v4;
      aBlock[4] = sub_1D762C310;
      aBlock[5] = v5;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1D75D6460;
      aBlock[3] = &block_descriptor_30_1;
      uint64_t v6 = _Block_copy(aBlock);
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      swift_release();
      nw_queue_context_async_if_needed();
      _Block_release(v6);
      swift_release();
      swift_unknownObjectRelease();
      sub_1D7628A84(v2);
    }
    return (void *)swift_release();
  }
  return result;
}

void SkywalkChannelVirtualInterface.writePackets(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  v9[4] = sub_1D762BF40;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1D75D6460;
  v9[3] = &block_descriptor_10;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v8);
}

uint64_t SkywalkChannelVirtualInterface.deinit()
{
  uint64_t v1 = v0;
  os_log_type_t v2 = sub_1D7660DD0();
  if (qword_1EA82AA70 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1EA82C5D0;
  uint64_t v4 = v2;
  if (os_log_type_enabled((os_log_t)qword_1EA82C5D0, v2))
  {
    swift_retain();
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 136446210;
    uint64_t v6 = *(void *)(v1 + 16);
    unint64_t v7 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_1D758DBE8(v6, v7, aBlock);
    sub_1D7661020();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D757C000, v3, (os_log_type_t)v4, "Invalidating virtual interface ref for interface %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  NEVirtualInterfaceInvalidate();
  uint64_t v8 = *(void **)(v1 + 152);
  if (v8)
  {
    uint64_t v9 = sub_1D7660DE0();
    OUTLINED_FUNCTION_0_5();
    uint64_t v11 = v10;
    MEMORY[0x1F4188790](v12);
    OUTLINED_FUNCTION_8();
    aBlock[0] = MEMORY[0x1E4FBC860];
    sub_1D75DD724((unint64_t *)&unk_1EA82BC60, MEMORY[0x1F41AB050]);
    id v13 = v8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C6C0);
    sub_1D75D8A04((unint64_t *)&unk_1EA82BC70, (uint64_t *)&unk_1EA82C6C0);
    sub_1D7661090();
    sub_1D7660E30();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v9);
  }
  uint64_t v14 = *(void *)(v1 + 136);
  aBlock[4] = (uint64_t)sub_1D762BF4C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1D75D6460;
  aBlock[3] = (uint64_t)&block_descriptor_13_0;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v15);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v1 + 32);
  swift_release();

  sub_1D75940A4(*(void *)(v1 + 88));
  sub_1D7628A84(*(void *)(v1 + 104));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  return v1;
}

void sub_1D7629E4C()
{
}

uint64_t SkywalkChannelVirtualInterface.__deallocating_deinit()
{
  SkywalkChannelVirtualInterface.deinit();
  return MEMORY[0x1F4186488](v0, 160, 7);
}

uint64_t sub_1D7629EA8(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_1D76271BC(a2);
  uint64_t v9 = sub_1D765C330(v8);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 16);
  if (v9 >= v11) {
    return a3(0);
  }
  if (v9 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v12 = (2 * v11) | 1;
    swift_retain();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v14 = sub_1D7629F88(v13, a2 + 32, v9, v12);
    uint64_t v15 = a1[13];
    a1[13] = a3;
    a1[14] = a4;
    a1[15] = v14;
    return sub_1D7628A84(v15);
  }
  return result;
}

uint64_t sub_1D7629F88(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_1D76615B0();
  swift_unknownObjectRetain_n();
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x1E4FBC860];
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
    sub_1D761A8B0(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = MEMORY[0x1E4FBC860];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_1D762A070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1D765BA98((uint64_t *)&aBlock);
  uint64_t v6 = v25;
  long long v22 = aBlock;
  unint64_t v7 = *(void **)(a1 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v22;
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = a1;
  v19[1] = v6;
  *(void *)(v8 + 48) = a2;
  *(void *)(v8 + 56) = a3;
  uint64_t v27 = sub_1D762C17C;
  uint64_t v28 = v8;
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v25 = sub_1D75D6460;
  unint64_t v26 = &block_descriptor_21_0;
  uint64_t v20 = _Block_copy(&aBlock);
  uint64_t v21 = sub_1D7660950();
  uint64_t v9 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1D7660930();
  uint64_t v13 = sub_1D7660910();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1E4FBC860];
  sub_1D75DD724((unint64_t *)&qword_1EBDEBD90, MEMORY[0x1F41AAF98]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
  sub_1D75D8A04((unint64_t *)&qword_1EBDEBDF0, (uint64_t *)&unk_1EBDEBDE0);
  sub_1D7661090();
  uint64_t v17 = v20;
  MEMORY[0x1D9473560](0, v11, v16, v20);
  _Block_release(v17);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v21);
  return swift_release();
}

uint64_t sub_1D762A370(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void *a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v6 = a5;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1D762B998(v10, a1);
    uint64_t v13 = v12;
    uint64_t v14 = (void *)a4[19];
    if (v14)
    {
      uint64_t v15 = *(void *)(v12 + 16);
      if (v15)
      {
        uint64_t v30 = v6;
        uint64_t v31 = a2;
        uint64_t v32 = a3;
        id v33 = v14;
        swift_bridgeObjectRetain();
        uint64_t v29 = v13;
        uint64_t v16 = (uint64_t *)(v13 + 64);
        do
        {
          uint64_t v34 = v15;
          char v17 = *((unsigned char *)v16 - 8);
          uint64_t v18 = *v16;
          unint64_t v19 = v16[1];
          uint64_t v21 = v16[2];
          unint64_t v20 = v16[3];
          uint64_t v23 = v16[4];
          unint64_t v22 = v16[5];
          uint64_t v24 = v16[6];
          unint64_t v25 = v16[7];
          LODWORD(v35) = *((_DWORD *)v16 - 8);
          long long v36 = *(_OWORD *)(v16 - 3);
          char v37 = v17;
          uint64_t v38 = v18;
          unint64_t v39 = v19;
          uint64_t v40 = v21;
          unint64_t v41 = v20;
          uint64_t v42 = v23;
          unint64_t v43 = v22;
          uint64_t v44 = v24;
          unint64_t v45 = v25;
          sub_1D75934F4(v18, v19);
          sub_1D75934F4(v21, v20);
          sub_1D75DD424(v23, v22);
          sub_1D75934F4(v24, v25);
          sub_1D762A56C(&v35, (uint64_t)v33);
          sub_1D75933F0(v18, v19);
          sub_1D75933F0(v21, v20);
          sub_1D75DD450(v23, v22);
          sub_1D75933F0(v24, v25);
          v16 += 12;
          uint64_t v15 = v34 - 1;
        }
        while (v34 != 1);

        uint64_t v13 = v29;
        swift_bridgeObjectRelease();
        a3 = v32;
        uint64_t v6 = v30;
        a2 = v31;
      }
    }
    uint64_t v35 = v13;
    *(void *)&long long v36 = a2;
    *((void *)&v36 + 1) = a3;
    swift_retain();
    v6(&v35);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = a4[11];
    a4[11] = a5;
    a4[12] = a6;
    sub_1D75940A4(v27);
    uint64_t v28 = swift_retain();
    return a2(v28);
  }
}

void sub_1D762A56C(void *a1, uint64_t a2)
{
  unint64_t v3 = a1[9];
  if (v3 >> 60 != 15)
  {
    uint64_t v49 = v2;
    uint64_t v50 = a2;
    uint64_t v5 = a1[4];
    unint64_t v4 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[8];
    unint64_t v61 = a1[7];
    uint64_t v62 = v6;
    uint64_t v8 = sub_1D7660430();
    uint64_t v57 = &v45;
    OUTLINED_FUNCTION_0_5();
    uint64_t v60 = v9;
    MEMORY[0x1F4188790](v10);
    unint64_t v54 = ((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v55 = v11;
    uint64_t v56 = (char *)&v45 - v54;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C2A0);
    uint64_t v59 = &v45;
    uint64_t v13 = *(void *)(*(void *)(v12 - 8) + 64);
    MEMORY[0x1F4188790](v12 - 8);
    unint64_t v53 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v14 = (char *)&v45 - v53;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
    unint64_t v58 = (unint64_t)&v45;
    uint64_t v16 = *(void *)(*(void *)(v15 - 8) + 64);
    MEMORY[0x1F4188790](v15 - 8);
    unint64_t v52 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
    char v17 = (char *)&v45 - v52;
    uint64_t v51 = sub_1D76604A0();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v51);
    uint64_t v18 = v7;
    sub_1D75DD424(v7, v3);
    sub_1D75934F4(v5, v4);
    unint64_t v19 = v61;
    sub_1D75934F4(v62, v61);
    sub_1D75934F4(v5, v4);
    sub_1D7660440();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v8) == 1)
    {
      sub_1D75DD450(v18, v3);
      sub_1D75933F0(v5, v4);
      sub_1D75933F0(v62, v19);
      sub_1D75DD594((uint64_t)v14, (uint64_t *)&unk_1EA82C2A0);
LABEL_6:
      OUTLINED_FUNCTION_22_6();
      return;
    }
    unint64_t v47 = v18;
    uint64_t v48 = v5;
    unint64_t v58 = v3;
    uint64_t v20 = (uint64_t)v56;
    uint64_t v21 = v14;
    uint64_t v22 = v8;
    unint64_t v45 = *(void (**)(char *, char *, uint64_t))(v60 + 32);
    unint64_t v46 = v4;
    v45(v56, v21, v8);
    OUTLINED_FUNCTION_22_6();
    uint64_t v59 = &v45;
    uint64_t v24 = MEMORY[0x1F4188790](v23);
    unint64_t v25 = (char *)&v45 - v54;
    uint64_t v55 = (void (**)(void, void, void))&v45;
    uint64_t v26 = MEMORY[0x1F4188790](v24);
    uint64_t v27 = (char *)&v45 - v53;
    MEMORY[0x1F4188790](v26);
    __swift_storeEnumTagSinglePayload((uint64_t)&v45 - v52, 1, 1, v51);
    uint64_t v28 = v62;
    uint64_t v29 = OUTLINED_FUNCTION_26_5();
    sub_1D75934F4(v29, v30);
    OUTLINED_FUNCTION_26_5();
    sub_1D7660440();
    uint64_t v31 = v22;
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v22) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v20, v22);
      sub_1D75DD450(v47, v58);
      sub_1D75933F0(v48, v46);
      uint64_t v32 = OUTLINED_FUNCTION_26_5();
      sub_1D75933F0(v32, v33);
      sub_1D75DD594((uint64_t)v27, (uint64_t *)&unk_1EA82C2A0);
      goto LABEL_6;
    }
    v45(v25, v27, v22);
    unint64_t v34 = v58;
    uint64_t v35 = v47;
    switch(v58 >> 61)
    {
      case 1uLL:
        uint64_t v55 = (void (**)(void, void, void))(v47 >> 16);
        OUTLINED_FUNCTION_13();
        sub_1D7661100();
        sub_1D7660BC0();
        OUTLINED_FUNCTION_15_10();
        OUTLINED_FUNCTION_30_2();
        LOWORD(v63) = v35;
        uint64_t v20 = v35;
        uint64_t v35 = v31;
        sub_1D7661500();
        sub_1D7660BC0();
        unint64_t v34 = v58;
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_31_5();
        sub_1D7661200();
        OUTLINED_FUNCTION_30_2();
        LOWORD(v63) = (_WORD)v55;
        sub_1D7661500();
        OUTLINED_FUNCTION_15_4();
        swift_bridgeObjectRelease();
        goto LABEL_15;
      case 2uLL:
        uint64_t v55 = (void (**)(void, void, void))(v47 >> 8);
        OUTLINED_FUNCTION_13();
        sub_1D7661100();
        sub_1D7660BC0();
        uint64_t v20 = MEMORY[0x1E4FBBEE0];
        OUTLINED_FUNCTION_8_14();
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_8_14();
        sub_1D7660BC0();
        LOBYTE(v63) = v35;
        sub_1D7661500();
        OUTLINED_FUNCTION_29_7();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        LOBYTE(v63) = (_BYTE)v55;
        goto LABEL_10;
      case 3uLL:
        uint64_t v64 = 0;
        unint64_t v65 = 0xE000000000000000;
        sub_1D75DD438(v47, v58);
        sub_1D7661100();
        sub_1D7660BC0();
        LOBYTE(v63) = v35;
        sub_1D7661500();
        OUTLINED_FUNCTION_15_4();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        OUTLINED_FUNCTION_8_14();
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_8_14();
        sub_1D7660BC0();
        uint64_t v63 = v34 & 0x1FFFFFFFFFFFFFFFLL;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
        sub_1D7661200();
        sub_1D7660BC0();
        sub_1D75DD450(v35, v34);
        goto LABEL_13;
      case 4uLL:
        OUTLINED_FUNCTION_13();
        sub_1D7661100();
        sub_1D7660BC0();
        LOBYTE(v63) = v35;
        sub_1D7661500();
        OUTLINED_FUNCTION_15_4();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        OUTLINED_FUNCTION_15_10();
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_15_10();
LABEL_13:
        uint64_t v36 = v64;
        unint64_t v37 = v65;
        uint64_t v20 = v35;
        uint64_t v35 = v31;
        break;
      default:
        unint64_t v54 = HIDWORD(v47);
        uint64_t v55 = (void (**)(void, void, void))HIDWORD(v58);
        unint64_t v53 = HIWORD(v58);
        OUTLINED_FUNCTION_13();
        sub_1D7661100();
        sub_1D7660BC0();
        sub_1D7661200();
        OUTLINED_FUNCTION_30_2();
        LOWORD(v63) = v35;
        sub_1D7661500();
        OUTLINED_FUNCTION_29_7();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_26_1();
        OUTLINED_FUNCTION_31_5();
        sub_1D7661200();
        OUTLINED_FUNCTION_30_2();
        LOWORD(v63) = WORD1(v35);
        sub_1D7661500();
        OUTLINED_FUNCTION_15_4();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        sub_1D7622EC8();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        LODWORD(v63) = v54;
        unint64_t v34 = v58;
        sub_1D7661500();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        LODWORD(v63) = v34;
        sub_1D7661500();
        OUTLINED_FUNCTION_15_4();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
        LOWORD(v63) = (_WORD)v55;
        uint64_t v28 = v62;
LABEL_10:
        sub_1D7661500();
        OUTLINED_FUNCTION_15_4();
        swift_bridgeObjectRelease();
        sub_1D7660BC0();
LABEL_15:
        uint64_t v36 = v64;
        unint64_t v37 = v65;
        break;
    }
    uint64_t v38 = v49;
    uint64_t v64 = v36;
    unint64_t v65 = v37;
    sub_1D7660BC0();
    sub_1D75F5B6C();
    uint64_t v40 = v39;
    unint64_t v42 = v41;
    id v43 = *(id *)(v38 + 80);
    OS_dispatch_io.write(content:completingOn:completion:)(v40, v42, (uint64_t)v43, (uint64_t)nullsub_1, 0);

    sub_1D75933F0(v40, v42);
    sub_1D75DD450(v20, v34);
    sub_1D75933F0(v48, v46);
    sub_1D75933F0(v28, v61);
    uint64_t v44 = *(void (**)(char *, uint64_t))(v60 + 8);
    v44(v25, v35);
    v44(v56, v35);
    OUTLINED_FUNCTION_22_6();
  }
}

uint64_t sub_1D762AF74(int a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = sub_1D765FC50();
    uint64_t v46 = *(void *)(v4 - 8);
    uint64_t v5 = *(void *)(v46 + 64);
    MEMORY[0x1F4188790](v4);
    unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v7 = (char *)v40 - v6;
    int v45 = a1;
    uint64_t v8 = sub_1D7660020();
    if ((v8 & 0x100000000) != 0) {
      int v9 = 5;
    }
    else {
      int v9 = v8;
    }
    LODWORD(v50) = v9;
    sub_1D75B0C34(MEMORY[0x1E4FBC860]);
    sub_1D75DD724(qword_1EA82BCB0, MEMORY[0x1F418ACA8]);
    sub_1D765FD40();
    os_log_type_t v10 = sub_1D7660DB0();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_1EA82C5D0;
    uint64_t v12 = sub_1D765FD90();
    uint64_t v48 = v40;
    uint64_t v13 = *(void *)(v12 - 8);
    MEMORY[0x1F4188790](v12);
    uint64_t v15 = (char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, v12);
    unint64_t v47 = v40;
    MEMORY[0x1F4188790](v16);
    char v17 = (char *)v40 - v6;
    uint64_t v18 = v46;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v17, v7, v4);
    os_log_t v44 = v11;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v19 = swift_slowAlloc();
      id v43 = v7;
      int v41 = v10;
      uint64_t v20 = v19;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v50 = v42;
      *(_DWORD *)uint64_t v20 = 136446722;
      sub_1D75DD724((unint64_t *)&unk_1EA82C660, MEMORY[0x1F418B840]);
      uint64_t v21 = sub_1D7661500();
      uint64_t v49 = sub_1D758DBE8(v21, v22, &v50);
      v40[1] = &v50;
      sub_1D7661020();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      *(_WORD *)(v20 + 12) = 1024;
      LODWORD(v49) = v45;
      sub_1D7661020();
      *(_WORD *)(v20 + 18) = 2080;
      sub_1D75DD724((unint64_t *)&unk_1EA82C670, MEMORY[0x1F418ACA8]);
      uint64_t v23 = sub_1D7661620();
      uint64_t v49 = sub_1D758DBE8(v23, v24, &v50);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      unint64_t v25 = *(void (**)(char *, uint64_t))(v18 + 8);
      v25(v17, v4);
      _os_log_impl(&dword_1D757C000, v44, (os_log_type_t)v41, "%{public}s: IO cleanup error: %d, %s", (uint8_t *)v20, 0x1Cu);
      uint64_t v26 = v42;
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v26, -1, -1);
      MEMORY[0x1D9474C60](v20, -1, -1);
      return ((uint64_t (*)(char *, uint64_t))v25)(v43, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v39 = *(void (**)(char *, uint64_t))(v18 + 8);
      v39(v17, v4);
      return ((uint64_t (*)(char *, uint64_t))v39)(v7, v4);
    }
  }
  else
  {
    os_log_type_t v28 = sub_1D7660D90();
    if (qword_1EA82AA70 != -1) {
      swift_once();
    }
    uint64_t v29 = qword_1EA82C5D0;
    uint64_t v30 = sub_1D765FD90();
    uint64_t v31 = *(void *)(v30 - 8);
    MEMORY[0x1F4188790](v30);
    unint64_t v33 = (char *)v40 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, a2, v30);
    os_log_type_t v34 = v28;
    if (os_log_type_enabled(v29, v28))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v50 = v36;
      *(_DWORD *)uint64_t v35 = 136446210;
      sub_1D75DD724((unint64_t *)&unk_1EA82C660, MEMORY[0x1F418B840]);
      uint64_t v37 = sub_1D7661500();
      uint64_t v49 = sub_1D758DBE8(v37, v38, &v50);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
      _os_log_impl(&dword_1D757C000, v29, v34, "%{public}s: IO cleanup complete", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v36, -1, -1);
      return MEMORY[0x1D9474C60](v35, -1, -1);
    }
    else
    {
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v33, v30);
    }
  }
}

void SkywalkChannelVirtualInterface.getInterfaceStatistics()()
{
  uint64_t v0 = (void *)NEVirtualInterfaceCopyStatistics();
  if (v0)
  {
    id v1 = v0;
    sub_1D7660A20();

    sub_1D75AF4C0();
    OUTLINED_FUNCTION_0();
    sub_1D7661690();
    sub_1D7661100();
    sub_1D7660BC0();
    type metadata accessor for CFDictionary(0);
    id v2 = v1;
    sub_1D7660B60();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_18_4(0x726F6620u);
    sub_1D7660BC0();
    swift_bridgeObjectRetain();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D75B0D60();
    swift_allocError();
    sub_1D76616A0();
    swift_willThrow();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1D762B818()
{
  return static SkywalkChannelVirtualInterface.defaultMTU.getter();
}

uint64_t sub_1D762B830()
{
  return static SkywalkChannelVirtualInterface.maxSupportedMTU.getter();
}

uint64_t sub_1D762B848()
{
  return static SkywalkChannelVirtualInterface.maxSupportedPendingPackets.getter();
}

uint64_t sub_1D762B860()
{
  return SkywalkChannelVirtualInterface.interfaceName.getter();
}

uint64_t sub_1D762B884@<X0>(uint64_t a1@<X8>)
{
  return SkywalkChannelVirtualInterface.address.getter(a1);
}

uint64_t sub_1D762B8A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, unint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t result = SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32), a6, a7);
  if (!v8) {
    *a8 = result;
  }
  return result;
}

void sub_1D762B8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1D762B908(uint64_t a1, uint64_t a2)
{
}

void sub_1D762B92C()
{
}

uint64_t sub_1D762B950()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D762B988()
{
  return sub_1D76296DC();
}

void *sub_1D762B990()
{
  return sub_1D7629868();
}

uint64_t sub_1D762B998(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = a1;
  uint64_t v6 = sub_1D75EEED8(a1);
  uint64_t v7 = v6;
  uint64_t v43 = v8;
  uint64_t v9 = *(void *)(a2 + 16);
  if (v9)
  {
    uint64_t v41 = v5;
    uint64_t v42 = v6;
    swift_bridgeObjectRetain();
    uint64_t v45 = 0;
    os_log_type_t v10 = (unint64_t *)(a2 + 40);
    while (1)
    {
      uint64_t v11 = *(v10 - 1);
      unint64_t v12 = *v10;
      unint64_t v13 = *v10 >> 62;
      v10 += 2;
      switch(v13)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v11), v11))
          {
            __break(1u);
LABEL_31:
            __break(1u);
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
          uint64_t v14 = HIDWORD(v11) - (int)v11;
LABEL_8:
          sub_1D75934F4(v11, v12);
          sub_1D75934F4(v11, v12);
          sub_1D75934F4(v11, v12);
LABEL_9:
          if (v14 >= 40)
          {
            sub_1D75934F4(v11, v12);
            IPv6Header.init(_:)(v11, v12, (uint64_t)&v51);
            if (!v3)
            {
              unint64_t v47 = v52;
              unint64_t v48 = v51;
              char v46 = v53;
              uint64_t v30 = v54;
              unint64_t v31 = v55;
              uint64_t v33 = v56;
              unint64_t v32 = v57;
              sub_1D75934F4(v54, v55);
              sub_1D75934F4(v33, v32);
              if (qword_1EA82AA68 != -1) {
                swift_once();
              }
              unint64_t v58 = 0;
              os_log_t v44 = v10;
              if (byte_1EA83A380)
              {
                unint64_t v51 = v48;
                unint64_t v52 = v47;
                char v53 = v46;
                uint64_t v54 = v30;
                unint64_t v55 = v31;
                uint64_t v56 = v33;
                unint64_t v57 = v32;
                sub_1D75934F4(v11, v12);
                sub_1D75934F4(v30, v31);
                sub_1D75934F4(v33, v32);
                sub_1D762461C((uint64_t)&v51, v11, v12, &v49);
                uint64_t v35 = v49;
                unint64_t v34 = v50;
              }
              else
              {
                uint64_t v35 = 0;
                unint64_t v34 = 0xF000000000000000;
              }
              sub_1D75934F4(v30, v31);
              sub_1D75934F4(v33, v32);
              sub_1D75DD424(v35, v34);
              sub_1D75934F4(v11, v12);
              sub_1D75933F0(v11, v12);
              sub_1D75933F0(v30, v31);
              sub_1D75933F0(v33, v32);
              sub_1D75933F0(v30, v31);
              sub_1D75933F0(v33, v32);
              sub_1D75DD450(v35, v34);
              sub_1D75933F0(v11, v12);
              uint64_t v36 = v35;
              uint64_t v37 = v45;
              uint64_t v38 = v43 + 96 * v45;
              *(_DWORD *)uint64_t v38 = 30;
              *(void *)(v38 + 8) = v48;
              *(void *)(v38 + 16) = v47;
              *(unsigned char *)(v38 + 24) = v46;
              *(void *)(v38 + 32) = v30;
              *(void *)(v38 + 40) = v31;
              *(void *)(v38 + 48) = v33;
              *(void *)(v38 + 56) = v32;
              *(void *)(v38 + 64) = v36;
              *(void *)(v38 + 72) = v34;
              *(void *)(v38 + 80) = v11;
              *(void *)(v38 + 88) = v12;
              sub_1D75933F0(v11, v12);
              ++v45;
              if (__OFADD__(v37, 1)) {
                goto LABEL_32;
              }
              os_log_type_t v10 = v44;
              unint64_t v3 = v58;
              goto LABEL_18;
            }
            sub_1D75933F0(v11, v12);
            char v17 = v3;
          }
          else
          {
LABEL_10:
            sub_1D75AF4C0();
            sub_1D7661640();
            unint64_t v49 = v51;
            unint64_t v50 = v52;
            sub_1D75B0D60();
            char v17 = (void *)swift_allocError();
            sub_1D76616A0();
            swift_willThrow();
            sub_1D75933F0(v11, v12);
          }
          unint64_t v3 = 0;
          sub_1D75933F0(v11, v12);
          os_log_type_t v18 = sub_1D7660DB0();
          if (qword_1EA82AA70 != -1) {
            swift_once();
          }
          uint64_t v19 = qword_1EA82C5D0;
          if (os_log_type_enabled((os_log_t)qword_1EA82C5D0, v18))
          {
            id v20 = v17;
            id v21 = v17;
            uint64_t v22 = swift_slowAlloc();
            unint64_t v58 = 0;
            uint64_t v23 = v22;
            unint64_t v24 = v10;
            unint64_t v25 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v23 = 138543362;
            id v26 = v17;
            uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v23 + 4) = v27;
            *unint64_t v25 = v27;

            _os_log_impl(&dword_1D757C000, v19, v18, "Discarding packet data as it is not a valid IPv6 packet: %{public}@", (uint8_t *)v23, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C650);
            swift_arrayDestroy();
            os_log_type_t v28 = v25;
            os_log_type_t v10 = v24;
            MEMORY[0x1D9474C60](v28, -1, -1);
            uint64_t v29 = v23;
            unint64_t v3 = v58;
            MEMORY[0x1D9474C60](v29, -1, -1);
          }
          sub_1D75933F0(v11, v12);

LABEL_18:
          if (!--v9)
          {
            swift_bridgeObjectRelease();
            uint64_t v5 = v41;
            uint64_t v7 = v42;
            uint64_t v39 = v45;
            goto LABEL_28;
          }
          break;
        case 2uLL:
          uint64_t v16 = *(void *)(v11 + 16);
          uint64_t v15 = *(void *)(v11 + 24);
          uint64_t v14 = v15 - v16;
          if (!__OFSUB__(v15, v16)) {
            goto LABEL_8;
          }
          goto LABEL_31;
        case 3uLL:
          goto LABEL_10;
        default:
          uint64_t v14 = BYTE6(v12);
          goto LABEL_9;
      }
    }
  }
  uint64_t v39 = 0;
LABEL_28:
  if (v39 > v5)
  {
LABEL_33:
    __break(1u);
    JUMPOUT(0x1D762BEC8);
  }
  *(void *)(v7 + 16) = v39;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1D762BED8()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D762BF18()
{
  return sub_1D762A070(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_1D762BF40()
{
  return sub_1D7629EA8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32), *(void *)(v0 + 40));
}

void sub_1D762BF4C()
{
}

uint64_t type metadata accessor for SkywalkChannelVirtualInterface()
{
  return self;
}

uint64_t method lookup function for SkywalkChannelVirtualInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SkywalkChannelVirtualInterface);
}

uint64_t dispatch thunk of SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, unint64_t))(v5 + 160))(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32));
}

uint64_t destroy for PendingPacketWrite()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void *_s19RemotePairingDevice18PendingPacketWriteVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PendingPacketWrite(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PendingPacketWrite(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PendingPacketWrite()
{
  return &type metadata for PendingPacketWrite;
}

unint64_t sub_1D762C108(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_1D762C12C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1D762C17C()
{
  return sub_1D762A370(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void (**)(void))(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_1D762C18C()
{
  sub_1D765FD90();
  OUTLINED_FUNCTION_37_0();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1D762C210(int a1)
{
  uint64_t v3 = *(void *)(sub_1D765FD90() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_1D762AF74(a1, v4);
}

uint64_t sub_1D762C280(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t objectdestroy_6Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1D762C310()
{
  SkywalkChannelVirtualInterface.writePackets(_:completion:)(v0[3], v0[4], v0[5]);
}

unint64_t OUTLINED_FUNCTION_12_7()
{
  uint64_t v2 = *(void *)(v0 - 160);
  *(void *)(v0 - 128) = *(void *)(v0 - 168);
  *(void *)(v0 - 120) = v2;
  return sub_1D75B0D60();
}

BOOL OUTLINED_FUNCTION_25_4(os_log_type_t a1)
{
  uint64_t v4 = *(NSObject **)(v1 + 1488);
  return os_log_type_enabled(v4, a1);
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  return v0;
}

unsigned char *OUTLINED_FUNCTION_27_7()
{
  return sub_1D76292C0((unsigned char *)(v2 - 65), v1, v0);
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  return v0;
}

BOOL sub_1D762C3E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)a1;
      uint64_t v2 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v2 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      return v3 == v2;
    default:
      uint64_t v3 = 0;
      uint64_t v2 = BYTE6(a2);
      break;
  }
  return v3 == v2;
}

uint64_t sub_1D762C444(uint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (*a2 < a3)
  {
    uint64_t v6 = (void *)result;
    if (((unint64_t)", device supports >=" & 0x2000000000000000) == 0
      || (((unint64_t)", device supports >=" >> 56) & 0xF) != 0)
    {
      while (1)
      {
        uint64_t v7 = sub_1D7660BA0();
        if (v7 < 0) {
          break;
        }
        unint64_t v8 = v7;
        if (!v7) {
          goto LABEL_13;
        }
        v12[0] = 0;
        MEMORY[0x1D9474C80](v12, 8);
        if (v8 > v12[0] * v8)
        {
          unint64_t v9 = -(uint64_t)v8 % v8;
          while (v9 > v12[0] * v8)
          {
            v12[0] = 0;
            MEMORY[0x1D9474C80](v12, 8);
          }
        }
        sub_1D7660BB0();
        uint64_t result = sub_1D7660C30();
        os_log_type_t v10 = (uint64_t *)(*v6 + 16 * v3);
        uint64_t *v10 = result;
        v10[1] = v11;
        if (++v3 >= a3)
        {
          *a2 = a3;
          return result;
        }
      }
      __break(1u);
LABEL_13:
      __break(1u);
    }
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_1D7661100();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1D7661260();
    __break(1u);
  }
  return result;
}

uint64_t NWConnection.receive(minLength:maxLength:completion:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = (void *)swift_allocObject();
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0;
  swift_retain();
  sub_1D76605E0();
  return swift_release();
}

uint64_t sub_1D762C684()
{
  sub_1D75AEF50(0, (unint64_t *)&qword_1EBDEC4C0);
  uint64_t result = sub_1D7660FE0();
  qword_1EA82C680 = result;
  return result;
}

id powerLog.getter()
{
  if (qword_1EA82AA98 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EA82C680;
  return v0;
}

uint64_t sub_1D762C750()
{
  sub_1D75AEF50(0, (unint64_t *)&qword_1EBDEC4C0);
  uint64_t result = sub_1D7660FE0();
  qword_1EA82C688 = result;
  return result;
}

RemotePairingDevice::TransportProtocolType_optional __swiftcall TransportProtocolType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1D76612C0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t TransportProtocolType.rawValue.getter()
{
  uint64_t v1 = 7365492;
  if (*v0 != 1) {
    uint64_t v1 = 7365749;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1667855729;
  }
}

uint64_t sub_1D762C870(char *a1, char *a2)
{
  return sub_1D75B9704(*a1, *a2);
}

uint64_t sub_1D762C87C()
{
  return sub_1D75BA214();
}

uint64_t sub_1D762C884()
{
  return sub_1D75BA338();
}

uint64_t sub_1D762C88C()
{
  return sub_1D75BAA88();
}

RemotePairingDevice::TransportProtocolType_optional sub_1D762C894(Swift::String *a1)
{
  return TransportProtocolType.init(rawValue:)(*a1);
}

uint64_t sub_1D762C8A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TransportProtocolType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D762C8C8()
{
  return sub_1D7660CC0();
}

uint64_t sub_1D762C928()
{
  return sub_1D7660CA0();
}

BOOL static TunnelConnectionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TunnelConnectionState.hash(into:)()
{
  return sub_1D7661740();
}

uint64_t TunnelConnectionState.hashValue.getter()
{
  return sub_1D7661760();
}

uint64_t PeerConnectionInfo.description.getter()
{
  uint64_t v2 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  sub_1D7660BC0();
  sub_1D7661500();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  sub_1D7660BC0();
  return v2;
}

uint64_t PeerConnectionInfo.init(owningPID:owningProcessName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_1D762CAA4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4950676E696E776FLL && a2 == 0xE900000000000044;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001D7676FE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D762CBA0(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x4950676E696E776FLL;
  }
}

uint64_t sub_1D762CBE0()
{
  return sub_1D762CBA0(*v0);
}

uint64_t sub_1D762CBE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D762CAA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D762CC10(uint64_t a1)
{
  unint64_t v2 = sub_1D762F028();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D762CC4C(uint64_t a1)
{
  unint64_t v2 = sub_1D762F028();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PeerConnectionInfo.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C6A0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1D762F028();
  sub_1D76617C0();
  sub_1D76614A0();
  if (!v1) {
    sub_1D7661450();
  }
  uint64_t v4 = OUTLINED_FUNCTION_23_4();
  return v5(v4);
}

uint64_t PeerConnectionInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C6B0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1D762F028();
  sub_1D76617A0();
  if (!v2)
  {
    int v6 = sub_1D7661390();
    uint64_t v8 = sub_1D7661340();
    uint64_t v10 = v9;
    uint64_t v11 = OUTLINED_FUNCTION_29_8();
    v12(v11);
    *(_DWORD *)a2 = v6;
    *(void *)(a2 + 8) = v8;
    *(void *)(a2 + 16) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
}

uint64_t sub_1D762CF08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PeerConnectionInfo.init(from:)(a1, a2);
}

uint64_t sub_1D762CF20(void *a1)
{
  return PeerConnectionInfo.encode(to:)(a1);
}

uint64_t static TunnelConnectionIdentifierCategory.numberOfCharacters.getter()
{
  return 8;
}

uint64_t static TunnelConnectionIdentifierCategory.prefix.getter()
{
  return 1852793716;
}

uint64_t sub_1D762CF54()
{
  return 1852793716;
}

uint64_t sub_1D762CF64()
{
  uint64_t v1 = sub_1D7660B50();
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_8();
  sub_1D7660B40();
  uint64_t v5 = sub_1D7660B20();
  unint64_t v7 = v6;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  if (v7 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_1EA82C690 = v5;
    *(void *)algn_1EA82C698 = v7;
  }
  return result;
}

uint64_t StreamBasedTunnelConnection.send(packets:completion:)(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5;
  unint64_t v6 = a2;
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v8 = (unint64_t *)(swift_bridgeObjectRetain() + 120);
    do
    {
      uint64_t v9 = *(v8 - 7);
      unint64_t v10 = *(v8 - 6);
      uint64_t v12 = *(v8 - 5);
      unint64_t v11 = *(v8 - 4);
      uint64_t v14 = *(v8 - 3);
      unint64_t v13 = *(v8 - 2);
      uint64_t v15 = *(v8 - 1);
      unint64_t v16 = *v8;
      sub_1D75934F4(v9, v10);
      sub_1D75934F4(v12, v11);
      sub_1D75DD424(v14, v13);
      sub_1D75934F4(v15, v16);
      sub_1D765FF10();
      sub_1D75933F0(v9, v10);
      sub_1D75933F0(v12, v11);
      sub_1D75DD450(v14, v13);
      sub_1D75933F0(v15, v16);
      v8 += 12;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    uint64_t v5 = a5;
    unint64_t v6 = a2;
  }
  uint64_t v17 = OUTLINED_FUNCTION_216();
  if (sub_1D762C3E0(v17, v18))
  {
    v6(0);
  }
  else
  {
    uint64_t v19 = *(void (**)(uint64_t))(v5 + 88);
    uint64_t v20 = OUTLINED_FUNCTION_216();
    sub_1D75934F4(v20, v21);
    uint64_t v22 = OUTLINED_FUNCTION_216();
    v19(v22);
    uint64_t v23 = OUTLINED_FUNCTION_216();
    sub_1D75933F0(v23, v24);
  }
  uint64_t v25 = OUTLINED_FUNCTION_216();
  return sub_1D75933F0(v25, v26);
}

uint64_t StreamBasedTunnelConnection.receivePackets(completion:)()
{
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v0 + 64))(v2, v0);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v2;
  v7[3] = v0;
  v7[4] = v1;
  v7[5] = v4;
  void v7[6] = v3;
  uint64_t v8 = *(void (**)(void))(v0 + 96);
  swift_unknownObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_28_7();
  v8();
  OUTLINED_FUNCTION_84();
  return swift_release();
}

void sub_1D762D2BC(id a1, unint64_t a2, char a3, uint64_t a4, void (*a5)(id, uint64_t))
{
  id v6 = a1;
  if (a3)
  {
    id v9 = a1;
    uint64_t v8 = 1;
  }
  else
  {
    sub_1D75934F4((uint64_t)a1, a2);
    sub_1D762D38C((uint64_t)&v10);
    sub_1D75D9140(v6, a2, 0);
    id v6 = v10;
    uint64_t v8 = v11;
  }
  a5(v6, v8);
  sub_1D75ABD24(v6, v8);
}

uint64_t sub_1D762D38C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1D762D6CC((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1D76315C0);
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1D762D3EC@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, uint64_t *a6@<X8>)
{
  uint64_t result = sub_1D762D444(a1, a2, a3, a4);
  if (v6) {
    *a5 = v6;
  }
  else {
    *a6 = result;
  }
  return result;
}

uint64_t sub_1D762D444(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if (v11 >> 60 == 15)
  {
    uint64_t v12 = sub_1D75934F4(a1, a2);
  }
  else
  {
    uint64_t v13 = v10;
    unint64_t v14 = v11;
    uint64_t v23 = v10;
    unint64_t v24 = v11;
    sub_1D75AC3B4(v10, v11);
    sub_1D75934F4(a1, a2);
    sub_1D762DFF4(a1, a2);
    sub_1D75933F0(a1, a2);
    uint64_t v12 = sub_1D75941DC(v13, v14);
    a1 = v23;
    a2 = v24;
  }
  uint64_t v23 = MEMORY[0x1E4FBC860];
  MEMORY[0x1F4188790](v12);
  long long v22[2] = a3;
  v22[3] = a4;
  v22[4] = &v23;
  uint64_t v22[5] = v4;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x1D762D6BCLL);
      }
      swift_retain();
      sub_1D76314A8((int)a1, a1 >> 32, sub_1D76315E8);
      uint64_t v18 = v5;
      sub_1D75933F0(a1, a2);
      break;
    case 2uLL:
      uint64_t v19 = *(void *)(a1 + 16);
      uint64_t v20 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      sub_1D76314A8(v19, v20, sub_1D76315E8);
      uint64_t v18 = v5;
      swift_release();
      swift_release();
      break;
    case 3uLL:
      uint64_t v17 = 0;
      uint64_t v16 = 0;
      uint64_t v15 = 0;
      goto LABEL_10;
    default:
      uint64_t v15 = BYTE6(a2);
      uint64_t v16 = a2 & 0xFFFFFFFFFFFFLL;
      uint64_t v17 = a1;
LABEL_10:
      sub_1D762E310(v17, v16, (uint64_t (*)(uint64_t *, char *))sub_1D76315E8, (uint64_t)v22, v15);
      uint64_t v18 = v5;
      break;
  }
  sub_1D75933F0(a1, a2);
  if (v18) {
    return swift_bridgeObjectRelease();
  }
  else {
    return v23;
  }
}

uint64_t sub_1D762D6CC(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  a1(&v3, &v2);
  return v3;
}

uint64_t sub_1D762D72C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  if (!a1)
  {
LABEL_35:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48))(40, a5, a6);
    return (*(uint64_t (**)(void, unint64_t, uint64_t, uint64_t))(a6 + 24))(0, 0xF000000000000000, a5, a6);
  }
  uint64_t v9 = a1;
  while (1)
  {
    uint64_t v10 = a2 - v9;
    if (a2 - v9 < 40)
    {
      if (a2 == v9) {
        goto LABEL_35;
      }
      uint64_t result = 40 - v10;
      if (__OFSUB__(40, v10)) {
        goto LABEL_41;
      }
      uint64_t v35 = a6;
      uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48);
LABEL_38:
      v36(result, a5, v35);
      uint64_t v37 = sub_1D75F61FC(v9, a2);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 24))(v37, v38, a5, v35);
    }
    uint64_t v11 = sub_1D7631608(0, a2 - v9, v9, a2);
    uint64_t v48 = a2 - v9;
    if ((unint64_t)v11 >= 0x28) {
      uint64_t v12 = 40;
    }
    else {
      uint64_t v12 = a2 - v9;
    }
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C718);
    *((void *)&v54 + 1) = v13;
    unint64_t v14 = sub_1D763163C();
    unint64_t v55 = v14;
    uint64_t v15 = (void *)swift_allocObject();
    *(void *)&long long v53 = v15;
    v15[2] = 0;
    v15[3] = v12;
    v15[4] = v9;
    v15[5] = a2;
    long long v50 = *(_OWORD *)__swift_project_boxed_opaque_existential_0Tm(&v53, v13);
    sub_1D7661700();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v53);
    uint64_t result = IPv6Header.init(_:)(v51, v52, (uint64_t)&v56);
    if (v7) {
      return result;
    }
    uint64_t v45 = v57;
    char v46 = v56;
    unint64_t v17 = (unint64_t)v56 + v57;
    if (__OFADD__(v56, v57)) {
      break;
    }
    uint64_t v47 = v9;
    uint64_t v18 = v59;
    unint64_t v19 = v60;
    uint64_t v49 = v61;
    unint64_t v63 = v62;
    if ((uint64_t)v17 > v48)
    {
      sub_1D75933F0(v59, v60);
      sub_1D75933F0(v49, v63);
      uint64_t v9 = v47;
      if (a2 == v47) {
        goto LABEL_35;
      }
      uint64_t v35 = a6;
      uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48);
      uint64_t result = v17 - v48;
      goto LABEL_38;
    }
    if ((v17 & 0x8000000000000000) != 0) {
      goto LABEL_40;
    }
    char v44 = v58;
    if (v11 >= v17) {
      uint64_t v20 = (char *)v56 + v57;
    }
    else {
      uint64_t v20 = (char *)v48;
    }
    if (v11 < 0 || v17 == 0) {
      uint64_t v22 = (char *)v56 + v57;
    }
    else {
      uint64_t v22 = v20;
    }
    uint64_t v59 = v13;
    unint64_t v60 = v14;
    uint64_t v23 = (void *)swift_allocObject();
    uint64_t v56 = v23;
    long long v23[2] = 0;
    _OWORD v23[3] = v22;
    v23[4] = v47;
    uint64_t v23[5] = a2;
    unint64_t v24 = (long long *)__swift_project_boxed_opaque_existential_0Tm(&v56, v13);
    long long v25 = v24[1];
    long long v53 = *v24;
    long long v54 = v25;
    sub_1D7661700();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v56);
    sub_1D75934F4(v18, v19);
    unint64_t v26 = v63;
    sub_1D75934F4(v49, v63);
    sub_1D75934F4(v18, v19);
    sub_1D75934F4(v49, v26);
    sub_1D75934F4(v50, *((unint64_t *)&v50 + 1));
    if (qword_1EA82AA68 != -1) {
      swift_once();
    }
    if (byte_1EA83A380 == 1)
    {
      uint64_t v56 = v46;
      uint64_t v57 = v45;
      char v58 = v44;
      uint64_t v59 = v18;
      unint64_t v60 = v19;
      uint64_t v61 = v49;
      unint64_t v62 = v63;
      sub_1D762461C((uint64_t)&v56, v50, *((unint64_t *)&v50 + 1), (unint64_t *)&v53);
      unint64_t v27 = *((void *)&v53 + 1);
      uint64_t v43 = v53;
    }
    else
    {
      sub_1D75933F0(v50, *((unint64_t *)&v50 + 1));
      sub_1D75933F0(v18, v19);
      sub_1D75933F0(v49, v63);
      uint64_t v43 = 0;
      unint64_t v27 = 0xF000000000000000;
    }
    unint64_t v42 = v27;
    uint64_t v28 = *a3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1D75D00F0();
      uint64_t v28 = v33;
      *a3 = v33;
    }
    unint64_t v30 = *(void *)(v28 + 16);
    if (v30 >= *(void *)(v28 + 24) >> 1)
    {
      sub_1D75D00F0();
      uint64_t v28 = v34;
    }
    *(void *)(v28 + 16) = v30 + 1;
    uint64_t v31 = v28 + 96 * v30;
    *(_DWORD *)(v31 + 32) = 30;
    *(void *)(v31 + 40) = v46;
    *(void *)(v31 + 48) = v45;
    *(unsigned char *)(v31 + 56) = v44;
    *(void *)(v31 + 64) = v18;
    *(void *)(v31 + 72) = v19;
    unint64_t v32 = v63;
    *(void *)(v31 + 80) = v49;
    *(void *)(v31 + 88) = v32;
    *(void *)(v31 + 96) = v43;
    *(void *)(v31 + 104) = v42;
    *(_OWORD *)(v31 + 112) = v50;
    *a3 = v28;
    sub_1D75933F0(v18, v19);
    sub_1D75933F0(v49, v32);
    uint64_t v9 = v47 + v17;
    a2 = v47 + v48;
    uint64_t v7 = 0;
    if (!v47) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void StreamBasedTunnelConnection.send(controlMessage:completion:)()
{
  OUTLINED_FUNCTION_97();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_7();
  uint64_t v13 = v12 - v11;
  sub_1D75E9098(v9, v12 - v11);
  sub_1D765FCB0();
  swift_allocObject();
  sub_1D765FCA0();
  sub_1D76313D0((unint64_t *)&qword_1EA82C6B8);
  uint64_t v14 = sub_1D765FC90();
  unint64_t v16 = v15;
  swift_release();
  sub_1D75934F4(v14, v16);
  if (sub_1D765FF00() >= 0x10000)
  {
    sub_1D7661100();
    sub_1D7660BC0();
    sub_1D765FF00();
    OUTLINED_FUNCTION_31_6();
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7660BC0();
    sub_1D75AF4C0();
    sub_1D7661640();
    sub_1D75B0D60();
    unint64_t v17 = (void *)OUTLINED_FUNCTION_3_7();
    sub_1D76616A0();
    v7(v17);

    OUTLINED_FUNCTION_31_6();
    sub_1D762F0CC(v13);
LABEL_3:
    OUTLINED_FUNCTION_84();
    return;
  }
  if (qword_1EA82AAA8 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_1EA82C690;
  unint64_t v22 = *(void *)algn_1EA82C698;
  sub_1D75934F4(qword_1EA82C690, *(unint64_t *)algn_1EA82C698);
  unint64_t v18 = sub_1D765FF00();
  if ((v18 & 0x8000000000000000) == 0 && v18 < 0x10000)
  {
    uint64_t v20 = v7;
    sub_1D762E1A0(bswap32(v18) >> 16);
    if (sub_1D765FF00() == 10)
    {
      sub_1D765FF10();
      OUTLINED_FUNCTION_31_6();
      unint64_t v19 = *(void (**)(uint64_t, unint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v1 + 88);
      sub_1D75934F4(v21, v22);
      v19(v21, v22, (void (*)(void))v20, v5, v3, v1);
      sub_1D75933F0(v21, v22);
      OUTLINED_FUNCTION_31_6();
      sub_1D762F0CC(v13);
      sub_1D75933F0(v21, v22);
      goto LABEL_3;
    }
    __break(1u);
  }
  OUTLINED_FUNCTION_0_1();
  sub_1D7661250();
  __break(1u);
}

uint64_t sub_1D762DFF4(uint64_t a1, unint64_t a2)
{
  v10[3] = MEMORY[0x1E4F277B8];
  v10[4] = MEMORY[0x1E4F277A8];
  v10[0] = a1;
  v10[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_0Tm(v10, MEMORY[0x1E4F277B8]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
        JUMPOUT(0x1D762E190);
      }
      sub_1D75934F4(a1, a2);
      sub_1D75934F4(v5, v6);
      sub_1D7631414((int)v5, v5 >> 32);
      sub_1D75933F0(v5, v6);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v8 = *(void *)(v5 + 24);
      sub_1D75934F4(a1, a2);
      swift_retain();
      swift_retain();
      sub_1D7631414(v7, v8);
      swift_release();
      swift_release();
      break;
    default:
      sub_1D75934F4(a1, a2);
      sub_1D762E23C();
      break;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

uint64_t sub_1D762E1A0(__int16 a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  __int16 v2 = a1;
  v3[3] = MEMORY[0x1E4FBB2B8];
  v3[4] = MEMORY[0x1E4F27EF8];
  v3[0] = &v2;
  v3[1] = v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, MEMORY[0x1E4FBB2B8]);
  sub_1D765FE60();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
}

uint64_t sub_1D762E23C()
{
  return sub_1D765FE60();
}

uint64_t sub_1D762E310(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, char *), uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1;
  __int16 v7 = a2;
  char v8 = BYTE2(a2);
  char v9 = BYTE3(a2);
  char v10 = BYTE4(a2);
  char v11 = BYTE5(a2);
  return a3(&v6, (char *)&v6 + a5);
}

uint64_t StreamBasedTunnelConnection.receiveControlMessage(completion:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v2;
  v5[3] = v0;
  v5[4] = v4;
  v5[5] = v3;
  v5[6] = v1;
  uint64_t v6 = *(void (**)(void))(v0 + 96);
  swift_retain();
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_28_7();
  v6();
  return swift_release();
}

uint64_t sub_1D762E490(uint64_t a1, unint64_t a2, char a3, void (*a4)(void *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
  MEMORY[0x1F4188790](v16);
  unint64_t v18 = (uint64_t *)((char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    id v27 = (id)a1;
    swift_willThrow();
    uint64_t v28 = (void *)a1;
LABEL_34:
    *unint64_t v18 = v28;
    swift_storeEnumTagMultiPayload();
    id v38 = v28;
    a4(v18);

    return sub_1D75D505C((uint64_t)v18, qword_1EA82C420);
  }
  uint64_t v47 = a6;
  uint64_t v48 = a7;
  uint64_t v49 = a8;
  sub_1D75934F4(a1, a2);
  if (qword_1EA82AAA8 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_1EA82C690;
  unint64_t v20 = *(void *)algn_1EA82C698;
  sub_1D75934F4(qword_1EA82C690, *(unint64_t *)algn_1EA82C698);
  sub_1D7593208();
  char v22 = v21;
  sub_1D75933F0(v19, v20);
  if ((v22 & 1) == 0)
  {
LABEL_33:
    sub_1D75AF4C0();
    sub_1D7661640();
    uint64_t v50 = v52;
    uint64_t v51 = v53;
    sub_1D75B0D60();
    uint64_t v28 = (void *)swift_allocError();
    sub_1D76616A0();
    swift_willThrow();
    sub_1D75D9140((id)a1, a2, 0);
    goto LABEL_34;
  }
  unint64_t v23 = a2 >> 62;
  uint64_t v24 = sub_1D765FF00();
  uint64_t v25 = v24;
  uint64_t v26 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v26 = (int)a1;
      break;
    case 2uLL:
      uint64_t v26 = *(void *)(a1 + 16);
      break;
    default:
      break;
  }
  BOOL v29 = __OFADD__(v26, v24);
  uint64_t v30 = v26 + v24;
  if (v29)
  {
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v31 = v30 + 2;
  if (__OFADD__(v30, 2))
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    JUMPOUT(0x1D762E990);
  }
  uint64_t v32 = BYTE6(a2);
  switch(a2 >> 62)
  {
    case 1uLL:
      if (v30 < (int)a1) {
        goto LABEL_33;
      }
      goto LABEL_27;
    case 2uLL:
      if (v30 < *(void *)(a1 + 16)) {
        goto LABEL_33;
      }
      if (v23 == 2) {
        uint64_t v33 = *(void *)(a1 + 24);
      }
      else {
LABEL_27:
      }
        uint64_t v33 = a1 >> 32;
      goto LABEL_28;
    case 3uLL:
      if (v30 < 0) {
        goto LABEL_33;
      }
      if (v31 > 0 || __OFSUB__(v30, v31)) {
        goto LABEL_33;
      }
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v32 = 0;
      goto LABEL_40;
    default:
      if (v30 < 0) {
        goto LABEL_33;
      }
      uint64_t v33 = BYTE6(a2);
LABEL_28:
      if (v30 >= v31 || v33 < v31) {
        goto LABEL_33;
      }
      if (!v23)
      {
        uint64_t v36 = a2 & 0xFFFFFFFFFFFFLL;
        uint64_t v35 = a1;
LABEL_40:
        unsigned __int16 v40 = sub_1D75F04E4(v35, v36, v32, v25);
        sub_1D75D9140((id)a1, a2, 0);
        goto LABEL_43;
      }
      if (v23 != 1)
      {
        uint64_t v41 = *(void *)(a1 + 16);
        uint64_t v42 = *(void *)(a1 + 24);
        swift_retain();
        swift_retain();
        unsigned __int16 v40 = sub_1D75F05BC(v41, v42, a2 & 0x3FFFFFFFFFFFFFFFLL, v25);
        swift_release();
        swift_release();
        goto LABEL_42;
      }
      if (a1 >> 32 < (int)a1) {
        goto LABEL_48;
      }
      swift_retain();
      unsigned __int16 v40 = sub_1D75F05BC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, v25);
      sub_1D75D9140((id)a1, a2, 0);
LABEL_42:
      sub_1D75D9140((id)a1, a2, 0);
LABEL_43:
      uint64_t v43 = v40;
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = a4;
      *(void *)(v44 + 24) = a5;
      uint64_t v45 = v49;
      char v46 = *(void (**)(uint64_t, uint64_t, void (*)(), uint64_t, uint64_t, uint64_t))(v49 + 96);
      swift_retain();
      v46(v43, v43, sub_1D7631588, v44, v48, v45);
      return swift_release();
  }
}

void sub_1D762E9B0()
{
  OUTLINED_FUNCTION_97();
  uint64_t v2 = v1;
  char v4 = v3;
  unint64_t v6 = v5;
  char v8 = v7;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_7();
  uint64_t v13 = (void *)(v12 - v11);
  if (v4)
  {
    *uint64_t v13 = v8;
    swift_storeEnumTagMultiPayload();
    id v14 = v8;
    uint64_t v15 = OUTLINED_FUNCTION_24_6();
    v2(v15);
    sub_1D75D505C((uint64_t)v13, qword_1EA82C420);
  }
  else
  {
    sub_1D765FC80();
    swift_allocObject();
    sub_1D75934F4((uint64_t)v8, v6);
    sub_1D765FC70();
    sub_1D76313D0((unint64_t *)&unk_1EA82C708);
    sub_1D765FC60();
    sub_1D75E9098(v0, (uint64_t)v13);
    swift_storeEnumTagMultiPayload();
    uint64_t v16 = OUTLINED_FUNCTION_24_6();
    v2(v16);
    swift_release();
    sub_1D75D9140(v8, v6, 0);
    sub_1D75D505C((uint64_t)v13, qword_1EA82C420);
    sub_1D762F0CC(v0);
  }
  OUTLINED_FUNCTION_84();
}

void sub_1D762EBB8()
{
  OUTLINED_FUNCTION_97();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  __int16 v7 = v6;
  uint64_t v25 = v8;
  uint64_t v24 = v9;
  if ((v10 & 1) != 0 && v1) {
    sub_1D7660510();
  }
  uint64_t v11 = sub_1D7660800();
  OUTLINED_FUNCTION_0_5();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_27();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C148);
  MEMORY[0x1F4188790](v15 - 8);
  OUTLINED_FUNCTION_1_7();
  uint64_t v18 = v17 - v16;
  sub_1D76316AC(v3, v17 - v16);
  if (__swift_getEnumTagSinglePayload(v18, 1, v11) != 1)
  {
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
    v19(v0, v18, v11);
    sub_1D7631714((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DAF0]);
    __int16 v7 = (void *)swift_allocError();
    v19(v20, v0, v11);
    uint64_t v22 = 1;
    unint64_t v5 = 0;
    goto LABEL_11;
  }
  sub_1D75D505C(v18, &qword_1EA82C148);
  if (v5 >> 60 == 15)
  {
    sub_1D75AF4C0();
    sub_1D7661640();
    sub_1D75B0D60();
    __int16 v7 = (void *)OUTLINED_FUNCTION_3_7();
    sub_1D76616A0();
    unint64_t v5 = 0;
    uint64_t v22 = 1;
LABEL_11:
    char v21 = v25;
    goto LABEL_12;
  }
  sub_1D75934F4((uint64_t)v7, v5);
  if (sub_1D765FF00() >= v24)
  {
    uint64_t v22 = 0;
    goto LABEL_11;
  }
  char v21 = v25;
  sub_1D7661100();
  sub_1D7660BC0();
  sub_1D765FF00();
  sub_1D7661500();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  sub_1D7660BC0();
  sub_1D7661500();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  sub_1D7660BC0();
  sub_1D75AF4C0();
  sub_1D7661640();
  sub_1D75B0D60();
  uint64_t v23 = OUTLINED_FUNCTION_3_7();
  sub_1D76616A0();
  sub_1D75941DC((uint64_t)v7, v5);
  unint64_t v5 = 0;
  uint64_t v22 = 1;
  __int16 v7 = (void *)v23;
LABEL_12:
  v21(v7, v5, v22);
  sub_1D75D9140(v7, v5, v22);
  OUTLINED_FUNCTION_84();
}

uint64_t sub_1D762EFF0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

unint64_t sub_1D762F028()
{
  unint64_t result = qword_1EA82C6A8;
  if (!qword_1EA82C6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6A8);
  }
  return result;
}

uint64_t sub_1D762F074()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D762F0B4(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1D762F180(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void))sub_1D762D2BC);
}

uint64_t sub_1D762F0CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TunnelMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D762F128()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D762F168(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1D762F180(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void))sub_1D762E490);
}

uint64_t sub_1D762F180(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void))
{
  return a4(a1, a2, a3 & 1, v4[4], v4[5], v4[6], v4[2], v4[3]);
}

uint64_t sub_1D762F19C()
{
  return 0x10000;
}

void sub_1D762F1AC()
{
}

uint64_t SocketTunnelConnection.identifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1D762F1C0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_1D75AC3B4(*a1, v2);
  return sub_1D762F248(v1, v2);
}

uint64_t sub_1D762F204()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v1 = *(void *)(v0 + 64);
  sub_1D75AC3B4(v1, *(void *)(v0 + 72));
  return v1;
}

uint64_t sub_1D762F248(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_0();
  uint64_t v5 = *(void *)(v2 + 64);
  unint64_t v6 = *(void *)(v2 + 72);
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return sub_1D75941DC(v5, v6);
}

uint64_t (*sub_1D762F290())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D762F2D4()
{
  OUTLINED_FUNCTION_21_0();
  return *(void *)(v0 + 80);
}

uint64_t sub_1D762F2FC(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_13_0();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*sub_1D762F330())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D762F374()
{
  OUTLINED_FUNCTION_21_0();
  return *(void *)(v0 + 88);
}

uint64_t sub_1D762F39C(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_13_0();
  *(void *)(v1 + 88) = a1;
  return result;
}

uint64_t (*sub_1D762F3D0())()
{
  return j__swift_endAccess;
}

uint64_t SocketTunnelConnection.__allocating_init(socket:queue:logPrefix:)()
{
  uint64_t v0 = swift_allocObject();
  SocketTunnelConnection.init(socket:queue:logPrefix:)();
  return v0;
}

void SocketTunnelConnection.init(socket:queue:logPrefix:)()
{
  OUTLINED_FUNCTION_97();
  uint64_t v1 = (void *)v0;
  unint64_t v3 = v2;
  uint64_t v5 = v4;
  int v7 = v6;
  *(_OWORD *)(v0 + 64) = xmmword_1D76655F0;
  *(_OWORD *)(v0 + 80) = xmmword_1D7669670;
  uint64_t v8 = sub_1D7660D20();
  *(void *)(v8 + 16) = 8;
  unint64_t v19 = 8;
  uint64_t v20 = 0;
  unint64_t v18 = v8 + 32;
  sub_1D762C444((uint64_t)&v18, &v20, 8);
  uint64_t v9 = v20;
  if (v20 <= 8)
  {
    *(void *)(v8 + 16) = v20;
    unint64_t v18 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82BBE0);
    sub_1D75D8A04((unint64_t *)&qword_1EA82BBE8, &qword_1EA82BBE0);
    v1[2] = sub_1D7660C40();
    v1[3] = v10;
    if (!v3)
    {
      unint64_t v18 = 0x2074656B636F73;
      unint64_t v19 = 0xE700000000000000;
      LODWORD(v20) = v7;
      sub_1D7661500();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      unint64_t v3 = v19;
    }
    unint64_t v18 = 0xD000000000000018;
    unint64_t v19 = 0x80000001D7676E70;
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    unint64_t v12 = v18;
    unint64_t v11 = v19;
    sub_1D75AEF50(0, (unint64_t *)&unk_1EA82BCA0);
    sub_1D7660DF0();
    OUTLINED_FUNCTION_0_5();
    MEMORY[0x1F4188790](v13);
    OUTLINED_FUNCTION_9();
    (*(void (**)(unint64_t, void))(v14 + 104))(v3, *MEMORY[0x1E4FBCBF8]);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v12;
    *(void *)(v15 + 24) = v11;
    *(_DWORD *)(v15 + 32) = v7;
    id v16 = v5;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1D7660E10();
    v1[4] = v17;
    dispatch_io_set_low_water(v17, 1uLL);
    v1[5] = v16;
    v1[6] = v12;
    v1[7] = v11;
    OUTLINED_FUNCTION_84();
  }
  else
  {
    __break(1u);
    __break(1u);
    *(void *)(v8 + 16) = v9;
    swift_bridgeObjectRelease();
    __break(1u);
  }
}

uint64_t sub_1D762F720(int a1, uint64_t a2, unint64_t a3, int a4)
{
  int v4 = a4;
  if (a1)
  {
    uint64_t v33 = a2;
    int v37 = a4;
    uint64_t v8 = sub_1D765FC50();
    uint64_t v36 = v30;
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(void *)(v9 + 64);
    MEMORY[0x1F4188790](v8);
    unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v12 = &v30[-v11];
    uint64_t v13 = sub_1D7660020();
    if ((v13 & 0x100000000) != 0) {
      int v14 = 5;
    }
    else {
      int v14 = v13;
    }
    LODWORD(v39) = v14;
    sub_1D75B0C34(MEMORY[0x1E4FBC860]);
    sub_1D7631714(qword_1EA82BCB0, MEMORY[0x1F418ACB0]);
    sub_1D765FD40();
    uint64_t v15 = sub_1D7660DB0();
    os_log_type_t v16 = v15;
    if (qword_1EA82AAA0 != -1) {
      uint64_t v15 = swift_once();
    }
    uint64_t v35 = v30;
    uint64_t v17 = qword_1EA82C688;
    MEMORY[0x1F4188790](v15);
    unint64_t v18 = &v30[-v11];
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(&v30[-v11], &v30[-v11], v8);
    os_log_t v34 = v17;
    if (os_log_type_enabled(v17, v16))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v39 = v32;
      *(_DWORD *)uint64_t v19 = 136315650;
      int v31 = v16;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_1D758DBE8(v33, a3, &v39);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 1024;
      LODWORD(v38) = a1;
      sub_1D7661020();
      *(_WORD *)(v19 + 18) = 2080;
      sub_1D7631714((unint64_t *)&unk_1EA82C670, MEMORY[0x1F418ACB0]);
      uint64_t v20 = sub_1D7661620();
      uint64_t v38 = sub_1D758DBE8(v20, v21, &v39);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
      v22(v18, v8);
      _os_log_impl(&dword_1D757C000, v34, (os_log_type_t)v31, "%s: IO cleanup error: %d, %s", (uint8_t *)v19, 0x1Cu);
      uint64_t v23 = v32;
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v23, -1, -1);
      MEMORY[0x1D9474C60](v19, -1, -1);
      v22(v12, v8);
    }
    else
    {
      uint64_t v28 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
      v28(&v30[-v11], v8);
      v28(&v30[-v11], v8);
    }
    int v4 = v37;
  }
  else
  {
    os_log_type_t v24 = sub_1D7660D90();
    if (qword_1EA82AAA0 != -1) {
      swift_once();
    }
    uint64_t v25 = qword_1EA82C688;
    if (os_log_type_enabled((os_log_t)qword_1EA82C688, v24))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v39 = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_1D758DBE8(a2, a3, &v39);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D757C000, v25, v24, "%s: IO cleanup done", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v27, -1, -1);
      MEMORY[0x1D9474C60](v26, -1, -1);
    }
  }
  return close(v4);
}

uint64_t sub_1D762FC24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D762FC54(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))OS_dispatch_io.write(content:completingOn:completion:));
}

uint64_t sub_1D762FC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D762FC54(a1, a2, a3, a4, OS_dispatch_io.read(minLength:maxLength:competingOn:completion:));
}

uint64_t sub_1D762FC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, void, uint64_t, uint64_t))
{
  return a5(a1, a2, *(void *)(v5 + 40), a3, a4);
}

void sub_1D762FC8C()
{
  sub_1D7660DB0();
  if (qword_1EA82AAA0 != -1) {
    swift_once();
  }
  if (OUTLINED_FUNCTION_22_7())
  {
    swift_retain();
    OUTLINED_FUNCTION_14_9();
    uint64_t v7 = OUTLINED_FUNCTION_15_11();
    uint64_t v1 = OUTLINED_FUNCTION_5_14(4.8149e-34);
    OUTLINED_FUNCTION_26_6(v1, v2, &v7);
    OUTLINED_FUNCTION_17_11();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_12(&dword_1D757C000, v3, v4, "%s: receiving a datagram socket connection");
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_1D7661100();
  uint64_t v6 = *(void *)(v0 + 48);
  unint64_t v5 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6;
  unint64_t v8 = v5;
  sub_1D7660BC0();
  OUTLINED_FUNCTION_27_8();
  __break(1u);
}

void sub_1D762FDE0()
{
  OUTLINED_FUNCTION_97();
  uint64_t v0 = (uint8_t *)sub_1D7660DD0();
  if (qword_1EA82AAA0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_1EA82C688;
  if (os_log_type_enabled((os_log_t)qword_1EA82C688, (os_log_type_t)v0))
  {
    swift_retain();
    OUTLINED_FUNCTION_14_9();
    uint64_t v8 = OUTLINED_FUNCTION_15_11();
    *(_DWORD *)uint64_t v0 = 136315138;
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v4 = OUTLINED_FUNCTION_26_6(v2, v3, &v8);
    OUTLINED_FUNCTION_16_8(v4);
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D757C000, v1, (os_log_type_t)v0, "%s: closing IO on cancel()", v0, 0xCu);
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  sub_1D7660DE0();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_8();
  uint64_t v8 = MEMORY[0x1E4FBC860];
  sub_1D7631714((unint64_t *)&unk_1EA82BC60, MEMORY[0x1F41AB058]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C6C0);
  sub_1D75D8A04((unint64_t *)&unk_1EA82BC70, (uint64_t *)&unk_1EA82C6C0);
  sub_1D7661090();
  sub_1D7660E30();
  uint64_t v6 = OUTLINED_FUNCTION_23_4();
  v7(v6);
  OUTLINED_FUNCTION_84();
}

void sub_1D762FFC4()
{
  sub_1D7660DB0();
  if (qword_1EA82AAA0 != -1) {
    swift_once();
  }
  if (OUTLINED_FUNCTION_22_7())
  {
    swift_retain();
    OUTLINED_FUNCTION_14_9();
    uint64_t v7 = OUTLINED_FUNCTION_15_11();
    uint64_t v1 = OUTLINED_FUNCTION_5_14(4.8149e-34);
    OUTLINED_FUNCTION_26_6(v1, v2, &v7);
    OUTLINED_FUNCTION_17_11();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_12(&dword_1D757C000, v3, v4, "%s: starting a QUIC based socket connection");
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  sub_1D7661100();
  uint64_t v6 = *(void *)(v0 + 48);
  unint64_t v5 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = v6;
  unint64_t v8 = v5;
  sub_1D7660BC0();
  OUTLINED_FUNCTION_27_8();
  __break(1u);
}

void SocketTunnelConnection.deinit()
{
  OUTLINED_FUNCTION_97();
  sub_1D7660DD0();
  if (qword_1EA82AAA0 != -1) {
    swift_once();
  }
  if (OUTLINED_FUNCTION_22_7())
  {
    swift_retain();
    OUTLINED_FUNCTION_14_9();
    uint64_t v13 = OUTLINED_FUNCTION_15_11();
    uint64_t v1 = OUTLINED_FUNCTION_5_14(4.8149e-34);
    uint64_t v3 = OUTLINED_FUNCTION_26_6(v1, v2, &v13);
    OUTLINED_FUNCTION_16_8(v3);
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_12(&dword_1D757C000, v4, v5, "%s: closing IO on deinit");
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  uint64_t v6 = sub_1D7660DE0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_1_7();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = MEMORY[0x1E4FBC860];
  sub_1D7631714((unint64_t *)&unk_1EA82BC60, MEMORY[0x1F41AB058]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82C6C0);
  sub_1D75D8A04((unint64_t *)&unk_1EA82BC70, (uint64_t *)&unk_1EA82C6C0);
  sub_1D7661090();
  sub_1D7660E30();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1D75941DC(*(void *)(v0 + 64), *(void *)(v0 + 72));
  OUTLINED_FUNCTION_84();
}

uint64_t SocketTunnelConnection.__deallocating_deinit()
{
  SocketTunnelConnection.deinit();
  return MEMORY[0x1F4186488](v0, 96, 7);
}

uint64_t (*sub_1D7630358())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1D76303B4())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1D7630410())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D763046C@<X0>(void *a1@<X8>)
{
  return SocketTunnelConnection.identifier.getter(a1);
}

uint64_t sub_1D7630490(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  return StreamBasedTunnelConnection.send(packets:completion:)(a1, a2, a3, a4, (uint64_t)&protocol witness table for SocketTunnelConnection);
}

void sub_1D76304BC()
{
}

uint64_t sub_1D76304E8()
{
  return StreamBasedTunnelConnection.receivePackets(completion:)();
}

uint64_t sub_1D7630514()
{
  return StreamBasedTunnelConnection.receiveControlMessage(completion:)();
}

void sub_1D7630540()
{
}

void sub_1D7630564()
{
}

uint64_t sub_1D763057C()
{
  return sub_1D762F19C() & 0x1FFFF;
}

uint64_t sub_1D76305A0(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  return StreamBasedTunnelConnection.send(packets:completion:)(a1, a2, a3, a4, (uint64_t)&protocol witness table for TCPTunnelConnection);
}

void sub_1D76305CC()
{
}

uint64_t sub_1D76305F8()
{
  return StreamBasedTunnelConnection.receivePackets(completion:)();
}

uint64_t sub_1D7630624()
{
  return StreamBasedTunnelConnection.receiveControlMessage(completion:)();
}

uint64_t sub_1D7630650()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 36, 7);
}

uint64_t sub_1D7630688(int a1)
{
  return sub_1D762F720(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(_DWORD *)(v1 + 32));
}

unint64_t sub_1D7630698()
{
  unint64_t result = qword_1EA82C6D0;
  if (!qword_1EA82C6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6D0);
  }
  return result;
}

unint64_t sub_1D76306E8()
{
  unint64_t result = qword_1EA82C6D8;
  if (!qword_1EA82C6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6D8);
  }
  return result;
}

uint64_t sub_1D7630734@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D762F204();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D7630764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D762F2D4();
  *a1 = result;
  return result;
}

uint64_t sub_1D7630790(uint64_t *a1)
{
  return sub_1D762F2FC(*a1);
}

uint64_t sub_1D76307B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D762F374();
  *a1 = result;
  return result;
}

uint64_t sub_1D76307E4(uint64_t *a1)
{
  return sub_1D762F39C(*a1);
}

unsigned char *storeEnumTagSinglePayload for TransportProtocolType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1D76308D8);
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

void type metadata accessor for TransportProtocolType()
{
}

uint64_t sub_1D763090C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x2000000000000000) != 0)
  {
    return sub_1D75934F4(a1, a2);
  }
  else
  {
    sub_1D75934F4(a1, a2);
    sub_1D75934F4(a3, a4);
    return swift_unknownObjectRetain();
  }
}

uint64_t destroy for NetworkParamsType(uint64_t a1)
{
  return sub_1D7630988(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24));
}

uint64_t sub_1D7630988(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x2000000000000000) != 0)
  {
    return sub_1D75933F0(a1, a2);
  }
  else
  {
    sub_1D75933F0(a1, a2);
    sub_1D75933F0(a3, a4);
    return swift_unknownObjectRelease();
  }
}

uint64_t *initializeWithCopy for NetworkParamsType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  sub_1D763090C(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

uint64_t *assignWithCopy for NetworkParamsType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  sub_1D763090C(*a2, v4, v5, v6);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  sub_1D7630988(v8, v9, v10, v11);
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

uint64_t *assignWithTake for NetworkParamsType(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v5 = a1[2];
  unint64_t v7 = a1[3];
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v8;
  a1[4] = v3;
  sub_1D7630988(v4, v6, v5, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkParamsType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xF && *(unsigned char *)(a1 + 40))
    {
      unsigned int v2 = *(_DWORD *)a1 + 14;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 24) >> 58) >> 3) & 1 | (2
                                                                   * ((*(void *)(a1 + 24) >> 58) & 4 | (*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xE) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for NetworkParamsType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 15;
    if (a3 >= 0xF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((-a2 >> 1) & 3) << 60;
      *(void *)(result + 16) = 0;
      *(void *)(result + 24) = ((unint64_t)((-a2 >> 1) & 7 | (8 * (-a2 & 0xF))) << 58) & 0x3000000000000000;
      *(void *)(result + 32) = 0;
    }
  }
  return result;
}

uint64_t sub_1D7630BE8(uint64_t a1)
{
  return (*(void *)(a1 + 24) >> 61) & 1;
}

uint64_t sub_1D7630BF4(uint64_t result)
{
  *(void *)(result + 24) &= ~0x2000000000000000uLL;
  return result;
}

uint64_t sub_1D7630C04(uint64_t result, char a2)
{
  unint64_t v2 = *(void *)(result + 24) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 1) << 61);
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  *(void *)(result + 24) = v2;
  return result;
}

void type metadata accessor for NetworkParamsType()
{
}

void type metadata accessor for TunnelConnectionState()
{
}

uint64_t sub_1D7630C48(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PeerConnectionInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PeerConnectionInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for PeerConnectionInfo()
{
}

void type metadata accessor for TunnelConnectionIdentifierCategory()
{
}

uint64_t dispatch thunk of TunnelConnection.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TunnelConnection.send(packets:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of TunnelConnection.send(controlMessage:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of TunnelConnection.receivePackets(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of TunnelConnection.receiveControlMessage(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of TunnelConnection.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TunnelConnection.start(on:reportingTunnelStateChangesWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of TunnelConnection.maxSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))() & 0x1FFFF;
}

uint64_t dispatch thunk of TunnelConnection.physicalInterfaceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection.send(content:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection.receive(minLength:maxLength:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 96))();
}

uint64_t type metadata accessor for SocketTunnelConnection()
{
  return self;
}

uint64_t method lookup function for SocketTunnelConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SocketTunnelConnection);
}

uint64_t dispatch thunk of SocketTunnelConnection.maxSupportedMTU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))() & 0x1FFFF;
}

uint64_t dispatch thunk of SocketTunnelConnection.physicalInterfaceName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of SocketTunnelConnection.__allocating_init(socket:queue:logPrefix:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SocketTunnelConnection.send(content:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of SocketTunnelConnection.receive(minLength:maxLength:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of SocketTunnelConnection.receive(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of SocketTunnelConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of SocketTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

unsigned char *_s19RemotePairingDevice21TunnelConnectionStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x1D763125CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeerConnectionInfo.CodingKeys()
{
  return &type metadata for PeerConnectionInfo.CodingKeys;
}

unint64_t sub_1D7631298()
{
  unint64_t result = qword_1EA82C6E0;
  if (!qword_1EA82C6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6E0);
  }
  return result;
}

unint64_t sub_1D76312E8()
{
  unint64_t result = qword_1EA82C6E8;
  if (!qword_1EA82C6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6E8);
  }
  return result;
}

unint64_t sub_1D7631338()
{
  unint64_t result = qword_1EA82C6F0;
  if (!qword_1EA82C6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6F0);
  }
  return result;
}

unint64_t sub_1D7631384()
{
  unint64_t result = qword_1EA82C6F8;
  if (!qword_1EA82C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6F8);
  }
  return result;
}

uint64_t sub_1D76313D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TunnelMessage();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D7631414(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1D765FCE0();
  if (!result || (uint64_t result = sub_1D765FD10(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1D765FD00();
      return sub_1D765FE60();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D76314A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t result = sub_1D765FCE0();
  uint64_t v7 = result;
  if (result)
  {
    uint64_t result = sub_1D765FD10();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v7 += a1 - result;
  }
  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = sub_1D765FD00();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = v7 + v11;
  if (v7) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  return a3(v7, v13);
}

uint64_t sub_1D7631550()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1D7631588()
{
}

uint64_t sub_1D7631594()
{
  return sub_1D765FE60();
}

uint64_t sub_1D76315C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1D762D3EC(*(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24), a1, a2);
}

uint64_t sub_1D76315E8(uint64_t a1, uint64_t a2)
{
  return sub_1D762D72C(a1, a2, *(uint64_t **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1D7631608(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - a3;
  if (!a3) {
    uint64_t v4 = 0;
  }
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

unint64_t sub_1D763163C()
{
  unint64_t result = qword_1EA82C720;
  if (!qword_1EA82C720)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA82C718);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C720);
  }
  return result;
}

uint64_t sub_1D763169C()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1D76316AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D7631714(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_5_14(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  return sub_1D7661020();
}

BOOL OUTLINED_FUNCTION_22_7()
{
  return os_log_type_enabled(v0, v1);
}

uint64_t OUTLINED_FUNCTION_26_6(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1D758DBE8(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_27_8()
{
  return sub_1D7661260();
}

uint64_t OUTLINED_FUNCTION_31_6()
{
  return sub_1D75933F0(v1, v0);
}

uint64_t sub_1D7631814(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1D7631868(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4 = type metadata accessor for TunnelMessage();
  MEMORY[0x1F4188790](v4);
  unsigned int v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D75E9098(a1, (uint64_t)v6);
  sub_1D765FCB0();
  swift_allocObject();
  sub_1D765FCA0();
  sub_1D763B568();
  uint64_t v7 = sub_1D765FC90();
  unint64_t v9 = v8;
  swift_release();
  sub_1D75934F4(v7, v9);
  if (sub_1D765FF00() >= 0x10000)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0xE000000000000000;
    sub_1D7661100();
    sub_1D7660BC0();
    uint64_t v10 = sub_1D765FF00();
    sub_1D75933F0(v7, v9);
    v16[0] = v10;
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7660BC0();
    sub_1D75AF4C0();
    sub_1D7661640();
    v16[0] = v17;
    v16[1] = v18;
    sub_1D75B0D60();
    uint64_t v11 = (void *)swift_allocError();
    sub_1D76616A0();
    a2(v11);

    sub_1D75933F0(v7, v9);
    return sub_1D762F0CC((uint64_t)v6);
  }
  if (qword_1EA82AAA8 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_1EA82C690;
  unint64_t v18 = *(void *)algn_1EA82C698;
  sub_1D75934F4(qword_1EA82C690, *(unint64_t *)algn_1EA82C698);
  unint64_t v13 = sub_1D765FF00();
  if ((v13 & 0x8000000000000000) == 0 && v13 < 0x10000)
  {
    sub_1D762E1A0(bswap32(v13) >> 16);
    if (sub_1D765FF00() == 10)
    {
      sub_1D765FF10();
      sub_1D75933F0(v7, v9);
      uint64_t v14 = v17;
      unint64_t v15 = v18;
      sub_1D75934F4(v17, v18);
      sub_1D7632FF4();
      sub_1D75933F0(v14, v15);
      sub_1D75933F0(v7, v9);
      sub_1D762F0CC((uint64_t)v6);
      return sub_1D75933F0(v14, v15);
    }
    __break(1u);
  }
  uint64_t result = sub_1D7661250();
  __break(1u);
  return result;
}

uint64_t sub_1D7631C5C(uint64_t a1, unint64_t a2, char a3, void (*a4)(void *), uint64_t a5, uint64_t a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1EA82C420);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (void *)((char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    id v23 = (id)a1;
    swift_willThrow();
    os_log_type_t v24 = (void *)a1;
LABEL_34:
    *uint64_t v14 = v24;
    swift_storeEnumTagMultiPayload();
    id v34 = v24;
    a4(v14);

    return sub_1D758C650((uint64_t)v14, qword_1EA82C420);
  }
  v39[0] = a6;
  sub_1D75934F4(a1, a2);
  if (qword_1EA82AAA8 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_1EA82C690;
  unint64_t v16 = *(void *)algn_1EA82C698;
  sub_1D75934F4(qword_1EA82C690, *(unint64_t *)algn_1EA82C698);
  sub_1D7593208();
  char v18 = v17;
  sub_1D75933F0(v15, v16);
  if ((v18 & 1) == 0)
  {
LABEL_33:
    sub_1D75AF4C0();
    sub_1D7661640();
    v39[2] = v39[4];
    v39[3] = v39[5];
    sub_1D75B0D60();
    os_log_type_t v24 = (void *)swift_allocError();
    sub_1D76616A0();
    swift_willThrow();
    sub_1D75D9140((id)a1, a2, 0);
    goto LABEL_34;
  }
  unint64_t v19 = a2 >> 62;
  uint64_t v20 = sub_1D765FF00();
  uint64_t v21 = v20;
  uint64_t v22 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v22 = (int)a1;
      break;
    case 2uLL:
      uint64_t v22 = *(void *)(a1 + 16);
      break;
    default:
      break;
  }
  BOOL v25 = __OFADD__(v22, v20);
  uint64_t v26 = v22 + v20;
  if (v25)
  {
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v27 = v26 + 2;
  if (__OFADD__(v26, 2))
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    JUMPOUT(0x1D7632138);
  }
  uint64_t v28 = BYTE6(a2);
  switch(a2 >> 62)
  {
    case 1uLL:
      if (v26 < (int)a1) {
        goto LABEL_33;
      }
      goto LABEL_27;
    case 2uLL:
      if (v26 < *(void *)(a1 + 16)) {
        goto LABEL_33;
      }
      if (v19 == 2) {
        uint64_t v29 = *(void *)(a1 + 24);
      }
      else {
LABEL_27:
      }
        uint64_t v29 = a1 >> 32;
      goto LABEL_28;
    case 3uLL:
      if (v26 < 0) {
        goto LABEL_33;
      }
      if (v27 > 0 || __OFSUB__(v26, v27)) {
        goto LABEL_33;
      }
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v28 = 0;
      goto LABEL_40;
    default:
      if (v26 < 0) {
        goto LABEL_33;
      }
      uint64_t v29 = BYTE6(a2);
LABEL_28:
      if (v26 >= v27 || v29 < v27) {
        goto LABEL_33;
      }
      if (!v19)
      {
        uint64_t v32 = a2 & 0xFFFFFFFFFFFFLL;
        uint64_t v31 = a1;
LABEL_40:
        sub_1D75F04E4(v31, v32, v28, v21);
        sub_1D75D9140((id)a1, a2, 0);
        goto LABEL_43;
      }
      if (v19 != 1)
      {
        uint64_t v36 = *(void *)(a1 + 16);
        uint64_t v37 = *(void *)(a1 + 24);
        swift_retain();
        swift_retain();
        sub_1D75F05BC(v36, v37, a2 & 0x3FFFFFFFFFFFFFFFLL, v21);
        swift_release();
        swift_release();
        goto LABEL_42;
      }
      if (a1 >> 32 < (int)a1) {
        goto LABEL_48;
      }
      swift_retain();
      sub_1D75F05BC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, v21);
      sub_1D75D9140((id)a1, a2, 0);
LABEL_42:
      sub_1D75D9140((id)a1, a2, 0);
LABEL_43:
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = a4;
      *(void *)(v38 + 24) = a5;
      swift_retain();
      sub_1D76330FC();
      return swift_release();
  }
}

uint64_t sub_1D7632158()
{
  sub_1D75AEF50(0, (unint64_t *)&qword_1EBDEC4C0);
  uint64_t result = sub_1D7660FE0();
  qword_1EA82C740 = result;
  return result;
}

void sub_1D76321D4()
{
  OUTLINED_FUNCTION_97();
  uint64_t v4 = v1;
  uint64_t v5 = (uint64_t *)sub_1D76607F0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v99 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_52();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C120);
  uint64_t v9 = OUTLINED_FUNCTION_23_0(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_51();
  sub_1D76604F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v0, 1, (uint64_t)v5) == 1)
  {
    sub_1D758C650((uint64_t)v0, &qword_1EA82C120);
    LOBYTE(v0) = sub_1D7660DC0();
    if (qword_1EA82AAB0 != -1) {
      goto LABEL_31;
    }
    goto LABEL_3;
  }
  __int16 v98 = v1;
  OUTLINED_FUNCTION_46_4();
  uint64_t v97 = v5;
  OUTLINED_FUNCTION_17_12();
  v15();
  uint64_t v16 = sub_1D76607E0();
  uint64_t v120 = MEMORY[0x1E4FBC860];
  uint64_t v17 = *(void *)(v16 + 16);
  uint64_t v18 = sub_1D76604A0();
  uint64_t v4 = &v96;
  OUTLINED_FUNCTION_0_5();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_12_8();
  os_log_t v118 = v23;
  uint64_t v119 = v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
  unint64_t v0 = &v96;
  uint64_t v25 = OUTLINED_FUNCTION_23_0(v24);
  uint64_t v27 = *(void *)(v26 + 64);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_35_4();
  uint64_t v103 = v17;
  uint64_t v104 = v3;
  if (!v17)
  {
LABEL_20:
    OUTLINED_FUNCTION_44_4();
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_1D758C650((uint64_t)v5, (uint64_t *)&unk_1EA82BC80);
    uint64_t v73 = MEMORY[0x1F4188790](v72);
    OUTLINED_FUNCTION_24_7(v73, v74, v75, v76, v77, v78, v79, v80, v96);
    swift_release();
    if (__swift_getEnumTagSinglePayload(v27, 1, v18) == 1)
    {
      sub_1D758C650(v27, (uint64_t *)&unk_1EA82BC80);
      uint64_t v81 = 0;
      unint64_t v82 = 0;
    }
    else
    {
      uint64_t v81 = sub_1D7660470();
      uint64_t v83 = v20;
      unint64_t v82 = v84;
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v27, v18);
    }
    char v85 = v98;
    os_log_type_t v86 = sub_1D7660D90();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    uint64_t v87 = qword_1EA82C740;
    swift_retain_n();
    if (os_log_type_enabled(v87, v86))
    {
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      uint64_t v88 = swift_slowAlloc();
      uint64_t v119 = swift_slowAlloc();
      v122[0] = v119;
      *(_DWORD *)uint64_t v88 = 136446722;
      os_log_t v118 = v87;
      uint64_t v89 = v85[2];
      unint64_t v90 = v85[3];
      swift_bridgeObjectRetain();
      uint64_t v91 = sub_1D758DBE8(v89, v90, v122);
      OUTLINED_FUNCTION_14_10(v91);
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v88 + 12) = 2080;
      uint64_t v92 = v99;
      OUTLINED_FUNCTION_37_3();
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t v93 = sub_1D758DBE8(v120, v121, v122);
      OUTLINED_FUNCTION_14_10(v93);
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v88 + 22) = 2080;
      uint64_t v120 = v81;
      unint64_t v121 = v82;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82B890);
      uint64_t v94 = sub_1D7660B60();
      uint64_t v120 = sub_1D758DBE8(v94, v95, v122);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v118, v86, "%{public}s/%s: Tunnel connection path interface name: %s", (uint8_t *)v88, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      (*(void (**)(uint64_t, uint64_t *))(v92 + 8))(v104, v97);
    }
    else
    {
      swift_release_n();
      (*(void (**)(uint64_t, uint64_t *))(v99 + 8))(v3, v97);
    }
    goto LABEL_29;
  }
  unint64_t v2 = 0;
  uint64_t v117 = (void (**)(void))(v20 + 32);
  int v105 = (uint64_t (**)(void))(v20 + 8);
  uint64_t v102 = v20;
  uint64_t v101 = v16;
  uint64_t v100 = v20 + 16;
  uint64_t v115 = v18;
  while (v2 < *(void *)(v16 + 16))
  {
    unint64_t v111 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v28 = *(void *)(v20 + 72);
    unint64_t v116 = v2;
    uint64_t v110 = v28;
    uint64_t v29 = v16 + v111 + v28 * v2;
    uint64_t v30 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 16);
    v30(v5, v29, v18);
    OUTLINED_FUNCTION_19_9();
    if (v31) {
      goto LABEL_21;
    }
    v114 = &v96;
    uint64_t v109 = *v117;
    OUTLINED_FUNCTION_17_12();
    v32();
    uint64_t v5 = (uint64_t *)sub_1D7660460();
    v113 = &v96;
    OUTLINED_FUNCTION_0_5();
    uint64_t v34 = v33;
    uint64_t v36 = *(void *)(v35 + 64);
    MEMORY[0x1F4188790](v37);
    uint64_t v38 = sub_1D7660480();
    uint64_t v112 = &v96;
    MEMORY[0x1F4188790](v38);
    unint64_t v108 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v39 = *MEMORY[0x1E4F389B0];
    uint64_t v107 = *(void (**)(char *, uint64_t, uint64_t *))(v34 + 104);
    v107((char *)&v96 - v108, v39, v5);
    sub_1D759365C(&qword_1EA82C748, MEMORY[0x1F418D9C8]);
    OUTLINED_FUNCTION_48_3();
    uint64_t v106 = v40;
    char v41 = sub_1D7660AD0();
    uint64_t v42 = *(void (**)(void))(v34 + 8);
    OUTLINED_FUNCTION_23_5();
    v42();
    OUTLINED_FUNCTION_23_5();
    uint64_t v43 = ((uint64_t (*)(void))v42)();
    MEMORY[0x1F4188790](v43);
    uint64_t v45 = (char *)&v96 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v46 = ((uint64_t (*)(char *, uint64_t, uint64_t))v30)(v45, v119, v115);
    if ((v41 & 1) == 0)
    {
      long long v54 = v45;
      uint64_t v18 = v115;
      uint64_t v51 = ((uint64_t (*)(char *, uint64_t))*v105)(v54, v115);
      uint64_t v3 = v104;
LABEL_14:
      uint64_t v5 = &v96;
      uint64_t v55 = MEMORY[0x1F4188790](v51);
      OUTLINED_FUNCTION_29_9(v55, v56, v57, v58, v59, v60, v61, v62, v96);
      unint64_t v63 = v109;
      OUTLINED_FUNCTION_17_12();
      v63();
      uint64_t v64 = v120;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v20 = v102;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1D75A6550(0, *(void *)(v64 + 16) + 1, 1);
        uint64_t v64 = v120;
      }
      unint64_t v67 = *(void *)(v64 + 16);
      unint64_t v66 = *(void *)(v64 + 24);
      if (v67 >= v66 >> 1)
      {
        sub_1D75A6550(v66 > 1, v67 + 1, 1);
        uint64_t v64 = v120;
      }
      *(void *)(v64 + 16) = v67 + 1;
      OUTLINED_FUNCTION_43_3(v111);
      OUTLINED_FUNCTION_17_12();
      uint64_t v53 = ((uint64_t (*)(void))v63)();
      uint64_t v120 = v64;
      uint64_t v16 = v101;
      unint64_t v52 = v116;
      goto LABEL_19;
    }
    uint64_t v112 = &v96;
    MEMORY[0x1F4188790](v46);
    unint64_t v47 = v108;
    v113 = &v96;
    uint64_t v48 = sub_1D7660480();
    MEMORY[0x1F4188790](v48);
    v107((char *)&v96 - v47, *MEMORY[0x1E4F389C8], v5);
    OUTLINED_FUNCTION_48_3();
    char v49 = sub_1D7660AD0();
    OUTLINED_FUNCTION_23_5();
    v42();
    OUTLINED_FUNCTION_23_5();
    v42();
    uint64_t v50 = *v105;
    uint64_t v18 = v115;
    OUTLINED_FUNCTION_45_1();
    uint64_t v51 = v50();
    uint64_t v3 = v104;
    unint64_t v52 = v116;
    if ((v49 & 1) == 0) {
      goto LABEL_14;
    }
    OUTLINED_FUNCTION_45_1();
    uint64_t v53 = v50();
    uint64_t v20 = v102;
    uint64_t v16 = v101;
LABEL_19:
    unint64_t v2 = v52 + 1;
    uint64_t v4 = &v96;
    MEMORY[0x1F4188790](v53);
    OUTLINED_FUNCTION_12_8();
    uint64_t v119 = v68;
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
    unint64_t v0 = &v96;
    uint64_t v70 = OUTLINED_FUNCTION_23_0(v69);
    uint64_t v27 = *(void *)(v71 + 64);
    MEMORY[0x1F4188790](v70);
    OUTLINED_FUNCTION_35_4();
    if (v103 == v2) {
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_31:
  swift_once();
LABEL_3:
  if (os_log_type_enabled((os_log_t)qword_1EA82C740, (os_log_type_t)v0))
  {
    swift_retain_n();
    OUTLINED_FUNCTION_40_0();
    v122[0] = OUTLINED_FUNCTION_20_7();
    *(_DWORD *)unint64_t v2 = 136446466;
    uint64_t v10 = v4[2];
    unint64_t v11 = v4[3];
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1D758DBE8(v10, v11, v122);
    OUTLINED_FUNCTION_14_10(v12);
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 12) = 2080;
    OUTLINED_FUNCTION_37_3();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_216();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    uint64_t v120 = sub_1D758DBE8(v120, v121, v122);
    sub_1D7661020();
    swift_release_n();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22_8(&dword_1D757C000, v13, v14, "%{public}s/%s: Tunnel connection path is nil");
    OUTLINED_FUNCTION_21_10();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
LABEL_29:
  OUTLINED_FUNCTION_84();
}

uint64_t TCPTunnelConnection.tunnelIdentifier.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t TCPTunnelConnection.identifier.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_27_9(*(void *)(v1 + 40), a1);
}

uint64_t TCPTunnelConnection.stream.getter()
{
  return swift_retain();
}

uint64_t sub_1D7632CD0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_1D75AC3B4(*a1, v2);
  return sub_1D7632D50(v1, v2);
}

uint64_t sub_1D7632D14()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v0 = OUTLINED_FUNCTION_36();
  sub_1D75AC3B4(v0, v1);
  return OUTLINED_FUNCTION_36();
}

uint64_t sub_1D7632D50(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_13_0();
  uint64_t v5 = *(void *)(v2 + 56);
  unint64_t v6 = *(void *)(v2 + 64);
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return sub_1D75941DC(v5, v6);
}

uint64_t (*sub_1D7632D98())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D7632DDC()
{
  OUTLINED_FUNCTION_21_0();
  return *(void *)(v0 + 72);
}

uint64_t sub_1D7632E04(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_13_0();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*sub_1D7632E38())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1D7632E7C())()
{
  return j__swift_endAccess;
}

uint64_t TCPTunnelConnection.__allocating_init(tunnelIdentifier:stream:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  TCPTunnelConnection.init(tunnelIdentifier:stream:)(a1, a2);
  return v4;
}

uint64_t TCPTunnelConnection.init(tunnelIdentifier:stream:)(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(v2 + 56) = xmmword_1D76655F0;
  *(_OWORD *)(v2 + 72) = xmmword_1D7669670;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  uint64_t v3 = sub_1D7660D20();
  OUTLINED_FUNCTION_16_9(v3, v4, v5, v6, v7, v8, v9, v10, v12, v13, v14, v15);
  if (v16 > 8) {
    __break(1u);
  }
  *(void *)(v3 + 16) = v16;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void sub_1D7632FF4()
{
  OUTLINED_FUNCTION_97();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_1D7660530();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v2;
  *uint64_t v0 = sub_1D7607284;
  v0[1] = (void (*)(uint64_t))v6;
  uint64_t v7 = OUTLINED_FUNCTION_26_7();
  v8(v7);
  sub_1D7660520();
  swift_retain();
  sub_1D7660500();
  OUTLINED_FUNCTION_155();
  sub_1D7660580();
  swift_release();
  uint64_t v9 = OUTLINED_FUNCTION_39_5();
  v10(v9);
  OUTLINED_FUNCTION_84();
}

uint64_t sub_1D76330FC()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_192();
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0;
  swift_retain();
  OUTLINED_FUNCTION_155();
  sub_1D76605E0();
  return swift_release();
}

uint64_t sub_1D7633184()
{
  return sub_1D76605D0();
}

uint64_t sub_1D76331A8()
{
  OUTLINED_FUNCTION_97();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = (void *)OUTLINED_FUNCTION_192();
  void v6[2] = v5;
  v6[3] = v3;
  v6[4] = v1;
  uint64_t v7 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_51_3();
  uint64_t v8 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_52_3();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v8;
  v9[4] = sub_1D763A828;
  v9[5] = v6;
  v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D763A8E4);
  sub_1D7660540();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_51_3();
  uint64_t v11 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_52_3();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v11;
  swift_retain();
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D763A8F4);
  sub_1D7660550();
  swift_release();
  swift_release();
  swift_release();
  sub_1D76605B0();
  OUTLINED_FUNCTION_84();
  return swift_release();
}

uint64_t sub_1D7633378(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong) {
      return swift_release();
    }
    uint64_t v11 = Strong;
    uint64_t v83 = a5;
    unint64_t v84 = a4;
    uint64_t v12 = sub_1D76605A0();
    char v85 = &v76;
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(void *)(v13 + 64);
    MEMORY[0x1F4188790](v12);
    uint64_t v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v16(v15, a1, v12);
    uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
    if (MEMORY[0x1E4F38A20] && v17 == *MEMORY[0x1E4F38A20])
    {
      uint64_t v82 = v11;
      (*(void (**)(char *, uint64_t))(v13 + 96))((char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
      uint64_t v18 = sub_1D7660800();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = *(void *)(v19 + 64);
      MEMORY[0x1F4188790](v18);
      unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))((char *)&v76 - v21, v15, v18);
      uint64_t v22 = sub_1D7660DD0();
      os_log_type_t v23 = v22;
      if (qword_1EA82AAB0 != -1) {
        uint64_t v22 = swift_once();
      }
      uint64_t v80 = &v76;
      uint64_t v24 = qword_1EA82C740;
      MEMORY[0x1F4188790](v22);
      uint64_t v25 = (char *)&v76 - v21;
      uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
      uint64_t v81 = (uint64_t *)((char *)&v76 - v21);
      v26((char *)&v76 - v21, (char *)&v76 - v21, v18);
      int v27 = v23;
      if (os_log_type_enabled(v24, v23))
      {
        swift_retain_n();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v79 = swift_slowAlloc();
        os_log_type_t v86 = (void *)v79;
        *(_DWORD *)uint64_t v28 = 136446722;
        LODWORD(v78) = v27;
        os_log_t v77 = v24;
        uint64_t v30 = *(void *)(v9 + 16);
        unint64_t v29 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        uint64_t v87 = sub_1D758DBE8(v30, v29, (uint64_t *)&v86);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2080;
        uint64_t v76 = v28 + 14;
        uint64_t v87 = 0x5F6E6F6374;
        unint64_t v88 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v87 = sub_1D758DBE8(v87, v88, (uint64_t *)&v86);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 22) = 2082;
        sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
        uint64_t v31 = sub_1D7661620();
        uint64_t v87 = sub_1D758DBE8(v31, v32, (uint64_t *)&v86);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(void (**)(char *, uint64_t))(v19 + 8);
        v33(v25, v18);
        _os_log_impl(&dword_1D757C000, v77, (os_log_type_t)v78, "%{public}s/%s: Tunnel connection waiting, error: %{public}s", (uint8_t *)v28, 0x20u);
        uint64_t v34 = v79;
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v34, -1, -1);
        MEMORY[0x1D9474C60](v28, -1, -1);
      }
      else
      {
        uint64_t v33 = *(void (**)(char *, uint64_t))(v19 + 8);
        v33(v25, v18);
      }
      uint64_t v73 = v84;
      sub_1D76605D0();
      LOBYTE(v87) = 1;
      v73(&v87);
      swift_release();
      swift_release();
      uint64_t v74 = (char *)v81;
      return ((uint64_t (*)(char *, uint64_t))v33)(v74, v18);
    }
    if (MEMORY[0x1E4F38A10] && v17 == *MEMORY[0x1E4F38A10])
    {
      uint64_t v82 = v11;
      (*(void (**)(char *, uint64_t))(v13 + 96))((char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
      uint64_t v18 = sub_1D7660800();
      uint64_t v35 = *(void *)(v18 - 8);
      uint64_t v36 = *(void *)(v35 + 64);
      MEMORY[0x1F4188790](v18);
      unint64_t v37 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v38 = (char *)&v76 - v37;
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))((char *)&v76 - v37, v15, v18);
      uint64_t v39 = sub_1D7660DB0();
      os_log_type_t v40 = v39;
      if (qword_1EA82AAB0 != -1) {
        uint64_t v39 = swift_once();
      }
      uint64_t v81 = &v76;
      char v41 = qword_1EA82C740;
      MEMORY[0x1F4188790](v39);
      uint64_t v42 = (char *)&v76 - v37;
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))((char *)&v76 - v37, (char *)&v76 - v37, v18);
      int v43 = v40;
      if (os_log_type_enabled(v41, v40))
      {
        swift_retain_n();
        uint64_t v44 = swift_slowAlloc();
        uint64_t v80 = (void *)swift_slowAlloc();
        os_log_type_t v86 = v80;
        *(_DWORD *)uint64_t v44 = 136446722;
        LODWORD(v79) = v43;
        os_log_t v78 = v41;
        uint64_t v45 = *(void *)(v9 + 16);
        unint64_t v46 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        uint64_t v87 = sub_1D758DBE8(v45, v46, (uint64_t *)&v86);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 12) = 2080;
        os_log_t v77 = (os_log_t)(v44 + 14);
        uint64_t v87 = 0x5F6E6F6374;
        unint64_t v88 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v87 = sub_1D758DBE8(v87, v88, (uint64_t *)&v86);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 22) = 2082;
        sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
        uint64_t v47 = sub_1D7661620();
        uint64_t v87 = sub_1D758DBE8(v47, v48, (uint64_t *)&v86);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(void (**)(char *, uint64_t))(v35 + 8);
        v33(v42, v18);
        _os_log_impl(&dword_1D757C000, v78, (os_log_type_t)v79, "%{public}s/%s: Tunnel connection failed, error: %{public}s", (uint8_t *)v44, 0x20u);
        char v49 = v80;
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v49, -1, -1);
        MEMORY[0x1D9474C60](v44, -1, -1);
      }
      else
      {
        uint64_t v33 = *(void (**)(char *, uint64_t))(v35 + 8);
        v33(v42, v18);
      }
      uint64_t v75 = v84;
      sub_1D76605D0();
      LOBYTE(v87) = 1;
      v75(&v87);
      swift_release();
      swift_release();
      uint64_t v74 = v38;
      return ((uint64_t (*)(char *, uint64_t))v33)(v74, v18);
    }
    if (MEMORY[0x1E4F389F8] && v17 == *MEMORY[0x1E4F389F8])
    {
      os_log_type_t v50 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      uint64_t v51 = qword_1EA82C740;
      swift_retain();
      os_log_type_t v52 = v50;
      if (os_log_type_enabled(v51, v50))
      {
        swift_retain();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        os_log_type_t v86 = (void *)v54;
        *(_DWORD *)uint64_t v53 = 136446466;
        uint64_t v55 = *(void *)(v9 + 16);
        unint64_t v56 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        uint64_t v87 = sub_1D758DBE8(v55, v56, (uint64_t *)&v86);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        uint64_t v87 = 0x5F6E6F6374;
        unint64_t v88 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v87 = sub_1D758DBE8(v87, v88, (uint64_t *)&v86);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        uint64_t v57 = "%{public}s/%s: Tunnel connection setup";
LABEL_28:
        _os_log_impl(&dword_1D757C000, v51, v52, v57, (uint8_t *)v53, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v54, -1, -1);
        MEMORY[0x1D9474C60](v53, -1, -1);
LABEL_44:
        swift_release();
        return swift_release();
      }
    }
    else
    {
      if (!MEMORY[0x1E4F38A40] || v17 != *MEMORY[0x1E4F38A40])
      {
        if (MEMORY[0x1E4F389F0] && v17 == *MEMORY[0x1E4F389F0])
        {
          os_log_type_t v61 = sub_1D7660DD0();
          if (qword_1EA82AAB0 != -1) {
            swift_once();
          }
          uint64_t v62 = qword_1EA82C740;
          if (os_log_type_enabled((os_log_t)qword_1EA82C740, v61))
          {
            swift_retain_n();
            uint64_t v63 = swift_slowAlloc();
            uint64_t v64 = swift_slowAlloc();
            os_log_type_t v86 = (void *)v64;
            *(_DWORD *)uint64_t v63 = 136446466;
            uint64_t v82 = v11;
            uint64_t v65 = *(void *)(v9 + 16);
            unint64_t v66 = *(void *)(v9 + 24);
            swift_bridgeObjectRetain();
            uint64_t v87 = sub_1D758DBE8(v65, v66, (uint64_t *)&v86);
            sub_1D7661020();
            swift_bridgeObjectRelease();
            *(_WORD *)(v63 + 12) = 2080;
            uint64_t v87 = 0x5F6E6F6374;
            unint64_t v88 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1D7660BC0();
            swift_bridgeObjectRelease();
            uint64_t v87 = sub_1D758DBE8(v87, v88, (uint64_t *)&v86);
            sub_1D7661020();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1D757C000, v62, v61, "%{public}s/%s: Tunnel connection established", (uint8_t *)v63, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1D9474C60](v64, -1, -1);
            MEMORY[0x1D9474C60](v63, -1, -1);
          }
          LOBYTE(v87) = 0;
        }
        else
        {
          if (!MEMORY[0x1E4F38A28] || v17 != *MEMORY[0x1E4F38A28])
          {
            MEMORY[0x1F4188790](v17);
            v16((char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
            uint64_t v87 = 0;
            unint64_t v88 = 0xE000000000000000;
            sub_1D7661100();
            sub_1D7660BC0();
            sub_1D7661200();
            uint64_t result = sub_1D7661260();
            __break(1u);
            return result;
          }
          os_log_type_t v67 = sub_1D7660DD0();
          if (qword_1EA82AAB0 != -1) {
            swift_once();
          }
          uint64_t v68 = qword_1EA82C740;
          if (os_log_type_enabled((os_log_t)qword_1EA82C740, v67))
          {
            swift_retain_n();
            uint64_t v69 = swift_slowAlloc();
            uint64_t v70 = swift_slowAlloc();
            os_log_type_t v86 = (void *)v70;
            *(_DWORD *)uint64_t v69 = 136446466;
            uint64_t v82 = v11;
            uint64_t v71 = *(void *)(v9 + 16);
            unint64_t v72 = *(void *)(v9 + 24);
            swift_bridgeObjectRetain();
            uint64_t v87 = sub_1D758DBE8(v71, v72, (uint64_t *)&v86);
            sub_1D7661020();
            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 12) = 2080;
            uint64_t v87 = 0x5F6E6F6374;
            unint64_t v88 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1D7660BC0();
            swift_bridgeObjectRelease();
            uint64_t v87 = sub_1D758DBE8(v87, v88, (uint64_t *)&v86);
            sub_1D7661020();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1D757C000, v68, v67, "%{public}s/%s: Tunnel connection cancelled", (uint8_t *)v69, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1D9474C60](v70, -1, -1);
            MEMORY[0x1D9474C60](v69, -1, -1);
          }
          sub_1D76605D0();
          LOBYTE(v87) = 1;
        }
        v84(&v87);
        goto LABEL_44;
      }
      os_log_type_t v58 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      uint64_t v51 = qword_1EA82C740;
      swift_retain();
      os_log_type_t v52 = v58;
      if (os_log_type_enabled(v51, v58))
      {
        swift_retain();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        os_log_type_t v86 = (void *)v54;
        *(_DWORD *)uint64_t v53 = 136446466;
        uint64_t v59 = *(void *)(v9 + 16);
        unint64_t v60 = *(void *)(v9 + 24);
        swift_bridgeObjectRetain();
        uint64_t v87 = sub_1D758DBE8(v59, v60, (uint64_t *)&v86);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        uint64_t v87 = 0x5F6E6F6374;
        unint64_t v88 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v87 = sub_1D758DBE8(v87, v88, (uint64_t *)&v86);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        uint64_t v57 = "%{public}s/%s: Tunnel connection preparing";
        goto LABEL_28;
      }
    }
    swift_release_n();
    return swift_release();
  }
  return result;
}

uint64_t sub_1D76344EC(char a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      if ((a1 & 1) == 0)
      {
        os_log_type_t v4 = sub_1D7660DB0();
        if (qword_1EA82AAB0 != -1) {
          swift_once();
        }
        uint64_t v5 = qword_1EA82C740;
        if (os_log_type_enabled((os_log_t)qword_1EA82C740, v4))
        {
          swift_retain_n();
          uint64_t v6 = swift_slowAlloc();
          uint64_t v7 = swift_slowAlloc();
          uint64_t v10 = v7;
          *(_DWORD *)uint64_t v6 = 136446466;
          uint64_t v8 = *(void *)(v3 + 16);
          unint64_t v9 = *(void *)(v3 + 24);
          swift_bridgeObjectRetain();
          sub_1D758DBE8(v8, v9, &v10);
          sub_1D7661020();
          swift_bridgeObjectRelease();
          *(_WORD *)(v6 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_1D7660BC0();
          swift_bridgeObjectRelease();
          sub_1D758DBE8(0x5F6E6F6374, 0xE500000000000000, &v10);
          sub_1D7661020();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1D757C000, v5, v4, "%{public}s/%s: Cancelling tunnel connection as it is no longer viable", (uint8_t *)v6, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1D9474C60](v7, -1, -1);
          MEMORY[0x1D9474C60](v6, -1, -1);
        }
        sub_1D76605D0();
        sub_1D76605D0();
      }
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1D7634768()
{
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_1D7661100();
  sub_1D7660BC0();
  swift_getMetatypeMetadata();
  sub_1D7660B60();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  sub_1D7660BC0();
  OUTLINED_FUNCTION_7_13();
  v9[0] = v0;
  v9[1] = v1;
  swift_bridgeObjectRetain();
  sub_1D7660BC0();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D7660BC0();
  uint64_t v2 = sub_1D76603E0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v4 = v3;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D76605F0();
  sub_1D7661200();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  sub_1D7660BC0();
  return v10;
}

uint64_t TCPTunnelConnection.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D75941DC(*(void *)(v0 + 56), *(void *)(v0 + 64));
  return v0;
}

uint64_t TCPTunnelConnection.__deallocating_deinit()
{
  TCPTunnelConnection.deinit();
  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t (*sub_1D7634998())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_1D76349F4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D7634A50()
{
  return sub_1D7634768();
}

uint64_t sub_1D7634A74@<X0>(void *a1@<X8>)
{
  return TCPTunnelConnection.identifier.getter(a1);
}

uint64_t sub_1D7634A98()
{
  return sub_1D7633184();
}

uint64_t sub_1D7634ABC()
{
  return sub_1D76331A8();
}

void sub_1D7634AE0()
{
}

uint64_t sub_1D7634B04(__int16 a1, __int16 a2)
{
  if (a1 == 2) {
    return a2 == 2;
  }
  if (a1 == 3) {
    return a2 == 3;
  }
  if ((a2 & 0xFE) == 2) {
    return 0;
  }
  if (((a1 & 1) == 0) == (a2 & 1)) {
    return 0;
  }
  else {
    return ((a1 & 0x100) == 0) ^ ((unsigned __int16)(a2 & 0x100) >> 8);
  }
}

uint64_t sub_1D7634B7C(__int16 *a1, __int16 *a2)
{
  return sub_1D7634B04(*a1, *a2);
}

uint64_t sub_1D7634B88()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_4_3();
  if (!*(void *)(v0 + 48)) {
    return 1280;
  }
  uint64_t v2 = swift_retain();
  uint64_t v3 = MEMORY[0x1D9472C20](v2);
  uint64_t v4 = nw_protocol_copy_quic_definition();
  nw_protocol_metadata_t v5 = nw_connection_copy_protocol_metadata(v3, v4);
  swift_unknownObjectRelease();
  uint64_t result = swift_unknownObjectRelease();
  if (v5)
  {
    unsigned int v7 = MEMORY[0x1D94744D0](v5);
    os_log_type_t v8 = sub_1D7660DD0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    unint64_t v9 = qword_1EA82C740;
    swift_retain_n();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136446722;
      unsigned int v15 = v7;
      uint64_t v12 = *(void *)(v1 + 56);
      unint64_t v11 = *(void *)(v1 + 64);
      swift_bridgeObjectRetain();
      sub_1D758DBE8(v12, v11, v18);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t v16 = v13;
      unint64_t v17 = v14;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      sub_1D758DBE8(v16, v17, v18);
      unsigned int v7 = v15;
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 22) = 2048;
      sub_1D7661020();
      _os_log_impl(&dword_1D757C000, v9, v8, "%{public}s/%s: Tunnel MTU datagaram = %ld", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {
      swift_release_n();
    }
    swift_release();
    swift_unknownObjectRelease();
    if (v7) {
      return v7;
    }
    else {
      return 1280;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1D7634E34()
{
  OUTLINED_FUNCTION_97();
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_4_3();
  uint64_t v5 = *(void *)(v1 + 48);
  if (!v5)
  {
    sub_1D7660DC0();
    if (qword_1EA82AAB0 != -1) {
      goto LABEL_36;
    }
    goto LABEL_9;
  }
  uint64_t v6 = sub_1D76607F0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v97 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_52();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C120);
  uint64_t v10 = OUTLINED_FUNCTION_23_0(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_51();
  swift_retain();
  uint64_t v96 = v5;
  sub_1D76604F0();
  if (__swift_getEnumTagSinglePayload(v0, 1, v6) == 1)
  {
    sub_1D758C650(v0, &qword_1EA82C120);
    os_log_type_t v11 = sub_1D7660DC0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    uint64_t v12 = qword_1EA82C740;
    if (os_log_type_enabled((os_log_t)qword_1EA82C740, v11))
    {
      swift_retain_n();
      uint64_t v13 = OUTLINED_FUNCTION_40_0();
      v119[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136446466;
      uint64_t v14 = *(void *)(v4 + 56);
      unint64_t v15 = *(void *)(v4 + 64);
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_1D758DBE8(v14, v15, v119);
      OUTLINED_FUNCTION_13_9(v16);
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      OUTLINED_FUNCTION_36_6();
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t v117 = sub_1D758DBE8(v117, v118, v119);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v12, v11, "%{public}s/%s: Tunnel connection path is nil", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    swift_release();
    goto LABEL_34;
  }
  v94[1] = (uint64_t)v94;
  uint64_t v95 = v4;
  OUTLINED_FUNCTION_46_4();
  v94[0] = v6;
  OUTLINED_FUNCTION_17_12();
  v17();
  uint64_t v18 = sub_1D76607E0();
  uint64_t v117 = MEMORY[0x1E4FBC860];
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v20 = sub_1D76604A0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v22 = v21;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_12_8();
  os_log_t v115 = v25;
  uint64_t v116 = v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
  uint64_t v27 = OUTLINED_FUNCTION_23_0(v26);
  uint64_t v29 = *(void *)(v28 + 64);
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_28_8();
  *(void *)(v30 - 256) = v19;
  uint64_t v101 = v3;
  if (!v19)
  {
LABEL_24:
    OUTLINED_FUNCTION_44_4();
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v71 = sub_1D758C650(v2, (uint64_t *)&unk_1EA82BC80);
    uint64_t v72 = MEMORY[0x1F4188790](v71);
    OUTLINED_FUNCTION_24_7(v72, v73, v74, v75, v76, v77, v78, v79, v94[0]);
    swift_release();
    if (__swift_getEnumTagSinglePayload(v29, 1, v20) == 1)
    {
      sub_1D758C650(v29, (uint64_t *)&unk_1EA82BC80);
      uint64_t v80 = 0;
      unint64_t v81 = 0;
    }
    else
    {
      uint64_t v80 = sub_1D7660470();
      unint64_t v81 = v82;
      ((void (*)(uint64_t, uint64_t))v22[1])(v29, v20);
    }
    uint64_t v83 = v95;
    os_log_type_t v84 = sub_1D7660DD0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    char v85 = qword_1EA82C740;
    swift_retain_n();
    if (os_log_type_enabled(v85, v84))
    {
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      uint64_t v86 = swift_slowAlloc();
      uint64_t v116 = swift_slowAlloc();
      v119[0] = v116;
      *(_DWORD *)uint64_t v86 = 136446722;
      os_log_t v115 = v85;
      uint64_t v87 = *(void *)(v83 + 56);
      unint64_t v88 = *(void *)(v83 + 64);
      swift_bridgeObjectRetain();
      uint64_t v89 = sub_1D758DBE8(v87, v88, v119);
      OUTLINED_FUNCTION_13_9(v89);
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v86 + 12) = 2080;
      uint64_t v90 = v97;
      OUTLINED_FUNCTION_36_6();
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t v91 = sub_1D758DBE8(v117, v118, v119);
      OUTLINED_FUNCTION_13_9(v91);
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v86 + 22) = 2080;
      uint64_t v117 = v80;
      unint64_t v118 = v81;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82B890);
      uint64_t v92 = sub_1D7660B60();
      uint64_t v117 = sub_1D758DBE8(v92, v93, v119);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v115, v84, "%{public}s/%s: Tunnel connection path interface name: %s", (uint8_t *)v86, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v101, v94[0]);
    }
    else
    {
      swift_release();
      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v3, v94[0]);
    }
    goto LABEL_34;
  }
  unint64_t v31 = 0;
  v114 = (void (**)(void))(v22 + 4);
  uint64_t v102 = (void (**)(void))(v22 + 1);
  uint64_t v100 = v22;
  uint64_t v99 = v18;
  __int16 v98 = v22 + 2;
  uint64_t v113 = v20;
  while (v31 < *(void *)(v18 + 16))
  {
    unint64_t v108 = (*((unsigned __int8 *)v22 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v22 + 80);
    uint64_t v107 = v22[9];
    uint64_t v22 = (uint64_t *)v22[2];
    ((void (*)(uint64_t, unint64_t, uint64_t))v22)(v2, v18 + v108 + v107 * v31, v20);
    OUTLINED_FUNCTION_19_9();
    if (v32)
    {
      uint64_t v22 = v100;
      goto LABEL_26;
    }
    unint64_t v111 = v31;
    uint64_t v112 = v94;
    uint64_t v106 = *v114;
    OUTLINED_FUNCTION_17_12();
    v33();
    uint64_t v2 = sub_1D7660460();
    uint64_t v110 = v94;
    OUTLINED_FUNCTION_0_5();
    uint64_t v35 = v34;
    uint64_t v37 = *(void *)(v36 + 64);
    MEMORY[0x1F4188790](v38);
    uint64_t v39 = sub_1D7660480();
    uint64_t v109 = v94;
    MEMORY[0x1F4188790](v39);
    unint64_t v105 = (v37 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v40 = *MEMORY[0x1E4F389B0];
    uint64_t v3 = v35 + 104;
    uint64_t v104 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 104);
    v104((char *)v94 - v105, v40, v2);
    sub_1D759365C(&qword_1EA82C748, MEMORY[0x1F418D9C8]);
    OUTLINED_FUNCTION_48_3();
    uint64_t v103 = v41;
    char v42 = sub_1D7660AD0();
    int v43 = *(void (**)(void))(v35 + 8);
    OUTLINED_FUNCTION_45();
    v43();
    OUTLINED_FUNCTION_45();
    uint64_t v44 = ((uint64_t (*)(void))v43)();
    MEMORY[0x1F4188790](v44);
    unint64_t v46 = (char *)v94 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v47 = ((uint64_t (*)(char *, uint64_t, uint64_t))v22)(v46, v116, v113);
    if ((v42 & 1) == 0)
    {
      uint64_t v20 = v113;
      ((void (*)(char *, uint64_t))*v102)(v46, v113);
      OUTLINED_FUNCTION_42_3();
LABEL_18:
      uint64_t v54 = MEMORY[0x1F4188790](v52);
      OUTLINED_FUNCTION_29_9(v54, v55, v56, v57, v58, v59, v60, v61, v94[0]);
      uint64_t v62 = v106;
      OUTLINED_FUNCTION_17_12();
      v62();
      uint64_t v63 = v117;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1D75A6550(0, *(void *)(v63 + 16) + 1, 1);
        uint64_t v63 = v117;
      }
      unint64_t v65 = *(void *)(v63 + 16);
      unint64_t v64 = *(void *)(v63 + 24);
      uint64_t v2 = v65 + 1;
      if (v65 >= v64 >> 1)
      {
        sub_1D75A6550(v64 > 1, v65 + 1, 1);
        uint64_t v63 = v117;
      }
      *(void *)(v63 + 16) = v2;
      OUTLINED_FUNCTION_43_3(v108);
      OUTLINED_FUNCTION_17_12();
      uint64_t v53 = ((uint64_t (*)(void))v62)();
      uint64_t v117 = v63;
      goto LABEL_23;
    }
    uint64_t v109 = v94;
    MEMORY[0x1F4188790](v47);
    unint64_t v48 = v105;
    uint64_t v110 = v94;
    uint64_t v49 = sub_1D7660480();
    uint64_t v22 = v94;
    MEMORY[0x1F4188790](v49);
    v104((char *)v94 - v48, *MEMORY[0x1E4F389C8], v2);
    OUTLINED_FUNCTION_48_3();
    char v50 = sub_1D7660AD0();
    OUTLINED_FUNCTION_45();
    v43();
    OUTLINED_FUNCTION_45();
    v43();
    uint64_t v51 = *v102;
    uint64_t v20 = v113;
    OUTLINED_FUNCTION_45_1();
    v51();
    OUTLINED_FUNCTION_42_3();
    if ((v50 & 1) == 0) {
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_45_1();
    uint64_t v53 = ((uint64_t (*)(void))v51)();
LABEL_23:
    unint64_t v31 = v111 + 1;
    MEMORY[0x1F4188790](v53);
    OUTLINED_FUNCTION_12_8();
    uint64_t v116 = v66;
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
    uint64_t v68 = OUTLINED_FUNCTION_23_0(v67);
    uint64_t v29 = *(void *)(v69 + 64);
    MEMORY[0x1F4188790](v68);
    OUTLINED_FUNCTION_28_8();
    uint64_t v18 = v99;
    if (*(void *)(v70 - 256) == v31) {
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_36:
  swift_once();
LABEL_9:
  sub_1D7660010();
LABEL_34:
  OUTLINED_FUNCTION_84();
}

void sub_1D7635A10()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 == 3)
  {
    uint64_t v3 = *(void (**)(char *))(v0 + 88);
    if (v3)
    {
      char v5 = 1;
      swift_retain();
      v3(&v5);
      sub_1D75940A4((uint64_t)v3);
    }
    sub_1D7635DCC(0, 0);
  }
  else if (v1 == 2)
  {
    uint64_t v2 = *(void (**)(char *))(v0 + 88);
    if (v2)
    {
      char v4 = 0;
      swift_retain();
      v2(&v4);
      sub_1D75940A4((uint64_t)v2);
    }
  }
}

uint64_t sub_1D7635AE4()
{
  uint64_t v0 = swift_retain();
  return sub_1D7635B3C(v0);
}

uint64_t sub_1D7635B10()
{
  return swift_retain();
}

uint64_t sub_1D7635B3C(uint64_t a1)
{
  OUTLINED_FUNCTION_13_0();
  *(void *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t (*sub_1D7635B78())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D7635BBC()
{
  return swift_retain();
}

uint64_t sub_1D7635BE8()
{
  uint64_t v0 = swift_retain();
  return sub_1D7635C40(v0);
}

uint64_t sub_1D7635C14()
{
  return swift_retain();
}

uint64_t sub_1D7635C40(uint64_t a1)
{
  OUTLINED_FUNCTION_13_0();
  *(void *)(v1 + 40) = a1;
  return swift_release();
}

uint64_t (*sub_1D7635C7C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1D7635CC0()
{
  uint64_t v0 = swift_retain();
  return sub_1D7635D18(v0);
}

uint64_t sub_1D7635CEC()
{
  return swift_retain();
}

uint64_t sub_1D7635D18(uint64_t a1)
{
  OUTLINED_FUNCTION_13_0();
  *(void *)(v1 + 48) = a1;
  return swift_release();
}

uint64_t (*sub_1D7635D54())()
{
  return j_j__swift_endAccess;
}

uint64_t QUICTunnelConnection.tunnelIdentifier.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t QUICTunnelConnection.identifier.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_27_9(*(void *)(v1 + 80), a1);
}

uint64_t sub_1D7635DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 88);
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return sub_1D75940A4(v3);
}

uint64_t QUICTunnelConnection.__allocating_init(tunnelIdentifier:group:options:)()
{
  OUTLINED_FUNCTION_8_0();
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_155();
  QUICTunnelConnection.init(tunnelIdentifier:group:options:)();
  return v0;
}

uint64_t QUICTunnelConnection.init(tunnelIdentifier:group:options:)()
{
  *(_WORD *)(v0 + 16) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0;
  uint64_t v1 = sub_1D7660D20();
  OUTLINED_FUNCTION_16_9(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11, v12, v13);
  if (v14 > 8) {
    __break(1u);
  }
  *(void *)(v1 + 16) = v14;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void sub_1D7635F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  OUTLINED_FUNCTION_4_3();
  if (!*(void *)(v3 + 48))
  {
    LOBYTE(v3) = sub_1D7660DB0();
    if (qword_1EA82AAB0 == -1) {
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 >> 60)
  {
    __break(1u);
LABEL_15:
    swift_once();
LABEL_11:
    uint64_t v27 = qword_1EA82C740;
    if (os_log_type_enabled((os_log_t)qword_1EA82C740, (os_log_type_t)v3))
    {
      swift_retain_n();
      OUTLINED_FUNCTION_40_0();
      uint64_t v44 = OUTLINED_FUNCTION_20_7();
      *(_DWORD *)a3 = 136446466;
      uint64_t v28 = *(void *)(v4 + 56);
      unint64_t v29 = *(void *)(v4 + 64);
      swift_bridgeObjectRetain();
      sub_1D758DBE8(v28, v29, &v44);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(a3 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t aBlock = v30;
      unint64_t v39 = v31;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t aBlock = sub_1D758DBE8(aBlock, v39, &v44);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v27, (os_log_type_t)v3, "%{public}s/%s: Tunnel stream trying to send packets on a nil datagram stream", (uint8_t *)a3, 0x16u);
      OUTLINED_FUNCTION_21_10();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    return;
  }
  swift_retain_n();
  uint64_t v8 = swift_slowAlloc();
  if (v4)
  {
    uint64_t v32 = a2;
    swift_bridgeObjectRetain();
    unint64_t v33 = v4;
    uint64_t v34 = a1;
    uint64_t v9 = a1 + 120;
    uint64_t v10 = (uint64_t *)v8;
    while (1)
    {
      unint64_t v36 = v4;
      uint64_t v37 = v10;
      uint64_t v12 = *(void *)(v9 - 40);
      unint64_t v11 = *(void *)(v9 - 32);
      uint64_t v13 = *(void *)(v9 - 24);
      unint64_t v14 = *(void *)(v9 - 16);
      uint64_t v15 = OUTLINED_FUNCTION_50_3();
      sub_1D75934F4(v15, v16);
      sub_1D75934F4(v12, v11);
      uint64_t v35 = v13;
      sub_1D75DD424(v13, v14);
      uint64_t v17 = OUTLINED_FUNCTION_216();
      sub_1D75934F4(v17, v18);
      OUTLINED_FUNCTION_216();
      uint64_t v19 = (void *)sub_1D765FEB0();
      uint64_t v20 = NWCreateDispatchDataFromNSData();

      if (!v20) {
        break;
      }
      v9 += 96;
      *uint64_t v37 = v20;
      uint64_t v10 = v37 + 1;
      uint64_t v21 = OUTLINED_FUNCTION_50_3();
      sub_1D75933F0(v21, v22);
      sub_1D75933F0(v12, v11);
      sub_1D75DD450(v35, v14);
      uint64_t v23 = OUTLINED_FUNCTION_216();
      sub_1D75933F0(v23, v24);
      unint64_t v4 = v36 - 1;
      if (v36 == 1)
      {
        a1 = v34;
        swift_bridgeObjectRelease();
        unint64_t v4 = v33;
        a2 = v32;
        goto LABEL_8;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_8:
    MEMORY[0x1D9472C20]();
    swift_release();
    if (!HIDWORD(v4))
    {
      uint64_t v25 = (void *)swift_allocObject();
      v25[2] = v8;
      void v25[3] = a1;
      v25[4] = a2;
      v25[5] = a3;
      char v42 = sub_1D763A934;
      int v43 = v25;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      unint64_t v39 = 1107296256;
      uint64_t v40 = sub_1D7631814;
      uint64_t v41 = &block_descriptor_12;
      uint64_t v26 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      OUTLINED_FUNCTION_216();
      nw_connection_write_multiple();
      swift_release();
      _Block_release(v26);
      swift_unknownObjectRelease();
      return;
    }
  }
  sub_1D7661250();
  __break(1u);
}

void sub_1D763633C(int a1, uint64_t a2, uint64_t a3, void (*a4)(void *))
{
  sub_1D75AEF50(0, &qword_1EA82C750);
  swift_arrayDestroy();
  MEMORY[0x1D9474C60](a2, -1, -1);
  if (a1)
  {
    uint64_t v7 = sub_1D765FC50();
    uint64_t v8 = *(void *)(v7 - 8);
    MEMORY[0x1F4188790](v7);
    uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1D7660A50();
    sub_1D765FC20();
    unint64_t v11 = (void *)sub_1D765FC40();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    unint64_t v11 = 0;
  }
  a4(v11);
}

uint64_t sub_1D76364C0(uint64_t a1, void (*a2)(void *))
{
  uint64_t result = OUTLINED_FUNCTION_21_0();
  if (*(void *)(v2 + 40))
  {
    swift_retain();
    sub_1D7631868(a1, a2);
    return swift_release();
  }
  return result;
}

void sub_1D7636534(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_4_3();
  if (*(void *)(v2 + 48))
  {
    uint64_t v8 = OUTLINED_FUNCTION_55();
    *(void *)(v8 + 16) = MEMORY[0x1E4FBC860];
    uint64_t v9 = swift_retain();
    MEMORY[0x1D9472C20](v9);
    uint64_t v10 = OUTLINED_FUNCTION_55();
    swift_weakInit();
    unint64_t v11 = (void *)swift_allocObject();
    v11[2] = v10;
    v11[3] = a1;
    v11[4] = a2;
    v11[5] = v8;
    unint64_t v22 = sub_1D763A9D0;
    uint64_t v23 = v11;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    unint64_t v19 = 1107296256;
    uint64_t v20 = sub_1D7636F50;
    uint64_t v21 = &block_descriptor_36;
    uint64_t v12 = _Block_copy(&v18);
    swift_retain();
    swift_retain();
    swift_release();
    nw_connection_receive_multiple();
    swift_release();
    _Block_release(v12);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    os_log_type_t v13 = sub_1D7660DB0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    if (os_log_type_enabled((os_log_t)qword_1EA82C740, v13))
    {
      swift_retain_n();
      OUTLINED_FUNCTION_40_0();
      uint64_t v24 = OUTLINED_FUNCTION_20_7();
      OUTLINED_FUNCTION_54_1(4.8752e-34);
      sub_1D758DBE8(v4, v5, &v24);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v3 + 12) = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t v18 = v14;
      unint64_t v19 = v15;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      sub_1D758DBE8(v18, v19, &v24);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_22_8(&dword_1D757C000, v16, v17, "%{public}s/%s: Tunnel stream trying to receive packets on a nil datagram stream");
      OUTLINED_FUNCTION_21_10();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
  }
}

uint64_t sub_1D763680C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(void *, uint64_t), uint64_t a7, uint64_t a8)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (a4)
    {
      uint64_t v14 = sub_1D7660800();
      uint64_t v15 = *(void *)(v14 - 8);
      MEMORY[0x1F4188790](v14);
      uint64_t v17 = (char *)v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      swift_unknownObjectRetain();
      sub_1D7660810();
      sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
      uint64_t v18 = (void *)swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v19, v17, v14);
      a6(v18, 1);

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    }
    else
    {
      uint64_t v20 = NWCreateNSDataFromDispatchData();
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = sub_1D765FED0();
        unint64_t v24 = v23;

        sub_1D75934F4(v22, v24);
        TunnelPacket.init(data:)(v22, v24, (uint64_t)&v61);
        v47[1] = a7;
        unint64_t v48 = a6;
        uint64_t v59 = v22;
        unint64_t v60 = v24;
        uint64_t v26 = (uint64_t *)(a8 + 16);
        int v57 = v61;
        uint64_t v56 = v62;
        uint64_t v55 = v63;
        int v54 = v64;
        uint64_t v28 = v65;
        unint64_t v27 = v66;
        uint64_t v52 = v65;
        unint64_t v53 = v66;
        uint64_t v30 = v67;
        unint64_t v29 = v68;
        uint64_t v51 = v67;
        uint64_t v31 = v69;
        uint64_t v58 = v69;
        unint64_t v49 = v70;
        uint64_t v32 = v71;
        unint64_t v33 = v72;
        uint64_t v50 = v71;
        swift_beginAccess();
        sub_1D75934F4(v28, v27);
        unint64_t v34 = v29;
        sub_1D75934F4(v30, v29);
        uint64_t v35 = v31;
        unint64_t v36 = v49;
        sub_1D75DD424(v35, v49);
        unint64_t v37 = v33;
        sub_1D75934F4(v32, v33);
        sub_1D76215F4();
        uint64_t v38 = *(void *)(*v26 + 16);
        sub_1D7621724(v38);
        uint64_t v39 = *v26;
        *(void *)(v39 + 16) = v38 + 1;
        uint64_t v40 = v39 + 96 * v38;
        *(_DWORD *)(v40 + 32) = v57;
        uint64_t v41 = v55;
        *(void *)(v40 + 40) = v56;
        *(void *)(v40 + 48) = v41;
        *(unsigned char *)(v40 + 56) = v54;
        uint64_t v42 = v52;
        unint64_t v43 = v53;
        *(void *)(v40 + 64) = v52;
        *(void *)(v40 + 72) = v43;
        uint64_t v44 = v51;
        *(void *)(v40 + 80) = v51;
        *(void *)(v40 + 88) = v34;
        *(void *)(v40 + 96) = v58;
        *(void *)(v40 + 104) = v36;
        uint64_t v45 = v50;
        *(void *)(v40 + 112) = v50;
        *(void *)(v40 + 120) = v37;
        swift_endAccess();
        sub_1D75933F0(v42, v43);
        sub_1D75933F0(v44, v34);
        sub_1D75DD450(v58, v36);
        sub_1D75933F0(v45, v37);
        if (a3)
        {
          swift_beginAccess();
          uint64_t v46 = swift_bridgeObjectRetain();
          v48((void *)v46, 0);
          swift_release();
          sub_1D75933F0(v59, v60);
          return swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
          return sub_1D75933F0(v59, v60);
        }
      }
      else
      {
        sub_1D75AF4C0();
        sub_1D7661640();
        uint64_t v73 = v61;
        uint64_t v74 = v62;
        sub_1D75B0D60();
        uint64_t v25 = (void *)swift_allocError();
        sub_1D76616A0();
        a6(v25, 1);

        return swift_release();
      }
    }
  }
  return result;
}

void sub_1D7636F50(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  id v10 = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9(a2, a3, a4, a5);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t sub_1D7637000(uint64_t a1, uint64_t a2)
{
  uint64_t result = OUTLINED_FUNCTION_21_0();
  uint64_t v6 = *(void *)(v2 + 40);
  if (v6)
  {
    uint64_t v7 = (void *)OUTLINED_FUNCTION_192();
    v7[2] = a1;
    v7[3] = a2;
    v7[4] = v6;
    swift_retain_n();
    swift_retain();
    sub_1D76330FC();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1D76370A4()
{
  OUTLINED_FUNCTION_4_3();
  swift_retain();
  sub_1D76607A0();
  swift_release();
  OUTLINED_FUNCTION_4_3();
  if (*(void *)(v0 + 40))
  {
    swift_retain();
    sub_1D76605D0();
    swift_release();
  }
  OUTLINED_FUNCTION_21_0();
  if (*(void *)(v0 + 48))
  {
    swift_retain();
    sub_1D76605D0();
    swift_release();
  }
  sub_1D7635C40(0);
  sub_1D7635D18(0);
  *(_WORD *)(v0 + 16) = 3;
  sub_1D7635A10();
}

uint64_t sub_1D7637168(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)OUTLINED_FUNCTION_192();
  void v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  id v7 = a1;
  swift_retain();
  sub_1D7635DCC((uint64_t)sub_1D763AA28, (uint64_t)v6);
  OUTLINED_FUNCTION_21_0();
  uint64_t v8 = OUTLINED_FUNCTION_55();
  swift_weakInit();
  uint64_t v9 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_52_3();
  id v10 = (void *)OUTLINED_FUNCTION_192();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v7;
  id v11 = v7;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D763AAAC);
  sub_1D7660760();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_55();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D763AAB8);
  OUTLINED_FUNCTION_155();
  sub_1D7660770();
  swift_release();
  swift_release_n();
  swift_retain();
  sub_1D7660790();
  return swift_release();
}

void sub_1D7637344()
{
  OUTLINED_FUNCTION_97();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  v23[0] = v9;
  char v11 = *v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  *(void *)(v12 + 24) = v6;
  *(unsigned char *)(v12 + 32) = v11;
  v24[4] = v4;
  v24[5] = v12;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 1107296256;
  v24[2] = sub_1D75D6460;
  v24[3] = v2;
  os_log_type_t v13 = _Block_copy(v24);
  sub_1D7660950();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1D7660930();
  uint64_t v17 = sub_1D7660910();
  OUTLINED_FUNCTION_0_5();
  uint64_t v19 = v18;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_25();
  v23[1] = MEMORY[0x1E4FBC860];
  sub_1D759365C((unint64_t *)&qword_1EBDEBD90, MEMORY[0x1F41AAEC0]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
  sub_1D75D8A04((unint64_t *)&qword_1EBDEBDF0, (uint64_t *)&unk_1EBDEBDE0);
  sub_1D7661090();
  MEMORY[0x1D9473560](0, v16, v0, v13);
  _Block_release(v13);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v0, v17);
  uint64_t v21 = OUTLINED_FUNCTION_50_3();
  v22(v21);
  swift_release();
  OUTLINED_FUNCTION_84();
}

uint64_t sub_1D7637558(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return swift_release();
  }
  uint64_t v64 = Strong;
  uint64_t v5 = sub_1D7660780();
  uint64_t v65 = &v58;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v9(v8, a1, v5);
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (MEMORY[0x1E4F38AE0] && v10 == *MEMORY[0x1E4F38AE0])
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))((char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    uint64_t v11 = sub_1D7660800();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(void *)(v12 + 64);
    MEMORY[0x1F4188790](v11);
    unint64_t v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v15 = (char *)&v58 - v14;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)&v58 - v14, v8, v11);
    uint64_t v16 = sub_1D7660DD0();
    os_log_type_t v17 = v16;
    if (qword_1EA82AAB0 != -1) {
      uint64_t v16 = swift_once();
    }
    uint64_t v18 = qword_1EA82C740;
    MEMORY[0x1F4188790](v16);
    uint64_t v19 = (char *)&v58 - v14;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v19, v15, v11);
    swift_retain();
    int v20 = v17;
    os_log_t v63 = v18;
    if (os_log_type_enabled(v18, v17))
    {
      swift_retain();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      unint64_t v68 = (void *)v60;
      *(_DWORD *)uint64_t v21 = 136446722;
      LODWORD(v59) = v20;
      uint64_t v61 = &v58;
      uint64_t v23 = *(void *)(v3 + 56);
      unint64_t v22 = *(void *)(v3 + 64);
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_1D758DBE8(v23, v22, (uint64_t *)&v68);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v62 = &v58;
      uint64_t v66 = 0x5F6E6F6374;
      unint64_t v67 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t v66 = sub_1D758DBE8(v66, v67, (uint64_t *)&v68);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 22) = 2080;
      sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
      uint64_t v24 = sub_1D7661620();
      uint64_t v66 = sub_1D758DBE8(v24, v25, (uint64_t *)&v68);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
      v26(v19, v11);
      _os_log_impl(&dword_1D757C000, v63, (os_log_type_t)v59, "%{public}s/%s: Group tunnel connection waiting, error: %s", (uint8_t *)v21, 0x20u);
      uint64_t v27 = v60;
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v27, -1, -1);
      MEMORY[0x1D9474C60](v21, -1, -1);
      swift_release();
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v26)(v15, v11);
    }
    else
    {
      swift_release_n();
      swift_release();
      int v57 = *(void (**)(char *, uint64_t))(v12 + 8);
      v57(v19, v11);
      return ((uint64_t (*)(char *, uint64_t))v57)(v15, v11);
    }
  }
  if (!MEMORY[0x1E4F38AD0] || v10 != *MEMORY[0x1E4F38AD0])
  {
    if (MEMORY[0x1E4F38AB8] && v10 == *MEMORY[0x1E4F38AB8])
    {
      os_log_type_t v45 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      uint64_t v46 = qword_1EA82C740;
      swift_retain_n();
      if (!os_log_type_enabled(v46, v45))
      {
        swift_release_n();
        return swift_release();
      }
      uint64_t v47 = swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      unint64_t v68 = (void *)v48;
      *(_DWORD *)uint64_t v47 = 136446466;
      uint64_t v49 = *(void *)(v3 + 56);
      unint64_t v50 = *(void *)(v3 + 64);
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_1D758DBE8(v49, v50, (uint64_t *)&v68);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      uint64_t v66 = 0x5F6E6F6374;
      unint64_t v67 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t v66 = sub_1D758DBE8(v66, v67, (uint64_t *)&v68);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v46, v45, "%{public}s/%s: Group tunnel connection setup", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v48, -1, -1);
      MEMORY[0x1D9474C60](v47, -1, -1);
    }
    else
    {
      if (MEMORY[0x1E4F38AB0] && v10 == *MEMORY[0x1E4F38AB0])
      {
        swift_beginAccess();
        swift_retain();
        sub_1D76385BC();
        swift_release();
        swift_retain();
        sub_1D76385BC();
        swift_release();
        swift_release();
        return swift_release();
      }
      if (!MEMORY[0x1E4F38AE8] || v10 != *MEMORY[0x1E4F38AE8])
      {
        MEMORY[0x1F4188790](v10);
        v9((char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
        uint64_t v66 = 0;
        unint64_t v67 = 0xE000000000000000;
        sub_1D7661100();
        sub_1D7660BC0();
        sub_1D7661200();
        uint64_t result = sub_1D7661260();
        __break(1u);
        return result;
      }
      os_log_type_t v51 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      uint64_t v52 = qword_1EA82C740;
      if (os_log_type_enabled((os_log_t)qword_1EA82C740, v51))
      {
        swift_retain_n();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        unint64_t v68 = (void *)v54;
        *(_DWORD *)uint64_t v53 = 136446466;
        uint64_t v55 = *(void *)(v3 + 56);
        unint64_t v56 = *(void *)(v3 + 64);
        swift_bridgeObjectRetain();
        uint64_t v66 = sub_1D758DBE8(v55, v56, (uint64_t *)&v68);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        uint64_t v66 = 0x5F6E6F6374;
        unint64_t v67 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v66 = sub_1D758DBE8(v66, v67, (uint64_t *)&v68);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D757C000, v52, v51, "%{public}s/%s: Group tunnel connection cancelled", (uint8_t *)v53, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v54, -1, -1);
        MEMORY[0x1D9474C60](v53, -1, -1);
      }
      sub_1D76370A4();
    }
    swift_release();
    return swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 96))((char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  uint64_t v28 = sub_1D7660800();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(void *)(v29 + 64);
  MEMORY[0x1F4188790](v28);
  unint64_t v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = (char *)&v58 - v31;
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))((char *)&v58 - v31, v8, v28);
  uint64_t v33 = sub_1D7660DB0();
  os_log_type_t v34 = v33;
  if (qword_1EA82AAB0 != -1) {
    uint64_t v33 = swift_once();
  }
  os_log_t v63 = (os_log_t)&v58;
  uint64_t v35 = qword_1EA82C740;
  MEMORY[0x1F4188790](v33);
  unint64_t v36 = (char *)&v58 - v31;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v36, v32, v28);
  if (os_log_type_enabled(v35, v34))
  {
    swift_retain_n();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v62 = &v58;
    uint64_t v38 = v37;
    uint64_t v61 = (uint64_t *)swift_slowAlloc();
    unint64_t v68 = v61;
    *(_DWORD *)uint64_t v38 = 136446722;
    LODWORD(v60) = v34;
    os_log_t v59 = v35;
    uint64_t v40 = *(void *)(v3 + 56);
    unint64_t v39 = *(void *)(v3 + 64);
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_1D758DBE8(v40, v39, (uint64_t *)&v68);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v66 = 0x5F6E6F6374;
    unint64_t v67 = 0xE500000000000000;
    swift_bridgeObjectRetain();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    uint64_t v66 = sub_1D758DBE8(v66, v67, (uint64_t *)&v68);
    sub_1D7661020();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 22) = 2080;
    sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
    uint64_t v41 = sub_1D7661620();
    uint64_t v66 = sub_1D758DBE8(v41, v42, (uint64_t *)&v68);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    unint64_t v43 = *(void (**)(char *, uint64_t))(v29 + 8);
    v43(v36, v28);
    _os_log_impl(&dword_1D757C000, v59, (os_log_type_t)v60, "%{public}s/%s: Group tunnel connection failed, error: %s", (uint8_t *)v38, 0x20u);
    uint64_t v44 = v61;
    swift_arrayDestroy();
    MEMORY[0x1D9474C60](v44, -1, -1);
    MEMORY[0x1D9474C60](v38, -1, -1);
  }
  else
  {
    unint64_t v43 = *(void (**)(char *, uint64_t))(v29 + 8);
    v43(v36, v28);
  }
  sub_1D76370A4();
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v43)(v32, v28);
}

uint64_t sub_1D7638394()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    os_log_type_t v2 = sub_1D7660DB0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_1EA82C740;
    if (os_log_type_enabled((os_log_t)qword_1EA82C740, v2))
    {
      swift_retain_n();
      uint64_t v4 = swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v8 = v5;
      *(_DWORD *)uint64_t v4 = 136446466;
      uint64_t v6 = *(void *)(v1 + 56);
      unint64_t v7 = *(void *)(v1 + 64);
      swift_bridgeObjectRetain();
      sub_1D758DBE8(v6, v7, &v8);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v4 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      sub_1D758DBE8(0x5F6E6F6374, 0xE500000000000000, &v8);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v3, v2, "%{public}s/%s: Unexpected stream received", (uint8_t *)v4, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v5, -1, -1);
      MEMORY[0x1D9474C60](v4, -1, -1);
    }
    return swift_release();
  }
  return result;
}

void sub_1D76385BC()
{
  OUTLINED_FUNCTION_97();
  char v3 = v2;
  sub_1D7660710();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C118);
  uint64_t v5 = OUTLINED_FUNCTION_23_0(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_25();
  uint64_t v6 = sub_1D76603E0();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v6);
  uint64_t v7 = sub_1D76607B0();
  sub_1D758C650(v0, &qword_1EA82C118);
  if (v7)
  {
    sub_1D7638804(v7, v3 & 1);
    swift_release();
  }
  else
  {
    os_log_type_t v8 = sub_1D7660DB0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    if (os_log_type_enabled((os_log_t)qword_1EA82C740, v8))
    {
      swift_retain_n();
      OUTLINED_FUNCTION_40_0();
      uint64_t v15 = OUTLINED_FUNCTION_20_7();
      OUTLINED_FUNCTION_54_1(4.8752e-34);
      sub_1D758DBE8(v0, v1, &v15);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      MEMORY[0xC] = 2080;
      OUTLINED_FUNCTION_7_13();
      uint64_t v13 = v9;
      unint64_t v14 = v10;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      sub_1D758DBE8(v13, v14, &v15);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_22_8(&dword_1D757C000, v11, v12, "%{public}s/%s: Can't extract a stream from the group connection");
      OUTLINED_FUNCTION_21_10();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    sub_1D76370A4();
  }
  OUTLINED_FUNCTION_84();
}

uint64_t sub_1D7638804(uint64_t a1, char a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_51_3();
  uint64_t v5 = OUTLINED_FUNCTION_192();
  *(void *)(v5 + 16) = v4;
  *(unsigned char *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a1;
  swift_retain();
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D763B4D0);
  sub_1D7660540();
  swift_release();
  swift_release();
  uint64_t v6 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_51_3();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = a1;
  swift_retain();
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D763B524);
  OUTLINED_FUNCTION_50_3();
  sub_1D7660550();
  swift_release();
  swift_release();
  return sub_1D76605B0();
}

uint64_t sub_1D7638944(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = result;
    int v84 = a3;
    uint64_t v9 = sub_1D76605A0();
    char v85 = &v77;
    Class isa = v9[-1].isa;
    uint64_t v11 = *((void *)isa + 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = *((void *)isa + 2);
    ((void (*)(char *, uint64_t, NSObject *))v13)(v12, a1, v9);
    uint64_t v14 = (*((uint64_t (**)(char *, NSObject *))isa + 11))(v12, v9);
    if (MEMORY[0x1E4F38A20] && v14 == *MEMORY[0x1E4F38A20])
    {
      uint64_t v83 = a4;
      (*((void (**)(char *, NSObject *))isa + 12))((char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
      uint64_t v15 = sub_1D7660800();
      unint64_t v82 = &v77;
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v17 = *(void *)(v16 + 64);
      MEMORY[0x1F4188790](v15);
      unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v19 = (char *)&v77 - v18;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)&v77 - v18, v12, v15);
      uint64_t v20 = sub_1D7660DD0();
      os_log_type_t v21 = v20;
      if (qword_1EA82AAB0 != -1) {
        uint64_t v20 = swift_once();
      }
      unint64_t v22 = qword_1EA82C740;
      MEMORY[0x1F4188790](v20);
      uint64_t v23 = (char *)&v77 - v18;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))((char *)&v77 - v18, (char *)&v77 - v18, v15);
      os_log_t v81 = v22;
      if (os_log_type_enabled(v22, v21))
      {
        swift_retain_n();
        uint64_t v24 = swift_slowAlloc();
        os_log_t v80 = (os_log_t)swift_slowAlloc();
        os_log_t v88 = v80;
        *(_DWORD *)uint64_t v24 = 136446978;
        int v79 = v21;
        uint64_t v25 = *(void *)(v8 + 56);
        unint64_t v26 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_1D758DBE8(v25, v26, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        uint64_t v78 = v24 + 14;
        uint64_t v86 = 0x5F6E6F6374;
        unint64_t v87 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v86 = sub_1D758DBE8(v86, v87, (uint64_t *)&v88);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 22) = 1024;
        LODWORD(v86) = v84 & 1;
        sub_1D7661020();
        *(_WORD *)(v24 + 28) = 2080;
        sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
        uint64_t v27 = sub_1D7661620();
        uint64_t v86 = sub_1D758DBE8(v27, v28, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
        v29(v23, v15);
        _os_log_impl(&dword_1D757C000, v81, (os_log_type_t)v79, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection waiting, error: %s", (uint8_t *)v24, 0x26u);
        os_log_t v30 = v80;
LABEL_14:
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v30, -1, -1);
        MEMORY[0x1D9474C60](v24, -1, -1);
LABEL_42:
        sub_1D76605D0();
        sub_1D76370A4();
        swift_release();
        return ((uint64_t (*)(char *, uint64_t))v29)(v19, v15);
      }
      goto LABEL_41;
    }
    if (MEMORY[0x1E4F38A10] && v14 == *MEMORY[0x1E4F38A10])
    {
      uint64_t v83 = a4;
      (*((void (**)(char *, NSObject *))isa + 12))((char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
      uint64_t v15 = sub_1D7660800();
      unint64_t v82 = &v77;
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v31 = *(void *)(v16 + 64);
      MEMORY[0x1F4188790](v15);
      unint64_t v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v19 = (char *)&v77 - v32;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)&v77 - v32, v12, v15);
      uint64_t v33 = sub_1D7660DB0();
      os_log_type_t v34 = v33;
      if (qword_1EA82AAB0 != -1) {
        uint64_t v33 = swift_once();
      }
      uint64_t v35 = qword_1EA82C740;
      MEMORY[0x1F4188790](v33);
      uint64_t v23 = (char *)&v77 - v32;
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))((char *)&v77 - v32, (char *)&v77 - v32, v15);
      if (os_log_type_enabled(v35, v34))
      {
        swift_retain_n();
        uint64_t v36 = swift_slowAlloc();
        os_log_t v80 = v35;
        uint64_t v24 = v36;
        os_log_t v81 = (os_log_t)swift_slowAlloc();
        os_log_t v88 = v81;
        *(_DWORD *)uint64_t v24 = 136446978;
        int v79 = v34;
        uint64_t v37 = *(void *)(v8 + 56);
        unint64_t v38 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_1D758DBE8(v37, v38, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2080;
        uint64_t v78 = v24 + 14;
        uint64_t v86 = 0x5F6E6F6374;
        unint64_t v87 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v86 = sub_1D758DBE8(v86, v87, (uint64_t *)&v88);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 22) = 1024;
        LODWORD(v86) = v84 & 1;
        sub_1D7661020();
        *(_WORD *)(v24 + 28) = 2080;
        sub_1D759365C((unint64_t *)&unk_1EA82C730, MEMORY[0x1F418DB00]);
        uint64_t v39 = sub_1D7661620();
        uint64_t v86 = sub_1D758DBE8(v39, v40, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
        v29(v23, v15);
        _os_log_impl(&dword_1D757C000, v80, (os_log_type_t)v79, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection failed, error: %s", (uint8_t *)v24, 0x26u);
        os_log_t v30 = v81;
        goto LABEL_14;
      }
LABEL_41:
      uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
      v29(v23, v15);
      goto LABEL_42;
    }
    if (MEMORY[0x1E4F389F8] && v14 == *MEMORY[0x1E4F389F8]
      || MEMORY[0x1E4F38A40] && v14 == *MEMORY[0x1E4F38A40])
    {
      os_log_type_t v41 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      unint64_t v42 = qword_1EA82C740;
      if (os_log_type_enabled((os_log_t)qword_1EA82C740, v41))
      {
        swift_retain_n();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        os_log_t v88 = (os_log_t)v44;
        *(_DWORD *)uint64_t v43 = 136446722;
        uint64_t v45 = *(void *)(v8 + 56);
        unint64_t v46 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_1D758DBE8(v45, v46, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 12) = 2080;
        uint64_t v86 = 0x5F6E6F6374;
        unint64_t v87 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v86 = sub_1D758DBE8(v86, v87, (uint64_t *)&v88);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 22) = 1024;
        LODWORD(v86) = v84 & 1;
        sub_1D7661020();
        _os_log_impl(&dword_1D757C000, v42, v41, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection setup", (uint8_t *)v43, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v44, -1, -1);
        MEMORY[0x1D9474C60](v43, -1, -1);
      }
      return swift_release();
    }
    if (MEMORY[0x1E4F389F0] && v14 == *MEMORY[0x1E4F389F0])
    {
      os_log_type_t v47 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      uint64_t v9 = qword_1EA82C740;
      if (os_log_type_enabled((os_log_t)qword_1EA82C740, v47))
      {
        swift_retain_n();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        os_log_t v88 = (os_log_t)v48;
        *(_DWORD *)uint64_t v13 = 136446722;
        uint64_t v49 = *(void *)(v8 + 56);
        unint64_t v50 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_1D758DBE8(v49, v50, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v13 + 12) = 2080;
        uint64_t v86 = 0x5F6E6F6374;
        unint64_t v87 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v86 = sub_1D758DBE8(v86, v87, (uint64_t *)&v88);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v13 + 22) = 1024;
        LODWORD(v86) = v84 & 1;
        sub_1D7661020();
        _os_log_impl(&dword_1D757C000, v9, v47, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection established", (uint8_t *)v13, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v48, -1, -1);
        MEMORY[0x1D9474C60](v13, -1, -1);
      }
      sub_1D7660750();
      sub_1D7660700();
      uint64_t v11 = sub_1D7660600();
      swift_release();
      if (v11)
      {
        sub_1D7660740();
        uint64_t v51 = swift_dynamicCastClass();
        if (v51)
        {
          uint64_t v13 = v51;
          os_log_type_t v52 = sub_1D7660DD0();
          uint64_t v9 = qword_1EA82C740;
          os_log_type_t v53 = v52;
          if (os_log_type_enabled((os_log_t)qword_1EA82C740, v52))
          {
            swift_retain_n();
            uint64_t v54 = swift_slowAlloc();
            uint64_t v83 = swift_slowAlloc();
            os_log_t v88 = (os_log_t)v83;
            *(_DWORD *)uint64_t v54 = 136446466;
            uint64_t v55 = *(void *)(v8 + 56);
            unint64_t v56 = *(void *)(v8 + 64);
            swift_bridgeObjectRetain();
            uint64_t v86 = sub_1D758DBE8(v55, v56, (uint64_t *)&v88);
            sub_1D7661020();
            swift_bridgeObjectRelease();
            *(_WORD *)(v54 + 12) = 2080;
            unint64_t v82 = (uint64_t *)(v54 + 14);
            uint64_t v86 = 0x5F6E6F6374;
            unint64_t v87 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1D7660BC0();
            swift_bridgeObjectRelease();
            uint64_t v86 = sub_1D758DBE8(v86, v87, (uint64_t *)&v88);
            sub_1D7661020();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1D757C000, v9, v53, "%{public}s/%s: Tunnel stream setting keepalive on", (uint8_t *)v54, 0x16u);
            uint64_t v57 = v83;
            swift_arrayDestroy();
            MEMORY[0x1D9474C60](v57, -1, -1);
            MEMORY[0x1D9474C60](v54, -1, -1);
          }
          uint64_t v58 = sub_1D7660720();
          MEMORY[0x1F4188790](v58);
          (*(void (**)(char *, void))(v60 + 104))((char *)&v77 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F38A70]);
          sub_1D7660730();
          swift_release();
        }
        else
        {
          swift_release();
        }
      }
      if ((v84 & 1) == 0)
      {
        uint64_t v72 = *(void *)(v8 + 56);
        uint64_t v73 = *(void *)(v8 + 64);
        type metadata accessor for TCPTunnelConnection();
        uint64_t v74 = swift_allocObject();
        swift_retain();
        swift_bridgeObjectRetain();
        TCPTunnelConnection.init(tunnelIdentifier:stream:)(v72, v73);
        sub_1D7635C40(v74);
        unint64_t v68 = (__int16 *)(v8 + 16);
        __int16 v75 = *(_WORD *)(v8 + 16);
        if ((v75 & 0xFE) != 2)
        {
          int v70 = v75 & 1;
          __int16 v71 = 256;
          goto LABEL_50;
        }
LABEL_54:
        sub_1D7635A10();
        return swift_release();
      }
      uint64_t v67 = swift_retain();
      a1 = v8;
      sub_1D7635D18(v67);
      uint64_t v14 = swift_beginAccess();
      if (*(void *)(v8 + 48))
      {
        swift_retain();
        sub_1D7639EC0();
        swift_release();
        unint64_t v68 = (__int16 *)(v8 + 16);
        __int16 v69 = *(_WORD *)(v8 + 16);
        if ((v69 & 0xFE) != 2)
        {
          int v70 = v69 & 0x100;
          __int16 v71 = 1;
LABEL_50:
          if (v70) {
            __int16 v76 = 2;
          }
          else {
            __int16 v76 = v71;
          }
          *unint64_t v68 = v76;
          goto LABEL_54;
        }
        goto LABEL_54;
      }
      __break(1u);
    }
    else if (MEMORY[0x1E4F38A28] && v14 == *MEMORY[0x1E4F38A28])
    {
      os_log_type_t v61 = sub_1D7660DD0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      uint64_t v62 = qword_1EA82C740;
      if (os_log_type_enabled((os_log_t)qword_1EA82C740, v61))
      {
        swift_retain_n();
        uint64_t v63 = swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        os_log_t v88 = (os_log_t)v64;
        *(_DWORD *)uint64_t v63 = 136446722;
        uint64_t v65 = *(void *)(v8 + 56);
        unint64_t v66 = *(void *)(v8 + 64);
        swift_bridgeObjectRetain();
        uint64_t v86 = sub_1D758DBE8(v65, v66, (uint64_t *)&v88);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v63 + 12) = 2080;
        uint64_t v86 = 0x5F6E6F6374;
        unint64_t v87 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        uint64_t v86 = sub_1D758DBE8(v86, v87, (uint64_t *)&v88);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v63 + 22) = 1024;
        LODWORD(v86) = v84 & 1;
        sub_1D7661020();
        _os_log_impl(&dword_1D757C000, v62, v61, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection cancelled", (uint8_t *)v63, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v64, -1, -1);
        MEMORY[0x1D9474C60](v63, -1, -1);
      }
      sub_1D76605D0();
      sub_1D76370A4();
      return swift_release();
    }
    MEMORY[0x1F4188790](v14);
    ((void (*)(char *, uint64_t, NSObject *))v13)((char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
    uint64_t v86 = 0;
    unint64_t v87 = 0xE000000000000000;
    sub_1D7661100();
    sub_1D7660BC0();
    sub_1D7661200();
    uint64_t result = sub_1D7661260();
    __break(1u);
  }
  return result;
}

uint64_t sub_1D7639C7C(uint64_t result)
{
  if ((result & 1) == 0)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v1 = result;
      os_log_type_t v2 = sub_1D7660DB0();
      if (qword_1EA82AAB0 != -1) {
        swift_once();
      }
      char v3 = qword_1EA82C740;
      if (os_log_type_enabled((os_log_t)qword_1EA82C740, v2))
      {
        swift_retain_n();
        uint64_t v4 = swift_slowAlloc();
        uint64_t v5 = swift_slowAlloc();
        uint64_t v8 = v5;
        *(_DWORD *)uint64_t v4 = 136446466;
        uint64_t v6 = *(void *)(v1 + 56);
        unint64_t v7 = *(void *)(v1 + 64);
        swift_bridgeObjectRetain();
        sub_1D758DBE8(v6, v7, &v8);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        *(_WORD *)(v4 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_1D7660BC0();
        swift_bridgeObjectRelease();
        sub_1D758DBE8(0x5F6E6F6374, 0xE500000000000000, &v8);
        sub_1D7661020();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D757C000, v3, v2, "%{public}s/%s: Cancelling tunnel connection as it is no longer viable", (uint8_t *)v4, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v5, -1, -1);
        MEMORY[0x1D9474C60](v4, -1, -1);
      }
      sub_1D76605D0();
      sub_1D76370A4();
      return swift_release();
    }
  }
  return result;
}

void sub_1D7639EC0()
{
  OUTLINED_FUNCTION_97();
  uint64_t v1 = static Data.randomBytes(ofLength:)(0x400uLL);
  unint64_t v3 = v2;
  sub_1D7660530();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_9();
  uint64_t v5 = OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_52_3();
  *uint64_t v0 = sub_1D763B490;
  v0[1] = (uint64_t (*)(uint64_t))v5;
  uint64_t v6 = OUTLINED_FUNCTION_26_7();
  v7(v6);
  sub_1D7660520();
  swift_retain();
  sub_1D7660500();
  sub_1D7660580();
  swift_release();
  sub_1D75933F0(v1, v3);
  uint64_t v8 = OUTLINED_FUNCTION_39_5();
  v9(v8);
  swift_release();
  OUTLINED_FUNCTION_84();
}

uint64_t sub_1D7639FDC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    os_log_type_t v4 = sub_1D7660DD0();
    if (qword_1EA82AAB0 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_1EA82C740;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C148);
    uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64);
    MEMORY[0x1F4188790](v6);
    unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_1D76316AC(a1, (uint64_t)&v17 - v8);
    if (os_log_type_enabled(v5, v4))
    {
      swift_retain_n();
      uint64_t v9 = swift_slowAlloc();
      os_log_t v18 = v5;
      uint64_t v10 = v9;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v23 = v19;
      *(_DWORD *)uint64_t v10 = 136446722;
      uint64_t v17 = v6;
      uint64_t v12 = *(void *)(v3 + 56);
      unint64_t v11 = *(void *)(v3 + 64);
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_1D758DBE8(v12, v11, &v23);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v20 = &v17;
      uint64_t v21 = 0x5F6E6F6374;
      unint64_t v22 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      sub_1D7660BC0();
      swift_bridgeObjectRelease();
      uint64_t v21 = sub_1D758DBE8(v21, v22, &v23);
      sub_1D7661020();
      swift_release_n();
      uint64_t v13 = swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 22) = 2080;
      MEMORY[0x1F4188790](v13);
      sub_1D76316AC((uint64_t)&v17 - v8, (uint64_t)&v17 - v8);
      uint64_t v14 = sub_1D7660B60();
      uint64_t v21 = sub_1D758DBE8(v14, v15, &v23);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      sub_1D758C650((uint64_t)&v17 - v8, &qword_1EA82C148);
      _os_log_impl(&dword_1D757C000, v18, v4, "%{public}s/%s: Tunnel datagram stream initial send completed with error %s", (uint8_t *)v10, 0x20u);
      uint64_t v16 = v19;
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v16, -1, -1);
      MEMORY[0x1D9474C60](v10, -1, -1);
      return swift_release();
    }
    else
    {
      swift_release();
      return sub_1D758C650((uint64_t)&v17 - v8, &qword_1EA82C148);
    }
  }
  return result;
}

uint64_t QUICTunnelConnection.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D75940A4(*(void *)(v0 + 88));
  return v0;
}

uint64_t QUICTunnelConnection.__deallocating_deinit()
{
  QUICTunnelConnection.deinit();
  return MEMORY[0x1F4186488](v0, 104, 7);
}

uint64_t sub_1D763A3AC@<X0>(void *a1@<X8>)
{
  return QUICTunnelConnection.identifier.getter(a1);
}

void sub_1D763A3D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1D763A3F4(uint64_t a1, void (*a2)(void *))
{
  return sub_1D76364C0(a1, a2);
}

void sub_1D763A418(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1D763A43C(uint64_t a1, uint64_t a2)
{
  return sub_1D7637000(a1, a2);
}

void sub_1D763A460()
{
}

uint64_t sub_1D763A484(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D7637168(a1, a2, a3);
}

uint64_t sub_1D763A4A8()
{
  return sub_1D7634B88() & 0x1FFFF;
}

void sub_1D763A4D8()
{
}

uint64_t sub_1D763A4FC(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_1D763A534(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1D763A55C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_1D7661020();
  *a1 = v5;
  return result;
}

uint64_t sub_1D763A5BC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 2;
  uint64_t result = sub_1D7661020();
  *a1 = v5;
  return result;
}

uint64_t sub_1D763A61C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 4;
  uint64_t result = sub_1D7661020();
  *a1 = v5;
  return result;
}

uint64_t sub_1D763A67C()
{
  return sub_1D7661020();
}

void sub_1D763A6A4(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_1D7661020();
  *a1 = v7;
  unint64_t v8 = *a2;
  if (*a2)
  {
    *unint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_1D763A75C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1D763A78C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1D763A7BC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D763A7F4()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

void sub_1D763A828()
{
}

uint64_t sub_1D763A86C()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D763A8A4()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_5_10();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1D763A8E4(uint64_t a1)
{
  return sub_1D7633378(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1D763A8F4(char a1)
{
  return sub_1D76344EC(a1);
}

uint64_t sub_1D763A8FC()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_5_10();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

void sub_1D763A934(int a1)
{
  sub_1D763633C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_1D763A958()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D763A990()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_5_10();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1D763A9D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_1D763680C(a1, a2, a3, a4, *(void *)(v4 + 16), *(void (**)(void *, uint64_t))(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40));
}

uint64_t sub_1D763A9DC()
{
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1D763AA14(uint64_t a1, unint64_t a2, char a3)
{
  return sub_1D7631C5C(a1, a2, a3 & 1, *(void (**)(void *))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

void sub_1D763AA28()
{
}

uint64_t sub_1D763AA6C()
{
  swift_release();
  swift_release();

  uint64_t v1 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v1, v2, v3);
}

uint64_t sub_1D763AAAC(uint64_t a1)
{
  return sub_1D7637558(a1);
}

uint64_t sub_1D763AAB8()
{
  return sub_1D7638394();
}

uint64_t sub_1D763AAC0()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D7632D14();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_1D763AAEC()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D7632DDC();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_1D763AB14(uint64_t *a1)
{
  return sub_1D7632E04(*a1);
}

uint64_t sub_1D763AB3C()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D762F2D4();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_1D763AB64(uint64_t *a1)
{
  return sub_1D762F2FC(*a1);
}

uint64_t sub_1D763AB8C()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D7635B10();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_1D763ABB8()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D7635BBC();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_1D763ABE4()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D7635C14();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_1D763AC10()
{
  OUTLINED_FUNCTION_132();
  uint64_t result = sub_1D7635CEC();
  *uint64_t v0 = result;
  return result;
}

uint64_t type metadata accessor for TCPTunnelConnection()
{
  return self;
}

uint64_t method lookup function for TCPTunnelConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TCPTunnelConnection);
}

uint64_t dispatch thunk of TCPTunnelConnection.maxSupportedMTU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))() & 0x1FFFF;
}

uint64_t dispatch thunk of TCPTunnelConnection.physicalInterfaceName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TCPTunnelConnection.__allocating_init(tunnelIdentifier:stream:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of TCPTunnelConnection.send(content:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of TCPTunnelConnection.receive(minLength:maxLength:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of TCPTunnelConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of TCPTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of TCPTunnelConnection.debugDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t type metadata accessor for QUICTunnelConnection()
{
  return self;
}

uint64_t method lookup function for QUICTunnelConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QUICTunnelConnection);
}

uint64_t dispatch thunk of QUICTunnelConnection.maxSupportedMTU.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))() & 0x1FFFF;
}

uint64_t dispatch thunk of QUICTunnelConnection.physicalInterfaceName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of QUICTunnelConnection.__allocating_init(tunnelIdentifier:group:options:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of QUICTunnelConnection.send(packets:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of QUICTunnelConnection.send(controlMessage:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of QUICTunnelConnection.receivePackets(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of QUICTunnelConnection.receiveControlMessage(completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of QUICTunnelConnection.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of QUICTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t getEnumTagSinglePayload for QUICTunnelConnection.State(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD)
  {
    unsigned int v2 = a2 + 65283;
    if (a2 + 65283 <= 0xFFFEFFFF) {
      unsigned int v3 = 2;
    }
    else {
      unsigned int v3 = 4;
    }
    if (v2 < 0xFF0000) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x10000) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = *((unsigned __int8 *)a1 + 2);
        if (!*((unsigned char *)a1 + 2)) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65283;
      case 2:
        int v5 = a1[1];
        if (a1[1]) {
          return (*a1 | (v5 << 16)) - 65283;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1D763B330);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65283;
      default:
        break;
    }
  }
  unsigned int v7 = *(unsigned __int8 *)a1;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v8 = (v7 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v8 - 1;
  if (v8 <= 1) {
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for QUICTunnelConnection.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 65283;
  if (a3 + 65283 <= 0xFFFEFFFF) {
    int v4 = 2;
  }
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFD) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v7 = ((a2 - 253) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 253;
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = v7;
        break;
      case 2:
        *(_WORD *)(result + 2) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x1D763B418);
      case 4:
        *(_DWORD *)(result + 2) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *(unsigned char *)uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_1D763B440(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

_WORD *sub_1D763B45C(_WORD *result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *uint64_t result = a2 - 255;
  }
  else if (a2)
  {
    *(unsigned char *)uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for QUICTunnelConnection.State()
{
  return &type metadata for QUICTunnelConnection.State;
}

uint64_t sub_1D763B490(uint64_t a1)
{
  return sub_1D7639FDC(a1);
}

uint64_t sub_1D763B498()
{
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_21();
  return MEMORY[0x1F4186498](v0, v1, v2);
}

uint64_t sub_1D763B4D0(uint64_t a1)
{
  return sub_1D7638944(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t objectdestroy_20Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D763B524(uint64_t result)
{
  return sub_1D7639C7C(result);
}

uint64_t sub_1D763B52C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 33, 7);
}

unint64_t sub_1D763B568()
{
  unint64_t result = qword_1EA82C6B8;
  if (!qword_1EA82C6B8)
  {
    type metadata accessor for TunnelMessage();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C6B8);
  }
  return result;
}

uint64_t sub_1D763B5B8()
{
  uint64_t v1 = *(uint64_t (**)(char *))(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 32);
  return v1(&v3);
}

uint64_t OUTLINED_FUNCTION_19_9()
{
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_20_7()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_21_10()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_22_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

uint64_t OUTLINED_FUNCTION_26_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27_9@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_37_3()
{
  *(void *)(v0 - 112) = 0x5F6E6F6374;
  *(void *)(v0 - 104) = 0xE500000000000000;
}

uint64_t OUTLINED_FUNCTION_39_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51_3()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_52_3()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_54_1(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t AtomicCounter.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AtomicCounter.init()();
  return v0;
}

uint64_t AtomicCounter.init()()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E00]), sel_init);
  return v0;
}

uint64_t AtomicCounter.deinit()
{
  return v0;
}

uint64_t AtomicCounter.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for AtomicCounter()
{
  return self;
}

uint64_t method lookup function for AtomicCounter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AtomicCounter);
}

uint64_t dispatch thunk of AtomicCounter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1D763B8C8()
{
  if (*v0) {
    uint64_t v1 = 0x2D656369766544;
  }
  else {
    uint64_t v1 = 0x2D74736F48;
  }
  uint64_t v3 = v1;
  sub_1D7661500();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  return v3;
}

id sub_1D763B958@<X0>(id a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(uint64_t *)(a2 + OBJC_IVAR____TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion_rawValue) >= 12)
  {
    *(void *)&long long v16 = a1;
    sub_1D764A350((uint64_t)&v16);
    sub_1D75D2148((uint64_t)&v16, a3);
    return a1;
  }
  else
  {
    id v15 = a1;
    id v5 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC030);
    if (swift_dynamicCast())
    {
      LOBYTE(v16) = v9[1];
      *((void *)&v16 + 1) = v10;
      *(void *)uint64_t v17 = v11;
      *(_OWORD *)&v17[8] = v12;
      long long v18 = v13;
      id v19 = v14;
    }
    else
    {
      long long v16 = 0u;
      *(_OWORD *)uint64_t v17 = 0u;
      v17[16] = 2;
      v9[0] = 4;
      id v7 = a1;
      Swift::String v8 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)v9);
      sub_1D7592DD0((uint64_t)&v16);
      LOBYTE(v16) = 4;
      *((void *)&v16 + 1) = v8._countAndFlagsBits;
      *(void *)uint64_t v17 = v8._object;
      *(_OWORD *)&v17[8] = 0u;
      long long v18 = 0u;
      id v19 = a1;
    }
    sub_1D75D213C((uint64_t)&v16);
    return (id)sub_1D75D2148((uint64_t)&v16, a3);
  }
}

uint64_t PeerDeviceInfo.init(name:model:udid:ecid:deviceKVSData:deviceKVSIncludesSensitiveInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  *(void *)a9 = a5;
  *(void *)(a9 + 8) = a6;
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  *(unsigned char *)(a9 + 72) = a8 & 1;
  *(void *)(a9 + 80) = a10;
  *(void *)(a9 + 88) = a11;
  *(unsigned char *)(a9 + 96) = a12;
  return swift_bridgeObjectRetain();
}

char *PairingData.init(kind:data:startNewSession:)@<X0>(char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  char v5 = *result;
  *(unsigned char *)a5 = a4;
  *(unsigned char *)(a5 + 1) = v5;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = 0;
  *(void *)(a5 + 24) = 0;
  return result;
}

uint64_t PropertyListCodable.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t sub_1D763BB30(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E456D6165727473 && a2 == 0xEF64657470797263;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69616C70 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D763BC3C(char a1)
{
  if (a1) {
    return 0x6E69616C70;
  }
  else {
    return 0x6E456D6165727473;
  }
}

void sub_1D763BC7C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFE8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFF0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  sub_1D75D20E0(v1, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1D7649DB4();
  OUTLINED_FUNCTION_69_0();
  sub_1D76617C0();
  sub_1D75D20E0((uint64_t)v17, (uint64_t)v18);
  if (sub_1D75D497C((uint64_t)v18) == 1)
  {
    uint64_t v7 = sub_1D75D4988((uint64_t)v18);
    LOBYTE(v15[0]) = 1;
    sub_1D75D20E0((uint64_t)v17, (uint64_t)v16);
    uint64_t v8 = sub_1D75D4988((uint64_t)v16);
    sub_1D764A160(v8);
    sub_1D7649E00();
    OUTLINED_FUNCTION_37_4();
    sub_1D75D20E0(v7, (uint64_t)v15);
    sub_1D75D5010();
  }
  else
  {
    uint64_t v9 = (uint64_t *)sub_1D75D4988((uint64_t)v18);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    LOBYTE(v15[0]) = 0;
    sub_1D75D20E0((uint64_t)v17, (uint64_t)v16);
    uint64_t v12 = sub_1D75D4988((uint64_t)v16);
    sub_1D75934F4(*(void *)v12, *(void *)(v12 + 8));
    sub_1D7649F00();
    OUTLINED_FUNCTION_37_4();
    v15[0] = v10;
    v15[1] = v11;
    sub_1D75E1BB4();
  }
  sub_1D7661490();
  OUTLINED_FUNCTION_6();
  v13();
  OUTLINED_FUNCTION_6();
  v14();
  sub_1D7649E4C((uint64_t)v17);
  OUTLINED_FUNCTION_4_0();
}

void sub_1D763BF68()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  uint64_t v26 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF00);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF08);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_27();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEF8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v27 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1D7649DB4();
  OUTLINED_FUNCTION_88_1();
  sub_1D76617A0();
  if (v0) {
    goto LABEL_9;
  }
  uint64_t v10 = sub_1D76613D0();
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v12 = v7;
  if (!v11)
  {
LABEL_8:
    sub_1D7661150();
    OUTLINED_FUNCTION_3_0();
    long long v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82B490);
    *long long v18 = &unk_1F2EE6BA8;
    sub_1D76612E0();
    OUTLINED_FUNCTION_28_9();
    OUTLINED_FUNCTION_81_1();
    OUTLINED_FUNCTION_57_2();
    v19();
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v1, v12);
LABEL_9:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
    goto LABEL_10;
  }
  char v25 = *(unsigned char *)(v10 + 32);
  sub_1D75AB7D8(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
  uint64_t v14 = v13;
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (v14 != v16 >> 1)
  {
    uint64_t v12 = v7;
    goto LABEL_8;
  }
  if (v25)
  {
    LOBYTE(v30[0]) = 1;
    sub_1D7649E00();
    OUTLINED_FUNCTION_102_0();
    sub_1D76612D0();
    sub_1D75D4A88();
    sub_1D7661380();
    OUTLINED_FUNCTION_6();
    v20();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18_10();
    v21();
    sub_1D75D20E0((uint64_t)v30, (uint64_t)&v28);
    sub_1D75D20E0((uint64_t)&v28, (uint64_t)v29);
    sub_1D75D4FA4((uint64_t)v29);
    unint64_t v22 = v29;
  }
  else
  {
    LOBYTE(v30[0]) = 0;
    sub_1D7649F00();
    OUTLINED_FUNCTION_102_0();
    sub_1D76612D0();
    sub_1D75E4EB4();
    sub_1D7661380();
    OUTLINED_FUNCTION_45_1();
    v23();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18_10();
    v24();
    v30[0] = v29[0];
    sub_1D75D5000((uint64_t)v30);
    unint64_t v22 = v30;
  }
  sub_1D75D20E0((uint64_t)v22, (uint64_t)v31);
  sub_1D75D20E0((uint64_t)v31, v26);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
LABEL_10:
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D763C498(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74616E696769726FLL && a2 == 0xEC00000079426465;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65636E6575716573 && a2 == 0xEE007265626D754ELL;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1D7661560();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1D763C624(char a1)
{
  if (!a1) {
    return 0x74616E696769726FLL;
  }
  if (a1 == 1) {
    return 0x65636E6575716573;
  }
  return 0x6567617373656DLL;
}

uint64_t sub_1D763C690()
{
  return sub_1D763BC3C(*v0);
}

uint64_t sub_1D763C698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763BB30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D763C6C0(uint64_t a1)
{
  unint64_t v2 = sub_1D7649DB4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D763C6FC(uint64_t a1)
{
  unint64_t v2 = sub_1D7649DB4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D763C738(uint64_t a1)
{
  unint64_t v2 = sub_1D7649E00();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D763C774(uint64_t a1)
{
  unint64_t v2 = sub_1D7649E00();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D763C7B0(uint64_t a1)
{
  unint64_t v2 = sub_1D7649F00();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D763C7EC(uint64_t a1)
{
  unint64_t v2 = sub_1D7649F00();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D763C828()
{
}

void sub_1D763C840()
{
}

uint64_t sub_1D763C858()
{
  return sub_1D763C624(*v0);
}

uint64_t sub_1D763C860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763C498(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D763C888(uint64_t a1)
{
  unint64_t v2 = sub_1D763CA70();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D763C8C4(uint64_t a1)
{
  unint64_t v2 = sub_1D763CA70();
  return MEMORY[0x1F41862B0](a1, v2);
}

void ControlChannelMessageEnvelope.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFF8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_30();
  char v9 = *v0;
  sub_1D75D20E0((uint64_t)(v0 + 16), (uint64_t)v11);
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  sub_1D763CA70();
  sub_1D76617C0();
  v10[0] = v9;
  sub_1D763CABC();
  OUTLINED_FUNCTION_96_1();
  sub_1D7661490();
  if (!v1)
  {
    v10[0] = 1;
    sub_1D76614D0();
    sub_1D75D20E0((uint64_t)v11, (uint64_t)v10);
    OUTLINED_FUNCTION_33_7();
    sub_1D763CB08();
    OUTLINED_FUNCTION_96_1();
    sub_1D7661490();
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  OUTLINED_FUNCTION_95_1();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D763CA70()
{
  unint64_t result = qword_1EBDEBC18;
  if (!qword_1EBDEBC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBC18);
  }
  return result;
}

unint64_t sub_1D763CABC()
{
  unint64_t result = qword_1EBDEB558;
  if (!qword_1EBDEB558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB558);
  }
  return result;
}

unint64_t sub_1D763CB08()
{
  unint64_t result = qword_1EBDEBC08;
  if (!qword_1EBDEBC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBC08);
  }
  return result;
}

void ControlChannelMessageEnvelope.init(from:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF10);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_27();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D763CA70();
  sub_1D76617A0();
  if (!v0)
  {
    v12[0] = 0;
    sub_1D763CD18();
    OUTLINED_FUNCTION_93_1();
    char v6 = v11[0];
    v12[136] = v11[0];
    LOBYTE(v11[0]) = 1;
    uint64_t v9 = sub_1D76613C0();
    uint64_t v13 = v9;
    OUTLINED_FUNCTION_33_7();
    sub_1D763CD64();
    OUTLINED_FUNCTION_93_1();
    uint64_t v7 = OUTLINED_FUNCTION_98_1();
    v8(v7);
    sub_1D75D20E0((uint64_t)v12, (uint64_t)v10);
    sub_1D75D20E0((uint64_t)v10, (uint64_t)&v14);
    LOBYTE(v11[0]) = v6;
    v11[1] = v9;
    sub_1D75D20E0((uint64_t)v10, (uint64_t)&v11[2]);
    memcpy(v4, v11, 0x92uLL);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_95_1();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D763CD18()
{
  unint64_t result = qword_1EBDEB570;
  if (!qword_1EBDEB570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB570);
  }
  return result;
}

unint64_t sub_1D763CD64()
{
  unint64_t result = qword_1EBDEBC10;
  if (!qword_1EBDEBC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBC10);
  }
  return result;
}

uint64_t sub_1D763CDB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x44676E6972696170 && a2 == 0xEB00000000617461;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x52676E6972696170 && a2 == 0xEF64657463656A65;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000001D76774A0 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 1735289200 && a2 == 0xE400000000000000;
      if (v7 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x80000001D7671A00 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD000000000000018 && a2 == 0x80000001D76774C0 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        BOOL v8 = a1 == 0x726961706E75 && a2 == 0xE600000000000000;
        if (v8 || (sub_1D7661560() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 6;
        }
        else if (a1 == 0xD000000000000011 && a2 == 0x80000001D76774E0)
        {
          swift_bridgeObjectRelease();
          return 7;
        }
        else
        {
          char v9 = sub_1D7661560();
          swift_bridgeObjectRelease();
          if (v9) {
            return 7;
          }
          else {
            return 8;
          }
        }
      }
    }
  }
}

unint64_t sub_1D763D0F0(char a1)
{
  unint64_t result = 0x44676E6972696170;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x52676E6972696170;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 1735289200;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0x726961706E75;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D763D208(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x4564657070617277 && a2 == 0xEC000000726F7272)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D763D2A8()
{
  return 0x4564657070617277;
}

void sub_1D763D2C8()
{
  OUTLINED_FUNCTION_3();
  BOOL v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC1F8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF78);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF60);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF88);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF70);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF80);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF58);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF50);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF68);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_70_1();
  unint64_t v18 = *(void *)v0;
  unint64_t v49 = *(void *)(v0 + 16);
  uint64_t v50 = *(void *)(v0 + 24);
  uint64_t v51 = *(void *)(v0 + 32);
  uint64_t v52 = *(void *)(v0 + 40);
  uint64_t v53 = *(void *)(v0 + 48);
  uint64_t v54 = *(void *)(v0 + 56);
  uint64_t v55 = *(void *)(v0 + 8);
  unint64_t v19 = *(void *)(v0 + 72);
  uint64_t v46 = *(void *)(v0 + 64);
  uint64_t v48 = *(void *)(v0 + 80);
  unint64_t v45 = *(void *)(v0 + 88);
  int v47 = *(unsigned __int8 *)(v0 + 96);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D764C77C();
  sub_1D76617C0();
  switch(v19 >> 62)
  {
    case 1uLL:
      id v28 = (id)v18;
      sub_1D764C860();
      sub_1D76613F0();
      sub_1D75B0EE8();
      sub_1D7661490();
      OUTLINED_FUNCTION_61_2();
      OUTLINED_FUNCTION_6();
      v29();
      OUTLINED_FUNCTION_30_8();
      OUTLINED_FUNCTION_6();
      v30();
      OUTLINED_FUNCTION_19_10();
      unint64_t v22 = (void *)v18;
      goto LABEL_5;
    case 2uLL:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1D75AC3B4(v48, v45);
      sub_1D764C7C8();
      sub_1D76613F0();
      sub_1D764A704();
      sub_1D7661490();
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_6();
      v31();
      OUTLINED_FUNCTION_41_4();
      OUTLINED_FUNCTION_6();
      v32();
      uint64_t v43 = v48;
      unint64_t v44 = v45;
      uint64_t v41 = v46;
      unint64_t v42 = v19;
      unint64_t v22 = (void *)v18;
LABEL_5:
      uint64_t v23 = v55;
      unint64_t v24 = v49;
      uint64_t v25 = v50;
      uint64_t v26 = v51;
      uint64_t v27 = v52;
      goto LABEL_6;
    case 3uLL:
      if (v47 || v19 != 0xC000000000000000 || v55 | v18 | v49 | v50 | v51 | v52 | v53 | v54 | v46 | v48 | v45)
      {
        unint64_t v35 = v49 | v55 | v50 | v51 | v52 | v53 | v54 | v46 | v48 | v45;
        if (v47 || (v19 == 0xC000000000000000 ? (BOOL v36 = v18 == 1) : (BOOL v36 = 0), !v36 || v35))
        {
          if (v47 || (v19 == 0xC000000000000000 ? (BOOL v37 = v18 == 2) : (BOOL v37 = 0), !v37 || v35))
          {
            if (v47 || (v19 == 0xC000000000000000 ? (BOOL v40 = v18 == 3) : (BOOL v40 = 0), !v40 || v35))
            {
              sub_1D764C814();
              OUTLINED_FUNCTION_11_7();
              OUTLINED_FUNCTION_30_8();
            }
            else
            {
              sub_1D764C8AC();
              OUTLINED_FUNCTION_11_7();
              OUTLINED_FUNCTION_30_8();
            }
          }
          else
          {
            sub_1D764C8F8();
            OUTLINED_FUNCTION_11_7();
            OUTLINED_FUNCTION_30_8();
          }
        }
        else
        {
          sub_1D764C944();
          OUTLINED_FUNCTION_11_7();
          OUTLINED_FUNCTION_30_8();
        }
        OUTLINED_FUNCTION_6();
        v38();
        OUTLINED_FUNCTION_42_4();
        OUTLINED_FUNCTION_6();
        v39();
      }
      else
      {
        sub_1D764C990();
        sub_1D76613F0();
        OUTLINED_FUNCTION_29_10();
        OUTLINED_FUNCTION_6();
        v33();
        OUTLINED_FUNCTION_42_4();
        OUTLINED_FUNCTION_6();
        v34();
      }
      goto LABEL_7;
    default:
      sub_1D75934F4(v55, v49);
      sub_1D764C9DC();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1D76613F0();
      sub_1D764CBC4();
      sub_1D7661490();
      OUTLINED_FUNCTION_6();
      v20();
      OUTLINED_FUNCTION_41_4();
      OUTLINED_FUNCTION_6();
      v21();
      OUTLINED_FUNCTION_19_10();
      unint64_t v22 = (void *)v18;
      uint64_t v23 = v55;
      unint64_t v24 = v49;
      uint64_t v25 = v50;
      uint64_t v26 = v51;
      uint64_t v27 = v52;
LABEL_6:
      sub_1D75D3F24(v22, v23, v24, v25, v26, v27, v53, v54, v41, v42, v43, v44);
LABEL_7:
      OUTLINED_FUNCTION_4_0();
      return;
  }
}

void sub_1D763DC78()
{
  OUTLINED_FUNCTION_3();
  uint64_t v4 = v3;
  __int16 v98 = v5;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC1E0);
  OUTLINED_FUNCTION_0_5();
  uint64_t v94 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_52_4(v8, v75);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEA0);
  OUTLINED_FUNCTION_0_5();
  uint64_t v91 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_14();
  uint64_t v97 = v11;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE88);
  OUTLINED_FUNCTION_0_5();
  uint64_t v92 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_49_2(v14, v75);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEB0);
  OUTLINED_FUNCTION_0_5();
  uint64_t v88 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_14();
  uint64_t v99 = v17;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE98);
  OUTLINED_FUNCTION_0_5();
  uint64_t v85 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_14();
  uint64_t v96 = v20;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEA8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v83 = v21;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_14();
  uint64_t v95 = v23;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE80);
  OUTLINED_FUNCTION_0_5();
  uint64_t v80 = v24;
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_9();
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE78);
  OUTLINED_FUNCTION_0_5();
  uint64_t v82 = v27;
  MEMORY[0x1F4188790](v28);
  os_log_t v30 = (char *)&v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE90);
  OUTLINED_FUNCTION_0_5();
  uint64_t v33 = v32;
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_51();
  uint64_t v100 = v4;
  OUTLINED_FUNCTION_24_8(v4);
  sub_1D764C77C();
  sub_1D76617A0();
  if (v1) {
    goto LABEL_14;
  }
  uint64_t v78 = v2;
  int v79 = v30;
  uint64_t v77 = v26;
  uint64_t v112 = v33;
  uint64_t v35 = sub_1D76613D0();
  uint64_t v36 = *(void *)(v35 + 16);
  if (!v36
    || (uint64_t v75 = 0,
        uint64_t v76 = *(unsigned __int8 *)(v35 + 32),
        sub_1D75AB7D8(1, v36, v35, v35 + 32, 0, (2 * v36) | 1),
        uint64_t v38 = v37,
        unint64_t v40 = v39,
        swift_bridgeObjectRelease(),
        v38 != v40 >> 1))
  {
    sub_1D7661150();
    OUTLINED_FUNCTION_3_0();
    unint64_t v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82B490);
    *unint64_t v42 = &unk_1F2EE7698;
    sub_1D76612E0();
    OUTLINED_FUNCTION_28_9();
    OUTLINED_FUNCTION_57_2();
    v43();
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v0, v31);
LABEL_14:
    uint64_t v54 = (uint64_t)v100;
    goto LABEL_15;
  }
  switch(v76)
  {
    case 1:
      LOBYTE(v101) = 1;
      sub_1D764C990();
      OUTLINED_FUNCTION_10_10();
      OUTLINED_FUNCTION_29_10();
      OUTLINED_FUNCTION_6();
      v44();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v45();
      unint64_t v66 = 0;
      unint64_t v63 = 0;
      unint64_t v64 = 0;
      unint64_t v65 = 0;
      unint64_t v57 = 0;
      unint64_t v58 = 0;
      unint64_t v59 = 0;
      char v61 = 0;
      long long v62 = 0uLL;
      long long v67 = 0uLL;
      unint64_t v60 = 0xC000000000000000;
      break;
    case 2:
      LOBYTE(v101) = 2;
      sub_1D764C944();
      OUTLINED_FUNCTION_10_10();
      OUTLINED_FUNCTION_29_10();
      OUTLINED_FUNCTION_6();
      v46();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v47();
      *(double *)&long long v62 = OUTLINED_FUNCTION_7_14();
      unint64_t v66 = 1;
      break;
    case 3:
      LOBYTE(v101) = 3;
      sub_1D764C8F8();
      OUTLINED_FUNCTION_10_10();
      OUTLINED_FUNCTION_29_10();
      OUTLINED_FUNCTION_6();
      v48();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v49();
      *(double *)&long long v62 = OUTLINED_FUNCTION_7_14();
      unint64_t v66 = 2;
      break;
    case 4:
      LOBYTE(v101) = 4;
      sub_1D764C8AC();
      OUTLINED_FUNCTION_10_10();
      OUTLINED_FUNCTION_86_0();
      OUTLINED_FUNCTION_6();
      v50();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v51();
      *(double *)&long long v62 = OUTLINED_FUNCTION_7_14();
      unint64_t v66 = 3;
      break;
    case 5:
      LOBYTE(v101) = 5;
      sub_1D764C860();
      OUTLINED_FUNCTION_10_10();
      sub_1D75B0E98();
      OUTLINED_FUNCTION_103_1();
      OUTLINED_FUNCTION_6();
      v68();
      swift_unknownObjectRelease();
      uint64_t v69 = OUTLINED_FUNCTION_26_8();
      v70(v69);
      unint64_t v63 = 0;
      unint64_t v64 = 0;
      unint64_t v65 = 0;
      unint64_t v57 = 0;
      unint64_t v58 = 0;
      unint64_t v59 = 0;
      char v61 = 0;
      unint64_t v66 = v101;
      long long v62 = 0uLL;
      long long v67 = 0uLL;
      unint64_t v60 = 0x4000000000000000;
      break;
    case 6:
      LOBYTE(v101) = 6;
      sub_1D764C814();
      OUTLINED_FUNCTION_10_10();
      OUTLINED_FUNCTION_29_10();
      OUTLINED_FUNCTION_6();
      v52();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v53();
      *(double *)&long long v62 = OUTLINED_FUNCTION_7_14();
      unint64_t v66 = 4;
      break;
    case 7:
      LOBYTE(v101) = 7;
      sub_1D764C7C8();
      OUTLINED_FUNCTION_10_10();
      sub_1D764A570();
      sub_1D7661380();
      OUTLINED_FUNCTION_86_0();
      OUTLINED_FUNCTION_6();
      v71();
      swift_unknownObjectRelease();
      uint64_t v72 = OUTLINED_FUNCTION_26_8();
      v73(v72);
      unint64_t v66 = v101;
      long long v62 = v102;
      unint64_t v63 = v103;
      unint64_t v64 = v104;
      unint64_t v65 = v105;
      unint64_t v57 = v106;
      unint64_t v58 = v107;
      unint64_t v59 = v108;
      long long v67 = v110;
      unint64_t v60 = v109 | 0x8000000000000000;
      char v61 = v111;
      break;
    default:
      LOBYTE(v101) = 0;
      sub_1D764C9DC();
      OUTLINED_FUNCTION_10_10();
      sub_1D764CA28();
      OUTLINED_FUNCTION_36_7();
      OUTLINED_FUNCTION_6();
      v55();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v56();
      unint64_t v57 = 0;
      unint64_t v58 = 0;
      unint64_t v59 = 0;
      unint64_t v60 = 0;
      char v61 = 0;
      long long v62 = v102;
      unint64_t v63 = v103;
      unint64_t v64 = v104;
      unint64_t v65 = v105;
      unint64_t v66 = v101 | ((unint64_t)BYTE1(v101) << 8);
      long long v67 = 0uLL;
      break;
  }
  uint64_t v54 = (uint64_t)v100;
  uint64_t v74 = v98;
  *__int16 v98 = v66;
  *(_OWORD *)(v74 + 1) = v62;
  v74[3] = v63;
  v74[4] = v64;
  v74[5] = v65;
  v74[6] = v57;
  v74[7] = v58;
  v74[8] = v59;
  v74[9] = v60;
  *((_OWORD *)v74 + 5) = v67;
  *((unsigned char *)v74 + 96) = v61;
LABEL_15:
  __swift_destroy_boxed_opaque_existential_0Tm(v54);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D763E6B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B616873646E6168 && a2 == 0xE900000000000065;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6F666E4972656570 && a2 == 0xE800000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x694C657461657263 && a2 == 0xEE0072656E657473;
      if (v7 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x61506C65636E6163 && a2 == 0xEF70757465537269;
        if (v8 || (sub_1D7661560() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000015 && a2 == 0x80000001D7677440 || (sub_1D7661560() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0x6E5565746F6D6572 && a2 == 0xEC0000006B636F6CLL)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v10 = sub_1D7661560();
          swift_bridgeObjectRelease();
          if (v10) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

unint64_t sub_1D763E990(char a1)
{
  unint64_t result = 0x6B616873646E6168;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F666E4972656570;
      break;
    case 2:
      unint64_t result = 0x694C657461657263;
      break;
    case 3:
      unint64_t result = 0x61506C65636E6163;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0x6E5565746F6D6572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D763EA84(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001D7677460 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001D7677480)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1D763EBC4(char a1)
{
  if (!a1) {
    return 7955819;
  }
  if (a1 == 1) {
    return 0xD000000000000015;
  }
  return 0xD000000000000013;
}

uint64_t sub_1D763EC20(uint64_t a1, uint64_t a2)
{
  if (a1 == 7955819 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D763EC98()
{
  return 7955819;
}

void sub_1D763ECA8()
{
  OUTLINED_FUNCTION_3();
  char v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C980);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_49_2(v5, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C988);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C990);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_31_7(v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C998);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_52_4(v11, v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C9A0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_51();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C9A8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_3_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C9B0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_70_1();
  unint64_t v15 = *v0;
  unint64_t v16 = v0[1];
  *(void *)&long long v35 = v0[3];
  *((void *)&v35 + 1) = v0[2];
  uint64_t v17 = v3[3];
  __swift_project_boxed_opaque_existential_0Tm(v3, v17);
  sub_1D764C484();
  OUTLINED_FUNCTION_88_1();
  sub_1D76617C0();
  switch((v16 >> 60) & 3)
  {
    case 1uLL:
      unint64_t v22 = v16 & 0xCFFFFFFFFFFFFFFFLL;
      OUTLINED_FUNCTION_105_1(2);
      sub_1D764C5B4();
      OUTLINED_FUNCTION_45_4();
      sub_1D75E1BB4();
      sub_1D7661490();
      if (v1)
      {
        OUTLINED_FUNCTION_6();
        v23();
        OUTLINED_FUNCTION_6();
        v24();
        sub_1D75933F0(v17, v22);
      }
      else
      {
        OUTLINED_FUNCTION_27_10();
        sub_1D764CA74();
        sub_1D7661430();
        OUTLINED_FUNCTION_33_7();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C930);
        sub_1D764CAC0((uint64_t)&unk_1EA82C9C0);
        sub_1D7661430();
        sub_1D75933F0(v17, v22);
        OUTLINED_FUNCTION_6();
        v29();
        OUTLINED_FUNCTION_6();
        v30();
      }
      break;
    case 2uLL:
      OUTLINED_FUNCTION_105_1(5);
      sub_1D764C4D0();
      OUTLINED_FUNCTION_45_4();
      sub_1D75E1BB4();
      sub_1D7661490();
      OUTLINED_FUNCTION_61_2();
      OUTLINED_FUNCTION_6();
      v25();
      OUTLINED_FUNCTION_6();
      v26();
      uint64_t v20 = (void *)v17;
      unint64_t v21 = v16;
      goto LABEL_6;
    case 3uLL:
      if (v16 != 0x3000000000000000 || (unint64_t)v35 | *((void *)&v35 + 1) | v15)
      {
        BOOL v28 = v16 == 0x3000000000000000 && v15 == 1;
        if (v28 && v35 == 0)
        {
          sub_1D764C568();
          OUTLINED_FUNCTION_80_1();
          OUTLINED_FUNCTION_41_4();
        }
        else
        {
          sub_1D764C51C();
          OUTLINED_FUNCTION_80_1();
        }
        OUTLINED_FUNCTION_6();
        v31();
      }
      else
      {
        sub_1D764C698();
        OUTLINED_FUNCTION_45_4();
        OUTLINED_FUNCTION_6();
        v27();
      }
      OUTLINED_FUNCTION_6();
      v32();
      break;
    default:
      sub_1D764C6E4();
      (id)v15;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_47_3();
      sub_1D76613F0();
      sub_1D764CB78();
      sub_1D7661490();
      OUTLINED_FUNCTION_6();
      v18();
      OUTLINED_FUNCTION_6();
      v19();
      uint64_t v20 = (void *)v15;
      unint64_t v21 = v16;
LABEL_6:
      sub_1D75D1FE8(v20, v21);
      break;
  }
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D763F34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, unsigned __int8 a13)
{
  OUTLINED_FUNCTION_3();
  uint64_t v17 = v16;
  unint64_t v63 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEC0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEB8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_14();
  uint64_t v64 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEE8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_14();
  uint64_t v62 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEE0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBED0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBED8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_9();
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBEC8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v29 = v28;
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_0Tm(v17, v17[3]);
  sub_1D764C484();
  OUTLINED_FUNCTION_88_1();
  sub_1D76617A0();
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v31 = v64;
  if (!*(void *)(sub_1D76613D0() + 16)
    || (uint64_t v32 = OUTLINED_FUNCTION_43_4(),
        sub_1D75AB7D8(v32, v33, v34, v35, v36, v37),
        uint64_t v39 = v38,
        unint64_t v41 = v40,
        swift_bridgeObjectRelease(),
        v39 != v41 >> 1))
  {
    sub_1D7661150();
    OUTLINED_FUNCTION_3_0();
    uint64_t v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82B490);
    *uint64_t v43 = &unk_1F2EE7608;
    sub_1D76612E0();
    OUTLINED_FUNCTION_28_9();
    OUTLINED_FUNCTION_57_2();
    v44();
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v14, v27);
LABEL_7:
    uint64_t v45 = (uint64_t)v17;
    goto LABEL_8;
  }
  switch(v14)
  {
    case 1:
      sub_1D764C698();
      uint64_t v31 = v15;
      OUTLINED_FUNCTION_15_12();
      OUTLINED_FUNCTION_6();
      v46();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v47();
      uint64_t v54 = 0;
      OUTLINED_FUNCTION_77_1();
      break;
    case 2:
      LOBYTE(v65) = 2;
      sub_1D764C5B4();
      OUTLINED_FUNCTION_15_12();
      sub_1D75E4EB4();
      OUTLINED_FUNCTION_68_1();
      sub_1D7661380();
      uint64_t v54 = v65;
      LOBYTE(v69) = 1;
      sub_1D764C600();
      OUTLINED_FUNCTION_68_1();
      sub_1D7661320();
      uint64_t v31 = a13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C930);
      sub_1D764CAC0((uint64_t)&unk_1EA82C938);
      sub_1D7661320();
      OUTLINED_FUNCTION_97_1();
      OUTLINED_FUNCTION_6();
      v60();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_58_1();
      v61();
      uint64_t v56 = v69;
      uint64_t v55 = v66 | 0x1000000000000000;
      break;
    case 3:
      sub_1D764C568();
      uint64_t v31 = v62;
      OUTLINED_FUNCTION_15_12();
      OUTLINED_FUNCTION_6();
      v48();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v49();
      OUTLINED_FUNCTION_77_1();
      uint64_t v54 = 1;
      break;
    case 4:
      sub_1D764C51C();
      OUTLINED_FUNCTION_15_12();
      OUTLINED_FUNCTION_6();
      v50();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v51();
      OUTLINED_FUNCTION_77_1();
      uint64_t v54 = 2;
      break;
    case 5:
      LOBYTE(v65) = 5;
      sub_1D764C4D0();
      OUTLINED_FUNCTION_15_12();
      sub_1D75E4EB4();
      sub_1D7661380();
      OUTLINED_FUNCTION_6();
      v57();
      swift_unknownObjectRelease();
      uint64_t v58 = OUTLINED_FUNCTION_59_1();
      v59(v58);
      uint64_t v31 = 0;
      uint64_t v56 = 0;
      uint64_t v54 = v65;
      uint64_t v55 = v66 | 0x2000000000000000;
      break;
    default:
      LOBYTE(v65) = 0;
      sub_1D764C6E4();
      OUTLINED_FUNCTION_15_12();
      sub_1D764C730();
      sub_1D7661380();
      OUTLINED_FUNCTION_6();
      v52();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_6();
      v53();
      uint64_t v54 = v65;
      uint64_t v55 = v66;
      uint64_t v31 = v67;
      uint64_t v56 = v68;
      break;
  }
  uint64_t v45 = (uint64_t)v17;
  uint64_t *v63 = v54;
  v63[1] = v55;
  v63[2] = v31;
  v63[3] = v56;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_0Tm(v45);
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D763FC14(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6B616873646E6168 && a2 == 0xE900000000000065;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6F666E4972656570 && a2 == 0xE800000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x694C657461657263 && a2 == 0xEE0072656E657473;
      if (v7 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000015 && a2 == 0x80000001D7677440 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x6E5565746F6D6572 && a2 == 0xEC0000006B636F6CLL;
        if (v8 || (sub_1D7661560() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x726F727265 && a2 == 0xE500000000000000;
          if (v9 || (sub_1D7661560() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
            if (v10 || (sub_1D7661560() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x747845726F727265 && a2 == 0xED00006465646E65)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              char v12 = sub_1D7661560();
              swift_bridgeObjectRelease();
              if (v12) {
                return 7;
              }
              else {
                return 8;
              }
            }
          }
        }
      }
    }
  }
}

unint64_t sub_1D763FFA4(char a1)
{
  unint64_t result = 0x6B616873646E6168;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F666E4972656570;
      break;
    case 2:
      unint64_t result = 0x694C657461657263;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0x6E5565746F6D6572;
      break;
    case 5:
      unint64_t result = 0x726F727265;
      break;
    case 6:
      unint64_t result = 0x73736563637573;
      break;
    case 7:
      unint64_t result = 0x747845726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D76400CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1953656688 && a2 == 0xE400000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7550656369766564 && a2 == 0xEF79654B63696C62)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D76401D0(char a1)
{
  if (a1) {
    return 0x7550656369766564;
  }
  else {
    return 1953656688;
  }
}

uint64_t sub_1D764020C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x79654B74736F68 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D7640294()
{
  return 0x79654B74736F68;
}

void sub_1D76402AC()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v0;
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFC8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFB0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_50_4(v7, v49);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFA8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF98);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF90);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFD0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_51_4(v12, v50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFB8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFC0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBFA0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_8();
  sub_1D75D2148(v2, (uint64_t)v62);
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  sub_1D764A2B8();
  OUTLINED_FUNCTION_99_1();
  sub_1D75D2148((uint64_t)v62, (uint64_t)v63);
  switch(sub_1D75D409C((uint64_t)v63))
  {
    case 1u:
      uint64_t v18 = nullsub_1(v63);
      long long v57 = *(_OWORD *)(v18 + 16);
      long long v58 = *(_OWORD *)v18;
      long long v53 = *(_OWORD *)(v18 + 48);
      long long v55 = *(_OWORD *)(v18 + 32);
      uint64_t v19 = *(void *)(v18 + 64);
      char v20 = *(unsigned char *)(v18 + 72);
      uint64_t v21 = *(void *)(v18 + 80);
      uint64_t v52 = *(void *)(v18 + 88);
      char v51 = *(unsigned char *)(v18 + 96);
      uint64_t v22 = OUTLINED_FUNCTION_16_10(1);
      uint64_t v23 = *(void *)(v22 + 80);
      unint64_t v24 = *(void *)(v22 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1D75AC3B4(v23, v24);
      sub_1D764A524();
      sub_1D76613F0();
      v60[0] = v58;
      v60[1] = v57;
      v60[2] = v55;
      v60[3] = v53;
      *(void *)&v60[4] = v19;
      BYTE8(v60[4]) = v20;
      *(void *)&v60[5] = v21;
      *((void *)&v60[5] + 1) = v52;
      LOBYTE(v60[6]) = v51;
      sub_1D764A704();
      sub_1D7661490();
      OUTLINED_FUNCTION_6();
      v25();
      goto LABEL_16;
    case 2u:
      uint64_t v26 = nullsub_1(v63);
      uint64_t v27 = *(void *)(v26 + 8);
      uint64_t v28 = *(void *)(v26 + 16);
      uint64_t v29 = OUTLINED_FUNCTION_16_10(2);
      sub_1D75AC3B4(*(void *)(v29 + 8), *(void *)(v29 + 16));
      sub_1D764A4D8();
      OUTLINED_FUNCTION_60_1();
      LOBYTE(v60[0]) = 0;
      sub_1D76614C0();
      if (v1)
      {
        sub_1D764A654((uint64_t)v62);
        OUTLINED_FUNCTION_6();
        v30();
        OUTLINED_FUNCTION_90_1();
        OUTLINED_FUNCTION_6();
        v31();
      }
      else
      {
        *(void *)&v60[0] = v27;
        *((void *)&v60[0] + 1) = v28;
        sub_1D75E1BB4();
        sub_1D7661430();
LABEL_15:
        OUTLINED_FUNCTION_6();
        v47();
        OUTLINED_FUNCTION_90_1();
LABEL_16:
        OUTLINED_FUNCTION_6();
        v48();
        sub_1D764A654((uint64_t)v62);
      }
LABEL_17:
      OUTLINED_FUNCTION_85_0();
      OUTLINED_FUNCTION_4_0();
      return;
    case 3u:
      uint64_t v32 = (uint64_t *)nullsub_1(v63);
      uint64_t v33 = *v32;
      uint64_t v34 = v32[1];
      uint64_t v35 = OUTLINED_FUNCTION_16_10(3);
      sub_1D75934F4(*(void *)v35, *(void *)(v35 + 8));
      sub_1D764A48C();
      OUTLINED_FUNCTION_60_1();
      *(void *)&v60[0] = v33;
      *((void *)&v60[0] + 1) = v34;
      sub_1D75E1BB4();
      sub_1D7661490();
      goto LABEL_15;
    case 4u:
      uint64_t v36 = nullsub_1(v63);
      char v37 = *(unsigned char *)v36;
      long long v59 = *(_OWORD *)(v36 + 8);
      long long v54 = *(_OWORD *)(v36 + 40);
      long long v56 = *(_OWORD *)(v36 + 24);
      uint64_t v38 = *(void *)(v36 + 56);
      uint64_t v39 = *(void **)(OUTLINED_FUNCTION_16_10(5) + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v40 = v39;
      sub_1D764A3A8();
      sub_1D76613F0();
      LOBYTE(v60[0]) = v37;
      *(_OWORD *)((char *)v60 + 8) = v59;
      *(_OWORD *)((char *)&v60[1] + 8) = v56;
      *(_OWORD *)((char *)&v60[2] + 8) = v54;
      *((void *)&v60[3] + 1) = v38;
      sub_1D764A6B8();
      sub_1D7661490();
      OUTLINED_FUNCTION_6();
      v41();
      OUTLINED_FUNCTION_54();
      goto LABEL_16;
    case 5u:
      uint64_t v42 = *(void *)nullsub_1(v63);
      id v43 = *(id *)OUTLINED_FUNCTION_16_10(7);
      sub_1D764A304();
      OUTLINED_FUNCTION_37_4();
      *(void *)&v60[0] = v42;
      sub_1D75B0EE8();
      sub_1D7661490();
      goto LABEL_10;
    case 6u:
      v61[0] = 4;
      sub_1D764A440();
      sub_1D76613F0();
      OUTLINED_FUNCTION_61_2();
      goto LABEL_13;
    case 7u:
      v61[0] = 6;
      sub_1D764A35C();
      sub_1D76613F0();
LABEL_13:
      OUTLINED_FUNCTION_6();
      v45();
      OUTLINED_FUNCTION_6();
      v46();
      goto LABEL_17;
    default:
      unint64_t v16 = (const void *)nullsub_1(v63);
      LOBYTE(v60[0]) = 0;
      sub_1D75D2148((uint64_t)v62, (uint64_t)v61);
      uint64_t v17 = nullsub_1(v61);
      sub_1D75D4C40(v17);
      sub_1D764A5BC();
      OUTLINED_FUNCTION_37_4();
      memcpy(v60, v16, 0x79uLL);
      sub_1D764A750();
      sub_1D7661490();
      OUTLINED_FUNCTION_54();
LABEL_10:
      OUTLINED_FUNCTION_6();
      v44();
      OUTLINED_FUNCTION_30_3();
      goto LABEL_16;
  }
}

void sub_1D7640B70()
{
  OUTLINED_FUNCTION_3();
  char v3 = v2;
  uint64_t v49 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C7F8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C800);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C808);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C810);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C818);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C820);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C828);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C830);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3_13();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C838);
  OUTLINED_FUNCTION_0_5();
  uint64_t v50 = v14;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_24_8(v3);
  sub_1D764A2B8();
  sub_1D76617A0();
  if (v0) {
    goto LABEL_7;
  }
  uint64_t v55 = v13;
  if (!*(void *)(sub_1D76613D0() + 16)
    || (uint64_t v16 = OUTLINED_FUNCTION_43_4(),
        sub_1D75AB7D8(v16, v17, v18, v19, v20, v21),
        uint64_t v23 = v22,
        unint64_t v25 = v24,
        swift_bridgeObjectRelease(),
        v23 != v25 >> 1))
  {
    sub_1D7661150();
    OUTLINED_FUNCTION_3_0();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82B490);
    *uint64_t v27 = &unk_1F2EE6D58;
    sub_1D76612E0();
    OUTLINED_FUNCTION_28_9();
    OUTLINED_FUNCTION_81_1();
    OUTLINED_FUNCTION_57_2();
    v28();
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v1, v55);
LABEL_7:
    uint64_t v29 = (uint64_t)v3;
    goto LABEL_8;
  }
  switch(v1)
  {
    case 1:
      LOBYTE(v53[0]) = 1;
      sub_1D764A524();
      OUTLINED_FUNCTION_68_1();
      sub_1D76612D0();
      sub_1D764A570();
      OUTLINED_FUNCTION_36_7();
      OUTLINED_FUNCTION_12_9();
      v36();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v37();
      v53[0] = *(_OWORD *)v51;
      v53[1] = *(_OWORD *)&v51[16];
      v53[2] = *(_OWORD *)&v51[32];
      v53[3] = *(_OWORD *)&v51[48];
      *(void *)&v53[4] = *(void *)&v51[64];
      BYTE8(v53[4]) = v51[72];
      v53[5] = *(_OWORD *)&v51[80];
      LOBYTE(v53[6]) = v51[96];
      sub_1D75D4AE8((uint64_t)v53);
      break;
    case 2:
      sub_1D764A4D8();
      OUTLINED_FUNCTION_35_5();
      LOBYTE(v53[0]) = 0;
      __int16 v38 = sub_1D76613B0();
      char v52 = 1;
      sub_1D75E4EB4();
      OUTLINED_FUNCTION_47_3();
      sub_1D7661320();
      OUTLINED_FUNCTION_72_1();
      OUTLINED_FUNCTION_45_1();
      v47();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v48();
      LOWORD(v53[0]) = v38;
      *(_OWORD *)((char *)v53 + 8) = *(_OWORD *)v51;
      sub_1D75D4C2C((uint64_t)v53);
      break;
    case 3:
      LOBYTE(v53[0]) = 3;
      sub_1D764A48C();
      OUTLINED_FUNCTION_47_3();
      sub_1D76612D0();
      sub_1D75E4EB4();
      sub_1D7661380();
      OUTLINED_FUNCTION_12_9();
      v41();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_30_3();
      OUTLINED_FUNCTION_18_10();
      v42();
      v53[0] = *(_OWORD *)v51;
      sub_1D75D4DDC((uint64_t)v53);
      break;
    case 4:
      v51[0] = 4;
      sub_1D764A440();
      OUTLINED_FUNCTION_48_4();
      OUTLINED_FUNCTION_6();
      v30();
      swift_unknownObjectRelease();
      uint64_t v31 = OUTLINED_FUNCTION_82_1();
      v32(v31);
      sub_1D75D4DE8((uint64_t)v53);
      break;
    case 5:
      LOBYTE(v53[0]) = 5;
      sub_1D764A3A8();
      OUTLINED_FUNCTION_35_5();
      sub_1D764A3F4();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_72_1();
      OUTLINED_FUNCTION_12_9();
      v43();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v44();
      LOBYTE(v53[0]) = v51[0];
      *((void *)&v53[0] + 1) = *(void *)&v51[8];
      *(void *)&v53[1] = *(void *)&v51[16];
      *(_OWORD *)((char *)&v53[1] + 8) = *(_OWORD *)&v51[24];
      *(_OWORD *)((char *)&v53[2] + 8) = *(_OWORD *)&v51[40];
      *((void *)&v53[3] + 1) = *(void *)&v51[56];
      sub_1D75D213C((uint64_t)v53);
      break;
    case 6:
      v51[0] = 6;
      sub_1D764A35C();
      OUTLINED_FUNCTION_48_4();
      OUTLINED_FUNCTION_6();
      v33();
      swift_unknownObjectRelease();
      uint64_t v34 = OUTLINED_FUNCTION_82_1();
      v35(v34);
      sub_1D75D4DA8((uint64_t)v53);
      break;
    case 7:
      LOBYTE(v53[0]) = 7;
      sub_1D764A304();
      OUTLINED_FUNCTION_102_0();
      sub_1D76612D0();
      sub_1D75B0E98();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_12_9();
      v45();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v46();
      *(void *)&v53[0] = *(void *)v51;
      sub_1D764A350((uint64_t)v53);
      break;
    default:
      LOBYTE(v53[0]) = 0;
      sub_1D764A5BC();
      OUTLINED_FUNCTION_35_5();
      sub_1D764A608();
      OUTLINED_FUNCTION_36_7();
      OUTLINED_FUNCTION_72_1();
      OUTLINED_FUNCTION_12_9();
      v39();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v40();
      memcpy(v53, v51, 0x79uLL);
      sub_1D75D4C38((uint64_t)v53);
      break;
  }
  sub_1D75D2148((uint64_t)v53, (uint64_t)v54);
  sub_1D75D2148((uint64_t)v54, v49);
  uint64_t v29 = (uint64_t)v3;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_0Tm(v29);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D76416EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E657665 && a2 == 0xE500000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x74736575716572 && a2 == 0xE700000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1D7661560();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1D7641834(char a1)
{
  if (!a1) {
    return 0x746E657665;
  }
  if (a1 == 1) {
    return 0x74736575716572;
  }
  return 0x65736E6F70736572;
}

uint64_t sub_1D7641888(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001D7677420 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D764195C(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 0xD000000000000014;
  }
}

void sub_1D764198C()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF48);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_51_4(v6, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF40);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF38);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF30);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_30();
  sub_1D75D20E0(v2, (uint64_t)v49);
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  sub_1D7649F4C();
  sub_1D76617C0();
  sub_1D75D20E0((uint64_t)v49, (uint64_t)v50);
  int v10 = sub_1D75D4998((uint64_t)v50);
  if (!v10)
  {
    uint64_t v17 = sub_1D75D4A78((uint64_t)v50);
    long long v37 = *(_OWORD *)(v17 + 16);
    long long v39 = *(_OWORD *)v17;
    long long v36 = *(_OWORD *)(v17 + 32);
    long long v34 = *(_OWORD *)(v17 + 64);
    long long v35 = *(_OWORD *)(v17 + 48);
    uint64_t v18 = *(void *)(v17 + 80);
    uint64_t v19 = *(void *)(v17 + 88);
    char v20 = *(unsigned char *)(v17 + 96);
    LOBYTE(v40) = 0;
    uint64_t v21 = OUTLINED_FUNCTION_94_1();
    sub_1D75D4704(v25, v22, v23, v24, *(void *)(v21 + 32), *(void *)(v21 + 40), *(void *)(v21 + 48), *(void *)(v21 + 56), *(void *)(v21 + 64), *(void *)(v21 + 72), *(void *)(v21 + 80), *(void *)(v21 + 88));
    sub_1D764A0C8();
    sub_1D76613F0();
    long long v40 = v39;
    long long v41 = v37;
    long long v42 = v36;
    long long v43 = v35;
    long long v44 = v34;
    uint64_t v45 = v18;
    uint64_t v46 = v19;
    char v47 = v20;
    sub_1D764A26C();
    sub_1D7661490();
    OUTLINED_FUNCTION_6();
    v26();
    goto LABEL_8;
  }
  if (v10 == 1)
  {
    uint64_t v11 = sub_1D75D4A78((uint64_t)v50);
    long long v38 = *(_OWORD *)v11;
    uint64_t v12 = *(void *)(v11 + 16);
    uint64_t v13 = *(void *)(v11 + 24);
    OUTLINED_FUNCTION_94_1();
    sub_1D75D480C(v15, v14);
    sub_1D764A030();
    sub_1D76613F0();
    long long v40 = v38;
    *(void *)&long long v41 = v12;
    *((void *)&v41 + 1) = v13;
    sub_1D764A220();
    sub_1D7661490();
    OUTLINED_FUNCTION_61_2();
    OUTLINED_FUNCTION_6();
    v16();
LABEL_8:
    OUTLINED_FUNCTION_6();
    v32();
    sub_1D764A160((uint64_t)v49);
    goto LABEL_9;
  }
  uint64_t v27 = sub_1D75D4A78((uint64_t)v50);
  sub_1D75D20E0((uint64_t)v49, (uint64_t)v48);
  uint64_t v28 = sub_1D75D4A78((uint64_t)v48);
  sub_1D75D4A10(v28);
  sub_1D7649F98();
  sub_1D76613F0();
  LOBYTE(v40) = 0;
  sub_1D76614D0();
  if (!v1)
  {
    sub_1D75D2148(v27 + 8, (uint64_t)&v40);
    OUTLINED_FUNCTION_27_10();
    sub_1D764A1D4();
    sub_1D7661490();
    OUTLINED_FUNCTION_6();
    v31();
    OUTLINED_FUNCTION_92_1();
    goto LABEL_8;
  }
  sub_1D764A160((uint64_t)v49);
  OUTLINED_FUNCTION_6();
  v29();
  OUTLINED_FUNCTION_92_1();
  OUTLINED_FUNCTION_6();
  v30();
LABEL_9:
  OUTLINED_FUNCTION_95_1();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D7641E98()
{
  OUTLINED_FUNCTION_3();
  char v3 = v2;
  uint64_t v31 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE70);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_50_4(v6, v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE68);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE60);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_8();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE58);
  OUTLINED_FUNCTION_0_5();
  uint64_t v32 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_9();
  uint64_t v33 = (uint64_t)v3;
  OUTLINED_FUNCTION_24_8(v3);
  sub_1D7649F4C();
  OUTLINED_FUNCTION_69_0();
  sub_1D76617A0();
  if (v0) {
    goto LABEL_10;
  }
  uint64_t v12 = v1;
  uint64_t v13 = sub_1D76613D0();
  uint64_t v14 = *(void *)(v13 + 16);
  if (!v14)
  {
LABEL_9:
    sub_1D7661150();
    OUTLINED_FUNCTION_3_0();
    uint64_t v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82B490);
    *uint64_t v21 = &unk_1F2EE6CC8;
    sub_1D76612E0();
    OUTLINED_FUNCTION_28_9();
    OUTLINED_FUNCTION_81_1();
    OUTLINED_FUNCTION_57_2();
    v22();
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v12, v9);
    goto LABEL_10;
  }
  int v15 = *(unsigned __int8 *)(v13 + 32);
  sub_1D75AB7D8(1, v14, v13, v13 + 32, 0, (2 * v14) | 1);
  uint64_t v17 = v16;
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    uint64_t v12 = v1;
    goto LABEL_9;
  }
  if (v15)
  {
    if (v15 == 1)
    {
      LOBYTE(v36[0]) = 1;
      sub_1D764A030();
      sub_1D76612D0();
      sub_1D764A07C();
      OUTLINED_FUNCTION_103_1();
      OUTLINED_FUNCTION_45_1();
      v24();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v25();
      v36[0] = v35[0];
      v36[1] = v35[1];
      sub_1D75D50B0((uint64_t)v36);
    }
    else
    {
      sub_1D7649F98();
      sub_1D76612D0();
      LOBYTE(v36[0]) = 0;
      uint64_t v23 = sub_1D76613C0();
      OUTLINED_FUNCTION_27_10();
      sub_1D7649FE4();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_6();
      v28();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_18_10();
      v29();
      sub_1D75D2148((uint64_t)&v37, (uint64_t)v34);
      *(void *)&v35[0] = v23;
      sub_1D75D2148((uint64_t)v34, (uint64_t)v35 + 8);
      memcpy(v36, v35, 0x82uLL);
      sub_1D75D4AD4((uint64_t)v36);
    }
  }
  else
  {
    LOBYTE(v36[0]) = 0;
    sub_1D764A0C8();
    sub_1D76612D0();
    sub_1D764A114();
    OUTLINED_FUNCTION_47_3();
    sub_1D7661380();
    OUTLINED_FUNCTION_45_1();
    v26();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18_10();
    v27();
    v36[0] = v35[0];
    v36[1] = v35[1];
    v36[2] = v35[2];
    v36[3] = v35[3];
    v36[4] = v35[4];
    v36[5] = v35[5];
    LOBYTE(v36[6]) = v35[6];
    sub_1D75D20D0((uint64_t)v36);
  }
  sub_1D75D20E0((uint64_t)v36, (uint64_t)v38);
  sub_1D75D20E0((uint64_t)v38, v31);
LABEL_10:
  __swift_destroy_boxed_opaque_existential_0Tm(v33);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D764250C()
{
}

void sub_1D7642524()
{
}

uint64_t sub_1D764253C(uint64_t a1)
{
  unint64_t v2 = sub_1D764C8AC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642578(uint64_t a1)
{
  unint64_t v2 = sub_1D764C8AC();
  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1D76425B4()
{
  return sub_1D763D0F0(*v0);
}

uint64_t sub_1D76425BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763CDB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D76425E4(uint64_t a1)
{
  unint64_t v2 = sub_1D764C77C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642620(uint64_t a1)
{
  unint64_t v2 = sub_1D764C77C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764265C(uint64_t a1)
{
  unint64_t v2 = sub_1D764C7C8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642698(uint64_t a1)
{
  unint64_t v2 = sub_1D764C7C8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76426D4(uint64_t a1)
{
  unint64_t v2 = sub_1D764C944();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642710(uint64_t a1)
{
  unint64_t v2 = sub_1D764C944();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764274C(uint64_t a1)
{
  unint64_t v2 = sub_1D764C9DC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642788(uint64_t a1)
{
  unint64_t v2 = sub_1D764C9DC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76427C4(uint64_t a1)
{
  unint64_t v2 = sub_1D764C990();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642800(uint64_t a1)
{
  unint64_t v2 = sub_1D764C990();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763D208(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D764286C(uint64_t a1)
{
  unint64_t v2 = sub_1D764C860();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76428A8(uint64_t a1)
{
  unint64_t v2 = sub_1D764C860();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76428E4(uint64_t a1)
{
  unint64_t v2 = sub_1D764C8F8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642920(uint64_t a1)
{
  unint64_t v2 = sub_1D764C8F8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764295C(uint64_t a1)
{
  unint64_t v2 = sub_1D764C814();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642998(uint64_t a1)
{
  unint64_t v2 = sub_1D764C814();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D76429D4()
{
}

void sub_1D76429EC()
{
}

uint64_t sub_1D7642A04(uint64_t a1)
{
  unint64_t v2 = sub_1D764C568();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642A40(uint64_t a1)
{
  unint64_t v2 = sub_1D764C568();
  return MEMORY[0x1F41862B0](a1, v2);
}

unint64_t sub_1D7642A7C()
{
  return sub_1D763E990(*v0);
}

uint64_t sub_1D7642A84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763E6B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7642AAC(uint64_t a1)
{
  unint64_t v2 = sub_1D764C484();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642AE8(uint64_t a1)
{
  unint64_t v2 = sub_1D764C484();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642B24()
{
  return sub_1D763EBC4(*v0);
}

uint64_t sub_1D7642B2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763EA84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7642B54(uint64_t a1)
{
  unint64_t v2 = sub_1D764C5B4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642B90(uint64_t a1)
{
  unint64_t v2 = sub_1D764C5B4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642BCC(uint64_t a1)
{
  unint64_t v2 = sub_1D764C51C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642C08(uint64_t a1)
{
  unint64_t v2 = sub_1D764C51C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642C44(uint64_t a1)
{
  unint64_t v2 = sub_1D764C6E4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642C80(uint64_t a1)
{
  unint64_t v2 = sub_1D764C6E4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642CBC(uint64_t a1)
{
  unint64_t v2 = sub_1D764C698();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642CF8(uint64_t a1)
{
  unint64_t v2 = sub_1D764C698();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763EC20(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D7642D64(uint64_t a1)
{
  unint64_t v2 = sub_1D764C4D0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642DA0(uint64_t a1)
{
  unint64_t v2 = sub_1D764C4D0();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D7642DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1D763F34C(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), HIBYTE(vars8));
}

void sub_1D7642DF4()
{
}

unint64_t sub_1D7642E0C()
{
  return sub_1D763FFA4(*v0);
}

uint64_t sub_1D7642E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D763FC14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7642E3C(uint64_t a1)
{
  unint64_t v2 = sub_1D764A2B8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642E78(uint64_t a1)
{
  unint64_t v2 = sub_1D764A2B8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642EB4()
{
  return sub_1D76401D0(*v0);
}

uint64_t sub_1D7642EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76400CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7642EE4(uint64_t a1)
{
  unint64_t v2 = sub_1D764A4D8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642F20(uint64_t a1)
{
  unint64_t v2 = sub_1D764A4D8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7642F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D764020C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D7642F8C(uint64_t a1)
{
  unint64_t v2 = sub_1D764A48C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7642FC8(uint64_t a1)
{
  unint64_t v2 = sub_1D764A48C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7643004(uint64_t a1)
{
  unint64_t v2 = sub_1D764A3A8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643040(uint64_t a1)
{
  unint64_t v2 = sub_1D764A3A8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764307C(uint64_t a1)
{
  unint64_t v2 = sub_1D764A304();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76430B8(uint64_t a1)
{
  unint64_t v2 = sub_1D764A304();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76430F4(uint64_t a1)
{
  unint64_t v2 = sub_1D764A5BC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643130(uint64_t a1)
{
  unint64_t v2 = sub_1D764A5BC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764316C(uint64_t a1)
{
  unint64_t v2 = sub_1D764A524();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76431A8(uint64_t a1)
{
  unint64_t v2 = sub_1D764A524();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76431E4(uint64_t a1)
{
  unint64_t v2 = sub_1D764A440();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643220(uint64_t a1)
{
  unint64_t v2 = sub_1D764A440();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764325C(uint64_t a1)
{
  unint64_t v2 = sub_1D764A35C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643298(uint64_t a1)
{
  unint64_t v2 = sub_1D764A35C();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D76432D4()
{
}

void sub_1D76432EC()
{
}

uint64_t sub_1D7643304()
{
  return sub_1D7641834(*v0);
}

uint64_t sub_1D764330C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76416EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7643334(uint64_t a1)
{
  unint64_t v2 = sub_1D7649F4C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643370(uint64_t a1)
{
  unint64_t v2 = sub_1D7649F4C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76433AC(uint64_t a1)
{
  unint64_t v2 = sub_1D764A0C8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76433E8(uint64_t a1)
{
  unint64_t v2 = sub_1D764A0C8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7643424(uint64_t a1)
{
  unint64_t v2 = sub_1D764A030();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643460(uint64_t a1)
{
  unint64_t v2 = sub_1D764A030();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D764349C()
{
  return sub_1D764195C(*v0);
}

uint64_t sub_1D76434A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D7641888(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D76434CC(uint64_t a1)
{
  unint64_t v2 = sub_1D7649F98();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643508(uint64_t a1)
{
  unint64_t v2 = sub_1D7649F98();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D7643544()
{
}

void sub_1D764355C()
{
}

uint64_t static ControlChannelConnectionIdentifierCategory.numberOfCharacters.getter()
{
  return 6;
}

uint64_t static ControlChannelConnectionIdentifierCategory.prefix.getter()
{
  return 1852793699;
}

uint64_t sub_1D764358C()
{
  return 1852793699;
}

uint64_t sub_1D764359C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000001D7677500 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6974704F74736F68 && a2 == 0xEB00000000736E6FLL;
    if (v5 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x80000001D7673790)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v6 = sub_1D7661560();
      swift_bridgeObjectRelease();
      if (v6) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1D7643700(char a1)
{
  uint64_t result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1) {
      return 0x6974704F74736F68;
    }
    else {
      return 0xD000000000000015;
    }
  }
  return result;
}

void sub_1D7643768()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CA30);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_24_8(v2);
  sub_1D764E208();
  OUTLINED_FUNCTION_31_0();
  type metadata accessor for ControlChannelConnectionWireProtocolVersion();
  sub_1D764CCA8((uint64_t)&unk_1EBDEBCF8);
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_34_6();
  if (!v0)
  {
    OUTLINED_FUNCTION_27_10();
    sub_1D764E2A0();
    OUTLINED_FUNCTION_34_6();
    OUTLINED_FUNCTION_33_7();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC148);
    sub_1D75D4584((uint64_t)&unk_1EA82CA40);
    OUTLINED_FUNCTION_91_1();
    OUTLINED_FUNCTION_104_1();
  }
  uint64_t v4 = OUTLINED_FUNCTION_79_1();
  v5(v4);
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D76438FC()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE50);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_53_3(v2);
  sub_1D764E208();
  OUTLINED_FUNCTION_88_1();
  sub_1D76617A0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    sub_1D764CCA8((uint64_t)&unk_1EBDEBD00);
    OUTLINED_FUNCTION_83_0();
    sub_1D7661380();
    OUTLINED_FUNCTION_27_10();
    sub_1D764E254();
    id v6 = v8;
    OUTLINED_FUNCTION_102_0();
    sub_1D7661380();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC148);
    OUTLINED_FUNCTION_33_7();
    sub_1D75D4584((uint64_t)&unk_1EBDEC140);
    sub_1D7661320();
    OUTLINED_FUNCTION_28_0();
    v7();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)uint64_t v4 = v6;
    *(unsigned char *)(v4 + 8) = (_BYTE)v8;
    *(void *)(v4 + 16) = v8;
    *(void *)(v4 + 24) = v9;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1D7643B68()
{
  return sub_1D7643700(*v0);
}

uint64_t sub_1D7643B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D764359C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7643B98(uint64_t a1)
{
  unint64_t v2 = sub_1D764E208();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7643BD4(uint64_t a1)
{
  unint64_t v2 = sub_1D764E208();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D7643C10()
{
}

void sub_1D7643C28()
{
}

uint64_t sub_1D7643C40(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000001D7677500 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x80000001D7677520 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v5 = a1 == 0x704F656369766564 && a2 == 0xED0000736E6F6974;
    if (v5 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6976654472656570 && a2 == 0xEE006F666E496563)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v7 = sub_1D7661560();
      swift_bridgeObjectRelease();
      if (v7) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_1D7643E34(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000023;
      break;
    case 2:
      unint64_t result = 0x704F656369766564;
      break;
    case 3:
      unint64_t result = 0x6976654472656570;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1D7643EE4()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF28);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D764CC10();
  OUTLINED_FUNCTION_31_0();
  type metadata accessor for ControlChannelConnectionWireProtocolVersion();
  sub_1D764CCA8((uint64_t)&unk_1EBDEBCF8);
  OUTLINED_FUNCTION_34_6();
  if (!v0)
  {
    OUTLINED_FUNCTION_27_10();
    OUTLINED_FUNCTION_34_6();
    OUTLINED_FUNCTION_33_7();
    sub_1D764CCE8();
    OUTLINED_FUNCTION_34_6();
    sub_1D764A704();
    OUTLINED_FUNCTION_104_1();
  }
  uint64_t v4 = OUTLINED_FUNCTION_79_1();
  v5(v4);
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D76441B4()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C9D8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3_13();
  uint64_t v95 = (uint64_t)v2;
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D764CC10();
  sub_1D76617A0();
  if (v0)
  {
    uint64_t v6 = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
    OUTLINED_FUNCTION_23_6(v6, v7, v8, v9, v10, v11, v12, v13, v32, v34, v36, v38);
  }
  else
  {
    uint64_t v55 = v4;
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    sub_1D764CCA8((uint64_t)&unk_1EBDEBD00);
    OUTLINED_FUNCTION_32_6();
    id v14 = v58[0];
    OUTLINED_FUNCTION_32_6();
    LOBYTE(v57[0]) = 2;
    sub_1D764CC5C();
    id v15 = v58[0];
    sub_1D7661380();
    char v53 = BYTE2(v58[0]);
    char v54 = (char)v58[0];
    char v52 = BYTE3(v58[0]);
    char v50 = BYTE1(v58[0]);
    char v51 = BYTE4(v58[0]);
    char v79 = 3;
    sub_1D764A570();
    sub_1D7661320();
    OUTLINED_FUNCTION_6();
    v16();
    long long v42 = v15;
    uint64_t v43 = v81;
    uint64_t v17 = v82;
    uint64_t v18 = v83;
    uint64_t v56 = v84;
    uint64_t v40 = v85;
    long long v41 = v14;
    uint64_t v19 = v86;
    id v20 = v14;
    uint64_t v45 = v88;
    uint64_t v46 = v89;
    id v21 = v15;
    uint64_t v47 = v90;
    unint64_t v48 = v91;
    char v49 = v92;
    uint64_t v22 = v80;
    uint64_t v35 = v86;
    uint64_t v37 = v80;
    uint64_t v33 = v82;
    uint64_t v44 = v83;
    uint64_t v23 = v87;
    unint64_t v39 = v87;
    sub_1D75BBF70(v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91);
    OUTLINED_FUNCTION_23_6(v24, v25, v26, v27, v28, v29, v30, v31, v33, v35, v37, v39);
    v57[0] = v20;
    v57[1] = v21;
    LOBYTE(v57[2]) = v54;
    BYTE1(v57[2]) = v50;
    BYTE2(v57[2]) = v53;
    BYTE3(v57[2]) = v52;
    BYTE4(v57[2]) = v51;
    v57[3] = v22;
    v57[4] = v43;
    v57[5] = v17;
    v57[6] = v18;
    v57[7] = v56;
    v57[8] = v40;
    v57[9] = v19;
    v57[10] = v23;
    v57[11] = v45;
    v57[12] = v46;
    v57[13] = v47;
    v57[14] = v48;
    LOBYTE(v57[15]) = v49;
    sub_1D75D4C40((uint64_t)v57);
    sub_1D759423C(v47, v43, v45, v44, v56, v40, v46, v48, v45, v46, v47, v48);

    memcpy(v55, v57, 0x79uLL);
    __swift_destroy_boxed_opaque_existential_0Tm(v95);
    v58[0] = v41;
    v58[1] = v42;
    char v59 = v54;
    char v60 = v50;
    char v61 = v53;
    char v62 = v52;
    char v63 = v51;
    __int16 v64 = v93;
    char v65 = v94;
    uint64_t v66 = v47;
    uint64_t v67 = v43;
    uint64_t v68 = v45;
    uint64_t v69 = v44;
    uint64_t v70 = v56;
    uint64_t v71 = v40;
    uint64_t v72 = v46;
    unint64_t v73 = v48;
    uint64_t v74 = v45;
    uint64_t v75 = v46;
    uint64_t v76 = v47;
    unint64_t v77 = v48;
    char v78 = v49;
    sub_1D75D4CF4((uint64_t)v58);
  }
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D764460C()
{
  return sub_1D7643E34(*v0);
}

uint64_t sub_1D7644614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D7643C40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D764463C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1D75B1BA8();
  *a1 = result;
  return result;
}

uint64_t sub_1D7644664(uint64_t a1)
{
  unint64_t v2 = sub_1D764CC10();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76446A0(uint64_t a1)
{
  unint64_t v2 = sub_1D764CC10();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1D76446DC()
{
}

void sub_1D76446F4()
{
}

uint64_t PeerDeviceInfo.identifier.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t PeerDeviceInfo.identifier.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*PeerDeviceInfo.identifier.modify())(void)
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.name.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t PeerDeviceInfo.name.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*PeerDeviceInfo.name.modify())(void)
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.model.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t PeerDeviceInfo.model.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*PeerDeviceInfo.model.modify())(void)
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.udid.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t PeerDeviceInfo.udid.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*PeerDeviceInfo.udid.modify())(void)
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.ecid.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t PeerDeviceInfo.ecid.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 64) = result;
  *(unsigned char *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*PeerDeviceInfo.ecid.modify())(void)
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.deviceKVSData.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_36();
  sub_1D75AC3B4(v0, v1);
  return OUTLINED_FUNCTION_36();
}

uint64_t PeerDeviceInfo.deviceKVSData.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = sub_1D75941DC(*(void *)(v1 + 80), *(void *)(v1 + 88));
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*PeerDeviceInfo.deviceKVSData.modify())(void)
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.getter()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 96) = result;
  return result;
}

uint64_t (*PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_1D76449F8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701667182 && a2 == 0xE400000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000;
      if (v7 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 1684628597 && a2 == 0xE400000000000000;
        if (v8 || (sub_1D7661560() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 1684628325 && a2 == 0xE400000000000000;
          if (v9 || (sub_1D7661560() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x564B656369766564 && a2 == 0xED00006174614453;
            if (v10 || (sub_1D7661560() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD00000000000001ELL && a2 == 0x80000001D76773E0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              char v11 = sub_1D7661560();
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
}

unint64_t sub_1D7644CBC(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701667182;
      break;
    case 2:
      unint64_t result = 0x6C65646F6DLL;
      break;
    case 3:
      unint64_t result = 1684628597;
      break;
    case 4:
      unint64_t result = 1684628325;
      break;
    case 5:
      unint64_t result = 0x564B656369766564;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1D7644DA0()
{
  return sub_1D7644CBC(*v0);
}

uint64_t sub_1D7644DA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76449F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7644DD0(uint64_t a1)
{
  unint64_t v2 = sub_1D7645058();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7644E0C(uint64_t a1)
{
  unint64_t v2 = sub_1D7645058();
  return MEMORY[0x1F41862B0](a1, v2);
}

void PeerDeviceInfo.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF18);
  OUTLINED_FUNCTION_0_5();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_53_3(v3);
  sub_1D7645058();
  sub_1D76617C0();
  OUTLINED_FUNCTION_30_3();
  sub_1D7661400();
  if (!v0)
  {
    OUTLINED_FUNCTION_73_1(1);
    OUTLINED_FUNCTION_84_1();
    OUTLINED_FUNCTION_73_1(2);
    OUTLINED_FUNCTION_84_1();
    OUTLINED_FUNCTION_73_1(3);
    OUTLINED_FUNCTION_84_1();
    OUTLINED_FUNCTION_73_1(4);
    OUTLINED_FUNCTION_87_1();
    sub_1D7661440();
    sub_1D75E1BB4();
    OUTLINED_FUNCTION_104_1();
    OUTLINED_FUNCTION_87_1();
    sub_1D7661410();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D7645058()
{
  unint64_t result = qword_1EBDEAEA0;
  if (!qword_1EBDEAEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEAEA0);
  }
  return result;
}

void PeerDeviceInfo.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C758);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D7645058();
  OUTLINED_FUNCTION_69_0();
  sub_1D76617A0();
  if (v0)
  {
    uint64_t v12 = 0;
    unint64_t v11 = 0xF000000000000000;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  }
  else
  {
    OUTLINED_FUNCTION_39_6();
    uint64_t v6 = sub_1D76612F0();
    uint64_t v8 = v7;
    LOBYTE(v25) = 1;
    swift_bridgeObjectRetain();
    uint64_t v20 = OUTLINED_FUNCTION_40_4();
    uint64_t v21 = v6;
    OUTLINED_FUNCTION_74_0(2);
    uint64_t v24 = v6;
    uint64_t v19 = OUTLINED_FUNCTION_40_4();
    OUTLINED_FUNCTION_74_0(3);
    uint64_t v23 = v6;
    uint64_t v18 = OUTLINED_FUNCTION_40_4();
    OUTLINED_FUNCTION_74_0(4);
    OUTLINED_FUNCTION_39_6();
    uint64_t v22 = v6;
    uint64_t v9 = sub_1D7661330();
    char v27 = v10;
    uint64_t v17 = v9;
    sub_1D75E4EB4();
    sub_1D7661320();
    uint64_t v16 = v4;
    uint64_t v12 = v25;
    unint64_t v11 = v26;
    sub_1D75AC3B4(v25, v26);
    OUTLINED_FUNCTION_39_6();
    char v13 = sub_1D7661300();
    uint64_t v14 = OUTLINED_FUNCTION_9_11();
    v15(v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1D75AC3B4(v25, v26);
    sub_1D75941DC(v25, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)uint64_t v16 = v21;
    *(void *)(v16 + 8) = v8;
    *(void *)(v16 + 16) = v20;
    *(void *)(v16 + 24) = v24;
    *(void *)(v16 + 32) = v19;
    *(void *)(v16 + 40) = v23;
    *(void *)(v16 + 48) = v18;
    *(void *)(v16 + 56) = v22;
    *(void *)(v16 + 64) = v17;
    *(unsigned char *)(v16 + 72) = v27 & 1;
    *(void *)(v16 + 80) = v25;
    *(void *)(v16 + 88) = v26;
    *(unsigned char *)(v16 + 96) = v13;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_1D75941DC(v12, v11);
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D76454DC()
{
}

void sub_1D76454F4()
{
}

uint64_t ListenerStartedResponse.port.getter()
{
  return *v0;
}

uint64_t ListenerStartedResponse.deviceRawPublicKey.getter()
{
  sub_1D75934F4(*(void *)(v0 + 8), *(void *)(v0 + 16));
  return OUTLINED_FUNCTION_36();
}

uint64_t ListenerStartedResponse.init(port:deviceRawPublicKey:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_WORD *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_1D7645550(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1953656688 && a2 == 0xE400000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001D7677400)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D7645630(char a1)
{
  if (a1) {
    return 0xD000000000000012;
  }
  else {
    return 1953656688;
  }
}

uint64_t sub_1D7645664()
{
  return sub_1D7645630(*v0);
}

uint64_t sub_1D764566C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D7645550(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7645694(uint64_t a1)
{
  unint64_t v2 = sub_1D764582C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76456D0(uint64_t a1)
{
  unint64_t v2 = sub_1D764582C();
  return MEMORY[0x1F41862B0](a1, v2);
}

void ListenerStartedResponse.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C760);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_24_8(v2);
  sub_1D764582C();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_87_1();
  sub_1D76614C0();
  if (!v0)
  {
    sub_1D75E1BB4();
    OUTLINED_FUNCTION_34_6();
  }
  OUTLINED_FUNCTION_28_0();
  v4();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D764582C()
{
  unint64_t result = qword_1EA82C768;
  if (!qword_1EA82C768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C768);
  }
  return result;
}

void ListenerStartedResponse.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C770);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_53_3(v2);
  sub_1D764582C();
  OUTLINED_FUNCTION_88_1();
  sub_1D76617A0();
  if (!v0)
  {
    LOBYTE(v8) = 0;
    __int16 v6 = sub_1D76613B0();
    OUTLINED_FUNCTION_27_10();
    sub_1D75E4EB4();
    OUTLINED_FUNCTION_47_3();
    sub_1D7661380();
    OUTLINED_FUNCTION_28_0();
    v7();
    *(_WORD *)uint64_t v4 = v6;
    *(_OWORD *)(v4 + 8) = v8;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_95_1();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D76459DC()
{
}

void sub_1D76459F4()
{
}

uint64_t StreamEncryptedMessage.encryptedData.getter()
{
  sub_1D75934F4(*(void *)v0, *(void *)(v0 + 8));
  return OUTLINED_FUNCTION_36();
}

uint64_t sub_1D7645A3C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6574707972636E65 && a2 == 0xED00006174614464)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D7645AE8()
{
  return 0x6574707972636E65;
}

uint64_t sub_1D7645B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D7645A3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D7645B3C(uint64_t a1)
{
  unint64_t v2 = sub_1D7645CA4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7645B78(uint64_t a1)
{
  unint64_t v2 = sub_1D7645CA4();
  return MEMORY[0x1F41862B0](a1, v2);
}

void StreamEncryptedMessage.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C778);
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24_8(v2);
  sub_1D7645CA4();
  OUTLINED_FUNCTION_31_0();
  sub_1D75E1BB4();
  sub_1D7661490();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D7645CA4()
{
  unint64_t result = qword_1EA82C780;
  if (!qword_1EA82C780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C780);
  }
  return result;
}

void StreamEncryptedMessage.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82C788);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_53_3(v2);
  sub_1D7645CA4();
  OUTLINED_FUNCTION_69_0();
  sub_1D76617A0();
  if (!v0)
  {
    sub_1D75E4EB4();
    OUTLINED_FUNCTION_36_7();
    OUTLINED_FUNCTION_30_3();
    OUTLINED_FUNCTION_28_0();
    v6();
    _OWORD *v4 = v7;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D7645DF0()
{
}

void sub_1D7645E08()
{
}

uint64_t PropertyListCodable.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t PropertyListCodable.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

uint64_t (*PropertyListCodable.wrappedValue.modify())(void)
{
  return nullsub_1;
}

void PropertyListCodable.init(from:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v40 = v2;
  long long v41 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  v43[5] = *MEMORY[0x1E4F143B8];
  sub_1D7661000();
  OUTLINED_FUNCTION_0_5();
  uint64_t v38 = v8;
  uint64_t v39 = v7;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  unint64_t v11 = (char *)&v32 - v10;
  uint64_t v37 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v12 = type metadata accessor for PropertyListCodable();
  OUTLINED_FUNCTION_0_5();
  uint64_t v36 = v13;
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v32 - v15;
  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  uint64_t v17 = v41;
  sub_1D7661790();
  if (v17) {
    goto LABEL_10;
  }
  uint64_t v32 = v16;
  uint64_t v33 = v1;
  uint64_t v34 = v12;
  uint64_t v35 = v11;
  long long v41 = v6;
  OUTLINED_FUNCTION_53_3(v43);
  sub_1D75E4EB4();
  sub_1D7661580();
  id v19 = v42[0];
  id v18 = v42[1];
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_1D765FEB0();
  v42[0] = 0;
  id v22 = objc_msgSend(v20, sel_propertyListWithData_options_format_error_, v21, 0, 0, v42);

  uint64_t v23 = (uint64_t)v41;
  if (!v22)
  {
    id v30 = v42[0];
    sub_1D765FD60();

    goto LABEL_8;
  }
  id v24 = v42[0];
  sub_1D7661070();
  swift_unknownObjectRelease();
  uint64_t v25 = (uint64_t)v35;
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload(v25, 1, 1, v4);
    OUTLINED_FUNCTION_61_2();
    OUTLINED_FUNCTION_6();
    v31();
    sub_1D75B0D60();
    OUTLINED_FUNCTION_3_0();
    sub_1D75AF4C0();
    sub_1D7661640();
LABEL_8:
    swift_willThrow();
    sub_1D75933F0((uint64_t)v19, (unint64_t)v18);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
    uint64_t v6 = v41;
LABEL_10:
    uint64_t v29 = (uint64_t)v6;
    goto LABEL_11;
  }
  __swift_storeEnumTagSinglePayload(v25, 0, 1, v4);
  sub_1D75933F0((uint64_t)v19, (unint64_t)v18);
  unint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
  uint64_t v27 = v33;
  v26(v33, v25, v4);
  uint64_t v28 = v32;
  v26((uint64_t)v32, v27, v4);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v43);
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v40, v28, v34);
  uint64_t v29 = v23;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0Tm(v29);
  OUTLINED_FUNCTION_4_0();
}

uint64_t type metadata accessor for PropertyListCodable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PropertyListCodable.encode(to:)(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1D76617B0();
  uint64_t v1 = self;
  v9[0] = 0;
  id v2 = objc_msgSend(v1, sel_dataWithPropertyList_format_options_error_, sub_1D7661550(), 200, 0, v9);
  swift_unknownObjectRelease();
  id v3 = v9[0];
  if (v2)
  {
    uint64_t v4 = (void *)sub_1D765FED0();
    uint64_t v6 = v5;

    v9[0] = v4;
    v9[1] = v6;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    sub_1D75E1BB4();
    sub_1D76615A0();
    sub_1D75933F0((uint64_t)v4, (unint64_t)v6);
  }
  else
  {
    uint64_t v7 = v3;
    sub_1D765FD60();

    swift_willThrow();
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

void sub_1D76463E8()
{
}

uint64_t sub_1D7646404(void *a1)
{
  return PropertyListCodable.encode(to:)(a1);
}

RemotePairingDevice::PairingData::Kind_optional __swiftcall PairingData.Kind.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  unint64_t v3 = sub_1D76612C0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *id v2 = v5;
  return result;
}

unint64_t PairingData.Kind.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000023;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D764650C(unsigned __int8 *a1, char *a2)
{
  return sub_1D75B9FB8(*a1, *a2);
}

uint64_t sub_1D7646518()
{
  return sub_1D75BA220(*v0);
}

uint64_t sub_1D7646520(uint64_t a1)
{
  return sub_1D75BA834(a1, *v1);
}

uint64_t sub_1D7646528(uint64_t a1)
{
  return sub_1D75BA8F8(a1, *v1);
}

RemotePairingDevice::PairingData::Kind_optional sub_1D7646530(Swift::String *a1)
{
  return PairingData.Kind.init(rawValue:)(*a1);
}

unint64_t sub_1D764653C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PairingData.Kind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D7646564()
{
  return sub_1D7660CC0();
}

uint64_t sub_1D76465C4()
{
  return sub_1D7660CA0();
}

uint64_t PairingData.startNewSession.getter()
{
  return *v0;
}

uint64_t PairingData.startNewSession.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*PairingData.startNewSession.modify())(void)
{
  return nullsub_1;
}

void PairingData.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *PairingData.kind.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*PairingData.kind.modify())(void)
{
  return nullsub_1;
}

uint64_t PairingData.data.getter()
{
  sub_1D75934F4(*(void *)(v0 + 8), *(void *)(v0 + 16));
  return OUTLINED_FUNCTION_36();
}

uint64_t PairingData.data.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = sub_1D75933F0(*(void *)(v1 + 8), *(void *)(v1 + 16));
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v0;
  return result;
}

uint64_t (*PairingData.data.modify())(void)
{
  return nullsub_1;
}

uint64_t PairingData.sendingHost.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t PairingData.sendingHost.setter()
{
  OUTLINED_FUNCTION_70();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return result;
}

uint64_t (*PairingData.sendingHost.modify())(void)
{
  return nullsub_1;
}

uint64_t PairingData.pairingOptions.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t PairingData.pairingOptions.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = v2;
  return result;
}

uint64_t (*PairingData.pairingOptions.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_1D76467D8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x77654E7472617473 && a2 == 0xEF6E6F6973736553;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1684957547 && a2 == 0xE400000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1635017060 && a2 == 0xE400000000000000;
      if (v7 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x48676E69646E6573 && a2 == 0xEB0000000074736FLL;
        if (v8 || (sub_1D7661560() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x4F676E6972696170 && a2 == 0xEE00736E6F697470)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_1D7661560();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_1D7646A30(char a1)
{
  uint64_t result = 0x77654E7472617473;
  switch(a1)
  {
    case 1:
      uint64_t result = 1684957547;
      break;
    case 2:
      uint64_t result = 1635017060;
      break;
    case 3:
      uint64_t result = 0x48676E69646E6573;
      break;
    case 4:
      uint64_t result = 0x4F676E6972696170;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D7646AF0()
{
  return sub_1D7646A30(*v0);
}

uint64_t sub_1D7646AF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76467D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7646B20(uint64_t a1)
{
  unint64_t v2 = sub_1D7647068();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7646B5C(uint64_t a1)
{
  unint64_t v2 = sub_1D7647068();
  return MEMORY[0x1F41862B0](a1, v2);
}

void PairingData.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBF20);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D7647068();
  OUTLINED_FUNCTION_99_1();
  OUTLINED_FUNCTION_87_1();
  sub_1D7661460();
  if (!v0)
  {
    OUTLINED_FUNCTION_27_10();
    sub_1D76470B4();
    OUTLINED_FUNCTION_34_6();
    OUTLINED_FUNCTION_33_7();
    sub_1D75E1BB4();
    OUTLINED_FUNCTION_34_6();
    OUTLINED_FUNCTION_73_1(3);
    OUTLINED_FUNCTION_87_1();
    sub_1D7661400();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEB2A8);
    sub_1D75D4584((uint64_t)&unk_1EBDEB298);
    OUTLINED_FUNCTION_104_1();
  }
  OUTLINED_FUNCTION_58_1();
  v4();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_4_0();
}

void PairingData.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEBE48);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_24_8(v2);
  sub_1D7647068();
  sub_1D76617A0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  }
  else
  {
    LOBYTE(v15) = 0;
    OUTLINED_FUNCTION_101_1();
    char v6 = sub_1D7661350();
    OUTLINED_FUNCTION_27_10();
    sub_1D7647100();
    OUTLINED_FUNCTION_55_1();
    OUTLINED_FUNCTION_33_7();
    sub_1D75E4EB4();
    OUTLINED_FUNCTION_55_1();
    uint64_t v14 = v4;
    uint64_t v7 = v15;
    LOBYTE(v15) = 3;
    sub_1D75934F4(v7, v16);
    OUTLINED_FUNCTION_101_1();
    uint64_t v8 = sub_1D76612F0();
    uint64_t v10 = v9;
    uint64_t v13 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEB2A8);
    sub_1D75D4584((uint64_t)&unk_1EBDEB2A0);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_83_0();
    sub_1D7661320();
    uint64_t v11 = OUTLINED_FUNCTION_76_1();
    v12(v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1D75934F4(v7, v16);
    OUTLINED_FUNCTION_75_0();
    *(unsigned char *)uint64_t v14 = v6 & 1;
    *(unsigned char *)(v14 + 1) = 0;
    *(void *)(v14 + 8) = v7;
    *(void *)(v14 + 16) = v16;
    *(void *)(v14 + 24) = v13;
    *(void *)(v14 + 32) = v10;
    *(void *)(v14 + 40) = v15;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
    OUTLINED_FUNCTION_75_0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_0();
}

void sub_1D7647038()
{
}

void sub_1D7647050()
{
}

unint64_t sub_1D7647068()
{
  unint64_t result = qword_1EBDEB010;
  if (!qword_1EBDEB010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB010);
  }
  return result;
}

unint64_t sub_1D76470B4()
{
  unint64_t result = qword_1EBDEB028;
  if (!qword_1EBDEB028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB028);
  }
  return result;
}

unint64_t sub_1D7647100()
{
  unint64_t result = qword_1EBDEB038;
  if (!qword_1EBDEB038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB038);
  }
  return result;
}

unint64_t sub_1D7647150()
{
  unint64_t result = qword_1EA82C790;
  if (!qword_1EA82C790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C790);
  }
  return result;
}

uint64_t destroy for ControlChannelMessageEnvelope(uint64_t a1)
{
  return sub_1D7607558(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(_WORD *)(a1 + 144), (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
           (uint64_t (*)(void))sub_1D75D1FE8,
           (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
}

uint64_t initializeWithCopy for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 88);
  uint64_t v14 = *(void *)(a2 + 96);
  uint64_t v15 = *(void *)(a2 + 104);
  uint64_t v16 = *(void *)(a2 + 112);
  uint64_t v17 = *(void *)(a2 + 120);
  uint64_t v18 = *(void *)(a2 + 128);
  uint64_t v19 = *(void *)(a2 + 136);
  __int16 v20 = *(_WORD *)(a2 + 144);
  uint64_t v11 = *(void *)(a2 + 80);
  sub_1D7607558(v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t (*)(void))sub_1D75934F4, (uint64_t (*)(void))sub_1D75D4704,
    (uint64_t (*)(void))sub_1D75D480C,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v13;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = v16;
  *(void *)(a1 + 120) = v17;
  *(void *)(a1 + 128) = v18;
  *(void *)(a1 + 136) = v19;
  *(_WORD *)(a1 + 144) = v20;
  return a1;
}

uint64_t assignWithCopy for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a2 + 80);
  uint64_t v27 = *(void *)(a2 + 88);
  uint64_t v28 = *(void *)(a2 + 96);
  uint64_t v29 = *(void *)(a2 + 104);
  uint64_t v30 = *(void *)(a2 + 112);
  uint64_t v31 = *(void *)(a2 + 120);
  uint64_t v32 = *(void *)(a2 + 128);
  uint64_t v33 = *(void *)(a2 + 136);
  __int16 v34 = *(_WORD *)(a2 + 144);
  sub_1D7607558(v3, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t (*)(void))sub_1D75934F4, (uint64_t (*)(void))sub_1D75D4704,
    (uint64_t (*)(void))sub_1D75D480C,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 72);
  long long v20 = *(_OWORD *)(a1 + 80);
  long long v21 = *(_OWORD *)(a1 + 96);
  long long v22 = *(_OWORD *)(a1 + 112);
  uint64_t v23 = *(void *)(a1 + 128);
  uint64_t v24 = *(void *)(a1 + 136);
  __int16 v25 = *(_WORD *)(a1 + 144);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v27;
  *(void *)(a1 + 96) = v28;
  *(void *)(a1 + 104) = v29;
  *(void *)(a1 + 112) = v30;
  *(void *)(a1 + 120) = v31;
  *(void *)(a1 + 128) = v32;
  *(void *)(a1 + 136) = v33;
  *(_WORD *)(a1 + 144) = v34;
  sub_1D7607558(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25, (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
    (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

uint64_t assignWithTake for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 136);
  __int16 v4 = *(_WORD *)(a2 + 144);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v17 = *(void *)(a1 + 136);
  __int16 v18 = *(_WORD *)(a1 + 144);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = v3;
  *(_WORD *)(a1 + 144) = v4;
  sub_1D7607558(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, v17, v18, (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
    (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlChannelMessageEnvelope(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[146])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = v3 - 2;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlChannelMessageEnvelope(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 146) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 146) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for ControlChannelMessageEnvelope()
{
}

void type metadata accessor for ControlChannelConnectionIdentifierCategory()
{
}

uint64_t destroy for PeerDeviceInfo(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 88);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 80);
    return sub_1D75933F0(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = (uint64_t *)(a2 + 80);
  unint64_t v10 = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v9;
  }
  else
  {
    uint64_t v11 = *v9;
    sub_1D75934F4(*v9, v10);
    *(void *)(a1 + 80) = v11;
    *(void *)(a1 + 88) = v10;
  }
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t assignWithCopy for PeerDeviceInfo(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v4;
  uint64_t v5 = (uint64_t *)(a2 + 80);
  unint64_t v6 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88) >> 60 != 15)
  {
    if (v6 >> 60 != 15)
    {
      uint64_t v8 = *v5;
      sub_1D75934F4(*v5, *(void *)(a2 + 88));
      uint64_t v9 = *(void *)(a1 + 80);
      unint64_t v10 = *(void *)(a1 + 88);
      *(void *)(a1 + 80) = v8;
      *(void *)(a1 + 88) = v6;
      sub_1D75933F0(v9, v10);
      goto LABEL_8;
    }
    sub_1D76479EC(a1 + 80);
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v5;
    goto LABEL_8;
  }
  uint64_t v7 = *v5;
  sub_1D75934F4(*v5, *(void *)(a2 + 88));
  *(void *)(a1 + 80) = v7;
  *(void *)(a1 + 88) = v6;
LABEL_8:
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t sub_1D76479EC(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t assignWithTake for PeerDeviceInfo(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v8 = (void *)(a2 + 80);
  unint64_t v9 = *(void *)(a1 + 88);
  if (v9 >> 60 != 15)
  {
    unint64_t v10 = *(void *)(a2 + 88);
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *(void *)(a1 + 80);
      *(void *)(a1 + 80) = *v8;
      *(void *)(a1 + 88) = v10;
      sub_1D75933F0(v11, v9);
      goto LABEL_6;
    }
    sub_1D76479EC(a1 + 80);
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)v8;
LABEL_6:
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeerDeviceInfo(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 97))
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

uint64_t storeEnumTagSinglePayload for PeerDeviceInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 97) = 1;
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
    *(unsigned char *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PeerDeviceInfo()
{
}

uint64_t destroy for ListenerStartedResponse(uint64_t a1)
{
  return sub_1D75933F0(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_1D75934F4(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ListenerStartedResponse(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_1D75934F4(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_1D75933F0(v5, v6);
  return a1;
}

uint64_t assignWithTake for ListenerStartedResponse(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1D75933F0(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ListenerStartedResponse(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 24))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for ListenerStartedResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for ListenerStartedResponse()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for StreamEncryptedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1D75934F4(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for StreamEncryptedMessage(uint64_t a1)
{
  return sub_1D75933F0(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for StreamEncryptedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1D75934F4(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1D75933F0(v5, v6);
  return a1;
}

uint64_t *assignWithTake for StreamEncryptedMessage(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1D75933F0(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for StreamEncryptedMessage(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 16))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for StreamEncryptedMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for StreamEncryptedMessage()
{
}

uint64_t sub_1D7647ECC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1D7647F5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1D7648014(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1D7648040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1D7648090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1D76480E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1D7648130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1D7648180(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!a2) {
    return 0;
  }
  int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1D76482CC(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v8 < 4)
    {
      int v14 = (v13 >> v9) + 1;
      if (v8)
      {
        int v16 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1D76484D0);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
      }
      return;
  }
}

uint64_t destroy for PairingData(uint64_t a1)
{
  sub_1D75933F0(*(void *)(a1 + 8), *(void *)(a1 + 16));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PairingData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  sub_1D75934F4(v4, v5);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PairingData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  sub_1D75934F4(v4, v5);
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  sub_1D75933F0(v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PairingData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1D75933F0(v4, v5);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PairingData(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 32);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairingData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

void type metadata accessor for PairingData()
{
}

void type metadata accessor for PairingData.Kind()
{
}

unsigned char *storeEnumTagSinglePayload for PairingData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1D7648848);
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

ValueMetadata *type metadata accessor for PairingData.CodingKeys()
{
  return &type metadata for PairingData.CodingKeys;
}

ValueMetadata *type metadata accessor for StreamEncryptedMessage.CodingKeys()
{
  return &type metadata for StreamEncryptedMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for ListenerStartedResponse.CodingKeys()
{
  return &type metadata for ListenerStartedResponse.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PeerDeviceInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1D7648978);
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

ValueMetadata *type metadata accessor for PeerDeviceInfo.CodingKeys()
{
  return &type metadata for PeerDeviceInfo.CodingKeys;
}

uint64_t sub_1D76489B0(uint64_t a1)
{
  return sub_1D7607558(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(_WORD *)(a1 + 128), (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
           (uint64_t (*)(void))sub_1D75D1FE8,
           (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
}

uint64_t sub_1D7648A54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  __int16 v20 = *(_WORD *)(a2 + 128);
  uint64_t v11 = *(void *)(a2 + 64);
  sub_1D7607558(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t (*)(void))sub_1D75934F4, (uint64_t (*)(void))sub_1D75D4704,
    (uint64_t (*)(void))sub_1D75D480C,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(_WORD *)(a1 + 128) = v20;
  return a1;
}

uint64_t sub_1D7648BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  __int16 v34 = *(_WORD *)(a2 + 128);
  sub_1D7607558(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t (*)(void))sub_1D75934F4, (uint64_t (*)(void))sub_1D75D4704,
    (uint64_t (*)(void))sub_1D75D480C,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 120);
  __int16 v25 = *(_WORD *)(a1 + 128);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 80) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 120) = v33;
  *(_WORD *)(a1 + 128) = v34;
  sub_1D7607558(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25, (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
    (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

void *__swift_memcpy130_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x82uLL);
}

uint64_t sub_1D7648D90(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(_WORD *)(a2 + 128);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 120);
  __int16 v17 = *(_WORD *)(a1 + 128);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  long long v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_WORD *)(a1 + 128) = v3;
  sub_1D7607558(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17, (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
    (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

uint64_t sub_1D7648E70(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 7 && *(unsigned char *)(a1 + 130))
    {
      unsigned int v2 = *(_DWORD *)a1 + 6;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int16 *)(a1 + 128) >> 10) & 6 | (*(unsigned __int16 *)(a1 + 128) >> 13) & 1) ^ 7;
      if (v2 >= 6) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1D7648EBC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 6)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 128) = 0;
    *(void *)uint64_t result = a2 - 7;
    if (a3 >= 7) {
      *(unsigned char *)(result + 130) = 1;
    }
  }
  else
  {
    if (a3 >= 7) {
      *(unsigned char *)(result + 130) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_WORD *)(result + 128) = ((((-a2 >> 1) & 3) - 4 * (_BYTE)a2) & 7) << 11;
    }
  }
  return result;
}

uint64_t sub_1D7648F44(uint64_t result, char a2)
{
  *(_WORD *)(result + 128) = *(_WORD *)(result + 128) & 0xC7FF | ((a2 & 1) << 13);
  return result;
}

void type metadata accessor for ControlChannelMessageEnvelope.Message()
{
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.CodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.CodingKeys;
}

uint64_t sub_1D7648F80(uint64_t a1)
{
  return sub_1D76075E8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(_WORD *)(a1 + 128), (uint64_t (*)(void))sub_1D75D3F24, (uint64_t (*)(void))sub_1D75D1FE8,
           (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
}

uint64_t sub_1D7649010(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  unsigned __int16 v20 = *(_WORD *)(a2 + 128);
  uint64_t v11 = *(void *)(a2 + 64);
  sub_1D76075E8(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t (*)(void))sub_1D75D4704, (uint64_t (*)(void))sub_1D75D480C,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(_WORD *)(a1 + 128) = v20;
  return a1;
}

uint64_t sub_1D7649150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  unsigned __int16 v34 = *(_WORD *)(a2 + 128);
  sub_1D76075E8(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t (*)(void))sub_1D75D4704, (uint64_t (*)(void))sub_1D75D480C,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 120);
  unsigned __int16 v25 = *(_WORD *)(a1 + 128);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 80) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 120) = v33;
  *(_WORD *)(a1 + 128) = v34;
  sub_1D76075E8(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25, (uint64_t (*)(void))sub_1D75D3F24, (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

uint64_t sub_1D7649308(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(_WORD *)(a2 + 128);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 120);
  unsigned __int16 v17 = *(_WORD *)(a1 + 128);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  long long v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_WORD *)(a1 + 128) = v3;
  sub_1D76075E8(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17, (uint64_t (*)(void))sub_1D75D3F24, (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

uint64_t sub_1D76493D4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x1E && *(unsigned char *)(a1 + 130))
    {
      unsigned int v2 = *(_DWORD *)a1 + 29;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int16 *)(a1 + 128) >> 9) & 0x1C | (*(unsigned __int16 *)(a1 + 128) >> 14)) ^ 0x1F;
      if (v2 >= 0x1D) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1D7649420(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 128) = 0;
    *(void *)uint64_t result = a2 - 30;
    if (a3 >= 0x1E) {
      *(unsigned char *)(result + 130) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1E) {
      *(unsigned char *)(result + 130) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)uint64_t result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_WORD *)(result + 128) = (((-a2 >> 2) & 7) - 8 * (_WORD)a2) << 11;
    }
  }
  return result;
}

uint64_t sub_1D76494A8(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 128) = *(_WORD *)(result + 128) & 0x7FF | (a2 << 14);
  return result;
}

void type metadata accessor for ControlChannelMessage()
{
}

void sub_1D76494C8(uint64_t a1)
{
}

uint64_t sub_1D764951C(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  unint64_t v18 = *(void *)(a2 + 112);
  char v19 = *(unsigned char *)(a2 + 120);
  char v20 = *(unsigned char *)(a2 + 121);
  sub_1D75D40B4(*(void **)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(unsigned char *)(a1 + 120) = v19;
  *(unsigned char *)(a1 + 121) = v20;
  return a1;
}

uint64_t sub_1D7649630(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v26 = *(void *)(a2 + 72);
  uint64_t v27 = *(void *)(a2 + 80);
  uint64_t v28 = *(void *)(a2 + 88);
  uint64_t v29 = *(void *)(a2 + 96);
  uint64_t v30 = *(void *)(a2 + 104);
  unint64_t v31 = *(void *)(a2 + 112);
  char v32 = *(unsigned char *)(a2 + 120);
  char v33 = *(unsigned char *)(a2 + 121);
  sub_1D75D40B4(*(void **)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33);
  long long v12 = *(void **)a1;
  uint64_t v13 = *(void **)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  unint64_t v23 = *(void *)(a1 + 112);
  __int16 v24 = *(_WORD *)(a1 + 120);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v26;
  *(void *)(a1 + 80) = v27;
  *(void *)(a1 + 88) = v28;
  *(void *)(a1 + 96) = v29;
  *(void *)(a1 + 104) = v30;
  *(void *)(a1 + 112) = v31;
  *(unsigned char *)(a1 + 120) = v32;
  *(unsigned char *)(a1 + 121) = v33;
  sub_1D75D4328(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy122_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x7AuLL);
}

uint64_t sub_1D7649780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 112);
  __int16 v4 = *(_WORD *)(a2 + 120);
  unint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 96);
  unint64_t v16 = *(void *)(a1 + 112);
  __int16 v17 = *(_WORD *)(a1 + 120);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v3;
  *(_WORD *)(a1 + 120) = v4;
  sub_1D75D4328(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, v17, SHIBYTE(v17));
  return a1;
}

uint64_t sub_1D7649818(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFA && *(unsigned char *)(a1 + 122))
    {
      int v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 121);
      if (v3 <= 6) {
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

uint64_t sub_1D7649858(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 120) = 0;
    *(void *)uint64_t result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 122) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 122) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 121) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1D76498BC(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(void *)uint64_t result = a2 - 6;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    LOBYTE(a2) = 6;
    *(unsigned char *)(result + 120) = 0;
  }
  *(unsigned char *)(result + 121) = a2;
  return result;
}

void type metadata accessor for ControlChannelMessage.Response()
{
}

unint64_t sub_1D7649908()
{
  unint64_t result = qword_1EA82C798;
  if (!qword_1EA82C798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C798);
  }
  return result;
}

unint64_t sub_1D7649958()
{
  unint64_t result = qword_1EA82C7A0;
  if (!qword_1EA82C7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7A0);
  }
  return result;
}

unint64_t sub_1D76499A8()
{
  unint64_t result = qword_1EA82C7A8;
  if (!qword_1EA82C7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7A8);
  }
  return result;
}

unint64_t sub_1D76499F8()
{
  unint64_t result = qword_1EA82C7B0;
  if (!qword_1EA82C7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7B0);
  }
  return result;
}

unint64_t sub_1D7649A48()
{
  unint64_t result = qword_1EA82C7B8;
  if (!qword_1EA82C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7B8);
  }
  return result;
}

unint64_t sub_1D7649A98()
{
  unint64_t result = qword_1EBDEB020;
  if (!qword_1EBDEB020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB020);
  }
  return result;
}

unint64_t sub_1D7649AE8()
{
  unint64_t result = qword_1EBDEB018;
  if (!qword_1EBDEB018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB018);
  }
  return result;
}

unint64_t sub_1D7649B38()
{
  unint64_t result = qword_1EA82C7C0;
  if (!qword_1EA82C7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7C0);
  }
  return result;
}

unint64_t sub_1D7649B88()
{
  unint64_t result = qword_1EA82C7C8;
  if (!qword_1EA82C7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7C8);
  }
  return result;
}

unint64_t sub_1D7649BD8()
{
  unint64_t result = qword_1EA82C7D0;
  if (!qword_1EA82C7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7D0);
  }
  return result;
}

unint64_t sub_1D7649C28()
{
  unint64_t result = qword_1EA82C7D8;
  if (!qword_1EA82C7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7D8);
  }
  return result;
}

unint64_t sub_1D7649C78()
{
  unint64_t result = qword_1EBDEAEB0;
  if (!qword_1EBDEAEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEAEB0);
  }
  return result;
}

unint64_t sub_1D7649CC8()
{
  unint64_t result = qword_1EBDEAEA8;
  if (!qword_1EBDEAEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEAEA8);
  }
  return result;
}

unint64_t sub_1D7649D18()
{
  unint64_t result = qword_1EBDEBC28;
  if (!qword_1EBDEBC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBC28);
  }
  return result;
}

unint64_t sub_1D7649D68()
{
  unint64_t result = qword_1EBDEBC20;
  if (!qword_1EBDEBC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBC20);
  }
  return result;
}

unint64_t sub_1D7649DB4()
{
  unint64_t result = qword_1EBDEBBC8;
  if (!qword_1EBDEBBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBC8);
  }
  return result;
}

unint64_t sub_1D7649E00()
{
  unint64_t result = qword_1EBDEBBE0;
  if (!qword_1EBDEBBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBE0);
  }
  return result;
}

uint64_t sub_1D7649E4C(uint64_t a1)
{
  sub_1D7607558(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(_WORD *)(a1 + 128), (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24,
    (uint64_t (*)(void))sub_1D75D1FE8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  return a1;
}

unint64_t sub_1D7649F00()
{
  unint64_t result = qword_1EA82C7E0;
  if (!qword_1EA82C7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7E0);
  }
  return result;
}

unint64_t sub_1D7649F4C()
{
  unint64_t result = qword_1EBDEB2B0;
  if (!qword_1EBDEB2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2B0);
  }
  return result;
}

unint64_t sub_1D7649F98()
{
  unint64_t result = qword_1EBDEB2F8;
  if (!qword_1EBDEB2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2F8);
  }
  return result;
}

unint64_t sub_1D7649FE4()
{
  unint64_t result = qword_1EA82C7E8;
  if (!qword_1EA82C7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7E8);
  }
  return result;
}

unint64_t sub_1D764A030()
{
  unint64_t result = qword_1EBDEB2E0;
  if (!qword_1EBDEB2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2E0);
  }
  return result;
}

unint64_t sub_1D764A07C()
{
  unint64_t result = qword_1EBDEB430;
  if (!qword_1EBDEB430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB430);
  }
  return result;
}

unint64_t sub_1D764A0C8()
{
  unint64_t result = qword_1EBDEB2C8;
  if (!qword_1EBDEB2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2C8);
  }
  return result;
}

unint64_t sub_1D764A114()
{
  unint64_t result = qword_1EBDEB3A8;
  if (!qword_1EBDEB3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3A8);
  }
  return result;
}

uint64_t sub_1D764A160(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_171(a1);
  sub_1D76075E8(v2, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(_WORD *)(v1 + 128), v3, v4,
    v5);
  return v1;
}

unint64_t sub_1D764A1D4()
{
  unint64_t result = qword_1EBDEB4D8;
  if (!qword_1EBDEB4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4D8);
  }
  return result;
}

unint64_t sub_1D764A220()
{
  unint64_t result = qword_1EA82C7F0;
  if (!qword_1EA82C7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C7F0);
  }
  return result;
}

unint64_t sub_1D764A26C()
{
  unint64_t result = qword_1EBDEB3A0;
  if (!qword_1EBDEB3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3A0);
  }
  return result;
}

unint64_t sub_1D764A2B8()
{
  unint64_t result = qword_1EBDEB458;
  if (!qword_1EBDEB458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB458);
  }
  return result;
}

unint64_t sub_1D764A304()
{
  unint64_t result = qword_1EA82C840;
  if (!qword_1EA82C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C840);
  }
  return result;
}

uint64_t sub_1D764A350(uint64_t result)
{
  *(unsigned char *)(result + 121) = 5;
  return result;
}

unint64_t sub_1D764A35C()
{
  unint64_t result = qword_1EA82C848;
  if (!qword_1EA82C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C848);
  }
  return result;
}

unint64_t sub_1D764A3A8()
{
  unint64_t result = qword_1EA82C850;
  if (!qword_1EA82C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C850);
  }
  return result;
}

unint64_t sub_1D764A3F4()
{
  unint64_t result = qword_1EA82C858;
  if (!qword_1EA82C858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C858);
  }
  return result;
}

unint64_t sub_1D764A440()
{
  unint64_t result = qword_1EA82C860;
  if (!qword_1EA82C860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C860);
  }
  return result;
}

unint64_t sub_1D764A48C()
{
  unint64_t result = qword_1EA82C868;
  if (!qword_1EA82C868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C868);
  }
  return result;
}

unint64_t sub_1D764A4D8()
{
  unint64_t result = qword_1EA82C870;
  if (!qword_1EA82C870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C870);
  }
  return result;
}

unint64_t sub_1D764A524()
{
  unint64_t result = qword_1EA82C878;
  if (!qword_1EA82C878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C878);
  }
  return result;
}

unint64_t sub_1D764A570()
{
  unint64_t result = qword_1EA82C880;
  if (!qword_1EA82C880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C880);
  }
  return result;
}

unint64_t sub_1D764A5BC()
{
  unint64_t result = qword_1EBDEB4A0;
  if (!qword_1EBDEB4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4A0);
  }
  return result;
}

unint64_t sub_1D764A608()
{
  unint64_t result = qword_1EA82C888;
  if (!qword_1EA82C888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C888);
  }
  return result;
}

uint64_t sub_1D764A654(uint64_t a1)
{
  return a1;
}

unint64_t sub_1D764A6B8()
{
  unint64_t result = qword_1EA82C890;
  if (!qword_1EA82C890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C890);
  }
  return result;
}

unint64_t sub_1D764A704()
{
  unint64_t result = qword_1EBDEAEB8;
  if (!qword_1EBDEAEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEAEB8);
  }
  return result;
}

unint64_t sub_1D764A750()
{
  unint64_t result = qword_1EBDEB190;
  if (!qword_1EBDEB190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB190);
  }
  return result;
}

unint64_t sub_1D764A79C()
{
  unint64_t result = qword_1EBDEB030;
  if (!qword_1EBDEB030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB030);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.HandshakeCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.PeerInfoCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CreateListenerCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.RemoteUnlockCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.ErrorCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.ErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.SuccessCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.ErrorExtendedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.CodingKeys()
{
  return &type metadata for ControlChannelMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.EventCodingKeys()
{
  return &type metadata for ControlChannelMessage.EventCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.RequestCodingKeys()
{
  return &type metadata for ControlChannelMessage.RequestCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.ResponseCodingKeys()
{
  return &type metadata for ControlChannelMessage.ResponseCodingKeys;
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_66_1(-1);
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
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 2);
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
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_66_1(v8);
}

unsigned char *_s19RemotePairingDevice23ListenerStartedResponseV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_65_0((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_62_2((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D764AA00);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_63_1((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_64_0(result, a2 + 1);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.CodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.PlainCodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys;
}

void *sub_1D764AA58(uint64_t a1)
{
  return sub_1D75D1FE8(*(void **)a1, *(void *)(a1 + 8));
}

void *sub_1D764AA68(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  sub_1D75D480C(*(id *)a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return a1;
}

uint64_t sub_1D764AAC0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  sub_1D75D480C(*(id *)a2, v4);
  BOOL v7 = *(void **)a1;
  unint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  sub_1D75D1FE8(v7, v8);
  return a1;
}

uint64_t sub_1D764AB24(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  long long v5 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v5;
  sub_1D75D1FE8(v3, v4);
  return a1;
}

uint64_t sub_1D764AB64(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1D764AB84(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

uint64_t sub_1D764ABB0(uint64_t a1)
{
  if (((*(void *)(a1 + 8) >> 60) & 3) == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return (*(void *)(a1 + 8) >> 60) & 3;
  }
}

uint64_t sub_1D764ABCC(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

void *sub_1D764ABDC(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *unint64_t result = (a2 - 3);
    result[1] = 0x3000000000000000;
    result[2] = 0;
    result[3] = 0;
  }
  return result;
}

void type metadata accessor for ControlChannelMessage.Request()
{
}

void sub_1D764AC14(uint64_t a1)
{
}

uint64_t sub_1D764AC60(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  unint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  unint64_t v15 = *(void *)(a2 + 88);
  char v16 = *(unsigned char *)(a2 + 96);
  sub_1D75D4704(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(unsigned char *)(a1 + 96) = v16;
  return a1;
}

uint64_t sub_1D764AD30(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  unint64_t v24 = *(void *)(a2 + 72);
  uint64_t v25 = *(void *)(a2 + 80);
  unint64_t v26 = *(void *)(a2 + 88);
  char v27 = *(unsigned char *)(a2 + 96);
  sub_1D75D4704(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  uint64_t v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  unint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 80);
  unint64_t v22 = *(void *)(a1 + 88);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(void *)(a1 + 80) = v25;
  *(void *)(a1 + 88) = v26;
  *(unsigned char *)(a1 + 96) = v27;
  sub_1D75D3F24(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((unint64_t *)&v20 + 1), v21, v22);
  return a1;
}

uint64_t sub_1D764AE30(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 96);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 80);
  unint64_t v14 = *(void *)(a1 + 88);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  long long v17 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v17;
  *(unsigned char *)(a1 + 96) = v3;
  sub_1D75D3F24(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((unint64_t *)&v12 + 1), v13, v14);
  return a1;
}

uint64_t sub_1D764AEB0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 97))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 72) >> 1;
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

double sub_1D764AEF8(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 88) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(unsigned char *)(a1 + 96) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 97) = 1;
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
      double result = 0.0;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 64) = 0;
      *(void *)(a1 + 72) = 2 * -a2;
      *(void *)(a1 + 80) = 0;
      *(void *)(a1 + 88) = 0;
      *(unsigned char *)(a1 + 96) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1D764AF6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72) >> 62;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_1D764AF88(uint64_t result)
{
  *(void *)(result + 72) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1D764AF98(uint64_t result, uint64_t a2)
{
  if (a2 < 3)
  {
    *(void *)(result + 72) = *(void *)(result + 72) & 1 | (a2 << 62);
  }
  else
  {
    *(void *)double result = (a2 - 3);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    *(void *)(result + 72) = 0xC000000000000000;
    *(unsigned char *)(result + 96) = 0;
  }
  return result;
}

void type metadata accessor for ControlChannelMessage.Event()
{
}

uint64_t sub_1D764AFEC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v3 = *(void *)(a1 + 112);
    if (v3 >> 60 != 15)
    {
      uint64_t v4 = *(void *)(a1 + 104);
      return sub_1D75933F0(v4, v3);
    }
  }
  return result;
}

uint64_t sub_1D764B074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  unint64_t v5 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v6 = *(void *)(a2 + 48);
  id v7 = v4;
  id v8 = v5;
  if (v6)
  {
    uint64_t v9 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v10;
    uint64_t v11 = *(void *)(a2 + 80);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v11;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
    long long v12 = (uint64_t *)(a2 + 104);
    unint64_t v13 = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v12;
    }
    else
    {
      uint64_t v14 = *v12;
      sub_1D75934F4(*v12, v13);
      *(void *)(a1 + 104) = v14;
      *(void *)(a1 + 112) = v13;
    }
    *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  }
  else
  {
    memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  }
  return a1;
}

uint64_t sub_1D764B17C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v10 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v10)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void *)(a2 + 88);
      *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
      *(void *)(a1 + 88) = v11;
      long long v12 = (uint64_t *)(a2 + 104);
      unint64_t v13 = *(void *)(a2 + 112);
      if (*(void *)(a1 + 112) >> 60 == 15)
      {
        if (v13 >> 60 != 15)
        {
          uint64_t v14 = *v12;
LABEL_15:
          sub_1D75934F4(v14, v13);
          *(void *)(a1 + 104) = v14;
          *(void *)(a1 + 112) = v13;
          goto LABEL_17;
        }
      }
      else
      {
        if (v13 >> 60 != 15)
        {
          uint64_t v17 = *v12;
          sub_1D75934F4(*v12, *(void *)(a2 + 112));
          uint64_t v18 = *(void *)(a1 + 104);
          unint64_t v19 = *(void *)(a1 + 112);
          *(void *)(a1 + 104) = v17;
          *(void *)(a1 + 112) = v13;
          sub_1D75933F0(v18, v19);
          goto LABEL_17;
        }
        sub_1D76479EC(a1 + 104);
      }
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v12;
      goto LABEL_17;
    }
    sub_1D764B3F0(a1 + 24);
  }
  else if (v10)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    uint64_t v15 = *(void *)(a2 + 88);
    *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
    *(void *)(a1 + 88) = v15;
    long long v16 = (uint64_t *)(a2 + 104);
    unint64_t v13 = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 >> 60 != 15)
    {
      uint64_t v14 = *v16;
      goto LABEL_15;
    }
    *(_OWORD *)(a1 + 104) = *(_OWORD *)v16;
LABEL_17:
    *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
    return a1;
  }
  memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  return a1;
}

uint64_t sub_1D764B3F0(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy121_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x79uLL);
}

uint64_t sub_1D764B428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  unint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(_WORD *)(a1 + 19) = *(_WORD *)(a2 + 19);
  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a2 + 48);
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v7;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v6;
      swift_bridgeObjectRelease();
      uint64_t v8 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v8;
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(a2 + 80);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(void *)(a1 + 80) = v9;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
      uint64_t v10 = (void *)(a2 + 104);
      unint64_t v11 = *(void *)(a1 + 112);
      if (v11 >> 60 != 15)
      {
        unint64_t v12 = *(void *)(a2 + 112);
        if (v12 >> 60 != 15)
        {
          uint64_t v13 = *(void *)(a1 + 104);
          *(void *)(a1 + 104) = *v10;
          *(void *)(a1 + 112) = v12;
          sub_1D75933F0(v13, v11);
          goto LABEL_10;
        }
        sub_1D76479EC(a1 + 104);
      }
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v10;
LABEL_10:
      *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
      return a1;
    }
    sub_1D764B3F0(a1 + 24);
  }
  memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  return a1;
}

uint64_t sub_1D764B578(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 121))
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

uint64_t sub_1D764B5B8(uint64_t result, int a2, int a3)
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
    *(unsigned char *)(result + 120) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 121) = 1;
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
    *(unsigned char *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for HandshakeResponse()
{
}

unint64_t sub_1D764B628()
{
  unint64_t result = qword_1EA82C898;
  if (!qword_1EA82C898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C898);
  }
  return result;
}

unint64_t sub_1D764B678()
{
  unint64_t result = qword_1EA82C8A0;
  if (!qword_1EA82C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8A0);
  }
  return result;
}

unint64_t sub_1D764B6C8()
{
  unint64_t result = qword_1EA82C8A8;
  if (!qword_1EA82C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8A8);
  }
  return result;
}

unint64_t sub_1D764B718()
{
  unint64_t result = qword_1EA82C8B0;
  if (!qword_1EA82C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8B0);
  }
  return result;
}

unint64_t sub_1D764B768()
{
  unint64_t result = qword_1EA82C8B8;
  if (!qword_1EA82C8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8B8);
  }
  return result;
}

unint64_t sub_1D764B7B8()
{
  unint64_t result = qword_1EA82C8C0;
  if (!qword_1EA82C8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8C0);
  }
  return result;
}

unint64_t sub_1D764B808()
{
  unint64_t result = qword_1EA82C8C8;
  if (!qword_1EA82C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8C8);
  }
  return result;
}

unint64_t sub_1D764B858()
{
  unint64_t result = qword_1EA82C8D0;
  if (!qword_1EA82C8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8D0);
  }
  return result;
}

unint64_t sub_1D764B8A8()
{
  unint64_t result = qword_1EA82C8D8;
  if (!qword_1EA82C8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8D8);
  }
  return result;
}

unint64_t sub_1D764B8F8()
{
  unint64_t result = qword_1EA82C8E0;
  if (!qword_1EA82C8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8E0);
  }
  return result;
}

unint64_t sub_1D764B948()
{
  unint64_t result = qword_1EA82C8E8;
  if (!qword_1EA82C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8E8);
  }
  return result;
}

unint64_t sub_1D764B998()
{
  unint64_t result = qword_1EA82C8F0;
  if (!qword_1EA82C8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8F0);
  }
  return result;
}

unint64_t sub_1D764B9E8()
{
  unint64_t result = qword_1EA82C8F8;
  if (!qword_1EA82C8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C8F8);
  }
  return result;
}

unint64_t sub_1D764BA38()
{
  unint64_t result = qword_1EA82C900;
  if (!qword_1EA82C900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C900);
  }
  return result;
}

unint64_t sub_1D764BA88()
{
  unint64_t result = qword_1EBDEB4B0;
  if (!qword_1EBDEB4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4B0);
  }
  return result;
}

unint64_t sub_1D764BAD8()
{
  unint64_t result = qword_1EBDEB4A8;
  if (!qword_1EBDEB4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4A8);
  }
  return result;
}

unint64_t sub_1D764BB28()
{
  unint64_t result = qword_1EBDEB498;
  if (!qword_1EBDEB498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB498);
  }
  return result;
}

unint64_t sub_1D764BB78()
{
  unint64_t result = qword_1EBDEB490;
  if (!qword_1EBDEB490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB490);
  }
  return result;
}

unint64_t sub_1D764BBC8()
{
  unint64_t result = qword_1EBDEB4D0;
  if (!qword_1EBDEB4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4D0);
  }
  return result;
}

unint64_t sub_1D764BC18()
{
  unint64_t result = qword_1EBDEB4C8;
  if (!qword_1EBDEB4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4C8);
  }
  return result;
}

unint64_t sub_1D764BC68()
{
  unint64_t result = qword_1EBDEB440;
  if (!qword_1EBDEB440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB440);
  }
  return result;
}

unint64_t sub_1D764BCB8()
{
  unint64_t result = qword_1EBDEB438;
  if (!qword_1EBDEB438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB438);
  }
  return result;
}

unint64_t sub_1D764BD08()
{
  unint64_t result = qword_1EBDEB450;
  if (!qword_1EBDEB450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB450);
  }
  return result;
}

unint64_t sub_1D764BD58()
{
  unint64_t result = qword_1EBDEB448;
  if (!qword_1EBDEB448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB448);
  }
  return result;
}

unint64_t sub_1D764BDA8()
{
  unint64_t result = qword_1EBDEB478;
  if (!qword_1EBDEB478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB478);
  }
  return result;
}

unint64_t sub_1D764BDF8()
{
  unint64_t result = qword_1EBDEB470;
  if (!qword_1EBDEB470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB470);
  }
  return result;
}

unint64_t sub_1D764BE48()
{
  unint64_t result = qword_1EBDEB488;
  if (!qword_1EBDEB488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB488);
  }
  return result;
}

unint64_t sub_1D764BE98()
{
  unint64_t result = qword_1EBDEB480;
  if (!qword_1EBDEB480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB480);
  }
  return result;
}

unint64_t sub_1D764BEE8()
{
  unint64_t result = qword_1EBDEB4C0;
  if (!qword_1EBDEB4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4C0);
  }
  return result;
}

unint64_t sub_1D764BF38()
{
  unint64_t result = qword_1EBDEB4B8;
  if (!qword_1EBDEB4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB4B8);
  }
  return result;
}

unint64_t sub_1D764BF88()
{
  unint64_t result = qword_1EBDEB468;
  if (!qword_1EBDEB468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB468);
  }
  return result;
}

unint64_t sub_1D764BFD8()
{
  unint64_t result = qword_1EBDEB460;
  if (!qword_1EBDEB460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB460);
  }
  return result;
}

unint64_t sub_1D764C028()
{
  unint64_t result = qword_1EBDEB2D8;
  if (!qword_1EBDEB2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2D8);
  }
  return result;
}

unint64_t sub_1D764C078()
{
  unint64_t result = qword_1EBDEB2D0;
  if (!qword_1EBDEB2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2D0);
  }
  return result;
}

unint64_t sub_1D764C0C8()
{
  unint64_t result = qword_1EBDEB2F0;
  if (!qword_1EBDEB2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2F0);
  }
  return result;
}

unint64_t sub_1D764C118()
{
  unint64_t result = qword_1EBDEB2E8;
  if (!qword_1EBDEB2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2E8);
  }
  return result;
}

unint64_t sub_1D764C168()
{
  unint64_t result = qword_1EBDEB308;
  if (!qword_1EBDEB308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB308);
  }
  return result;
}

unint64_t sub_1D764C1B8()
{
  unint64_t result = qword_1EBDEB300;
  if (!qword_1EBDEB300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB300);
  }
  return result;
}

unint64_t sub_1D764C208()
{
  unint64_t result = qword_1EBDEB2C0;
  if (!qword_1EBDEB2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2C0);
  }
  return result;
}

unint64_t sub_1D764C258()
{
  unint64_t result = qword_1EBDEB2B8;
  if (!qword_1EBDEB2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB2B8);
  }
  return result;
}

unint64_t sub_1D764C2A8()
{
  unint64_t result = qword_1EBDEBC00;
  if (!qword_1EBDEBC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBC00);
  }
  return result;
}

unint64_t sub_1D764C2F8()
{
  unint64_t result = qword_1EBDEBBF8;
  if (!qword_1EBDEBBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBF8);
  }
  return result;
}

unint64_t sub_1D764C348()
{
  unint64_t result = qword_1EBDEBBF0;
  if (!qword_1EBDEBBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBF0);
  }
  return result;
}

unint64_t sub_1D764C398()
{
  unint64_t result = qword_1EBDEBBE8;
  if (!qword_1EBDEBBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBE8);
  }
  return result;
}

unint64_t sub_1D764C3E8()
{
  unint64_t result = qword_1EBDEBBD8;
  if (!qword_1EBDEBBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBD8);
  }
  return result;
}

unint64_t sub_1D764C438()
{
  unint64_t result = qword_1EBDEBBD0;
  if (!qword_1EBDEBBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEBBD0);
  }
  return result;
}

unint64_t sub_1D764C484()
{
  unint64_t result = qword_1EBDEB3D0;
  if (!qword_1EBDEB3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3D0);
  }
  return result;
}

unint64_t sub_1D764C4D0()
{
  unint64_t result = qword_1EA82C908;
  if (!qword_1EA82C908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C908);
  }
  return result;
}

unint64_t sub_1D764C51C()
{
  unint64_t result = qword_1EA82C910;
  if (!qword_1EA82C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C910);
  }
  return result;
}

unint64_t sub_1D764C568()
{
  unint64_t result = qword_1EA82C918;
  if (!qword_1EA82C918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C918);
  }
  return result;
}

unint64_t sub_1D764C5B4()
{
  unint64_t result = qword_1EA82C920;
  if (!qword_1EA82C920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C920);
  }
  return result;
}

unint64_t sub_1D764C600()
{
  unint64_t result = qword_1EA82C928;
  if (!qword_1EA82C928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C928);
  }
  return result;
}

unint64_t sub_1D764C64C()
{
  unint64_t result = qword_1EA82C940;
  if (!qword_1EA82C940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C940);
  }
  return result;
}

unint64_t sub_1D764C698()
{
  unint64_t result = qword_1EA82C948;
  if (!qword_1EA82C948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C948);
  }
  return result;
}

unint64_t sub_1D764C6E4()
{
  unint64_t result = qword_1EBDEB3F8;
  if (!qword_1EBDEB3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3F8);
  }
  return result;
}

unint64_t sub_1D764C730()
{
  unint64_t result = qword_1EBDEB170;
  if (!qword_1EBDEB170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB170);
  }
  return result;
}

unint64_t sub_1D764C77C()
{
  unint64_t result = qword_1EBDEB348;
  if (!qword_1EBDEB348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB348);
  }
  return result;
}

unint64_t sub_1D764C7C8()
{
  unint64_t result = qword_1EA82C950;
  if (!qword_1EA82C950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C950);
  }
  return result;
}

unint64_t sub_1D764C814()
{
  unint64_t result = qword_1EA82C958;
  if (!qword_1EA82C958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C958);
  }
  return result;
}

unint64_t sub_1D764C860()
{
  unint64_t result = qword_1EA82C960;
  if (!qword_1EA82C960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C960);
  }
  return result;
}

unint64_t sub_1D764C8AC()
{
  unint64_t result = qword_1EA82C968;
  if (!qword_1EA82C968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C968);
  }
  return result;
}

unint64_t sub_1D764C8F8()
{
  unint64_t result = qword_1EA82C970;
  if (!qword_1EA82C970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C970);
  }
  return result;
}

unint64_t sub_1D764C944()
{
  unint64_t result = qword_1EBDEC3C8[0];
  if (!qword_1EBDEC3C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBDEC3C8);
  }
  return result;
}

unint64_t sub_1D764C990()
{
  unint64_t result = qword_1EA82C978;
  if (!qword_1EA82C978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C978);
  }
  return result;
}

unint64_t sub_1D764C9DC()
{
  unint64_t result = qword_1EBDEB310;
  if (!qword_1EBDEB310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB310);
  }
  return result;
}

unint64_t sub_1D764CA28()
{
  unint64_t result = qword_1EBDEB048;
  if (!qword_1EBDEB048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB048);
  }
  return result;
}

unint64_t sub_1D764CA74()
{
  unint64_t result = qword_1EA82C9B8;
  if (!qword_1EA82C9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9B8);
  }
  return result;
}

unint64_t sub_1D764CAC0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_171(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA82C930);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1D764CB2C()
{
  unint64_t result = qword_1EA82C9C8;
  if (!qword_1EA82C9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9C8);
  }
  return result;
}

unint64_t sub_1D764CB78()
{
  unint64_t result = qword_1EA82C9D0;
  if (!qword_1EA82C9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9D0);
  }
  return result;
}

unint64_t sub_1D764CBC4()
{
  unint64_t result = qword_1EBDEB040;
  if (!qword_1EBDEB040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB040);
  }
  return result;
}

unint64_t sub_1D764CC10()
{
  unint64_t result = qword_1EBDEB178;
  if (!qword_1EBDEB178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB178);
  }
  return result;
}

unint64_t sub_1D764CC5C()
{
  unint64_t result = qword_1EA82C9E0;
  if (!qword_1EA82C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9E0);
  }
  return result;
}

unint64_t sub_1D764CCA8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_171(a1);
  if (!result)
  {
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1D764CCE8()
{
  unint64_t result = qword_1EBDEB530;
  if (!qword_1EBDEB530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB530);
  }
  return result;
}

uint64_t _s19RemotePairingDevice11PairingDataV4KindOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_66_1(-1);
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 4);
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
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_66_1(v8);
}

unsigned char *_s19RemotePairingDevice11PairingDataV4KindOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_65_0((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_62_2((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D764CE74);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_63_1((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_64_0(result, a2 + 3);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeResponse.CodingKeys()
{
  return &type metadata for HandshakeResponse.CodingKeys;
}

uint64_t _s19RemotePairingDevice21ControlChannelMessageO8ResponseO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_66_1(-1);
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
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
    if (v4) {
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 8);
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
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 8);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 8);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_66_1(v8);
}

unsigned char *_s19RemotePairingDevice21ControlChannelMessageO8ResponseO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_65_0((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_62_2((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D764CFECLL);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_63_1((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_64_0(result, a2 + 7);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingDataCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingRejectedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairVerifyFailedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PingCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PingCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.UnpairCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.UnpairCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ControlChannelMessage.Request.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1D764D170);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.HandshakeCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.PeerInfoCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CreateListenerCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CancelPairSetupCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys;
}

unsigned char *_s19RemotePairingDevice22StreamEncryptedMessageV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D764D294);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.RemoteUnlockCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys;
}

uint64_t sub_1D764D2CC(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D764D308(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1D764D350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1D764D3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1D764D40C(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
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

uint64_t sub_1D764D44C(uint64_t result, int a2, int a3)
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for HandshakeRequest()
{
}

unint64_t sub_1D764D49C()
{
  unint64_t result = qword_1EA82C9E8;
  if (!qword_1EA82C9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9E8);
  }
  return result;
}

unint64_t sub_1D764D4EC()
{
  unint64_t result = qword_1EA82C9F0;
  if (!qword_1EA82C9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9F0);
  }
  return result;
}

unint64_t sub_1D764D53C()
{
  unint64_t result = qword_1EA82C9F8;
  if (!qword_1EA82C9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82C9F8);
  }
  return result;
}

unint64_t sub_1D764D58C()
{
  unint64_t result = qword_1EA82CA00;
  if (!qword_1EA82CA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA00);
  }
  return result;
}

unint64_t sub_1D764D5DC()
{
  unint64_t result = qword_1EA82CA08;
  if (!qword_1EA82CA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA08);
  }
  return result;
}

unint64_t sub_1D764D62C()
{
  unint64_t result = qword_1EA82CA10;
  if (!qword_1EA82CA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA10);
  }
  return result;
}

unint64_t sub_1D764D67C()
{
  unint64_t result = qword_1EA82CA18;
  if (!qword_1EA82CA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA18);
  }
  return result;
}

unint64_t sub_1D764D6CC()
{
  unint64_t result = qword_1EA82CA20;
  if (!qword_1EA82CA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA20);
  }
  return result;
}

unint64_t sub_1D764D71C()
{
  unint64_t result = qword_1EA82CA28;
  if (!qword_1EA82CA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA28);
  }
  return result;
}

unint64_t sub_1D764D76C()
{
  unint64_t result = qword_1EBDEB188;
  if (!qword_1EBDEB188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB188);
  }
  return result;
}

unint64_t sub_1D764D7BC()
{
  unint64_t result = qword_1EBDEB180;
  if (!qword_1EBDEB180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB180);
  }
  return result;
}

unint64_t sub_1D764D80C()
{
  unint64_t result = qword_1EBDEB320;
  if (!qword_1EBDEB320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB320);
  }
  return result;
}

unint64_t sub_1D764D85C()
{
  unint64_t result = qword_1EBDEB318;
  if (!qword_1EBDEB318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB318);
  }
  return result;
}

unint64_t sub_1D764D8AC()
{
  unint64_t result = qword_1EBDEB330;
  if (!qword_1EBDEB330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB330);
  }
  return result;
}

unint64_t sub_1D764D8FC()
{
  unint64_t result = qword_1EBDEB328;
  if (!qword_1EBDEB328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB328);
  }
  return result;
}

unint64_t sub_1D764D94C()
{
  unint64_t result = qword_1EBDEB388;
  if (!qword_1EBDEB388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB388);
  }
  return result;
}

unint64_t sub_1D764D99C()
{
  unint64_t result = qword_1EBDEB380;
  if (!qword_1EBDEB380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB380);
  }
  return result;
}

unint64_t sub_1D764D9EC()
{
  unint64_t result = qword_1EBDEB368;
  if (!qword_1EBDEB368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB368);
  }
  return result;
}

unint64_t sub_1D764DA3C()
{
  unint64_t result = qword_1EBDEB360;
  if (!qword_1EBDEB360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB360);
  }
  return result;
}

unint64_t sub_1D764DA8C()
{
  unint64_t result = qword_1EBDEB398;
  if (!qword_1EBDEB398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB398);
  }
  return result;
}

unint64_t sub_1D764DADC()
{
  unint64_t result = qword_1EBDEB390;
  if (!qword_1EBDEB390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB390);
  }
  return result;
}

unint64_t sub_1D764DB2C()
{
  unint64_t result = qword_1EBDEB340;
  if (!qword_1EBDEB340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB340);
  }
  return result;
}

unint64_t sub_1D764DB7C()
{
  unint64_t result = qword_1EBDEB338;
  if (!qword_1EBDEB338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB338);
  }
  return result;
}

unint64_t sub_1D764DBCC()
{
  unint64_t result = qword_1EBDEB378;
  if (!qword_1EBDEB378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB378);
  }
  return result;
}

unint64_t sub_1D764DC1C()
{
  unint64_t result = qword_1EBDEB370;
  if (!qword_1EBDEB370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB370);
  }
  return result;
}

unint64_t sub_1D764DC6C()
{
  unint64_t result = qword_1EBDEC178;
  if (!qword_1EBDEC178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEC178);
  }
  return result;
}

unint64_t sub_1D764DCBC()
{
  unint64_t result = qword_1EBDEC170;
  if (!qword_1EBDEC170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEC170);
  }
  return result;
}

unint64_t sub_1D764DD0C()
{
  unint64_t result = qword_1EBDEB358;
  if (!qword_1EBDEB358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB358);
  }
  return result;
}

unint64_t sub_1D764DD5C()
{
  unint64_t result = qword_1EBDEB350;
  if (!qword_1EBDEB350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB350);
  }
  return result;
}

unint64_t sub_1D764DDAC()
{
  unint64_t result = qword_1EBDEB408;
  if (!qword_1EBDEB408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB408);
  }
  return result;
}

unint64_t sub_1D764DDFC()
{
  unint64_t result = qword_1EBDEB400;
  if (!qword_1EBDEB400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB400);
  }
  return result;
}

unint64_t sub_1D764DE4C()
{
  unint64_t result = qword_1EBDEB3F0;
  if (!qword_1EBDEB3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3F0);
  }
  return result;
}

unint64_t sub_1D764DE9C()
{
  unint64_t result = qword_1EBDEB3E8;
  if (!qword_1EBDEB3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3E8);
  }
  return result;
}

unint64_t sub_1D764DEEC()
{
  unint64_t result = qword_1EBDEB418;
  if (!qword_1EBDEB418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB418);
  }
  return result;
}

unint64_t sub_1D764DF3C()
{
  unint64_t result = qword_1EBDEB410;
  if (!qword_1EBDEB410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB410);
  }
  return result;
}

unint64_t sub_1D764DF8C()
{
  unint64_t result = qword_1EBDEB428;
  if (!qword_1EBDEB428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB428);
  }
  return result;
}

unint64_t sub_1D764DFDC()
{
  unint64_t result = qword_1EBDEB420;
  if (!qword_1EBDEB420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB420);
  }
  return result;
}

unint64_t sub_1D764E02C()
{
  unint64_t result = qword_1EBDEB3B8;
  if (!qword_1EBDEB3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3B8);
  }
  return result;
}

unint64_t sub_1D764E07C()
{
  unint64_t result = qword_1EBDEB3B0;
  if (!qword_1EBDEB3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3B0);
  }
  return result;
}

unint64_t sub_1D764E0CC()
{
  unint64_t result = qword_1EBDEB3C8;
  if (!qword_1EBDEB3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3C8);
  }
  return result;
}

unint64_t sub_1D764E11C()
{
  unint64_t result = qword_1EBDEB3C0;
  if (!qword_1EBDEB3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3C0);
  }
  return result;
}

unint64_t sub_1D764E16C()
{
  unint64_t result = qword_1EBDEB3E0;
  if (!qword_1EBDEB3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3E0);
  }
  return result;
}

unint64_t sub_1D764E1BC()
{
  unint64_t result = qword_1EBDEB3D8;
  if (!qword_1EBDEB3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB3D8);
  }
  return result;
}

unint64_t sub_1D764E208()
{
  unint64_t result = qword_1EBDEB158;
  if (!qword_1EBDEB158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB158);
  }
  return result;
}

unint64_t sub_1D764E254()
{
  unint64_t result = qword_1EBDEB550;
  if (!qword_1EBDEB550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB550);
  }
  return result;
}

unint64_t sub_1D764E2A0()
{
  unint64_t result = qword_1EA82CA38;
  if (!qword_1EA82CA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA38);
  }
  return result;
}

uint64_t _s19RemotePairingDevice29ControlChannelMessageEnvelopeV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_66_1(-1);
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
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 3);
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
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_66_1((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_66_1(v8);
}

unsigned char *_s19RemotePairingDevice29ControlChannelMessageEnvelopeV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_65_0((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_62_2((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1D764E42CLL);
      case 4:
        unint64_t result = (unsigned char *)OUTLINED_FUNCTION_63_1((uint64_t)result, v6);
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
          unint64_t result = OUTLINED_FUNCTION_64_0(result, a2 + 2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandshakeRequest.CodingKeys()
{
  return &type metadata for HandshakeRequest.CodingKeys;
}

unint64_t sub_1D764E468()
{
  unint64_t result = qword_1EA82CA48;
  if (!qword_1EA82CA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA48);
  }
  return result;
}

unint64_t sub_1D764E4B8()
{
  unint64_t result = qword_1EBDEB168;
  if (!qword_1EBDEB168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB168);
  }
  return result;
}

unint64_t sub_1D764E508()
{
  unint64_t result = qword_1EBDEB160;
  if (!qword_1EBDEB160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEB160);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_26_8()
{
  return v0;
}

void OUTLINED_FUNCTION_27_10()
{
  *(unsigned char *)(v0 - 65) = 1;
}

uint64_t OUTLINED_FUNCTION_30_8()
{
  return v0;
}

void OUTLINED_FUNCTION_31_7(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_33_7()
{
  *(unsigned char *)(v0 - 65) = 2;
}

uint64_t OUTLINED_FUNCTION_35_5()
{
  return sub_1D76612D0();
}

uint64_t OUTLINED_FUNCTION_37_4()
{
  return sub_1D76613F0();
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_40_4()
{
  return sub_1D7661340();
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_4()
{
  return sub_1D76613F0();
}

uint64_t OUTLINED_FUNCTION_48_4()
{
  return sub_1D76612D0();
}

void OUTLINED_FUNCTION_51_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 48) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_52_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void *OUTLINED_FUNCTION_53_3(void *a1)
{
  return __swift_project_boxed_opaque_existential_0Tm(a1, v1);
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return sub_1D7661380();
}

uint64_t OUTLINED_FUNCTION_59_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_60_1()
{
  return sub_1D76613F0();
}

uint64_t OUTLINED_FUNCTION_61_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62_2@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_63_1@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *OUTLINED_FUNCTION_64_0@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *unint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_66_1@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return sub_1D7661380();
}

uint64_t OUTLINED_FUNCTION_74_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_1D75933F0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_76_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_79_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_82_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_84_1()
{
  return sub_1D7661450();
}

uint64_t OUTLINED_FUNCTION_86_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_90_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_91_1()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_93_1()
{
  return sub_1D7661380();
}

uint64_t OUTLINED_FUNCTION_94_1()
{
  sub_1D75D20E0(v0 + 392, v0 + 256);
  return sub_1D75D4A78(v0 + 256);
}

uint64_t OUTLINED_FUNCTION_96_1()
{
  return v0 + 24;
}

uint64_t OUTLINED_FUNCTION_97_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_98_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_99_1()
{
  return sub_1D76617C0();
}

uint64_t OUTLINED_FUNCTION_101_1()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_103_1()
{
  return sub_1D7661380();
}

uint64_t OUTLINED_FUNCTION_104_1()
{
  return sub_1D7661430();
}

uint64_t OUTLINED_FUNCTION_105_1@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v3 - 120) = a1;
  return sub_1D75934F4(v2, v1);
}

void *sub_1D764EA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for RemoteUnlockKeypair();
  int v8 = (void *)swift_allocObject();
  sub_1D764F300();
  OUTLINED_FUNCTION_21_1();
  uint64_t v9 = v8[2];
  unint64_t v10 = v8[3];
  v8[2] = a1;
  v8[3] = a2;
  swift_retain();
  sub_1D75941DC(v9, v10);
  OUTLINED_FUNCTION_21_1();
  uint64_t v11 = v8[4];
  unint64_t v12 = v8[5];
  v8[4] = a3;
  v8[5] = a4;
  sub_1D75941DC(v11, v12);
  swift_release();
  return v8;
}

uint64_t sub_1D764EB48()
{
  uint64_t v0 = (void *)swift_slowAlloc();
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC58], 0x20uLL, v0))
  {
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_15();
    OUTLINED_FUNCTION_14_11();
    uint64_t v1 = OUTLINED_FUNCTION_3_7();
    OUTLINED_FUNCTION_3_19(v1, v2, v3, v4, v5, v6, v7, v8, v30, v31);
    sub_1D76616A0();
    swift_willThrow();
  }
  else
  {
    MEMORY[0x1D94725A0](v0, 32);
    uint64_t v9 = (void *)sub_1D765FEB0();
    int Escrow = MKBKeyBagCreateEscrow();

    if (Escrow || MKBKeyBagCopyData())
    {
      sub_1D75AF4C0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_1_16();
      OUTLINED_FUNCTION_14_11();
      uint64_t v11 = OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_3_19(v11, v12, v13, v14, v15, v16, v17, v18, v30, v31);
      sub_1D76616A0();
      swift_willThrow();
    }
    else
    {
      sub_1D75AF4C0();
      OUTLINED_FUNCTION_0();
      sub_1D7661690();
      OUTLINED_FUNCTION_14_11();
      uint64_t v22 = OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_3_19(v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      sub_1D76616A0();
      swift_willThrow();
      MEMORY[0x1D9474C60](v0, -1, -1);
    }
    uint64_t v19 = OUTLINED_FUNCTION_178();
    sub_1D75933F0(v19, v20);
  }
  return OUTLINED_FUNCTION_178();
}

void sub_1D764EE0C()
{
  uint64_t v0 = (void *)sub_1D765FEB0();
  MKBKeyBagCreateWithData();

  sub_1D75AF4C0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_14();
  sub_1D75B0D60();
  uint64_t v1 = OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_18(v1, v2, v3, v4, v5, v6, v7, v8, v9);
  sub_1D76616A0();
  swift_willThrow();
}

uint64_t sub_1D764EF6C()
{
  uint64_t result = sub_1D764EB48();
  if (v0) {
    return v2;
  }
  return result;
}

void sub_1D764EF98()
{
}

uint64_t sub_1D764EFB0()
{
  sub_1D75AF4C0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_15();
  uint64_t v0 = MEMORY[0x1E4FBC860];
  sub_1D75B0C34(MEMORY[0x1E4FBC860]);
  sub_1D75B0C34(v0);
  sub_1D75B0D60();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_7_15();
  return swift_willThrow();
}

uint64_t sub_1D764F044()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1D764F054()
{
  return sub_1D764EFB0();
}

uint64_t sub_1D764F06C()
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_1D75AC3B4(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t sub_1D764F0B4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_21_1();
  uint64_t v5 = *(void *)(v2 + 16);
  unint64_t v6 = *(void *)(v2 + 24);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_1D75941DC(v5, v6);
}

uint64_t sub_1D764F100(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  sub_1D75AC3B4(*a1, v6);
  return a5(v7, v6);
}

uint64_t sub_1D764F14C()
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v1 = *(void *)(v0 + 32);
  sub_1D75AC3B4(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t sub_1D764F194(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_21_1();
  uint64_t v5 = *(void *)(v2 + 32);
  unint64_t v6 = *(void *)(v2 + 40);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return sub_1D75941DC(v5, v6);
}

uint64_t sub_1D764F1E0(uint64_t a1)
{
  sub_1D758B1EC(a1, (uint64_t)v2);
  return sub_1D764F260(v2);
}

uint64_t sub_1D764F21C@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_4_3();
  return sub_1D758B1EC(v1 + 48, a1);
}

uint64_t sub_1D764F260(long long *a1)
{
  uint64_t v3 = v1 + 48;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0Tm(v3);
  sub_1D758AB78(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1D764F2BC())()
{
  return j__swift_endAccess;
}

void *sub_1D764F300()
{
  *((_OWORD *)v0 + 1) = xmmword_1D76655F0;
  *((_OWORD *)v0 + 2) = xmmword_1D76655F0;
  OUTLINED_FUNCTION_21_1();
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  *((_OWORD *)v0 + 1) = xmmword_1D76655F0;
  sub_1D75941DC(v1, v2);
  OUTLINED_FUNCTION_21_1();
  uint64_t v3 = v0[4];
  unint64_t v4 = v0[5];
  *((_OWORD *)v0 + 2) = xmmword_1D76655F0;
  sub_1D75941DC(v3, v4);
  uint64_t v5 = type metadata accessor for MobileKeybagProvider();
  uint64_t v6 = swift_allocObject();
  v0[9] = v5;
  v0[10] = &off_1F2EE7E70;
  v0[6] = v6;
  return v0;
}

uint64_t sub_1D764F3B0()
{
  uint64_t v1 = (uint64_t *)(v0 + 16);
  OUTLINED_FUNCTION_4_3();
  unint64_t v2 = *(void *)(v0 + 24);
  if (v2 >> 60 == 15) {
    return sub_1D764F0B4(0, 0xF000000000000000);
  }
  uint64_t v3 = *v1;
  uint64_t v6 = *v1;
  sub_1D75934F4(*v1, v2);
  sub_1D75934F4(v3, v2);
  uint64_t v4 = sub_1D765FF00();
  uint64_t result = sub_1D75941DC(v3, v2);
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_1D765FE30();
    sub_1D75933F0(v6, v2);
    return sub_1D764F0B4(0, 0xF000000000000000);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D764F46C()
{
  OUTLINED_FUNCTION_12_10();
  sub_1D758B1EC(v0, (uint64_t)v13);
  uint64_t v2 = v14;
  uint64_t v3 = v15;
  __swift_project_boxed_opaque_existential_0Tm(v13, v14);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  }
  uint64_t v9 = v4;
  unint64_t v10 = v5;
  uint64_t v11 = v6;
  unint64_t v12 = v7;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  sub_1D75934F4(v9, v10);
  sub_1D75934F4(v11, v12);
  sub_1D75933F0(v11, v12);
  sub_1D764F0B4(v9, v10);
  sub_1D75934F4(v9, v10);
  sub_1D75934F4(v11, v12);
  sub_1D75933F0(v9, v10);
  sub_1D764F194(v11, v12);
  sub_1D75933F0(v9, v10);
  return sub_1D75933F0(v11, v12);
}

uint64_t sub_1D764F5A0()
{
  swift_beginAccess();
  unint64_t v1 = v0[3];
  if (v1 >> 60 == 15)
  {
    sub_1D75AF4C0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_15();
    v20[5] = v20[0];
    v20[6] = v20[1];
    sub_1D75B0D60();
    OUTLINED_FUNCTION_3_7();
    OUTLINED_FUNCTION_0();
    sub_1D76616A0();
    return swift_willThrow();
  }
  else
  {
    uint64_t v3 = v0[2];
    swift_beginAccess();
    unint64_t v4 = v0[5];
    if (v4 >> 60 == 15)
    {
      sub_1D75934F4(v3, v1);
      sub_1D75AF4C0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_1_16();
      sub_1D75B0D60();
      uint64_t v5 = OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_0_18(v5, v6, v7, v8, v9, v10, v11, v12, v20[0]);
      sub_1D76616A0();
      swift_willThrow();
      return sub_1D75941DC(v3, v1);
    }
    else
    {
      uint64_t v13 = v0[4];
      OUTLINED_FUNCTION_12_10();
      sub_1D758B1EC((uint64_t)v0, (uint64_t)v20);
      uint64_t v14 = v20[4];
      __swift_project_boxed_opaque_existential_0Tm(v20, v20[3]);
      uint64_t v21 = *(void (**)(uint64_t))(v14 + 16);
      uint64_t v15 = OUTLINED_FUNCTION_178();
      sub_1D75AC3B4(v15, v16);
      sub_1D75AC3B4(v13, v4);
      uint64_t v17 = OUTLINED_FUNCTION_178();
      v21(v17);
      sub_1D75941DC(v13, v4);
      uint64_t v18 = OUTLINED_FUNCTION_178();
      sub_1D75941DC(v18, v19);
      return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v20);
    }
  }
}

uint64_t sub_1D764F7AC(uint64_t a1)
{
  sub_1D758B1EC(a1, (uint64_t)v3);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0Tm(v1 + 48);
  sub_1D758AB78(v3, v1 + 48);
  return swift_endAccess();
}

uint64_t RemoteUnlockKeypair.deinit()
{
  sub_1D75941DC(*(void *)(v0 + 16), *(void *)(v0 + 24));
  sub_1D75941DC(*(void *)(v0 + 32), *(void *)(v0 + 40));
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48);
  return v0;
}

uint64_t RemoteUnlockKeypair.__deallocating_deinit()
{
  RemoteUnlockKeypair.deinit();
  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t sub_1D764F870@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D764F06C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D764F89C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D764F100(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t))sub_1D764F0B4);
}

uint64_t sub_1D764F8C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1D764F14C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D764F8F4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D764F100(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t))sub_1D764F194);
}

uint64_t sub_1D764F920@<X0>(uint64_t a1@<X8>)
{
  return sub_1D764F21C(a1);
}

uint64_t dispatch thunk of KeybagProvider.newKeypair()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeybagProvider.unlock(hostKey:deviceKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t type metadata accessor for MobileKeybagProvider()
{
  return self;
}

uint64_t type metadata accessor for KeybagUnsupportedKeybagProvider()
{
  return self;
}

uint64_t type metadata accessor for RemoteUnlockKeypair()
{
  return self;
}

uint64_t method lookup function for RemoteUnlockKeypair(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for RemoteUnlockKeypair);
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.populateWithNewKeypair()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.unlockDevice()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.configure(newKeybagProvider:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  return sub_1D7661690();
}

uint64_t OUTLINED_FUNCTION_12_10()
{
  return swift_beginAccess();
}

uint64_t sub_1D764FC4C()
{
  sub_1D75D5108();
  uint64_t result = sub_1D7660FE0();
  qword_1EA82CA50 = result;
  return result;
}

BOOL static BonjourBrowser.Mode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t BonjourBrowser.Mode.hash(into:)()
{
  return sub_1D7661740();
}

uint64_t _s19RemotePairingDevice14BonjourBrowserC4ModeO9hashValueSivg_0()
{
  return sub_1D7661760();
}

void BonjourBrowser.Change.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t BonjourBrowser.Change.advert.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BonjourBrowser.Change() + 20);
  return sub_1D764FDE4(v3, a1);
}

uint64_t type metadata accessor for BonjourBrowser.Change()
{
  uint64_t result = qword_1EA82CA68;
  if (!qword_1EA82CA68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D764FDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *BonjourBrowser.Change.resolvedPairing.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for BonjourBrowser.Change() + 24));
  id v2 = v1;
  return v1;
}

uint64_t BonjourBrowser.__allocating_init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(unsigned __int8 *a1, uint64_t a2, void *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = swift_allocObject();
  BonjourBrowser.init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t BonjourBrowser.init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(unsigned __int8 *a1, uint64_t a2, void *a3, uint64_t a4, char *a5)
{
  uint64_t v6 = v5;
  uint64_t v9 = *a1;
  char v10 = *a5;
  sub_1D7660680();
  *(void *)(v5 + 88) = 0;
  *(void *)(v5 + 96) = 0;
  sub_1D7660650();
  sub_1D7660620();
  sub_1D7660830();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_1_7();
  uint64_t v15 = (unint64_t *)(v14 - v13);
  unint64_t v16 = 0xD000000000000022;
  unint64_t v17 = 0x80000001D7671AF0;
  switch(v9)
  {
    case 1:
      unint64_t v17 = 0x80000001D7671B20;
      unint64_t v16 = 0xD000000000000013;
      break;
    case 2:
      uint64_t v18 = 0x63745F2E6C65;
      goto LABEL_5;
    case 3:
      uint64_t v18 = 0x64755F2E6C65;
LABEL_5:
      unint64_t v17 = v18 & 0xFFFFFFFFFFFFLL | 0xEF70000000000000;
      unint64_t v16 = 0x6E6E75742D70725FLL;
      break;
    case 4:
      unint64_t v16 = 0xD000000000000021;
      unint64_t v17 = 0x80000001D7671B60;
      break;
    default:
      break;
  }
  unint64_t *v15 = v16;
  v15[1] = v17;
  v15[2] = 0;
  v15[3] = 0;
  (*(void (**)(unint64_t *, void))(v12 + 104))(v15, *MEMORY[0x1E4F38B68]);
  sub_1D76608F0();
  swift_allocObject();
  swift_retain();
  *(void *)(v6 + 16) = sub_1D7660850();
  *(unsigned char *)(v6 + 24) = v9;
  *(void *)(v6 + 32) = a3;
  sub_1D758B1EC(a4, v6 + 40);
  *(unsigned char *)(v6 + 80) = v10;
  swift_allocObject();
  swift_weakInit();
  id v19 = a3;
  swift_retain();
  sub_1D75A74B4((uint64_t)sub_1D7650210);
  sub_1D7660840();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm(a4);
  swift_release_n();
  return v6;
}

uint64_t sub_1D7650164()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1D765019C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1D7650410(a1, a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1D7650210(uint64_t a1, uint64_t a2)
{
  return sub_1D765019C(a1, a2);
}

uint64_t sub_1D7650218@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t result = sub_1D7650318();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_1D75A74CC;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_1D7650288(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_1D75D4F4C;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_1D75A74B4(v1);
  return sub_1D7650368((uint64_t)v4, v3);
}

uint64_t sub_1D7650318()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 88);
  sub_1D75A74B4(v1);
  return v1;
}

uint64_t sub_1D7650368(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 88);
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return sub_1D75940A4(v5);
}

uint64_t (*sub_1D76503BC())()
{
  return j__swift_endAccess;
}

uint64_t sub_1D7650410(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = sub_1D7660DA0();
  if (qword_1EA82AAB8 == -1) {
    goto LABEL_2;
  }
LABEL_33:
  swift_once();
LABEL_2:
  uint64_t v4 = qword_1EA82CA50;
  if (os_log_type_enabled((os_log_t)qword_1EA82CA50, v3))
  {
    swift_retain_n();
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_14_0();
    uint64_t v28 = OUTLINED_FUNCTION_11_4();
    *(_DWORD *)uint64_t v5 = 136446210;
    unint64_t v6 = 0xD000000000000022;
    unint64_t v7 = 0x80000001D7671AF0;
    switch(*(unsigned char *)(v2 + 24))
    {
      case 1:
        unint64_t v7 = 0x80000001D7671B20;
        unint64_t v6 = 0xD000000000000013;
        break;
      case 2:
        uint64_t v8 = 0x63745F2E6C65;
        goto LABEL_7;
      case 3:
        uint64_t v8 = 0x64755F2E6C65;
LABEL_7:
        unint64_t v7 = v8 & 0xFFFFFFFFFFFFLL | 0xEF70000000000000;
        unint64_t v6 = OUTLINED_FUNCTION_28_10();
        break;
      case 4:
        unint64_t v6 = 0xD000000000000021;
        unint64_t v7 = 0x80000001D7671B60;
        break;
      default:
        break;
    }
    uint64_t v9 = sub_1D758DBE8(v6, v7, &v28);
    OUTLINED_FUNCTION_137(v9);
    sub_1D7661020();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D757C000, v4, v3, "Received change notification from bonjour browser for type %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  uint64_t v10 = a2 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  uint64_t v13 = v12 & *(void *)(a2 + 56);
  os_log_type_t v3 = sub_1D7660890();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_1_7();
  unint64_t v17 = (char *)(v16 - v15);
  int64_t v18 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v19 = 0;
  if (v13)
  {
LABEL_13:
    v13 &= v13 - 1;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v20 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    if (v20 >= v18) {
      return swift_release();
    }
    uint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v19;
    if (!v21)
    {
      int64_t v19 = v20 + 1;
      if (v20 + 1 >= v18) {
        return swift_release();
      }
      uint64_t v21 = *(void *)(v10 + 8 * v19);
      if (!v21)
      {
        int64_t v19 = v20 + 2;
        if (v20 + 2 >= v18) {
          return swift_release();
        }
        uint64_t v21 = *(void *)(v10 + 8 * v19);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    uint64_t v13 = (v21 - 1) & v21;
LABEL_28:
    OUTLINED_FUNCTION_21_11();
    v23();
    sub_1D7650798(a1, v17);
    OUTLINED_FUNCTION_28_0();
    v24();
    if (v13) {
      goto LABEL_13;
    }
  }
  int64_t v22 = v20 + 3;
  if (v22 < v18)
  {
    uint64_t v21 = *(void *)(v10 + 8 * v22);
    if (!v21)
    {
      while (1)
      {
        int64_t v19 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          goto LABEL_32;
        }
        if (v19 >= v18) {
          return swift_release();
        }
        uint64_t v21 = *(void *)(v10 + 8 * v19);
        ++v22;
        if (v21) {
          goto LABEL_27;
        }
      }
    }
    int64_t v19 = v22;
    goto LABEL_27;
  }
  return swift_release();
}

uint64_t sub_1D7650798(uint64_t a1, char *a2)
{
  v226 = (void *)a1;
  uint64_t v212 = type metadata accessor for BonjourBrowser.Change();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_14();
  v213 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CA78);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_14();
  v221 = (void *)v6;
  v223 = (uint8_t *)type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_15_13();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_15_13();
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  v219 = ((char *)v208 - v11);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_15_13();
  MEMORY[0x1F4188790](v12);
  v222 = (void *)((char *)v208 - v13);
  os_log_type_t v14 = sub_1D7660DA0();
  if (qword_1EA82AAB8 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_1EA82CA50;
  uint64_t v16 = sub_1D7660890();
  v233 = v208;
  OUTLINED_FUNCTION_0_5();
  int64_t v18 = v17;
  int64_t v20 = *(void **)(v19 + 64);
  MEMORY[0x1F4188790](v21);
  unint64_t v22 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v24 = (void (*)(char *, os_log_t, uint64_t))(v18 + 2);
  uint64_t v23 = (void (*)(void))v18[2];
  v231 = a2;
  OUTLINED_FUNCTION_26_9();
  v23();
  os_log_t v232 = v15;
  BOOL v25 = os_log_type_enabled(v15, v14);
  v229 = v18;
  if (v25)
  {
    uint64_t v26 = OUTLINED_FUNCTION_14_0();
    v230 = v20;
    uint64_t v27 = (uint8_t *)v26;
    uint64_t v28 = OUTLINED_FUNCTION_11_4();
    uint64_t v227 = v28;
    p_Class isa = (void *)v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    MEMORY[0x1F4188790](v28);
    OUTLINED_FUNCTION_26_9();
    v23();
    uint64_t v29 = sub_1D7660B60();
    int64_t v18 = v229;
    uint64_t v31 = sub_1D758DBE8(v29, v30, (uint64_t *)&p_isa);
    OUTLINED_FUNCTION_137(v31);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    v228 = (void (*)(char *, uint64_t))v18[1];
    v228((char *)v208 - v22, v16);
    _os_log_impl(&dword_1D757C000, v232, v14, "Handling result change from bonjour browser: %s", v27, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    int64_t v20 = v230;
    OUTLINED_FUNCTION_1();
  }
  else
  {
    v228 = (void (*)(char *, uint64_t))v18[1];
    v228((char *)v208 - v22, v16);
  }
  uint64_t v32 = sub_1D76608D0();
  os_log_t v232 = (os_log_t)v208;
  uint64_t v227 = v32;
  OUTLINED_FUNCTION_0_5();
  v233 = v33;
  uint64_t v35 = *(void *)(v34 + 64);
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_7_16();
  os_log_t v224 = (os_log_t)(v37 - v38);
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_26_9();
  uint64_t v40 = ((uint64_t (*)(void))v23)();
  v230 = v208;
  MEMORY[0x1F4188790](v40);
  long long v41 = (char *)v208 - (((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v231 = v41;
  v216 = v24;
  v215 = v23;
  OUTLINED_FUNCTION_26_9();
  v23();
  int v42 = ((uint64_t (*)(char *, uint64_t))v18[11])(v41, v16);
  uint64_t v43 = (unsigned int *)MEMORY[0x1E4F38B70];
  if (MEMORY[0x1E4F38B70] && v42 == *MEMORY[0x1E4F38B70])
  {
    uint64_t v44 = OUTLINED_FUNCTION_4_15();
    uint64_t v46 = v45(v44);
    MEMORY[0x1F4188790](v46);
    uint64_t v211 = v16;
    uint64_t v47 = v233;
    unint64_t v48 = (void (*)(void))v233[4];
    uint64_t v49 = v227;
    OUTLINED_FUNCTION_10_11();
    v48();
    uint64_t v209 = (uint64_t)v208 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    if ((sub_1D7652128(v209, (uint64_t)v226) & 1) == 0)
    {
      v210 = v208;
      uint64_t v89 = sub_1D7660DD0();
      os_log_type_t v90 = v89;
      v226 = v208;
      unint64_t v91 = qword_1EA82CA50;
      MEMORY[0x1F4188790](v89);
      OUTLINED_FUNCTION_22_9();
      char v92 = (void (*)(void))v20[2];
      OUTLINED_FUNCTION_21_11();
      v92();
      if (os_log_type_enabled(v91, v90))
      {
        uint64_t v93 = OUTLINED_FUNCTION_14_0();
        LODWORD(v225) = v90;
        char v94 = (uint8_t *)v93;
        uint64_t v95 = OUTLINED_FUNCTION_11_4();
        os_log_t v224 = v95;
        v221 = v208;
        p_Class isa = &v95->isa;
        v223 = v94;
        *(_DWORD *)char v94 = 136315138;
        v222 = v94 + 4;
        MEMORY[0x1F4188790](v95);
        OUTLINED_FUNCTION_7_16();
        OUTLINED_FUNCTION_27_11(v96);
        OUTLINED_FUNCTION_21_11();
        v92();
        uint64_t v97 = sub_1D7660B60();
        uint64_t v99 = sub_1D758DBE8(v97, v98, (uint64_t *)&p_isa);
        OUTLINED_FUNCTION_137(v99);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v100 = (void (*)(void))v47[1];
        OUTLINED_FUNCTION_8_16();
        v100();
        _os_log_impl(&dword_1D757C000, v91, (os_log_type_t)v225, "Received bonjour notification to add result %s, but result is not present in full results set. Ignoring", v223, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_8_16();
        v100();
        OUTLINED_FUNCTION_5_16();
        return v101();
      }
      else
      {
        unint64_t v121 = (void (*)(void))v47[1];
        OUTLINED_FUNCTION_8_16();
        v121();
        OUTLINED_FUNCTION_8_16();
        v121();
        uint64_t v122 = OUTLINED_FUNCTION_11_8();
        return v123(v122);
      }
    }
    os_log_t v50 = v224;
    OUTLINED_FUNCTION_10_11();
    uint64_t v51 = ((uint64_t (*)(void))v48)();
    uint64_t v16 = v211;
  }
  else
  {
    if (!MEMORY[0x1E4F38B80] || v42 != *MEMORY[0x1E4F38B80])
    {
      if (MEMORY[0x1E4F38B78] && v42 == *MEMORY[0x1E4F38B78])
      {
        ((void (*)(char *, uint64_t))v18[12])(v41, v16);
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CA88);
        v222 = v208;
        v223 = (uint8_t *)&v41[*(int *)(v72 + 64)];
        MEMORY[0x1F4188790](v72);
        v220 = v208;
        unint64_t v73 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
        os_log_t v224 = (os_log_t)((char *)v208 - v73);
        uint64_t v74 = (uint64_t (*)(void))v233[4];
        uint64_t v75 = v227;
        uint64_t v76 = v74();
        v221 = v208;
        MEMORY[0x1F4188790](v76);
        v219 = ((char *)v208 - v73);
        uint64_t v77 = v74();
        v218 = v208;
        MEMORY[0x1F4188790](v77);
        unint64_t v217 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF0;
        char v78 = (char *)v208 - v217;
        uint64_t v79 = v75;
        v216 = (void (*)(char *, os_log_t, uint64_t))v233[2];
        v216((char *)v208 - v217, v224, v75);
        uint64_t v80 = *MEMORY[0x1E4F38B80];
        v215 = (void (*)(void))v18[13];
        ((void (*)(char *, uint64_t, uint64_t))v215)(v78, v80, v16);
        uint64_t v81 = (uint64_t)v226;
        sub_1D7650798(v226, v78);
        uint64_t v214 = (uint64_t)(v18 + 1);
        uint64_t v82 = v228;
        uint64_t v83 = ((uint64_t (*)(char *, uint64_t))v228)(v78, v16);
        v229 = v208;
        MEMORY[0x1F4188790](v83);
        uint64_t v84 = (char *)v208 - v217;
        uint64_t v85 = (uint64_t)v219;
        v216((char *)v208 - v217, v219, v79);
        ((void (*)(char *, void, uint64_t))v215)(v84, *v43, v16);
        sub_1D7650798(v81, v84);
        v82(v84, v16);
        uint64_t v86 = (void (*)(uint64_t, uint64_t))v233[1];
        v86(v85, v79);
        v86((uint64_t)v224, v79);
        v82(v231, v16);
        sub_1D7660880();
        OUTLINED_FUNCTION_2_2();
        return (*(uint64_t (**)(uint8_t *))(v87 + 8))(v223);
      }
      else
      {
        uint64_t v88 = (uint64_t (*)(char *, uint64_t))v228;
        v228(v231, v16);
        return v88(v41, v16);
      }
    }
    uint64_t v52 = OUTLINED_FUNCTION_4_15();
    uint64_t v54 = v53(v52);
    v210 = v208;
    MEMORY[0x1F4188790](v54);
    uint64_t v55 = v233;
    uint64_t v56 = (void (*)(void))v233[4];
    uint64_t v49 = v227;
    OUTLINED_FUNCTION_10_11();
    v56();
    if (sub_1D7652128((uint64_t)v208 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v226))
    {
      uint64_t v211 = v16;
      uint64_t v57 = sub_1D7660DD0();
      os_log_type_t v58 = v57;
      v226 = v208;
      char v59 = qword_1EA82CA50;
      MEMORY[0x1F4188790](v57);
      OUTLINED_FUNCTION_22_9();
      char v60 = (void (*)(void))v20[2];
      v225 = (id *)((char *)v208 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
      OUTLINED_FUNCTION_21_11();
      v60();
      char v61 = v55;
      os_log_type_t v62 = v58;
      os_log_t v224 = v59;
      if (os_log_type_enabled(v59, v58))
      {
        char v63 = (uint8_t *)OUTLINED_FUNCTION_14_0();
        uint64_t v64 = OUTLINED_FUNCTION_11_4();
        v222 = v208;
        p_Class isa = (void *)v64;
        *(_DWORD *)char v63 = 136315138;
        v223 = v63 + 4;
        MEMORY[0x1F4188790](v64);
        OUTLINED_FUNCTION_7_16();
        OUTLINED_FUNCTION_27_11(v65);
        OUTLINED_FUNCTION_21_11();
        v60();
        uint64_t v66 = sub_1D7660B60();
        uint64_t v68 = sub_1D758DBE8(v66, v67, (uint64_t *)&p_isa);
        OUTLINED_FUNCTION_137(v68);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v69 = (void (*)(void))v61[1];
        OUTLINED_FUNCTION_28_0();
        v69();
        _os_log_impl(&dword_1D757C000, v224, v62, "Received bonjour notification to remove result %s, but result is still present in full results set. Ignoring", v63, 0xCu);
        OUTLINED_FUNCTION_62();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_28_0();
        v69();
        OUTLINED_FUNCTION_5_16();
        return v70();
      }
      else
      {
        unint64_t v126 = (void (*)(void))v55[1];
        OUTLINED_FUNCTION_28_0();
        v126();
        OUTLINED_FUNCTION_28_0();
        v126();
        uint64_t v127 = OUTLINED_FUNCTION_11_8();
        return v128(v127);
      }
    }
    os_log_t v50 = v224;
    OUTLINED_FUNCTION_10_11();
    uint64_t v51 = ((uint64_t (*)(void))v56)();
  }
  MEMORY[0x1F4188790](v51);
  OUTLINED_FUNCTION_7_16();
  uint64_t v104 = v102 - v103;
  ((void (*)(uint64_t, os_log_t, uint64_t))v233[2])(v102 - v103, v50, v49);
  unint64_t v105 = v225;
  uint64_t v106 = *((unsigned __int8 *)v225 + 24);
  LOBYTE(p_isa) = *((unsigned char *)v225 + 24);
  id v107 = v225[4];
  uint64_t v108 = (uint64_t)v221;
  sub_1D76581B0(v104, (unsigned __int8 *)&p_isa, v107, (uint64_t)v221);
  unsigned __int8 v109 = v223;
  if (__swift_getEnumTagSinglePayload(v108, 1, (uint64_t)v223) == 1)
  {
    sub_1D7653374(v108);
    os_log_type_t v110 = sub_1D7660DB0();
    char v111 = qword_1EA82CA50;
    if (os_log_type_enabled((os_log_t)qword_1EA82CA50, v110))
    {
      swift_retain_n();
      uint64_t v112 = (uint8_t *)OUTLINED_FUNCTION_14_0();
      p_Class isa = (void *)OUTLINED_FUNCTION_11_4();
      *(_DWORD *)uint64_t v112 = 136315138;
      unint64_t v113 = 0xD000000000000022;
      unint64_t v114 = 0x80000001D7671AF0;
      switch(v106)
      {
        case 1:
          unint64_t v114 = 0x80000001D7671B20;
          unint64_t v113 = 0xD000000000000013;
          break;
        case 2:
          uint64_t v192 = 0x63745F2E6C65;
          goto LABEL_56;
        case 3:
          uint64_t v192 = 0x64755F2E6C65;
LABEL_56:
          unint64_t v114 = v192 & 0xFFFFFFFFFFFFLL | 0xEF70000000000000;
          unint64_t v113 = OUTLINED_FUNCTION_28_10();
          break;
        case 4:
          unint64_t v113 = 0xD000000000000021;
          unint64_t v114 = 0x80000001D7671B60;
          break;
        default:
          break;
      }
      uint64_t v193 = sub_1D758DBE8(v113, v114, (uint64_t *)&p_isa);
      OUTLINED_FUNCTION_137(v193);
      sub_1D7661020();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v111, v110, "Unable to parse bonjour advert of type %s", v112, 0xCu);
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_5_16();
      v194();
      uint64_t v195 = OUTLINED_FUNCTION_25_5();
      return v197(v195, v196);
    }
    else
    {
      OUTLINED_FUNCTION_5_16();
      v124();
      return ((uint64_t (*)(os_log_t, uint64_t))v233[1])(v224, v49);
    }
  }
  else
  {
    v230 = v20;
    uint64_t v115 = (uint64_t)v222;
    sub_1D76533D4(v108, (uint64_t)v222);
    int v116 = *((unsigned __int8 *)v105 + 80);
    uint64_t v117 = (uint64_t)v218;
    sub_1D764FDE4(v115, (uint64_t)v218);
    if (v116 == 1)
    {
      uint64_t v118 = *(void *)(v117 + *((int *)v109 + 12));
      sub_1D7653438(v117, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      uint64_t v119 = (uint64_t)v219;
      sub_1D764FDE4(v115, (uint64_t)v219);
      uint64_t v120 = v233;
      if (v118)
      {
        sub_1D7653438(v119, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
LABEL_37:
        sub_1D7660DB0();
        sub_1D7660010();
        sub_1D7653438(v115, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
        OUTLINED_FUNCTION_5_16();
        v131();
        return ((uint64_t (*)(os_log_t, uint64_t))v120[1])(v224, v227);
      }
    }
    else
    {
      sub_1D7653438(v117, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      uint64_t v119 = (uint64_t)v219;
      sub_1D764FDE4(v115, (uint64_t)v219);
      uint64_t v120 = v233;
    }
    uint64_t v125 = v217;
    sub_1D764FDE4(v119, v217);
    if (v116)
    {
      sub_1D7653438(v125, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      sub_1D7653438(v119, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
    }
    else
    {
      uint64_t v129 = v125;
      uint64_t v130 = *(void *)(v125 + *((int *)v109 + 12));
      sub_1D7653438(v129, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      sub_1D7653438(v119, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      if ((v130 & 1) == 0) {
        goto LABEL_37;
      }
    }
    uint64_t v211 = v16;
    sub_1D758B1EC((uint64_t)(v105 + 5), (uint64_t)&p_isa);
    uint64_t v132 = v236;
    v226 = (void *)v237;
    v221 = __swift_project_boxed_opaque_existential_0Tm(&p_isa, v236);
    v133 = (uint64_t *)(v115 + *((int *)v109 + 7));
    uint64_t v134 = *v133;
    unint64_t v135 = v133[1];
    sub_1D75934F4(*v133, v135);
    sub_1D765FF90();
    uint64_t v136 = sub_1D7660B50();
    v228 = (void (*)(char *, uint64_t))v208;
    OUTLINED_FUNCTION_0_5();
    uint64_t v138 = v137;
    MEMORY[0x1F4188790](v139);
    OUTLINED_FUNCTION_1_7();
    uint64_t v142 = v141 - v140;
    sub_1D7660B40();
    uint64_t v143 = sub_1D7660B20();
    unint64_t v145 = v144;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v142, v136);
    if (v145 >> 60 == 15)
    {
      __break(1u);
      JUMPOUT(0x1D7652114);
    }
    v146 = (void *)((uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))v226[4])(v134, v135, v143, v145, 1, v132);
    sub_1D75941DC(v143, v145);
    sub_1D75933F0(v134, v135);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&p_isa);
    if (v146)
    {
      id v147 = v146;
      v228 = (void (*)(char *, uint64_t))CUPairedPeer.udid.getter();
      v149 = v148;
    }
    else
    {
      v228 = 0;
      v149 = 0;
    }
    uint64_t v150 = v214;
    os_log_type_t v151 = sub_1D7660DD0();
    v152 = qword_1EA82CA50;
    sub_1D764FDE4((uint64_t)v222, v150);
    if (os_log_type_enabled(v152, v151))
    {
      swift_bridgeObjectRetain_n();
      id v153 = v146;
      uint64_t v154 = OUTLINED_FUNCTION_11_4();
      v226 = (void *)swift_slowAlloc();
      v238 = v226;
      *(_DWORD *)uint64_t v154 = 136446722;
      sub_1D765FFD0();
      sub_1D7653490((unint64_t *)&qword_1EBDEC0A8, MEMORY[0x1F418BC88]);
      uint64_t v155 = sub_1D7661500();
      uint64_t v157 = sub_1D758DBE8(v155, v156, (uint64_t *)&v238);
      OUTLINED_FUNCTION_33_0(v157);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      sub_1D7653438(v150, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      *(_WORD *)(v154 + 12) = 2082;
      p_Class isa = v146;
      id v158 = v153;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CA80);
      uint64_t v159 = sub_1D7660B60();
      p_Class isa = (void *)sub_1D758DBE8(v159, v160, (uint64_t *)&v238);
      sub_1D7661020();

      swift_bridgeObjectRelease();
      *(_WORD *)(v154 + 22) = 2082;
      p_Class isa = v228;
      v235 = v149;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82B890);
      uint64_t v161 = sub_1D7660B60();
      p_Class isa = (void *)sub_1D758DBE8(v161, v162, (uint64_t *)&v238);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v152, v151, "Resolved bonjour advert %{public}s to identity %{public}s, udid %{public}s", (uint8_t *)v154, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {
      uint64_t v163 = sub_1D7653438(v150, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
    }
    uint64_t v164 = v211;
    v165 = v229;
    uint64_t v166 = v227;
    v167 = v208;
    MEMORY[0x1F4188790](v163);
    v169 = (char *)v208 - ((v168 + 15) & 0xFFFFFFFFFFFFFFF0);
    v170(v169, v231, v164);
    int v171 = ((uint64_t (*)(char *, uint64_t))v208[0])(v169, v164);
    if (MEMORY[0x1E4F38B80] && v171 == *MEMORY[0x1E4F38B80])
    {
      swift_bridgeObjectRelease();
      v172 = (void (*)(void))v165[1];
      OUTLINED_FUNCTION_17_13();
      v172();
      OUTLINED_FUNCTION_6_12();
      v173 = (void (*)(unsigned char *))v218;
      if (v218)
      {
        uint64_t v174 = v212;
        v175 = v213;
        uint64_t v176 = (uint64_t)v222;
        sub_1D764FDE4((uint64_t)v222, (uint64_t)&v213[*(int *)(v212 + 20)]);
        unsigned char *v175 = 1;
        *(void *)&v175[*(int *)(v174 + 24)] = v146;
        id v177 = v146;
        sub_1D75A74B4((uint64_t)v173);
        v173(v175);
        sub_1D75940A4((uint64_t)v173);

        sub_1D7653438((uint64_t)v175, (void (*)(void))type metadata accessor for BonjourBrowser.Change);
        uint64_t v178 = v176;
      }
      else
      {

        uint64_t v178 = (uint64_t)v222;
      }
      sub_1D7653438(v178, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
      OUTLINED_FUNCTION_17_13();
      v172();
      uint64_t v205 = OUTLINED_FUNCTION_25_5();
      return v207(v205, v206);
    }
    else
    {
      v179 = (void (*)(void))v165[1];
      OUTLINED_FUNCTION_17_13();
      v179();
      if (*(void *)(*(void *)((char *)v222 + *((int *)v223 + 13)) + 16))
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_6_12();
        v180 = (void (*)(unsigned char *))v218;
        if (v218)
        {
          OUTLINED_FUNCTION_12_11();
          uint64_t v181 = (uint64_t)v222;
          sub_1D764FDE4((uint64_t)v222, v182);
          unsigned char *v149 = 0;
          *(void *)&v149[(int)v210] = v146;
          id v183 = v146;
          sub_1D75A74B4((uint64_t)v180);
          v180(v149);
          sub_1D75940A4((uint64_t)v180);

          sub_1D7653438((uint64_t)v149, (void (*)(void))type metadata accessor for BonjourBrowser.Change);
          uint64_t v184 = v181;
        }
        else
        {

          uint64_t v184 = (uint64_t)v222;
        }
        sub_1D7653438(v184, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
        uint64_t v198 = OUTLINED_FUNCTION_20_8();
        ((void (*)(uint64_t))v179)(v198);
        return ((uint64_t (*)(os_log_t, uint64_t))v233[1])(v224, v166);
      }
      else
      {
        os_log_type_t v185 = sub_1D7660DD0();
        v186 = qword_1EA82CA50;
        os_log_type_t v187 = v185;
        if (os_log_type_enabled((os_log_t)qword_1EA82CA50, v185))
        {
          swift_bridgeObjectRetain();
          v230 = v146;
          v188 = (uint8_t *)OUTLINED_FUNCTION_14_0();
          v238 = (void *)OUTLINED_FUNCTION_11_4();
          *(_DWORD *)v188 = 136315138;
          v167 = v188 + 12;
          p_Class isa = v228;
          v235 = v149;
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82B890);
          uint64_t v189 = sub_1D7660B60();
          uint64_t v191 = sub_1D758DBE8(v189, v190, (uint64_t *)&v238);
          OUTLINED_FUNCTION_33_0(v191);
          v146 = v230;
          sub_1D7661020();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1D757C000, v186, v187, "Discovered bonjour advert for device %s but it is not visible through any valid interface. Treating as lost event.", v188, 0xCu);
          OUTLINED_FUNCTION_62();
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_1();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        OUTLINED_FUNCTION_6_12();
        v199 = (void (*)(unsigned char *))v167[11];
        v200 = v233;
        uint64_t v201 = (uint64_t)v222;
        if (v199)
        {
          OUTLINED_FUNCTION_12_11();
          sub_1D764FDE4(v201, v202);
          unsigned char *v149 = 1;
          *(void *)&v149[*((int *)v167 + 6)] = v146;
          id v203 = v146;
          sub_1D75A74B4((uint64_t)v199);
          v199(v149);
          sub_1D75940A4((uint64_t)v199);

          sub_1D7653438((uint64_t)v149, (void (*)(void))type metadata accessor for BonjourBrowser.Change);
        }
        else
        {
        }
        sub_1D7653438(v201, (void (*)(void))type metadata accessor for DiscoveredBonjourAdvert);
        uint64_t v204 = OUTLINED_FUNCTION_20_8();
        ((void (*)(uint64_t))v179)(v204);
        return ((uint64_t (*)(os_log_t, uint64_t))v200[1])(v224, v227);
      }
    }
  }
}

uint64_t sub_1D7652128(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v4 = sub_1D76608D0(),
        sub_1D7653490(&qword_1EA82CA90, MEMORY[0x1F418DB30]),
        uint64_t v5 = sub_1D7660A70(),
        uint64_t v6 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v7 = v5 & ~v6,
        uint64_t v17 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0))
  {
    uint64_t v16 = a1;
    uint64_t v14 = ~v6;
    uint64_t v8 = *(void **)(v4 - 8);
    uint64_t v15 = (void (*)(char *, unint64_t, uint64_t))v8[2];
    uint64_t v9 = v8[8];
    uint64_t v10 = v8[9];
    uint64_t v11 = (uint64_t (**)(char *, uint64_t))(v8 + 1);
    do
    {
      MEMORY[0x1F4188790](v5);
      v15((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(a2 + 48) + v10 * v7, v4);
      sub_1D7653490(&qword_1EA82CA98, MEMORY[0x1F418DB30]);
      char v12 = sub_1D7660AD0();
      uint64_t v5 = (*v11)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      if (v12) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v14;
    }
    while (((*(void *)(v17 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_1D76522F0()
{
  swift_beginAccess();
  if (*(void *)(v0 + 88)) {
    return sub_1D7660860();
  }
  uint64_t result = sub_1D7661260();
  __break(1u);
  return result;
}

uint64_t sub_1D765238C()
{
  return sub_1D76608E0();
}

uint64_t BonjourBrowser.deinit()
{
  sub_1D76608E0();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  sub_1D75940A4(*(void *)(v0 + 88));
  return v0;
}

uint64_t BonjourBrowser.__deallocating_deinit()
{
  BonjourBrowser.deinit();
  return MEMORY[0x1F4186488](v0, 104, 7);
}

unint64_t sub_1D7652434()
{
  unint64_t result = qword_1EA82CA58;
  if (!qword_1EA82CA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA58);
  }
  return result;
}

unint64_t sub_1D7652484()
{
  unint64_t result = qword_1EA82CA60;
  if (!qword_1EA82CA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CA60);
  }
  return result;
}

uint64_t type metadata accessor for BonjourBrowser()
{
  return self;
}

uint64_t method lookup function for BonjourBrowser(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BonjourBrowser);
}

uint64_t dispatch thunk of BonjourBrowser.__allocating_init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of BonjourBrowser.start(queue:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of BonjourBrowser.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

ValueMetadata *type metadata accessor for BonjourBrowser.Mode()
{
  return &type metadata for BonjourBrowser.Mode;
}

uint64_t *initializeBufferWithCopyOfBuffer for BonjourBrowser.Change(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v40 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v40 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v6 = *(int *)(a3 + 20);
    unint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1D76603E0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
    v7[v10[5]] = v8[v10[5]];
    uint64_t v11 = v10[6];
    char v12 = &v7[v11];
    uint64_t v13 = &v8[v11];
    uint64_t v14 = sub_1D765FFD0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = v10[7];
    uint64_t v16 = (uint64_t *)&v7[v15];
    uint64_t v17 = (uint64_t *)&v8[v15];
    uint64_t v18 = *v17;
    unint64_t v19 = v17[1];
    sub_1D75934F4(*v17, v19);
    *uint64_t v16 = v18;
    v16[1] = v19;
    uint64_t v20 = v10[8];
    uint64_t v21 = *(void **)&v8[v20];
    *(void *)&v7[v20] = v21;
    uint64_t v22 = v10[9];
    uint64_t v23 = *(void **)&v8[v22];
    *(void *)&v7[v22] = v23;
    uint64_t v24 = v10[10];
    BOOL v25 = &v7[v24];
    uint64_t v26 = &v8[v24];
    uint64_t v27 = *((void *)v26 + 1);
    *BOOL v25 = *(void *)v26;
    v25[1] = v27;
    uint64_t v28 = v10[11];
    uint64_t v29 = &v7[v28];
    unint64_t v30 = &v8[v28];
    uint64_t v31 = *((void *)v30 + 1);
    *uint64_t v29 = *(void *)v30;
    v29[1] = v31;
    *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
    *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
    uint64_t v32 = v10[14];
    char v33 = *(void **)&v8[v32];
    *(void *)&v7[v32] = v33;
    *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
    uint64_t v34 = *(int *)(a3 + 24);
    uint64_t v35 = *(void **)((char *)a2 + v34);
    *(uint64_t *)((char *)v3 + v34) = (uint64_t)v35;
    id v36 = v21;
    id v37 = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v38 = v33;
    swift_bridgeObjectRetain();
    id v39 = v35;
  }
  return v3;
}

void destroy for BonjourBrowser.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1D76603E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  uint64_t v7 = v4 + v6[6];
  uint64_t v8 = sub_1D765FFD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_1D75933F0(*(void *)(v4 + v6[7]), *(void *)(v4 + v6[7] + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void **)(a1 + *(int *)(a2 + 24));
}

unsigned char *initializeWithCopy for BonjourBrowser.Change(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = &a1[v5];
  uint64_t v7 = &a2[v5];
  uint64_t v8 = sub_1D76603E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  uint64_t v9 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v6[v9[5]] = v7[v9[5]];
  uint64_t v10 = v9[6];
  uint64_t v11 = &v6[v10];
  char v12 = &v7[v10];
  uint64_t v13 = sub_1D765FFD0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = v9[7];
  uint64_t v15 = (uint64_t *)&v6[v14];
  uint64_t v16 = (uint64_t *)&v7[v14];
  uint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  sub_1D75934F4(*v16, v18);
  uint64_t *v15 = v17;
  v15[1] = v18;
  uint64_t v19 = v9[8];
  uint64_t v20 = *(void **)&v7[v19];
  *(void *)&v6[v19] = v20;
  uint64_t v21 = v9[9];
  uint64_t v22 = *(void **)&v7[v21];
  *(void *)&v6[v21] = v22;
  uint64_t v23 = v9[10];
  uint64_t v24 = &v6[v23];
  BOOL v25 = &v7[v23];
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = v9[11];
  uint64_t v28 = &v6[v27];
  uint64_t v29 = &v7[v27];
  uint64_t v30 = v29[1];
  void *v28 = *v29;
  v28[1] = v30;
  *(void *)&v6[v9[12]] = *(void *)&v7[v9[12]];
  *(void *)&v6[v9[13]] = *(void *)&v7[v9[13]];
  uint64_t v31 = v9[14];
  uint64_t v32 = *(void **)&v7[v31];
  *(void *)&v6[v31] = v32;
  *(void *)&v6[v9[15]] = *(void *)&v7[v9[15]];
  uint64_t v33 = *(int *)(a3 + 24);
  uint64_t v34 = *(void **)&a2[v33];
  *(void *)&a1[v33] = v34;
  id v35 = v20;
  id v36 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v37 = v32;
  swift_bridgeObjectRetain();
  id v38 = v34;
  return a1;
}

unsigned char *assignWithCopy for BonjourBrowser.Change(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1D76603E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  uint64_t v11 = v10[6];
  char v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_1D765FFD0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = v10[7];
  uint64_t v16 = (uint64_t *)&v7[v15];
  uint64_t v17 = (uint64_t *)&v8[v15];
  uint64_t v18 = *v17;
  unint64_t v19 = v17[1];
  sub_1D75934F4(*v17, v19);
  uint64_t v20 = *v16;
  unint64_t v21 = v16[1];
  *uint64_t v16 = v18;
  v16[1] = v19;
  sub_1D75933F0(v20, v21);
  uint64_t v22 = v10[8];
  uint64_t v23 = *(void **)&v7[v22];
  uint64_t v24 = *(void **)&v8[v22];
  *(void *)&v7[v22] = v24;
  id v25 = v24;

  uint64_t v26 = v10[9];
  uint64_t v27 = *(void **)&v7[v26];
  uint64_t v28 = *(void **)&v8[v26];
  *(void *)&v7[v26] = v28;
  id v29 = v28;

  uint64_t v30 = v10[10];
  uint64_t v31 = &v7[v30];
  uint64_t v32 = &v8[v30];
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = v10[11];
  uint64_t v34 = &v7[v33];
  id v35 = &v8[v33];
  void *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
  *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v36 = v10[14];
  id v37 = *(void **)&v8[v36];
  id v38 = *(void **)&v7[v36];
  *(void *)&v7[v36] = v37;
  id v39 = v37;

  *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = *(int *)(a3 + 24);
  long long v41 = *(void **)&a1[v40];
  int v42 = *(void **)&a2[v40];
  *(void *)&a1[v40] = v42;
  id v43 = v42;

  return a1;
}

unsigned char *initializeWithTake for BonjourBrowser.Change(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1D76603E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  uint64_t v11 = v10[6];
  char v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_1D765FFD0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)&v7[v10[7]] = *(_OWORD *)&v8[v10[7]];
  *(void *)&v7[v10[8]] = *(void *)&v8[v10[8]];
  *(void *)&v7[v10[9]] = *(void *)&v8[v10[9]];
  *(_OWORD *)&v7[v10[10]] = *(_OWORD *)&v8[v10[10]];
  *(_OWORD *)&v7[v10[11]] = *(_OWORD *)&v8[v10[11]];
  *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
  *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
  *(void *)&v7[v10[14]] = *(void *)&v8[v10[14]];
  *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *assignWithTake for BonjourBrowser.Change(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1D76603E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  uint64_t v11 = v10[6];
  char v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_1D765FFD0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = v10[7];
  uint64_t v16 = *(void *)&v7[v15];
  unint64_t v17 = *(void *)&v7[v15 + 8];
  *(_OWORD *)&v7[v15] = *(_OWORD *)&v8[v15];
  sub_1D75933F0(v16, v17);
  uint64_t v18 = v10[8];
  unint64_t v19 = *(void **)&v7[v18];
  *(void *)&v7[v18] = *(void *)&v8[v18];

  uint64_t v20 = v10[9];
  unint64_t v21 = *(void **)&v7[v20];
  *(void *)&v7[v20] = *(void *)&v8[v20];

  uint64_t v22 = v10[10];
  uint64_t v23 = &v7[v22];
  uint64_t v24 = (uint64_t *)&v8[v22];
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = v10[11];
  uint64_t v28 = &v7[v27];
  id v29 = (uint64_t *)&v8[v27];
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  void *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  *(void *)&v7[v10[12]] = *(void *)&v8[v10[12]];
  *(void *)&v7[v10[13]] = *(void *)&v8[v10[13]];
  swift_bridgeObjectRelease();
  uint64_t v32 = v10[14];
  uint64_t v33 = *(void **)&v7[v32];
  *(void *)&v7[v32] = *(void *)&v8[v32];

  *(void *)&v7[v10[15]] = *(void *)&v8[v10[15]];
  swift_bridgeObjectRelease();
  uint64_t v34 = *(int *)(a3 + 24);
  id v35 = *(void **)&a1[v34];
  *(void *)&a1[v34] = *(void *)&a2[v34];

  return a1;
}

uint64_t getEnumTagSinglePayload for BonjourBrowser.Change(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D7653094);
}

uint64_t sub_1D7653094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for BonjourBrowser.Change(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D7653144);
}

void sub_1D7653144(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
}

uint64_t sub_1D76531D0()
{
  uint64_t result = type metadata accessor for DiscoveredBonjourAdvert();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *_s19RemotePairingDevice14BonjourBrowserC4ModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1D765333CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BonjourBrowser.Change.Kind()
{
  return &type metadata for BonjourBrowser.Change.Kind;
}

uint64_t sub_1D7653374(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CA78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D76533D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D7653438(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1D7653490(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1D76534D8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t OUTLINED_FUNCTION_20_8()
{
  return *(void *)(v0 - 160);
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return *(void *)(v0 - 216);
}

uint64_t OUTLINED_FUNCTION_27_11@<X0>(uint64_t a1@<X8>)
{
  return a1 - v1;
}

uint64_t sub_1D76535C8()
{
  sub_1D758DF20();
  sub_1D7660E90();
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_1_7();
  (*(void (**)(uint64_t, void))(v3 + 104))(v2 - v1, *MEMORY[0x1E4FBCC60]);
  uint64_t v4 = sub_1D7660950();
  MEMORY[0x1F4188790](v4 - 8);
  OUTLINED_FUNCTION_8();
  sub_1D7660930();
  sub_1D7660E60();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_30();
  sub_1D75E61A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC590);
  sub_1D75E61EC();
  sub_1D7661090();
  uint64_t result = sub_1D7660EB0();
  qword_1EA82CAA0 = result;
  return result;
}

id defaultPairingOperationQ.getter()
{
  if (qword_1EA82AAC0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EA82CAA0;
  return v0;
}

uint64_t AttemptPairingPinCommand.pinAttempt.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D76537F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D657474416E6970 && a2 == 0xEA00000000007470)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D7653884()
{
  return 0x6D657474416E6970;
}

uint64_t sub_1D76538A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76537F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D76538D0(uint64_t a1)
{
  unint64_t v2 = sub_1D7653A34();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D765390C(uint64_t a1)
{
  unint64_t v2 = sub_1D7653A34();
  return MEMORY[0x1F41862B0](a1, v2);
}

void AttemptPairingPinCommand.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAA8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_0Tm(v1, v1[3]);
  sub_1D7653A34();
  sub_1D76617C0();
  sub_1D7661450();
  OUTLINED_FUNCTION_116_0();
  v3();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D7653A34()
{
  unint64_t result = qword_1EA82CAB0;
  if (!qword_1EA82CAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CAB0);
  }
  return result;
}

void AttemptPairingPinCommand.init(from:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v2 = v1;
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAB8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D7653A34();
  sub_1D76617A0();
  if (!v0)
  {
    uint64_t v6 = sub_1D7661340();
    uint64_t v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_22();
    v10(v9);
    uint64_t *v4 = v6;
    v4[1] = v8;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
}

void sub_1D7653B88()
{
}

void sub_1D7653BA0()
{
}

uint64_t PairingChallengeEvent.lastAttemptIncorrect.getter()
{
  return *v0;
}

uint64_t PairingChallengeEvent.throttleSeconds.getter()
{
  return *(void *)(v0 + 8);
}

RemotePairingDevice::PairingChallengeEvent __swiftcall PairingChallengeEvent.init(lastAttemptIncorrect:throttleSeconds:)(Swift::Bool lastAttemptIncorrect, Swift::Int_optional throttleSeconds)
{
  *(unsigned char *)uint64_t v2 = lastAttemptIncorrect;
  *(void *)(v2 + 8) = throttleSeconds.value;
  *(unsigned char *)(v2 + 16) = throttleSeconds.is_nil;
  result.throttleSeconds = throttleSeconds;
  result.lastAttemptIncorrect = lastAttemptIncorrect;
  return result;
}

uint64_t sub_1D7653BE0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001D76719C0 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C74746F726874 && a2 == 0xEF73646E6F636553)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D7653CF0(char a1)
{
  if (a1) {
    return 0x656C74746F726874;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_1D7653D38()
{
  return sub_1D7653CF0(*v0);
}

uint64_t sub_1D7653D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D7653BE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D7653D68(uint64_t a1)
{
  unint64_t v2 = sub_1D7653F10();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7653DA4(uint64_t a1)
{
  unint64_t v2 = sub_1D7653F10();
  return MEMORY[0x1F41862B0](a1, v2);
}

void PairingChallengeEvent.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAC0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D7653F10();
  sub_1D76617C0();
  sub_1D7661460();
  if (!v0) {
    sub_1D7661420();
  }
  OUTLINED_FUNCTION_116_0();
  v4();
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D7653F10()
{
  unint64_t result = qword_1EA82CAC8;
  if (!qword_1EA82CAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CAC8);
  }
  return result;
}

void PairingChallengeEvent.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAD0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_25();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D7653F10();
  sub_1D76617A0();
  if (!v0)
  {
    char v6 = sub_1D7661350();
    uint64_t v7 = sub_1D7661310();
    char v9 = v8;
    uint64_t v10 = OUTLINED_FUNCTION_20_9();
    v11(v10);
    *(unsigned char *)uint64_t v4 = v6 & 1;
    *(void *)(v4 + 8) = v7;
    *(unsigned char *)(v4 + 16) = v9 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
}

void sub_1D76540AC()
{
}

void sub_1D76540C4()
{
}

uint64_t sub_1D76540DC(uint64_t a1)
{
  unint64_t v2 = sub_1D765422C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7654118(uint64_t a1)
{
  unint64_t v2 = sub_1D765422C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CancelPairingCommand.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAD8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_30();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1D765422C();
  sub_1D76617C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

unint64_t sub_1D765422C()
{
  unint64_t result = qword_1EA82CAE0;
  if (!qword_1EA82CAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CAE0);
  }
  return result;
}

uint64_t CancelPairingCommand.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_1D76542A0(uint64_t a1)
{
  return CancelPairingCommand.init(from:)(a1);
}

uint64_t sub_1D76542B8(void *a1)
{
  return CancelPairingCommand.encode(to:)(a1);
}

uint64_t sub_1D76542D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7974706D65 && a2 == 0xE500000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 2003789939 && a2 == 0xE400000000000000;
    if (v6 || (sub_1D7661560() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
      if (v7 || (sub_1D7661560() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_1D7661560();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_1D7654470(char a1)
{
  uint64_t result = 0x7974706D65;
  switch(a1)
  {
    case 1:
      uint64_t result = 2003789939;
      break;
    case 2:
      uint64_t result = 0x73736563637573;
      break;
    case 3:
      uint64_t result = 0x6572756C696166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1D76544F8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D7654578()
{
  return 0x726F727265;
}

uint64_t sub_1D765458C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7235952 && a2 == 0xE300000000000000;
  if (v2 || (sub_1D7661560() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44676E69646E6573 && a2 == 0xED00006563697665)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1D7661560();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1D7654690(char a1)
{
  if (a1) {
    return 0x44676E69646E6573;
  }
  else {
    return 7235952;
  }
}

uint64_t sub_1D76546CC()
{
  return sub_1D7654470(*v0);
}

uint64_t sub_1D76546D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76542D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D76546FC(uint64_t a1)
{
  unint64_t v2 = sub_1D7654EB4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7654738(uint64_t a1)
{
  unint64_t v2 = sub_1D7654EB4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7654774(uint64_t a1)
{
  unint64_t v2 = sub_1D7655048();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D76547B0(uint64_t a1)
{
  unint64_t v2 = sub_1D7655048();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D76547F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D76544F8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D765481C(uint64_t a1)
{
  unint64_t v2 = sub_1D7654F64();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7654858(uint64_t a1)
{
  unint64_t v2 = sub_1D7654F64();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D7654894()
{
  return sub_1D7654690(*v0);
}

uint64_t sub_1D765489C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D765458C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1D76548C4(uint64_t a1)
{
  unint64_t v2 = sub_1D7654FFC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7654900(uint64_t a1)
{
  unint64_t v2 = sub_1D7654FFC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1D765493C(uint64_t a1)
{
  unint64_t v2 = sub_1D7654FB0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D7654978(uint64_t a1)
{
  unint64_t v2 = sub_1D7654FB0();
  return MEMORY[0x1F41862B0](a1, v2);
}

void CodableDeviceInitiatedPairingBeaconingSessionEvent.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v39 = v0;
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAE8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_10_12(v7, v31);
  sub_1D7660170();
  OUTLINED_FUNCTION_0_5();
  uint64_t v35 = v9;
  uint64_t v36 = v8;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  uint64_t v34 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAF0);
  OUTLINED_FUNCTION_0_5();
  uint64_t v32 = v12;
  uint64_t v33 = v11;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CAF8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_14();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB00);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_1_7();
  uint64_t v19 = v18 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB08);
  OUTLINED_FUNCTION_0_5();
  uint64_t v37 = v20;
  uint64_t v38 = v21;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_30();
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  sub_1D7654EB4();
  sub_1D76617C0();
  sub_1D7654F00(v39, v19);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(void))(v35 + 32))();
      sub_1D7654F64();
      OUTLINED_FUNCTION_8_17();
      sub_1D7655834(&qword_1EA82CB20);
      sub_1D7661490();
      OUTLINED_FUNCTION_19_11();
      OUTLINED_FUNCTION_6();
      v23();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
      uint64_t v24 = OUTLINED_FUNCTION_18_11();
      v26(v24, v25);
      break;
    case 2u:
      sub_1D7655048();
      OUTLINED_FUNCTION_8_17();
      uint64_t v27 = OUTLINED_FUNCTION_19_11();
      uint64_t v29 = v14;
      goto LABEL_9;
    case 3u:
      sub_1D7654FB0();
      OUTLINED_FUNCTION_8_17();
      uint64_t v29 = v33;
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      uint64_t v27 = v3;
LABEL_9:
      v28(v27, v29);
      OUTLINED_FUNCTION_18_11();
      OUTLINED_FUNCTION_6();
      v30();
      break;
    default:
      sub_1D7654FFC();
      sub_1D76613F0();
      sub_1D7661450();
      swift_bridgeObjectRelease();
      if (!v1) {
        sub_1D7661400();
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6();
      v22();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v2, v37);
      break;
  }
  OUTLINED_FUNCTION_4_0();
}

uint64_t type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent()
{
  uint64_t result = qword_1EA82CB70;
  if (!qword_1EA82CB70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1D7654EB4()
{
  unint64_t result = qword_1EA82CB10;
  if (!qword_1EA82CB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB10);
  }
  return result;
}

uint64_t sub_1D7654F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1D7654F64()
{
  unint64_t result = qword_1EA82CB18;
  if (!qword_1EA82CB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB18);
  }
  return result;
}

unint64_t sub_1D7654FB0()
{
  unint64_t result = qword_1EA82CB28;
  if (!qword_1EA82CB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB28);
  }
  return result;
}

unint64_t sub_1D7654FFC()
{
  unint64_t result = qword_1EA82CB30;
  if (!qword_1EA82CB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB30);
  }
  return result;
}

unint64_t sub_1D7655048()
{
  unint64_t result = qword_1EA82CB38;
  if (!qword_1EA82CB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB38);
  }
  return result;
}

void CodableDeviceInitiatedPairingBeaconingSessionEvent.init(from:)()
{
  OUTLINED_FUNCTION_3();
  uint64_t v92 = v0;
  uint64_t v2 = v1;
  uint64_t v85 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB40);
  OUTLINED_FUNCTION_0_5();
  uint64_t v83 = v5;
  uint64_t v84 = v4;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_14();
  uint64_t v87 = v6;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB48);
  OUTLINED_FUNCTION_0_5();
  uint64_t v80 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  uint64_t v86 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB50);
  OUTLINED_FUNCTION_0_5();
  uint64_t v81 = v11;
  uint64_t v82 = v10;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_14();
  uint64_t v90 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB58);
  OUTLINED_FUNCTION_0_5();
  uint64_t v78 = v14;
  uint64_t v79 = v13;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_10_12(v15, v71);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CB60);
  OUTLINED_FUNCTION_0_5();
  uint64_t v89 = v17;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_1_7();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  OUTLINED_FUNCTION_2_2();
  uint64_t v24 = MEMORY[0x1F4188790](v23);
  uint64_t v26 = (char *)&v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x1F4188790](v24);
  uint64_t v29 = (uint64_t *)((char *)&v71 - v28);
  MEMORY[0x1F4188790](v27);
  uint64_t v31 = (char *)&v71 - v30;
  uint64_t v32 = v2[3];
  unint64_t v91 = v2;
  __swift_project_boxed_opaque_existential_0Tm(v2, v32);
  sub_1D7654EB4();
  uint64_t v33 = v92;
  sub_1D76617A0();
  if (v33) {
    goto LABEL_15;
  }
  unint64_t v73 = v29;
  uint64_t v74 = v26;
  uint64_t v75 = v31;
  uint64_t v92 = v22;
  uint64_t v34 = sub_1D76613D0();
  uint64_t v35 = *(void *)(v34 + 16);
  if (!v35)
  {
    uint64_t v42 = v92;
LABEL_8:
    uint64_t v49 = sub_1D7661150();
    swift_allocError();
    uint64_t v51 = v50;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82B490);
    *uint64_t v51 = v42;
    sub_1D76612E0();
    sub_1D7661140();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v49 - 8) + 104))(v51, *MEMORY[0x1E4FBBA70], v49);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_6();
    v52();
LABEL_15:
    uint64_t v57 = (uint64_t)v91;
    goto LABEL_16;
  }
  uint64_t v76 = v16;
  uint64_t v77 = v21;
  uint64_t v72 = 0;
  uint64_t v36 = *(unsigned __int8 *)(v34 + 32);
  sub_1D75AB7D8(1, v35, v34, v34 + 32, 0, (2 * v35) | 1);
  uint64_t v38 = v37;
  unint64_t v40 = v39;
  swift_bridgeObjectRelease();
  BOOL v41 = v38 == v40 >> 1;
  uint64_t v42 = v92;
  if (!v41) {
    goto LABEL_8;
  }
  uint64_t v43 = v76;
  uint64_t v44 = v89;
  switch(v36)
  {
    case 1:
      sub_1D7654FFC();
      OUTLINED_FUNCTION_2_19();
      uint64_t v53 = sub_1D7661340();
      uint64_t v60 = v59;
      uint64_t v88 = v53;
      uint64_t v61 = sub_1D76612F0();
      uint64_t v72 = 0;
      uint64_t v63 = v61;
      uint64_t v65 = v64;
      uint64_t v66 = OUTLINED_FUNCTION_17_14();
      v67(v66);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_116_0();
      v68();
      uint64_t v69 = v73;
      *unint64_t v73 = v88;
      v69[1] = v60;
      v69[2] = v63;
      v69[3] = v65;
      swift_storeEnumTagMultiPayload();
      uint64_t v48 = (uint64_t)v75;
      sub_1D7655878((uint64_t)v69, (uint64_t)v75);
      uint64_t v70 = (uint64_t)v91;
      goto LABEL_13;
    case 2:
      sub_1D7654FB0();
      OUTLINED_FUNCTION_2_19();
      OUTLINED_FUNCTION_19_11();
      OUTLINED_FUNCTION_6();
      v54();
      swift_unknownObjectRelease();
      uint64_t v55 = OUTLINED_FUNCTION_16_11();
      v56(v55);
      uint64_t v48 = (uint64_t)v75;
      goto LABEL_11;
    case 3:
      sub_1D7654F64();
      OUTLINED_FUNCTION_2_19();
      sub_1D7660170();
      sub_1D7655834(&qword_1EA82CB68);
      uint64_t v58 = (uint64_t)v74;
      sub_1D7661380();
      OUTLINED_FUNCTION_6();
      v62();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v77, v43);
      swift_storeEnumTagMultiPayload();
      uint64_t v48 = (uint64_t)v75;
      sub_1D7655878(v58, (uint64_t)v75);
      goto LABEL_12;
    default:
      sub_1D7655048();
      OUTLINED_FUNCTION_2_19();
      OUTLINED_FUNCTION_6();
      v45();
      swift_unknownObjectRelease();
      uint64_t v46 = OUTLINED_FUNCTION_16_11();
      v47(v46);
      uint64_t v48 = (uint64_t)v75;
LABEL_11:
      swift_storeEnumTagMultiPayload();
LABEL_12:
      uint64_t v70 = (uint64_t)v91;
LABEL_13:
      sub_1D7655878(v48, v85);
      uint64_t v57 = v70;
      break;
  }
LABEL_16:
  __swift_destroy_boxed_opaque_existential_0Tm(v57);
  OUTLINED_FUNCTION_4_0();
}

void sub_1D7655804()
{
}

void sub_1D765581C()
{
}

uint64_t sub_1D7655834(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1D7660170();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D7655878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D76558DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D7655934(a1, a2, a3, (uint64_t (*)(void))sub_1D75ABA70, (uint64_t (*)(void))sub_1D75ABABC);
}

uint64_t sub_1D7655908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D7655934(a1, a2, a3, (uint64_t (*)(void))sub_1D75AB9D8, (uint64_t (*)(void))sub_1D75ABA24);
}

uint64_t sub_1D7655934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

id sub_1D7655974(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0x3Fu) {
    return result;
  }
  return result;
}

void destroy for PairingOutcome(uint64_t a1)
{
}

uint64_t _s19RemotePairingDevice14PairingOutcomeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1D7655974(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PairingOutcome(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1D7655974(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1D75B23B8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for PairingOutcome(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1D75B23B8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PairingOutcome(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >> 1 >= 0xFFF && *(unsigned char *)(a1 + 17))
    {
      unsigned int v2 = *(_DWORD *)a1 + 8189;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 16) >> 6) | (4
                                                  * ((*(void *)a1 >> 58) & 0x3C | (*(void *)a1 >> 1) & 3 | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F) << 6)))) ^ 0x1FFF;
      if (v2 >= 0x1FFD) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PairingOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >> 1 > 0xFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 8190;
    *(void *)(result + 8) = 0;
    if (a3 >> 1 >= 0xFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >> 1 >= 0xFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x7FF | ((-a2 & 0x1FFF) << 11);
      *(void *)uint64_t result = ((v3 << 58) | (2 * v3)) & 0xF000000000000007;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = (v3 >> 5) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_1D7655B64(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return ((*(void *)a1 >> 2) & 0xFFFFFFFE | *(void *)a1 & 1) + 2;
  }
}

uint64_t sub_1D7655B8C(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_1D7655B9C(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    char v2 = *(unsigned char *)(result + 16) & 1 | ((_BYTE)a2 << 6);
    *(void *)result &= 0xFFFFFFFFFFFFFF9uLL;
    *(unsigned char *)(result + 16) = v2;
  }
  else
  {
    *(void *)uint64_t result = (a2 - 2) & 1 | (8 * ((a2 - 2) >> 1));
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0x80;
  }
  return result;
}

void type metadata accessor for PairingOutcome()
{
}

void type metadata accessor for AttemptPairingPinCommand()
{
}

uint64_t getEnumTagSinglePayload for PairingChallengeEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[17])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairingChallengeEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
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
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for PairingChallengeEvent()
{
}

void type metadata accessor for CancelPairingCommand()
{
}

id sub_1D7655CA4(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    return result;
  }
  else if (!a5)
  {
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void destroy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1)
{
}

void sub_1D7655D18(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
  }
  else if (!a5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1D7655CA4(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1D7655CA4(*(id *)a2, v4, v5, v6, v7);
  unsigned __int8 v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1D7655D18(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_1D7655D18(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 2) {
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

uint64_t storeEnumTagSinglePayload for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1D7655F24(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1D7655F3C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

void type metadata accessor for DeviceInitiatedPairingBeaconingSessionEvent()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for CodableDeviceInitiatedPairingBeaconingSessionEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = sub_1D7660170();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(v6 + 64));
        return a1;
      }
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = a2[2];
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CodableDeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_1D7660170();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (!result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for CodableDeviceInitiatedPairingBeaconingSessionEvent(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = sub_1D7660170();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[2];
    uint64_t v9 = a2[3];
    a1[2] = v8;
    a1[3] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for CodableDeviceInitiatedPairingBeaconingSessionEvent(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1D7656328((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_1D7660170();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1D7656328(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for CodableDeviceInitiatedPairingBeaconingSessionEvent(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1D7660170();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for CodableDeviceInitiatedPairingBeaconingSessionEvent(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1D7656328((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1D7660170();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1D7656504()
{
  uint64_t result = sub_1D7660170();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1D7656664);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys;
}

ValueMetadata *type metadata accessor for CancelPairingCommand.CodingKeys()
{
  return &type metadata for CancelPairingCommand.CodingKeys;
}

unsigned char *_s19RemotePairingDevice50CodableDeviceInitiatedPairingBeaconingSessionEventO14ShowCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1D76567C0);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PairingChallengeEvent.CodingKeys()
{
  return &type metadata for PairingChallengeEvent.CodingKeys;
}

unsigned char *_s19RemotePairingDevice50CodableDeviceInitiatedPairingBeaconingSessionEventO17FailureCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D7656894);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttemptPairingPinCommand.CodingKeys()
{
  return &type metadata for AttemptPairingPinCommand.CodingKeys;
}

unint64_t sub_1D76568D0()
{
  unint64_t result = qword_1EA82CB80;
  if (!qword_1EA82CB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB80);
  }
  return result;
}

unint64_t sub_1D7656920()
{
  unint64_t result = qword_1EA82CB88;
  if (!qword_1EA82CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB88);
  }
  return result;
}

unint64_t sub_1D7656970()
{
  unint64_t result = qword_1EA82CB90;
  if (!qword_1EA82CB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB90);
  }
  return result;
}

unint64_t sub_1D76569C0()
{
  unint64_t result = qword_1EA82CB98;
  if (!qword_1EA82CB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CB98);
  }
  return result;
}

unint64_t sub_1D7656A10()
{
  unint64_t result = qword_1EA82CBA0;
  if (!qword_1EA82CBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBA0);
  }
  return result;
}

unint64_t sub_1D7656A60()
{
  unint64_t result = qword_1EA82CBA8;
  if (!qword_1EA82CBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBA8);
  }
  return result;
}

unint64_t sub_1D7656AB0()
{
  unint64_t result = qword_1EA82CBB0;
  if (!qword_1EA82CBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBB0);
  }
  return result;
}

unint64_t sub_1D7656B00()
{
  unint64_t result = qword_1EA82CBB8;
  if (!qword_1EA82CBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBB8);
  }
  return result;
}

unint64_t sub_1D7656B50()
{
  unint64_t result = qword_1EA82CBC0;
  if (!qword_1EA82CBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBC0);
  }
  return result;
}

unint64_t sub_1D7656BA0()
{
  unint64_t result = qword_1EA82CBC8;
  if (!qword_1EA82CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBC8);
  }
  return result;
}

unint64_t sub_1D7656BF0()
{
  unint64_t result = qword_1EA82CBD0;
  if (!qword_1EA82CBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBD0);
  }
  return result;
}

unint64_t sub_1D7656C40()
{
  unint64_t result = qword_1EA82CBD8;
  if (!qword_1EA82CBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBD8);
  }
  return result;
}

unint64_t sub_1D7656C90()
{
  unint64_t result = qword_1EA82CBE0;
  if (!qword_1EA82CBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBE0);
  }
  return result;
}

unint64_t sub_1D7656CE0()
{
  unint64_t result = qword_1EA82CBE8;
  if (!qword_1EA82CBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBE8);
  }
  return result;
}

unint64_t sub_1D7656D30()
{
  unint64_t result = qword_1EA82CBF0;
  if (!qword_1EA82CBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBF0);
  }
  return result;
}

unint64_t sub_1D7656D80()
{
  unint64_t result = qword_1EA82CBF8;
  if (!qword_1EA82CBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CBF8);
  }
  return result;
}

unint64_t sub_1D7656DD0()
{
  unint64_t result = qword_1EA82CC00;
  if (!qword_1EA82CC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CC00);
  }
  return result;
}

unint64_t sub_1D7656E20()
{
  unint64_t result = qword_1EA82CC08;
  if (!qword_1EA82CC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CC08);
  }
  return result;
}

unint64_t sub_1D7656E70()
{
  unint64_t result = qword_1EA82CC10;
  if (!qword_1EA82CC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CC10);
  }
  return result;
}

unint64_t sub_1D7656EC0()
{
  unint64_t result = qword_1EA82CC18;
  if (!qword_1EA82CC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CC18);
  }
  return result;
}

unint64_t sub_1D7656F10()
{
  unint64_t result = qword_1EA82CC20;
  if (!qword_1EA82CC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CC20);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_17_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20_9()
{
  return v0;
}

uint64_t sub_1D7656FA8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1D7656FE0(const void *a1, void *a2, void (*a3)(void *), uint64_t a4, uint64_t a5)
{
}

void JSONDataBasedControlChannelTransport.send(message:invokingCompletionHandlerOn:completion:)(const void *a1, void *a2, void (*a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1D765FCB0();
  swift_allocObject();
  sub_1D765FCA0();
  memcpy(__dst, a1, 0x92uLL);
  sub_1D7607018();
  uint64_t v12 = sub_1D765FC90();
  unint64_t v14 = v13;
  swift_release();
  sub_1D75934F4(v12, v14);
  if (sub_1D765FF00() >= 0x10000)
  {
    __dst[0] = 0;
    __dst[1] = 0xE000000000000000;
    sub_1D7661100();
    swift_bridgeObjectRelease();
    __dst[0] = 0xD000000000000026;
    __dst[1] = 0x80000001D76778D0;
    uint64_t v15 = sub_1D765FF00();
    OUTLINED_FUNCTION_47();
    uint64_t v29 = v15;
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7660BC0();
    __dst[3] = MEMORY[0x1E4FBB1A0];
    LOBYTE(__dst[4]) = 1;
    sub_1D7592D84();
    uint64_t v16 = (void *)swift_allocError();
    uint64_t v18 = v17;
    LOBYTE(v29) = 3;
    Swift::String v19 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)&v29);
    sub_1D7592DD0((uint64_t)__dst);
    *(unsigned char *)uint64_t v18 = 3;
    *(Swift::String *)(v18 + 8) = v19;
    *(_OWORD *)(v18 + 24) = 0u;
    *(_OWORD *)(v18 + 40) = 0u;
    *(void *)(v18 + 56) = 0;
    a3(v16);
    OUTLINED_FUNCTION_47();

    return;
  }
  if (qword_1EBDEBD18 != -1) {
    swift_once();
  }
  __dst[0] = qword_1EBDF39C8;
  __dst[1] = unk_1EBDF39D0;
  sub_1D75934F4(qword_1EBDF39C8, unk_1EBDF39D0);
  unint64_t v20 = sub_1D765FF00();
  if ((v20 & 0x8000000000000000) == 0 && v20 < 0x10000)
  {
    sub_1D762E1A0(bswap32(v20) >> 16);
    uint64_t v21 = sub_1D765FF00();
    if (qword_1EBDEBD10 != -1) {
      swift_once();
    }
    uint64_t v28 = a5;
    if (v21 == qword_1EBDF39C0)
    {
      sub_1D765FF10();
      OUTLINED_FUNCTION_47();
      uint64_t v22 = __dst[0];
      unint64_t v23 = __dst[1];
      uint64_t v24 = (void *)swift_allocObject();
      v24[2] = a2;
      v24[3] = a3;
      v24[4] = a4;
      uint64_t v25 = a2;
      uint64_t v26 = *(void (**)(uint64_t, unint64_t, uint64_t (*)(void *), void *, uint64_t, uint64_t))(a6 + 24);
      sub_1D75934F4(v22, v23);
      id v27 = v25;
      swift_retain();
      v26(v22, v23, sub_1D7657C18, v24, v28, a6);
      OUTLINED_FUNCTION_47();
      swift_release();
      sub_1D75933F0(v22, v23);
      sub_1D75933F0(v22, v23);
      return;
    }
    __break(1u);
  }
  OUTLINED_FUNCTION_0_1();
  sub_1D7661250();
  __break(1u);
}

void sub_1D7657424(const void *a1, void *a2, void (*a3)(void *), uint64_t a4, uint64_t a5)
{
}

uint64_t sub_1D7657450()
{
  sub_1D75D5108();
  uint64_t result = sub_1D7660FE0();
  qword_1EBDEBCC0 = result;
  return result;
}

uint64_t sub_1D76574B8()
{
  if (qword_1EBDEBD18 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v0 = 0;
  switch(unk_1EBDF39D0 >> 62)
  {
    case 1:
      LODWORD(v0) = HIDWORD(qword_1EBDF39C8) - qword_1EBDF39C8;
      if (__OFSUB__(HIDWORD(qword_1EBDF39C8), qword_1EBDF39C8)) {
        goto LABEL_11;
      }
      uint64_t v0 = (int)v0;
LABEL_8:
      BOOL v3 = __OFADD__(v0, 2);
      uint64_t v4 = v0 + 2;
      if (v3)
      {
        __break(1u);
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x1D7657574);
      }
      qword_1EBDF39C0 = v4;
      return result;
    case 2:
      uint64_t v2 = *(void *)(qword_1EBDF39C8 + 16);
      uint64_t v1 = *(void *)(qword_1EBDF39C8 + 24);
      BOOL v3 = __OFSUB__(v1, v2);
      uint64_t v0 = v1 - v2;
      if (!v3) {
        goto LABEL_8;
      }
      goto LABEL_12;
    case 3:
      goto LABEL_8;
    default:
      uint64_t v0 = unk_1EBDF39D6;
      goto LABEL_8;
  }
}

uint64_t sub_1D7657584()
{
  uint64_t v0 = sub_1D7660B50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  BOOL v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7660B40();
  uint64_t v4 = sub_1D7660B20();
  unint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_1EBDF39C8 = v4;
    unk_1EBDF39D0 = v6;
  }
  return result;
}

uint64_t sub_1D7657694(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = a1;
  aBlock[4] = sub_1D75AEEA8;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D75D6460;
  aBlock[3] = &block_descriptor_13;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_1D7660950();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  id v13 = a1;
  sub_1D7660930();
  uint64_t v14 = sub_1D7660910();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = MEMORY[0x1E4FBC860];
  sub_1D75AEEF0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
  sub_1D75ABCA4();
  sub_1D7661090();
  MEMORY[0x1D9473560](0, v12, v17, v8);
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

void sub_1D7657930(void *a1, unint64_t a2, char a3, void (*a4)(char *))
{
  if (a3)
  {
    v28[0] = a1;
    sub_1D7608488((uint64_t)v28);
    sub_1D7608494((uint64_t)v28, (uint64_t)v27);
    id v7 = a1;
    uint64_t v15 = OUTLINED_FUNCTION_0_19((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14, v25, __dst[0], __dst[1], __dst[2], __dst[3], __dst[4], __dst[5], __dst[6], __dst[7], __dst[8], __dst[9],
            __dst[10],
            __dst[11],
            __dst[12],
            __dst[13],
            __dst[14],
            __dst[15],
            __dst[16],
            __dst[17],
            __dst[18],
            v27[0]);
    a4(v15);
    sub_1D75D9140(a1, a2, 1);
  }
  else
  {
    sub_1D765FC80();
    swift_allocObject();
    sub_1D75934F4((uint64_t)a1, a2);
    sub_1D765FC70();
    sub_1D7606FCC();
    sub_1D765FC60();
    memcpy(__dst, __src, 0x92uLL);
    memcpy(v28, __src, 0x92uLL);
    sub_1D7657C4C((uint64_t)v28);
    sub_1D7608494((uint64_t)v28, (uint64_t)v27);
    uint64_t v16 = sub_1D7657C54((uint64_t)__dst, (uint64_t (*)(void))sub_1D75934F4, (uint64_t (*)(void))sub_1D75D4704, (uint64_t (*)(void))sub_1D75D480C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D40B4);
    uint64_t v24 = OUTLINED_FUNCTION_0_19(v16, v17, v18, v19, v20, v21, v22, v23, v25, __dst[0], __dst[1], __dst[2], __dst[3], __dst[4], __dst[5], __dst[6], __dst[7], __dst[8], __dst[9],
            __dst[10],
            __dst[11],
            __dst[12],
            __dst[13],
            __dst[14],
            __dst[15],
            __dst[16],
            __dst[17],
            __dst[18],
            v27[0]);
    a4(v24);
    swift_release();
    sub_1D75D9140(a1, a2, 0);
    sub_1D7657C54((uint64_t)__dst, (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24, (uint64_t (*)(void))sub_1D75D1FE8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
    sub_1D7657C54((uint64_t)__dst, (uint64_t (*)(void))sub_1D75933F0, (uint64_t (*)(void))sub_1D75D3F24, (uint64_t (*)(void))sub_1D75D1FE8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D75D4328);
  }
}

uint64_t sub_1D7657B98()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D7657BD8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1D7657C18(void *a1)
{
  return sub_1D7657694(a1, v1[2], v1[3], v1[4]);
}

uint64_t dispatch thunk of JSONDataBasedControlChannelTransport.receive(minLength:maxLength:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of JSONDataBasedControlChannelTransport.send(content:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t sub_1D7657C4C(uint64_t result)
{
  *(unsigned char *)(result + 146) = 0;
  return result;
}

uint64_t sub_1D7657C54(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_1D7607558(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(_WORD *)(a1 + 144), a2, a3,
    a4,
    a5);
  return a1;
}

uint64_t sub_1D7657CD0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_1D7657D28()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D7657D68()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D7657DA0(uint64_t a1)
{
  return sub_1D7657E14(a1);
}

uint64_t sub_1D7657DAC(uint64_t a1)
{
  sub_1D75908F0(a1, (uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC4D0);
  if (swift_dynamicCast()) {
    return v2[4];
  }
  else {
    return 0;
  }
}

uint64_t sub_1D7657E08(uint64_t a1)
{
  return sub_1D7657E14(a1);
}

uint64_t sub_1D7657E14(uint64_t a1)
{
  sub_1D75908F0(a1, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC4D0);
  int v1 = swift_dynamicCast();
  uint64_t v2 = v4[4];
  if (!v1) {
    return 0;
  }
  return v2;
}

double sub_1D7657E7C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1D75908F0(a1, (uint64_t)&v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC4D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    double result = 0.0;
    *a2 = xmmword_1D76655F0;
  }
  return result;
}

uint64_t sub_1D7657EE4(unsigned int a1, int a2)
{
  return a2 & a1;
}

uint64_t sub_1D7657EEC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1D7657EF8(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_1D7657F08(uint64_t result)
{
  *v1 &= result;
  return result;
}

BOOL sub_1D7657F18(char a1, unsigned __int8 a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1D7657F28(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1D7657F34(unsigned __int8 a1, char a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1D7657F44(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

unint64_t sub_1D7657F50(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t v8 = sub_1D75FEF90(a1, a2, 10);
    char v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      id v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      id v7 = (unsigned __int8 *)sub_1D7661160();
    }
    unint64_t v8 = (unint64_t)sub_1D75FEC38(v7, v5);
    char v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4) {
      goto LABEL_52;
    }
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (BYTE1(a1) - 48);
    uint64_t v15 = v4 - 2;
    if (v15)
    {
      uint64_t v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        unsigned int v17 = *v16 - 48;
        if (v17 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v17);
        unint64_t v8 = 10 * v8 + v17;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v16;
        if (!--v15) {
          goto LABEL_39;
        }
      }
    }
LABEL_38:
    char v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u) {
      goto LABEL_36;
    }
    unint64_t v8 = (a1 - 48);
    uint64_t v18 = v4 - 1;
    if (v18)
    {
      uint64_t v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        unsigned int v21 = *v20 - 48;
        if (v21 > 9) {
          goto LABEL_36;
        }
        if (!is_mul_ok(v8, 0xAuLL)) {
          goto LABEL_36;
        }
        BOOL v14 = __CFADD__(10 * v8, v21);
        unint64_t v8 = 10 * v8 + v21;
        if (v14) {
          goto LABEL_36;
        }
        char v10 = 0;
        ++v20;
        if (!--v18) {
          goto LABEL_39;
        }
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      unint64_t v2 = 0;
      unint64_t v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        uint64_t v11 = v4 - 2;
        if (v11)
        {
          uint64_t v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            unsigned int v13 = *v12 - 48;
            if (v13 > 9) {
              goto LABEL_36;
            }
            if (!is_mul_ok(v8, 0xAuLL)) {
              goto LABEL_36;
            }
            BOOL v14 = 10 * v8 >= v13;
            unint64_t v8 = 10 * v8 - v13;
            if (!v14) {
              goto LABEL_36;
            }
            char v10 = 0;
            ++v12;
            if (!--v11) {
              goto LABEL_39;
            }
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    unint64_t v8 = 0;
    char v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  char v10 = 1;
  unint64_t v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if (v10) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t sub_1D76581B0@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  char v9 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_1_7();
  uint64_t v199 = v12 - v11;
  int v198 = *a2;
  uint64_t v200 = sub_1D76604C0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_10_13();
  uint64_t v201 = v16 - v17;
  uint64_t v18 = sub_1D76608A0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_8();
  sub_1D76608C0();
  int v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 88))(v4, v18);
  if (!MEMORY[0x1E4F38B88] || v22 != *MEMORY[0x1E4F38B88])
  {
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v4, v18);
    sub_1D7660DB0();
    if (qword_1EA82AAD0 != -1) {
      swift_once();
    }
    sub_1D7660010();

    sub_1D76608D0();
    OUTLINED_FUNCTION_2_2();
    (*(void (**)(uint64_t))(v30 + 8))(a1);
    goto LABEL_8;
  }
  uint64_t v189 = a4;
  id v197 = a3;
  (*(void (**)(uint64_t, uint64_t))(v20 + 96))(v4, v18);
  uint64_t v23 = v200;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v201, v4, v200);
  OUTLINED_FUNCTION_9_1();
  uint64_t v196 = (void (*)(uint64_t, unint64_t, uint64_t))sub_1D76604D0();
  unint64_t v25 = v24;
  v188 = v170;
  MEMORY[0x1F4188790](v196);
  OUTLINED_FUNCTION_10_13();
  uint64_t v28 = v26 - v27;
  uint64_t v29 = *(void (**)(void))(v14 + 16);
  OUTLINED_FUNCTION_15_14();
  v29();
  if (v25)
  {
    uint64_t v190 = v14;
    uint64_t v192 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v192(v28, v23);
  }
  else
  {
    uint64_t v35 = sub_1D76604B0();
    uint64_t v36 = OUTLINED_FUNCTION_9_1();
    uint64_t v196 = (void (*)(uint64_t, unint64_t, uint64_t))sub_1D75B5464(v36, v37, v35);
    unint64_t v25 = v38;
    uint64_t v39 = v200;
    swift_bridgeObjectRelease();
    uint64_t v192 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v192(v28, v39);
    if (!v25)
    {
      id v76 = v197;
LABEL_31:
      sub_1D7660DB0();
      a4 = v189;
      if (qword_1EA82AAD0 != -1) {
        swift_once();
      }
      sub_1D7660010();

      sub_1D76608D0();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_6();
      v77();
      OUTLINED_FUNCTION_3_20();
      v78();
      goto LABEL_8;
    }
    uint64_t v190 = v14;
  }
  OUTLINED_FUNCTION_12_12();
  uint64_t v40 = sub_1D76604D0();
  uint64_t v42 = v41;
  v180 = v170;
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_15_14();
  v29();
  if (v42)
  {
    uint64_t v195 = v40;
    OUTLINED_FUNCTION_3_20();
    v43();
    goto LABEL_16;
  }
  uint64_t v44 = sub_1D76604B0();
  uint64_t v45 = OUTLINED_FUNCTION_12_12();
  uint64_t v47 = sub_1D75B5464(v45, v46, v44);
  uint64_t v49 = v48;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_20();
  v50();
  if (!v49)
  {
    swift_bridgeObjectRelease();
    id v76 = v197;
    goto LABEL_31;
  }
  uint64_t v195 = v47;
LABEL_16:
  uint64_t v51 = sub_1D765FFD0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v53 = v52;
  MEMORY[0x1F4188790](v54);
  OUTLINED_FUNCTION_1_7();
  uint64_t v57 = v56 - v55;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC0B0);
  MEMORY[0x1F4188790](v58 - 8);
  OUTLINED_FUNCTION_1_7();
  uint64_t v61 = v60 - v59;
  sub_1D765FF80();
  if (__swift_getEnumTagSinglePayload(v61, 1, v51) == 1)
  {
    swift_bridgeObjectRelease();
    sub_1D75940B4(v61, &qword_1EBDEC0B0);
    OUTLINED_FUNCTION_6_13();
    os_log_type_t v62 = sub_1D7660DB0();
    if (qword_1EA82AAD0 != -1) {
      swift_once();
    }
    uint64_t v63 = qword_1EA82CC28;
    os_log_type_t v64 = v62;
    if (os_log_type_enabled((os_log_t)qword_1EA82CC28, v62))
    {
      swift_bridgeObjectRetain();
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      *(void *)&v204[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v202 = sub_1D758DBE8((uint64_t)v196, v25, (uint64_t *)v204);
      sub_1D7661020();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D757C000, v63, v64, "Unable to turn identifier %{public}s into UUID object", v65, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    sub_1D76608D0();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_6();
    v72();
    OUTLINED_FUNCTION_3_20();
    v73();
    a4 = v189;
LABEL_8:
    uint64_t v31 = a4;
    uint64_t v32 = 1;
    uint64_t v33 = (uint64_t)v9;
    return __swift_storeEnumTagSinglePayload(v31, v32, 1, v33);
  }
  v179 = v170;
  swift_bridgeObjectRelease();
  uint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32);
  uint64_t v178 = v51;
  id v177 = v66;
  v66(v57, v61, v51);
  uint64_t v67 = sub_1D765FE10();
  unint64_t v69 = v68;
  swift_bridgeObjectRelease();
  if (v69 >> 60 == 15)
  {
    sub_1D7660DB0();
    a4 = v189;
    if (qword_1EA82AAD0 != -1) {
      swift_once();
    }
    sub_1D7660010();

    sub_1D76608D0();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_6();
    v70();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v57, v178);
    OUTLINED_FUNCTION_3_20();
    v71();
    OUTLINED_FUNCTION_6_13();
    goto LABEL_8;
  }
  unint64_t v171 = v69;
  uint64_t v172 = v67;
  uint64_t v173 = v53 + 32;
  uint64_t v174 = v57;
  sub_1D76604D0();
  if (v74)
  {
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    uint64_t v75 = OUTLINED_FUNCTION_17_15();
  }
  else
  {
    uint64_t v75 = 0;
  }
  id v79 = v197;
  uint64_t v80 = v199;
  *(void *)(v199 + v9[8]) = v75;
  sub_1D76604D0();
  if (v81)
  {
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    uint64_t v82 = OUTLINED_FUNCTION_17_15();
  }
  else
  {
    uint64_t v82 = 0;
  }
  *(void *)(v80 + v9[9]) = v82;
  uint64_t v83 = sub_1D76604D0();
  if (v84)
  {
    unint64_t v85 = sub_1D7657F50(v83, v84);
    if (v86) {
      unint64_t v87 = 0;
    }
    else {
      unint64_t v87 = v85;
    }
  }
  else
  {
    unint64_t v87 = 0;
  }
  *(void *)(v80 + v9[12]) = v87;
  uint64_t v88 = sub_1D76604D0();
  uint64_t v89 = (uint64_t *)(v80 + v9[11]);
  *uint64_t v89 = v88;
  v89[1] = v90;
  uint64_t v91 = sub_1D76604D0();
  uint64_t v176 = v9;
  uint64_t v92 = (uint64_t *)(v80 + v9[10]);
  uint64_t *v92 = v91;
  v92[1] = v93;
  uint64_t v175 = a1;
  uint64_t v94 = sub_1D7660870();
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
  v170[0] = (uint64_t)v170;
  MEMORY[0x1F4188790](v95 - 8);
  OUTLINED_FUNCTION_1_7();
  uint64_t v98 = v97 - v96;
  uint64_t v99 = *(void *)(v94 + 16);
  v170[1] = v94;
  if (v99)
  {
    uint64_t v100 = sub_1D76604A0();
    OUTLINED_FUNCTION_0_5();
    uint64_t v102 = v101;
    unint64_t v185 = (*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80);
    unint64_t v103 = v94 + v185;
    uint64_t v183 = *(void *)(v104 + 72);
    uint64_t v106 = v104 + 16;
    unint64_t v105 = *(void (**)(uint64_t, unint64_t, uint64_t))(v104 + 16);
    uint64_t v195 = v106;
    uint64_t v196 = v105;
    uint64_t v187 = v102;
    uint64_t v182 = v102 + 8;
    uint64_t v107 = MEMORY[0x1E4FBC860];
    uint64_t v181 = MEMORY[0x1E4FBC860];
    uint64_t v186 = v98;
    uint64_t v184 = v102 + 32;
    while (1)
    {
      v196(v98, v103, v100);
      __swift_storeEnumTagSinglePayload(v98, 0, 1, v100);
      uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v98, 1, v100);
      if (EnumTagSinglePayload == 1) {
        goto LABEL_78;
      }
      v194 = v170;
      uint64_t v109 = *(void *)(v187 + 64);
      MEMORY[0x1F4188790](EnumTagSinglePayload);
      OUTLINED_FUNCTION_10_13();
      uint64_t v193 = *(void (**)(uint64_t, uint64_t, uint64_t))(v110 + 32);
      v193(v111 - v112, v98, v100);
      if (qword_1EA82A938 != -1) {
        swift_once();
      }
      swift_beginAccess();
      int v191 = byte_1EA82B189;
      uint64_t v113 = v107;
      if (byte_1EA82B188)
      {
        uint64_t v114 = qword_1EA82A9B0;
        swift_bridgeObjectRetain();
        uint64_t v115 = &qword_1EA82B320;
        if (v114 != -1)
        {
          swift_once();
          uint64_t v115 = &qword_1EA82B320;
        }
      }
      else
      {
        uint64_t v116 = qword_1EBDEAEC8;
        swift_bridgeObjectRetain();
        uint64_t v115 = &qword_1EBDEAEC0;
        if (v116 != -1)
        {
          swift_once();
          uint64_t v115 = &qword_1EBDEAEC0;
        }
      }
      id v117 = (id)*v115;
      uint64_t v118 = (void *)sub_1D7660AE0();
      id v119 = objc_msgSend(v117, sel_valueForKey_, v118);

      if (v119)
      {
        sub_1D7661070();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v204, 0, sizeof(v204));
      }
      uint64_t v107 = v113;
      sub_1D75908F0((uint64_t)v204, (uint64_t)&v202);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBDEC4D0);
      if (swift_dynamicCast()) {
        char v120 = v203;
      }
      else {
        char v120 = 2;
      }
      sub_1D75940B4((uint64_t)v204, &qword_1EBDEC4D0);
      uint64_t v121 = swift_bridgeObjectRelease();
      if (v120 == 2)
      {
        uint64_t v98 = v186;
        if (v191) {
          goto LABEL_69;
        }
      }
      else
      {
        uint64_t v98 = v186;
        if (v120) {
          goto LABEL_69;
        }
      }
      uint64_t v122 = sub_1D7660490();
      uint64_t v121 = InterfaceIndexCorrespondsToAppleNCMInterface(v122);
      if (v121)
      {
        uint64_t v123 = MEMORY[0x1F4188790](v121);
        long long v131 = OUTLINED_FUNCTION_4_16(v123, v124, v125, v126, v127, v128, v129, v130, v170[0]);
        v132(v131);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1D75D03CC();
          uint64_t v181 = v152;
        }
        unint64_t v134 = *(void *)(v181 + 16);
        unint64_t v133 = *(void *)(v181 + 24);
        if (v134 >= v133 >> 1)
        {
          OUTLINED_FUNCTION_13_10(v133);
          sub_1D75D03CC();
          uint64_t v181 = v153;
        }
        uint64_t v135 = v181;
        *(void *)(v181 + 16) = v134 + 1;
        uint64_t v136 = v135 + v185;
        goto LABEL_74;
      }
LABEL_69:
      uint64_t v137 = MEMORY[0x1F4188790](v121);
      unint64_t v145 = OUTLINED_FUNCTION_4_16(v137, v138, v139, v140, v141, v142, v143, v144, v170[0]);
      v146(v145);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1D75D03CC();
        uint64_t v107 = v150;
      }
      unint64_t v134 = *(void *)(v107 + 16);
      unint64_t v147 = *(void *)(v107 + 24);
      if (v134 >= v147 >> 1)
      {
        OUTLINED_FUNCTION_13_10(v147);
        sub_1D75D03CC();
        uint64_t v107 = v151;
      }
      *(void *)(v107 + 16) = v134 + 1;
      uint64_t v136 = v107 + v185;
LABEL_74:
      uint64_t v148 = v183;
      v193(v136 + v134 * v183, v109, v100);
      OUTLINED_FUNCTION_6();
      v149();
      v103 += v148;
      --v99;
      id v79 = v197;
      if (!v99) {
        goto LABEL_77;
      }
    }
  }
  uint64_t v107 = MEMORY[0x1E4FBC860];
  uint64_t v181 = MEMORY[0x1E4FBC860];
LABEL_77:
  uint64_t v154 = sub_1D76604A0();
  __swift_storeEnumTagSinglePayload(v98, 1, 1, v154);
LABEL_78:
  swift_bridgeObjectRelease();
  uint64_t v155 = sub_1D76603E0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v157 = v156;
  MEMORY[0x1F4188790](v158);
  OUTLINED_FUNCTION_1_7();
  uint64_t v161 = v160 - v159;
  sub_1D76608B0();
  sub_1D76608D0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_6();
  v162();
  OUTLINED_FUNCTION_3_20();
  v163();
  uint64_t v164 = v199;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 32))(v199, v161, v155);
  v165 = v176;
  *(unsigned char *)(v164 + v176[5]) = v198;
  v177(v164 + v165[6], v174, v178);
  uint64_t v166 = (uint64_t *)(v164 + v165[7]);
  uint64_t v167 = v171;
  *uint64_t v166 = v172;
  v166[1] = v167;
  *(void *)(v164 + v165[13]) = v107;
  *(void *)(v164 + v165[15]) = v181;
  *(void *)(v164 + v165[14]) = v79;
  OUTLINED_FUNCTION_6_13();
  uint64_t v168 = v164;
  uint64_t v169 = v189;
  sub_1D76533D4(v168, v189);
  uint64_t v31 = v169;
  uint64_t v32 = 0;
  uint64_t v33 = (uint64_t)v165;
  return __swift_storeEnumTagSinglePayload(v31, v32, 1, v33);
}

BOOL DiscoveredBonjourAdvert.isValid.getter()
{
  return *(void *)(*(void *)(v0 + *(int *)(type metadata accessor for DiscoveredBonjourAdvert() + 52)) + 16) != 0;
}

uint64_t type metadata accessor for DiscoveredBonjourAdvert()
{
  uint64_t result = qword_1EA82CC30;
  if (!qword_1EA82CC30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D7659340()
{
  sub_1D75D5108();
  uint64_t result = sub_1D7660FE0();
  qword_1EA82CC28 = result;
  return result;
}

uint64_t DiscoveredBonjourAdvert.endpoint.getter()
{
  sub_1D76603E0();
  OUTLINED_FUNCTION_2_2();
  uint64_t v0 = OUTLINED_FUNCTION_36();
  return v1(v0);
}

uint64_t DiscoveredBonjourAdvert.service.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for DiscoveredBonjourAdvert();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t DiscoveredBonjourAdvert.identifier.getter()
{
  type metadata accessor for DiscoveredBonjourAdvert();
  sub_1D765FFD0();
  OUTLINED_FUNCTION_2_2();
  uint64_t v0 = OUTLINED_FUNCTION_36();
  return v1(v0);
}

uint64_t DiscoveredBonjourAdvert.authTag.getter()
{
  type metadata accessor for DiscoveredBonjourAdvert();
  uint64_t v0 = OUTLINED_FUNCTION_36();
  sub_1D75934F4(v0, v1);
  return OUTLINED_FUNCTION_36();
}

void *DiscoveredBonjourAdvert.wireProtocolVersion.getter()
{
  unint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for DiscoveredBonjourAdvert() + 32));
  id v2 = v1;
  return v1;
}

void *DiscoveredBonjourAdvert.minimumSupportedWireProtocolVersion.getter()
{
  unint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for DiscoveredBonjourAdvert() + 36));
  id v2 = v1;
  return v1;
}

uint64_t DiscoveredBonjourAdvert.userAssignedName.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t DiscoveredBonjourAdvert.model.getter()
{
  return OUTLINED_FUNCTION_36();
}

uint64_t DiscoveredBonjourAdvert.flags.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for DiscoveredBonjourAdvert();
  *a1 = *(void *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t DiscoveredBonjourAdvert.validInterfaces.getter()
{
  type metadata accessor for DiscoveredBonjourAdvert();
  return swift_bridgeObjectRetain();
}

id DiscoveredBonjourAdvert.netLinkManager.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for DiscoveredBonjourAdvert() + 56));
  return v1;
}

uint64_t DiscoveredBonjourAdvert.prohibitedInterfaces.getter()
{
  type metadata accessor for DiscoveredBonjourAdvert();
  return swift_bridgeObjectRetain();
}

uint64_t DiscoveredBonjourAdvert.prohibitedInterfaces.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DiscoveredBonjourAdvert() + 60);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DiscoveredBonjourAdvert.prohibitedInterfaces.modify())(void)
{
  return nullsub_1;
}

void DiscoveredBonjourAdvert.createTransport(withTargetQueue:)(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_2_2();
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)v60 - v9;
  sub_1D76606F0();
  swift_allocObject();
  uint64_t v11 = sub_1D76606E0();
  int v12 = *(unsigned __int8 *)(v2 + *(int *)(v4 + 20));
  if (*(unsigned char *)(v2 + *(int *)(v4 + 20))) {
    BOOL v13 = v12 == 4;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v66 = (uint64_t *)a1;
  os_log_type_t v64 = v8;
  if (v13) {
    goto LABEL_6;
  }
  if (v12 != 1)
  {
    sub_1D764FDE4(v2, (uint64_t)v10);
    v74[0] = 0;
    v74[1] = 0xE000000000000000;
    sub_1D7661100();
    sub_1D7660BC0();
    LOBYTE(v73) = v10[*(int *)(v4 + 20)];
    sub_1D7661200();
    sub_1D7661260();
    __break(1u);
    return;
  }
  if (*(unsigned char *)(v2 + *(int *)(v4 + 48)))
  {
LABEL_6:
    sub_1D7660690();
    sub_1D76606A0();
    sub_1D76606B0();
    sub_1D76606C0();
    id v61 = 0;
  }
  else
  {
    id v61 = *(id *)(v2 + *(int *)(v4 + 56));
    id v34 = v61;
  }
  sub_1D76606D0();
  sub_1D7660680();
  swift_retain();
  uint64_t v65 = v11;
  uint64_t v14 = MEMORY[0x1D9472D20](0, v11);
  swift_bridgeObjectRetain();
  sub_1D7660640();
  uint64_t v67 = v14;
  sub_1D7660670();
  os_log_t v62 = (os_log_t)v4;
  uint64_t v63 = v2;
  uint64_t v15 = *(void *)(v2 + *(int *)(v4 + 52));
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82BC80);
  v60[1] = v60;
  MEMORY[0x1F4188790](v16 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v17 = *(void *)(v15 + 16);
  v60[2] = v15;
  if (v17)
  {
    uint64_t v18 = sub_1D76604A0();
    OUTLINED_FUNCTION_0_5();
    uint64_t v20 = v19;
    uint64_t v21 = v15 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
    unint64_t v68 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 72);
    unint64_t v24 = (void *)(v22 + 16);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
    id v70 = v24;
    uint64_t v71 = v23;
    uint64_t v69 = v20 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      v71(a1, v21, v18);
      __swift_storeEnumTagSinglePayload(a1, 0, 1, v18);
      uint64_t EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1, v18);
      if (EnumTagSinglePayload == 1) {
        break;
      }
      MEMORY[0x1F4188790](EnumTagSinglePayload);
      OUTLINED_FUNCTION_1_7();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v27 - v26, a1, v18);
      if (sub_1D7660470() == 0x306C647761 && v28 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = OUTLINED_FUNCTION_14_12();
        v36(v35);
LABEL_24:
        swift_bridgeObjectRelease();
        sub_1D7660620();
        goto LABEL_25;
      }
      char v30 = sub_1D7661560();
      swift_bridgeObjectRelease();
      uint64_t v31 = OUTLINED_FUNCTION_14_12();
      v32(v31);
      if (v30) {
        goto LABEL_24;
      }
      v21 += (uint64_t)v68;
      if (!--v17) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_18:
    uint64_t v33 = sub_1D76604A0();
    __swift_storeEnumTagSinglePayload(a1, 1, 1, v33);
  }
  swift_bridgeObjectRelease();
LABEL_25:
  uint64_t v37 = sub_1D76603E0();
  OUTLINED_FUNCTION_0_5();
  uint64_t v39 = v38;
  uint64_t v41 = *(void *)(v40 + 64);
  MEMORY[0x1F4188790](v42);
  uint64_t v43 = v63;
  unint64_t v68 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
  v68((char *)v60 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0), v63, v37);
  sub_1D7660610();
  swift_allocObject();
  swift_retain();
  uint64_t v44 = sub_1D7660570();
  v74[3] = (uint64_t)v62;
  v74[4] = (uint64_t)&protocol witness table for DiscoveredBonjourAdvert;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v74);
  sub_1D764FDE4(v43, (uint64_t)boxed_opaque_existential_0);
  uint64_t v69 = type metadata accessor for NWConnectionControlChannelTransport();
  swift_allocObject();
  id v46 = v61;
  id v70 = v61;
  uint64_t v47 = swift_retain();
  uint64_t v71 = (void (*)(uint64_t, uint64_t, uint64_t))v44;
  uint64_t v48 = NWConnectionControlChannelTransport.init(connection:endpoint:netLinkManager:)(v47, (uint64_t)v74, v46);
  sub_1D7602C68((uint64_t)sub_1D7659EFC, 0);
  os_log_type_t v49 = sub_1D7660DD0();
  uint64_t v50 = (uint64_t)v64;
  if (qword_1EA82AAD0 != -1) {
    swift_once();
  }
  uint64_t v51 = qword_1EA82CC28;
  sub_1D764FDE4(v43, v50);
  os_log_type_t v52 = v49;
  if (os_log_type_enabled(v51, v49))
  {
    swift_retain();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    uint64_t v73 = v63;
    *(_DWORD *)uint64_t v53 = 136446466;
    os_log_t v62 = v51;
    swift_beginAccess();
    uint64_t v54 = *(void *)(v48 + 16);
    unint64_t v55 = *(void *)(v48 + 24);
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_1D758DBE8(v54, v55, &v73);
    sub_1D7661020();
    swift_release();
    uint64_t v56 = swift_bridgeObjectRelease();
    *(_WORD *)(v53 + 12) = 2080;
    MEMORY[0x1F4188790](v56);
    v68((char *)v60 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0), v50, v37);
    uint64_t v57 = sub_1D7660B60();
    uint64_t v72 = sub_1D758DBE8(v57, v58, &v73);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    sub_1D7659FC8(v50);
    _os_log_impl(&dword_1D757C000, v62, v52, "Created control channel transport %{public}s from bonjour advert: %s", (uint8_t *)v53, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  else
  {
    sub_1D7659FC8(v50);
  }
  uint64_t v59 = v66;
  v66[3] = v69;
  v59[4] = (uint64_t)&protocol witness table for NWConnectionControlChannelTransport;
  swift_release();
  swift_release();
  swift_release();

  *uint64_t v59 = v48;
}

BOOL sub_1D7659EFC()
{
  if (qword_1EA82A938 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_1EA82B178;
  uint64_t v1 = unk_1EA82B180;
  if (byte_1EA82B189) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  __int16 v3 = v2 | byte_1EA82B188;
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_1D758C360(v0, v1, v3);
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = sub_1D7660490();
    return InterfaceIndexCorrespondsToAppleNCMInterface(v5);
  }
  return result;
}

uint64_t sub_1D7659FC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DiscoveredBonjourAdvert.endpointIdentifier.getter()
{
  BYTE8(v2) = 0;
  *(void *)&long long v2 = *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DiscoveredBonjourAdvert() + 20));
  sub_1D7661200();
  sub_1D7660BC0();
  sub_1D765FFD0();
  sub_1D765A114();
  sub_1D7661500();
  sub_1D7660BC0();
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v2 + 1);
}

void sub_1D765A0E4(uint64_t a1@<X8>)
{
}

unint64_t sub_1D765A114()
{
  unint64_t result = qword_1EBDEC0A8;
  if (!qword_1EBDEC0A8)
  {
    sub_1D765FFD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBDEC0A8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DiscoveredBonjourAdvert(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v36 = *a2;
    *a1 = *a2;
    a1 = (void *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1D76603E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1D765FFD0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[7];
    BOOL v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = *v14;
    unint64_t v16 = v14[1];
    sub_1D75934F4(*v14, v16);
    *BOOL v13 = v15;
    v13[1] = v16;
    uint64_t v17 = a3[8];
    uint64_t v18 = a3[9];
    uint64_t v19 = *(void **)((char *)a2 + v17);
    *(void *)((char *)a1 + v17) = v19;
    uint64_t v20 = *(void **)((char *)a2 + v18);
    *(void *)((char *)a1 + v18) = v20;
    uint64_t v21 = a3[10];
    uint64_t v22 = a3[11];
    uint64_t v23 = (void *)((char *)a1 + v21);
    unint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = (void *)((char *)a1 + v22);
    uint64_t v27 = (void *)((char *)a2 + v22);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[13];
    *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
    *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
    uint64_t v30 = a3[14];
    uint64_t v31 = a3[15];
    uint64_t v32 = *(void **)((char *)a2 + v30);
    *(void *)((char *)a1 + v30) = v32;
    *(void *)((char *)a1 + v31) = *(void *)((char *)a2 + v31);
    id v33 = v19;
    id v34 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v35 = v32;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DiscoveredBonjourAdvert(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1D76603E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_1D765FFD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1D75933F0(*(void *)(a1 + a2[7]), *(void *)(a1 + a2[7] + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1D76603E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1D765FFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (uint64_t *)(a1 + v11);
  BOOL v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_1D75934F4(*v13, v15);
  uint64_t *v12 = v14;
  v12[1] = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(a1 + v21);
  uint64_t v26 = (void *)(a2 + v21);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  uint64_t v29 = a3[14];
  uint64_t v30 = a3[15];
  uint64_t v31 = *(void **)(a2 + v29);
  *(void *)(a1 + v29) = v31;
  *(void *)(a1 + v30) = *(void *)(a2 + v30);
  id v32 = v18;
  id v33 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v34 = v31;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1D76603E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1D765FFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (uint64_t *)(a1 + v11);
  BOOL v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_1D75934F4(*v13, v15);
  uint64_t v16 = *v12;
  unint64_t v17 = v12[1];
  uint64_t *v12 = v14;
  v12[1] = v15;
  sub_1D75933F0(v16, v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)(a1 + v18);
  uint64_t v20 = *(void **)(a2 + v18);
  *(void *)(a1 + v18) = v20;
  id v21 = v20;

  uint64_t v22 = a3[9];
  uint64_t v23 = *(void **)(a1 + v22);
  uint64_t v24 = *(void **)(a2 + v22);
  *(void *)(a1 + v22) = v24;
  id v25 = v24;

  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[11];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  void *v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[14];
  id v33 = *(void **)(a2 + v32);
  id v34 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = v33;
  id v35 = v33;

  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1D76603E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1D765FFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1D76603E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1D765FFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = *(void *)(a1 + v11);
  unint64_t v13 = *(void *)(a1 + v11 + 8);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  sub_1D75933F0(v12, v13);
  uint64_t v14 = a3[8];
  unint64_t v15 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);

  uint64_t v16 = a3[9];
  unint64_t v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);

  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)(a1 + v23);
  id v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[14];
  uint64_t v30 = *(void **)(a1 + v29);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);

  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1D765AA50);
}

uint64_t sub_1D765AA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1D76603E0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_1D765FFD0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 52));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1D765AB18);
}

void sub_1D765AB18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1D76603E0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_1D765FFD0();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_1D765ABC8()
{
  uint64_t result = sub_1D76603E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1D765FFD0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return 0x67615468747561;
}

uint64_t OUTLINED_FUNCTION_17_15()
{
  return ControlChannelConnectionWireProtocolVersion.__allocating_init(_:)(v0, v1);
}

uint64_t sub_1D765AD24()
{
  sub_1D75D5108();
  uint64_t result = sub_1D7660FE0();
  qword_1EA82CC40 = result;
  return result;
}

id sub_1D765AD84()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E00]), sel_init);
  qword_1EA82CC58 = (uint64_t)result;
  return result;
}

uint64_t sub_1D765ADB8()
{
  if (qword_1EA82AAE0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EA82CC58;
  objc_msgSend((id)qword_1EA82CC58, sel_lock);
  uint64_t v1 = qword_1EA82CC48;
  if (qword_1EA82CC48)
  {
    uint64_t v2 = qword_1EA82CC50;
    uint64_t v3 = swift_slowAlloc();
    *(void *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    objc_msgSend(v0, sel_unlock);
    return v3;
  }
  else
  {
    sub_1D7661100();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1D7661260();
    __break(1u);
  }
  return result;
}

uint64_t sub_1D765AEDC()
{
  if (qword_1EA82AAE0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EA82CC58;
  objc_msgSend((id)qword_1EA82CC58, sel_lock);
  uint64_t v1 = qword_1EA82CC48;
  if (qword_1EA82CC48)
  {
    objc_msgSend(v0, sel_unlock);
  }
  else
  {
    uint64_t v1 = swift_slowAlloc();
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    *(void *)(v1 + 32) = 0;
    uint64_t v2 = (void *)swift_slowAlloc();
    bzero(v2, 0x110uLL);
    uint64_t v4 = MEMORY[0x1F4188790](v3);
    if (((unint64_t)" to fit packet of size " & 0x1000000000000000) != 0)
    {
      sub_1D76610F0();
    }
    else
    {
      MEMORY[0x1F4188790](v4);
      if ((v5 & 0x2000000000000000) != 0)
      {
        *(void *)__source = 0xD000000000000016;
        uint64_t v8 = v5 & 0xFFFFFFFFFFFFFFLL;
        strlcpy((char *)v1, __source, 0x20uLL);
      }
      else
      {
        sub_1D765D594((v5 & 0xFFFFFFFFFFFFFFFLL) + 32, 22, (uint64_t (*)(void))sub_1D765D5D4);
      }
    }
    *(void *)(v1 + 32) = 0x100000002;
    v2[8] = sub_1D765B10C;
    v2[9] = sub_1D765B410;
    qword_1EA82CC48 = v1;
    qword_1EA82CC50 = (uint64_t)v2;
    nw_protocol_register();
    objc_msgSend((id)qword_1EA82CC58, sel_unlock);
  }
  return v1;
}

uint64_t sub_1D765B110(uint64_t result)
{
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v1 = *(void **)(result + 40);
  if (!v1)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v2 = v1[2];
  swift_retain();
  if (v2)
  {
    uint64_t v3 = v1[3];
    uint64_t v16 = v1[14];
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v13[0] = v3;
    aBlock[4] = sub_1D75E0530;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D75D6460;
    aBlock[3] = &block_descriptor_65_0;
    uint64_t v5 = _Block_copy(aBlock);
    uint64_t v14 = sub_1D7660950();
    unint64_t v15 = v13;
    uint64_t v6 = *(void *)(v14 - 8);
    MEMORY[0x1F4188790](v14);
    uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain_n();
    sub_1D7660930();
    uint64_t v9 = sub_1D7660910();
    v13[1] = v13;
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = MEMORY[0x1E4FBC860];
    sub_1D75AEEF0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
    sub_1D75ABCA4();
    sub_1D7661090();
    MEMORY[0x1D9473560](0, v8, v12, v5);
    _Block_release(v5);
    sub_1D75940A4(v2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
    swift_release();
    return swift_release();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1D765B414(uint64_t result)
{
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v1 = *(void **)(result + 40);
  if (!v1)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v2 = v1[4];
  swift_retain();
  if (v2)
  {
    uint64_t v3 = v1[5];
    uint64_t v16 = v1[14];
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v13[0] = v3;
    aBlock[4] = sub_1D761F060;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D75D6460;
    aBlock[3] = &block_descriptor_59_0;
    uint64_t v5 = _Block_copy(aBlock);
    uint64_t v14 = sub_1D7660950();
    unint64_t v15 = v13;
    uint64_t v6 = *(void *)(v14 - 8);
    MEMORY[0x1F4188790](v14);
    uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain_n();
    sub_1D7660930();
    uint64_t v9 = sub_1D7660910();
    v13[1] = v13;
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = MEMORY[0x1E4FBC860];
    sub_1D75AEEF0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
    sub_1D75ABCA4();
    sub_1D7661090();
    MEMORY[0x1D9473560](0, v8, v12, v5);
    _Block_release(v5);
    sub_1D75940A4(v2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
    swift_release();
    return swift_release();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1D765B718()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v2 = 30;
  uint64_t result = MEMORY[0x1D94725A0](&v2, 4);
  qword_1EA83A388 = result;
  unk_1EA83A390 = v1;
  return result;
}

uint64_t sub_1D765B780()
{
  if (qword_1EA82AAE8 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v0 = 0;
  switch(unk_1EA83A390 >> 62)
  {
    case 1:
      LODWORD(v0) = HIDWORD(qword_1EA83A388) - qword_1EA83A388;
      if (__OFSUB__(HIDWORD(qword_1EA83A388), qword_1EA83A388))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x1D765B830);
      }
      uint64_t v0 = (int)v0;
LABEL_8:
      qword_1EA83A398 = v0;
      return result;
    case 2:
      uint64_t v2 = *(void *)(qword_1EA83A388 + 16);
      uint64_t v1 = *(void *)(qword_1EA83A388 + 24);
      BOOL v3 = __OFSUB__(v1, v2);
      uint64_t v0 = v1 - v2;
      if (!v3) {
        goto LABEL_8;
      }
      goto LABEL_10;
    case 3:
      goto LABEL_8;
    default:
      uint64_t v0 = unk_1EA83A396;
      goto LABEL_8;
  }
}

uint64_t sub_1D765B840()
{
  if (qword_1EA82AAF0 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1EA83A398 < 0 || HIDWORD(qword_1EA83A398))
  {
    uint64_t result = sub_1D7661250();
    __break(1u);
  }
  else
  {
    dword_1EA83A3A0 = qword_1EA83A398;
  }
  return result;
}

uint64_t sub_1D765B92C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 64) = 0;
  *(unsigned char *)(v6 + 72) = 0;
  *(void *)(v6 + 80) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(void *)(v6 + 104) = a4;
  *(void *)(v6 + 112) = a2;
  *(void *)(v6 + 96) = a3;
  uint64_t v11 = v6
      + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval;
  uint64_t v12 = sub_1D7660900();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a6, v12);
  *(void *)(v6 + 56) = a1;
  id v14 = a2;
  swift_unknownObjectRetain();
  sub_1D765AEDC();
  uint64_t result = nw_protocol_create();
  if (!result)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(void *)(v6 + 48) = result;
  *(void *)(v6 + 88) = a5;
  *(void *)(result + 40) = v6;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t result = nw_channel_get_protocol_handler();
  if (!result)
  {
LABEL_6:

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a6, v12);
    return v6;
  }
  uint64_t v16 = *(void (***)(void))(result + 24);
  if (!v16) {
    goto LABEL_8;
  }
  uint64_t v17 = *v16;
  if (v17)
  {
    v17();
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1D765BA98@<X0>(uint64_t *a1@<X8>)
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_67();
  uint64_t v5 = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  nw_frame_array_init();
  uint64_t v11 = *(void *)(*(void *)(v1 + 48) + 32);
  if (!v11) {
    goto LABEL_11;
  }
  uint64_t v10 = *(void *)(v11 + 24);
  if (!v10)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(v10 + 80);
  if (!v10)
  {
LABEL_13:
    __break(1u);
    if (!(v8 ^ v9 | v7)) {
      __break(1u);
    }
    *(void *)(v2 + 16) = v10;
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  uint64_t v12 = ((unsigned int (*)(void))v10)();
  int v18 = 0;
  uint64_t v2 = sub_1D75EEF60(v12);
  uint64_t v17 = 0;
  v19[0] = v13;
  v19[1] = v12;
  sub_1D765BC34(v19, (uint64_t)&v17, v6 + 16, (uint64_t)&v18, v5);
  uint64_t v10 = v17;
  BOOL v9 = __OFSUB__(v17, v12);
  BOOL v7 = v17 == v12;
  BOOL v8 = v17 - v12 < 0;
  if (v17 > v12)
  {
    __break(1u);
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *(void *)(v2 + 16) = v17;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v1;
  *(void *)(v14 + 24) = v6;
  uint64_t v15 = *(void *)(v1 + 64);
  BOOL v9 = __OFADD__(v15, 1);
  uint64_t v10 = v15 + 1;
  BOOL v7 = v10 == 0;
  BOOL v8 = v10 < 0;
  if (v9) {
    goto LABEL_10;
  }
  *(void *)(v1 + 64) = v10;
  *a1 = v2;
  a1[1] = (uint64_t)sub_1D765D520;
  a1[2] = v14;
  return swift_retain();
}

uint64_t *sub_1D765BC34(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*result)
  {
    uint64_t v12 = *result;
    BOOL v8 = (void *)swift_allocObject();
    v8[2] = a4;
    v8[3] = &v12;
    v8[4] = a2;
    v8[5] = a5;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_1D765D540;
    *(void *)(v9 + 24) = v8;
    aBlock[4] = sub_1D765D68C;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D765BF40;
    aBlock[3] = &block_descriptor_53;
    uint64_t v10 = _Block_copy(aBlock);
    swift_release();
    nw_frame_array_foreach();
    _Block_release(v10);
    return (uint64_t *)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1D765BD68(uint64_t a1, unsigned int *a2, uint64_t **a3, void *a4)
{
  uint64_t result = nw_frame_unclaimed_bytes();
  uint64_t v8 = result;
  unsigned int v9 = *a2;
  if (qword_1EA82AAF8 != -1) {
    uint64_t result = swift_once();
  }
  if (v9 < dword_1EA83A3A0) {
    return 1;
  }
  unsigned int v10 = *a2;
  uint64_t v11 = *a2 - dword_1EA83A3A0;
  if (v10 < dword_1EA83A3A0)
  {
    __break(1u);
LABEL_11:
    swift_once();
    goto LABEL_7;
  }
  if (!v8) {
    goto LABEL_13;
  }
  if (qword_1EA82AAF0 != -1) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v12 = v8 + qword_1EA83A398;
  uint64_t v13 = sub_1D765FDD0();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v16 + 104))(v15, *MEMORY[0x1E4F27748]);
  uint64_t result = MEMORY[0x1D94724B0](v12, v11, v15);
  uint64_t v17 = *a3;
  *uint64_t v17 = result;
  v17[1] = v18;
  *a3 += 2;
  if (!__OFADD__(*a4, 1))
  {
    ++*a4;
    return 1;
  }
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_1D765BF20()
{
  return 1;
}

uint64_t sub_1D765BF40(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v4 = v3(a2);
  swift_unknownObjectRelease();
  return v4 & 1;
}

void sub_1D765BF90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  v6[4] = sub_1D765D52C;
  v6[5] = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  void v6[2] = sub_1D75D6460;
  v6[3] = &block_descriptor_40;
  uint64_t v5 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v5);
}

uint64_t sub_1D765C07C(uint64_t a1)
{
  aBlock[4] = (uint64_t)sub_1D765BF20;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1D765BF40;
  aBlock[3] = (uint64_t)&block_descriptor_43;
  uint64_t v2 = _Block_copy(aBlock);
  swift_release();
  swift_beginAccess();
  nw_frame_array_foreach();
  swift_endAccess();
  _Block_release(v2);
  uint64_t v3 = *(void *)(a1 + 64);
  BOOL v4 = __OFSUB__(v3, 1);
  uint64_t v5 = v3 - 1;
  if (v4)
  {
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(a1 + 64) = v5;
  if (*(unsigned char *)(a1 + 72) != 1 || v5) {
    goto LABEL_10;
  }
  LOBYTE(v2) = sub_1D7660DD0();
  if (qword_1EA82AAD8 != -1) {
    goto LABEL_14;
  }
  while (1)
  {
    uint64_t v6 = qword_1EA82CC40;
    os_log_type_t v7 = v2;
    if (os_log_type_enabled((os_log_t)qword_1EA82CC40, (os_log_type_t)v2))
    {
      swift_retain();
      uint64_t v2 = (_DWORD *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      aBlock[0] = v8;
      *uint64_t v2 = 136446210;
      uint64_t v9 = *(void *)(a1 + 96);
      unint64_t v10 = *(void *)(a1 + 104);
      swift_bridgeObjectRetain();
      sub_1D758DBE8(v9, v10, aBlock);
      sub_1D7661020();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v6, v7, "Executing deferred destroyProtocol for interface %{public}s as last outstanding frames are cleaned up", (uint8_t *)v2, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v8, -1, -1);
      MEMORY[0x1D9474C60](v2, -1, -1);
    }
    *(unsigned char *)(a1 + 72) = 0;
    if (*(void *)(a1 + 80))
    {
      swift_retain();
      sub_1D76609C0();
      swift_release();
    }
    *(void *)(a1 + 80) = 0;
    swift_release();
    sub_1D765C8B8(0);
LABEL_10:
    uint64_t result = swift_isEscapingClosureAtFileLocation();
    if ((result & 1) == 0) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
  }
  return result;
}

uint64_t sub_1D765C330(uint64_t a1)
{
  uint64_t v19[3] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *v1;
  v19[1] = 0;
  void v19[2] = 0;
  nw_frame_array_init();
  uint64_t v5 = v1[6];
  uint64_t v6 = *(void *)(v5 + 32);
  if (!v6)
  {
LABEL_7:
    v19[0] = 0;
    int v18 = 0;
    uint64_t v9 = (void *)swift_allocObject();
    id v9[2] = a1;
    v9[3] = v19;
    v9[4] = &v18;
    v9[5] = v1;
    void v9[6] = v4;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_1D765D4C8;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = sub_1D765D4E4;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D765BF40;
    aBlock[3] = &block_descriptor_28_1;
    uint64_t v11 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    nw_frame_array_foreach();
    _Block_release(v11);
    if (nw_frame_array_is_empty())
    {
LABEL_12:
      uint64_t v15 = v19[0];
      swift_release();
      return v15;
    }
    uint64_t v12 = *(void *)(v5 + 32);
    if (v12)
    {
      uint64_t v13 = *(void *)(v12 + 24);
      if (v13)
      {
        uint64_t v14 = *(void (**)(void))(v13 + 96);
        if (v14)
        {
          v14();
          goto LABEL_12;
        }
        goto LABEL_19;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v6 + 24);
  if (!v7)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v8 = *(void (**)(void))(v7 + 88);
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (!HIDWORD(v2))
  {
    v8();
    goto LABEL_7;
  }
LABEL_20:
  uint64_t result = sub_1D7661250();
  __break(1u);
  return result;
}

uint64_t sub_1D765C5A0(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned int *a4)
{
  unint64_t v10 = *a3;
  if (*a3 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(a2 + 16);
  if (v10 >= v9)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
    goto LABEL_5;
  }
  uint64_t v8 = a4;
  uint64_t v4 = a3;
  uint64_t v11 = a2 + 16 * v10;
  uint64_t v6 = *(void *)(v11 + 32);
  unint64_t v7 = *(void *)(v11 + 40);
  sub_1D75934F4(v6, v7);
  if (!nw_frame_unclaimed_bytes())
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = sub_1D765FF00();
  if (qword_1EA82AAF0 != -1) {
    goto LABEL_13;
  }
LABEL_5:
  BOOL v12 = __OFADD__(v5, qword_1EA83A398);
  uint64_t v13 = v5 + qword_1EA83A398;
  if (v12)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_8;
  }
  if (v13 > *v8)
  {
LABEL_18:
    sub_1D7661100();
    sub_1D7660BC0();
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7660BC0();
    sub_1D7661500();
    sub_1D7660BC0();
    swift_bridgeObjectRelease();
    sub_1D7661260();
    __break(1u);
    goto LABEL_19;
  }
  if (qword_1EA82AAE8 != -1) {
    goto LABEL_15;
  }
LABEL_8:
  sub_1D765FF30();
  sub_1D765FF00();
  sub_1D765FF30();
  if ((v13 & 0x8000000000000000) == 0)
  {
    nw_frame_claim();
    nw_frame_collapse();
    nw_frame_unclaim();
    sub_1D75933F0(v6, v7);
    uint64_t v14 = *v4 + 1;
    if (!__OFADD__(*v4, 1))
    {
      uint64_t *v4 = v14;
      return v14 < v9;
    }
    __break(1u);
    goto LABEL_17;
  }
LABEL_19:
  uint64_t result = sub_1D7661250();
  __break(1u);
  return result;
}

void sub_1D765C8B8(char a1)
{
  uint64_t v2 = v1;
  if ((a1 & 1) != 0 || !*(void *)(v1 + 64))
  {
    os_log_type_t v19 = sub_1D7660DD0();
    if (qword_1EA82AAD8 != -1) {
      swift_once();
    }
    uint64_t v20 = qword_1EA82CC40;
    os_log_type_t v21 = v19;
    if (os_log_type_enabled((os_log_t)qword_1EA82CC40, v19))
    {
      swift_retain();
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v23 = *(void *)(v2 + 96);
      unint64_t v24 = *(void *)(v2 + 104);
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_1D758DBE8(v23, v24, aBlock);
      sub_1D7661020();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D757C000, v20, v21, "destroyProtocol invoked for interface %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
    }
    uint64_t v25 = *(void *)(v2 + 48);
    uint64_t v26 = *(void *)(v25 + 32);
    if (v26)
    {
      uint64_t v27 = *(void *)(v26 + 24);
      if (v27)
      {
        uint64_t v28 = *(void (**)(void))(v27 + 8);
        if (v28)
        {
          v28();
          nw_channel_close();
          if (*(void *)(v25 + 40))
          {
            swift_release();
            OUTLINED_FUNCTION_1();
            return;
          }
          goto LABEL_20;
        }
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  os_log_type_t v3 = sub_1D7660DD0();
  if (qword_1EA82AAD8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1EA82CC40;
  os_log_type_t v5 = v3;
  if (os_log_type_enabled((os_log_t)qword_1EA82CC40, v3))
  {
    swift_retain();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446466;
    uint64_t v7 = *(void *)(v2 + 96);
    unint64_t v8 = *(void *)(v2 + 104);
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_1D758DBE8(v7, v8, aBlock);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2048;
    uint64_t v30 = *(void *)(v2 + 64);
    sub_1D7661020();
    swift_release();
    _os_log_impl(&dword_1D757C000, v4, v5, "Deferring destroyProtocol for interface %{public}s until %ld packet groups are cleaned up", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  *(unsigned char *)(v2 + 72) = 1;
  aBlock[4] = (uint64_t)sub_1D765D460;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1D75D6460;
  aBlock[3] = (uint64_t)&block_descriptor_14;
  _Block_copy(aBlock);
  uint64_t v9 = sub_1D7660910();
  MEMORY[0x1F4188790](v9);
  uint64_t v30 = MEMORY[0x1E4FBC860];
  sub_1D75AEEF0();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBDEBDE0);
  sub_1D75ABCA4();
  sub_1D7661090();
  sub_1D76609D0();
  swift_allocObject();
  uint64_t v10 = sub_1D76609B0();
  swift_release();
  *(void *)(v2 + 80) = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = sub_1D76609A0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v29 - v16;
  sub_1D7660990();
  MEMORY[0x1D94730B0](v17, v2 + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval);
  int v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v17, v11);
  sub_1D7660E80();
  swift_release();
  v18(v15, v11);
}

void sub_1D765CE3C(uint64_t a1)
{
  v2[4] = sub_1D765D480;
  void v2[5] = a1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 1107296256;
  long long v2[2] = sub_1D75D6460;
  v2[3] = &block_descriptor_22_0;
  uint64_t v1 = _Block_copy(v2);
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v1);
}

uint64_t sub_1D765CEFC(uint64_t result)
{
  if (*(unsigned char *)(result + 72) == 1)
  {
    uint64_t v1 = result;
    os_log_type_t v2 = sub_1D7660DC0();
    if (qword_1EA82AAD8 != -1) {
      swift_once();
    }
    os_log_type_t v3 = qword_1EA82CC40;
    os_log_type_t v4 = v2;
    if (os_log_type_enabled((os_log_t)qword_1EA82CC40, v2))
    {
      swift_retain();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v9 = v6;
      *(_DWORD *)uint64_t v5 = 136446466;
      uint64_t v7 = *(void *)(v1 + 96);
      unint64_t v8 = *(void *)(v1 + 104);
      swift_bridgeObjectRetain();
      sub_1D758DBE8(v7, v8, &v9);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      *(_WORD *)(v5 + 12) = 2048;
      sub_1D7661020();
      swift_release();
      _os_log_impl(&dword_1D757C000, v3, v4, "Forcibly executing destroyProtocol for interface %{public}s since %ld packet groups were not cleaned up by timeout", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v6, -1, -1);
      MEMORY[0x1D9474C60](v5, -1, -1);
    }
    return sub_1D765C8B8(1);
  }
  return result;
}

uint64_t sub_1D765D0AC()
{
  OUTLINED_FUNCTION_67();
  os_log_type_t v1 = sub_1D7660DD0();
  if (qword_1EA82AAD8 != -1) {
    swift_once();
  }
  os_log_type_t v2 = qword_1EA82CC40;
  if (os_log_type_enabled((os_log_t)qword_1EA82CC40, v1))
  {
    swift_retain_n();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v4 = sub_1D76617F0();
    sub_1D758DBE8(v4, v5, &v11);
    sub_1D7661020();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    uint64_t v6 = *(void *)(v0 + 96);
    unint64_t v7 = *(void *)(v0 + 104);
    swift_bridgeObjectRetain();
    sub_1D758DBE8(v6, v7, &v11);
    sub_1D7661020();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D757C000, v2, v1, "%s.deinit invoked for interface %{public}s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_1();
  }
  sub_1D75940A4(*(void *)(v0 + 16));
  sub_1D75940A4(*(void *)(v0 + 32));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v8 = v0 + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval;
  uint64_t v9 = sub_1D7660900();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return v0;
}

uint64_t sub_1D765D2EC()
{
  sub_1D765D0AC();
  OUTLINED_FUNCTION_67();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t sub_1D765D324()
{
  return type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol();
}

uint64_t type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol()
{
  uint64_t result = qword_1EA82CC68;
  if (!qword_1EA82CC68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D765D374()
{
  uint64_t result = sub_1D7660900();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

void sub_1D765D460()
{
  sub_1D765CE3C(v0);
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t sub_1D765D480()
{
  return sub_1D765CEFC(v0);
}

uint64_t sub_1D765D488()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1D765D4C8(uint64_t a1)
{
  return sub_1D765C5A0(a1, *(void *)(v1 + 16), *(uint64_t **)(v1 + 24), *(unsigned int **)(v1 + 32));
}

uint64_t sub_1D765D4D8()
{
  return OUTLINED_FUNCTION_2_3(v0, 32);
}

uint64_t sub_1D765D4E4()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1D765D510()
{
  return OUTLINED_FUNCTION_2_3(v0, 32);
}

void sub_1D765D520()
{
  sub_1D765BF90(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1D765D52C()
{
  return sub_1D765C07C(*(void *)(v0 + 16));
}

uint64_t sub_1D765D534()
{
  return OUTLINED_FUNCTION_2_3(v0, 48);
}

uint64_t sub_1D765D540(uint64_t a1)
{
  return sub_1D765BD68(a1, *(unsigned int **)(v1 + 16), *(uint64_t ***)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1D765D54C()
{
  return OUTLINED_FUNCTION_2_3(v0, 32);
}

size_t sub_1D765D558@<X0>(char *__source@<X0>, size_t *a2@<X8>)
{
  size_t result = strlcpy(*(char **)(v2 + 16), __source, 0x20uLL);
  *a2 = result;
  return result;
}

uint64_t sub_1D765D594(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *sub_1D765D5D4@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_1D765D618()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t RemoteUnlockDeviceKeyForTunnelRequest.tunnelDeviceName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D765D6C0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000001D7677D20)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_1D765D748()
{
  return 0xD000000000000010;
}

uint64_t sub_1D765D768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D765D6C0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D765D794(uint64_t a1)
{
  unint64_t v2 = sub_1D765D8FC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D765D7D0(uint64_t a1)
{
  unint64_t v2 = sub_1D765D8FC();
  return MEMORY[0x1F41862B0](a1, v2);
}

void RemoteUnlockDeviceKeyForTunnelRequest.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CD40);
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D765D8FC();
  sub_1D76617C0();
  sub_1D7661450();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D765D8FC()
{
  unint64_t result = qword_1EA82CD48;
  if (!qword_1EA82CD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD48);
  }
  return result;
}

void RemoteUnlockDeviceKeyForTunnelRequest.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CD50);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D765D8FC();
  OUTLINED_FUNCTION_21_3();
  if (!v0)
  {
    uint64_t v6 = sub_1D7661340();
    uint64_t v8 = v7;
    uint64_t v9 = OUTLINED_FUNCTION_22();
    v10(v9);
    uint64_t *v4 = v6;
    v4[1] = v8;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
}

void sub_1D765DA4C()
{
}

void sub_1D765DA64()
{
}

uint64_t RemoteUnlockDeviceKeyForTunnelResponse.deviceKey.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1D75934F4(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t RemoteUnlockDeviceKeyForTunnelResponse.init(deviceKey:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_1D765DAB8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x654B656369766564 && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1D7661560();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1D765DB4C()
{
  return 0x654B656369766564;
}

uint64_t sub_1D765DB6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1D765DAB8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1D765DB98(uint64_t a1)
{
  unint64_t v2 = sub_1D765DD14();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1D765DBD4(uint64_t a1)
{
  unint64_t v2 = sub_1D765DD14();
  return MEMORY[0x1F41862B0](a1, v2);
}

void RemoteUnlockDeviceKeyForTunnelResponse.encode(to:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CD58);
  OUTLINED_FUNCTION_0_5();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D765DD14();
  sub_1D76617C0();
  sub_1D75E1BB4();
  sub_1D7661490();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  OUTLINED_FUNCTION_4_0();
}

unint64_t sub_1D765DD14()
{
  unint64_t result = qword_1EA82CD60;
  if (!qword_1EA82CD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD60);
  }
  return result;
}

void RemoteUnlockDeviceKeyForTunnelResponse.init(from:)()
{
  OUTLINED_FUNCTION_3();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA82CD68);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1F4188790](v5);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1D765DD14();
  OUTLINED_FUNCTION_21_3();
  if (!v0)
  {
    sub_1D75E4EB4();
    sub_1D7661380();
    uint64_t v6 = OUTLINED_FUNCTION_22();
    v7(v6);
    _OWORD *v4 = v8;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_4_0();
}

void sub_1D765DE70()
{
}

void sub_1D765DE88()
{
}

id RemotePairingDeviceTunnelServiceConnection.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id RemotePairingDeviceTunnelServiceConnection.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1D7660260();
  unint64_t v2 = v0;
  sub_1D7660240();
  sub_1D7660280();
  *(void *)&v2[OBJC_IVAR____TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection_connection] = swift_dynamicCastClassUnconditional();
  swift_retain();
  sub_1D76600D0();
  swift_release();

  v4.receiver = v2;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t RemotePairingDeviceTunnelServiceConnection.copyRemoteUnlockDeviceKeyForTunnel(tunnelName:)()
{
  sub_1D765E0A8();
  sub_1D765E0F4();
  sub_1D765E140();
  sub_1D765E18C();
  sub_1D75A71EC();
  swift_bridgeObjectRetain();
  sub_1D76600E0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0) {
    return v2;
  }
  return result;
}

unint64_t sub_1D765E0A8()
{
  unint64_t result = qword_1EA82CD78;
  if (!qword_1EA82CD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD78);
  }
  return result;
}

unint64_t sub_1D765E0F4()
{
  unint64_t result = qword_1EA82CD80;
  if (!qword_1EA82CD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD80);
  }
  return result;
}

unint64_t sub_1D765E140()
{
  unint64_t result = qword_1EA82CD88;
  if (!qword_1EA82CD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD88);
  }
  return result;
}

unint64_t sub_1D765E18C()
{
  unint64_t result = qword_1EA82CD90;
  if (!qword_1EA82CD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD90);
  }
  return result;
}

id RemotePairingDeviceTunnelServiceConnection.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D765E2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D765E340(a1, a2, a3, (uint64_t (*)(void))sub_1D765E0A8, (uint64_t (*)(void))sub_1D765E0F4);
}

uint64_t sub_1D765E314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D765E340(a1, a2, a3, (uint64_t (*)(void))sub_1D765E140, (uint64_t (*)(void))sub_1D765E18C);
}

uint64_t sub_1D765E340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelRequest()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelRequest;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelResponse()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelResponse;
}

uint64_t type metadata accessor for RemotePairingDeviceTunnelServiceConnection()
{
  return self;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys;
}

unsigned char *_s19RemotePairingDevice38RemoteUnlockDeviceKeyForTunnelResponseV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1D765E480);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys;
}

unint64_t sub_1D765E4BC()
{
  unint64_t result = qword_1EA82CD98;
  if (!qword_1EA82CD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CD98);
  }
  return result;
}

unint64_t sub_1D765E50C()
{
  unint64_t result = qword_1EA82CDA0;
  if (!qword_1EA82CDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CDA0);
  }
  return result;
}

unint64_t sub_1D765E55C()
{
  unint64_t result = qword_1EA82CDA8;
  if (!qword_1EA82CDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CDA8);
  }
  return result;
}

unint64_t sub_1D765E5AC()
{
  unint64_t result = qword_1EA82CDB0;
  if (!qword_1EA82CDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CDB0);
  }
  return result;
}

unint64_t sub_1D765E5FC()
{
  unint64_t result = qword_1EA82CDB8;
  if (!qword_1EA82CDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CDB8);
  }
  return result;
}

unint64_t sub_1D765E64C()
{
  unint64_t result = qword_1EA82CDC0;
  if (!qword_1EA82CDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA82CDC0);
  }
  return result;
}

uint64_t OS_dispatch_io.write(content:completingOn:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[0] = a3;
  v17[5] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = sub_1D7660980();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      swift_retain();
      sub_1D765F654((int)a1, a1 >> 32);
      sub_1D75933F0(a1, a2);
      break;
    case 2uLL:
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      sub_1D765F654(v13, v14);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(&v17[2], 0, 14);
      goto LABEL_7;
    default:
      long long v17[2] = a1;
      LOWORD(v17[3]) = a2;
      BYTE2(v17[3]) = BYTE2(a2);
      BYTE3(v17[3]) = BYTE3(a2);
      BYTE4(v17[3]) = BYTE4(a2);
      BYTE5(v17[3]) = BYTE5(a2);
LABEL_7:
      sub_1D7660960();
      break;
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  swift_retain();
  sub_1D7660E40();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t OS_dispatch_io.read(minLength:maxLength:competingOn:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82CDD0);
  uint64_t v7 = swift_allocBox();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1D7660980();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v7;
  v11[3] = a4;
  v11[4] = a5;
  swift_retain();
  swift_retain();
  sub_1D7660E00();
  swift_release();
  return swift_release();
}

uint64_t sub_1D765EA40()
{
  sub_1D75D5108();
  uint64_t result = sub_1D7660FE0();
  qword_1EA82CDC8 = result;
  return result;
}

void sub_1D765EAA4(int a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(void *, unint64_t, uint64_t), uint64_t a6)
{
  uint64_t v53 = a6;
  uint64_t v54 = a5;
  LODWORD(v52) = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82CDD0);
  unint64_t v55 = (unsigned char *)swift_projectBox();
  uint64_t v9 = sub_1D7660980();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = &v49[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v51 = v8;
  uint64_t v14 = *(void *)(*(void *)(v8 - 8) + 64);
  MEMORY[0x1F4188790](v11);
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1D765F774(a2, (uint64_t)&v49[-v15]);
  if (__swift_getEnumTagSinglePayload((uint64_t)&v49[-v15], 1, v9) == 1)
  {
    sub_1D765F7DC((uint64_t)&v49[-v15]);
    if (a3)
    {
LABEL_3:
      uint64_t v16 = sub_1D765FC50();
      unint64_t v55 = v49;
      uint64_t v17 = *(void *)(v16 - 8);
      uint64_t v18 = *(void *)(v17 + 64);
      MEMORY[0x1F4188790](v16);
      unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v20 = sub_1D7660020();
      if ((v20 & 0x100000000) != 0) {
        int v21 = 5;
      }
      else {
        int v21 = v20;
      }
      LODWORD(v59[0]) = v21;
      sub_1D75B0C34(MEMORY[0x1E4FBC860]);
      sub_1D765F83C(qword_1EA82BCB0);
      sub_1D765FD40();
      uint64_t v22 = sub_1D7660DB0();
      os_log_type_t v23 = v22;
      if (qword_1EA82AB00 != -1) {
        uint64_t v22 = swift_once();
      }
      unint64_t v24 = qword_1EA82CDC8;
      MEMORY[0x1F4188790](v22);
      uint64_t v25 = &v49[-v19];
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v17 + 16))(&v49[-v19], &v49[-v19], v16);
      if (os_log_type_enabled(v24, v23))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        v59[0] = v52;
        *(_DWORD *)uint64_t v26 = 67109378;
        LODWORD(v56) = a3;
        sub_1D7661020();
        *(_WORD *)(v26 + 8) = 2082;
        sub_1D765F83C((unint64_t *)&unk_1EA82C670);
        uint64_t v27 = sub_1D7661620();
        uint64_t v56 = sub_1D758DBE8(v27, v28, v59);
        sub_1D7661020();
        swift_bridgeObjectRelease();
        uint64_t v29 = *(void (**)(unsigned char *, uint64_t))(v17 + 8);
        v29(v25, v16);
        _os_log_impl(&dword_1D757C000, v24, v23, "Read error: %d, %{public}s", (uint8_t *)v26, 0x12u);
        uint64_t v30 = v52;
        swift_arrayDestroy();
        MEMORY[0x1D9474C60](v30, -1, -1);
        MEMORY[0x1D9474C60](v26, -1, -1);
      }
      else
      {
        uint64_t v29 = *(void (**)(unsigned char *, uint64_t))(v17 + 8);
        v29(v25, v16);
      }
      uint64_t v36 = (void *)sub_1D765FC40();
      v54(v36, 0, 1);

      v29(&v49[-v19], v16);
      return;
    }
  }
  else
  {
    int v50 = a3;
    uint64_t v31 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32);
    v31(v13, &v49[-v15], v9);
    uint64_t v32 = (uint64_t)v55;
    uint64_t v33 = swift_beginAccess();
    MEMORY[0x1F4188790](v33);
    sub_1D765F774(v32, (uint64_t)&v49[-v15]);
    LODWORD(v32) = __swift_getEnumTagSinglePayload((uint64_t)&v49[-v15], 1, v9);
    uint64_t v34 = sub_1D765F7DC((uint64_t)&v49[-v15]);
    if (v32 == 1)
    {
      MEMORY[0x1F4188790](v34);
      v31(&v49[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v13, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)&v49[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], 0, 1, v9);
      uint64_t v35 = (uint64_t)v55;
      swift_beginAccess();
      sub_1D765F880((uint64_t)&v49[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)], v35);
    }
    else
    {
      uint64_t v37 = (uint64_t)v55;
      swift_beginAccess();
      if (!__swift_getEnumTagSinglePayload(v37, 1, v9)) {
        sub_1D7660970();
      }
      swift_endAccess();
      (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v13, v9);
    }
    a3 = v50;
    if (v50) {
      goto LABEL_3;
    }
  }
  if ((v52 & 1) == 0) {
    return;
  }
  uint64_t v38 = (uint64_t)v55;
  uint64_t v39 = swift_beginAccess();
  MEMORY[0x1F4188790](v39);
  sub_1D765F774(v38, (uint64_t)&v49[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  uint64_t v40 = sub_1D7660FF0();
  sub_1D765F7DC((uint64_t)&v49[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  uint64_t v58 = v40;
  if (swift_dynamicCast())
  {
    uint64_t v41 = v56;
    unint64_t v42 = v57;
    if (sub_1D765FF00() >= 1)
    {
      sub_1D75934F4(v41, v42);
      v54((void *)v41, v42, 0);
      sub_1D75933F0(v41, v42);
      sub_1D75933F0(v41, v42);
      return;
    }
    sub_1D75933F0(v41, v42);
  }
  sub_1D7660DB0();
  if (qword_1EA82AB00 != -1) {
    swift_once();
  }
  uint64_t v43 = MEMORY[0x1E4FBC860];
  sub_1D7660010();
  uint64_t v44 = sub_1D765FC50();
  uint64_t v45 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v47 = &v49[-((v46 + 15) & 0xFFFFFFFFFFFFFFF0)];
  LODWORD(v56) = 32;
  sub_1D75B0C34(v43);
  sub_1D765F83C(qword_1EA82BCB0);
  sub_1D765FD40();
  uint64_t v48 = (void *)sub_1D765FC40();
  (*(void (**)(unsigned char *, uint64_t))(v45 + 8))(v47, v44);
  v54(v48, 0, 1);
}

uint64_t sub_1D765F2F8(uint64_t result, uint64_t a2, int a3, void (*a4)(void), uint64_t a5)
{
  if (a3)
  {
    uint64_t v26 = a5;
    uint64_t v27 = a4;
    uint64_t v6 = sub_1D765FC50();
    uint64_t v25 = &v22;
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = *(void *)(v7 + 64);
    MEMORY[0x1F4188790](v6);
    unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v10 = (char *)&v22 - v9;
    uint64_t v11 = sub_1D7660020();
    if ((v11 & 0x100000000) != 0) {
      int v12 = 5;
    }
    else {
      int v12 = v11;
    }
    LODWORD(v29) = v12;
    sub_1D75B0C34(MEMORY[0x1E4FBC860]);
    sub_1D765F83C(qword_1EA82BCB0);
    sub_1D765FD40();
    uint64_t v13 = sub_1D7660DB0();
    os_log_type_t v14 = v13;
    if (qword_1EA82AB00 != -1) {
      uint64_t v13 = swift_once();
    }
    unint64_t v24 = &v22;
    unint64_t v15 = qword_1EA82CDC8;
    MEMORY[0x1F4188790](v13);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)&v22 - v9, (char *)&v22 - v9, v6);
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v29 = v23;
      *(_DWORD *)uint64_t v16 = 67109378;
      LODWORD(v28) = a3;
      sub_1D7661020();
      *(_WORD *)(v16 + 8) = 2082;
      sub_1D765F83C((unint64_t *)&unk_1EA82C670);
      uint64_t v17 = sub_1D7661620();
      uint64_t v28 = sub_1D758DBE8(v17, v18, &v29);
      sub_1D7661020();
      swift_bridgeObjectRelease();
      unint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19((char *)&v22 - v9, v6);
      _os_log_impl(&dword_1D757C000, v15, v14, "Write error: %d, %{public}s", (uint8_t *)v16, 0x12u);
      uint64_t v20 = v23;
      swift_arrayDestroy();
      MEMORY[0x1D9474C60](v20, -1, -1);
      MEMORY[0x1D9474C60](v16, -1, -1);
    }
    else
    {
      unint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19((char *)&v22 - v9, v6);
    }
    int v21 = (void *)sub_1D765FC40();
    v27();

    return ((uint64_t (*)(char *, uint64_t))v19)(v10, v6);
  }
  else if (result)
  {
    return ((uint64_t (*)(void))a4)(0);
  }
  return result;
}

uint64_t sub_1D765F654(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1D765FCE0();
  if (!result || (uint64_t result = sub_1D765FD10(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1D765FD00();
      return sub_1D7660960();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1D765F6E8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1D765F720(uint64_t a1, uint64_t a2, int a3)
{
  return sub_1D765F2F8(a1, a2, a3, *(void (**)(void))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1D765F728()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1D765F768(int a1, uint64_t a2, int a3)
{
  sub_1D765EAA4(a1, a2, a3, *(void *)(v3 + 16), *(void (**)(void *, unint64_t, uint64_t))(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_1D765F774(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82CDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D765F7DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82CDD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D765F83C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1D765FC50();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D765F880(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82CDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_4(&dword_1D757C000, v0, v1, "%s Invalid interface index %ld.", v2, v3, v4, v5, 2u);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_4(&dword_1D757C000, v0, v1, "%s Unable to look up name for interface index %ld.", v2, v3, v4, v5, 2u);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_4(&dword_1D757C000, v0, v1, "%s IOBSDNameMatching returned nil for inteface name %s.", v2, v3, v4, v5, 2u);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_4(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_1_2(&dword_1D757C000, (int)a2, a3, "%s interface parent does not conform to AppleUSBNCMData", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_5(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_1_2(&dword_1D757C000, (int)a2, a3, "%s interface parent does have valid USB vendor ID property", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_6(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_1_2(&dword_1D757C000, (int)a2, a3, "%s Figuring out if service has NCM as parent.", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_7()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_3_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1D757C000, v1, OS_LOG_TYPE_ERROR, "%s IOServiceGetMatchingServices failed for inteface name %s. Result: %d", (uint8_t *)v2, 0x1Cu);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_1D757C000, v0, OS_LOG_TYPE_DEBUG, "%s Trying to determine whether interface index %ld comes from NCM.", (uint8_t *)v1, 0x16u);
}

uint64_t sub_1D765FC20()
{
  return MEMORY[0x1F412ED28]();
}

uint64_t sub_1D765FC40()
{
  return MEMORY[0x1F40E2E30]();
}

uint64_t sub_1D765FC50()
{
  return MEMORY[0x1F40E2E48]();
}

uint64_t sub_1D765FC60()
{
  return MEMORY[0x1F40E3030]();
}

uint64_t sub_1D765FC70()
{
  return MEMORY[0x1F40E3068]();
}

uint64_t sub_1D765FC80()
{
  return MEMORY[0x1F40E3078]();
}

uint64_t sub_1D765FC90()
{
  return MEMORY[0x1F40E3120]();
}

uint64_t sub_1D765FCA0()
{
  return MEMORY[0x1F40E3148]();
}

uint64_t sub_1D765FCB0()
{
  return MEMORY[0x1F40E3158]();
}

uint64_t sub_1D765FCC0()
{
  return MEMORY[0x1F40E37C8]();
}

uint64_t sub_1D765FCD0()
{
  return MEMORY[0x1F40E37D8]();
}

uint64_t sub_1D765FCE0()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_1D765FCF0()
{
  return MEMORY[0x1F40E37F8]();
}

uint64_t sub_1D765FD00()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_1D765FD10()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_1D765FD20()
{
  return MEMORY[0x1F40E3828]();
}

uint64_t sub_1D765FD30()
{
  return MEMORY[0x1F40E3B78]();
}

uint64_t sub_1D765FD40()
{
  return MEMORY[0x1F40E4500]();
}

uint64_t sub_1D765FD50()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1D765FD60()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1D765FD70()
{
  return MEMORY[0x1F40E49F0]();
}

uint64_t sub_1D765FD80()
{
  return MEMORY[0x1F40E4AB8]();
}

uint64_t sub_1D765FD90()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1D765FDA0()
{
  return MEMORY[0x1F40E4BB8]();
}

uint64_t sub_1D765FDB0()
{
  return MEMORY[0x1F40E4BC0]();
}

uint64_t sub_1D765FDC0()
{
  return MEMORY[0x1F40E4BD0]();
}

uint64_t sub_1D765FDD0()
{
  return MEMORY[0x1F40E4BF8]();
}

uint64_t sub_1D765FDE0()
{
  return MEMORY[0x1F40E4C10]();
}

uint64_t sub_1D765FDF0()
{
  return MEMORY[0x1F40E4C28]();
}

uint64_t sub_1D765FE00()
{
  return MEMORY[0x1F40E4C50]();
}

uint64_t sub_1D765FE10()
{
  return MEMORY[0x1F40E4C70]();
}

uint64_t sub_1D765FE20()
{
  return MEMORY[0x1F40E4C88]();
}

uint64_t sub_1D765FE30()
{
  return MEMORY[0x1F40E4C98]();
}

uint64_t sub_1D765FE40()
{
  return MEMORY[0x1F40E4CB0]();
}

uint64_t sub_1D765FE50()
{
  return MEMORY[0x1F40E4CC0]();
}

uint64_t sub_1D765FE60()
{
  return MEMORY[0x1F40E4CE0]();
}

uint64_t sub_1D765FE70()
{
  return MEMORY[0x1F40E4CF0]();
}

uint64_t sub_1D765FE80()
{
  return MEMORY[0x1F40E4D08]();
}

uint64_t sub_1D765FE90()
{
  return MEMORY[0x1F40E4D18]();
}

uint64_t sub_1D765FEA0()
{
  return MEMORY[0x1F40E4D28]();
}

uint64_t sub_1D765FEB0()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1D765FEC0()
{
  return MEMORY[0x1F40E4D88]();
}

uint64_t sub_1D765FED0()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_1D765FEE0()
{
  return MEMORY[0x1F40E4DC8]();
}

uint64_t sub_1D765FEF0()
{
  return MEMORY[0x1F40E4DE0]();
}

uint64_t sub_1D765FF00()
{
  return MEMORY[0x1F40E4DF8]();
}

uint64_t sub_1D765FF10()
{
  return MEMORY[0x1F40E4E28]();
}

uint64_t sub_1D765FF20()
{
  return MEMORY[0x1F40E4E58]();
}

uint64_t sub_1D765FF30()
{
  return MEMORY[0x1F40E4E90]();
}

uint64_t sub_1D765FF40()
{
  return MEMORY[0x1F40E4EC0]();
}

uint64_t sub_1D765FF50()
{
  return MEMORY[0x1F40E52A8]();
}

uint64_t sub_1D765FF60()
{
  return MEMORY[0x1F40E52B8]();
}

uint64_t sub_1D765FF70()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1D765FF80()
{
  return MEMORY[0x1F40E5398]();
}

uint64_t sub_1D765FF90()
{
  return MEMORY[0x1F40E53A8]();
}

uint64_t sub_1D765FFA0()
{
  return MEMORY[0x1F40E53D0]();
}

uint64_t sub_1D765FFB0()
{
  return MEMORY[0x1F40E53F0]();
}

uint64_t sub_1D765FFC0()
{
  return MEMORY[0x1F40E5400]();
}

uint64_t sub_1D765FFD0()
{
  return MEMORY[0x1F40E5450]();
}

uint64_t sub_1D765FFE0()
{
  return MEMORY[0x1F4186950]();
}

uint64_t sub_1D765FFF0()
{
  return MEMORY[0x1F4186960]();
}

uint64_t sub_1D7660000()
{
  return MEMORY[0x1F4186970]();
}

uint64_t sub_1D7660010()
{
  return MEMORY[0x1F41884F8]();
}

uint64_t sub_1D7660020()
{
  return MEMORY[0x1F4188498]();
}

uint64_t sub_1D7660030()
{
  return MEMORY[0x1F412ED38]();
}

uint64_t _s7Mercury12RemoteDeviceC0b7PairingC0E18endpointIdentifierSSvg_0()
{
  return MEMORY[0x1F412ED40]();
}

uint64_t sub_1D7660050()
{
  return MEMORY[0x1F412ED48]();
}

uint64_t sub_1D7660060()
{
  return MEMORY[0x1F412ED50]();
}

uint64_t sub_1D7660070()
{
  return MEMORY[0x1F412ED58]();
}

uint64_t sub_1D7660080()
{
  return MEMORY[0x1F412ED60]();
}

uint64_t sub_1D7660090()
{
  return MEMORY[0x1F412ED68]();
}

uint64_t sub_1D76600A0()
{
  return MEMORY[0x1F412ED70]();
}

uint64_t sub_1D76600B0()
{
  return MEMORY[0x1F412ED78]();
}

uint64_t sub_1D76600C0()
{
  return MEMORY[0x1F412ED80]();
}

uint64_t sub_1D76600D0()
{
  return MEMORY[0x1F412ED88]();
}

uint64_t sub_1D76600E0()
{
  return MEMORY[0x1F412ED90]();
}

uint64_t sub_1D76600F0()
{
  return MEMORY[0x1F412ED98]();
}

uint64_t sub_1D7660100()
{
  return MEMORY[0x1F412EDA0]();
}

uint64_t sub_1D7660110()
{
  return MEMORY[0x1F412EDA8]();
}

uint64_t sub_1D7660120()
{
  return MEMORY[0x1F412EDB0]();
}

uint64_t sub_1D7660130()
{
  return MEMORY[0x1F412EDB8]();
}

uint64_t sub_1D7660140()
{
  return MEMORY[0x1F412EDC0]();
}

uint64_t sub_1D7660150()
{
  return MEMORY[0x1F412EDC8]();
}

uint64_t sub_1D7660160()
{
  return MEMORY[0x1F412EDD0]();
}

uint64_t sub_1D7660170()
{
  return MEMORY[0x1F412EDD8]();
}

uint64_t sub_1D7660180()
{
  return MEMORY[0x1F412EDE0]();
}

uint64_t sub_1D7660190()
{
  return MEMORY[0x1F412EDE8]();
}

uint64_t sub_1D76601A0()
{
  return MEMORY[0x1F412EDF0]();
}

uint64_t sub_1D76601B0()
{
  return MEMORY[0x1F412EDF8]();
}

uint64_t sub_1D76601C0()
{
  return MEMORY[0x1F412EE00]();
}

uint64_t sub_1D76601D0()
{
  return MEMORY[0x1F412EE08]();
}

uint64_t sub_1D76601E0()
{
  return MEMORY[0x1F412EE10]();
}

uint64_t _s19RemotePairingDevice014CreateWirelessB14SessionRequestV8endpointSo13OS_xpc_object_pvg_0()
{
  return MEMORY[0x1F412EE18]();
}

uint64_t _s19RemotePairingDevice014CreateWirelessB14SessionRequestV8endpointSo13OS_xpc_object_pvs_0()
{
  return MEMORY[0x1F412EE20]();
}

uint64_t sub_1D7660210()
{
  return MEMORY[0x1F412EE28]();
}

uint64_t sub_1D7660220()
{
  return MEMORY[0x1F412EE30]();
}

uint64_t sub_1D7660230()
{
  return MEMORY[0x1F412EE38]();
}

uint64_t sub_1D7660240()
{
  return MEMORY[0x1F412EE40]();
}

uint64_t sub_1D7660250()
{
  return MEMORY[0x1F412EE48]();
}

uint64_t sub_1D7660260()
{
  return MEMORY[0x1F412EE50]();
}

uint64_t sub_1D7660270()
{
  return MEMORY[0x1F412EE58]();
}

uint64_t sub_1D7660280()
{
  return MEMORY[0x1F412EE60]();
}

uint64_t sub_1D7660290()
{
  return MEMORY[0x1F412EE68]();
}

uint64_t sub_1D76602A0()
{
  return MEMORY[0x1F412EE70]();
}

uint64_t sub_1D7660330()
{
  return MEMORY[0x1F412EEB8]();
}

uint64_t sub_1D7660340()
{
  return MEMORY[0x1F412EEC0]();
}

uint64_t sub_1D7660350()
{
  return MEMORY[0x1F412EEC8]();
}

uint64_t sub_1D7660360()
{
  return MEMORY[0x1F412EED0]();
}

uint64_t sub_1D7660380()
{
  return MEMORY[0x1F412EEE0]();
}

uint64_t sub_1D7660390()
{
  return MEMORY[0x1F412EEE8]();
}

uint64_t sub_1D76603A0()
{
  return MEMORY[0x1F412EEF0]();
}

uint64_t sub_1D76603B0()
{
  return MEMORY[0x1F40F1F08]();
}

uint64_t sub_1D76603C0()
{
  return MEMORY[0x1F40F1F40]();
}

uint64_t sub_1D76603D0()
{
  return MEMORY[0x1F40F1F50]();
}

uint64_t sub_1D76603E0()
{
  return MEMORY[0x1F40F1F60]();
}

uint64_t sub_1D76603F0()
{
  return MEMORY[0x1F40F1FB8]();
}

uint64_t sub_1D7660400()
{
  return MEMORY[0x1F40F1FC0]();
}

uint64_t sub_1D7660410()
{
  return MEMORY[0x1F40F1FC8]();
}

uint64_t sub_1D7660420()
{
  return MEMORY[0x1F40F1FD0]();
}

uint64_t sub_1D7660430()
{
  return MEMORY[0x1F40F1FD8]();
}

uint64_t sub_1D7660440()
{
  return MEMORY[0x1F40F1FE0]();
}

uint64_t sub_1D7660450()
{
  return MEMORY[0x1F40F1FE8]();
}

uint64_t sub_1D7660460()
{
  return MEMORY[0x1F40F1FF8]();
}

uint64_t sub_1D7660470()
{
  return MEMORY[0x1F40F2008]();
}

uint64_t sub_1D7660480()
{
  return MEMORY[0x1F40F2020]();
}

uint64_t sub_1D7660490()
{
  return MEMORY[0x1F40F2028]();
}

uint64_t sub_1D76604A0()
{
  return MEMORY[0x1F40F2030]();
}

uint64_t sub_1D76604B0()
{
  return MEMORY[0x1F40F2048]();
}

uint64_t sub_1D76604C0()
{
  return MEMORY[0x1F40F2050]();
}

uint64_t sub_1D76604D0()
{
  return MEMORY[0x1F40F2068]();
}

uint64_t sub_1D76604E0()
{
  return MEMORY[0x1F40F2080]();
}

uint64_t sub_1D76604F0()
{
  return MEMORY[0x1F40F2090]();
}

uint64_t sub_1D7660500()
{
  return MEMORY[0x1F40F20B8]();
}

uint64_t sub_1D7660510()
{
  return MEMORY[0x1F40F20D8]();
}

uint64_t sub_1D7660520()
{
  return MEMORY[0x1F40F20E8]();
}

uint64_t sub_1D7660530()
{
  return MEMORY[0x1F40F20F8]();
}

uint64_t sub_1D7660540()
{
  return MEMORY[0x1F40F2178]();
}

uint64_t sub_1D7660550()
{
  return MEMORY[0x1F40F21D0]();
}

uint64_t sub_1D7660560()
{
  return MEMORY[0x1F40F2200]();
}

uint64_t sub_1D7660570()
{
  return MEMORY[0x1F40F2210]();
}

uint64_t sub_1D7660580()
{
  return MEMORY[0x1F40F2238]();
}

uint64_t sub_1D7660590()
{
  return MEMORY[0x1F40F2240]();
}

uint64_t sub_1D76605A0()
{
  return MEMORY[0x1F40F2258]();
}

uint64_t sub_1D76605B0()
{
  return MEMORY[0x1F40F2268]();
}

uint64_t sub_1D76605C0()
{
  return MEMORY[0x1F40F2270]();
}

uint64_t sub_1D76605D0()
{
  return MEMORY[0x1F40F2288]();
}

uint64_t sub_1D76605E0()
{
  return MEMORY[0x1F40F2298]();
}

uint64_t sub_1D76605F0()
{
  return MEMORY[0x1F40F22A8]();
}

uint64_t sub_1D7660600()
{
  return MEMORY[0x1F40F22B0]();
}

uint64_t sub_1D7660610()
{
  return MEMORY[0x1F40F22C0]();
}

uint64_t sub_1D7660620()
{
  return MEMORY[0x1F40F22D0]();
}

uint64_t sub_1D7660630()
{
  return MEMORY[0x1F40F2308]();
}

uint64_t sub_1D7660640()
{
  return MEMORY[0x1F40F2310]();
}

uint64_t sub_1D7660650()
{
  return MEMORY[0x1F40F2338]();
}

uint64_t sub_1D7660660()
{
  return MEMORY[0x1F40F2348]();
}

uint64_t sub_1D7660670()
{
  return MEMORY[0x1F40F2368]();
}

uint64_t sub_1D7660680()
{
  return MEMORY[0x1F40F2378]();
}

uint64_t sub_1D7660690()
{
  return MEMORY[0x1F40F23D8]();
}

uint64_t sub_1D76606A0()
{
  return MEMORY[0x1F40F23E0]();
}

uint64_t sub_1D76606B0()
{
  return MEMORY[0x1F40F23E8]();
}

uint64_t sub_1D76606C0()
{
  return MEMORY[0x1F40F2400]();
}

uint64_t sub_1D76606D0()
{
  return MEMORY[0x1F40F2408]();
}

uint64_t sub_1D76606E0()
{
  return MEMORY[0x1F40F2420]();
}

uint64_t sub_1D76606F0()
{
  return MEMORY[0x1F40F2438]();
}

uint64_t sub_1D7660700()
{
  return MEMORY[0x1F40F2480]();
}

uint64_t sub_1D7660710()
{
  return MEMORY[0x1F40F2488]();
}

uint64_t sub_1D7660720()
{
  return MEMORY[0x1F40F24A0]();
}

uint64_t sub_1D7660730()
{
  return MEMORY[0x1F40F24B0]();
}

uint64_t sub_1D7660740()
{
  return MEMORY[0x1F40F24C0]();
}

uint64_t sub_1D7660750()
{
  return MEMORY[0x1F40F24C8]();
}

uint64_t sub_1D7660760()
{
  return MEMORY[0x1F40F25D0]();
}

uint64_t sub_1D7660770()
{
  return MEMORY[0x1F40F25D8]();
}

uint64_t sub_1D7660780()
{
  return MEMORY[0x1F40F25F0]();
}

uint64_t sub_1D7660790()
{
  return MEMORY[0x1F40F2608]();
}

uint64_t sub_1D76607A0()
{
  return MEMORY[0x1F40F2610]();
}

uint64_t sub_1D76607B0()
{
  return MEMORY[0x1F40F2640]();
}

uint64_t sub_1D76607C0()
{
  return MEMORY[0x1F40F26B8]();
}

uint64_t sub_1D76607D0()
{
  return MEMORY[0x1F40F26C0]();
}

uint64_t sub_1D76607E0()
{
  return MEMORY[0x1F40F26E8]();
}

uint64_t sub_1D76607F0()
{
  return MEMORY[0x1F40F2710]();
}

uint64_t sub_1D7660800()
{
  return MEMORY[0x1F40F2738]();
}

uint64_t sub_1D7660810()
{
  return MEMORY[0x1F40F2740]();
}

uint64_t sub_1D7660820()
{
  return MEMORY[0x1F40F2748]();
}

uint64_t sub_1D7660830()
{
  return MEMORY[0x1F40F2750]();
}

uint64_t sub_1D7660840()
{
  return MEMORY[0x1F40F2758]();
}

uint64_t sub_1D7660850()
{
  return MEMORY[0x1F40F2760]();
}

uint64_t sub_1D7660860()
{
  return MEMORY[0x1F40F2768]();
}

uint64_t sub_1D7660870()
{
  return MEMORY[0x1F40F2770]();
}

uint64_t sub_1D7660880()
{
  return MEMORY[0x1F40F2778]();
}

uint64_t sub_1D7660890()
{
  return MEMORY[0x1F40F2780]();
}

uint64_t sub_1D76608A0()
{
  return MEMORY[0x1F40F2788]();
}

uint64_t sub_1D76608B0()
{
  return MEMORY[0x1F40F2790]();
}

uint64_t sub_1D76608C0()
{
  return MEMORY[0x1F40F2798]();
}

uint64_t sub_1D76608D0()
{
  return MEMORY[0x1F40F27A0]();
}

uint64_t sub_1D76608E0()
{
  return MEMORY[0x1F40F27A8]();
}

uint64_t sub_1D76608F0()
{
  return MEMORY[0x1F40F27B0]();
}

uint64_t sub_1D7660900()
{
  return MEMORY[0x1F4186C68]();
}

uint64_t sub_1D7660910()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1D7660920()
{
  return MEMORY[0x1F4186CD8]();
}

uint64_t sub_1D7660930()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1D7660940()
{
  return MEMORY[0x1F4186D20]();
}

uint64_t sub_1D7660950()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1D7660960()
{
  return MEMORY[0x1F4186DB0]();
}

uint64_t sub_1D7660970()
{
  return MEMORY[0x1F4186DD0]();
}

uint64_t sub_1D7660980()
{
  return MEMORY[0x1F4186DF8]();
}

uint64_t sub_1D7660990()
{
  return MEMORY[0x1F4186E20]();
}

uint64_t sub_1D76609A0()
{
  return MEMORY[0x1F4186E58]();
}

uint64_t sub_1D76609B0()
{
  return MEMORY[0x1F4186EA8]();
}

uint64_t sub_1D76609C0()
{
  return MEMORY[0x1F4186EB8]();
}

uint64_t sub_1D76609D0()
{
  return MEMORY[0x1F4186EE0]();
}

uint64_t sub_1D76609E0()
{
  return MEMORY[0x1F4186EF0]();
}

uint64_t sub_1D76609F0()
{
  return MEMORY[0x1F4186F00]();
}

uint64_t sub_1D7660A00()
{
  return MEMORY[0x1F4186F38]();
}

uint64_t sub_1D7660A10()
{
  return MEMORY[0x1F40E5FF8]();
}

uint64_t sub_1D7660A20()
{
  return MEMORY[0x1F40E6020]();
}

uint64_t sub_1D7660A30()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_1D7660A40()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1D7660A50()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1D7660A60()
{
  return MEMORY[0x1F4183460]();
}

uint64_t sub_1D7660A70()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D7660A80()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1D7660A90()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1D7660AA0()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1D7660AB0()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1D7660AC0()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1D7660AD0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D7660AE0()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1D7660AF0()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t sub_1D7660B00()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t sub_1D7660B10()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1D7660B20()
{
  return MEMORY[0x1F40E61E0]();
}

uint64_t sub_1D7660B30()
{
  return MEMORY[0x1F40E6230]();
}

uint64_t sub_1D7660B40()
{
  return MEMORY[0x1F40E6270]();
}

uint64_t sub_1D7660B50()
{
  return MEMORY[0x1F40E62A8]();
}

uint64_t sub_1D7660B60()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1D7660B70()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1D7660B80()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1D7660B90()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D7660BA0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1D7660BB0()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1D7660BC0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D7660BD0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D7660BE0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1D7660BF0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1D7660C10()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1D7660C20()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1D7660C30()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1D7660C40()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1D7660C50()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1D7660C70()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1D7660C80()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1D7660C90()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t sub_1D7660CA0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1D7660CB0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1D7660CC0()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1D7660CD0()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1D7660CE0()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1D7660CF0()
{
  return MEMORY[0x1F40E6358]();
}

uint64_t sub_1D7660D00()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1D7660D10()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1D7660D20()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1D7660D30()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1D7660D40()
{
  return MEMORY[0x1F40E6480]();
}

uint64_t sub_1D7660D50()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1D7660D60()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1D7660D70()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1D7660D80()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1D7660D90()
{
  return MEMORY[0x1F41886B8]();
}

uint64_t sub_1D7660DA0()
{
  return MEMORY[0x1F41886C8]();
}

uint64_t sub_1D7660DB0()
{
  return MEMORY[0x1F41886D8]();
}

uint64_t sub_1D7660DC0()
{
  return MEMORY[0x1F41886F0]();
}

uint64_t sub_1D7660DD0()
{
  return MEMORY[0x1F41886F8]();
}

uint64_t sub_1D7660DE0()
{
  return MEMORY[0x1F4186F48]();
}

uint64_t sub_1D7660DF0()
{
  return MEMORY[0x1F4186F50]();
}

uint64_t sub_1D7660E00()
{
  return MEMORY[0x1F4186F58]();
}

uint64_t sub_1D7660E10()
{
  return MEMORY[0x1F4186F60]();
}

uint64_t sub_1D7660E20()
{
  return MEMORY[0x1F4186F68]();
}

uint64_t sub_1D7660E30()
{
  return MEMORY[0x1F4186F70]();
}

uint64_t sub_1D7660E40()
{
  return MEMORY[0x1F4186F78]();
}

uint64_t sub_1D7660E50()
{
  return MEMORY[0x1F40E66C0]();
}

uint64_t sub_1D7660E60()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t sub_1D7660E70()
{
  return MEMORY[0x1F4186FF8]();
}

uint64_t sub_1D7660E80()
{
  return MEMORY[0x1F4187008]();
}

uint64_t sub_1D7660E90()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_1D7660EA0()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_1D7660EB0()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t sub_1D7660EC0()
{
  return MEMORY[0x1F4187118]();
}

uint64_t sub_1D7660ED0()
{
  return MEMORY[0x1F4187138]();
}

uint64_t sub_1D7660EE0()
{
  return MEMORY[0x1F4187140]();
}

uint64_t sub_1D7660EF0()
{
  return MEMORY[0x1F4187160]();
}

uint64_t sub_1D7660F00()
{
  return MEMORY[0x1F4187170]();
}

uint64_t sub_1D7660F10()
{
  return MEMORY[0x1F41871D8]();
}

uint64_t sub_1D7660F20()
{
  return MEMORY[0x1F41871F8]();
}

uint64_t sub_1D7660F30()
{
  return MEMORY[0x1F4187208]();
}

uint64_t sub_1D7660F40()
{
  return MEMORY[0x1F4187220]();
}

uint64_t sub_1D7660F50()
{
  return MEMORY[0x1F4187228]();
}

uint64_t sub_1D7660F60()
{
  return MEMORY[0x1F4187238]();
}

uint64_t sub_1D7660F70()
{
  return MEMORY[0x1F412EEF8]();
}

uint64_t sub_1D7660F80()
{
  return MEMORY[0x1F41872C8]();
}

uint64_t sub_1D7660F90()
{
  return MEMORY[0x1F412EF00]();
}

uint64_t sub_1D7660FA0()
{
  return MEMORY[0x1F412EF08]();
}

uint64_t sub_1D7660FB0()
{
  return MEMORY[0x1F412EF10]();
}

uint64_t sub_1D7660FC0()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1D7660FD0()
{
  return MEMORY[0x1F412EF18]();
}

uint64_t sub_1D7660FE0()
{
  return MEMORY[0x1F4188750]();
}

uint64_t sub_1D7660FF0()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1D7661000()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1D7661010()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1D7661020()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D7661030()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D7661040()
{
  return MEMORY[0x1F40E6C88]();
}

uint64_t sub_1D7661050()
{
  return MEMORY[0x1F40E6D50]();
}

uint64_t sub_1D7661060()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1D7661070()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D7661090()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D76610A0()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1D76610B0()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1D76610C0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D76610D0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D76610E0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D76610F0()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1D7661100()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1D7661110()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D7661120()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D7661130()
{
  return MEMORY[0x1F4184DB0]();
}

uint64_t sub_1D7661140()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1D7661150()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1D7661160()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D7661170()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D7661180()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D7661190()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1D76611A0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D76611B0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D76611C0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D76611D0()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1D76611E0()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1D76611F0()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1D7661200()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1D7661210()
{
  return MEMORY[0x1F4185130]();
}

uint64_t sub_1D7661220()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1D7661230()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1D7661240()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1D7661250()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D7661260()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D7661270()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D7661280()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D7661290()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D76612A0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D76612C0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1D76612D0()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1D76612E0()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1D76612F0()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1D7661300()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1D7661310()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1D7661320()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1D7661330()
{
  return MEMORY[0x1F4185560]();
}

uint64_t sub_1D7661340()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1D7661350()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1D7661360()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1D7661370()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1D7661380()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1D7661390()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1D76613A0()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1D76613B0()
{
  return MEMORY[0x1F41855C8]();
}

uint64_t sub_1D76613C0()
{
  return MEMORY[0x1F41855D8]();
}

uint64_t sub_1D76613D0()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1D76613E0()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1D76613F0()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1D7661400()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1D7661410()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1D7661420()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1D7661430()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1D7661440()
{
  return MEMORY[0x1F4185688]();
}

uint64_t sub_1D7661450()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1D7661460()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1D7661470()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1D7661480()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1D7661490()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1D76614A0()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1D76614B0()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1D76614C0()
{
  return MEMORY[0x1F41856F0]();
}

uint64_t sub_1D76614D0()
{
  return MEMORY[0x1F4185700]();
}

uint64_t sub_1D76614E0()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1D76614F0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1D7661500()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D7661510()
{
  return MEMORY[0x1F4185760]();
}

uint64_t sub_1D7661520()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1D7661530()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1D7661540()
{
  return MEMORY[0x1F4185A08]();
}

uint64_t sub_1D7661550()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1D7661560()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D7661570()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1D7661580()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1D7661590()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1D76615A0()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1D76615B0()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1D76615C0()
{
  return MEMORY[0x1F412EF20]();
}

uint64_t sub_1D76615D0()
{
  return MEMORY[0x1F412EF28]();
}

uint64_t sub_1D76615E0()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1D76615F0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D7661600()
{
  return MEMORY[0x1F40E6E08]();
}

uint64_t sub_1D7661610()
{
  return MEMORY[0x1F40E6E18]();
}

uint64_t sub_1D7661620()
{
  return MEMORY[0x1F40E6E28]();
}

uint64_t sub_1D7661630()
{
  return MEMORY[0x1F412EF30]();
}

uint64_t sub_1D7661640()
{
  return MEMORY[0x1F412EF38]();
}

uint64_t sub_1D7661650()
{
  return MEMORY[0x1F412EF40]();
}

uint64_t sub_1D7661660()
{
  return MEMORY[0x1F412EF48]();
}

uint64_t sub_1D7661670()
{
  return MEMORY[0x1F412EF50]();
}

uint64_t sub_1D7661680()
{
  return MEMORY[0x1F412EF58]();
}

uint64_t sub_1D7661690()
{
  return MEMORY[0x1F412EF60]();
}

uint64_t sub_1D76616A0()
{
  return MEMORY[0x1F412EF68]();
}

uint64_t sub_1D76616B0()
{
  return MEMORY[0x1F412EF70]();
}

uint64_t sub_1D76616C0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D76616D0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D76616E0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D76616F0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D7661700()
{
  return MEMORY[0x1F40E6E78]();
}

uint64_t sub_1D7661710()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1D7661720()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1D7661730()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D7661740()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D7661750()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1D7661760()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1D7661770()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1D7661780()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1D7661790()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1D76617A0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1D76617B0()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1D76617C0()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1D76617F0()
{
  return MEMORY[0x1F4186318]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x1F4116298]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E8680](*(void *)&mainPort, *(void *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1F40E8F38](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1F40E91C8](*(void *)&entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDD8]();
}

uint64_t MKBKeyBagCopyData()
{
  return MEMORY[0x1F412F998]();
}

uint64_t MKBKeyBagCreateEscrow()
{
  return MEMORY[0x1F412F9A0]();
}

uint64_t MKBKeyBagCreateWithData()
{
  return MEMORY[0x1F412F9B0]();
}

uint64_t MKBKeyBagUnlock()
{
  return MEMORY[0x1F412F9D8]();
}

uint64_t NEVirtualInterfaceAddAddress()
{
  return MEMORY[0x1F40F42F0]();
}

uint64_t NEVirtualInterfaceCopyName()
{
  return MEMORY[0x1F40F42F8]();
}

uint64_t NEVirtualInterfaceCopyNexusInstances()
{
  return MEMORY[0x1F40F4300]();
}

uint64_t NEVirtualInterfaceCopyStatistics()
{
  return MEMORY[0x1F40F4308]();
}

uint64_t NEVirtualInterfaceCreateNexusExtendedWithOptions()
{
  return MEMORY[0x1F40F4310]();
}

uint64_t NEVirtualInterfaceCreateWithOptions()
{
  return MEMORY[0x1F40F4318]();
}

uint64_t NEVirtualInterfaceInvalidate()
{
  return MEMORY[0x1F40F4320]();
}

uint64_t NEVirtualInterfaceSetDelegateInterface()
{
  return MEMORY[0x1F40F4330]();
}

uint64_t NEVirtualInterfaceSetMTU()
{
  return MEMORY[0x1F40F4338]();
}

uint64_t NEVirtualInterfaceSetMaxPendingPackets()
{
  return MEMORY[0x1F40F4340]();
}

uint64_t NEVirtualInterfaceSetRankNever()
{
  return MEMORY[0x1F40F4348]();
}

uint64_t NEVirtualInterfaceSetReadAutomatically()
{
  return MEMORY[0x1F40F4350]();
}

uint64_t NEVirtualInterfaceSetReadMultipleIPPacketsHandler()
{
  return MEMORY[0x1F40F4358]();
}

uint64_t NEVirtualInterfaceUpdateAdHocService()
{
  return MEMORY[0x1F40F4360]();
}

uint64_t NEVirtualInterfaceWriteMultipleIPPackets()
{
  return MEMORY[0x1F40F4368]();
}

uint64_t NWCreateDispatchDataFromNSData()
{
  return MEMORY[0x1F40F27C0]();
}

uint64_t NWCreateNSDataFromDispatchData()
{
  return MEMORY[0x1F40F27D0]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x1F4101D78](store, nameEncoding);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B08](certificate);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x1F40F6DB0]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1F40F6DC8]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E68](key);
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x1F40F6E80]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE8](parameters, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F8](rnd, count, bytes);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1F4116BA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1F40CAC28]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB038]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1F40CB160]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F0](*(void *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1F40CC648](*(void *)&a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD030](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD068](name, out_token, queue, handler);
}

uint64_t nw_channel_close()
{
  return MEMORY[0x1F40F2A00]();
}

uint64_t nw_channel_create_with_attributes()
{
  return MEMORY[0x1F40F2A10]();
}

uint64_t nw_channel_get_protocol_handler()
{
  return MEMORY[0x1F40F2A38]();
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1F40F2AC8](connection, definition);
}

uint64_t nw_connection_receive_multiple()
{
  return MEMORY[0x1F40F2C00]();
}

uint64_t nw_connection_write_multiple()
{
  return MEMORY[0x1F40F2CE8]();
}

uint64_t nw_context_activate()
{
  return MEMORY[0x1F40F2D40]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x1F40F2D78]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x1F40F2DB8]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x1F40F2DD0]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x1F40F2FF0]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x1F40F2FF8]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x1F40F3018]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1F40F3048]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1F40F3060]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1F40F3080]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x1F40F30E0]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x1F40F30E8]();
}

nw_protocol_definition_t nw_protocol_copy_quic_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3A30]();
}

uint64_t nw_protocol_create()
{
  return MEMORY[0x1F40F3A70]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x1F40F3B10]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x1F40F3C90]();
}

uint16_t nw_quic_get_stream_usable_datagram_frame_size(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x1F40F3D90](metadata);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181720](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x1F40F7390](identity);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B8](__dst, __source, __size);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBB8](endpoint);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF010](connection);
}

uint64_t xpc_remote_connection_get_remote_service_version()
{
  return MEMORY[0x1F4149838]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}