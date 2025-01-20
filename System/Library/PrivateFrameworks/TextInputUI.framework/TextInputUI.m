unint64_t sub_18D4811BC()
{
  unint64_t result;

  result = qword_1EB4460E8;
  if (!qword_1EB4460E8)
  {
    self;
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB4460E8);
  }
  return result;
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

uint64_t sub_18D481288@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus;
  swift_beginAccess();
  return sub_18D4812DC(v3, a1);
}

uint64_t sub_18D4812DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18D481344(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus;
  swift_beginAccess();
  sub_18D4813A0(a1, v3);
  return swift_endAccess();
}

uint64_t sub_18D4813A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_18D481408())()
{
  return j__swift_endAccess;
}

uint64_t sub_18D481468()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_18D4814B4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_pendingCompletions);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_18D481508())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_18D481564()
{
  uint64_t v0 = sub_18D50B0D8();
  __swift_allocate_value_buffer(v0, qword_1E91B7B20);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E91B7B20);
  return sub_18D50B0C8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_18D48167C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_18D481730(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_delegate);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_18D481784())()
{
  return j_j__swift_endAccess;
}

char *sub_18D4817E0()
{
  uint64_t v1 = OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_monitor;
  sub_18D50B158();
  swift_allocObject();
  v34 = v0;
  *(void *)&v0[v1] = sub_18D50B148();
  uint64_t v33 = OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue;
  unint64_t v26 = sub_18D4811BC();
  uint64_t v31 = *(void *)(*(void *)(sub_18D50B348() - 8) + 64);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v32 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_18D50B338();
  uint64_t v3 = *(void *)(*(void *)(sub_18D50B478() - 8) + 64);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v30 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v36 = MEMORY[0x1E4FBC860];
  uint64_t v29 = sub_18D483ED4(&qword_1EB4460E0, MEMORY[0x1F41AB0F8]);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4460D0);
  uint64_t v27 = sub_18D483F1C(&qword_1EB4460D8, &qword_1EB4460D0);
  sub_18D50B548();
  uint64_t v4 = sub_18D50B488();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v25 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = *MEMORY[0x1E4FBCC50];
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v24((char *)&v24 - v25, v7, v4);
  uint64_t v8 = sub_18D50B4A8();
  v9 = v34;
  *(void *)&v34[v33] = v8;
  uint64_t v33 = OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_callbackQueue;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v10 = sub_18D50B338();
  MEMORY[0x1F4188790](v10);
  uint64_t v36 = MEMORY[0x1E4FBC860];
  uint64_t v11 = sub_18D50B548();
  MEMORY[0x1F4188790](v11);
  v24((char *)&v24 - v25, v7, v4);
  *(void *)&v9[v33] = sub_18D50B4A8();
  v12 = &v9[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus];
  uint64_t v13 = sub_18D50B178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(void *)&v9[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_pendingCompletions] = MEMORY[0x1E4FBC860];
  *(void *)&v9[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_delegate] = 0;

  v14 = (objc_class *)type metadata accessor for TUINetworkObserver();
  v35.receiver = v9;
  v35.super_class = v14;
  id v15 = objc_msgSendSuper2(&v35, sel_init);
  *(void *)(swift_allocObject() + 16) = v15;
  v16 = (char *)v15;
  swift_retain();
  sub_18D481E3C((uint64_t)sub_18D481DE8);
  sub_18D50B128();
  swift_release();
  swift_release();
  v17 = *(void **)&v16[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue];
  swift_retain();
  id v18 = v17;
  sub_18D50B138();
  swift_release();

  if (qword_1E91B7640 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_18D50B0D8();
  __swift_project_value_buffer(v19, (uint64_t)qword_1E91B7B20);
  v20 = sub_18D50B0B8();
  os_log_type_t v21 = sub_18D50B468();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_18D47E000, v20, v21, "Begin network observation", v22, 2u);
    MEMORY[0x192FA1220](v22, -1, -1);
  }

  return v16;
}

uint64_t type metadata accessor for TUINetworkObserver()
{
  uint64_t result = qword_1EB446140;
  if (!qword_1EB446140) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18D481DB0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18D481DE8()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 16)) + 0xD0))();
}

uint64_t sub_18D481E3C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_18D481E70(void (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  char v14 = 2;
  uint64_t v7 = *(NSObject **)&v3[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue];
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  v8[5] = &v14;
  v8[6] = ObjectType;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_18D483BDC;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = sub_18D483BF8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18D482648;
  aBlock[3] = &block_descriptor;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = v3;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v7)
  {
    __break(1u);
  }
  else
  {
    if (v14 != 2) {
      a1(v14 & 1);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_18D482018(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v60 = a3;
  v61 = a4;
  uint64_t v59 = a2;
  uint64_t v5 = sub_18D50B178();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v54 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6570);
  MEMORY[0x1F4188790](v56);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6568);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v55 = (uint64_t)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  id v15 = (char *)&v54 - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  id v18 = (char *)&v54 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  os_log_type_t v21 = (char *)&v54 - v20;
  v22 = *(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *a1) + 0x80);
  v22(v19);
  uint64_t v57 = v6;
  uint64_t v58 = v5;
  uint64_t v23 = v5;
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  int v25 = v24(v21, 1, v23);
  uint64_t v26 = sub_18D483D48((uint64_t)v21, &qword_1E91B6568);
  if (v25 == 1)
  {
    if (qword_1E91B7640 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_18D50B0D8();
    __swift_project_value_buffer(v27, (uint64_t)qword_1E91B7B20);
    uint64_t v28 = sub_18D50B0B8();
    os_log_type_t v29 = sub_18D50B468();
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v30 = 0;
      _os_log_impl(&dword_18D47E000, v28, v29, "network availability requested but still initializing, adding pending completions", v30, 2u);
      MEMORY[0x192FA1220](v30, -1, -1);
    }

    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v59;
    *(void *)(v31 + 24) = v60;
    unint64_t v32 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & *a1) + 0xA8);
    swift_retain();
    uint64_t v33 = (uint64_t (*)(unsigned char *, void))v32(v62);
    objc_super v35 = v34;
    uint64_t v36 = *v34;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *objc_super v35 = v36;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v36 = sub_18D483C38(0, v36[2] + 1, 1, v36);
      *objc_super v35 = v36;
    }
    unint64_t v39 = v36[2];
    unint64_t v38 = v36[3];
    if (v39 >= v38 >> 1)
    {
      uint64_t v36 = sub_18D483C38((void *)(v38 > 1), v39 + 1, 1, v36);
      *objc_super v35 = v36;
    }
    v36[2] = v39 + 1;
    v40 = &v36[2 * v39];
    v40[4] = sub_18D4842DC;
    v40[5] = v31;
    return v33(v62, 0);
  }
  else
  {
    v22(v26);
    uint64_t v43 = v57;
    uint64_t v42 = v58;
    (*(void (**)(char *, void, uint64_t))(v57 + 104))(v15, *MEMORY[0x1E4F38B20], v58);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v15, 0, 1, v42);
    uint64_t v44 = (uint64_t)&v9[*(int *)(v56 + 48)];
    sub_18D4812DC((uint64_t)v18, (uint64_t)v9);
    sub_18D4812DC((uint64_t)v15, v44);
    v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v24;
    int v46 = v24(v9, 1, v42);
    uint64_t v47 = (uint64_t)v15;
    if (v46 == 1)
    {
      sub_18D483D48((uint64_t)v15, &qword_1E91B6568);
      sub_18D483D48((uint64_t)v18, &qword_1E91B6568);
      int v48 = v45(v44, 1, v42);
      if (v48 == 1) {
        v49 = &qword_1E91B6568;
      }
      else {
        v49 = &qword_1E91B6570;
      }
      if (v48 == 1) {
        char v50 = -1;
      }
      else {
        char v50 = 0;
      }
    }
    else
    {
      uint64_t v51 = v55;
      sub_18D4812DC((uint64_t)v9, v55);
      if (v45(v44, 1, v42) == 1)
      {
        sub_18D483D48((uint64_t)v15, &qword_1E91B6568);
        sub_18D483D48((uint64_t)v18, &qword_1E91B6568);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v51, v42);
        char v50 = 0;
        v49 = &qword_1E91B6570;
      }
      else
      {
        v52 = v54;
        (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v54, v44, v42);
        sub_18D48410C();
        char v50 = sub_18D50B388();
        v53 = *(void (**)(char *, uint64_t))(v43 + 8);
        v53(v52, v42);
        v49 = &qword_1E91B6568;
        sub_18D483D48(v47, &qword_1E91B6568);
        sub_18D483D48((uint64_t)v18, &qword_1E91B6568);
        v53((char *)v51, v42);
      }
    }
    uint64_t result = sub_18D483D48((uint64_t)v9, v49);
    unsigned char *v61 = v50 & 1;
  }
  return result;
}

