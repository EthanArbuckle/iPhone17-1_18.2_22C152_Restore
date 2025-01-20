uint64_t sub_25E012784()
{
  uint64_t result;

  result = sub_25E019FD0();
  qword_26A6D3CB8 = result;
  return result;
}

uint64_t static ProtoVisualResponseProvider.setPatternId(_:forViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_26A6D3AA0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25E0165B8(a1, a2, a3, a4);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t static ProtoVisualResponseProvider.preWarm(using:)(void *a1)
{
  v41 = a1;
  sub_25E019F00();
  OUTLINED_FUNCTION_0();
  uint64_t v46 = v2;
  uint64_t v47 = v1;
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_11();
  uint64_t v45 = v3;
  OUTLINED_FUNCTION_16();
  sub_25E019F30();
  OUTLINED_FUNCTION_0();
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_11();
  uint64_t v42 = v6;
  OUTLINED_FUNCTION_16();
  uint64_t v39 = sub_25E019F10();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6();
  uint64_t v12 = v11 - v10;
  uint64_t v40 = sub_25E019EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v19 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_21();
  uint64_t v21 = v20;
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_26A6D3C88;
  sub_25E019EB0();
  sub_25E01A120();
  uint64_t v38 = v21;
  sub_25E019EA0();
  sub_25E016CBC(0, &qword_26A6D3AC0);
  uint64_t v23 = v39;
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v12, *MEMORY[0x263F8F068], v39);
  v24 = (void *)sub_25E01A100();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v23);
  uint64_t v25 = v40;
  OUTLINED_FUNCTION_4();
  v26();
  unint64_t v27 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v28 = swift_allocObject();
  v29 = v41;
  *(void *)(v28 + 16) = v41;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v28 + v27, v19, v25);
  aBlock[4] = sub_25E0166DC;
  aBlock[5] = v28;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E013508;
  aBlock[3] = &block_descriptor;
  v30 = _Block_copy(aBlock);
  id v31 = v29;
  uint64_t v32 = v42;
  sub_25E019F20();
  uint64_t v48 = MEMORY[0x263F8EE78];
  sub_25E016918(&qword_26A6D3AC8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AD0);
  sub_25E01677C();
  uint64_t v33 = v45;
  sub_25E01A1A0();
  MEMORY[0x2611CC440](0, v32, v33, v30);
  _Block_release(v30);

  OUTLINED_FUNCTION_8();
  v34();
  OUTLINED_FUNCTION_8();
  v35();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v38, v25);
  return swift_release();
}

uint64_t sub_25E012D38(void *a1, uint64_t a2)
{
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v2 = sub_25E019F00();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  MEMORY[0x270FA5388](v2);
  v36 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_25E019F30();
  uint64_t v35 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  v34 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_25E019EC0();
  uint64_t v5 = *(void *)(v31 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v31);
  uint64_t v7 = sub_25E019E70();
  uint64_t v40 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3BA8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25E01A800;
  uint64_t v45 = (void *)MEMORY[0x263F8D310];
  uint64_t v46 = (void (*)())MEMORY[0x263F772C0];
  uint64_t v42 = 2434083;
  unint64_t v43 = 0xE300000000000000;
  uint64_t v65 = 0;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v62 = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v56 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v53 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v11 = sub_25E019DF0();
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v50 = 0;
  uint64_t v12 = MEMORY[0x263F76E18];
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v12;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v10 + 32));
  sub_25E019DE0();
  sub_25E019E80();
  sub_25E016918(&qword_26A6D3AF0, MEMORY[0x263F77258]);
  uint64_t v41 = v7;
  uint64_t v13 = sub_25E019DC0();
  unint64_t v15 = v14;
  uint64_t v16 = v13;
  sub_25E016CBC(0, &qword_26A6D3AC0);
  uint64_t v30 = sub_25E01A0D0();
  uint64_t v17 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v31);
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = v16;
  *((void *)v19 + 3) = v15;
  uint64_t v20 = v16;
  uint64_t v21 = v32;
  *((void *)v19 + 4) = v32;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v19[v18], (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  uint64_t v46 = sub_25E01731C;
  uint64_t v47 = v19;
  uint64_t v42 = MEMORY[0x263EF8330];
  unint64_t v43 = 1107296256;
  uint64_t v44 = sub_25E013508;
  uint64_t v45 = &block_descriptor_37;
  id v22 = _Block_copy(&v42);
  sub_25E016818(v20, v15);
  id v23 = v21;
  swift_release();
  v24 = v34;
  sub_25E019F20();
  uint64_t v42 = MEMORY[0x263F8EE78];
  sub_25E016918(&qword_26A6D3AC8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AD0);
  sub_25E01677C();
  uint64_t v25 = v36;
  uint64_t v26 = v39;
  sub_25E01A1A0();
  unint64_t v27 = (void *)v30;
  MEMORY[0x2611CC440](0, v24, v25, v22);
  _Block_release(v22);

  sub_25E0168B0(v20, v15);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v9, v41);
}

void sub_25E0132F4(uint64_t a1, unint64_t a2, void *a3)
{
  id v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ProtoVisualResponseProvider()), sel_init);
  id v7 = (id)ProtoVisualResponseProvider.view(for:mode:overload:)(a1, a2, (void *)1);

  if (v7)
  {
    objc_msgSend(v7, sel_setHidden_, 1);
    objc_msgSend(a3, sel_addSubview_, v7);
    objc_msgSend(v7, sel_removeFromSuperview);
    sub_25E01A110();
    if (qword_26A6D3AB0 != -1) {
      swift_once();
    }
    sub_25E019EA0();
  }
}

id ProtoVisualResponseProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t ProtoVisualResponseProvider.view(for:mode:overload:)(uint64_t a1, unint64_t a2, void *a3)
{
  id v7 = off_26A6D3C38;
  uint64_t v8 = unk_26A6D3C40;
  int v9 = byte_26A6D3C48;
  id v10 = v3;
  sub_25E016818(a1, a2);
  return sub_25E017548((uint64_t)v7, v8, v9, v10, a1, a2, a3);
}

