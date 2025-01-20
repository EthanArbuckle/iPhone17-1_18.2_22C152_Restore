uint64_t sub_25C874364(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v3 = (void *)(v2 + qword_26B355728);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t GestureBridge.__allocating_init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  sub_25C8774DC(a3, (uint64_t)v17);
  sub_25C8774DC(a6, (uint64_t)v16);
  sub_25C8774DC(a3, (uint64_t)v15);
  type metadata accessor for GestureOutputSubmitter();
  swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v12 = sub_25C88AE80(v15, a4);
  type metadata accessor for GestureBridge();
  swift_allocObject();
  uint64_t v13 = sub_25C874484(a1, a2, (uint64_t)v17, a4, a5, (uint64_t)v16, v12, 0, 0);
  __swift_destroy_boxed_opaque_existential_1Tm(a6);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  return v13;
}

uint64_t sub_25C874484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, _UNKNOWN **a9)
{
  sub_25C892340();
  OUTLINED_FUNCTION_4();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7();
  uint64_t v15 = sub_25C892400();
  OUTLINED_FUNCTION_4();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_7();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = v9 + qword_26B355550;
  *(_OWORD *)uint64_t v22 = 0u;
  *(_OWORD *)(v22 + 16) = 0u;
  *(void *)(v22 + 32) = 0;
  uint64_t v23 = sub_25C891AE0();
  OUTLINED_FUNCTION_17(v23);
  v24 = (void *)(v9 + qword_26B355728);
  void *v24 = 0;
  v24[1] = 0;
  uint64_t v25 = sub_25C892290();
  OUTLINED_FUNCTION_17(v25);
  v26 = (void *)(v9 + qword_26B355810);
  void *v26 = 0;
  v26[1] = 0;
  uint64_t v27 = v9 + qword_26B355720;
  *(void *)uint64_t v27 = 0;
  *(unsigned char *)(v27 + 8) = 1;
  *(void *)(v9 + qword_26B355730) = 0;
  sub_25C8774DC(a3, (uint64_t)v101);
  uint64_t v98 = a6;
  sub_25C8774DC(a6, (uint64_t)v100);
  uint64_t v28 = qword_26B355230;
  swift_unknownObjectRetain();
  id v29 = a5;
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v15, (uint64_t)qword_26B355748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, v30, v15);
  uint64_t v31 = sub_25C8922F0();
  *(void *)(v31 + qword_26B355730) = a7;
  swift_retain();
  swift_retain();
  swift_release();
  v33 = a8;
  if (!a8)
  {
    id v34 = objc_allocWithZone((Class)type metadata accessor for GestureController());
    swift_unknownObjectRetain();
    sub_25C87E15C();
    a9 = &off_2709EC4E0;
  }
  v97 = v29;
  v35 = (void *)(v31 + qword_26B355810);
  v36 = *(void **)(v31 + qword_26B355810);
  void *v35 = v33;
  v35[1] = a9;
  id v96 = a8;

  if (*v35)
  {
    *(void *)(*v35 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate + 8) = &off_2709EC958;
    swift_unknownObjectWeakAssign();
  }
  sub_25C891CA0();
  OUTLINED_FUNCTION_12();
  sub_25C892350();
  swift_release();
  sub_25C891D60();
  OUTLINED_FUNCTION_12();
  sub_25C892350();
  swift_release();
  sub_25C892100();
  OUTLINED_FUNCTION_12();
  sub_25C892350();
  swift_release();
  sub_25C892070();
  OUTLINED_FUNCTION_12();
  sub_25C892350();
  swift_release();
  v37 = *(void (**)(void))(v13 + 104);
  uint64_t v38 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v38);
  sub_25C891DB0();
  type metadata accessor for GestureRequestProcessor();
  swift_retain();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8750FC);
  swift_release();
  v39 = *(void (**)(uint64_t))(v13 + 8);
  uint64_t v40 = OUTLINED_FUNCTION_2();
  v39(v40);
  uint64_t v41 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v41);
  sub_25C891F20();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875140);
  swift_release();
  uint64_t v42 = OUTLINED_FUNCTION_2();
  v39(v42);
  uint64_t v43 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v43);
  sub_25C891CB0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875184);
  swift_release();
  uint64_t v44 = OUTLINED_FUNCTION_2();
  v39(v44);
  uint64_t v45 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v45);
  sub_25C891D90();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8751C8);
  swift_release();
  uint64_t v46 = OUTLINED_FUNCTION_2();
  v39(v46);
  uint64_t v47 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v47);
  sub_25C891DC0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C87520C);
  swift_release();
  uint64_t v48 = OUTLINED_FUNCTION_2();
  v39(v48);
  uint64_t v49 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v49);
  sub_25C891E50();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875250);
  swift_release();
  uint64_t v50 = OUTLINED_FUNCTION_2();
  v39(v50);
  uint64_t v51 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v51);
  sub_25C891E00();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875294);
  swift_release();
  uint64_t v52 = OUTLINED_FUNCTION_2();
  v39(v52);
  uint64_t v53 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v53);
  sub_25C891FE0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8752D8);
  swift_release();
  uint64_t v54 = OUTLINED_FUNCTION_2();
  v39(v54);
  uint64_t v55 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v55);
  sub_25C891E20();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C87531C);
  swift_release();
  uint64_t v56 = OUTLINED_FUNCTION_2();
  v39(v56);
  uint64_t v57 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v57);
  sub_25C891F10();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875360);
  swift_release();
  uint64_t v58 = OUTLINED_FUNCTION_2();
  v39(v58);
  uint64_t v59 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v59);
  sub_25C891E40();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8753A4);
  swift_release();
  uint64_t v60 = OUTLINED_FUNCTION_2();
  v39(v60);
  uint64_t v61 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v61);
  sub_25C892000();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8753E8);
  swift_release();
  uint64_t v62 = OUTLINED_FUNCTION_2();
  v39(v62);
  OUTLINED_FUNCTION_3();
  v37();
  sub_25C891D80();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C87542C);
  swift_release();
  uint64_t v63 = OUTLINED_FUNCTION_2();
  v39(v63);
  OUTLINED_FUNCTION_3();
  v37();
  sub_25C891E10();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875470);
  swift_release();
  uint64_t v64 = OUTLINED_FUNCTION_2();
  v39(v64);
  OUTLINED_FUNCTION_3();
  v37();
  sub_25C891DD0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8754B4);
  swift_release();
  uint64_t v65 = OUTLINED_FUNCTION_2();
  v39(v65);
  OUTLINED_FUNCTION_3();
  v37();
  sub_25C891C90();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8754F8);
  swift_release();
  uint64_t v66 = OUTLINED_FUNCTION_2();
  v39(v66);
  uint64_t v67 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v67);
  sub_25C891D70();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_20((uint64_t)sub_25C87553C);
  swift_release();
  uint64_t v68 = OUTLINED_FUNCTION_2();
  v39(v68);
  uint64_t v69 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v69);
  sub_25C8920E0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875580);
  swift_release();
  uint64_t v70 = OUTLINED_FUNCTION_2();
  v39(v70);
  uint64_t v71 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v71);
  sub_25C8920F0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8755C4);
  swift_release();
  uint64_t v72 = OUTLINED_FUNCTION_2();
  v39(v72);
  uint64_t v73 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v73);
  sub_25C891FF0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875608);
  swift_release();
  uint64_t v74 = OUTLINED_FUNCTION_2();
  v39(v74);
  uint64_t v75 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v75);
  sub_25C892040();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C87564C);
  swift_release();
  uint64_t v76 = OUTLINED_FUNCTION_2();
  v39(v76);
  uint64_t v77 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v77);
  sub_25C891F30();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875690);
  swift_release();
  uint64_t v78 = OUTLINED_FUNCTION_2();
  v39(v78);
  uint64_t v79 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v79);
  sub_25C892010();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8756D4);
  swift_release();
  uint64_t v80 = OUTLINED_FUNCTION_2();
  v39(v80);
  uint64_t v81 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v81);
  sub_25C892020();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875718);
  swift_release();
  uint64_t v82 = OUTLINED_FUNCTION_2();
  v39(v82);
  uint64_t v83 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v83);
  sub_25C892050();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C87575C);
  swift_release();
  uint64_t v84 = OUTLINED_FUNCTION_2();
  v39(v84);
  uint64_t v85 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v85);
  sub_25C891DF0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8757A0);
  swift_release();
  uint64_t v86 = OUTLINED_FUNCTION_2();
  v39(v86);
  uint64_t v87 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v87);
  sub_25C891E60();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C8757E4);
  swift_release();
  uint64_t v88 = OUTLINED_FUNCTION_2();
  v39(v88);
  uint64_t v89 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v89);
  sub_25C891CC0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0((uint64_t)sub_25C875828);
  swift_release();
  uint64_t v90 = OUTLINED_FUNCTION_2();
  v39(v90);
  uint64_t v91 = OUTLINED_FUNCTION_1();
  ((void (*)(uint64_t))v37)(v91);
  sub_25C891DA0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_20((uint64_t)sub_25C87586C);
  swift_unknownObjectRelease();

  swift_release();
  swift_release_n();
  __swift_destroy_boxed_opaque_existential_1Tm(v98);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  uint64_t v92 = OUTLINED_FUNCTION_2();
  v39(v92);
  return v31;
}

uint64_t (*sub_25C874FAC())()
{
  return sub_25C87808C;
}

uint64_t (*sub_25C874FF0())()
{
  return sub_25C878088;
}

uint64_t (*sub_25C875034())()
{
  return sub_25C878084;
}

uint64_t (*sub_25C875078())()
{
  return sub_25C878080;
}

uint64_t (*sub_25C8750BC())()
{
  return sub_25C87807C;
}

uint64_t (*sub_25C875100())()
{
  return sub_25C878078;
}

uint64_t (*sub_25C875144())()
{
  return sub_25C878074;
}

uint64_t (*sub_25C875188())()
{
  return sub_25C878070;
}

uint64_t (*sub_25C8751CC())()
{
  return sub_25C87806C;
}

uint64_t (*sub_25C875210())()
{
  return sub_25C878068;
}

uint64_t (*sub_25C875254())()
{
  return sub_25C878064;
}

uint64_t (*sub_25C875298())()
{
  return sub_25C878060;
}

uint64_t (*sub_25C8752DC())()
{
  return sub_25C87805C;
}

uint64_t (*sub_25C875320())()
{
  return sub_25C878058;
}

uint64_t (*sub_25C875364())()
{
  return sub_25C878054;
}

uint64_t (*sub_25C8753A8())()
{
  return sub_25C878050;
}

uint64_t (*sub_25C8753EC())()
{
  return sub_25C87804C;
}

uint64_t (*sub_25C875430())()
{
  return sub_25C878048;
}

uint64_t (*sub_25C875474())()
{
  return sub_25C878044;
}

uint64_t (*sub_25C8754B8())()
{
  return sub_25C878040;
}

uint64_t (*sub_25C8754FC())()
{
  return sub_25C87803C;
}

uint64_t (*sub_25C875540())()
{
  return sub_25C878038;
}

uint64_t (*sub_25C875584())()
{
  return sub_25C878034;
}

uint64_t (*sub_25C8755C8())()
{
  return sub_25C878030;
}

uint64_t (*sub_25C87560C())()
{
  return sub_25C87802C;
}

uint64_t (*sub_25C875650())()
{
  return sub_25C878028;
}

uint64_t (*sub_25C875694())()
{
  return sub_25C878024;
}

uint64_t (*sub_25C8756D8())()
{
  return sub_25C878020;
}

uint64_t (*sub_25C87571C())()
{
  return sub_25C87801C;
}

uint64_t (*sub_25C875760())()
{
  return sub_25C878018;
}

uint64_t (*sub_25C8757A4())()
{
  return sub_25C878014;
}

uint64_t (*sub_25C8757E8())()
{
  return sub_25C878010;
}

uint64_t (*sub_25C87582C())()
{
  return sub_25C87800C;
}

uint64_t sub_25C875870(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C891AE0();
  OUTLINED_FUNCTION_4();
  uint64_t v58 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_18();
  uint64_t v57 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3555A8);
  uint64_t v9 = OUTLINED_FUNCTION_15(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v55 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v51 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v15 = OUTLINED_FUNCTION_15(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_9();
  uint64_t v56 = v16;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v51 - v18;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_25C892400();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B355748);
  id v21 = a1;
  uint64_t v22 = sub_25C8923F0();
  os_log_type_t v23 = sub_25C8925A0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v53 = v19;
    v24 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v25 = OUTLINED_FUNCTION_22();
    uint64_t v54 = v2;
    uint64_t v52 = v25;
    v60[0] = v25;
    *(_DWORD *)v24 = 136315138;
    uint64_t v26 = v4;
    uint64_t v27 = v13;
    id v28 = objc_msgSend(v21, sel_debugDescription, v24 + 4, v52);
    uint64_t v29 = sub_25C892500();
    unint64_t v31 = v30;

    uint64_t v13 = v27;
    uint64_t v4 = v26;
    uint64_t v32 = v29;
    uint64_t v19 = v53;
    v59[0] = sub_25C8773AC(v32, v31, v60);
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v22, v23, "Handling SessionStartedMessage: %s", v24, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = v54;
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  sub_25C892090();
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v4);
  uint64_t v33 = v2 + qword_26B355718;
  OUTLINED_FUNCTION_6();
  sub_25C8777AC((uint64_t)v19, v33, &qword_26B3554E0);
  swift_endAccess();
  uint64_t v34 = sub_25C8920B0();
  sub_25C874364(v34, v35);
  sub_25C891D50();
  uint64_t v54 = sub_25C892290();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v54);
  uint64_t v36 = v2 + qword_26B355808;
  OUTLINED_FUNCTION_6();
  sub_25C8777AC((uint64_t)v13, v36, &qword_26B3555A8);
  swift_endAccess();
  sub_25C892380();
  __swift_project_boxed_opaque_existential_1(v60, v60[3]);
  uint64_t v37 = v57;
  sub_25C892090();
  sub_25C892270();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v37, v4);
  uint64_t v38 = v2 + qword_26B355550;
  OUTLINED_FUNCTION_6();
  sub_25C8777AC((uint64_t)v59, v38, &qword_26B355500);
  swift_endAccess();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v60);
  uint64_t v40 = qword_26B355730;
  uint64_t v41 = *(void *)(v2 + qword_26B355730);
  if (v41)
  {
    swift_retain();
    sub_25C892090();
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v4);
    uint64_t v42 = v56;
    sub_25C877834((uint64_t)v19, v56, &qword_26B3554E0);
    uint64_t v43 = v41 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
    OUTLINED_FUNCTION_6();
    sub_25C8777AC(v42, v43, &qword_26B3554E0);
    swift_endAccess();
    uint64_t result = swift_release();
    uint64_t v44 = *(void *)(v2 + v40);
    if (v44)
    {
      swift_retain();
      uint64_t v45 = sub_25C8920B0();
      uint64_t v46 = (uint64_t *)(v44 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentAssistantId);
      *uint64_t v46 = v45;
      v46[1] = v47;
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v48 = *(void *)(v2 + v40);
      if (v48)
      {
        swift_retain();
        sub_25C891D50();
        __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v54);
        uint64_t v49 = v55;
        sub_25C877834((uint64_t)v13, v55, &qword_26B3555A8);
        uint64_t v50 = v48 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
        OUTLINED_FUNCTION_6();
        sub_25C8777AC(v49, v50, &qword_26B3555A8);
        swift_endAccess();
        return swift_release();
      }
    }
  }
  return result;
}

void sub_25C875E0C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3555A8);
  uint64_t v5 = OUTLINED_FUNCTION_15(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_7();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v10 = OUTLINED_FUNCTION_15(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_7();
  uint64_t v13 = v12 - v11;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25C892400();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B355748);
  id v15 = a1;
  uint64_t v16 = sub_25C8923F0();
  os_log_type_t v17 = sub_25C8925A0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_24();
    v39[0] = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v18 = 136315138;
    id v19 = objc_msgSend(v15, sel_debugDescription);
    uint64_t v20 = sub_25C892500();
    unint64_t v22 = v21;

    sub_25C8773AC(v20, v22, v39);
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v16, v17, "Handling SessionEndedMessage: %s", v18, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  sub_25C891AE0();
  OUTLINED_FUNCTION_26();
  uint64_t v23 = v2 + qword_26B355718;
  OUTLINED_FUNCTION_6();
  sub_25C8777AC(v13, v23, &qword_26B3554E0);
  swift_endAccess();
  sub_25C874364(0, 0);
  sub_25C892290();
  OUTLINED_FUNCTION_25();
  uint64_t v24 = v2 + qword_26B355808;
  OUTLINED_FUNCTION_6();
  sub_25C8777AC(v8, v24, &qword_26B3555A8);
  swift_endAccess();
  uint64_t v25 = qword_26B355730;
  uint64_t v26 = *(void *)(v2 + qword_26B355730);
  if (v26)
  {
    OUTLINED_FUNCTION_26();
    uint64_t v27 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
    OUTLINED_FUNCTION_6();
    swift_retain();
    sub_25C8777AC(v13, v27, &qword_26B3554E0);
    swift_endAccess();
    swift_release();
    uint64_t v28 = *(void *)(v2 + v25);
    if (v28)
    {
      uint64_t v29 = (void *)(v28 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentAssistantId);
      *uint64_t v29 = 0;
      v29[1] = 0;
      swift_bridgeObjectRelease();
      uint64_t v30 = *(void *)(v2 + v25);
      if (v30)
      {
        OUTLINED_FUNCTION_25();
        uint64_t v31 = v30 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
        OUTLINED_FUNCTION_6();
        swift_retain();
        sub_25C8777AC(v8, v31, &qword_26B3555A8);
        swift_endAccess();
        swift_release();
      }
    }
  }
  uint64_t v32 = qword_26B355810;
  uint64_t v33 = *(void **)(v2 + qword_26B355810);
  if (v33)
  {
    id v34 = v33;
    sub_25C885C7C(6);

    uint64_t v35 = *(void **)(v2 + v32);
    if (v35)
    {
      id v36 = v35;
      sub_25C885950();

      uint64_t v37 = *(void **)(v2 + v32);
      if (v37)
      {
        id v38 = v37;
        sub_25C885A20();
      }
    }
  }
}

void sub_25C87620C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C892400();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B355748);
  id v5 = a1;
  uint64_t v6 = sub_25C8923F0();
  os_log_type_t v7 = sub_25C8925A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v20 = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = objc_msgSend(v5, sel_debugDescription);
    uint64_t v10 = sub_25C892500();
    unint64_t v12 = v11;

    sub_25C8773AC(v10, v12, &v20);
    OUTLINED_FUNCTION_19();
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v6, v7, "Handling SiriDismissedMessage: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  uint64_t v13 = qword_26B355810;
  uint64_t v14 = *(void **)(v2 + qword_26B355810);
  if (v14)
  {
    id v15 = v14;
    sub_25C885C7C(5);

    uint64_t v16 = *(void **)(v2 + v13);
    if (v16)
    {
      id v17 = v16;
      sub_25C885950();

      uint64_t v18 = *(void **)(v2 + v13);
      if (v18)
      {
        id v19 = v18;
        sub_25C885AF8();
      }
    }
  }
}

void sub_25C876414(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C892400();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B355748);
  id v5 = a1;
  uint64_t v6 = sub_25C8923F0();
  os_log_type_t v7 = sub_25C8925A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v21 = v2;
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v22 = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = objc_msgSend(v5, sel_debugDescription);
    uint64_t v10 = sub_25C892500();
    unint64_t v12 = v11;

    uint64_t v13 = v10;
    uint64_t v2 = v21;
    sub_25C8773AC(v13, v12, &v22);
    OUTLINED_FUNCTION_19();
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v6, v7, "Handling AnnounceNotificationHandlingStateUpdatedMessage: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  uint64_t v14 = sub_25C892060();
  char v15 = *(unsigned char *)(v2 + qword_26B355720 + 8);
  if (v16)
  {
    if (*(unsigned char *)(v2 + qword_26B355720 + 8))
    {
LABEL_10:
      id v17 = sub_25C8923F0();
      os_log_type_t v18 = sub_25C8925B0();
      if (os_log_type_enabled(v17, v18))
      {
        id v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_25C872000, v17, v18, "External notification request handler state did not change", v19, 2u);
        OUTLINED_FUNCTION_8();
      }
      goto LABEL_15;
    }
  }
  else
  {
    if (v14 != *(void *)(v2 + qword_26B355720)) {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      goto LABEL_10;
    }
  }
  sub_25C892060();
  uint64_t v20 = *(void **)(v2 + qword_26B355810);
  if (!v20) {
    return;
  }
  id v17 = v20;
  sub_25C884CE8();
LABEL_15:
}

uint64_t sub_25C876698(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v88 = a8;
  uint64_t v87 = a7;
  uint64_t v86 = a4;
  uint64_t v85 = a3;
  unint64_t v99 = a2;
  uint64_t v94 = a1;
  uint64_t v10 = sub_25C891AE0();
  OUTLINED_FUNCTION_4();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_18();
  uint64_t v92 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B355208);
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_7();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v21 = OUTLINED_FUNCTION_15(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_9();
  uint64_t v89 = v22;
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)v84 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v84 - v27;
  uint64_t v95 = v8;
  uint64_t v29 = v8 + qword_26B355718;
  swift_beginAccess();
  uint64_t v93 = v12;
  uint64_t v30 = *(void (**)(void, void, void))(v12 + 16);
  v84[1] = a5;
  uint64_t v91 = v12 + 16;
  uint64_t v90 = v30;
  v30(v28, a5, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v10);
  uint64_t v31 = *(int *)(v16 + 56);
  uint64_t v32 = v29;
  uint64_t v33 = v19 + v31;
  sub_25C877480(v32, v19, &qword_26B3554E0);
  sub_25C877480((uint64_t)v28, v33, &qword_26B3554E0);
  OUTLINED_FUNCTION_16(v19);
  if (v35)
  {
    sub_25C877590((uint64_t)v28, &qword_26B3554E0);
    OUTLINED_FUNCTION_16(v33);
    uint64_t v34 = v95;
    if (v35)
    {
      sub_25C877590(v19, &qword_26B3554E0);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  sub_25C877480(v19, (uint64_t)v26, &qword_26B3554E0);
  OUTLINED_FUNCTION_16(v33);
  if (v35)
  {
    sub_25C877590((uint64_t)v28, &qword_26B3554E0);
    (*(void (**)(char *, uint64_t))(v93 + 8))(v26, v10);
LABEL_9:
    sub_25C877590(v19, &qword_26B355208);
LABEL_21:
    if (qword_26B355230 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_25C892400();
    __swift_project_value_buffer(v65, (uint64_t)qword_26B355748);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v66 = sub_25C8923F0();
    os_log_type_t v67 = sub_25C8925B0();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = swift_slowAlloc();
      v98[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v68 = 136315394;
      uint64_t v69 = v89;
      sub_25C877480(v32, v89, &qword_26B3554E0);
      if (__swift_getEnumTagSinglePayload(v69, 1, v10))
      {
        sub_25C877590(v69, &qword_26B3554E0);
        unint64_t v70 = 0xE300000000000000;
        uint64_t v71 = 7104878;
      }
      else
      {
        uint64_t v77 = v92;
        OUTLINED_FUNCTION_11();
        v78();
        sub_25C877590(v69, &qword_26B3554E0);
        uint64_t v71 = sub_25C891AC0();
        unint64_t v70 = v79;
        (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v77, v10);
      }
      uint64_t v80 = v94;
      *(void *)&long long v96 = sub_25C8773AC(v71, v70, v98);
      sub_25C892660();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v68 + 12) = 2080;
      unint64_t v81 = v99;
      swift_bridgeObjectRetain();
      *(void *)&long long v96 = sub_25C8773AC(v80, v81, v98);
      sub_25C892660();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C872000, v66, v67, "Request does not belong to current sessionId: %s for requestId: %s", (uint8_t *)v68, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    uint64_t v64 = 0;
    goto LABEL_35;
  }
  uint64_t v36 = v93;
  uint64_t v37 = v92;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 32))(v92, v33, v10);
  sub_25C877540();
  char v38 = sub_25C8924E0();
  v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v39(v37, v10);
  sub_25C877590((uint64_t)v28, &qword_26B3554E0);
  v39((uint64_t)v26, v10);
  uint64_t v34 = v95;
  sub_25C877590(v19, &qword_26B3554E0);
  if ((v38 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v40 = v34 + qword_26B355550;
  swift_beginAccess();
  sub_25C877480(v40, (uint64_t)&v96, &qword_26B355500);
  if (!v97)
  {
    sub_25C877590((uint64_t)&v96, &qword_26B355500);
    if (qword_26B355230 != -1) {
      swift_once();
    }
    uint64_t v72 = sub_25C892400();
    __swift_project_value_buffer(v72, (uint64_t)qword_26B355748);
    uint64_t v73 = sub_25C8923F0();
    os_log_type_t v74 = sub_25C8925B0();
    if (os_log_type_enabled(v73, v74))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_21(&dword_25C872000, v75, v76, "‼️ Unable to find SessionState to pass to GestureProcessor.");
      OUTLINED_FUNCTION_8();
    }

    uint64_t v64 = 1;
LABEL_35:
    sub_25C877360();
    swift_allocError();
    *uint64_t v82 = v64;
    swift_willThrow();
    return v64;
  }
  sub_25C8774C4(&v96, (uint64_t)v98);
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_25C892400();
  __swift_project_value_buffer(v41, (uint64_t)qword_26B355748);
  uint64_t v42 = sub_25C8923F0();
  os_log_type_t v43 = sub_25C8925A0();
  BOOL v44 = os_log_type_enabled(v42, v43);
  uint64_t v45 = v94;
  unint64_t v46 = v88;
  uint64_t v47 = v87;
  if (v44)
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_21(&dword_25C872000, v48, v49, "Updating session state");
    OUTLINED_FUNCTION_8();
  }

  uint64_t v50 = v34 + qword_26B355810;
  uint64_t v51 = *(void **)(v34 + qword_26B355810);
  if (v51)
  {
    sub_25C8774DC((uint64_t)v98, (uint64_t)&v96);
    uint64_t v52 = (uint64_t)v51 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState;
    swift_beginAccess();
    id v53 = v51;
    sub_25C8777AC((uint64_t)&v96, v52, &qword_26B355500);
    swift_endAccess();
  }
  if (*(void *)(v34 + qword_26B355730))
  {
    swift_retain();
    sub_25C88B258(v45, v99, v47, v46);
    swift_release();
  }
  uint64_t v54 = v92;
  OUTLINED_FUNCTION_11();
  v55();
  uint64_t v56 = v86;
  swift_bridgeObjectRetain();
  uint64_t v57 = v99;
  swift_bridgeObjectRetain();
  uint64_t v93 = sub_25C892390();
  uint64_t v91 = v58;
  sub_25C892370();
  uint64_t v59 = v47;
  uint64_t v60 = sub_25C892360();
  uint64_t v62 = *(void **)v50;
  uint64_t v61 = *(void *)(v50 + 8);
  type metadata accessor for GestureRequestProcessor();
  swift_allocObject();
  id v63 = v62;
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_25C88EDD8(v85, v56, v54, v94, v57, v93, v91, (uint64_t)&v96, v60, v59, v46, v62, v61);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v98);
  return v64;
}

void GestureBridge.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
}

void GestureBridge.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
}

uint64_t sub_25C877044()
{
  sub_25C877590(v0 + qword_26B355550, &qword_26B355500);
  sub_25C877590(v0 + qword_26B355718, &qword_26B3554E0);
  swift_bridgeObjectRelease();
  sub_25C877590(v0 + qword_26B355808, &qword_26B3555A8);

  return swift_release();
}

uint64_t GestureBridge.deinit()
{
  uint64_t v0 = sub_25C892300();
  sub_25C877590(v0 + qword_26B355550, &qword_26B355500);
  sub_25C877590(v0 + qword_26B355718, &qword_26B3554E0);
  swift_bridgeObjectRelease();
  sub_25C877590(v0 + qword_26B355808, &qword_26B3555A8);

  swift_release();
  return v0;
}

uint64_t GestureBridge.__deallocating_deinit()
{
  uint64_t v0 = GestureBridge.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for GestureBridge()
{
  uint64_t result = qword_26B355220;
  if (!qword_26B355220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL sub_25C877220(uint64_t *a1, uint64_t *a2)
{
  return sub_25C87A5F0(*a1, *a2);
}

uint64_t sub_25C87722C()
{
  uint64_t v1 = OUTLINED_FUNCTION_27();
  uint64_t result = nullsub_1(v1);
  *uint64_t v0 = result;
  return result;
}

void sub_25C877258(uint64_t a1@<X8>)
{
  sub_25C87728C();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_25C877360()
{
  unint64_t result = qword_26A5D8978;
  if (!qword_26A5D8978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8978);
  }
  return result;
}

uint64_t sub_25C8773AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C877878(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C877A20((uint64_t)v12, *a3);
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
      sub_25C877A20((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25C877480(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_10();
  uint64_t v4 = OUTLINED_FUNCTION_14();
  v5(v4);
  return v3;
}

uint64_t sub_25C8774C4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25C8774DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25C877540()
{
  unint64_t result = qword_26B3554D0;
  if (!qword_26B3554D0)
  {
    sub_25C891AE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B3554D0);
  }
  return result;
}

uint64_t sub_25C877590(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_25C8775EC()
{
  sub_25C87773C(319, &qword_26B3554E8, MEMORY[0x263F07508]);
  if (v0 <= 0x3F)
  {
    sub_25C87773C(319, &qword_26B3555B0, MEMORY[0x263F70DF8]);
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t method lookup function for GestureBridge(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GestureBridge);
}

void sub_25C87773C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25C892650();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25C877790()
{
  return type metadata accessor for GestureBridge();
}

void type metadata accessor for AFExternalNotificationRequestHandlerState(uint64_t a1)
{
}

uint64_t sub_25C8777AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_10();
  uint64_t v4 = OUTLINED_FUNCTION_14();
  v5(v4);
  return v3;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25C877834(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_13(a1, a2, a3);
  OUTLINED_FUNCTION_10();
  uint64_t v4 = OUTLINED_FUNCTION_14();
  v5(v4);
  return v3;
}

uint64_t sub_25C877878(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25C877A7C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25C892670();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25C877B54(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25C8926E0();
    if (!v8)
    {
      uint64_t result = sub_25C892700();
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

uint64_t sub_25C877A20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_25C877A7C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C892710();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25C877B54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C877BEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25C877DC8(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25C877DC8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C877BEC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25C892550();
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
  unint64_t v3 = sub_25C877D60(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25C8926D0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25C892710();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25C892700();
  __break(1u);
  return result;
}

void *sub_25C877D60(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B3556A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25C877DC8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B3556A8);
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
    sub_25C877F78(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25C877EA0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25C877EA0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25C892710();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25C877F78(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25C892710();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void type metadata accessor for AFSpeechEvent(uint64_t a1)
{
}

void sub_25C8780A4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return MEMORY[0x270F70EE8](a1, 0, v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_8()
{
  JUMPOUT(0x2611965C0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  return MEMORY[0x270F70EE8](a1, 0, v2, v1, v3);
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return *(void *)v0;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GestureBridgeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GestureBridgeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C8784E4);
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

uint64_t sub_25C87850C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C878514(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GestureBridgeError()
{
  return &type metadata for GestureBridgeError;
}

unint64_t sub_25C878530(char a1)
{
  if (a1) {
    return 0xD000000000000016;
  }
  else {
    return 0xD00000000000002ELL;
  }
}

uint64_t sub_25C87856C()
{
  return sub_25C8927A0();
}

BOOL sub_25C878594(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25C8785A4()
{
  return sub_25C8927B0();
}

uint64_t sub_25C8785EC()
{
  return sub_25C8785A4();
}

uint64_t sub_25C8785F4()
{
  return sub_25C87856C();
}

uint64_t sub_25C8785FC()
{
  return sub_25C8927B0();
}

unint64_t sub_25C878640()
{
  return sub_25C878530(*v0);
}

BOOL sub_25C878654(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C878594(*a1, *a2);
}

unint64_t sub_25C878668()
{
  unint64_t result = qword_26A5D8AC0;
  if (!qword_26A5D8AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8AC0);
  }
  return result;
}

uint64_t *sub_25C8786C4(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    int64_t v8 = (char *)a1 + v7;
    int64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25C891AB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_25C8921C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_25C892190();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
    }
  }
  return v4;
}

uint64_t sub_25C87888C(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_25C891AB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_25C8921C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_25C892190();
  uint64_t result = __swift_getEnumTagSinglePayload(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v11(v8, v9);
  }
  return result;
}

void *sub_25C8789AC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C891AB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25C8921C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_25C892190();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

void *sub_25C878B24(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C891AB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25C8921C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_25C892190();
  LODWORD(v12) = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (!v12)
  {
    uint64_t v19 = *(void *)(v17 - 8);
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  return a1;
}

void *sub_25C878D1C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C891AB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25C8921C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_25C892190();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

void *sub_25C878E94(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25C891AB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_25C8921C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_25C892190();
  LODWORD(v12) = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (!v12)
  {
    uint64_t v19 = *(void *)(v17 - 8);
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  return a1;
}

uint64_t sub_25C87908C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C8790A0);
}

uint64_t sub_25C8790A0()
{
  OUTLINED_FUNCTION_37();
  sub_25C891AB0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v4 + 84) == v0)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v2[5];
  }
  else
  {
    sub_25C8921C0();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v8 + 84) == v0)
    {
      uint64_t v5 = v7;
      uint64_t v6 = v2[6];
    }
    else
    {
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
      uint64_t v6 = v2[7];
    }
  }

  return __swift_getEnumTagSinglePayload(v1 + v6, v0, v5);
}

uint64_t sub_25C879138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C87914C);
}

uint64_t sub_25C87914C()
{
  OUTLINED_FUNCTION_21_0();
  sub_25C891AB0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v2[5];
  }
  else
  {
    sub_25C8921C0();
    OUTLINED_FUNCTION_1_0();
    if (*(_DWORD *)(v9 + 84) == v3)
    {
      uint64_t v6 = v8;
      uint64_t v7 = v2[6];
    }
    else
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
      uint64_t v7 = v2[7];
    }
  }

  return __swift_storeEnumTagSinglePayload(v1 + v7, v0, v0, v6);
}

uint64_t type metadata accessor for GestureResponse(uint64_t a1)
{
  return sub_25C879FE4(a1, (uint64_t *)&unk_26A5D8AC8);
}

void sub_25C879208()
{
  sub_25C891AB0();
  if (v0 <= 0x3F)
  {
    sub_25C8921C0();
    if (v1 <= 0x3F)
    {
      sub_25C87931C();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25C87931C()
{
  if (!qword_26B3554F0)
  {
    sub_25C892190();
    unint64_t v0 = sub_25C892650();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B3554F0);
    }
  }
}

ValueMetadata *type metadata accessor for UserIntent()
{
  return &type metadata for UserIntent;
}

uint64_t *sub_25C879384(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25C8921C0();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_25C87946C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C8921C0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t sub_25C87950C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8921C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C8795A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8921C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C87963C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8921C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C8796D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25C8921C0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25C87976C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C879780);
}

uint64_t sub_25C879780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C8921C0();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_25C8797C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C8797DC);
}

uint64_t sub_25C8797DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C8921C0();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for GestureMapping(uint64_t a1)
{
  return sub_25C879FE4(a1, qword_26B355538);
}

uint64_t sub_25C879848()
{
  uint64_t result = sub_25C8921C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25C8798D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25C8924A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_25C892400();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_25C879A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C8924A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_25C892400();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_25C879ACC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C8924A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_25C892400();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_25C879BBC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C8924A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25C892400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_25C879CAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C8924A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_25C892400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_25C879D78(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25C8924A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_25C892400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_25C879E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C879E68);
}

uint64_t sub_25C879E68()
{
  OUTLINED_FUNCTION_37();
  sub_25C8924A0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v4 + 84) == v0)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v1;
LABEL_8:
    return __swift_getEnumTagSinglePayload(v6, v0, v5);
  }
  if (v0 != 0x7FFFFFFF)
  {
    uint64_t v5 = sub_25C892400();
    uint64_t v6 = v1 + *(int *)(v2 + 28);
    goto LABEL_8;
  }
  unint64_t v7 = *(void *)(v1 + *(int *)(v2 + 24) + 8);
  if (v7 >= 0xFFFFFFFF) {
    LODWORD(v7) = -1;
  }
  return (v7 + 1);
}

