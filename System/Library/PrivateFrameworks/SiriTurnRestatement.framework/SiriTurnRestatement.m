uint64_t SiriTurnRestatementCalculator.__allocating_init(logger:bookmarkService:maxSeconds:maxConsecutiveTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = swift_allocObject();
  sub_25DD5EC20();
  v9 = v8 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  v10 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a1, v10);
  *(void *)(v8 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_bookmarkService) = a2;
  *(double *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a3;
  return v8;
}

uint64_t SiriTurnRestatementCalculator.init(logger:bookmarkService:maxSeconds:maxConsecutiveTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  sub_25DD5EC20();
  uint64_t v9 = v4 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  uint64_t v10 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a1, v10);
  *(void *)(v4 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_bookmarkService) = a2;
  *(double *)(v4 + 16) = a4;
  *(void *)(v4 + 24) = a3;
  return v4;
}

uint64_t SiriTurnRestatementCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_25DD4FC10, 0, 0);
}

uint64_t sub_25DD4FC10()
{
  uint64_t v78 = v0;
  v1 = sub_25DD5EDE0();
  os_log_type_t v2 = sub_25DD5EF30();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_25DD4D000, v1, v2, "Running SiriTurnRestatementCalculator", v3, 2u);
    MEMORY[0x2611C4890](v3, -1, -1);
  }

  unint64_t v4 = sub_25DD5ECD0();
  uint64_t v5 = MEMORY[0x263F8EE78];
  unint64_t v75 = sub_25DD507B0(MEMORY[0x263F8EE78]);
  v6 = (void *)sub_25DD507B0(v5);
  uint64_t v9 = v6;
  v68[2] = v5;
  if (v4 >> 62) {
    goto LABEL_65;
  }
  uint64_t v10 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
  {
LABEL_66:
    swift_bridgeObjectRelease();
    uint64_t v62 = MEMORY[0x263F8EE78];
LABEL_67:
    v68[6] = v62;
    v68[7] = v75;
    swift_bridgeObjectRelease();
    v63 = (void *)swift_task_alloc();
    v68[8] = v63;
    void *v63 = v68;
    v63[1] = sub_25DD5039C;
    uint64_t v64 = v68[5];
    v63[11] = v62;
    v63[12] = v64;
    v63[10] = v75;
    v6 = sub_25DD508E8;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
LABEL_5:
  unint64_t v11 = 0;
  uint64_t v74 = 0;
  v12 = v68 + 2;
  unint64_t v69 = v4 & 0xC000000000000001;
  uint64_t v65 = v4 & 0xFFFFFFFFFFFFFF8;
  uint64_t v66 = v10;
  unint64_t v67 = v4;
  while (1)
  {
    if (v69)
    {
      MEMORY[0x2611C42A0](v11, v4);
      unint64_t v13 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_64;
      }
    }
    else
    {
      if (v11 >= *(void *)(v65 + 16))
      {
        __break(1u);
        return MEMORY[0x270FA2498](v6, v7, v8);
      }
      swift_retain();
      unint64_t v13 = v11 + 1;
      if (__OFADD__(v11, 1))
      {
LABEL_64:
        __break(1u);
LABEL_65:
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_25DD5F010();
        v6 = (void *)swift_bridgeObjectRelease();
        if (!v10) {
          goto LABEL_66;
        }
        goto LABEL_5;
      }
    }
    unint64_t v70 = v13;
    unint64_t v14 = sub_25DD5ED30();
    unint64_t v15 = v14;
    if (!(v14 >> 62))
    {
      uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v16) {
        break;
      }
      goto LABEL_6;
    }
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25DD5F010();
    swift_bridgeObjectRelease();
    if (v16) {
      break;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    v6 = (void *)swift_release();
    unint64_t v11 = v70;
    unint64_t v4 = v67;
    if (v70 == v66)
    {
      swift_bridgeObjectRelease();
      uint64_t v62 = *v12;
      goto LABEL_67;
    }
  }
  uint64_t v17 = v16;
  unint64_t v71 = v11;
  uint64_t v18 = 0;
  unint64_t v76 = v15 & 0xC000000000000001;
  unint64_t v73 = v15;
  uint64_t v72 = v16;
  while (1)
  {
    if (v76)
    {
      MEMORY[0x2611C42A0](v18, v15);
      uint64_t v19 = v18 + 1;
      if (__OFADD__(v18, 1)) {
        goto LABEL_58;
      }
    }
    else
    {
      swift_retain();
      uint64_t v19 = v18 + 1;
      if (__OFADD__(v18, 1))
      {
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
        goto LABEL_64;
      }
    }
    char v20 = sub_25DD5ED90();
    uint64_t v21 = swift_retain();
    if ((v20 & 1) == 0)
    {
      swift_retain();
      unint64_t v4 = sub_25DD5EDE0();
      os_log_type_t v33 = sub_25DD5EF40();
      if (os_log_type_enabled((os_log_t)v4, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        v77 = (void *)v35;
        *(_DWORD *)uint64_t v34 = 136315138;
        uint64_t v36 = sub_25DD5EDA0();
        *(void *)(v34 + 4) = sub_25DD541A8(v36, v37, (uint64_t *)&v77);
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_25DD4D000, (os_log_t)v4, v33, "Turn: %s has an invalid timestamp", (uint8_t *)v34, 0xCu);
        swift_arrayDestroy();
        uint64_t v38 = v35;
        unint64_t v15 = v73;
        MEMORY[0x2611C4890](v38, -1, -1);
        uint64_t v39 = v34;
        uint64_t v17 = v72;
        MEMORY[0x2611C4890](v39, -1, -1);
        swift_release();
      }
      else
      {
        swift_release_n();
      }

      goto LABEL_18;
    }
    MEMORY[0x2611C4180](v21);
    if (*(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25DD5EED0();
    }
    sub_25DD5EEF0();
    sub_25DD5EEC0();
    uint64_t v22 = sub_25DD5EDA0();
    unint64_t v4 = v23;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v77 = v9;
    unint64_t v26 = sub_25DD54810(v22, v4);
    uint64_t v27 = v9[2];
    BOOL v28 = (v25 & 1) == 0;
    uint64_t v29 = v27 + v28;
    if (__OFADD__(v27, v28)) {
      goto LABEL_59;
    }
    char v30 = v25;
    if (v9[3] >= v29)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v25) {
          goto LABEL_36;
        }
      }
      else
      {
        sub_25DD55364();
        uint64_t v9 = v77;
        if (v30) {
          goto LABEL_36;
        }
      }
    }
    else
    {
      sub_25DD54BBC(v29, isUniquelyReferenced_nonNull_native);
      uint64_t v9 = v77;
      unint64_t v31 = sub_25DD54810(v22, v4);
      if ((v30 & 1) != (v32 & 1)) {
        break;
      }
      unint64_t v26 = v31;
      if (v30)
      {
LABEL_36:
        *(void *)(v9[7] + 8 * v26) = v71;
        goto LABEL_40;
      }
    }
    v9[(v26 >> 6) + 8] |= 1 << v26;
    v40 = (uint64_t *)(v9[6] + 16 * v26);
    uint64_t *v40 = v22;
    v40[1] = v4;
    *(void *)(v9[7] + 8 * v26) = v71;
    uint64_t v41 = v9[2];
    BOOL v42 = __OFADD__(v41, 1);
    uint64_t v43 = v41 + 1;
    if (v42) {
      goto LABEL_62;
    }
    v9[2] = v43;
    swift_bridgeObjectRetain();
LABEL_40:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_25DD5EDA0();
    unint64_t v4 = v45;
    v46 = (void *)v75;
    char v47 = swift_isUniquelyReferenced_nonNull_native();
    v77 = (void *)v75;
    unint64_t v49 = sub_25DD54810(v44, v4);
    uint64_t v50 = *(void *)(v75 + 16);
    BOOL v51 = (v48 & 1) == 0;
    uint64_t v52 = v50 + v51;
    if (__OFADD__(v50, v51)) {
      goto LABEL_60;
    }
    char v53 = v48;
    if (*(void *)(v75 + 24) >= v52)
    {
      if ((v47 & 1) == 0)
      {
        sub_25DD55364();
        v46 = v77;
      }
      goto LABEL_46;
    }
    sub_25DD54BBC(v52, v47);
    uint64_t v54 = (uint64_t)v77;
    unint64_t v55 = sub_25DD54810(v44, v4);
    if ((v53 & 1) != (v56 & 1)) {
      break;
    }
    unint64_t v49 = v55;
    v46 = (void *)v54;
LABEL_46:
    unint64_t v15 = v73;
    unint64_t v75 = (unint64_t)v46;
    if (v53)
    {
      uint64_t v57 = v74;
      *(void *)(v46[7] + 8 * v49) = v74;
    }
    else
    {
      v46[(v49 >> 6) + 8] |= 1 << v49;
      v58 = (uint64_t *)(v46[6] + 16 * v49);
      uint64_t *v58 = v44;
      v58[1] = v4;
      uint64_t v57 = v74;
      *(void *)(v46[7] + 8 * v49) = v74;
      uint64_t v59 = v46[2];
      BOOL v42 = __OFADD__(v59, 1);
      uint64_t v60 = v59 + 1;
      if (v42) {
        goto LABEL_63;
      }
      v46[2] = v60;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v74 = v57 + 1;
    v12 = v68 + 2;
    if (__OFADD__(v57, 1)) {
      goto LABEL_61;
    }
    uint64_t v17 = v72;
LABEL_18:
    ++v18;
    if (v19 == v17) {
      goto LABEL_6;
    }
  }
  return sub_25DD5F090();
}