uint64_t sub_25E01350C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void ProtoVisualResponseProvider.viewController(for:mode:)()
{
  uint64_t v0 = sub_25E01A0A0();
  char v4 = 2;
  j__OUTLINED_FUNCTION_1_0(v0, 0, "SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 70, "viewController(for:mode:)", 25, v4);
  OUTLINED_FUNCTION_9((uint64_t)"Fatal error", v1, v2, v3, 0x800000025E01ABB0);
  __break(1u);
}

uint64_t ProtoVisualResponseProvider.responseView(for:mode:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AE0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = off_26A6D3C50;
  uint64_t v14 = unk_26A6D3C58;
  int v15 = byte_26A6D3C60;
  sub_25E016818(a2, a3);
  sub_25E017860((uint64_t)v13, v14, v15, a2, a3, a4, v12);
  if (!v4)
  {
    uint64_t v8 = *(void *)(v12 + *(int *)(v8 + 48));
    sub_25E019F50();
    OUTLINED_FUNCTION_10();
    (*(void (**)(uint64_t, uint64_t))(v16 + 32))(a1, v12);
  }
  return v8;
}

uint64_t ProtoVisualResponseProvider.view(for:mode:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return ProtoVisualResponseProvider.responseView(for:mode:)(a1, a2, a3, a4);
}

uint64_t sub_25E013810(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_25E019E70();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  v9();
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v11 + v10, (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  id v12 = a2;
  os_log_type_t v13 = sub_25E01A080();
  sub_25E018A64(v13, (uint64_t (*)(uint64_t))sub_25E017164, v11, 0, (uint64_t)"SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 124, (uint64_t)"responseView(for:mode:)", 23, 2u);
  return swift_release();
}

void ProtoVisualResponseProvider.viewController(for:mode:completion:)()
{
  uint64_t v0 = sub_25E01A0A0();
  char v4 = 2;
  j__OUTLINED_FUNCTION_1_0(v0, 0, "SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 134, "viewController(for:mode:completion:)", 36, v4);
  OUTLINED_FUNCTION_9((uint64_t)"Fatal error", v1, v2, v3, 0x800000025E01ABB0);
  __break(1u);
}

uint64_t ProtoVisualResponseProvider.responseView(for:mode:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25E019F00();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6();
  uint64_t v9 = v8 - v7;
  uint64_t v32 = sub_25E019F30();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_25E019F10();
  OUTLINED_FUNCTION_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_6();
  uint64_t v22 = v21 - v20;
  sub_25E016CBC(0, &qword_26A6D3AC0);
  (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v22, *MEMORY[0x263F8F068], v16);
  id v23 = (void *)sub_25E01A100();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  v24 = (void *)swift_allocObject();
  v24[2] = a1;
  v24[3] = a2;
  v24[4] = a3;
  v24[5] = a4;
  v24[6] = a5;
  aBlock[4] = sub_25E016908;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E013508;
  aBlock[3] = &block_descriptor_6;
  uint64_t v25 = _Block_copy(aBlock);
  sub_25E016818(a1, a2);
  swift_retain();
  sub_25E019F20();
  sub_25E016918(&qword_26A6D3AC8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AD0);
  sub_25E01677C();
  sub_25E01A1A0();
  MEMORY[0x2611CC440](0, v15, v9, v25);
  _Block_release(v25);

  OUTLINED_FUNCTION_8();
  v26();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v32);
  return swift_release();
}

uint64_t sub_25E013D40(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  unint64_t v19 = a2;
  uint64_t v7 = sub_25E019F00();
  uint64_t v17 = *(void *)(v7 - 8);
  uint64_t v18 = v7;
  MEMORY[0x270FA5388](v7);
  v15[2] = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25E019F30();
  v15[1] = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v9 = sub_25E019EC0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_26A6D3C88;
  sub_25E019EB0();
  sub_25E01A120();
  sub_25E019EA0();
  sub_25E01419C(a1, v19, v20, v21, a5);
  sub_25E01A110();
  sub_25E019EA0();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_25E01419C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v31 = a3;
  uint64_t v8 = sub_25E019F00();
  uint64_t v39 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_25E019F30();
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v35 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_25E019E70();
  uint64_t v34 = *(void *)(v42 - 8);
  uint64_t v11 = *(void *)(v34 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v42);
  id v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - v14;
  sub_25E016818(a1, a2);
  uint64_t result = sub_25E017C20(a1, a2, (uint64_t)v15);
  if (!v5)
  {
    sub_25E016CBC(0, &qword_26A6D3AC0);
    uint64_t v30 = sub_25E01A0D0();
    uint64_t v17 = v34;
    uint64_t v18 = v42;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v13, v15, v42);
    unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v31;
    (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v21 + v19, v13, v18);
    uint64_t v22 = (void *)(v21 + v20);
    uint64_t v23 = v33;
    *uint64_t v22 = v32;
    v22[1] = v23;
    aBlock[4] = sub_25E017090;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E013508;
    aBlock[3] = &block_descriptor_22;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v25 = v35;
    sub_25E019F20();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_25E016918(&qword_26A6D3AC8, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AD0);
    sub_25E01677C();
    uint64_t v26 = v37;
    uint64_t v27 = v40;
    sub_25E01A1A0();
    uint64_t v28 = (void *)v30;
    MEMORY[0x2611CC440](0, v25, v26, v24);
    _Block_release(v24);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v27);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v38);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v15, v42);
  }
  return result;
}

uint64_t sub_25E0145F0(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v33 = a4;
  uint64_t v34 = a3;
  uint64_t v28 = a2;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B98);
  MEMORY[0x270FA5388](v32);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25E019F50();
  uint64_t v30 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v29 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25E019E70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_allocWithZone((Class)sub_25E019FC0());
  uint64_t v15 = (void *)sub_25E019FB0();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v16(v13, a2, v10);
  unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = v15;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v17, v13, v10);
  id v19 = v15;
  sub_25E017E5C((uint64_t)sub_25E017128, v18);
  swift_release();
  v16(v13, v28, v10);
  id v20 = v19;
  uint64_t v21 = v29;
  sub_25E019F40();
  uint64_t v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3BA0) + 48);
  uint64_t v24 = v30;
  uint64_t v23 = v31;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v7, v21, v31);
  *(void *)&v7[v22] = v20;
  swift_storeEnumTagMultiPayload();
  id v25 = v20;
  v34(v7);

  sub_25E016FA4((uint64_t)v7, &qword_26A6D3B98);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v21, v23);
}

uint64_t sub_25E0148FC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25E019E70();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  id v11 = a2;
  os_log_type_t v12 = sub_25E01A080();
  sub_25E018A64(v12, (uint64_t (*)(uint64_t))sub_25E017164, v10, 0, (uint64_t)"SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 160, (uint64_t)"responseView(for:mode:completion:)", 34, 2u);
  return swift_release();
}

uint64_t sub_25E014A80()
{
  uint64_t v1 = sub_25E01A220();
  sub_25E01A010();
  sub_25E01A130();
  sub_25E01A010();
  swift_bridgeObjectRelease();
  sub_25E01A010();
  sub_25E019FA0();
  sub_25E01A150();
  sub_25E01A010();
  swift_bridgeObjectRelease();
  sub_25E01A010();
  sub_25E019E40();
  sub_25E01A010();
  swift_bridgeObjectRelease();
  sub_25E01A010();
  return v1;
}

uint64_t sub_25E014B9C(void (*a1)(void *), uint64_t a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B98);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v7 = a3;
  swift_storeEnumTagMultiPayload();
  id v8 = a3;
  a1(v7);
  return sub_25E016FA4((uint64_t)v7, &qword_26A6D3B98);
}

Swift::Void __swiftcall ProtoVisualResponseProvider.reset()()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)sub_25E019F90()), sel_init);
  sub_25E019F80();
}

void static ProtoVisualResponseProvider.transformModel(_:mode:currentIdiom:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
}