uint64_t sub_18D482648(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_18D4826FC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v129 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6570);
  MEMORY[0x1F4188790](v3);
  *(void *)&long long v130 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6568);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  v120 = (char *)&v112 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v116 = (uint64_t)&v112 - v9;
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v112 - v11;
  MEMORY[0x1F4188790](v10);
  v133 = (uint64_t *)((char *)&v112 - v13);
  uint64_t v134 = sub_18D50B178();
  v132 = *(uint64_t **)(v134 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v134);
  v118 = (char *)&v112 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  v121 = (char *)&v112 - v16;
  uint64_t v17 = sub_18D50B198();
  uint64_t v128 = *(void *)(v17 - 8);
  uint64_t v18 = *(void *)(v128 + 64);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  v126 = (char *)&v112 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  os_log_type_t v21 = (char *)&v112 - v20;
  uint64_t v22 = sub_18D50B358();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  int v25 = (uint64_t *)((char *)&v112 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = *(void **)((char *)v2 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue);
  *int v25 = v26;
  (*(void (**)(void *, void, uint64_t))(v23 + 104))(v25, *MEMORY[0x1E4FBCBE8], v22);
  id v27 = v26;
  LOBYTE(v26) = sub_18D50B368();
  (*(void (**)(void *, uint64_t))(v23 + 8))(v25, v22);
  if (v26)
  {
    v131 = v12;
    uint64_t v125 = v18;
    if (qword_1E91B7640 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v122 = v3;
  uint64_t v28 = sub_18D50B0D8();
  uint64_t v29 = __swift_project_value_buffer(v28, (uint64_t)qword_1E91B7B20);
  uint64_t v30 = v128;
  uint64_t v31 = v128 + 16;
  v123 = *(void (**)(char *, uint64_t, uint64_t))(v128 + 16);
  v123(v21, v129, v17);
  v119 = (uint64_t (**)(uint64_t))v29;
  unint64_t v32 = sub_18D50B0B8();
  os_log_type_t v33 = sub_18D50B468();
  int v34 = v33;
  BOOL v35 = os_log_type_enabled(v32, v33);
  v117 = v2;
  uint64_t v127 = v17;
  uint64_t v124 = v31;
  if (v35)
  {
    v115 = v32;
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 67109120;
    v37 = v121;
    sub_18D50B188();
    uint64_t v38 = *MEMORY[0x1E4F38B20];
    int v114 = v34;
    unint64_t v39 = v132;
    v40 = (void (*)(char *, uint64_t, uint64_t))v132[13];
    v113 = v21;
    v41 = v118;
    uint64_t v42 = v134;
    v40(v118, v38, v134);
    char v43 = sub_18D50B168();
    uint64_t v44 = (void (*)(char *, uint64_t))v39[1];
    v44(v41, v42);
    v44(v37, v42);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v113, v127);
    LODWORD(aBlock) = v43 & 1;
    unint64_t v32 = v115;
    sub_18D50B4F8();
    _os_log_impl(&dword_18D47E000, v32, (os_log_type_t)v114, "Network observer observed availability update: %{BOOL}d", v36, 8u);
    v45 = v36;
    uint64_t v2 = v117;
    MEMORY[0x192FA1220](v45, -1, -1);
    uint64_t v46 = (uint64_t)v133;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v21, v17);
    unint64_t v39 = v132;
    uint64_t v46 = (uint64_t)v133;
    uint64_t v42 = v134;
  }

  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x80))();
  uint64_t v47 = (uint64_t)v131;
  sub_18D50B188();
  v118 = (char *)v39[7];
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v118)(v47, 0, 1, v42);
  uint64_t v48 = v130;
  uint64_t v49 = v130 + *(int *)(v122 + 48);
  sub_18D4812DC(v46, v130);
  sub_18D4812DC(v47, v49);
  char v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v39[6];
  if (v50(v48, 1, v42) == 1)
  {
    sub_18D483D48(v47, &qword_1E91B6568);
    sub_18D483D48(v46, &qword_1E91B6568);
    int v51 = v50(v49, 1, v42);
    v52 = v117;
    v53 = (void *)MEMORY[0x1E4FBC8C8];
    if (v51 == 1)
    {
      uint64_t v54 = sub_18D483D48(v48, &qword_1E91B6568);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v55 = v116;
    sub_18D4812DC(v48, v116);
    if (v50(v49, 1, v42) != 1)
    {
      uint64_t v56 = v132;
      uint64_t v57 = v121;
      ((void (*)(char *, uint64_t, uint64_t))v132[4])(v121, v49, v134);
      sub_18D48410C();
      char v58 = sub_18D50B388();
      uint64_t v59 = v48;
      uint64_t v60 = (void (*)(char *, uint64_t))v56[1];
      v60(v57, v134);
      sub_18D483D48((uint64_t)v131, &qword_1E91B6568);
      sub_18D483D48((uint64_t)v133, &qword_1E91B6568);
      v60((char *)v55, v134);
      uint64_t v42 = v134;
      uint64_t v54 = sub_18D483D48(v59, &qword_1E91B6568);
      v52 = v117;
      v53 = (void *)MEMORY[0x1E4FBC8C8];
      if (v58) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    sub_18D483D48((uint64_t)v131, &qword_1E91B6568);
    sub_18D483D48((uint64_t)v133, &qword_1E91B6568);
    ((void (*)(uint64_t, uint64_t))v132[1])(v55, v42);
    v52 = v117;
    v53 = (void *)MEMORY[0x1E4FBC8C8];
  }
  sub_18D483D48(v48, &qword_1E91B6570);
LABEL_13:
  v61 = v120;
  uint64_t v62 = v129;
  sub_18D50B188();
  ((void (*)(char *, void, uint64_t, uint64_t))v118)(v61, 0, 1, v42);
  (*(void (**)(char *))((*v53 & *v52) + 0x88))(v61);
  uint64_t v134 = *(void *)((char *)v52 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_callbackQueue);
  v64 = v126;
  uint64_t v63 = v127;
  v123(v126, v62, v127);
  uint64_t v65 = v128;
  unint64_t v66 = (*(unsigned __int8 *)(v128 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80);
  uint64_t v67 = swift_allocObject();
  *(void *)(v67 + 16) = v52;
  (*(void (**)(unint64_t, char *, uint64_t))(v65 + 32))(v67 + v66, v64, v63);
  v140 = sub_18D483E70;
  uint64_t v141 = v67;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v137 = 1107296256;
  v138 = sub_18D483934;
  v139 = &block_descriptor_12;
  v68 = _Block_copy(&aBlock);
  uint64_t v69 = sub_18D50B348();
  v133 = &v112;
  uint64_t v70 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69);
  v72 = (char *)&v112 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = v52;
  sub_18D50B338();
  uint64_t v74 = sub_18D50B328();
  v132 = &v112;
  uint64_t v75 = *(void *)(v74 - 8);
  MEMORY[0x1F4188790](v74);
  v77 = (char *)&v112 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = MEMORY[0x1E4FBC860];
  sub_18D483ED4(&qword_1E91B6578, MEMORY[0x1F41AAF48]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6580);
  sub_18D483F1C(&qword_1E91B6588, &qword_1E91B6580);
  v78 = (void *)MEMORY[0x1E4FBC8C8];
  sub_18D50B548();
  MEMORY[0x192F9FEC0](0, v72, v77, v68);
  _Block_release(v68);
  v79 = v77;
  v52 = v117;
  (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v74);
  uint64_t v80 = v69;
  v53 = v78;
  (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v80);
  uint64_t v54 = swift_release();
LABEL_14:
  v81 = *(uint64_t (**)(void))((*v53 & *v52) + 0x98);
  uint64_t v82 = *(void *)(((uint64_t (*)(uint64_t))v81)(v54) + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v82)
  {
    v84 = sub_18D50B0B8();
    os_log_type_t v85 = sub_18D50B468();
    if (os_log_type_enabled(v84, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v86 = 0;
      _os_log_impl(&dword_18D47E000, v84, v85, "Network observer done initializing, invoking pending completions", v86, 2u);
      MEMORY[0x192FA1220](v86, -1, -1);
    }

    uint64_t v116 = v81();
    uint64_t v87 = *(void *)(v116 + 16);
    uint64_t v89 = v128;
    uint64_t v88 = v129;
    v91 = v126;
    uint64_t v90 = v127;
    v92 = v123;
    if (v87)
    {
      uint64_t v93 = sub_18D50B328();
      v121 = *(char **)((char *)v117 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_callbackQueue);
      v94 = (long long *)(v116 + 32);
      v120 = (char *)(v89 + 32);
      v119 = &v138;
      uint64_t v122 = v93;
      v118 = (char *)(v93 - 8);
      uint64_t v95 = v93;
      do
      {
        uint64_t v134 = v87;
        uint64_t v96 = swift_allocObject();
        long long v130 = *v94;
        *(_OWORD *)(v96 + 16) = v130;
        v92(v91, v88, v90);
        unint64_t v97 = (*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
        uint64_t v98 = swift_allocObject();
        *(void *)(v98 + 16) = sub_18D483FA4;
        *(void *)(v98 + 24) = v96;
        (*(void (**)(unint64_t, char *, uint64_t))(v89 + 32))(v98 + v97, v91, v90);
        v140 = sub_18D4840A8;
        uint64_t v141 = v98;
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v137 = 1107296256;
        v138 = sub_18D483934;
        v139 = &block_descriptor_21;
        v131 = _Block_copy(&aBlock);
        v132 = (uint64_t *)sub_18D50B348();
        v133 = &v112;
        uint64_t v99 = *(v132 - 1);
        MEMORY[0x1F4188790](v132);
        v101 = (char *)&v112 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0);
        swift_retain();
        swift_retain();
        uint64_t v102 = sub_18D50B338();
        *(void *)&long long v130 = &v112;
        uint64_t v103 = *(void *)(v95 - 8);
        MEMORY[0x1F4188790](v102);
        v105 = (char *)&v112 - v104;
        uint64_t v135 = MEMORY[0x1E4FBC860];
        sub_18D483ED4(&qword_1E91B6578, MEMORY[0x1F41AAF48]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6580);
        ++v94;
        sub_18D483F1C(&qword_1E91B6588, &qword_1E91B6580);
        sub_18D50B548();
        v106 = v131;
        MEMORY[0x192F9FEC0](0, v101, v105, v131);
        uint64_t v88 = v129;
        _Block_release(v106);
        uint64_t v107 = v134;
        swift_release();
        v108 = v105;
        uint64_t v90 = v127;
        uint64_t v89 = v128;
        (*(void (**)(char *, uint64_t))(v103 + 8))(v108, v95);
        v109 = v101;
        v91 = v126;
        (*(void (**)(char *, uint64_t *))(v99 + 8))(v109, v132);
        v92 = v123;
        swift_release();
        uint64_t v87 = v107 - 1;
      }
      while (v87);
    }
    swift_bridgeObjectRelease();
    v110 = (uint64_t (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*MEMORY[0x1E4FBC8C8] & *v117)
                                                                                           + 0xA8))(&aBlock);
    void *v111 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    return v110(&aBlock, 0);
  }
  return result;
}

uint64_t sub_18D483794(void *a1)
{
  uint64_t v2 = sub_18D50B178();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t result = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *a1) + 0xB0))(v7);
  if (result)
  {
    uint64_t v11 = (void *)result;
    sub_18D50B188();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4F38B20], v2);
    char v12 = sub_18D50B168();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
    v13(v6, v2);
    v13(v9, v2);
    objc_msgSend(v11, sel_didObserveNetworkAvailabilityChange_, v12 & 1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_18D483934(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_18D483978(uint64_t (*a1)(void))
{
  uint64_t v2 = sub_18D50B178();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v12 - v7;
  sub_18D50B188();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4F38B20], v2);
  char v9 = sub_18D50B168();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  return a1(v9 & 1);
}

id sub_18D483AD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TUINetworkObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18D483B9C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_18D483BDC()
{
  return sub_18D482018(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char **)(v0 + 40));
}

uint64_t sub_18D483BE8()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18D483BF8()
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

