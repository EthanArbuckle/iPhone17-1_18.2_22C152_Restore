id UVLog()
{
  void *v0;
  uint64_t vars8;

  if (UVLog_onceToken[0] != -1) {
    dispatch_once(UVLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)UVLog___log;
  return v0;
}

uint64_t __UVLog_block_invoke()
{
  UVLog___log = (uint64_t)os_log_create("com.apple.dt.Previews", "uv");
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_24013F470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24013F484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_24013F498(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  int v7 = *(unsigned __int8 *)(a1 + 32);
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(void *)(v1 + 24) = v3;
  *(void *)(v1 + 32) = v4;
  *(void *)(v1 + 40) = v5;
  *(void *)(v1 + 48) = v6;
  *(unsigned char *)(v1 + 56) = v7;
  if (v7)
  {
    sub_240143B20(v3, v4, v5, v6, 1);
    swift_bridgeObjectRetain();
  }
  else
  {
    LOBYTE(aBlock[0]) = v3;
    sub_240145AA0();
  }
  uint64_t v8 = sub_240149798();
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v8 + 32), 0, 1uLL);
  swift_release();
  *(void *)(v2 + 16) = mach_service;
  if (v7)
  {
    swift_unknownObjectRetain();
    xpc_connection_enable_sim2host_4sim();
    sub_240143B78(v3, v4, v5, v6, 1);
    swift_unknownObjectRelease();
    mach_service = *(_xpc_connection_s **)(v2 + 16);
  }
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = (uint64_t)sub_2401442FC;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_240140D5C;
  aBlock[3] = (uint64_t)&block_descriptor;
  v11 = _Block_copy(aBlock);
  swift_release();
  xpc_connection_set_event_handler(mach_service, v11);
  _Block_release(v11);
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2401496B8();
  __swift_project_value_buffer(v12, (uint64_t)qword_268C83008);
  swift_retain_n();
  v13 = sub_240149698();
  os_log_type_t v14 = sub_240149828();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)uint64_t v15 = 136446466;
    swift_retain();
    uint64_t v17 = sub_24013FB20();
    unint64_t v19 = v18;
    swift_release();
    sub_2401484A0(v17, v19, aBlock);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v20 = sub_24013F820();
    sub_2401484A0(v20, v21, aBlock);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v13, v14, "%{public}s created with underlying service %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v16, -1, -1);
    MEMORY[0x2455DF720](v15, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return v2;
}

uint64_t sub_24013F820()
{
  return 0;
}

uint64_t sub_24013F8C0()
{
  uint64_t v1 = v0;
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2401496B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_268C83008);
  swift_retain_n();
  uint64_t v3 = sub_240149698();
  os_log_type_t v4 = sub_240149828();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_retain();
    uint64_t v7 = sub_24013FB20();
    unint64_t v9 = v8;
    swift_release();
    sub_2401484A0(v7, v9, &v11);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v3, v4, "%{public}s deinit", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v6, -1, -1);
    MEMORY[0x2455DF720](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_unknownObjectRelease();
  sub_240143B78(*(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(unsigned char *)(v1 + 56));
  sub_2401442B4(*(void *)(v1 + 64));
  sub_2401442B4(*(void *)(v1 + 80));
  sub_2401442B4(*(void *)(v1 + 96));
  sub_2401442B4(*(void *)(v1 + 112));
  return v1;
}

uint64_t sub_24013FAC8()
{
  sub_24013F8C0();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t type metadata accessor for XPCListener()
{
  return self;
}

uint64_t sub_24013FB20()
{
  sub_2401498A8();
  swift_bridgeObjectRelease();
  strcpy((char *)v2, "<XPCListener ");
  HIWORD(v2[1]) = -4864;
  sub_2401498D8();
  sub_2401497B8();
  swift_bridgeObjectRelease();
  sub_2401497B8();
  if (*(unsigned char *)(v0 + 56)) {
    swift_bridgeObjectRetain();
  }
  else {
    PreviewsService.description.getter();
  }
  sub_2401497B8();
  swift_bridgeObjectRelease();
  sub_2401497B8();
  return v2[0];
}

void sub_24013FC40(void *a1)
{
  uint64_t v2 = sub_240149848();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240149838();
  MEMORY[0x270FA5388]();
  sub_240149748();
  MEMORY[0x270FA5388]();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    uint64_t v8 = MEMORY[0x2455DF8E0](a1);
    if (sub_2401496D8() == v8)
    {
      swift_unknownObjectRetain();
      uint64_t v25 = sub_240144B20();
      if (qword_268C82E08 != -1) {
        swift_once();
      }
      uint64_t v76 = v3;
      uint64_t v26 = sub_2401496B8();
      uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)qword_268C83008);
      swift_retain_n();
      swift_retain_n();
      uint64_t v73 = v27;
      v28 = sub_240149698();
      os_log_type_t v29 = sub_240149828();
      int v30 = v29;
      BOOL v31 = os_log_type_enabled(v28, v29);
      uint64_t v75 = v25;
      if (v31)
      {
        uint64_t v32 = swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        uint64_t v80 = v74;
        *(_DWORD *)uint64_t v32 = 136446466;
        v70[0] = v32 + 4;
        swift_retain();
        os_log_t v72 = v28;
        uint64_t v33 = sub_24013FB20();
        int v71 = v30;
        unint64_t v35 = v34;
        swift_release();
        uint64_t v78 = sub_2401484A0(v33, v35, &v80);
        v70[1] = &v79;
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v32 + 12) = 2082;
        v70[0] = v32 + 14;
        swift_retain();
        uint64_t v36 = sub_240141A70();
        unint64_t v38 = v37;
        swift_release();
        uint64_t v78 = sub_2401484A0(v36, v38, &v80);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        os_log_t v39 = v72;
        _os_log_impl(&dword_24013D000, v72, (os_log_type_t)v71, "%{public}s incoming connection %{public}s", (uint8_t *)v32, 0x16u);
        uint64_t v40 = v74;
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v40, -1, -1);
        MEMORY[0x2455DF720](v32, -1, -1);
      }
      else
      {

        swift_release_n();
        swift_release_n();
      }
      uint64_t v74 = sub_240145068(0, &qword_268C82E98);
      uint64_t v80 = 0;
      unint64_t v81 = 0xE000000000000000;
      sub_2401498A8();
      swift_bridgeObjectRelease();
      uint64_t v80 = 0xD00000000000001CLL;
      unint64_t v81 = 0x800000024014AAA0;
      uint64_t v78 = 0;
      unint64_t v79 = 0xE000000000000000;
      v77 = v7;
      sub_2401498D8();
      sub_2401497B8();
      swift_bridgeObjectRelease();
      sub_240149738();
      uint64_t v80 = MEMORY[0x263F8EE78];
      sub_240144E74();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EA8);
      sub_240144ECC();
      sub_240149898();
      (*(void (**)(char *, void, uint64_t))(v76 + 104))(v5, *MEMORY[0x263F8F130], v2);
      v44 = sub_240149858();
      uint64_t v45 = v75;
      xpc_connection_set_target_queue(*(xpc_connection_t *)(v75 + 16), v44);

      v46 = (uint64_t (*)(uint64_t))v7[8];
      if (!v46 || (swift_retain(), char v47 = v46(v45), sub_2401442B4((uint64_t)v46), (v47 & 1) == 0))
      {
        swift_retain_n();
        swift_retain_n();
        v58 = sub_240149698();
        os_log_type_t v59 = sub_240149828();
        if (os_log_type_enabled(v58, v59))
        {
          uint64_t v60 = swift_slowAlloc();
          uint64_t v61 = swift_slowAlloc();
          uint64_t v80 = v61;
          *(_DWORD *)uint64_t v60 = 136446466;
          swift_retain();
          uint64_t v62 = sub_24013FB20();
          unint64_t v64 = v63;
          swift_release();
          uint64_t v78 = sub_2401484A0(v62, v64, &v80);
          sub_240149878();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v60 + 12) = 2082;
          swift_retain();
          uint64_t v65 = sub_240141A70();
          unint64_t v67 = v66;
          swift_release();
          uint64_t v78 = sub_2401484A0(v65, v67, &v80);
          sub_240149878();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24013D000, v58, v59, "%{public}s denying %{public}s", (uint8_t *)v60, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2455DF720](v61, -1, -1);
          MEMORY[0x2455DF720](v60, -1, -1);
        }
        else
        {

          swift_release_n();
          swift_release_n();
        }
        sub_2401408D4();
        swift_release();