uint64_t sub_25DD5039C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25DD505F4;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_25DD504D4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25DD504D4()
{
  uint64_t v1 = v0[10];
  os_log_type_t v2 = (void *)v0[3];
  uint64_t v3 = sub_25DD5EBB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = swift_task_alloc();
  sub_25DD5EC40();
  uint64_t v6 = sub_25DD5EC50();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  uint64_t v7 = MEMORY[0x263F8EE78];
  *os_log_type_t v2 = v1;
  v2[1] = v7;
  v2[2] = v6;
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_25DD505F4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_25DD50660(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5770);
  os_log_type_t v2 = (void *)sub_25DD5F050();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v7 = v4[1];
    uint64_t v8 = v4[2];
    uint64_t v9 = v4[3];
    uint64_t v10 = v4[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25DD54810(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v13 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v13 = v5;
    v13[1] = v6;
    unint64_t v14 = (uint64_t *)(v2[7] + 32 * result);
    *unint64_t v14 = v7;
    v14[1] = v8;
    v14[2] = v9;
    v14[3] = v10;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v2[2] = v17;
    v4 += 6;
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

unint64_t sub_25DD507B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5738);
  os_log_type_t v2 = (void *)sub_25DD5F050();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25DD54810(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

uint64_t sub_25DD508C4(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  return MEMORY[0x270FA2498](sub_25DD508E8, 0, 0);
}

void sub_25DD508E8()
{
  uint64_t v91 = v0;
  unint64_t v1 = *(void *)(v0 + 88);
  *(void *)(v0 + 48) = sub_25DD50660(MEMORY[0x263F8EE78]);
  uint64_t v2 = v0 + 48;
  if (v1 >> 62) {
    goto LABEL_78;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  *(void *)(v0 + 104) = v3;
  if (!v3)
  {
LABEL_79:
    swift_bridgeObjectRelease();
    uint64_t v79 = swift_bridgeObjectRetain();
    v80 = sub_25DD55B80(v79);
    swift_bridgeObjectRelease_n();
    v81 = *(void (**)(void *))(v0 + 8);
    v81(v80);
    return;
  }
LABEL_3:
  unint64_t v4 = 0;
  v87 = (void *)(v2 + 8);
  uint64_t v82 = v2 + 24;
  *(void *)(v0 + 112) = OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  v85 = (void *)(v2 - 32);
  uint64_t v86 = v2;
  while (1)
  {
    uint64_t v5 = *(void *)(v0 + 88);
    if ((v5 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = MEMORY[0x2611C42A0](v4);
    }
    else
    {
      if (v4 >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      uint64_t v6 = *(void *)(v5 + 8 * v4 + 32);
      swift_retain();
    }
    *(void *)(v0 + 120) = v6;
    *(void *)(v0 + 128) = v4 + 1;
    if (__OFADD__(v4, 1))
    {
LABEL_77:
      __break(1u);
LABEL_78:
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_25DD5F010();
      *(void *)(v0 + 104) = v78;
      if (!v78) {
        goto LABEL_79;
      }
      goto LABEL_3;
    }
    sub_25DD5EF10();
    unint64_t v88 = *(void *)(v0 + 88);
    uint64_t v83 = *(void *)(v0 + 96);
    uint64_t v84 = *(void *)(v0 + 80);
    uint64_t v2 = sub_25DD5EBB0();
    uint64_t v7 = *(void *)(v2 - 8);
    uint64_t v8 = swift_task_alloc();
    uint64_t v9 = swift_task_alloc();
    sub_25DD5EDC0();
    sub_25DD5EB80();
    uint64_t v10 = sub_25DD5EC30();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = swift_task_alloc();
    sub_25DD5EC20();
    sub_25DD5EB90();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v13(v9, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_25DD5EBA0();
    *(void *)(v0 + 136) = v14;
    v13(v8, v2);
    swift_task_dealloc();
    uint64_t v15 = sub_25DD5EDA0();
    unint64_t v17 = sub_25DD52F34(v15, v16, v84, v88, *(char **)(v83 + 24), (double *)v83);
    *(void *)(v0 + 144) = v17;
    swift_bridgeObjectRelease();
    if (!v17)
    {
      swift_retain_n();
      unint64_t v70 = sub_25DD5EDE0();
      os_log_type_t v71 = sub_25DD5EF30();
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v72 = swift_slowAlloc();
        uint64_t v73 = swift_slowAlloc();
        uint64_t v90 = v73;
        *(_DWORD *)uint64_t v72 = 136315138;
        uint64_t v74 = sub_25DD5EDA0();
        *(void *)(v72 + 4) = sub_25DD541A8(v74, v75, &v90);
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_25DD4D000, v70, v71, "No consecutive turns after turn %s.", (uint8_t *)v72, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611C4890](v73, -1, -1);
        MEMORY[0x2611C4890](v72, -1, -1);
        swift_release();
      }
      else
      {
        swift_release_n();
      }

      goto LABEL_5;
    }
    uint64_t v2 = v86;
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_25DD5F010();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v19 = v85;
    *(void *)(v0 + 152) = v18;
    if (v18) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_release();
LABEL_5:
    unint64_t v4 = *(void *)(v0 + 128);
    if (v4 == *(void *)(v0 + 104)) {
      goto LABEL_79;
    }
  }
  uint64_t v20 = 0;
  while (1)
  {
    uint64_t v21 = *(void *)(v0 + 144);
    if ((v21 & 0xC000000000000001) != 0)
    {
      uint64_t v22 = MEMORY[0x2611C42A0](v20);
    }
    else
    {
      uint64_t v22 = *(void *)(v21 + 8 * v20 + 32);
      swift_retain();
    }
    *(void *)(v0 + 160) = v22;
    *(void *)(v0 + 168) = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    swift_retain_n();
    if ((sub_25DD5ED70() & 1) == 0) {
      goto LABEL_31;
    }
    if ((sub_25DD5ED70() & 1) == 0) {
      goto LABEL_31;
    }
    sub_25DD5ED20();
    swift_retain_n();
    sub_25DD5ED10();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5760);
    sub_25DD5ED80();
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(v0 + 64);
    if (!v23) {
      goto LABEL_31;
    }
    if (!*(void *)(v23 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_31:
      swift_release_n();
LABEL_32:
      uint64_t v28 = 0;
      char v27 = 1;
      goto LABEL_33;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DD5ED10();
    sub_25DD5ED80();
    swift_bridgeObjectRelease();
    if (!*(void *)v82) {
      goto LABEL_60;
    }
    if (!*(void *)(*(void *)v82 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_60:
      swift_release_n();
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DD5EE40();
    swift_bridgeObjectRelease();
    sub_25DD5EE40();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_25DD5EE50();
    char v26 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release_n();
    char v27 = v26 & 1;
    uint64_t v28 = (v26 & 1) != 0 ? 0 : v24;
LABEL_33:
    *(unsigned char *)(v0 + 208) = v27 & 1;
    *(void *)(v0 + 176) = v28;
    swift_retain_n();
    if (sub_25DD5ED70() & 1) != 0 && (sub_25DD5ED70()) {
      break;
    }
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5748);
    uint64_t v29 = swift_task_alloc();
    sub_25DD5EDB0();
    uint64_t v30 = sub_25DD5EC10();
    uint64_t v31 = *(void *)(v30 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) != 1)
    {
      uint64_t v32 = sub_25DD5EBD0();
      uint64_t v34 = v33;
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
      swift_task_dealloc();
      uint64_t v35 = *(void *)v2;
      if (*(void *)(*(void *)v2 + 16))
      {
        swift_bridgeObjectRetain();
        sub_25DD54810(v32, v34);
        char v37 = v36;
        swift_bridgeObjectRelease();
        if (v37)
        {
LABEL_50:
          char v56 = sub_25DD53770(v19, v32, v34);
          if (*(void *)(v55 + 8))
          {
            uint64_t v57 = v55;
            uint64_t v89 = sub_25DD5EDA0();
            uint64_t v59 = v58;
            uint64_t v60 = sub_25DD5EDA0();
            uint64_t v62 = v61;
            v63 = *(void **)(v57 + 24);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)(v57 + 24) = v63;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v63 = sub_25DD5C1C8(0, v63[2] + 1, 1, v63);
              *(void *)(v57 + 24) = v63;
            }
            unint64_t v66 = v63[2];
            unint64_t v65 = v63[3];
            if (v66 >= v65 >> 1)
            {
              v63 = sub_25DD5C1C8((void *)(v65 > 1), v66 + 1, 1, v63);
              *(void *)(v57 + 24) = v63;
            }
            char v67 = *(unsigned char *)(v0 + 208);
            uint64_t v68 = *(void *)(v0 + 176);
            v63[2] = v66 + 1;
            unint64_t v69 = &v63[8 * v66];
            v69[4] = v89;
            v69[5] = v59;
            v69[6] = v60;
            v69[7] = v62;
            v69[8] = v68;
            *((unsigned char *)v69 + 72) = v67;
            v69[10] = 0;
            *((unsigned char *)v69 + 88) = 1;
            ((void (*)(void *, void))v56)(v85, 0);
            uint64_t v19 = v85;
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v2 = v86;
          }
          else
          {
            ((void (*)(void *, void))v56)(v19, 0);
            swift_release();
            swift_bridgeObjectRelease();
          }
          goto LABEL_17;
        }
        uint64_t v35 = *(void *)v2;
      }
      swift_bridgeObjectRetain_n();
      char v38 = swift_isUniquelyReferenced_nonNull_native();
      void *v87 = v35;
      *(void *)uint64_t v2 = 0x8000000000000000;
      unint64_t v40 = sub_25DD54810(v32, v34);
      uint64_t v41 = *(void *)(v35 + 16);
      BOOL v42 = (v39 & 1) == 0;
      uint64_t v43 = v41 + v42;
      if (__OFADD__(v41, v42)) {
        goto LABEL_75;
      }
      char v44 = v39;
      if (*(void *)(v35 + 24) >= v43)
      {
        if ((v38 & 1) == 0) {
          sub_25DD55184();
        }
      }
      else
      {
        sub_25DD54888(v43, v38);
        unint64_t v45 = sub_25DD54810(v32, v34);
        if ((v44 & 1) != (v46 & 1))
        {
          sub_25DD5F090();
          return;
        }
        unint64_t v40 = v45;
      }
      char v47 = *(void **)(v0 + 56);
      uint64_t v48 = *(void *)(v0 + 136);
      if (v44)
      {
        unint64_t v49 = (uint64_t *)(v47[7] + 32 * v40);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *unint64_t v49 = v32;
        v49[1] = v34;
        v49[2] = v48;
        v49[3] = MEMORY[0x263F8EE78];
      }
      else
      {
        v47[(v40 >> 6) + 8] |= 1 << v40;
        uint64_t v50 = (uint64_t *)(v47[6] + 16 * v40);
        *uint64_t v50 = v32;
        v50[1] = v34;
        BOOL v51 = (uint64_t *)(v47[7] + 32 * v40);
        *BOOL v51 = v32;
        v51[1] = v34;
        v51[2] = v48;
        v51[3] = MEMORY[0x263F8EE78];
        uint64_t v52 = v47[2];
        BOOL v53 = __OFADD__(v52, 1);
        uint64_t v54 = v52 + 1;
        if (v53) {
          goto LABEL_76;
        }
        v47[2] = v54;
        swift_bridgeObjectRetain();
      }
      *(void *)uint64_t v2 = v47;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_50;
    }
    swift_release();
    sub_25DD55C68(v29);
    swift_task_dealloc();
LABEL_17:
    uint64_t v20 = *(void *)(v0 + 168);
    if (v20 == *(void *)(v0 + 152))
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
  }
  unint64_t v76 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v76;
  *unint64_t v76 = v0;
  v76[1] = sub_25DD5150C;
  uint64_t v77 = *(void *)(v0 + 120);
  sub_25DD53844(v77, v22);
}

uint64_t sub_25DD5150C(uint64_t a1, char a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 192) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_25DD5224C;
  }
  else
  {
    *(unsigned char *)(v6 + 209) = a2;
    *(void *)(v6 + 200) = a1;
    uint64_t v7 = sub_25DD51644;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

void sub_25DD51644()
{
  uint64_t v102 = v0;
  unint64_t v1 = (void *)v0;
  v93 = (void *)(v0 + 16);
  v94 = (uint64_t *)(v0 + 48);
  uint64_t v92 = (void *)(v0 + 56);
  uint64_t v90 = v0 + 72;
  uint64_t v2 = *(void *)(v0 + 200);
  char v3 = *(unsigned char *)(v0 + 209);
  swift_release_n();
  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v2;
  }
  uint64_t v5 = v1[24];
  for (char i = *((unsigned char *)v1 + 209) & 1; ; char i = 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5748);
    uint64_t v7 = swift_task_alloc();
    sub_25DD5EDB0();
    uint64_t v8 = sub_25DD5EC10();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      swift_release();
      sub_25DD55C68(v7);
      swift_task_dealloc();
      goto LABEL_30;
    }
    char v99 = i;
    uint64_t v10 = sub_25DD5EBD0();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    swift_task_dealloc();
    uint64_t v13 = *v94;
    if (!*(void *)(*v94 + 16)) {
      break;
    }
    swift_bridgeObjectRetain();
    sub_25DD54810(v10, v12);
    char v15 = v14;
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v13 = *v94;
      break;
    }
LABEL_22:
    uint64_t v34 = sub_25DD53770(v93, v10, v12);
    if (*(void *)(v33 + 8))
    {
      uint64_t v35 = v33;
      uint64_t v36 = sub_25DD5EDA0();
      uint64_t v95 = v37;
      uint64_t v97 = v36;
      uint64_t v91 = sub_25DD5EDA0();
      uint64_t v39 = v38;
      unint64_t v40 = *(void **)(v35 + 24);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v35 + 24) = v40;
      BOOL v42 = v1;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v40 = sub_25DD5C1C8(0, v40[2] + 1, 1, v40);
        *(void *)(v35 + 24) = v40;
      }
      unint64_t v44 = v40[2];
      unint64_t v43 = v40[3];
      unint64_t v45 = v93;
      if (v44 >= v43 >> 1)
      {
        uint64_t v83 = sub_25DD5C1C8((void *)(v43 > 1), v44 + 1, 1, v40);
        unint64_t v45 = v93;
        unint64_t v40 = v83;
        *(void *)(v35 + 24) = v83;
      }
      char v46 = *((unsigned char *)v42 + 208);
      uint64_t v47 = v42[22];
      v40[2] = v44 + 1;
      uint64_t v48 = &v40[8 * v44];
      unint64_t v1 = v42;
      v48[4] = v97;
      v48[5] = v95;
      v48[6] = v91;
      v48[7] = v39;
      v48[8] = v47;
      *((unsigned char *)v48 + 72) = v46;
      v48[10] = v4;
      *((unsigned char *)v48 + 88) = v99 & 1;
      ((void (*)(void *, void))v34)(v45, 0);
    }
    else
    {
      ((void (*)(void *, void))v34)(v93, 0);
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_30:
    uint64_t v49 = v1[21];
    if (v49 == v1[19])
    {
      swift_release();
      swift_bridgeObjectRelease();
      while (1)
      {
        unint64_t v50 = v1[16];
        if (v50 == v1[13])
        {
          swift_bridgeObjectRelease();
          uint64_t v84 = swift_bridgeObjectRetain();
          v85 = sub_25DD55B80(v84);
          swift_bridgeObjectRelease_n();
          uint64_t v86 = (void (*)(void *))v1[1];
          v86(v85);
          return;
        }
        uint64_t v51 = v1[11];
        if ((v51 & 0xC000000000000001) != 0)
        {
          uint64_t v52 = MEMORY[0x2611C42A0](v1[16]);
        }
        else
        {
          if (v50 >= *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_85;
          }
          uint64_t v52 = *(void *)(v51 + 8 * v50 + 32);
          swift_retain();
        }
        v1[15] = v52;
        v1[16] = v50 + 1;
        if (__OFADD__(v50, 1)) {
          break;
        }
        sub_25DD5EF10();
        if (v5)
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          v87 = (void (*)(void))v1[1];
          v87();
          return;
        }
        uint64_t v96 = v1[12];
        uint64_t v98 = v1[10];
        unint64_t v100 = v1[11];
        uint64_t v53 = sub_25DD5EBB0();
        uint64_t v54 = *(void *)(v53 - 8);
        uint64_t v55 = swift_task_alloc();
        uint64_t v56 = swift_task_alloc();
        sub_25DD5EDC0();
        sub_25DD5EB80();
        uint64_t v57 = v1;
        uint64_t v58 = sub_25DD5EC30();
        uint64_t v59 = *(void *)(v58 - 8);
        uint64_t v60 = swift_task_alloc();
        sub_25DD5EC20();
        sub_25DD5EB90();
        uint64_t v61 = v58;
        unint64_t v1 = v57;
        (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v60, v61);
        uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        v62(v56, v53);
        swift_task_dealloc();
        swift_task_dealloc();
        sub_25DD5EBA0();
        v57[17] = v63;
        v62(v55, v53);
        swift_task_dealloc();
        uint64_t v64 = sub_25DD5EDA0();
        unint64_t v66 = sub_25DD52F34(v64, v65, v98, v100, *(char **)(v96 + 24), (double *)v96);
        v57[18] = v66;
        swift_bridgeObjectRelease();
        if (v66)
        {
          if (v66 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v74 = sub_25DD5F010();
            swift_bridgeObjectRelease();
            v57[19] = v74;
            if (v74)
            {
LABEL_49:
              uint64_t v5 = 0;
              uint64_t v49 = 0;
              goto LABEL_50;
            }
          }
          else
          {
            uint64_t v67 = *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10);
            v57[19] = v67;
            if (v67) {
              goto LABEL_49;
            }
          }
          swift_bridgeObjectRelease();
          swift_release();
        }
        else
        {
          swift_retain_n();
          uint64_t v68 = sub_25DD5EDE0();
          os_log_type_t v69 = sub_25DD5EF30();
          if (os_log_type_enabled(v68, v69))
          {
            uint64_t v70 = swift_slowAlloc();
            uint64_t v71 = swift_slowAlloc();
            uint64_t v101 = v71;
            *(_DWORD *)uint64_t v70 = 136315138;
            uint64_t v72 = sub_25DD5EDA0();
            *(void *)(v70 + 4) = sub_25DD541A8(v72, v73, &v101);
            swift_bridgeObjectRelease();
            swift_release_n();
            _os_log_impl(&dword_25DD4D000, v68, v69, "No consecutive turns after turn %s.", (uint8_t *)v70, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611C4890](v71, -1, -1);
            MEMORY[0x2611C4890](v70, -1, -1);
            swift_release();
          }
          else
          {
            swift_release_n();
          }
        }
        uint64_t v5 = 0;
      }
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
      return;
    }
