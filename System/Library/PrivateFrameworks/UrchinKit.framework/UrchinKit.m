char *sub_2608A753C()
{
  uint64_t v0;
  void *v1;
  char *v2;
  char *v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 112);
  if (v1)
  {
    v2 = *(char **)(v0 + 112);
  }
  else
  {
    v3 = sub_2608AAD38((const char *)v0);
    v4 = *(void **)(v0 + 112);
    *(void *)(v0 + 112) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t sub_2608A7598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 120;
  swift_beginAccess();
  sub_2608ABBA0(v3, (uint64_t)&v11, &qword_26A8C1090);
  if (!v12)
  {
    sub_2608ABC04((uint64_t)&v11, &qword_26A8C1090);
    uint64_t v4 = type metadata accessor for NPSManager();
    v5 = (void *)swift_allocObject();
    v6 = (char *)v5 + OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
    if (qword_26A8C1058 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2608BF548();
    uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26A8C35A0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v6, v8, v7);
    v5[2] = 0xD000000000000017;
    v5[3] = 0x80000002608C1840;
    v5[4] = 0xD000000000000011;
    v5[5] = 0x80000002608C1820;
    uint64_t v12 = v4;
    v13 = &protocol witness table for NPSManager;
    *(void *)&long long v11 = v5;
    sub_2608ABA58((uint64_t)&v11, (uint64_t)v10);
    swift_beginAccess();
    sub_2608ABABC((uint64_t)v10, v3);
    swift_endAccess();
  }
  return sub_2608ABB24(&v11, a1);
}

uint64_t sub_2608A773C()
{
  v0 = (void *)sub_2608ACF04((uint64_t)&unk_270CA8C48);
  uint64_t result = swift_arrayDestroy();
  off_26A8C0FF0 = v0;
  return result;
}

uint64_t sub_2608A7788()
{
  type metadata accessor for SyncedPreferenceManager();
  v0 = (char *)swift_allocObject();
  swift_defaultActor_initialize();
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  uint64_t v1 = OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  if (qword_26A8C1068 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2608BF548();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C35D0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(&v0[v1], v3, v2);
  qword_26A8C1000 = (uint64_t)v0;
  return result;
}

char *SyncedPreferenceManager.__allocating_init()()
{
  v0 = (char *)swift_allocObject();
  swift_defaultActor_initialize();
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  uint64_t v1 = OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  if (qword_26A8C1068 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2608BF548();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C35D0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(&v0[v1], v3, v2);
  return v0;
}

uint64_t static SyncedPreferenceManager.shared.getter()
{
  if (qword_26A8C0FF8 != -1) {
    swift_once();
  }

  return swift_retain();
}

char *SyncedPreferenceManager.init()()
{
  swift_defaultActor_initialize();
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  uint64_t v1 = OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  if (qword_26A8C1068 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2608BF548();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C35D0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(&v0[v1], v3, v2);
  return v0;
}

uint64_t sub_2608A7A58()
{
  *(void *)(v1 + 56) = v0;
  return MEMORY[0x270FA2498](sub_2608A7A78, v0, 0);
}

uint64_t sub_2608A7A78()
{
  v19 = v0 + 2;
  if (qword_26A8C0FE8 != -1) {
LABEL_29:
  }
    swift_once();
  uint64_t v1 = (char *)off_26A8C0FF0 + 56;
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *((unsigned char *)off_26A8C0FF0 + 32);
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  uint64_t v4 = v2 & *((void *)off_26A8C0FF0 + 7);
  int64_t v5 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_6;
    }
    int64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (v9 >= v5) {
      goto LABEL_22;
    }
    uint64_t v10 = *(void *)&v1[8 * v9];
    ++v6;
    if (!v10)
    {
      int64_t v6 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_22;
      }
      uint64_t v10 = *(void *)&v1[8 * v6];
      if (!v10)
      {
        int64_t v6 = v9 + 2;
        if (v9 + 2 >= v5) {
          goto LABEL_22;
        }
        uint64_t v10 = *(void *)&v1[8 * v6];
        if (!v10) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_6:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2608A753C();
    uint64_t v8 = (void *)sub_2608BF5B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_removeObjectForKey_, v8);
  }
  int64_t v11 = v9 + 3;
  if (v11 < v5)
  {
    uint64_t v10 = *(void *)&v1[8 * v11];
    if (!v10)
    {
      while (1)
      {
        int64_t v6 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_28;
        }
        if (v6 >= v5) {
          goto LABEL_22;
        }
        uint64_t v10 = *(void *)&v1[8 * v6];
        ++v11;
        if (v10) {
          goto LABEL_21;
        }
      }
    }
    int64_t v6 = v11;
    goto LABEL_21;
  }
LABEL_22:
  swift_release();
  sub_2608A7598((uint64_t)v19);
  uint64_t v12 = v0[5];
  uint64_t v13 = v0[6];
  __swift_project_boxed_opaque_existential_1(v19, v12);
  (*(void (**)(void *, uint64_t, uint64_t))(v13 + 32))(off_26A8C0FF0, v12, v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  v14 = sub_2608BF528();
  os_log_type_t v15 = sub_2608BF748();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_2608A5000, v14, v15, "Successfully deleted plist.", v16, 2u);
    MEMORY[0x26121F190](v16, -1, -1);
  }

  v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t SyncedPreferenceManager.deinit()
{
  sub_2608ABC04(v0 + 120, &qword_26A8C1090);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SyncedPreferenceManager.__deallocating_deinit()
{
  sub_2608ABC04(v0 + 120, &qword_26A8C1090);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t SyncedPreferenceManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2608A7E74()
{
  return v0;
}

uint64_t sub_2608A7E80()
{
  return 1;
}

uint64_t sub_2608A7E88()
{
  return sub_2608BF958();
}

uint64_t sub_2608A7ECC()
{
  return sub_2608BF938();
}

uint64_t sub_2608A7EF4()
{
  return sub_2608BF958();
}

uint64_t sub_2608A7F38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2608AB534(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2608A7F64()
{
  return 0;
}

void sub_2608A7F70(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2608A7F7C(uint64_t a1)
{
  unint64_t v2 = sub_2608AB790();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2608A7FB8(uint64_t a1)
{
  unint64_t v2 = sub_2608AB790();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2608A7FF4(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1170);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608AB790();
  sub_2608BF978();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1158);
  sub_2608AB82C(&qword_26A8C1178, &qword_26A8C1180);
  sub_2608BF8F8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void *sub_2608A817C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_2608AB5E0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2608A81A8(void *a1)
{
  return sub_2608A7FF4(a1, *v1);
}

uint64_t SyncedPreferenceManager.getLocations()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_2608A81E4, v0, 0);
}

uint64_t sub_2608A81E4()
{
  uint64_t v30 = v0;
  uint64_t v1 = sub_2608A753C();
  uint64_t v2 = (void *)sub_2608BF5B8();
  id v3 = objc_msgSend(v1, sel_dataForKey_, v2);

  if (v3)
  {
    uint64_t v4 = (uint64_t *)(v0 + 16);
    uint64_t v5 = sub_2608BF3A8();
    unint64_t v7 = v6;

    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v5 == v5 >> 32) {
          goto LABEL_10;
        }
        goto LABEL_7;
      case 2uLL:
        if (*(void *)(v5 + 16) == *(void *)(v5 + 24)) {
          goto LABEL_10;
        }
LABEL_7:
        sub_2608A9C18(v5, v7);
        goto LABEL_8;
      case 3uLL:
        goto LABEL_4;
      default:
        if ((v7 & 0xFF000000000000) == 0)
        {
LABEL_4:
          sub_2608A9BC0(v5, v7);
          goto LABEL_10;
        }
LABEL_8:
        sub_2608BF308();
        swift_allocObject();
        sub_2608BF2F8();
        sub_2608A9C70();
        sub_2608BF2E8();
        swift_release();
        uint64_t v21 = *v4;
        swift_bridgeObjectRetain_n();
        v22 = sub_2608BF528();
        os_log_type_t v23 = sub_2608BF748();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v25 = swift_slowAlloc();
          buf = (uint8_t *)swift_slowAlloc();
          v29 = buf;
          *(_DWORD *)uint64_t v25 = 134218243;
          *uint64_t v4 = *(void *)(v21 + 16);
          sub_2608BF778();
          swift_bridgeObjectRelease();
          *(_WORD *)(v25 + 12) = 2081;
          uint64_t v26 = sub_2608A88A0(v21);
          *uint64_t v4 = sub_2608A9CC4(v26, v27, (uint64_t *)&v29);
          sub_2608BF778();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2608A5000, v22, v23, "Successfully read %ld locations: %{private}s", (uint8_t *)v25, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x26121F190](buf, -1, -1);
          MEMORY[0x26121F190](v25, -1, -1);
          sub_2608A9BC0(v5, v7);
          sub_2608A9BC0(v5, v7);
        }
        else
        {
          sub_2608A9BC0(v5, v7);
          sub_2608A9BC0(v5, v7);

          swift_bridgeObjectRelease_n();
        }
        break;
    }
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0xF000000000000000;
LABEL_10:
    uint64_t v8 = sub_2608BF528();
    os_log_type_t v9 = sub_2608BF748();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_2608A5000, v8, v9, "Could not read data from UserDefaults, returning sample locations.", v10, 2u);
      MEMORY[0x26121F190](v10, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C10A0);
    uint64_t v11 = type metadata accessor for CoastalLocation();
    uint64_t v12 = *(void *)(*(void *)(v11 - 8) + 72);
    unint64_t v13 = (*(unsigned __int8 *)(*(void *)(v11 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2608C0030;
    uint64_t v14 = v21 + v13;
    if (qword_26A8C1008 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_26A8C3540);
    sub_2608A9B48(v15, v14);
    if (qword_26A8C1010 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v11, (uint64_t)qword_26A8C3558);
    sub_2608A9B48(v16, v14 + v12);
    uint64_t v17 = v14 + 2 * v12;
    if (qword_26A8C1018 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v11, (uint64_t)qword_26A8C3570);
    sub_2608A9B48(v18, v17);
    sub_2608A9BAC(v5, v7);
  }
  v19 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v19(v21);
}

uint64_t sub_2608A88A0(uint64_t a1)
{
  uint64_t v17 = type metadata accessor for CoastalLocation();
  uint64_t v2 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_2608BAAD0(0, v5, 0);
    uint64_t v7 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v8 = *(void *)(v2 + 72);
    uint64_t v6 = v18;
    do
    {
      sub_2608A9B48(v7, (uint64_t)v4);
      os_log_type_t v9 = &v4[*(int *)(v17 + 32)];
      uint64_t v11 = *(void *)v9;
      uint64_t v10 = *((void *)v9 + 1);
      swift_bridgeObjectRetain();
      sub_2608AB9A0((uint64_t)v4);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2608BAAD0(0, *(void *)(v6 + 16) + 1, 1);
        uint64_t v6 = v18;
      }
      unint64_t v13 = *(void *)(v6 + 16);
      unint64_t v12 = *(void *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_2608BAAD0(v12 > 1, v13 + 1, 1);
        uint64_t v6 = v18;
      }
      *(void *)(v6 + 16) = v13 + 1;
      unint64_t v14 = v6 + 16 * v13;
      *(void *)(v14 + 32) = v11;
      *(void *)(v14 + 40) = v10;
      v7 += v8;
      --v5;
    }
    while (v5);
  }
  uint64_t v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1190);
  sub_2608AB9FC();
  sub_2608BF578();
  swift_bridgeObjectRelease();
  uint64_t v18 = 91;
  unint64_t v19 = 0xE100000000000000;
  sub_2608BF628();
  swift_bridgeObjectRelease();
  sub_2608BF628();
  return v18;
}

uint64_t SyncedPreferenceManager.set(locations:)(uint64_t a1)
{
  v2[11] = a1;
  v2[12] = v1;
  uint64_t v3 = sub_2608BF3F8();
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2608A8B70, v1, 0);
}

uint64_t sub_2608A8B70()
{
  uint64_t v30 = v0;
  uint64_t v1 = v0[11];
  sub_2608BF338();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_2608BF328();
  v0[7] = v1;
  sub_2608AA31C();
  uint64_t v2 = sub_2608BF318();
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v26 = v0[13];
  uint64_t v5 = v2;
  unint64_t v7 = v6;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_2608A753C();
  uint64_t v27 = v5;
  unint64_t v28 = v7;
  os_log_type_t v9 = (void *)sub_2608BF398();
  uint64_t v10 = (void *)sub_2608BF5B8();
  objc_msgSend(v8, sel_setValue_forKey_, v9, v10);

  uint64_t v11 = sub_2608A753C();
  sub_2608BF3D8();
  unint64_t v12 = (void *)sub_2608BF3C8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v26);
  unint64_t v13 = (void *)sub_2608BF5B8();
  objc_msgSend(v11, sel_setValue_forKey_, v12, v13);

  sub_2608A7598((uint64_t)(v0 + 2));
  uint64_t v14 = v0[5];
  uint64_t v15 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v14);
  if (qword_26A8C0FE8 != -1) {
    swift_once();
  }
  (*(void (**)(void *, uint64_t, uint64_t))(v15 + 32))(off_26A8C0FF0, v14, v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_2608BF528();
  os_log_type_t v17 = sub_2608BF748();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v19 = v0[11];
  if (v18)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v29 = v21;
    *(_DWORD *)uint64_t v20 = 134218243;
    v0[9] = *(void *)(v19 + 16);
    sub_2608BF778();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2081;
    uint64_t v22 = sub_2608A88A0(v19);
    v0[10] = sub_2608A9CC4(v22, v23, &v29);
    sub_2608BF778();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2608A5000, v16, v17, "Successfully saved %ld locations: %{private}s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x26121F190](v21, -1, -1);
    MEMORY[0x26121F190](v20, -1, -1);
    sub_2608A9BC0(v27, v28);
  }
  else
  {
    sub_2608A9BC0(v5, v28);

    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_2608A90A4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2608ABEA4;
  return SyncedPreferenceManager.set(locations:)(a1);
}

uint64_t sub_2608A913C()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2608ABE9C;
  v3[3] = v2;
  return MEMORY[0x270FA2498](sub_2608A81E4, v2, 0);
}

uint64_t SyncedPreferenceManager.getSelectedLocation()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_2608A9208, v0, 0);
}