void *sub_18D483C38(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6598);
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
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_18D484308(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_18D483D48(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_18D483DA4()
{
  uint64_t v1 = sub_18D50B198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_18D483E70()
{
  sub_18D50B198();
  uint64_t v1 = *(void **)(v0 + 16);
  return sub_18D483794(v1);
}

uint64_t sub_18D483ED4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_18D483F1C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_18D483F6C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18D483FA4(char a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t sub_18D483FDC()
{
  uint64_t v1 = sub_18D50B198();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_18D4840A8()
{
  sub_18D50B198();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  return sub_18D483978(v1);
}

unint64_t sub_18D48410C()
{
  unint64_t result = qword_1EB4460C8;
  if (!qword_1EB4460C8)
  {
    sub_18D50B178();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB4460C8);
  }
  return result;
}

uint64_t sub_18D484164()
{
  return type metadata accessor for TUINetworkObserver();
}

void sub_18D48416C()
{
  sub_18D484234();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_18D484234()
{
  if (!qword_1E91B6590)
  {
    sub_18D50B178();
    unint64_t v0 = sub_18D50B4E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E91B6590);
    }
  }
}

uint64_t sub_18D48428C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18D4842C4(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_18D4842DC(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_18D484308(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B65A0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_18D50B5A8();
  __break(1u);
  return result;
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

uint64_t variable initialization expression of TUISmartReplyResponse.srResponse()
{
  return 0;
}

void *TUISmartReplyResponse.srResponse.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void TUISmartReplyResponse.srResponse.setter(void *a1)
{
}

uint64_t (*TUISmartReplyResponse.srResponse.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.error()
{
  return 0;
}

void *TUISmartReplyResponse.error.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void TUISmartReplyResponse.error.setter(void *a1)
{
}

uint64_t (*TUISmartReplyResponse.error.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t TUISmartReplyResponse.threadIdentifier.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TUISmartReplyResponse.threadIdentifier.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier);
  swift_beginAccess();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*TUISmartReplyResponse.threadIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t TUISmartReplyResponse.type.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t TUISmartReplyResponse.type.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*TUISmartReplyResponse.type.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t TUISmartReplyResponse.contentWarning.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t TUISmartReplyResponse.contentWarning.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*TUISmartReplyResponse.contentWarning.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.modelInfoString()
{
  return 0;
}

uint64_t TUISmartReplyResponse.modelInfoString.getter()
{
  return sub_18D484C8C(&OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

uint64_t TUISmartReplyResponse.modelInfoString.setter(uint64_t a1, uint64_t a2)
{
  return sub_18D484D74(a1, a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

uint64_t (*TUISmartReplyResponse.modelInfoString.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.userFeedbackInputString()
{
  return 0;
}

id sub_18D484BF8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_18D50B3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t TUISmartReplyResponse.userFeedbackInputString.getter()
{
  return sub_18D484C8C(&OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

uint64_t sub_18D484C8C(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_18D484CEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_18D50B3C8();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  uint64_t *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t TUISmartReplyResponse.userFeedbackInputString.setter(uint64_t a1, uint64_t a2)
{
  return sub_18D484D74(a1, a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

uint64_t sub_18D484D74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*TUISmartReplyResponse.userFeedbackInputString.modify())()
{
  return j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.responseFromCache()
{
  return 0;
}

id sub_18D484E40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *TUISmartReplyResponse.responseFromCache.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_responseFromCache);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_18D484EE4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  unint64_t v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *unint64_t v5 = a3;
  id v7 = a3;
}

void TUISmartReplyResponse.responseFromCache.setter(void *a1)
{
}

void sub_18D484F4C(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  unint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t (*TUISmartReplyResponse.responseFromCache.modify())()
{
  return j_j__swift_endAccess;
}

id sub_18D484FF8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  id v18 = objc_allocWithZone(v11);
  id v19 = sub_18D487EA0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);

  return v19;
}

uint64_t sub_18D4851A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B65E8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_18D5156F0;
    sub_18D50B558();
    sub_18D50B3F8();
    id v6 = objc_msgSend(v4, sel_description);
    sub_18D50B3C8();

    sub_18D50B3F8();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_18D50B3F8();
    (*(void (**)(uint64_t))((*v2 & *v1) + 0xF0))(v7);
    type metadata accessor for TUISmartReplyContentWarningType(0);
    sub_18D50B588();
    *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v5 + 32) = 0;
    *(void *)(v5 + 40) = 0xE000000000000000;
    sub_18D50B5D8();

    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))((*v2 & *v0) + 0xA8))();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B65E8);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_18D5156F0;
      sub_18D50B558();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(v10, sel_description);
      sub_18D50B3C8();

      sub_18D50B3F8();
      swift_bridgeObjectRelease();
      *(void *)(v11 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v11 + 32) = 0xD00000000000001ELL;
      *(void *)(v11 + 40) = 0x800000018D516470;
      sub_18D50B5D8();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B65E8);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_18D5156F0;
      *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v13 + 32) = 0xD00000000000001BLL;
      *(void *)(v13 + 40) = 0x800000018D516440;
      sub_18D50B5D8();
    }
    return swift_bridgeObjectRelease();
  }
}

id TUISmartReplyResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void TUISmartReplyResponse.init()()
{
}

id TUISmartReplyResponse.__deallocating_deinit()
{
  return sub_18D4874D0(type metadata accessor for TUISmartReplyResponse);
}

id TUITextCompositionClientWrapper.init()()
{
  id v1 = objc_allocWithZone((Class)sub_18D50B108());
  uint64_t v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  *(void *)&v2[OBJC_IVAR____TtC11TextInputUI31TUITextCompositionClientWrapper_textCompositionClient] = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for TUITextCompositionClientWrapper();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_18D4857A4()
{
  uint64_t v0 = sub_18D50B0D8();
  __swift_allocate_value_buffer(v0, qword_1E91B7B00);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E91B7B00);
  return sub_18D50B0C8();
}

Swift::UInt __swiftcall TUITextCompositionClientWrapper.generateRequestToken()()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FAE1E0]), sel_init);
  id v1 = objc_msgSend(v0, sel_nextToken);

  return (Swift::UInt)v1;
}

void sub_18D4858E0()
{
  qword_1E91B7AF0 = 825112889;
  *(void *)algn_1E91B7AF8 = 0xE400000000000000;
}

uint64_t sub_18D4858FC()
{
  id v0 = (void *)sub_18D50B3B8();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (!v1)
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_9:
    uint64_t result = sub_18D483D48((uint64_t)&v9, &qword_1E91B6548);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  id v2 = v1;
  id v3 = (void *)sub_18D50B3B8();
  id v4 = objc_msgSend(v2, sel_objectForInfoDictionaryKey_, v3);

  if (v4)
  {
    sub_18D50B538();

    swift_unknownObjectRelease();
  }
  else
  {

    memset(v8, 0, sizeof(v8));
  }
  sub_18D488E80((uint64_t)v8, (uint64_t)&v9);
  if (!*((void *)&v10 + 1)) {
    goto LABEL_9;
  }
  uint64_t result = swift_dynamicCast();
  uint64_t v7 = *((void *)&v8[0] + 1);
  uint64_t v6 = *(void *)&v8[0];
  if (!result)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
LABEL_10:
  qword_1E91B7AE0 = v6;
  qword_1E91B7AE8 = v7;
  return result;
}

uint64_t sub_18D485A78()
{
  uint64_t result = sub_18D485A9C();
  byte_1E91B7B18 = result & 1;
  return result;
}

uint64_t sub_18D485A9C()
{
  if (qword_1E91B7620 != -1) {
    swift_once();
  }
  unint64_t v0 = qword_1E91B7AE8;
  if (!qword_1E91B7AE8)
  {
    if (qword_1E91B7630 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_18D50B0D8();
    __swift_project_value_buffer(v14, (uint64_t)qword_1E91B7B00);
    uint64_t v15 = sub_18D50B0B8();
    os_log_type_t v16 = sub_18D50B448();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_18D47E000, v15, v16, "Unable to find GM bundle version", v17, 2u);
      MEMORY[0x192FA1220](v17, -1, -1);
    }

    return 0;
  }
  uint64_t v1 = qword_1E91B7AE0;
  v25[0] = qword_1E91B7AE0;
  v25[1] = qword_1E91B7AE8;
  uint64_t v2 = qword_1E91B7628;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  v24[0] = qword_1E91B7AF0;
  v24[1] = *(void *)algn_1E91B7AF8;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6528);
  MEMORY[0x1F4188790](v3 - 8);
  objc_super v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_18D50AFA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_18D48851C();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_18D50B518();
  sub_18D483D48((uint64_t)v5, &qword_1E91B6528);
  swift_bridgeObjectRelease();
  if (v7 < 2)
  {
    if (qword_1E91B7630 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_18D50B0D8();
    __swift_project_value_buffer(v8, (uint64_t)qword_1E91B7B00);
    swift_bridgeObjectRetain();
    long long v9 = sub_18D50B0B8();
    os_log_type_t v10 = sub_18D50B468();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v25[0] = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      v24[0] = sub_18D4876EC(v1, v0, v25);
      sub_18D50B4F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18D47E000, v9, v10, "GM version %s supports Availability API", v11, 0xCu);
      uint64_t v13 = 1;
      swift_arrayDestroy();
      MEMORY[0x192FA1220](v12, -1, -1);
      MEMORY[0x192FA1220](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return 1;
    }
    return v13;
  }
  if (v7 == -1)
  {
    if (qword_1E91B7630 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_18D50B0D8();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E91B7B00);
    swift_bridgeObjectRetain();
    id v19 = sub_18D50B0B8();
    os_log_type_t v20 = sub_18D50B468();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v25[0] = v22;
      *(_DWORD *)os_log_type_t v21 = 136315138;
      swift_bridgeObjectRetain();
      v24[0] = sub_18D4876EC(v1, v0, v25);
      sub_18D50B4F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18D47E000, v19, v20, "GM version %s does NOT support Availability API", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FA1220](v22, -1, -1);
      MEMORY[0x192FA1220](v21, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  type metadata accessor for ComparisonResult(0);
  v25[0] = v7;
  uint64_t result = sub_18D50B5C8();
  __break(1u);
  return result;
}

uint64_t static TUITextCompositionClientWrapper.isGMAvailableForMessagesReply()()
{
  return (*(uint64_t (**)(unint64_t, unint64_t))(v0 + 96))(0xD00000000000001DLL, 0x800000018D5163D0);
}

uint64_t static TUITextCompositionClientWrapper.isGMAvailableForMailReply()()
{
  return (*(uint64_t (**)(unint64_t, unint64_t))(v0 + 96))(0xD000000000000019, 0x800000018D5163F0);
}

uint64_t static TUITextCompositionClientWrapper.isGMAvailableForMailReplyLongFormBasic()()
{
  return (*(uint64_t (**)(unint64_t, unint64_t))(v0 + 96))(0xD000000000000026, 0x800000018D516410);
}

uint64_t sub_18D486130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  return (*(uint64_t (**)(uint64_t, uint64_t))(ObjCClassMetadata + 96))(a3, a4) & 1;
}

uint64_t TUITextCompositionClientWrapper.requestSmartReplies(inputContextHistory:shortForm:clientID:threadIdentifier:candidateString:options:completion:)(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = v11;
  uint64_t v58 = a7;
  LODWORD(v60) = a2;
  uint64_t v68 = a6;
  uint64_t v69 = a11;
  uint64_t v61 = a10;
  uint64_t v62 = a5;
  v64 = a1;
  uint64_t v65 = a9;
  uint64_t v63 = v12;
  unint64_t ObjectType = swift_getObjectType();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B65F8);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_18D50B0E8();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x1F4188790](v19);
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v73 = a3;
  uint64_t v74 = a4;
  uint64_t v71 = 0x4D53656C69626F4DLL;
  unint64_t v72 = 0xE900000000000053;
  sub_18D48851C();
  char v23 = sub_18D50B528();
  uint64_t v24 = (unsigned int *)MEMORY[0x1E4F99C38];
  if (v23) {
    uint64_t v24 = (unsigned int *)MEMORY[0x1E4F99C40];
  }
  (*(void (**)(char *, void, uint64_t))(v20 + 104))((char *)&v56 - v22, *v24, v19);
  uint64_t v25 = sub_18D50B438();
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
  unint64_t v66 = v18;
  uint64_t v27 = v26(v18, 1, 1, v25);
  uint64_t v59 = &v56;
  MEMORY[0x1F4188790](v27);
  uint64_t v28 = (char *)&v56 - v22;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  uint64_t v67 = (char *)&v56 - v22;
  uint64_t v70 = v19;
  v29((char *)&v56 - v22, (char *)&v56 - v22, v19);
  unint64_t v30 = (*(unsigned __int8 *)(v20 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v31 = (v21 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (void (**)(char *, char *, uint64_t))(v20 + 32);
  if (v60)
  {
    unint64_t v33 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v34 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v60 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    BOOL v35 = (char *)swift_allocObject();
    *((void *)v35 + 2) = 0;
    *((void *)v35 + 3) = 0;
    v37 = v63;
    uint64_t v36 = v64;
    *((void *)v35 + 4) = v63;
    *((void *)v35 + 5) = v36;
    (*v32)(&v35[v30], v28, v70);
    *(void *)&v35[v31] = v65;
    uint64_t v38 = &v35[v33];
    uint64_t v40 = v68;
    uint64_t v39 = v69;
    *(void *)uint64_t v38 = v62;
    *((void *)v38 + 1) = v40;
    v41 = &v35[v34];
    *(void *)v41 = v61;
    *((void *)v41 + 1) = v39;
    *(void *)&v35[v60] = ObjectType;
    id v42 = v37;
    id v43 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v44 = &unk_1E91B6618;
  }
  else
  {
    unint64_t v60 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v45 = (v60 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t ObjectType = (v45 + 23) & 0xFFFFFFFFFFFFFFF8;
    BOOL v35 = (char *)swift_allocObject();
    *((void *)v35 + 2) = 0;
    *((void *)v35 + 3) = 0;
    uint64_t v47 = v63;
    uint64_t v46 = v64;
    *((void *)v35 + 4) = v63;
    *((void *)v35 + 5) = v46;
    (*v32)(&v35[v30], v28, v70);
    uint64_t v48 = &v35[v31];
    *(void *)uint64_t v48 = v58;
    *((void *)v48 + 1) = a8;
    *(void *)&v35[v60] = v65;
    uint64_t v49 = &v35[v45];
    uint64_t v51 = v68;
    uint64_t v50 = v69;
    *(void *)uint64_t v49 = v62;
    *((void *)v49 + 1) = v51;
    v52 = &v35[ObjectType];
    *(void *)v52 = v61;
    *((void *)v52 + 1) = v50;
    id v53 = v47;
    id v54 = v46;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v44 = &unk_1E91B6608;
  }
  sub_18D486BAC((uint64_t)v66, (uint64_t)v44, (uint64_t)v35);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v67, v70);
}

uint64_t sub_18D4865C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 80) = v11;
  *(_OWORD *)(v8 + 64) = v10;
  *(void *)(v8 + 48) = a7;
  *(void *)(v8 + 56) = a8;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 24) = a4;
  return MEMORY[0x1F4188298](sub_18D4865FC, 0, 0);
}