LABEL_50:
    uint64_t v75 = v1[18];
    if ((v75 & 0xC000000000000001) != 0)
    {
      uint64_t v76 = MEMORY[0x2611C42A0](v49);
    }
    else
    {
      uint64_t v76 = *(void *)(v75 + 8 * v49 + 32);
      swift_retain();
    }
    v1[20] = v76;
    v1[21] = v49 + 1;
    if (__OFADD__(v49, 1)) {
      goto LABEL_86;
    }
    swift_retain_n();
    if ((sub_25DD5ED70() & 1) == 0) {
      goto LABEL_63;
    }
    if ((sub_25DD5ED70() & 1) == 0) {
      goto LABEL_63;
    }
    sub_25DD5ED20();
    swift_retain_n();
    sub_25DD5ED10();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5760);
    sub_25DD5ED80();
    swift_bridgeObjectRelease();
    uint64_t v77 = v1[8];
    if (!v77) {
      goto LABEL_63;
    }
    if (!*(void *)(v77 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_63:
      swift_release_n();
LABEL_64:
      uint64_t v82 = 0;
      char v81 = 1;
      goto LABEL_65;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DD5ED10();
    sub_25DD5ED80();
    swift_bridgeObjectRelease();
    if (!*(void *)v90) {
      goto LABEL_71;
    }
    if (!*(void *)(*(void *)v90 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_71:
      swift_release_n();
      swift_bridgeObjectRelease();
      goto LABEL_64;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DD5EE40();
    swift_bridgeObjectRelease();
    sub_25DD5EE40();
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_25DD5EE50();
    char v80 = v79;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release_n();
    char v81 = v80 & 1;
    if (v80) {
      uint64_t v82 = 0;
    }
    else {
      uint64_t v82 = v78;
    }
LABEL_65:
    *((unsigned char *)v1 + 208) = v81 & 1;
    v1[22] = v82;
    swift_retain_n();
    if (sub_25DD5ED70() & 1) != 0 && (sub_25DD5ED70())
    {
      unint64_t v88 = (void *)swift_task_alloc();
      v1[23] = v88;
      *unint64_t v88 = v1;
      v88[1] = sub_25DD5150C;
      uint64_t v89 = v1[15];
      sub_25DD53844(v89, v76);
      return;
    }
    swift_release_n();
    uint64_t v4 = 0;
  }
  swift_bridgeObjectRetain_n();
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v92 = v13;
  uint64_t *v94 = 0x8000000000000000;
  unint64_t v18 = sub_25DD54810(v10, v12);
  uint64_t v19 = *(void *)(v13 + 16);
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20)) {
    goto LABEL_87;
  }
  char v22 = v17;
  if (*(void *)(v13 + 24) >= v21)
  {
    if ((v16 & 1) == 0) {
      sub_25DD55184();
    }
    goto LABEL_17;
  }
  sub_25DD54888(v21, v16);
  unint64_t v23 = sub_25DD54810(v10, v12);
  if ((v22 & 1) == (v24 & 1))
  {
    unint64_t v18 = v23;
LABEL_17:
    char v25 = (void *)v1[7];
    uint64_t v26 = v1[17];
    if (v22)
    {
      char v27 = (uint64_t *)(v25[7] + 32 * v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *char v27 = v10;
      v27[1] = v12;
      v27[2] = v26;
      v27[3] = MEMORY[0x263F8EE78];
    }
    else
    {
      v25[(v18 >> 6) + 8] |= 1 << v18;
      uint64_t v28 = (uint64_t *)(v25[6] + 16 * v18);
      *uint64_t v28 = v10;
      v28[1] = v12;
      uint64_t v29 = (uint64_t *)(v25[7] + 32 * v18);
      *uint64_t v29 = v10;
      v29[1] = v12;
      v29[2] = v26;
      v29[3] = MEMORY[0x263F8EE78];
      uint64_t v30 = v25[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_88;
      }
      v25[2] = v32;
      swift_bridgeObjectRetain();
    }
    uint64_t *v94 = (uint64_t)v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  sub_25DD5F090();
}

void sub_25DD5224C()
{
  v105 = v0;
  unint64_t v1 = v0;
  uint64_t v98 = v0 + 2;
  char v99 = v0 + 6;
  uint64_t v97 = v0 + 7;
  uint64_t v96 = v0 + 9;
  uint64_t v2 = (void *)v0[24];
  swift_release_n();
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_25DD5EDE0();
  os_log_type_t v6 = sub_25DD5EF40();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[24];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v9 + 4) = v12;
    *uint64_t v10 = v12;

    _os_log_impl(&dword_25DD4D000, v5, v6, "Could not get semantic similarity score: %@", (uint8_t *)v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5758);
    swift_arrayDestroy();
    MEMORY[0x2611C4890](v10, -1, -1);
    MEMORY[0x2611C4890](v9, -1, -1);
  }
  else
  {
  }
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5748);
    uint64_t v13 = swift_task_alloc();
    sub_25DD5EDB0();
    uint64_t v14 = sub_25DD5EC10();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    {
      swift_release();
      sub_25DD55C68(v13);
      swift_task_dealloc();
      goto LABEL_29;
    }
    uint64_t v16 = sub_25DD5EBD0();
    uint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    swift_task_dealloc();
    uint64_t v19 = *v99;
    if (!*(void *)(*v99 + 16)) {
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
    sub_25DD54810(v16, v18);
    char v21 = v20;
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      uint64_t v19 = *v99;
LABEL_10:
      swift_bridgeObjectRetain_n();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v97 = v19;
      *char v99 = 0x8000000000000000;
      unint64_t v24 = sub_25DD54810(v16, v18);
      uint64_t v25 = *(void *)(v19 + 16);
      BOOL v26 = (v23 & 1) == 0;
      uint64_t v27 = v25 + v26;
      if (__OFADD__(v25, v26)) {
        goto LABEL_82;
      }
      char v28 = v23;
      if (*(void *)(v19 + 24) >= v27)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_25DD55184();
        }
      }
      else
      {
        sub_25DD54888(v27, isUniquelyReferenced_nonNull_native);
        unint64_t v29 = sub_25DD54810(v16, v18);
        if ((v28 & 1) != (v30 & 1))
        {
          sub_25DD5F090();
          return;
        }
        unint64_t v24 = v29;
      }
      BOOL v31 = (void *)v1[7];
      uint64_t v32 = v1[17];
      uint64_t v33 = MEMORY[0x263F8EE78];
      if (v28)
      {
        uint64_t v34 = (uint64_t *)(v31[7] + 32 * v24);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *uint64_t v34 = v16;
        v34[1] = v18;
        v34[2] = v32;
        v34[3] = v33;
      }
      else
      {
        v31[(v24 >> 6) + 8] |= 1 << v24;
        uint64_t v35 = (uint64_t *)(v31[6] + 16 * v24);
        *uint64_t v35 = v16;
        v35[1] = v18;
        uint64_t v36 = (uint64_t *)(v31[7] + 32 * v24);
        *uint64_t v36 = v16;
        v36[1] = v18;
        v36[2] = v32;
        v36[3] = v33;
        uint64_t v37 = v31[2];
        BOOL v38 = __OFADD__(v37, 1);
        uint64_t v39 = v37 + 1;
        if (v38) {
          goto LABEL_83;
        }
        v31[2] = v39;
        swift_bridgeObjectRetain();
      }
      *char v99 = v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v41 = sub_25DD53770(v98, v16, v18);
    if (*(void *)(v40 + 8))
    {
      uint64_t v42 = v40;
      unint64_t v43 = v1;
      uint64_t v44 = sub_25DD5EDA0();
      uint64_t v102 = v45;
      uint64_t v46 = sub_25DD5EDA0();
      uint64_t v48 = v47;
      uint64_t v49 = *(void **)(v42 + 24);
      char v50 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v42 + 24) = v49;
      if ((v50 & 1) == 0)
      {
        uint64_t v49 = sub_25DD5C1C8(0, v49[2] + 1, 1, v49);
        *(void *)(v42 + 24) = v49;
      }
      unint64_t v52 = v49[2];
      unint64_t v51 = v49[3];
      uint64_t v53 = v98;
      if (v52 >= v51 >> 1)
      {
        uint64_t v90 = sub_25DD5C1C8((void *)(v51 > 1), v52 + 1, 1, v49);
        uint64_t v53 = v98;
        uint64_t v49 = v90;
        *(void *)(v42 + 24) = v90;
      }
      char v54 = *((unsigned char *)v43 + 208);
      uint64_t v55 = v43[22];
      v49[2] = v52 + 1;
      uint64_t v56 = &v49[8 * v52];
      unint64_t v1 = v43;
      v56[4] = v44;
      v56[5] = v102;
      v56[6] = v46;
      v56[7] = v48;
      v56[8] = v55;
      *((unsigned char *)v56 + 72) = v54;
      v56[10] = 0;
      *((unsigned char *)v56 + 88) = 1;
      ((void (*)(void *, void))v41)(v53, 0);
    }
    else
    {
      ((void (*)(void *, void))v41)(v98, 0);
    }
    swift_release();
    swift_bridgeObjectRelease();
LABEL_29:
    uint64_t v57 = v1[21];
    if (v57 == v1[19]) {
      break;
    }
LABEL_48:
    uint64_t v82 = v1[18];
    if ((v82 & 0xC000000000000001) != 0)
    {
      uint64_t v83 = MEMORY[0x2611C42A0](v57);
    }
    else
    {
      uint64_t v83 = *(void *)(v82 + 8 * v57 + 32);
      swift_retain();
    }
    v1[20] = v83;
    v1[21] = v57 + 1;
    if (__OFADD__(v57, 1)) {
      goto LABEL_81;
    }
    swift_retain_n();
    if ((sub_25DD5ED70() & 1) == 0) {
      goto LABEL_61;
    }
    if ((sub_25DD5ED70() & 1) == 0) {
      goto LABEL_61;
    }
    sub_25DD5ED20();
    swift_retain_n();
    sub_25DD5ED10();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5760);
    sub_25DD5ED80();
    swift_bridgeObjectRelease();
    uint64_t v84 = v1[8];
    if (!v84) {
      goto LABEL_61;
    }
    if (!*(void *)(v84 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_61:
      swift_release_n();
LABEL_62:
      uint64_t v89 = 0;
      char v88 = 1;
      goto LABEL_63;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DD5ED10();
    sub_25DD5ED80();
    swift_bridgeObjectRelease();
    if (!*v96) {
      goto LABEL_69;
    }
    if (!*(void *)(*v96 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_69:
      swift_release_n();
      swift_bridgeObjectRelease();
      goto LABEL_62;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_25DD5EE40();
    swift_bridgeObjectRelease();
    sub_25DD5EE40();
    swift_bridgeObjectRelease();
    uint64_t v85 = sub_25DD5EE50();
    char v87 = v86;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release_n();
    char v88 = v87 & 1;
    if (v87) {
      uint64_t v89 = 0;
    }
    else {
      uint64_t v89 = v85;
    }
LABEL_63:
    *((unsigned char *)v1 + 208) = v88 & 1;
    v1[22] = v89;
    swift_retain_n();
    if (sub_25DD5ED70() & 1) != 0 && (sub_25DD5ED70())
    {
      v94 = (void *)swift_task_alloc();
      v1[23] = v94;
      void *v94 = v1;
      v94[1] = sub_25DD5150C;
      uint64_t v95 = v1[15];
      sub_25DD53844(v95, v83);
      return;
    }
    swift_release_n();
  }
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v58 = v1[16];
  if (v58 != v1[13])
  {
    while (1)
    {
      uint64_t v59 = v1[11];
      if ((v59 & 0xC000000000000001) != 0)
      {
        uint64_t v60 = MEMORY[0x2611C42A0](v58);
      }
      else
      {
        if (v58 >= *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_80;
        }
        uint64_t v60 = *(void *)(v59 + 8 * v58 + 32);
        swift_retain();
      }
      v1[15] = v60;
      v1[16] = v58 + 1;
      if (__OFADD__(v58, 1)) {
        break;
      }
      sub_25DD5EF10();
      uint64_t v100 = v1[12];
      uint64_t v101 = v1[10];
      unint64_t v103 = v1[11];
      uint64_t v61 = sub_25DD5EBB0();
      uint64_t v62 = *(void *)(v61 - 8);
      uint64_t v63 = v1;
      uint64_t v64 = swift_task_alloc();
      uint64_t v65 = swift_task_alloc();
      sub_25DD5EDC0();
      sub_25DD5EB80();
      uint64_t v66 = sub_25DD5EC30();
      uint64_t v67 = *(void *)(v66 - 8);
      uint64_t v68 = swift_task_alloc();
      sub_25DD5EC20();
      sub_25DD5EB90();
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v68, v66);
      os_log_type_t v69 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
      v69(v65, v61);
      swift_task_dealloc();
      swift_task_dealloc();
      sub_25DD5EBA0();
      v63[17] = v70;
      v69(v64, v61);
      unint64_t v1 = v63;
      swift_task_dealloc();
      uint64_t v71 = sub_25DD5EDA0();
      unint64_t v73 = sub_25DD52F34(v71, v72, v101, v103, *(char **)(v100 + 24), (double *)v100);
      v63[18] = v73;
      swift_bridgeObjectRelease();
      if (v73)
      {
        if (v73 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v81 = sub_25DD5F010();
          swift_bridgeObjectRelease();
          v63[19] = v81;
          if (v81)
          {
LABEL_47:
            uint64_t v57 = 0;
            goto LABEL_48;
          }
        }
        else
        {
          uint64_t v74 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v63[19] = v74;
          if (v74) {
            goto LABEL_47;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
      }
      else
      {
        swift_retain_n();
        uint64_t v75 = sub_25DD5EDE0();
        os_log_type_t v76 = sub_25DD5EF30();
        if (os_log_type_enabled(v75, v76))
        {
          uint64_t v77 = swift_slowAlloc();
          uint64_t v78 = swift_slowAlloc();
          uint64_t v104 = v78;
          *(_DWORD *)uint64_t v77 = 136315138;
          uint64_t v79 = sub_25DD5EDA0();
          *(void *)(v77 + 4) = sub_25DD541A8(v79, v80, &v104);
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_25DD4D000, v75, v76, "No consecutive turns after turn %s.", (uint8_t *)v77, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611C4890](v78, -1, -1);
          MEMORY[0x2611C4890](v77, -1, -1);
          swift_release();
        }
        else
        {
          swift_release_n();
        }
      }
      unint64_t v58 = v63[16];
      if (v58 == v63[13]) {
        goto LABEL_70;
      }
    }
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
    return;
  }
LABEL_70:
  swift_bridgeObjectRelease();
  uint64_t v91 = swift_bridgeObjectRetain();
  uint64_t v92 = sub_25DD55B80(v91);
  swift_bridgeObjectRelease_n();
  v93 = (void (*)(void *))v1[1];
  v93(v92);
}

uint64_t sub_25DD52F34(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char *a5, double *a6)
{
  unint64_t v9 = a4;
  unint64_t v13 = a4 >> 62;
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25DD5F010();
    swift_bridgeObjectRelease();
    if (!v14) {
      return 0;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v14) {
      return 0;
    }
  }
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v15 = sub_25DD54810(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v17 = *(void *)(*(void *)(a3 + 56) + 8 * v15);
  swift_bridgeObjectRelease();
  if ((v9 & 0xC000000000000001) == 0)
  {
    if ((v17 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v17 < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      os_log_type_t v6 = *(char **)(v9 + 8 * v17 + 32);
      swift_retain();
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_77;
  }
  os_log_type_t v6 = (char *)MEMORY[0x2611C42A0](v17, v9);
LABEL_9:
  if ((sub_25DD5ED70() & 1) == 0)
  {
    swift_release();
    return 0;
  }
  a3 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (v14 < a3)
  {
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25DD5F010();
  }
  else
  {
    uint64_t v18 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v18 < a3) {
    goto LABEL_79;
  }
  if (a3 < 0)
  {
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25DD5F010();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v21 < v14) {
    goto LABEL_81;
  }
  if ((v9 & 0xC000000000000001) != 0 && a3 != v14)
  {
    if (a3 >= (unint64_t)v14)
    {
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }
    sub_25DD5EDD0();
    uint64_t v22 = a3;
    do
    {
      uint64_t v23 = v22 + 1;
      sub_25DD5EF90();
      uint64_t v22 = v23;
    }
    while (v14 != v23);
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    sub_25DD5F020();
    uint64_t v24 = v26;
    a3 = v27;
    unint64_t v25 = v28;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v24 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
    unint64_t v25 = (2 * v14) | 1;
  }
  unint64_t v9 = sub_25DD55FD8(v24, a3, v25);
  swift_unknownObjectRelease();
  a3 = MEMORY[0x263F8EE78];
  unint64_t v70 = MEMORY[0x263F8EE78];
  if (!(v9 >> 62))
  {
    uint64_t result = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_35;
  }
LABEL_82:
  uint64_t result = sub_25DD5F010();
LABEL_35:
  uint64_t v65 = result - 1;
  if (result < 1) {
    goto LABEL_42;
  }
  if (!((unint64_t)a3 >> 62))
  {
    if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) < (uint64_t)a5) {
      goto LABEL_38;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_25DD5F010();
  uint64_t result = swift_bridgeObjectRelease();
  if (v57 >= (uint64_t)a5) {
    goto LABEL_42;
  }
LABEL_38:
  unint64_t v67 = v9 & 0xC000000000000001;
  if ((v9 & 0xC000000000000001) != 0)
  {
LABEL_88:
    MEMORY[0x2611C42A0](0, v9);
    goto LABEL_41;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_41:
    sub_25DD5EDC0();
    double v30 = v29;
    sub_25DD5EDC0();
    double v32 = v31;
    swift_release();
    double v33 = a6[2];
    if (v33 < vabdd_f64(v30, v32)) {
      goto LABEL_42;
    }
    unint64_t v34 = 0;
    uint64_t v68 = sub_25DD5EC10();
    uint64_t v35 = *(void *)(v68 - 8);
    uint64_t v36 = *(void *)(v35 + 64);
    uint64_t v66 = (unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
    uint64_t v60 = v9 & 0xFFFFFFFFFFFFFF8;
    uint64_t v61 = (unint64_t *)(v35 + 32);
    unint64_t v58 = (void (**)(char *, uint64_t))(v35 + 8);
    uint64_t v59 = a5;
    uint64_t v63 = v6;
    uint64_t v64 = v36;
    unint64_t v62 = v9;
    while (1)
    {
      uint64_t v41 = a5;
      os_log_type_t v69 = &v58;
      ((void (*)(void))MEMORY[0x270FA5388])();
      unint64_t v43 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0;
      a5 = (char *)&v58 - v43;
      uint64_t v44 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5748) - 8) + 64);
      ((void (*)(void))MEMORY[0x270FA5388])();
      sub_25DD5EDB0();
      a6 = (double *)*v66;
      uint64_t v45 = v68;
      if ((*v66)((char *)&v58 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v68) == 1)
      {
        sub_25DD55C68((uint64_t)&v58 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0));
        a5 = v41;
        goto LABEL_63;
      }
      unint64_t v9 = *v61;
      uint64_t v46 = ((uint64_t (*)(char *, char *, uint64_t))*v61)((char *)&v58 - v43, (char *)&v58 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0), v45);
      MEMORY[0x270FA5388](v46);
      os_log_type_t v6 = (char *)&v58 - v43;
      if (v67)
      {
        uint64_t v47 = MEMORY[0x2611C42A0](v34, v62);
      }
      else
      {
        if (v34 >= *(void *)(v60 + 16)) {
          goto LABEL_87;
        }
        uint64_t v47 = swift_retain();
      }
      MEMORY[0x270FA5388](v47);
      uint64_t v48 = (char *)&v58 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_25DD5EDB0();
      swift_release();
      uint64_t v49 = v68;
      if (((unsigned int (*)(char *, uint64_t, uint64_t))a6)(v48, 1, v68) == 1) {
        break;
      }
      ((void (*)(char *, char *, uint64_t))v9)(v6, v48, v49);
      if ((sub_25DD5EBF0() & 1) == 0)
      {
        unint64_t v52 = *v58;
        (*v58)(v6, v68);
        v52(a5, v68);
        goto LABEL_58;
      }
      char v50 = (char *)&v58 - v43;
      unint64_t v9 = v62;
      if (v67) {
        uint64_t v51 = MEMORY[0x2611C42A0](v34, v62);
      }
      else {
        uint64_t v51 = swift_retain();
      }
      a5 = v59;
      MEMORY[0x2611C4180](v51);
      if (*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25DD5EED0();
      }
      sub_25DD5EEF0();
      sub_25DD5EEC0();
      a6 = (double *)v58;
      uint64_t v53 = *v58;
      uint64_t v54 = v68;
      (*v58)(v6, v68);
      v53(v50, v54);
LABEL_63:
      os_log_type_t v6 = v63;
      if (v65 == v34)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return v70;
      }
      unint64_t v19 = v70;
      if (v70 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_25DD5F010();
        swift_bridgeObjectRelease();
        if (v56 >= (uint64_t)a5)
        {
LABEL_70:
          swift_bridgeObjectRelease();
          swift_release();
          return v19;
        }
      }
      else if (*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10) >= (uint64_t)a5)
      {
        goto LABEL_70;
      }
      unint64_t v55 = v34 + 1;
      if (v67)
      {
        MEMORY[0x2611C42A0](v55, v9);
      }
      else
      {
        if (v55 >= *(void *)(v60 + 16))
        {
          __break(1u);
          goto LABEL_86;
        }
        swift_retain();
      }
      sub_25DD5EDC0();
      double v38 = v37;
      sub_25DD5EDC0();
      double v40 = v39;
      swift_release();
      ++v34;
      if (v33 < vabdd_f64(v38, v40)) {
        goto LABEL_70;
      }
    }
    (*v58)(a5, v49);
    sub_25DD55C68((uint64_t)v48);