void static ProtoVisualResponseProvider.transform(model:mode:currentIdiom:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v136 = a4;
  uint64_t v153 = a3;
  uint64_t v132 = sub_25E019DB0();
  OUTLINED_FUNCTION_0();
  uint64_t v131 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_21();
  uint64_t v171 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AE8);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_21();
  uint64_t v151 = v12;
  OUTLINED_FUNCTION_16();
  uint64_t v138 = sub_25E019D70();
  OUTLINED_FUNCTION_0();
  v161 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_11();
  v137 = v15;
  OUTLINED_FUNCTION_16();
  uint64_t v166 = sub_25E019D80();
  OUTLINED_FUNCTION_0();
  uint64_t v145 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_3();
  uint64_t v163 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_21();
  v164 = v20;
  OUTLINED_FUNCTION_16();
  uint64_t v156 = sub_25E019E30();
  OUTLINED_FUNCTION_0();
  uint64_t v160 = v21;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_7();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v127 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)v127 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (void (**)(uint64_t, uint64_t, uint64_t))((char *)v127 - v31);
  uint64_t v33 = sub_25E019E70();
  OUTLINED_FUNCTION_0();
  uint64_t v130 = v34;
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)v127 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)v127 - v39;
  sub_25E016818(a1, a2);
  uint64_t v41 = sub_25E016918(&qword_26A6D3AF0, MEMORY[0x263F77258]);
  uint64_t v42 = v165;
  sub_25E019DD0();
  if (!v42)
  {
    v155 = v32;
    v148 = v30;
    v135 = v27;
    v127[0] = v41;
    v140 = v38;
    uint64_t v128 = 0;
    v127[1] = v33;
    uint64_t v43 = sub_25E019E60();
    uint64_t v44 = MEMORY[0x263F8EE78];
    *(void *)&v169[0] = MEMORY[0x263F8EE78];
    uint64_t v45 = *(void *)(v43 + 16);
    v127[2] = v40;
    uint64_t v149 = v45;
    if (v45)
    {
      unint64_t v46 = 0;
      uint64_t v159 = v160 + 16;
      uint64_t v47 = v145;
      uint64_t v162 = v145 + 16;
      v134 = (char *)v161 + 8;
      v133 = (void (**)(char *, uint64_t, uint64_t))(v160 + 32);
      v165 = (void (**)(void))(v145 + 8);
      uint64_t v139 = (v145 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v146 = v160 + 8;
      uint64_t v143 = (v160 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v48 = v156;
      long long v49 = v164;
      uint64_t v147 = v43;
      while (1)
      {
        if (v46 >= *(void *)(v43 + 16)) {
          goto LABEL_66;
        }
        OUTLINED_FUNCTION_18();
        uint64_t v52 = v51 & ~v50;
        uint64_t v54 = *(void *)(v53 + 72);
        uint64_t v157 = v55;
        uint64_t v154 = v54;
        uint64_t v158 = *(void *)(v53 + 16);
        OUTLINED_FUNCTION_4();
        v56();
        uint64_t v57 = sub_25E019E10();
        sub_25E01A140();
        uint64_t v58 = *(void *)(v57 + 16);
        if (!v58) {
          break;
        }
        uint64_t v142 = v52;
        unint64_t v144 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
        uint64_t v59 = *(void (**)(void))(v47 + 16);
        OUTLINED_FUNCTION_4();
        v59();
        uint64_t v52 = sub_25E016918(&qword_26A6D3AF8, MEMORY[0x263F769E8]);
        swift_bridgeObjectRetain();
        char v60 = sub_25E019FE0();
        uint64_t v61 = v47;
        char v62 = v60;
        long long v63 = *(void (**)(void))(v61 + 8);
        OUTLINED_FUNCTION_12();
        v63();
        if ((v62 & 1) == 0)
        {
          v161 = v59;
          uint64_t v141 = v57;
          if (v58 != 1)
          {
            uint64_t v48 = *(void *)(v145 + 72);
            unint64_t v65 = v141 + v48 + v144;
            uint64_t v66 = 1;
            while (1)
            {
              OUTLINED_FUNCTION_4();
              v67();
              uint64_t v68 = v66 + 1;
              if (__OFADD__(v66, 1)) {
                break;
              }
              char v69 = sub_25E019FE0();
              OUTLINED_FUNCTION_12();
              v63();
              if (v69)
              {
                swift_bridgeObjectRelease();
                uint64_t v48 = v156;
                goto LABEL_19;
              }
              ++v66;
              v65 += v48;
              uint64_t v64 = v166;
              if (v68 == v58)
              {
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_13();
                goto LABEL_16;
              }
            }
            __break(1u);
            goto LABEL_65;
          }
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_14();
          uint64_t v64 = v166;
LABEL_16:
          uint64_t v47 = v145;
          long long v49 = v164;
          goto LABEL_17;
        }
        swift_bridgeObjectRelease();
LABEL_19:
        OUTLINED_FUNCTION_14();
        uint64_t v47 = v145;
        long long v49 = v164;
        OUTLINED_FUNCTION_12();
        v63();
        swift_bridgeObjectRelease();
        uint64_t v73 = OUTLINED_FUNCTION_2();
        v74(v73);
        long long v63 = v137;
        sub_25E01A160();
        char v75 = sub_25E019E20();
        OUTLINED_FUNCTION_8();
        v76();
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_12();
        v63();
        if (v75)
        {
          v77 = *v133;
          (*v133)(v135, v52, v48);
          uint64_t v78 = *(void *)&v169[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25E016AEC(0, *(void *)(v78 + 16) + 1, 1);
            uint64_t v78 = *(void *)&v169[0];
          }
          unint64_t v80 = *(void *)(v78 + 16);
          unint64_t v79 = *(void *)(v78 + 24);
          if (v80 >= v79 >> 1)
          {
            sub_25E016AEC(v79 > 1, v80 + 1, 1);
            uint64_t v78 = *(void *)&v169[0];
          }
          *(void *)(v78 + 16) = v80 + 1;
          uint64_t v48 = v156;
          v77((char *)(v78 + v142 + v80 * v154), (uint64_t)v135, v156);
          *(void *)&v169[0] = v78;
          goto LABEL_27;
        }
        uint64_t v72 = v52;
LABEL_26:
        ((void (*)(uint64_t, uint64_t))v63)(v72, v48);
LABEL_27:
        unint64_t v46 = v157 + 1;
        uint64_t v43 = v147;
        if (v157 + 1 == v149)
        {
          uint64_t v44 = *(void *)&v169[0];
          uint64_t v81 = v132;
          uint64_t v82 = v131;
          goto LABEL_30;
        }
      }
      uint64_t v64 = v166;
      long long v63 = *v165;
      OUTLINED_FUNCTION_14();
LABEL_17:
      ((void (*)(void (*)(void), uint64_t))v63)(v49, v64);
      swift_bridgeObjectRelease();
      uint64_t v70 = OUTLINED_FUNCTION_2();
      v71(v70);
      OUTLINED_FUNCTION_20();
      uint64_t v72 = v52;
      OUTLINED_FUNCTION_12();
      v63();
      goto LABEL_26;
    }
    OUTLINED_FUNCTION_13();
    uint64_t v82 = v131;
    uint64_t v81 = v132;
LABEL_30:
    swift_bridgeObjectRelease();
    v161 = *(void (**)(void))(v44 + 16);
    if (v161)
    {
      v83 = 0;
      OUTLINED_FUNCTION_18();
      uint64_t v158 = v85 & ~v84;
      uint64_t v157 = v44 + v158;
      v165 = (void (**)(void))(v86 + 16);
      v87 = (void (**)(uint64_t, uint64_t))(v82 + 8);
      v155 = (void (**)(uint64_t, uint64_t, uint64_t))(v86 + 32);
      uint64_t v166 = MEMORY[0x263F8EE78];
      uint64_t v154 = v86 + 8;
      uint64_t v88 = v129;
      uint64_t v159 = v44;
      while ((unint64_t)v83 < *(void *)(v44 + 16))
      {
        uint64_t v89 = *(void *)(v160 + 72);
        v164 = v83;
        uint64_t v162 = *(void *)(v160 + 16);
        uint64_t v163 = v89;
        OUTLINED_FUNCTION_4();
        v90();
        uint64_t v91 = sub_25E019E00();
        uint64_t v92 = *(void *)(v91 + 16);
        if (v92)
        {
          uint64_t v93 = v91 + 32;
          while (1)
          {
            sub_25E016B0C(v93, (uint64_t)&v167);
            __swift_project_boxed_opaque_existential_1(&v167, v168);
            sub_25E019E90();
            sub_25E019DA0();
            (*v87)(v171, v81);
            uint64_t v94 = sub_25E019D90();
            int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v88, 1, v94);
            sub_25E016FA4(v88, &qword_26A6D3AE8);
            if (EnumTagSinglePayload != 1) {
              break;
            }
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v167);
            v93 += 40;
            if (!--v92) {
              goto LABEL_37;
            }
          }
          sub_25E016CF8(&v167, (uint64_t)v169);
        }
        else
        {
LABEL_37:
          uint64_t v170 = 0;
          memset(v169, 0, sizeof(v169));
        }
        swift_bridgeObjectRelease();
        sub_25E016C2C((uint64_t)v169, (uint64_t)&v167);
        uint64_t v96 = v168;
        uint64_t v97 = v152;
        OUTLINED_FUNCTION_14();
        if (v96)
        {
          __swift_project_boxed_opaque_existential_1(&v167, v96);
          sub_25E019E90();
          uint64_t v98 = v151;
          sub_25E019DA0();
          (*v87)(v97, v81);
          sub_25E016FA4(v98, &qword_26A6D3AE8);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v167);
        }
        else
        {
          sub_25E016FA4((uint64_t)&v167, &qword_26A6D3B00);
          uint64_t v99 = sub_25E019D90();
          uint64_t v100 = v151;
          __swift_storeEnumTagSinglePayload(v151, 1, 1, v99);
          sub_25E016FA4(v100, &qword_26A6D3AE8);
        }
        uint64_t v101 = v150;
        uint64_t v102 = v156;
        OUTLINED_FUNCTION_4();
        v103();
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v104 = v166;
        }
        else {
          uint64_t v104 = sub_25E015E88(0, *(void *)(v166 + 16) + 1, 1, v166);
        }
        unint64_t v106 = *(void *)(v104 + 16);
        unint64_t v105 = *(void *)(v104 + 24);
        if (v106 >= v105 >> 1) {
          uint64_t v104 = sub_25E015E88(v105 > 1, v106 + 1, 1, v104);
        }
        uint64_t v107 = v163;
        v83 = (void (*)(void))((char *)v164 + 1);
        *(void *)(v104 + 16) = v106 + 1;
        uint64_t v166 = v104;
        (*v155)(v104 + v158 + v106 * v107, v101, v102);
        sub_25E016FA4((uint64_t)v169, &qword_26A6D3B00);
        OUTLINED_FUNCTION_8();
        v108();
        uint64_t v44 = v159;
        if (v83 == v161)
        {
          swift_release();
          uint64_t v109 = v166;
          goto LABEL_50;
        }
      }
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
    }
    else
    {
      swift_release();
      uint64_t v109 = MEMORY[0x263F8EE78];
LABEL_50:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B08);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25E01A810;
      *(void *)(inited + 32) = 0;
      uint64_t v111 = v130;
      if (*(void *)(v109 + 16))
      {
        swift_bridgeObjectRetain();
        sub_25E019E50();
        swift_bridgeObjectRelease();
        uint64_t v112 = v128;
        uint64_t v113 = sub_25E019DC0();
        uint64_t v128 = v112;
        if (v112)
        {
          v115 = *(void (**)(void))(v111 + 8);
          OUTLINED_FUNCTION_15();
          v115();
          swift_bridgeObjectRelease();

          *(void *)(inited + 16) = 0;
          swift_setDeallocating();
          sub_25E015E24();
          OUTLINED_FUNCTION_15();
          v115();
          return;
        }
        uint64_t v117 = v113;
        unint64_t v118 = v114;
        uint64_t v166 = v109;
        sub_25E016CBC(0, (unint64_t *)&unk_26A6D3B10);
        OUTLINED_FUNCTION_12();
        v119();
        id v116 = sub_25E015D04(v117, v118, 1);
      }
      else
      {
        uint64_t v166 = v109;
        id v116 = 0;
      }
      *(void *)(inited + 40) = v116;
      *(void *)&v169[0] = inited;
      sub_25E01A050();
      uint64_t v120 = *(void *)&v169[0];
      *(void *)&v169[0] = MEMORY[0x263F8EE78];
      uint64_t v121 = *(void *)(v120 + 16);
      if (v121)
      {
        v122 = (void **)(v120 + 32);
        do
        {
          v124 = *v122++;
          v123 = v124;
          if (v124)
          {
            id v125 = v123;
            MEMORY[0x2611CC390]();
            if (*(void *)((*(void *)&v169[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)&v169[0] & 0xFFFFFFFFFFFFFF8)
                                                                                              + 0x18) >> 1)
              sub_25E01A060();
            sub_25E01A070();
            sub_25E01A050();
          }
          --v121;
        }
        while (v121);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15();
      v126();
    }
  }
}