uint64_t sub_25C879F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C879F24);
}

void sub_25C879F24()
{
  OUTLINED_FUNCTION_21_0();
  sub_25C8924A0();
  OUTLINED_FUNCTION_1_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    if (v3 == 0x7FFFFFFF)
    {
      *(void *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
      return;
    }
    uint64_t v6 = sub_25C892400();
    uint64_t v7 = v1 + *(int *)(v2 + 28);
  }

  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

uint64_t type metadata accessor for EventDeduper(uint64_t a1)
{
  return sub_25C879FE4(a1, qword_26B3555D0);
}

uint64_t sub_25C879FE4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C87A018()
{
  uint64_t result = sub_25C8924A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25C892400();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_25C87A0F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    int v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
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

uint64_t sub_25C87A14C(char a1)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = (char *)MEMORY[0x263F8EE78];
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_25C87D348(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = OUTLINED_FUNCTION_16_0(v3);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 0x747065636361;
  *((void *)v5 + 5) = 0xE600000000000000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = OUTLINED_FUNCTION_24_0();
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = OUTLINED_FUNCTION_16_0(v6);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x7463656A6572;
    *((void *)v8 + 5) = 0xE600000000000000;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = OUTLINED_FUNCTION_24_0();
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_25C87D348((char *)(v9 > 1), v10 + 1, 1, (uint64_t)v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    uint64_t v11 = &v2[16 * v10];
    *((void *)v11 + 4) = 0x7373696D736964;
    *((void *)v11 + 5) = 0xE700000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8AF8);
  sub_25C87DBE8(&qword_26A5D8B00, &qword_26A5D8AF8);
  uint64_t v12 = sub_25C8924D0();
  swift_bridgeObjectRelease();
  return v12;
}

void *sub_25C87A310@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_25C87A31C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C87A344();
  *a1 = result;
  return result;
}

uint64_t sub_25C87A344()
{
  return 0;
}

uint64_t sub_25C87A34C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C87A37C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_25C87A37C(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_25C87A384@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = j__OUTLINED_FUNCTION_22_0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_25C87A3B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C87A3E8(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_25C87A3E8(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_25C87A3F0(void *a1, uint64_t *a2)
{
  return sub_25C87A3F8(a1, *a2);
}

BOOL sub_25C87A3F8(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_25C87A424@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25C87A458(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_25C87A458(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_25C87A47C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25C87A4B0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_25C87A4B0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_25C87A4C8(uint64_t *a1)
{
  return sub_25C87A4D0(*a1);
}

uint64_t sub_25C87A4D0(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_25C87A4E0(uint64_t *a1)
{
  return sub_25C87A4E8(*a1);
}

uint64_t sub_25C87A4E8(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_25C87A4F8(uint64_t *a1)
{
  return sub_25C87A500(*a1);
}

uint64_t sub_25C87A500(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_25C87A510@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C87A540(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_25C87A540(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_25C87A548(uint64_t *a1)
{
  return sub_25C87A554(*a1, *v1);
}

BOOL sub_25C87A554(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_25C87A560(uint64_t *a1)
{
  return sub_25C87A56C(*a1, *v1);
}

BOOL sub_25C87A56C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_25C87A578(uint64_t *a1)
{
  return sub_25C87A584(*a1, *v1);
}

BOOL sub_25C87A584(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_25C87A590()
{
  return sub_25C87A598(*v0);
}

BOOL sub_25C87A598(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_25C87A5A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_25C87A5BC(uint64_t *a1)
{
  return sub_25C87A5C4(*a1);
}

uint64_t sub_25C87A5C4(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

void *sub_25C87A5D4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25C87A5E4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25C87A5F0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_25C87A5FC(uint64_t a1, uint64_t a2)
{
  return sub_25C87A68C(a1, a2, MEMORY[0x263F70B98]);
}

uint64_t sub_25C87A644(uint64_t a1, uint64_t a2)
{
  return sub_25C87A68C(a1, a2, MEMORY[0x263F70DD0]);
}

uint64_t sub_25C87A68C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  uint64_t v3 = (unint64_t *)OUTLINED_FUNCTION_34();
  sub_25C87DBA0(v3, v4);
  sub_25C892560();
  sub_25C892560();
  if (v10 == v8 && v11 == v9) {
    char v6 = 1;
  }
  else {
    char v6 = sub_25C892740();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_25C87A764@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25C87A0F8(a1);
  *a2 = result;
  return result;
}

void sub_25C87A78C(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (a1)
  {
    id v4 = a1;
    if (objc_msgSend(v4, sel_acceptGesture) == (id)2 && objc_msgSend(v4, sel_rejectGesture) == (id)1)
    {

      uint64_t v5 = *MEMORY[0x263F70B88];
      uint64_t v6 = sub_25C8921C0();
      OUTLINED_FUNCTION_4_0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104))(a2, v5, v6);
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_17_0();
      __asm { BRAA            X3, X16 }
    }
    if (objc_msgSend(v4, sel_acceptGesture) == (id)1 && objc_msgSend(v4, sel_rejectGesture) == (id)2)
    {
    }
    else
    {
      if (qword_26B355230 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_25C892400();
      __swift_project_value_buffer(v17, (uint64_t)qword_26B355748);
      id v18 = v4;
      uint64_t v19 = sub_25C8923F0();
      os_log_type_t v20 = sub_25C8925B0();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)OUTLINED_FUNCTION_24();
        uint64_t v22 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 138412290;
        id v18 = v18;
        sub_25C892660();
        *uint64_t v22 = a1;

        _os_log_impl(&dword_25C872000, v19, v20, "Invalid configuration: %@, using default values", v21, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8B60);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();
      }
      else
      {
      }
    }
    sub_25C8921C0();
    OUTLINED_FUNCTION_4_0();
    uint64_t v24 = *(void (**)(void))(v23 + 104);
    OUTLINED_FUNCTION_9_0();
    v24();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_9_0();
    v24();
    OUTLINED_FUNCTION_17_0();
  }
  else
  {
    sub_25C8921C0();
    OUTLINED_FUNCTION_4_0();
    uint64_t v11 = *(void (**)(void))(v10 + 104);
    OUTLINED_FUNCTION_9_0();
    v11();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_9_0();
    v11();
    if (qword_26B355230 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25C892400();
    oslog = OUTLINED_FUNCTION_15_0(v12, (uint64_t)qword_26B355748);
    os_log_type_t v13 = sub_25C8925B0();
    if (os_log_type_enabled(oslog, v13))
    {
      uint64_t v14 = (uint8_t *)OUTLINED_FUNCTION_38();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C872000, oslog, v13, "Received nil gesture configuration, using default gesture mapping", v14, 2u);
      OUTLINED_FUNCTION_8();
    }
    OUTLINED_FUNCTION_17_0();
  }
}

void sub_25C87AB7C()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v0;
  char v4 = v3;
  uint64_t v5 = sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_0();
  uint64_t v90 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v84 = v10;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_19_0();
  uint64_t v89 = v12;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_19_0();
  uint64_t v87 = v14;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_19_0();
  uint64_t v88 = v16;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_19_0();
  uint64_t v86 = v18;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_19_0();
  uint64_t v83 = v20;
  OUTLINED_FUNCTION_11_0();
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v83 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v83 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v83 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v83 - v31;
  sub_25C87DD88(v2, (uint64_t)&v83 - v31);
  char v33 = v4;
  if (v4)
  {
    uint64_t v36 = OUTLINED_FUNCTION_2_0();
    v37(v36);
    char v38 = sub_25C87A68C((uint64_t)v32, v1, MEMORY[0x263F70B98]);
    uint64_t v39 = v7;
    char v40 = v38;
    uint64_t v41 = v5;
    uint64_t v35 = v39;
    uint64_t v34 = v41;
    (*(void (**)(uint64_t))(v39 + 8))(v1);
    sub_25C87DDEC((uint64_t)v32);
    sub_25C87DD88(v2, (uint64_t)v30);
    if (v40)
    {
      sub_25C87DDEC((uint64_t)v30);
      sub_25C87DD88(v2, (uint64_t)v24);
      int v85 = 1;
      uint64_t v42 = v35;
      uint64_t v43 = v34;
LABEL_9:
      char v47 = v33;
      uint64_t v48 = v87;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v34 = v5;
    uint64_t v35 = v7;
    sub_25C87DDEC((uint64_t)v32);
    sub_25C87DD88(v2, (uint64_t)v30);
  }
  sub_25C87DD88((uint64_t)v30, (uint64_t)v27);
  if ((v33 & 2) == 0)
  {
    sub_25C87DDEC((uint64_t)v27);
    sub_25C87DDEC((uint64_t)v30);
    sub_25C87DD88(v2, (uint64_t)v24);
    uint64_t v42 = v35;
    uint64_t v43 = v34;
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_25_0();
  uint64_t v45 = (uint64_t)&v27[v44];
  uint64_t v42 = v35;
  unint64_t v46 = *(void (**)(uint64_t, void, uint64_t))(v35 + 104);
  uint64_t v43 = v34;
  v46(v1, *MEMORY[0x263F70B80], v34);
  LOBYTE(v45) = sub_25C87A68C(v45, v1, MEMORY[0x263F70B98]);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v1, v34);
  sub_25C87DDEC((uint64_t)v27);
  sub_25C87DDEC((uint64_t)v30);
  sub_25C87DD88(v2, (uint64_t)v24);
  if (v45)
  {
    int v85 = 1;
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v49 = v83;
  sub_25C87DD88((uint64_t)v24, v83);
  char v47 = v33;
  uint64_t v48 = v87;
  if ((v33 & 4) != 0)
  {
    OUTLINED_FUNCTION_25_0();
    uint64_t v51 = v49 + v50;
    uint64_t v52 = OUTLINED_FUNCTION_2_0();
    v53(v52);
    int v85 = sub_25C87A68C(v51, v1, MEMORY[0x263F70B98]);
    uint64_t v54 = OUTLINED_FUNCTION_5_0();
    v55(v54);
    sub_25C87DDEC(v49);
  }
  else
  {
    sub_25C87DDEC(v49);
    int v85 = 0;
  }
LABEL_13:
  sub_25C87DDEC((uint64_t)v24);
  uint64_t v56 = v86;
  sub_25C87DD88(v2, v86);
  if (v47)
  {
    uint64_t v58 = OUTLINED_FUNCTION_2_0();
    v59(v58);
    char v60 = sub_25C87A68C(v56, v1, MEMORY[0x263F70B98]);
    uint64_t v61 = OUTLINED_FUNCTION_5_0();
    v62(v61);
    sub_25C87DDEC(v56);
    uint64_t v57 = v88;
    sub_25C87DD88(v2, v88);
    if (v60)
    {
      sub_25C87DDEC(v57);
      OUTLINED_FUNCTION_18_0();
      goto LABEL_20;
    }
  }
  else
  {
    sub_25C87DDEC(v56);
    uint64_t v57 = v88;
    sub_25C87DD88(v2, v88);
  }
  sub_25C87DD88(v57, v48);
  if ((v47 & 2) == 0)
  {
    sub_25C87DDEC(v48);
    sub_25C87DDEC(v57);
    OUTLINED_FUNCTION_18_0();
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_25_0();
  uint64_t v64 = v48 + v63;
  uint64_t v65 = OUTLINED_FUNCTION_2_0();
  v66(v65);
  LOBYTE(v64) = sub_25C87A68C(v64, v1, MEMORY[0x263F70B98]);
  uint64_t v67 = OUTLINED_FUNCTION_5_0();
  v68(v67);
  sub_25C87DDEC(v48);
  sub_25C87DDEC(v57);
  OUTLINED_FUNCTION_18_0();
  if ((v64 & 1) == 0)
  {
LABEL_22:
    uint64_t v70 = v84;
    sub_25C87DD88(v2, v84);
    if ((v47 & 4) != 0)
    {
      OUTLINED_FUNCTION_25_0();
      uint64_t v72 = v70 + v71;
      uint64_t v73 = OUTLINED_FUNCTION_2_0();
      v74(v73);
      char v69 = sub_25C87A68C(v72, v1, MEMORY[0x263F70B98]);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v1, v43);
      sub_25C87DDEC(v70);
      sub_25C87DDEC(v2);
      if ((v85 & 1) == 0)
      {
        if ((v69 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_33;
      }
    }
    else
    {
      sub_25C87DDEC(v70);
      sub_25C87DDEC(v2);
      if ((v85 & 1) == 0) {
        goto LABEL_38;
      }
      char v69 = 0;
    }
    goto LABEL_26;
  }
LABEL_20:
  sub_25C87DDEC(v2);
  if ((v85 & 1) == 0)
  {
LABEL_33:
    if (qword_26B355230 != -1) {
      swift_once();
    }
    uint64_t v79 = sub_25C892400();
    uint64_t v80 = OUTLINED_FUNCTION_15_0(v79, (uint64_t)qword_26B355748);
    os_log_type_t v81 = sub_25C8925A0();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)OUTLINED_FUNCTION_38();
      *(_WORD *)uint64_t v82 = 0;
      _os_log_impl(&dword_25C872000, v80, v81, "🙂‍↔️ Accepting shakes", v82, 2u);
      OUTLINED_FUNCTION_8();
    }

    goto LABEL_38;
  }
  char v69 = 1;
LABEL_26:
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v75 = sub_25C892400();
  uint64_t v76 = OUTLINED_FUNCTION_15_0(v75, (uint64_t)qword_26B355748);
  os_log_type_t v77 = sub_25C8925A0();
  if (os_log_type_enabled(v76, v77))
  {
    uint64_t v78 = (uint8_t *)OUTLINED_FUNCTION_38();
    *(_WORD *)uint64_t v78 = 0;
    _os_log_impl(&dword_25C872000, v76, v77, "🙂‍↕️ Accepting nods", v78, 2u);
    OUTLINED_FUNCTION_8();
  }

  if (v69) {
    goto LABEL_33;
  }
LABEL_38:
  OUTLINED_FUNCTION_10_0();
}

void sub_25C87B3C0()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_20_0();
  sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8_0();
  uint64_t v8 = *(void (**)(uint64_t))(v6 + 104);
  uint64_t v9 = OUTLINED_FUNCTION_32();
  v8(v9);
  char v10 = sub_25C87A68C(v1, v2, MEMORY[0x263F70B98]);
  uint64_t v11 = *(void (**)(uint64_t))(v6 + 8);
  uint64_t v12 = OUTLINED_FUNCTION_33();
  v11(v12);
  sub_25C87DD88(v1, v0);
  if (v10)
  {
    uint64_t v13 = v0 + *(int *)(v3 + 20);
    uint64_t v14 = OUTLINED_FUNCTION_32();
    v8(v14);
    sub_25C87A68C(v13, v2, MEMORY[0x263F70B98]);
    uint64_t v15 = OUTLINED_FUNCTION_33();
    v11(v15);
  }
  sub_25C87DDEC(v0);
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C87B580()
{
  uint64_t v2 = v0;
  uint64_t v3 = 0x1000000000000011;
  uint64_t v4 = sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v2, v4);
  uint64_t v8 = OUTLINED_FUNCTION_34();
  int v10 = v9(v8);
  if (v10 != *MEMORY[0x263F70B80])
  {
    if (v10 == *MEMORY[0x263F70B88])
    {
      return 0x1000000000000013;
    }
    else
    {
      uint64_t v11 = OUTLINED_FUNCTION_34();
      v12(v11);
      return 0x55208FB8EFBC80E2;
    }
  }
  return v3;
}

uint64_t sub_25C87B6B8(uint64_t a1, uint64_t a2)
{
  if (sub_25C87A68C(a1, a2, MEMORY[0x263F70B98]))
  {
    uint64_t v4 = type metadata accessor for GestureMapping(0);
    char v5 = sub_25C87A68C(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20), MEMORY[0x263F70B98]);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

unint64_t sub_25C87B798()
{
  unint64_t result = qword_26A5D8AD8;
  if (!qword_26A5D8AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8AD8);
  }
  return result;
}

unint64_t sub_25C87B7E8()
{
  unint64_t result = qword_26A5D8AE0;
  if (!qword_26A5D8AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8AE0);
  }
  return result;
}

unint64_t sub_25C87B838()
{
  unint64_t result = qword_26A5D8AE8;
  if (!qword_26A5D8AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8AE8);
  }
  return result;
}

unint64_t sub_25C87B888()
{
  unint64_t result = qword_26A5D8AF0;
  if (!qword_26A5D8AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8AF0);
  }
  return result;
}

uint64_t sub_25C87B8D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GestureResponse(0);
  sub_25C87BE94((uint64_t)v1 + *(int *)(v5 + 28), (uint64_t)v4);
  uint64_t v6 = sub_25C892190();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v6) == 1)
  {
    sub_25C87D938((uint64_t)v4, (uint64_t *)&unk_26B355210);
  }
  else
  {
    sub_25C892120();
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_25C8926C0();
  sub_25C892540();
  sub_25C891A70();
  sub_25C892580();
  sub_25C892540();
  sub_25C8921C0();
  sub_25C8926F0();
  sub_25C892540();
  sub_25C87A14C(*v1);
  sub_25C892540();
  swift_bridgeObjectRelease();
  sub_25C892540();
  sub_25C892540();
  swift_bridgeObjectRelease();
  return v8[0];
}

void sub_25C87BAFC()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_25C892190();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7_0();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8B10);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_20_0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v27 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v27 - v19;
  if (*v5 == *v3)
  {
    uint64_t v28 = v8;
    uint64_t v21 = type metadata accessor for GestureResponse(0);
    if ((sub_25C891A80() & 1) != 0
      && (sub_25C87A68C((uint64_t)v5 + *(int *)(v21 + 24), (uint64_t)v3 + *(int *)(v21 + 24), MEMORY[0x263F70B98]) & 1) != 0)
    {
      sub_25C87BE94((uint64_t)v5 + *(int *)(v21 + 28), (uint64_t)v20);
      sub_25C87BE94((uint64_t)v3 + *(int *)(v21 + 28), (uint64_t)v18);
      uint64_t v22 = v0 + *(int *)(v10 + 48);
      sub_25C87BE94((uint64_t)v20, v0);
      sub_25C87BE94((uint64_t)v18, v22);
      OUTLINED_FUNCTION_26_0(v0);
      if (!v23)
      {
        sub_25C87BE94(v0, (uint64_t)v15);
        OUTLINED_FUNCTION_26_0(v22);
        if (!v23)
        {
          uint64_t v24 = v28;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v1, v22, v6);
          sub_25C87DBA0(&qword_26A5D8B18, MEMORY[0x263F70A00]);
          sub_25C8924E0();
          uint64_t v25 = *(void (**)(uint64_t))(v24 + 8);
          uint64_t v26 = OUTLINED_FUNCTION_34();
          v25(v26);
          sub_25C87D938((uint64_t)v18, (uint64_t *)&unk_26B355210);
          sub_25C87D938((uint64_t)v20, (uint64_t *)&unk_26B355210);
          ((void (*)(char *, uint64_t))v25)(v15, v6);
          sub_25C87D938(v0, (uint64_t *)&unk_26B355210);
          goto LABEL_13;
        }
        sub_25C87D938((uint64_t)v18, (uint64_t *)&unk_26B355210);
        sub_25C87D938((uint64_t)v20, (uint64_t *)&unk_26B355210);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v6);
LABEL_12:
        sub_25C87D938(v0, &qword_26A5D8B10);
        goto LABEL_13;
      }
      sub_25C87D938((uint64_t)v18, (uint64_t *)&unk_26B355210);
      sub_25C87D938((uint64_t)v20, (uint64_t *)&unk_26B355210);
      OUTLINED_FUNCTION_26_0(v22);
      if (!v23) {
        goto LABEL_12;
      }
      sub_25C87D938(v0, (uint64_t *)&unk_26B355210);
    }
  }
LABEL_13:
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C87BE94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

unint64_t sub_25C87BF44(char a1)
{
  unint64_t result = 0x6669636570736E75;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0xD000000000000017;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x6D73694469726973;
      break;
    case 6:
      unint64_t result = 0x456E6F6973736573;
      break;
    case 7:
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C87C09C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t result = swift_bridgeObjectRetain();
    BOOL v11 = 0;
    BOOL v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = result + 40;
    uint64_t v10 = result + 40;
LABEL_3:
    uint64_t v6 = v5 + 16 * v4++;
    while (v4 - 1 < v1)
    {
      swift_bridgeObjectRetain();
      char v7 = v3 | ((unint64_t)sub_25C892720() < 4);
      unint64_t v8 = sub_25C892720();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 < 6)
      {
        if ((v7 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_15;
      }
      if (v7)
      {
        if (!v11)
        {
LABEL_12:
          if (v4 != v1)
          {
            BOOL v3 = v8 > 5;
            BOOL v11 = v8 < 6;
            uint64_t v5 = v10;
            goto LABEL_3;
          }
          uint64_t v9 = 0;
          goto LABEL_17;
        }
LABEL_15:
        uint64_t v9 = 1;
LABEL_17:
        swift_bridgeObjectRelease();
        return v9;
      }
      BOOL v3 = 0;
      uint64_t v9 = 0;
      ++v4;
      v6 += 16;
      if (v4 - v1 == 1) {
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_25C87C1F0@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_headGesture);
  if (v3 == (id)2)
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F70B88];
  }
  else if (v3 == (id)1)
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F70B80];
  }
  else
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F70B90];
  }
  uint64_t v5 = *v4;
  sub_25C8921C0();
  OUTLINED_FUNCTION_4_0();
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);

  return v8(a1, v5, v6);
}

uint64_t sub_25C87C294(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0x7055646F4ELL;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6E776F44646F4ELL;
      break;
    case 2:
      uint64_t result = 0x66654C656B616853;
      break;
    case 3:
      uint64_t result = 0x676952656B616853;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

void sub_25C87C348()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v1 = v0;
  uint64_t v2 = sub_25C891A10();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C8924B0();
  uint64_t v9 = sub_25C8924B0();
  id v10 = objc_msgSend(self, sel_sharedPreferences);
  id v11 = objc_msgSend(v10, sel__languageCodeWithFallback_, 1);

  uint64_t v20 = v9;
  if (v11)
  {
    sub_25C892500();

    uint64_t v12 = sub_25C892520();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 28261;
    uint64_t v14 = 0xE200000000000000;
  }
  uint64_t v25 = v12;
  uint64_t v26 = v14;
  uint64_t v23 = 26746;
  unint64_t v24 = 0xE200000000000000;
  sub_25C87DABC();
  sub_25C87DB08();
  if ((sub_25C8924C0() & 1) == 0)
  {
    uint64_t v25 = v12;
    uint64_t v26 = v14;
    uint64_t v23 = 45;
    unint64_t v24 = 0xE100000000000000;
    uint64_t v21 = 95;
    unint64_t v22 = 0xE100000000000000;
    sub_25C87DB54();
    uint64_t v15 = sub_25C892690();
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v25 = v15;
    uint64_t v26 = v17;
    uint64_t v23 = (uint64_t)&unk_2709EC3C0;
    sub_25C87DBA0(&qword_26A5D8B40, MEMORY[0x263F06278]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8B48);
    sub_25C87DBE8(&qword_26A5D8B50, &qword_26A5D8B48);
    sub_25C8926B0();
    uint64_t v18 = (void *)sub_25C892680();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
    swift_bridgeObjectRelease();
    if (v18[2])
    {
      uint64_t v12 = v18[4];
      uint64_t v14 = v18[5];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v14 = 0xE200000000000000;
      uint64_t v12 = 28261;
    }
    swift_bridgeObjectRelease();
  }
  if (v1 == 1)
  {
    swift_bridgeObjectRelease();
    sub_25C87C708(v12, v14, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (v1 == 2)
    {
      sub_25C87C708(v12, v14, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C87C708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_25C87DC2C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_25C87C760()
{
  return OUTLINED_FUNCTION_13_0(34, 0x800000025C893B00, "isWaitingToneEnabled: false");
}

uint64_t sub_25C87C780()
{
  return OUTLINED_FUNCTION_13_0(35, 0x800000025C893AD0, "shouldUseSystemSounds: false");
}

uint64_t sub_25C87C7A0(uint64_t a1, uint64_t a2, const char *a3)
{
  id v4 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  char v5 = sub_25C87D2E4(0xD000000000000013, 0x800000025C893AB0);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (void *)sub_25C8924F0();
    unsigned int v8 = [v6 BOOLForKey:v7];

    if (v8)
    {

      return 1;
    }
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25C892400();
    uint64_t v14 = OUTLINED_FUNCTION_15_0(v13, (uint64_t)qword_26B355818);
    os_log_type_t v15 = sub_25C8925A0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_38();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_25C872000, v14, v15, a3, v16, 2u);
      OUTLINED_FUNCTION_8();
    }
  }
  else
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_25C892400();
    uint64_t v6 = OUTLINED_FUNCTION_15_0(v10, (uint64_t)qword_26B355818);
    os_log_type_t v11 = sub_25C8925B0();
    if (os_log_type_enabled(v6, v11))
    {
      uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_24();
      uint64_t v17 = OUTLINED_FUNCTION_22();
      *(_DWORD *)uint64_t v12 = 136315138;
      sub_25C8773AC(0xD000000000000013, 0x800000025C893AB0, &v17);
      sub_25C892660();
      _os_log_impl(&dword_25C872000, v6, v11, "UserDefault suite: %s not found", v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
  }

  return 0;
}

void sub_25C87CA04()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v49 = sub_25C892400();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v44 = v10;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v48 = sub_25C8924A0();
  OUTLINED_FUNCTION_4();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_8_0();
  sub_25C892490();
  unint64_t v17 = sub_25C892480();
  unint64_t v18 = sub_25C892480();
  unint64_t v19 = v17 - v18;
  if (v17 < v18)
  {
    __break(1u);
  }
  else
  {
    uint64_t v47 = v1;
    uint64_t v51 = 0;
    unint64_t v52 = 0xE000000000000000;
    sub_25C8926C0();
    swift_bridgeObjectRelease();
    uint64_t v51 = 0x6465766965636552;
    unint64_t v52 = 0xE900000000000020;
    uint64_t v42 = v6;
    uint64_t v43 = v4;
    sub_25C892540();
    sub_25C892540();
    unint64_t v50 = v19 / 0xF4240;
    sub_25C892730();
    sub_25C892540();
    swift_bridgeObjectRelease();
    sub_25C892540();
    unint64_t v20 = v19;
    uint64_t v21 = type metadata accessor for EventDeduper(0);
    unint64_t v22 = (uint64_t *)(v0 + *(int *)(v21 + 24));
    uint64_t v23 = *v22;
    swift_bridgeObjectRetain();
    sub_25C892540();
    swift_bridgeObjectRelease();
    unint64_t v24 = v52;
    uint64_t v41 = v51;
    unint64_t v45 = *(void *)(v0 + *(int *)(v21 + 20));
    unint64_t v46 = v20;
    if (v20 < v45)
    {
      uint64_t v32 = v15;
      OUTLINED_FUNCTION_28();
      v33();
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25C8923F0();
      os_log_type_t v35 = sub_25C8925A0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)OUTLINED_FUNCTION_24();
        uint64_t v51 = OUTLINED_FUNCTION_22();
        *(_DWORD *)uint64_t v36 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_25C8773AC(v41, v24, &v51);
        OUTLINED_FUNCTION_27_0(v37);
        sub_25C892660();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C872000, v34, v35, "%s, event is a dupe", v36, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();

        (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v49);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v23);
      }
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v47, v48);
    }
    else
    {
      uint64_t v25 = v44;
      OUTLINED_FUNCTION_28();
      v26();
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_25C8923F0();
      os_log_type_t v28 = sub_25C8925A0();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = OUTLINED_FUNCTION_24();
        uint64_t v40 = v15;
        uint64_t v30 = (uint8_t *)v29;
        uint64_t v51 = OUTLINED_FUNCTION_22();
        *(_DWORD *)uint64_t v30 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_25C8773AC(v41, v24, &v51);
        OUTLINED_FUNCTION_27_0(v31);
        sub_25C892660();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25C872000, v27, v28, "%s, event isn't a dupe", v30, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        uint64_t v15 = v40;
        OUTLINED_FUNCTION_8();

        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v44, v49);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v25, v23);
      }
      uint64_t v38 = v43;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *unint64_t v22 = v42;
      v22[1] = v38;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40))(v2, v47, v48);
    }
    OUTLINED_FUNCTION_10_0();
  }
}

void sub_25C87CEEC(void *a1)
{
  sub_25C891AB0();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_8_0();
  id v3 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v4 = sub_25C87D2E4(0xD00000000000001CLL, 0x800000025C893C70);
  if (!v4)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25C892400();
    uint64_t v23 = OUTLINED_FUNCTION_15_0(v8, (uint64_t)qword_26B355818);
    os_log_type_t v9 = sub_25C8925B0();
    if (os_log_type_enabled(v23, v9))
    {
      uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_24();
      uint64_t v24 = OUTLINED_FUNCTION_22();
      *(_DWORD *)uint64_t v10 = 136315138;
      uint64_t v11 = sub_25C8773AC(0xD000000000000013, 0x800000025C893AB0, &v24);
      OUTLINED_FUNCTION_35(v11);
      sub_25C892660();
      _os_log_impl(&dword_25C872000, v23, v9, "UserDefault suite: %s couldn't be opened.", v10, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
      goto LABEL_10;
    }
    goto LABEL_20;
  }
  uint64_t v23 = v4;
  if (a1 == (void *)4)
  {
    sub_25C891AA0();
    sub_25C891A60();
    uint64_t v12 = OUTLINED_FUNCTION_6_0();
    v13(v12);
LABEL_13:
    uint64_t v16 = sub_25C8924F0();
    [v23 setValue:a1 forKey:v16];

LABEL_18:
    return;
  }
  if (a1 == (void *)2)
  {
    sub_25C891AA0();
    sub_25C891A60();
    uint64_t v14 = OUTLINED_FUNCTION_6_0();
    v15(v14);
    OUTLINED_FUNCTION_29();
    goto LABEL_13;
  }
  if (a1 == (void *)1)
  {
    sub_25C891AA0();
    sub_25C891A60();
    uint64_t v5 = OUTLINED_FUNCTION_6_0();
    v6(v5);
    OUTLINED_FUNCTION_29();
    uint64_t v7 = (void *)sub_25C8924F0();
    [v23 setValue:1 forKey:v7];

LABEL_10:
    return;
  }
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_25C892400();
  uint64_t v16 = OUTLINED_FUNCTION_15_0(v17, (uint64_t)qword_26B355818);
  os_log_type_t v18 = sub_25C8925B0();
  if (os_log_type_enabled(v16, v18))
  {
    unint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v24 = OUTLINED_FUNCTION_22();
    *(_DWORD *)unint64_t v19 = 136315138;
    uint64_t v20 = sub_25C87A14C((char)a1);
    uint64_t v22 = sub_25C8773AC(v20, v21, &v24);
    OUTLINED_FUNCTION_35(v22);
    sub_25C892660();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v16, v18, "Tried to log unhandled user intent usage date: %s", v19, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();

    goto LABEL_18;
  }

LABEL_20:
}

id sub_25C87D2E4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)sub_25C8924F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