uint64_t sub_2608A9208()
{
  uint64_t v16 = v0;
  uint64_t v1 = sub_2608A753C();
  uint64_t v2 = (void *)sub_2608BF5B8();
  id v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  if (v3)
  {
    uint64_t v4 = sub_2608BF5C8();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v7 = sub_2608BF528();
  os_log_type_t v8 = sub_2608BF748();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = v14;
    *(_DWORD *)os_log_type_t v9 = 136315138;
    if (v6) {
      uint64_t v10 = v4;
    }
    else {
      uint64_t v10 = 7104878;
    }
    if (v6) {
      unint64_t v11 = v6;
    }
    else {
      unint64_t v11 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_2608A9CC4(v10, v11, &v15);
    sub_2608BF778();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2608A5000, v7, v8, "Read selectedLocation: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26121F190](v14, -1, -1);
    MEMORY[0x26121F190](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v12 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v12(v4, v6);
}

uint64_t SyncedPreferenceManager.set(selectedLocation:)(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return MEMORY[0x270FA2498](sub_2608A9488, v2, 0);
}

uint64_t sub_2608A9488()
{
  uint64_t v17 = v0;
  uint64_t v1 = v0[8];
  uint64_t v2 = sub_2608A753C();
  if (v1) {
    uint64_t v3 = sub_2608BF5B8();
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (void *)sub_2608BF5B8();
  objc_msgSend(v2, sel_setValue_forKey_, v3, v4);

  swift_unknownObjectRelease();
  sub_2608A7598((uint64_t)(v0 + 2));
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v5);
  if (qword_26A8C0FE8 != -1) {
    swift_once();
  }
  unint64_t v7 = v0[8];
  (*(void (**)(void *, uint64_t, uint64_t))(v6 + 32))(off_26A8C0FF0, v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_bridgeObjectRetain_n();
  os_log_type_t v8 = sub_2608BF528();
  os_log_type_t v9 = sub_2608BF748();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = v0[7];
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v16 = v12;
    *(_DWORD *)unint64_t v11 = 136315138;
    if (v1)
    {
      unint64_t v13 = v7;
    }
    else
    {
      uint64_t v10 = 7104878;
      unint64_t v13 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    v0[2] = sub_2608A9CC4(v10, v13, &v16);
    sub_2608BF778();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2608A5000, v8, v9, "Set selected location to: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26121F190](v12, -1, -1);
    MEMORY[0x26121F190](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2608A9738(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_2608ABEA4;
  v7[8] = a2;
  v7[9] = v6;
  v7[7] = a1;
  return MEMORY[0x270FA2498](sub_2608A9488, v6, 0);
}

uint64_t sub_2608A97F8()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2608ABEA0;
  v3[3] = v2;
  return MEMORY[0x270FA2498](sub_2608A9208, v2, 0);
}

uint64_t SyncedPreferenceManager.getLastUpdated()(uint64_t a1)
{
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v1;
  return MEMORY[0x270FA2498](sub_2608A98C4, v1, 0);
}

uint64_t sub_2608A98C4()
{
  uint64_t v1 = sub_2608A753C();
  uint64_t v2 = (void *)sub_2608BF5B8();
  id v3 = objc_msgSend(v1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_2608BF798();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_2608ABB3C(v0 + 48, v0 + 16, &qword_26A8C10E0);
  sub_2608ABB3C(v0 + 16, v0 + 48, &qword_26A8C10E0);
  uint64_t v4 = *(void *)(v0 + 80);
  if (*(void *)(v0 + 72))
  {
    uint64_t v5 = sub_2608BF3F8();
    int v6 = swift_dynamicCast();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, v6 ^ 1u, 1, v5);
  }
  else
  {
    sub_2608ABC04(v0 + 48, &qword_26A8C10E0);
    uint64_t v7 = sub_2608BF3F8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  }
  os_log_type_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
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

uint64_t sub_2608A9B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2608A9BAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2608A9BC0(a1, a2);
  }
  return a1;
}

uint64_t sub_2608A9BC0(uint64_t a1, unint64_t a2)
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

uint64_t sub_2608A9C18(uint64_t a1, unint64_t a2)
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

unint64_t sub_2608A9C70()
{
  unint64_t result = qword_26A8C10A8;
  if (!qword_26A8C10A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C10A8);
  }
  return result;
}

uint64_t sub_2608A9CC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2608A9D98(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2608AB940((uint64_t)v12, *a3);
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
      sub_2608AB940((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2608A9D98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2608BF788();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2608A9F54(a5, a6);
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
  uint64_t v8 = sub_2608BF7E8();
  if (!v8)
  {
    sub_2608BF7F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2608BF808();
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

uint64_t sub_2608A9F54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2608A9FEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2608AA1CC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2608AA1CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2608A9FEC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2608AA164(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2608BF7B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2608BF7F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2608BF638();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2608BF808();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2608BF7F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2608AA164(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1188);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2608AA1CC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1188);
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
  uint64_t result = sub_2608BF808();
  __break(1u);
  return result;
}

unint64_t sub_2608AA31C()
{
  unint64_t result = qword_26A8C10C0;
  if (!qword_26A8C10C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C10C0);
  }
  return result;
}

uint64_t sub_2608AA370()
{
  return type metadata accessor for SyncedPreferenceManager();
}

uint64_t type metadata accessor for SyncedPreferenceManager()
{
  uint64_t result = qword_26A8C1108;
  if (!qword_26A8C1108) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2608AA3C4()
{
  uint64_t result = sub_2608BF548();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SyncedPreferenceManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SyncedPreferenceManager);
}

uint64_t dispatch thunk of SyncedPreferenceManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SyncedPreferenceManager.deleteAll()()
{
  unint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 168) + **(int **)(*(void *)v0 + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2608ABEA4;
  return v4();
}

uint64_t dispatch thunk of StaticLocationStore.set(locations:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = sub_2608AA698;
  return v9(a1, a2, a3);
}

uint64_t sub_2608AA698()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of StaticLocationStore.getLocations()(uint64_t a1, uint64_t a2)
{
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2608AA87C;
  return v7(a1, a2);
}

uint64_t sub_2608AA87C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of SelectedLocationStore.set(selectedLocation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *int64_t v9 = v4;
  v9[1] = sub_2608ABEA4;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SelectedLocationStore.getSelectedLocation()(uint64_t a1, uint64_t a2)
{
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2608AAB74;
  return v7(a1, a2);
}

uint64_t sub_2608AAB74(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2608AAC88(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2608AACA8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D()
{
  if (!qword_26A8C1140)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A8C1140);
    }
  }
}

ValueMetadata *type metadata accessor for SyncedPreferenceManager.StaticLocationList()
{
  return &type metadata for SyncedPreferenceManager.StaticLocationList;
}

char *sub_2608AAD38(const char *a1)
{
  unint64_t v56 = (unint64_t)a1;
  uint64_t v1 = sub_2608BF388();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v52 - v7;
  MEMORY[0x270FA5388](v6);
  v55 = (char *)&v52 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11A0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v52 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v57 = (uint64_t)&v52 - v17;
  id v18 = objc_msgSend(self, sel_defaultManager);
  uint64_t v19 = (void *)sub_2608BF5B8();
  id v20 = objc_msgSend(v18, sel_containerURLForSecurityApplicationGroupIdentifier_, v19);

  if (v20)
  {
    sub_2608BF378();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v16, 0, 1, v1);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v16, 1, 1, v1);
  }
  uint64_t v21 = v57;
  sub_2608ABB3C((uint64_t)v16, v57, &qword_26A8C11A0);
  sub_2608ABBA0(v21, (uint64_t)v13, &qword_26A8C11A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v13, 1, v1) == 1)
  {
    sub_2608ABC04((uint64_t)v13, &qword_26A8C11A0);
    uint64_t v22 = sub_2608BF528();
    os_log_type_t v23 = sub_2608BF738();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v59 = v25;
      *(_DWORD *)v24 = 136315138;
      uint64_t v58 = sub_2608A9CC4(0xD000000000000017, 0x80000002608C1840, &v59);
      sub_2608BF778();
      _os_log_impl(&dword_2608A5000, v22, v23, "Could not find %s url. Using standard defaults.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26121F190](v25, -1, -1);
      MEMORY[0x26121F190](v24, -1, -1);
    }

    id v26 = objc_msgSend(self, sel_standardUserDefaults);
LABEL_17:
    sub_2608ABC04(v21, &qword_26A8C11A0);
    return (char *)v26;
  }
  v54 = v8;
  uint64_t v27 = v55;
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v55, v13, v1);
  unint64_t v28 = self;
  uint64_t v29 = (void *)sub_2608BF5B8();
  uint64_t v30 = (void *)sub_2608BF368();
  id v31 = objc_msgSend(v28, sel_createWithSuiteName_container_, v29, v30);

  v32 = *(void (**)(void))(v2 + 16);
  if (!v31)
  {
    unint64_t v56 = (unint64_t)"com.apple.weather";
    v42 = v54;
    v32();
    v43 = sub_2608BF528();
    uint64_t v44 = sub_2608BF738();
    if (os_log_type_enabled(v43, (os_log_type_t)v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v59 = v53;
      *(_DWORD *)uint64_t v45 = 136315394;
      uint64_t v46 = sub_2608BF358();
      uint64_t v58 = sub_2608A9CC4(v46, v47, &v59);
      sub_2608BF778();
      swift_bridgeObjectRelease();
      v48 = *(void (**)(char *, uint64_t))(v2 + 8);
      v48(v42, v1);
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v58 = sub_2608A9CC4(0xD000000000000017, v56 | 0x8000000000000000, &v59);
      uint64_t v21 = v57;
      sub_2608BF778();
      _os_log_impl(&dword_2608A5000, v43, (os_log_type_t)v44, "Could not create user defaults with url: %s and group: %s. Using standard defaults.", (uint8_t *)v45, 0x16u);
      uint64_t v49 = v53;
      swift_arrayDestroy();
      MEMORY[0x26121F190](v49, -1, -1);
      MEMORY[0x26121F190](v45, -1, -1);
    }
    else
    {

      v48 = *(void (**)(char *, uint64_t))(v2 + 8);
      v48(v42, v1);
    }
    id v26 = objc_msgSend(self, sel_standardUserDefaults);
    v48(v55, v1);
    goto LABEL_17;
  }
  ((void (*)(char *, char *, uint64_t))v32)(v5, v27, v1);
  v33 = (char *)v31;
  v34 = sub_2608BF528();
  os_log_type_t v35 = sub_2608BF748();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v59 = v37;
    unint64_t v56 = (unint64_t)v33;
    *(_DWORD *)v36 = 136315138;
    uint64_t v38 = sub_2608BF348();
    uint64_t v58 = sub_2608A9CC4(v38, v39, &v59);
    v33 = (char *)v56;
    sub_2608BF778();
    swift_bridgeObjectRelease();
    v40 = *(void (**)(char *, uint64_t))(v2 + 8);
    v40(v5, v1);
    _os_log_impl(&dword_2608A5000, v34, v35, "Creating defaults at: %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26121F190](v37, -1, -1);
    MEMORY[0x26121F190](v36, -1, -1);

    v40(v55, v1);
    uint64_t v41 = v57;
  }
  else
  {

    v50 = *(void (**)(char *, uint64_t))(v2 + 8);
    v50(v5, v1);

    v50(v27, v1);
    uint64_t v41 = v21;
  }
  sub_2608ABC04(v41, &qword_26A8C11A0);
  return v33;
}

uint64_t sub_2608AB534(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F697461636F6CLL && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2608BF918();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2608AB5C4()
{
  return 0x6E6F697461636F6CLL;
}

void *sub_2608AB5E0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1148);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608AB790();
  sub_2608BF968();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1158);
    sub_2608AB82C(&qword_26A8C1160, &qword_26A8C1168);
    sub_2608BF888();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_2608AB790()
{
  unint64_t result = qword_26A8C1150;
  if (!qword_26A8C1150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1150);
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

uint64_t sub_2608AB82C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C1158);
    sub_2608AB8AC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2608AB8AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CoastalLocation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
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

uint64_t sub_2608AB940(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2608AB9A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2608AB9FC()
{
  unint64_t result = qword_26A8C1198;
  if (!qword_26A8C1198)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C1190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1198);
  }
  return result;
}

uint64_t sub_2608ABA58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2608ABABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2608ABB24(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2608ABB3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2608ABBA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2608ABC04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncedPreferenceManager.StaticLocationList.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SyncedPreferenceManager.StaticLocationList.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2608ABD50);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2608ABD78()
{
  return 0;
}

ValueMetadata *type metadata accessor for SyncedPreferenceManager.StaticLocationList.CodingKeys()
{
  return &type metadata for SyncedPreferenceManager.StaticLocationList.CodingKeys;
}

unint64_t sub_2608ABD98()
{
  unint64_t result = qword_26A8C11A8;
  if (!qword_26A8C11A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C11A8);
  }
  return result;
}

unint64_t sub_2608ABDF0()
{
  unint64_t result = qword_26A8C11B0;
  if (!qword_26A8C11B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C11B0);
  }
  return result;
}

unint64_t sub_2608ABE48()
{
  unint64_t result = qword_26A8C11B8;
  if (!qword_26A8C11B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C11B8);
  }
  return result;
}

uint64_t static SampleLocationBuilder.buildSampleLocations()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C10A0);
  uint64_t v0 = type metadata accessor for CoastalLocation();
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2608C0030;
  uint64_t v4 = v3 + v2;
  if (qword_26A8C1008 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_26A8C3540);
  sub_2608A9B48(v5, v4);
  if (qword_26A8C1010 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v0, (uint64_t)qword_26A8C3558);
  sub_2608A9B48(v6, v4 + v1);
  if (qword_26A8C1018 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v0, (uint64_t)qword_26A8C3570);
  sub_2608A9B48(v7, v4 + 2 * v1);
  return v3;
}

uint64_t static SampleLocationBuilder.buildAppleParkLocation()@<X0>(uint64_t a1@<X8>)
{
  if (qword_26A8C1020 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CoastalLocation();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C3588);

  return sub_2608A9B48(v3, a1);
}

uint64_t sub_2608AC0C4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2608BF4D8();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2608BF418();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_2608BF5A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v14, qword_26A8C3540);
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26A8C3540);
  sub_2608BF598();
  uint64_t v16 = (void *)sub_2608BF5B8();
  id v17 = objc_msgSend(self, sel_bundleWithIdentifier_, v16);

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  sub_2608BF408();
  uint64_t v18 = sub_2608BF5E8();
  uint64_t v20 = v19;
  uint64_t v21 = v7;
  uint64_t v22 = v27;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v21);
  uint64_t v23 = v28;
  sub_2608BF4A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v2, 1, v23) == 1)
  {
    sub_2608BF4C8();
    sub_2608ACEA4((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v5, v2, v23);
  }
  uint64_t v24 = sub_2608AD0A8((uint64_t)&unk_270CA8C98);
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(v18, v20, (uint64_t)v5, 0, 0, 0xD000000000000011, 0x80000002608C1920, v15, 37.4956053, -122.496507, v24);
}

uint64_t sub_2608AC49C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2608BF4D8();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2608BF418();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_2608BF5A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v14, qword_26A8C3558);
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26A8C3558);
  sub_2608BF598();
  uint64_t v16 = (void *)sub_2608BF5B8();
  id v17 = objc_msgSend(self, sel_bundleWithIdentifier_, v16);

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  sub_2608BF408();
  uint64_t v18 = sub_2608BF5E8();
  uint64_t v20 = v19;
  uint64_t v21 = v7;
  uint64_t v22 = v27;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v21);
  uint64_t v23 = v28;
  sub_2608BF4A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v2, 1, v23) == 1)
  {
    sub_2608BF4C8();
    sub_2608ACEA4((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v5, v2, v23);
  }
  uint64_t v24 = sub_2608AD0A8((uint64_t)&unk_270CA8CC0);
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(v18, v20, (uint64_t)v5, 0, 0, 0xD000000000000010, 0x80000002608C1900, v15, 21.2754283, -157.825717, v24);
}

uint64_t sub_2608AC874()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2608BF4D8();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2608BF418();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_2608BF5A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v14, qword_26A8C3570);
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_26A8C3570);
  sub_2608BF598();
  uint64_t v16 = (void *)sub_2608BF5B8();
  id v17 = objc_msgSend(self, sel_bundleWithIdentifier_, v16);

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  sub_2608BF408();
  uint64_t v18 = sub_2608BF5E8();
  uint64_t v20 = v19;
  uint64_t v21 = v7;
  uint64_t v22 = v27;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v21);
  uint64_t v23 = v28;
  sub_2608BF4A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v2, 1, v23) == 1)
  {
    sub_2608BF4C8();
    sub_2608ACEA4((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v5, v2, v23);
  }
  uint64_t v24 = sub_2608AD0A8((uint64_t)&unk_270CA8CE8);
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(v18, v20, (uint64_t)v5, 0, 0, 0xD000000000000011, 0x80000002608C18C0, v15, -33.8911957, 151.277693, v24);
}

uint64_t sub_2608ACC4C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2608BF4D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v7, qword_26A8C3588);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26A8C3588);
  sub_2608BF4A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_2608BF4C8();
    sub_2608ACEA4((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0x206B637544205041, 0xEC000000646E6F50, (uint64_t)v6, 0, 0, 0, 0, v8, 37.33532, -122.00974, 0);
}

ValueMetadata *type metadata accessor for SampleLocationBuilder()
{
  return &type metadata for SampleLocationBuilder;
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

uint64_t sub_2608ACEA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2608ACF04(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11D0);
    uint64_t v3 = sub_2608BF7A8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_2608BF928();
      swift_bridgeObjectRetain();
      sub_2608BF608();
      uint64_t result = sub_2608BF958();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_2608BF918(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_2608BF918();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_2608AD0A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C8);
    uint64_t v2 = sub_2608BF7A8();
    uint64_t v3 = v2 + 56;
    while (1)
    {
      sub_2608BF928();
      sub_2608BF938();
      uint64_t result = sub_2608BF958();
      unint64_t v5 = result & ~(-1 << *(unsigned char *)(v2 + 32));
      unint64_t v6 = v5 >> 6;
      uint64_t v7 = *(void *)(v3 + 8 * (v5 >> 6));
      uint64_t v8 = 1 << v5;
      if ((v8 & v7) == 0)
      {
        *(void *)(v3 + 8 * v6) = v8 | v7;
        uint64_t v9 = *(void *)(v2 + 16);
        BOOL v10 = __OFADD__(v9, 1);
        uint64_t v11 = v9 + 1;
        if (v10)
        {
          __break(1u);
          return result;
        }
        *(void *)(v2 + 16) = v11;
      }
      if (!--v1) {
        return v2;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

UrchinKit::UrchinWidgetKind_optional __swiftcall UrchinWidgetKind.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_2608BF818();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static UrchinWidgetKind.allCases.getter()
{
  return &unk_270CA8D90;
}

uint64_t UrchinWidgetKind.rawValue.getter()
{
  return *(void *)&aSwell_1[8 * *v0];
}

uint64_t sub_2608AD210(char *a1, char *a2)
{
  return sub_2608B1310(*a1, *a2);
}

unint64_t sub_2608AD220()
{
  unint64_t result = qword_26A8C11D8;
  if (!qword_26A8C11D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C11D8);
  }
  return result;
}

uint64_t sub_2608AD274()
{
  return sub_2608B1398();
}

uint64_t sub_2608AD27C()
{
  return sub_2608B1404();
}

uint64_t sub_2608AD284()
{
  return sub_2608B1458();
}

UrchinKit::UrchinWidgetKind_optional sub_2608AD28C(Swift::String *a1)
{
  return UrchinWidgetKind.init(rawValue:)(*a1);
}

uint64_t sub_2608AD298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UrchinWidgetKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2608AD2C4()
{
  unint64_t result = qword_26A8C11E0;
  if (!qword_26A8C11E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C11E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C11E0);
  }
  return result;
}

void sub_2608AD320(void *a1@<X8>)
{
  *a1 = &unk_270CA8DB8;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UrchinWidgetKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UrchinWidgetKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2608AD498);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_2608AD4C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2608AD4C8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UrchinWidgetKind()
{
  return &type metadata for UrchinWidgetKind;
}

char *NPSManager.__allocating_init(appGroupName:npsContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = (char *)swift_allocObject();
  uint64_t v9 = OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  if (qword_26A8C1058 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2608BF548();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26A8C35A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(&v8[v9], v11, v10);
  *((void *)v8 + 2) = a1;
  *((void *)v8 + 3) = a2;
  *((void *)v8 + 4) = a3;
  *((void *)v8 + 5) = a4;
  return v8;
}

uint64_t NPSManager.appGroupName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NPSManager.npsContainer.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

char *NPSManager.init(appGroupName:npsContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  if (qword_26A8C1058 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2608BF548();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26A8C35A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(&v4[v9], v11, v10);
  *((void *)v4 + 2) = a1;
  *((void *)v4 + 3) = a2;
  *((void *)v4 + 4) = a3;
  *((void *)v4 + 5) = a4;
  return v4;
}

void sub_2608AD708()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)UKNPSManagerBridge), sel_init);
  uint64_t v1 = (void *)sub_2608BF5B8();
  int v2 = (void *)sub_2608BF708();
  int v3 = (void *)sub_2608BF5B8();
  unsigned int v4 = (void *)sub_2608BF5B8();
  objc_msgSend(v0, sel_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_, v1, v2, v3, v4);

  oslog = sub_2608BF528();
  os_log_type_t v5 = sub_2608BF748();
  if (os_log_type_enabled(oslog, v5))
  {
    unsigned int v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl(&dword_2608A5000, oslog, v5, "Finished syncing using NPS.", v6, 2u);
    MEMORY[0x26121F190](v6, -1, -1);
  }
}

uint64_t NPSManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t NPSManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2608AD990()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2608AD9C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2608AD9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  type metadata accessor for NPSManager();
  uint64_t v10 = (char *)swift_allocObject();
  uint64_t v11 = OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  if (qword_26A8C1058 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2608BF548();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26A8C35A0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(&v10[v11], v13, v12);
  *((void *)v10 + 2) = a1;
  *((void *)v10 + 3) = a2;
  *((void *)v10 + 4) = a3;
  *((void *)v10 + 5) = a4;
  *a5 = v10;
  return result;
}

void sub_2608ADAEC()
{
}

uint64_t dispatch thunk of NPSManagerType.appGroupName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NPSManagerType.npsContainer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NPSManagerType.init(appGroupName:npsContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of NPSManagerType.synchronize(keys:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_2608ADB60()
{
  return type metadata accessor for NPSManager();
}

uint64_t type metadata accessor for NPSManager()
{
  uint64_t result = qword_26A8C11F8;
  if (!qword_26A8C11F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2608ADBB4()
{
  uint64_t result = sub_2608BF548();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for NPSManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NPSManager);
}

uint64_t dispatch thunk of NPSManager.__allocating_init(appGroupName:npsContainer:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of NPSManager.synchronize(keys:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

BOOL CLAuthorizationStatus.isAuthorized.getter(int a1)
{
  return (a1 - 3) < 2;
}

uint64_t CLAuthorizationStatus.string.getter()
{
  return 0x6E776F6E6B6E75;
}

const char *UrchinFeatureFlags.domain.getter()
{
  return "Urchin";
}

const char *UrchinFeatureFlags.feature.getter()
{
  return "urchin";
}

uint64_t static UrchinFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t UrchinFeatureFlags.hash(into:)()
{
  return sub_2608BF938();
}

uint64_t UrchinFeatureFlags.hashValue.getter()
{
  return sub_2608BF958();
}

unint64_t sub_2608ADE30()
{
  unint64_t result = qword_26A8C1208;
  if (!qword_26A8C1208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1208);
  }
  return result;
}

const char *sub_2608ADE84()
{
  return "Urchin";
}

const char *sub_2608ADE98()
{
  return "urchin";
}

unsigned char *storeEnumTagSinglePayload for UrchinFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2608ADF48);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UrchinFeatureFlags()
{
  return &type metadata for UrchinFeatureFlags;
}

uint64_t CLLocation.shortDescription.getter()
{
  objc_msgSend(v0, sel_coordinate);
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1210);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x263F8D538];
  *(_OWORD *)(v5 + 16) = xmmword_2608C05F0;
  uint64_t v7 = MEMORY[0x263F8D5B8];
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 96) = v6;
  *(void *)(v5 + 104) = v7;
  *(void *)(v5 + 72) = v4;

  return sub_2608BF5D8();
}