LABEL_58:
    unint64_t v9 = v62;
    a5 = v59;
    goto LABEL_63;
  }
  __break(1u);
  return result;
}

void (*sub_25DD53770(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  os_log_type_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_25DD55770(v6, a2, a3);
  return sub_25DD537F0;
}

void sub_25DD537F0(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_25DD53844(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = type metadata accessor for MADTextEmbedder();
  v3[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DD538DC, 0, 0);
}

uint64_t sub_25DD538DC()
{
  sub_25DD5ED20();
  sub_25DD5ED10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5760);
  sub_25DD5ED80();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[2];
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_25DD5ED10();
      sub_25DD5ED80();
      swift_bridgeObjectRelease();
      uint64_t v2 = v0[3];
      if (v2)
      {
        if (*(void *)(v2 + 16))
        {
          uint64_t v4 = v0[7];
          uint64_t v3 = v0[8];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v5 = sub_25DD5EE40();
          uint64_t v7 = v6;
          swift_bridgeObjectRelease();
          uint64_t v8 = sub_25DD5EE40();
          uint64_t v10 = v9;
          swift_bridgeObjectRelease();
          sub_25DD5EDF0();
          *(void *)(v3 + *(int *)(v4 + 20)) = objc_msgSend(self, sel_service);
          id v11 = (void *)(v3 + *(int *)(v4 + 24));
          *id v11 = 0;
          v11[1] = 0;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5768);
          uint64_t v12 = swift_allocObject();
          v0[9] = v12;
          *(_OWORD *)(v12 + 16) = xmmword_25DD5F670;
          *(void *)(v12 + 32) = v5;
          *(void *)(v12 + 40) = v7;
          *(void *)(v12 + 48) = v8;
          *(void *)(v12 + 56) = v10;
          unint64_t v13 = (void *)swift_task_alloc();
          v0[10] = v13;
          *unint64_t v13 = v0;
          v13[1] = sub_25DD53B9C;
          return MADTextEmbedder.embed(texts:)(v12);
        }
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(void, uint64_t))v0[1];
  return v15(0, 1);
}

uint64_t sub_25DD53B9C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25DD53CBC, 0, 0);
}

void sub_25DD53CBC()
{
  uint64_t v1 = v0[11];
  if (!v1)
  {
    uint64_t v7 = sub_25DD5EDE0();
    os_log_type_t v8 = sub_25DD5EF40();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25DD4D000, v7, v8, "Failed to embed turn utterances", v9, 2u);
      MEMORY[0x2611C4890](v9, -1, -1);
    }
    uint64_t v10 = v0[8];

    sub_25DD55CC8(v10);
    goto LABEL_13;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v2 == 1)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v3 = sub_25DD5ECF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    id v11 = sub_25DD5EDE0();
    os_log_type_t v12 = sub_25DD5EF40();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_25DD4D000, v11, v12, "Failed to compute pairwise cosine similarity between the utterances.", v13, 2u);
      MEMORY[0x2611C4890](v13, -1, -1);
    }
    uint64_t v14 = v0[8];

    sub_25DD55CC8(v14);
    swift_bridgeObjectRelease();
LABEL_13:
    double v6 = 0.0;
    uint64_t v5 = 1;
    goto LABEL_14;
  }
  if (!unk_270ABC208)
  {
LABEL_19:
    __break(1u);
    return;
  }
  double v4 = unk_270ABC218;
  sub_25DD55CC8(v0[8]);
  swift_bridgeObjectRelease();
  uint64_t v5 = 0;
  double v6 = v4;
LABEL_14:
  swift_task_dealloc();
  unint64_t v15 = (void (*)(void, uint64_t))v0[1];
  v15(*(void *)&v6, v5);
}

uint64_t SiriTurnRestatementCalculator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_calendar;
  uint64_t v4 = sub_25DD5EC30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return v0;
}

uint64_t SiriTurnRestatementCalculator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_calendar;
  uint64_t v4 = sub_25DD5EC30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_25DD540BC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25DD540CC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25DD54108(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DD54130(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25DD541A8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25DD5EF50();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25DD541A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DD5427C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DD55710((uint64_t)v12, *a3);
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
      sub_25DD55710((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25DD5427C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25DD5EF60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25DD54438(a5, a6);
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
  uint64_t v8 = sub_25DD5EFB0();
  if (!v8)
  {
    sub_25DD5F000();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25DD5F060();
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

uint64_t sub_25DD54438(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DD544D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25DD546B0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25DD546B0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DD544D0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25DD54648(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25DD5EF80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25DD5F000();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25DD5EE70();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25DD5F060();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25DD5F000();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25DD54648(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5740);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25DD546B0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5740);
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
  uint64_t result = sub_25DD5F060();
  __break(1u);
  return result;
}

unsigned char **sub_25DD54800(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_25DD54810(uint64_t a1, uint64_t a2)
{
  sub_25DD5F0F0();
  sub_25DD5EE60();
  uint64_t v4 = sub_25DD5F110();
  return sub_25DD550A0(a1, a2, v4);
}

uint64_t sub_25DD54888(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5770);
  char v41 = a2;
  uint64_t v6 = sub_25DD5F040();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    double v39 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v38 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_33;
        }
        unint64_t v23 = v39[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_33;
          }
          unint64_t v23 = v39[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v41)
              {
                uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
                if (v37 >= 64) {
                  bzero(v39, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *double v39 = -1 << v37;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v38) {
                  goto LABEL_33;
                }
                unint64_t v23 = v39[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      double v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      double v32 = (uint64_t *)(*(void *)(v5 + 56) + 32 * v21);
      uint64_t v33 = *v32;
      uint64_t v34 = v32[1];
      uint64_t v35 = v32[2];
      uint64_t v36 = v32[3];
      if ((v41 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_25DD5F0F0();
      sub_25DD5EE60();
      uint64_t result = sub_25DD5F110();
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
            goto LABEL_39;
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
      unint64_t v19 = (void *)(*(void *)(v7 + 56) + 32 * v17);
      *unint64_t v19 = v33;
      v19[1] = v34;
      v19[2] = v35;
      v19[3] = v36;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25DD54BBC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5738);
  char v37 = a2;
  uint64_t v6 = sub_25DD5F040();
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
    int64_t v22 = (void *)(v5 + 64);
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
          unint64_t v3 = v34;
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
    double v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25DD5F0F0();
    sub_25DD5EE60();
    uint64_t result = sub_25DD5F110();
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
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_25DD54EC8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25DD5EF70();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25DD5F0F0();
        swift_bridgeObjectRetain();
        sub_25DD5EE60();
        uint64_t v10 = sub_25DD5F110();
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
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
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
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
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

unint64_t sub_25DD550A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25DD5F080() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25DD5F080() & 1) == 0);
    }
  }
  return v6;
}

void *sub_25DD55184()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5770);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25DD5F030();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = (uint64_t *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    uint64_t v25 = v21[3];
    unint64_t v26 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v26 = v19;
    v26[1] = v18;
    BOOL v27 = (void *)(*(void *)(v4 + 56) + v20);
    *BOOL v27 = v22;
    v27[1] = v23;
    v27[2] = v24;
    v27[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v13) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25DD55364()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5738);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25DD5F030();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25DD55514()
{
  return type metadata accessor for SiriTurnRestatementCalculator();
}

uint64_t type metadata accessor for SiriTurnRestatementCalculator()
{
  uint64_t result = qword_26A6C5728;
  if (!qword_26A6C5728) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD55568()
{
  uint64_t result = sub_25DD5EE00();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25DD5EC30();
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

uint64_t method lookup function for SiriTurnRestatementCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriTurnRestatementCalculator);
}

uint64_t dispatch thunk of SiriTurnRestatementCalculator.__allocating_init(logger:bookmarkService:maxSeconds:maxConsecutiveTurns:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
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

uint64_t sub_25DD55710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void (*sub_25DD55770(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_25DD55A44(v6);
  v6[10] = sub_25DD55890(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_25DD5581C;
}

void sub_25DD5581C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  unint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_25DD55890(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x48uLL);
  *a1 = v10;
  v10[5] = a3;
  v10[6] = v4;
  v10[4] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_25DD54810(a2, a3);
  *((unsigned char *)v10 + 64) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[7] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = (uint64_t *)(*(void *)(*v5 + 56) + 32 * v13);
        uint64_t v20 = *v19;
        uint64_t v21 = v19[1];
        uint64_t v22 = v19[2];
        uint64_t v23 = v19[3];
LABEL_12:
        *uint64_t v10 = v20;
        v10[1] = v21;
        v10[2] = v22;
        v10[3] = v23;
        return sub_25DD559F0;
      }
LABEL_11:
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_25DD55184();
      goto LABEL_7;
    }
    sub_25DD54888(v16, a4 & 1);
    unint64_t v24 = sub_25DD54810(a2, a3);
    if ((v17 & 1) == (v25 & 1))
    {
      unint64_t v13 = v24;
      v10[7] = v24;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_25DD5F090();
  __break(1u);
  return result;
}

void sub_25DD559F0(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_25DD55A80(*a1, *((unsigned char *)*a1 + 64), (uint64_t *)(*a1)[6], (*a1)[7], (*a1)[4], (*a1)[5]);
  sub_25DD55D24(*v1, v1[1]);
  free(v1);
}

uint64_t (*sub_25DD55A44(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_25DD55A74;
}

uint64_t sub_25DD55A74(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_25DD55A80(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *result;
  uint64_t v8 = result[1];
  uint64_t v10 = result[2];
  uint64_t v11 = result[3];
  if (v8)
  {
    char v12 = (void *)*a3;
    if (a2)
    {
      unint64_t v13 = (uint64_t *)(v12[7] + 32 * a4);
      *unint64_t v13 = v9;
      v13[1] = v8;
      v13[2] = v10;
      v13[3] = v11;
    }
    else
    {
      v12[(a4 >> 6) + 8] |= 1 << a4;
      uint64_t v14 = (void *)(v12[6] + 16 * a4);
      *uint64_t v14 = a5;
      v14[1] = a6;
      BOOL v15 = (uint64_t *)(v12[7] + 32 * a4);
      *BOOL v15 = v9;
      v15[1] = v8;
      v15[2] = v10;
      v15[3] = v11;
      uint64_t v16 = v12[2];
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      v12[2] = v18;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_25DD54EC8(a4, *a3);
  }
  return (uint64_t *)sub_25DD55D68(v9, v8);
}

void *sub_25DD55B80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5778);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 1;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 5);
  uint64_t v6 = sub_25DD55DAC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25DD55FD0();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_25DD55C68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5748);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DD55CC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MADTextEmbedder();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DD55D24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25DD55D68(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25DD55DAC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v10 = 0;
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v24 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 56) + 32 * v16);
    uint64_t v21 = v20[1];
    uint64_t v22 = v20[2];
    uint64_t v23 = v20[3];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    v11[3] = v23;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 4;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_25DD55FD0()
{
  return swift_release();
}

uint64_t sub_25DD55FD8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v6 = MEMORY[0x263F8EE78];
  int64_t v4 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    uint64_t v5 = a2;
    while (v5 < v4)
    {
      swift_retain();
      if (sub_25DD5ED70())
      {
        sub_25DD5EFC0();
        sub_25DD5EFE0();
        sub_25DD5EFF0();
        uint64_t result = sub_25DD5EFD0();
      }
      else
      {
        uint64_t result = swift_release();
      }
      if (v4 == ++v5) {
        return v6;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t SiriTurnRestatementDataRecord.featurizedConversationData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25DD5ECE0();
  int64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t SiriTurnRestatementDataProvider.__allocating_init(bookmarkService:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  uint64_t v6 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a2, v6);
  *(void *)(v4 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_bookmarkService) = a1;
  return v4;
}

uint64_t SiriTurnRestatementDataProvider.init(bookmarkService:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  uint64_t v6 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a2, v6);
  *(void *)(v2 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_bookmarkService) = a1;
  return v2;
}

uint64_t sub_25DD56230(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_25DD5ECE0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DD562F0, 0, 0);
}

uint64_t sub_25DD562F0()
{
  uint64_t v1 = sub_25DD5EBB0();
  v0[8] = v1;
  v0[9] = *(void *)(v1 - 8);
  v0[10] = swift_task_alloc();
  sub_25DD5ED00();
  uint64_t v2 = sub_25DD5EC30();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = swift_task_alloc();
  sub_25DD5EC20();
  sub_25DD5ECA0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
  swift_task_dealloc();
  v0[11] = objc_msgSend(objc_allocWithZone((Class)sub_25DD5ED40()), sel_init);
  uint64_t v5 = sub_25DD5EC80();
  v0[12] = v5;
  uint64_t v6 = v5;
  unint64_t v9 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F39698] + MEMORY[0x263F39698]);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[13] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25DD56578;
  return v9(v6);
}