LABEL_31:
        swift_release();
        return;
      }
      swift_retain_n();
      swift_retain_n();
      v48 = sub_240149698();
      os_log_type_t v49 = sub_240149828();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        uint64_t v80 = v51;
        *(_DWORD *)uint64_t v50 = 136446466;
        swift_retain();
        uint64_t v52 = sub_24013FB20();
        unint64_t v54 = v53;
        swift_release();
        uint64_t v78 = sub_2401484A0(v52, v54, &v80);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v50 + 12) = 2082;
        swift_retain();
        uint64_t v55 = sub_240141A70();
        unint64_t v57 = v56;
        swift_release();
        uint64_t v78 = sub_2401484A0(v55, v57, &v80);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24013D000, v48, v49, "%{public}s accepted connection %{public}s", (uint8_t *)v50, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v51, -1, -1);
        MEMORY[0x2455DF720](v50, -1, -1);
        swift_release();
        swift_release();
      }
      else
      {

        swift_release_n();
        swift_release_n();
      }
    }
    else
    {
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_240144D24(a1);
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (qword_268C82E08 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_2401496B8();
      __swift_project_value_buffer(v14, (uint64_t)qword_268C83008);
      swift_retain();
      sub_240143A88(v9, v11, v13);
      swift_retain();
      sub_240143A88(v9, v11, v13);
      uint64_t v15 = sub_240149698();
      os_log_type_t v16 = sub_240149828();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        uint64_t v76 = swift_slowAlloc();
        uint64_t v80 = v76;
        *(_DWORD *)uint64_t v17 = 136446466;
        swift_retain();
        uint64_t v18 = sub_24013FB20();
        unint64_t v20 = v19;
        swift_release();
        uint64_t v78 = sub_2401484A0(v18, v20, &v80);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2114;
        sub_240143DB0();
        swift_allocError();
        *(void *)uint64_t v21 = v9;
        *(void *)(v21 + 8) = v11;
        *(unsigned char *)(v21 + 16) = v13;
        sub_240143A88(v9, v11, v13);
        uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v78 = v22;
        sub_240149878();
        uint64_t v23 = v75;
        *(void *)uint64_t v75 = v22;
        sub_240143AA0(v9, v11, v13);
        sub_240143AA0(v9, v11, v13);
        _os_log_impl(&dword_24013D000, v15, v16, "%{public}s got error event: %{public}@", (uint8_t *)v17, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C82E90);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v23, -1, -1);
        uint64_t v24 = v76;
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v24, -1, -1);
        MEMORY[0x2455DF720](v17, -1, -1);
      }
      else
      {
        swift_release_n();
        sub_240143AA0(v9, v11, v13);
        sub_240143AA0(v9, v11, v13);
      }

      if ((_BYTE)v13)
      {
        if (v13 == 3 && !(v9 | v11))
        {
          v68 = (void (*)(uint64_t))v7[10];
          if (v68)
          {
            uint64_t v69 = swift_retain();
            v68(v69);
            sub_2401442B4((uint64_t)v68);
          }
        }
        else
        {
          v41 = (void (*)(uint64_t, uint64_t, uint64_t))v7[14];
          if (v41)
          {
            swift_retain();
            v41(v9, v11, v13);
            sub_2401442B4((uint64_t)v41);
          }
          sub_240143AA0(v9, v11, v13);
        }
        goto LABEL_31;
      }
      v42 = (void (*)(uint64_t))v7[12];
      if (v42)
      {
        uint64_t v43 = swift_retain();
        v42(v43);
        sub_2401442B4((uint64_t)v42);
      }
      sub_240140B28();
      swift_release();
      sub_240143AA0(v9, v11, 0);
    }
  }
}

void sub_2401408CC()
{
}

uint64_t sub_2401408D4()
{
  uint64_t v1 = v0;
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2401496B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_268C83008);
  swift_retain_n();
  uint64_t v3 = sub_240149698();
  os_log_type_t v4 = sub_240149828();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(void *)&v13[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_retain();
    uint64_t v7 = sub_240141A70();
    unint64_t v9 = v8;
    swift_release();
    sub_2401484A0(v7, v9, (uint64_t *)v13);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v3, v4, "%{public}s invalidating", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v6, -1, -1);
    MEMORY[0x2455DF720](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v10 = v1[8];
  v1[8] = 0;
  v1[9] = 0;
  sub_2401442B4(v10);
  uint64_t v11 = v1[10];
  v1[10] = 0;
  v1[11] = 0;
  sub_2401442B4(v11);
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  swift_beginAccess();
  sub_240145280((uint64_t)v13, (uint64_t)(v1 + 3));
  swift_endAccess();
  return sub_240141C6C((uint64_t (*)(uint64_t))sub_240141A70, "%{public}s cancel", MEMORY[0x263EF8B10]);
}

uint64_t sub_240140B28()
{
  uint64_t v1 = v0;
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2401496B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_268C83008);
  swift_retain_n();
  uint64_t v3 = sub_240149698();
  os_log_type_t v4 = sub_240149828();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_retain();
    uint64_t v7 = sub_24013FB20();
    unint64_t v9 = v8;
    swift_release();
    sub_2401484A0(v7, v9, &v15);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v3, v4, "%{public}s invalidating", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v6, -1, -1);
    MEMORY[0x2455DF720](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v10 = v1[10];
  v1[10] = 0;
  v1[11] = 0;
  sub_2401442B4(v10);
  uint64_t v11 = v1[12];
  v1[12] = 0;
  v1[13] = 0;
  sub_2401442B4(v11);
  uint64_t v12 = v1[14];
  v1[14] = 0;
  v1[15] = 0;
  sub_2401442B4(v12);
  uint64_t v13 = v1[8];
  v1[8] = 0;
  v1[9] = 0;
  sub_2401442B4(v13);
  return sub_240141C6C((uint64_t (*)(uint64_t))sub_24013FB20, "%{public}s cancel", MEMORY[0x263EF8B10]);
}

uint64_t sub_240140D5C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_240140DBC()
{
  return sub_240141C6C((uint64_t (*)(uint64_t))sub_24013FB20, "%{public}s activate", MEMORY[0x263EF8B08]);
}

uint64_t sub_240140DF0()
{
  return sub_24013FB20();
}