id sub_25E015D04(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v7 = (void *)sub_25E019D50();
  id v8 = objc_msgSend(v6, sel_initWithModel_responseType_, v7, a3);
  sub_25E0168B0(a1, a2);

  return v8;
}

id ProtoVisualResponseProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ProtoVisualResponseProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25E015E24()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B88);
  swift_arrayDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25E015E88(char a1, int64_t a2, char a3, uint64_t a4)
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
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B90);
  uint64_t v10 = *(void *)(sub_25E019E30() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_25E01A1F0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_25E019E30() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_25E016214(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25E0160B4(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_25E0160B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_25E019E30() - 8);
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
  uint64_t result = sub_25E01A210();
  __break(1u);
  return result;
}

uint64_t sub_25E016214(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_25E01A210();
    __break(1u);
    return MEMORY[0x270FA01D0](v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_25E019E30(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_25E019E30();
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

uint64_t sub_25E016344(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_25E019E30() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_25E01A210();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

unint64_t sub_25E01645C(uint64_t a1, uint64_t a2)
{
  sub_25E01A260();
  sub_25E01A000();
  uint64_t v4 = sub_25E01A270();

  return sub_25E0164D4(a1, a2, v4);
}

unint64_t sub_25E0164D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25E01A230() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25E01A230() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25E0165B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_25E016960(a1, a2, a3, a4);
  *uint64_t v4 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E016650()
{
  sub_25E019EC0();
  OUTLINED_FUNCTION_0();

  uint64_t v1 = OUTLINED_FUNCTION_5();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_17();

  return MEMORY[0x270FA0238](v3);
}

uint64_t sub_25E0166DC()
{
  uint64_t v1 = sub_25E019EC0();
  OUTLINED_FUNCTION_1(v1);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return sub_25E012D38(v3, v4);
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

unint64_t sub_25E01677C()
{
  unint64_t result = qword_26A6D3AD8;
  if (!qword_26A6D3AD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6D3AD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D3AD8);
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

uint64_t sub_25E016818(uint64_t a1, unint64_t a2)
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

uint64_t sub_25E016870()
{
  sub_25E0168B0(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0);
}

uint64_t sub_25E0168B0(uint64_t a1, unint64_t a2)
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

uint64_t sub_25E016908()
{
  return sub_25E013D40(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_25E016918(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E016960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_25E01645C(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6D3BB0);
  if ((sub_25E01A1E0() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_25E01645C(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_25E01A240();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  unint64_t v17 = *v5;
  if (v14)
  {
    unint64_t v18 = (uint64_t *)(v17[7] + 16 * v13);
    uint64_t result = swift_bridgeObjectRelease();
    *unint64_t v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_25E016AA0(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_25E016AA0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 16 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  unint64_t v7 = (void *)(a6[7] + 16 * result);
  *unint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

size_t sub_25E016AEC(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_25E016DBC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25E016B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
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

uint64_t sub_25E016C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25E016CBC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25E016CF8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for ProtoVisualResponseProvider()
{
  return self;
}

void type metadata accessor for VRXMode()
{
  if (!qword_26A6D3B20)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A6D3B20);
    }
  }
}

uint64_t sub_25E016D80()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0);
}

size_t sub_25E016DBC(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3B90);
  uint64_t v10 = *(void *)(sub_25E019E30() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_25E019E30() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_25E016214(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25E016344(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_25E016F58()
{
  swift_release();

  return MEMORY[0x270FA0238](v0);
}

uint64_t sub_25E016F98()
{
  return sub_25E014B9C(*(void (**)(void *))(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_25E016FA4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  v3();
  return a1;
}

uint64_t sub_25E016FF4()
{
  sub_25E019E70();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8();
  v1();
  swift_release();

  return MEMORY[0x270FA0238](v0);
}

uint64_t sub_25E017090()
{
  uint64_t v1 = *(void *)(sub_25E019E70() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + v2;
  uint64_t v5 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = *(void (**)(char *))v5;
  uint64_t v7 = *(void *)(v5 + 8);

  return sub_25E0145F0(v3, v4, v6, v7);
}

uint64_t sub_25E017128()
{
  uint64_t v0 = sub_25E019E70();
  OUTLINED_FUNCTION_1(v0);
  uint64_t v1 = OUTLINED_FUNCTION_19();

  return sub_25E0148FC(v1, v2, v3);
}

uint64_t objectdestroy_24Tm()
{
  sub_25E019E70();
  OUTLINED_FUNCTION_0();

  uint64_t v1 = OUTLINED_FUNCTION_5();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_17();

  return MEMORY[0x270FA0238](v3);
}

uint64_t sub_25E0171F8()
{
  uint64_t v0 = sub_25E019E70();
  OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_19();
  return sub_25E014A80();
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

uint64_t sub_25E017288()
{
  sub_25E019EC0();
  OUTLINED_FUNCTION_0();
  sub_25E0168B0(*(void *)(v0 + 16), *(void *)(v0 + 24));

  uint64_t v1 = OUTLINED_FUNCTION_5();
  v2(v1);
  uint64_t v3 = OUTLINED_FUNCTION_17();

  return MEMORY[0x270FA0238](v3);
}

void sub_25E01731C()
{
  uint64_t v1 = sub_25E019EC0();
  OUTLINED_FUNCTION_1(v1);
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];

  sub_25E0132F4(v2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return *(void *)(v0 - 376);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0 + v1;
}

void OUTLINED_FUNCTION_7()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9EFF0](a1, 11, 2, 0xD000000000000084, a5, v5, 49, 2);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

uint64_t sub_25E017548(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5, unint64_t a6, void *a7)
{
  id v44 = a7;
  sub_25E019F50();
  OUTLINED_FUNCTION_0();
  uint64_t v36 = v15;
  uint64_t v37 = v14;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v35 = (char *)&v35 - v19;
  sub_25E019EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v21;
  uint64_t v40 = v20;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_19_0();
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  id v22 = (id)qword_26A6D3C88;
  sub_25E019EB0();
  sub_25E01A120();
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  int v43 = a3;
  sub_25E019EA0();
  unint64_t v47 = a6;
  uint64_t v23 = (uint64_t)v44;
  id v44 = a4;
  uint64_t v45 = a5;
  uint64_t v24 = v38;
  ProtoVisualResponseProvider.responseView(for:mode:)((uint64_t)v18, a5, a6, v23);
  if (v24)
  {
    id v25 = v24;
    os_log_type_t v26 = sub_25E01A090();
    LOBYTE(v34) = 2;
    sub_25E018670(v26, 0, (uint64_t)"SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 98, (uint64_t)"view(for:mode:overload:)", 24, v34, v24, 45, 0xD00000000000002DLL, 0x800000025E01B220);

    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v29 = v35;
    uint64_t v28 = v36;
    uint64_t v30 = v37;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v35, v18, v37);
    v46[3] = v30;
    v46[4] = MEMORY[0x263F77570];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v46);
    (*(void (**)(uint64_t *, char *, uint64_t))(v28 + 16))(boxed_opaque_existential_1, v29, v30);
    id v32 = objc_allocWithZone((Class)sub_25E019F70());
    uint64_t v27 = sub_25E019F60();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  }
  sub_25E01A110();
  sub_25E019EA0();
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v7, v40);

  sub_25E0168B0(v45, v47);
  return v27;
}

uint64_t sub_25E017860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v58 = a7;
  uint64_t v57 = a6;
  uint64_t v56 = sub_25E019E70();
  OUTLINED_FUNCTION_0();
  uint64_t v54 = v12;
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v51 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v43 - v16;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AE0);
  MEMORY[0x270FA5388](v53);
  OUTLINED_FUNCTION_11();
  uint64_t v55 = v18;
  uint64_t v61 = sub_25E019EC0();
  OUTLINED_FUNCTION_0();
  uint64_t v60 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_6();
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  id v21 = (id)qword_26A6D3C88;
  sub_25E019EB0();
  sub_25E01A120();
  id v52 = v21;
  sub_25E019EA0();
  uint64_t v49 = a1;
  uint64_t v50 = a2;
  sub_25E016818(a4, a5);
  uint64_t v22 = v59;
  sub_25E017C38(a4, a5, (uint64_t)v17);
  if (v22)
  {
    uint64_t v23 = OUTLINED_FUNCTION_9_0();
    v24(v23);
    uint64_t v25 = a4;
    unint64_t v26 = a5;
  }
  else
  {
    id v27 = objc_allocWithZone((Class)sub_25E019FC0());
    uint64_t v43 = sub_25E019FB0();
    id v44 = v17;
    unint64_t v48 = a5;
    uint64_t v28 = v54;
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
    int v46 = a3;
    uint64_t v29 = v51;
    uint64_t v30 = v17;
    uint64_t v31 = v56;
    v45(v51, v30, v56);
    uint64_t v32 = *(unsigned __int8 *)(v28 + 80);
    uint64_t v47 = a4;
    uint64_t v59 = 0;
    uint64_t v33 = (v32 + 32) & ~v32;
    uint64_t v34 = swift_allocObject();
    uint64_t v35 = (void *)v43;
    *(void *)(v34 + 16) = v57;
    *(void *)(v34 + 24) = v35;
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v34 + v33, v29, v31);
    id v36 = v35;
    sub_25E017E5C((uint64_t)sub_25E019940, v34);
    swift_release();
    uint64_t v53 = *(int *)(v53 + 48);
    uint64_t v37 = v44;
    v45(v29, v44, v31);
    id v38 = v36;
    uint64_t v39 = v55;
    sub_25E019F40();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v37, v31);
    *(void *)(v39 + v53) = v38;
    sub_25E01A110();
    sub_25E019EA0();
    uint64_t v40 = OUTLINED_FUNCTION_9_0();
    v41(v40);
    sub_25E0199A4(v39, v58);
    uint64_t v25 = v47;
    unint64_t v26 = v48;
  }
  return sub_25E0168B0(v25, v26);
}

uint64_t sub_25E017C20@<X0>(uint64_t a1@<X3>, unint64_t a2@<X4>, uint64_t a3@<X8>)
{
  return sub_25E017C38(a1, a2, a3);
}

uint64_t sub_25E017C38@<X0>(uint64_t a1@<X3>, unint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v5 = sub_25E019E70();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_11();
  uint64_t v17 = v7;
  sub_25E019EC0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_19_0();
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_26A6D3C88;
  sub_25E019EB0();
  sub_25E01A120();
  sub_25E019EA0();
  sub_25E016818(a1, a2);
  sub_25E019854(&qword_26A6D3AF0, MEMORY[0x263F77258]);
  sub_25E019DD0();
  if (v16)
  {
    uint64_t v9 = OUTLINED_FUNCTION_16_0();
    v10(v9);
  }
  else
  {
    sub_25E01A110();
    sub_25E019EA0();
    uint64_t v11 = OUTLINED_FUNCTION_16_0();
    v12(v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(a3, v17, v5);
  }
  return sub_25E0168B0(a1, a2);
}

uint64_t sub_25E017E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E019F00();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_25E019F30();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_6();
  uint64_t v15 = v14 - v13;
  if (qword_26A6D3AA8 != -1) {
    swift_once();
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  aBlock[4] = sub_25E0197C4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E013508;
  aBlock[3] = &block_descriptor_0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  sub_25E019F20();
  sub_25E019854(&qword_26A6D3AC8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AD0);
  sub_25E019804((unint64_t *)&qword_26A6D3AD8, &qword_26A6D3AD0);
  sub_25E01A1A0();
  MEMORY[0x2611CC440](0, v15, v9, v17);
  _Block_release(v17);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v4);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v10);
  return swift_release();
}

uint64_t sub_25E0180E0()
{
  uint64_t v0 = sub_25E01A0C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E01A0B0();
  MEMORY[0x270FA5388]();
  sub_25E019F30();
  MEMORY[0x270FA5388]();
  sub_25E016CBC(0, &qword_26A6D3AC0);
  sub_25E019F20();
  v5[1] = MEMORY[0x263F8EE78];
  sub_25E019854(&qword_26A6D3C98, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3CA0);
  sub_25E019804(&qword_26A6D3CA8, &qword_26A6D3CA0);
  sub_25E01A1A0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_25E01A0F0();
  qword_26A6D3C80 = result;
  return result;
}

void sub_25E018334(os_log_type_t a1, char a2)
{
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26A6D3C88, a1))
  {
    if (a2)
    {
      if (qword_26A6D3AB8 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_25E019EE0();
      __swift_project_value_buffer(v38, (uint64_t)qword_26A6D3CC0);
      log = sub_25E019ED0();
      if (os_log_type_enabled(log, a1))
      {
        uint64_t v5 = OUTLINED_FUNCTION_12_0();
        uint64_t v74 = OUTLINED_FUNCTION_10_0();
        uint64_t v93 = v74;
        uint64_t v39 = OUTLINED_FUNCTION_22(4.8755e-34);
        uint64_t v41 = sub_25E018F14(v39, v40, &v93);
        OUTLINED_FUNCTION_6_0(v41, v42, v43);
        uint64_t v44 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_2_0(v44, v45, v46, v47, v48, v49, v50, v51, v74, (uint64_t)log, v86);
        *(_WORD *)(v5 + 22) = 2082;
        uint64_t v52 = OUTLINED_FUNCTION_23();
        uint64_t v54 = sub_25E018F14(v52, v53, &v93);
        OUTLINED_FUNCTION_15_0(v54, v55, v56, v57, v58, v59, v60, v61, v75, (uint64_t)loge, v90);
        swift_bridgeObjectRelease();
        *(_WORD *)(v5 + 32) = 2080;
        uint64_t v62 = OUTLINED_FUNCTION_21_0((uint64_t)"iOS does not support vending viewControllers. This is done to prevent clients from mistakenly believing they will show on lockscreen", v76, (uint64_t)logf, v91);
        OUTLINED_FUNCTION_13_0(v62, v63, v64, v65, v66, v67, v68, v69, v77, (uint64_t)logg, v92);
        uint64_t v37 = "%{public}s:%{public}lu [%{public}s] %s";
        goto LABEL_13;
      }
    }
    else
    {
      if (qword_26A6D3AB8 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25E019EE0();
      __swift_project_value_buffer(v4, (uint64_t)qword_26A6D3CC0);
      log = sub_25E019ED0();
      if (os_log_type_enabled(log, a1))
      {
        uint64_t v5 = OUTLINED_FUNCTION_12_0();
        uint64_t v70 = OUTLINED_FUNCTION_10_0();
        uint64_t v93 = v70;
        uint64_t v6 = OUTLINED_FUNCTION_22(4.8755e-34);
        uint64_t v8 = sub_25E018F14(v6, v7, &v93);
        OUTLINED_FUNCTION_6_0(v8, v9, v10);
        uint64_t v11 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_2_0(v11, v12, v13, v14, v15, v16, v17, v18, v70, (uint64_t)log, v86);
        *(_WORD *)(v5 + 22) = 2082;
        uint64_t v19 = OUTLINED_FUNCTION_23();
        uint64_t v21 = sub_25E018F14(v19, v20, &v93);
        OUTLINED_FUNCTION_15_0(v21, v22, v23, v24, v25, v26, v27, v28, v71, (uint64_t)logb, v87);
        swift_bridgeObjectRelease();
        *(_WORD *)(v5 + 32) = 2082;
        uint64_t v29 = OUTLINED_FUNCTION_21_0((uint64_t)"iOS does not support vending viewControllers. This is done to prevent clients from mistakenly believing they will show on lockscreen", v72, (uint64_t)logc, v88);
        OUTLINED_FUNCTION_13_0(v29, v30, v31, v32, v33, v34, v35, v36, v73, (uint64_t)logd, v89);
        uint64_t v37 = "%{public}s:%{public}lu [%{public}s] %{public}s";
LABEL_13:
        _os_log_impl(&dword_25E010000, loga, a1, v37, (uint8_t *)v5, 0x2Au);
        OUTLINED_FUNCTION_27();
        OUTLINED_FUNCTION_11_0();
        OUTLINED_FUNCTION_11_0();

        return;
      }
    }
  }
}

void sub_25E018620(os_log_type_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, void *a10)
{
  LOBYTE(v10) = a9;
  sub_25E018670(a1, a2, a3, a4, a5, a6, a7, a8, v10, a10, 33, 0xD000000000000021, 0x800000025E01AF90);
}

void sub_25E018670(os_log_type_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26A6D3C88, a1))
  {
    if (a2)
    {
      if (qword_26A6D3AB8 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_25E019EE0();
      __swift_project_value_buffer(v51, (uint64_t)qword_26A6D3CC0);
      uint64_t v16 = sub_25E019ED0();
      if (os_log_type_enabled(v16, a1))
      {
        HIDWORD(v92) = a1;
        uint64_t v17 = OUTLINED_FUNCTION_12_0();
        v169[0] = OUTLINED_FUNCTION_10_0();
        uint64_t v52 = OUTLINED_FUNCTION_8_0(4.8755e-34);
        uint64_t v166 = OUTLINED_FUNCTION_28(v52, v53);
        OUTLINED_FUNCTION_7_0(v166, v54, v55, v17 + 12, v56, v57, v58, v59, (uint64_t)log, v92, v169[0], a11, a12, a13, v124, v131, v138, v145);
        uint64_t v60 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_3_0(v60, v61, v62, v63, v64, v65, v66, v67, (uint64_t)loge, v96, v103, v109, v115, v121, v128, v135, v142, v149, v152,
          v155,
          v158,
          v161,
          v166);
        *(_WORD *)(v17 + 22) = 2082;
        uint64_t v68 = OUTLINED_FUNCTION_26();
        uint64_t v167 = OUTLINED_FUNCTION_28(v68, v69);
        OUTLINED_FUNCTION_7_0(v167, v70, v71, v17 + 32, v72, v73, v74, v75, (uint64_t)logf, v97, v104, v110, v116, v122, v129, v136, v143, v150);
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 32) = 2080;
        sub_25E01A220();
        OUTLINED_FUNCTION_25();
        swift_getErrorValue();
        sub_25E01A250();
        sub_25E01A010();
        swift_bridgeObjectRelease();
        sub_25E01A010();
        uint64_t v76 = sub_25E018F14(v167, v168, v169);
        OUTLINED_FUNCTION_17_0(v76, v77, v78, v79, v80, v81, v82, v83, (uint64_t)logg, v98, v105, v111, v117, v123, v130, v137, v144, v151, v154,
          v157,
          v160,
          v163,
          v167);
        swift_bridgeObjectRelease();
        uint64_t v50 = "%{public}s:%{public}lu [%{public}s] %s";
        goto LABEL_13;
      }
    }
    else
    {
      if (qword_26A6D3AB8 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_25E019EE0();
      __swift_project_value_buffer(v15, (uint64_t)qword_26A6D3CC0);
      uint64_t v16 = sub_25E019ED0();
      if (os_log_type_enabled(v16, a1))
      {
        HIDWORD(v92) = a1;
        uint64_t v17 = OUTLINED_FUNCTION_12_0();
        v169[0] = OUTLINED_FUNCTION_10_0();
        uint64_t v18 = OUTLINED_FUNCTION_8_0(4.8755e-34);
        uint64_t v164 = OUTLINED_FUNCTION_28(v18, v19);
        OUTLINED_FUNCTION_7_0(v164, v20, v21, v17 + 12, v22, v23, v24, v25, (uint64_t)log, v92, v169[0], a11, a12, a13, v124, v131, v138, v145);
        uint64_t v26 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_3_0(v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)logb, v93, v100, v106, v112, v118, v125, v132, v139, v146, v152,
          v155,
          v158,
          v161,
          v164);
        *(_WORD *)(v17 + 22) = 2082;
        uint64_t v34 = OUTLINED_FUNCTION_26();
        uint64_t v165 = OUTLINED_FUNCTION_28(v34, v35);
        OUTLINED_FUNCTION_7_0(v165, v36, v37, v17 + 32, v38, v39, v40, v41, (uint64_t)logc, v94, v101, v107, v113, v119, v126, v133, v140, v147);
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 32) = 2082;
        sub_25E01A220();
        OUTLINED_FUNCTION_25();
        swift_getErrorValue();
        sub_25E01A250();
        sub_25E01A010();
        swift_bridgeObjectRelease();
        sub_25E01A010();
        uint64_t v42 = sub_25E018F14(v165, v168, v169);
        OUTLINED_FUNCTION_17_0(v42, v43, v44, v45, v46, v47, v48, v49, (uint64_t)logd, v95, v102, v108, v114, v120, v127, v134, v141, v148, v153,
          v156,
          v159,
          v162,
          v165);
        swift_bridgeObjectRelease();
        uint64_t v50 = "%{public}s:%{public}lu [%{public}s] %{public}s";
LABEL_13:
        _os_log_impl(&dword_25E010000, loga, type, v50, (uint8_t *)v17, 0x2Au);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_11_0();
        OUTLINED_FUNCTION_11_0();

        return;
      }
    }
  }
}

void sub_25E018A64(os_log_type_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26A6D3C88, a1))
  {
    HIDWORD(v98) = a11;
    if (a4)
    {
      if (qword_26A6D3AB8 != -1) {
        swift_once();
      }
      uint64_t v54 = sub_25E019EE0();
      __swift_project_value_buffer(v54, (uint64_t)qword_26A6D3CC0);
      swift_retain_n();
      uint64_t v15 = sub_25E019ED0();
      os_log_type_t v16 = a1;
      if (os_log_type_enabled(v15, a1))
      {
        uint64_t v17 = OUTLINED_FUNCTION_12_0();
        uint64_t v92 = OUTLINED_FUNCTION_10_0();
        uint64_t v105 = v92;
        uint64_t v55 = OUTLINED_FUNCTION_20_0(4.8755e-34);
        uint64_t v103 = sub_25E018F14(v55, v56, &v105);
        OUTLINED_FUNCTION_5_0(v103, v57, v58, v17 + 12, v59, v60, v61, v62);
        uint64_t v63 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_4_0(v63, v64, v65, v66, v67, v68, v69, v70, v92, a9, a10, v98, v103);
        *(_WORD *)(v17 + 22) = 2082;
        uint64_t v71 = sub_25E01A1C0();
        uint64_t v104 = sub_25E018F14(v71, v72, &v105);
        OUTLINED_FUNCTION_5_0(v104, v73, v74, v17 + 32, v75, v76, v77, v78);
        uint64_t v79 = swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 32) = 2080;
        uint64_t v80 = a2(v79);
        uint64_t v82 = sub_25E018F14(v80, v81, &v105);
        OUTLINED_FUNCTION_14_0(v82, v83, v84, v85, v86, v87, v88, v89, v93, v95, v97, v100, v104);
        swift_release_n();
        swift_bridgeObjectRelease();
        unint64_t v53 = "%{public}s:%{public}lu [%{public}s] %s";
        goto LABEL_13;
      }
    }
    else
    {
      if (qword_26A6D3AB8 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_25E019EE0();
      __swift_project_value_buffer(v14, (uint64_t)qword_26A6D3CC0);
      swift_retain_n();
      uint64_t v15 = sub_25E019ED0();
      os_log_type_t v16 = a1;
      if (os_log_type_enabled(v15, a1))
      {
        uint64_t v17 = OUTLINED_FUNCTION_12_0();
        uint64_t v90 = OUTLINED_FUNCTION_10_0();
        uint64_t v105 = v90;
        uint64_t v18 = OUTLINED_FUNCTION_20_0(4.8755e-34);
        uint64_t v101 = sub_25E018F14(v18, v19, &v105);
        OUTLINED_FUNCTION_5_0(v101, v20, v21, v17 + 12, v22, v23, v24, v25);
        uint64_t v26 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_4_0(v26, v27, v28, v29, v30, v31, v32, v33, v90, a9, a10, v98, v101);
        *(_WORD *)(v17 + 22) = 2082;
        uint64_t v34 = sub_25E01A1C0();
        uint64_t v102 = sub_25E018F14(v34, v35, &v105);
        OUTLINED_FUNCTION_5_0(v102, v36, v37, v17 + 32, v38, v39, v40, v41);
        uint64_t v42 = swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 32) = 2082;
        uint64_t v43 = a2(v42);
        uint64_t v45 = sub_25E018F14(v43, v44, &v105);
        OUTLINED_FUNCTION_14_0(v45, v46, v47, v48, v49, v50, v51, v52, v91, v94, v96, v99, v102);
        swift_release_n();
        swift_bridgeObjectRelease();
        unint64_t v53 = "%{public}s:%{public}lu [%{public}s] %{public}s";
LABEL_13:
        _os_log_impl(&dword_25E010000, v15, v16, v53, (uint8_t *)v17, 0x2Au);
        OUTLINED_FUNCTION_27();
        OUTLINED_FUNCTION_11_0();
        OUTLINED_FUNCTION_11_0();

        return;
      }
    }

    swift_release_n();
  }
}

uint64_t sub_25E018DE0()
{
  sub_25E016CBC(0, &qword_26A6D3CB0);
  uint64_t result = sub_25E01A170();
  qword_26A6D3C88 = result;
  return result;
}

uint64_t sub_25E018E50()
{
  uint64_t v0 = sub_25E019EE0();
  __swift_allocate_value_buffer(v0, qword_26A6D3CC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A6D3CC0);
  if (qword_26A6D3AB0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A6D3C88;
  return sub_25E019EF0();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25E018F14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25E018FE8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25E019140((uint64_t)v12, *a3);
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
      sub_25E019140((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25E018FE8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_25E01919C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_25E01A190();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_25E019274(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_25E01A1D0();
    if (!v8)
    {
      uint64_t result = sub_25E01A1F0();
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

uint64_t sub_25E019140(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_25E01919C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25E01A210();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_25E019274(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25E01930C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25E0194E8(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25E0194E8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25E01930C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_25E01A020();
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
  unint64_t v3 = sub_25E019480(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_25E01A1B0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_25E01A210();
  __break(1u);
LABEL_14:
  uint64_t result = sub_25E01A1F0();
  __break(1u);
  return result;
}

void *sub_25E019480(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3C90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25E0194E8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3C90);
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
    sub_25E019698(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25E0195C0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25E0195C0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_25E01A210();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25E019698(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_25E01A210();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_25E01978C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0);
}

uint64_t sub_25E0197C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_25E019804(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25E019854(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25E01989C()
{
  uint64_t v1 = sub_25E019E70();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0);
}

uint64_t sub_25E019940()
{
  sub_25E019E70();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);

  return sub_25E013810(v1, v2);
}

uint64_t sub_25E0199A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6D3AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_1_0(os_log_type_t a1, char a2)
{
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(_WORD *)(v11 + 12) = 2050;
  a11 = v12;
  return MEMORY[0x270F9E530](&a11, v13, v11 + 14, v11 + 22);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  *(_WORD *)(v23 + 12) = 2050;
  a23 = v25;
  return MEMORY[0x270F9E530](&a23, v24, v23 + 14, v23 + 22);
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(_WORD *)(v14 + 12) = 2050;
  a13 = v13;
  return MEMORY[0x270F9E530](&a13, v15, v14 + 14, v14 + 22);
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  return MEMORY[0x270F9E530](va, v9, v8, a4);
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  va_arg(va1, void);
  uint64_t v7 = a1;
  return MEMORY[0x270F9E530]((uint64_t *)va, va1, v4, v3 + 12);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, ...)
{
  va_start(va, a18);
  return MEMORY[0x270F9E530](va, v19, v18, a4);
}

uint64_t OUTLINED_FUNCTION_8_0(float a1)
{
  *uint64_t v1 = a1;
  return sub_25E01A1C0();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_11_0()
{
  JUMPOUT(0x2611CC9D0);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  a11 = a1;
  return MEMORY[0x270F9E530](&a11, v13, v11, v12 + 42);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  a13 = a1;
  return MEMORY[0x270F9E530](&a13, v15, v13, v14 + 42);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  a11 = a1;
  return MEMORY[0x270F9E530](&a11, v13, v12, v11 + 32);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  a23 = a1;
  return MEMORY[0x270F9E530](&a23, v25 + 8, v24, v23 + 42);
}

uint64_t OUTLINED_FUNCTION_20_0(float a1)
{
  *uint64_t v1 = a1;
  return sub_25E01A1C0();
}

uint64_t OUTLINED_FUNCTION_21_0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  return sub_25E018F14(0xD000000000000084, (a1 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_22(float a1)
{
  *uint64_t v1 = a1;
  return sub_25E01A1C0();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_25E01A1C0();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_25E01A010();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_25E01A1C0();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1, unint64_t a2)
{
  return sub_25E018F14(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t sub_25E019D50()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25E019D60()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25E019D70()
{
  return MEMORY[0x270F73B98]();
}

uint64_t sub_25E019D80()
{
  return MEMORY[0x270F742A8]();
}

uint64_t sub_25E019D90()
{
  return MEMORY[0x270F742B8]();
}

uint64_t sub_25E019DA0()
{
  return MEMORY[0x270F742C0]();
}

uint64_t sub_25E019DB0()
{
  return MEMORY[0x270F742C8]();
}

uint64_t sub_25E019DC0()
{
  return MEMORY[0x270F74318]();
}

uint64_t sub_25E019DD0()
{
  return MEMORY[0x270F74320]();
}

uint64_t sub_25E019DE0()
{
  return MEMORY[0x270F74908]();
}

uint64_t sub_25E019DF0()
{
  return MEMORY[0x270F74948]();
}

uint64_t sub_25E019E00()
{
  return MEMORY[0x270F75680]();
}

uint64_t sub_25E019E10()
{
  return MEMORY[0x270F75688]();
}

uint64_t sub_25E019E20()
{
  return MEMORY[0x270F75690]();
}

uint64_t sub_25E019E30()
{
  return MEMORY[0x270F75698]();
}

uint64_t sub_25E019E40()
{
  return MEMORY[0x270F756E0]();
}

uint64_t sub_25E019E50()
{
  return MEMORY[0x270F756E8]();
}

uint64_t sub_25E019E60()
{
  return MEMORY[0x270F75708]();
}

uint64_t sub_25E019E70()
{
  return MEMORY[0x270F75710]();
}

uint64_t sub_25E019E80()
{
  return MEMORY[0x270F75718]();
}

uint64_t sub_25E019E90()
{
  return MEMORY[0x270F75780]();
}

uint64_t sub_25E019EA0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25E019EB0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_25E019EC0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25E019ED0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E019EE0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E019EF0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25E019F00()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25E019F10()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25E019F20()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25E019F30()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25E019F40()
{
  return MEMORY[0x270F75B60]();
}

uint64_t sub_25E019F50()
{
  return MEMORY[0x270F75B68]();
}

uint64_t sub_25E019F60()
{
  return MEMORY[0x270F75DD8]();
}

uint64_t sub_25E019F70()
{
  return MEMORY[0x270F75DE0]();
}

uint64_t sub_25E019F80()
{
  return MEMORY[0x270F75F98]();
}

uint64_t sub_25E019F90()
{
  return MEMORY[0x270F75FA0]();
}

uint64_t sub_25E019FA0()
{
  return MEMORY[0x270F76198]();
}

uint64_t sub_25E019FB0()
{
  return MEMORY[0x270F76228]();
}

uint64_t sub_25E019FC0()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_25E019FD0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25E019FE0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E019FF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E01A000()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E01A010()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E01A020()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E01A030()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25E01A040()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25E01A050()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25E01A060()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25E01A070()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25E01A080()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25E01A090()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25E01A0A0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25E01A0B0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25E01A0C0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25E01A0D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25E01A0E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25E01A0F0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25E01A100()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25E01A110()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25E01A120()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25E01A130()
{
  return MEMORY[0x270F762B8]();
}

uint64_t sub_25E01A140()
{
  return MEMORY[0x270F762C0]();
}

uint64_t sub_25E01A150()
{
  return MEMORY[0x270F762C8]();
}

uint64_t sub_25E01A160()
{
  return MEMORY[0x270F762D0]();
}

uint64_t sub_25E01A170()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25E01A190()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25E01A1A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25E01A1B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E01A1C0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25E01A1D0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E01A1E0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25E01A1F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25E01A210()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E01A220()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_25E01A230()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E01A240()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25E01A250()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25E01A260()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E01A270()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}