char *sub_25C87D348(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8B08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_25C87D8A4((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C87D64C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_25C87D438(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8B58);
  uint64_t v10 = *(void *)(sub_25C891C80() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    OUTLINED_FUNCTION_30();
    uint64_t result = sub_25C892700();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25C891C80() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_25C87D98C(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C87D744(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_25C87D64C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25C892710();
  __break(1u);
  return result;
}

uint64_t sub_25C87D744(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25C891C80() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_25C892710();
  __break(1u);
  return result;
}

char *sub_25C87D8A4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_25C892710();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_25C87D938(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C87D98C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_25C892710();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_25C891C80(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_25C891C80();
    return MEMORY[0x270FA01D8](a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  return result;
}

unint64_t sub_25C87DABC()
{
  unint64_t result = qword_26A5D8B28;
  if (!qword_26A5D8B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8B28);
  }
  return result;
}

unint64_t sub_25C87DB08()
{
  unint64_t result = qword_26A5D8B30;
  if (!qword_26A5D8B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8B30);
  }
  return result;
}

unint64_t sub_25C87DB54()
{
  unint64_t result = qword_26A5D8B38;
  if (!qword_26A5D8B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8B38);
  }
  return result;
}

uint64_t sub_25C87DBA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C87DBE8(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25C87DC2C(uint64_t a1, uint64_t a2)
{
  sub_25C892790();
  sub_25C892530();
  uint64_t v4 = sub_25C8927B0();

  return sub_25C87DCA4(a1, a2, v4);
}

unint64_t sub_25C87DCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C892740() & 1) == 0)
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
      while (!v14 && (sub_25C892740() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25C87DD88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GestureMapping(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C87DDEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GestureMapping(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, const char *a3)
{
  return sub_25C87C7A0(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a2, a3);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_25C8923F0();
}

char *OUTLINED_FUNCTION_16_0@<X0>(unint64_t a1@<X8>)
{
  return sub_25C87D348((char *)(a1 > 1), v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v3 = *(void *)(v1 - 96);
  return sub_25C87DD88(v0, v3);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

char *OUTLINED_FUNCTION_24_0()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_25C87D348(0, v2, 1, v0);
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return v1 - 104;
}

unint64_t OUTLINED_FUNCTION_29()
{
  return 0xD000000000000019;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1)
{
  *(void *)(v1 - 80) = a1;
  return v1 - 80;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0 + *(int *)(type metadata accessor for GestureMapping(0) + 20);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_slowAlloc();
}

uint64_t sub_25C87E148(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager) = a1;
  return MEMORY[0x270F9A758]();
}

void sub_25C87E15C()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v51 = v2;
  uint64_t v48 = sub_25C892400();
  OUTLINED_FUNCTION_4();
  uint64_t v50 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_18();
  uint64_t v49 = v4;
  uint64_t v5 = OUTLINED_FUNCTION_86();
  uint64_t v46 = type metadata accessor for GestureMapping(v5);
  OUTLINED_FUNCTION_4_0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_18();
  uint64_t v45 = v6;
  OUTLINED_FUNCTION_86();
  sub_25C8925D0();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_59();
  sub_25C8925C0();
  OUTLINED_FUNCTION_4_0();
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_33_0();
  uint64_t v9 = sub_25C892460();
  uint64_t v10 = OUTLINED_FUNCTION_15(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_112(OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
  sub_25C889EAC();
  BOOL v11 = v0;
  sub_25C892440();
  uint64_t v53 = MEMORY[0x263F8EE78];
  sub_25C88A4E8((unint64_t *)&unk_26B355578, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B355560);
  sub_25C88A530((unint64_t *)&unk_26B355568, &qword_26B355560);
  sub_25C8926B0();
  (*(void (**)(uint64_t))(v8 + 104))(v1);
  *(void *)&v0[v44] = sub_25C8925F0();
  uint64_t v12 = &v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState];
  *((void *)v12 + 4) = 0;
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *(void *)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState] = 0;
  uint64_t v13 = *MEMORY[0x263F70B80];
  uint64_t v14 = sub_25C8921C0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v16 = *(uint8_t **)(v15 + 104);
  ((void (*)(uint64_t, uint64_t, uint64_t))v16)(v45, v13, v14);
  ((void (*)(uint64_t, void, uint64_t))v16)(v45 + *(int *)(v46 + 20), *MEMORY[0x263F70B88], v14);
  if (qword_26B355230 != -1) {
    swift_once();
  }
  unint64_t v17 = OUTLINED_FUNCTION_15_0(v48, (uint64_t)qword_26B355748);
  os_log_type_t v18 = sub_25C8925B0();
  if (os_log_type_enabled(v17, v18))
  {
    unint64_t v19 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_24_1(v19);
    _os_log_impl(&dword_25C872000, v17, v18, "Received nil gesture configuration, using default gesture mapping", v16, 2u);
    OUTLINED_FUNCTION_8();
  }

  uint64_t v20 = (uint64_t)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping];
  uint64_t v21 = OUTLINED_FUNCTION_107();
  sub_25C88A0B4(v21, v22);
  OUTLINED_FUNCTION_103(v20, 0);
  *(void *)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver] = 0;
  uint64_t v23 = &v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureDeduper];
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v47 = __swift_project_value_buffer(v48, (uint64_t)qword_26B355818);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
  v24(v49, v47, v48);
  sub_25C892470();
  uint64_t v25 = (int *)type metadata accessor for EventDeduper(0);
  uint64_t v26 = &v23[v25[6]];
  *(void *)uint64_t v26 = 1953066569;
  *((void *)v26 + 1) = 0xE400000000000000;
  uint64_t v27 = &v23[v25[7]];
  v24((uint64_t)v27, v14, v48);
  *(void *)&v23[v25[5]] = 1000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 40))(v27, v49, v48);
  *(void *)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestActive] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionActive] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isListening] = 0;
  *(void *)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager] = 0;
  uint64_t v28 = sub_25C892190();
  OUTLINED_FUNCTION_45(v28);
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation] = 0;
  uint64_t v29 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserverQueue;
  sub_25C892450();
  uint64_t v53 = MEMORY[0x263F8EE78];
  sub_25C8926B0();
  OUTLINED_FUNCTION_84();
  v30();
  OUTLINED_FUNCTION_108();
  *(void *)&v11[v29] = sub_25C8925F0();
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation] = 0;
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation] = 0;
  uint64_t v31 = sub_25C891AE0();
  OUTLINED_FUNCTION_45(v31);
  v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_useOwnAudioSession] = 0;
  *(void *)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper] = v51;
  swift_unknownObjectRetain();

  uint64_t v32 = sub_25C8923F0();
  os_log_type_t v33 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_7_1(v33))
  {
    uint64_t v34 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_25_1(v34);
    OUTLINED_FUNCTION_64(&dword_25C872000, v32, v35, "🫨 Initializing gesture controller");
    OUTLINED_FUNCTION_8();
  }

  v52.receiver = v11;
  v52.super_class = (Class)type metadata accessor for GestureController();
  uint64_t v36 = (char *)objc_msgSendSuper2(&v52, sel_init);
  uint64_t v37 = *(void **)&v36[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserverQueue];
  objc_allocWithZone(MEMORY[0x263F28578]);
  uint64_t v38 = v36;
  id v39 = v37;
  unint64_t v40 = OUTLINED_FUNCTION_108();
  id v42 = sub_25C889EEC(v40, v41, 1, v37, (uint64_t)v36);

  swift_unknownObjectRelease();
  uint64_t v43 = *(void **)&v38[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver];
  *(void *)&v38[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver] = v42;

  OUTLINED_FUNCTION_10_0();
}

void *sub_25C87E8CC(char a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager];
  if (!v4 && (a1 & 1) != 0)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25C892400();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B355818);
    uint64_t v6 = (void *)sub_25C8923F0();
    os_log_type_t v7 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_8_1(v7))
    {
      uint64_t v8 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_24_1(v8);
      OUTLINED_FUNCTION_22_1(&dword_25C872000, v9, v10, "🫨 Initializing HGManager");
      OUTLINED_FUNCTION_8();
    }

    sub_25C891B40();
    sub_25C891B10();
    objc_allocWithZone((Class)sub_25C891BF0());
    BOOL v11 = v2;
    uint64_t v12 = sub_25C891BE0();
    sub_25C87E148(v12);
    if (AFIsInternalInstall())
    {
      uint64_t v13 = (void *)sub_25C8923F0();
      os_log_type_t v14 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_9_1(v14))
      {
        uint64_t v15 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_24_1(v15);
        OUTLINED_FUNCTION_99(&dword_25C872000, v16, v17, "📝 Enabling raw data logging, device is using an internal install");
        OUTLINED_FUNCTION_8();
      }

      os_log_type_t v18 = *(void **)&v11[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue];
      unint64_t v19 = v11;
      sub_25C887FA4(v18, (uint64_t)v19, v19);
    }
    sub_25C87EACC();
    uint64_t v4 = *(void **)&v2[v3];
  }
  id v20 = v4;
  return v4;
}

void sub_25C87EA54(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager);
  if (v1)
  {
    id v2 = v1;
    id v3 = (id)sub_25C891BB0();

    AFIsInternalInstall();
    sub_25C891B30();
  }
}

void sub_25C87EACC()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v4 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_90();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8BF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_7_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BD8);
  uint64_t v9 = OUTLINED_FUNCTION_15(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9();
  uint64_t v35 = v10;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_83();
  MEMORY[0x270FA5388](v12);
  os_log_type_t v14 = (char *)&v34 - v13;
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v34 = v0;
  uint64_t v15 = sub_25C892400();
  uint64_t v16 = OUTLINED_FUNCTION_15_0(v15, (uint64_t)qword_26B355818);
  os_log_type_t v17 = sub_25C8925A0();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_16_1(v18);
    _os_log_impl(&dword_25C872000, v16, v17, "Fetching gesture mapping", v2, 2u);
    OUTLINED_FUNCTION_8();
  }

  id v19 = *(id *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper);
  if (v19)
  {
    if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper), sel_respondsToSelector_, sel_headGestureConfiguration))id v19 = objc_msgSend(v19, sel_headGestureConfiguration); {
    else
    }
      id v19 = 0;
  }
  uint64_t v20 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping;
  OUTLINED_FUNCTION_29_0();
  sub_25C88A118(v20, (uint64_t)v14, &qword_26A5D8BD8);
  id v21 = v19;
  sub_25C87A78C(v19, v3);
  OUTLINED_FUNCTION_103(v3, 0);
  OUTLINED_FUNCTION_6();
  sub_25C88A404(v3, v20, &qword_26A5D8BD8);
  swift_endAccess();
  uint64_t v22 = v1 + *(int *)(v6 + 48);
  sub_25C88A118(v20, v1, &qword_26A5D8BD8);
  sub_25C88A118((uint64_t)v14, v22, &qword_26A5D8BD8);
  OUTLINED_FUNCTION_44(v1);
  if (v24)
  {
    OUTLINED_FUNCTION_44(v22);
    if (v24)
    {
      sub_25C87D938(v1, &qword_26A5D8BD8);
      goto LABEL_14;
    }
    uint64_t v25 = (uint64_t *)&unk_26A5D8BF0;
  }
  else
  {
    uint64_t v23 = v35;
    sub_25C88A118(v1, v35, &qword_26A5D8BD8);
    OUTLINED_FUNCTION_44(v22);
    if (v24)
    {
      uint64_t v25 = (uint64_t *)&unk_26A5D8BF0;
    }
    else
    {
      uint64_t v26 = v34;
      sub_25C88A0B4(v22, v34);
      char v27 = sub_25C87A5FC(v23, v26);
      if (v27)
      {
        char v28 = sub_25C87A5FC(v23 + *(int *)(v4 + 20), v26 + *(int *)(v4 + 20));
        sub_25C88A490(v26, (void (*)(void))type metadata accessor for GestureMapping);
        sub_25C88A490(v23, (void (*)(void))type metadata accessor for GestureMapping);
        sub_25C87D938(v1, &qword_26A5D8BD8);
        if ((v28 & 1) == 0) {
          goto LABEL_24;
        }
LABEL_14:
        sub_25C87D938((uint64_t)v14, &qword_26A5D8BD8);

        goto LABEL_27;
      }
      sub_25C88A490(v26, (void (*)(void))type metadata accessor for GestureMapping);
      uint64_t v25 = &qword_26A5D8BD8;
    }
    sub_25C88A490(v23, (void (*)(void))type metadata accessor for GestureMapping);
  }
  sub_25C87D938(v1, v25);
LABEL_24:
  uint64_t v29 = (void *)sub_25C8923F0();
  os_log_type_t v30 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_9_1(v30))
  {
    uint64_t v31 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_25_1(v31);
    OUTLINED_FUNCTION_11_1(&dword_25C872000, v32, v33, "Gesture mapping updated");
    OUTLINED_FUNCTION_8();
  }

  sub_25C87D938((uint64_t)v14, &qword_26A5D8BD8);
LABEL_27:
  OUTLINED_FUNCTION_10_0();
}

void sub_25C87EEF4()
{
  if (sub_25C87F478())
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_25C892400();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B355818);
    id v2 = v0;
    uint64_t v3 = (void *)sub_25C8923F0();
    os_log_type_t v4 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_8_1(v4))
    {
      *(_DWORD *)OUTLINED_FUNCTION_41() = 67109120;
      OUTLINED_FUNCTION_75();

      OUTLINED_FUNCTION_101();
      _os_log_impl(v5, v6, v7, v8, v9, v10);
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    uint64_t v22 = sub_25C87E8CC(1);
    if (v22)
    {
      uint64_t v23 = v22;
      sub_25C87F3F4();
      sub_25C87FE6C();
      char v24 = *(void **)&v2[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue];
      uint64_t v25 = v2;
      id v26 = v23;
      sub_25C888F4C(v24, (uint64_t)v25, v25, v26);
    }
    else
    {
      char v27 = (void *)sub_25C8923F0();
      os_log_type_t v28 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_7_1(v28))
      {
        uint64_t v29 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v29);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v30, v31, "HGManager is nil");
        OUTLINED_FUNCTION_8();
      }
    }
  }
  else
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25C892400();
    uint64_t v32 = OUTLINED_FUNCTION_15_0(v11, (uint64_t)qword_26B355818);
    os_log_type_t v12 = sub_25C8925B0();
    if (OUTLINED_FUNCTION_73(v12, v13, v14, v15, v16, v17, v18, v19, v32))
    {
      uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_48(v20);
      OUTLINED_FUNCTION_28_0(&dword_25C872000, v33, v21, "Bobble is not available");
      OUTLINED_FUNCTION_8();
    }
  }
}

void sub_25C87F138(uint64_t a1)
{
  if (sub_25C885350())
  {
    uint64_t v2 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing;
    if (*(unsigned char *)(a1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing))
    {
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_25C892400();
      __swift_project_value_buffer(v3, (uint64_t)qword_26B355818);
      oslog = sub_25C8923F0();
      os_log_type_t v4 = sub_25C8925A0();
      if (os_log_type_enabled(oslog, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        os_log_t v6 = "Gesture recognition is already active";
LABEL_17:
        _os_log_impl(&dword_25C872000, oslog, v4, v6, v5, 2u);
        MEMORY[0x2611965C0](v5, -1, -1);
      }
    }
    else
    {
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_25C892400();
      __swift_project_value_buffer(v8, (uint64_t)qword_26B355818);
      uint64_t v9 = sub_25C8923F0();
      os_log_type_t v10 = sub_25C8925A0();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_25C872000, v9, v10, "🫨 Starting gesture recognition", v11, 2u);
        MEMORY[0x2611965C0](v11, -1, -1);
      }

      sub_25C891BD0();
      *(unsigned char *)(a1 + v2) = 1;
      oslog = sub_25C8923F0();
      os_log_type_t v4 = sub_25C8925A0();
      if (os_log_type_enabled(oslog, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        os_log_t v6 = "🫨 Started gesture recognition";
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25C892400();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B355818);
    oslog = sub_25C8923F0();
    os_log_type_t v4 = sub_25C8925A0();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      os_log_t v6 = "Gesture recognition isn't needed anymore, cancelling start";
      goto LABEL_17;
    }
  }
}

uint64_t sub_25C87F3F4()
{
  uint64_t v1 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) == 1)
  {
    uint64_t result = sub_25C8828DC();
    if (result)
    {
      uint64_t v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
      uint64_t v4 = 7;
LABEL_8:
      *(void *)(v0 + v3) = v4;
      return result;
    }
    if (*(unsigned char *)(v0 + v1) == 1)
    {
      uint64_t v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
      uint64_t v4 = 4;
      goto LABEL_8;
    }
  }
  uint64_t result = sub_25C8828DC();
  uint64_t v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
  if (result)
  {
    uint64_t v4 = 3;
    goto LABEL_8;
  }
  *(void *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent) = 0;
  return result;
}

id sub_25C87F478()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper);
  if (v1 && (objc_msgSend(v1, sel_respondsToSelector_, sel_isBobbleAvailable) & 1) != 0) {
    return objc_msgSend(v1, sel_isBobbleAvailable);
  }
  else {
    return 0;
  }
}

void sub_25C87F4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_71();
  a21 = v23;
  a22 = v24;
  uint64_t v25 = v22;
  char v27 = v26;
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_25C892400();
  uint64_t v29 = (void *)OUTLINED_FUNCTION_15_0(v28, (uint64_t)qword_26B355818);
  os_log_type_t v30 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v30))
  {
    OUTLINED_FUNCTION_24();
    a10 = OUTLINED_FUNCTION_22();
    unint64_t v31 = OUTLINED_FUNCTION_97(4.8149e-34);
    sub_25C8773AC(v31, v32, &a10);
    OUTLINED_FUNCTION_58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_46(&dword_25C872000, v33, v34, "Will stop gesture recognition for reason: %s");
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }

  *(void *)&v25[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent] = 0;
  sub_25C88038C();
  sub_25C87FE6C();
  uint64_t v35 = *(void **)&v25[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue];
  uint64_t v36 = v25;
  sub_25C888B7C(v35, (uint64_t)v36, v36, v27);
  OUTLINED_FUNCTION_40();
}

void sub_25C87F60C(char *a1, char a2)
{
  uint64_t v4 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing;
  uint64_t v5 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement;
  if (a1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing] == 1)
  {
    if ((a1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement] & 1) == 0)
    {
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_25C892400();
      __swift_project_value_buffer(v6, (uint64_t)qword_26B355818);
      uint64_t v7 = sub_25C8923F0();
      os_log_type_t v8 = sub_25C8925A0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = v4;
        uint64_t v10 = swift_slowAlloc();
        uint64_t v37 = v10;
        *(_DWORD *)uint64_t v9 = 136315138;
        unint64_t v11 = sub_25C87BF44(a2);
        sub_25C8773AC(v11, v12, &v37);
        sub_25C892660();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C872000, v7, v8, "🫨 Stopping gesture recognition for reason: %s", v9, 0xCu);
        swift_arrayDestroy();
        uint64_t v13 = v10;
        uint64_t v4 = v36;
        MEMORY[0x2611965C0](v13, -1, -1);
        MEMORY[0x2611965C0](v9, -1, -1);
      }

      int v14 = *(void **)&a1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager];
      if (v14)
      {
        *(void *)(swift_allocObject() + 16) = a1;
        id v15 = v14;
        int v16 = a1;
        sub_25C891BC0();

        swift_release();
      }
      a1[v4] = 0;
      int v17 = sub_25C8923F0();
      os_log_type_t v18 = sub_25C8925A0();
      if (os_log_type_enabled(v17, v18))
      {
        int v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        uint64_t v37 = v20;
        *(_DWORD *)int v19 = 136315138;
        unint64_t v21 = sub_25C87BF44(a2);
        sub_25C8773AC(v21, v22, &v37);
        sub_25C892660();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C872000, v17, v18, "🫨 Stopped gesture recognition for reason: %s", v19, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611965C0](v20, -1, -1);
        MEMORY[0x2611965C0](v19, -1, -1);
      }

      return;
    }
    goto LABEL_13;
  }
  if (a1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement])
  {
LABEL_13:
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_25C892400();
    __swift_project_value_buffer(v23, (uint64_t)qword_26B355818);
    uint64_t v24 = sub_25C8923F0();
    os_log_type_t v25 = sub_25C8925A0();
    if (os_log_type_enabled(v24, v25))
    {
      char v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v37 = v27;
      *(_DWORD *)char v26 = 136315138;
      unint64_t v28 = sub_25C87BF44(a2);
      sub_25C8773AC(v28, v29, &v37);
      sub_25C892660();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, v24, v25, "🫨 Not stopping gesture recognition for reason: %s as it's still needed for early dismissal, updating states", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611965C0](v27, -1, -1);
      MEMORY[0x2611965C0](v26, -1, -1);
    }

    sub_25C8854C4(0, 8);
  }
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_25C892400();
  __swift_project_value_buffer(v30, (uint64_t)qword_26B355818);
  unint64_t v31 = a1;
  unint64_t v32 = sub_25C8923F0();
  os_log_type_t v33 = sub_25C8925A0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    int v35 = a1[v4];
    *(_DWORD *)uint64_t v34 = 67109376;
    LODWORD(v37) = v35;
    sub_25C892660();
    *(_WORD *)(v34 + 8) = 1024;
    LODWORD(v37) = a1[v5];
    sub_25C892660();

    _os_log_impl(&dword_25C872000, v32, v33, "🫨 recognizing: %{BOOL}d readingAnnouncement: %{BOOL}d", (uint8_t *)v34, 0xEu);
    MEMORY[0x2611965C0](v34, -1, -1);
  }
  else
  {
  }
}

void sub_25C87FB94(uint64_t a1)
{
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C892400();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B355818);
  uint64_t v3 = sub_25C8923F0();
  os_log_type_t v4 = sub_25C8925A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C872000, v3, v4, "🫨 HGManager has fully stopped", v5, 2u);
    MEMORY[0x2611965C0](v5, -1, -1);
  }

  if (sub_25C887460())
  {
    uint64_t v6 = sub_25C8923F0();
    os_log_type_t v7 = sub_25C8925A0();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl(&dword_25C872000, v6, v7, "🔊 Audio session is still active, releasing it if no other client is using it", v8, 2u);
      MEMORY[0x2611965C0](v8, -1, -1);
    }

    uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper);
    if (v9
      && (objc_msgSend(v9, sel_respondsToSelector_, sel_deactivateAudioSessionIfNoActiveAssertions) & 1) != 0)
    {
      objc_msgSend(v9, sel_deactivateAudioSessionIfNoActiveAssertions);
    }
  }
}

void sub_25C87FD50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_71();
  a21 = v22;
  a22 = v23;
  uint64_t v25 = v24;
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_25C892400();
  uint64_t v27 = (void *)OUTLINED_FUNCTION_15_0(v26, (uint64_t)qword_26B355818);
  os_log_type_t v28 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v28))
  {
    unint64_t v29 = (_DWORD *)OUTLINED_FUNCTION_24();
    a10 = OUTLINED_FUNCTION_22();
    *unint64_t v29 = 136315138;
    unint64_t v30 = sub_25C87BF44(v25);
    sub_25C8773AC(v30, v31, &a10);
    OUTLINED_FUNCTION_58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_46(&dword_25C872000, v32, v33, "Stopping engagement for confirmations for reason: %s");
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }

  sub_25C886838();
  sub_25C8854C4(0, v25);
  OUTLINED_FUNCTION_40();
}

void sub_25C87FE6C()
{
  OUTLINED_FUNCTION_12_0();
  os_log_type_t v4 = v0;
  char v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BD8);
  uint64_t v8 = OUTLINED_FUNCTION_15(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = OUTLINED_FUNCTION_61();
  uint64_t v10 = type metadata accessor for GestureMapping(v9);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_7_0();
  if (v6)
  {
    sub_25C87EACC();
    OUTLINED_FUNCTION_56();
    if (!v27) {
      swift_once();
    }
    uint64_t v12 = sub_25C892400();
    uint64_t v13 = OUTLINED_FUNCTION_15_0(v12, (uint64_t)qword_26B355818);
    os_log_type_t v14 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_96(v14))
    {
      id v15 = (uint8_t *)OUTLINED_FUNCTION_38();
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_25C872000, v13, v3, "🔊 Updating the gesture mapping", v15, 2u);
      OUTLINED_FUNCTION_8();
    }
  }
  uint64_t v16 = (uint64_t)&v4[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping];
  OUTLINED_FUNCTION_29_0();
  sub_25C88A118(v16, v2, &qword_26A5D8BD8);
  if (__swift_getEnumTagSinglePayload(v2, 1, v10) != 1)
  {
    sub_25C88A0B4(v2, v1);
    uint64_t v23 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
    sub_25C87AB7C();
    uint64_t v24 = *(void *)&v4[v23];
    if (sub_25C87C760())
    {
      uint64_t v25 = v24 & 3;
      uint64_t v26 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady;
      BOOL v27 = v4[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady] == 1 && v25 == 3;
      if (v27 && (v4[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive] & 1) == 0)
      {
        OUTLINED_FUNCTION_56();
        if (!v27) {
          swift_once();
        }
        uint64_t v42 = sub_25C892400();
        uint64_t v34 = (void *)OUTLINED_FUNCTION_15_0(v42, (uint64_t)qword_26B355818);
        os_log_type_t v43 = sub_25C8925A0();
        if (OUTLINED_FUNCTION_4_1(v43))
        {
          uint64_t v44 = (_WORD *)OUTLINED_FUNCTION_38();
          OUTLINED_FUNCTION_16_1(v44);
          OUTLINED_FUNCTION_12_1(&dword_25C872000, v45, v46, "🔊 Playing waiting tone");
          OUTLINED_FUNCTION_8();
        }
        goto LABEL_41;
      }
      OUTLINED_FUNCTION_56();
      if (!v27) {
        swift_once();
      }
      uint64_t v28 = sub_25C892400();
      __swift_project_value_buffer(v28, (uint64_t)qword_26B355818);
      unint64_t v29 = v4;
      unint64_t v30 = sub_25C8923F0();
      os_log_type_t v31 = sub_25C8925A0();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        OUTLINED_FUNCTION_93((float *)v32, 1.5048e-36);
        sub_25C892660();
        *(_WORD *)(v32 + 8) = 1024;
        sub_25C892660();
        *(_WORD *)(v32 + 14) = 1024;
        sub_25C892660();

        _os_log_impl(&dword_25C872000, v30, v31, "🔇 Not playing waiting tone, expectingConfirmation: %{BOOL}d, ttsActive: %{BOOL}d, isReady: %{BOOL}d", (uint8_t *)v32, 0x14u);
        OUTLINED_FUNCTION_8();
      }
      else
      {

        unint64_t v30 = v29;
      }

      if (v25 != 3
        || (*((unsigned char *)&v29->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive) & 1) != 0
        || (v4[v26] & 1) != 0
        || *((unsigned char *)&v29->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) != 1)
      {
        goto LABEL_42;
      }
      uint64_t v34 = (void *)sub_25C8923F0();
      os_log_type_t v40 = sub_25C8925B0();
      if (!OUTLINED_FUNCTION_4_1(v40))
      {
LABEL_41:

LABEL_42:
        sub_25C880564();
        sub_25C88A490(v1, (void (*)(void))type metadata accessor for GestureMapping);
        goto LABEL_43;
      }
      uint64_t v41 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_16_1(v41);
      id v39 = "‼️ Not streaming motion data, disabling waiting tone playback";
    }
    else
    {
      OUTLINED_FUNCTION_56();
      if (!v27) {
        swift_once();
      }
      uint64_t v33 = sub_25C892400();
      uint64_t v34 = (void *)OUTLINED_FUNCTION_15_0(v33, (uint64_t)qword_26B355818);
      os_log_type_t v35 = sub_25C8925A0();
      if (!OUTLINED_FUNCTION_4_1(v35)) {
        goto LABEL_41;
      }
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_16_1(v36);
      id v39 = "🔇 Not playing waiting tone as it is disabled in the user defaults";
    }
    OUTLINED_FUNCTION_12_1(&dword_25C872000, v37, v38, v39);
    OUTLINED_FUNCTION_8();
    goto LABEL_41;
  }
  sub_25C87D938(v2, &qword_26A5D8BD8);
  OUTLINED_FUNCTION_56();
  if (!v27) {
    swift_once();
  }
  uint64_t v17 = sub_25C892400();
  os_log_type_t v18 = (void *)OUTLINED_FUNCTION_15_0(v17, (uint64_t)qword_26B355818);
  os_log_type_t v19 = sub_25C8925B0();
  if (OUTLINED_FUNCTION_7_1(v19))
  {
    uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v20);
    OUTLINED_FUNCTION_5_1(&dword_25C872000, v21, v22, "GestureMapping is nil");
    OUTLINED_FUNCTION_8();
  }

LABEL_43:
  OUTLINED_FUNCTION_10_0();
}

void sub_25C88038C()
{
  uint64_t v1 = sub_25C87E8CC(0);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
    id v15 = v1;
    sub_25C8883CC(v2, v0, v15);
  }
  else
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C892400();
    uint64_t v16 = OUTLINED_FUNCTION_15_0(v3, (uint64_t)qword_26B355818);
    os_log_type_t v4 = sub_25C8925B0();
    if (OUTLINED_FUNCTION_74(v4, v5, v6, v7, v8, v9, v10, v11, v14, v16))
    {
      uint64_t v12 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_48(v12);
      OUTLINED_FUNCTION_28_0(&dword_25C872000, v15, v13, "HGManager is nil");
      OUTLINED_FUNCTION_8();
    }
  }
}

void sub_25C880474()
{
  uint64_t v0 = (void *)sub_25C891BB0();
  uint64_t v1 = (void *)sub_25C891B20();

  sub_25C891B60();
  uint64_t v2 = (void *)sub_25C891BB0();
  uint64_t v3 = (void *)sub_25C891B20();

  sub_25C891B60();
  os_log_type_t v4 = (void *)sub_25C891BB0();
  int v5 = (void *)sub_25C891B20();

  sub_25C891B60();
  int v6 = (void *)sub_25C891BB0();
  id v7 = (id)sub_25C891B20();

  sub_25C891B60();
}

void sub_25C880564()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  os_log_type_t v4 = v3;
  v82[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = type metadata accessor for GestureMapping(0);
  uint64_t v6 = OUTLINED_FUNCTION_35_0(v5);
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v6);
  int v11 = sub_25C87E8CC(1);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v76 = v8;
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v80 = v0;
    uint64_t v13 = sub_25C892400();
    uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26B355818);
    id v15 = (void *)sub_25C8923F0();
    os_log_type_t v16 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_9_1(v16))
    {
      uint64_t v17 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_25_1(v17);
      OUTLINED_FUNCTION_11_1(&dword_25C872000, v18, v19, "Configuring fallback audio session");
      OUTLINED_FUNCTION_8();
    }

    id v20 = objc_msgSend(self, sel_sharedInstance);
    uint64_t v21 = sub_25C8923F0();
    os_log_type_t v22 = sub_25C892590();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v78 = (uint64_t)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v79 = (uint64_t)v2;
    uint64_t v77 = v10;
    if (v23)
    {
      uint64_t v8 = OUTLINED_FUNCTION_22();
      uint64_t v24 = (void *)OUTLINED_FUNCTION_110();
      os_log_type_t v74 = v12;
      v82[0] = v24;
      *(_DWORD *)uint64_t v8 = 134218498;
      uint64_t v81 = 0;
      uint64_t v73 = v14;
      sub_25C892660();
      *(_WORD *)(v8 + 12) = 2080;
      id v25 = objc_msgSend(v20, sel_category);
      uint64_t v75 = v4;
      id v26 = v25;
      uint64_t v27 = sub_25C892500();
      unint64_t v29 = v28;

      uint64_t v81 = sub_25C8773AC(v27, v29, (uint64_t *)v82);
      sub_25C892660();

      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 22) = 2080;
      uint64_t v2 = (void *)(v8 + 24);
      id v30 = objc_msgSend(v20, sel_mode);
      uint64_t v31 = sub_25C892500();
      unint64_t v33 = v32;

      uint64_t v81 = sub_25C8773AC(v31, v33, (uint64_t *)v82);
      LOBYTE(v14) = v73;
      sub_25C892660();

      os_log_type_t v4 = v75;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, v21, v22, "🔊 Audio Session Fallback (%ld, %s, %s) is active and ready for playback", (uint8_t *)v8, 0x20u);
      swift_arrayDestroy();
      uint64_t v12 = v74;
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    v82[0] = 0;
    unsigned int v40 = objc_msgSend(v20, sel_setPrefersNoDucking_error_, 1, v82);
    uint64_t v41 = v80;
    if (v40)
    {
      id v42 = v82[0];
    }
    else
    {
      id v43 = v82[0];
      uint64_t v44 = (void *)OUTLINED_FUNCTION_105();

      LOBYTE(v8) = (_BYTE)v44;
      swift_willThrow();
    }
    uint64_t v45 = *MEMORY[0x263EF9060];
    uint64_t v46 = *MEMORY[0x263EF9158];
    v82[0] = 0;
    if (objc_msgSend(v20, sel_setCategory_mode_options_error_, v45, v46, 2, v82))
    {
      id v47 = v82[0];
    }
    else
    {
      id v48 = v82[0];
      uint64_t v49 = (void *)OUTLINED_FUNCTION_105();

      LOBYTE(v8) = (_BYTE)v49;
      swift_willThrow();
    }
    v82[0] = 0;
    if (objc_msgSend(v20, sel_setAudioHardwareControlFlags_error_, 0, v82))
    {
      id v50 = v82[0];
    }
    else
    {
      id v51 = v82[0];
      objc_super v52 = (void *)OUTLINED_FUNCTION_105();

      LOBYTE(v8) = (_BYTE)v52;
      swift_willThrow();
    }
    if (objc_msgSend(v20, sel_isActive) && !v4)
    {
      uint64_t v53 = sub_25C8923F0();
      os_log_type_t v54 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_9_1(v54))
      {
        uint64_t v55 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_104(v55);
        OUTLINED_FUNCTION_63(&dword_25C872000, v53, (os_log_type_t)v8, "Fallback audio session was used, deactivating it to resume interrupted media");
        OUTLINED_FUNCTION_8();
      }

      v82[0] = 0;
      if (objc_msgSend(v20, sel_setActive_error_, 0, v82))
      {
        id v56 = v82[0];
      }
      else
      {
        id v57 = v82[0];
        uint64_t v58 = (void *)OUTLINED_FUNCTION_105();

        swift_willThrow();
      }
    }
    char v59 = sub_25C87C780();
    char v60 = sub_25C8923F0();
    os_log_type_t v61 = sub_25C8925A0();
    BOOL v62 = os_log_type_enabled(v60, v61);
    if (v59)
    {
      if (v62)
      {
        *(_WORD *)OUTLINED_FUNCTION_38() = 0;
        OUTLINED_FUNCTION_63(&dword_25C872000, v60, v61, "Using system sounds for head gestures' audio feedback");
        OUTLINED_FUNCTION_8();
      }
    }
    else
    {
      if (v62)
      {
        *(_WORD *)OUTLINED_FUNCTION_38() = 0;
        OUTLINED_FUNCTION_63(&dword_25C872000, v60, v61, "Not using system sounds for head gestures' audio feedback");
        OUTLINED_FUNCTION_8();
      }

      int v63 = sub_25C88725C();
      uint64_t v64 = sub_25C8923F0();
      os_log_type_t v65 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_8_1(v65))
      {
        uint64_t v66 = swift_slowAlloc();
        OUTLINED_FUNCTION_93((float *)v66, 1.5047e-36);
        LODWORD(v82[0]) = v63;
        sub_25C892660();
        *(_WORD *)(v66 + 8) = 2048;
        v82[0] = v4;
        uint64_t v41 = v80;
        sub_25C892660();
        _os_log_impl(&dword_25C872000, v64, (os_log_type_t)v14, "AudioSessionID: %u, audioFeedbackCategories: %ld", (uint8_t *)v66, 0x12u);
        OUTLINED_FUNCTION_8();
      }

      sub_25C88878C(*(void **)((char *)&v41->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue), (uint64_t)v41, v12, v63);
    }
    uint64_t v67 = v78;
    sub_25C87DD88(v79, v78);
    unint64_t v68 = (*(unsigned __int8 *)(v76 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    uint64_t v69 = v68 + v77;
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = v12;
    sub_25C88A0B4(v67, v70 + v68);
    uint64_t v71 = (unsigned char *)(v70 + v69);
    *uint64_t v71 = v4 & 1;
    v71[1] = (v4 & 2) != 0;
    v71[2] = (v4 & 3) != 0;
    v71[3] = (v4 & 4) != 0;
    id v72 = v12;
    sub_25C8896BC();
    swift_release();

    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_25C892400();
    uint64_t v80 = OUTLINED_FUNCTION_15_0(v34, (uint64_t)qword_26B355818);
    os_log_type_t v35 = sub_25C8925B0();
    if (os_log_type_enabled(v80, v35))
    {
      uint64_t v36 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_48(v36);
      OUTLINED_FUNCTION_28_0(&dword_25C872000, v80, v37, "HGManager is nil");
      OUTLINED_FUNCTION_8();
    }
    OUTLINED_FUNCTION_10_0();
  }
}