uint64_t sub_25DD56578(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void **)(*v2 + 96);
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc();

  if (v1) {
    uint64_t v5 = sub_25DD5689C;
  }
  else {
    uint64_t v5 = sub_25DD566A8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25DD566A8()
{
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_25DD5EDE0();
  os_log_type_t v2 = sub_25DD5EF30();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = v0[14];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_25DD5F010();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[2] = v6;
    sub_25DD5EF50();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DD4D000, v1, v2, "marker: fetched SELF conversations, count=%ld", v5, 0xCu);
    MEMORY[0x2611C4890](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v7 = v0[10];
  uint64_t v8 = (void *)v0[11];
  uint64_t v9 = v0[8];
  uint64_t v10 = v0[9];
  uint64_t v12 = v0[6];
  uint64_t v11 = v0[7];
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[3];
  sub_25DD5ECC0();

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v14, v11, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_25DD5689C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t SiriTurnRestatementDataProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t SiriTurnRestatementDataProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25DD56A5C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25DD56AF8;
  return sub_25DD56230(a1);
}

uint64_t sub_25DD56AF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_25DD56BEC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_25DD5F060();
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

unint64_t sub_25DD56C94()
{
  unint64_t result = qword_26A6C5798;
  if (!qword_26A6C5798)
  {
    type metadata accessor for SiriTurnRestatementDataRecord(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C5798);
  }
  return result;
}

uint64_t type metadata accessor for SiriTurnRestatementDataRecord(uint64_t a1)
{
  return sub_25DD57124(a1, (uint64_t *)&unk_26A6C57A8);
}

uint64_t initializeBufferWithCopyOfBuffer for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for SiriTurnRestatementDataRecord(uint64_t a1)
{
  uint64_t v2 = sub_25DD5ECE0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DD56F80);
}

uint64_t sub_25DD56F80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementDataRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DD57000);
}

uint64_t sub_25DD57000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5ECE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25DD57070()
{
  uint64_t result = sub_25DD5ECE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DD570FC()
{
  return type metadata accessor for SiriTurnRestatementDataProvider(0);
}

uint64_t type metadata accessor for SiriTurnRestatementDataProvider(uint64_t a1)
{
  return sub_25DD57124(a1, (uint64_t *)&unk_26A6C57B8);
}

uint64_t sub_25DD57124(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD5715C()
{
  uint64_t result = sub_25DD5EE00();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriTurnRestatementDataProvider);
}

uint64_t dispatch thunk of SiriTurnRestatementDataProvider.__allocating_init(bookmarkService:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SiriTurnRestatementDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 104) + **(int **)(*(void *)v1 + 104));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25DD56AF8;
  return v6(a1);
}

uint64_t SiriTurnRestatementSELFReporter.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = objc_msgSend(self, sel_sharedLoggerWithPersistenceConfiguration_, 1);
  uint64_t v3 = v2 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  uint64_t v4 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t SiriTurnRestatementSELFReporter.init(logger:)(uint64_t a1)
{
  *(void *)(v1 + 16) = objc_msgSend(self, sel_sharedLoggerWithPersistenceConfiguration_, 1);
  uint64_t v3 = v1 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  uint64_t v4 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t SiriTurnRestatementSELFReporter.report(_:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 80) = v1;
  *(void *)(v2 + 88) = v3;
  return MEMORY[0x270FA2498](sub_25DD5749C, 0, 0);
}

uint64_t sub_25DD5749C()
{
  *(void *)(v0 + 96) = OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  uint64_t v1 = sub_25DD5EDE0();
  os_log_type_t v2 = sub_25DD5EF30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25DD4D000, v1, v2, "Running SiriTurnRestatementSELFReporter", v3, 2u);
    MEMORY[0x2611C4890](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 88);

  uint64_t v5 = *(void *)(v4 + 16);
  *(void *)(v0 + 104) = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(v0 + 88);
    *(unsigned char *)(v0 + 144) = 0;
    *(void *)(v0 + 112) = 0;
    uint64_t v7 = *(void *)(v6 + 16);
    uint64_t v8 = (void *)swift_bridgeObjectRetain();
    if (v7)
    {
      uint64_t v9 = v8[7];
      uint64_t v10 = v8[6];
      uint64_t v11 = v8[5];
      *(void *)(v0 + 16) = v8[4];
      *(void *)(v0 + 24) = v11;
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v12 = sub_25DD580D8((uint64_t *)(v0 + 16));
      *(void *)(v0 + 120) = v12;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_25DD578F8;
      uint64_t v18 = *(void *)(v0 + 80);
      v17[15] = v12;
      v17[16] = v18;
      return MEMORY[0x270FA2498](sub_25DD5872C, 0, 0);
    }
    __break(1u);
  }
  uint64_t v13 = sub_25DD5EDE0();
  os_log_type_t v14 = sub_25DD5EF20();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_25DD4D000, v13, v14, "No restatement scores to be reported", v15, 2u);
    MEMORY[0x2611C4890](v15, -1, -1);
  }

  unint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_25DD578F8()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_25DD57D98;
  }
  else {
    os_log_type_t v2 = sub_25DD57A0C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DD57A0C()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(char **)(v0 + 112);
  os_log_type_t v2 = *(char **)(v0 + 104);

  if (v1 + 1 == v2)
  {
    char v3 = *(unsigned char *)(v0 + 144);
    swift_bridgeObjectRelease();
    if (v3)
    {
LABEL_16:
      sub_25DD586B8();
      swift_allocError();
      *unint64_t v26 = 1;
      swift_willThrow();
      uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    }
    else
    {
      uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    }
    return v4();
  }
  else
  {
    uint64_t v5 = *(void **)(v0 + 136);
    unint64_t v6 = *(void *)(v0 + 112) + 1;
    *(void *)(v0 + 112) = v6;
    uint64_t v7 = *(void *)(v0 + 88);
    if (v6 >= *(void *)(v7 + 16))
    {
LABEL_11:
      __break(1u);
    }
    else
    {
      while (1)
      {
        uint64_t v8 = (void *)(v7 + 32 * v6);
        uint64_t v9 = v8[7];
        uint64_t v10 = v8[6];
        uint64_t v11 = v8[5];
        *(void *)(v0 + 16) = v8[4];
        *(void *)(v0 + 24) = v11;
        *(void *)(v0 + 32) = v10;
        *(void *)(v0 + 40) = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v1 = (char *)sub_25DD580D8((uint64_t *)(v0 + 16));
        *(void *)(v0 + 120) = v1;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!v5) {
          break;
        }
        uint64_t v1 = (char *)(*(void *)(v0 + 80) + *(void *)(v0 + 96));
        id v12 = v5;
        id v13 = v5;
        os_log_type_t v14 = sub_25DD5EDE0();
        os_log_type_t v15 = sub_25DD5EF40();
        BOOL v16 = os_log_type_enabled(v14, v15);
        uint64_t v17 = *(void *)(v0 + 104);
        uint64_t v18 = *(void *)(v0 + 112) + 1;
        if (v16)
        {
          uint64_t v19 = swift_slowAlloc();
          uint64_t v20 = swift_slowAlloc();
          uint64_t v28 = v20;
          *(_DWORD *)uint64_t v19 = 136315138;
          swift_getErrorValue();
          uint64_t v21 = sub_25DD5F0A0();
          uint64_t v1 = (char *)v22;
          *(void *)(v19 + 4) = sub_25DD541A8(v21, v22, &v28);
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_25DD4D000, v14, v15, "Unable to report event: %s", (uint8_t *)v19, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611C4890](v20, -1, -1);
          MEMORY[0x2611C4890](v19, -1, -1);

          if (v18 == v17) {
            goto LABEL_15;
          }
        }
        else
        {

          if (v18 == v17)
          {
LABEL_15:
            swift_bridgeObjectRelease();
            goto LABEL_16;
          }
        }
        uint64_t v5 = 0;
        uint64_t v23 = *(void *)(v0 + 112);
        *(unsigned char *)(v0 + 144) = 1;
        unint64_t v6 = v23 + 1;
        *(void *)(v0 + 112) = v6;
        uint64_t v7 = *(void *)(v0 + 88);
        if (v6 >= *(void *)(v7 + 16)) {
          goto LABEL_11;
        }
      }
    }
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_25DD578F8;
    uint64_t v25 = *(void *)(v0 + 80);
    v24[15] = v1;
    v24[16] = v25;
    return MEMORY[0x270FA2498](sub_25DD5872C, 0, 0);
  }
}

uint64_t sub_25DD57D98()
{
  uint64_t v29 = v0;

  uint64_t v1 = *(void **)(v0 + 136);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_25DD5EDE0();
  os_log_type_t v5 = sub_25DD5EF40();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112) + 1;
  if (v6)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v28 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_25DD5F0A0();
    *(void *)(v9 + 4) = sub_25DD541A8(v11, v12, &v28);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25DD4D000, v4, v5, "Unable to report event: %s", (uint8_t *)v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C4890](v10, -1, -1);
    MEMORY[0x2611C4890](v9, -1, -1);

    if (v8 == v7) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v8 == v7)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      sub_25DD586B8();
      swift_allocError();
      *uint64_t v25 = 1;
      swift_willThrow();
      unint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
      return v26();
    }
  }
  unint64_t v16 = *(void *)(v0 + 112) + 1;
  *(unsigned char *)(v0 + 144) = 1;
  *(void *)(v0 + 112) = v16;
  uint64_t v17 = *(void *)(v0 + 88);
  if (v16 >= *(void *)(v17 + 16))
  {
    __break(1u);
  }
  else
  {
    uint64_t v18 = (void *)(v17 + 32 * v16);
    uint64_t v19 = v18[7];
    uint64_t v20 = v18[6];
    uint64_t v21 = v18[5];
    *(void *)(v0 + 16) = v18[4];
    *(void *)(v0 + 24) = v21;
    *(void *)(v0 + 32) = v20;
    *(void *)(v0 + 40) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v22 = sub_25DD580D8((uint64_t *)(v0 + 16));
    *(void *)(v0 + 120) = v22;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_25DD578F8;
    uint64_t v24 = *(void *)(v0 + 80);
    v23[15] = v22;
    v23[16] = v24;
    id v13 = sub_25DD5872C;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  return MEMORY[0x270FA2498](v13, v14, v15);
}

id sub_25DD580D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E608]), sel_init);
  if (v6)
  {
    v54[0] = v2;
    v54[1] = v3;
    v54[2] = v4;
    v54[3] = v5;
    id v7 = sub_25DD58CE4((uint64_t)v54);
    if (v1)
    {
    }
    else
    {
      unint64_t v12 = v7;
      objc_msgSend(v6, sel_setEventMetadata_, v7);

      id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E628]), sel_init);
      objc_msgSend(v6, sel_setTurnRestatementScoresReported_, v13);

      uint64_t v14 = *(void *)(v5 + 16);
      if (v14)
      {
        uint64_t v42 = 0;
        swift_bridgeObjectRetain();
        uint64_t v15 = 0;
        uint64_t v43 = v5;
        id v44 = v6;
        do
        {
          uint64_t v17 = *(void *)(v5 + v15 + 56);
          uint64_t v51 = *(void *)(v5 + v15 + 48);
          double v18 = *(double *)(v5 + v15 + 64);
          int v52 = *(unsigned __int8 *)(v5 + v15 + 72);
          double v19 = *(double *)(v5 + v15 + 80);
          int v20 = *(unsigned __int8 *)(v5 + v15 + 88);
          id v21 = objc_allocWithZone(MEMORY[0x263F6E620]);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v55 = objc_msgSend(v21, sel_init);
          if (v55)
          {
            uint64_t v53 = v17;
            int v47 = v20;
            uint64_t v49 = v14;
            uint64_t v22 = sub_25DD5EC10();
            uint64_t v46 = &v42;
            uint64_t v23 = *(void *)(v22 - 8);
            uint64_t v24 = *(void *)(v23 + 64);
            MEMORY[0x270FA5388](v22);
            uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5748);
            uint64_t v26 = *(void *)(*(void *)(v25 - 8) + 64);
            MEMORY[0x270FA5388](v25 - 8);
            uint64_t v48 = v27;
            sub_25DD5EBC0();
            char v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
            int v28 = v50((char *)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v22);
            uint64_t v45 = v23;
            if (v28 == 1)
            {
              sub_25DD55C68((uint64_t)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)&v42 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
              id v29 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
              uint64_t v30 = (void *)sub_25DD5EBE0();
              id v31 = objc_msgSend(v29, sel_initWithNSUUID_, v30);

              objc_msgSend(v55, sel_setCurrentTurnId_, v31);
              (*(void (**)(char *, uint64_t))(v23 + 8))((char *)&v42 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
            }
            uint64_t v32 = MEMORY[0x270FA5388](v51);
            uint64_t v33 = (char *)&v42 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
            MEMORY[0x270FA5388](v32);
            uint64_t v34 = (char *)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
            sub_25DD5EBC0();
            if (v50(v34, 1, v22) == 1)
            {
              sub_25DD55C68((uint64_t)v34);
              uint64_t v5 = v43;
              uint64_t v14 = v49;
              id v35 = v55;
            }
            else
            {
              uint64_t v36 = v45;
              (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v33, v34, v22);
              id v37 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
              int64_t v38 = (void *)sub_25DD5EBE0();
              id v39 = objc_msgSend(v37, sel_initWithNSUUID_, v38);

              id v35 = v55;
              objc_msgSend(v55, sel_setNextTurnId_, v39);

              (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v22);
              uint64_t v5 = v43;
              uint64_t v14 = v49;
            }
            char v40 = v47;
            if ((v52 & 1) == 0) {
              objc_msgSend(v35, sel_setUtteranceRestatementScore_, v18);
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v6 = v44;
            if ((v40 & 1) == 0) {
              objc_msgSend(v35, sel_setSemanticSimilarityScore_, v19);
            }
            id v16 = objc_msgSend(v6, sel_turnRestatementScoresReported, v42);
            objc_msgSend(v16, sel_addTurnRestatementScores_, v35);
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          v15 += 64;
          --v14;
        }
        while (v14);
        swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v8 = sub_25DD5EDE0();
    os_log_type_t v9 = sub_25DD5EF40();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_25DD4D000, v8, v9, "Error initiating SELF wrapper", v10, 2u);
      MEMORY[0x2611C4890](v10, -1, -1);
    }

    sub_25DD586B8();
    swift_allocError();
    *uint64_t v11 = 1;
    swift_willThrow();
  }
  return v6;
}