uint64_t sub_18D4865FC()
{
  uint64_t v1 = v0[6];
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x1E4F99C58] + MEMORY[0x1E4F99C58]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[11] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_18D4866C0;
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  return v6(v4, v3, v1);
}

uint64_t sub_18D4866C0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 96) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_18D48693C;
  }
  else
  {
    *(void *)(v6 + 104) = a2;
    *(void *)(v6 + 112) = a1;
    uint64_t v7 = sub_18D4867F4;
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t sub_18D4867F4()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = (void *)v0[14];
  uint64_t v3 = v0[8];
  uint64_t v19 = (void (*)(id))v0[9];
  uint64_t v18 = v0[7];
  uint64_t v17 = sub_18D488BE4(v2);
  uint64_t v16 = sub_18D488EF0(v2);
  uint64_t v5 = v4;
  uint64_t v6 = sub_18D48927C(v2);
  uint64_t v8 = v7;
  id v9 = sub_18D48933C(v2);
  swift_bridgeObjectRelease();
  id v10 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  id v11 = v9;
  id v12 = v1;
  swift_bridgeObjectRetain();
  id v13 = sub_18D487EA0(v1, v18, v3, 0, v17, 0, v16, v5, v6, v8, v9);

  v19(v13);
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_18D48693C()
{
  if (qword_1E91B7630 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = sub_18D50B0D8();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E91B7B00);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_18D50B0B8();
  os_log_type_t v6 = sub_18D50B468();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[12];
  if (v7)
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)id v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    sub_18D50B4F8();
    *id v10 = v12;

    _os_log_impl(&dword_18D47E000, v5, v6, "Caught short form generation error: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6630);
    swift_arrayDestroy();
    MEMORY[0x192FA1220](v10, -1, -1);
    MEMORY[0x192FA1220](v9, -1, -1);
  }
  else
  {
  }
  id v13 = (void *)v0[12];
  uint64_t v14 = (void (*)(id))v0[9];
  uint64_t v16 = v0[7];
  uint64_t v15 = v0[8];
  swift_bridgeObjectRetain();
  uint64_t v17 = (void *)sub_18D50AF88();
  id v18 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  id v19 = sub_18D487EA0(0, v16, v15, 0, 0, v17, 0, 0, 0, 0, 0);

  v14(v19);
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_18D486BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18D50B438();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_18D50B428();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_18D483D48(a1, &qword_1E91B65F8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_18D50B418();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_18D486D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v12;
  *(_OWORD *)(v8 + 72) = v11;
  *(_OWORD *)(v8 + 56) = v10;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 16) = a4;
  return MEMORY[0x1F4188298](sub_18D486D98, 0, 0);
}

uint64_t sub_18D486D98()
{
  uint64_t v1 = v0[7];
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x1E4F99C50]
                                                                           + MEMORY[0x1E4F99C50]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[12] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_18D486E60;
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  return v8(v6, v5, v3, v4, v1);
}

uint64_t sub_18D486E60(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 104) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_18D4870DC;
  }
  else
  {
    *(void *)(v6 + 112) = a2;
    *(void *)(v6 + 120) = a1;
    uint64_t v7 = sub_18D486F94;
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t sub_18D486F94()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = (void *)v0[15];
  uint64_t v3 = v0[9];
  id v19 = (void (*)(id))v0[10];
  uint64_t v18 = v0[8];
  uint64_t v17 = sub_18D488BE4(v2);
  uint64_t v16 = sub_18D488EF0(v2);
  uint64_t v5 = v4;
  uint64_t v6 = sub_18D48927C(v2);
  uint64_t v8 = v7;
  id v9 = sub_18D48933C(v2);
  swift_bridgeObjectRelease();
  id v10 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  id v11 = v9;
  id v12 = v1;
  swift_bridgeObjectRetain();
  id v13 = sub_18D487EA0(v1, v18, v3, 1, v17, 0, v16, v5, v6, v8, v9);

  v19(v13);
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_18D4870DC()
{
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = (void (*)(id))v0[10];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_18D50AF88();
  id v6 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  id v7 = sub_18D487EA0(0, v4, v3, 1, 0, v5, 0, 0, 0, 0, 0);

  v2(v7);
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

Swift::Void __swiftcall TUITextCompositionClientWrapper.cancelRequest(token:)(Swift::UInt token)
{
  if (qword_1E91B7630 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_18D50B0D8();
  __swift_project_value_buffer(v1, (uint64_t)qword_1E91B7B00);
  uint64_t v2 = sub_18D50B0B8();
  os_log_type_t v3 = sub_18D50B468();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    sub_18D50B4F8();
    _os_log_impl(&dword_18D47E000, v2, v3, "Cancelling request: %lu", v4, 0xCu);
    MEMORY[0x192FA1220](v4, -1, -1);
  }

  sub_18D50B0F8();
}

id TUITextCompositionClientWrapper.__deallocating_deinit()
{
  return sub_18D4874D0(type metadata accessor for TUITextCompositionClientWrapper);
}

id sub_18D4874D0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_18D487518(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_18D4875F4;
  return v6(a1);
}

uint64_t sub_18D4875F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_18D4876EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_18D4877C0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_18D488C88((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_18D488C88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_18D4877C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_18D50B508();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_18D48797C(a5, a6);
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
  uint64_t v8 = sub_18D50B578();
  if (!v8)
  {
    sub_18D50B598();
    __break(1u);
LABEL_17:
    uint64_t result = sub_18D50B5A8();
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

uint64_t sub_18D48797C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_18D487A14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18D487BF4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18D487BF4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18D487A14(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_18D487B8C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_18D50B568();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_18D50B598();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_18D50B408();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_18D50B5A8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_18D50B598();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_18D487B8C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6540);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18D487BF4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6540);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
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
  uint64_t result = sub_18D50B5A8();
  __break(1u);
  return result;
}

unint64_t sub_18D487D44(uint64_t a1, uint64_t a2)
{
  sub_18D50B5E8();
  sub_18D50B3E8();
  uint64_t v4 = sub_18D50B5F8();
  return sub_18D487DBC(a1, a2, v4);
}

unint64_t sub_18D487DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_18D50B5B8() & 1) == 0)
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
      while (!v14 && (sub_18D50B5B8() & 1) == 0);
    }
  }
  return v6;
}

id sub_18D487EA0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  BOOL v14 = (void **)&v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse];
  *(void *)&v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse] = 0;
  uint64_t v15 = (void **)&v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error];
  *(void *)&v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error] = 0;
  uint64_t v16 = &v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = &v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  uint64_t v18 = (void **)&v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_responseFromCache];
  *(void *)&v11[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_responseFromCache] = 0;
  swift_beginAccess();
  id v19 = *v14;
  objc_class *v14 = a1;
  uint64_t v20 = v11;
  id v21 = a1;

  swift_beginAccess();
  uint64_t v22 = *v15;
  *uint64_t v15 = a6;
  id v23 = a6;

  uint64_t v24 = &v20[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier];
  *(void *)uint64_t v24 = a2;
  *((void *)v24 + 1) = a3;
  *(void *)&v20[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type] = a4;
  *(void *)&v20[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning] = a5;
  swift_beginAccess();
  *(void *)uint64_t v16 = a7;
  *((void *)v16 + 1) = a8;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v17 = a9;
  *((void *)v17 + 1) = a10;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v25 = *v18;
  *uint64_t v18 = a11;
  id v26 = a11;

  v34.receiver = v20;
  v34.super_class = (Class)type metadata accessor for TUISmartReplyResponse();
  return objc_msgSendSuper2(&v34, sel_init);
}

void type metadata accessor for TUISmartReplyContentWarningType(uint64_t a1)
{
}

uint64_t type metadata accessor for TUISmartReplyResponse()
{
  return self;
}

uint64_t type metadata accessor for TUITextCompositionClientWrapper()
{
  return self;
}

uint64_t _s11TextInputUI31TUITextCompositionClientWrapperC13isGMAvailable7useCaseSbSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v2 = sub_18D50B058();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_18D50B088();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_18D50B028();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  BOOL v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v28 - v15;
  if (qword_1E91B7638 != -1) {
    swift_once();
  }
  if (byte_1E91B7B18 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6538);
    uint64_t v17 = swift_allocObject();
    uint64_t v29 = v6;
    *(_OWORD *)(v17 + 16) = xmmword_18D5156F0;
    *(void *)(v17 + 32) = v30;
    *(void *)(v17 + 40) = v31;
    swift_bridgeObjectRetain();
    sub_18D50B048();
    sub_18D50B078();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_18D50B068();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v29);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E4F63D38], v10);
    char v18 = sub_18D50B018();
    id v19 = *(void (**)(char *, uint64_t))(v11 + 8);
    v19(v14, v10);
    v19(v16, v10);
  }
  else
  {
    if (qword_1E91B7630 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_18D50B0D8();
    __swift_project_value_buffer(v20, (uint64_t)qword_1E91B7B00);
    id v21 = sub_18D50B0B8();
    os_log_type_t v22 = sub_18D50B448();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_18D47E000, v21, v22, "GM version does not support Availability API.", v23, 2u);
      MEMORY[0x192FA1220](v23, -1, -1);
    }

    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v24 = sub_18D50B0B8();
      os_log_type_t v25 = sub_18D50B468();
      if (os_log_type_enabled(v24, v25))
      {
        id v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_18D47E000, v24, v25, "NOTICE: Allowing GM for internal OS without Availability API", v26, 2u);
        MEMORY[0x192FA1220](v26, -1, -1);
      }

      char v18 = 1;
    }
    else
    {
      char v18 = 0;
    }
  }
  return v18 & 1;
}

unint64_t sub_18D48851C()
{
  unint64_t result = qword_1E91B6530;
  if (!qword_1E91B6530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91B6530);
  }
  return result;
}

uint64_t sub_18D488570()
{
  uint64_t v1 = sub_18D50B0E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v6 + 16, v5);
}