uint64_t sub_240140E14(_xpc_connection_s *a1)
{
  *(void *)(v1 + 104) = 0;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(void *)(v1 + 16) = a1;
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_240144F70;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_240140D5C;
  v6[3] = &block_descriptor_14;
  os_log_type_t v4 = _Block_copy(v6);
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_set_event_handler(a1, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
  return v1;
}

uint64_t sub_240140F20(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = MEMORY[0x2455DF8E0](a1);
    if (sub_2401496E8() == v4)
    {
      if (qword_268C82E08 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_2401496B8();
      __swift_project_value_buffer(v18, (uint64_t)qword_268C83008);
      swift_retain_n();
      unint64_t v19 = sub_240149698();
      os_log_type_t v20 = sub_240149808();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v37 = v22;
        *(_DWORD *)uint64_t v21 = 136446210;
        swift_retain();
        uint64_t v23 = sub_240141A70();
        unint64_t v25 = v24;
        swift_release();
        sub_2401484A0(v23, v25, &v37);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24013D000, v19, v20, "%{public}s received dictionary", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v22, -1, -1);
        MEMORY[0x2455DF720](v21, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      sub_2401414EC(a1);
      return swift_release();
    }
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v5 = sub_240144D24(a1);
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (qword_268C82E08 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2401496B8();
    __swift_project_value_buffer(v10, (uint64_t)qword_268C83008);
    swift_retain();
    sub_240143A88(v5, v7, v9);
    swift_retain();
    sub_240143A88(v5, v7, v9);
    uint64_t v11 = sub_240149698();
    os_log_type_t v12 = sub_240149828();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      unint64_t v34 = (void *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v37 = v35;
      *(_DWORD *)uint64_t v13 = 136446466;
      swift_retain();
      uint64_t v14 = sub_240141A70();
      unint64_t v16 = v15;
      swift_release();
      sub_2401484A0(v14, v16, &v37);
      sub_240149878();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2114;
      sub_240143DB0();
      swift_allocError();
      *(void *)uint64_t v17 = v5;
      *(void *)(v17 + 8) = v7;
      *(unsigned char *)(v17 + 16) = v9;
      sub_240143A88(v5, v7, v9);
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      sub_240149878();
      *unint64_t v34 = v36;
      sub_240143AA0(v5, v7, v9);
      sub_240143AA0(v5, v7, v9);
      _os_log_impl(&dword_24013D000, v11, v12, "%{public}s error event: %{public}@", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C82E90);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v34, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v35, -1, -1);
      MEMORY[0x2455DF720](v13, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_240143AA0(v5, v7, v9);
      sub_240143AA0(v5, v7, v9);
    }

    if ((_BYTE)v9)
    {
      if (v9 == 3 && !(v5 | v7))
      {
        uint64_t v32 = (void (*)(uint64_t))v3[8];
        if (v32)
        {
          uint64_t v33 = swift_retain();
          v32(v33);
          sub_2401442B4((uint64_t)v32);
        }
        return swift_release();
      }
      uint64_t v26 = (void (*)(uint64_t, uint64_t, uint64_t))v3[12];
      if (v26)
      {
        swift_retain();
        v26(v5, v7, v9);
        sub_2401442B4((uint64_t)v26);
      }
      uint64_t v27 = v5;
      uint64_t v28 = v7;
      unsigned __int8 v29 = v9;
    }
    else
    {
      int v30 = (void (*)(uint64_t))v3[10];
      if (v30)
      {
        uint64_t v31 = swift_retain();
        v30(v31);
        sub_2401442B4((uint64_t)v30);
        swift_release();
        return sub_240143AA0(v5, v7, 0);
      }
      uint64_t v27 = v5;
      uint64_t v28 = v7;
      unsigned __int8 v29 = 0;
    }
    sub_240143AA0(v27, v28, v29);
    return swift_release();
  }
  return result;
}

void sub_2401414EC(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone((Class)UVPropertyList), sel_initWithXpcDictionary_, a1);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      xpc_object_t v7 = reply;
      if (qword_268C82E08 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_2401496B8();
      __swift_project_value_buffer(v8, (uint64_t)qword_268C83008);
      swift_retain_n();
      uint64_t v9 = sub_240149698();
      os_log_type_t v10 = sub_240149808();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 136446210;
        v35[0] = v12;
        swift_retain();
        uint64_t v13 = sub_240141A70();
        unint64_t v15 = v14;
        swift_release();
        uint64_t v37 = sub_2401484A0(v13, v15, v35);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24013D000, v9, v10, "%{public}s received message expecting reply", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v12, -1, -1);
        MEMORY[0x2455DF720](v11, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      if (!*(void *)(v2 + 48))
      {

        swift_unknownObjectRelease();
        return;
      }
      sub_240144F78(v2 + 24, (uint64_t)v35);
      uint64_t v26 = __swift_project_boxed_opaque_existential_1(v35, v36);
      uint64_t v27 = swift_allocObject();
      swift_weakInit();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v27;
      *(void *)(v28 + 24) = v7;
      uint64_t v29 = v26[3];
      uint64_t v30 = v26[4];
      __swift_project_boxed_opaque_existential_1(v26, v29);
      uint64_t v31 = *(void (**)(void *, void (*)(void *, void *), uint64_t, uint64_t, uint64_t))(v30 + 16);
      swift_retain();
      swift_unknownObjectRetain();
      v31(v5, sub_240145060, v28, v29, v30);
      swift_release();
      swift_release();

      swift_unknownObjectRelease();
    }
    else
    {
      if (qword_268C82E08 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_2401496B8();
      __swift_project_value_buffer(v18, (uint64_t)qword_268C83008);
      swift_retain_n();
      unint64_t v19 = sub_240149698();
      os_log_type_t v20 = sub_240149808();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        v35[0] = v22;
        *(_DWORD *)uint64_t v21 = 136446210;
        swift_retain();
        uint64_t v23 = sub_240141A70();
        unint64_t v25 = v24;
        swift_release();
        uint64_t v37 = sub_2401484A0(v23, v25, v35);
        sub_240149878();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24013D000, v19, v20, "%{public}s received one-way message", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v22, -1, -1);
        MEMORY[0x2455DF720](v21, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      if (!*(void *)(v2 + 48))
      {

        return;
      }
      sub_240144F78(v2 + 24, (uint64_t)v35);
      uint64_t v32 = __swift_project_boxed_opaque_existential_1(v35, v36);
      uint64_t v33 = v32[3];
      uint64_t v34 = v32[4];
      __swift_project_boxed_opaque_existential_1(v32, v33);
      (*(void (**)(void *, uint64_t, uint64_t))(v34 + 8))(v5, v33, v34);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  }
  else
  {
    unint64_t v16 = *(void (**)(uint64_t))(v2 + 96);
    if (v16)
    {
      swift_retain();
      MEMORY[0x2455DF860](a1);
      uint64_t v17 = sub_2401497C8();
      v16(v17);
      sub_2401442B4((uint64_t)v16);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_240141A70()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v4 = 0u;
  long long v5 = 0u;
  xpc_connection_get_audit_token();
  memset(v3, 0, sizeof(v3));
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BE0]), sel_initWithAuditToken_, v3);
  int v1 = objc_msgSend(v0, sel_pid);

  *(void *)&long long v4 = 0;
  *((void *)&v4 + 1) = 0xE000000000000000;
  sub_2401498A8();
  swift_bridgeObjectRelease();
  *(void *)&long long v4 = 0x6E6E6F434350583CLL;
  *((void *)&v4 + 1) = 0xEF206E6F69746365;
  *(void *)&v3[0] = 0;
  *((void *)&v3[0] + 1) = 0xE000000000000000;
  sub_2401498D8();
  sub_2401497B8();
  swift_bridgeObjectRelease();
  sub_2401497B8();
  if (v1 >= 1)
  {
    LODWORD(v3[0]) = v1;
    sub_240149948();
  }
  sub_2401497B8();
  swift_bridgeObjectRelease();
  sub_2401497B8();
  return v4;
}

uint64_t sub_240141C38()
{
  return sub_240141C6C((uint64_t (*)(uint64_t))sub_240141A70, "%{public}s activate", MEMORY[0x263EF8B08]);
}

uint64_t sub_240141C6C(uint64_t (*a1)(uint64_t), const char *a2, uint64_t (*a3)(void))
{
  uint64_t v7 = v3;
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2401496B8();
  __swift_project_value_buffer(v8, (uint64_t)qword_268C83008);
  swift_retain_n();
  uint64_t v9 = sub_240149698();
  os_log_type_t v10 = sub_240149828();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = swift_retain();
    uint64_t v14 = a1(v13);
    unint64_t v16 = v15;
    swift_release();
    sub_2401484A0(v14, v16, &v18);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v9, v10, a2, v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v12, -1, -1);
    MEMORY[0x2455DF720](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return a3(*(void *)(v7 + 16));
}

uint64_t sub_240141E5C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2401496B8();
  __swift_project_value_buffer(v4, (uint64_t)qword_268C83008);
  swift_retain_n();
  long long v5 = sub_240149698();
  os_log_type_t v6 = sub_240149808();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_retain();
    uint64_t v9 = sub_240141A70();
    unint64_t v11 = v10;
    swift_release();
    sub_2401484A0(v9, v11, &v14);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v5, v6, "%{public}s sending one-way message", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v8, -1, -1);
    MEMORY[0x2455DF720](v7, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  objc_msgSend(a1, sel_encodeToXpcDictionary_, empty);
  xpc_connection_send_message(*(xpc_connection_t *)(v2 + 16), empty);
  return swift_unknownObjectRelease();
}