unint64_t sub_25DD586B8()
{
  unint64_t result = qword_26A6C57E0;
  if (!qword_26A6C57E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A6C57E0);
  }
  return result;
}

uint64_t sub_25DD5870C(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return MEMORY[0x270FA2498](sub_25DD5872C, 0, 0);
}

uint64_t sub_25DD5872C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 120), sel_wrapAsAnyEvent);
  *(void *)(v0 + 136) = v1;
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = v0 + 80;
    id v4 = v1;
    uint64_t v5 = sub_25DD5EDE0();
    os_log_type_t v6 = sub_25DD5EF30();
    id v19 = v4;
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)id v7 = 138412290;
      *(void *)(v0 + 80) = v4;
      id v9 = v4;
      sub_25DD5EF50();
      *uint64_t v8 = v2;

      _os_log_impl(&dword_25DD4D000, v5, v6, "FBF Shared reporter: store the event %@ and send to server", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5758);
      swift_arrayDestroy();
      MEMORY[0x2611C4890](v8, -1, -1);
      uint64_t v10 = v7;
      uint64_t v3 = v0 + 80;
      MEMORY[0x2611C4890](v10, -1, -1);
    }
    else
    {
    }
    id v16 = *(void **)(*(void *)(v0 + 128) + 16);
    uint64_t v17 = sub_25DD5EE10();
    *(void *)(v0 + 144) = v17;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_25DD58A5C;
    uint64_t v18 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_25DD58C4C;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v18;
    objc_msgSend(v16, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v19, v17, v3);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    uint64_t v11 = sub_25DD5EDE0();
    os_log_type_t v12 = sub_25DD5EF40();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_25DD4D000, v11, v12, "Couldn't package event in AnyEvent wrapper.", v13, 2u);
      MEMORY[0x2611C4890](v13, -1, -1);
    }

    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_25DD58A5C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    id v2 = sub_25DD58BD4;
  }
  else {
    id v2 = sub_25DD58B6C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DD58B6C()
{
  uint64_t v1 = *(void **)(v0 + 144);

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25DD58BD4()
{
  uint64_t v1 = (void *)v0[18];
  id v2 = (void *)v0[17];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_25DD58C4C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5810);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

id sub_25DD58CE4(uint64_t a1)
{
  double v1 = *(double *)(a1 + 16);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E610]), sel_init);
  if (!v2)
  {
    uint64_t v18 = sub_25DD5EDE0();
    os_log_type_t v19 = sub_25DD5EF40();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_25DD4D000, v18, v19, "Error initiating Event metadata", v20, 2u);
      MEMORY[0x2611C4890](v20, -1, -1);
    }

    sub_25DD586B8();
    swift_allocError();
    *id v21 = 1;
    swift_willThrow();
    return v2;
  }
  uint64_t v3 = sub_25DD5EC10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD5EC00();
  id v7 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
  uint64_t v8 = (void *)sub_25DD5EBE0();
  id v9 = objc_msgSend(v7, sel_initWithNSUUID_, v8);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_msgSend(v2, sel_setOdbatchId_, v9);

  uint64_t v10 = sub_25DD5EBB0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD5EC40();
  sub_25DD5EBA0();
  double v15 = v14;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((~*(void *)&v15 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v15 <= -1.0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v15 >= 1.84467441e19)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!is_mul_ok((unint64_t)v15, 0x3E8uLL))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v2, sel_setEventTimestampInMsSince1970_, 1000 * (unint64_t)v15);
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E780]), sel_init);
  uint64_t v17 = result;
  if (!result)
  {
LABEL_11:
    objc_msgSend(v2, sel_setAggregationInterval_, v17);

    return v2;
  }
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0) {
    goto LABEL_20;
  }
  if (v1 <= -1.0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v1 < 1.84467441e19)
  {
    objc_msgSend(result, sel_setStartTimestampInSecondsSince1970_, (unint64_t)v1);
    objc_msgSend(v17, sel_setNumberOfSeconds_, 86400);
    goto LABEL_11;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t SiriTurnRestatementSELFReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SiriTurnRestatementSELFReporter.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25DD591AC(uint64_t *a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25DD56AF8;
  uint64_t v6 = *a1;
  v5[10] = v4;
  v5[11] = v6;
  return MEMORY[0x270FA2498](sub_25DD5749C, 0, 0);
}

unint64_t sub_25DD59264()
{
  unint64_t result = qword_26A6C57F0;
  if (!qword_26A6C57F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C57F0);
  }
  return result;
}

uint64_t sub_25DD592B8()
{
  return type metadata accessor for SiriTurnRestatementSELFReporter();
}

uint64_t type metadata accessor for SiriTurnRestatementSELFReporter()
{
  uint64_t result = qword_26A6C5800;
  if (!qword_26A6C5800) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD5930C()
{
  uint64_t result = sub_25DD5EE00();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementSELFReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriTurnRestatementSELFReporter);
}

uint64_t dispatch thunk of SiriTurnRestatementSELFReporter.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_25DD593D8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25DD5EF50();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t MADTextEmbedder.init()(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25DD594B0, 0, 0);
}

uint64_t sub_25DD594B0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25DD5EDF0();
  id v2 = objc_msgSend(self, sel_service);
  uint64_t v3 = type metadata accessor for MADTextEmbedder();
  *(void *)(v1 + *(int *)(v3 + 20)) = v2;
  uint64_t v4 = (void *)(v1 + *(int *)(v3 + 24));
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t type metadata accessor for MADTextEmbedder()
{
  uint64_t result = qword_26A6C5860;
  if (!qword_26A6C5860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MADTextEmbedder.embed(texts:)(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_25DD5EE00();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DD5968C, 0, 0);
}

uint64_t sub_25DD5968C()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5828);
  *id v2 = v0;
  v2[1] = sub_25DD5979C;
  return MEMORY[0x270FA2318](v0 + 16, 0, 0, 0x6574286465626D65, 0xED0000293A737478, sub_25DD5A5A4, v1, v3);
}

uint64_t sub_25DD5979C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DD598B4, 0, 0);
}

uint64_t sub_25DD598B4()
{
  uint64_t v1 = v0[2];
  if (!v1)
  {
    (*(void (**)(void, void, void))(v0[6] + 16))(v0[7], v0[4], v0[5]);
    id v2 = sub_25DD5EDE0();
    os_log_type_t v3 = sub_25DD5EF40();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_25DD4D000, v2, v3, "Failed at generating embeddings.", v4, 2u);
      MEMORY[0x2611C4890](v4, -1, -1);
    }
    uint64_t v6 = v0[6];
    uint64_t v5 = v0[7];
    uint64_t v7 = v0[5];

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v1);
}

uint64_t Embedder.embeddingModel.getter()
{
  return sub_25DD5EE20();
}

uint64_t sub_25DD59A30(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (HIDWORD(a1) - a1);
      char v6 = SHIDWORD(a1) < (int)a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_16;
      }
      uint64_t v7 = (int)v7;
LABEL_7:
      if (v7 >= 0) {
        uint64_t v11 = v7;
      }
      else {
        uint64_t v11 = v7 + 1;
      }
      if (v7 <= -2) {
        goto LABEL_20;
      }
      uint64_t v5 = v11 >> 1;
      if (v7 < 2)
      {
LABEL_3:
        sub_25DD5CA7C(a1, a2);
        uint64_t v5 = 0;
        uint64_t v2 = MEMORY[0x263F8EE78];
      }
      else
      {
LABEL_12:
        sub_25DD5CA7C(a1, a2);
        uint64_t v2 = sub_25DD5EEE0();
        *(void *)(v2 + 16) = v5;
      }
      v13[1] = v5;
      uint64_t v14 = 0;
      v13[0] = v2 + 32;
      sub_25DD5C65C(v13, &v14, a1, a2);
      uint64_t v7 = v14;
      char v6 = v5 < v14;
      if (v5 < v14)
      {
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
        if (v6)
        {
          __break(1u);
LABEL_20:
          sub_25DD5F000();
          __break(1u);
        }
        *(void *)(v2 + 16) = v7;
        swift_bridgeObjectRelease();
        __break(1u);
        JUMPOUT(0x25DD59BD0);
      }
      *(void *)(v2 + 16) = v14;
      sub_25DD5CA24(a1, a2);
      return v2;
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      char v6 = (v7 < 0) ^ v10;
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_17;
    case 3uLL:
      goto LABEL_3;
    default:
      uint64_t v5 = (a2 >> 49) & 0x7F;
      if (BYTE6(a2) < 2uLL) {
        goto LABEL_3;
      }
      goto LABEL_12;
  }
}

uint64_t sub_25DD59BE0(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (HIDWORD(a1) - a1);
      char v6 = SHIDWORD(a1) < (int)a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_15;
      }
      uint64_t v7 = (int)v7;
LABEL_7:
      uint64_t v11 = v7 + 3;
      if (v7 >= 0) {
        uint64_t v11 = v7;
      }
      if (v7 <= -4) {
        goto LABEL_19;
      }
      uint64_t v5 = v11 >> 2;
      if (v7 < 4)
      {
LABEL_3:
        sub_25DD5CA7C(a1, a2);
        uint64_t v5 = 0;
        uint64_t v2 = MEMORY[0x263F8EE78];
      }
      else
      {
LABEL_11:
        sub_25DD5CA7C(a1, a2);
        uint64_t v2 = sub_25DD5EEE0();
        *(void *)(v2 + 16) = v5;
      }
      v13[1] = v5;
      uint64_t v14 = 0;
      v13[0] = v2 + 32;
      sub_25DD5C7B4(v13, &v14, a1, a2);
      uint64_t v7 = v14;
      char v6 = v5 < v14;
      if (v5 < v14)
      {
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        if (v6)
        {
          __break(1u);
LABEL_19:
          sub_25DD5F000();
          __break(1u);
        }
        *(void *)(v2 + 16) = v7;
        swift_bridgeObjectRelease();
        __break(1u);
        JUMPOUT(0x25DD59D84);
      }
      *(void *)(v2 + 16) = v14;
      sub_25DD5CA24(a1, a2);
      return v2;
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      char v6 = (v7 < 0) ^ v10;
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_16;
    case 3uLL:
      goto LABEL_3;
    default:
      uint64_t v5 = (a2 >> 50) & 0x3F;
      if (BYTE6(a2) < 4uLL) {
        goto LABEL_3;
      }
      goto LABEL_11;
  }
}

uint64_t MADTextEmbedder.init(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25DD59DB8, 0, 0);
}

uint64_t sub_25DD59DB8()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  sub_25DD5EDF0();
  id v4 = objc_msgSend(self, sel_service);
  uint64_t v5 = type metadata accessor for MADTextEmbedder();
  *(void *)(v3 + *(int *)(v5 + 20)) = v4;
  char v6 = (void *)(v3 + *(int *)(v5 + 24));
  void *v6 = v2;
  v6[1] = v1;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 0, 1, v5);
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t MADTextEmbedder.embed(text:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25DD59EF0, 0, 0);
}

uint64_t sub_25DD59EF0()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5768);
  uint64_t v3 = swift_allocObject();
  v0[5] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_25DD5F860;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_bridgeObjectRetain();
  id v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *id v4 = v0;
  v4[1] = sub_25DD59FCC;
  return MADTextEmbedder.embed(texts:)(v3);
}

uint64_t sub_25DD59FCC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25DD5A0EC, 0, 0);
}

void sub_25DD5A0EC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (v1)
  {
    if (!*(void *)(v1 + 16))
    {
      __break(1u);
      return;
    }
    uint64_t v2 = *(void *)(v1 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void (**)(uint64_t))(v0 + 8);
  v3(v2);
}