uint64_t sub_18D4886AC()
{
  uint64_t v2 = *(void *)(sub_18D50B0E8() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v0 + v3;
  uint64_t v9 = *(void *)(v0 + v5);
  uint64_t v10 = *(void *)(v0 + v4);
  uint64_t v11 = *(void *)(v0 + v4 + 8);
  uint64_t v12 = *(void *)(v0 + v6);
  uint64_t v13 = *(void *)(v0 + v6 + 8);
  uint64_t v14 = swift_task_alloc();
  long long v15 = *(_OWORD *)(v0 + 32);
  long long v16 = *(_OWORD *)(v0 + v7);
  *(void *)(v1 + 16) = v14;
  *(void *)uint64_t v14 = v1;
  *(void *)(v14 + 8) = sub_18D488814;
  *(_OWORD *)(v14 + 80) = v16;
  *(void *)(v14 + 64) = v12;
  *(void *)(v14 + 72) = v13;
  *(void *)(v14 + 48) = v11;
  *(void *)(v14 + 56) = v9;
  *(void *)(v14 + 32) = v8;
  *(void *)(v14 + 40) = v10;
  *(_OWORD *)(v14 + 16) = v15;
  return MEMORY[0x1F4188298](sub_18D486D98, 0, 0);
}

uint64_t sub_18D488814()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_18D488908()
{
  uint64_t v1 = sub_18D50B0E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_18D488A38()
{
  uint64_t v2 = *(void *)(sub_18D50B0E8() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v0 + v4);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = *(void *)(v0 + v5);
  uint64_t v10 = *(void *)(v0 + v5 + 8);
  uint64_t v11 = swift_task_alloc();
  long long v12 = *(_OWORD *)(v0 + 32);
  long long v13 = *(_OWORD *)(v0 + v6);
  *(void *)(v1 + 16) = v11;
  *(void *)uint64_t v11 = v1;
  *(void *)(v11 + 8) = sub_18D488EEC;
  *(_OWORD *)(v11 + 72) = v13;
  *(void *)(v11 + 56) = v9;
  *(void *)(v11 + 64) = v10;
  *(void *)(v11 + 40) = v8;
  *(void *)(v11 + 48) = v7;
  *(_OWORD *)(v11 + 24) = v12;
  return MEMORY[0x1F4188298](sub_18D4865FC, 0, 0);
}

void type metadata accessor for TUISmartReplyType(uint64_t a1)
{
}

uint64_t sub_18D488B98()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18D488BD0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_18D488BE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_18D487D44(0x57746E65746E6F43, 0xEE00676E696E7261);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_18D488C88(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (v5 >= 3) {
    return -1;
  }
  return v5;
}

uint64_t sub_18D488C88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18D488CE4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18D488D1C(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_18D488814;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E91B6638 + dword_1E91B6638);
  return v6(a1, v4);
}

void type metadata accessor for ComparisonResult(uint64_t a1)
{
}

void sub_18D488DE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
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

uint64_t sub_18D488E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18D488EF0(uint64_t a1)
{
  uint64_t v2 = sub_18D50B3C8();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_18D487D44(v2, v3), (v5 & 1) != 0))
  {
    sub_18D488C88(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v24);
    swift_bridgeObjectRelease();
    if (*((void *)&v25 + 1))
    {
      if (swift_dynamicCast()) {
        return v23;
      }
      goto LABEL_8;
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    swift_bridgeObjectRelease();
  }
  sub_18D489414((uint64_t)&v24);
LABEL_8:
  uint64_t v23 = 0;
  uint64_t v6 = sub_18D50B3C8();
  if (*(void *)(a1 + 16) && (unint64_t v8 = sub_18D487D44(v6, v7), (v9 & 1) != 0))
  {
    sub_18D488C88(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v25 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_18D50B3F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18D489414((uint64_t)&v24);
  }
  sub_18D50B3F8();
  uint64_t v10 = sub_18D50B3C8();
  if (*(void *)(a1 + 16) && (unint64_t v12 = sub_18D487D44(v10, v11), (v13 & 1) != 0))
  {
    sub_18D488C88(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v25 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_18D50B3F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18D489414((uint64_t)&v24);
  }
  sub_18D50B3F8();
  uint64_t v14 = sub_18D50B3C8();
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_18D487D44(v14, v15), (v17 & 1) != 0))
  {
    sub_18D488C88(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v25 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_18D50B3F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18D489414((uint64_t)&v24);
  }
  sub_18D50B3F8();
  uint64_t v18 = sub_18D50B3C8();
  if (*(void *)(a1 + 16) && (unint64_t v20 = sub_18D487D44(v18, v19), (v21 & 1) != 0))
  {
    sub_18D488C88(*(void *)(a1 + 56) + 32 * v20, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v25 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_18D50B3F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18D489414((uint64_t)&v24);
  }
  return v23;
}

uint64_t sub_18D48927C(uint64_t a1)
{
  uint64_t v2 = sub_18D50B3C8();
  if (!*(void *)(a1 + 16) || (unint64_t v4 = sub_18D487D44(v2, v3), (v5 & 1) == 0))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_18D488C88(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_7:
    sub_18D489414((uint64_t)&v8);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v7;
  }
  return 0;
}

id sub_18D48933C(uint64_t a1)
{
  uint64_t v2 = sub_18D50B3C8();
  if (!*(void *)(a1 + 16) || (unint64_t v4 = sub_18D487D44(v2, v3), (v5 & 1) == 0))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_18D488C88(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_7:
    sub_18D489414((uint64_t)&v8);
    return 0;
  }
  if (swift_dynamicCast()) {
    return objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v7);
  }
  return 0;
}

uint64_t sub_18D489414(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for TUITextCompositionUtilities()
{
  return &type metadata for TUITextCompositionUtilities;
}

unint64_t variable initialization expression of DefaultKeyboardSettingsProvider.id()
{
  return 0xD000000000000023;
}

uint64_t DefaultKeyboardSettingsProvider.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DefaultKeyboardSettingsProvider.localizedTitle.getter()
{
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_18D489594@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_18D489654()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for DefaultKeyboardSettingsProvider(uint64_t a1)
{
  return sub_18D48AAFC(a1, (uint64_t *)&unk_1E91B7900);
}

uint64_t DefaultKeyboardSettingsProvider.localizedTitle.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_18D489834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18D489898()
{
  return sub_18D489834(v0[2], v0[3], v0[4]);
}

void (*DefaultKeyboardSettingsProvider.localizedTitle.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC11TextInputUI31DefaultKeyboardSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_18D50AFE8();
  swift_release();
  swift_beginAccess();
  return sub_18D4899F0;
}

void sub_18D4899F0(void **a1)
{
}

uint64_t variable initialization expression of DefaultKeyboardSettingsProvider.localizedDetail()
{
  uint64_t v0 = sub_18D50B3A8();
  MEMORY[0x1F4188790](v0 - 8);
  sub_18D50B398();
  uint64_t v1 = sub_18D50AFA8();
  MEMORY[0x1F4188790](v1 - 8);
  sub_18D50AF98();
  return sub_18D50B3D8();
}

uint64_t DefaultKeyboardSettingsProvider.localizedDetail.getter()
{
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_18D489BA8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_18D489C68()
{
  return swift_bridgeObjectRelease();
}

uint64_t DefaultKeyboardSettingsProvider.localizedDetail.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_18D489E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18D489E8C()
{
  return sub_18D489E28(v0[2], v0[3], v0[4]);
}

void (*DefaultKeyboardSettingsProvider.localizedDetail.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC11TextInputUI31DefaultKeyboardSettingsProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_18D50AFE8();
  swift_release();
  swift_beginAccess();
  return sub_18D489FE4;
}

void sub_18D489FE4(void **a1)
{
}

id sub_18D489FF0()
{
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 72);
  return v1;
}

id sub_18D48A0B4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 72);
  *a2 = v4;
  return v4;
}

void sub_18D48A180(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  id v2 = v1;
  sub_18D50AFB8();
  swift_release();
}

void sub_18D48A25C(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = a2;
  id v5 = a2;
}

void sub_18D48A2B4()
{
  sub_18D48A25C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_18D48A2E0(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_18D50AFD8();
  swift_release();
  free(v1);
}

uint64_t DefaultKeyboardSettingsProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  DefaultKeyboardSettingsProvider.init()();
  return v0;
}

void DefaultKeyboardSettingsProvider.init()()
{
  v0[2] = 0xD000000000000023;
  v0[3] = 0x800000018D516980;
  uint64_t v1 = sub_18D50B3A8();
  MEMORY[0x1F4188790](v1 - 8);
  sub_18D50B398();
  uint64_t v2 = sub_18D50AFA8();
  MEMORY[0x1F4188790](v2 - 8);
  sub_18D50AF98();
  v0[6] = sub_18D50B3D8();
  v0[7] = v3;
  sub_18D50AFF8();
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F92E40]), sel_init);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F92E70]), sel_init);
  objc_msgSend(v4, sel_setSpecifier_, v5);

  id v6 = objc_msgSend(v4, sel_specifier);
  if (!v6)
  {
    __break(1u);
    goto LABEL_19;
  }
  unsigned __int8 v7 = v6;
  long long v8 = (void *)sub_18D50B3B8();
  objc_msgSend(v7, sel_setProperty_forKey_, v8, *MEMORY[0x1E4F93188]);

  long long v9 = (void *)sub_18D50B3B8();
  id v10 = v4;
  id v11 = (id)TextInputUIBundle();
  id v12 = objc_msgSend(v10, sel_loadSpecifiersFromPlistName_target_bundle_, v9, v10, v11);

  if (!v12)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!objc_msgSend(v12, sel_firstObject))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_18D50B538();
  swift_unknownObjectRelease();
  sub_18D48A78C(v24, &v25);
  sub_18D48B744(0, &qword_1E91B6658);
  swift_dynamicCast();
  id v13 = objc_msgSend(v22, sel_target);
  if (!v13)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v0[8] = v13;
  id v14 = objc_msgSend(v22, sel_name);
  if (!v14)
  {
LABEL_22:
    __break(1u);
    return;
  }
  uint64_t v15 = v14;
  uint64_t v16 = sub_18D50B3C8();
  uint64_t v18 = v17;

  v0[4] = v16;
  v0[5] = v18;
  if (objc_msgSend(v22, sel_performGetter))
  {
    sub_18D50B538();
    swift_unknownObjectRelease();
  }
  else
  {

    memset(v24, 0, sizeof(v24));
  }
  sub_18D48CB28((uint64_t)v24, (uint64_t)&v25, &qword_1E91B6548);
  if (v26)
  {
    int v19 = swift_dynamicCast();
    if (v19) {
      unint64_t v20 = v22;
    }
    else {
      unint64_t v20 = 0;
    }
    if (v19) {
      uint64_t v21 = v23;
    }
    else {
      uint64_t v21 = 0;
    }
  }
  else
  {
    sub_18D483D48((uint64_t)&v25, &qword_1E91B6548);
    unint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  swift_bridgeObjectRelease();
  v0[6] = v20;
  v0[7] = v21;
  v0[9] = v22;
}

_OWORD *sub_18D48A78C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t variable initialization expression of DefaultKeyboardSettingsProvider._$observationRegistrar()
{
  return sub_18D50AFF8();
}