uint64_t static UrchinAnalytics.send<A>(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](a1);
  int v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1218);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2608BF6C8();
  uint64_t v12 = sub_2608BF6E8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = a2;
  *((void *)v14 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v14[v13], v8, a2);
  sub_2608AECEC((uint64_t)v11, (uint64_t)&unk_26A8C1228, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_2608AE1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_2608ABEA4;
  return static UrchinAnalytics.asyncSend<A>(event:)(a4, a5, a6);
}

uint64_t sub_2608AE2A0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2608AE364()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = v0
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2608AA698;
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  void *v6 = v5;
  v6[1] = sub_2608ABEA4;
  return static UrchinAnalytics.asyncSend<A>(event:)(v4, v2, v3);
}

uint64_t static UrchinAnalytics.asyncSend<A>(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[12] = a2;
  v3[13] = a3;
  v3[11] = a1;
  uint64_t v4 = *(void *)(a2 - 8);
  v3[14] = v4;
  v3[15] = *(void *)(v4 + 64);
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2608AE540, 0, 0);
}

uint64_t sub_2608AE540()
{
  *(void *)(v0 + 136) = sub_2608BF6B8();
  *(void *)(v0 + 144) = sub_2608BF6A8();
  uint64_t v2 = sub_2608BF698();
  return MEMORY[0x270FA2498](sub_2608AE5D8, v2, v1);
}

uint64_t sub_2608AE5D8()
{
  swift_release();
  if (qword_26A8C1050 != -1) {
    swift_once();
  }
  return MEMORY[0x270FA2498](sub_2608AE670, 0, 0);
}

uint64_t sub_2608AE670()
{
  *(void *)(v0 + 152) = sub_2608BF6A8();
  uint64_t v2 = sub_2608BF698();
  return MEMORY[0x270FA2498](sub_2608AE6FC, v2, v1);
}

uint64_t sub_2608AE6FC()
{
  swift_release();
  *(void *)(v0 + 160) = qword_26A8C1410;
  return MEMORY[0x270FA2498](sub_2608AE770, 0, 0);
}

uint64_t sub_2608AE770()
{
  *(void *)(v0 + 168) = sub_2608BF6A8();
  uint64_t v2 = sub_2608BF698();
  return MEMORY[0x270FA2498](sub_2608AE7FC, v2, v1);
}

uint64_t sub_2608AE7FC()
{
  uint64_t v1 = *(void *)(v0 + 160);
  swift_release();
  swift_getKeyPath();
  *(void *)(v0 + 64) = v1;
  sub_2608AF200();
  sub_2608BF4F8();
  swift_release();
  *(unsigned char *)(v0 + 176) = *(unsigned char *)(v1 + 16);
  return MEMORY[0x270FA2498](sub_2608AE8B4, 0, 0);
}

uint64_t sub_2608AE8B4()
{
  v34 = v0;
  if ((v0[22] & 0xFD) != 0)
  {
    if (qword_26A8C1070 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2608BF548();
    __swift_project_value_buffer(v1, (uint64_t)qword_26A8C35E8);
    uint64_t v2 = sub_2608BF528();
    os_log_type_t v3 = sub_2608BF718();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v5 = v0[13];
    if (v4)
    {
      uint64_t v6 = v0[12];
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v33 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
      uint64_t v10 = v9(v6, v5);
      v0[10] = sub_2608A9CC4(v10, v11, &v33);
      sub_2608BF778();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2608A5000, v2, v3, "Attempting to send CoreAnalytics event: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26121F190](v8, -1, -1);
      MEMORY[0x26121F190](v7, -1, -1);
    }
    else
    {

      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    }
    uint64_t v12 = v0[16];
    uint64_t v13 = v0[13];
    uint64_t v14 = v0[14];
    uint64_t v16 = v0[11];
    uint64_t v15 = v0[12];
    v32 = v9;
    v9(v15, v13);
    BOOL v17 = (void *)sub_2608BF5B8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v16, v15);
    unint64_t v18 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v15;
    *(void *)(v19 + 24) = v13;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v19 + v18, v12, v15);
    v0[6] = sub_2608AF2E0;
    v0[7] = v19;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_2608AF054;
    v0[5] = &block_descriptor;
    uint64_t v20 = _Block_copy(v0 + 2);
    swift_release();
    char v21 = AnalyticsSendEventLazy();
    _Block_release(v20);

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = sub_2608BF528();
      os_log_type_t v23 = sub_2608BF738();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = v0[12];
        uint64_t v25 = v0[13];
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v33 = v27;
        *(_DWORD *)uint64_t v26 = 136315138;
        uint64_t v28 = v32(v24, v25);
        v0[9] = sub_2608A9CC4(v28, v29, &v33);
        sub_2608BF778();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2608A5000, v22, v23, "Immediately failed to send CoreAnalytics event: %s. The event may not be enabled in the current config.", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26121F190](v27, -1, -1);
        MEMORY[0x26121F190](v26, -1, -1);
      }
    }
  }
  swift_task_dealloc();
  uint64_t v30 = (uint64_t (*)(void))v0[1];
  return v30();
}

uint64_t sub_2608AECEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2608BF6E8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2608BF6D8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2608AF5A4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2608BF698();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2608AEE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_26A8C1070 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2608BF548();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A8C35E8);
  uint64_t v6 = sub_2608BF528();
  os_log_type_t v7 = sub_2608BF718();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v13 = v9;
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    sub_2608A9CC4(v10, v11, &v13);
    sub_2608BF778();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2608A5000, v6, v7, "Successfully sent CoreAnalytics event: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26121F190](v9, -1, -1);
    MEMORY[0x26121F190](v8, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
}

id sub_2608AF054(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_2608AF544();
    BOOL v4 = (void *)sub_2608BF558();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t sub_2608AF0E0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2608AF200();
  sub_2608BF4F8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_2608AF158()
{
  return swift_release();
}

unint64_t sub_2608AF200()
{
  unint64_t result = qword_26A8C1238;
  if (!qword_26A8C1238)
  {
    type metadata accessor for ChinaWifiModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1238);
  }
  return result;
}

uint64_t sub_2608AF258()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2608AF2E0()
{
  return sub_2608AEE90(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)), *(void *)(v0 + 16), *(void *)(v0 + 24));
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

uint64_t sub_2608AF338(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2608AF414;
  return v6(a1);
}

uint64_t sub_2608AF414()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

ValueMetadata *type metadata accessor for UrchinAnalytics()
{
  return &type metadata for UrchinAnalytics;
}

uint64_t dispatch thunk of static UrchinAnalytics.UrchinAnalyticsEvent.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UrchinAnalytics.UrchinAnalyticsEvent.payload()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t sub_2608AF544()
{
  unint64_t result = qword_26A8C1240;
  if (!qword_26A8C1240)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A8C1240);
  }
  return result;
}

uint64_t sub_2608AF584()
{
  return sub_2608BBA48(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2608AF5A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1218);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2608AF604()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2608AF63C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2608AA698;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A8C1248 + dword_26A8C1248);
  return v6(a1, v4);
}

uint64_t DateInterval.simpleString.getter()
{
  uint64_t v0 = sub_2608BF3F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = 91;
  v6[1] = 0xE100000000000000;
  sub_2608BF2D8();
  sub_2608BF3E8();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_2608BF628();
  swift_bridgeObjectRelease();
  sub_2608BF628();
  sub_2608BF2B8();
  sub_2608BF3E8();
  v4(v3, v0);
  sub_2608BF628();
  swift_bridgeObjectRelease();
  sub_2608BF628();
  return v6[0];
}

uint64_t static DateInterval.createMidnightInterval(for:interval:timeZone:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v56 = a2;
  uint64_t v67 = a1;
  uint64_t v68 = a3;
  uint64_t v3 = sub_2608BF438();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  uint64_t v62 = v4;
  MEMORY[0x270FA5388](v3);
  v60 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_2608BF448();
  uint64_t v6 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2608BF428();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  uint64_t v52 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1258);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2608BF3F8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v54 = v16;
  uint64_t v55 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v66 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v65 = (char *)&v50 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v64 = (char *)&v50 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v53 = (char *)&v50 - v25;
  MEMORY[0x270FA5388](v24);
  v63 = (char *)&v50 - v26;
  uint64_t v27 = sub_2608BF4D8();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v50 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_2608BF498();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  v32 = (char *)&v50 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2608BF478();
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v30, v56, v27);
  sub_2608BF488();
  uint64_t v33 = *MEMORY[0x263F07780];
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v50 = v12;
  v34(v12, v33, v9);
  uint64_t v35 = v58;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07800], v58);
  uint64_t v37 = v61;
  uint64_t v36 = v62;
  uint64_t v38 = v60;
  (*(void (**)(char *, void, uint64_t))(v62 + 104))(v60, *MEMORY[0x263F077E0], v61);
  uint64_t v39 = v67;
  v40 = v8;
  unint64_t v56 = v32;
  uint64_t v41 = v54;
  sub_2608BF458();
  uint64_t v42 = v55;
  uint64_t v43 = v37;
  uint64_t v44 = v53;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v43);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v40, v35);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v50, v51);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 16);
  v45(v44, v39, v41);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v15, 1, v41) == 1)
  {
    uint64_t v46 = v63;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v63, v44, v41);
    sub_2608AFF04((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v41);
    uint64_t v46 = v63;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v63, v15, v41);
  }
  unint64_t v47 = v64;
  sub_2608BF3B8();
  v45(v65, (uint64_t)v46, v41);
  v45(v66, (uint64_t)v47, v41);
  sub_2608BF2C8();
  v48 = *(void (**)(char *, uint64_t))(v42 + 8);
  v48(v47, v41);
  v48(v46, v41);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v56, v59);
}

uint64_t sub_2608AFF04(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static DateInterval.createMidnightInterval(for:component:value:timeZone:)@<X0>(void (*a1)(void, void, void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v73 = a4;
  uint64_t v84 = a2;
  uint64_t v85 = a3;
  v76 = a1;
  uint64_t v86 = a5;
  uint64_t v75 = sub_2608BF438();
  uint64_t v71 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  v74 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_2608BF448();
  uint64_t v6 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2608BF428();
  uint64_t v66 = v9;
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v10 = v67;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1258);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  v83 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v65 = (char *)&v64 - v16;
  uint64_t v17 = sub_2608BF3F8();
  uint64_t v69 = *(void *)(v17 - 8);
  uint64_t v70 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v82 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v81 = (char *)&v64 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v79 = (char *)&v64 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v80 = (char *)&v64 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v88 = (char *)&v64 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v68 = (char *)&v64 - v29;
  MEMORY[0x270FA5388](v28);
  v87 = (char *)&v64 - v30;
  uint64_t v31 = sub_2608BF4D8();
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  v34 = (char *)&v64 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_2608BF498();
  uint64_t v77 = *(void *)(v35 - 8);
  uint64_t v78 = v35;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v64 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2608BF478();
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v34, v73, v31);
  sub_2608BF488();
  uint64_t v38 = *(void (**)(char *, void, uint64_t))(v10 + 104);
  uint64_t v39 = v12;
  v38(v12, *MEMORY[0x263F07780], v9);
  v40 = v8;
  uint64_t v41 = v72;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07800], v72);
  uint64_t v42 = v71;
  uint64_t v44 = v74;
  uint64_t v43 = v75;
  (*(void (**)(char *, void, uint64_t))(v71 + 104))(v74, *MEMORY[0x263F077E0], v75);
  uint64_t v45 = (char *)v76;
  uint64_t v46 = v39;
  sub_2608BF458();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v43);
  unint64_t v47 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v49 = v68;
  uint64_t v48 = v69;
  v47(v40, v41);
  v50 = v46;
  uint64_t v51 = v70;
  (*(void (**)(char *, uint64_t))(v67 + 8))(v50, v66);
  uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  uint64_t v53 = v45;
  uint64_t v54 = (uint64_t)v65;
  v52(v49, v53, v51);
  uint64_t v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  if (v55(v54, 1, v51) == 1)
  {
    unint64_t v56 = v87;
    v76 = *(void (**)(void, void, void))(v48 + 32);
    v76(v87, v49, v51);
    sub_2608AFF04(v54);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v51);
    unint64_t v56 = v87;
    v76 = *(void (**)(void, void, void))(v48 + 32);
    v76(v87, v54, v51);
  }
  uint64_t v57 = v88;
  v52(v88, v56, v51);
  uint64_t v58 = (uint64_t)v83;
  sub_2608BF468();
  uint64_t v59 = v79;
  v52(v79, v57, v51);
  if (v55(v58, 1, v51) == 1)
  {
    v60 = v80;
    v76(v80, v59, v51);
    sub_2608AFF04(v58);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v59, v51);
    v60 = v80;
    v76(v80, v58, v51);
  }
  uint64_t v61 = v88;
  v52(v81, v88, v51);
  v52(v82, v60, v51);
  sub_2608BF2C8();
  uint64_t v62 = *(void (**)(char *, uint64_t))(v48 + 8);
  v62(v60, v51);
  v62(v61, v51);
  v62(v87, v51);
  return (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v37, v78);
}

uint64_t DateInterval.clampedDate(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2608BF3F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2608BF2D8();
  sub_2608B0904();
  char v8 = sub_2608BF588();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  v9(v7, v4);
  if (v8) {
    return sub_2608BF2D8();
  }
  sub_2608BF2B8();
  char v11 = sub_2608BF588();
  v9(v7, v4);
  if (v11) {
    return sub_2608BF2B8();
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  }
}

unint64_t sub_2608B0904()
{
  unint64_t result = qword_26A8C1260;
  if (!qword_26A8C1260)
  {
    sub_2608BF3F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1260);
  }
  return result;
}

void sub_2608B095C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v1 = (void *)sub_2608BF5B8();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_26A8C1268 = (uint64_t)v0;
}

uint64_t Date.log.getter()
{
  if (qword_26A8C1028 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26A8C1268;
  uint64_t v1 = (void *)sub_2608BF3C8();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  uint64_t v3 = sub_2608BF5C8();
  return v3;
}

uint64_t Date.shortLog.getter()
{
  if (qword_26A8C1028 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26A8C1268;
  uint64_t v1 = (void *)sub_2608BF3C8();
  id v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  uint64_t v3 = sub_2608BF5C8();
  unint64_t v5 = v4;

  uint64_t v6 = sub_2608B0B74(6, v3, v5);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = MEMORY[0x26121E8C0](v6, v8, v10, v12);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_2608B0B74(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0]();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = sub_2608BF618();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }

  return MEMORY[0x270F9D8F0]();
}

uint64_t static String.urchinKit(localized:comment:)(uint64_t a1)
{
  uint64_t v2 = sub_2608BF418();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_2608BF5A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = (void *)sub_2608BF5B8();
  id v8 = objc_msgSend(self, sel_bundleWithIdentifier_, v7);

  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  sub_2608BF408();
  return sub_2608BF5E8();
}

double static Double.UK.oneDay.getter()
{
  return 86400.0;
}

double static Double.UK.oneMinute.getter()
{
  return 60.0;
}

double static Double.UK.fiveMinutes.getter()
{
  return 300.0;
}

double static Double.UK.tenMinutes.getter()
{
  return 600.0;
}

double static Double.UK.fifteenMinutes.getter()
{
  return 900.0;
}

double static Double.UK.thirtyMinutes.getter()
{
  return 1800.0;
}

double static Double.UK.oneHour.getter()
{
  return 3600.0;
}

double static Double.UK.threeHours.getter()
{
  return 10800.0;
}

double static Double.UK.sixHours.getter()
{
  return 21600.0;
}

double static Double.UK.twelveHours.getter()
{
  return 43200.0;
}

double static Double.UK.twentyFourHours.getter()
{
  return 86400.0;
}

double static Double.UK.twoDays.getter()
{
  return 172800.0;
}

double static Double.UK.sevenDays.getter()
{
  return 604800.0;
}

double static Double.UK.nineDays.getter()
{
  return 777600.0;
}

ValueMetadata *type metadata accessor for Double.UK()
{
  return &type metadata for Double.UK;
}

ValueMetadata *type metadata accessor for AuthCurrentLocationProvider()
{
  return &type metadata for AuthCurrentLocationProvider;
}

uint64_t sub_2608B0ED8()
{
  return MEMORY[0x270FA2498](sub_2608B0EF4, 0, 0);
}

uint64_t sub_2608B0EF4()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A60]), sel_init);
  id v2 = objc_msgSend(v1, sel_authorizationStatus);

  uint64_t v3 = *(uint64_t (**)(id))(v0 + 8);
  return v3(v2);
}

uint64_t sub_2608B0F80(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2608B0FA0, 0, 0);
}

uint64_t sub_2608B0FA0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A60]), sel_init);
  unsigned int v2 = objc_msgSend(v1, sel_authorizationStatus);

  if (v2 - 3 > 1)
  {
    uint64_t v3 = 1;
  }
  else
  {
    static CoastalLocation.dummyCurrentLocation()(*(uint64_t **)(v0 + 16));
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, v3, 1, v5);
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, unint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>, uint64_t a11)
{
  uint64_t v20 = (int *)type metadata accessor for CoastalLocation();
  uint64_t v21 = (void *)(a8 + v20[10]);
  uint64_t v37 = v20[11];
  *(void *)(a8 + v37) = 0;
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(double *)(a8 + 16) = a9;
  *(double *)(a8 + 24) = a10;
  uint64_t v22 = a8 + v20[7];
  uint64_t v23 = sub_2608BF4D8();
  uint64_t v24 = *(void *)(v23 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, a3, v23);
  *uint64_t v21 = a6;
  v21[1] = a7;
  if (a5)
  {
    uint64_t v25 = a4;
    uint64_t v26 = a4;
    unint64_t v27 = a5;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1210);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_2608C05F0;
    uint64_t v29 = MEMORY[0x263F8D538];
    uint64_t v30 = MEMORY[0x263F8D5B8];
    *(void *)(v28 + 56) = MEMORY[0x263F8D538];
    *(void *)(v28 + 64) = v30;
    *(double *)(v28 + 32) = a9;
    *(void *)(v28 + 96) = v29;
    *(void *)(v28 + 104) = v30;
    *(double *)(v28 + 72) = a10;
    sub_2608BF5D8();
    sub_2608BF628();
    swift_bridgeObjectRelease();
    uint64_t v26 = 979595116;
    unint64_t v27 = 0xE400000000000000;
    uint64_t v25 = a4;
  }
  uint64_t v31 = (uint64_t *)(a8 + v20[8]);
  *uint64_t v31 = v26;
  v31[1] = v27;
  uint64_t v32 = qword_26A8C1030;
  swift_bridgeObjectRetain();
  if (v32 == -1)
  {
    uint64_t v33 = a11;
    if (a5) {
      goto LABEL_6;
    }
LABEL_12:
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a3, v23);
    char v34 = 0;
    goto LABEL_13;
  }
  swift_once();
  uint64_t v33 = a11;
  if (!a5) {
    goto LABEL_12;
  }