void sub_25DD5A178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a3;
  uint64_t v37 = a1;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5878);
  uint64_t v4 = *(void *)(v35 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v35);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MADTextEmbedder();
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54110]), sel_init);
  objc_msgSend(v10, sel_setExtendedContextLength_, 1);
  if (*(void *)(a2 + *(int *)(v7 + 24) + 8))
  {
    uint64_t v11 = sub_25DD5EE30();
    BOOL v13 = v11 == 3425357 && v12 == 0xE300000000000000;
    if (v13 || (uint64_t v14 = v11, v15 = v12, (sub_25DD5F080() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = 4;
    }
    else
    {
      if (v14 == 3490893 && v15 == 0xE300000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v31 = sub_25DD5F080();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0) {
          goto LABEL_9;
        }
      }
      uint64_t v16 = 5;
    }
    objc_msgSend(v10, sel_setVersion_, v16);
  }
LABEL_9:
  id v33 = *(id *)(a2 + *(int *)(v7 + 20));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5880);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_25DD5F870;
  *(void *)(v17 + 32) = v10;
  aBlock[0] = v17;
  sub_25DD5EEC0();
  sub_25DD5C12C(0, &qword_26A6C5888);
  id v18 = v10;
  uint64_t v32 = sub_25DD5EE90();
  swift_bridgeObjectRelease();
  os_log_type_t v19 = (void *)sub_25DD5EE90();
  sub_25DD5BD94(a2, (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = v4;
  id v21 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v22 = v35;
  v21((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v37, v35);
  unint64_t v23 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  unint64_t v24 = (v8 + *(unsigned __int8 *)(v20 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v25 = (v5 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  sub_25DD5BF9C((uint64_t)v9, v26 + v23);
  (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v26 + v24, v6, v22);
  *(void *)(v26 + v25) = v18;
  aBlock[4] = sub_25DD5C000;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25DD5B160;
  aBlock[3] = &block_descriptor_0;
  uint64_t v27 = _Block_copy(aBlock);
  id v28 = v18;
  swift_release();
  id v29 = (void *)v32;
  objc_msgSend(v33, sel_performRequests_text_identifier_completionHandler_, v32, v19, 0, v27);
  _Block_release(v27);
}

void sub_25DD5A5A4(uint64_t a1)
{
  sub_25DD5A178(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_25DD5A5AC(int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v58 = sub_25DD5EE00();
  uint64_t v10 = *(void *)(v58 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v58);
  BOOL v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v53 - v15;
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v53 - v17;
  if (!a2)
  {
    if (a1 == -1 || (id v28 = objc_msgSend(a5, sel_embeddingResults)) == 0)
    {
      uint64_t v41 = v10;
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a3, v58);
      uint64_t v42 = sub_25DD5EDE0();
      os_log_type_t v43 = sub_25DD5EF40();
      if (os_log_type_enabled(v42, v43))
      {
        id v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v44 = 0;
        _os_log_impl(&dword_25DD4D000, v42, v43, "No results returned by MAD service.", v44, 2u);
        MEMORY[0x2611C4890](v44, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v58);
      uint64_t v60 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5878);
      goto LABEL_31;
    }
    id v29 = v28;
    uint64_t v54 = sub_25DD5C12C(0, &qword_26A6C5890);
    unint64_t v30 = sub_25DD5EEA0();

    uint64_t v57 = v10;
    id v55 = v16;
    if (v30 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25DD5F010();
      uint64_t v56 = a4;
      if (v31) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v56 = a4;
      if (v31)
      {
LABEL_8:
        if (v31 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v32 = 0;
        id v33 = (void *)MEMORY[0x263F8EE78];
        uint64_t v34 = a3;
        do
        {
          if ((v30 & 0xC000000000000001) != 0) {
            id v35 = (id)MEMORY[0x2611C42A0](v32, v30);
          }
          else {
            id v35 = *(id *)(v30 + 8 * v32 + 32);
          }
          uint64_t v36 = v35;
          sub_25DD5AC48();
          if (v37)
          {
            uint64_t v38 = v37;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              id v33 = sub_25DD5C2D8(0, v33[2] + 1, 1, v33);
            }
            unint64_t v40 = v33[2];
            unint64_t v39 = v33[3];
            if (v40 >= v39 >> 1) {
              id v33 = sub_25DD5C2D8((void *)(v39 > 1), v40 + 1, 1, v33);
            }
            v33[2] = v40 + 1;
            v33[v40 + 4] = v38;
            a3 = v34;
          }
          ++v32;
        }
        while (v31 != v32);
        goto LABEL_27;
      }
    }
    id v33 = (void *)MEMORY[0x263F8EE78];
LABEL_27:
    swift_bridgeObjectRelease();
    uint64_t v45 = v57;
    uint64_t v46 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v55, a3, v58);
    swift_bridgeObjectRetain();
    int v47 = sub_25DD5EDE0();
    os_log_type_t v48 = sub_25DD5EF30();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v60 = (void *)v50;
      *(_DWORD *)uint64_t v49 = 136315138;
      uint64_t v53 = v49 + 4;
      uint64_t v51 = MEMORY[0x2611C41B0](v30, v54);
      uint64_t v59 = sub_25DD541A8(v51, v52, (uint64_t *)&v60);
      sub_25DD5EF50();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DD4D000, v47, v48, "Found result: %s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611C4890](v50, -1, -1);
      MEMORY[0x2611C4890](v49, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v58);
    uint64_t v60 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5878);
LABEL_31:
    sub_25DD5EF00();
    return;
  }
  uint64_t v57 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v53 - v17, a3, v58);
  id v19 = a2;
  id v20 = a2;
  id v21 = a2;
  uint64_t v22 = sub_25DD5EDE0();
  os_log_type_t v23 = sub_25DD5EF40();
  if (os_log_type_enabled(v22, v23))
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    unint64_t v25 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v24 = 138412290;
    id v26 = a2;
    uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v60 = (void *)v27;
    sub_25DD5EF50();
    *unint64_t v25 = v27;

    _os_log_impl(&dword_25DD4D000, v22, v23, "Failed at calling MAD service: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5758);
    swift_arrayDestroy();
    MEMORY[0x2611C4890](v25, -1, -1);
    MEMORY[0x2611C4890](v24, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v57 + 8))(v18, v58);
  uint64_t v60 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5878);
  sub_25DD5EF00();
}

void sub_25DD5AC48()
{
  uint64_t v1 = sub_25DD5EE00();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DD5EDF0();
  id v5 = objc_msgSend(v0, sel_embedding);
  id v6 = objc_msgSend(v5, sel_data);

  uint64_t v41 = sub_25DD5EB70();
  unint64_t v8 = v7;

  id v9 = objc_msgSend(v0, sel_embedding);
  uint64_t v10 = objc_msgSend(v9, sel_type);

  id v11 = objc_msgSend(v0, sel_embedding);
  unint64_t v12 = (unint64_t)objc_msgSend(v11, sel_count);

  if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_31:
    __break(1u);
    return;
  }
  BOOL v13 = sub_25DD5EDE0();
  os_log_type_t v14 = sub_25DD5EF30();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = v1;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134217984;
    uint64_t v42 = v10;
    sub_25DD5EF50();
    _os_log_impl(&dword_25DD4D000, v13, v14, "Embedding type: %lu", v16, 0xCu);
    uint64_t v17 = v16;
    uint64_t v1 = v15;
    MEMORY[0x2611C4890](v17, -1, -1);
  }

  if (v10 == (void *)2)
  {
    uint64_t v21 = sub_25DD59BE0(v41, v8);
    uint64_t v30 = *(void *)(v21 + 16);
    if (!v30) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  if (v10 == (void *)1)
  {
    uint64_t v18 = sub_25DD59A30(v41, v8);
    int64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      unint64_t v39 = v8;
      uint64_t v40 = v1;
      uint64_t v42 = (void *)MEMORY[0x263F8EE78];
      sub_25DD5C3E8(0, v19, 0);
      uint64_t v20 = 0;
      uint64_t v21 = (uint64_t)v42;
      unint64_t v22 = v42[2];
      do
      {
        _H8 = *(_WORD *)(v18 + 2 * v20 + 32);
        uint64_t v42 = (void *)v21;
        unint64_t v24 = *(void *)(v21 + 24);
        if (v22 >= v24 >> 1)
        {
          sub_25DD5C3E8(v24 > 1, v22 + 1, 1);
          uint64_t v21 = (uint64_t)v42;
        }
        ++v20;
        __asm { FCVT            S0, H8 }
        *(void *)(v21 + 16) = v22 + 1;
        *(_DWORD *)(v21 + 4 * v22++ + 32) = _S0;
      }
      while (v19 != v20);
      swift_bridgeObjectRelease();
      unint64_t v8 = v39;
      uint64_t v1 = v40;
      uint64_t v30 = *(void *)(v21 + 16);
      if (!v30) {
        goto LABEL_29;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v21 = MEMORY[0x263F8EE78];
      uint64_t v30 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (!v30) {
        goto LABEL_29;
      }
    }
LABEL_20:
    if ((~*(_DWORD *)(v21 + 32) & 0x7F800000) == 0)
    {
LABEL_21:
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_25DD5EDE0();
      os_log_type_t v35 = sub_25DD5EF40();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_25DD4D000, v34, v35, "Found embedding with nan values. Return zeros embedding.", v36, 2u);
        MEMORY[0x2611C4890](v36, -1, -1);
      }

      sub_25DD5B458(v12, 0);
      sub_25DD5CA24(v41, v8);
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      return;
    }
    if (v30 != 1)
    {
      uint64_t v37 = 9;
      while (1)
      {
        uint64_t v38 = v37 - 7;
        if (__OFADD__(v37 - 8, 1)) {
          break;
        }
        if ((~*(_DWORD *)(v21 + 4 * v37) & 0x7F800000) == 0) {
          goto LABEL_21;
        }
        ++v37;
        if (v38 == v30) {
          goto LABEL_29;
        }
      }
      __break(1u);
      goto LABEL_31;
    }
LABEL_29:
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    sub_25DD5CA24(v41, v8);
    return;
  }
  uint64_t v31 = sub_25DD5EDE0();
  os_log_type_t v32 = sub_25DD5EF40();
  if (os_log_type_enabled(v31, v32))
  {
    id v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_25DD4D000, v31, v32, "Embedding type not supported.", v33, 2u);
    MEMORY[0x2611C4890](v33, -1, -1);
  }
  sub_25DD5CA24(v41, v8);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_25DD5B160(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_25DD5B1D8()
{
  return sub_25DD5EE20();
}

uint64_t sub_25DD5B210(uint64_t a1, uint64_t a2)
{
  id v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[3] = a2;
  v6[4] = v2;
  v6[1] = sub_25DD5B2C8;
  v6[2] = a1;
  return MEMORY[0x270FA2498](sub_25DD59EF0, 0, 0);
}

uint64_t sub_25DD5B2C8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25DD5B3C4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25DD5CAD4;
  return MADTextEmbedder.embed(texts:)(a1);
}

uint64_t sub_25DD5B458(unint64_t a1, int32x2_t a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25DD5F000();
    __break(1u);
    return result;
  }
  if (!a1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_25DD5EEE0();
  *(void *)(result + 16) = a1;
  uint64_t v4 = (__int32 *)(result + 32);
  if (a1 < 8)
  {
    unint64_t v5 = 0;
    __int32 v6 = a2.i32[0];
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF8;
  v4 += a1 & 0xFFFFFFFFFFFFFFF8;
  __int32 v6 = a2.i32[0];
  int32x4_t v7 = vdupq_lane_s32(a2, 0);
  uint64_t v8 = (int32x4_t *)(result + 48);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

uint64_t dispatch thunk of Embedder.embeddingModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Embedder.embed(text:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_25DD5CAD4;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of Embedder.embed(texts:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  int32x4_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int32x4_t v7 = v3;
  v7[1] = sub_25DD5CAD4;
  return v9(a1, a2, a3);
}

uint64_t *initializeBufferWithCopyOfBuffer for MADTextEmbedder(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_25DD5EE00();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    id v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *id v11 = *v12;
    v11[1] = v13;
    id v14 = v10;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MADTextEmbedder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MADTextEmbedder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = (void *)(a1 + v8);
  id v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  id v13 = v9;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MADTextEmbedder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  id v13 = (void *)(a2 + v11);
  void *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MADTextEmbedder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for MADTextEmbedder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = *(int *)(a3 + 24);
  id v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *id v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MADTextEmbedder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DD5BB60);
}

uint64_t sub_25DD5BB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DD5EE00();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for MADTextEmbedder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DD5BC34);
}