void sub_25C880D60()
{
  uint64_t v0 = (void *)sub_25C891BB0();
  id v1 = (id)sub_25C891B20();

  sub_25C891B80();
}

void sub_25C880DC0()
{
  uint64_t v0 = (void *)sub_25C891BB0();
  id v1 = (void *)sub_25C891B20();

  sub_25C87B3C0();
  sub_25C891B70();

  uint64_t v2 = (void *)sub_25C891BB0();
  uint64_t v3 = (void *)sub_25C891B20();

  sub_25C891B50();
  os_log_type_t v4 = (void *)sub_25C891BB0();
  uint64_t v5 = (void *)sub_25C891B20();

  sub_25C891B60();
  uint64_t v6 = (void *)sub_25C891BB0();
  uint64_t v7 = (void *)sub_25C891B20();

  sub_25C891B60();
  uint64_t v8 = (void *)sub_25C891BB0();
  uint64_t v9 = (void *)sub_25C891B20();

  sub_25C891B50();
  uint64_t v10 = (void *)sub_25C891BB0();
  int v11 = (void *)sub_25C891B20();

  sub_25C891B60();
  uint64_t v12 = (void *)sub_25C891BB0();
  uint64_t v13 = (void *)sub_25C891B20();

  sub_25C891B60();
  uint64_t v14 = (void *)sub_25C891BB0();
  sub_25C891B00();

  id v15 = (void *)sub_25C891BB0();
  id v16 = (id)sub_25C891B20();

  sub_25C891BA0();
}

void sub_25C880F9C()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 1;
  sub_25C880FDC();

  sub_25C8854C4(1, 8);
}

void sub_25C880FDC()
{
  unsigned __int8 v0 = sub_25C87F478();
  id v1 = sub_25C87E8CC(v0 & 1);

  if (!v1 && (v0 & 1) != 0)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25C892400();
    uint64_t v14 = OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355818);
    os_log_type_t v3 = sub_25C8925B0();
    if (OUTLINED_FUNCTION_74(v3, v4, v5, v6, v7, v8, v9, v10, v13, v14))
    {
      int v11 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_48(v11);
      OUTLINED_FUNCTION_28_0(&dword_25C872000, v15, v12, "Failed to initialize HGManager");
      OUTLINED_FUNCTION_8();
    }
  }
}

void sub_25C8810C0()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = v0;
  int v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v7 = OUTLINED_FUNCTION_15(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_32_0(v8, v145);
  uint64_t v152 = type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_18();
  v153 = (void *)v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BD8);
  uint64_t v12 = OUTLINED_FUNCTION_15(v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = OUTLINED_FUNCTION_31();
  v157 = (void (*)(void))type metadata accessor for GestureMapping(v13);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_7();
  uint64_t v17 = v16 - v15;
  sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  uint64_t v158 = v18;
  uint64_t v159 = v19;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_23(v20, v145);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_19_0();
  uint64_t v150 = v22;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_83();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v145 - v26;
  MEMORY[0x270FA5388](v25);
  unint64_t v29 = (char *)&v145 - v28;
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_25C892400();
  uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_26B355818);
  id v32 = v5;
  uint64_t v156 = v31;
  unint64_t v33 = sub_25C8923F0();
  os_log_type_t v34 = sub_25C8925A0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v155 = v3;
  v151 = (void (*)(void))v2;
  if (v35)
  {
    uint64_t v36 = OUTLINED_FUNCTION_22();
    v154 = v27;
    uint64_t v37 = v36;
    uint64_t v38 = (void *)OUTLINED_FUNCTION_41();
    uint64_t v146 = OUTLINED_FUNCTION_110();
    v162[0] = v146;
    *(_DWORD *)uint64_t v37 = 136315650;
    sub_25C87C1F0((uint64_t)v29);
    uint64_t v39 = sub_25C8921B0();
    uint64_t v149 = v17;
    unint64_t v41 = v40;
    (*(void (**)(char *, uint64_t))(v159 + 8))(v29, v158);
    v161[0] = sub_25C8773AC(v39, v41, v162);
    sub_25C892660();

    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2112;
    id v42 = objc_msgSend(v32, sel_avgConfidence);
    OUTLINED_FUNCTION_114((uint64_t)v42);
    sub_25C892660();
    *uint64_t v38 = v42;

    *(_WORD *)(v37 + 22) = 2080;
    uint64_t v43 = sub_25C87C294((uint64_t)objc_msgSend(v32, sel_headGesturePart));
    uint64_t v45 = sub_25C8773AC(v43, v44, v162);
    OUTLINED_FUNCTION_114(v45);
    uint64_t v17 = v149;
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v33, v34, "HeadGesture: Type:%s, confidence: %@, partGesture: %s", (uint8_t *)v37, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8B60);
    swift_arrayDestroy();
    uint64_t v3 = v155;
    OUTLINED_FUNCTION_8();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    uint64_t v27 = v154;
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  uint64_t v46 = v3 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping;
  OUTLINED_FUNCTION_29_0();
  sub_25C88A118(v46, v1, &qword_26A5D8BD8);
  if (__swift_getEnumTagSinglePayload(v1, 1, (uint64_t)v157) != 1)
  {
    sub_25C88A0B4(v1, v17);
    sub_25C87C1F0((uint64_t)v27);
    uint64_t v52 = v158;
    uint64_t v53 = v159;
    OUTLINED_FUNCTION_84();
    v54();
    sub_25C88A4E8((unint64_t *)&unk_26A5D8BE0, MEMORY[0x263F70B98]);
    char v55 = sub_25C8924E0();
    id v56 = *(void (**)(void))(v53 + 8);
    OUTLINED_FUNCTION_26_1();
    v56();
    if (v55)
    {
      id v57 = (void *)sub_25C8923F0();
      os_log_type_t v58 = sub_25C892590();
      if (OUTLINED_FUNCTION_7_1(v58))
      {
        char v59 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v59);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v60, v61, "Ignoring partial gestures");
        OUTLINED_FUNCTION_8();
      }

      goto LABEL_45;
    }
    v157 = v56;
    v161[0] = sub_25C87B580();
    v161[1] = v62;
    sub_25C892540();
    uint64_t v63 = v155;
    OUTLINED_FUNCTION_27_1();
    sub_25C87CA04();
    char v65 = v64;
    swift_endAccess();
    swift_bridgeObjectRelease();
    if ((v65 & 1) == 0)
    {
      uint64_t v73 = (void *)sub_25C8923F0();
      os_log_type_t v74 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_7_1(v74))
      {
        uint64_t v75 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v75);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v76, v77, "Head gesture might be a duplicate, ignoring");
        OUTLINED_FUNCTION_8();
      }

      OUTLINED_FUNCTION_26_1();
      v78();
      goto LABEL_46;
    }
    uint64_t v66 = OUTLINED_FUNCTION_82();
    if (sub_25C882188(v66, v67))
    {
      if (MEMORY[0x261196630](v63 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate))
      {
        id v68 = objc_msgSend(v32, sel_timestamp);
        uint64_t v69 = v152;
        uint64_t v70 = v153;
        sub_25C891A90();

        uint64_t v159 = *(void *)(v159 + 16);
        OUTLINED_FUNCTION_78();
        OUTLINED_FUNCTION_38_0();
        v71();
        uint64_t v72 = v63 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo;
        OUTLINED_FUNCTION_29_0();
        sub_25C88A118(v72, (uint64_t)v70 + *(int *)(v69 + 28), (uint64_t *)&unk_26B355210);
        *uint64_t v70 = 1;
        sub_25C88AFD4();
        swift_unknownObjectRelease();
        sub_25C88A490((uint64_t)v70, (void (*)(void))type metadata accessor for GestureResponse);
      }
      id v56 = v151;
      OUTLINED_FUNCTION_78();
      v108();
      v109 = (void *)sub_25C8923F0();
      os_log_type_t v110 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_92(v110))
      {
        v111 = (_DWORD *)OUTLINED_FUNCTION_24();
        uint64_t v112 = OUTLINED_FUNCTION_22();
        v154 = v27;
        uint64_t v160 = v112;
        _DWORD *v111 = 136315138;
        uint64_t v113 = sub_25C87B580();
        uint64_t v115 = sub_25C8773AC(v113, v114, &v160);
        OUTLINED_FUNCTION_80(v115);
        uint64_t v52 = v158;
        sub_25C892660();
        swift_bridgeObjectRelease();
        id v56 = v157;
        OUTLINED_FUNCTION_26_1();
        v56();
        OUTLINED_FUNCTION_51(&dword_25C872000, v116, v117, "%s detected: marking confirmation as responded, not expecting confirmation");
        OUTLINED_FUNCTION_43();
        uint64_t v27 = v154;
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();
      }
      else
      {
        uint64_t v118 = OUTLINED_FUNCTION_109();
        ((void (*)(uint64_t))v56)(v118);
      }

      uint64_t v119 = v155;
      sub_25C886838();
      *(unsigned char *)(v119 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
      sub_25C8854C4(0, 8);
      uint64_t v120 = 1;
    }
    else
    {
      OUTLINED_FUNCTION_82();
      sub_25C8822CC();
      if (v79)
      {
        uint64_t v80 = v159;
        if (*(unsigned char *)(v63 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) == 1)
        {
          uint64_t v81 = (void *)sub_25C8923F0();
          os_log_type_t v82 = sub_25C8925A0();
          if (OUTLINED_FUNCTION_7_1(v82))
          {
            uint64_t v83 = (_WORD *)OUTLINED_FUNCTION_38();
            OUTLINED_FUNCTION_20_1(v83);
            OUTLINED_FUNCTION_5_1(&dword_25C872000, v84, v85, "Creating a promptInfo for announced call");
            uint64_t v80 = v159;
            OUTLINED_FUNCTION_8();
          }

          uint64_t v86 = v148;
          sub_25C892150();
          uint64_t v63 = v155;
          uint64_t v87 = v155 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo;
          OUTLINED_FUNCTION_6();
          sub_25C88A404(v86, v87, (uint64_t *)&unk_26B355210);
          swift_endAccess();
        }
        uint64_t v88 = MEMORY[0x261196630](v63 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate);
        v154 = v27;
        if (v88)
        {
          id v89 = objc_msgSend(v32, sel_timestamp);
          uint64_t v91 = v152;
          uint64_t v90 = v153;
          sub_25C891A90();

          uint64_t v92 = *(void (**)(void))(v80 + 16);
          OUTLINED_FUNCTION_38_0();
          v92();
          uint64_t v93 = v63 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo;
          OUTLINED_FUNCTION_29_0();
          sub_25C88A118(v93, (uint64_t)v90 + *(int *)(v91 + 28), (uint64_t *)&unk_26B355210);
          *uint64_t v90 = 2;
          sub_25C88AFD4();
          swift_unknownObjectRelease();
          sub_25C88A490((uint64_t)v90, (void (*)(void))type metadata accessor for GestureResponse);
          uint64_t v27 = v154;
        }
        else
        {
          uint64_t v92 = *(void (**)(void))(v80 + 16);
        }
        id v56 = v157;
        uint64_t v121 = v150;
        OUTLINED_FUNCTION_78();
        v92();
        v122 = (void *)sub_25C8923F0();
        os_log_type_t v123 = sub_25C8925A0();
        if (OUTLINED_FUNCTION_92(v123))
        {
          v124 = (_DWORD *)OUTLINED_FUNCTION_24();
          uint64_t v160 = OUTLINED_FUNCTION_22();
          _DWORD *v124 = 136315138;
          uint64_t v125 = sub_25C87B580();
          uint64_t v127 = sub_25C8773AC(v125, v126, &v160);
          OUTLINED_FUNCTION_80(v127);
          id v56 = v157;
          uint64_t v52 = v158;
          sub_25C892660();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_26_1();
          v56();
          OUTLINED_FUNCTION_51(&dword_25C872000, v128, v129, "%s detected: marking confirmation as responded, not expecting confirmation");
          OUTLINED_FUNCTION_43();
          uint64_t v27 = v154;
          OUTLINED_FUNCTION_8();
          OUTLINED_FUNCTION_8();
        }
        else
        {
          ((void (*)(uint64_t, uint64_t))v56)(v121, v52);
        }

        uint64_t v130 = v155;
        sub_25C886838();
        *(unsigned char *)(v130 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
        sub_25C8854C4(0, 8);
        uint64_t v120 = 2;
      }
      else
      {
        uint64_t v94 = OUTLINED_FUNCTION_82();
        char v96 = sub_25C882044(v94, v95);
        id v56 = v157;
        if ((v96 & 1) == 0)
        {
LABEL_45:
          ((void (*)(char *, uint64_t))v56)(v27, v52);
LABEL_46:
          sub_25C88A490(v17, (void (*)(void))type metadata accessor for GestureMapping);
          goto LABEL_47;
        }
        uint64_t v97 = v159 + 16;
        id v56 = v147;
        OUTLINED_FUNCTION_78();
        v151 = v98;
        v98();
        unint64_t v99 = (void *)sub_25C8923F0();
        os_log_type_t v100 = sub_25C8925A0();
        BOOL v101 = OUTLINED_FUNCTION_92(v100);
        uint64_t v159 = v97;
        if (v101)
        {
          v102 = (_DWORD *)OUTLINED_FUNCTION_24();
          uint64_t v103 = OUTLINED_FUNCTION_22();
          v154 = v27;
          v161[0] = v103;
          _DWORD *v102 = 136315138;
          uint64_t v149 = v17;
          uint64_t v104 = sub_25C87B580();
          uint64_t v160 = sub_25C8773AC(v104, v105, v161);
          uint64_t v17 = v149;
          uint64_t v52 = v158;
          sub_25C892660();
          swift_bridgeObjectRelease();
          id v56 = v157;
          OUTLINED_FUNCTION_26_1();
          v56();
          OUTLINED_FUNCTION_51(&dword_25C872000, v106, v107, "%s detected: dismissing Siri");
          OUTLINED_FUNCTION_43();
          uint64_t v27 = v154;
          OUTLINED_FUNCTION_8();
          OUTLINED_FUNCTION_8();
        }
        else
        {
          uint64_t v131 = OUTLINED_FUNCTION_109();
          ((void (*)(uint64_t))v56)(v131);
        }

        uint64_t v132 = v155;
        sub_25C88038C();
        if (MEMORY[0x261196630](v132 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate))
        {
          id v140 = objc_msgSend(v32, sel_timestamp);
          v141 = v153;
          sub_25C891A90();

          OUTLINED_FUNCTION_78();
          OUTLINED_FUNCTION_38_0();
          v142();
          uint64_t v143 = sub_25C892190();
          OUTLINED_FUNCTION_45(v143);
          void *v141 = 4;
          sub_25C88AFD4();
          swift_unknownObjectRelease();
          sub_25C88A490((uint64_t)v141, (void (*)(void))type metadata accessor for GestureResponse);
        }
        uint64_t v144 = v155;
        *(void *)(v155 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState) = 1;
        *(unsigned char *)(v144 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
        sub_25C87F4D4(7, v133, v134, v135, v136, v137, v138, v139, v145, v146, (uint64_t)v147, v148, v149, v150, (uint64_t)v151, v152, (uint64_t)v153, (uint64_t)v154, v155,
          v156,
          (uint64_t)v157,
          v158);
        sub_25C885950();
        uint64_t v120 = 4;
      }
    }
    sub_25C87CEEC((void *)v120);
    goto LABEL_45;
  }
  sub_25C87D938(v1, &qword_26A5D8BD8);
  id v47 = (void *)sub_25C8923F0();
  os_log_type_t v48 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_7_1(v48))
  {
    uint64_t v49 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v49);
    OUTLINED_FUNCTION_5_1(&dword_25C872000, v50, v51, "GestureMapping is nil");
    OUTLINED_FUNCTION_8();
  }

LABEL_47:
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C881E40()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8BC0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BD0);
  MEMORY[0x270FA5388](v3 - 8);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C891AD0();
  uint64_t v6 = *MEMORY[0x263F70E30];
  uint64_t v7 = sub_25C8922A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  sub_25C892180();
  uint64_t v8 = *MEMORY[0x263F70A10];
  uint64_t v9 = sub_25C8921A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v2, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v9);
  return sub_25C892160();
}

uint64_t sub_25C882044(uint64_t a1, uint64_t a2)
{
  sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_0();
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent);
  sub_25C87DD88(a2, v3);
  OUTLINED_FUNCTION_38_0();
  v10();
  if ((v9 & 4) != 0 && (sub_25C87A5FC(v4, v3) & 1) == 0) {
    char v11 = sub_25C87A5FC(v4, v3 + *(int *)(v7 + 20));
  }
  else {
    char v11 = 0;
  }
  OUTLINED_FUNCTION_26_1();
  v12();
  sub_25C88A490(v3, (void (*)(void))type metadata accessor for GestureMapping);
  return v11 & 1;
}

uint64_t sub_25C882188(uint64_t a1, uint64_t a2)
{
  sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7_0();
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent);
  sub_25C87DD88(a2, v3);
  OUTLINED_FUNCTION_38_0();
  v10();
  if ((v9 & 1) == 0) {
    goto LABEL_5;
  }
  if ((sub_25C87A5FC(v4, v3) & 1) == 0)
  {
    sub_25C87A5FC(v4, v3 + *(int *)(v7 + 20));
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = 1;
LABEL_6:
  OUTLINED_FUNCTION_26_1();
  v12();
  sub_25C88A490(v3, (void (*)(void))type metadata accessor for GestureMapping);
  return v11;
}

void sub_25C8822CC()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_25C8921C0();
  OUTLINED_FUNCTION_4();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_9();
  uint64_t v35 = v9;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_53();
  uint64_t v17 = v15 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v34 - v19;
  uint64_t v36 = v0;
  uint64_t v21 = *(void *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent);
  uint64_t v38 = v2;
  sub_25C87DD88(v2, (uint64_t)&v34 - v19);
  uint64_t v39 = v7;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v37 = v4;
  v22(v12, v4, v5);
  if ((v21 & 2) != 0 && (sub_25C87A5FC((uint64_t)v12, (uint64_t)v20) & 1) == 0)
  {
    char v33 = sub_25C87A5FC((uint64_t)v12, (uint64_t)&v20[*(int *)(v13 + 20)]);
    uint64_t v23 = *(void (**)(void))(v39 + 8);
    OUTLINED_FUNCTION_50();
    v23();
    sub_25C88A490((uint64_t)v20, (void (*)(void))type metadata accessor for GestureMapping);
    if (v33) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v23 = *(void (**)(void))(v39 + 8);
    OUTLINED_FUNCTION_50();
    v23();
    sub_25C88A490((uint64_t)v20, (void (*)(void))type metadata accessor for GestureMapping);
  }
  uint64_t v24 = v35;
  int v25 = *(unsigned __int8 *)(v36 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall);
  v22((char *)v35, v37, v5);
  sub_25C87DD88(v38, v17);
  if (v25 == 1)
  {
    char v26 = sub_25C882044(v24, v17);
    sub_25C88A490(v17, (void (*)(void))type metadata accessor for GestureMapping);
    OUTLINED_FUNCTION_50();
    v23();
    if (v26)
    {
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_25C892400();
      uint64_t v28 = (void *)OUTLINED_FUNCTION_15_0(v27, (uint64_t)qword_26B355818);
      os_log_type_t v29 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_7_1(v29))
      {
        uint64_t v30 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v30);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v31, v32, "Announcing an incoming call, treating early dismissal as early decline");
        OUTLINED_FUNCTION_8();
      }
    }
  }
  else
  {
    sub_25C88A490(v17, (void (*)(void))type metadata accessor for GestureMapping);
    ((void (*)(uint64_t, uint64_t))v23)(v24, v5);
  }
LABEL_14:
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C8825DC()
{
  uint64_t result = MEMORY[0x261196630](v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate);
  if (result)
  {
    sub_25C88B188();
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_25C88267C(char a1)
{
  uint64_t v4 = v1;
  if ((sub_25C885350() & 1) == 0)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25C892400();
    uint64_t v7 = OUTLINED_FUNCTION_15_0(v12, (uint64_t)qword_26B355818);
    os_log_type_t v13 = sub_25C8925A0();
    if (!OUTLINED_FUNCTION_8_1(v13)) {
      goto LABEL_18;
    }
    *(_DWORD *)OUTLINED_FUNCTION_41() = 67109120;
    OUTLINED_FUNCTION_75();
    OUTLINED_FUNCTION_101();
    goto LABEL_17;
  }
  if (a1)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25C892400();
    uint64_t v7 = OUTLINED_FUNCTION_15_0(v6, (uint64_t)qword_26B355818);
    os_log_type_t v8 = sub_25C8925A0();
    if (!OUTLINED_FUNCTION_8_1(v8)) {
      goto LABEL_18;
    }
    uint64_t v9 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_24_1(v9);
    uint64_t v10 = &dword_25C872000;
    uint64_t v11 = "✅ HGManager started streaming for gesture recognition";
    goto LABEL_16;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) == 1)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25C892400();
    uint64_t v7 = OUTLINED_FUNCTION_15_0(v18, (uint64_t)qword_26B355818);
    os_log_type_t v19 = sub_25C8925A0();
    if (!OUTLINED_FUNCTION_8_1(v19)) {
      goto LABEL_18;
    }
    uint64_t v20 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_24_1(v20);
    uint64_t v10 = &dword_25C872000;
    uint64_t v11 = "‼️ HGManager stopped streaming when gesture recognition was needed";
LABEL_16:
    uint64_t v14 = v7;
    os_log_type_t v15 = v2;
    uint64_t v16 = v3;
    uint32_t v17 = 2;
LABEL_17:
    _os_log_impl(v10, v14, v15, v11, v16, v17);
    OUTLINED_FUNCTION_8();
LABEL_18:
  }
  *(unsigned char *)(v4 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady) = a1 & 1;
  sub_25C87FE6C();
}

uint64_t sub_25C8828DC()
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v4 = OUTLINED_FUNCTION_15(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_8_0();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v6 = OUTLINED_FUNCTION_15(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_31();
  uint64_t v7 = sub_25C891AE0();
  OUTLINED_FUNCTION_4();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_53();
  uint64_t v13 = v11 - v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_57();
  if (!v28)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25C892400();
    uint64_t v23 = (void *)OUTLINED_FUNCTION_15_0(v22, (uint64_t)qword_26B355818);
    os_log_type_t v24 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_7_1(v24))
    {
      int v25 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_20_1(v25);
      OUTLINED_FUNCTION_5_1(&dword_25C872000, v26, v27, "❓ Siri did not prompt for confirmation yet");
      OUTLINED_FUNCTION_8();
    }

    return 0;
  }
  sub_25C891AD0();
  OUTLINED_FUNCTION_57();
  if (v28)
  {
    uint64_t v15 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId;
    OUTLINED_FUNCTION_29_0();
    sub_25C88A118(v15, v2, &qword_26B3554E0);
    if (__swift_getEnumTagSinglePayload(v2, 1, v7) == 1)
    {
      sub_25C87D938(v2, &qword_26B3554E0);
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_25C892400();
      uint32_t v17 = (void *)OUTLINED_FUNCTION_15_0(v16, (uint64_t)qword_26B355818);
      os_log_type_t v18 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_8_1(v18))
      {
        os_log_type_t v19 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_24_1(v19);
        OUTLINED_FUNCTION_22_1(&dword_25C872000, v20, v21, "‼️ Expecting IE confirmation but lastActionEventId is nil");
        OUTLINED_FUNCTION_8();
      }

      goto LABEL_42;
    }
    OUTLINED_FUNCTION_85();
    uint64_t v40 = v39();
    MEMORY[0x270FA5388](v40);
    *(void *)&v67[-16] = v13;
    sub_25C892150();
    uint64_t v41 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_102(v41, v42, (uint64_t *)&unk_26B355210);
    swift_endAccess();
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_25C892400();
    unint64_t v44 = OUTLINED_FUNCTION_15_0(v43, (uint64_t)qword_26B355818);
    os_log_type_t v45 = sub_25C892590();
    if (OUTLINED_FUNCTION_8_1(v45))
    {
      uint64_t v46 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_16_1(v46);
      _os_log_impl(&dword_25C872000, v44, v1, "Expecting confirmation for IntelligenceEngine", v67, 2u);
      OUTLINED_FUNCTION_8();
    }

    id v47 = *(void (**)(void))(v9 + 8);
    OUTLINED_FUNCTION_26_1();
    v47();
    OUTLINED_FUNCTION_26_1();
    v47();
    return 1;
  }
  OUTLINED_FUNCTION_57();
  if (v28)
  {
    MEMORY[0x270FA5388](v29);
    OUTLINED_FUNCTION_52();
    sub_25C892150();
    uint64_t v30 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_102(v30, v31, (uint64_t *)&unk_26B355210);
    swift_endAccess();
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_25C892400();
    char v33 = (void *)OUTLINED_FUNCTION_15_0(v32, (uint64_t)qword_26B355818);
    os_log_type_t v34 = sub_25C892590();
    if (!OUTLINED_FUNCTION_8_1(v34)) {
      goto LABEL_40;
    }
    uint64_t v35 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_24_1(v35);
    uint64_t v38 = "Expecting confirmation for Siri X";
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_57();
  if (v48)
  {
    MEMORY[0x270FA5388](v49);
    OUTLINED_FUNCTION_52();
    sub_25C892150();
    uint64_t v50 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_102(v50, v51, (uint64_t *)&unk_26B355210);
    swift_endAccess();
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_25C892400();
    char v33 = (void *)OUTLINED_FUNCTION_15_0(v52, (uint64_t)qword_26B355818);
    os_log_type_t v53 = sub_25C892590();
    if (!OUTLINED_FUNCTION_8_1(v53)) {
      goto LABEL_40;
    }
    os_log_type_t v54 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_24_1(v54);
    uint64_t v38 = "Expecting confirmation for Siri Classic";
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_57();
  if (v55)
  {
    MEMORY[0x270FA5388](v56);
    OUTLINED_FUNCTION_52();
    sub_25C892150();
    uint64_t v57 = OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_102(v57, v58, (uint64_t *)&unk_26B355210);
    swift_endAccess();
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_25C892400();
    char v33 = (void *)OUTLINED_FUNCTION_15_0(v59, (uint64_t)qword_26B355818);
    os_log_type_t v60 = sub_25C892590();
    if (!OUTLINED_FUNCTION_8_1(v60)) {
      goto LABEL_40;
    }
    uint64_t v61 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_24_1(v61);
    uint64_t v38 = "Expecting confirmation for POMMES";
LABEL_39:
    OUTLINED_FUNCTION_22_1(&dword_25C872000, v36, v37, v38);
    OUTLINED_FUNCTION_8();
LABEL_40:

    uint64_t v62 = OUTLINED_FUNCTION_106();
    v63(v62);
    return 1;
  }
LABEL_42:
  uint64_t v65 = OUTLINED_FUNCTION_106();
  v66(v65);
  return 0;
}

uint64_t sub_25C882F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8BC0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8CA0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BD0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25C891AE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v11, a2, v12);
  uint64_t v13 = *MEMORY[0x263F70E28];
  uint64_t v14 = sub_25C8922A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v11, v13, v14);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v14);
  sub_25C892180();
  uint64_t v15 = *MEMORY[0x263F70BC0];
  uint64_t v16 = sub_25C892220();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v8, v15, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v16);
  sub_25C892170();
  uint64_t v17 = *MEMORY[0x263F70A10];
  uint64_t v18 = sub_25C8921A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v5, v17, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v18);
  return sub_25C892160();
}

uint64_t sub_25C883200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8BC0);
  uint64_t v5 = OUTLINED_FUNCTION_15(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_7();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BD0);
  uint64_t v10 = OUTLINED_FUNCTION_15(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_61();
  sub_25C891AE0();
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v2, a2);
  uint64_t v12 = *MEMORY[0x263F70E30];
  uint64_t v13 = sub_25C8922A0();
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 104))(v2, v12, v13);
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v13);
  sub_25C892180();
  uint64_t v15 = *MEMORY[0x263F70A10];
  uint64_t v16 = sub_25C8921A0();
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 104))(v8, v15, v16);
  __swift_storeEnumTagSinglePayload(v8, 0, 1, v16);
  return sub_25C892160();
}