LABEL_6:
  if (qword_26A8C1280 == v25 && *(void *)algn_26A8C1288 == a5) {
    char v34 = 1;
  }
  else {
    char v34 = sub_2608BF918();
  }
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a3, v23);
  swift_bridgeObjectRelease();
LABEL_13:
  *(unsigned char *)(a8 + v20[9]) = v34 & 1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a8 + v37) = v33;
  return result;
}

uint64_t sub_2608B1310(char a1, char a2)
{
  if (*(void *)&aSwell_2[8 * a1] == *(void *)&aSwell_2[8 * a2] && qword_2608C0C90[a1] == qword_2608C0C90[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_2608BF918();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2608B1398()
{
  return sub_2608BF958();
}

uint64_t sub_2608B1404()
{
  sub_2608BF608();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2608B1458()
{
  return sub_2608BF958();
}

uint64_t static CoastalLocation.dummyCurrentLocation()@<X0>(uint64_t *a1@<X8>)
{
  v29[0] = sub_2608BF4D8();
  uint64_t v2 = *(void *)(v29[0] - 8);
  MEMORY[0x270FA5388](v29[0]);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2608BF418();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_2608BF5A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v29 - v11;
  sub_2608BF598();
  uint64_t v13 = (void *)sub_2608BF5B8();
  id v14 = objc_msgSend(self, sel_bundleWithIdentifier_, v13);

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  sub_2608BF408();
  uint64_t v15 = sub_2608BF5E8();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  uint64_t v18 = *MEMORY[0x263F00B58];
  uint64_t v19 = *(void *)(MEMORY[0x263F00B58] + 8);
  sub_2608BF4C8();
  if (qword_26A8C1030 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_26A8C1280;
  uint64_t v21 = *(void *)algn_26A8C1288;
  uint64_t v22 = (int *)type metadata accessor for CoastalLocation();
  uint64_t v23 = v22[11];
  uint64_t v24 = (uint64_t *)((char *)a1 + v22[10]);
  *(uint64_t *)((char *)a1 + v23) = 0;
  *a1 = v15;
  a1[1] = v17;
  a1[2] = v18;
  a1[3] = v19;
  uint64_t v25 = v29[0];
  (*(void (**)(char *, char *, void))(v2 + 16))((char *)a1 + v22[7], v4, v29[0]);
  void *v24 = 0;
  v24[1] = 0;
  uint64_t v26 = (uint64_t *)((char *)a1 + v22[8]);
  *uint64_t v26 = v20;
  v26[1] = v21;
  unint64_t v27 = *(void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  v27(v4, v25);
  *((unsigned char *)a1 + v22[9]) = 1;
  uint64_t result = swift_bridgeObjectRelease();
  *(uint64_t *)((char *)a1 + v23) = 0;
  return result;
}

uint64_t CoastalLocation.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CoastalLocation.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*CoastalLocation.displayName.modify())()
{
  return nullsub_1;
}

uint64_t (*CoastalLocation.category.modify())()
{
  return nullsub_1;
}

double CoastalLocation.coordinate.getter()
{
  return *(double *)(v0 + 16);
}

void CoastalLocation.coordinate.setter(double a1, double a2)
{
  *(double *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
}

uint64_t (*CoastalLocation.coordinate.modify())()
{
  return nullsub_1;
}

uint64_t CoastalLocation.timezone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CoastalLocation() + 28);
  uint64_t v4 = sub_2608BF4D8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t CoastalLocation.timezone.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CoastalLocation() + 28);
  uint64_t v4 = sub_2608BF4D8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*CoastalLocation.timezone.modify())()
{
  return nullsub_1;
}

uint64_t CoastalLocation.id.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CoastalLocation() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CoastalLocation.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for CoastalLocation() + 32));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*CoastalLocation.id.modify())()
{
  return nullsub_1;
}

uint64_t CoastalLocation.isCurrent.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CoastalLocation() + 36));
}

uint64_t CoastalLocation.isCurrent.setter(char a1)
{
  uint64_t result = type metadata accessor for CoastalLocation();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*CoastalLocation.isCurrent.modify())()
{
  return nullsub_1;
}

uint64_t CoastalLocation.mapkitIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CoastalLocation() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CoastalLocation.mapkitIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for CoastalLocation() + 40));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*CoastalLocation.mapkitIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t CoastalLocation.locationOptions.getter()
{
  type metadata accessor for CoastalLocation();

  return swift_bridgeObjectRetain();
}

uint64_t CoastalLocation.locationOptions.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for CoastalLocation() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*CoastalLocation.locationOptions.modify())()
{
  return nullsub_1;
}

id CoastalLocation.cllocation.getter()
{
  double v1 = *(double *)(v0 + 16);
  double v2 = *(double *)(v0 + 24);
  id v3 = objc_allocWithZone(MEMORY[0x263F00A50]);

  return objc_msgSend(v3, sel_initWithLatitude_longitude_, v1, v2);
}

void sub_2608B1D90()
{
  qword_26A8C1280 = 0x746E6572727563;
  *(void *)algn_26A8C1288 = 0xE700000000000000;
}

uint64_t static CoastalLocation.currentLocationID.getter()
{
  if (qword_26A8C1030 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A8C1280;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t CoastalLocation.currentLocation()@<X0>(uint64_t a1@<X8>)
{
  sub_2608A9B48(v1, a1);
  uint64_t v3 = type metadata accessor for CoastalLocation();
  *(unsigned char *)(a1 + *(int *)(v3 + 36)) = 1;
  if (qword_26A8C1030 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_26A8C1280;
  uint64_t v4 = *(void *)algn_26A8C1288;
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(v3 + 32));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t *v6 = v5;
  v6[1] = v4;
  return result;
}

uint64_t CoastalLocation.with(id:mapkitIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v43 = a3;
  uint64_t v44 = a1;
  uint64_t v10 = (int *)type metadata accessor for CoastalLocation();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v16 = sub_2608BF4D8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = *v6;
  uint64_t v20 = v6[1];
  uint64_t v21 = v6[2];
  uint64_t v22 = v6[3];
  uint64_t v41 = v17;
  uint64_t v42 = v23;
  uint64_t v24 = *(void (**)(void))(v17 + 16);
  uint64_t v45 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v19;
  v40 = v24;
  v24();
  sub_2608A9B48((uint64_t)v6, (uint64_t)v15);
  if (a2)
  {
    uint64_t v25 = a2;
  }
  else
  {
    uint64_t v26 = &v15[v10[8]];
    uint64_t v25 = *((void *)v26 + 1);
    uint64_t v44 = *(void *)v26;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2608AB9A0((uint64_t)v15);
  sub_2608A9B48((uint64_t)v6, (uint64_t)v13);
  uint64_t v27 = a4;
  if (!a4)
  {
    uint64_t v28 = &v13[v10[10]];
    uint64_t v27 = *((void *)v28 + 1);
    uint64_t v43 = *(void *)v28;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_2608AB9A0((uint64_t)v13);
  uint64_t v29 = v10[11];
  uint64_t v30 = *(uint64_t *)((char *)v6 + v29);
  uint64_t v31 = (void *)((char *)a5 + v10[10]);
  *(void *)((char *)a5 + v29) = 0;
  *a5 = v39;
  a5[1] = v20;
  a5[2] = v21;
  a5[3] = v22;
  uint64_t v32 = v42;
  ((void (*)(char *, char *, uint64_t))v40)((char *)a5 + v10[7], v45, v42);
  *uint64_t v31 = v43;
  v31[1] = v27;
  uint64_t v33 = (void *)((char *)a5 + v10[8]);
  uint64_t v34 = v44;
  void *v33 = v44;
  v33[1] = v25;
  uint64_t v35 = qword_26A8C1030;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v35 != -1) {
    swift_once();
  }
  if (v34 == qword_26A8C1280 && v25 == *(void *)algn_26A8C1288) {
    char v36 = 1;
  }
  else {
    char v36 = sub_2608BF918();
  }
  (*(void (**)(char *, uint64_t))(v41 + 8))(v45, v32);
  swift_bridgeObjectRelease();
  *((unsigned char *)a5 + v10[9]) = v36 & 1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)((char *)a5 + v29) = v30;
  return result;
}

uint64_t CoastalLocation.staticLocation()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CoastalLocation();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)(v1 + *(int *)(v4 + 32));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  if (qword_26A8C1030 != -1) {
    swift_once();
  }
  BOOL v10 = v8 == qword_26A8C1280 && v9 == *(void *)algn_26A8C1288;
  if (v10 || (sub_2608BF918() & 1) != 0)
  {
    sub_2608A9B48(v1, (uint64_t)v6);
    uint64_t v20 = 979595116;
    unint64_t v21 = 0xE400000000000000;
    uint64_t v12 = *(void *)(v1 + 16);
    uint64_t v11 = *(void *)(v1 + 24);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1210);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_2608C05F0;
    uint64_t v14 = MEMORY[0x263F8D538];
    uint64_t v15 = MEMORY[0x263F8D5B8];
    *(void *)(v13 + 56) = MEMORY[0x263F8D538];
    *(void *)(v13 + 64) = v15;
    *(void *)(v13 + 32) = v12;
    *(void *)(v13 + 96) = v14;
    *(void *)(v13 + 104) = v15;
    *(void *)(v13 + 72) = v11;
    sub_2608BF5D8();
    sub_2608BF628();
    swift_bridgeObjectRelease();
    uint64_t v16 = v20;
    unint64_t v17 = v21;
    uint64_t v18 = &v6[*(int *)(v3 + 32)];
    swift_bridgeObjectRelease();
    *(void *)uint64_t v18 = v16;
    *((void *)v18 + 1) = v17;
    v6[*(int *)(v3 + 36)] = 0;
    return sub_2608B23FC((uint64_t)v6, a1);
  }
  else
  {
    return sub_2608A9B48(v1, a1);
  }
}

uint64_t type metadata accessor for CoastalLocation()
{
  uint64_t result = qword_26A8C1360;
  if (!qword_26A8C1360) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2608B23FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static CoastalLocation.makeCurrentLocation(displayName:category:coordinate:timezone:mapkitIdentifier:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v43 = a4;
  uint64_t v44 = a5;
  uint64_t v42 = a3;
  id v45 = a1;
  uint64_t v12 = sub_2608BF4D8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2608BF418();
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v17 = sub_2608BF5A8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v39 - v22;
  if (a2)
  {
    uint64_t v41 = a2;
  }
  else
  {
    uint64_t v40 = 0;
    sub_2608BF598();
    uint64_t v24 = (void *)sub_2608BF5B8();
    id v45 = objc_msgSend(self, sel_bundleWithIdentifier_, v24);

    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
    sub_2608BF408();
    id v45 = (id)sub_2608BF5E8();
    uint64_t v41 = v25;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  }
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v26(v15, v42, v12);
  uint64_t v27 = qword_26A8C1030;
  swift_bridgeObjectRetain();
  uint64_t v42 = v12;
  uint64_t v28 = v15;
  if (v27 != -1) {
    swift_once();
  }
  uint64_t v29 = *(void *)algn_26A8C1288;
  uint64_t v40 = qword_26A8C1280;
  uint64_t v30 = (int *)type metadata accessor for CoastalLocation();
  uint64_t v31 = v30[11];
  uint64_t v32 = (void *)(a6 + v30[10]);
  *(void *)(a6 + v31) = 0;
  uint64_t v33 = v41;
  uint64_t v34 = v42;
  *(void *)a6 = v45;
  *(void *)(a6 + 8) = v33;
  *(double *)(a6 + 16) = a7;
  *(double *)(a6 + 24) = a8;
  v26((char *)(a6 + v30[7]), (uint64_t)v28, v34);
  uint64_t v35 = v44;
  void *v32 = v43;
  v32[1] = v35;
  char v36 = (uint64_t *)(a6 + v30[8]);
  uint64_t *v36 = v40;
  v36[1] = v29;
  uint64_t v37 = *(void (**)(char *, uint64_t))(v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37(v28, v34);
  *(unsigned char *)(a6 + v30[9]) = 1;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a6 + v31) = 0;
  return result;
}

uint64_t CoastalLocation.hash(into:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_2608BF608();
  swift_bridgeObjectRelease();
  sub_2608BF608();
  sub_2608BF758();
  uint64_t v3 = type metadata accessor for CoastalLocation();
  sub_2608BF4D8();
  sub_2608B4F4C(&qword_26A8C12C8, MEMORY[0x263F079C8]);
  sub_2608BF568();
  swift_bridgeObjectRetain();
  sub_2608BF608();
  swift_bridgeObjectRelease();
  sub_2608BF948();
  if (*(void *)(v1 + *(int *)(v3 + 40) + 8))
  {
    sub_2608BF948();
    swift_bridgeObjectRetain();
    sub_2608BF608();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2608BF948();
  }
  uint64_t v4 = *(void *)(v1 + *(int *)(v3 + 44));
  if (!v4) {
    return sub_2608BF948();
  }
  sub_2608BF948();
  swift_bridgeObjectRetain();
  sub_2608B48C4(a1, v4);

  return swift_bridgeObjectRelease();
}

unint64_t sub_2608B2A00(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x79726F6765746163;
      break;
    case 2:
      unint64_t result = 0x616E6964726F6F63;
      break;
    case 3:
      unint64_t result = 0x656E6F7A656D6974;
      break;
    case 4:
      unint64_t result = 25705;
      break;
    case 5:
      unint64_t result = 0x6E65727275437369;
      break;
    case 6:
      return result;
    case 7:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    default:
      unint64_t result = 0x4E79616C70736964;
      break;
  }
  return result;
}

BOOL sub_2608B2B18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2608B2B2C()
{
  return sub_2608BF958();
}

uint64_t sub_2608B2B74()
{
  return sub_2608BF938();
}

uint64_t sub_2608B2BA0()
{
  return sub_2608BF958();
}

unint64_t sub_2608B2BE4()
{
  return sub_2608B2A00(*v0);
}

uint64_t sub_2608B2BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2608B5CA4(a1, a2);
  *a3 = result;
  return result;
}

void sub_2608B2C14(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_2608B2C20(uint64_t a1)
{
  unint64_t v2 = sub_2608B4C98();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2608B2C5C(uint64_t a1)
{
  unint64_t v2 = sub_2608B4C98();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CoastalLocation.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C12D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608B4C98();
  sub_2608BF978();
  LOBYTE(v13) = 0;
  sub_2608BF8D8();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_2608B4CEC();
    sub_2608BF8F8();
    long long v13 = *(_OWORD *)(v3 + 16);
    char v12 = 2;
    type metadata accessor for CLLocationCoordinate2D();
    sub_2608B4F4C(&qword_26A8C12E8, (void (*)(uint64_t))type metadata accessor for CLLocationCoordinate2D);
    sub_2608BF8F8();
    uint64_t v9 = type metadata accessor for CoastalLocation();
    LOBYTE(v13) = 3;
    sub_2608BF4D8();
    sub_2608B4F4C(&qword_26A8C12F0, MEMORY[0x263F079C8]);
    sub_2608BF8F8();
    LOBYTE(v13) = 4;
    sub_2608BF8D8();
    LOBYTE(v13) = 5;
    sub_2608BF8E8();
    LOBYTE(v13) = 6;
    sub_2608BF8B8();
    *(void *)&long long v13 = *(void *)(v3 + *(int *)(v9 + 44));
    char v12 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C12F8);
    sub_2608B4DE8(&qword_26A8C1300, (void (*)(void))sub_2608B4D40);
    sub_2608BF8C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t CoastalLocation.hashValue.getter()
{
  sub_2608BF928();
  CoastalLocation.hash(into:)((uint64_t)v1);
  return sub_2608BF958();
}

uint64_t CoastalLocation.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v4 = sub_2608BF4D8();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1310);
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v10 = (int *)type metadata accessor for CoastalLocation();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  long long v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = &v13[*(int *)(v11 + 40)];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v32 = v14;
  uint64_t v33 = *(int *)(v11 + 44);
  uint64_t v34 = a1;
  uint64_t v15 = v13;
  *(void *)&v13[v33] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608B4C98();
  uint64_t v31 = v9;
  sub_2608BF968();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = v29;
    LOBYTE(v35) = 0;
    uint64_t v17 = (uint64_t)v15;
    *(void *)uint64_t v15 = sub_2608BF868();
    *((void *)v15 + 1) = v18;
    LOBYTE(v35) = 1;
    sub_2608B4D94();
    sub_2608BF888();
    type metadata accessor for CLLocationCoordinate2D();
    char v36 = 2;
    sub_2608B4F4C(&qword_26A8C1320, (void (*)(uint64_t))type metadata accessor for CLLocationCoordinate2D);
    sub_2608BF888();
    *((_OWORD *)v15 + 1) = v35;
    LOBYTE(v35) = 3;
    sub_2608B4F4C(&qword_26A8C1328, MEMORY[0x263F079C8]);
    sub_2608BF888();
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v15[v10[7]], v6, v4);
    LOBYTE(v35) = 4;
    uint64_t v19 = sub_2608BF868();
    uint64_t v20 = (uint64_t *)v32;
    unint64_t v21 = (uint64_t *)&v15[v10[8]];
    *unint64_t v21 = v19;
    v21[1] = v22;
    LOBYTE(v35) = 5;
    v15[v10[9]] = sub_2608BF878() & 1;
    LOBYTE(v35) = 6;
    *uint64_t v20 = sub_2608BF848();
    v20[1] = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C12F8);
    char v36 = 7;
    sub_2608B4DE8(&qword_26A8C1330, (void (*)(void))sub_2608B4E58);
    sub_2608BF858();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v31, v30);
    uint64_t v24 = v35;
    uint64_t v25 = v33;
    swift_bridgeObjectRelease();
    *(void *)(v17 + v25) = v24;
    sub_2608A9B48(v17, v27);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    return sub_2608AB9A0(v17);
  }
}

uint64_t sub_2608B35DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CoastalLocation.init(from:)(a1, a2);
}