uint64_t DefaultKeyboardSettingsProvider.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v24 = a1;
  uint64_t v3 = type metadata accessor for DefaultKeyboards(0);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  unsigned __int8 v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v5);
  long long v9 = (char *)&v24 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6660);
  uint64_t v11 = v10 - 8;
  MEMORY[0x1F4188790](v10);
  id v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6668);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v25 = v1;
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v17 = *(void **)(v1 + 72);
  uint64_t v18 = (void *)((char *)v7 + *(int *)(v4 + 28));
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
  swift_storeEnumTagMultiPayload();
  *unsigned __int8 v7 = v17;
  sub_18D48B4A8((uint64_t)v7, (uint64_t)v9);
  sub_18D48B514((uint64_t)v9, (uint64_t)v13);
  int v19 = &v13[*(int *)(v11 + 44)];
  *(void *)int v19 = 0;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = sub_18D48B50C;
  *((void *)v19 + 3) = v2;
  id v20 = v17;
  swift_retain();
  sub_18D48B578((uint64_t)v9);
  uint64_t v21 = sub_18D50B1D8();
  LOBYTE(v17) = sub_18D50B2C8();
  sub_18D48CB8C((uint64_t)v13, (uint64_t)v16, &qword_1E91B6660);
  os_log_type_t v22 = &v16[*(int *)(v14 + 36)];
  *(void *)os_log_type_t v22 = v21;
  v22[8] = (char)v17;
  sub_18D483D48((uint64_t)v13, &qword_1E91B6660);
  sub_18D50B1B8();
  sub_18D48B5D4();
  sub_18D48B6FC(&qword_1E91B6690, MEMORY[0x1E4F3C4E8]);
  sub_18D50B2E8();
  return sub_18D483D48((uint64_t)v16, &qword_1E91B6668);
}

uint64_t type metadata accessor for DefaultKeyboards(uint64_t a1)
{
  return sub_18D48AAFC(a1, (uint64_t *)&unk_1E91B7910);
}

uint64_t sub_18D48AAFC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18D48AB34(uint64_t a1)
{
  swift_getKeyPath();
  v5[0] = a1;
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  if (objc_msgSend(*(id *)(a1 + 72), sel_performGetter))
  {
    sub_18D50B538();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_18D48CB28((uint64_t)v4, (uint64_t)v5, &qword_1E91B6548);
  if (v5[3]) {
    swift_dynamicCast();
  }
  else {
    sub_18D483D48((uint64_t)v5, &qword_1E91B6548);
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x1F4188790](KeyPath);
  v5[0] = a1;
  sub_18D50AFB8();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t DefaultKeyboardSettingsProvider.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtC11TextInputUI31DefaultKeyboardSettingsProvider___observationRegistrar;
  uint64_t v2 = sub_18D50B008();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DefaultKeyboardSettingsProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC11TextInputUI31DefaultKeyboardSettingsProvider___observationRegistrar;
  uint64_t v2 = sub_18D50B008();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_18D48AE70()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_18D48AEA8()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_18D48AF6C()
{
  uint64_t v1 = *v0;
  swift_getKeyPath();
  sub_18D48B6FC(&qword_1E91B6650, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
  sub_18D50AFC8();
  swift_release();
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_18D48B034@<X0>(uint64_t a1@<X8>)
{
  return DefaultKeyboardSettingsProvider.content.getter(a1);
}

uint64_t sub_18D48B058@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

id sub_18D48B068()
{
  id v1 = *v0;
  if (objc_msgSend(*v0, sel_detailControllerClass))
  {
    swift_getObjCClassMetadata();
    sub_18D48B744(0, &qword_1E91B6698);
    if (swift_dynamicCastMetatype())
    {
      id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      objc_msgSend(v2, sel_setSpecifier_, v1);
      return v2;
    }
  }
  id result = objc_msgSend(v1, sel_propertyForKey_, *MEMORY[0x1E4F93120]);
  if (result)
  {
    sub_18D50B538();
    swift_unknownObjectRelease();
    sub_18D48A78C(&v5, &v6);
    sub_18D48B744(0, &qword_1E91B6698);
    swift_dynamicCast();
    return (id)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_18D48B18C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18D50B218();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unsigned __int8 v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18D48CB8C(v2, (uint64_t)v10, &qword_1E91B6670);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_18D48CB28((uint64_t)v10, a1, &qword_1E91B66A0);
  }
  os_log_type_t v12 = sub_18D50B458();
  id v13 = sub_18D50B2B8();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = sub_18D4876EC(0xD00000000000001BLL, 0x800000018D516A70, &v17);
    _os_log_impl(&dword_18D47E000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x192FA1220](v15, -1, -1);
    MEMORY[0x192FA1220](v14, -1, -1);
  }

  sub_18D50B208();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_18D48B3F0()
{
  return sub_18D50B1E8();
}

uint64_t sub_18D48B414(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
  MEMORY[0x1F4188790](v2 - 8);
  sub_18D48CB8C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E91B66A0);
  return sub_18D50B1F8();
}

uint64_t sub_18D48B4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultKeyboards(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18D48B50C()
{
  return sub_18D48AB34(v0);
}

uint64_t sub_18D48B514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DefaultKeyboards(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18D48B578(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DefaultKeyboards(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_18D48B5D4()
{
  unint64_t result = qword_1E91B6678;
  if (!qword_1E91B6678)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E91B6668);
    sub_18D48B650();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91B6678);
  }
  return result;
}

unint64_t sub_18D48B650()
{
  unint64_t result = qword_1E91B6680;
  if (!qword_1E91B6680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E91B6660);
    sub_18D48B6FC(&qword_1E91B6688, (void (*)(uint64_t))type metadata accessor for DefaultKeyboards);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E91B6680);
  }
  return result;
}

uint64_t sub_18D48B6FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_18D48B744(uint64_t a1, unint64_t *a2)
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

uint64_t sub_18D48B780(void *a1)
{
  uint64_t v2 = sub_18D50B318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  os_log_type_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DefaultKeyboards(0);
  sub_18D48B18C((uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    id v13 = &qword_1E91B66A0;
    uint64_t v14 = (uint64_t)v8;
  }
  else
  {
    sub_18D48CB28((uint64_t)v8, (uint64_t)v12, &qword_1E91B66A8);
    MEMORY[0x192F9FD20](v9);
    char v15 = sub_18D50B308();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(a1, sel_setEditing_animated_, v15 & 1, 1);
    uint64_t v14 = (uint64_t)v12;
    id v13 = &qword_1E91B66A8;
  }
  return sub_18D483D48(v14, v13);
}

uint64_t sub_18D48B9BC()
{
  return sub_18D48B6FC(&qword_1E91B66B0, (void (*)(uint64_t))type metadata accessor for DefaultKeyboardSettingsProvider);
}

uint64_t sub_18D48BA04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18D48BA20()
{
  return MEMORY[0x1E4FBB1B0];
}

uint64_t sub_18D48BA2C()
{
  return sub_18D48B6FC(&qword_1E91B6688, (void (*)(uint64_t))type metadata accessor for DefaultKeyboards);
}

uint64_t sub_18D48BA88()
{
  return sub_18D50B248();
}

uint64_t sub_18D48BAC4()
{
  return MEMORY[0x1E4F3F158];
}

uint64_t sub_18D48BAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18D48B6FC(&qword_1E91B66C8, (void (*)(uint64_t))type metadata accessor for DefaultKeyboards);
  return MEMORY[0x1F40FAB70](a1, a2, a3, v6);
}

uint64_t sub_18D48BB64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18D48B6FC(&qword_1E91B66C8, (void (*)(uint64_t))type metadata accessor for DefaultKeyboards);
  return MEMORY[0x1F40FAB28](a1, a2, a3, v6);
}

uint64_t sub_18D48BBF8()
{
  return sub_18D50B2D8();
}

void sub_18D48BC14()
{
}

uint64_t sub_18D48BC6C()
{
  return type metadata accessor for DefaultKeyboardSettingsProvider(0);
}

uint64_t sub_18D48BC74()
{
  uint64_t result = sub_18D50B008();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void **sub_18D48BD2C(void **a1, void **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void **)((char *)a1 + v6);
    uint64_t v8 = (void **)((char *)a2 + v6);
    uint64_t v9 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
        memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        uint64_t v13 = v8[1];
        *uint64_t v7 = *v8;
        v7[1] = v13;
        uint64_t v14 = *(int *)(v10 + 32);
        uint64_t v18 = (char *)v8 + v14;
        int v19 = (char *)v7 + v14;
        uint64_t v15 = sub_18D50B318();
        uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
        swift_retain();
        swift_retain();
        v16(v19, v18, v15);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_18D48BF50(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
    if (!result)
    {
      swift_release();
      swift_release();
      uint64_t v7 = &v4[*(int *)(v5 + 32)];
      uint64_t v8 = sub_18D50B318();
      uint64_t v9 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
      return v9(v7, v8);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

void **sub_18D48C074(void **a1, void **a2, uint64_t a3)
{
  int v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void **)((char *)a1 + v5);
  uint64_t v7 = (void **)((char *)a2 + v5);
  id v8 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
      memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      uint64_t v12 = v7[1];
      *uint64_t v6 = *v7;
      v6[1] = v12;
      uint64_t v13 = *(int *)(v9 + 32);
      uint64_t v17 = (char *)v7 + v13;
      uint64_t v18 = (char *)v6 + v13;
      uint64_t v14 = sub_18D50B318();
      uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_retain();
      swift_retain();
      v15(v18, v17, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    }
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **sub_18D48C250(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void **)((char *)a1 + v9);
    uint64_t v11 = (void **)((char *)a2 + v9);
    sub_18D483D48((uint64_t)a1 + v9, &qword_1E91B6670);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        *uint64_t v10 = *v11;
        v10[1] = v11[1];
        uint64_t v15 = *(int *)(v12 + 32);
        int v19 = (char *)v11 + v15;
        id v20 = (char *)v10 + v15;
        uint64_t v16 = sub_18D50B318();
        uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
        swift_retain();
        swift_retain();
        v17(v20, v19, v16);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_18D48C45C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
      memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v11 = v6[1];
      *uint64_t v5 = *v6;
      v5[1] = v11;
      uint64_t v12 = *(int *)(v8 + 32);
      uint64_t v13 = (char *)v5 + v12;
      uint64_t v14 = (char *)v6 + v12;
      uint64_t v15 = sub_18D50B318();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void **sub_18D48C618(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void **)((char *)a1 + v7);
    uint64_t v9 = (void **)((char *)a2 + v7);
    sub_18D483D48((uint64_t)a1 + v7, &qword_1E91B6670);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B6670);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A8);
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66A0);
        memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        uint64_t v14 = v9[1];
        *uint64_t v8 = *v9;
        v8[1] = v14;
        uint64_t v15 = *(int *)(v11 + 32);
        uint64_t v16 = (char *)v8 + v15;
        uint64_t v17 = (char *)v9 + v15;
        uint64_t v18 = sub_18D50B318();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_18D48C7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_18D48C810);
}

uint64_t sub_18D48C810(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66B8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_18D48C8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_18D48C8D8);
}

void *sub_18D48C8D8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B66B8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_18D48C984()
{
  sub_18D48CA20();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_18D48CA20()
{
  if (!qword_1E91B66C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E91B66A0);
    unint64_t v0 = sub_18D50B1C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E91B66C0);
    }
  }
}

uint64_t sub_18D48CA7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18D48CB28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_18D48CB8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_18D48CBF0()
{
}

uint64_t sub_18D48CC08()
{
  return sub_18D489E8C();
}

uint64_t sub_18D48CC20()
{
  return sub_18D489898();
}

uint64_t sub_18D48CC38()
{
  uint64_t v0 = sub_18D50B0D8();
  __swift_allocate_value_buffer(v0, qword_1E91B7928);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E91B7928);
  return sub_18D50B0C8();
}