void sub_25C883398()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BB0);
  uint64_t v5 = OUTLINED_FUNCTION_15(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_90();
  uint64_t v6 = sub_25C891C50();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_83();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v65 - v12;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_19_0();
  uint64_t v74 = v14;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_19_0();
  uint64_t v72 = v16;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_19_0();
  uint64_t v75 = v18;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_19_0();
  uint64_t v76 = v20;
  OUTLINED_FUNCTION_11_0();
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v65 - v25;
  sub_25C88A118(v3, v0, &qword_26A5D8BB0);
  if (__swift_getEnumTagSinglePayload(v0, 1, v6) != 1)
  {
    uint64_t v70 = v1;
    OUTLINED_FUNCTION_85();
    v27();
    uint64_t v28 = v8;
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_25C892400();
    uint64_t v30 = __swift_project_value_buffer(v29, (uint64_t)qword_26B355818);
    uint64_t v31 = *(void (**)(void))(v8 + 16);
    OUTLINED_FUNCTION_15_1();
    v31();
    OUTLINED_FUNCTION_15_1();
    v31();
    OUTLINED_FUNCTION_15_1();
    v31();
    uint64_t v71 = v31;
    uint64_t v68 = v8 + 16;
    ((void (*)(void (*)(void), char *, uint64_t))v31)(v76, v26, v6);
    uint64_t v67 = v30;
    uint64_t v32 = (uint8_t *)sub_25C8923F0();
    os_log_type_t v33 = sub_25C8925A0();
    int v34 = v33;
    uint64_t v66 = v32;
    BOOL v35 = os_log_type_enabled((os_log_t)v32, v33);
    uint64_t v73 = v28;
    uint64_t v69 = v13;
    if (v35)
    {
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 67109888;
      int v37 = sub_25C891C20() & 1;
      LODWORD(v65) = v34;
      uint64_t v38 = *(void (**)(void))(v73 + 8);
      OUTLINED_FUNCTION_65();
      v38();
      LODWORD(v77) = v37;
      sub_25C892660();
      *(_WORD *)(v36 + 8) = 1024;
      int v39 = sub_25C891C30() & 1;
      OUTLINED_FUNCTION_107();
      OUTLINED_FUNCTION_65();
      v38();
      LODWORD(v77) = v39;
      OUTLINED_FUNCTION_72();
      *(_WORD *)(v36 + 14) = 1024;
      int v40 = sub_25C891C00() & 1;
      OUTLINED_FUNCTION_65();
      v38();
      LODWORD(v77) = v40;
      OUTLINED_FUNCTION_72();
      *(_WORD *)(v36 + 20) = 1024;
      int v41 = sub_25C891C10() & 1;
      OUTLINED_FUNCTION_107();
      uint64_t v76 = v38;
      OUTLINED_FUNCTION_65();
      v38();
      LODWORD(v77) = v41;
      OUTLINED_FUNCTION_72();
      uint64_t v42 = (uint8_t *)v66;
      _os_log_impl(&dword_25C872000, v66, (os_log_type_t)v65, "hasStrictPrompt: %{BOOL}d hasDictationPrompt: %{BOOL}d strictPrompt: %{BOOL}d dictationPrompt: %{BOOL}d", (uint8_t *)v36, 0x1Au);
      OUTLINED_FUNCTION_8();
    }
    else
    {
      uint64_t v43 = *(void (**)(void))(v28 + 8);
      OUTLINED_FUNCTION_62();
      v43();
      OUTLINED_FUNCTION_62();
      v43();
      OUTLINED_FUNCTION_107();
      OUTLINED_FUNCTION_62();
      v43();
      uint64_t v76 = v43;
      OUTLINED_FUNCTION_62();
      v43();
      uint64_t v42 = (uint8_t *)v66;
    }

    uint64_t v44 = v75;
    os_log_type_t v45 = v71;
    ((void (*)(uint64_t, char *, uint64_t))v71)(v75, v26, v6);
    uint64_t v46 = sub_25C8923F0();
    os_log_type_t v47 = sub_25C8925A0();
    if (os_log_type_enabled(v46, v47))
    {
      char v48 = (uint8_t *)OUTLINED_FUNCTION_24();
      uint64_t v67 = OUTLINED_FUNCTION_22();
      uint64_t v77 = v67;
      uint64_t v66 = v48;
      *(_DWORD *)char v48 = 136315138;
      uint64_t v65 = v48 + 4;
      sub_25C891C40();
      uint64_t v49 = MEMORY[0x261195E60]();
      unint64_t v51 = v50;
      swift_bridgeObjectRelease();
      uint64_t v52 = v49;
      os_log_type_t v45 = v71;
      uint64_t v53 = sub_25C8773AC(v52, v51, &v77);
      OUTLINED_FUNCTION_49(v53);
      sub_25C892660();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_50();
      v54();
      _os_log_impl(&dword_25C872000, v46, v47, "responseSemanticValues: %s", (uint8_t *)v66, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
      ((void (*)(uint64_t, uint64_t))v76)(v44, v6);
    }

    char v55 = v69;
    uint64_t v56 = v70;
    uint64_t v57 = v72;
    char v58 = sub_25C891C20();
    OUTLINED_FUNCTION_15_1();
    v45();
    if (v58) {
      char v59 = sub_25C891C00();
    }
    else {
      char v59 = 0;
    }
    uint64_t v60 = v57;
    uint64_t v61 = v76;
    ((void (*)(uint64_t, uint64_t))v76)(v60, v6);
    OUTLINED_FUNCTION_15_1();
    v45();
    if (v59)
    {
      char v62 = sub_25C891C30();
      OUTLINED_FUNCTION_37_0();
      v61();
      OUTLINED_FUNCTION_15_1();
      v45();
      if (v62)
      {
        char v63 = sub_25C891C10();
        OUTLINED_FUNCTION_37_0();
        v61();
        OUTLINED_FUNCTION_15_1();
        v45();
        if ((v63 & 1) == 0)
        {
          uint64_t v64 = sub_25C891C40();
          sub_25C87C09C(v64);
          swift_bridgeObjectRelease();
        }
        goto LABEL_20;
      }
    }
    else
    {
      OUTLINED_FUNCTION_37_0();
      v61();
      ((void (*)(char *, char *, uint64_t))v45)(v55, v26, v6);
    }
    OUTLINED_FUNCTION_37_0();
    v61();
    ((void (*)(uint64_t, char *, uint64_t))v45)(v56, v26, v6);
LABEL_20:
    OUTLINED_FUNCTION_37_0();
    v61();
    ((void (*)(char *, uint64_t))v61)(v26, v6);
    goto LABEL_21;
  }
  sub_25C87D938(v0, &qword_26A5D8BB0);
LABEL_21:
  OUTLINED_FUNCTION_10_0();
}

void sub_25C883AB4()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v47 = sub_25C892290();
  OUTLINED_FUNCTION_4();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_33_0();
  uint64_t v6 = sub_25C892240();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_7();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BB0);
  uint64_t v14 = OUTLINED_FUNCTION_15(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_23(v15, v42);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_111();
  uint64_t v17 = sub_25C891C50();
  OUTLINED_FUNCTION_4();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_32_0(v21, v43);
  uint64_t v22 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState;
  OUTLINED_FUNCTION_29_0();
  sub_25C88A118(v22, (uint64_t)v49, &qword_26B355500);
  if (!v49[3])
  {
    sub_25C87D938((uint64_t)v49, &qword_26B355500);
    long long v50 = 0u;
    long long v51 = 0u;
    goto LABEL_12;
  }
  uint64_t v44 = v0;
  sub_25C8774DC((uint64_t)v49, (uint64_t)v48);
  sub_25C87D938((uint64_t)v49, &qword_26B355500);
  __swift_project_boxed_opaque_existential_1(v48, v48[3]);
  OUTLINED_FUNCTION_84();
  v23();
  sub_25C892280();
  sub_25C892250();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  os_log_type_t v24 = v4 + 8;
  v25(v2, v47);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  if (!*((void *)&v51 + 1))
  {
LABEL_12:
    sub_25C87D938((uint64_t)&v50, &qword_26A5D8B98);
    OUTLINED_FUNCTION_103(v1, 1);
    goto LABEL_13;
  }
  int v26 = swift_dynamicCast();
  OUTLINED_FUNCTION_103(v1, v26 ^ 1u);
  OUTLINED_FUNCTION_44(v1);
  if (!v27)
  {
    OUTLINED_FUNCTION_85();
    v28();
    type metadata accessor for GestureController();
    OUTLINED_FUNCTION_38_0();
    v29();
    __swift_storeEnumTagSinglePayload(v45, 0, 1, v17);
    sub_25C883398();
    char v31 = v30;
    sub_25C87D938(v45, &qword_26A5D8BB0);
    if ((v31 & 1) == 0)
    {
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_25C892400();
      os_log_type_t v33 = OUTLINED_FUNCTION_15_0(v32, (uint64_t)qword_26B355818);
      os_log_type_t v34 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_4_1(v34))
      {
        BOOL v35 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_104(v35);
        OUTLINED_FUNCTION_63(&dword_25C872000, v33, v24, "Not expecting Siri Classic confirmation");
        OUTLINED_FUNCTION_8();
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v46, v17);
    *(unsigned char *)(v44 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation) = v31 & 1;
    goto LABEL_18;
  }
LABEL_13:
  sub_25C87D938(v1, &qword_26A5D8BB0);
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_25C892400();
  int v37 = (void *)OUTLINED_FUNCTION_15_0(v36, (uint64_t)qword_26B355818);
  os_log_type_t v38 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_7_1(v38))
  {
    int v39 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v39);
    OUTLINED_FUNCTION_5_1(&dword_25C872000, v40, v41, "No legacy context found, not expecting SiriClassic confirmation");
    OUTLINED_FUNCTION_8();
  }

LABEL_18:
  OUTLINED_FUNCTION_10_0();
}

void sub_25C883F24()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BB0);
  uint64_t v4 = OUTLINED_FUNCTION_15(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_9();
  uint64_t v60 = v5;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_112((uint64_t)v59 - v7);
  OUTLINED_FUNCTION_86();
  uint64_t v64 = sub_25C891C50();
  OUTLINED_FUNCTION_4();
  uint64_t v61 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_18();
  uint64_t v62 = v10;
  OUTLINED_FUNCTION_86();
  uint64_t v65 = sub_25C892290();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_31();
  uint64_t v12 = sub_25C892240();
  OUTLINED_FUNCTION_4();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_8_0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BB8);
  uint64_t v17 = OUTLINED_FUNCTION_15(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_33_0();
  uint64_t v18 = sub_25C8922D0();
  OUTLINED_FUNCTION_4();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_32_0(v22, v59[0]);
  uint64_t v23 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState;
  OUTLINED_FUNCTION_29_0();
  sub_25C88A118(v23, (uint64_t)v67, &qword_26B355500);
  if (!v67[3])
  {
    sub_25C87D938((uint64_t)v67, &qword_26B355500);
    long long v68 = 0u;
    long long v69 = 0u;
    goto LABEL_11;
  }
  v59[1] = v20;
  v59[0] = v0;
  sub_25C8774DC((uint64_t)v67, (uint64_t)v66);
  sub_25C87D938((uint64_t)v67, &qword_26B355500);
  __swift_project_boxed_opaque_existential_1(v66, v66[3]);
  OUTLINED_FUNCTION_84();
  v24();
  sub_25C892280();
  sub_25C892250();
  OUTLINED_FUNCTION_26_1();
  v25();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v12);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v66);
  if (!*((void *)&v69 + 1))
  {
LABEL_11:
    sub_25C87D938((uint64_t)&v68, &qword_26A5D8B98);
    __swift_storeEnumTagSinglePayload(v2, 1, 1, v18);
    goto LABEL_12;
  }
  int v26 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload(v2, v26 ^ 1u, 1, v18);
  if (__swift_getEnumTagSinglePayload(v2, 1, v18) != 1)
  {
    OUTLINED_FUNCTION_85();
    v27();
    uint64_t v28 = v63;
    sub_25C8922C0();
    uint64_t v29 = v64;
    if (__swift_getEnumTagSinglePayload(v28, 1, v64) == 1)
    {
      sub_25C87D938(v28, &qword_26A5D8BB0);
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_25C892400();
      char v31 = OUTLINED_FUNCTION_15_0(v30, (uint64_t)qword_26B355818);
      os_log_type_t v32 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_7_1(v32))
      {
        os_log_type_t v33 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_25_1(v33);
        OUTLINED_FUNCTION_64(&dword_25C872000, v31, v34, "No legacy context found in POMMES context, not expecting POMMES confirmation");
        OUTLINED_FUNCTION_8();
      }

      uint64_t v35 = OUTLINED_FUNCTION_81();
      v36(v35);
    }
    else
    {
      uint64_t v43 = v61;
      uint64_t v44 = v62;
      OUTLINED_FUNCTION_85();
      v45();
      type metadata accessor for GestureController();
      uint64_t v46 = v60;
      OUTLINED_FUNCTION_38_0();
      v47();
      __swift_storeEnumTagSinglePayload(v46, 0, 1, v29);
      sub_25C883398();
      char v49 = v48;
      sub_25C87D938(v46, &qword_26A5D8BB0);
      uint64_t v50 = v59[0];
      if ((v49 & 1) == 0)
      {
        if (qword_26B355670 != -1) {
          swift_once();
        }
        uint64_t v51 = sub_25C892400();
        uint64_t v52 = (void *)OUTLINED_FUNCTION_15_0(v51, (uint64_t)qword_26B355818);
        os_log_type_t v53 = sub_25C8925A0();
        if (OUTLINED_FUNCTION_8_1(v53))
        {
          os_log_type_t v54 = (_WORD *)OUTLINED_FUNCTION_38();
          OUTLINED_FUNCTION_24_1(v54);
          OUTLINED_FUNCTION_22_1(&dword_25C872000, v55, v56, "Not expecting POMMES confirmation");
          uint64_t v44 = v62;
          OUTLINED_FUNCTION_8();
        }
      }
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v44, v29);
      uint64_t v57 = OUTLINED_FUNCTION_81();
      v58(v57);
      *(unsigned char *)(v50 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation) = v49 & 1;
    }
    goto LABEL_17;
  }
LABEL_12:
  sub_25C87D938(v2, &qword_26A5D8BB8);
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_25C892400();
  os_log_type_t v38 = (void *)OUTLINED_FUNCTION_15_0(v37, (uint64_t)qword_26B355818);
  os_log_type_t v39 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_7_1(v39))
  {
    uint64_t v40 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v40);
    OUTLINED_FUNCTION_5_1(&dword_25C872000, v41, v42, "No POMMES context found, not expecting POMMES confirmation");
    OUTLINED_FUNCTION_8();
  }

LABEL_17:
  OUTLINED_FUNCTION_10_0();
}

void sub_25C88453C()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v1 = v0;
  uint64_t v58 = sub_25C891C80();
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_23(v5, v53);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_111();
  sub_25C892290();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_89();
  uint64_t v8 = sub_25C892240();
  OUTLINED_FUNCTION_4();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState;
  OUTLINED_FUNCTION_29_0();
  sub_25C88A118(v14, (uint64_t)v61, &qword_26B355500);
  uint64_t v15 = &unk_26B355000;
  uint64_t v59 = v1;
  if (!v61[3])
  {
    sub_25C87D938((uint64_t)v61, &qword_26B355500);
    long long v62 = 0u;
    long long v63 = 0u;
    goto LABEL_10;
  }
  uint64_t v56 = v3;
  sub_25C8774DC((uint64_t)v61, (uint64_t)v60);
  sub_25C87D938((uint64_t)v61, &qword_26B355500);
  __swift_project_boxed_opaque_existential_1(v60, v60[3]);
  OUTLINED_FUNCTION_84();
  v16();
  sub_25C892280();
  uint64_t v1 = v59;
  sub_25C892250();
  uint64_t v15 = (void *)&unk_26B355000;
  OUTLINED_FUNCTION_69();
  v17();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v60);
  if (!*((void *)&v63 + 1))
  {
LABEL_10:
    sub_25C87D938((uint64_t)&v62, &qword_26A5D8B98);
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8BA0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    char v25 = 0;
    *(void *)(swift_allocObject() + 16) = MEMORY[0x263F8EE78];
    goto LABEL_12;
  }
  uint64_t v18 = v61[0];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = MEMORY[0x263F8EE78];
  uint64_t v20 = v19 + 16;
  uint64_t v21 = *(void *)(v18 + 16);
  if (v21)
  {
    uint64_t v22 = v56;
    unint64_t v23 = v18 + ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80));
    uint64_t v24 = *(void *)(v56 + 72);
    swift_bridgeObjectRetain();
    while ((sub_25C891C60() & 1) == 0)
    {
      v23 += v24;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        char v25 = 0;
        goto LABEL_28;
      }
    }
    sub_25C889F80();
    uint64_t v40 = *(void *)(*(void *)v20 + 16);
    sub_25C889FCC(v40);
    uint64_t v41 = *(void *)v20;
    *(void *)(*(void *)v20 + 16) = v40 + 1;
    uint64_t v42 = *(void (**)(void))(v22 + 16);
    OUTLINED_FUNCTION_79();
    v42();
    *(void *)uint64_t v20 = v41;
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_25C892400();
    __swift_project_value_buffer(v43, (uint64_t)qword_26B355818);
    OUTLINED_FUNCTION_79();
    v42();
    OUTLINED_FUNCTION_79();
    v42();
    uint64_t v44 = sub_25C8923F0();
    os_log_type_t v45 = sub_25C8925A0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v55 = OUTLINED_FUNCTION_22();
      v61[0] = v55;
      *(_DWORD *)uint64_t v46 = 134218242;
      os_log_t v54 = v44;
      uint64_t v47 = sub_25C891C70();
      char v48 = *(void (**)(void))(v56 + 8);
      OUTLINED_FUNCTION_69();
      v48();
      v60[0] = v47;
      sub_25C892660();
      *(_WORD *)(v46 + 12) = 2080;
      OUTLINED_FUNCTION_112(v46 + 14);
      sub_25C88A4E8(&qword_26A5D8BA8, MEMORY[0x263F71688]);
      uint64_t v49 = sub_25C8922B0();
      v60[0] = sub_25C8773AC(v49, v50, v61);
      sub_25C892660();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_69();
      v48();
      os_log_t v51 = v54;
      _os_log_impl(&dword_25C872000, v54, v45, "Expecting confirmation for SDA %ld: %s", (uint8_t *)v46, 0x16u);
      char v25 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v52 = *(void (**)(void))(v56 + 8);
      OUTLINED_FUNCTION_62();
      v52();
      OUTLINED_FUNCTION_62();
      v52();
      swift_bridgeObjectRelease_n();

      char v25 = 1;
    }
LABEL_28:
    uint64_t v1 = v59;
    uint64_t v15 = (void *)&unk_26B355000;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v25 = 0;
    uint64_t v1 = v59;
  }
LABEL_12:
  uint64_t v26 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation) = v25;
  if (v15[206] != -1) {
    swift_once();
  }
  uint64_t v27 = sub_25C892400();
  uint64_t v57 = __swift_project_value_buffer(v27, (uint64_t)qword_26B355818);
  uint64_t v28 = sub_25C8923F0();
  os_log_type_t v29 = sub_25C8925A0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)OUTLINED_FUNCTION_24();
    v60[0] = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v30 = 136315138;
    OUTLINED_FUNCTION_112((uint64_t)(v30 + 4));
    OUTLINED_FUNCTION_29_0();
    uint64_t v31 = swift_bridgeObjectRetain();
    uint64_t v32 = MEMORY[0x261195E60](v31, v58);
    unint64_t v34 = v33;
    swift_retain();
    uint64_t v1 = v59;
    swift_bridgeObjectRelease();
    *(void *)&long long v62 = sub_25C8773AC(v32, v34, v60);
    sub_25C892660();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v28, v29, "Confirmation SDAs: %s", v30, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }

  if (*(unsigned char *)(v1 + v26))
  {
    swift_release();
  }
  else
  {
    uint64_t v35 = (void *)sub_25C8923F0();
    os_log_type_t v36 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_7_1(v36))
    {
      uint64_t v37 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_20_1(v37);
      OUTLINED_FUNCTION_5_1(&dword_25C872000, v38, v39, "Not expecting SiriX confirmation");
      OUTLINED_FUNCTION_8();
    }
    swift_release();
  }
  OUTLINED_FUNCTION_10_0();
}

void sub_25C884CE8()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_25C892400();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_53();
  uint64_t v10 = v8 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState;
  uint64_t v13 = sub_25C892000;
  uint64_t v57 = v3;
  if ((sub_25C8852F0(*(void *)&v0[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState], (uint64_t)&unk_2709EBD08) & 1) != 0&& v3 == (char *)1)
  {
    OUTLINED_FUNCTION_56();
    if (!v14) {
      swift_once();
    }
    __swift_project_value_buffer(v4, (uint64_t)qword_26B355818);
    OUTLINED_FUNCTION_38_0();
    v15();
    uint64_t v3 = v0;
    uint64_t v16 = sub_25C8923F0();
    os_log_type_t v54 = sub_25C8925A0();
    if (os_log_type_enabled(v16, v54))
    {
      uint64_t v55 = v10;
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_24();
      uint64_t v58 = OUTLINED_FUNCTION_22();
      *(_DWORD *)uint64_t v17 = 136315138;
      id v18 = (id)AFExternalNotificationRequestHandlerStateGetName();
      if (!v18)
      {
LABEL_41:

        __break(1u);
        return;
      }
      uint64_t v19 = v18;
      uint64_t v20 = sub_25C892500();
      unint64_t v22 = v21;

      uint64_t v23 = sub_25C8773AC(v20, v22, &v58);
      OUTLINED_FUNCTION_49(v23);
      sub_25C892660();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, v16, v54, "Announcement state transitioned to idle from %s, resetting confirmation states", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();

      uint64_t v24 = OUTLINED_FUNCTION_95();
      v25(v24);
      uint64_t v10 = v55;
      uint64_t v1 = v0;
      uint64_t v13 = sub_25C892000;
    }
    else
    {

      uint64_t v26 = OUTLINED_FUNCTION_95();
      v27(v26);
    }
    sub_25C885950();
    sub_25C885C7C(7);
    uint64_t v3 = v57;
  }
  *(void *)&v1[v12] = v3;
  OUTLINED_FUNCTION_56();
  if (!v14) {
    swift_once();
  }
  __swift_project_value_buffer(v4, (uint64_t)qword_26B355818);
  OUTLINED_FUNCTION_38_0();
  v28();
  os_log_type_t v29 = sub_25C8923F0();
  os_log_type_t v30 = sub_25C8925A0();
  if (!os_log_type_enabled(v29, v30))
  {

    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    os_log_type_t v37 = v6 + 8;
    v39(v10, v4);
    goto LABEL_16;
  }
  uint64_t v56 = v1;
  uint64_t v31 = (uint8_t *)OUTLINED_FUNCTION_24();
  uint64_t v58 = OUTLINED_FUNCTION_22();
  *(_DWORD *)uint64_t v31 = *((void *)v13 + 449);
  uint64_t v32 = (uint64_t (*)())(id)AFExternalNotificationRequestHandlerStateGetName();
  if (!v32)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v13 = v32;
  uint64_t v33 = sub_25C892500();
  unint64_t v35 = v34;

  uint64_t v36 = sub_25C8773AC(v33, v35, &v58);
  OUTLINED_FUNCTION_49(v36);
  sub_25C892660();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25C872000, v29, v30, "🔔 Announcement state updated to: %s", v31, 0xCu);
  swift_arrayDestroy();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_8();

  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  os_log_type_t v37 = v6 + 8;
  v38(v10, v4);
  uint64_t v1 = v56;
  uint64_t v3 = v57;
LABEL_16:
  if (v3 != (char *)3 && (v3 != (char *)6 || v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive] != 1)) {
    goto LABEL_33;
  }
  uint64_t v40 = *(void **)&v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper];
  if (!v40
    || (objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper], sel_respondsToSelector_, sel_callState) & 1) == 0)
  {
    unsigned __int8 v41 = 0;
    goto LABEL_24;
  }
  unsigned __int8 v41 = objc_msgSend(v40, sel_callState);
  if ((v41 & 4) == 0)
  {
LABEL_24:
    char v42 = v41 & 1;
    goto LABEL_25;
  }
  char v42 = 1;
LABEL_25:
  uint64_t v13 = (uint64_t (*)())OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall;
  v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall] = v42;
  uint64_t v43 = v1;
  uint64_t v44 = sub_25C8923F0();
  os_log_type_t v45 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v45))
  {
    uint64_t v46 = (uint8_t *)OUTLINED_FUNCTION_41();
    *(_DWORD *)uint64_t v46 = 67109120;
    LODWORD(v58) = *((unsigned __int8 *)v13 + (void)v1);
    sub_25C892660();

    _os_log_impl(&dword_25C872000, v44, v37, "🔔 Announcing incoming call: %{BOOL}d", v46, 8u);
    OUTLINED_FUNCTION_8();
  }
  else
  {

    uint64_t v44 = v43;
  }

  if (v3 != (char *)6 || *((unsigned char *)v13 + (void)v1) != 1)
  {
    char v50 = 1;
    goto LABEL_35;
  }
  uint64_t v47 = sub_25C8923F0();
  os_log_type_t v48 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_8_1(v48))
  {
    uint64_t v49 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_104(v49);
    OUTLINED_FUNCTION_63(&dword_25C872000, v47, (os_log_type_t)v43, "Not reading announcement, call is either ringing or active");
    OUTLINED_FUNCTION_8();
  }

LABEL_33:
  char v50 = 0;
LABEL_35:
  v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement] = v50;
  if (sub_25C8852F0((uint64_t)v3, (uint64_t)&unk_2709EBD08))
  {
    os_log_t v51 = sub_25C8923F0();
    os_log_type_t v52 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_9_1(v52))
    {
      uint64_t v53 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_104(v53);
      OUTLINED_FUNCTION_63(&dword_25C872000, v51, (os_log_type_t)v13, "Updating gesture controller for announce state transition");
      OUTLINED_FUNCTION_8();
    }

    sub_25C8854C4(0, 8);
  }
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C8852F0(uint64_t result, uint64_t a2)
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

uint64_t sub_25C885350()
{
  if (sub_25C8828DC()) {
    return 1;
  }
  else {
    return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement);
  }
}

void sub_25C885380(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v6 = OUTLINED_FUNCTION_15(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_7_0();
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25C892400();
  uint64_t v8 = (void *)OUTLINED_FUNCTION_15_0(v7, (uint64_t)qword_26B355818);
  os_log_type_t v9 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v9))
  {
    uint64_t v10 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_16_1(v10);
    OUTLINED_FUNCTION_12_1(&dword_25C872000, v11, v12, "Updating states for IE");
    OUTLINED_FUNCTION_8();
  }

  OUTLINED_FUNCTION_98(OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation);
  sub_25C88A118(a1, v2, &qword_26B3554E0);
  uint64_t v13 = v3 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId;
  OUTLINED_FUNCTION_6();
  sub_25C88A404(v2, v13, &qword_26B3554E0);
  swift_endAccess();
  OUTLINED_FUNCTION_66();
}

void sub_25C8854C4(char a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (a1)
  {
    OUTLINED_FUNCTION_55();
    if (!v5) {
      swift_once();
    }
    uint64_t v6 = sub_25C892400();
    uint64_t v7 = (void *)OUTLINED_FUNCTION_15_0(v6, (uint64_t)qword_26B355818);
    os_log_type_t v8 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_9_1(v8))
    {
      os_log_type_t v9 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_24_1(v9);
      OUTLINED_FUNCTION_99(&dword_25C872000, v10, v11, "Updating states from session for SiriX, Siri Classic, and POMMES");
      OUTLINED_FUNCTION_8();
    }

    sub_25C88453C();
    sub_25C883AB4();
    sub_25C883F24();
  }
  OUTLINED_FUNCTION_55();
  if (!v5) {
    swift_once();
  }
  uint64_t v12 = sub_25C892400();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B355818);
  id v13 = v3;
  char v14 = (void *)sub_25C8923F0();
  os_log_type_t v15 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v15))
  {
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 67109888;
    OUTLINED_FUNCTION_42();
    *(_WORD *)(v16 + 8) = 1024;
    OUTLINED_FUNCTION_39();
    *(_WORD *)(v16 + 14) = 1024;
    OUTLINED_FUNCTION_39();
    *(_WORD *)(v16 + 20) = 1024;
    OUTLINED_FUNCTION_39();

    OUTLINED_FUNCTION_70();
    _os_log_impl(v17, v18, v19, v20, v21, 0x1Au);
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  unint64_t v22 = (char *)v13;
  uint64_t v23 = (void *)sub_25C8923F0();
  os_log_type_t v24 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v24))
  {
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 67109632;
    OUTLINED_FUNCTION_42();
    *(_WORD *)(v25 + 8) = 1024;
    OUTLINED_FUNCTION_39();
    *(_WORD *)(v25 + 14) = 1024;
    OUTLINED_FUNCTION_39();

    OUTLINED_FUNCTION_70();
    _os_log_impl(v26, v27, v28, v29, v30, 0x14u);
    OUTLINED_FUNCTION_8();
  }
  else
  {

    uint64_t v23 = v22;
  }

  if (sub_25C885350())
  {
    if (sub_25C8875E4())
    {
      v22[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS] = 0;
      sub_25C87EEF4();
      if (sub_25C8828DC())
      {
        uint64_t v31 = (void *)sub_25C8923F0();
        os_log_type_t v32 = sub_25C8925A0();
        if (OUTLINED_FUNCTION_7_1(v32))
        {
          uint64_t v33 = (_WORD *)OUTLINED_FUNCTION_38();
          OUTLINED_FUNCTION_20_1(v33);
          OUTLINED_FUNCTION_5_1(&dword_25C872000, v34, v35, "Expecting confirmation, deferring audio session deactivation until UI Dismissal");
          OUTLINED_FUNCTION_8();
        }

        uint64_t v36 = *(void **)&v22[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper];
        if (v36)
        {
          if (objc_msgSend(*(id *)&v22[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper], sel_respondsToSelector_, sel_deferAudioSessionDeactivationForAnnouncementRequest))objc_msgSend(v36, sel_deferAudioSessionDeactivationForAnnouncementRequest); {
        }
          }
      }
    }
    else
    {
      char v42 = (void *)sub_25C8923F0();
      os_log_type_t v43 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_7_1(v43))
      {
        uint64_t v44 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v44);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v45, v46, "🔇 Expecting gesture response but audio session might not be active, waiting for TTS");
        OUTLINED_FUNCTION_8();
      }

      v22[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS] = 1;
    }
  }
  else if (v22[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing] == 1)
  {
    sub_25C87FE6C();
    sub_25C885C7C(a2);
    os_log_type_t v37 = sub_25C8923F0();
    os_log_type_t v38 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_8_1(v38))
    {
      uint64_t v39 = (uint8_t *)OUTLINED_FUNCTION_24();
      uint64_t v47 = OUTLINED_FUNCTION_22();
      *(_DWORD *)uint64_t v39 = 136315138;
      unint64_t v40 = sub_25C87BF44(a2);
      sub_25C8773AC(v40, v41, &v47);
      sub_25C892660();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, v37, (os_log_type_t)v22, "Not expecting gesture response, will stop head gesture recognition for reason: %s", v39, 0xCu);
      OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
  }
}

void sub_25C885950()
{
  uint64_t v1 = v0;
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C892400();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355818);
  os_log_type_t v4 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_9_1(v4))
  {
    char v5 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_25_1(v5);
    OUTLINED_FUNCTION_11_1(&dword_25C872000, v6, v7, "Resetting states");
    OUTLINED_FUNCTION_8();
  }

  sub_25C886838();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 0;
}

uint64_t sub_25C885A20()
{
  uint64_t v1 = v0;
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C892400();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355818);
  os_log_type_t v4 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_9_1(v4))
  {
    char v5 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_25_1(v5);
    OUTLINED_FUNCTION_11_1(&dword_25C872000, v6, v7, "SessionEnded, deallocating hgManager");
    OUTLINED_FUNCTION_8();
  }

  sub_25C87E148(0);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady) = 0;

  return sub_25C885AF8();
}

uint64_t sub_25C885AF8()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v3 = OUTLINED_FUNCTION_15(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v5 = OUTLINED_FUNCTION_15(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_useOwnAudioSession) = 0;
  uint64_t v8 = sub_25C892190();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo;
  OUTLINED_FUNCTION_6();
  sub_25C88A404((uint64_t)v7, v9, (uint64_t *)&unk_26B355210);
  swift_endAccess();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) = 0;
  uint64_t v10 = sub_25C891AE0();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId;
  OUTLINED_FUNCTION_27_1();
  sub_25C88A404(v1, v11, &qword_26B3554E0);
  return swift_endAccess();
}

void sub_25C885C7C(uint64_t a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) == 1)
  {
    uint64_t v3 = v1;
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25C892400();
    uint64_t v5 = (void *)OUTLINED_FUNCTION_15_0(v4, (uint64_t)qword_26B355818);
    os_log_type_t v6 = sub_25C8925A0();
    if (OUTLINED_FUNCTION_4_1(v6))
    {
      OUTLINED_FUNCTION_24();
      v27[0] = OUTLINED_FUNCTION_22();
      unint64_t v7 = OUTLINED_FUNCTION_97(4.8149e-34);
      sub_25C8773AC(v7, v8, v27);
      OUTLINED_FUNCTION_19();
      sub_25C892660();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46(&dword_25C872000, v9, v10, "Will stop gesture recognition for reason: %s");
      OUTLINED_FUNCTION_67();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }

    sub_25C886838();
    *(unsigned char *)(v3 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 0;
    sub_25C87F4D4(a1, v11, v12, v13, v14, v15, v16, v17, v23, (uint64_t)oslog, v26, v27[0], v27[1], v27[2], v27[3], v27[4], v27[5], v27[6], v27[7],
      v27[8],
      v27[9],
      v27[10]);
  }
  else
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25C892400();
    osloga = OUTLINED_FUNCTION_15_0(v18, (uint64_t)qword_26B355818);
    os_log_type_t v19 = sub_25C8925A0();
    if (os_log_type_enabled(osloga, v19))
    {
      uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_24();
      v27[0] = OUTLINED_FUNCTION_22();
      *(_DWORD *)uint64_t v20 = 136315138;
      unint64_t v21 = sub_25C87BF44(a1);
      sub_25C8773AC(v21, v22, v27);
      OUTLINED_FUNCTION_19();
      sub_25C892660();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, osloga, v19, "Not running gesture recognition, no need to stop gesture recognition for reason: %s", v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
  }
}

#error "25C8861A0: call analysis failed (funcsize=320)"

void sub_25C886470(char a1, uint64_t a2, void *a3)
{
  int v5 = a1 & 1;
  os_log_type_t v6 = (void *)sub_25C891BB0();
  unint64_t v7 = (void *)sub_25C891B20();

  LODWORD(v6) = sub_25C891B90() & 1;
  if (v6 != v5)
  {
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25C892400();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B355818);
    id v9 = a3;
    uint64_t v10 = sub_25C8923F0();
    os_log_type_t v11 = sub_25C892590();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 67109376;
      sub_25C892660();

      *(_WORD *)(v12 + 8) = 1024;
      sub_25C892660();
      _os_log_impl(&dword_25C872000, v10, v11, "TTS Active: %{BOOL}d shouldPlayWaitingTone: %{BOOL}d", (uint8_t *)v12, 0xEu);
      MEMORY[0x2611965C0](v12, -1, -1);
    }
    else
    {
    }
    uint64_t v13 = v9;
    uint64_t v14 = sub_25C8923F0();
    os_log_type_t v15 = sub_25C8925A0();
    BOOL v16 = os_log_type_enabled(v14, v15);
    if (a1)
    {
      if (v16)
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 67109120;
        sub_25C892660();

        _os_log_impl(&dword_25C872000, v14, v15, "🔊 Playing waiting tone, ttsActive: %{BOOL}d", v17, 8u);
        uint64_t v18 = (uint64_t)v17;
LABEL_12:
        MEMORY[0x2611965C0](v18, -1, -1);
LABEL_14:

        uint64_t v20 = (void *)sub_25C891BB0();
        unint64_t v21 = (void *)sub_25C891B20();

        sub_25C891BA0();
        return;
      }
    }
    else if (v16)
    {
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 67109632;
      sub_25C892660();
      *(_WORD *)(v19 + 8) = 1024;
      sub_25C8828DC();
      sub_25C892660();
      *(_WORD *)(v19 + 14) = 1024;
      sub_25C892660();

      _os_log_impl(&dword_25C872000, v14, v15, "🔇 Not playing waiting tone, ttsActive: %{BOOL}d, expectingConfirmation: %{BOOL}d, isReady: %{BOOL}d", (uint8_t *)v19, 0x14u);
      uint64_t v18 = v19;
      goto LABEL_12;
    }

    uint64_t v14 = v13;
    goto LABEL_14;
  }
}

void sub_25C8867C4(char a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestActive) != (a1 & 1))
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestActive) = a1 & 1;
    if ((a1 & 1) != 0
      && (*(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) & 1) == 0)
    {
      sub_25C886838();
      *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 0;
    }
  }
}

uint64_t sub_25C886818(uint64_t result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionActive) != (result & 1)) {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionActive) = result & 1;
  }
  return result;
}

void sub_25C886838()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation) = 0;
}