uint64_t sub_2608B35F4(void *a1)
{
  return CoastalLocation.encode(to:)(a1);
}

uint64_t sub_2608B3610()
{
  sub_2608BF928();
  CoastalLocation.hash(into:)((uint64_t)v1);
  return sub_2608BF958();
}

uint64_t sub_2608B3654()
{
  sub_2608BF928();
  CoastalLocation.hash(into:)((uint64_t)v1);
  return sub_2608BF958();
}

uint64_t sub_2608B3690@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(v2 + *(int *)(a1 + 32));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t CoastalLocation.CategoryType.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2608BF818();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t CoastalLocation.CategoryType.rawValue.getter()
{
  return 0x6863616562;
}

uint64_t sub_2608B3720@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2608BF818();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2608B3774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CoastalLocation.CategoryType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2608B379C()
{
  return sub_2608BF678();
}

uint64_t sub_2608B37FC()
{
  return sub_2608BF658();
}

uint64_t CoastalLocation.LocationOption.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

uint64_t CoastalLocation.LocationOption.rawValue.getter()
{
  return 0;
}

void *sub_2608B3864@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_2608B3878(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2608B3880()
{
  return sub_2608BF688();
}

uint64_t sub_2608B38E0()
{
  return sub_2608BF668();
}

uint64_t sub_2608B3930()
{
  uint64_t v0 = (int *)type metadata accessor for CoastalLocation();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2608BF4D8();
  uint64_t v3 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2608BF418();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_2608BF5A8();
  MEMORY[0x270FA5388](v7 - 8);
  __swift_allocate_value_buffer((uint64_t)v0, qword_26A8C1290);
  uint64_t v20 = __swift_project_value_buffer((uint64_t)v0, (uint64_t)qword_26A8C1290);
  sub_2608BF598();
  sub_2608BF408();
  uint64_t v8 = sub_2608BF5E8();
  uint64_t v10 = v9;
  sub_2608BF4C8();
  if (qword_26A8C1030 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_26A8C1280;
  uint64_t v11 = *(void *)algn_26A8C1288;
  uint64_t v13 = v0[11];
  uint64_t v14 = &v2[v0[10]];
  *(void *)&v2[v13] = 0;
  *(void *)uint64_t v2 = v8;
  *((void *)v2 + 1) = v10;
  *((_OWORD *)v2 + 1) = xmmword_2608C06C0;
  uint64_t v15 = v21;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(&v2[v0[7]], v5, v21);
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v16 = (uint64_t *)&v2[v0[8]];
  uint64_t *v16 = v12;
  v16[1] = v11;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  swift_bridgeObjectRetain_n();
  v17(v5, v15);
  swift_bridgeObjectRelease();
  v2[v0[9]] = 1;
  swift_bridgeObjectRelease();
  *(void *)&v2[v13] = 0;
  return sub_2608B23FC((uint64_t)v2, v20);
}

uint64_t static CoastalLocation.demoCurrentLocation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2608B3E44(&qword_26A8C1038, (uint64_t)qword_26A8C1290, a1);
}

uint64_t sub_2608B3C48()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2608BF4D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v7, qword_26A8C12A8);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26A8C12A8);
  sub_2608BF4A8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0x42207265646C6957, 0xEC00000068636165, (uint64_t)v6, 0, 0, 0, 0, v8, 36.953433, -122.078222, 0);
}

uint64_t static CoastalLocation.testLocation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2608B3E44(&qword_26A8C1040, (uint64_t)qword_26A8C12A8, a1);
}

uint64_t sub_2608B3E44@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for CoastalLocation();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);

  return sub_2608A9B48(v6, a3);
}

uint64_t sub_2608B3EA4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C11C0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v75 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v73 = (char *)&v63 - v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v70 = (char *)&v63 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v68 = (char *)&v63 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v66 = (char *)&v63 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v64 = (char *)&v63 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v63 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v63 - v16;
  uint64_t v18 = sub_2608BF4D8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v74 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v72 = (char *)&v63 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v69 = (char *)&v63 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v67 = (char *)&v63 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v65 = (char *)&v63 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v63 = (char *)&v63 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v63 - v33;
  MEMORY[0x270FA5388](v32);
  char v36 = (char *)&v63 - v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C10A0);
  uint64_t v37 = *(void *)(type metadata accessor for CoastalLocation() - 8);
  unint64_t v38 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v76 = *(void *)(v37 + 72);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_2608C06D0;
  uint64_t v71 = v39;
  uint64_t v40 = v39 + v38;
  sub_2608BF4A8();
  uint64_t v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  if (v41(v17, 1, v18) == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4((uint64_t)v17);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v36, v17, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0x42207265646C6957, 0xEC00000068636165, (uint64_t)v36, 0, 0, 0, 0, v40, 36.953433, -122.078222, 0);
  sub_2608BF4A8();
  if (v41(v15, 1, v18) == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4((uint64_t)v15);
    uint64_t v42 = v19;
  }
  else
  {
    uint64_t v42 = v19;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v34, v15, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0xD000000000000015, 0x80000002608C1A20, (uint64_t)v34, 0, 0, 0, 0, v40 + v76, 36.9633317, -122.007964, 0);
  uint64_t v43 = (uint64_t)v64;
  sub_2608BF4A8();
  uint64_t v44 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v41;
  unsigned int v45 = v41((char *)v43, 1, v18);
  uint64_t v46 = (uint64_t)v66;
  uint64_t v47 = (uint64_t)v63;
  if (v45 == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4(v43);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v63, v43, v18);
  }
  uint64_t v48 = (uint64_t)v70;
  uint64_t v49 = v76;
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0x1000000000000010, 0x80000002608C1A40, v47, 0, 0, 0, 0, v40 + 2 * v76, 36.9616202, -122.024417, 0);
  sub_2608BF4A8();
  uint64_t v50 = v42;
  if (v44(v46, 1, v18) == 1)
  {
    uint64_t v51 = (uint64_t)v65;
    sub_2608BF4B8();
    sub_2608ACEA4(v46);
  }
  else
  {
    uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 32);
    uint64_t v51 = (uint64_t)v65;
    v52(v65, v46, v18);
  }
  uint64_t v53 = (uint64_t)v68;
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0x616C6F7469706143, 0xEE00686361654220, v51, 0, 0, 0, 0, v40 + 3 * v49, 36.9714611, -121.951182, 0);
  sub_2608BF4A8();
  if (v44(v53, 1, v18) == 1)
  {
    uint64_t v54 = (uint64_t)v67;
    sub_2608BF4B8();
    sub_2608ACEA4(v53);
    uint64_t v55 = v50;
  }
  else
  {
    uint64_t v55 = v50;
    uint64_t v54 = (uint64_t)v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v67, v53, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0xD000000000000016, 0x80000002608C1A60, v54, 0, 0, 0, 0, v40 + 4 * v49, 36.9621603, -121.998786, 0);
  sub_2608BF4A8();
  unsigned int v56 = v44(v48, 1, v18);
  uint64_t v57 = (uint64_t)v72;
  uint64_t v58 = (uint64_t)v69;
  if (v56 == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4(v48);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v69, v48, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0xD000000000000014, 0x80000002608C1A80, v58, 0, 0, 0, 0, v40 + 5 * v49, 36.9718383, -121.91376, 0);
  uint64_t v59 = (uint64_t)v73;
  sub_2608BF4A8();
  if (v44(v59, 1, v18) == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4(v59);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 32))(v57, v59, v18);
  }
  uint64_t v60 = (uint64_t)v74;
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0xD000000000000010, 0x80000002608C1AA0, v57, 0, 0, 0, 0, v40 + 6 * v49, 36.96054, -121.989479, 0);
  uint64_t v61 = (uint64_t)v75;
  sub_2608BF4A8();
  if (v44(v61, 1, v18) == 1)
  {
    sub_2608BF4B8();
    sub_2608ACEA4(v61);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 32))(v60, v61, v18);
  }
  uint64_t result = CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:locationOptions:)(0x6B6F6F4820656854, 0xE800000000000000, v60, 0, 0, 0, 0, v40 - v49 + 8 * v49, 36.9595787, -121.965127, 0);
  qword_26A8C12C0 = v71;
  return result;
}

uint64_t static CoastalLocation.testLocations.getter()
{
  if (qword_26A8C1048 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_2608B48C4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2608BF958();
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v7 = a2 + 56;
  uint64_t v6 = v8;
  uint64_t v9 = 1 << *(unsigned char *)(v7 - 24);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  uint64_t v11 = v10 & v6;
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (!v11)
    {
      if (__OFADD__(v5++, 1)) {
        goto LABEL_18;
      }
      if (v5 >= v12) {
        return sub_2608BF938();
      }
      uint64_t v11 = *(void *)(v7 + 8 * v5);
      if (!v11) {
        break;
      }
    }
LABEL_5:
    v11 &= v11 - 1;
    sub_2608BF928();
    sub_2608BF938();
    uint64_t result = sub_2608BF958();
    v4 ^= result;
  }
  int64_t v14 = v5 + 1;
  if (v5 + 1 >= v12) {
    return sub_2608BF938();
  }
  uint64_t v11 = *(void *)(v7 + 8 * v14);
  if (v11)
  {
    ++v5;
    goto LABEL_5;
  }
  while (1)
  {
    int64_t v5 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v5 >= v12) {
      return sub_2608BF938();
    }
    uint64_t v11 = *(void *)(v7 + 8 * v5);
    ++v14;
    if (v11) {
      goto LABEL_5;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t _s9UrchinKit15CoastalLocationV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for CoastalLocation();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (double *)((char *)&v33 - v12);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (double *)((char *)&v33 - v15);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (double *)((char *)&v33 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (double *)((char *)&v33 - v20);
  if ((*a1 != *a2 || a1[1] != a2[1]) && (sub_2608BF918() & 1) == 0)
  {
    sub_2608A9B48((uint64_t)a1, (uint64_t)v21);
    sub_2608A9B48((uint64_t)a2, (uint64_t)v19);
    sub_2608AB9A0((uint64_t)v19);
    sub_2608AB9A0((uint64_t)v21);
    sub_2608A9B48((uint64_t)a1, (uint64_t)v16);
    sub_2608A9B48((uint64_t)a2, (uint64_t)v13);
    goto LABEL_12;
  }
  sub_2608A9B48((uint64_t)a1, (uint64_t)v21);
  sub_2608A9B48((uint64_t)a2, (uint64_t)v19);
  double v22 = v21[2];
  sub_2608AB9A0((uint64_t)v21);
  double v23 = v19[2];
  sub_2608AB9A0((uint64_t)v19);
  sub_2608A9B48((uint64_t)a1, (uint64_t)v16);
  sub_2608A9B48((uint64_t)a2, (uint64_t)v13);
  if (v22 != v23)
  {
LABEL_12:
    sub_2608AB9A0((uint64_t)v13);
    sub_2608AB9A0((uint64_t)v16);
    sub_2608A9B48((uint64_t)a1, (uint64_t)v10);
    sub_2608A9B48((uint64_t)a2, (uint64_t)v7);
    goto LABEL_13;
  }
  double v24 = v16[3];
  sub_2608AB9A0((uint64_t)v16);
  double v25 = v13[3];
  sub_2608AB9A0((uint64_t)v13);
  sub_2608A9B48((uint64_t)a1, (uint64_t)v10);
  sub_2608A9B48((uint64_t)a2, (uint64_t)v7);
  if (v24 != v25)
  {
LABEL_13:
    char v31 = 0;
    goto LABEL_14;
  }
  uint64_t v26 = *(int *)(v4 + 32);
  uint64_t v27 = *(void *)&v10[v26];
  uint64_t v28 = *(void *)&v10[v26 + 8];
  uint64_t v29 = &v7[v26];
  if (v27 == *(void *)v29 && v28 == *((void *)v29 + 1)) {
    char v31 = 1;
  }
  else {
    char v31 = sub_2608BF918();
  }
LABEL_14:
  sub_2608AB9A0((uint64_t)v10);
  sub_2608AB9A0((uint64_t)v7);
  return v31 & 1;
}

unint64_t sub_2608B4C98()
{
  unint64_t result = qword_26A8C12D8;
  if (!qword_26A8C12D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C12D8);
  }
  return result;
}

unint64_t sub_2608B4CEC()
{
  unint64_t result = qword_26A8C12E0;
  if (!qword_26A8C12E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C12E0);
  }
  return result;
}

unint64_t sub_2608B4D40()
{
  unint64_t result = qword_26A8C1308;
  if (!qword_26A8C1308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1308);
  }
  return result;
}

unint64_t sub_2608B4D94()
{
  unint64_t result = qword_26A8C1318;
  if (!qword_26A8C1318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1318);
  }
  return result;
}

uint64_t sub_2608B4DE8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A8C12F8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2608B4E58()
{
  unint64_t result = qword_26A8C1338;
  if (!qword_26A8C1338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1338);
  }
  return result;
}

uint64_t sub_2608B4EAC(uint64_t a1)
{
  uint64_t result = sub_2608B4F4C(&qword_26A8C1340, (void (*)(uint64_t))type metadata accessor for CoastalLocation);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2608B4F04()
{
  return sub_2608B4F4C(&qword_26A8C1348, (void (*)(uint64_t))type metadata accessor for CoastalLocation);
}

uint64_t sub_2608B4F4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2608B4F94()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_2608B4FA4()
{
  unint64_t result = qword_26A8C1350;
  if (!qword_26A8C1350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1350);
  }
  return result;
}

unint64_t sub_2608B4FFC()
{
  unint64_t result = qword_26A8C1358;
  if (!qword_26A8C1358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1358);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for CoastalLocation(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    uint64_t v8 = a3[7];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_2608BF4D8();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    uint64_t v14 = a3[9];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v18 = a3[10];
    uint64_t v19 = a3[11];
    uint64_t v20 = (void *)((char *)v4 + v18);
    uint64_t v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    *(void *)((char *)v4 + v19) = *(uint64_t *)((char *)a2 + v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for CoastalLocation(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_2608BF4D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CoastalLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2608BF4D8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v17 = a3[10];
  uint64_t v18 = a3[11];
  uint64_t v19 = (void *)(a1 + v17);
  uint64_t v20 = (void *)(a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CoastalLocation(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2608BF4D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  uint64_t v13 = a3[10];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for CoastalLocation(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2608BF4D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
  uint64_t v12 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  return a1;
}

uint64_t assignWithTake for CoastalLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2608BF4D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CoastalLocation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2608B5630);
}

uint64_t sub_2608B5630(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2608BF4D8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for CoastalLocation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2608B56F4);
}

uint64_t sub_2608B56F4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2608BF4D8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2608B579C()
{
  uint64_t result = sub_2608BF4D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CoastalLocation.CategoryType()
{
  return &type metadata for CoastalLocation.CategoryType;
}

unsigned char *_s9UrchinKit15CoastalLocationV12CategoryTypeOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2608B5920);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CoastalLocation.LocationOption()
{
  return &type metadata for CoastalLocation.LocationOption;
}

uint64_t getEnumTagSinglePayload for CoastalLocation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CoastalLocation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x2608B5AB4);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CoastalLocation.CodingKeys()
{
  return &type metadata for CoastalLocation.CodingKeys;
}

unint64_t sub_2608B5AF0()
{
  unint64_t result = qword_26A8C1370;
  if (!qword_26A8C1370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1370);
  }
  return result;
}

unint64_t sub_2608B5B48()
{
  unint64_t result = qword_26A8C1378;
  if (!qword_26A8C1378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1378);
  }
  return result;
}

unint64_t sub_2608B5BA0()
{
  unint64_t result = qword_26A8C1380;
  if (!qword_26A8C1380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1380);
  }
  return result;
}

uint64_t sub_2608B5BF4()
{
  return sub_2608BF958();
}

uint64_t sub_2608B5C44()
{
  return sub_2608BF608();
}

uint64_t sub_2608B5C58()
{
  return sub_2608BF958();
}

uint64_t sub_2608B5CA4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
  if (v3 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616E6964726F6F63 && a2 == 0xEA00000000006574 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656E6F7A656D6974 && a2 == 0xE800000000000000 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E65727275437369 && a2 == 0xE900000000000074 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002608C1A00 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6F697461636F6CLL && a2 == 0xEF736E6F6974704FLL)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_2608BF918();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

unint64_t sub_2608B5FD8()
{
  unint64_t result = qword_26A8C1388;
  if (!qword_26A8C1388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1388);
  }
  return result;
}

unint64_t sub_2608B602C()
{
  unint64_t result = qword_26A8C1390;
  if (!qword_26A8C1390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1390);
  }
  return result;
}

uint64_t SelectedLocationManager.__allocating_init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)(long long *a1, long long *a2, long long *a3)
{
  uint64_t v6 = swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v7 = OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_26A8C1060 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2608BF548();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A8C35B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6 + v7, v9, v8);
  sub_2608ABB24(a1, v6 + 112);
  sub_2608ABB24(a2, v6 + 152);
  sub_2608ABB24(a3, v6 + 192);
  return v6;
}

uint64_t SelectedLocationManager.init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)(long long *a1, long long *a2, long long *a3)
{
  swift_defaultActor_initialize();
  uint64_t v7 = OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_26A8C1060 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2608BF548();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A8C35B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v3 + v7, v9, v8);
  sub_2608ABB24(a1, v3 + 112);
  sub_2608ABB24(a2, v3 + 152);
  sub_2608ABB24(a3, v3 + 192);
  return v3;
}

void *SelectedLocationManager.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  unint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_26A8C1060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2608BF548();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C35B8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(v1, v3, v2);
  if (qword_26A8C0FF8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26A8C1000;
  v0[17] = &type metadata for AuthCurrentLocationProvider;
  v0[18] = &off_270CA9220;
  uint64_t v5 = type metadata accessor for SyncedPreferenceManager();
  v0[22] = v5;
  v0[23] = &protocol witness table for SyncedPreferenceManager;
  v0[19] = v4;
  v0[27] = v5;
  v0[28] = &protocol witness table for SyncedPreferenceManager;
  v0[24] = v4;
  swift_retain_n();
  return v0;
}

void *SelectedLocationManager.init()()
{
  swift_defaultActor_initialize();
  unint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_26A8C1060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2608BF548();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C35B8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(v1, v3, v2);
  if (qword_26A8C0FF8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26A8C1000;
  v0[17] = &type metadata for AuthCurrentLocationProvider;
  v0[18] = &off_270CA9220;
  uint64_t v5 = type metadata accessor for SyncedPreferenceManager();
  v0[22] = v5;
  v0[23] = &protocol witness table for SyncedPreferenceManager;
  v0[19] = v4;
  v0[27] = v5;
  v0[28] = &protocol witness table for SyncedPreferenceManager;
  v0[24] = v4;
  swift_retain_n();
  return v0;
}

uint64_t sub_2608B64F4()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_2608B6514, v0, 0);
}

uint64_t sub_2608B6514()
{
  sub_2608ABA58(v0[15] + 192, (uint64_t)(v0 + 2));
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2608B6628;
  return v5(v1, v2);
}