uint64_t sub_25DD5BC34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25DD5EE00();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25DD5BCF0()
{
  uint64_t result = sub_25DD5EE00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DD5BD94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MADTextEmbedder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DD5BDF8()
{
  unint64_t v1 = (int *)(type metadata accessor for MADTextEmbedder() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5878);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v7) & ~v7;
  uint64_t v9 = v2 | v7 | 7;
  unint64_t v10 = (*(void *)(v6 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = v0 + v3;
  uint64_t v12 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return MEMORY[0x270FA0238](v0, v10 + 8, v9);
}

uint64_t sub_25DD5BF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MADTextEmbedder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25DD5C000(int a1, void *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for MADTextEmbedder() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5878) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v10 = *(void **)(v2 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_25DD5A5AC(a1, a2, v2 + v6, v2 + v9, v10);
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

uint64_t sub_25DD5C12C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25DD5C168(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25DD5C1A0(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_25DD5C1C8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C58B0);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25DD5C568(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25DD5C2D8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5898);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25DD5C918(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DD5C3E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25DD5C408(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25DD5C408(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C58A8);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25DD5F060();
  __break(1u);
  return result;
}

uint64_t sub_25DD5C568(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25DD5F060();
  __break(1u);
  return result;
}

uint64_t sub_25DD5C65C(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = *a1;
  uint64_t v6 = a1[1];
  unint64_t v7 = a4 >> 62;
  uint64_t v9 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a3) - a3;
      if (__OFSUB__(HIDWORD(a3), a3)) {
        goto LABEL_30;
      }
      uint64_t v10 = (int)v10;
LABEL_6:
      if (v10 < 1) {
        goto LABEL_18;
      }
      if (v7)
      {
        if (v7 == 1) {
          uint64_t v14 = (int)a3;
        }
        else {
          uint64_t v14 = *(void *)(a3 + 16);
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      if (v6 + 0x4000000000000000 < 0) {
        goto LABEL_27;
      }
      uint64_t v15 = 2 * v6;
      if (v10 < 2 * v6) {
        uint64_t v15 = v10;
      }
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        goto LABEL_28;
      }
      if (v16 < v14) {
        goto LABEL_29;
      }
      if (v14 == v16)
      {
LABEL_18:
        uint64_t v9 = 0;
      }
      else
      {
        if (!result)
        {
LABEL_33:
          __break(1u);
          JUMPOUT(0x25DD5C7A4);
        }
        uint64_t result = sub_25DD5EB60();
        uint64_t v9 = v16 - v14;
        if (__OFSUB__(v16, v14))
        {
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
      }
LABEL_21:
      if (v9 >= 0) {
        uint64_t v17 = v9;
      }
      else {
        uint64_t v17 = v9 + 1;
      }
      BOOL v13 = __OFADD__(*a2, v17 >> 1);
      uint64_t v18 = *a2 + (v17 >> 1);
      if (v13)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      *a2 = v18;
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v11 = *(void *)(a3 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_31;
    case 3uLL:
      goto LABEL_21;
    default:
      uint64_t v10 = BYTE6(a4);
      goto LABEL_6;
  }
}

uint64_t sub_25DD5C7B4(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = *a1;
  uint64_t v6 = a1[1];
  unint64_t v7 = a4 >> 62;
  uint64_t v9 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a3) - a3;
      if (__OFSUB__(HIDWORD(a3), a3)) {
        goto LABEL_27;
      }
      uint64_t v10 = (int)v10;
LABEL_6:
      if (v10 < 1) {
        goto LABEL_18;
      }
      if (v7)
      {
        if (v7 == 1) {
          uint64_t v14 = (int)a3;
        }
        else {
          uint64_t v14 = *(void *)(a3 + 16);
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      if ((unint64_t)(v6 - 0x2000000000000000) >> 62 != 3) {
        goto LABEL_24;
      }
      uint64_t v15 = 4 * v6;
      if (v10 < 4 * v6) {
        uint64_t v15 = v10;
      }
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        goto LABEL_25;
      }
      if (v16 < v14) {
        goto LABEL_26;
      }
      if (v14 == v16)
      {
LABEL_18:
        uint64_t v9 = 0;
      }
      else
      {
        if (!result)
        {
LABEL_30:
          __break(1u);
          JUMPOUT(0x25DD5C908);
        }
        uint64_t result = sub_25DD5EB60();
        uint64_t v9 = v16 - v14;
        if (__OFSUB__(v16, v14))
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
      }
LABEL_21:
      if (__OFADD__(*a2, v9 / 4))
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
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      *a2 += v9 / 4;
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v11 = *(void *)(a3 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_28;
    case 3uLL:
      goto LABEL_21;
    default:
      uint64_t v10 = BYTE6(a4);
      goto LABEL_6;
  }
}

uint64_t sub_25DD5C918(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C58A0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25DD5F060();
  __break(1u);
  return result;
}

uint64_t sub_25DD5CA24(uint64_t a1, unint64_t a2)
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

uint64_t sub_25DD5CA7C(uint64_t a1, unint64_t a2)
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

const char *SiriTurnRestatementFeatureFlags.domain.getter()
{
  return "SiriTurnRestatement";
}

const char *SiriTurnRestatementFeatureFlags.feature.getter()
{
  return "runOnAllPlatforms";
}

uint64_t static SiriTurnRestatementFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriTurnRestatementFeatureFlags.hash(into:)()
{
  return sub_25DD5F100();
}

uint64_t SiriTurnRestatementFeatureFlags.hashValue.getter()
{
  return sub_25DD5F110();
}

uint64_t sub_25DD5CB74()
{
  return 1;
}

uint64_t sub_25DD5CB7C()
{
  return sub_25DD5F110();
}

uint64_t sub_25DD5CBC0()
{
  return sub_25DD5F100();
}

uint64_t sub_25DD5CBE8()
{
  return sub_25DD5F110();
}

unint64_t sub_25DD5CC2C()
{
  unint64_t result = qword_26A6C58B8;
  if (!qword_26A6C58B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C58B8);
  }
  return result;
}

const char *sub_25DD5CC80()
{
  return "SiriTurnRestatement";
}

const char *sub_25DD5CC94()
{
  return "runOnAllPlatforms";
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriTurnRestatementFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25DD5CD9CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25DD5CDC4()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementFeatureFlags()
{
  return &type metadata for SiriTurnRestatementFeatureFlags;
}

uint64_t TurnRestatementReportBatch.restatementScores.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TurnRestatementReportBatch.restatementScores.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TurnRestatementReportBatch.restatementScores.modify())()
{
  return nullsub_1;
}

uint64_t SiriTurnRestatementResult.restatementReportBatches.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTurnRestatementResult.restatementReportBatches.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SiriTurnRestatementResult.restatementReportBatches.modify())()
{
  return nullsub_1;
}

uint64_t SiriTurnRestatementResult.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTurnRestatementResult.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25DD5CE98()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_25DD5CEA0()
{
  return swift_bridgeObjectRetain();
}

uint64_t initializeWithCopy for TurnRestatementScores(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TurnRestatementScores(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v5;
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TurnRestatementScores(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for TurnRestatementScores(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TurnRestatementScores(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TurnRestatementScores()
{
  return &type metadata for TurnRestatementScores;
}

uint64_t initializeBufferWithCopyOfBuffer for TurnRestatementReportBatch(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s19SiriTurnRestatement21TurnRestatementScoresVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TurnRestatementReportBatch(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TurnRestatementReportBatch(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for TurnRestatementReportBatch(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TurnRestatementReportBatch(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TurnRestatementReportBatch(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TurnRestatementReportBatch()
{
  return &type metadata for TurnRestatementReportBatch;
}

uint64_t destroy for SiriTurnRestatementResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s19SiriTurnRestatement25SiriTurnRestatementResultVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriTurnRestatementResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriTurnRestatementResult(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTurnRestatementResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementResult()
{
  return &type metadata for SiriTurnRestatementResult;
}

BOOL static SiriTurnRestatementError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SiriTurnRestatementError.hash(into:)()
{
  return sub_25DD5F100();
}

uint64_t SiriTurnRestatementError.hashValue.getter()
{
  return sub_25DD5F110();
}

BOOL sub_25DD5D578(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25DD5D590()
{
  return sub_25DD5F110();
}

uint64_t sub_25DD5D5D8()
{
  return sub_25DD5F100();
}

uint64_t sub_25DD5D604()
{
  return sub_25DD5F110();
}

uint64_t SiriTurnRestatementPlugin.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SiriTurnRestatementPlugin.init()();
  return v0;
}

uint64_t SiriTurnRestatementPlugin.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25DD5EE00();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v32 - v7;
  uint64_t v9 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_logger;
  sub_25DD5EDF0();
  id v10 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v11 = (void *)sub_25DD5EE10();
  id v12 = objc_msgSend(v10, sel_initWithSuiteName_, v11);

  if (v12)
  {
    uint64_t v13 = sub_25DD5ED60();
    swift_allocObject();
    id v33 = v12;
    uint64_t v14 = sub_25DD5ED50();
    uint64_t v35 = v13;
    uint64_t v36 = MEMORY[0x263F396C0];
    uint64_t v34 = v14;
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v15(v8, v9, v2);
    sub_25DD5ECB0();
    swift_allocObject();
    uint64_t v16 = v37;
    uint64_t v17 = sub_25DD5EC90();
    if (!v16)
    {
      uint64_t v24 = v17;
      v15(v6, v9, v2);
      type metadata accessor for SiriTurnRestatementDataProvider(0);
      uint64_t v25 = swift_allocObject();
      v32[1] = 0;
      uint64_t v26 = v25;
      uint64_t v37 = *(void (**)(void, void, void))(v3 + 32);
      v37(v25 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_logger, v6, v2);
      *(void *)(v26 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementDataProvider_bookmarkService) = v24;
      *(void *)(v1 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_dataProvider) = v26;
      v15(v6, v9, v2);
      type metadata accessor for SiriTurnRestatementCalculator();
      uint64_t v27 = swift_allocObject();
      swift_retain_n();
      sub_25DD5EC20();
      v37(v27 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_logger, v6, v2);
      *(void *)(v27 + OBJC_IVAR____TtC19SiriTurnRestatement29SiriTurnRestatementCalculator_bookmarkService) = v24;
      *(void *)(v27 + 16) = 0x404E000000000000;
      *(void *)(v27 + 24) = 10;
      *(void *)(v1 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_calculator) = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C5880);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_25DD5F870;
      v15(v6, v9, v2);
      type metadata accessor for SiriTurnRestatementSELFReporter();
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = objc_msgSend(self, sel_sharedLoggerWithPersistenceConfiguration_, 1);
      v37(v29 + OBJC_IVAR____TtC19SiriTurnRestatement31SiriTurnRestatementSELFReporter_logger, v6, v2);
      *(void *)(v28 + 32) = v29;
      uint64_t v34 = v28;
      sub_25DD5EEC0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C58D8);
      swift_allocObject();
      uint64_t v34 = sub_25DD5EC60();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C58E0);
      swift_allocObject();
      uint64_t v30 = sub_25DD5EC70();

      *(void *)(v1 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_reporter) = v30;
      return v1;
    }

    uint64_t v18 = v2;
  }
  else
  {
    uint64_t v19 = v2;
    uint64_t v20 = sub_25DD5EDE0();
    os_log_type_t v21 = sub_25DD5EF40();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl(&dword_25DD4D000, v20, v21, "Can't get user defaults initialized", v22, 2u);
      MEMORY[0x2611C4890](v22, -1, -1);
    }

    sub_25DD586B8();
    swift_allocError();
    *os_log_type_t v23 = 0;
    swift_willThrow();
    uint64_t v18 = v19;
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v9, v18);
  type metadata accessor for SiriTurnRestatementPlugin();
  swift_deallocPartialClassInstance();
  return v1;
}

uint64_t type metadata accessor for SiriTurnRestatementPlugin()
{
  uint64_t result = qword_26A6C5940;
  if (!qword_26A6C5940) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DD5DC40(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25DD5DC60, 0, 0);
}

uint64_t sub_25DD5DC60()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_25DD5DD04;
  uint64_t v2 = *(void *)(v0 + 16);
  return sub_25DD56230(v2);
}

uint64_t sub_25DD5DD04()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DD5DDF8(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25DD5DE1C, 0, 0);
}

uint64_t sub_25DD5DE1C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_25DD5DEC4;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  return SiriTurnRestatementCalculator.doWork(_:)(v2, v3);
}

uint64_t sub_25DD5DEC4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DD5DFB8(uint64_t a1)
{
  *(void *)(v2 + 40) = v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(void *)(v2 + 64) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_25DD5DFE8, 0, 0);
}

uint64_t sub_25DD5DFE8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  *(void *)(v0 + 32) = v1;
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F395D8] + MEMORY[0x263F395D8]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25DD5E0B4;
  return v4(v0 + 16);
}

uint64_t sub_25DD5E0B4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25DD5E1E8, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25DD5E1E8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriTurnRestatementPlugin.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriTurnRestatementPlugin.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19SiriTurnRestatement25SiriTurnRestatementPlugin_logger;
  uint64_t v2 = sub_25DD5EE00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25DD5E364(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_25DD5DC60, 0, 0);
}

uint64_t sub_25DD5E388(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_25DD5DE1C, 0, 0);
}

uint64_t sub_25DD5E3B0(uint64_t a1)
{
  *(void *)(v2 + 40) = *v1;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)a1;
  *(void *)(v2 + 64) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_25DD5DFE8, 0, 0);
}

unint64_t sub_25DD5E3E8()
{
  unint64_t result = qword_26A6C5908;
  if (!qword_26A6C5908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C5908);
  }
  return result;
}

uint64_t sub_25DD5E43C()
{
  return sub_25DD5E55C(&qword_26A6C5910, (void (*)(uint64_t))type metadata accessor for SiriTurnRestatementPlugin);
}

uint64_t sub_25DD5E484()
{
  return sub_25DD5E55C(&qword_26A6C5918, (void (*)(uint64_t))type metadata accessor for SiriTurnRestatementPlugin);
}

uint64_t sub_25DD5E4CC()
{
  return sub_25DD5E55C(qword_26A6C5920, (void (*)(uint64_t))type metadata accessor for SiriTurnRestatementPlugin);
}

uint64_t sub_25DD5E514()
{
  return sub_25DD5E55C((unint64_t *)&qword_26A6C5798, (void (*)(uint64_t))type metadata accessor for SiriTurnRestatementDataRecord);
}

uint64_t sub_25DD5E55C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTurnRestatementError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriTurnRestatementError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DD5E70CLL);
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

uint64_t sub_25DD5E734(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DD5E73C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTurnRestatementError()
{
  return &type metadata for SiriTurnRestatementError;
}

uint64_t sub_25DD5E758()
{
  return type metadata accessor for SiriTurnRestatementPlugin();
}

uint64_t sub_25DD5E760()
{
  uint64_t result = sub_25DD5EE00();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriTurnRestatementPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriTurnRestatementPlugin);
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.loadData()(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_25DD5EB5C;
  return v6(a1);
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.doWork(_:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_25DD56AF8;
  return v8(a1, a2);
}

uint64_t dispatch thunk of SiriTurnRestatementPlugin.report(_:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_25DD5EB5C;
  return v6(a1);
}

uint64_t sub_25DD5EB60()
{
  return MEMORY[0x270EF0110]();
}

uint64_t sub_25DD5EB70()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_25DD5EB80()
{
  return MEMORY[0x270EF02B8]();
}

uint64_t sub_25DD5EB90()
{
  return MEMORY[0x270F25420]();
}

uint64_t sub_25DD5EBA0()
{
  return MEMORY[0x270EF0B00]();
}

uint64_t sub_25DD5EBB0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_25DD5EBC0()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_25DD5EBD0()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_25DD5EBE0()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_25DD5EBF0()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_25DD5EC00()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_25DD5EC10()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_25DD5EC20()
{
  return MEMORY[0x270F25458]();
}

uint64_t sub_25DD5EC30()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_25DD5EC40()
{
  return MEMORY[0x270F25480]();
}

uint64_t sub_25DD5EC50()
{
  return MEMORY[0x270F25490]();
}

uint64_t sub_25DD5EC60()
{
  return MEMORY[0x270F254D0]();
}

uint64_t sub_25DD5EC70()
{
  return MEMORY[0x270F254F0]();
}

uint64_t sub_25DD5EC80()
{
  return MEMORY[0x270F25538]();
}

uint64_t sub_25DD5EC90()
{
  return MEMORY[0x270F25550]();
}

uint64_t sub_25DD5ECA0()
{
  return MEMORY[0x270F25560]();
}

uint64_t sub_25DD5ECB0()
{
  return MEMORY[0x270F25578]();
}

uint64_t sub_25DD5ECC0()
{
  return MEMORY[0x270F25590]();
}

uint64_t sub_25DD5ECD0()
{
  return MEMORY[0x270F25598]();
}

uint64_t sub_25DD5ECE0()
{
  return MEMORY[0x270F255A0]();
}

uint64_t sub_25DD5ECF0()
{
  return MEMORY[0x270F87500]();
}

uint64_t sub_25DD5ED00()
{
  return MEMORY[0x270F25638]();
}

uint64_t sub_25DD5ED10()
{
  return MEMORY[0x270F256A0]();
}

uint64_t sub_25DD5ED20()
{
  return MEMORY[0x270F256A8]();
}

uint64_t sub_25DD5ED30()
{
  return MEMORY[0x270F257F8]();
}

uint64_t sub_25DD5ED40()
{
  return MEMORY[0x270F25800]();
}

uint64_t sub_25DD5ED50()
{
  return MEMORY[0x270F25810]();
}

uint64_t sub_25DD5ED60()
{
  return MEMORY[0x270F25828]();
}

uint64_t sub_25DD5ED70()
{
  return MEMORY[0x270F25850]();
}

uint64_t sub_25DD5ED80()
{
  return MEMORY[0x270F25858]();
}

uint64_t sub_25DD5ED90()
{
  return MEMORY[0x270F25860]();
}

uint64_t sub_25DD5EDA0()
{
  return MEMORY[0x270F25868]();
}

uint64_t sub_25DD5EDB0()
{
  return MEMORY[0x270F25870]();
}

uint64_t sub_25DD5EDC0()
{
  return MEMORY[0x270F25878]();
}

uint64_t sub_25DD5EDD0()
{
  return MEMORY[0x270F25880]();
}

uint64_t sub_25DD5EDE0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DD5EDF0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25DD5EE00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DD5EE10()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_25DD5EE20()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DD5EE30()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_25DD5EE40()
{
  return MEMORY[0x270F25940]();
}

uint64_t sub_25DD5EE50()
{
  return MEMORY[0x270F25948]();
}

uint64_t sub_25DD5EE60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25DD5EE70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DD5EE80()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25DD5EE90()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_25DD5EEA0()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_25DD5EEB0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25DD5EEC0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25DD5EED0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25DD5EEE0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25DD5EEF0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25DD5EF00()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25DD5EF10()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25DD5EF20()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25DD5EF30()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DD5EF40()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DD5EF50()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DD5EF60()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DD5EF70()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25DD5EF80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DD5EF90()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_25DD5EFA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25DD5EFB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DD5EFC0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25DD5EFD0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25DD5EFE0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25DD5EFF0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25DD5F000()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DD5F010()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25DD5F020()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_25DD5F030()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25DD5F040()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25DD5F050()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25DD5F060()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DD5F080()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DD5F090()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25DD5F0A0()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_25DD5F0B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25DD5F0C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25DD5F0D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25DD5F0E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25DD5F0F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DD5F100()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25DD5F110()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}