void sub_25C88686C(char a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isListening) != (a1 & 1))
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isListening) = a1 & 1;
    if ((a1 & 1) == 0)
    {
      if (qword_26B355670 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_25C892400();
      uint64_t v14 = OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355818);
      os_log_type_t v3 = sub_25C8925A0();
      if (OUTLINED_FUNCTION_74(v3, v4, v5, v6, v7, v8, v9, v10, v13, v14))
      {
        os_log_type_t v11 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_48(v11);
        OUTLINED_FUNCTION_28_0(&dword_25C872000, v15, v12, "Siri is not listening");
        OUTLINED_FUNCTION_8();
      }
    }
  }
}

uint64_t sub_25C886950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C8869CC(a2, a3);
}

#error "25C886B68: call analysis failed (funcsize=468)"

uint64_t sub_25C88725C()
{
  OUTLINED_FUNCTION_57();
  if (v1)
  {
    unsigned int v13 = 0;
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25C892400();
    os_log_type_t v3 = OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355818);
    os_log_type_t v4 = sub_25C892590();
    if (OUTLINED_FUNCTION_7_1(v4))
    {
      int v5 = (uint8_t *)OUTLINED_FUNCTION_41();
      *(_DWORD *)int v5 = 67109120;
      sub_25C892660();
      _os_log_impl(&dword_25C872000, v3, (os_log_type_t)v0, "🔊 Use our own audio session: %u", v5, 8u);
      OUTLINED_FUNCTION_8();
    }
  }
  else
  {
    int v6 = *(void **)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper);
    if (v6)
    {
      if (objc_msgSend(v6, sel_respondsToSelector_, sel_audioSessionID)) {
        LODWORD(v6) = objc_msgSend(v6, sel_audioSessionID);
      }
      else {
        LODWORD(v6) = 0;
      }
    }
    unsigned int v13 = v6;
    if (qword_26B355670 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25C892400();
    int v8 = (void *)OUTLINED_FUNCTION_15_0(v7, (uint64_t)qword_26B355818);
    os_log_type_t v9 = sub_25C892590();
    if (OUTLINED_FUNCTION_9_1(v9))
    {
      *(_DWORD *)OUTLINED_FUNCTION_41() = 67109120;
      sub_25C892660();
      OUTLINED_FUNCTION_100(&dword_25C872000, v10, v11, "🔊 Using Siri's audio session: %u");
      OUTLINED_FUNCTION_8();
    }
  }
  OUTLINED_FUNCTION_29_0();
  return v13;
}

id sub_25C887460()
{
  uint64_t v1 = sub_25C88725C();
  if (!v1) {
    return 0;
  }
  id v2 = objc_msgSend(self, sel_retrieveSessionWithID_, v1);
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25C892400();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B355818);
  id v4 = v2;
  int v5 = sub_25C8923F0();
  os_log_type_t v6 = sub_25C892590();
  if (OUTLINED_FUNCTION_8_1(v6))
  {
    uint64_t v7 = swift_slowAlloc();
    OUTLINED_FUNCTION_93((float *)v7, 1.5047e-36);
    OUTLINED_FUNCTION_75();
    *(_WORD *)(v7 + 8) = 1024;
    objc_msgSend(v4, sel_isActive);
    sub_25C892660();

    _os_log_impl(&dword_25C872000, v5, v0, "🔊 Audio Session (%u) isActive: %{BOOL}d", (uint8_t *)v7, 0xEu);
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  id v8 = objc_msgSend(v4, sel_isActive);

  return v8;
}

uint64_t sub_25C8875E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_useOwnAudioSession;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_useOwnAudioSession) = 0;
  if (sub_25C87C780()) {
    return 1;
  }
  uint64_t v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured) & 1) != 0
    || (*(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive) & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = 7104878;
  uint64_t v6 = sub_25C88725C();
  if (*(void *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper)
    && (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper), sel_respondsToSelector_, sel_currentResponseMode) & 1) != 0)
  {
    id v7 = objc_msgSend((id)swift_unknownObjectRetain(), sel_currentResponseMode);
    if (v7)
    {
      id v8 = v7;
      uint64_t v5 = sub_25C892500();
      unint64_t v10 = v9;
      swift_unknownObjectRelease();

      goto LABEL_11;
    }
    swift_unknownObjectRelease();
  }
  unint64_t v10 = 0xE300000000000000;
LABEL_11:
  if (qword_26B355670 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25C892400();
  os_log_type_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_26B355818);
  swift_bridgeObjectRetain_n();
  unsigned int v13 = sub_25C8923F0();
  os_log_type_t v14 = sub_25C8925A0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v80 = v3;
    os_log_type_t v15 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v81 = OUTLINED_FUNCTION_22();
    *(_DWORD *)os_log_type_t v15 = 136315138;
    swift_bridgeObjectRetain();
    sub_25C8773AC(v5, v10, &v81);
    uint64_t v6 = v6;
    sub_25C892660();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C872000, v13, v14, "Response mode: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    uint64_t v3 = v80;
    OUTLINED_FUNCTION_8();

    if (v6) {
      goto LABEL_15;
    }
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    unint64_t v21 = (void *)sub_25C8923F0();
    os_log_type_t v22 = sub_25C8925B0();
    if (OUTLINED_FUNCTION_9_1(v22))
    {
      *(_DWORD *)OUTLINED_FUNCTION_41() = 67109120;
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_100(&dword_25C872000, v23, v24, "🔊 Audio Session (%u) is not configured");
      OUTLINED_FUNCTION_8();
    }

    return 0;
  }

  swift_bridgeObjectRelease_n();
  if (!v6) {
    goto LABEL_19;
  }
LABEL_15:
  BOOL v16 = objc_msgSend(self, sel_retrieveSessionWithID_, v6);
  if ([v16 isActive])
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_25C8923F0();
    os_log_type_t v18 = sub_25C892590();
    if (OUTLINED_FUNCTION_8_1(v18))
    {
      uint64_t v19 = (uint8_t *)OUTLINED_FUNCTION_41();
      *(_DWORD *)uint64_t v19 = 67109120;
      OUTLINED_FUNCTION_77();
      _os_log_impl(&dword_25C872000, v17, v12, "🔊 Audio session (%u) is active and ready for playback, no other audio is playing", v19, 8u);
      OUTLINED_FUNCTION_8();
      uint64_t v20 = v16;
    }
    else
    {
      uint64_t v20 = v17;
      uint64_t v17 = v16;
    }

    uint64_t result = 1;
    *(unsigned char *)(v1 + v3) = 1;
    return result;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)sub_25C8923F0();
    os_log_type_t v26 = sub_25C892590();
    if (OUTLINED_FUNCTION_7_1(v26))
    {
      os_log_t v27 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_20_1(v27);
      OUTLINED_FUNCTION_5_1(&dword_25C872000, v28, v29, "🔊 Will wait for audio session to be configured for announcement to prevent premature audio session actvation");
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    return 0;
  }
  unint64_t v30 = v10;
  id v31 = [v16 mode];
  uint64_t v32 = sub_25C892500();
  uint64_t v34 = v33;
  if (v32 == sub_25C892500() && v34 == v35)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v37 = sub_25C892740();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0 && ([v16 isOtherAudioPlaying] & 1) == 0)
    {
      swift_bridgeObjectRelease();
      os_log_type_t v38 = v16;
      uint64_t v39 = sub_25C8923F0();
      os_log_type_t v40 = sub_25C892590();
      if (OUTLINED_FUNCTION_96(v40))
      {
        uint64_t v41 = swift_slowAlloc();
        uint64_t v81 = OUTLINED_FUNCTION_110();
        *(_DWORD *)uint64_t v41 = 67109634;
        sub_25C892660();
        *(_WORD *)(v41 + 8) = 2080;
        id v42 = [v38 category];
        uint64_t v43 = sub_25C892500();
        unint64_t v45 = v44;

        sub_25C8773AC(v43, v45, &v81);
        sub_25C892660();

        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 18) = 2080;
        id v46 = [v38 mode];
        uint64_t v47 = sub_25C892500();
        unint64_t v49 = v48;

        sub_25C8773AC(v47, v49, &v81);
        sub_25C892660();

        swift_bridgeObjectRelease();
        char v50 = "🔊 Audio session (%u, %s, %s)) is ready for playback, no other audio is playing and the mode is configured";
        os_log_t v51 = v39;
        os_log_type_t v52 = v16;
        uint64_t v53 = (uint8_t *)v41;
        uint32_t v54 = 28;
LABEL_47:
        _os_log_impl(&dword_25C872000, v51, v52, v50, v53, v54);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();

        return 1;
      }

      goto LABEL_62;
    }
  }
  id v55 = [v16 mode];
  uint64_t v56 = sub_25C892500();
  uint64_t v58 = v57;
  if (v56 == sub_25C892500() && v58 == v59)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v61 = sub_25C892740();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v61 & 1) == 0 && [v16 categoryOptions])
    {
      swift_bridgeObjectRelease();
      os_log_type_t v38 = v16;
      uint64_t v39 = sub_25C8923F0();
      os_log_type_t v62 = sub_25C892590();
      if (OUTLINED_FUNCTION_96(v62))
      {
        uint64_t v63 = swift_slowAlloc();
        uint64_t v81 = OUTLINED_FUNCTION_110();
        *(_DWORD *)uint64_t v63 = 67109890;
        sub_25C892660();
        *(_WORD *)(v63 + 8) = 2080;
        id v64 = [v38 category];
        uint64_t v65 = sub_25C892500();
        unint64_t v67 = v66;

        sub_25C8773AC(v65, v67, &v81);
        OUTLINED_FUNCTION_68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v63 + 18) = 2080;
        id v68 = [v38 mode];
        uint64_t v69 = sub_25C892500();
        unint64_t v71 = v70;

        sub_25C8773AC(v69, v71, &v81);
        OUTLINED_FUNCTION_68();

        swift_bridgeObjectRelease();
        *(_WORD *)(v63 + 28) = 2048;
        [v38 categoryOptions];

        OUTLINED_FUNCTION_68();
        char v50 = "🔊 Audio session (%u, %s, %s)) is ready for playback with categoryOptions: %lu";
        os_log_t v51 = v39;
        os_log_type_t v52 = v16;
        uint64_t v53 = (uint8_t *)v63;
        uint32_t v54 = 38;
        goto LABEL_47;
      }

LABEL_62:
      return 1;
    }
  }
  if (v5 == sub_25C892500() && v30 == v72)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v74 = sub_25C892740();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v74 & 1) == 0)
    {

      goto LABEL_20;
    }
  }
  uint64_t v75 = sub_25C8923F0();
  os_log_type_t v76 = sub_25C892590();
  if (os_log_type_enabled(v75, v76))
  {
    uint64_t v77 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_25_1(v77);
    OUTLINED_FUNCTION_64(&dword_25C872000, v75, v78, "Allowing audio playback for display only request");
    OUTLINED_FUNCTION_8();
    char v79 = v16;
  }
  else
  {
    char v79 = v75;
    uint64_t v75 = v16;
  }

  uint64_t result = 1;
  *(unsigned char *)(v0 + v2) = 1;
  return result;
}

void sub_25C887FA4(void *a1, uint64_t a2, void *a3)
{
  id v26 = a1;
  uint64_t v4 = sub_25C892420();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25C892460();
  uint64_t v8 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  unint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  os_log_type_t v12 = self;
  uint64_t v25 = a3;
  id v13 = objc_msgSend(v12, sel_currentQueue);
  id v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (v14
    && (sub_25C889EAC(),
        id v15 = v26,
        id v16 = v14,
        char v17 = sub_25C892630(),
        v16,
        v16,
        v15,
        (v17 & 1) != 0))
  {
    id v18 = v25;
    uint64_t v19 = *(void **)&v25[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager];
    if (v19)
    {
      id v20 = v19;
      id v26 = (id)sub_25C891BB0();

      AFIsInternalInstall();
      sub_25C891B30();

      swift_release();
      id v21 = v26;
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_25C88A460;
    *(void *)(v22 + 24) = v11;
    aBlock[4] = sub_25C88A5D4;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C8899BC;
    aBlock[3] = &block_descriptor_178;
    uint64_t v23 = _Block_copy(aBlock);
    swift_retain();
    sub_25C892430();
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v10, v7, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);

    swift_release();
    swift_release();
  }
}

uint64_t sub_25C8883CC(void *a1, uint64_t a2, void *a3)
{
  id v24 = a1;
  uint64_t v4 = sub_25C892420();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_25C892460();
  uint64_t v8 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  os_log_type_t v12 = self;
  id v23 = a3;
  id v13 = objc_msgSend(v12, sel_currentQueue);
  id v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (v14
    && (sub_25C889EAC(),
        id v15 = v24,
        id v16 = v14,
        char v17 = sub_25C892630(),
        v16,
        v16,
        v15,
        (v17 & 1) != 0))
  {
    id v18 = v23;
    sub_25C880474();

    return swift_release();
  }
  else
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = sub_25C88A368;
    *(void *)(v20 + 24) = v11;
    aBlock[4] = sub_25C88A5D4;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C8899BC;
    aBlock[3] = &block_descriptor_145;
    id v21 = _Block_copy(aBlock);
    swift_retain();
    sub_25C892430();
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v10, v7, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v22);

    swift_release();
    return swift_release();
  }
}

void sub_25C88878C(void *a1, uint64_t a2, void *a3, int a4)
{
  id v28 = a1;
  uint64_t v6 = sub_25C892420();
  uint64_t v26 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25C892460();
  uint64_t v9 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(_DWORD *)(v12 + 24) = a4;
  id v13 = self;
  id v27 = a3;
  id v14 = objc_msgSend(v13, sel_currentQueue);
  id v15 = objc_msgSend(v14, sel_underlyingQueue);

  if (v15
    && (sub_25C889EAC(),
        id v16 = v28,
        id v17 = v15,
        char v18 = sub_25C892630(),
        v17,
        v17,
        v16,
        (v18 & 1) != 0))
  {
    id v19 = v27;
    uint64_t v20 = (void *)sub_25C891BB0();
    id v28 = (id)sub_25C891B20();

    sub_25C891B80();
    swift_release();
    id v21 = v28;
  }
  else
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_25C88A324;
    *(void *)(v22 + 24) = v12;
    aBlock[4] = sub_25C88A5D4;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C8899BC;
    aBlock[3] = &block_descriptor_135;
    id v23 = _Block_copy(aBlock);
    swift_retain();
    sub_25C892430();
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v11, v8, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v25);

    swift_release();
    swift_release();
  }
}

uint64_t sub_25C888B7C(void *a1, uint64_t a2, void *a3, char a4)
{
  id v27 = a1;
  uint64_t v6 = sub_25C892420();
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25C892460();
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(unsigned char *)(v12 + 24) = a4;
  id v13 = self;
  uint64_t v26 = a3;
  id v14 = objc_msgSend(v13, sel_currentQueue);
  id v15 = objc_msgSend(v14, sel_underlyingQueue);

  if (v15
    && (sub_25C889EAC(),
        id v16 = v27,
        id v17 = v15,
        char v18 = sub_25C892630(),
        v17,
        v17,
        v16,
        (v18 & 1) != 0))
  {
    id v19 = v26;
    sub_25C87F60C(v26, a4);

    return swift_release();
  }
  else
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_25C88A3A8;
    *(void *)(v21 + 24) = v12;
    aBlock[4] = sub_25C88A5D4;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C8899BC;
    aBlock[3] = &block_descriptor_155;
    uint64_t v22 = _Block_copy(aBlock);
    swift_retain();
    sub_25C892430();
    uint64_t v28 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v11, v8, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);

    swift_release();
    return swift_release();
  }
}

void sub_25C888F4C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v28 = a1;
  uint64_t v6 = sub_25C892420();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25C892460();
  uint64_t v10 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  id v14 = self;
  id v26 = a3;
  id v27 = a4;
  id v15 = objc_msgSend(v14, sel_currentQueue);
  id v16 = objc_msgSend(v15, sel_underlyingQueue);

  if (v16
    && (sub_25C889EAC(),
        id v17 = v28,
        id v18 = v16,
        char v19 = sub_25C892630(),
        v18,
        v18,
        v17,
        (v19 & 1) != 0))
  {
    id v21 = v26;
    uint64_t v20 = v27;
    sub_25C87F138((uint64_t)v26);

    swift_release();
  }
  else
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_25C88A3FC;
    *(void *)(v22 + 24) = v13;
    aBlock[4] = sub_25C88A5D4;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C8899BC;
    aBlock[3] = &block_descriptor_168;
    uint64_t v23 = _Block_copy(aBlock);
    swift_retain();
    sub_25C892430();
    uint64_t v29 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v12, v9, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);

    swift_release();
    swift_release();
    uint64_t v20 = v27;
  }
}

void sub_25C8892FC(void *a1, uint64_t a2, char a3, void *a4, void *a5)
{
  id v29 = a1;
  uint64_t v8 = sub_25C892420();
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_25C892460();
  uint64_t v11 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = a5;
  id v15 = self;
  id v27 = a4;
  id v28 = a5;
  id v16 = objc_msgSend(v15, sel_currentQueue);
  id v17 = objc_msgSend(v16, sel_underlyingQueue);

  if (v17
    && (sub_25C889EAC(),
        id v18 = v29,
        id v19 = v17,
        char v20 = sub_25C892630(),
        v19,
        v19,
        v18,
        (v20 & 1) != 0))
  {
    id v22 = v27;
    id v21 = v28;
    sub_25C886470(a3 & 1, (uint64_t)v27, v28);

    swift_release();
  }
  else
  {
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_25C88A04C;
    *(void *)(v23 + 24) = v14;
    aBlock[4] = sub_25C88A5D4;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25C8899BC;
    aBlock[3] = &block_descriptor_117;
    uint64_t v24 = _Block_copy(aBlock);
    swift_retain();
    sub_25C892430();
    uint64_t v30 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v13, v10, v24);
    _Block_release(v24);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);

    swift_release();
    swift_release();
    id v21 = v28;
  }
}

void sub_25C8896BC()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  id v24 = v5;
  uint64_t v6 = sub_25C892420();
  OUTLINED_FUNCTION_4();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_59();
  v23[1] = sub_25C892460();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(self, sel_currentQueue);
  id v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (!v14) {
    goto LABEL_4;
  }
  sub_25C889EAC();
  id v15 = v24;
  v23[0] = v8;
  id v16 = v15;
  id v17 = v4;
  id v18 = v14;
  char v19 = sub_25C892630();

  uint64_t v4 = v17;
  uint64_t v8 = v23[0];
  if (v19)
  {
    v17();
  }
  else
  {
LABEL_4:
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v4;
    *(void *)(v20 + 24) = v2;
    v26[4] = sub_25C889E6C;
    v26[5] = v20;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 1107296256;
    v26[2] = sub_25C8899BC;
    v26[3] = &block_descriptor;
    id v21 = _Block_copy(v26);
    swift_retain();
    sub_25C892430();
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_25C88A4E8(&qword_26B355680, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B355688);
    sub_25C88A530(&qword_26B355690, &qword_26B355688);
    sub_25C8926B0();
    MEMORY[0x261195ED0](0, v12, v0, v21);
    _Block_release(v21);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
    OUTLINED_FUNCTION_65();
    v22();
    swift_release();
  }
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C8899BC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_25C889A00()
{
}

id sub_25C889A40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GestureController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25C889B7C()
{
  return type metadata accessor for GestureController();
}