uint64_t sub_2608B6628(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[12] = v2;
  v4[13] = a1;
  v4[14] = a2;
  uint64_t v5 = v3[15];
  v4[17] = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B6744, v5, 0);
}

uint64_t sub_2608B6744()
{
  uint64_t v1 = v0[15];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  sub_2608ABA58(v1 + 112, (uint64_t)(v0 + 7));
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[18] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2608B6860;
  return v6(v2, v3);
}

uint64_t sub_2608B6860(int a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 120);
  *(_DWORD *)(*(void *)v1 + 160) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B6978, v2, 0);
}

uint64_t sub_2608B6978()
{
  uint64_t v1 = *(void *)(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 136);
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v4(v3, v2);
  }
  else
  {
    uint64_t v6 = sub_2608BF528();
    os_log_type_t v7 = sub_2608BF748();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2608A5000, v6, v7, "SelectedLocation is nil, determining default...", v8, 2u);
      MEMORY[0x26121F190](v8, -1, -1);
    }

    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_2608B6AE0;
    int v10 = *(_DWORD *)(v0 + 160);
    return sub_2608B9608(v10);
  }
}

uint64_t sub_2608B6AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_2608B6BE4(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = type metadata accessor for CoastalLocation();
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[36] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2608B6D9C;
  v4[15] = v1;
  return MEMORY[0x270FA2498](sub_2608B6514, v1, 0);
}

uint64_t sub_2608B6D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 168);
  *(void *)(v3 + 296) = a1;
  *(void *)(v3 + 304) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B6EB4, v4, 0);
}

uint64_t sub_2608B6EB4()
{
  if (qword_26A8C1030 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[21];
  uint64_t v2 = *(void *)algn_26A8C1288;
  v0[39] = qword_26A8C1280;
  v0[40] = v2;
  sub_2608ABA58(v1 + 112, (uint64_t)(v0 + 2));
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4 + 8) + **(int **)(v4 + 8));
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[41] = v5;
  void *v5 = v0;
  v5[1] = sub_2608B701C;
  return v7(v3, v4);
}

uint64_t sub_2608B701C(int a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 168);
  *(_DWORD *)(*(void *)v1 + 360) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B7134, v2, 0);
}

uint64_t sub_2608B7134()
{
  uint64_t v1 = *(void *)(v0 + 304);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (!v1)
  {
    uint64_t v5 = sub_2608BF528();
    os_log_type_t v6 = sub_2608BF748();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2608A5000, v5, v6, "SelectedLocationID is nil", v7, 2u);
      MEMORY[0x26121F190](v7, -1, -1);
    }

    int v2 = *(_DWORD *)(v0 + 360);
    goto LABEL_18;
  }
  int v2 = *(_DWORD *)(v0 + 360);
  if (*(void *)(v0 + 296) == *(void *)(v0 + 312) && *(void *)(v0 + 304) == *(void *)(v0 + 320))
  {
    if ((v2 - 3) < 2) {
      goto LABEL_15;
    }
LABEL_18:
    if (v2) {
      goto LABEL_19;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_2608BF528();
    os_log_type_t v18 = sub_2608BF748();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_2608A5000, v17, v18, "Prefer current location, but auth is not determined.", v19, 2u);
      MEMORY[0x26121F190](v19, -1, -1);
    }
    uint64_t v20 = *(void *)(v0 + 176);
    uint64_t v21 = *(void *)(v0 + 184);
    uint64_t v22 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56))(v22, 1, 1, v20);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
  if ((sub_2608BF918() & 1) == 0 || (v2 - 3) >= 2)
  {
    int v4 = *(_DWORD *)(v0 + 360);
    if ((sub_2608BF918() & 1) == 0 || v4)
    {
LABEL_19:
      sub_2608ABA58(*(void *)(v0 + 168) + 152, v0 + 56);
      uint64_t v14 = *(void *)(v0 + 80);
      uint64_t v15 = *(void *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v14);
      double v25 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v15 + 16) + **(int **)(v15 + 16));
      uint64_t v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 336) = v16;
      void *v16 = v0;
      v16[1] = sub_2608B75EC;
      return v25(v14, v15);
    }
    goto LABEL_22;
  }
LABEL_15:
  uint64_t v8 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2608ABA58(v8 + 112, v0 + 96);
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 128);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), v9);
  double v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 16) + **(int **)(v10 + 16));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_2608B8044;
  uint64_t v12 = *(void *)(v0 + 160);
  return v24(v12, v9, v10);
}

uint64_t sub_2608B75EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 168);
  *(void *)(*(void *)v1 + 344) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B7704, v2, 0);
}

uint64_t sub_2608B7704()
{
  v98 = v0;
  uint64_t v1 = v0[38];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  if (v1)
  {
    if (v0[37] == v0[39] && v0[38] == v0[40])
    {
      swift_bridgeObjectRelease();
LABEL_20:
      swift_bridgeObjectRelease();
      uint64_t v19 = v0[43];
      if (*(void *)(v19 + 16))
      {
        uint64_t v20 = *(unsigned __int8 *)(v0[23] + 80);
        sub_2608A9B48(v19 + ((v20 + 32) & ~v20), v0[30]);
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v21 = 1;
      }
      uint64_t v23 = v0[29];
      uint64_t v22 = v0[30];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[23] + 56))(v22, v21, 1, v0[22]);
      swift_bridgeObjectRelease();
      sub_2608BA9A0(v22, v23);
      double v24 = sub_2608BF528();
      os_log_type_t v25 = sub_2608BF748();
      BOOL v26 = os_log_type_enabled(v24, v25);
      uint64_t v27 = v0[29];
      if (v26)
      {
        uint64_t v28 = v0[28];
        uint64_t v29 = v0[22];
        uint64_t v30 = v0[23];
        char v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        uint64_t v97 = v32;
        *(_DWORD *)char v31 = 136315138;
        sub_2608BA9A0(v27, v28);
        int v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29);
        uint64_t v34 = v0[28];
        if (v33 == 1)
        {
          uint64_t v35 = 7104878;
          sub_2608BAA08(v0[28]);
          unint64_t v36 = 0xE300000000000000;
        }
        else
        {
          uint64_t v64 = (uint64_t *)(v34 + *(int *)(v0[22] + 32));
          uint64_t v35 = *v64;
          unint64_t v36 = v64[1];
          swift_bridgeObjectRetain();
          sub_2608AB9A0(v34);
        }
        uint64_t v65 = v0[29];
        v0[19] = sub_2608A9CC4(v35, v36, &v97);
        sub_2608BF778();
        swift_bridgeObjectRelease();
        sub_2608BAA08(v65);
        _os_log_impl(&dword_2608A5000, v24, v25, "Prefer selected current location, but we don't have a current location, falling back to first static location: %s.", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x26121F190](v32, -1, -1);
        MEMORY[0x26121F190](v31, -1, -1);
      }
      else
      {

        sub_2608BAA08(v27);
      }
      sub_2608BAA68(v0[30], v0[20]);
      goto LABEL_51;
    }
    char v3 = sub_2608BF918();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_20;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = v0[43];
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v7 = v0[22];
    uint64_t v6 = v0[23];
    uint64_t v8 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v9 = *(void *)(v6 + 72);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v10 = v0[38];
      uint64_t v11 = v0[26];
      sub_2608A9B48(v8, v11);
      if (v10)
      {
        uint64_t v12 = (void *)(v11 + *(int *)(v7 + 32));
        BOOL v13 = *v12 == v0[37] && v0[38] == v12[1];
        if (v13 || (sub_2608BF918() & 1) != 0)
        {
          uint64_t v14 = v0[35];
          uint64_t v15 = v0[26];
          uint64_t v16 = v0[22];
          uint64_t v17 = v0[23];
          swift_bridgeObjectRelease();
          sub_2608B23FC(v15, v14);
          os_log_type_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
          v18(v14, 0, 1, v16);
          goto LABEL_29;
        }
      }
      sub_2608AB9A0(v0[26]);
      v8 += v9;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  os_log_type_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[23] + 56);
  v18(v0[35], 1, 1, v0[22]);
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v37 = v0[34];
  uint64_t v38 = v0[22];
  uint64_t v39 = v0[23];
  sub_2608BA9A0(v0[35], v37);
  uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
  if (v40(v37, 1, v38) == 1)
  {
    uint64_t v41 = v0[35];
    uint64_t v42 = v0[33];
    sub_2608BAA08(v0[34]);
    sub_2608BA9A0(v41, v42);
    uint64_t v43 = sub_2608BF528();
    os_log_type_t v44 = sub_2608BF748();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v46 = v0[33];
    if (v45)
    {
      os_log_type_t v94 = v44;
      v95 = v18;
      uint64_t v47 = v0[32];
      uint64_t v48 = v0[22];
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v97 = v50;
      *(_DWORD *)uint64_t v49 = 136315138;
      sub_2608BA9A0(v46, v47);
      int v51 = v40(v47, 1, v48);
      uint64_t v52 = v0[32];
      if (v51 == 1)
      {
        uint64_t v53 = 7104878;
        sub_2608BAA08(v0[32]);
        unint64_t v54 = 0xE300000000000000;
      }
      else
      {
        uint64_t v66 = (uint64_t *)(v52 + *(int *)(v0[22] + 32));
        uint64_t v53 = *v66;
        unint64_t v54 = v66[1];
        swift_bridgeObjectRetain();
        sub_2608AB9A0(v52);
      }
      uint64_t v67 = v0[33];
      v0[18] = sub_2608A9CC4(v53, v54, &v97);
      sub_2608BF778();
      swift_bridgeObjectRelease();
      sub_2608BAA08(v67);
      _os_log_impl(&dword_2608A5000, v43, v94, "Could not find selected locationID: %s in location list.", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26121F190](v50, -1, -1);
      MEMORY[0x26121F190](v49, -1, -1);

      os_log_type_t v18 = v95;
      if (!*(void *)(v4 + 16)) {
        goto LABEL_41;
      }
    }
    else
    {

      sub_2608BAA08(v46);
      if (!*(void *)(v4 + 16))
      {
LABEL_41:
        uint64_t v63 = 1;
LABEL_42:
        uint64_t v68 = v0[31];
        uint64_t v69 = v0[22];
        v18(v68, v63, 1, v69);
        swift_bridgeObjectRelease();
        int v70 = v40(v68, 1, v69);
        uint64_t v71 = v0[31];
        if (v70 == 1)
        {
          sub_2608BAA08(v71);
          uint64_t v72 = sub_2608BF528();
          os_log_type_t v73 = sub_2608BF738();
          if (os_log_type_enabled(v72, v73))
          {
            v74 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v74 = 0;
            _os_log_impl(&dword_2608A5000, v72, v73, "Tried to default to first static location but could not find any, returning nil.", v74, 2u);
            MEMORY[0x26121F190](v74, -1, -1);
          }
          uint64_t v75 = v0[35];
          uint64_t v76 = v0[22];
          uint64_t v77 = v0[20];

          sub_2608BAA08(v75);
          uint64_t v59 = v77;
          uint64_t v60 = 1;
          uint64_t v61 = v76;
        }
        else
        {
          uint64_t v78 = v0[24];
          uint64_t v79 = v0[25];
          sub_2608B23FC(v71, v79);
          sub_2608A9B48(v79, v78);
          v80 = sub_2608BF528();
          os_log_type_t v81 = sub_2608BF748();
          BOOL v82 = os_log_type_enabled(v80, v81);
          uint64_t v83 = v0[35];
          uint64_t v84 = v0[24];
          if (v82)
          {
            uint64_t v96 = v0[35];
            uint64_t v85 = (uint8_t *)swift_slowAlloc();
            uint64_t v86 = swift_slowAlloc();
            uint64_t v97 = v86;
            *(_DWORD *)uint64_t v85 = 136315138;
            uint64_t v87 = CLLocationCoordinate2D.description.getter();
            v0[17] = sub_2608A9CC4(v87, v88, &v97);
            sub_2608BF778();
            swift_bridgeObjectRelease();
            sub_2608AB9A0(v84);
            _os_log_impl(&dword_2608A5000, v80, v81, "Defaulting to first static location: %s", v85, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x26121F190](v86, -1, -1);
            MEMORY[0x26121F190](v85, -1, -1);

            uint64_t v89 = v96;
          }
          else
          {
            sub_2608AB9A0(v0[24]);

            uint64_t v89 = v83;
          }
          sub_2608BAA08(v89);
          uint64_t v90 = v0[22];
          uint64_t v91 = v0[20];
          sub_2608B23FC(v0[25], v91);
          uint64_t v59 = v91;
          uint64_t v60 = 0;
          uint64_t v61 = v90;
        }
        goto LABEL_50;
      }
    }
    uint64_t v62 = *(unsigned __int8 *)(v0[23] + 80);
    sub_2608A9B48(v0[43] + ((v62 + 32) & ~v62), v0[31]);
    uint64_t v63 = 0;
    goto LABEL_42;
  }
  uint64_t v55 = v0[34];
  uint64_t v56 = v0[27];
  uint64_t v57 = v0[22];
  uint64_t v58 = v0[20];
  sub_2608BAA08(v0[35]);
  swift_bridgeObjectRelease();
  sub_2608B23FC(v55, v56);
  sub_2608B23FC(v56, v58);
  uint64_t v59 = v58;
  uint64_t v60 = 0;
  uint64_t v61 = v57;
LABEL_50:
  v18(v59, v60, 1, v61);
LABEL_51:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v92 = (uint64_t (*)(void))v0[1];
  return v92();
}

uint64_t sub_2608B8044()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B8154, v1, 0);
}

uint64_t sub_2608B8154()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_2608B8250(uint64_t a1, uint64_t a2)
{
  v3[24] = a2;
  v3[25] = v2;
  v3[23] = a1;
  uint64_t v4 = type metadata accessor for CoastalLocation();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  v3[31] = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2608B83A8, v2, 0);
}

uint64_t sub_2608B83A8()
{
  if (v0[24])
  {
    sub_2608ABA58(v0[25] + 112, (uint64_t)(v0 + 7));
    uint64_t v1 = v0[10];
    uint64_t v2 = v0[11];
    __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
    BOOL v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[35] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2608B8654;
    uint64_t v4 = v0[34];
    return v13(v4, v1, v2);
  }
  else
  {
    uint64_t v6 = sub_2608BF528();
    os_log_type_t v7 = sub_2608BF748();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2608A5000, v6, v7, "Clearing selected location", v8, 2u);
      MEMORY[0x26121F190](v8, -1, -1);
    }
    uint64_t v9 = v0[25];

    sub_2608ABA58(v9 + 192, (uint64_t)(v0 + 2));
    uint64_t v10 = v0[5];
    uint64_t v11 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v10);
    uint64_t v14 = (uint64_t (*)(void, void, uint64_t, uint64_t))(*(void *)(v11 + 8) + **(int **)(v11 + 8));
    uint64_t v12 = (void *)swift_task_alloc();
    v0[39] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_2608B9154;
    return v14(0, 0, v10, v11);
  }
}

uint64_t sub_2608B8654()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B8764, v1, 0);
}

uint64_t sub_2608B8764()
{
  uint64_t v1 = v0[25];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  sub_2608ABA58(v1 + 152, (uint64_t)(v0 + 12));
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  __swift_project_boxed_opaque_existential_1(v0 + 12, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[36] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2608B8880;
  return v6(v2, v3);
}

uint64_t sub_2608B8880(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 200);
  *(void *)(*(void *)v1 + 296) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B8998, v2, 0);
}

uint64_t sub_2608B8998()
{
  uint64_t v55 = v0;
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[31];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 12));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13C8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2608C0CC0;
  sub_2608BA9A0(v2, v6 + v5);
  uint64_t v7 = sub_2608B9310(v1);
  swift_bridgeObjectRelease();
  unint64_t v54 = (void *)v6;
  sub_2608BAEC4(v7);
  uint64_t v8 = *(void *)(v6 + 16);
  if (v8)
  {
    uint64_t v9 = v0[27];
    uint64_t v10 = (uint64_t)v54 + v5;
    swift_bridgeObjectRetain();
    unint64_t v11 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v13 = v0[32];
      uint64_t v12 = v0[33];
      uint64_t v14 = v0[26];
      sub_2608BA9A0(v10, v12);
      sub_2608BAA68(v12, v13);
      int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v13, 1, v14);
      uint64_t v16 = v0[32];
      if (v15 == 1)
      {
        sub_2608BAA08(v16);
      }
      else
      {
        uint64_t v18 = v0[29];
        uint64_t v17 = v0[30];
        sub_2608B23FC(v16, v17);
        sub_2608B23FC(v17, v18);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v11 = sub_2608BA4C8(0, *(void *)(v11 + 16) + 1, 1, v11);
        }
        unint64_t v20 = *(void *)(v11 + 16);
        unint64_t v19 = *(void *)(v11 + 24);
        if (v20 >= v19 >> 1) {
          unint64_t v11 = sub_2608BA4C8(v19 > 1, v20 + 1, 1, v11);
        }
        uint64_t v21 = v0[29];
        *(void *)(v11 + 16) = v20 + 1;
        sub_2608B23FC(v21, v11+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v20);
      }
      v10 += v4;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease_n();
    int64_t v22 = *(void *)(v11 + 16);
    if (v22) {
      goto LABEL_12;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v30 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  unint64_t v11 = MEMORY[0x263F8EE78];
  int64_t v22 = *(void *)(MEMORY[0x263F8EE78] + 16);
  if (!v22) {
    goto LABEL_20;
  }
LABEL_12:
  uint64_t v23 = v0[27];
  uint64_t v52 = v0[26];
  unint64_t v54 = (void *)MEMORY[0x263F8EE78];
  sub_2608BAAD0(0, v22, 0);
  uint64_t v24 = v11 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
  uint64_t v25 = *(void *)(v23 + 72);
  do
  {
    uint64_t v26 = v0[28];
    sub_2608A9B48(v24, v26);
    uint64_t v27 = (uint64_t *)(v26 + *(int *)(v52 + 32));
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    swift_bridgeObjectRetain();
    sub_2608AB9A0(v26);
    uint64_t v30 = v54;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2608BAAD0(0, v54[2] + 1, 1);
      uint64_t v30 = v54;
    }
    unint64_t v32 = v30[2];
    unint64_t v31 = v30[3];
    if (v32 >= v31 >> 1)
    {
      sub_2608BAAD0(v31 > 1, v32 + 1, 1);
      uint64_t v30 = v54;
    }
    v30[2] = v32 + 1;
    int v33 = &v30[2 * v32];
    v33[4] = v29;
    v33[5] = v28;
    v24 += v25;
    --v22;
  }
  while (v22);
  swift_bridgeObjectRelease();