id sub_18D48CD14()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18D48CD50()
{
  uint64_t v0 = sub_18D50B028();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_18D50B058();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_18D50B088();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18D50B038();
  sub_18D50B078();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_18D50B068();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v12 == *MEMORY[0x1E4F63C40])
  {
LABEL_11:
    uint64_t v13 = 1;
    goto LABEL_12;
  }
  if (v12 == *MEMORY[0x1E4F63C48])
  {
    uint64_t v13 = 0;
LABEL_12:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return v13;
  }
  if (v12 != *MEMORY[0x1E4F63D38])
  {
    if (qword_1E91B7920 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_18D50B0D8();
    __swift_project_value_buffer(v14, (uint64_t)qword_1E91B7928);
    uint64_t v15 = sub_18D50B0B8();
    os_log_type_t v16 = sub_18D50B448();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_18D47E000, v15, v16, "unexpected case in GenerativeModelsAvailability isAvailable", v17, 2u);
      MEMORY[0x192FA1220](v17, -1, -1);
    }

    goto LABEL_11;
  }
  return 1;
}

uint64_t type metadata accessor for TUIGenerativeModelsAvailability()
{
  return self;
}

id sub_18D48D0C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = sub_18D50B4C8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_18D50B4B8();
  sub_18D50B118();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  id v12 = a4;
  uint64_t v13 = (void *)sub_18D50B4D8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v13;
}

uint64_t sub_18D48D208()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t _TextInputUIBundle()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

void tui_performBlockOnMainThread(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __AsIdentifiers_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

void __AnimationPlaceholderCellIdentifiersWithCount_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = -1; i != -21; --i)
  {
    id v2 = [NSNumber numberWithUnsignedInteger:i];
    [v0 addObject:v2];
  }
  uint64_t v3 = (void *)AnimationPlaceholderCellIdentifiersWithCount_placeholderIdentifiers;
  AnimationPlaceholderCellIdentifiersWithCount_placeholderIdentifiers = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy__967(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__968(uint64_t a1)
{
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5593658;
    uint64_t v7 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL iPhoneVisualStyle(int a1)
{
  return (a1 - 1) < 5;
}

BOOL iPadVisualStyle(int a1)
{
  return (a1 - 101) < 9;
}

Class __getAFDictationConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    _OWORD v4[2] = 3221225472;
    v4[3] = __AssistantServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5593768;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AFDictationConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getAFDictationConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *TUIKeyboardDisplayNameFromIdentifierForContext(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4FB1908] keyboardInputModeWithIdentifier:v3];
  if ([v4 isExtensionInputMode])
  {
    objc_msgSend(v4, "safe__extendedDisplayName");
    long long v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if ([v3 hasPrefix:*MEMORY[0x1E4FB2BF8]])
  {
    long long v5 = @"QWERTY";
    goto LABEL_13;
  }
  uint64_t v6 = MEMORY[0x192FA0750](v3);

  MEMORY[0x192FA0740](v6);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v5 = [v7 localizedStringForKey:v3 value:&stru_1EDC653C0 table:@"KeyboardTitles"];

  if ([(__CFString *)v5 isEqualToString:v3])
  {
  }
  else if (v5)
  {
    goto LABEL_13;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v10 = [v8 localeForBundleLanguage:v9];
  id v3 = v3;
  if (_ReducedLanguageIdentifierForKeyboardLanguage___onceToken != -1) {
    dispatch_once(&_ReducedLanguageIdentifierForKeyboardLanguage___onceToken, &__block_literal_global_1833);
  }
  uint64_t v11 = (void *)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts;
  id v12 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v3];
  unint64_t v13 = [v11 countForObject:v12];

  uint64_t v14 = v3;
  if (v13 <= 1)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v3];
  }
  long long v5 = [v10 localizedStringForLanguage:v14 context:a2];

LABEL_13:
  return v5;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *TUIKeyboardDisplayNameFromIdentifier(void *a1)
{
  return TUIKeyboardDisplayNameFromIdentifierForContext(a1, 3);
}

id TUIKeyboardTitle(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_1EDC653C0 table:@"KeyboardTitles"];

  return v4;
}

id TUIKeyboardTitleInLanguage(void *a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a1;
  uint64_t v6 = [v4 bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizations];
  v15[0] = v3;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v9 = [v4 preferredLocalizationsFromArray:v7 forPreferences:v8];
  uint64_t v10 = [v9 firstObject];

  if (v10)
  {
    id v11 = v10;

    id v3 = v11;
  }
  id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v13 = [v12 localizedStringForKey:v5 value:v5 table:@"KeyboardTitles" localization:v3];

  return v13;
}

id TUIDictationTitle(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  id v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_1EDC653C0 table:@"Dictation"];

  return v4;
}

double TUIPPMFloatValue(double a1, double a2)
{
  return a2;
}

uint64_t __TIGetEnableMoltoCrescendoValue_block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v1 = MEMORY[0x1E4F1CC28];
  return [v0 _configureKey:@"EnableMoltoCrescendo" domain:@"com.apple.keyboard" defaultValue:v1];
}