uint64_t type metadata accessor for GestureController()
{
  uint64_t result = qword_26B355508;
  if (!qword_26B355508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C889BCC()
{
  sub_25C889DE0(319, &qword_26B3555C8, (void (*)(uint64_t))type metadata accessor for GestureMapping);
  if (v0 <= 0x3F)
  {
    type metadata accessor for EventDeduper(319);
    if (v1 <= 0x3F)
    {
      sub_25C889DE0(319, (unint64_t *)&qword_26B3554F0, MEMORY[0x263F70A00]);
      if (v2 <= 0x3F)
      {
        sub_25C889DE0(319, &qword_26B3554E8, MEMORY[0x263F07508]);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_25C889DE0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25C892650();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25C889E34()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25C889E6C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_25C889EAC()
{
  unint64_t result = qword_26B355588;
  if (!qword_26B355588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B355588);
  }
  return result;
}

id sub_25C889EEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v10 = (void *)sub_25C8924F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(v6, sel_initWithName_options_queue_delegate_, v10, a3, a4, a5);

  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_25C889F80()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_25C87D438(0, *(void *)(v1 + 16) + 1, 1, v1);
    *uint64_t v0 = result;
  }
  return result;
}

uint64_t sub_25C889FCC(uint64_t result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if (result + 1 > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_25C87D438(v2 > 1, result + 1, 1, *v1);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_25C88A00C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25C88A04C()
{
  sub_25C886470(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_25C88A058()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25C88A090(uint64_t a1)
{
  return sub_25C883200(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C88A0AC(uint64_t a1)
{
  return sub_25C882F7C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25C88A0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GestureMapping(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C88A118(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C88A174()
{
  uint64_t v1 = *(void *)(type metadata accessor for GestureMapping(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  uint64_t v4 = *(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 4;

  sub_25C8921C0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = *(void (**)(void))(v5 + 8);
  OUTLINED_FUNCTION_26_1();
  v6();
  OUTLINED_FUNCTION_26_1();
  v6();

  return MEMORY[0x270FA0238](v0, v4, v3);
}

void sub_25C88A278()
{
  uint64_t v0 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_35_0(v0);

  sub_25C880DC0();
}

uint64_t sub_25C88A2EC()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

void sub_25C88A324()
{
}

uint64_t sub_25C88A330()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25C88A368()
{
}

uint64_t sub_25C88A370()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

void sub_25C88A3A8()
{
  sub_25C87F60C(*(char **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_25C88A3B4()
{
  sub_25C87FB94(*(void *)(v0 + 16));
}

uint64_t sub_25C88A3BC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25C88A3FC()
{
  sub_25C87F138(*(void *)(v0 + 16));
}

uint64_t sub_25C88A404(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

void sub_25C88A460()
{
  sub_25C87EA54(*(void *)(v0 + 16));
}

uint64_t sub_25C88A468(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C88A490(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C88A4E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C88A530(unint64_t *a1, uint64_t *a2)
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

BOOL OUTLINED_FUNCTION_4_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_7_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_8_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_9_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_11_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_12_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

_WORD *OUTLINED_FUNCTION_16_1(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_WORD *OUTLINED_FUNCTION_20_1(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void OUTLINED_FUNCTION_22_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_23(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

_WORD *OUTLINED_FUNCTION_24_1(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_WORD *OUTLINED_FUNCTION_25_1(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_28_0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return 0;
}

void OUTLINED_FUNCTION_32_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_35_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

void OUTLINED_FUNCTION_46(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_25C892660();
}

_WORD *OUTLINED_FUNCTION_48(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_51(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return type metadata accessor for GestureMapping(0);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return 0;
}

void OUTLINED_FUNCTION_63(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

void OUTLINED_FUNCTION_64(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

void OUTLINED_FUNCTION_66()
{
  sub_25C8854C4(0, 8);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_25C892660();
}

BOOL OUTLINED_FUNCTION_73(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

BOOL OUTLINED_FUNCTION_74(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_80(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t OUTLINED_FUNCTION_81()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_82()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_92(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

float *OUTLINED_FUNCTION_93(float *result, float a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_95()
{
  return v0;
}

BOOL OUTLINED_FUNCTION_96(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

unint64_t OUTLINED_FUNCTION_97(float a1)
{
  *uint64_t v2 = a1;
  return sub_25C87BF44(v1);
}

void OUTLINED_FUNCTION_98(uint64_t a1@<X8>)
{
  *(unsigned char *)(v1 + a1) = 1;
}

void OUTLINED_FUNCTION_99(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_100(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 8u);
}

uint64_t OUTLINED_FUNCTION_102(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_25C88A404(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_103(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

_WORD *OUTLINED_FUNCTION_104(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_105()
{
  return MEMORY[0x270EEF840](v0);
}

uint64_t OUTLINED_FUNCTION_106()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_107()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_108()
{
  return 0xD000000000000023;
}

uint64_t OUTLINED_FUNCTION_109()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_111()
{
  return 0;
}

void OUTLINED_FUNCTION_112(uint64_t a1@<X8>)
{
  *(void *)(v1 - 264) = a1;
}

uint64_t OUTLINED_FUNCTION_114(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t sub_25C88AE80(long long *a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_25C891AE0();
  OUTLINED_FUNCTION_14_0(v7);
  uint64_t v8 = (void *)(v2 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentAssistantId);
  *uint64_t v8 = 0;
  v8[1] = 0;
  uint64_t v9 = sub_25C892290();
  OUTLINED_FUNCTION_14_0(v9);
  uint64_t v10 = type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_14_0(v10);
  id v11 = (void *)(v2 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRequestId);
  *id v11 = 0;
  v11[1] = 0;
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25C892400();
  id v13 = OUTLINED_FUNCTION_15_0(v12, (uint64_t)qword_26B355760);
  os_log_type_t v14 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v14))
  {
    id v15 = (uint8_t *)OUTLINED_FUNCTION_38();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_25C872000, v13, v3, "Initializing gesture output submitter", v15, 2u);
    OUTLINED_FUNCTION_8();
  }

  sub_25C8774C4(a1, v4 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  *(void *)(v4 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_serviceHelper) = a2;
  return v4;
}

void sub_25C88AFD4()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for GestureResponse(0);
  uint64_t v4 = OUTLINED_FUNCTION_15(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_23_0();
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25C892400();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B355760);
  sub_25C88EB28((uint64_t)v2, v0);
  uint64_t v6 = sub_25C8923F0();
  os_log_type_t v7 = sub_25C8925A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v11 = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v9 = sub_25C87B8D4();
    sub_25C8773AC(v9, v10, &v11);
    sub_25C892660();
    swift_bridgeObjectRelease();
    sub_25C88E968(v0);
    _os_log_impl(&dword_25C872000, v6, v7, "Gesture response received: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
    sub_25C88E968(v0);
  }

  sub_25C88B6E0(v2);
  OUTLINED_FUNCTION_10_0();
}

void sub_25C88B188()
{
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25C892400();
  os_log_t oslog = OUTLINED_FUNCTION_15_0(v0, (uint64_t)qword_26B355760);
  os_log_type_t v1 = sub_25C8925B0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)OUTLINED_FUNCTION_38();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25C872000, oslog, v1, "‼️ Gesture controller error", v2, 2u);
    OUTLINED_FUNCTION_8();
  }
}

void sub_25C88B258(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25C892400();
  uint64_t v11 = (uint8_t *)__swift_project_value_buffer(v10, (uint64_t)qword_26B355760);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_25C8923F0();
  os_log_type_t v13 = sub_25C8925A0();
  os_log_type_t v14 = (void *)&unk_26A5D9000;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = OUTLINED_FUNCTION_22();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v39 = a1;
    sub_25C8773AC(a1, a2, &v40);
    sub_25C892660();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v38 = a3;
    if (a4)
    {
      unint64_t v16 = a4;
    }
    else
    {
      a3 = 7104878;
      unint64_t v16 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_25C8773AC(a3, v16, &v40);
    os_log_type_t v14 = &unk_26A5D9000;
    sub_25C892660();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2080;
    id v17 = (uint64_t *)(v5 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRequestId);
    if (*(void *)(v5 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRequestId + 8))
    {
      uint64_t v18 = *v17;
      unint64_t v19 = v17[1];
    }
    else
    {
      unint64_t v19 = 0xE300000000000000;
      uint64_t v18 = 7104878;
    }
    swift_bridgeObjectRetain();
    sub_25C8773AC(v18, v19, &v40);
    sub_25C892660();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v12, v13, "🆔 Request started with requestId: %s, rootRequestId: %s, pendingGestureRequestId: %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();

    a1 = v39;
    a3 = v38;
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v20 = (uint64_t *)(v5 + v14[164]);
  uint64_t v21 = v20[1];
  if (!v21)
  {
    uint64_t v30 = (void *)sub_25C8923F0();
    os_log_type_t v31 = sub_25C892590();
    if (OUTLINED_FUNCTION_7_1(v31))
    {
      uint64_t v32 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_20_1(v32);
      uint64_t v35 = "No pending gesture response to post";
LABEL_33:
      OUTLINED_FUNCTION_5_1(&dword_25C872000, v33, v34, v35);
      OUTLINED_FUNCTION_8();
    }
LABEL_34:

    return;
  }
  uint64_t v22 = *v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8CD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C893470;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  *(void *)(inited + 48) = a3;
  *(void *)(inited + 56) = a4;
  unint64_t v24 = a4;
  if (a2)
  {
    if (v22 == a1 && v21 == a2) {
      goto LABEL_26;
    }
    OUTLINED_FUNCTION_31_0();
    if (sub_25C892740()) {
      goto LABEL_26;
    }
    a3 = *(void *)(inited + 48);
    unint64_t v24 = *(void *)(inited + 56);
  }
  if (!v24 || (v24 == v21 ? (BOOL v26 = a3 == v22) : (BOOL v26 = 0), !v26 && (sub_25C892740() & 1) == 0))
  {
    swift_setDeallocating();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25C88E830();
    uint64_t v30 = (void *)sub_25C8923F0();
    os_log_type_t v36 = sub_25C892590();
    if (OUTLINED_FUNCTION_7_1(v36))
    {
      char v37 = (_WORD *)OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_20_1(v37);
      uint64_t v35 = "‼️ Gesture response is pending, but this is not the request";
      goto LABEL_33;
    }
    goto LABEL_34;
  }
LABEL_26:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v27 = sub_25C8923F0();
  os_log_type_t v28 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_4_1(v28))
  {
    id v29 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v29);
    _os_log_impl(&dword_25C872000, v27, (os_log_type_t)a4, "✅ Gesture activation request has begun, posting gesture RC", v11, 2u);
    OUTLINED_FUNCTION_8();
  }

  OUTLINED_FUNCTION_31_0();
  sub_25C88C088();
  OUTLINED_FUNCTION_31_0();
  sub_25C88CEDC();
}

void sub_25C88B6E0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C892400();
  uint64_t v3 = OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355760);
  os_log_type_t v4 = sub_25C8925A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_24();
    uint64_t v13 = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v6 = sub_25C87A14C(v1);
    sub_25C8773AC(v6, v7, &v13);
    OUTLINED_FUNCTION_19();
    sub_25C892660();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v3, v4, "🫡 Handling user intent: %s", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }

  if ((unint64_t)(v1 - 1) >= 2)
  {
    if (v1 == 4)
    {
      sub_25C88B938();
    }
    else
    {
      uint64_t v8 = sub_25C8923F0();
      os_log_type_t v9 = sub_25C8925B0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_24();
        uint64_t v13 = OUTLINED_FUNCTION_22();
        *(_DWORD *)uint64_t v10 = 136315138;
        uint64_t v11 = sub_25C87A14C(v1);
        sub_25C8773AC(v11, v12, &v13);
        OUTLINED_FUNCTION_19();
        sub_25C892660();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C872000, v8, v9, "‼️ Unsupported user intent: %s", v10, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();
      }
    }
  }
  else
  {
    sub_25C88BA50();
  }
}

id sub_25C88B938()
{
  uint64_t v1 = v0;
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C892400();
  uint64_t v3 = OUTLINED_FUNCTION_15_0(v2, (uint64_t)qword_26B355760);
  os_log_type_t v4 = sub_25C8925A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_38();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25C872000, v3, v4, "🙅‍♀️ Dismissing Siri", v5, 2u);
    OUTLINED_FUNCTION_8();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_serviceHelper);
  id result = objc_msgSend(v6, sel_respondsToSelector_, sel_deactivateCurrentAnnouncementRequestForReason_);
  if (result)
  {
    return objc_msgSend(v6, sel_deactivateCurrentAnnouncementRequestForReason_, 20);
  }
  return result;
}

void sub_25C88BA50()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  uint64_t v9 = OUTLINED_FUNCTION_15(v8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v14 = (char *)&v46 - v13;
  uint64_t v15 = *v3;
  if ((unint64_t)(*v3 - 1) >= 2)
  {
    if (qword_26B355558 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_25C892400();
    os_log_t v49 = (os_log_t)OUTLINED_FUNCTION_15_0(v39, (uint64_t)qword_26B355760);
    os_log_type_t v40 = sub_25C8925B0();
    if (os_log_type_enabled(v49, v40))
    {
      uint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_24();
      v50[0] = OUTLINED_FUNCTION_22();
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v42 = sub_25C87A14C(v15);
      uint64_t v51 = sub_25C8773AC(v42, v43, v50);
      sub_25C892660();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, v49, v40, "‼️ Can't produce payload for unsupported user intent: %s", v41, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();

LABEL_18:
      OUTLINED_FUNCTION_10_0();
      return;
    }
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    sub_25C891AF0();
    sub_25C88EA78();
    unint64_t v16 = sub_25C88C014();
    id v17 = self;
    id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F70028]), sel_init);
    os_log_t v49 = v16;
    id v19 = objc_msgSend(v17, sel_runSiriKitExecutorCommandWithContext_payload_, v18, v16);

    id v48 = v19;
    id v20 = objc_msgSend(v17, sel_wrapCommandInStartLocalRequest_, v19);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F285B0]), sel_init);
    objc_msgSend(v21, sel_setActivationEvent_, 10);
    objc_msgSend(v21, sel_setStartLocalRequest_, v20);
    uint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_serviceHelper);
    if (objc_msgSend(v22, sel_respondsToSelector_, sel_submitExternalActivationRequest_completion_)) {
      objc_msgSend(v22, sel_submitExternalActivationRequest_completion_, v21, 0);
    }
    id v23 = v20;
    uint64_t v24 = sub_25C88EAB8(v23);
    uint64_t v25 = (uint64_t *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRequestId);
    *uint64_t v25 = v24;
    v25[1] = v26;
    swift_bridgeObjectRelease();
    id v27 = v23;
    uint64_t v28 = sub_25C88EAB8(v27);
    if (v29)
    {
      unint64_t v30 = v29;
      uint64_t v47 = v28;
      sub_25C88EB28((uint64_t)v3, (uint64_t)v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v4);
      sub_25C88EB8C((uint64_t)v14, (uint64_t)v12);
      swift_beginAccess();
      uint64_t v31 = OUTLINED_FUNCTION_31_0();
      sub_25C88E89C(v31, v32);
      swift_endAccess();
      if (qword_26B355558 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_25C892400();
      __swift_project_value_buffer(v33, (uint64_t)qword_26B355760);
      sub_25C88EB28((uint64_t)v3, (uint64_t)v7);
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25C8923F0();
      os_log_type_t v35 = sub_25C8925A0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        v50[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v36 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v51 = sub_25C8773AC(v47, v30, v50);
        sub_25C892660();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v36 + 12) = 2080;
        uint64_t v37 = sub_25C87B8D4();
        uint64_t v51 = sub_25C8773AC(v37, v38, v50);
        sub_25C892660();
        swift_bridgeObjectRelease();
        sub_25C88E968((uint64_t)v7);
        _os_log_impl(&dword_25C872000, v34, v35, "Pending: Gesture requestId: %s, Gesture response: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();
      }
      else
      {
        swift_bridgeObjectRelease_n();

        sub_25C88E968((uint64_t)v7);
      }

      goto LABEL_18;
    }
    __break(1u);
  }
}

id sub_25C88C014()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_25C8924F0();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

void sub_25C88C088()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v100 = v4;
  uint64_t v101 = v5;
  uint64_t v107 = sub_25C892210();
  OUTLINED_FUNCTION_4();
  uint64_t v103 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_18();
  uint64_t v102 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C90);
  uint64_t v10 = OUTLINED_FUNCTION_15(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_18();
  uint64_t v106 = v11;
  uint64_t v111 = sub_25C892220();
  OUTLINED_FUNCTION_4();
  uint64_t v109 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_18();
  uint64_t v99 = v14;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C98);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_18();
  uint64_t v110 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8CA0);
  uint64_t v18 = OUTLINED_FUNCTION_15(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_9();
  uint64_t v105 = v19;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  id v23 = &v96[-v22];
  MEMORY[0x270FA5388](v21);
  uint64_t v113 = &v96[-v24];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v26 = OUTLINED_FUNCTION_15(v25);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_7();
  uint64_t v29 = v28 - v27;
  uint64_t v30 = sub_25C892190();
  OUTLINED_FUNCTION_4();
  uint64_t v112 = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_18();
  uint64_t v34 = v33;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  uint64_t v36 = OUTLINED_FUNCTION_15(v35);
  MEMORY[0x270FA5388](v36);
  uint64_t v37 = OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_23_0();
  uint64_t v104 = v1;
  OUTLINED_FUNCTION_22_2();
  sub_25C88A118(v2, v0, &qword_26A5D8C88);
  if (__swift_getEnumTagSinglePayload(v0, 1, v37) != 1)
  {
    sub_25C88E904(v0, v3);
    sub_25C88A118(v3 + *(int *)(v37 + 28), v29, (uint64_t *)&unk_26B355210);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v29, 1, v30);
    uint64_t v46 = v3;
    uint64_t v98 = v30;
    if (EnumTagSinglePayload == 1)
    {
      sub_25C87D938(v29, (uint64_t *)&unk_26B355210);
      if (qword_26B355558 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_25C892400();
      id v48 = (void *)OUTLINED_FUNCTION_15_0(v47, (uint64_t)qword_26B355760);
      os_log_type_t v49 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_7_1(v49))
      {
        char v50 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v50);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v51, v52, "‼️ Unable to find promptInfo associated with the gesture input.");
        OUTLINED_FUNCTION_8();
      }

      goto LABEL_36;
    }
    uint64_t v53 = v112;
    uint64_t v54 = v34;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 32))(v34, v29, v98);
    id v55 = v113;
    sub_25C892130();
    uint64_t v56 = v109;
    uint64_t v57 = v111;
    (*(void (**)(unsigned char *, void, uint64_t))(v109 + 104))(v23, *MEMORY[0x263F70BC0], v111);
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v57);
    uint64_t v58 = v110;
    uint64_t v59 = v110 + *(int *)(v108 + 48);
    sub_25C88A118((uint64_t)v55, v110, (uint64_t *)&unk_26A5D8CA0);
    sub_25C88A118((uint64_t)v23, v59, (uint64_t *)&unk_26A5D8CA0);
    OUTLINED_FUNCTION_9_2(v58);
    if (v61)
    {
      sub_25C87D938((uint64_t)v23, (uint64_t *)&unk_26A5D8CA0);
      sub_25C87D938((uint64_t)v55, (uint64_t *)&unk_26A5D8CA0);
      OUTLINED_FUNCTION_9_2(v59);
      if (v61)
      {
        sub_25C87D938(v58, (uint64_t *)&unk_26A5D8CA0);
LABEL_30:
        if (qword_26B355558 != -1) {
          swift_once();
        }
        uint64_t v84 = sub_25C892400();
        uint64_t v65 = (void *)OUTLINED_FUNCTION_15_0(v84, (uint64_t)qword_26B355760);
        os_log_type_t v85 = sub_25C8925A0();
        if (!OUTLINED_FUNCTION_7_1(v85)) {
          goto LABEL_35;
        }
        uint64_t v86 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v86);
        unint64_t v70 = "‼️ Gesture response is for IFGestureBasedCandidateMessage";
LABEL_34:
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v68, v69, v70);
        OUTLINED_FUNCTION_8();
LABEL_35:

        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v98);
LABEL_36:
        uint64_t v79 = v46;
LABEL_37:
        sub_25C88E968(v79);
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v60 = v105;
      sub_25C88A118(v58, v105, (uint64_t *)&unk_26A5D8CA0);
      OUTLINED_FUNCTION_9_2(v59);
      if (!v61)
      {
        uint64_t v80 = v99;
        OUTLINED_FUNCTION_11_2();
        v81();
        sub_25C88E9DC();
        int v97 = sub_25C8924E0();
        uint64_t v108 = v46;
        os_log_type_t v82 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
        v82(v80, v57);
        sub_25C87D938((uint64_t)v23, (uint64_t *)&unk_26A5D8CA0);
        sub_25C87D938((uint64_t)v113, (uint64_t *)&unk_26A5D8CA0);
        v82(v60, v57);
        uint64_t v46 = v108;
        uint64_t v83 = sub_25C87D938(v58, (uint64_t *)&unk_26A5D8CA0);
        if (v97) {
          goto LABEL_30;
        }
LABEL_22:
        MEMORY[0x270FA5388](v83);
        *(void *)&v96[-16] = v46;
        uint64_t v62 = v106;
        sub_25C8921D0();
        uint64_t v63 = v107;
        if (__swift_getEnumTagSinglePayload(v62, 1, v107) != 1)
        {
          uint64_t v108 = v46;
          uint64_t v71 = v102;
          uint64_t v72 = v103;
          OUTLINED_FUNCTION_11_2();
          uint64_t v74 = v73();
          MEMORY[0x270FA5388](v74);
          uint64_t v75 = v100;
          *(void *)&v96[-48] = v104;
          *(void *)&v96[-40] = v75;
          *(void *)&v96[-32] = v101;
          *(void *)&v96[-24] = v71;
          *(void *)&v96[-16] = v54;
          objc_allocWithZone((Class)sub_25C891FD0());
          os_log_type_t v76 = (void *)sub_25C891F40();
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v63);
          if (v76)
          {
            sub_25C88CE28((uint64_t)v76);

            uint64_t v77 = OUTLINED_FUNCTION_20_2();
            v78(v77);
            uint64_t v79 = v108;
          }
          else
          {
            uint64_t v87 = v108;
            if (qword_26B355230 != -1) {
              swift_once();
            }
            uint64_t v88 = sub_25C892400();
            id v89 = (void *)OUTLINED_FUNCTION_15_0(v88, (uint64_t)qword_26B355748);
            os_log_type_t v90 = sub_25C8925B0();
            if (OUTLINED_FUNCTION_7_1(v90))
            {
              uint64_t v91 = (_WORD *)OUTLINED_FUNCTION_38();
              OUTLINED_FUNCTION_20_1(v91);
              OUTLINED_FUNCTION_5_1(&dword_25C872000, v92, v93, "GestureBasedResultCandidateMessage could not be created.");
              OUTLINED_FUNCTION_8();
            }

            uint64_t v94 = OUTLINED_FUNCTION_20_2();
            v95(v94);
            uint64_t v79 = v87;
          }
          goto LABEL_37;
        }
        sub_25C87D938(v62, &qword_26A5D8C90);
        if (qword_26B355558 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_25C892400();
        uint64_t v65 = (void *)OUTLINED_FUNCTION_15_0(v64, (uint64_t)qword_26B355760);
        os_log_type_t v66 = sub_25C8925B0();
        if (!OUTLINED_FUNCTION_7_1(v66)) {
          goto LABEL_35;
        }
        unint64_t v67 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v67);
        unint64_t v70 = "‼️ Unable to create gestureInput.";
        goto LABEL_34;
      }
      sub_25C87D938((uint64_t)v23, (uint64_t *)&unk_26A5D8CA0);
      sub_25C87D938((uint64_t)v113, (uint64_t *)&unk_26A5D8CA0);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v60, v57);
    }
    uint64_t v83 = sub_25C87D938(v58, &qword_26A5D8C98);
    goto LABEL_22;
  }
  sub_25C87D938(v0, &qword_26A5D8C88);
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_25C892400();
  os_log_type_t v40 = (void *)OUTLINED_FUNCTION_15_0(v39, (uint64_t)qword_26B355760);
  os_log_type_t v41 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_7_1(v41))
  {
    uint64_t v42 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v42);
    OUTLINED_FUNCTION_5_1(&dword_25C872000, v43, v44, "No pending gesture response to create RC");
    OUTLINED_FUNCTION_8();
  }

LABEL_38:
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C88C9B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  v32[1] = a4;
  v32[2] = a3;
  v32[0] = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3555A8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v33 = (uint64_t)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C90);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25C891AE0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8C78);
  MEMORY[0x270FA5388](v21 - 8);
  id v23 = (char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *MEMORY[0x263F709F0];
  uint64_t v25 = sub_25C8920C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v23, v24, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  MEMORY[0x261195870](v23);
  uint64_t v26 = v32[0];
  swift_bridgeObjectRetain();
  sub_25C891F70();
  uint64_t v27 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
  swift_beginAccess();
  sub_25C88A118(v27, (uint64_t)v20, &qword_26B3554E0);
  sub_25C891FC0();
  swift_bridgeObjectRetain();
  sub_25C891FB0();
  sub_25C891AD0();
  sub_25C891AC0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_25C891F50();
  uint64_t v28 = sub_25C892210();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v13, v34, v28);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v28);
  sub_25C891FA0();
  uint64_t v29 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
  swift_beginAccess();
  sub_25C88A118(v29, v33, &qword_26B3555A8);
  sub_25C891F90();
  uint64_t v30 = sub_25C892190();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v8, v35, v30);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v30);
  return sub_25C891F60();
}

uint64_t sub_25C88CE28(uint64_t a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  uint64_t v5 = OUTLINED_FUNCTION_15(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_17_1();
  sub_25C88DEB4();
  uint64_t v6 = type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_30_0(v6);
  OUTLINED_FUNCTION_19_1();
  sub_25C88E89C(v2, a1);
  swift_endAccess();
  uint64_t v7 = (void *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRequestId);
  *uint64_t v7 = 0;
  v7[1] = 0;
  return swift_bridgeObjectRelease();
}

void sub_25C88CEDC()
{
  OUTLINED_FUNCTION_12_0();
  uint64_t v88 = v3;
  uint64_t v89 = v4;
  uint64_t v96 = sub_25C892210();
  OUTLINED_FUNCTION_4();
  uint64_t v91 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_18();
  uint64_t v90 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C90);
  uint64_t v9 = OUTLINED_FUNCTION_15(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_18();
  uint64_t v95 = v10;
  uint64_t v102 = sub_25C892220();
  OUTLINED_FUNCTION_4();
  uint64_t v100 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_18();
  uint64_t v93 = v13;
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C98);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_18();
  uint64_t v101 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8CA0);
  uint64_t v17 = OUTLINED_FUNCTION_15(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_9();
  uint64_t v97 = v18;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v86 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v99 = (char *)&v86 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v25 = OUTLINED_FUNCTION_15(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_7();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = sub_25C892190();
  OUTLINED_FUNCTION_4();
  uint64_t v103 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_18();
  uint64_t v33 = v32;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  uint64_t v35 = OUTLINED_FUNCTION_15(v34);
  MEMORY[0x270FA5388](v35);
  uint64_t v36 = OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_7();
  uint64_t v40 = v39 - v38;
  uint64_t v92 = v1;
  OUTLINED_FUNCTION_22_2();
  sub_25C88A118(v2, v0, &qword_26A5D8C88);
  if (__swift_getEnumTagSinglePayload(v0, 1, v36) != 1)
  {
    sub_25C88E904(v0, v40);
    sub_25C88A118(v40 + *(int *)(v36 + 28), v28, (uint64_t *)&unk_26B355210);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v28, 1, v29);
    uint64_t v94 = v40;
    uint64_t v87 = v29;
    if (EnumTagSinglePayload == 1)
    {
      sub_25C87D938(v28, (uint64_t *)&unk_26B355210);
      if (qword_26B355558 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_25C892400();
      os_log_type_t v49 = (void *)OUTLINED_FUNCTION_15_0(v48, (uint64_t)qword_26B355760);
      os_log_type_t v50 = sub_25C8925B0();
      if (OUTLINED_FUNCTION_7_1(v50))
      {
        uint64_t v51 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v51);
        OUTLINED_FUNCTION_5_1(&dword_25C872000, v52, v53, "‼️ Unable to find promptInfo associated with the gesture input.");
        OUTLINED_FUNCTION_8();
      }

      goto LABEL_40;
    }
    uint64_t v54 = v103;
    uint64_t v55 = v33;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 32))(v33, v28, v87);
    uint64_t v56 = (uint64_t)v99;
    sub_25C892130();
    uint64_t v57 = v100;
    uint64_t v58 = v102;
    (*(void (**)(char *, void, uint64_t))(v100 + 104))(v22, *MEMORY[0x263F70BC0], v102);
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v58);
    uint64_t v59 = v101;
    uint64_t v60 = v101 + *(int *)(v98 + 48);
    sub_25C88A118(v56, v101, (uint64_t *)&unk_26A5D8CA0);
    sub_25C88A118((uint64_t)v22, v60, (uint64_t *)&unk_26A5D8CA0);
    OUTLINED_FUNCTION_9_2(v59);
    if (v63)
    {
      sub_25C87D938((uint64_t)v22, (uint64_t *)&unk_26A5D8CA0);
      sub_25C87D938(v56, (uint64_t *)&unk_26A5D8CA0);
      OUTLINED_FUNCTION_9_2(v60);
      if (v63)
      {
        uint64_t v61 = sub_25C87D938(v59, (uint64_t *)&unk_26A5D8CA0);
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v62 = v97;
      sub_25C88A118(v59, v97, (uint64_t *)&unk_26A5D8CA0);
      OUTLINED_FUNCTION_9_2(v60);
      if (!v63)
      {
        uint64_t v64 = v93;
        OUTLINED_FUNCTION_11_2();
        v65();
        sub_25C88E9DC();
        LODWORD(v98) = sub_25C8924E0();
        os_log_type_t v66 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
        v66(v64, v58);
        sub_25C87D938((uint64_t)v22, (uint64_t *)&unk_26A5D8CA0);
        sub_25C87D938(v56, (uint64_t *)&unk_26A5D8CA0);
        v66(v62, v58);
        uint64_t v54 = v103;
        uint64_t v61 = sub_25C87D938(v59, (uint64_t *)&unk_26A5D8CA0);
        if (v98)
        {
LABEL_23:
          MEMORY[0x270FA5388](v61);
          uint64_t v67 = v95;
          *(&v86 - 2) = v94;
          sub_25C8921D0();
          uint64_t v68 = v96;
          if (__swift_getEnumTagSinglePayload(v67, 1, v96) == 1)
          {
            sub_25C87D938(v67, &qword_26A5D8C90);
            if (qword_26B355558 != -1) {
              swift_once();
            }
            uint64_t v69 = sub_25C892400();
            unint64_t v70 = (void *)OUTLINED_FUNCTION_15_0(v69, (uint64_t)qword_26B355760);
            os_log_type_t v71 = sub_25C8925B0();
            if (!OUTLINED_FUNCTION_7_1(v71)) {
              goto LABEL_39;
            }
            uint64_t v72 = (_WORD *)OUTLINED_FUNCTION_38();
            OUTLINED_FUNCTION_20_1(v72);
            uint64_t v75 = "‼️ Unable to create gestureInput.";
          }
          else
          {
            uint64_t v79 = v90;
            uint64_t v80 = v91;
            uint64_t v81 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 32))(v90, v67, v68);
            MEMORY[0x270FA5388](v81);
            uint64_t v82 = v88;
            *(&v86 - 6) = v92;
            *(&v86 - 5) = v82;
            *(&v86 - 4) = v89;
            *(&v86 - 3) = v79;
            *(&v86 - 2) = v55;
            objc_allocWithZone((Class)sub_25C891F00());
            unint64_t v70 = (void *)sub_25C891E70();
            (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v68);
            if (v70)
            {
              sub_25C88DE0C((uint64_t)v70);
              goto LABEL_39;
            }
            if (qword_26B355230 != -1) {
              swift_once();
            }
            uint64_t v83 = sub_25C892400();
            unint64_t v70 = (void *)OUTLINED_FUNCTION_15_0(v83, (uint64_t)qword_26B355748);
            os_log_type_t v84 = sub_25C8925B0();
            if (!OUTLINED_FUNCTION_7_1(v84)) {
              goto LABEL_39;
            }
            os_log_type_t v85 = (_WORD *)OUTLINED_FUNCTION_38();
            OUTLINED_FUNCTION_20_1(v85);
            uint64_t v75 = "IFGestureBasedCandidateMessage could not be created.";
          }
LABEL_32:
          OUTLINED_FUNCTION_5_1(&dword_25C872000, v73, v74, v75);
          OUTLINED_FUNCTION_8();
LABEL_39:

          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v87);
LABEL_40:
          sub_25C88E968(v94);
          goto LABEL_41;
        }
LABEL_28:
        if (qword_26B355558 != -1) {
          swift_once();
        }
        uint64_t v76 = sub_25C892400();
        unint64_t v70 = (void *)OUTLINED_FUNCTION_15_0(v76, (uint64_t)qword_26B355760);
        os_log_type_t v77 = sub_25C8925A0();
        if (!OUTLINED_FUNCTION_7_1(v77)) {
          goto LABEL_39;
        }
        uint64_t v78 = (_WORD *)OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_20_1(v78);
        uint64_t v75 = "‼️ Gesture response is not for IFGestureBasedCandidateMessage";
        goto LABEL_32;
      }
      sub_25C87D938((uint64_t)v22, (uint64_t *)&unk_26A5D8CA0);
      sub_25C87D938(v56, (uint64_t *)&unk_26A5D8CA0);
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v62, v58);
    }
    sub_25C87D938(v59, &qword_26A5D8C98);
    goto LABEL_28;
  }
  sub_25C87D938(v0, &qword_26A5D8C88);
  if (qword_26B355558 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_25C892400();
  uint64_t v42 = (void *)OUTLINED_FUNCTION_15_0(v41, (uint64_t)qword_26B355760);
  os_log_type_t v43 = sub_25C8925A0();
  if (OUTLINED_FUNCTION_7_1(v43))
  {
    uint64_t v44 = (_WORD *)OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_20_1(v44);
    OUTLINED_FUNCTION_5_1(&dword_25C872000, v45, v46, "No pending gesture response to create RC");
    OUTLINED_FUNCTION_8();
  }

LABEL_41:
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_25C88D7E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8CC0);
  uint64_t v4 = OUTLINED_FUNCTION_15(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8CC8);
  uint64_t v8 = OUTLINED_FUNCTION_15(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_7();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = (char *)a2 + *(int *)(type metadata accessor for GestureResponse(0) + 24);
  uint64_t v13 = sub_25C8921C0();
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  __swift_storeEnumTagSinglePayload(v11, 0, 1, v13);
  MEMORY[0x261195AD0](v11);
  uint64_t v15 = *a2;
  if (v15 == 2)
  {
    uint64_t v16 = (unsigned int *)MEMORY[0x263F70BE0];
  }
  else if (v15 == 1)
  {
    uint64_t v16 = (unsigned int *)MEMORY[0x263F70BD8];
  }
  else
  {
    uint64_t v16 = (unsigned int *)MEMORY[0x263F70BE8];
  }
  uint64_t v17 = *v16;
  uint64_t v18 = sub_25C892230();
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v6, v17, v18);
  sub_25C892230();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v18);
  sub_25C8921F0();
  sub_25C87C348();
  return sub_25C892200();
}

uint64_t sub_25C88D99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  v32[1] = a4;
  v32[2] = a3;
  v32[0] = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3555A8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v33 = (uint64_t)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C90);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25C891AE0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8C78);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *MEMORY[0x263F709F0];
  uint64_t v25 = sub_25C8920C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v23, v24, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  sub_25C891EB0();
  uint64_t v26 = v32[0];
  swift_bridgeObjectRetain();
  sub_25C891EA0();
  uint64_t v27 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
  swift_beginAccess();
  sub_25C88A118(v27, (uint64_t)v20, &qword_26B3554E0);
  sub_25C891EF0();
  swift_bridgeObjectRetain();
  sub_25C891EE0();
  sub_25C891AD0();
  sub_25C891AC0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_25C891E80();
  uint64_t v28 = sub_25C892210();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v13, v34, v28);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v28);
  sub_25C891ED0();
  uint64_t v29 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
  swift_beginAccess();
  sub_25C88A118(v29, v33, &qword_26B3555A8);
  sub_25C891EC0();
  uint64_t v30 = sub_25C892190();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v8, v35, v30);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v30);
  return sub_25C891E90();
}

uint64_t sub_25C88DE0C(uint64_t a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  uint64_t v5 = OUTLINED_FUNCTION_15(v4);
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_17_1();
  uint64_t v6 = type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_30_0(v6);
  OUTLINED_FUNCTION_19_1();
  sub_25C88E89C(v2, a1);
  swift_endAccess();
  uint64_t v7 = (void *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRequestId);
  *uint64_t v7 = 0;
  v7[1] = 0;
  return swift_bridgeObjectRelease();
}

void sub_25C88DEB4()
{
  id v0 = objc_allocWithZone((Class)sub_25C891CE0());
  uint64_t v1 = sub_25C891CD0();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    if (qword_26B355230 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25C892400();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B355748);
    uint64_t v4 = v2;
    uint64_t v5 = (void *)sub_25C8923F0();
    os_log_type_t v6 = sub_25C892590();
    if (OUTLINED_FUNCTION_4_1(v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315394;
      swift_getObjectType();
      uint64_t v8 = sub_25C8927C0();
      sub_25C8773AC(v8, v9, &v19);
      OUTLINED_FUNCTION_28_1();

      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      id v10 = [v4 debugDescription];
      uint64_t v11 = sub_25C892500();
      unint64_t v13 = v12;

      sub_25C8773AC(v11, v13, &v19);
      OUTLINED_FUNCTION_28_1();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_25_2(&dword_25C872000, v14, v15, "Posting %s: %s");
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    OUTLINED_FUNCTION_16_2(OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  }
  else
  {
    if (qword_26B355230 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_25C892400();
    uint64_t v4 = OUTLINED_FUNCTION_15_0(v16, (uint64_t)qword_26B355748);
    os_log_type_t v17 = sub_25C8925B0();
    if (os_log_type_enabled(v4, v17))
    {
      uint64_t v18 = (uint8_t *)OUTLINED_FUNCTION_38();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_25C872000, v4, v17, "‼️ ResultSelectedMessage could not be created.", v18, 2u);
      OUTLINED_FUNCTION_8();
    }
  }
}

uint64_t sub_25C88E180()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8C78);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C891E30();
  sub_25C891D10();
  sub_25C8920B0();
  sub_25C891CF0();
  sub_25C892090();
  uint64_t v6 = sub_25C891AE0();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  sub_25C891D40();
  sub_25C892080();
  sub_25C891D30();
  sub_25C891D00();
  uint64_t v7 = *MEMORY[0x263F709F0];
  uint64_t v8 = sub_25C8920C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v2, v7, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v8);
  return sub_25C891D20();
}

uint64_t sub_25C88E320(void *a1)
{
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25C892400();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B355748);
  id v3 = a1;
  uint64_t v4 = (void *)sub_25C8923F0();
  os_log_type_t v5 = sub_25C892590();
  if (OUTLINED_FUNCTION_4_1(v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_getObjectType();
    uint64_t v7 = sub_25C8927C0();
    sub_25C8773AC(v7, v8, &v16);
    OUTLINED_FUNCTION_28_1();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    id v9 = objc_msgSend(v3, sel_debugDescription);
    uint64_t v10 = sub_25C892500();
    unint64_t v12 = v11;

    sub_25C8773AC(v10, v12, &v16);
    OUTLINED_FUNCTION_28_1();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_2(&dword_25C872000, v13, v14, "Posting %s: %s");
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  return OUTLINED_FUNCTION_16_2(OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
}

uint64_t sub_25C88E518()
{
  sub_25C87D938(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId, &qword_26B3554E0);
  swift_bridgeObjectRelease();
  sub_25C87D938(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId, &qword_26B3555A8);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  swift_unknownObjectRelease();
  sub_25C87D938(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureResponse, &qword_26A5D8C88);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25C88E5C0()
{
  sub_25C88E518();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25C88E618()
{
  return type metadata accessor for GestureOutputSubmitter();
}

uint64_t type metadata accessor for GestureOutputSubmitter()
{
  uint64_t result = qword_26B355518;
  if (!qword_26B355518) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25C88E668()
{
  sub_25C88E7DC(319, &qword_26B3554E8, MEMORY[0x263F07508]);
  if (v0 <= 0x3F)
  {
    sub_25C88E7DC(319, &qword_26B3555B0, MEMORY[0x263F70DF8]);
    if (v1 <= 0x3F)
    {
      sub_25C88E7DC(319, (unint64_t *)&unk_26A5D8C68, (void (*)(uint64_t))type metadata accessor for GestureResponse);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_25C88E7DC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25C892650();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_25C88E830()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8CE0);
  swift_arrayDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25C88E894()
{
  return sub_25C88E180();
}

uint64_t sub_25C88E89C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C88E904(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GestureResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C88E968(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GestureResponse(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C88E9C4(uint64_t a1)
{
  return sub_25C88EA60(a1, sub_25C88D99C);
}

unint64_t sub_25C88E9DC()
{
  unint64_t result = qword_26A5D8CB0;
  if (!qword_26A5D8CB0)
  {
    sub_25C892220();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8CB0);
  }
  return result;
}

uint64_t sub_25C88EA2C(uint64_t a1)
{
  return sub_25C88D7E0(a1, *(uint64_t **)(v1 + 16));
}

uint64_t sub_25C88EA48(uint64_t a1)
{
  return sub_25C88EA60(a1, sub_25C88C9B8);
}

uint64_t sub_25C88EA60(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

unint64_t sub_25C88EA78()
{
  unint64_t result = qword_26A5D8CD0;
  if (!qword_26A5D8CD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5D8CD0);
  }
  return result;
}

uint64_t sub_25C88EAB8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_aceId);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25C892500();

  return v3;
}

uint64_t sub_25C88EB28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GestureResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C88EB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_16_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v2 + a1 + 24);
  uint64_t v4 = *(void *)(v2 + a1 + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + a1), v3);
  return MEMORY[0x270F69848](v1, v3, v4);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_25C88CED8(v0);
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return type metadata accessor for GestureResponse(0);
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_25_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_25C892660();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_arrayDestroy();
}

uint64_t sub_25C88EDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  uint64_t v53 = a7;
  uint64_t v54 = a8;
  uint64_t v51 = a5;
  uint64_t v52 = a6;
  uint64_t v48 = a2;
  uint64_t v49 = a4;
  uint64_t v55 = a3;
  uint64_t v47 = a1;
  uint64_t v40 = a13;
  uint64_t v41 = a12;
  uint64_t v45 = a10;
  uint64_t v43 = a11;
  uint64_t v44 = a9;
  uint64_t v50 = sub_25C891AE0();
  OUTLINED_FUNCTION_4();
  uint64_t v46 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_18();
  uint64_t v42 = v16;
  uint64_t v17 = sub_25C892400();
  OUTLINED_FUNCTION_4();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = qword_26B355800;
  uint64_t v24 = qword_26B355230;
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = v13 + v23;
  __swift_project_value_buffer(v17, (uint64_t)qword_26B355748);
  uint64_t v26 = *(void (**)(void))(v19 + 16);
  OUTLINED_FUNCTION_19_2();
  v26();
  sub_25C892470();
  uint64_t v27 = (int *)type metadata accessor for EventDeduper(0);
  uint64_t v28 = (void *)(v13 + v23 + v27[6]);
  *uint64_t v28 = 1953066569;
  v28[1] = 0xE400000000000000;
  uint64_t v29 = v13 + v23 + v27[7];
  OUTLINED_FUNCTION_19_2();
  v26();
  *(void *)(v25 + v27[5]) = 1000000;
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 40))(v29, v22, v17);
  uint64_t v30 = (void *)(v13 + qword_26B3555B8);
  uint64_t v32 = v40;
  uint64_t v31 = v41;
  *uint64_t v30 = v41;
  v30[1] = v32;
  id v33 = v31;
  swift_release();
  uint64_t v34 = v46;
  uint64_t v35 = v55;
  uint64_t v36 = v50;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v42, v55, v50);
  uint64_t v37 = v54;
  sub_25C8774DC(v54, (uint64_t)v56);
  uint64_t v38 = sub_25C892320();

  __swift_destroy_boxed_opaque_existential_1Tm(v37);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
  return v38;
}