LABEL_21:
  char v34 = sub_2608B9540(v0[23], v0[24], v30);
  swift_bridgeObjectRelease();
  if (v34)
  {
    sub_2608ABA58(v0[25] + 192, (uint64_t)(v0 + 17));
    uint64_t v35 = v0[20];
    uint64_t v36 = v0[21];
    __swift_project_boxed_opaque_existential_1(v0 + 17, v35);
    uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 + 8) + **(int **)(v36 + 8));
    uint64_t v37 = (void *)swift_task_alloc();
    v0[38] = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_2608B8F70;
    uint64_t v39 = v0[23];
    uint64_t v38 = v0[24];
    return v50(v39, v38, v35, v36);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_2608BF528();
    os_log_type_t v42 = sub_2608BF738();
    BOOL v43 = os_log_type_enabled(v41, v42);
    uint64_t v44 = v0[34];
    unint64_t v45 = v0[24];
    if (v43)
    {
      uint64_t v51 = v0[23];
      uint64_t v53 = v0[34];
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      unint64_t v54 = (void *)v47;
      *(_DWORD *)uint64_t v46 = 136315138;
      swift_bridgeObjectRetain();
      v0[22] = sub_2608A9CC4(v51, v45, (uint64_t *)&v54);
      sub_2608BF778();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2608A5000, v41, v42, "Selected location %s is not contained the location list.", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26121F190](v47, -1, -1);
      MEMORY[0x26121F190](v46, -1, -1);

      uint64_t v48 = v53;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v48 = v44;
    }
    sub_2608BAA08(v48);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v49 = (uint64_t (*)(void))v0[1];
    return v49();
  }
}

uint64_t sub_2608B8F70()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2608B909C, v1, 0);
}

uint64_t sub_2608B909C()
{
  sub_2608BAA08(*(void *)(v0 + 272));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2608B9154()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B9264, v1, 0);
}

uint64_t sub_2608B9264()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2608B9310(uint64_t a1)
{
  uint64_t v16 = type metadata accessor for CoastalLocation();
  uint64_t v2 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_2608BAAF0(0, v9, 0);
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v12 = *(void *)(v2 + 72);
    do
    {
      sub_2608A9B48(v11, (uint64_t)v4);
      swift_dynamicCast();
      uint64_t v10 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2608BAAF0(0, *(void *)(v10 + 16) + 1, 1);
        uint64_t v10 = v17;
      }
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_2608BAAF0(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v17;
      }
      *(void *)(v10 + 16) = v14 + 1;
      sub_2608BAA68((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v14);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_2608B9540(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2608BF918();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  int64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2608BF918() & 1) != 0) {
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

uint64_t sub_2608B9608(int a1)
{
  *(void *)(v2 + 72) = v1;
  *(_DWORD *)(v2 + 152) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  *(void *)(v2 + 80) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2608B96A0, v1, 0);
}

uint64_t sub_2608B96A0()
{
  int v1 = *(_DWORD *)(v0 + 152);
  if ((v1 - 3) > 1)
  {
    if (v1)
    {
      sub_2608ABA58(*(void *)(v0 + 72) + 152, v0 + 16);
      uint64_t v9 = *(void *)(v0 + 40);
      uint64_t v10 = *(void *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v9);
      uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v10 + 16) + **(int **)(v10 + 16));
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 112) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_2608B9B2C;
      uint64_t v12 = v9;
      uint64_t v13 = v10;
      unint64_t v14 = v18;
    }
    else
    {
      int v15 = sub_2608BF528();
      os_log_type_t v16 = sub_2608BF748();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_2608A5000, v15, v16, "Undetermined location auth; return nil.", v17, 2u);
        MEMORY[0x26121F190](v17, -1, -1);
      }

      swift_task_dealloc();
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    return v14(v12, v13);
  }
  else
  {
    if (qword_26A8C1030 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_26A8C1280;
    uint64_t v3 = *(void *)algn_26A8C1288;
    *(void *)(v0 + 88) = qword_26A8C1280;
    *(void *)(v0 + 96) = v3;
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2608BF528();
    os_log_type_t v5 = sub_2608BF748();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2608A5000, v4, v5, "Using current location as default.", v6, 2u);
      MEMORY[0x26121F190](v6, -1, -1);
    }

    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_2608B99DC;
    return sub_2608B8250(v2, v3);
  }
}

uint64_t sub_2608B99DC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + 96);
  uint64_t v5 = *(void *)(v1 + 88);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  return v6(v5, v4);
}

uint64_t sub_2608B9B2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2608B9C44, v2, 0);
}

uint64_t sub_2608B9C44()
{
  uint64_t v26 = v0;
  uint64_t v1 = v0[15];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = type metadata accessor for CoastalLocation();
  uint64_t v4 = *(void *)(v3 - 8);
  if (v2)
  {
    sub_2608A9B48(v0[15]+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v0[10]);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[10];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  uint64_t v8 = v0[10];
  if (v7 == 1)
  {
    sub_2608BAA08(v0[10]);
    uint64_t v9 = sub_2608BF528();
    os_log_type_t v10 = sub_2608BF748();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v25 = v12;
      *(_DWORD *)uint64_t v11 = 136446210;
      v0[7] = sub_2608A9CC4(7104878, 0xE300000000000000, &v25);
      sub_2608BF778();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2608A5000, v9, v10, "No location auth, using first static location as default: %{public}s.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x26121F190](v12, -1, -1);
      MEMORY[0x26121F190](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void, void))v0[1];
    return v21(0, 0);
  }
  else
  {
    uint64_t v13 = (uint64_t *)(v8 + *(int *)(v3 + 32));
    uint64_t v14 = *v13;
    v0[16] = *v13;
    unint64_t v15 = v13[1];
    v0[17] = v15;
    swift_bridgeObjectRetain();
    sub_2608AB9A0(v8);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_2608BF528();
    os_log_type_t v17 = sub_2608BF748();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = v14;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v19 = v25;
      *(_DWORD *)uint64_t v18 = 136446210;
      swift_bridgeObjectRetain();
      v0[8] = sub_2608A9CC4(v24, v15, &v25);
      sub_2608BF778();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2608A5000, v16, v17, "Setting default location to: %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v20 = v19;
      uint64_t v14 = v24;
      MEMORY[0x26121F190](v20, -1, -1);
      MEMORY[0x26121F190](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v23 = (void *)swift_task_alloc();
    v0[18] = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_2608BA0A0;
    return sub_2608B8250(v14, v15);
  }
}

uint64_t sub_2608BA0A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2608BA1CC, v1, 0);
}

uint64_t sub_2608BA1CC()
{
  uint64_t v12 = v0;
  uint64_t v2 = v0[16];
  unint64_t v1 = v0[17];
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_2608BF528();
  os_log_type_t v4 = sub_2608BF748();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)uint64_t v5 = 136446210;
    if (v1) {
      uint64_t v6 = v2;
    }
    else {
      uint64_t v6 = 7104878;
    }
    if (v1) {
      unint64_t v7 = v1;
    }
    else {
      unint64_t v7 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    v0[7] = sub_2608A9CC4(v6, v7, &v11);
    sub_2608BF778();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2608A5000, v3, v4, "No location auth, using first static location as default: %{public}s.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26121F190](v10, -1, -1);
    MEMORY[0x26121F190](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v8(v2, v1);
}

uint64_t SelectedLocationManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SelectedLocationManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t SelectedLocationManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2608BA4C8(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C10A0);
  uint64_t v10 = *(void *)(type metadata accessor for CoastalLocation() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2608BF7F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for CoastalLocation() - 8);
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
    sub_2608BB810(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2608BA730(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13C8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2608BF7F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
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
    sub_2608BB6B4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2608BA9A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2608BAA08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2608BAA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2608BAAD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2608BAB10(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2608BAAF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2608BAC7C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2608BAB10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1408);
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
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2608BF808();
  __break(1u);
  return result;
}

uint64_t sub_2608BAC7C(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13C8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
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
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2608BF808();
  __break(1u);
  return result;
}

uint64_t sub_2608BAEC4(uint64_t a1)
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
  unint64_t v3 = sub_2608BA730(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
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
  uint64_t result = sub_2608BF808();
  __break(1u);
  return result;
}

uint64_t sub_2608BB078()
{
  return type metadata accessor for SelectedLocationManager();
}

uint64_t type metadata accessor for SelectedLocationManager()
{
  uint64_t result = qword_26A8C13D0;
  if (!qword_26A8C13D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2608BB0CC()
{
  uint64_t result = sub_2608BF548();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SelectedLocationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SelectedLocationManager);
}

uint64_t dispatch thunk of SelectedLocationManager.__allocating_init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SelectedLocationManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of SelectedLocationManager.getSelectedLocationID()()
{
  int64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 208) + **(int **)(*(void *)v0 + 208));
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_2608AAB74;
  return v4();
}

uint64_t dispatch thunk of SelectedLocationManager.getSelectedLocation()(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 216) + **(int **)(*(void *)v1 + 216));
  int64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int64_t v4 = v2;
  v4[1] = sub_2608ABEA4;
  return v6(a1);
}

uint64_t dispatch thunk of SelectedLocationManager.set(selectedLocation:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 224) + **(int **)(*(void *)v2 + 224));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_2608ABEA4;
  return v8(a1, a2);
}

uint64_t dispatch thunk of CurrentLocationProvider.currentLocationAuthStatus()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2608AA87C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of CurrentLocationProvider.getCurrentLocation()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2608AA698;
  return v9(a1, a2, a3);
}

uint64_t sub_2608BB6B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8) - 8);
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
  uint64_t result = sub_2608BF808();
  __break(1u);
  return result;
}

uint64_t sub_2608BB810(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for CoastalLocation() - 8);
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
  uint64_t result = sub_2608BF808();
  __break(1u);
  return result;
}

uint64_t ChinaWifiModel.status.getter@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2608AF200();
  sub_2608BF4F8();
  uint64_t result = swift_release();
  *a1 = *(unsigned char *)(v1 + 16);
  return result;
}

BOOL ChinaWifiModel.Status.allowNetworkTraffic.getter()
{
  return (*v0 & 0xFD) != 0;
}

uint64_t type metadata accessor for ChinaWifiModel()
{
  uint64_t result = qword_26A8C1450;
  if (!qword_26A8C1450) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2608BBA48(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_2608BBA50()
{
  type metadata accessor for ChinaWifiModel();
  swift_allocObject();
  uint64_t result = sub_2608BBAEC();
  qword_26A8C1410 = result;
  return result;
}

uint64_t static ChinaWifiModel.shared.getter()
{
  if (qword_26A8C1050 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_2608BBAEC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2608BF548();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_logger;
  if (qword_26A8C1078 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v2, (uint64_t)qword_26A8C3600);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v8(v6, v7, v2);
  sub_2608BF508();
  v8((uint64_t)v5, v7, v2);
  unsigned __int8 v9 = sub_2608BCF20();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_isChinaSku) = v9 & 1;
  char v10 = sub_2608BD00C();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_isWifiOnlyDevice) = v10 & 1;
  if (v9 & 1) != 0 && (v10)
  {
    id v11 = sub_2608BBEB0();
    *(void *)(v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_userDefaults) = v11;
    id v12 = v11;
    sub_2608BC01C(v11, &v21);
    *(unsigned char *)(v0 + 16) = v21;
    swift_retain_n();
    unint64_t v13 = sub_2608BF528();
    os_log_type_t v14 = sub_2608BF748();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v21 = v18;
      *(_DWORD *)unint64_t v15 = 136315138;
      swift_getKeyPath();
      id v19 = v12;
      uint64_t v20 = v0;
      sub_2608AF200();
      sub_2608BF4F8();
      swift_release();
      uint64_t v20 = sub_2608A9CC4(*(void *)&aUndetermnotapp[8 * *(char *)(v0 + 16)], *(void *)&aIned[8 * *(char *)(v0 + 16)], &v21);
      sub_2608BF778();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2608A5000, v13, v14, "Initial status is %s", v15, 0xCu);
      uint64_t v16 = v18;
      swift_arrayDestroy();
      MEMORY[0x26121F190](v16, -1, -1);
      MEMORY[0x26121F190](v15, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)(v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_userDefaults) = 0;
    *(unsigned char *)(v0 + 16) = 1;
  }
  return v1;
}

id sub_2608BBEB0()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_2608BF5B8();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_2608BF528();
    os_log_type_t v5 = sub_2608BF728();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2608A5000, v4, v5, "Successfully created defaults.", v6, 2u);
      MEMORY[0x26121F190](v6, -1, -1);
    }
  }
  else
  {
    uint64_t v3 = sub_2608BF528();
    os_log_type_t v7 = sub_2608BF738();
    if (os_log_type_enabled(v3, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2608A5000, v3, v7, "Could not create defaults!", v8, 2u);
      MEMORY[0x26121F190](v8, -1, -1);
    }
    id v2 = 0;
  }

  return v2;
}

void sub_2608BC01C(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = sub_2608BF548();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A8C1078 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26A8C3600);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  if (!a1)
  {
    unsigned __int8 v9 = sub_2608BF528();
    os_log_type_t v12 = sub_2608BF738();
    if (os_log_type_enabled(v9, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_2608A5000, v9, v12, "Could not read user defaults, assume denied.", v13, 2u);
      MEMORY[0x26121F190](v13, -1, -1);
    }
    goto LABEL_11;
  }
  unsigned __int8 v9 = a1;
  char v10 = (void *)sub_2608BF5B8();
  id v11 = [v9 integerForKey:v10];

  if ((unint64_t)v11 > 3)
  {
    os_log_type_t v14 = sub_2608BF528();
    os_log_type_t v15 = sub_2608BF738();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2608A5000, v14, v15, "Could not read valid status, assume denied.", v16, 2u);
      MEMORY[0x26121F190](v16, -1, -1);
    }

LABEL_11:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    LOBYTE(v11) = 2;
    goto LABEL_12;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

LABEL_12:
  *a2 = (_BYTE)v11;
}

uint64_t ChinaWifiModel.Status.debugDescription.getter()
{
  return *(void *)&aUndetermnotapp[8 * *v0];
}

Swift::Void __swiftcall ChinaWifiModel.update(status:)(UrchinKit::ChinaWifiModel::Status_optional status)
{
  uint64_t v2 = v1;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_isChinaSku) == 1
    && *(unsigned char *)(v1 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_isWifiOnlyDevice) == 1)
  {
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_userDefaults);
    if (v3)
    {
      uint64_t v4 = *(unsigned __int8 *)status.value;
      swift_getKeyPath();
      uint64_t v24 = v1;
      sub_2608AF200();
      id v5 = v3;
      sub_2608BF4F8();
      swift_release();
      if (v4 == 4 || v4 != *(unsigned __int8 *)(v1 + 16))
      {
        os_log_type_t v12 = sub_2608BF528();
        os_log_type_t v13 = sub_2608BF748();
        if (os_log_type_enabled(v12, v13))
        {
          id v23 = v5;
          os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
          uint64_t v15 = swift_slowAlloc();
          uint64_t v24 = v15;
          *(_DWORD *)os_log_type_t v14 = 136315138;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1440);
          uint64_t v16 = sub_2608BF768();
          sub_2608A9CC4(v16, v17, &v24);
          sub_2608BF778();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2608A5000, v12, v13, "Updating status to %s", v14, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x26121F190](v15, -1, -1);
          uint64_t v18 = v14;
          id v5 = v23;
          MEMORY[0x26121F190](v18, -1, -1);
        }

        if (v4 == 4)
        {
          uint64_t v19 = 0;
        }
        else
        {
          uint64_t v24 = v4;
          uint64_t v19 = sub_2608BF908();
        }
        uint64_t v20 = (void *)sub_2608BF5B8();
        objc_msgSend(v5, sel_setValue_forKey_, v19, v20);
        swift_unknownObjectRelease();

        uint64_t KeyPath = swift_getKeyPath();
        MEMORY[0x270FA5388](KeyPath);
        uint64_t v24 = v2;
        sub_2608BF4E8();

        swift_release();
      }
      else
      {
        uint64_t v6 = sub_2608BF528();
        os_log_type_t v7 = sub_2608BF718();
        if (os_log_type_enabled(v6, v7))
        {
          uint64_t v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_2608A5000, v6, v7, "Cannot update status, status is unchanged.", v8, 2u);
          MEMORY[0x26121F190](v8, -1, -1);
        }
      }
      return;
    }
    uint64_t v22 = sub_2608BF528();
    uint64_t v9 = sub_2608BF738();
    if (os_log_type_enabled(v22, (os_log_type_t)v9))
    {
      char v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v10 = 0;
      id v11 = "Cannot update status, userDefaults nil.";
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v22 = sub_2608BF528();
    LOBYTE(v9) = sub_2608BF738();
    if (os_log_type_enabled(v22, (os_log_type_t)v9))
    {
      char v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v10 = 0;
      id v11 = "Cannot update status for this device.";
LABEL_11:
      _os_log_impl(&dword_2608A5000, v22, (os_log_type_t)v9, v11, v10, 2u);
      MEMORY[0x26121F190](v10, -1, -1);
    }
  }
}

uint64_t ChinaWifiModel.Status.rawValue.getter()
{
  return *v0;
}

Swift::Void __swiftcall ChinaWifiModel.checkStatus()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_isChinaSku) == 1)
  {
    uint64_t v1 = v0;
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_isWifiOnlyDevice) == 1)
    {
      uint64_t v2 = sub_2608BF528();
      os_log_type_t v3 = sub_2608BF748();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_2608A5000, v2, v3, "Checking network status...", v4, 2u);
        MEMORY[0x26121F190](v4, -1, -1);
      }

      sub_2608BC01C(*(void **)(v1 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_userDefaults), &v15);
      int v5 = v15;
      swift_getKeyPath();
      uint64_t v15 = v1;
      sub_2608AF200();
      sub_2608BF4F8();
      swift_release();
      int v6 = *(unsigned __int8 *)(v1 + 16);
      os_log_type_t v7 = sub_2608BF528();
      if (v5 == v6)
      {
        os_log_type_t v8 = sub_2608BF718();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_2608A5000, v7, v8, "Status is unchanged.", v9, 2u);
          MEMORY[0x26121F190](v9, -1, -1);
        }
      }
      else
      {
        os_log_type_t v10 = sub_2608BF748();
        if (os_log_type_enabled(v7, v10))
        {
          id v11 = (uint8_t *)swift_slowAlloc();
          uint64_t v14 = swift_slowAlloc();
          *(_DWORD *)id v11 = 136315138;
          uint64_t v12 = *(void *)&aUndetermnotapp[8 * (char)v5];
          uint64_t v15 = v14;
          sub_2608A9CC4(v12, *(void *)&aIned[8 * (char)v5], &v15);
          sub_2608BF778();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2608A5000, v7, v10, "Updating status from disk to %s", v11, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x26121F190](v14, -1, -1);
          MEMORY[0x26121F190](v11, -1, -1);
        }

        uint64_t KeyPath = swift_getKeyPath();
        MEMORY[0x270FA5388](KeyPath);
        uint64_t v15 = v1;
        sub_2608BF4E8();
        swift_release();
      }
    }
  }
}