uint64_t __Block_byref_object_copy__2216(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2217(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__2501(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2502(uint64_t a1)
{
}

double TUIRectIntegralWithScale(double a1, double a2, double a3, double a4, double a5)
{
  double v6 = a1;
  BOOL IsNull = CGRectIsNull(*(CGRect *)&a1);
  if (a5 > 1.0 && !IsNull) {
    return floor(v6 * a5) / a5;
  }
  return v6;
}

double TUIPointIntegralWithScale(double result, double a2, double a3)
{
  if (a3 > 1.0) {
    return floor(result * a3) / a3;
  }
  return result;
}

double TUIScreenScaleForView(void *a1)
{
  uint64_t v1 = [a1 window];
  id v2 = [v1 screen];

  if (!v2)
  {
    id v3 = [MEMORY[0x1E4FB1900] activeInstance];
    uint64_t v4 = [v3 window];
    id v2 = [v4 screen];

    if (!v2)
    {
      id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
    }
  }
  [v2 scale];
  double v6 = v5;
  uint64_t v7 = [v2 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  double v9 = 2.0;
  if (v6 <= 2.0 || v8 != 3) {
    double v9 = v6;
  }
  double v11 = fmax(v9, 1.0);

  return v11;
}

uint64_t __Block_byref_object_copy__4503(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4504(uint64_t a1)
{
}

id TUIAssertionLogFacility()
{
  if (TUIAssertionLogFacility_onceToken != -1) {
    dispatch_once(&TUIAssertionLogFacility_onceToken, &__block_literal_global_5379);
  }
  uint64_t v0 = (void *)TUIAssertionLogFacility_log;
  return v0;
}

uint64_t __TUIAssertionLogFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInputUI", "ViewService");
  uint64_t v1 = TUIAssertionLogFacility_log;
  TUIAssertionLogFacility_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id TUISmartReplyLog()
{
  if (TUISmartReplyLog_onceToken != -1) {
    dispatch_once(&TUISmartReplyLog_onceToken, &__block_literal_global_5451);
  }
  os_log_t v0 = (void *)TUISmartReplyLog_log;
  return v0;
}

uint64_t __TUISmartReplyLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInputUI", "SmartReply");
  uint64_t v1 = TUISmartReplyLog_log;
  TUISmartReplyLog_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id TUICandidateGenerationLog()
{
  if (TUICandidateGenerationLog_onceToken != -1) {
    dispatch_once(&TUICandidateGenerationLog_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)TUICandidateGenerationLog_log;
  return v0;
}

uint64_t __TUICandidateGenerationLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInputUI", "CandidateGeneration");
  uint64_t v1 = TUICandidateGenerationLog_log;
  TUICandidateGenerationLog_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id TUIBackendControllerLog()
{
  if (TUIBackendControllerLog_onceToken != -1) {
    dispatch_once(&TUIBackendControllerLog_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)TUIBackendControllerLog_log;
  return v0;
}

uint64_t __TUIBackendControllerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInputUI", "BackendController");
  uint64_t v1 = TUIBackendControllerLog_log;
  TUIBackendControllerLog_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __Block_byref_object_copy__5808(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5809(uint64_t a1)
{
}

uint64_t _isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = a1 + a2;
  if (v6 >= [v5 length])
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext_onceToken != -1) {
      dispatch_once(&_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext_onceToken, &__block_literal_global_5815);
    }
    uint64_t v7 = [v5 characterAtIndex:v6];
    uint64_t v8 = [(id)_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext___customPunctuationCharacterSet characterIsMember:v7];
  }

  return v8;
}

void ___isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E58] punctuationCharacterSet];
  [v2 removeCharactersInString:@"*"];
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext___customPunctuationCharacterSet;
  _isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext___customPunctuationCharacterSet = v0;
}

id TUIEmojiUpscalerLog()
{
  if (TUIEmojiUpscalerLog_onceToken != -1) {
    dispatch_once(&TUIEmojiUpscalerLog_onceToken, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)TUIEmojiUpscalerLog_log;
  return v0;
}

uint64_t __TUIEmojiUpscalerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInputUI", "EmojiUpscaler");
  uint64_t v1 = TUIEmojiUpscalerLog_log;
  TUIEmojiUpscalerLog_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __PredictionViewAnimationFrameRateOptions_block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v1 = [v0 maximumFramesPerSecond];

  uint64_t v2 = 117440512;
  if (v1 > 60) {
    uint64_t v2 = 150994944;
  }
  PredictionViewAnimationFrameRateOptions_frameRateOptions = v2;
}

uint64_t TUIRemoteEmojiSearchViewControllerEnabled()
{
  if (TIGetRemoteEmojiValue_onceToken != -1) {
    dispatch_once(&TIGetRemoteEmojiValue_onceToken, &__block_literal_global_7242);
  }
  os_log_t v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v1 = [v0 valueForPreferenceKey:@"RemoteEmoji"];

  LODWORD(v0) = [v1 BOOLValue];
  if (!v0) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v2 userInterfaceIdiom];

  return _os_feature_enabled_impl();
}

Class __getSTKStickerSearchQueryClass_block_invoke(uint64_t a1)
{
  StickerKitLibraryCore();
  Class result = objc_getClass("STKStickerSearchQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerSearchQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void StickerKitLibraryCore()
{
  if (!StickerKitLibraryCore_frameworkLibrary) {
    StickerKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
}

uint64_t __StickerKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StickerKitLibraryCore_frameworkLibrary = result;
  return result;
}

void __TIGetRemoteEmojiValue_block_invoke()
{
  id v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  [v0 _configureKey:@"RemoteEmoji" domain:@"com.apple.keyboard" defaultValue:MEMORY[0x1E4F1CC38]];
}

Class __getSTKStickerSearchConfigurationClass_block_invoke(uint64_t a1)
{
  StickerKitLibraryCore();
  Class result = objc_getClass("STKStickerSearchConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerSearchConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getSTKStickerRemoteSearchViewControllerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  id v0 = (void *)getSTKStickerRemoteSearchViewControllerClass_softClass;
  uint64_t v6 = getSTKStickerRemoteSearchViewControllerClass_softClass;
  if (!getSTKStickerRemoteSearchViewControllerClass_softClass)
  {
    StickerKitLibraryCore();
    v4[3] = (uint64_t)objc_getClass("STKStickerRemoteSearchViewController");
    getSTKStickerRemoteSearchViewControllerClass_softClass = v4[3];
    id v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

Class __getSTKStickerRemoteSearchViewControllerClass_block_invoke(uint64_t a1)
{
  StickerKitLibraryCore();
  Class result = objc_getClass("STKStickerRemoteSearchViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerRemoteSearchViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __TIGetMultilingualEmojiSearchValue_block_invoke()
{
  id v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  [v0 _configureKey:@"MultilingualEmojiSearch" domain:@"com.apple.keyboard" defaultValue:MEMORY[0x1E4F1CC38]];
}

uint64_t ___collapsedButtonBarGroupViewsPredicate_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"collapsed == NO"];
  uint64_t v1 = _collapsedButtonBarGroupViewsPredicate_collapsedButtonBarGroupViewsPredicate;
  _collapsedButtonBarGroupViewsPredicate_collapsedButtonBarGroupViewsPredicate = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __Block_byref_object_copy__8386(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__8387(uint64_t a1)
{
}

void SetSmartReplyStartTimeForRequest(void *a1, uint64_t a2)
{
  id v3 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&mappingLock);
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:a2];
  uint64_t v5 = SmartReplyTimestampDict();
  [v5 setObject:v4 forKeyedSubscript:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&mappingLock);
}

id TUIInputAnalyticsLog()
{
  if (TUIInputAnalyticsLog_onceToken != -1) {
    dispatch_once(&TUIInputAnalyticsLog_onceToken, &__block_literal_global_8608);
  }
  uint64_t v0 = (void *)TUIInputAnalyticsLog_log;
  return v0;
}

uint64_t GetSmartReplyStartTimeForRequest(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&mappingLock);
  uint64_t v2 = SmartReplyTimestampDict();
  id v3 = [v2 objectForKeyedSubscript:v1];

  if (v3)
  {
    uint64_t v4 = [v3 unsignedLongLongValue];
    uint64_t v5 = SmartReplyTimestampDict();
    [v5 removeObjectForKey:v1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&mappingLock);

  return v4;
}

id SmartReplyTimestampDict()
{
  if (SmartReplyTimestampDict_onceToken != -1) {
    dispatch_once(&SmartReplyTimestampDict_onceToken, &__block_literal_global_38_8606);
  }
  uint64_t v0 = (void *)SmartReplyTimestampDict_mapping;
  return v0;
}

uint64_t __SmartReplyTimestampDict_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = SmartReplyTimestampDict_mapping;
  SmartReplyTimestampDict_mapping = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __TUIInputAnalyticsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.InputAnalytics", "TextAssistant");
  uint64_t v1 = TUIInputAnalyticsLog_log;
  TUIInputAnalyticsLog_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id TUISignalAnalyticsLog()
{
  if (TUISignalAnalyticsLog_onceToken != -1) {
    dispatch_once(&TUISignalAnalyticsLog_onceToken, &__block_literal_global_4_8617);
  }
  os_log_t v0 = (void *)TUISignalAnalyticsLog___instance;
  return v0;
}

uint64_t __TUISignalAnalyticsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextInputUI", "IASignalAnalytics");
  uint64_t v1 = TUISignalAnalyticsLog___instance;
  TUISignalAnalyticsLog___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t sub_18D50AF88()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_18D50AF98()
{
  return MEMORY[0x1F40E5730]();
}

uint64_t sub_18D50AFA8()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_18D50AFB8()
{
  return MEMORY[0x1F4187530]();
}

uint64_t sub_18D50AFC8()
{
  return MEMORY[0x1F4187548]();
}

uint64_t sub_18D50AFD8()
{
  return MEMORY[0x1F4187558]();
}

uint64_t sub_18D50AFE8()
{
  return MEMORY[0x1F4187560]();
}

uint64_t sub_18D50AFF8()
{
  return MEMORY[0x1F4187570]();
}

uint64_t sub_18D50B008()
{
  return MEMORY[0x1F4187580]();
}

uint64_t sub_18D50B018()
{
  return MEMORY[0x1F411BD18]();
}

uint64_t sub_18D50B028()
{
  return MEMORY[0x1F411BD28]();
}

uint64_t sub_18D50B038()
{
  return MEMORY[0x1F411BD38]();
}

uint64_t sub_18D50B048()
{
  return MEMORY[0x1F411BD40]();
}

uint64_t sub_18D50B058()
{
  return MEMORY[0x1F411BD58]();
}

uint64_t sub_18D50B068()
{
  return MEMORY[0x1F411BD60]();
}

uint64_t sub_18D50B078()
{
  return MEMORY[0x1F411BD88]();
}

uint64_t sub_18D50B088()
{
  return MEMORY[0x1F411BDA8]();
}

uint64_t sub_18D50B098()
{
  return MEMORY[0x1F4117400]();
}

uint64_t sub_18D50B0A8()
{
  return MEMORY[0x1F4117410]();
}

uint64_t sub_18D50B0B8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_18D50B0C8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_18D50B0D8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_18D50B0E8()
{
  return MEMORY[0x1F414A6B0]();
}

uint64_t sub_18D50B0F8()
{
  return MEMORY[0x1F414A6B8]();
}

uint64_t sub_18D50B108()
{
  return MEMORY[0x1F414A6C0]();
}

uint64_t sub_18D50B118()
{
  return MEMORY[0x1F4165B18]();
}

uint64_t sub_18D50B128()
{
  return MEMORY[0x1F40F2398]();
}

uint64_t sub_18D50B138()
{
  return MEMORY[0x1F40F23A0]();
}

uint64_t sub_18D50B148()
{
  return MEMORY[0x1F40F23C0]();
}

uint64_t sub_18D50B158()
{
  return MEMORY[0x1F40F23C8]();
}

uint64_t sub_18D50B168()
{
  return MEMORY[0x1F40F26F8]();
}

uint64_t sub_18D50B178()
{
  return MEMORY[0x1F40F2700]();
}

uint64_t sub_18D50B188()
{
  return MEMORY[0x1F40F2708]();
}

uint64_t sub_18D50B198()
{
  return MEMORY[0x1F40F2718]();
}

uint64_t sub_18D50B1A8()
{
  return MEMORY[0x1F40F7EA0]();
}

uint64_t sub_18D50B1B8()
{
  return MEMORY[0x1F40F7EB0]();
}

uint64_t sub_18D50B1C8()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_18D50B1D8()
{
  return MEMORY[0x1F40F8C58]();
}

uint64_t sub_18D50B1E8()
{
  return MEMORY[0x1F40F95F8]();
}

uint64_t sub_18D50B1F8()
{
  return MEMORY[0x1F40F9608]();
}

uint64_t sub_18D50B208()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_18D50B218()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_18D50B228()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_18D50B238()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_18D50B248()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_18D50B268()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_18D50B278()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_18D50B288()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_18D50B2A8()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_18D50B2B8()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_18D50B2C8()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_18D50B2D8()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_18D50B2E8()
{
  return MEMORY[0x1F40FC120]();
}

uint64_t sub_18D50B2F8()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_18D50B308()
{
  return MEMORY[0x1F40FCAF8]();
}

uint64_t sub_18D50B318()
{
  return MEMORY[0x1F40FCB08]();
}

uint64_t sub_18D50B328()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_18D50B338()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_18D50B348()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_18D50B358()
{
  return MEMORY[0x1F4186EF0]();
}

uint64_t sub_18D50B368()
{
  return MEMORY[0x1F4186F38]();
}

uint64_t sub_18D50B378()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_18D50B388()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_18D50B398()
{
  return MEMORY[0x1F40E60B0]();
}

uint64_t sub_18D50B3A8()
{
  return MEMORY[0x1F40E6150]();
}

uint64_t sub_18D50B3B8()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_18D50B3C8()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_18D50B3D8()
{
  return MEMORY[0x1F40E62C0]();
}

uint64_t sub_18D50B3E8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_18D50B3F8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_18D50B408()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_18D50B418()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_18D50B428()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_18D50B438()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_18D50B448()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_18D50B458()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_18D50B468()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_18D50B478()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t sub_18D50B488()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_18D50B498()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_18D50B4A8()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t sub_18D50B4B8()
{
  return MEMORY[0x1F4166990]();
}

uint64_t sub_18D50B4C8()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_18D50B4D8()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_18D50B4E8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_18D50B4F8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_18D50B508()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_18D50B518()
{
  return MEMORY[0x1F40E6D60]();
}

uint64_t sub_18D50B528()
{
  return MEMORY[0x1F40E6D80]();
}

uint64_t sub_18D50B538()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_18D50B548()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_18D50B558()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_18D50B568()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_18D50B578()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_18D50B588()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_18D50B598()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_18D50B5A8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_18D50B5B8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_18D50B5C8()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_18D50B5D8()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_18D50B5E8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_18D50B5F8()
{
  return MEMORY[0x1F4185EF8]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1F40F4AC0](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9978](color);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99B0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1F40D9C90]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1F40D9CB8]();
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

uint64_t CTFontCreateForCharactersWithLanguage()
{
  return MEMORY[0x1F40DF350]();
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x1F40DF4A0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x1F40DF4A8](font);
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x1F40DF4C8](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x1F40DF4E0](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1F40DF510](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1F40DF778](line, *(void *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1F40DF990](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedStringAndOptions(CFAttributedStringRef string, CFDictionaryRef options)
{
  return (CTTypesetterRef)MEMORY[0x1F40DF9A0](string, options);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4166AB0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t TextInputUIBundle()
{
  return MEMORY[0x1F4166AD0]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4166BB8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return MEMORY[0x1F4166CC8](fontWeight);
}

uint64_t UIKBGetNamedColor()
{
  return MEMORY[0x1F4166CE0]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x1F4166D10]();
}

uint64_t UIKeyboardGetLightCandidateHighlightColor()
{
  return MEMORY[0x1F4166D38]();
}

uint64_t UIKeyboardGetLightCandidateSeparatorColor()
{
  return MEMORY[0x1F4166D40]();
}

uint64_t UIKeyboardGetSafeDeviceIdiom()
{
  return MEMORY[0x1F4166D48]();
}

uint64_t UIKeyboardGetSoftwareLayoutForInputMode()
{
  return MEMORY[0x1F4166D50]();
}

uint64_t UIKeyboardGetSupportedLanguages()
{
  return MEMORY[0x1F4166D58]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1F4166D60]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x1F4166D68]();
}

uint64_t UIKeyboardInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x1F4166D70]();
}

uint64_t UIKeyboardInputModeIsDefaultRightToLeft()
{
  return MEMORY[0x1F4166D88]();
}

uint64_t UIKeyboardInputModeLanguageMatchesLocaleLanguage()
{
  return MEMORY[0x1F4166D90]();
}

uint64_t UIKeyboardLocalizedObject()
{
  return MEMORY[0x1F4166DA0]();
}

uint64_t UIKeyboardLocalizedString()
{
  return MEMORY[0x1F4166DB0]();
}

uint64_t UIKeyboardTypeIsNumberPad()
{
  return MEMORY[0x1F4166DC8]();
}

uint64_t UIKeyboardUIPreferStringOverImageForInputMode()
{
  return MEMORY[0x1F4166DD0]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4166E28]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4166E30]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4166E40]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1F4166E88]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1F4166E90]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1F4166EA8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1F40D9030]();
}

uint64_t _TextInputBundlesRoot()
{
  return MEMORY[0x1F4166F58]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint64_t attributeValueFromString()
{
  return MEMORY[0x1F4167128]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

uint64_t kac_get_log()
{
  return MEMORY[0x1F4163E38]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t variantsTypeFromString()
{
  return MEMORY[0x1F4167130]();
}

uint64_t visualStyleFromString()
{
  return MEMORY[0x1F4167138]();
}