uint64_t sub_24014205C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2401496B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_268C83008);
  swift_retain_n();
  uint64_t v8 = sub_240149698();
  os_log_type_t v9 = sub_240149808();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)unint64_t v10 = 136446210;
    swift_retain();
    uint64_t v12 = sub_240141A70();
    uint64_t v20 = a2;
    unint64_t v14 = v13;
    swift_release();
    sub_2401484A0(v12, v14, aBlock);
    sub_240149878();
    swift_release_n();
    a2 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v8, v9, "%{public}s sending message expecting reply", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v11, -1, -1);
    MEMORY[0x2455DF720](v10, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  objc_msgSend(a1, sel_encodeToXpcDictionary_, empty);
  unint64_t v16 = *(_xpc_connection_s **)(v4 + 16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v4;
  v17[3] = a2;
  v17[4] = a3;
  aBlock[4] = (uint64_t)sub_240145208;
  aBlock[5] = (uint64_t)v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_240140D5C;
  aBlock[3] = (uint64_t)&block_descriptor_24;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  xpc_connection_send_message_with_reply(v16, empty, 0, v18);
  _Block_release(v18);
  return swift_unknownObjectRelease();
}

void sub_240142320(void *a1, uint64_t a2, void (*a3)(void, void))
{
  uint64_t v6 = MEMORY[0x2455DF8E0]();
  if (sub_2401496E8() != v6)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v7 = sub_240144D24(a1);
    uint64_t v9 = v8;
    unsigned __int8 v11 = v10;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (qword_268C82E08 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2401496B8();
    __swift_project_value_buffer(v12, (uint64_t)qword_268C83008);
    swift_retain();
    sub_240143A88(v7, v9, v11);
    swift_retain();
    sub_240143A88(v7, v9, v11);
    unint64_t v13 = sub_240149698();
    os_log_type_t v14 = sub_240149828();
    if (os_log_type_enabled(v13, v14))
    {
      v68 = a3;
      uint64_t v15 = swift_slowAlloc();
      unint64_t v64 = (void *)swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      uint64_t v70 = v65;
      *(_DWORD *)uint64_t v15 = 136446466;
      swift_retain();
      uint64_t v16 = sub_240141A70();
      unint64_t v18 = v17;
      swift_release();
      sub_2401484A0(v16, v18, &v70);
      sub_240149878();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2114;
      sub_240143DB0();
      swift_allocError();
      *(void *)uint64_t v19 = v7;
      *(void *)(v19 + 8) = v9;
      *(unsigned char *)(v19 + 16) = v11;
      sub_240143A88(v7, v9, v11);
      uint64_t v69 = _swift_stdlib_bridgeErrorToNSError();
      sub_240149878();
      *unint64_t v64 = v69;
      sub_240143AA0(v7, v9, v11);
      sub_240143AA0(v7, v9, v11);
      _os_log_impl(&dword_24013D000, v13, v14, "%{public}s received reply error event: %{public}@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C82E90);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v64, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v65, -1, -1);
      uint64_t v20 = v15;
      a3 = v68;
      MEMORY[0x2455DF720](v20, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_240143AA0(v7, v9, v11);
      sub_240143AA0(v7, v9, v11);
    }

    if (v11)
    {
      if (v11 == 3 && !(v7 | v9))
      {
        uint64_t v29 = *(void (**)(uint64_t))(a2 + 64);
        if (v29)
        {
          uint64_t v30 = swift_retain();
          v29(v30);
          sub_2401442B4((uint64_t)v29);
        }
      }
    }
    else
    {
      uint64_t v31 = *(void (**)(uint64_t))(a2 + 80);
      if (v31)
      {
        sub_240143A88(v7, v9, 0);
        uint64_t v32 = sub_240145214((uint64_t)v31);
        v31(v32);
        sub_2401442B4((uint64_t)v31);
        sub_240143AA0(v7, v9, 0);
      }
    }
    sub_240143DB0();
    uint64_t v33 = swift_allocError();
    *(void *)uint64_t v34 = v7;
    *(void *)(v34 + 8) = v9;
    *(unsigned char *)(v34 + 16) = v11;
    a3(0, v33);
    uint64_t v35 = (void *)v33;
    goto LABEL_19;
  }
  if (qword_268C82E08 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_2401496B8();
  __swift_project_value_buffer(v21, (uint64_t)qword_268C83008);
  swift_retain_n();
  uint64_t v22 = sub_240149698();
  os_log_type_t v23 = sub_240149808();
  if (os_log_type_enabled(v22, v23))
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v70 = v25;
    *(_DWORD *)unint64_t v24 = 136446210;
    swift_retain();
    uint64_t v26 = sub_240141A70();
    unint64_t v28 = v27;
    swift_release();
    sub_2401484A0(v26, v28, &v70);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v22, v23, "%{public}s received reply dictionary", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v25, -1, -1);
    MEMORY[0x2455DF720](v24, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  id v36 = objc_msgSend(objc_allocWithZone((Class)UVPropertyList), sel_initWithXpcDictionary_, a1);
  if (!v36)
  {
    MEMORY[0x2455DF860](a1);
    uint64_t v49 = sub_2401497C8();
    uint64_t v51 = v50;
    sub_240143DB0();
    uint64_t v52 = swift_allocError();
    *(void *)uint64_t v53 = v49;
    *(void *)(v53 + 8) = v51;
    *(unsigned char *)(v53 + 16) = 1;
    a3(0, v52);
    uint64_t v35 = (void *)v52;
LABEL_19:

    return;
  }
  uint64_t v37 = v36;
  sub_240145068(0, &qword_268C82EC0);
  id v38 = v37;
  id v39 = sub_240142C80(v38);
  if (v39)
  {
    uint64_t v40 = v39;
    swift_retain_n();
    v41 = sub_240149698();
    os_log_type_t v42 = sub_240149808();
    if (os_log_type_enabled(v41, v42))
    {
      id v66 = v38;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v70 = v44;
      *(_DWORD *)uint64_t v43 = 136446210;
      swift_retain();
      uint64_t v45 = sub_240141A70();
      unint64_t v47 = v46;
      swift_release();
      sub_2401484A0(v45, v47, &v70);
      sub_240149878();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24013D000, v41, v42, "%{public}s received reply error", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v44, -1, -1);
      v48 = v43;
      id v38 = v66;
      MEMORY[0x2455DF720](v48, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    id v62 = v40;
    a3(0, v40);
  }
  else
  {
    swift_retain_n();
    unint64_t v54 = sub_240149698();
    os_log_type_t v55 = sub_240149808();
    if (os_log_type_enabled(v54, v55))
    {
      id v67 = v38;
      unint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v70 = v57;
      *(_DWORD *)unint64_t v56 = 136446210;
      swift_retain();
      uint64_t v58 = sub_240141A70();
      unint64_t v60 = v59;
      swift_release();
      sub_2401484A0(v58, v60, &v70);
      sub_240149878();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24013D000, v54, v55, "%{public}s received reply message", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v57, -1, -1);
      uint64_t v61 = v56;
      id v38 = v67;
      MEMORY[0x2455DF720](v61, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    id v63 = v38;
    a3(v37, 0);
  }
}

id sub_240142C80(void *a1)
{
  id v2 = objc_msgSend(a1, sel_dictionary);
  uint64_t v3 = sub_240149768();

  if (*(void *)(v3 + 16))
  {
    unint64_t v4 = sub_24014431C(0x6E69616D6F64, 0xE600000000000000);
    if (v5)
    {
      sub_240145104(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v16);
      if (swift_dynamicCast())
      {
        if (!*(void *)(v3 + 16) || (unint64_t v6 = sub_24014431C(1701080931, 0xE400000000000000), (v7 & 1) == 0))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return 0;
        }
        sub_240145104(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v16);
        if ((swift_dynamicCast() & 1) == 0)
        {

          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        if (*(void *)(v3 + 16) && (unint64_t v8 = sub_24014431C(0x6F666E4972657375, 0xE800000000000000), (v9 & 1) != 0))
        {
          sub_240145104(*(void *)(v3 + 56) + 32 * v8, (uint64_t)&v16);
        }
        else
        {
          long long v16 = 0u;
          long long v17 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((void *)&v17 + 1))
        {

          swift_bridgeObjectRelease();
          sub_240145224((uint64_t)&v16, (uint64_t *)&unk_268C82F00);
          return 0;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C82ED0);
        if (swift_dynamicCast())
        {
          id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          unint64_t v13 = (void *)sub_240149778();
          swift_bridgeObjectRelease();
          os_log_type_t v14 = (void *)sub_240149758();
          swift_bridgeObjectRelease();
          id v10 = objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, v15, v14);

          return v10;
        }
      }
    }
  }

LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_240142F14(void *a1, void *a2, uint64_t a3, void *a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    if (a1)
    {
      uint64_t v9 = qword_268C82E08;
      id v10 = a1;
      if (v9 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_2401496B8();
      __swift_project_value_buffer(v11, (uint64_t)qword_268C83008);
      swift_retain_n();
      id v12 = sub_240149698();
      os_log_type_t v13 = sub_240149808();
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        uint64_t v40 = (void *)v15;
        *(_DWORD *)os_log_type_t v14 = 136446210;
        swift_retain();
        uint64_t v16 = sub_240141A70();
        id v38 = v10;
        long long v17 = a4;
        unint64_t v19 = v18;
        swift_release();
        id v39 = (void *)sub_2401484A0(v16, v19, (uint64_t *)&v40);
        sub_240149878();
        swift_release_n();
        a4 = v17;
        id v10 = v38;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24013D000, v12, v13, "%{public}s replying with message", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v15, -1, -1);
        MEMORY[0x2455DF720](v14, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      objc_msgSend(v10, sel_encodeToXpcDictionary_, a4, v38, v39, v40);
      uint64_t v29 = (_xpc_connection_s *)swift_unknownObjectRetain();
      xpc_connection_send_message(v29, a4);

      swift_unknownObjectRelease();
LABEL_15:
      swift_release();
      return;
    }
    if (a2)
    {
      uint64_t v40 = a2;
      id v20 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EB8);
      sub_240145068(0, &qword_268C82EC0);
      if (swift_dynamicCast())
      {
        if (qword_268C82E08 != -1) {
          swift_once();
        }
        uint64_t v21 = sub_2401496B8();
        __swift_project_value_buffer(v21, (uint64_t)qword_268C83008);
        swift_retain_n();
        uint64_t v22 = sub_240149698();
        os_log_type_t v23 = sub_240149808();
        if (os_log_type_enabled(v22, v23))
        {
          unint64_t v24 = (uint8_t *)swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          uint64_t v40 = (void *)v25;
          *(_DWORD *)unint64_t v24 = 136446210;
          swift_retain();
          uint64_t v26 = sub_240141A70();
          unint64_t v28 = v27;
          swift_release();
          sub_2401484A0(v26, v28, (uint64_t *)&v40);
          sub_240149878();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24013D000, v22, v23, "%{public}s replying with error", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2455DF720](v25, -1, -1);
          MEMORY[0x2455DF720](v24, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        sub_240143504(a4);
        xpc_connection_send_message(*(xpc_connection_t *)(v8 + 16), a4);

        goto LABEL_15;
      }
    }
    if (qword_268C82E08 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_2401496B8();
    __swift_project_value_buffer(v30, (uint64_t)qword_268C83008);
    swift_retain_n();
    uint64_t v31 = sub_240149698();
    os_log_type_t v32 = sub_240149818();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v40 = (void *)v34;
      *(_DWORD *)uint64_t v33 = 136446210;
      swift_retain();
      uint64_t v35 = sub_240141A70();
      unint64_t v37 = v36;
      swift_release();
      sub_2401484A0(v35, v37, (uint64_t *)&v40);
      sub_240149878();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24013D000, v31, v32, "%{public}s: Received neither message nor error from client to reply with", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455DF720](v34, -1, -1);
      MEMORY[0x2455DF720](v33, -1, -1);
      swift_release();
    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_240143504(void *a1)
{
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24014A2D0;
  *(void *)(inited + 32) = 0x6E69616D6F64;
  *(void *)(inited + 40) = 0xE600000000000000;
  id v5 = objc_msgSend(v2, sel_domain);
  uint64_t v6 = sub_240149788();
  uint64_t v8 = v7;

  uint64_t v9 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 72) = v9;
  *(void *)(inited + 80) = 1701080931;
  *(void *)(inited + 88) = 0xE400000000000000;
  id v10 = objc_msgSend(v2, sel_code);
  *(void *)(inited + 120) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 96) = v10;
  sub_24014402C(inited);
  id v11 = objc_msgSend(v2, sel_userInfo);
  uint64_t v12 = sub_240149768();

  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C82ED0);
  *(void *)&long long v41 = v12;
  sub_2401450A4(&v41, v40);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_240144778(v40, 0x6F666E4972657375, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  id v14 = objc_allocWithZone((Class)UVPropertyList);
  swift_bridgeObjectRetain();
  uint64_t v15 = (void *)sub_240149758();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v14, sel_initWithDictionary_, v15);

  unint64_t v17 = 0x26509C000uLL;
  objc_msgSend(v16, sel_encodeToXpcDictionary_, a1);
  if (xpc_dictionary_get_count(a1))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_268C82E08 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_2401496B8();
    __swift_project_value_buffer(v18, (uint64_t)qword_268C83008);
    unint64_t v19 = v2;
    id v20 = sub_240149698();
    os_log_type_t v21 = sub_240149818();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      id v39 = v16;
      os_log_type_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412290;
      *(void *)&long long v41 = v19;
      unint64_t v24 = v19;
      sub_240149878();
      *os_log_type_t v23 = v19;

      _os_log_impl(&dword_24013D000, v20, v21, "Failed to encode NSError: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C82E90);
      swift_arrayDestroy();
      uint64_t v25 = v23;
      id v16 = v39;
      MEMORY[0x2455DF720](v25, -1, -1);
      uint64_t v26 = v22;
      unint64_t v17 = 0x26509C000;
      MEMORY[0x2455DF720](v26, -1, -1);
    }
    else
    {

      id v20 = v19;
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_268C82ED8);
    uint64_t v27 = swift_initStackObject();
    *(_OWORD *)(v27 + 16) = xmmword_24014A2D0;
    *(void *)(v27 + 32) = sub_240149788();
    *(void *)(v27 + 40) = v28;
    id v29 = [v19 localizedDescription];
    uint64_t v30 = sub_240149788();
    uint64_t v32 = v31;

    *(void *)(v27 + 48) = v30;
    *(void *)(v27 + 56) = v32;
    *(void *)(v27 + 64) = sub_240149788();
    *(void *)(v27 + 72) = v33;
    *(void *)(v27 + 80) = 0xD000000000000038;
    *(void *)(v27 + 88) = 0x800000024014AAC0;
    unint64_t v34 = sub_240144158(v27);
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EE0);
    *(void *)&long long v41 = v34;
    sub_2401450A4(&v41, v40);
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_240144778(v40, 0x6F666E4972657375, 0xE800000000000000, v35);
    swift_bridgeObjectRelease();
    id v36 = objc_allocWithZone((Class)UVPropertyList);
    unint64_t v37 = (void *)sub_240149758();
    swift_bridgeObjectRelease();
    id v38 = objc_msgSend(v36, sel_initWithDictionary_, v37);

    objc_msgSend(v38, *(SEL *)(v17 + 3488), a1);
  }
}

uint64_t sub_240143A00()
{
  swift_unknownObjectRelease();
  sub_240145224((uint64_t)(v0 + 3), &qword_268C82E88);
  sub_2401442B4(v0[8]);
  sub_2401442B4(v0[10]);
  sub_2401442B4(v0[12]);
  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t type metadata accessor for XPCConnection()
{
  return self;
}

uint64_t sub_240143A88(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_240143AA0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCListener.Service(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_240143B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for XPCListener.Service(uint64_t a1)
{
  return sub_240143B78(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_240143B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for XPCListener.Service(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_240143B20(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for XPCListener.Service(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_240143B20(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_240143B78(v8, v9, v10, v11, v12);
  return a1;
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

uint64_t assignWithTake for XPCListener.Service(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_240143B78(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCListener.Service(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCListener.Service(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_240143D84(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_240143D90(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCListener.Service()
{
  return &type metadata for XPCListener.Service;
}

unint64_t sub_240143DB0()
{
  unint64_t result = qword_268C82E80;
  if (!qword_268C82E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C82E80);
  }
  return result;
}

BOOL sub_240143E04(uint64_t a1, uint64_t a2)
{
  return xpc_equal(*(xpc_object_t *)(*(void *)a1 + 16), *(xpc_object_t *)(*(void *)a2 + 16));
}

uint64_t sub_240143E2C()
{
  return sub_240141A70();
}

unint64_t sub_240143E50(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t result = 0xD000000000000021;
  switch(a3)
  {
    case 1:
      sub_2401498A8();
      swift_bridgeObjectRelease();
      goto LABEL_3;
    case 2:
LABEL_3:
      sub_2401497B8();
      sub_2401497B8();
      sub_2401497B8();
      swift_bridgeObjectRelease();
      unint64_t result = 0x6F72724520435058;
      break;
    case 3:
      if (a1 | a2) {
        unint64_t result = 0xD00000000000001FLL;
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_240143FD0()
{
  return sub_240143E50(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
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

unint64_t sub_24014402C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EF0);
  uint64_t v2 = sub_240149918();
  unsigned int v3 = (void *)v2;
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
    sub_240145160(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24014431C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2401450A4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
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

unint64_t sub_240144158(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EE8);
  uint64_t v2 = (void *)sub_240149918();
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
    unint64_t result = sub_24014431C(v5, v6);
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
    void v2[2] = v15;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2401442B4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2401442C4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2401442FC(void *a1)
{
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

unint64_t sub_24014431C(uint64_t a1, uint64_t a2)
{
  sub_2401499B8();
  sub_2401497A8();
  uint64_t v4 = sub_2401499D8();
  return sub_240144394(a1, a2, v4);
}

unint64_t sub_240144394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_240149958() & 1) == 0)
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
      while (!v14 && (sub_240149958() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_240144478(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EF0);
  uint64_t v6 = sub_240149908();
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
      os_log_type_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_2401450A4(v24, v35);
      }
      else
      {
        sub_240145104((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2401499B8();
      sub_2401497A8();
      uint64_t result = sub_2401499D8();
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
      uint64_t result = (uint64_t)sub_2401450A4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_240144778(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24014431C(a2, a3);
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
      sub_240144938();
      goto LABEL_7;
    }
    sub_240144478(v15, a4 & 1);
    unint64_t v21 = sub_24014431C(a2, a3);
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
    uint64_t result = (_OWORD *)sub_240149968();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return sub_2401450A4(a1, v19);
  }
LABEL_13:
  sub_2401448CC(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_2401448CC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_2401450A4(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_240144938()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2401498F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
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
    sub_240145104(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_2401450A4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

uint64_t sub_240144B20()
{
  type metadata accessor for XPCConnection();
  swift_allocObject();
  uint64_t v0 = (_xpc_connection_s *)swift_unknownObjectRetain();
  uint64_t v1 = sub_240140E14(v0);
  uint64_t v2 = qword_268C82E08;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2401496B8();
  __swift_project_value_buffer(v3, (uint64_t)qword_268C83008);
  swift_retain();
  uint64_t v4 = sub_240149698();
  os_log_type_t v5 = sub_240149828();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_retain();
    uint64_t v8 = sub_240141A70();
    unint64_t v10 = v9;
    swift_release();
    sub_2401484A0(v8, v10, &v12);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v4, v5, "%{public}s initialized", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v7, -1, -1);
    MEMORY[0x2455DF720](v6, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    swift_release_n();
  }
  return v1;
}

uint64_t sub_240144D24(void *a1)
{
  uint64_t v2 = MEMORY[0x2455DF8E0]();
  if (v2 != sub_2401496C8())
  {
    MEMORY[0x2455DF860](a1);
    return sub_2401497C8();
  }
  uint64_t v4 = (void *)sub_240149728();
  BOOL v5 = xpc_equal(a1, v4);
  swift_unknownObjectRelease();
  if (v5) {
    return 0;
  }
  uint64_t v6 = (void *)sub_240149708();
  BOOL v7 = xpc_equal(a1, v6);
  swift_unknownObjectRelease();
  if (v7)
  {
    if (xpc_connection_copy_invalidation_reason()) {
      return sub_2401497C8();
    }
    return 0xD000000000000010;
  }
  else
  {
    uint64_t v8 = (void *)sub_240149718();
    BOOL v9 = xpc_equal(a1, v8);
    swift_unknownObjectRelease();
    if (v9)
    {
      return 1;
    }
    else
    {
      unint64_t v10 = (const char *)sub_2401496F8();
      if (xpc_dictionary_get_string(a1, v10)) {
        return sub_2401497C8();
      }
      return 0xD000000000000010;
    }
  }
}

unint64_t sub_240144E74()
{
  unint64_t result = qword_268C82EA0;
  if (!qword_268C82EA0)
  {
    sub_240149838();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C82EA0);
  }
  return result;
}

unint64_t sub_240144ECC()
{
  unint64_t result = qword_268C82EB0;
  if (!qword_268C82EB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C82EA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C82EB0);
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

uint64_t sub_240144F70(void *a1)
{
  return sub_240140F20(a1);
}

uint64_t sub_240144F78(uint64_t a1, uint64_t a2)
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

uint64_t sub_240145020()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_240145060(void *a1, void *a2)
{
  sub_240142F14(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_240145068(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_2401450A4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
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

uint64_t sub_240145104(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_240145160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C82EF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2401451C8()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_240145208(void *a1)
{
  sub_240142320(a1, *(void *)(v1 + 16), *(void (**)(void, void))(v1 + 24));
}

uint64_t sub_240145214(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_240145224(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240145280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C82E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2401452E8(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6 = sub_2401496B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  BOOL v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v33 = a3;
  if (a3) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = sub_240149798();
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)(v11 + 32), 0, v10);
  swift_release();
  type metadata accessor for XPCConnection();
  swift_allocObject();
  int64_t v13 = (_xpc_connection_s *)swift_unknownObjectRetain();
  uint64_t v14 = sub_240140E14(v13);
  uint64_t v15 = qword_268C82E08;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v6, (uint64_t)qword_268C83008);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_240149698();
  os_log_type_t v18 = sub_240149828();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v29 = a1;
    uint64_t v20 = v19;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v35 = v30;
    *(_DWORD *)uint64_t v20 = 136446722;
    xpc_connection_t v31 = mach_service;
    swift_retain();
    uint64_t v21 = sub_240141A70();
    uint64_t v32 = v6;
    unint64_t v23 = v22;
    swift_release();
    uint64_t v34 = sub_2401484A0(v21, v23, &v35);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    if (v33) {
      uint64_t v24 = 0x67656C6976697270;
    }
    else {
      uint64_t v24 = 0;
    }
    if (v33) {
      unint64_t v25 = 0xEB00000000206465;
    }
    else {
      unint64_t v25 = 0xE000000000000000;
    }
    uint64_t v34 = sub_2401484A0(v24, v25, &v35);
    sub_240149878();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_2401484A0(v29, a2, &v35);
    sub_240149878();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24013D000, v17, v18, "Client %{public}s initialized for %{public}smachService %{public}s", (uint8_t *)v20, 0x20u);
    uint64_t v26 = v30;
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v26, -1, -1);
    MEMORY[0x2455DF720](v20, -1, -1);
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v14;
}

uint64_t sub_2401456B8()
{
  xpc_connection_enable_sim2host_4sim();
  type metadata accessor for XPCConnection();
  swift_allocObject();
  uint64_t v0 = (_xpc_connection_s *)swift_unknownObjectRetain();
  uint64_t v1 = sub_240140E14(v0);
  uint64_t v2 = qword_268C82E08;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2401496B8();
  __swift_project_value_buffer(v3, (uint64_t)qword_268C83008);
  swift_retain();
  uint64_t v4 = sub_240149698();
  os_log_type_t v5 = sub_240149828();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_retain();
    uint64_t v8 = sub_240141A70();
    unint64_t v10 = v9;
    swift_release();
    sub_2401484A0(v8, v10, &v12);
    sub_240149878();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v4, v5, "HostToSim Client %{public}s initialized", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v7, -1, -1);
    MEMORY[0x2455DF720](v6, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    swift_release_n();
  }
  return v1;
}

uint64_t destroy for XPCError.Kind(uint64_t a1)
{
  return sub_240143AA0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_240143A88(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_240143A88(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_240143AA0(v6, v7, v8);
  return a1;
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_240143AA0(v4, v5, v6);
  return a1;
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_240145A48(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_240145A60(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCError.Kind()
{
  return &type metadata for XPCError.Kind;
}

unint64_t sub_240145AA0()
{
  unsigned int v1 = *v0;
  switch(v1 >> 5)
  {
    case 1u:
      unint64_t v2 = 0xD000000000000025;
      goto LABEL_6;
    case 2u:
      unint64_t v2 = 0xD000000000000027;
      goto LABEL_6;
    case 3u:
      unint64_t v2 = 0xD000000000000027;
      goto LABEL_6;
    case 4u:
      if (v1 == 128) {
        return 0xD000000000000024;
      }
      else {
        return 0xD000000000000022;
      }
    default:
      unint64_t v2 = 0xD000000000000025;
LABEL_6:
      unint64_t v4 = v2;
      sub_2401497B8();
      swift_bridgeObjectRelease();
      return v4;
  }
}

uint64_t PreviewsService.description.getter()
{
  unsigned int v1 = *v0;
  switch(v1 >> 5)
  {
    case 1u:
      uint64_t v2 = 0x77656976657270;
      goto LABEL_7;
    case 2u:
      uint64_t v3 = 0x50746E656761;
      goto LABEL_6;
    case 3u:
      uint64_t v3 = 0x506C6C656873;
LABEL_6:
      uint64_t v2 = v3 & 0xFFFFFFFFFFFFLL | 0x7069000000000000;
      goto LABEL_7;
    case 4u:
      if (v1 == 128) {
        return 0x73694C6873617263;
      }
      else {
        return 0x45737365636F7270;
      }
    default:
      uint64_t v2 = 0x6C6C6174736E69;
LABEL_7:
      uint64_t v5 = v2;
      sub_2401497B8();
      swift_bridgeObjectRelease();
      return v5;
  }
}

uint64_t sub_240145DB8(char a1, char a2)
{
  if (*(void *)&aInstall_1[8 * a1] == *(void *)&aInstall_1[8 * a2]
    && *(void *)&aAgentpipcrashl[8 * a1 + 24] == *(void *)&aAgentpipcrashl[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_240149958();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_240145E40()
{
  return sub_2401499D8();
}

uint64_t sub_240145EAC()
{
  sub_2401497A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240145F00()
{
  return sub_2401499D8();
}

BOOL static PreviewsService.Variant.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PreviewsService.Variant.hash(into:)()
{
  return sub_2401499C8();
}

uint64_t PreviewsService.Variant.hashValue.getter()
{
  return sub_2401499D8();
}

BOOL sub_240145FF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24014600C()
{
  return sub_2401499D8();
}

uint64_t sub_240146054()
{
  return sub_2401499C8();
}

uint64_t sub_240146080()
{
  return sub_2401499D8();
}

uint64_t PreviewsService.Variant.description.getter()
{
  if (*v0) {
    return 6513005;
  }
  else {
    return 0x746C7561666564;
  }
}

PreviewsServices::PreviewsServiceConnection::Service_optional __swiftcall PreviewsServiceConnection.Service.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_240149938();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t PreviewsServiceConnection.Service.rawValue.getter()
{
  return *(void *)&aInstall_1[8 * *v0];
}

uint64_t sub_240146180(char *a1, char *a2)
{
  return sub_240145DB8(*a1, *a2);
}

uint64_t sub_24014618C()
{
  return sub_240145E40();
}

uint64_t sub_240146194()
{
  return sub_240145EAC();
}

uint64_t sub_24014619C()
{
  return sub_240145F00();
}

PreviewsServices::PreviewsServiceConnection::Service_optional sub_2401461A4(Swift::String *a1)
{
  return PreviewsServiceConnection.Service.init(rawValue:)(*a1);
}

uint64_t sub_2401461B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PreviewsServiceConnection.Service.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id PreviewsServiceConnection.auditToken.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t PreviewsServiceConnection.__allocating_init(service:)()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v0 = sub_240145AA0();
  uint64_t v2 = sub_2401452E8(v0, v1, 1);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  swift_retain();
  xpc_connection_get_audit_token();
  memset(v6, 0, sizeof(v6));
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BE0]), sel_initWithAuditToken_, v6);
  swift_release();
  *(void *)(v3 + 24) = v4;
  return v3;
}

{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _OWORD v6[4];
  uint64_t v7;

  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v0 = sub_240145AA0();
  uint64_t v2 = sub_2401452E8(v0, v1, 1);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  swift_retain();
  xpc_connection_get_audit_token();
  memset(v6, 0, sizeof(v6));
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BE0]), sel_initWithAuditToken_, v6);
  swift_release();
  *(void *)(v3 + 24) = v4;
  return v3;
}

uint64_t PreviewsServiceConnection.__allocating_init(hostToSimConnection:)()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  swift_unknownObjectRetain();
  uint64_t v0 = sub_2401456B8();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  swift_retain();
  xpc_connection_get_audit_token();
  memset(v4, 0, sizeof(v4));
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BE0]), sel_initWithAuditToken_, v4);
  swift_unknownObjectRelease();
  swift_release();
  *(void *)(v1 + 24) = v2;
  return v1;
}

id PreviewsServiceConnection.remotePid.getter()
{
  return objc_msgSend(*(id *)(v0 + 24), sel_pid);
}

uint64_t PreviewsServiceConnection.interruptionHandler.getter()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 64);
  sub_240145214(v1);
  return v1;
}

uint64_t sub_24014651C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(v3 + 72);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_240147FC0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_240145214(v4);
}

uint64_t sub_2401465A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_240147FB0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)a2 + 16);
  uint64_t v8 = *(void *)(v7 + 64);
  *(void *)(v7 + 64) = v6;
  *(void *)(v7 + 72) = v5;
  sub_240145214(v3);
  return sub_2401442B4(v8);
}

uint64_t PreviewsServiceConnection.interruptionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v3 + 64);
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = a2;
  return sub_2401442B4(v4);
}

uint64_t (*PreviewsServiceConnection.interruptionHandler.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = *(void *)(v1 + 16);
  a1[2] = v3;
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(v3 + 72);
  *a1 = v4;
  a1[1] = v5;
  sub_240145214(v4);
  return sub_2401466A4;
}

uint64_t sub_2401466A4(uint64_t *a1, char a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = *a1;
  *(void *)(v2 + 72) = v3;
  if (a2)
  {
    sub_240145214(v4);
    sub_2401442B4(v5);
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = v5;
  }
  return sub_2401442B4(v6);
}

uint64_t PreviewsServiceConnection.invalidationHandler.getter()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 80);
  sub_240145214(v1);
  return v1;
}

uint64_t sub_240146750@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = *(void *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 88);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_240147F88;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_240145214(v4);
}

uint64_t sub_2401467D8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_240147F60;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)a2 + 16);
  uint64_t v8 = *(void *)(v7 + 80);
  *(void *)(v7 + 80) = v6;
  *(void *)(v7 + 88) = v5;
  sub_240145214(v3);
  return sub_2401442B4(v8);
}

uint64_t PreviewsServiceConnection.invalidationHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = a2;
  return sub_2401442B4(v4);
}

uint64_t (*PreviewsServiceConnection.invalidationHandler.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = *(void *)(v1 + 16);
  a1[2] = v3;
  uint64_t v4 = *(void *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 88);
  *a1 = v4;
  a1[1] = v5;
  sub_240145214(v4);
  return sub_2401468D8;
}

uint64_t sub_2401468D8(uint64_t *a1, char a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v2 + 80);
  *(void *)(v2 + 80) = *a1;
  *(void *)(v2 + 88) = v3;
  if (a2)
  {
    sub_240145214(v4);
    sub_2401442B4(v5);
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = v5;
  }
  return sub_2401442B4(v6);
}

Swift::Void __swiftcall PreviewsServiceConnection.invalidate()()
{
}

uint64_t PreviewsServiceConnection.activate(receiver:)(uint64_t a1)
{
  sub_240147370(a1, (uint64_t)&v4);
  if (v5)
  {
    sub_240147438(&v4, (uint64_t)v7);
    uint64_t v2 = *(void *)(v1 + 16);
    uint64_t v5 = &type metadata for PreviewsServiceConnection.InterfaceTarget;
    uint64_t v6 = &off_26F3F7B98;
    *(void *)&long long v4 = swift_allocObject();
    sub_240147438(v7, v4 + 16);
    swift_beginAccess();
    sub_240145280((uint64_t)&v4, v2 + 24);
    swift_endAccess();
  }
  else
  {
    sub_2401473D8((uint64_t)&v4);
  }
  return sub_240141C38();
}

Swift::Void __swiftcall PreviewsServiceConnection.send(message:)(UVPropertyList message)
{
}

uint64_t PreviewsServiceConnection.send(message:replyHandler:)(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24014205C(a1, a2, a3);
}

uint64_t PreviewsServiceConnection.deinit()
{
  swift_release();

  return v0;
}

uint64_t PreviewsServiceConnection.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

char *static PreviewsServiceConnection.Listener.local(service:)(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *a1;
  long long v4 = (char *)objc_allocWithZone(v1);
  uint64_t v5 = &v4[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  v13[0] = v3;
  type metadata accessor for XPCListener();
  memset(&v13[1], 0, 24);
  char v14 = 0;
  swift_allocObject();
  uint64_t v6 = v4;
  *(void *)&v6[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener] = sub_24013F498((uint64_t)v13);

  v12.receiver = v6;
  v12.super_class = v2;
  uint64_t v7 = (char *)objc_msgSendSuper2(&v12, sel_init);
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener];
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = *(void *)(v8 + 64);
  *(void *)(v8 + 64) = sub_2401474C0;
  *(void *)(v8 + 72) = v9;
  sub_2401442B4(v10);
  return v7;
}

char *static PreviewsServiceConnection.Listener.hostToSim(machServiceName:description:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = (char *)objc_allocWithZone(v5);
  uint64_t v11 = &v10[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  v19[0] = a1;
  v19[1] = a2;
  v19[2] = a3;
  v19[3] = a4;
  char v20 = 1;
  type metadata accessor for XPCListener();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  objc_super v12 = v10;
  *(void *)&v12[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener] = sub_24013F498((uint64_t)v19);

  v18.receiver = v12;
  v18.super_class = v5;
  int64_t v13 = (char *)objc_msgSendSuper2(&v18, sel_init);
  uint64_t v14 = *(void *)&v13[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener];
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = *(void *)(v14 + 64);
  *(void *)(v14 + 64) = sub_2401474C0;
  *(void *)(v14 + 72) = v15;
  sub_2401442B4(v16);
  return v13;
}

uint64_t sub_240146D00(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2455DF7A0](v3);
  if (result)
  {
    uint64_t v5 = (char *)result;
    long long v38 = 0u;
    long long v39 = 0u;
    xpc_connection_get_audit_token();
    unint64_t v6 = 0x263F29000uLL;
    unint64_t v7 = 0x26509C000uLL;
    long long v36 = 0u;
    long long v37 = 0u;
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BE0]), sel_initWithAuditToken_, &v36);
    id v9 = objc_msgSend(v8, sel_bundleID);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_240149788();
      unint64_t v13 = v12;
    }
    else
    {
      unint64_t v13 = 0xE700000000000000;
      uint64_t v11 = 0x6E776F6E6B6E55;
    }
    uint64_t v14 = (void *)sub_240149778();
    unsigned int v15 = objc_msgSend(v8, sel_hasEntitlement_, v14);

    if (v15)
    {
      uint64_t v34 = v11;
      if (qword_268C82E00 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_2401496B8();
      __swift_project_value_buffer(v16, (uint64_t)qword_268C82FF0);
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_240149698();
      os_log_type_t v18 = sub_2401497F8();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        id v32 = v8;
        uint64_t v20 = swift_slowAlloc();
        *(void *)&long long v38 = v20;
        *(_DWORD *)uint64_t v19 = 136446210;
        swift_bridgeObjectRetain();
        *(void *)&long long v36 = sub_2401484A0(v34, v13, (uint64_t *)&v38);
        unint64_t v6 = 0x263F29000;
        sub_240149878();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24013D000, v17, v18, "Accepting new connection from entitled client: %{public}s", v19, 0xCu);
        swift_arrayDestroy();
        uint64_t v21 = v20;
        id v8 = v32;
        MEMORY[0x2455DF720](v21, -1, -1);
        unint64_t v22 = v19;
        unint64_t v7 = 0x26509C000;
        MEMORY[0x2455DF720](v22, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      type metadata accessor for PreviewsServiceConnection();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = a1;
      long long v38 = 0u;
      long long v39 = 0u;
      swift_retain();
      xpc_connection_get_audit_token();
      long long v33 = v39;
      long long v35 = v38;
      id v29 = objc_allocWithZone(*(Class *)(v6 + 3040));
      uint64_t v30 = *(const char **)(v7 + 3472);
      long long v36 = v35;
      long long v37 = v33;
      *(void *)(v28 + 24) = objc_msgSend(v29, v30, &v36);
      xpc_connection_t v31 = *(void (**)(uint64_t))&v5[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler];
      if (v31)
      {
        swift_retain();
        v31(v28);
        sub_2401442B4((uint64_t)v31);
      }

      swift_release();
      return 1;
    }
    else
    {
      if (qword_268C82E00 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_2401496B8();
      __swift_project_value_buffer(v23, (uint64_t)qword_268C82FF0);
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_240149698();
      os_log_type_t v25 = sub_2401497F8();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        *(void *)&long long v38 = v27;
        *(_DWORD *)uint64_t v26 = 136446210;
        swift_bridgeObjectRetain();
        *(void *)&long long v36 = sub_2401484A0(v11, v13, (uint64_t *)&v38);
        sub_240149878();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24013D000, v24, v25, "Rejecting connection from unentitled client: %{public}s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2455DF720](v27, -1, -1);
        MEMORY[0x2455DF720](v26, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      return 0;
    }
  }
  return result;
}

uint64_t PreviewsServiceConnection.Listener.activate(handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler);
  *uint64_t v3 = a1;
  v3[1] = a2;
  sub_2401442B4(v4);
  swift_retain();
  return sub_240140DBC();
}

id PreviewsServiceConnection.Listener.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PreviewsServiceConnection.Listener.init()()
{
}

id PreviewsServiceConnection.Listener.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_240147370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C82F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2401473D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C82F70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240147438(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_240147450()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_240147488()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2401474C0(uint64_t a1)
{
  return sub_240146D00(a1, v1);
}

unint64_t sub_2401474CC()
{
  unint64_t result = qword_268C82F88;
  if (!qword_268C82F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C82F88);
  }
  return result;
}

unint64_t sub_240147524()
{
  unint64_t result = qword_268C82F90;
  if (!qword_268C82F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C82F90);
  }
  return result;
}

uint64_t dispatch thunk of PreviewsServiceMessageReceiver.receive(message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PreviewsServiceMessageReceiver.receive(message:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewsService(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7C) {
    goto LABEL_17;
  }
  if (a2 + 132 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 132) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 132;
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
      return (*a1 | (v4 << 8)) - 132;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 132;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 5) & 0xFFFFFF87 | (8 * ((*a1 >> 1) & 0xF))) ^ 0x7F;
  if (v6 >= 0x7B) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for PreviewsService(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 132 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 132) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7C) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7B)
  {
    unsigned int v6 = ((a2 - 124) >> 8) + 1;
    *unint64_t result = a2 - 124;
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
        JUMPOUT(0x240147738);
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
          *unint64_t result = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_240147760(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 5;
  }
  else {
    return v1 & 1 | 4u;
  }
}

unsigned char *sub_24014777C(unsigned char *result)
{
  *result &= 0x1Fu;
  return result;
}

unsigned char *sub_24014778C(unsigned char *result, unsigned int a2)
{
  if (a2 < 4) {
    *unint64_t result = *result & 1 | (32 * a2);
  }
  else {
    *unint64_t result = a2 & 1 | 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewsService()
{
  return &type metadata for PreviewsService;
}

uint64_t getEnumTagSinglePayload for PreviewsService.Variant(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewsService.Variant(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x240147924);
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

uint64_t sub_24014794C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_240147954(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewsService.Variant()
{
  return &type metadata for PreviewsService.Variant;
}

uint64_t type metadata accessor for PreviewsServiceConnection()
{
  return self;
}

uint64_t method lookup function for PreviewsServiceConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreviewsServiceConnection);
}

uint64_t getEnumTagSinglePayload for PreviewsServiceConnection.Service(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewsServiceConnection.Service(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x240147B08);
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

unsigned char *sub_240147B30(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewsServiceConnection.Service()
{
  return &type metadata for PreviewsServiceConnection.Service;
}

uint64_t type metadata accessor for PreviewsServiceConnection.Listener()
{
  return self;
}

uint64_t method lookup function for PreviewsServiceConnection.Listener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreviewsServiceConnection.Listener);
}

uint64_t initializeWithCopy for PreviewsServiceConnection.InterfaceTarget(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for PreviewsServiceConnection.InterfaceTarget(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
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
        *long long v3 = v12;
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
          *long long v3 = *a2;
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PreviewsServiceConnection.InterfaceTarget(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewsServiceConnection.InterfaceTarget(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewsServiceConnection.InterfaceTarget(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewsServiceConnection.InterfaceTarget()
{
  return &type metadata for PreviewsServiceConnection.InterfaceTarget;
}

uint64_t sub_240147F28()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_240147F60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_240147F88()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_240147FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[3] = a2;
  _OWORD v6[4] = v2;
  v6[1] = sub_24014807C;
  v6[2] = a1;
  return MEMORY[0x270FA2498](sub_24014819C, 0, 0);
}

uint64_t sub_24014807C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t static MinimalRegistryEntry.scrapeRuntimeForEntriesAsync()(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  _OWORD v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24014819C, 0, 0);
}

uint64_t sub_24014819C()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0[3] + 64))(v0[2]);
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_240148210()
{
  return static MinimalRegistryEntry.scrapeRuntimeForEntries()();
}

uint64_t static MinimalRegistryEntry.scrapeRuntimeForEntries()()
{
  if (qword_268C82E00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2401496B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_268C82FF0);
  uint64_t v1 = sub_240149698();
  os_log_type_t v2 = sub_240149818();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v8 = v4;
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v5 = sub_2401499E8();
    sub_2401484A0(v5, v6, &v8);
    sub_240149878();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24013D000, v1, v2, "%s does not implement 'scrapeRuntimeForEntriesAsync'", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455DF720](v4, -1, -1);
    MEMORY[0x2455DF720](v3, -1, -1);
  }

  return sub_2401497E8();
}

uint64_t sub_2401483B4(uint64_t result, unsigned char **a2)
{
  os_log_type_t v2 = *a2;
  *os_log_type_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2401483C4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_240148400(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_240148428(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2401484A0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_240149878();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2401484A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_240148574(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_240145104((uint64_t)v12, *a3);
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
      sub_240145104((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_240148574(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240149888();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_240148730(a5, a6);
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
  uint64_t v8 = sub_2401498C8();
  if (!v8)
  {
    sub_2401498E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_240149928();
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

uint64_t sub_240148730(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2401487C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2401489A8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2401489A8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2401487C8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_240148940(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2401498B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2401498E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2401497D8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_240149928();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2401498E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_240148940(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C82FB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2401489A8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C82FB8);
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
  uint64_t result = sub_240149928();
  __break(1u);
  return result;
}

unsigned char **sub_240148AF8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t dispatch thunk of MinimalRegistryEntry.fileID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MinimalRegistryEntry.line.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MinimalRegistryEntry.column.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MinimalRegistryEntry.makeExecutable()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 40) + **(int **)(a3 + 40));
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = sub_240148C4C;
  return v9(a1, a2, a3);
}

uint64_t sub_240148C4C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of static MinimalRegistryEntry.typeDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static MinimalRegistryEntry.scrapeRuntimeForEntriesAsync()(uint64_t a1, uint64_t a2)
{
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_240148E98;
  return v7(a1, a2);
}

uint64_t dispatch thunk of static MinimalRegistryEntry.scrapeRuntimeForEntries()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static RegistryEntry.registryTypeRawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RegistryExecutable.metadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of RegistryExecutable.run()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

unint64_t static OS_os_log.UltravioletConstants.subsystem.getter()
{
  return 0xD000000000000015;
}

void sub_240148EB8()
{
  qword_268C82FC0 = 30325;
  *(void *)algn_268C82FC8 = 0xE200000000000000;
}

uint64_t static OS_os_log.UltravioletConstants.Categories.uv.getter()
{
  return sub_240148F40(&qword_268C82DE0, &qword_268C82FC0);
}

void sub_240148EF8()
{
  qword_268C82FD0 = 0x63707862696CLL;
  *(void *)algn_268C82FD8 = 0xE600000000000000;
}

uint64_t static OS_os_log.UltravioletConstants.Categories.libxpc.getter()
{
  return sub_240148F40(&qword_268C82DE8, &qword_268C82FD0);
}

uint64_t sub_240148F40(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_240148F94()
{
  sub_2401494A0();
  if (qword_268C82DE0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_240149868();
  qword_268C82FE0 = result;
  return result;
}

id static OS_os_log.uvOS.getter()
{
  return sub_2401490DC(&qword_268C82DF0, (void **)&qword_268C82FE0);
}

uint64_t sub_240149058()
{
  sub_2401494A0();
  uint64_t result = sub_240149868();
  qword_268C82FE8 = result;
  return result;
}

id static OS_os_log.services.getter()
{
  return sub_2401490DC(&qword_268C82DF8, (void **)&qword_268C82FE8);
}

id sub_2401490DC(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

uint64_t sub_240149128()
{
  uint64_t v0 = sub_2401496B8();
  __swift_allocate_value_buffer(v0, qword_268C82FF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C82FF0);
  if (qword_268C82DE0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_2401496A8();
}

uint64_t static Logger.uvOS.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_240149384(&qword_268C82E00, (uint64_t)qword_268C82FF0, a1);
}

uint64_t sub_240149208()
{
  uint64_t v0 = sub_2401496B8();
  __swift_allocate_value_buffer(v0, qword_268C83008);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C83008);
  if (qword_268C82DE8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_2401496A8();
}

uint64_t static Logger.libxpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_240149384(&qword_268C82E08, (uint64_t)qword_268C83008, a1);
}

uint64_t sub_2401492E8()
{
  uint64_t v0 = sub_2401496B8();
  __swift_allocate_value_buffer(v0, qword_268C83020);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C83020);
  return sub_2401496A8();
}

uint64_t static Logger.services.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_240149384(qword_268C82E10, (uint64_t)qword_268C83020, a1);
}

uint64_t sub_240149384@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2401496B8();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  int64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for OS_os_log.UltravioletConstants()
{
  return &type metadata for OS_os_log.UltravioletConstants;
}

ValueMetadata *type metadata accessor for OS_os_log.UltravioletConstants.Categories()
{
  return &type metadata for OS_os_log.UltravioletConstants.Categories;
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

unint64_t sub_2401494A0()
{
  unint64_t result = qword_268C83038;
  if (!qword_268C83038)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C83038);
  }
  return result;
}

uint64_t sub_240149668()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_240149678()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_240149688()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_240149698()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2401496A8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2401496B8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2401496C8()
{
  return MEMORY[0x270FA19D0]();
}

uint64_t sub_2401496D8()
{
  return MEMORY[0x270FA1A38]();
}

uint64_t sub_2401496E8()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_2401496F8()
{
  return MEMORY[0x270FA1A50]();
}

uint64_t sub_240149708()
{
  return MEMORY[0x270FA1A58]();
}

uint64_t sub_240149718()
{
  return MEMORY[0x270FA1A60]();
}

uint64_t sub_240149728()
{
  return MEMORY[0x270FA1A68]();
}

uint64_t sub_240149738()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_240149748()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_240149758()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_240149768()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_240149778()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_240149788()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_240149798()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2401497A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2401497B8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2401497C8()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2401497D8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2401497E8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2401497F8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_240149808()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_240149818()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_240149828()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_240149838()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_240149848()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_240149858()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_240149868()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_240149878()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_240149888()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_240149898()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2401498A8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2401498B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2401498C8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2401498D8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2401498E8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2401498F8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_240149908()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_240149918()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_240149928()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_240149938()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_240149948()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_240149958()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_240149968()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_240149978()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_240149988()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_240149998()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2401499A8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2401499B8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2401499C8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2401499D8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2401499E8()
{
  return MEMORY[0x270FA0128]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x270EDBE38]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_enable_sim2host_4sim()
{
  return MEMORY[0x270EDBE60]();
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}