UrchinKit::ChinaWifiModel::Status_optional __swiftcall ChinaWifiModel.Status.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (UrchinKit::ChinaWifiModel::Status_optional)rawValue;
}

uint64_t ChinaWifiModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel___observationRegistrar;
  uint64_t v4 = sub_2608BF518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t ChinaWifiModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel_logger;
  uint64_t v2 = sub_2608BF548();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC9UrchinKit14ChinaWifiModel___observationRegistrar;
  uint64_t v4 = sub_2608BF518();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

UrchinKit::ChinaWifiModel::Status_optional sub_2608BCC88(Swift::Int *a1)
{
  return ChinaWifiModel.Status.init(rawValue:)(*a1);
}

void sub_2608BCC90(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_2608BCCA0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

unint64_t sub_2608BCCB4()
{
  unint64_t result = qword_26A8C1448;
  if (!qword_26A8C1448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1448);
  }
  return result;
}

uint64_t sub_2608BCD10()
{
  return type metadata accessor for ChinaWifiModel();
}

uint64_t sub_2608BCD18()
{
  uint64_t result = sub_2608BF548();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2608BF518();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for ChinaWifiModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ChinaWifiModel);
}

unsigned char *storeEnumTagSinglePayload for ChinaWifiModel.Status(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2608BCEE8);
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

ValueMetadata *type metadata accessor for ChinaWifiModel.Status()
{
  return &type metadata for ChinaWifiModel.Status;
}

id sub_2608BCF20()
{
  id v0 = objc_msgSend(self, sel_isChina);
  unint64_t v1 = sub_2608BF528();
  os_log_type_t v2 = sub_2608BF748();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v3 = 67109120;
    sub_2608BF778();
    _os_log_impl(&dword_2608A5000, v1, v2, "isChinaSku: %{BOOL}d", v3, 8u);
    MEMORY[0x26121F190](v3, -1, -1);
  }

  return v0;
}

uint64_t sub_2608BD00C()
{
  id v0 = (void *)sub_2608BF5B8();
  int v1 = MGGetBoolAnswer();

  os_log_type_t v2 = sub_2608BF528();
  os_log_type_t v3 = sub_2608BF748();
  if (os_log_type_enabled(v2, v3))
  {
    unsigned int v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unsigned int v4 = 67109120;
    uint64_t v5 = v1 ^ 1u;
    sub_2608BF778();
    _os_log_impl(&dword_2608A5000, v2, v3, "isWifiOnlyDevice: %{BOOL}d", v4, 8u);
    MEMORY[0x26121F190](v4, -1, -1);
  }
  else
  {

    return v1 ^ 1u;
  }
  return v5;
}

void sub_2608BD118()
{
}

uint64_t CLLocationCoordinate2D.shortDescription.getter(double a1, double a2)
{
  return sub_2608BD16C(a1, a2);
}

uint64_t CLLocationCoordinate2D.id.getter(double a1, double a2)
{
  return sub_2608BD16C(a1, a2);
}

uint64_t sub_2608BD16C(double a1, double a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1210);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8D538];
  *(_OWORD *)(v4 + 16) = xmmword_2608C05F0;
  uint64_t v6 = MEMORY[0x263F8D5B8];
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  *(double *)(v4 + 32) = a1;
  *(void *)(v4 + 96) = v5;
  *(void *)(v4 + 104) = v6;
  *(double *)(v4 + 72) = a2;

  return sub_2608BF5D8();
}

uint64_t CLLocationCoordinate2D.description.getter()
{
  return 0;
}

uint64_t sub_2608BD2B0()
{
  return CLLocationCoordinate2D.description.getter();
}

Swift::Bool __swiftcall CLLocationCoordinate2D.isValidMarineCoordinate()()
{
  Swift::Bool result = 0;
  if (v0 != 0.0 && v1 != 0.0) {
    return CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v0);
  }
  return result;
}

uint64_t LocationRule.LocationSupport.description.getter()
{
  return *(void *)&aCurrent_0[8 * *v0];
}

uint64_t LocationRule.LocationSupport.imageName.getter()
{
  unint64_t v1 = 0xD000000000000015;
  if (*v0 != 1) {
    unint64_t v1 = 0;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E6F697461636F6CLL;
  }
}

BOOL LocationRule.LocationSupport.isSupported.getter()
{
  return *v0 != 2;
}

uint64_t LocationRule.LocationSupport.genericDisplayText.getter()
{
  uint64_t v1 = sub_2608BF418();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_2608BF5A8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = &v22[-v8];
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = &v22[-v11];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v22[-v13];
  int v15 = *v0;
  if (!*v0)
  {
    sub_2608BF598();
    uint64_t v19 = (void *)sub_2608BF5B8();
    id v20 = objc_msgSend(self, sel_bundleWithIdentifier_, v19);

    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v12, v14, v2);
    sub_2608BF408();
    uint64_t v16 = sub_2608BF5E8();
    goto LABEL_5;
  }
  uint64_t v16 = 0;
  if (v15 == 1)
  {
    sub_2608BF598();
    unint64_t v17 = (void *)sub_2608BF5B8();
    id v18 = objc_msgSend(self, sel_bundleWithIdentifier_, v17);

    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v6, v9, v2);
    sub_2608BF408();
    uint64_t v16 = sub_2608BF5E8();
    uint64_t v14 = v9;
LABEL_5:
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v14, v2);
  }
  return v16;
}

UrchinKit::LocationRule::LocationSupport_optional __swiftcall LocationRule.LocationSupport.init(currentLocation:supportedLocation:)(CLLocation_optional currentLocation, CLLocation_optional supportedLocation)
{
  id internal = currentLocation.value._internal;
  uint64_t v4 = v2;
  if (currentLocation.value.super.isa)
  {
    Class isa = currentLocation.value.super.isa;
    if (currentLocation.value._internal)
    {
      -[objc_class distanceFromLocation:](currentLocation.value.super.isa, sel_distanceFromLocation_, currentLocation.value._internal, supportedLocation.value.super.isa, supportedLocation.value._internal, *(void *)&supportedLocation.is_nil);
      double v7 = v6;

      if (v7 <= 3000.0)
      {
        char v9 = 0;
      }
      else if (v7 <= 100000.0)
      {
        char v9 = 1;
      }
      else
      {
        char v9 = 2;
      }
    }
    else
    {

      char v9 = 3;
    }
  }
  else
  {

    char v9 = 3;
  }
  *uint64_t v4 = v9;
  return result;
}

UrchinKit::LocationRule::LocationSupport __swiftcall LocationRule.LocationSupport.init(currentLocation:supportedLocation:)(CLLocation currentLocation, CLLocation supportedLocation)
{
  id internal = currentLocation._internal;
  Class isa = currentLocation.super.isa;
  uint64_t v5 = v2;
  -[objc_class distanceFromLocation:](currentLocation.super.isa, sel_distanceFromLocation_, currentLocation._internal, supportedLocation._internal);
  double v7 = v6;

  if (v7 <= 100000.0) {
    char v9 = 1;
  }
  else {
    char v9 = 2;
  }
  if (v7 <= 3000.0) {
    char v9 = 0;
  }
  char *v5 = v9;
  return result;
}

uint64_t LocationRule.LocationSupport.init(currentLocation:supportedLocation:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C13B8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CoastalLocation();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (double *)((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2608BA9A0(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {

    sub_2608BAA08(a1);
    uint64_t result = sub_2608BAA08((uint64_t)v8);
    char v14 = 3;
  }
  else
  {
    sub_2608B23FC((uint64_t)v8, (uint64_t)v12);
    if (*((unsigned char *)v12 + *(int *)(v9 + 36)) == 1)
    {
      if (a2)
      {
        id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v12[2], v12[3]);
        objc_msgSend(v15, sel_distanceFromLocation_, a2);
        double v17 = v16;

        if (v17 <= 3000.0)
        {
          sub_2608BAA08(a1);
          uint64_t result = sub_2608AB9A0((uint64_t)v12);
          char v14 = 0;
        }
        else
        {
          sub_2608BAA08(a1);
          uint64_t result = sub_2608AB9A0((uint64_t)v12);
          if (v17 <= 100000.0) {
            char v14 = 1;
          }
          else {
            char v14 = 2;
          }
        }
      }
      else
      {
        sub_2608BAA08(a1);
        uint64_t result = sub_2608AB9A0((uint64_t)v12);
        char v14 = 1;
      }
    }
    else
    {

      sub_2608BAA08(a1);
      uint64_t result = sub_2608AB9A0((uint64_t)v12);
      char v14 = 3;
    }
  }
  *a3 = v14;
  return result;
}

BOOL static LocationRule.LocationSupport.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LocationRule.LocationSupport.hash(into:)()
{
  return sub_2608BF938();
}

uint64_t sub_2608BDA74(char a1)
{
  return *(void *)&aCurrent_0[8 * a1];
}

uint64_t sub_2608BDA9C()
{
  return sub_2608BDA74(*v0);
}

uint64_t sub_2608BDAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2608BF040(a1, a2);
  *a3 = result;
  return result;
}

void sub_2608BDACC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2608BDAD8(uint64_t a1)
{
  unint64_t v2 = sub_2608BE058();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2608BDB14(uint64_t a1)
{
  unint64_t v2 = sub_2608BE058();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2608BDB50()
{
  return 0;
}

uint64_t sub_2608BDB5C(uint64_t a1)
{
  unint64_t v2 = sub_2608BE154();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2608BDB98(uint64_t a1)
{
  unint64_t v2 = sub_2608BE154();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2608BDBD4(uint64_t a1)
{
  unint64_t v2 = sub_2608BE0AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2608BDC10(uint64_t a1)
{
  unint64_t v2 = sub_2608BE0AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2608BDC4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2608BDC7C(uint64_t a1)
{
  unint64_t v2 = sub_2608BE100();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2608BDCB8(uint64_t a1)
{
  unint64_t v2 = sub_2608BE100();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LocationRule.LocationSupport.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1460);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  id v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1468);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1470);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C1478);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608BE058();
  sub_2608BF978();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_2608BE100();
      sub_2608BF8A8();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_2608BE0AC();
      double v17 = v23;
      sub_2608BF8A8();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_2608BE154();
    sub_2608BF8A8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_2608BE058()
{
  unint64_t result = qword_26A8C1480;
  if (!qword_26A8C1480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1480);
  }
  return result;
}

unint64_t sub_2608BE0AC()
{
  unint64_t result = qword_26A8C1488;
  if (!qword_26A8C1488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1488);
  }
  return result;
}

unint64_t sub_2608BE100()
{
  unint64_t result = qword_26A8C1490;
  if (!qword_26A8C1490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1490);
  }
  return result;
}

unint64_t sub_2608BE154()
{
  unint64_t result = qword_26A8C1498;
  if (!qword_26A8C1498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1498);
  }
  return result;
}

uint64_t LocationRule.LocationSupport.hashValue.getter()
{
  return sub_2608BF958();
}

uint64_t LocationRule.LocationSupport.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C14A0);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C14A8);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C14B0);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C14B8);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2608BE058();
  uint64_t v12 = (uint64_t)v39;
  sub_2608BF968();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  uint64_t v39 = a1;
  id v15 = v11;
  uint64_t v16 = sub_2608BF898();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_2608BF7D8();
    swift_allocError();
    id v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A8C14C0);
    *id v23 = &type metadata for LocationRule.LocationSupport;
    sub_2608BF838();
    sub_2608BF7C8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_2608BE100();
      uint64_t v18 = v30;
      sub_2608BF828();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_2608BE0AC();
      uint64_t v25 = v30;
      sub_2608BF828();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_2608BE154();
    uint64_t v24 = v30;
    sub_2608BF828();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
}

uint64_t sub_2608BE7AC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return LocationRule.LocationSupport.init(from:)(a1, a2);
}

uint64_t sub_2608BE7C4(void *a1)
{
  return LocationRule.LocationSupport.encode(to:)(a1);
}

UrchinKit::LocationRule::CurrentNearbyLocationSupport __swiftcall LocationRule.CurrentNearbyLocationSupport.init(location:poiLocation:)(CLLocation location, CLLocation poiLocation)
{
  id internal = location._internal;
  Class isa = location.super.isa;
  uint64_t v5 = v2;
  -[objc_class distanceFromLocation:](location.super.isa, sel_distanceFromLocation_, location._internal, poiLocation._internal);
  double v7 = v6;

  BOOL *v5 = v7 > 4000.0;
  return result;
}

BOOL static LocationRule.CurrentNearbyLocationSupport.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LocationRule.CurrentNearbyLocationSupport.hash(into:)()
{
  return sub_2608BF938();
}

uint64_t LocationRule.CurrentNearbyLocationSupport.hashValue.getter()
{
  return sub_2608BF958();
}

BOOL sub_2608BE8D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_2608BE8F0()
{
  unint64_t result = qword_26A8C14C8;
  if (!qword_26A8C14C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14C8);
  }
  return result;
}

unint64_t sub_2608BE948()
{
  unint64_t result = qword_26A8C14D0;
  if (!qword_26A8C14D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationRule()
{
  return &type metadata for LocationRule;
}

ValueMetadata *type metadata accessor for LocationRule.LocationSupport()
{
  return &type metadata for LocationRule.LocationSupport;
}

uint64_t getEnumTagSinglePayload for LocationRule.CurrentNearbyLocationSupport(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LocationRule.CurrentNearbyLocationSupport(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2608BEB20);
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

unsigned char *sub_2608BEB48(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LocationRule.CurrentNearbyLocationSupport()
{
  return &type metadata for LocationRule.CurrentNearbyLocationSupport;
}

uint64_t _s9UrchinKit12LocationRuleV15LocationSupportOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s9UrchinKit12LocationRuleV15LocationSupportOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2608BECC0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationRule.LocationSupport.CodingKeys()
{
  return &type metadata for LocationRule.LocationSupport.CodingKeys;
}

ValueMetadata *type metadata accessor for LocationRule.LocationSupport.CurrentCodingKeys()
{
  return &type metadata for LocationRule.LocationSupport.CurrentCodingKeys;
}

ValueMetadata *type metadata accessor for LocationRule.LocationSupport.NearbyCodingKeys()
{
  return &type metadata for LocationRule.LocationSupport.NearbyCodingKeys;
}

ValueMetadata *type metadata accessor for LocationRule.LocationSupport.FarawayCodingKeys()
{
  return &type metadata for LocationRule.LocationSupport.FarawayCodingKeys;
}

unint64_t sub_2608BED2C()
{
  unint64_t result = qword_26A8C14D8;
  if (!qword_26A8C14D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14D8);
  }
  return result;
}

unint64_t sub_2608BED84()
{
  unint64_t result = qword_26A8C14E0;
  if (!qword_26A8C14E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14E0);
  }
  return result;
}

unint64_t sub_2608BEDDC()
{
  unint64_t result = qword_26A8C14E8;
  if (!qword_26A8C14E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14E8);
  }
  return result;
}

unint64_t sub_2608BEE34()
{
  unint64_t result = qword_26A8C14F0;
  if (!qword_26A8C14F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14F0);
  }
  return result;
}

unint64_t sub_2608BEE8C()
{
  unint64_t result = qword_26A8C14F8;
  if (!qword_26A8C14F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C14F8);
  }
  return result;
}

unint64_t sub_2608BEEE4()
{
  unint64_t result = qword_26A8C1500;
  if (!qword_26A8C1500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1500);
  }
  return result;
}

unint64_t sub_2608BEF3C()
{
  unint64_t result = qword_26A8C1508;
  if (!qword_26A8C1508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1508);
  }
  return result;
}

unint64_t sub_2608BEF94()
{
  unint64_t result = qword_26A8C1510;
  if (!qword_26A8C1510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1510);
  }
  return result;
}

unint64_t sub_2608BEFEC()
{
  unint64_t result = qword_26A8C1518;
  if (!qword_26A8C1518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A8C1518);
  }
  return result;
}

uint64_t sub_2608BF040(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E6572727563 && a2 == 0xE700000000000000;
  if (v3 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79627261656ELL && a2 == 0xE600000000000000 || (sub_2608BF918() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79617761726166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2608BF918();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2608BF18C(uint64_t a1)
{
  return sub_2608BF240(a1, qword_26A8C35A0);
}

uint64_t sub_2608BF1B0(uint64_t a1)
{
  return sub_2608BF240(a1, qword_26A8C35B8);
}

uint64_t sub_2608BF1D4(uint64_t a1)
{
  return sub_2608BF240(a1, qword_26A8C35D0);
}

uint64_t sub_2608BF1F8(uint64_t a1)
{
  return sub_2608BF240(a1, qword_26A8C35E8);
}

uint64_t sub_2608BF21C(uint64_t a1)
{
  return sub_2608BF240(a1, qword_26A8C3600);
}

uint64_t sub_2608BF240(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2608BF548();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2608BF538();
}

uint64_t sub_2608BF2B8()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_2608BF2C8()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_2608BF2D8()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_2608BF2E8()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2608BF2F8()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2608BF308()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_2608BF318()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_2608BF328()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_2608BF338()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_2608BF348()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_2608BF358()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2608BF368()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2608BF378()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2608BF388()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2608BF398()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2608BF3A8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2608BF3B8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2608BF3C8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2608BF3D8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2608BF3E8()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_2608BF3F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2608BF408()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2608BF418()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2608BF428()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_2608BF438()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_2608BF448()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_2608BF458()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_2608BF468()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2608BF478()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2608BF488()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_2608BF498()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2608BF4A8()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_2608BF4B8()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_2608BF4C8()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_2608BF4D8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2608BF4E8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2608BF4F8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2608BF508()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2608BF518()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2608BF528()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2608BF538()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2608BF548()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2608BF558()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2608BF568()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2608BF578()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2608BF588()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2608BF598()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2608BF5A8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2608BF5B8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2608BF5C8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2608BF5D8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2608BF5E8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2608BF5F8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2608BF608()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2608BF618()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2608BF628()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2608BF638()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2608BF658()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2608BF668()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_2608BF678()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2608BF688()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_2608BF698()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2608BF6A8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2608BF6B8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2608BF6C8()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_2608BF6D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2608BF6E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2608BF6F8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2608BF708()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2608BF718()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2608BF728()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2608BF738()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2608BF748()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2608BF758()
{
  return MEMORY[0x270F84FA0]();
}

uint64_t sub_2608BF768()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2608BF778()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2608BF788()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2608BF798()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2608BF7A8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2608BF7B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2608BF7C8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2608BF7D8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2608BF7E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2608BF7F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2608BF808()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2608BF818()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2608BF828()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2608BF838()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2608BF848()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2608BF858()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2608BF868()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2608BF878()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2608BF888()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2608BF898()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2608BF8A8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2608BF8B8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2608BF8C8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2608BF8D8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2608BF8E8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2608BF8F8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2608BF908()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2608BF918()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2608BF928()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2608BF938()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2608BF948()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2608BF958()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2608BF968()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2608BF978()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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