uint64_t sub_25C88F090(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3554E0);
  uint64_t v3 = OUTLINED_FUNCTION_15(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_18();
  uint64_t v115 = v4;
  uint64_t v129 = sub_25C8921A0();
  OUTLINED_FUNCTION_4();
  uint64_t v121 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_18();
  uint64_t v114 = v7;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8CF0);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_18();
  uint64_t v124 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8BC0);
  uint64_t v11 = OUTLINED_FUNCTION_15(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_9();
  uint64_t v116 = v12;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v13);
  uint64_t v122 = (uint64_t)&v108 - v14;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v108 - v16;
  uint64_t v130 = sub_25C892220();
  OUTLINED_FUNCTION_4();
  uint64_t v128 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_18();
  uint64_t v117 = v20;
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8C98);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5D8CA0);
  uint64_t v25 = OUTLINED_FUNCTION_15(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_9();
  uint64_t v123 = v26;
  OUTLINED_FUNCTION_11_0();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v108 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v108 - v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B355210);
  uint64_t v34 = OUTLINED_FUNCTION_15(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_9();
  uint64_t v113 = v35;
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v36);
  uint64_t v119 = (uint64_t)&v108 - v37;
  OUTLINED_FUNCTION_11_0();
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  uint64_t v41 = (char *)&v108 - v40;
  MEMORY[0x270FA5388](v39);
  uint64_t v125 = (uint64_t)&v108 - v42;
  OUTLINED_FUNCTION_11_0();
  uint64_t v44 = MEMORY[0x270FA5388](v43);
  uint64_t v46 = (char *)&v108 - v45;
  MEMORY[0x270FA5388](v44);
  uint64_t v48 = (char *)&v108 - v47;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_25C892400();
  __swift_project_value_buffer(v49, (uint64_t)qword_26B355748);
  id v50 = a1;
  uint64_t v51 = sub_25C8923F0();
  os_log_type_t v52 = sub_25C8925A0();
  int v53 = v52;
  BOOL v54 = os_log_type_enabled(v51, v52);
  uint64_t v131 = v41;
  uint64_t v127 = v30;
  if (v54)
  {
    uint64_t v55 = OUTLINED_FUNCTION_3_0();
    int v110 = v53;
    uint64_t v56 = (uint8_t *)v55;
    uint64_t v111 = OUTLINED_FUNCTION_22();
    v134[0] = v111;
    uint64_t v120 = v32;
    uint64_t v109 = v56;
    *(_DWORD *)uint64_t v56 = 136315138;
    id v57 = objc_msgSend(v50, sel_debugDescription, v56 + 4);
    uint64_t v58 = v17;
    id v59 = v57;
    uint64_t v60 = v51;
    uint64_t v61 = v46;
    uint64_t v62 = v23;
    char v63 = v48;
    uint64_t v64 = sub_25C892500();
    unint64_t v66 = v65;

    uint64_t v17 = v58;
    uint64_t v67 = v64;
    uint64_t v48 = v63;
    uint64_t v23 = v62;
    uint64_t v46 = v61;
    uint64_t v133 = sub_25C8773AC(v67, v66, v134);
    uint64_t v32 = v120;
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v60, (os_log_type_t)v110, "❓ Handling SiriWillPromptMessage: %s", v109, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  sub_25C8920D0();
  uint64_t v68 = sub_25C892190();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v48, 1, v68);
  sub_25C891008((uint64_t)v48, (uint64_t)v46, (uint64_t *)&unk_26B355210);
  uint64_t v70 = v130;
  if (EnumTagSinglePayload == 1)
  {
    os_log_type_t v71 = (uint64_t *)&unk_26B355210;
    uint64_t v72 = (uint64_t)v46;
LABEL_20:
    sub_25C891068(v72, v71);
    uint64_t v79 = (uint64_t)v131;
    sub_25C891008((uint64_t)v48, (uint64_t)v131, (uint64_t *)&unk_26B355210);
LABEL_21:
    uint64_t v82 = (uint64_t *)&unk_26B355210;
    uint64_t v83 = v79;
LABEL_22:
    sub_25C891068(v83, v82);
LABEL_23:
    swift_beginAccess();
    sub_25C87CA04();
    char v85 = v84;
    swift_endAccess();
    if ((v85 & 1) != 0 && *(void *)(v132 + qword_26B3555B8)) {
      sub_25C880F9C();
    }
    return sub_25C891068((uint64_t)v48, (uint64_t *)&unk_26B355210);
  }
  uint64_t v73 = v125;
  sub_25C891008((uint64_t)v46, v125, (uint64_t *)&unk_26B355210);
  OUTLINED_FUNCTION_11_3();
  uint64_t v112 = v46;
  if (v81)
  {
    sub_25C891068(v73, (uint64_t *)&unk_26B355210);
    __swift_storeEnumTagSinglePayload((uint64_t)v32, 1, 1, v70);
  }
  else
  {
    sub_25C892130();
    OUTLINED_FUNCTION_10_1();
    uint64_t v74 = OUTLINED_FUNCTION_13_1();
    v75(v74);
  }
  uint64_t v77 = (uint64_t)v127;
  uint64_t v76 = v128;
  (*(void (**)(char *, void, uint64_t))(v128 + 104))(v127, *MEMORY[0x263F70BC0], v70);
  __swift_storeEnumTagSinglePayload(v77, 0, 1, v70);
  uint64_t v78 = (uint64_t)&v23[*(int *)(v126 + 48)];
  sub_25C891008((uint64_t)v32, (uint64_t)v23, (uint64_t *)&unk_26A5D8CA0);
  sub_25C891008(v77, v78, (uint64_t *)&unk_26A5D8CA0);
  OUTLINED_FUNCTION_15_2((uint64_t)v23);
  if (v81)
  {
    sub_25C891068(v77, (uint64_t *)&unk_26A5D8CA0);
    sub_25C891068((uint64_t)v32, (uint64_t *)&unk_26A5D8CA0);
    sub_25C891068((uint64_t)v112, (uint64_t *)&unk_26B355210);
    OUTLINED_FUNCTION_15_2(v78);
    if (v81)
    {
      sub_25C891068((uint64_t)v23, (uint64_t *)&unk_26A5D8CA0);
      uint64_t v79 = (uint64_t)v131;
      sub_25C891008((uint64_t)v48, (uint64_t)v131, (uint64_t *)&unk_26B355210);
      goto LABEL_28;
    }
LABEL_19:
    os_log_type_t v71 = &qword_26A5D8C98;
    uint64_t v72 = (uint64_t)v23;
    goto LABEL_20;
  }
  uint64_t v80 = v123;
  sub_25C891008((uint64_t)v23, v123, (uint64_t *)&unk_26A5D8CA0);
  OUTLINED_FUNCTION_15_2(v78);
  if (v81)
  {
    sub_25C891068(v77, (uint64_t *)&unk_26A5D8CA0);
    sub_25C891068((uint64_t)v32, (uint64_t *)&unk_26A5D8CA0);
    sub_25C891068((uint64_t)v112, (uint64_t *)&unk_26B355210);
    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v80, v70);
    goto LABEL_19;
  }
  uint64_t v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 32);
  uint64_t v120 = v32;
  uint64_t v88 = v117;
  v87(v117, v78, v70);
  sub_25C8910C0((unint64_t *)&qword_26A5D8CB0, MEMORY[0x263F70BC8]);
  LODWORD(v128) = sub_25C8924E0();
  uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
  v89(v88, v70);
  sub_25C891068(v77, (uint64_t *)&unk_26A5D8CA0);
  sub_25C891068((uint64_t)v120, (uint64_t *)&unk_26A5D8CA0);
  sub_25C891068((uint64_t)v112, (uint64_t *)&unk_26B355210);
  v89(v123, v70);
  sub_25C891068((uint64_t)v23, (uint64_t *)&unk_26A5D8CA0);
  uint64_t v79 = (uint64_t)v131;
  sub_25C891008((uint64_t)v48, (uint64_t)v131, (uint64_t *)&unk_26B355210);
  if ((v128 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_28:
  uint64_t v90 = v119;
  sub_25C891008(v79, v119, (uint64_t *)&unk_26B355210);
  OUTLINED_FUNCTION_11_3();
  if (v81)
  {
    sub_25C891068(v90, (uint64_t *)&unk_26B355210);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v129);
  }
  else
  {
    sub_25C892110();
    OUTLINED_FUNCTION_10_1();
    uint64_t v91 = OUTLINED_FUNCTION_13_1();
    v92(v91);
  }
  uint64_t v93 = v118;
  uint64_t v94 = v122;
  uint64_t v95 = v129;
  (*(void (**)(uint64_t, void, uint64_t))(v121 + 104))(v122, *MEMORY[0x263F70A10], v129);
  __swift_storeEnumTagSinglePayload(v94, 0, 1, v95);
  uint64_t v96 = v124;
  uint64_t v97 = v124 + *(int *)(v93 + 48);
  sub_25C891008((uint64_t)v17, v124, (uint64_t *)&unk_26A5D8BC0);
  sub_25C891008(v94, v97, (uint64_t *)&unk_26A5D8BC0);
  if (__swift_getEnumTagSinglePayload(v96, 1, v95) == 1)
  {
    sub_25C891068(v122, (uint64_t *)&unk_26A5D8BC0);
    sub_25C891068((uint64_t)v17, (uint64_t *)&unk_26A5D8BC0);
    sub_25C891068((uint64_t)v131, (uint64_t *)&unk_26B355210);
    if (__swift_getEnumTagSinglePayload(v97, 1, v129) == 1)
    {
      sub_25C891068(v124, (uint64_t *)&unk_26A5D8BC0);
      goto LABEL_38;
    }
LABEL_36:
    uint64_t v82 = &qword_26A5D8CF0;
    uint64_t v83 = v124;
    goto LABEL_22;
  }
  uint64_t v98 = v116;
  sub_25C891008(v124, v116, (uint64_t *)&unk_26A5D8BC0);
  if (__swift_getEnumTagSinglePayload(v97, 1, v129) == 1)
  {
    sub_25C891068(v122, (uint64_t *)&unk_26A5D8BC0);
    sub_25C891068((uint64_t)v17, (uint64_t *)&unk_26A5D8BC0);
    sub_25C891068((uint64_t)v131, (uint64_t *)&unk_26B355210);
    (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v98, v129);
    goto LABEL_36;
  }
  uint64_t v99 = v121;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v121 + 32))(v114, v97, v129);
  sub_25C8910C0(&qword_26A5D8CF8, MEMORY[0x263F70A18]);
  char v100 = sub_25C8924E0();
  uint64_t v101 = *(void (**)(void))(v99 + 8);
  OUTLINED_FUNCTION_65();
  v101();
  sub_25C891068(v122, (uint64_t *)&unk_26A5D8BC0);
  sub_25C891068((uint64_t)v17, (uint64_t *)&unk_26A5D8BC0);
  sub_25C891068((uint64_t)v131, (uint64_t *)&unk_26B355210);
  OUTLINED_FUNCTION_65();
  v101();
  sub_25C891068(v124, (uint64_t *)&unk_26A5D8BC0);
  if ((v100 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_38:
  if (*(void *)(v132 + qword_26B3555B8))
  {
    sub_25C880F9C();
    uint64_t v102 = v113;
    sub_25C891008((uint64_t)v48, v113, (uint64_t *)&unk_26B355210);
    OUTLINED_FUNCTION_11_3();
    if (v81)
    {
      sub_25C891068(v102, (uint64_t *)&unk_26B355210);
      uint64_t v105 = 1;
    }
    else
    {
      sub_25C892140();
      OUTLINED_FUNCTION_10_1();
      uint64_t v103 = OUTLINED_FUNCTION_13_1();
      v104(v103);
      uint64_t v105 = 0;
    }
    uint64_t v106 = sub_25C891AE0();
    uint64_t v107 = v115;
    __swift_storeEnumTagSinglePayload(v115, v105, 1, v106);
    sub_25C885380(v107);
    sub_25C891068(v107, &qword_26B3554E0);
  }
  return sub_25C891068((uint64_t)v48, (uint64_t *)&unk_26B355210);
}

void sub_25C88FD70(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C892400();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B355748);
  id v5 = a1;
  uint64_t v6 = sub_25C8923F0();
  os_log_type_t v7 = sub_25C8925A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v15[0] = OUTLINED_FUNCTION_22();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = objc_msgSend(v5, sel_debugDescription);
    uint64_t v10 = sub_25C892500();
    unint64_t v12 = v11;

    sub_25C8773AC(v10, v12, v15);
    OUTLINED_FUNCTION_19();
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v6, v7, "❓ Handling SiriWillAskForConfirmationMessage: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  swift_beginAccess();
  sub_25C87CA04();
  char v14 = v13;
  swift_endAccess();
  if (v14)
  {
    if (*(void *)(v2 + qword_26B3555B8)) {
      sub_25C880F9C();
    }
  }
}

void sub_25C88FF80(void *a1)
{
}

void sub_25C88FF8C(void *a1)
{
}

void sub_25C88FF98(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25C892260();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v34 - v11;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25C892400();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B355748);
  id v14 = a1;
  uint64_t v15 = sub_25C8923F0();
  os_log_type_t v16 = sub_25C8925A0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    uint64_t v37 = OUTLINED_FUNCTION_22();
    v41[0] = v37;
    uint64_t v38 = v12;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v35 = v17 + 4;
    uint64_t v36 = v17;
    id v18 = objc_msgSend(v14, sel_debugDescription);
    uint64_t v19 = v4;
    uint64_t v20 = v2;
    uint64_t v21 = sub_25C892500();
    uint64_t v39 = v10;
    unint64_t v23 = v22;

    uint64_t v24 = v21;
    uint64_t v2 = v20;
    uint64_t v4 = v19;
    uint64_t v40 = sub_25C8773AC(v24, v23, v41);
    unint64_t v12 = v38;
    sub_25C892660();

    uint64_t v10 = v39;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v15, v16, "Handling StoppedListeningForSpeechContinuationMessage: %s", v36, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  sub_25C892030();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v10, *MEMORY[0x263F70DC8], v4);
  char v25 = sub_25C87A644((uint64_t)v12, (uint64_t)v10);
  uint64_t v26 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_65();
  v26();
  OUTLINED_FUNCTION_65();
  v26();
  if (v25)
  {
    if (*(void *)(v2 + qword_26B3555B8)) {
      sub_25C87FD50(2, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)v35, (uint64_t)v36, v37, (uint64_t)v38, (uint64_t)v39, v40, v41[0], v41[1], v41[2], v41[3],
    }
        v41[4],
        v41[5],
        v41[6]);
  }
}

void sub_25C89026C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C892400();
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26B355748);
  id v6 = a1;
  uint64_t v34 = v5;
  uint64_t v7 = sub_25C8923F0();
  os_log_type_t v8 = sub_25C8925A0();
  uint64_t v9 = sub_25C892000;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    uint64_t v37 = (void *)OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_18_3(4.8149e-34);
    uint64_t v11 = v2;
    id v12 = objc_msgSend(v6, sel_debugDescription);
    uint64_t v13 = sub_25C892500();
    unint64_t v15 = v14;

    uint64_t v2 = v11;
    uint64_t v9 = sub_25C892000;
    uint64_t v36 = sub_25C8773AC(v13, v15, (uint64_t *)&v37);
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v7, v8, "Handling TRPCandidateRequestMessage: %s", v10, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  uint64_t v16 = sub_25C891DE0();
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v18 = v16 + 32;
    while (1)
    {
      sub_25C891008(v18, (uint64_t)&v37, (uint64_t *)&unk_26B355698);
      uint64_t v19 = v37;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
      if (objc_msgSend(v19, sel_speechEvent)) {
        break;
      }

      v18 += 48;
      if (!--v17) {
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    id v20 = v19;
    uint64_t v21 = sub_25C8923F0();
    os_log_type_t v22 = sub_25C8925A0();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = OUTLINED_FUNCTION_22();
      *(_DWORD *)unint64_t v23 = *((void *)v9 + 449);
      objc_msgSend(v20, sel_speechEvent);
      type metadata accessor for AFSpeechEvent(0);
      uint64_t v24 = sub_25C892510();
      uint64_t v35 = sub_25C8773AC(v24, v25, &v36);
      sub_25C892660();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C872000, v21, v22, "TCUPackage with speech event %s received, assuming that user replied with speech", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    if (*(void *)(v2 + qword_26B3555B8)) {
      sub_25C87FD50(2, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v37, v38[0], v38[1], v38[2], v38[3], v38[4], v38[5],
    }
        v38[6],
        v38[7],
        v38[8]);
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
  }
}

void sub_25C8905DC(void *a1)
{
}

void sub_25C8905E8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C892400();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B355748);
  id v5 = a1;
  id v6 = sub_25C8923F0();
  os_log_type_t v7 = sub_25C8925A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v24 = v1;
    os_log_type_t v8 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v26[0] = OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_18_3(4.8149e-34);
    id v9 = objc_msgSend(v5, sel_debugDescription);
    uint64_t v10 = sub_25C892500();
    unint64_t v12 = v11;

    sub_25C8773AC(v10, v12, v26);
    OUTLINED_FUNCTION_19();
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v6, v7, "Handling NLResultCandidateMessage: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    uint64_t v2 = v1;
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  if ((AFDeviceSupportsMedoc() & 1) == 0)
  {
    uint64_t v13 = sub_25C8923F0();
    os_log_type_t v14 = sub_25C8925A0();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_25C872000, v13, v14, "Device doesn't support Medoc, assuming the NLResultCandidateMessage is for an LAS speech request", v15, 2u);
      OUTLINED_FUNCTION_8();
    }

    if (*(void *)(v2 + qword_26B3555B8)) {
      sub_25C87FD50(2, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26[0], v26[1], v26[2], v26[3], v26[4], v26[5], v26[6], v26[7],
    }
        v26[8],
        v26[9],
        v26[10]);
  }
  OUTLINED_FUNCTION_17_0();
}

void sub_25C890804(void *a1)
{
}

void sub_25C890810(void *a1)
{
}

void sub_25C89081C(void *a1)
{
}

void sub_25C890828(void *a1)
{
}

void sub_25C890834(void *a1)
{
}

void sub_25C890840(void *a1)
{
}

void sub_25C89084C(void *a1)
{
}

void sub_25C890858(void *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = v3;
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25C892400();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B355748);
  id v9 = a1;
  uint64_t v10 = sub_25C8923F0();
  os_log_type_t v11 = sub_25C8925A0();
  if (os_log_type_enabled(v10, v11))
  {
    HIDWORD(v27) = a3;
    unint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v29[0] = OUTLINED_FUNCTION_22();
    *(_DWORD *)unint64_t v12 = 136315138;
    uint64_t v25 = (uint64_t)(v12 + 4);
    id v13 = objc_msgSend(v9, sel_debugDescription);
    format = a2;
    uint64_t v14 = sub_25C892500();
    unint64_t v16 = v15;

    a3 = HIDWORD(v27);
    uint64_t v28 = sub_25C8773AC(v14, v16, v29);
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v10, v11, format, v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  if (*(void *)(v6 + qword_26B3555B8)) {
    sub_25C87FD50(a3, v17, v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)format, v27, v28, v29[0], v29[1], v29[2], v29[3], v29[4], v29[5],
  }
      v29[6],
      v29[7],
      v29[8]);
}

void sub_25C890A38(void *a1)
{
}

void sub_25C890A44(void *a1)
{
}

void sub_25C890A50(void *a1)
{
}

void sub_25C890A5C(void *a1)
{
}

void sub_25C890A68(void *a1)
{
}

void sub_25C890A74(void *a1)
{
}

void sub_25C890A80(void *a1)
{
}

void sub_25C890A8C(void *a1)
{
}

void sub_25C890A98(void *a1)
{
}

void sub_25C890AA4(void *a1)
{
}

void sub_25C890AB0(void *a1)
{
}

void sub_25C890ABC(void *a1)
{
}

void sub_25C890AC8(void *a1)
{
}

void sub_25C890AD4(void *a1, const char *a2)
{
  if (qword_26B355230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25C892400();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B355748);
  id v14 = a1;
  id v5 = sub_25C8923F0();
  os_log_type_t v6 = sub_25C8925A0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = OUTLINED_FUNCTION_22();
    *(_DWORD *)os_log_type_t v7 = 136315138;
    id v8 = objc_msgSend(v14, sel_debugDescription);
    uint64_t v9 = sub_25C892500();
    unint64_t v11 = v10;

    sub_25C8773AC(v9, v11, &v15);
    OUTLINED_FUNCTION_19();
    sub_25C892660();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C872000, v5, v6, a2, v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();

    OUTLINED_FUNCTION_17_0();
  }
  else
  {

    OUTLINED_FUNCTION_17_0();
  }
}

void GestureRequestProcessor.__allocating_init(_:_:_:_:_:_:)()
{
}

void GestureRequestProcessor.init(_:_:_:_:_:_:)()
{
}

void GestureRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
}

void GestureRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
}

void GestureRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
}

void GestureRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
}

uint64_t sub_25C890DC4()
{
  uint64_t v1 = v0 + qword_26B355800;

  return sub_25C890E4C(v1);
}

uint64_t GestureRequestProcessor.deinit()
{
  uint64_t v0 = sub_25C892330();

  sub_25C890E4C(v0 + qword_26B355800);
  return v0;
}

uint64_t sub_25C890E4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventDeduper(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t GestureRequestProcessor.__deallocating_deinit()
{
  uint64_t v0 = GestureRequestProcessor.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for GestureRequestProcessor()
{
  uint64_t result = qword_26B355528;
  if (!qword_26B355528) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C890F44()
{
  uint64_t result = type metadata accessor for EventDeduper(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GestureRequestProcessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GestureRequestProcessor);
}

uint64_t sub_25C891000()
{
  return type metadata accessor for GestureRequestProcessor();
}

uint64_t sub_25C891008(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_10_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25C891068(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_10_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_25C8910C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_4_2(void *a1, char *a2)
{
}

void OUTLINED_FUNCTION_5_2(void *a1, char *a2)
{
}

void OUTLINED_FUNCTION_6_1(void *a1, char *a2)
{
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_18_3(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t sub_25C8911C4(uint64_t a1)
{
  return sub_25C891214(a1, qword_26B355748);
}

uint64_t sub_25C8911F0(uint64_t a1)
{
  return sub_25C891214(a1, qword_26B355760);
}

uint64_t sub_25C891214(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25C892400();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_25C89198C();
  sub_25C892640();
  return sub_25C892410();
}

uint64_t sub_25C8912A4()
{
  uint64_t v0 = sub_25C892400();
  __swift_allocate_value_buffer(v0, qword_26B355818);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B355818);
  sub_25C89198C();
  sub_25C892640();
  return sub_25C892410();
}

void sub_25C89133C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    sub_25C89176C(a1, a2, a3, a5, a6);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, void, void, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
  }
}

void sub_25C8913BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unint64_t v12 = *(void (**)(uint64_t))(a10 + 8);
  uint64_t v13 = OUTLINED_FUNCTION_0_0();
  v12(v13);
  sub_25C8923C0();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_25C892610();
    uint64_t v17 = OUTLINED_FUNCTION_0_0();
    id v19 = (id)((uint64_t (*)(uint64_t))v12)(v17);
    OUTLINED_FUNCTION_2_1();
    sub_25C8923B0();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_25C892610();
    uint64_t v14 = OUTLINED_FUNCTION_0_0();
    uint64_t v15 = (void *)((uint64_t (*)(uint64_t))v12)(v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5D8D00);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25C893530;
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = sub_25C891868();
    *(void *)(v16 + 32) = a7;
    *(void *)(v16 + 40) = a8;
    OUTLINED_FUNCTION_2_1();
    sub_25C8923A0();

    swift_bridgeObjectRelease();
  }
}

void sub_25C891574()
{
}

void static SignpostLogger.end(_:_:)()
{
  sub_25C892600();
  uint64_t v0 = OUTLINED_FUNCTION_1_1();
  id v2 = (id)v1(v0);
  sub_25C8923B0();
}

uint64_t sub_25C89162C()
{
  return static SignpostLogger.event(_:)();
}

uint64_t static SignpostLogger.event(_:)()
{
  uint64_t v0 = sub_25C8923E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C892620();
  uint64_t v4 = OUTLINED_FUNCTION_1_1();
  os_log_type_t v6 = (void *)v5(v4);
  sub_25C8923D0();
  sub_25C8923B0();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_25C89176C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_25C8923C0();
  sub_25C892610();
  id v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_25C8923A0();
}

unint64_t sub_25C891868()
{
  unint64_t result = qword_26A5D8D08;
  if (!qword_26A5D8D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5D8D08);
  }
  return result;
}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
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

unint64_t sub_25C89198C()
{
  unint64_t result = qword_26B355590;
  if (!qword_26B355590)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B355590);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t sub_25C891A10()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25C891A20()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25C891A30()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25C891A40()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25C891A60()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25C891A70()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25C891A80()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25C891A90()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25C891AA0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25C891AB0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25C891AC0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25C891AD0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25C891AE0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25C891AF0()
{
  return MEMORY[0x270F66F40]();
}

uint64_t sub_25C891B00()
{
  return MEMORY[0x270F30A38]();
}

uint64_t sub_25C891B10()
{
  return MEMORY[0x270F30A40]();
}

uint64_t sub_25C891B20()
{
  return MEMORY[0x270F30A48]();
}

uint64_t sub_25C891B30()
{
  return MEMORY[0x270F30A50]();
}

uint64_t sub_25C891B40()
{
  return MEMORY[0x270F30A58]();
}

uint64_t sub_25C891B50()
{
  return MEMORY[0x270F30A60]();
}

uint64_t sub_25C891B60()
{
  return MEMORY[0x270F30A68]();
}

uint64_t sub_25C891B70()
{
  return MEMORY[0x270F30A70]();
}

uint64_t sub_25C891B80()
{
  return MEMORY[0x270F30A78]();
}

uint64_t sub_25C891B90()
{
  return MEMORY[0x270F30A80]();
}

uint64_t sub_25C891BA0()
{
  return MEMORY[0x270F30A88]();
}

uint64_t sub_25C891BB0()
{
  return MEMORY[0x270F30A90]();
}

uint64_t sub_25C891BC0()
{
  return MEMORY[0x270F30A98]();
}

uint64_t sub_25C891BD0()
{
  return MEMORY[0x270F30AA0]();
}

uint64_t sub_25C891BE0()
{
  return MEMORY[0x270F30AA8]();
}

uint64_t sub_25C891BF0()
{
  return MEMORY[0x270F30AB0]();
}

uint64_t sub_25C891C00()
{
  return MEMORY[0x270F6AB70]();
}

uint64_t sub_25C891C10()
{
  return MEMORY[0x270F6AB90]();
}

uint64_t sub_25C891C20()
{
  return MEMORY[0x270F6ABA0]();
}

uint64_t sub_25C891C30()
{
  return MEMORY[0x270F6ABA8]();
}

uint64_t sub_25C891C40()
{
  return MEMORY[0x270F6ABF0]();
}

uint64_t sub_25C891C50()
{
  return MEMORY[0x270F6AC08]();
}

uint64_t sub_25C891C60()
{
  return MEMORY[0x270F6AC68]();
}

uint64_t sub_25C891C70()
{
  return MEMORY[0x270F6ACA8]();
}

uint64_t sub_25C891C80()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_25C891C90()
{
  return MEMORY[0x270F68990]();
}

uint64_t sub_25C891CA0()
{
  return MEMORY[0x270F68A18]();
}

uint64_t sub_25C891CB0()
{
  return MEMORY[0x270F68A28]();
}

uint64_t sub_25C891CC0()
{
  return MEMORY[0x270F68AA0]();
}

uint64_t sub_25C891CD0()
{
  return MEMORY[0x270F68AA8]();
}

uint64_t sub_25C891CE0()
{
  return MEMORY[0x270F68AB0]();
}

uint64_t sub_25C891CF0()
{
  return MEMORY[0x270F68AB8]();
}

uint64_t sub_25C891D00()
{
  return MEMORY[0x270F68AC0]();
}

uint64_t sub_25C891D10()
{
  return MEMORY[0x270F68AC8]();
}

uint64_t sub_25C891D20()
{
  return MEMORY[0x270F68AD0]();
}

uint64_t sub_25C891D30()
{
  return MEMORY[0x270F68AD8]();
}

uint64_t sub_25C891D40()
{
  return MEMORY[0x270F68AE0]();
}

uint64_t sub_25C891D50()
{
  return MEMORY[0x270F68B00]();
}

uint64_t sub_25C891D60()
{
  return MEMORY[0x270F68B08]();
}

uint64_t sub_25C891D70()
{
  return MEMORY[0x270F68B10]();
}

uint64_t sub_25C891D80()
{
  return MEMORY[0x270F68B78]();
}

uint64_t sub_25C891D90()
{
  return MEMORY[0x270F68BC8]();
}

uint64_t sub_25C891DA0()
{
  return MEMORY[0x270F68D98]();
}

uint64_t sub_25C891DB0()
{
  return MEMORY[0x270F68F20]();
}

uint64_t sub_25C891DC0()
{
  return MEMORY[0x270F69080]();
}

uint64_t sub_25C891DD0()
{
  return MEMORY[0x270F690D0]();
}

uint64_t sub_25C891DE0()
{
  return MEMORY[0x270F69120]();
}

uint64_t sub_25C891DF0()
{
  return MEMORY[0x270F69168]();
}

uint64_t sub_25C891E00()
{
  return MEMORY[0x270F691E0]();
}

uint64_t sub_25C891E10()
{
  return MEMORY[0x270F69240]();
}

uint64_t sub_25C891E20()
{
  return MEMORY[0x270F69258]();
}

uint64_t sub_25C891E30()
{
  return MEMORY[0x270F692A0]();
}

uint64_t sub_25C891E40()
{
  return MEMORY[0x270F692C8]();
}

uint64_t sub_25C891E50()
{
  return MEMORY[0x270F692E8]();
}

uint64_t sub_25C891E60()
{
  return MEMORY[0x270F69388]();
}

uint64_t sub_25C891E70()
{
  return MEMORY[0x270F69390]();
}

uint64_t sub_25C891E80()
{
  return MEMORY[0x270F69398]();
}

uint64_t sub_25C891E90()
{
  return MEMORY[0x270F693A0]();
}

uint64_t sub_25C891EA0()
{
  return MEMORY[0x270F693A8]();
}

uint64_t sub_25C891EB0()
{
  return MEMORY[0x270F693B0]();
}

uint64_t sub_25C891EC0()
{
  return MEMORY[0x270F693B8]();
}

uint64_t sub_25C891ED0()
{
  return MEMORY[0x270F693C0]();
}

uint64_t sub_25C891EE0()
{
  return MEMORY[0x270F693C8]();
}

uint64_t sub_25C891EF0()
{
  return MEMORY[0x270F693D0]();
}

uint64_t sub_25C891F00()
{
  return MEMORY[0x270F693D8]();
}

uint64_t sub_25C891F10()
{
  return MEMORY[0x270F69430]();
}

uint64_t sub_25C891F20()
{
  return MEMORY[0x270F69450]();
}

uint64_t sub_25C891F30()
{
  return MEMORY[0x270F69460]();
}

uint64_t sub_25C891F40()
{
  return MEMORY[0x270F694C0]();
}

uint64_t sub_25C891F50()
{
  return MEMORY[0x270F694C8]();
}

uint64_t sub_25C891F60()
{
  return MEMORY[0x270F694D0]();
}

uint64_t sub_25C891F70()
{
  return MEMORY[0x270F694D8]();
}

uint64_t sub_25C891F80()
{
  return MEMORY[0x270F694E0]();
}

uint64_t sub_25C891F90()
{
  return MEMORY[0x270F694E8]();
}

uint64_t sub_25C891FA0()
{
  return MEMORY[0x270F694F0]();
}

uint64_t sub_25C891FB0()
{
  return MEMORY[0x270F694F8]();
}

uint64_t sub_25C891FC0()
{
  return MEMORY[0x270F69500]();
}

uint64_t sub_25C891FD0()
{
  return MEMORY[0x270F69510]();
}

uint64_t sub_25C891FE0()
{
  return MEMORY[0x270F69538]();
}

uint64_t sub_25C891FF0()
{
  return MEMORY[0x270F69680]();
}

uint64_t sub_25C892000()
{
  return MEMORY[0x270F696E8]();
}

uint64_t sub_25C892010()
{
  return MEMORY[0x270F69708]();
}

uint64_t sub_25C892020()
{
  return MEMORY[0x270F69710]();
}

uint64_t sub_25C892030()
{
  return MEMORY[0x270F69730]();
}

uint64_t sub_25C892040()
{
  return MEMORY[0x270F69768]();
}

uint64_t sub_25C892050()
{
  return MEMORY[0x270F697A0]();
}

uint64_t sub_25C892060()
{
  return MEMORY[0x270F697A8]();
}

uint64_t sub_25C892070()
{
  return MEMORY[0x270F697B0]();
}

uint64_t sub_25C892080()
{
  return MEMORY[0x270F69820]();
}

uint64_t sub_25C892090()
{
  return MEMORY[0x270F69840]();
}

uint64_t sub_25C8920B0()
{
  return MEMORY[0x270F69850]();
}

uint64_t sub_25C8920C0()
{
  return MEMORY[0x270F69860]();
}

uint64_t sub_25C8920D0()
{
  return MEMORY[0x270F69868]();
}

uint64_t sub_25C8920E0()
{
  return MEMORY[0x270F69870]();
}

uint64_t sub_25C8920F0()
{
  return MEMORY[0x270F69878]();
}

uint64_t sub_25C892100()
{
  return MEMORY[0x270F69898]();
}

uint64_t sub_25C892110()
{
  return MEMORY[0x270F698A0]();
}

uint64_t sub_25C892120()
{
  return MEMORY[0x270F698A8]();
}

uint64_t sub_25C892130()
{
  return MEMORY[0x270F698B0]();
}

uint64_t sub_25C892140()
{
  return MEMORY[0x270F698B8]();
}

uint64_t sub_25C892150()
{
  return MEMORY[0x270F698C0]();
}

uint64_t sub_25C892160()
{
  return MEMORY[0x270F698C8]();
}

uint64_t sub_25C892170()
{
  return MEMORY[0x270F698D0]();
}

uint64_t sub_25C892180()
{
  return MEMORY[0x270F698D8]();
}

uint64_t sub_25C892190()
{
  return MEMORY[0x270F698E0]();
}

uint64_t sub_25C8921A0()
{
  return MEMORY[0x270F698E8]();
}

uint64_t sub_25C8921B0()
{
  return MEMORY[0x270F699B0]();
}

uint64_t sub_25C8921C0()
{
  return MEMORY[0x270F699B8]();
}

uint64_t sub_25C8921D0()
{
  return MEMORY[0x270F699C8]();
}

uint64_t sub_25C8921E0()
{
  return MEMORY[0x270F699D0]();
}

uint64_t sub_25C8921F0()
{
  return MEMORY[0x270F699D8]();
}

uint64_t sub_25C892200()
{
  return MEMORY[0x270F699E0]();
}

uint64_t sub_25C892210()
{
  return MEMORY[0x270F699E8]();
}

uint64_t sub_25C892220()
{
  return MEMORY[0x270F699F0]();
}

uint64_t sub_25C892230()
{
  return MEMORY[0x270F699F8]();
}

uint64_t sub_25C892240()
{
  return MEMORY[0x270F69B48]();
}

uint64_t sub_25C892250()
{
  return MEMORY[0x270F69B88]();
}

uint64_t sub_25C892260()
{
  return MEMORY[0x270F69B98]();
}

uint64_t sub_25C892270()
{
  return MEMORY[0x270F69BA0]();
}

uint64_t sub_25C892280()
{
  return MEMORY[0x270F69BC8]();
}

uint64_t sub_25C892290()
{
  return MEMORY[0x270F69BD8]();
}

uint64_t sub_25C8922A0()
{
  return MEMORY[0x270F69BE8]();
}

uint64_t sub_25C8922B0()
{
  return MEMORY[0x270F44CC0]();
}

uint64_t sub_25C8922C0()
{
  return MEMORY[0x270F66078]();
}

uint64_t sub_25C8922D0()
{
  return MEMORY[0x270F66098]();
}

uint64_t sub_25C8922F0()
{
  return MEMORY[0x270F70EF0]();
}

uint64_t sub_25C892300()
{
  return MEMORY[0x270F70F00]();
}

uint64_t sub_25C892310()
{
  return MEMORY[0x270F70F18]();
}

uint64_t sub_25C892320()
{
  return MEMORY[0x270F70F28]();
}

uint64_t sub_25C892330()
{
  return MEMORY[0x270F70F60]();
}

uint64_t sub_25C892340()
{
  return MEMORY[0x270F70FA8]();
}

uint64_t sub_25C892350()
{
  return MEMORY[0x270F70FE8]();
}

uint64_t sub_25C892360()
{
  return MEMORY[0x270F70FF0]();
}

uint64_t sub_25C892370()
{
  return MEMORY[0x270F70FF8]();
}

uint64_t sub_25C892380()
{
  return MEMORY[0x270F71008]();
}

uint64_t sub_25C892390()
{
  return MEMORY[0x270F71010]();
}

uint64_t sub_25C8923A0()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25C8923B0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25C8923C0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25C8923D0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_25C8923E0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25C8923F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C892400()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C892410()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25C892420()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25C892430()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25C892440()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_25C892450()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_25C892460()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25C892470()
{
  return MEMORY[0x270FA0A88]();
}

uint64_t sub_25C892480()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t sub_25C892490()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25C8924A0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25C8924B0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25C8924C0()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_25C8924D0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25C8924E0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C8924F0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25C892500()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25C892510()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C892520()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25C892530()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C892540()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C892550()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C892560()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25C892570()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C892580()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25C892590()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C8925A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C8925B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C8925C0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25C8925D0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25C8925E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25C8925F0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25C892600()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25C892610()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25C892620()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_25C892630()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25C892640()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25C892650()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25C892660()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C892670()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C892680()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25C892690()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25C8926B0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25C8926C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C8926D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C8926E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C8926F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25C892700()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C892710()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C892720()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C892730()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C892740()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C892750()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C892760()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25C892770()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25C892780()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C892790()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C8927A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C8927B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C8927C0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x270F0ECC8]();
}

uint64_t AFExternalNotificationRequestHandlerStateGetName()
{
  return MEMORY[0x270F0ED40]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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