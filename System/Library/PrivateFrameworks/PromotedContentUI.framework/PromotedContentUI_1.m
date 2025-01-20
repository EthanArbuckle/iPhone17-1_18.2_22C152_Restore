uint64_t (*sub_1B5D8529C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1B5D852F0())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B5D85344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_1B5D86A40(a1, a2);
  objc_msgSend(*(id *)(v4 + 56), sel_lock);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v4 + 32);
  if (!*(void *)(v10 + 16)) {
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_1B5CE76AC(a1, a2);
  if ((v12 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v13 + 16)) {
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1B5CE76AC(a3, a4);
  if ((v15 & 1) == 0)
  {
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_11:
  objc_msgSend(*(id *)(v5 + 56), sel_unlock);
  return v16;
}

id sub_1B5D85490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v8 = v7;
  sub_1B5D86A40(a2, a3);
  objc_msgSend(*(id *)(v7 + 56), sel_lock);
  unint64_t v14 = (uint64_t *)(v7 + 40);
  swift_beginAccess();
  uint64_t v15 = *(void *)(*(void *)(v7 + 40) + 16);
  swift_bridgeObjectRetain();
  if (v15)
  {
    swift_bridgeObjectRetain();
    sub_1B5CE76AC(a2, a3);
    if (v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v17 = sub_1B5D45D00(MEMORY[0x1E4FBC860]);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v76[0] = *v14;
  *unint64_t v14 = 0x8000000000000000;
  sub_1B5DB2F44(v17, a2, a3, isUniquelyReferenced_nonNull_native);
  *unint64_t v14 = v76[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_6:
  v19 = (void *)(v7 + 32);
  swift_beginAccess();
  uint64_t v20 = *(void *)(*(void *)(v7 + 32) + 16);
  swift_bridgeObjectRetain();
  if (!v20)
  {
LABEL_10:
    unint64_t v22 = sub_1B5D45D0C(MEMORY[0x1E4FBC860]);
    swift_beginAccess();
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    v76[0] = *v19;
    void *v19 = 0x8000000000000000;
    sub_1B5DB2D98(v22, a2, a3, v23);
    void *v19 = v76[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  sub_1B5CE76AC(a2, a3);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_11:
  uint64_t v73 = a5;
  if (a7 && a1)
  {
    unint64_t v70 = a7;
    os_log_type_t v24 = sub_1B5DBAD78();
    sub_1B5CEE190();
    v25 = sub_1B5DBB018();
    if (os_log_type_enabled(v25, v24))
    {
      swift_retain_n();
      v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      v77[0] = v69;
      *(_DWORD *)v26 = 136380675;
      uint64_t v27 = a1;
      uint64_t v28 = *(void *)(a1 + 16);
      if (v28)
      {
        objc_msgSend(*(id *)(v28 + OBJC_IVAR___APPCMetricsView_promotedContent), sel_adType);
        uint64_t v29 = sub_1B5DB9F38();
        unint64_t v31 = v30;
      }
      else
      {
        unint64_t v31 = 0xE700000000000000;
        uint64_t v29 = 0x6E776F6E6B6E75;
      }
      v76[0] = sub_1B5CEE4B4(v29, v31, v77);
      sub_1B5DBB058();
      swift_release_n();
      a1 = v27;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B5CE2000, v25, v24, "[Diagnostic] updating diagnostic. type of ad: %{private}s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v69, -1, -1);
      MEMORY[0x1BA9AC560](v26, -1, -1);

      uint64_t v32 = a6;
      a5 = v73;
      unint64_t v33 = v70;
    }
    else
    {

      uint64_t v32 = a6;
      unint64_t v33 = v70;
    }
    sub_1B5D80FA8(a4, a5, v32, v33);
  }
  uint64_t v34 = *v14;
  if (!*(void *)(*v14 + 16)) {
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v35 = sub_1B5CE76AC(a2, a3);
  if ((v36 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  uint64_t v37 = *(void *)(*(void *)(v34 + 56) + 8 * v35);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v37 + 16))
  {
LABEL_31:
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  sub_1B5CE76AC(a4, a5);
  char v39 = v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v39 & 1) == 0)
  {
LABEL_32:
    sub_1B5DBADA8();
    sub_1B5CEE190();
    v55 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_1B5DBE1F0;
    v77[0] = a1;
    sub_1B5CECC98(&qword_1EB847E50);
    uint64_t v57 = sub_1B5DBB028();
    uint64_t v58 = a1;
    uint64_t v60 = v59;
    uint64_t v61 = MEMORY[0x1E4FBB1A0];
    *(void *)(v56 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v62 = sub_1B5CFD41C();
    *(void *)(v56 + 32) = v57;
    *(void *)(v56 + 40) = v60;
    *(void *)(v56 + 96) = v61;
    *(void *)(v56 + 104) = v62;
    *(void *)(v56 + 64) = v62;
    *(void *)(v56 + 72) = a2;
    *(void *)(v56 + 80) = a3;
    *(void *)(v56 + 136) = v61;
    *(void *)(v56 + 144) = v62;
    *(void *)(v56 + 112) = a4;
    *(void *)(v56 + 120) = v73;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v63 = sub_1B5D8529C();
    v65 = sub_1B5D84D14(v76, a2, a3);
    if (*v64)
    {
      v66 = v64;
      if (v58)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        char v67 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v75 = *v66;
        uint64_t *v66 = 0x8000000000000000;
        sub_1B5DB2D78(v58, a4, v73, v67);
        uint64_t *v66 = v75;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_1B5DB5874(a4, v73);
        swift_bridgeObjectRelease();
        swift_release();
      }
    }
    ((void (*)(void *, void))v65)(v76, 0);
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t *, void))v63)(v77, 0);
    return objc_msgSend(*(id *)(v8 + 56), sel_unlock);
  }
  sub_1B5DBADA8();
  sub_1B5CEE190();
  v40 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v41 = swift_allocObject();
  uint64_t v42 = a1;
  v43 = (void *)v41;
  *(_OWORD *)(v41 + 16) = xmmword_1B5DBE1F0;
  uint64_t v71 = v42;
  v77[0] = v42;
  sub_1B5CECC98(&qword_1EB847E50);
  uint64_t v44 = sub_1B5DBB028();
  uint64_t v46 = v45;
  uint64_t v47 = MEMORY[0x1E4FBB1A0];
  v43[7] = MEMORY[0x1E4FBB1A0];
  unint64_t v48 = sub_1B5CFD41C();
  v43[4] = v44;
  v43[5] = v46;
  v43[12] = v47;
  v43[13] = v48;
  v43[8] = v48;
  v43[9] = a2;
  v43[10] = a3;
  v43[17] = v47;
  v43[18] = v48;
  v43[14] = a4;
  v43[15] = v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  uint64_t v49 = *v14;
  if (*(void *)(*v14 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v50 = sub_1B5CE76AC(a2, a3);
    if ((v51 & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v52 = *(void *)(*(void *)(v49 + 56) + 8 * v50);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(void *)(v52 + 16))
    {
      swift_bridgeObjectRelease();
      return objc_msgSend(*(id *)(v8 + 56), sel_unlock);
    }
    swift_bridgeObjectRetain();
    sub_1B5CE76AC(a4, v73);
    if (v53)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v71) {
        id v54 = *(id *)(v71 + 16);
      }
      else {
        id v54 = 0;
      }
      swift_unknownObjectWeakAssign();
      swift_release();
    }
    else
    {
LABEL_39:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return objc_msgSend(*(id *)(v8 + 56), sel_unlock);
}

void *sub_1B5D85D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_1B5D86A40(a1, a2);
  objc_msgSend(*(id *)(v4 + 56), sel_lock);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v4 + 32);
  if (!*(void *)(v10 + 16))
  {
LABEL_11:
    swift_beginAccess();
    uint64_t v19 = *(void *)(v5 + 40);
    if (!*(void *)(v19 + 16))
    {
LABEL_20:
      unint64_t v17 = 0;
      goto LABEL_21;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_1B5CE76AC(a1, a2);
    if (v21)
    {
      uint64_t v22 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*(void *)(v22 + 16)) {
        goto LABEL_19;
      }
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_1B5CE76AC(a3, a4);
      if (v24)
      {
        uint64_t v25 = *(void *)(*(void *)(v22 + 56) + 8 * v23);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v17 = (void *)MEMORY[0x1BA9AC660](v25 + 16);
        swift_release();
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = sub_1B5CE76AC(a1, a2);
  if ((v12 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v13 + 16)) {
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1B5CE76AC(a3, a4);
  if ((v15 & 1) == 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v17 = *(void **)(v16 + 16);
  id v18 = v17;
  swift_release();
  if (!v17) {
    goto LABEL_11;
  }
LABEL_21:
  objc_msgSend(*(id *)(v5 + 56), sel_unlock);
  return v17;
}

uint64_t sub_1B5D85FC4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  sub_1B5D86A40(a2, a3);
  sub_1B5DBADA8();
  sub_1B5CEE190();
  char v12 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1B5DBE1F0;
  uint64_t v41 = a1;
  id v14 = objc_msgSend(a1, sel_debugDescription);
  uint64_t v15 = sub_1B5DBAAF8();
  uint64_t v17 = v16;

  uint64_t v18 = MEMORY[0x1E4FBB1A0];
  *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v19 = sub_1B5CFD41C();
  *(void *)(v13 + 32) = v15;
  *(void *)(v13 + 40) = v17;
  *(void *)(v13 + 96) = v18;
  *(void *)(v13 + 104) = v19;
  *(void *)(v13 + 64) = v19;
  *(void *)(v13 + 72) = a2;
  *(void *)(v13 + 80) = a3;
  *(void *)(v13 + 136) = v18;
  *(void *)(v13 + 144) = v19;
  *(void *)(v13 + 112) = a4;
  *(void *)(v13 + 120) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v6 + 56), sel_lock);
  swift_bridgeObjectRetain();
  uint64_t v20 = v6;
  char v21 = sub_1B5D8529C();
  uint64_t v22 = a2;
  unint64_t v23 = sub_1B5D84D14(v44, a2, a3);
  uint64_t v42 = a5;
  if (*v24)
  {
    swift_bridgeObjectRetain();
    sub_1B5DB5874(a4, a5);
    swift_bridgeObjectRelease();
    swift_release();
  }
  ((void (*)(void *, void))v23)(v44, 0);
  swift_bridgeObjectRelease();
  ((void (*)(unsigned char *, void))v21)(v45, 0);
  uint64_t v25 = v20;
  v26 = (void *)(v20 + 40);
  swift_beginAccess();
  uint64_t v27 = *(void *)(*(void *)(v20 + 40) + 16);
  swift_bridgeObjectRetain();
  if (v27)
  {
    swift_bridgeObjectRetain();
    sub_1B5CE76AC(v22, a3);
    if (v28)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v29 = sub_1B5D45D00(MEMORY[0x1E4FBC860]);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44[0] = *v26;
  void *v26 = 0x8000000000000000;
  sub_1B5DB2F44(v29, v22, a3, isUniquelyReferenced_nonNull_native);
  void *v26 = v44[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_8:
  swift_bridgeObjectRetain();
  unint64_t v31 = sub_1B5D852F0();
  unint64_t v33 = sub_1B5D84D98(v44, v22, a3);
  if (*v32)
  {
    uint64_t v34 = v32;
    type metadata accessor for WeakMetricsView();
    uint64_t v35 = swift_allocObject();
    swift_unknownObjectWeakInit();
    char v36 = v41;
    swift_unknownObjectWeakAssign();
    swift_bridgeObjectRetain();
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = *v34;
    *uint64_t v34 = 0x8000000000000000;
    uint64_t v38 = v35;
    uint64_t v39 = v42;
    sub_1B5DB2F64(v38, a4, v42, v37);
    *uint64_t v34 = v43;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ((void (*)(void *, void))v33)(v44, 0);
    swift_bridgeObjectRelease();
    ((void (*)(unsigned char *, void))v31)(v45, 0);
  }
  else
  {
    ((void (*)(void *, void))v33)(v44, 0);
    swift_bridgeObjectRelease();
    ((void (*)(unsigned char *, void))v31)(v45, 0);
    uint64_t v39 = v42;
    char v36 = v41;
  }
  objc_msgSend(*(id *)(v25 + 56), sel_unlock);
  objc_msgSend(*(id *)&v36[OBJC_IVAR___APPCMetricsView_promotedContent], sel_setVended_, 1);
  return sub_1B5D814C4(a4, v39);
}

id sub_1B5D8645C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1B5CECC98(&qword_1EB849160);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v50 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5D86D2C(a1, a2);
  sub_1B5DBADA8();
  unint64_t v8 = sub_1B5CEE190();
  unint64_t v47 = 0x80000001B5DC0670;
  unint64_t v48 = 0x80000001B5DC2A30;
  unint64_t v49 = v8;
  v9 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1B5DBDA20;
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 64) = sub_1B5CFD41C();
  uint64_t v40 = a1;
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  uint64_t v41 = a2;
  swift_bridgeObjectRetain();
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v3 + 56), sel_lock);
  uint64_t v39 = v3 + 32;
  swift_beginAccess();
  uint64_t v43 = v3;
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_1B5D84AAC(v11);
  swift_bridgeObjectRelease();
  uint64_t v42 = v12;
  uint64_t v14 = *(void *)(v12 + 16);
  if (v14)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v43 + 72) + 64);
    uint64_t v16 = (unint64_t *)(v42 + 40);
    unint64_t v46 = 0x80000001B5DCBD40;
    *(void *)&long long v13 = 136446210;
    long long v45 = v13;
    uint64_t v44 = MEMORY[0x1E4FBC840] + 8;
    do
    {
      uint64_t v18 = *(v16 - 1);
      unint64_t v17 = *v16;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v51 = v18;
      unint64_t v19 = sub_1B5CE76AC(v18, v17);
      char v21 = v20;
      swift_bridgeObjectRelease();
      if (v21)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v23 = *v15;
        uint64_t v52 = *v15;
        *uint64_t v15 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1B5DB779C();
          uint64_t v23 = v52;
        }
        swift_bridgeObjectRelease();
        uint64_t v24 = *(void *)(v23 + 56);
        uint64_t v25 = type metadata accessor for PreloadedContentDiagnosticPayload();
        uint64_t v26 = *(void *)(v25 - 8);
        uint64_t v27 = v24 + *(void *)(v26 + 72) * v19;
        uint64_t v28 = v50;
        sub_1B5D86FF0(v27, v50);
        sub_1B5DB62F8(v19, v23);
        *uint64_t v15 = v23;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v28, 0, 1, v25);
      }
      else
      {
        uint64_t v25 = type metadata accessor for PreloadedContentDiagnosticPayload();
        uint64_t v28 = v50;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v50, 1, 1, v25);
      }
      swift_endAccess();
      type metadata accessor for PreloadedContentDiagnosticPayload();
      int v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v28, 1, v25);
      sub_1B5D86F90(v28);
      if (v29 == 1)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v30 = (void *)sub_1B5DBAAC8();
        AnalyticsSendEvent();

        os_log_type_t v31 = sub_1B5DBAD78();
        uint64_t v32 = sub_1B5DBB018();
        if (os_log_type_enabled(v32, v31))
        {
          swift_bridgeObjectRetain_n();
          uint64_t v33 = swift_slowAlloc();
          uint64_t v34 = swift_slowAlloc();
          v53[0] = v34;
          *(_DWORD *)uint64_t v33 = v45;
          swift_bridgeObjectRetain();
          *(void *)(v33 + 4) = sub_1B5CEE4B4(v51, v17, v53);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1B5CE2000, v32, v31, "[Diagnostic] discarded %{public}s", (uint8_t *)v33, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1BA9AC560](v34, -1, -1);
          MEMORY[0x1BA9AC560](v33, -1, -1);
        }
        swift_bridgeObjectRelease();
      }
      v16 += 2;
      --v14;
    }
    while (v14);
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v35 = v41;
  swift_bridgeObjectRetain();
  uint64_t v36 = v40;
  sub_1B5DB5894(v40, v35);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v43;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B5DB58A0(v36, v35);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return objc_msgSend(*(id *)(v37 + 56), sel_unlock);
}

id sub_1B5D86A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  objc_msgSend(*(id *)(v2 + 64), sel_lock);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 48);
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1B5CE76AC(a1, a2);
    if ((v8 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    id v9 = *(id *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  objc_msgSend(v9, sel_invalidate);

LABEL_7:
  uint64_t v10 = self;
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = a2;
  aBlock[4] = sub_1B5D86F84;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B5CFFE28;
  aBlock[3] = &unk_1F0EED3C0;
  long long v13 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  id v14 = objc_msgSend(v10, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v13, 300.0);
  _Block_release(v13);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v15 = v14;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = 0x8000000000000000;
  sub_1B5DB2A08((uint64_t)v15, a1, a2, isUniquelyReferenced_nonNull_native);
  *(void *)(v3 + 48) = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  return objc_msgSend(*(id *)(v3 + 64), sel_unlock);
}

uint64_t sub_1B5D86CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1B5D8645C(a3, a4);
    return swift_release();
  }
  return result;
}

id sub_1B5D86D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  objc_msgSend(*(id *)(v2 + 64), sel_lock);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 48);
  if (*(void *)(v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1B5CE76AC(a1, a2);
    if ((v8 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    id v9 = *(id *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  objc_msgSend(v9, sel_invalidate);

LABEL_7:
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_1B5DB5658(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();

  return objc_msgSend(*(id *)(v3 + 64), sel_unlock);
}

uint64_t sub_1B5D86E64()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return v0;
}

uint64_t sub_1B5D86EB4()
{
  sub_1B5D86E64();
  return MEMORY[0x1F4186488](v0, 80, 7);
}

uint64_t type metadata accessor for PreloadedMetricViewHolder()
{
  return self;
}

uint64_t sub_1B5D86F0C()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B5D86F44()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B5D86F84(uint64_t a1)
{
  return sub_1B5D86CB8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1B5D86F90(uint64_t a1)
{
  uint64_t v2 = sub_1B5CECC98(&qword_1EB849160);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5D86FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreloadedContentDiagnosticPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5D87054()
{
  return MEMORY[0x1E4FBB1B0];
}

uint64_t sub_1B5D87060@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

void (*sub_1B5D8706C(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_1B5D879F8(v4);
  v4[9] = sub_1B5D873D8(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return sub_1B5D870FC;
}

void sub_1B5D870FC(uint64_t a1)
{
  v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 72))();
  v2(v1, 0);
  free(v1);
}

uint64_t (*sub_1B5D8715C(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_1B5D879F8(v6);
  v6[10] = sub_1B5D8759C(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_1B5D87208;
}

uint64_t (*sub_1B5D8720C(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_1B5D87A28(v6);
  v6[10] = sub_1B5D87710(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_1B5D87208;
}

uint64_t (*sub_1B5D872B8(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_1B5D879F8(v6);
  v6[10] = sub_1B5D878B0(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_1B5D87208;
}

void sub_1B5D87364(uint64_t a1)
{
  v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_1B5D873D8(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  char v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_1B5D4832C(a2);
  *((unsigned char *)v8 + 32) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *char v8 = v17;
        return sub_1B5D87508;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_1B5DB6B10();
      goto LABEL_7;
    }
    sub_1B5DAFD58(v14, a3 & 1);
    unint64_t v18 = sub_1B5D4832C(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[3] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_1B5DBB418();
  __break(1u);
  return result;
}

void sub_1B5D87508(uint64_t **a1)
{
  v1 = *a1;
  uint64_t v2 = **a1;
  char v3 = *((unsigned char *)*a1 + 32);
  if (v2)
  {
    unint64_t v4 = v1[3];
    uint64_t v5 = *(void **)v1[2];
    if (v3) {
      *(void *)(v5[7] + 8 * v4) = v2;
    }
    else {
      sub_1B5DB343C(v4, v1[1], v2, v5);
    }
  }
  else if ((*a1)[4])
  {
    sub_1B5DB5998(v1[3], *(void *)v1[2]);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  free(v1);
}

void (*sub_1B5D8759C(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  char v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_1B5CE76AC(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
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
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *char v10 = v19;
        return sub_1B5D876E4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_1B5DB7A64();
      goto LABEL_7;
    }
    sub_1B5DB141C(v16, a4 & 1);
    unint64_t v20 = sub_1B5CE76AC(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_1B5DBB418();
  __break(1u);
  return result;
}

void sub_1B5D876E4(uint64_t **a1, uint64_t a2)
{
}

void (*sub_1B5D87710(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  char v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_1B5CE76AC(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
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
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *char v10 = v19;
        return sub_1B5D876E4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_1B5DB7A70();
      goto LABEL_7;
    }
    sub_1B5DB1428(v16, a4 & 1);
    unint64_t v20 = sub_1B5CE76AC(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_1B5DBB418();
  __break(1u);
  return result;
}

void sub_1B5D87858(uint64_t **a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, void), void (*a4)(uint64_t, void))
{
  unint64_t v4 = *a1;
  sub_1B5D87A64(*a1, *((unsigned char *)*a1 + 40), (void *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2], a3, a4);
  swift_bridgeObjectRelease();
  free(v4);
}

void (*sub_1B5D878B0(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  char v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_1B5CE76AC(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
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
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *char v10 = v19;
        return sub_1B5D876E4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_1B5DB7C38();
      goto LABEL_7;
    }
    sub_1B5DB1434(v16, a4 & 1);
    unint64_t v20 = sub_1B5CE76AC(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_1B5DBB418();
  __break(1u);
  return result;
}

uint64_t (*sub_1B5D879F8(void *a1))()
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_1B5D87B78;
}

uint64_t (*sub_1B5D87A28(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_1B5D87A58;
}

uint64_t sub_1B5D87A58(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_1B5D87A64(uint64_t *a1, char a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, void), void (*a8)(uint64_t, void))
{
  uint64_t v10 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v10;
    }
    else
    {
      a7(a4, a5, a6, v10, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    a8(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5D87B28(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

BOOL static PrivacyMarkerType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PrivacyMarkerType.hash(into:)()
{
  return sub_1B5DBB498();
}

uint64_t PrivacyMarkerType.hashValue.getter()
{
  return sub_1B5DBB4B8();
}

unint64_t sub_1B5D87C08()
{
  unint64_t result = qword_1E9DA6038;
  if (!qword_1E9DA6038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9DA6038);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PrivacyMarkerType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrivacyMarkerType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B5D87DB8);
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

ValueMetadata *type metadata accessor for PrivacyMarkerType()
{
  return &type metadata for PrivacyMarkerType;
}

id sub_1B5D87DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  objc_msgSend(v5, sel_lock);
  unsigned int v6 = (uint64_t *)(v2 + 24);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v2 + 24);
  if (!*(void *)(v7 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B5CE76AC(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F47390]), sel_init);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v10 = v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v6;
    *unsigned int v6 = 0x8000000000000000;
    sub_1B5DB29E8((uint64_t)v10, a1, a2, isUniquelyReferenced_nonNull_native);
    *unsigned int v6 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    goto LABEL_6;
  }
  id v10 = *(id *)(*(void *)(v7 + 56) + 8 * v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  objc_msgSend(v5, sel_unlock);
  return v10;
}

uint64_t sub_1B5D87F60()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t type metadata accessor for SynchronizedDictionary()
{
  return self;
}

void sub_1B5D87FC4(uint64_t a1)
{
  uint64_t v2 = v1;
  if (sub_1B5D07034()
    || (uint64_t v4 = OBJC_IVAR___APPCPromotedContentView_promotedContent,
        objc_msgSend(*(id *)&v2[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_adType),
        uint64_t v5 = sub_1B5DB9F48(),
        v5 == sub_1B5DB9F48()))
  {
    v2[OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation] = *(unsigned char *)(a1
                                                                             + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_shouldBlockNavigation);
    CGFloat v6 = *(double *)(a1 + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_mostRecentTapLocation);
    CGFloat v7 = *(double *)(a1 + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_mostRecentTapLocation + 8);
    sub_1B5D897E8(v6, v7);
  }
  else
  {
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1B5DBA938();
    sub_1B5CEFDCC(v8, (uint64_t)qword_1EB84BA88);
    char v17 = v2;
    char v9 = sub_1B5DBA918();
    os_log_type_t v10 = sub_1B5DBAD98();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)id v11 = 136315138;
      uint64_t v18 = v12;
      id v13 = objc_msgSend(*(id *)&v2[v4], sel_identifier);
      uint64_t v14 = sub_1B5DBAAF8();
      unint64_t v16 = v15;

      sub_1B5CEE4B4(v14, v16, &v18);
      sub_1B5DBB058();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B5CE2000, v9, v10, "Asked to handle tap without a recent tap on the view for promoted content with identifier %s.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v12, -1, -1);
      MEMORY[0x1BA9AC560](v11, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_1B5D88270(CGFloat a1, CGFloat a2)
{
  objc_msgSend(v2, sel_frame);
  if (CGRectGetWidth(v26) <= 0.0 || (objc_msgSend(v2, sel_frame), CGRectGetHeight(v27) <= 0.0))
  {
    objc_msgSend(v2, sel_frame);
    CGFloat v7 = NSStringFromCGRect(v30);
    uint64_t v8 = sub_1B5DBAAF8();
    unint64_t v10 = v9;

    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1B5DBA938();
    sub_1B5CEFDCC(v11, (uint64_t)qword_1EB84BA88);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B5DBA918();
    os_log_type_t v13 = sub_1B5DBAD98();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v24 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B5CEE4B4(v8, v10, &v24);
      sub_1B5DBB058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B5CE2000, v12, v13, "Failed to normalize interaction point in frame %s.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v15, -1, -1);
      MEMORY[0x1BA9AC560](v14, -1, -1);

      return 0;
    }
  }
  else
  {
    if (a1 >= 0.0 && a2 >= 0.0)
    {
      objc_msgSend(v2, sel_frame);
      CGFloat v5 = a1 / CGRectGetWidth(v28);
      objc_msgSend(v2, sel_frame);
      CGRectGetHeight(v29);
      return *(void *)&v5;
    }
    v25.x = a1;
    v25.y = a2;
    unint64_t v16 = NSStringFromCGPoint(v25);
    uint64_t v17 = sub_1B5DBAAF8();
    unint64_t v19 = v18;

    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1B5DBA938();
    sub_1B5CEFDCC(v20, (uint64_t)qword_1EB84BA88);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1B5DBA918();
    os_log_type_t v21 = sub_1B5DBAD98();
    if (os_log_type_enabled(v12, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B5CEE4B4(v17, v19, &v24);
      sub_1B5DBB058();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B5CE2000, v12, v21, "Failed to normalize interaction point using point %s.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v23, -1, -1);
      MEMORY[0x1BA9AC560](v22, -1, -1);

      return 0;
    }
  }

  swift_bridgeObjectRelease_n();
  return 0;
}

void sub_1B5D88664(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  CGFloat v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5DB9868();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B5CECC98(&qword_1EB8496E0);
  MEMORY[0x1F4188790](v11 - 8);
  os_log_type_t v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1B5DBA938();
    sub_1B5CEFDCC(v16, (uint64_t)qword_1EB84BA88);
    char v67 = v2;
    uint64_t v17 = sub_1B5DBA918();
    os_log_type_t v18 = sub_1B5DBAD98();
    if (!os_log_type_enabled(v17, v18))
    {

      goto LABEL_12;
    }
    unint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v69 = v20;
    *(_DWORD *)unint64_t v19 = 136315138;
    id v21 = objc_msgSend(*(id *)&v67[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    uint64_t v22 = sub_1B5DBAAF8();
    unint64_t v24 = v23;

    uint64_t v68 = sub_1B5CEE4B4(v22, v24, &v69);
    sub_1B5DBB058();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5CE2000, v17, v18, "No tap action found for promoted content with identifier %s.", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v20, -1, -1);
    MEMORY[0x1BA9AC560](v19, -1, -1);
    goto LABEL_8;
  }
  sub_1B5DB9FD8();
  uint64_t v14 = swift_dynamicCastClass();
  if (!v14)
  {
    sub_1B5DB9F08();
    CGPoint v25 = (void *)swift_dynamicCastClass();
    CGRect v26 = a1;
    char v67 = v26;
    if (v25)
    {
      sub_1B5D8A994(v25);
      goto LABEL_12;
    }
    CGRect v28 = sub_1B5D8E150((uint64_t)v2, v26);
    if (v28)
    {
      CGRect v29 = v28;
      type metadata accessor for SafariViewController();
      uint64_t v30 = swift_dynamicCastClass();
      if (v30)
      {
        os_log_type_t v31 = (void *)v30;
        uint64_t v32 = qword_1EB849898;
        id v33 = v29;
        if (v32 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_1B5DBA938();
        sub_1B5CEFDCC(v34, (uint64_t)qword_1EB84BA88);
        uint64_t v35 = v2;
        uint64_t v36 = sub_1B5DBA918();
        os_log_type_t v37 = sub_1B5DBAD98();
        if (os_log_type_enabled(v36, v37))
        {
          v66 = v31;
          uint64_t v38 = (uint8_t *)swift_slowAlloc();
          uint64_t v64 = swift_slowAlloc();
          uint64_t v69 = v64;
          v63 = v38;
          *(_DWORD *)uint64_t v38 = 136315138;
          unint64_t v62 = v38 + 4;
          id v39 = objc_msgSend(*(id *)&v35[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier, v38 + 4);
          uint64_t v40 = sub_1B5DBAAF8();
          id v65 = v33;
          unint64_t v42 = v41;

          uint64_t v43 = v40;
          os_log_type_t v31 = v66;
          uint64_t v68 = sub_1B5CEE4B4(v43, v42, &v69);
          sub_1B5DBB058();

          id v33 = v65;
          swift_bridgeObjectRelease();
          os_log_type_t v44 = v37;
          long long v45 = v63;
          _os_log_impl(&dword_1B5CE2000, v36, v44, "Created SafariViewController for promoted content with identifier %s.", v63, 0xCu);
          uint64_t v46 = v64;
          swift_arrayDestroy();
          MEMORY[0x1BA9AC560](v46, -1, -1);
          MEMORY[0x1BA9AC560](v45, -1, -1);
        }
        else
        {
        }
        objc_msgSend(v31, sel_setDelegate_, v35);
      }
      uint64_t v56 = sub_1B5DBACD8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v13, 1, 1, v56);
      sub_1B5DBACB8();
      id v57 = v29;
      id v58 = v2;
      uint64_t v59 = sub_1B5DBACA8();
      uint64_t v60 = (void *)swift_allocObject();
      uint64_t v61 = MEMORY[0x1E4FBCFD8];
      v60[2] = v59;
      v60[3] = v61;
      v60[4] = v58;
      v60[5] = v57;
      sub_1B5CEF980((uint64_t)v13, (uint64_t)&unk_1E9DA6048, (uint64_t)v60);
      swift_release();

      goto LABEL_29;
    }
    sub_1B5D44934((uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      sub_1B5D8BD0C((uint64_t)v10);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      return;
    }
    sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_1B5DBA938();
    sub_1B5CEFDCC(v47, (uint64_t)qword_1EB84BA88);
    unint64_t v48 = v2;
    uint64_t v17 = sub_1B5DBA918();
    os_log_type_t v49 = sub_1B5DBAD98();
    if (!os_log_type_enabled(v17, v49))
    {

LABEL_29:
      return;
    }
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v69 = v51;
    *(_DWORD *)uint64_t v50 = 136315138;
    id v52 = objc_msgSend(*(id *)&v48[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    uint64_t v53 = sub_1B5DBAAF8();
    unint64_t v55 = v54;

    uint64_t v68 = sub_1B5CEE4B4(v53, v55, &v69);
    sub_1B5DBB058();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5CE2000, v17, v49, "Failed to create a view controller using tap action for promoted content with identifier %s.", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v51, -1, -1);
    MEMORY[0x1BA9AC560](v50, -1, -1);

LABEL_8:
    return;
  }
  uint64_t v15 = (void *)v14;
  char v67 = a1;
  sub_1B5D8A6F8(v15);
LABEL_12:
  id v27 = v67;
}

void sub_1B5D88EE0(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v9 = v8;
  uint64_t v18 = sub_1B5CECC98(&qword_1EB847E58);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v20 = (char *)v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = objc_msgSend(a2, sel_bestRepresentation);
  if (v21)
  {
    uint64_t v22 = v21;
    unint64_t v23 = (void *)MEMORY[0x1E4FBC8C8];
    if ((*(uint64_t (**)(void *, id))((*MEMORY[0x1E4FBC8C8] & *v8) + 0x2E8))(a1, v21))
    {
      if (a1)
      {
        id v24 = a1;
LABEL_12:
        uint64_t v36 = OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation;
        if ((*((unsigned char *)v8 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) & 1) != 0
          || (uint64_t v35 = (char *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized,
              *((unsigned char *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized) != 1))
        {
          *((unsigned char *)v8 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) = 0;
          uint64_t v35 = (char *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized;
          *((unsigned char *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized) = 0;
          uint64_t v44 = qword_1EB849898;
          id v45 = a1;
          if (v44 != -1) {
            swift_once();
          }
          uint64_t v46 = sub_1B5DBA938();
          sub_1B5CEFDCC(v46, (uint64_t)qword_1EB84BA88);
          uint64_t v47 = v9;
          unint64_t v48 = sub_1B5DBA918();
          os_log_type_t v49 = sub_1B5DBADA8();
          if (os_log_type_enabled(v48, v49))
          {
            uint64_t v50 = (uint8_t *)swift_slowAlloc();
            uint64_t v75 = swift_slowAlloc();
            v78[0] = v75;
            v76 = v35;
            v74 = v50;
            *(_DWORD *)uint64_t v50 = 136315138;
            v73[1] = v50 + 4;
            id v51 = objc_msgSend(*(id *)((char *)v47 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier);
            uint64_t v52 = v36;
            uint64_t v53 = sub_1B5DBAAF8();
            id v77 = v24;
            unint64_t v55 = v54;

            uint64_t v79 = sub_1B5CEE4B4(v53, v55, v78);
            uint64_t v35 = v76;
            sub_1B5DBB058();

            swift_bridgeObjectRelease();
            uint64_t v56 = v74;
            _os_log_impl(&dword_1B5CE2000, v48, v49, "Action blocked due to accidental tap detection for promoted content with identifier %s.", v74, 0xCu);
            uint64_t v57 = v75;
            swift_arrayDestroy();
            MEMORY[0x1BA9AC560](v57, -1, -1);
            MEMORY[0x1BA9AC560](v56, -1, -1);

            swift_unknownObjectRelease();
            *((unsigned char *)v9 + v52) = 0;
          }
          else
          {

            swift_unknownObjectRelease();
            *((unsigned char *)v9 + v36) = 0;
          }
        }
        else
        {
          os_log_type_t v37 = *(void **)((char *)v8 + OBJC_IVAR___APPCPromotedContentView_videoTapAction);
          *(void *)((char *)v9 + OBJC_IVAR___APPCPromotedContentView_videoTapAction) = 0;
          id v38 = a1;

          uint64_t v39 = sub_1B5DBA9E8();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v20, 1, 1, v39);
          uint64_t v40 = (uint64_t)v9 + OBJC_IVAR___APPCPromotedContentView_videoActionTimestamp;
          swift_beginAccess();
          sub_1B5D10FC8((uint64_t)v20, v40);
          swift_endAccess();
          unint64_t v41 = (char *)v9 + OBJC_IVAR___APPCPromotedContentView_videoMoreLocation;
          *(void *)unint64_t v41 = 0;
          *((void *)v41 + 1) = 0;
          v41[16] = 1;
          sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8498A0);
          id v42 = sub_1B5D2025C();
          id v77 = v24;
          if (v42)
          {
            id v43 = v42;
          }
          else
          {
            id v43 = v24;
            id v42 = 0;
          }
          char v67 = *(void **)((char *)v9 + OBJC_IVAR___APPCPromotedContentView_lastPerformedAction);
          *(void *)((char *)v9 + OBJC_IVAR___APPCPromotedContentView_lastPerformedAction) = v43;
          id v68 = v42;
          id v69 = v43;

          sub_1B5D8A35C(a3, a4, a5, a6, a7, a8);
          objc_msgSend(a2, sel_adType);
          uint64_t v70 = sub_1B5DB9F48();
          if (v70 == sub_1B5DB9F48())
          {

            uint64_t v71 = swift_unknownObjectRelease();
            (*(void (**)(uint64_t))((*v23 & *v9) + 0x2F8))(v71);
          }
          else
          {
            id v72 = v69;
            sub_1B5D88664(v43);
            swift_unknownObjectRelease();
          }
          *((unsigned char *)v9 + v36) = 0;
        }
        goto LABEL_33;
      }
      id v24 = objc_msgSend(v22, sel_tapAction);
      if (v24) {
        goto LABEL_12;
      }
      if (qword_1EB849898 != -1) {
        swift_once();
      }
      uint64_t v58 = sub_1B5DBA938();
      sub_1B5CEFDCC(v58, (uint64_t)qword_1EB84BA88);
      uint64_t v9 = v8;
      uint64_t v59 = sub_1B5DBA918();
      os_log_type_t v60 = sub_1B5DBAD98();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        v78[0] = v62;
        *(_DWORD *)uint64_t v61 = 136315138;
        id v77 = v61 + 4;
        id v63 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)v9
                                                                    + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier));
        uint64_t v64 = sub_1B5DBAAF8();
        unint64_t v66 = v65;

        uint64_t v79 = sub_1B5CEE4B4(v64, v66, v78);
        sub_1B5DBB058();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1B5CE2000, v59, v60, "No tap action found for best representation of promoted content with identifier %s", v61, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BA9AC560](v62, -1, -1);
        MEMORY[0x1BA9AC560](v61, -1, -1);
        swift_unknownObjectRelease();

LABEL_32:
        *((unsigned char *)v9 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) = 0;
        uint64_t v35 = (char *)v9 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized;
        goto LABEL_33;
      }
    }
    swift_unknownObjectRelease();
    goto LABEL_32;
  }
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1B5DBA938();
  sub_1B5CEFDCC(v25, (uint64_t)qword_1EB84BA88);
  CGRect v26 = v8;
  id v27 = sub_1B5DBA918();
  os_log_type_t v28 = sub_1B5DBAD98();
  if (os_log_type_enabled(v27, v28))
  {
    CGRect v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v78[0] = v30;
    *(_DWORD *)CGRect v29 = 136315138;
    id v31 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)v26
                                                                + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier));
    uint64_t v32 = sub_1B5DBAAF8();
    unint64_t v34 = v33;

    uint64_t v79 = sub_1B5CEE4B4(v32, v34, v78);
    sub_1B5DBB058();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5CE2000, v27, v28, "No best representation found for promoted content with identifier %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v30, -1, -1);
    MEMORY[0x1BA9AC560](v29, -1, -1);
  }
  else
  {
  }
  *((unsigned char *)v26 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) = 0;
  uint64_t v35 = (char *)v26 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized;
LABEL_33:
  *uint64_t v35 = 0;
}

void sub_1B5D897E8(CGFloat a1, CGFloat a2)
{
  int v3 = v2;
  uint64_t v6 = sub_1B5CECC98(&qword_1EB847E58);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = &v92[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1B5DBA9E8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v99 = &v92[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v11);
  v100 = &v92[-v13];
  uint64_t v14 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = &v92[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_1B5DB9868();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  id v21 = &v92[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v19);
  unint64_t v23 = &v92[-v22];
  v3[OBJC_IVAR___APPCPromotedContentView_tapWasRecognized] = 1;
  uint64_t v101 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  id v24 = objc_msgSend(*(id *)&v3[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation);
  if (!v24)
  {
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1B5DBA938();
    sub_1B5CEFDCC(v27, (uint64_t)qword_1EB84BA88);
    v102 = v3;
    os_log_type_t v28 = sub_1B5DBA918();
    os_log_type_t v29 = sub_1B5DBAD98();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      v104[0] = v31;
      id v32 = objc_msgSend(*(id *)&v3[v101], sel_identifier);
      uint64_t v33 = sub_1B5DBAAF8();
      unint64_t v35 = v34;

      uint64_t v105 = sub_1B5CEE4B4(v33, v35, v104);
      sub_1B5DBB058();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B5CE2000, v28, v29, "No best representation found for promoted content with identifier %s.", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v31, -1, -1);
      MEMORY[0x1BA9AC560](v30, -1, -1);

      return;
    }

    goto LABEL_16;
  }
  uint64_t v25 = v24;
  uint64_t v98 = v10;
  v102 = objc_msgSend(v24, sel_tapAction);
  objc_msgSend(v25, sel_adType);
  uint64_t v26 = sub_1B5DB9F48();
  if (v26 == sub_1B5DB9F48())
  {
    sub_1B5DBA2C8();
    if (swift_dynamicCastClass())
    {
      uint64_t v97 = v9;
      swift_unknownObjectRetain();
      sub_1B5DBA2B8();
      v104[0] = 0xD000000000000013;
      v104[1] = 0x80000001B5DCBEE0;
      sub_1B5DBABC8();
      sub_1B5DB9858();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
      {
        swift_unknownObjectRelease_n();

        sub_1B5CEF924((uint64_t)v16, &qword_1EB847BD0);
        return;
      }
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 32))(v23, v16, v17);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 16))(v21, v23, v17);
      id v38 = objc_allocWithZone((Class)sub_1B5DB9F08());
      uint64_t v39 = sub_1B5DB9EF8();
      swift_unknownObjectRelease();

      (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v23, v17);
      id v36 = (id)v39;
      goto LABEL_20;
    }
    swift_unknownObjectRelease();
LABEL_16:
    id v37 = v102;

    return;
  }
  uint64_t v97 = v9;
  id v36 = v102;
  if (!v102)
  {
    swift_unknownObjectRelease();
    return;
  }
LABEL_20:
  id v40 = v36;
  sub_1B5DBA728();
  uint64_t v41 = sub_1B5DB9F68();
  if (v41 == sub_1B5DB9F68()
    || (sub_1B5DBA728(), uint64_t v42 = sub_1B5DB9F68(), v42 == sub_1B5DB9F68())
    || (sub_1B5DBA728(), uint64_t v43 = sub_1B5DB9F68(), v43 == sub_1B5DB9F68()))
  {

    id v44 = v40;
    sub_1B5DBA728();
    uint64_t v45 = sub_1B5DB9F68();
    if (v45 != sub_1B5DB9F68() || (uint64_t v46 = *(void **)&v3[OBJC_IVAR___APPCPromotedContentView_videoTapAction]) == 0)
    {
      swift_unknownObjectRelease();
LABEL_28:

      return;
    }
    uint64_t v47 = (uint64_t)&v3[OBJC_IVAR___APPCPromotedContentView_videoActionTimestamp];
    swift_beginAccess();
    sub_1B5D10F60(v47, (uint64_t)v8);
    uint64_t v49 = v97;
    uint64_t v48 = v98;
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v98 + 48))(v8, 1, v97) == 1)
    {
      swift_unknownObjectRelease();

      sub_1B5CEF924((uint64_t)v8, &qword_1EB847E58);
      return;
    }
    uint64_t v50 = v100;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v48 + 32))(v100, v8, v49);
    id v51 = (double *)&v3[OBJC_IVAR___APPCPromotedContentView_videoMoreLocation];
    if (v3[OBJC_IVAR___APPCPromotedContentView_videoMoreLocation + 16])
    {
      uint64_t v52 = *(void (**)(unsigned char *, uint64_t))(v48 + 8);
      id v53 = v46;
      v52(v50, v49);
      swift_unknownObjectRelease();

      goto LABEL_28;
    }
    CGFloat v61 = *v51;
    CGFloat v60 = v51[1];
    uint64_t v62 = qword_1EB849898;
    id v63 = v46;
    if (v62 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_1B5DBA938();
    sub_1B5CEFDCC(v64, (uint64_t)qword_1EB84BA88);
    unint64_t v65 = v3;
    unint64_t v66 = sub_1B5DBA918();
    os_log_type_t v67 = sub_1B5DBAD78();
    int v68 = v67;
    BOOL v69 = os_log_type_enabled(v66, v67);
    uint64_t v97 = v49;
    if (v69)
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = (unsigned char *)swift_slowAlloc();
      v102 = v71;
      id v95 = v65;
      v96 = v70;
      *(_DWORD *)uint64_t v70 = 136315138;
      uint64_t v105 = (uint64_t)v71;
      v94 = v70 + 4;
      id v72 = v63;
      id v73 = objc_msgSend(*(id *)&v3[v101], sel_identifier);
      uint64_t v74 = sub_1B5DBAAF8();
      int v93 = v68;
      unint64_t v76 = v75;

      id v63 = v72;
      uint64_t v77 = v74;
      uint64_t v50 = v100;
      uint64_t v103 = sub_1B5CEE4B4(v77, v76, &v105);
      sub_1B5DBB058();
      id v78 = v95;

      swift_bridgeObjectRelease();
      uint64_t v79 = v96;
      _os_log_impl(&dword_1B5CE2000, v66, (os_log_type_t)v93, "Proccessing tap for video with saved parameters for promoted content with identifier %s.", v96, 0xCu);
      id v80 = v102;
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v80, -1, -1);
      MEMORY[0x1BA9AC560](v79, -1, -1);

      v81 = v99;
    }
    else
    {

      v81 = v99;
      id v78 = v65;
    }
    sub_1B5DBA9D8();
    unint64_t v82 = sub_1B5DBA9C8();
    unint64_t v83 = sub_1B5DBA9C8();
    if (v82 < v83)
    {
      __break(1u);
    }
    else
    {
      if (v82 - v83 <= 0xBEBC200)
      {
        v84 = *(void **)&v3[v101];
        id v85 = v63;
        swift_unknownObjectRetain();
        objc_msgSend(v78, sel_frame);
        sub_1B5D88EE0(v46, v84, v61, v60, v86, v87, v88, v89);
        swift_unknownObjectRelease();
      }
      else
      {
      }
      swift_unknownObjectRelease();
      uint64_t v90 = v97;

      v91 = *(void (**)(unsigned char *, uint64_t))(v98 + 8);
      v91(v81, v90);
      v91(v50, v90);
    }
  }
  else
  {
    unint64_t v54 = *(void **)&v3[v101];
    id v55 = v40;
    swift_unknownObjectRetain();
    objc_msgSend(v3, sel_frame);
    sub_1B5D88EE0(v40, v54, a1, a2, v56, v57, v58, v59);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1B5D8A35C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v13 = NSStringFromCGPoint(*(CGPoint *)&a1);
  uint64_t v14 = sub_1B5DBAAF8();
  unint64_t v16 = v15;

  v41.origin.x = a3;
  v41.origin.y = a4;
  v41.size.width = a5;
  v41.size.height = a6;
  uint64_t v17 = NSStringFromCGRect(v41);
  uint64_t v18 = sub_1B5DBAAF8();
  unint64_t v20 = v19;

  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1B5DBA938();
  sub_1B5CEFDCC(v21, (uint64_t)qword_1EB84BA88);
  uint64_t v22 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v23 = sub_1B5DBA918();
  os_log_type_t v24 = sub_1B5DBAD78();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v40 = v39;
    *(_DWORD *)uint64_t v25 = 136315650;
    swift_bridgeObjectRetain();
    sub_1B5CEE4B4(v14, v16, &v40);
    sub_1B5DBB058();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1B5CEE4B4(v18, v20, &v40);
    sub_1B5DBB058();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 22) = 2080;
    id v26 = objc_msgSend(*(id *)&v22[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    uint64_t v27 = sub_1B5DBAAF8();
    unint64_t v29 = v28;

    sub_1B5CEE4B4(v27, v29, &v40);
    sub_1B5DBB058();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5CE2000, v23, v24, "Handling action at location %s in frame %s for promoted content with identifier %s.", (uint8_t *)v25, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v39, -1, -1);
    MEMORY[0x1BA9AC560](v25, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  *(double *)&uint64_t v30 = COERCE_DOUBLE(sub_1B5D88270(a1, a2));
  if (v32)
  {
    id v35 = objc_msgSend(*(id *)&v22[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_metricsHelper);
    LODWORD(v36) = -1.0;
    LODWORD(v37) = -1.0;
  }
  else
  {
    double v33 = *(double *)&v30;
    double v34 = v31;
    id v35 = objc_msgSend(*(id *)&v22[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_metricsHelper);
    *(float *)&double v36 = v33;
    *(float *)&double v37 = v34;
  }
  objc_msgSend(v35, sel_interactedAtXPos_yPos_, v36, v37);
  return swift_unknownObjectRelease();
}

void sub_1B5D8A6F8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB8496E0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9F98();
  uint64_t v7 = sub_1B5DBA0D8();
  if (v7 == sub_1B5DBA0D8() && (sub_1B5DB9FD8(), swift_dynamicCastClass()))
  {
    id v8 = v2;
    id v9 = a1;
    uint64_t v10 = (void *)sub_1B5DB9FB8();
    uint64_t v11 = sub_1B5DB9FC8();
    uint64_t v12 = (char *)objc_allocWithZone((Class)type metadata accessor for StoreProductRequester());
    uint64_t v13 = (void *)sub_1B5D8E3CC(v10, v11, (uint64_t)v8, v12);

    uint64_t v14 = sub_1B5DBACD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
    sub_1B5DBACB8();
    id v15 = v8;
    id v16 = v13;
    uint64_t v17 = sub_1B5DBACA8();
    uint64_t v18 = (void *)swift_allocObject();
    uint64_t v19 = MEMORY[0x1E4FBCFD8];
    v18[2] = v17;
    v18[3] = v19;
    v18[4] = v16;
    v18[5] = v15;
    sub_1B5CEF980((uint64_t)v6, (uint64_t)&unk_1E9DA6058, (uint64_t)v18);
    swift_release();
  }
  else
  {
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1B5DBA938();
    sub_1B5CEFDCC(v20, (uint64_t)qword_1EB84BA88);
    os_log_t v25 = (os_log_t)sub_1B5DBA918();
    os_log_type_t v21 = sub_1B5DBAD98();
    if (os_log_type_enabled(v25, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1B5CE2000, v25, v21, "Failed to create store product requester.", v22, 2u);
      MEMORY[0x1BA9AC560](v22, -1, -1);
    }
    os_log_t v23 = v25;
  }
}

void sub_1B5D8A994(void *a1)
{
  uint64_t v3 = sub_1B5CECC98(&qword_1EB8496E0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v103 = &v95[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1B5DB9868();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v101 = &v95[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v102 = &v95[-v10];
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = &v95[-v12];
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  v104 = &v95[-v15];
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = &v95[-v16];
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1B5DBA938();
  sub_1B5CEFDCC(v18, (uint64_t)qword_1EB84BA88);
  id v19 = a1;
  id v20 = v1;
  id v21 = v19;
  uint64_t v22 = (char *)v20;
  os_log_t v23 = sub_1B5DBA918();
  os_log_type_t v24 = sub_1B5DBAD88();
  int v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v99 = swift_slowAlloc();
    v107[0] = v99;
    *(_DWORD *)uint64_t v26 = 136380931;
    v100 = v13;
    os_log_t v98 = v23;
    sub_1B5DB9EE8();
    sub_1B5D8F38C(&qword_1E9DA6098, MEMORY[0x1E4F276F0]);
    uint64_t v27 = sub_1B5DBB3A8();
    unint64_t v29 = v28;
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v17, v5);
    uint64_t v105 = sub_1B5CEE4B4(v27, v29, v107);
    sub_1B5DBB058();

    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v97 = v26 + 14;
    id v30 = objc_msgSend(*(id *)&v22[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    double v31 = v22;
    char v32 = v17;
    uint64_t v33 = v6;
    uint64_t v34 = v5;
    uint64_t v35 = sub_1B5DBAAF8();
    int v96 = v25;
    unint64_t v37 = v36;

    uint64_t v38 = v35;
    uint64_t v5 = v34;
    uint64_t v6 = v33;
    uint64_t v17 = v32;
    uint64_t v22 = v31;
    uint64_t v13 = v100;
    uint64_t v105 = sub_1B5CEE4B4(v38, v37, v107);
    sub_1B5DBB058();

    swift_bridgeObjectRelease();
    os_log_t v39 = v98;
    _os_log_impl(&dword_1B5CE2000, v98, (os_log_type_t)v96, "Attempting to open URL %{private}s for a web tap action for promoted content with identifier %s.", (uint8_t *)v26, 0x16u);
    uint64_t v40 = v99;
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v40, -1, -1);
    MEMORY[0x1BA9AC560](v26, -1, -1);
  }
  else
  {
  }
  CGRect v41 = v21;
  uint64_t v42 = v104;
  sub_1B5DB9EE8();
  uint64_t v43 = sub_1B5DB9848();
  uint64_t v45 = v44;
  uint64_t v46 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v46(v42, v5);
  if (!v45)
  {
LABEL_10:
    sub_1B5DB9EE8();
    uint64_t v48 = sub_1B5DB9848();
    uint64_t v50 = v49;
    v46(v13, v5);
    if (!v50) {
      goto LABEL_17;
    }
    if (v48 != 0x7370747468 || v50 != 0xE500000000000000)
    {
      char v58 = sub_1B5DBB3C8();
      swift_bridgeObjectRelease();
      if ((v58 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v43 != 1886680168 || v45 != 0xE400000000000000)
  {
    char v47 = sub_1B5DBB3C8();
    swift_bridgeObjectRelease();
    if (v47) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
LABEL_13:
  swift_bridgeObjectRelease();
LABEL_14:
  if (sub_1B5DB9ED8())
  {
    uint64_t v51 = sub_1B5DBACD8();
    uint64_t v52 = (uint64_t)v103;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v103, 1, 1, v51);
    sub_1B5DBACB8();
    id v53 = v41;
    unint64_t v54 = v22;
    uint64_t v55 = sub_1B5DBACA8();
    CGFloat v56 = (void *)swift_allocObject();
    uint64_t v57 = MEMORY[0x1E4FBCFD8];
    v56[2] = v55;
    v56[3] = v57;
    v56[4] = v54;
    v56[5] = v53;
    sub_1B5CEF980(v52, (uint64_t)&unk_1E9DA6090, (uint64_t)v56);
    swift_release();
    return;
  }
LABEL_17:
  CGFloat v59 = v102;
  sub_1B5DB9EE8();
  uint64_t v60 = sub_1B5DB9848();
  uint64_t v62 = v61;
  v46(v59, v5);
  if (!v62)
  {
LABEL_21:
    uint64_t v64 = v101;
    sub_1B5DB9EE8();
    uint64_t v65 = sub_1B5DB9848();
    uint64_t v67 = v66;
    v46(v64, v5);
    if (!v67) {
      goto LABEL_26;
    }
    if (v65 != 0x7370747468 || v67 != 0xE500000000000000)
    {
      char v94 = sub_1B5DBB3C8();
      swift_bridgeObjectRelease();
      if ((v94 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v60 != 1886680168 || v62 != 0xE400000000000000)
  {
    char v63 = sub_1B5DBB3C8();
    swift_bridgeObjectRelease();
    if (v63) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_24:
  swift_bridgeObjectRelease();
LABEL_25:
  if ((sub_1B5DB9ED8() & 1) == 0)
  {
    sub_1B5DB9EE8();
    id v78 = (objc_class *)type metadata accessor for SafariViewController();
    uint64_t v79 = (char *)objc_allocWithZone(v78);
    *(void *)&v79[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationObserver] = 0;
    *(void *)&v79[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationCloseObserver] = 0;
    *(void *)&v79[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationOpenObserver] = 0;
    id v80 = &v79[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime];
    uint64_t v81 = sub_1B5DB99A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v80, 1, 1, v81);
    *(void *)&v79[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate + 8] = 0;
    *(void *)(swift_unknownObjectWeakInit() + 8) = &off_1F0EEAEE8;
    swift_unknownObjectWeakAssign();
    unint64_t v82 = v22;
    unint64_t v83 = (void *)sub_1B5DB9818();
    v84 = v17;
    id v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F3AEC0]), sel_init);
    v106.receiver = v79;
    v106.super_class = v78;
    id v86 = objc_msgSendSuper2(&v106, sel_initWithURL_configuration_, v83, v85);

    v46(v84, v5);
    objc_msgSend(v86, sel_setModalPresentationStyle_, 5);
    uint64_t v87 = sub_1B5DBACD8();
    uint64_t v88 = (uint64_t)v103;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56))(v103, 1, 1, v87);
    sub_1B5DBACB8();
    CGFloat v89 = v82;
    id v90 = v86;
    uint64_t v91 = sub_1B5DBACA8();
    v92 = (void *)swift_allocObject();
    uint64_t v93 = MEMORY[0x1E4FBCFD8];
    v92[2] = v91;
    v92[3] = v93;
    v92[4] = v89;
    v92[5] = v90;
    sub_1B5CEF980(v88, (uint64_t)&unk_1E9DA6080, (uint64_t)v92);
    swift_release();

    return;
  }
LABEL_26:
  sub_1B5D2CFF0((uint64_t)&v22[OBJC_IVAR___APPCPromotedContentView_urlOpener], (uint64_t)v107);
  uint64_t v68 = v108;
  uint64_t v69 = v109;
  uint64_t v70 = v41;
  sub_1B5D0D21C(v107, v108);
  sub_1B5DB9EE8();
  LOBYTE(v68) = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v69 + 8))(v17, v68, v69);
  v46(v17, v5);
  sub_1B5CEE588((uint64_t)v107);
  if (v68)
  {
    uint64_t v71 = sub_1B5DBACD8();
    uint64_t v72 = (uint64_t)v103;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v103, 1, 1, v71);
    sub_1B5DBACB8();
    id v73 = v70;
    uint64_t v74 = v22;
    uint64_t v75 = sub_1B5DBACA8();
    unint64_t v76 = (void *)swift_allocObject();
    uint64_t v77 = MEMORY[0x1E4FBCFD8];
    v76[2] = v75;
    v76[3] = v77;
    void v76[4] = v74;
    v76[5] = v73;
    sub_1B5D9652C(v72, (uint64_t)&unk_1E9DA6070, (uint64_t)v76);
    swift_release();
  }
}

uint64_t sub_1B5D8B3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_1B5DBACB8();
  v5[3] = sub_1B5DBACA8();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_1B5D335F4;
  return sub_1B5D8B4B8(a5);
}

uint64_t sub_1B5D8B4B8(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  sub_1B5DBACB8();
  v2[17] = sub_1B5DBACA8();
  uint64_t v4 = sub_1B5DBAC98();
  v2[18] = v4;
  v2[19] = v3;
  return MEMORY[0x1F4188298](sub_1B5D8B550, v4, v3);
}

uint64_t sub_1B5D8B550()
{
  uint64_t v27 = v0;
  uint64_t v1 = (void *)MEMORY[0x1BA9AC660](v0[16] + OBJC_IVAR___APPCPromotedContentView_interactionPresentationDelegate);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_viewControllerToPresentFrom);
    swift_unknownObjectRelease();
LABEL_5:
    id v4 = objc_msgSend(v2, sel_presentedViewController);
    if (v4)
    {
      id v5 = v4;
      type metadata accessor for ExpandViewController();
      uint64_t v6 = swift_dynamicCastClass();
      if (v6) {
        uint64_t v7 = v2;
      }
      else {
        uint64_t v7 = v5;
      }
      if (v6) {
        id v2 = (id)v6;
      }
    }
    v0[20] = v2;
    uint64_t v8 = v0[15];
    BOOL v9 = !UIAccessibilityIsReduceMotionEnabled();
    v0[2] = v0;
    v0[3] = sub_1B5D8B8E4;
    uint64_t v10 = swift_continuation_init();
    v0[10] = MEMORY[0x1E4F143A8];
    v0[11] = 0x40000000;
    v0[12] = sub_1B5D8D760;
    v0[13] = &unk_1E61334A8;
    v0[14] = v10;
    objc_msgSend(v2, sel_presentViewController_animated_completion_, v8, v9, v0 + 10);
    return MEMORY[0x1F41881E8](v0 + 2);
  }
  id v3 = _s17PromotedContentUI9AppAdViewC010presentingF10Controller3forSo06UIViewH0CSgSo011ASCAdLockupF0C_tF_0();
  if (v3)
  {
    id v2 = v3;
    goto LABEL_5;
  }
  swift_release();
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)v0[16];
  uint64_t v12 = sub_1B5DBA938();
  sub_1B5CEFDCC(v12, (uint64_t)qword_1EB84BA88);
  id v13 = v11;
  uint64_t v14 = sub_1B5DBA918();
  os_log_type_t v15 = sub_1B5DBAD98();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = (char *)v0[16];
  if (v16)
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = v25;
    *(_DWORD *)uint64_t v18 = 136315138;
    id v19 = objc_msgSend(*(id *)&v17[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    uint64_t v20 = sub_1B5DBAAF8();
    unint64_t v22 = v21;

    v0[10] = sub_1B5CEE4B4(v20, v22, &v26);
    sub_1B5DBB058();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1B5CE2000, v14, v15, "Unable to determine which view controller to present from for promoted content with identifier %s.", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v25, -1, -1);
    MEMORY[0x1BA9AC560](v18, -1, -1);
  }
  else
  {
  }
  os_log_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_1B5D8B8E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  return MEMORY[0x1F4188298](sub_1B5D8B9EC, v2, v1);
}

uint64_t sub_1B5D8B9EC()
{
  double v31 = v0;
  swift_release();
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = (void *)v0[16];
  uint64_t v3 = sub_1B5DBA938();
  sub_1B5CEFDCC(v3, (uint64_t)qword_1EB84BA88);
  id v4 = v1;
  id v5 = v2;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = sub_1B5DBA918();
  os_log_type_t v9 = sub_1B5DBAD88();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[15];
  uint64_t v12 = (char *)v0[16];
  if (v10)
  {
    os_log_type_t type = v9;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = v29;
    *(_DWORD *)uint64_t v13 = 138478083;
    v0[10] = v11;
    id v14 = v11;
    sub_1B5DBB058();
    *uint64_t v27 = v11;

    *(_WORD *)(v13 + 12) = 2080;
    id v15 = objc_msgSend(*(id *)&v12[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    uint64_t v16 = sub_1B5DBAAF8();
    unint64_t v18 = v17;

    v0[10] = sub_1B5CEE4B4(v16, v18, &v30);
    sub_1B5DBB058();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1B5CE2000, v8, type, "Presented view controller %{private}@ for promoted content with identifier %s.", (uint8_t *)v13, 0x16u);
    sub_1B5CECC98(&qword_1EB847B60);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v27, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v29, -1, -1);
    MEMORY[0x1BA9AC560](v13, -1, -1);
  }
  else
  {
  }
  uint64_t v19 = v0[16] + OBJC_IVAR___APPCPromotedContentView_interactionDelegate;
  uint64_t v20 = MEMORY[0x1BA9AC660](v19);
  unint64_t v21 = (void *)v0[20];
  if (v20)
  {
    uint64_t v22 = v0[15];
    uint64_t v23 = *(void *)(v19 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v23 + 16))(v22, v21, ObjectType, v23);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_1B5D8BD0C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB8496E0);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5DB9868();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v30 - v11;
  uint64_t result = (uint64_t)sub_1B5D8ECD8(a1);
  if ((result & 1) == 0)
  {
    unint64_t v36 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1B5DBA938();
    sub_1B5CEFDCC(v14, (uint64_t)qword_1EB84BA88);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v35 = a1;
    v34(v12, a1, v7);
    id v15 = sub_1B5DBA918();
    os_log_type_t v16 = sub_1B5DBAD88();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v32 = v1;
      unint64_t v18 = (uint8_t *)v17;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v38 = v31;
      uint64_t v33 = v6;
      *(_DWORD *)unint64_t v18 = 136380675;
      v30[1] = v18 + 4;
      sub_1B5D8F38C(&qword_1E9DA6098, MEMORY[0x1E4F276F0]);
      uint64_t v19 = sub_1B5DBB3A8();
      uint64_t v37 = sub_1B5CEE4B4(v19, v20, &v38);
      id v6 = v33;
      sub_1B5DBB058();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
      _os_log_impl(&dword_1B5CE2000, v15, v16, "Attempting to open URL %{private}s as a deeplink.", v18, 0xCu);
      uint64_t v21 = v31;
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v21, -1, -1);
      uint64_t v22 = v18;
      uint64_t v2 = v32;
      MEMORY[0x1BA9AC560](v22, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    }

    uint64_t v23 = sub_1B5DBACD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 1, 1, v23);
    os_log_type_t v24 = v36;
    v34(v36, v35, v7);
    sub_1B5DBACB8();
    id v25 = v2;
    uint64_t v26 = sub_1B5DBACA8();
    unint64_t v27 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v28 = (char *)swift_allocObject();
    uint64_t v29 = MEMORY[0x1E4FBCFD8];
    *((void *)v28 + 2) = v26;
    *((void *)v28 + 3) = v29;
    *((void *)v28 + 4) = v25;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v28[v27], v24, v7);
    sub_1B5CEF980((uint64_t)v6, (uint64_t)&unk_1E9DA60B0, (uint64_t)v28);
    return swift_release();
  }
  return result;
}

uint64_t sub_1B5D8C124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[6] = sub_1B5DBACB8();
  v5[7] = sub_1B5DBACA8();
  id v6 = (void *)swift_task_alloc();
  v5[8] = v6;
  *id v6 = v5;
  v6[1] = sub_1B5D8C1D4;
  return sub_1B5D79E24();
}

uint64_t sub_1B5D8C1D4(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1B5DBAC98();
    uint64_t v7 = v6;
    uint64_t v8 = sub_1B5D8C7CC;
    uint64_t v9 = v5;
    uint64_t v10 = v7;
  }
  else
  {
    *(unsigned char *)(v4 + 112) = a1 & 1;
    uint64_t v11 = sub_1B5DBAC98();
    uint64_t v10 = v12;
    *(void *)(v4 + 80) = v11;
    *(void *)(v4 + 88) = v12;
    uint64_t v8 = sub_1B5D8C368;
    uint64_t v9 = v11;
  }
  return MEMORY[0x1F4188298](v8, v9, v10);
}

uint64_t sub_1B5D8C368()
{
  uint64_t v20 = v0;
  if (*(unsigned char *)(v0 + 112) == 1)
  {
    uint64_t v1 = *(void **)(*(void *)(v0 + 32)
                  + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController);
    *(void *)(v0 + 96) = v1;
    id v2 = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_1B5D8C62C;
    return sub_1B5D8B4B8((uint64_t)v2);
  }
  else
  {
    swift_release();
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void **)(v0 + 40);
    uint64_t v6 = sub_1B5DBA938();
    sub_1B5CEFDCC(v6, (uint64_t)qword_1EB84BA88);
    id v7 = v5;
    uint64_t v8 = sub_1B5DBA918();
    os_log_type_t v9 = sub_1B5DBAD88();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = *(char **)(v0 + 40);
    if (v10)
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v19 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      id v14 = objc_msgSend(*(id *)&v11[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
      uint64_t v15 = sub_1B5DBAAF8();
      unint64_t v17 = v16;

      *(void *)(v0 + 24) = sub_1B5CEE4B4(v15, v17, &v19);
      sub_1B5DBB058();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B5CE2000, v8, v9, "Failed to load product using StoreKit for promoted content with identifier %s.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v13, -1, -1);
      MEMORY[0x1BA9AC560](v12, -1, -1);
    }
    else
    {
    }
    unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

uint64_t sub_1B5D8C62C()
{
  uint64_t v1 = *v0;
  id v2 = *(void **)(*v0 + 96);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = *(void *)(v1 + 80);
  return MEMORY[0x1F4188298](sub_1B5D8C76C, v4, v3);
}

uint64_t sub_1B5D8C76C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B5D8C7CC()
{
  swift_release();
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = sub_1B5DBA938();
  sub_1B5CEFDCC(v2, (uint64_t)qword_1EB84BA88);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_1B5DBA918();
  os_log_type_t v6 = sub_1B5DBAD98();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[9];
  if (v7)
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    BOOL v10 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    sub_1B5DBB058();
    *BOOL v10 = v12;

    _os_log_impl(&dword_1B5CE2000, v5, v6, "%@", v9, 0xCu);
    sub_1B5CECC98(&qword_1EB847B60);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v10, -1, -1);
    MEMORY[0x1BA9AC560](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_1B5D8C9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  uint64_t v6 = sub_1B5DB9868();
  v5[20] = v6;
  v5[21] = *(void *)(v6 - 8);
  v5[22] = swift_task_alloc();
  sub_1B5DBACB8();
  v5[23] = sub_1B5DBACA8();
  uint64_t v8 = sub_1B5DBAC98();
  v5[24] = v8;
  v5[25] = v7;
  return MEMORY[0x1F4188298](sub_1B5D8CACC, v8, v7);
}

uint64_t sub_1B5D8CACC()
{
  sub_1B5D2CFF0(v0[18] + OBJC_IVAR___APPCPromotedContentView_urlOpener, (uint64_t)(v0 + 11));
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[15];
  sub_1B5D0D21C(v0 + 11, v1);
  sub_1B5DB9EE8();
  sub_1B5CECC98(&qword_1E9DA60A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5DBDA20;
  id v4 = (void *)*MEMORY[0x1E4FB26D0];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB26D0];
  *(void *)(inited + 64) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 40) = 1;
  id v5 = v4;
  unint64_t v6 = sub_1B5D45F8C(inited);
  v0[26] = v6;
  uint64_t v10 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  v0[27] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1B5D8CC78;
  uint64_t v8 = v0[22];
  return v10(v8, v6, v1, v2);
}

uint64_t sub_1B5D8CC78(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 176);
  uint64_t v5 = *(void *)(*v1 + 168);
  uint64_t v6 = *(void *)(*v1 + 160);
  *(unsigned char *)(v3 + 256) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(void *)(v3 + 224) = v7;
  *(void *)(v3 + 232) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v4, v6);
  uint64_t v8 = *(void *)(v2 + 200);
  uint64_t v9 = *(void *)(v2 + 192);
  return MEMORY[0x1F4188298](sub_1B5D8CE34, v9, v8);
}

uint64_t sub_1B5D8CE34()
{
  char v1 = *(unsigned char *)(v0 + 256);
  sub_1B5CEE588(v0 + 88);
  if (v1)
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 160);
    uint64_t v7 = *(void **)(v0 + 144);
    sub_1B5DB9EE8();
    uint64_t v8 = (objc_class *)type metadata accessor for SafariViewController();
    uint64_t v9 = (char *)objc_allocWithZone(v8);
    *(void *)&v9[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationObserver] = 0;
    *(void *)&v9[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationCloseObserver] = 0;
    *(void *)&v9[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationOpenObserver] = 0;
    uint64_t v10 = &v9[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime];
    uint64_t v11 = sub_1B5DB99A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    *(void *)&v9[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate + 8] = 0;
    *(void *)(swift_unknownObjectWeakInit() + 8) = &off_1F0EEAEE8;
    swift_unknownObjectWeakAssign();
    id v12 = v7;
    uint64_t v13 = (void *)sub_1B5DB9818();
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F3AEC0]), sel_init);
    *(void *)(v0 + 128) = v9;
    *(void *)(v0 + 136) = v8;
    id v15 = objc_msgSendSuper2((objc_super *)(v0 + 128), sel_initWithURL_configuration_, v13, v14);
    *(void *)(v0 + 240) = v15;

    v4(v5, v6);
    objc_msgSend(v15, sel_setModalPresentationStyle_, 5);
    unint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v16;
    *unint64_t v16 = v0;
    v16[1] = sub_1B5D8D094;
    return sub_1B5D8B4B8((uint64_t)v15);
  }
}

uint64_t sub_1B5D8D094()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 200);
  uint64_t v3 = *(void *)(v1 + 192);
  return MEMORY[0x1F4188298](sub_1B5D8D1B4, v3, v2);
}

uint64_t sub_1B5D8D1B4()
{
  uint64_t v1 = *(void **)(v0 + 240);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1B5D8D224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_1B5DBACB8();
  v5[3] = sub_1B5DBACA8();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_1B5D34240;
  return sub_1B5D8B4B8(a5);
}

uint64_t sub_1B5D8D2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  v5[7] = a1;
  uint64_t v6 = sub_1B5DB9868();
  v5[10] = v6;
  v5[11] = *(void *)(v6 - 8);
  v5[12] = swift_task_alloc();
  sub_1B5DBACB8();
  v5[13] = sub_1B5DBACA8();
  uint64_t v8 = sub_1B5DBAC98();
  v5[14] = v8;
  v5[15] = v7;
  return MEMORY[0x1F4188298](sub_1B5D8D3D8, v8, v7);
}

uint64_t sub_1B5D8D3D8()
{
  sub_1B5D2CFF0(v0[8] + OBJC_IVAR___APPCPromotedContentView_urlOpener, (uint64_t)(v0 + 2));
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_1B5D0D21C(v0 + 2, v1);
  sub_1B5DB9EE8();
  unint64_t v3 = sub_1B5D45F8C(MEMORY[0x1E4FBC860]);
  v0[16] = v3;
  uint64_t v7 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[17] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1B5D8D530;
  uint64_t v5 = v0[12];
  return v7(v5, v3, v1, v2);
}

uint64_t sub_1B5D8D530(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 96);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 80);
  *(unsigned char *)(*v1 + 144) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 120);
  uint64_t v7 = *(void *)(v2 + 112);
  return MEMORY[0x1F4188298](sub_1B5D8D6D8, v7, v6);
}

uint64_t sub_1B5D8D6D8()
{
  char v1 = *(unsigned char *)(v0 + 144);
  uint64_t v2 = *(unsigned char **)(v0 + 56);
  swift_release();
  *uint64_t v2 = v1;
  sub_1B5CEE588(v0 + 16);
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1B5D8D760()
{
  return swift_continuation_resume();
}

uint64_t sub_1B5D8D768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  uint64_t v6 = sub_1B5DB9868();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  sub_1B5DBACB8();
  v5[16] = sub_1B5DBACA8();
  uint64_t v8 = sub_1B5DBAC98();
  v5[17] = v8;
  v5[18] = v7;
  return MEMORY[0x1F4188298](sub_1B5D8D878, v8, v7);
}

uint64_t sub_1B5D8D878()
{
  sub_1B5D2CFF0(v0[9] + OBJC_IVAR___APPCPromotedContentView_urlOpener, (uint64_t)(v0 + 2));
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_1B5D0D21C(v0 + 2, v1);
  unint64_t v3 = sub_1B5D45F8C(MEMORY[0x1E4FBC860]);
  v0[19] = v3;
  uint64_t v7 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v2 + 16) + **(int **)(v2 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[20] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1B5D8D9C0;
  uint64_t v5 = v0[10];
  return v7(v5, v3, v1, v2);
}

uint64_t sub_1B5D8D9C0(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 184) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 136);
  return MEMORY[0x1F4188298](sub_1B5D8DB0C, v4, v3);
}

uint64_t sub_1B5D8DB0C()
{
  char v1 = *(unsigned char *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 80);
  sub_1B5CEE588(v0 + 16);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v2, v5, v3);
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 88));
LABEL_3:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  uint64_t v9 = sub_1B5DB9848();
  if (v10)
  {
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v11 = *(void *)(v0 + 120);
    uint64_t v13 = *(void *)(v0 + 88);
    if (v9 == 1886680168 && v10 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      v6(v12, v11, v13);
LABEL_19:
      uint64_t v23 = *(void *)(v0 + 120);
      uint64_t v24 = *(void *)(v0 + 88);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
      v22(*(void *)(v0 + 112), v24);
      v22(v23, v24);
      goto LABEL_20;
    }
    char v15 = sub_1B5DBB3C8();
    swift_bridgeObjectRelease();
    v6(v12, v11, v13);
    if (v15) {
      goto LABEL_19;
    }
  }
  else
  {
    v6(*(void *)(v0 + 112), *(void *)(v0 + 120), *(void *)(v0 + 88));
  }
  uint64_t v16 = sub_1B5DB9848();
  if (!v17)
  {
    uint64_t v37 = *(void *)(v0 + 120);
    uint64_t v38 = *(void *)(v0 + 88);
    os_log_t v39 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
    v39(*(void *)(v0 + 112), v38);
    v39(v37, v38);
    goto LABEL_3;
  }
  uint64_t v19 = *(void *)(v0 + 112);
  uint64_t v18 = *(void *)(v0 + 120);
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v21 = *(void *)(v0 + 96);
  if (v16 == 0x7370747468 && v17 == 0xE500000000000000)
  {
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v22(*(void *)(v0 + 112), *(void *)(v0 + 88));
    v22(v18, v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v40 = sub_1B5DBB3C8();
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v22(v19, v20);
    v22(v18, v20);
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0) {
      goto LABEL_3;
    }
  }
LABEL_20:
  uint64_t v25 = *(void *)(v0 + 104);
  uint64_t v26 = *(void *)(v0 + 88);
  unint64_t v27 = *(void **)(v0 + 72);
  v6(v25, *(void *)(v0 + 80), v26);
  uint64_t v28 = (objc_class *)type metadata accessor for SafariViewController();
  uint64_t v29 = (char *)objc_allocWithZone(v28);
  *(void *)&v29[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationObserver] = 0;
  *(void *)&v29[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationCloseObserver] = 0;
  *(void *)&v29[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_notificationOpenObserver] = 0;
  uint64_t v30 = &v29[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_backgroundedTime];
  uint64_t v31 = sub_1B5DB99A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
  *(void *)&v29[OBJC_IVAR____TtC17PromotedContentUI20SafariViewController_actionDelegate + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = &off_1F0EEAEE8;
  swift_unknownObjectWeakAssign();
  id v32 = v27;
  uint64_t v33 = (void *)sub_1B5DB9818();
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F3AEC0]), sel_init);
  *(void *)(v0 + 56) = v29;
  *(void *)(v0 + 64) = v28;
  id v35 = objc_msgSendSuper2((objc_super *)(v0 + 56), sel_initWithURL_configuration_, v33, v34);
  *(void *)(v0 + 168) = v35;

  v22(v25, v26);
  unint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v36;
  *unint64_t v36 = v0;
  v36[1] = sub_1B5D8DFAC;
  return sub_1B5D8B4B8((uint64_t)v35);
}

uint64_t sub_1B5D8DFAC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x1F4188298](sub_1B5D8E0CC, v3, v2);
}

uint64_t sub_1B5D8E0CC()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void *sub_1B5D8E150(uint64_t a1, void *a2)
{
  uint64_t v16 = a2;
  sub_1B5DBA738();
  id v4 = a2;
  sub_1B5CECC98(&qword_1E9DA60B8);
  if (swift_dynamicCast())
  {
    sub_1B5D453D4(v14, (uint64_t)v17);
    uint64_t v5 = v18;
    uint64_t v6 = v19;
    sub_1B5D0D21C(v17, v18);
    uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v6 + 16))(a1, &off_1F0EEAEE8, v5, v6);
    uint64_t v8 = v7;
    if (v7) {
      objc_msgSend(v7, sel_setModalPresentationStyle_, 5);
    }
    sub_1B5CEE588((uint64_t)v17);
  }
  else
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_1B5CEF924((uint64_t)v14, qword_1E9DA60C0);
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1B5DBA938();
    sub_1B5CEFDCC(v9, (uint64_t)qword_1EB84BA88);
    uint64_t v10 = sub_1B5DBA918();
    os_log_type_t v11 = sub_1B5DBAD98();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1B5CE2000, v10, v11, "Tap action does not conform to OtherPresentableActions protocol.", v12, 2u);
      MEMORY[0x1BA9AC560](v12, -1, -1);
    }

    return 0;
  }
  return v8;
}

uint64_t sub_1B5D8E30C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B5CE6DD8;
  return sub_1B5D8B3FC(a1, v4, v5, v7, v6);
}

uint64_t sub_1B5D8E3CC(void *a1, uint64_t a2, uint64_t a3, char *a4)
{
  v59.super_class = (Class)swift_getObjectType();
  uint64_t v7 = &a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionResult];
  uint64_t v8 = *MEMORY[0x1E4F93D38];
  uint64_t v9 = sub_1B5DB9E88();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v7, v8, v9);
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_notificationObserver] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_notificationOpenObserver] = 0;
  uint64_t v10 = &a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_backgroundedTime];
  uint64_t v11 = sub_1B5DB99A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController;
  id v13 = objc_allocWithZone(MEMORY[0x1E4F3C310]);
  id v14 = a4;
  *(void *)&a4[v12] = objc_msgSend(v13, sel_init);
  *(void *)&v14[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_adamIdentifier] = a1;
  sub_1B5CECC98((uint64_t *)&unk_1E9DA58E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5DBDA20;
  *(void *)(inited + 32) = sub_1B5DBAAF8();
  *(void *)(inited + 40) = v16;
  *(void *)(inited + 72) = sub_1B5CEF5DC(0, &qword_1E9DA58A0);
  *(void *)(inited + 48) = a1;
  id v58 = a1;
  unint64_t v17 = sub_1B5D455F4(inited);
  int64_t v18 = 0;
  v59.receiver = v14;
  uint64_t v19 = (unint64_t *)&v14[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductInfo];
  unint64_t *v19 = v17;
  uint64_t v60 = a2 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & *(void *)(a2 + 64);
  int64_t v61 = (unint64_t)(v20 + 63) >> 6;
  while (1)
  {
    if (v22)
    {
      unint64_t v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v25 = v24 | (v18 << 6);
      goto LABEL_26;
    }
    int64_t v26 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_41;
    }
    if (v26 >= v61) {
      break;
    }
    unint64_t v27 = *(void *)(v60 + 8 * v26);
    ++v18;
    if (!v27)
    {
      int64_t v18 = v26 + 1;
      if (v26 + 1 >= v61) {
        break;
      }
      unint64_t v27 = *(void *)(v60 + 8 * v18);
      if (!v27)
      {
        int64_t v18 = v26 + 2;
        if (v26 + 2 >= v61) {
          break;
        }
        unint64_t v27 = *(void *)(v60 + 8 * v18);
        if (!v27)
        {
          int64_t v18 = v26 + 3;
          if (v26 + 3 >= v61) {
            break;
          }
          unint64_t v27 = *(void *)(v60 + 8 * v18);
          if (!v27)
          {
            int64_t v18 = v26 + 4;
            if (v26 + 4 >= v61) {
              break;
            }
            unint64_t v27 = *(void *)(v60 + 8 * v18);
            if (!v27)
            {
              int64_t v28 = v26 + 5;
              if (v28 >= v61) {
                break;
              }
              unint64_t v27 = *(void *)(v60 + 8 * v28);
              if (!v27)
              {
                while (1)
                {
                  int64_t v18 = v28 + 1;
                  if (__OFADD__(v28, 1)) {
                    goto LABEL_42;
                  }
                  if (v18 >= v61) {
                    goto LABEL_37;
                  }
                  unint64_t v27 = *(void *)(v60 + 8 * v18);
                  ++v28;
                  if (v27) {
                    goto LABEL_25;
                  }
                }
              }
              int64_t v18 = v28;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v22 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v18 << 6);
LABEL_26:
    uint64_t v29 = 16 * v25;
    uint64_t v30 = (uint64_t *)(*(void *)(a2 + 48) + v29);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = (uint64_t *)(*(void *)(a2 + 56) + v29);
    uint64_t v34 = *v33;
    uint64_t v35 = v33[1];
    uint64_t v66 = MEMORY[0x1E4FBB1A0];
    *(void *)&long long v65 = v34;
    *((void *)&v65 + 1) = v35;
    swift_beginAccess();
    sub_1B5CE93C4(&v65, v64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v63 = (void *)*v19;
    uint64_t v37 = v63;
    unint64_t *v19 = 0x8000000000000000;
    unint64_t v39 = sub_1B5CE76AC(v32, v31);
    uint64_t v40 = v37[2];
    BOOL v41 = (v38 & 1) == 0;
    uint64_t v42 = v40 + v41;
    if (__OFADD__(v40, v41))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    char v43 = v38;
    if (v37[3] >= v42)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v46 = v63;
        if (v38) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_1B5DB6718();
        uint64_t v46 = v63;
        if (v43) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_1B5DAF73C(v42, isUniquelyReferenced_nonNull_native);
      unint64_t v44 = sub_1B5CE76AC(v32, v31);
      if ((v43 & 1) != (v45 & 1)) {
        goto LABEL_44;
      }
      unint64_t v39 = v44;
      uint64_t v46 = v63;
      if (v43)
      {
LABEL_4:
        uint64_t v23 = (_OWORD *)(v46[7] + 32 * v39);
        sub_1B5CEE588((uint64_t)v23);
        sub_1B5CE93C4(v64, v23);
        goto LABEL_5;
      }
    }
    v46[(v39 >> 6) + 8] |= 1 << v39;
    char v47 = (uint64_t *)(v46[6] + 16 * v39);
    *char v47 = v32;
    v47[1] = v31;
    sub_1B5CE93C4(v64, (_OWORD *)(v46[7] + 32 * v39));
    uint64_t v48 = v46[2];
    BOOL v49 = __OFADD__(v48, 1);
    uint64_t v50 = v48 + 1;
    if (v49) {
      goto LABEL_40;
    }
    v46[2] = v50;
    swift_bridgeObjectRetain();
LABEL_5:
    unint64_t *v19 = (unint64_t)v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_37:
  swift_release();

  objc_super v62 = v59;
  uint64_t v51 = (char *)objc_msgSendSuper2(&v62, sel_init);
  uint64_t v52 = OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController;
  id v53 = *(void **)&v51[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController];
  unint64_t v54 = v51;
  objc_msgSend(v53, sel_setDelegate_, v54);
  id v55 = objc_msgSend(*(id *)&v51[v52], sel_view);
  if (v55)
  {
    CGFloat v56 = v55;
    objc_msgSend(v55, sel_setAutoresizingMask_, 18);

    *(void *)&v54[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionDelegate + 8] = &off_1F0EEAEE8;
    swift_unknownObjectWeakAssign();
    return (uint64_t)v54;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  uint64_t result = sub_1B5DBB418();
  __break(1u);
  return result;
}

uint64_t sub_1B5D8E984(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B5CF0990;
  return sub_1B5D8C124(a1, v4, v5, v7, v6);
}

uint64_t sub_1B5D8EA48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B5CF0990;
  return sub_1B5D8D2E0(a1, v4, v5, v7, v6);
}

uint64_t sub_1B5D8EB0C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B5CF0990;
  return sub_1B5D8D224(a1, v4, v5, v7, v6);
}

uint64_t sub_1B5D8EBD0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B5D8EC18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B5CF0990;
  return sub_1B5D8C9D8(a1, v4, v5, v7, v6);
}

id sub_1B5D8ECD8(uint64_t a1)
{
  uint64_t v2 = sub_1B5DB9868();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_sharedApplication);
  id v8 = objc_msgSend(v7, sel_delegate);

  if (!v8) {
    return 0;
  }
  id v9 = objc_msgSend(self, sel_mainBundle);
  id v10 = objc_msgSend(v9, sel_bundleIdentifier);

  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v32 = v3;
  uint64_t v11 = sub_1B5DBAAF8();
  uint64_t v13 = v12;

  if (v11 != 0x6C7070612E6D6F63 || v13 != 0xEE007377656E2E65)
  {
    char v14 = sub_1B5DBB3C8();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_7;
    }
LABEL_15:
    swift_unknownObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
LABEL_7:
  if ((sub_1B5D74A88() & 1) == 0) {
    goto LABEL_15;
  }
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1B5DBA938();
  sub_1B5CEFDCC(v15, (uint64_t)qword_1EB84BA88);
  uint64_t v16 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v5, a1, v2);
  unint64_t v17 = sub_1B5DBA918();
  os_log_type_t v18 = sub_1B5DBAD88();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    uint64_t v30 = v19;
    *(_DWORD *)uint64_t v19 = 136380675;
    uint64_t v29 = v19 + 4;
    sub_1B5D8F38C(&qword_1E9DA6098, MEMORY[0x1E4F276F0]);
    uint64_t v20 = sub_1B5DBB3A8();
    uint64_t v33 = sub_1B5CEE4B4(v20, v21, &v34);
    sub_1B5DBB058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v2);
    unint64_t v22 = v30;
    _os_log_impl(&dword_1B5CE2000, v17, v18, "Attempting to open %{private}s within News.", v30, 0xCu);
    uint64_t v23 = v31;
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v23, -1, -1);
    MEMORY[0x1BA9AC560](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v2);
  }

  if ((objc_msgSend(v8, sel_respondsToSelector_, sel_application_openURL_options_) & 1) == 0) {
    goto LABEL_15;
  }
  swift_unknownObjectRetain();
  id v24 = objc_msgSend(v6, sel_sharedApplication);
  sub_1B5D4572C(MEMORY[0x1E4FBC860]);
  unint64_t v25 = (void *)sub_1B5DB9818();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_1B5D8F38C(&qword_1E9DA50A0, type metadata accessor for OpenURLOptionsKey);
  int64_t v26 = (void *)sub_1B5DBAA38();
  id v27 = objc_msgSend(v8, sel_application_openURL_options_, v24, v25, v26);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();

  return v27;
}

uint64_t sub_1B5D8F1BC()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B5D8F290(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1B5DB9868() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1B5CF0990;
  return sub_1B5D8D768(a1, v5, v6, v7, v8);
}

uint64_t sub_1B5D8F38C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B5D8F3D4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakObj()
{
  return sub_1B5CE6D2C();
}

uint64_t _s17PromotedContentUI15WeakMetricsViewCMa_0()
{
  return self;
}

double sub_1B5D8F454()
{
  type metadata accessor for MetricsViewTracker();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_1B5D48A8C(MEMORY[0x1E4FBC860]);
  uint64_t v1 = sub_1B5D90490(0, 3);
  *(void *)(v0 + 24) = 3;
  *(void *)(v0 + 32) = v1;
  *(void *)&double result = 2;
  *(_OWORD *)(v0 + 40) = xmmword_1B5DC0850;
  qword_1EB84BA28 = v0;
  return result;
}

void sub_1B5D8F4BC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1B5DBAF18();
  uint64_t v7 = v2 + 2;
  swift_beginAccess();
  if (!*(void *)(v2[2] + 16) || (sub_1B5D4832C(v6), (v8 & 1) == 0))
  {
    swift_endAccess();
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = *v7;
    *uint64_t v7 = 0x8000000000000000;
    sub_1B5DB232C(MEMORY[0x1E4FBC860], v6, isUniquelyReferenced_nonNull_native);
    *uint64_t v7 = v34;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_1B5DBADA8();
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
  id v10 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B5DBDCA0;
  *(void *)(v11 + 56) = type metadata accessor for MetricsView();
  *(void *)(v11 + 64) = sub_1B5D90590();
  *(void *)(v11 + 32) = a2;
  *(void *)(v11 + 96) = sub_1B5CEF5DC(0, &qword_1EB847E98);
  *(void *)(v11 + 104) = sub_1B5D905E8();
  *(void *)(v11 + 72) = a1;
  id v12 = a2;
  id v13 = a1;
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  if (sub_1B5D8F9C8(v6, v12)) {
    goto LABEL_10;
  }
  swift_beginAccess();
  uint64_t v15 = sub_1B5D84C68(v33, v6);
  if (!*v14)
  {
    ((void (*)(void *, void))v15)(v33, 0);
    goto LABEL_9;
  }
  uint64_t v16 = v14;
  _s17PromotedContentUI15WeakMetricsViewCMa_0();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = swift_unknownObjectWeakAssign();
  MEMORY[0x1BA9AB370](v17);
  if (*(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_32;
  }
  while (1)
  {
    sub_1B5DBAC88();
    sub_1B5DBAC58();
    ((void (*)(void *, void))v15)(v33, 0);
LABEL_9:
    swift_endAccess();
LABEL_10:
    uint64_t v15 = (void (*)(void *))(v3 + 3);
    swift_beginAccess();
    unint64_t v18 = v3[5];
    if ((v18 & 0x8000000000000000) != 0)
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
      goto LABEL_31;
    }
    uint64_t v19 = v3[4];
    if (v18 >= *(void *)(v19 + 16)) {
      goto LABEL_27;
    }
    if (!*(void *)(v19 + 8 * v18 + 32))
    {
      sub_1B5CECC98(&qword_1EB848DA0);
      uint64_t v20 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_unknownObjectWeakAssign();
      swift_beginAccess();
      sub_1B5D8FC1C(v20);
      swift_endAccess();
      swift_release();
      unint64_t v18 = v3[5];
      if ((v18 & 0x8000000000000000) != 0) {
        goto LABEL_28;
      }
      uint64_t v19 = v3[4];
    }
    if (v18 >= *(void *)(v19 + 16)) {
      goto LABEL_29;
    }
    uint64_t v21 = *(void *)(v19 + 8 * v18 + 32);
    if (v21)
    {
      uint64_t v22 = MEMORY[0x1BA9AC660](v21 + 16);
      if (v22)
      {
        uint64_t v23 = (void *)v22;
        id v24 = v13;
        id v25 = v23;
        LOBYTE(v23) = sub_1B5DBAF08();

        if (v23) {
          return;
        }
      }
    }
    unint64_t v26 = v3[6];
    if ((v26 & 0x8000000000000000) != 0) {
      goto LABEL_30;
    }
    uint64_t v27 = v3[4];
    if (v26 < *(void *)(v27 + 16)) {
      break;
    }
LABEL_31:
    __break(1u);
LABEL_32:
    sub_1B5DBAC68();
  }
  uint64_t v28 = *(void *)(v27 + 8 * v26 + 32);
  if (v28 && (uint64_t v29 = (void *)MEMORY[0x1BA9AC660](v28 + 16)) != 0)
  {
    uint64_t v30 = v29;
    sub_1B5D8FCF8(v29);
    sub_1B5CECC98(&qword_1EB848DA0);
    uint64_t v31 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    swift_beginAccess();
    sub_1B5D8FC1C(v31);
    swift_endAccess();
    swift_release();
  }
  else
  {
    sub_1B5CECC98(&qword_1EB848DA0);
    uint64_t v32 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    swift_beginAccess();
    sub_1B5D8FC1C(v32);
    swift_endAccess();
    swift_release();
  }
}

BOOL sub_1B5D8F9C8(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 16);
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1B5D4832C(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
    swift_endAccess();
    uint64_t v22 = MEMORY[0x1E4FBC860];
    if (v7 >> 62) {
      goto LABEL_21;
    }
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v9 = a2;
    swift_bridgeObjectRetain();
    for (; v8; uint64_t v8 = sub_1B5DBB2E8())
    {
      unint64_t v10 = 0;
      while (1)
      {
        if ((v7 & 0xC000000000000001) != 0)
        {
          uint64_t v11 = MEMORY[0x1BA9AB990](v10, v7);
          unint64_t v12 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
          goto LABEL_11;
        }
        if (v10 >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          break;
        }
        uint64_t v11 = *(void *)(v7 + 8 * v10 + 32);
        swift_retain();
        unint64_t v12 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_17;
        }
LABEL_11:
        uint64_t v13 = MEMORY[0x1BA9AC660](v11 + 16);
        if (!v13) {
          goto LABEL_6;
        }
        char v14 = (void *)v13;
        type metadata accessor for MetricsView();
        id v15 = a2;
        id v16 = v14;
        LOBYTE(v14) = sub_1B5DBAF08();

        if (v14)
        {
          sub_1B5DBB268();
          sub_1B5DBB288();
          sub_1B5DBB298();
          sub_1B5DBB278();
        }
        else
        {
LABEL_6:
          swift_release();
        }
        ++v10;
        if (v12 == v8)
        {
          uint64_t v18 = v22;
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_21:
      id v19 = a2;
      swift_bridgeObjectRetain();
    }
    uint64_t v18 = MEMORY[0x1E4FBC860];
LABEL_23:
    swift_bridgeObjectRelease();

    if (v18 < 0 || (v18 & 0x4000000000000000) != 0) {
      uint64_t v20 = sub_1B5DBB2E8();
    }
    else {
      uint64_t v20 = *(void *)(v18 + 16);
    }
    swift_release();
    return v20 != 0;
  }
  else
  {
LABEL_18:
    swift_endAccess();
    return 0;
  }
}

uint64_t sub_1B5D8FC1C(uint64_t result)
{
  uint64_t v2 = v1[2];
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = *v1;
  if (!*v1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v4 == 0x8000000000000000 && v5 == -1) {
    goto LABEL_16;
  }
  uint64_t v7 = result;
  unint64_t v8 = v4 % v5;
  uint64_t v9 = v1[1];
  v1[2] = v4 % v5;
  swift_retain();
  double result = swift_isUniquelyReferenced_nonNull_native();
  v1[1] = v9;
  if ((result & 1) == 0) {
LABEL_13:
  }
    sub_1B5D4F11C();
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v8 < *(void *)(v9 + 16))
  {
    swift_release();
    *(void *)(v9 + 8 * v8 + 32) = v7;
    double result = sub_1B5DBAC58();
    v1[3] = (uint64_t)(v8 + 1) % v5;
    return result;
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_1B5D8FCF8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5DBAF18();
  uint64_t v5 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 16);
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1B5D4832C(v4), (v8 & 1) != 0))
  {
    unint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    uint64_t v48 = v9;
    swift_endAccess();
    if (v9 >> 62) {
      goto LABEL_34;
    }
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (i = (uint64_t *)(v2 + 16); v10; i = v5)
    {
      if (v10 < 1) {
        goto LABEL_48;
      }
      uint64_t v5 = (uint64_t *)v10;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      unint64_t v46 = v9 & 0xC000000000000001;
      uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v44 = v10;
      unint64_t v45 = v9;
      while (1)
      {
        if (v46)
        {
          uint64_t v14 = MEMORY[0x1BA9AB990](v12, v9);
        }
        else
        {
          uint64_t v14 = *(void *)(v9 + 8 * v12 + 32);
          swift_retain();
        }
        uint64_t v15 = MEMORY[0x1BA9AC660](v14 + 16);
        if (v15) {
          break;
        }
        swift_release();
LABEL_8:
        if (v5 == (uint64_t *)++v12) {
          goto LABEL_36;
        }
      }
      id v16 = (void *)v15;
      uint64_t v17 = OBJC_IVAR___APPCMetricsView_promotedContent;
      unsigned int v18 = objc_msgSend(objc_msgSend(*(id *)(v15 + OBJC_IVAR___APPCMetricsView_promotedContent), sel_metricsHelper), sel_hasBeenOnScreen);
      uint64_t v19 = swift_unknownObjectRelease();
      if (v18)
      {
        uint64_t v20 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v16) + 0x408);
        uint64_t v21 = v20(v19);
        if (!v21) {
          goto LABEL_17;
        }
        uint64_t v22 = (void *)v21;
        type metadata accessor for WebAdView();
        if (!swift_dynamicCastClass())
        {
          swift_release();

          id v16 = v22;
          goto LABEL_19;
        }

        unsigned __int8 v23 = objc_msgSend(objc_msgSend(*(id *)((char *)v16 + v17), sel_metricsHelper), sel_isCurrentlyOnScreen);
        uint64_t v24 = swift_unknownObjectRelease();
        if (v23)
        {
LABEL_17:
          swift_release();
LABEL_19:
          uint64_t v5 = (uint64_t *)v44;
          unint64_t v9 = v45;
          goto LABEL_30;
        }
        uint64_t v25 = v20(v24);
        if (v25)
        {
          unint64_t v26 = (void *)v25;
          if (swift_dynamicCastClass())
          {
            objc_msgSend(v16, sel_setReady_, 0);
            sub_1B5DA703C();
            objc_msgSend(v16, sel_collapse);
          }
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v13 = sub_1B5D0990C(0, v13[2] + 1, 1, v13);
        }
        uint64_t v5 = (uint64_t *)v44;
        unint64_t v9 = v45;
        unint64_t v28 = v13[2];
        unint64_t v27 = v13[3];
        if (v28 >= v27 >> 1) {
          uint64_t v13 = sub_1B5D0990C((void *)(v27 > 1), v28 + 1, 1, v13);
        }
        v13[2] = v28 + 1;
        v13[v28 + 4] = v11;
      }
      swift_release();
LABEL_30:

      if (!__OFADD__(v11++, 1)) {
        goto LABEL_8;
      }
      __break(1u);
LABEL_34:
      swift_bridgeObjectRetain_n();
      uint64_t v10 = sub_1B5DBB2E8();
    }
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
LABEL_36:
    swift_bridgeObjectRelease();
    uint64_t v34 = v13[2];
    if (v34)
    {
      while (v34 <= v13[2])
      {
        unint64_t v35 = v13[v34 + 3];
        uint64_t v36 = v48;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || v48 < 0
          || (v48 & 0x4000000000000000) != 0)
        {
          uint64_t v36 = sub_1B5D4F118(v48);
          uint64_t v48 = v36;
        }
        uint64_t v37 = v36 & 0xFFFFFFFFFFFFFF8;
        unint64_t v38 = *(void *)(v37 + 16);
        if (v35 >= v38) {
          goto LABEL_47;
        }
        unint64_t v39 = v38 - 1;
        uint64_t v40 = v38 - 1 - v35;
        if (v40 < 0) {
          goto LABEL_49;
        }
        --v34;
        memmove((void *)(v37 + 8 * v35 + 32), (const void *)(v37 + 8 * v35 + 40), 8 * v40);
        *(void *)(v37 + 16) = v39;
        sub_1B5DBAC58();
        swift_release();
        if (!v34) {
          goto LABEL_45;
        }
      }
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      uint64_t result = sub_1B5DBB338();
      __break(1u);
    }
    else
    {
LABEL_45:
      swift_bridgeObjectRelease();
      uint64_t v41 = sub_1B5DBAF18();
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v47 = *i;
      uint64_t *i = 0x8000000000000000;
      sub_1B5DB232C(v48, v41, isUniquelyReferenced_nonNull_native);
      uint64_t *i = v47;
      swift_bridgeObjectRelease();
      return swift_endAccess();
    }
  }
  else
  {
    swift_endAccess();
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v30 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1B5DBDA20;
    *(void *)(v31 + 56) = sub_1B5CEF5DC(0, &qword_1EB847E98);
    *(void *)(v31 + 64) = sub_1B5D905E8();
    *(void *)(v31 + 32) = a1;
    id v32 = a1;
    sub_1B5DBA838();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B5D902A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t type metadata accessor for MetricsViewTracker()
{
  return self;
}

uint64_t sub_1B5D90308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1B5D90310()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5D90318(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1B5D90350(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t sub_1B5D903B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_1B5D903F0(uint64_t a1, int a2)
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

uint64_t sub_1B5D90438(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

uint64_t type metadata accessor for DistanceTracker()
{
  return sub_1B5CE6D2C();
}

uint64_t sub_1B5D90490(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_1B5DBB2B8();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      sub_1B5CECC98(&qword_1EB848DA8);
      uint64_t v4 = (void *)sub_1B5DBAC78();
      v4[2] = a2;
      char v8 = v4;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        uint64_t v5 = a2 - 2;
        if (v5)
        {
          uint64_t v6 = v4 + 6;
          do
          {
            *v6++ = a1;
            swift_retain();
            --v5;
          }
          while (v5);
        }
        swift_retain();
      }
    }
    else
    {
      char v8 = (void *)MEMORY[0x1E4FBC860];
      swift_release();
    }
    sub_1B5DBAC58();
    return (uint64_t)v8;
  }
  return result;
}

unint64_t sub_1B5D90590()
{
  unint64_t result = qword_1EB848A30;
  if (!qword_1EB848A30)
  {
    type metadata accessor for MetricsView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB848A30);
  }
  return result;
}

unint64_t sub_1B5D905E8()
{
  unint64_t result = qword_1EB848E30;
  if (!qword_1EB848E30)
  {
    sub_1B5CEF5DC(255, &qword_1EB847E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB848E30);
  }
  return result;
}

id sub_1B5D90654()
{
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8498A0);
  id result = sub_1B5D0E53C();
  byte_1EB84B978 = result & 1;
  return result;
}

void sub_1B5D9069C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, const char *a5, void (*a6)(void, void), uint64_t a7, uint64_t a8)
{
  uint64_t v84 = a7;
  uint64_t v87 = a5;
  uint64_t v88 = a6;
  uint64_t v12 = sub_1B5DB9868();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = sub_1B5DBA8C8();
  uint64_t v80 = *(void *)(v15 - 8);
  uint64_t v81 = v15;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  unsigned int v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  unint64_t v83 = (char *)&v80 - v19;
  uint64_t v20 = sub_1B5DBA878();
  uint64_t v85 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  unsigned __int8 v23 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1F4188790](v21);
  unint64_t v82 = (char *)&v80 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  id v86 = (char *)&v80 - v27;
  if (a4)
  {
    uint64_t v28 = v26;
    id v29 = a4;
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_1B5DBA938();
    sub_1B5CEFDCC(v30, (uint64_t)qword_1EB84BA88);
    id v31 = a4;
    id v32 = a4;
    uint64_t v33 = sub_1B5DBA918();
    os_log_type_t v34 = sub_1B5DBAD98();
    if (os_log_type_enabled(v33, v34))
    {
      unint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v90[0] = v36;
      *(_DWORD *)unint64_t v35 = 136315138;
      swift_getErrorValue();
      uint64_t v37 = sub_1B5DBB428();
      uint64_t v89 = sub_1B5CEE4B4(v37, v38, v90);
      sub_1B5DBB058();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B5CE2000, v33, v34, "Failed to fetch image with error: %s.", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v36, -1, -1);
      MEMORY[0x1BA9AC560](v35, -1, -1);
    }
    else
    {
    }
    uint64_t v50 = v86;
    uint64_t v51 = v83;
    if (qword_1EB847B38 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_1B5DBA8B8();
    sub_1B5CEFDCC(v52, (uint64_t)qword_1EB84B960);
    id v53 = a4;
    id v54 = a4;
    id v55 = sub_1B5DBA898();
    sub_1B5DBA8D8();
    os_signpost_type_t v56 = sub_1B5DBAE78();
    if (sub_1B5DBAFF8())
    {
      swift_retain();
      sub_1B5DBA908();
      swift_release();
      uint64_t v58 = v80;
      uint64_t v57 = v81;
      if ((*(unsigned int (**)(char *, uint64_t))(v80 + 88))(v51, v81) == *MEMORY[0x1E4FBD340])
      {
        char v59 = 0;
        char v60 = 0;
        uint64_t v87 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v58 + 8))(v51, v57);
        uint64_t v87 = "Finished with error: %s.";
        char v60 = 2;
        char v59 = 1;
      }
      uint64_t v65 = v85;
      uint64_t v66 = v82;
      (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v82, v50, v28);
      uint64_t v67 = swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      v90[0] = v68;
      *(unsigned char *)uint64_t v67 = v60;
      *(unsigned char *)(v67 + 1) = v59;
      *(_WORD *)(v67 + 2) = 2080;
      swift_getErrorValue();
      uint64_t v69 = sub_1B5DBB428();
      uint64_t v89 = sub_1B5CEE4B4(v69, v70, v90);
      sub_1B5DBB058();
      swift_bridgeObjectRelease();

      os_signpost_id_t v71 = sub_1B5DBA858();
      _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v55, v56, v71, "ImageRequester.loadImage", v87, (uint8_t *)v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v68, -1, -1);
      MEMORY[0x1BA9AC560](v67, -1, -1);

      uint64_t v72 = *(void (**)(char *, uint64_t))(v65 + 8);
      v72(v86, v28);
      v72(v66, v28);
      int64_t v61 = v88;
      if (!v88) {
        goto LABEL_28;
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v85 + 8))(v50, v28);
      int64_t v61 = v88;
      if (!v88) {
        goto LABEL_28;
      }
    }
    v61(0, 0);
LABEL_28:

    return;
  }
  if (a2 >> 60 != 15)
  {
    id v86 = (char *)sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a8, v12);
    unint64_t v62 = (*(unsigned __int8 *)(v13 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    char v63 = (char *)swift_allocObject();
    *((void *)v63 + 2) = a1;
    *((void *)v63 + 3) = a2;
    uint64_t v64 = (uint64_t)v88;
    *((void *)v63 + 4) = v87;
    *((void *)v63 + 5) = v64;
    *((void *)v63 + 6) = v84;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v63[v62], (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
    sub_1B5D92E40(a1, a2);
    swift_retain();
    sub_1B5D92E40(a1, a2);
    sub_1B5D09328(v64);
    sub_1B5DBADE8();
    sub_1B5D92CDC(a1, a2);
    swift_release();
    return;
  }
  uint64_t v39 = v26;
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_1B5DBA938();
  sub_1B5CEFDCC(v40, (uint64_t)qword_1EB84BA88);
  uint64_t v41 = sub_1B5DBA918();
  os_log_type_t v42 = sub_1B5DBAD98();
  if (os_log_type_enabled(v41, v42))
  {
    char v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v43 = 0;
    _os_log_impl(&dword_1B5CE2000, v41, v42, "Failed to fetch image.", v43, 2u);
    MEMORY[0x1BA9AC560](v43, -1, -1);
  }

  if (qword_1EB847B38 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_1B5DBA8B8();
  sub_1B5CEFDCC(v44, (uint64_t)qword_1EB84B960);
  unint64_t v45 = sub_1B5DBA898();
  sub_1B5DBA8D8();
  os_signpost_type_t v46 = sub_1B5DBAE78();
  if (sub_1B5DBAFF8())
  {
    swift_retain();
    sub_1B5DBA908();
    swift_release();
    uint64_t v48 = v80;
    uint64_t v47 = v81;
    if ((*(unsigned int (**)(char *, uint64_t))(v80 + 88))(v18, v81) == *MEMORY[0x1E4FBD340])
    {
      BOOL v49 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v47);
      BOOL v49 = "Finished with error.";
    }
    uint64_t v74 = v85;
    uint64_t v75 = v82;
    uint64_t v76 = v39;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v82, v23, v39);
    uint64_t v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v77 = 0;
    os_signpost_id_t v78 = sub_1B5DBA858();
    _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v45, v46, v78, "ImageRequester.loadImage", v49, v77, 2u);
    MEMORY[0x1BA9AC560](v77, -1, -1);

    uint64_t v79 = *(void (**)(char *, uint64_t))(v74 + 8);
    v79(v23, v76);
    v79(v75, v76);
    id v73 = v88;
    if (v88) {
      goto LABEL_34;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v85 + 8))(v23, v39);
    id v73 = v88;
    if (v88) {
LABEL_34:
    }
      v73(0, 0);
  }
}

void sub_1B5D910C8(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t), void (*a5)(void *, uint64_t), char *a6)
{
  uint64_t v99 = a6;
  v100 = a5;
  v102 = a4;
  uint64_t v104 = a3;
  uint64_t v8 = sub_1B5DB9868();
  uint64_t v94 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v94 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B5DBA8C8();
  uint64_t v95 = *(void *)(v11 - 8);
  uint64_t v96 = v11;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v92 = (char *)&v92 - v15;
  uint64_t v101 = sub_1B5DBA878();
  uint64_t v103 = *(void *)(v101 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v101);
  unsigned int v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)&v92 - v20;
  uint64_t v22 = MEMORY[0x1F4188790](v19);
  uint64_t v93 = (char *)&v92 - v23;
  MEMORY[0x1F4188790](v22);
  os_log_t v98 = (char *)&v92 - v24;
  id v25 = objc_allocWithZone(MEMORY[0x1E4FB1818]);
  unint64_t v97 = a2 >> 62;
  sub_1B5D92E54(a1, a2);
  uint64_t v26 = (void *)sub_1B5DB9878();
  id v27 = objc_msgSend(v25, sel_initWithData_, v26);
  unint64_t v105 = a2;
  uint64_t v106 = a1;
  sub_1B5D0F2B8(a1, a2);

  if (v27)
  {
    uint64_t v28 = v27;
    if (qword_1EB848A80 != -1) {
      swift_once();
    }
    uint64_t v29 = v103;
    if (byte_1EB84B978 == 1)
    {
      type metadata accessor for ImageCache();
      swift_initStaticObject();
      uint64_t v30 = v28;
      id v31 = v28;
      id v32 = sub_1B5D922FC();
      uint64_t v33 = (void *)sub_1B5DB9818();
      objc_msgSend(v32, sel_setObject_forKey_cost_, v31, v33, 1);

      if (qword_1EB847B38 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_1B5DBA8B8();
      sub_1B5CEFDCC(v34, (uint64_t)qword_1EB84B960);
      unint64_t v35 = v105;
      uint64_t v36 = v106;
      sub_1B5D92E54(v106, v105);
      uint64_t v37 = sub_1B5DBA898();
      unint64_t v38 = v98;
      sub_1B5DBA8D8();
      int v39 = sub_1B5DBAE78();
      if (sub_1B5DBAFF8())
      {
        LODWORD(v99) = v39;
        uint64_t v40 = v30;
        swift_retain();
        uint64_t v41 = v92;
        sub_1B5DBA908();
        swift_release();
        uint64_t v43 = v95;
        uint64_t v42 = v96;
        if ((*(unsigned int (**)(char *, uint64_t))(v95 + 88))(v41, v96) == *MEMORY[0x1E4FBD340])
        {
          char v44 = 0;
          unint64_t v45 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v42);
          unint64_t v45 = "Finished with %{bytes}ldbytes.";
          char v44 = 1;
        }
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v93, v38, v101);
        uint64_t v77 = swift_slowAlloc();
        *(unsigned char *)uint64_t v77 = 0;
        *(unsigned char *)(v77 + 1) = v44;
        *(_WORD *)(v77 + 2) = 2048;
        os_signpost_id_t v78 = (uint8_t *)v77;
        uint64_t v79 = 0;
        uint64_t v30 = v40;
        os_signpost_type_t v80 = v99;
        switch((int)v97)
        {
          case 1:
            LODWORD(v79) = HIDWORD(v36) - v36;
            if (__OFSUB__(HIDWORD(v36), v36)) {
              goto LABEL_40;
            }
            uint64_t v79 = (int)v79;
LABEL_36:
            aBlock[0] = v79;
            sub_1B5DBB058();
            sub_1B5D0F2B8(v36, v35);
            uint64_t v88 = v93;
            os_signpost_id_t v89 = sub_1B5DBA858();
            _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v37, v80, v89, "ImageRequester.loadImage", v45, v78, 0xCu);
            MEMORY[0x1BA9AC560](v78, -1, -1);

            id v90 = *(void (**)(char *, uint64_t))(v29 + 8);
            uint64_t v91 = v101;
            v90(v98, v101);
            v90(v88, v91);
            uint64_t v72 = v102;
            if (!v102) {
              goto LABEL_20;
            }
            goto LABEL_19;
          case 2:
            uint64_t v87 = *(void *)(v36 + 16);
            uint64_t v86 = *(void *)(v36 + 24);
            BOOL v83 = __OFSUB__(v86, v87);
            uint64_t v79 = v86 - v87;
            if (!v83) {
              goto LABEL_36;
            }
            goto LABEL_41;
          case 3:
            goto LABEL_36;
          default:
            uint64_t v79 = BYTE6(v35);
            goto LABEL_36;
        }
      }

      sub_1B5D0F2B8(v36, v35);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v38, v101);
      uint64_t v72 = v102;
      if (v102)
      {
LABEL_19:
        id v31 = v31;
        v72(v30, 1);
      }
LABEL_20:
    }
    else
    {
      uint64_t v59 = v94;
      (*(void (**)(char *, char *, uint64_t))(v94 + 16))((char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v99, v8);
      unint64_t v60 = (*(unsigned __int8 *)(v59 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
      unint64_t v61 = (v9 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v62 = (v61 + 15) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v63 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v59 + 32))(v63 + v60, v10, v8);
      *(void *)(v63 + v61) = v104;
      uint64_t v64 = (void *)(v63 + v62);
      unint64_t v66 = v105;
      uint64_t v65 = v106;
      void *v64 = v106;
      v64[1] = v66;
      uint64_t v67 = (void (**)(void *, uint64_t))(v63 + ((v62 + 23) & 0xFFFFFFFFFFFFFFF8));
      uint64_t v68 = (uint64_t)v102;
      uint64_t v69 = v100;
      *uint64_t v67 = v102;
      v67[1] = v69;
      aBlock[4] = sub_1B5D92F80;
      aBlock[5] = v63;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B5D921A4;
      aBlock[3] = &unk_1F0EED718;
      unint64_t v70 = _Block_copy(aBlock);
      sub_1B5D92E54(v65, v66);
      swift_retain();
      sub_1B5D09328(v68);
      swift_release();
      objc_msgSend(v28, sel_prepareForDisplayWithCompletionHandler_, v70);

      _Block_release(v70);
    }
  }
  else
  {
    uint64_t v99 = v18;
    os_signpost_type_t v46 = v21;
    if (qword_1EB847B38 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_1B5DBA8B8();
    sub_1B5CEFDCC(v47, (uint64_t)qword_1EB84B960);
    unint64_t v49 = v105;
    uint64_t v48 = v106;
    sub_1B5D92E54(v106, v105);
    uint64_t v50 = sub_1B5DBA898();
    sub_1B5DBA8D8();
    LODWORD(v98) = sub_1B5DBAE78();
    char v51 = sub_1B5DBAFF8();
    uint64_t v52 = v101;
    uint64_t v53 = v103;
    if (v51)
    {
      uint64_t v54 = v101;
      swift_retain();
      sub_1B5DBA908();
      swift_release();
      uint64_t v56 = v95;
      uint64_t v55 = v96;
      if ((*(unsigned int (**)(char *, uint64_t))(v95 + 88))(v14, v96) == *MEMORY[0x1E4FBD340])
      {
        char v57 = 0;
        uint64_t v58 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v56 + 8))(v14, v55);
        uint64_t v58 = "Finished with %{bytes}ldbytes.";
        char v57 = 1;
      }
      id v73 = v99;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v99, v46, v54);
      uint64_t v74 = swift_slowAlloc();
      *(unsigned char *)uint64_t v74 = 0;
      *(unsigned char *)(v74 + 1) = v57;
      *(_WORD *)(v74 + 2) = 2048;
      uint64_t v75 = (uint8_t *)v74;
      uint64_t v76 = 0;
      switch((int)v97)
      {
        case 1:
          LODWORD(v76) = HIDWORD(v106) - v106;
          if (__OFSUB__(HIDWORD(v106), v106))
          {
            __break(1u);
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            JUMPOUT(0x1B5D91AF0);
          }
          uint64_t v76 = (int)v76;
LABEL_30:
          aBlock[0] = v76;
          sub_1B5DBB058();
          sub_1B5D0F2B8(v106, v49);
          os_signpost_id_t v84 = sub_1B5DBA858();
          _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v50, (os_signpost_type_t)v98, v84, "ImageRequester.loadImage", v58, v75, 0xCu);
          MEMORY[0x1BA9AC560](v75, -1, -1);

          uint64_t v85 = *(void (**)(char *, uint64_t))(v53 + 8);
          v85(v46, v54);
          v85(v73, v54);
          os_signpost_id_t v71 = v102;
          if (v102) {
            goto LABEL_31;
          }
          return;
        case 2:
          uint64_t v82 = *(void *)(v106 + 16);
          uint64_t v81 = *(void *)(v106 + 24);
          BOOL v83 = __OFSUB__(v81, v82);
          uint64_t v76 = v81 - v82;
          if (!v83) {
            goto LABEL_30;
          }
          goto LABEL_39;
        case 3:
          goto LABEL_30;
        default:
          uint64_t v76 = BYTE6(v49);
          goto LABEL_30;
      }
    }

    sub_1B5D0F2B8(v48, v49);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v21, v52);
    os_signpost_id_t v71 = v102;
    if (v102) {
LABEL_31:
    }
      v71(0, 0);
  }
}

uint64_t sub_1B5D91B10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v30 = a6;
  uint64_t v31 = a7;
  uint64_t v28 = a4;
  unint64_t v29 = a5;
  uint64_t v10 = sub_1B5DB9868();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[1] = sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v15 = (v12 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v14, v13, v10);
  *(void *)(v18 + v15) = a3;
  uint64_t v19 = (uint64_t *)(v18 + v16);
  uint64_t v21 = v28;
  unint64_t v20 = v29;
  uint64_t *v19 = v28;
  v19[1] = v20;
  uint64_t v22 = (uint64_t *)(v18 + v17);
  uint64_t v24 = v30;
  uint64_t v23 = v31;
  *uint64_t v22 = v30;
  v22[1] = v23;
  id v25 = a1;
  swift_retain();
  sub_1B5D92E54(v21, v20);
  sub_1B5D09328(v24);
  sub_1B5DBADE8();
  return swift_release();
}

uint64_t sub_1B5D91CE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void *, uint64_t), uint64_t a7)
{
  uint64_t v49 = a7;
  uint64_t v50 = a6;
  unint64_t v53 = a5;
  uint64_t v9 = sub_1B5DBA8C8();
  uint64_t v47 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = &v45[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v51 = sub_1B5DBA878();
  uint64_t v12 = *(void *)(v51 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v51);
  uint64_t v48 = &v45[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v13);
  unint64_t v16 = &v45[-v15];
  type metadata accessor for ImageCache();
  swift_initStaticObject();
  uint64_t v52 = a4;
  if (a1)
  {
    unint64_t v17 = a1;
    id v18 = a1;
    id v19 = sub_1B5D922FC();
    unint64_t v20 = (void *)sub_1B5DB9818();
    objc_msgSend(v19, sel_setObject_forKey_cost_, v18, v20, 1);

    a4 = v52;
  }
  else
  {
    unint64_t v17 = 0;
    id v19 = sub_1B5D922FC();
    unint64_t v20 = (void *)sub_1B5DB9818();
    objc_msgSend(v19, sel_removeObjectForKey_, v20);
  }

  if (qword_1EB847B38 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1B5DBA8B8();
  sub_1B5CEFDCC(v21, (uint64_t)qword_1EB84B960);
  unint64_t v22 = v53;
  sub_1B5D92E54(a4, v53);
  uint64_t v23 = sub_1B5DBA898();
  sub_1B5DBA8D8();
  int v46 = sub_1B5DBAE78();
  uint64_t v24 = a4;
  id v25 = v17;
  if (sub_1B5DBAFF8())
  {
    unint64_t v26 = v22 >> 62;
    swift_retain();
    sub_1B5DBA908();
    swift_release();
    uint64_t v27 = v47;
    int v28 = (*(uint64_t (**)(unsigned char *, uint64_t))(v47 + 88))(v11, v9);
    uint64_t v29 = v51;
    if (v28 == *MEMORY[0x1E4FBD340])
    {
      char v30 = 0;
      uint64_t v31 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v11, v9);
      uint64_t v31 = "Finished with %{bytes}ldbytes.";
      char v30 = 1;
    }
    uint64_t v34 = v48;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 16))(v48, v16, v29);
    uint64_t v35 = swift_slowAlloc();
    *(unsigned char *)uint64_t v35 = 0;
    *(unsigned char *)(v35 + 1) = v30;
    *(_WORD *)(v35 + 2) = 2048;
    uint64_t v36 = v26;
    uint64_t v37 = (uint8_t *)v35;
    uint64_t v38 = 0;
    unint64_t v39 = v53;
    switch(v36)
    {
      case 1:
        LODWORD(v38) = HIDWORD(v52) - v52;
        if (__OFSUB__(HIDWORD(v52), v52))
        {
          __break(1u);
LABEL_21:
          __break(1u);
          JUMPOUT(0x1B5D92194);
        }
        uint64_t v38 = (int)v38;
LABEL_18:
        uint64_t v54 = v38;
        sub_1B5DBB058();
        sub_1B5D0F2B8(v52, v39);
        os_signpost_id_t v43 = sub_1B5DBA858();
        _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v23, (os_signpost_type_t)v46, v43, "ImageRequester.loadImage", v31, v37, 0xCu);
        MEMORY[0x1BA9AC560](v37, -1, -1);

        char v44 = *(void (**)(unsigned char *, uint64_t))(v12 + 8);
        v44(v16, v29);
        uint64_t result = ((uint64_t (*)(unsigned char *, uint64_t))v44)(v34, v29);
        uint64_t v33 = v50;
        if (!v50) {
          return result;
        }
        return v33(v25, 1);
      case 2:
        uint64_t v41 = *(void *)(v52 + 16);
        uint64_t v40 = *(void *)(v52 + 24);
        BOOL v42 = __OFSUB__(v40, v41);
        uint64_t v38 = v40 - v41;
        if (!v42) {
          goto LABEL_18;
        }
        goto LABEL_21;
      case 3:
        goto LABEL_18;
      default:
        uint64_t v38 = BYTE6(v53);
        goto LABEL_18;
    }
  }

  sub_1B5D0F2B8(v24, v22);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v16, v51);
  uint64_t v33 = v50;
  if (v50) {
    return v33(v25, 1);
  }
  return result;
}

void sub_1B5D921A4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1B5D92210(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = a2;
  unint64_t v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    uint64_t v6 = (void *)sub_1B5DB9898();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a3;
  id v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1B5D92CDC((uint64_t)v6, v10);
  return swift_release();
}

uint64_t type metadata accessor for ImageRequester()
{
  return self;
}

id sub_1B5D922FC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = *(id *)(v0 + 16);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C998]), sel_init);
    objc_msgSend(v3, sel_setCountLimit_, 50);
    id v4 = *(void **)(v0 + 16);
    *(void *)(v0 + 16) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

uint64_t sub_1B5D9237C()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for ImageCache()
{
  return self;
}

id sub_1B5D923D8(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3)
{
  uint64_t v66 = a3;
  uint64_t v69 = a2;
  uint64_t v4 = sub_1B5DB9868();
  uint64_t v64 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v62 = v5;
  uint64_t v63 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B5DBA8C8();
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v59 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1B5DBA878();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  id v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v58 - v14;
  MEMORY[0x1F4188790](v13);
  unint64_t v17 = (char *)&v58 - v16;
  if (qword_1EB847B38 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1B5DBA8B8();
  uint64_t v19 = sub_1B5CEFDCC(v18, (uint64_t)qword_1EB84B960);
  sub_1B5DBA898();
  sub_1B5DBA848();
  uint64_t v65 = v19;
  unint64_t v20 = sub_1B5DBA898();
  os_signpost_type_t v21 = sub_1B5DBAE88();
  char v22 = sub_1B5DBAFF8();
  uint64_t v68 = v9;
  if (v22)
  {
    uint64_t v58 = a1;
    unint64_t v70 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v70(v15, v17, v8);
    uint64_t v23 = v15;
    uint64_t v24 = v4;
    id v25 = v12;
    uint64_t v26 = v8;
    uint64_t v27 = v17;
    int v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v28 = 0;
    os_signpost_id_t v29 = sub_1B5DBA858();
    _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v20, v21, v29, "ImageRequester.loadImage", "", v28, 2u);
    char v30 = v28;
    unint64_t v17 = v27;
    uint64_t v8 = v26;
    id v12 = v25;
    uint64_t v4 = v24;
    uint64_t v15 = v23;
    MEMORY[0x1BA9AC560](v30, -1, -1);

    a1 = v58;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v23, v8);
    uint64_t v31 = v70;
  }
  else
  {

    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  }
  uint64_t v67 = v17;
  unint64_t v70 = v31;
  v31(v15, v17, v8);
  sub_1B5DBA8F8();
  swift_allocObject();
  uint64_t v32 = sub_1B5DBA8E8();
  type metadata accessor for ImageCache();
  swift_initStaticObject();
  id v33 = sub_1B5D922FC();
  uint64_t v34 = (void *)sub_1B5DB9818();
  id v35 = objc_msgSend(v33, sel_objectForKey_, v34);

  if (v35)
  {
    uint64_t v36 = sub_1B5DBA898();
    sub_1B5DBA8D8();
    int v37 = sub_1B5DBAE78();
    if (sub_1B5DBAFF8())
    {
      LODWORD(v65) = v37;
      swift_retain();
      uint64_t v38 = v59;
      sub_1B5DBA908();
      swift_release();
      uint64_t v40 = v60;
      uint64_t v39 = v61;
      if ((*(unsigned int (**)(char *, uint64_t))(v60 + 88))(v38, v61) == *MEMORY[0x1E4FBD340])
      {
        uint64_t v41 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v40 + 8))(v38, v39);
        uint64_t v41 = "Finished returning cached image.";
      }
      v70(v15, v12, v8);
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      os_signpost_id_t v53 = sub_1B5DBA858();
      _os_signpost_emit_with_name_impl(&dword_1B5CE2000, v36, (os_signpost_type_t)v65, v53, "ImageRequester.loadImage", v41, v52, 2u);
      MEMORY[0x1BA9AC560](v52, -1, -1);

      uint64_t v51 = *(void (**)(char *, uint64_t))(v68 + 8);
      v51(v12, v8);
      v51(v15, v8);
    }
    else
    {

      uint64_t v51 = *(void (**)(char *, uint64_t))(v68 + 8);
      v51(v12, v8);
    }
    uint64_t v54 = v67;
    uint64_t v55 = v69;
    if (v69)
    {
      id v56 = v35;
      v55(v35, 1);
      swift_release();

      v51(v54, v8);
    }
    else
    {
      v51(v67, v8);
      swift_release();
    }
    return 0;
  }
  else
  {
    unint64_t v70 = (void (*)(char *, char *, uint64_t))objc_msgSend(self, sel_sharedSession);
    BOOL v42 = (void *)sub_1B5DB9818();
    os_signpost_id_t v43 = v63;
    uint64_t v44 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v63, a1, v4);
    unint64_t v45 = (*(unsigned __int8 *)(v44 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    int v46 = (char *)swift_allocObject();
    uint64_t v47 = (uint64_t)v69;
    *((void *)v46 + 2) = v32;
    *((void *)v46 + 3) = v47;
    *((void *)v46 + 4) = v66;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(&v46[v45], v43, v4);
    aBlock[4] = sub_1B5D92C3C;
    aBlock[5] = v46;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B5D92210;
    aBlock[3] = &unk_1F0EED6A0;
    uint64_t v48 = _Block_copy(aBlock);
    swift_retain();
    sub_1B5D09328(v47);
    swift_release();
    uint64_t v49 = v70;
    id v50 = objc_msgSend(v70, sel_dataTaskWithURL_completionHandler_, v42, v48);
    _Block_release(v48);

    objc_msgSend(v50, sel_resume);
    swift_release();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v67, v8);
  }
  return v50;
}

uint64_t sub_1B5D92B60()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  uint64_t v5 = v3 | 7;
  uint64_t v6 = (v3 + 40) & ~v3;
  uint64_t v7 = v6 + v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v6, v1);
  return MEMORY[0x1F4186498](v0, v7, v5);
}

void sub_1B5D92C3C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = *(void *)(sub_1B5DB9868() - 8);
  uint64_t v10 = (const char *)v4[2];
  uint64_t v11 = (void (*)(void, void))v4[3];
  uint64_t v12 = v4[4];
  uint64_t v13 = (uint64_t)v4 + ((*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  sub_1B5D9069C(a1, a2, a3, a4, v10, v11, v12, v13);
}

uint64_t sub_1B5D92CDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B5D0F2B8(a1, a2);
  }
  return a1;
}

uint64_t sub_1B5D92CF0()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  sub_1B5D0F2B8(*((void *)v0 + 2), *((void *)v0 + 3));
  swift_release();
  if (*((void *)v0 + 5)) {
    swift_release();
  }
  uint64_t v5 = v3 | 7;
  uint64_t v6 = (v3 + 56) & ~v3;
  uint64_t v7 = v6 + v4;
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v6], v1);
  return MEMORY[0x1F4186498](v0, v7, v5);
}

void sub_1B5D92DD4()
{
  uint64_t v1 = *(void *)(sub_1B5DB9868() - 8);
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void (*)(void *, uint64_t))v0[5];
  uint64_t v6 = (void (*)(void *, uint64_t))v0[6];
  uint64_t v7 = (char *)v0 + ((*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_1B5D910C8(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1B5D92E40(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B5D92E54(a1, a2);
  }
  return a1;
}

uint64_t sub_1B5D92E54(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B5D92EAC()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  sub_1B5D0F2B8(*(void *)(v0 + v5), *(void *)(v0 + v5 + 8));
  if (*(void *)(v0 + v6)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v6 + 16, v3 | 7);
}

uint64_t sub_1B5D92F80(void *a1)
{
  uint64_t v3 = *(void *)(sub_1B5DB9868() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1 + v4;
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v6);
  unint64_t v10 = *(void *)(v1 + v6 + 8);
  uint64_t v11 = (uint64_t *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  return sub_1B5D91B10(a1, v7, v8, v9, v10, v12, v13);
}

uint64_t sub_1B5D9303C()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  sub_1B5D0F2B8(*(void *)(v0 + v5), *(void *)(v0 + v5 + 8));
  if (*(void *)(v0 + v6)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v6 + 16, v3 | 7);
}

uint64_t sub_1B5D9314C()
{
  uint64_t v1 = *(void *)(sub_1B5DB9868() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = *(void **)(v0 + 16);
  uint64_t v6 = v0 + v2;
  uint64_t v7 = *(void *)(v0 + v3);
  uint64_t v8 = *(void *)(v0 + v4);
  unint64_t v9 = *(void *)(v0 + v4 + 8);
  uint64_t v10 = v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t))v10;
  uint64_t v12 = *(void *)(v10 + 8);
  return sub_1B5D91CE4(v5, v6, v7, v8, v9, v11, v12);
}

void sub_1B5D93204(uint64_t a1, double a2)
{
  unint64_t v4 = (void *)sub_1B5DBAAC8();
  sub_1B5CECC98(&qword_1EB848EE8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5DBDCA0;
  strcpy((char *)(inited + 32), "swipeDistance");
  *(_WORD *)(inited + 46) = -4864;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a1);
  strcpy((char *)(inited + 56), "cacheDuration");
  *(_WORD *)(inited + 70) = -4864;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  sub_1B5D45754(inited);
  sub_1B5D93358();
  uint64_t v6 = (void *)sub_1B5DBAA38();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

unint64_t sub_1B5D93358()
{
  unint64_t result = qword_1EB849148;
  if (!qword_1EB849148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB849148);
  }
  return result;
}

ValueMetadata *type metadata accessor for PreloadedDiagnosticsAnalytics()
{
  return &type metadata for PreloadedDiagnosticsAnalytics;
}

id sub_1B5D934BC(void *a1)
{
  v1[OBJC_IVAR____TtC17PromotedContentUI10DimmerView_dimmed] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for DimmerView();
  id v3 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v3)
  {
    unint64_t v4 = self;
    id v5 = v3;
    id v6 = objc_msgSend(v4, sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v6);

    objc_msgSend(v5, sel_setAlpha_, 0.2);
    objc_msgSend(v5, sel_setIsAccessibilityElement_, 0);
    objc_msgSend(v5, sel_setUserInteractionEnabled_, 0);
  }
  return v3;
}

id sub_1B5D935DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DimmerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DimmerView()
{
  return self;
}

id PrivacyMarker.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void static PrivacyMarker.privacyMarkerSize(sizeCategory:isVideo:minimumTappableSize:)(uint64_t a1, char a2)
{
  if (a2) {
    unsigned __int8 v2 = 2;
  }
  else {
    unsigned __int8 v2 = 0;
  }
  unsigned __int8 v3 = v2;
  _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v3, a1);
}

id sub_1B5D936A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B5DB9A18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_sharedApplication);
  id v7 = objc_msgSend(v6, sel_preferredContentSizeCategory);

  sub_1B5D94DB0();
  sub_1B5DB9A08();
  uint64_t v8 = sub_1B5DB99F8();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v11 = MEMORY[0x1E4FBC868];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v51 = v11;
  sub_1B5DB3118(v8, v10, 0x614C656369766544, 0xEE0065676175676ELL, isUniquelyReferenced_nonNull_native);
  uint64_t v13 = v51;
  swift_bridgeObjectRelease();
  id result = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPrivacyMarker_markerLabel), sel_font);
  if (result)
  {
    id v15 = result;
    objc_msgSend(result, sel_pointSize);
    double v17 = v16;

    if ((~*(void *)&v17 & 0x7FF0000000000000) != 0)
    {
      if (v17 > -9.22337204e18)
      {
        if (v17 < 9.22337204e18)
        {
          uint64_t v51 = (uint64_t)v17;
          uint64_t v18 = sub_1B5DBB3A8();
          uint64_t v20 = v19;
          char v21 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v51 = v13;
          sub_1B5DB3118(v18, v20, 0x657A6953746E6F46, 0xE800000000000000, v21);
          uint64_t v22 = v51;
          swift_bridgeObjectRelease();
          id v15 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPrivacyMarker_markerView), sel_layer);
          objc_msgSend(v15, sel_cornerRadius);
          double v24 = v23;

          if ((~*(void *)&v24 & 0x7FF0000000000000) != 0)
          {
            if (v24 > -9.22337204e18)
            {
              if (v24 < 9.22337204e18)
              {
                uint64_t v51 = (uint64_t)v24;
                uint64_t v25 = sub_1B5DBB3A8();
                uint64_t v27 = v26;
                char v28 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v51 = v22;
                sub_1B5DB3118(v25, v27, 0x615272656E726F43, 0xEC00000073756964, v28);
                uint64_t v29 = v51;
                swift_bridgeObjectRelease();
                sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
                uint64_t v30 = swift_allocObject();
                long long v50 = xmmword_1B5DBDA20;
                *(_OWORD *)(v30 + 16) = xmmword_1B5DBDA20;
                char v31 = sub_1B5D94DB0();
                double v32 = sub_1B5D30E68(v31 & 1);
                uint64_t v33 = MEMORY[0x1E4FBB3D0];
                uint64_t v34 = MEMORY[0x1E4FBB460];
                *(void *)(v30 + 56) = MEMORY[0x1E4FBB3D0];
                *(void *)(v30 + 64) = v34;
                *(double *)(v30 + 32) = v32;
                uint64_t v35 = sub_1B5DBAB18();
                uint64_t v37 = v36;
                char v38 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v51 = v29;
                sub_1B5DB3118(v35, v37, 0x72656B72614D6441, 0xED00006874646957, v38);
                uint64_t v39 = v51;
                swift_bridgeObjectRelease();
                uint64_t v40 = swift_allocObject();
                *(_OWORD *)(v40 + 16) = v50;
                double v41 = sub_1B5D30854();
                *(void *)(v40 + 56) = v33;
                *(void *)(v40 + 64) = v34;
                *(double *)(v40 + 32) = v41;
                uint64_t v42 = sub_1B5DBAB18();
                uint64_t v44 = v43;
                char v45 = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v51 = v39;
                sub_1B5DB3118(v42, v44, 0x72656B72614D6441, 0xEE00746867696548, v45);
                id v15 = (id)v51;
                swift_bridgeObjectRelease();
                if (qword_1EB848850 == -1)
                {
LABEL_9:
                  uint64_t v46 = qword_1EB84B9B8;
                  uint64_t v47 = unk_1EB84B9C0;
                  swift_bridgeObjectRetain();
                  char v48 = swift_isUniquelyReferenced_nonNull_native();
                  uint64_t v51 = (uint64_t)v15;
                  sub_1B5DB3118(v46, v47, 0xD000000000000015, 0x80000001B5DCC250, v48);
                  uint64_t v49 = v51;

                  swift_bridgeObjectRelease();
                  return (id)v49;
                }
LABEL_16:
                swift_once();
                goto LABEL_9;
              }
LABEL_15:
              __break(1u);
              goto LABEL_16;
            }
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

double sub_1B5D93C14()
{
  uint64_t v1 = v0 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize;
  swift_beginAccess();
  return *(double *)v1;
}

void sub_1B5D93C5C(double a1, double a2)
{
  id v5 = (double *)(v2 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  sub_1B5D94950();
}

void (*sub_1B5D93CB8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1B5D93D18;
}

void sub_1B5D93D18(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_1B5D94950();
  }
}

id PrivacyMarker.init()()
{
  uint64_t v1 = OBJC_IVAR___APPrivacyMarker_markerLabel;
  id v2 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v4 = OBJC_IVAR___APPrivacyMarker_markerView;
  *(void *)&v3[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3[OBJC_IVAR___APPrivacyMarker_privacyMarkerType] = 0;
  *(void *)&v3[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = 2;
  id v5 = &v3[OBJC_IVAR___APPrivacyMarker_minimumTappableSize];
  *(void *)id v5 = 0;
  *((void *)v5 + 1) = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for PrivacyMarker();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1B5D94060();

  return v6;
}

id PrivacyMarker.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id PrivacyMarker.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR___APPrivacyMarker_markerLabel;
  id v10 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v12 = OBJC_IVAR___APPrivacyMarker_markerView;
  *(void *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v11[OBJC_IVAR___APPrivacyMarker_privacyMarkerType] = 0;
  *(void *)&v11[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = 2;
  uint64_t v13 = &v11[OBJC_IVAR___APPrivacyMarker_minimumTappableSize];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for PrivacyMarker();
  id v14 = objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
  sub_1B5D94060();

  return v14;
}

void sub_1B5D94060()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___APPrivacyMarker_markerView];
  objc_msgSend(v0, sel_addSubview_, v1);
  objc_msgSend(v1, sel_setUserInteractionEnabled_, 0);
  id v2 = *(void **)&v0[OBJC_IVAR___APPrivacyMarker_markerLabel];
  objc_msgSend(v1, sel_addSubview_, v2);
  objc_msgSend(v1, sel_frame);
  objc_msgSend(v2, sel_setFrame_);
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0);
  sub_1B5D9422C();
  uint64_t v3 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v0, sel_setAccessibilityIdentifier_, v3);

  id v4 = objc_msgSend(v2, sel_text);
  objc_msgSend(v0, sel_setAccessibilityLabel_, v4);

  id v5 = self;
  id v6 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v0, sel_systemColorStatusChanged_, *MEMORY[0x1E4FB2438], 0);

  id v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_addObserver_selector_name_object_, v0, sel_sizeCategoryChanged_, *MEMORY[0x1E4FB27A8], 0);

  sub_1B5D947B4();
  sub_1B5D94950();
}

id sub_1B5D9422C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___APPrivacyMarker_markerLabel);
  objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, 1);
  if (qword_1EB849230 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_1B5DBAAC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setText_, v2);

  double v3 = *MEMORY[0x1E4FB09D8];
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, *MEMORY[0x1E4FB28F0]);
  id v5 = objc_msgSend(self, sel_systemFontOfSize_weight_, 13.0, v3);
  id v6 = objc_msgSend(v4, sel_scaledFontForFont_, v5);

  objc_msgSend(v1, sel_setFont_, v6);
  objc_msgSend(v1, sel_setTextAlignment_, 1);
  if (qword_1EB849240 != -1) {
    swift_once();
  }
  objc_msgSend(v1, sel_setTextColor_, qword_1EB849238);
  if (qword_1EB849218 != -1) {
    swift_once();
  }
  return objc_msgSend(v1, sel_setHighlightedTextColor_, qword_1EB849208);
}

uint64_t sub_1B5D94450()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___APPrivacyMarker_markerView);
  uint64_t result = sub_1B5DB9238();
  if ((result & 1) == 0)
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      if (qword_1E9DA4E08 != -1) {
        swift_once();
      }
      swift_beginAccess();
      objc_msgSend(v1, sel_setBackgroundColor_, qword_1E9DA5E98);
      if (qword_1E9DA4E18 != -1) {
        swift_once();
      }
      double v3 = &qword_1E9DA5EA0;
    }
    else
    {
      if (qword_1EB849200 != -1) {
        swift_once();
      }
      swift_beginAccess();
      objc_msgSend(v1, sel_setBackgroundColor_, qword_1EB8491F8);
      if (qword_1EB849250 != -1) {
        swift_once();
      }
      double v3 = &qword_1EB849248;
    }
    swift_beginAccess();
    return (uint64_t)objc_msgSend(v1, sel_setTintColor_, *v3);
  }
  return result;
}

uint64_t sub_1B5D947B4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___APPrivacyMarker_markerView);
  uint64_t result = sub_1B5DB9238();
  if ((result & 1) == 0)
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      if (qword_1E9DA4E08 != -1) {
        swift_once();
      }
      swift_beginAccess();
      objc_msgSend(v1, sel_setBackgroundColor_, qword_1E9DA5E98);
      if (qword_1E9DA4E18 != -1) {
        swift_once();
      }
      double v3 = &qword_1E9DA5EA0;
    }
    else
    {
      if (qword_1EB849200 != -1) {
        swift_once();
      }
      swift_beginAccess();
      objc_msgSend(v1, sel_setBackgroundColor_, qword_1EB8491F8);
      if (qword_1EB849250 != -1) {
        swift_once();
      }
      double v3 = &qword_1EB849248;
    }
    swift_beginAccess();
    return (uint64_t)objc_msgSend(v1, sel_setTintColor_, *v3);
  }
  return result;
}

void sub_1B5D94950()
{
  id v1 = objc_msgSend(self, sel_sharedApplication);
  id v6 = objc_msgSend(v1, sel_preferredContentSizeCategory);

  id v2 = *(void **)(v0 + OBJC_IVAR___APPrivacyMarker_markerLabel);
  uint64_t v3 = OBJC_IVAR___APPrivacyMarker_privacyMarkerType;
  unsigned __int8 v8 = *(unsigned char *)(v0 + OBJC_IVAR___APPrivacyMarker_privacyMarkerType);
  id v4 = sub_1B5D31BD8(&v8);
  objc_msgSend(v2, sel_setFont_, v4);

  id v5 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___APPrivacyMarker_markerView), sel_layer);
  unsigned __int8 v7 = *(unsigned char *)(v0 + v3);
  objc_msgSend(v5, sel_setCornerRadius_, sub_1B5D322F0(&v7));

  sub_1B5D94A64();
}

void sub_1B5D94A64()
{
  id v1 = objc_msgSend(self, sel_sharedApplication);
  id v2 = objc_msgSend(v1, sel_preferredContentSizeCategory);

  char v3 = sub_1B5D94DB0();
  uint64_t v4 = OBJC_IVAR___APPrivacyMarker_privacyMarkerType;
  unsigned int v5 = v0[OBJC_IVAR___APPrivacyMarker_privacyMarkerType];
  char v6 = v3 & 1;
  if (v5 >= 2)
  {
    if (v5 != 2)
    {
      double v7 = sub_1B5D314B4(v6);
      v22[0] = 3;
      id v9 = sub_1B5D31BD8(v22);
      objc_msgSend(v9, sel_capHeight);
      double v11 = v10;

      double v12 = round(v11) + 12.0;
      goto LABEL_7;
    }
    double v7 = sub_1B5D30E68(v6);
    double v8 = sub_1B5D30854();
  }
  else
  {
    double v7 = sub_1B5D30200(v6);
    double v8 = sub_1B5D2FBFC();
  }
  double v12 = v8;
LABEL_7:
  objc_msgSend(*(id *)&v0[OBJC_IVAR___APPrivacyMarker_markerLabel], sel_setFrame_, 0.0, 0.0, v7, v12);
  unsigned __int8 v23 = v0[v4];
  swift_beginAccess();
  _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v23, (uint64_t)v2);
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(*(id *)&v0[OBJC_IVAR___APPrivacyMarker_markerView], sel_setFrame_, sub_1B5D94C60(v13, v15, v7));
  objc_msgSend(v0, sel_frame);
  double v18 = v17;
  double v20 = v19;
  objc_msgSend(v0, sel_frame);
  objc_msgSend(v0, sel_setFrame_);
  if (v14 != v18 || v16 != v20) {
    objc_msgSend(v0, sel_invalidateIntrinsicContentSize);
  }
}

double sub_1B5D94C60(double a1, double a2, double a3)
{
  double v5 = dbl_1B5DC0A08[v3[OBJC_IVAR___APPrivacyMarker_privacyMarkerType]];
  double result = v5;
  switch(*(void *)&v3[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition])
  {
    case 0:
      objc_msgSend(v3, sel_setHidden_, 1, v5);
      goto LABEL_3;
    case 1:
      return result;
    case 2:
      double result = a1 - a3 - v5;
      break;
    case 3:
      double result = dbl_1B5DC0A08[v3[OBJC_IVAR___APPrivacyMarker_privacyMarkerType]];
      break;
    case 4:
      double result = a1 - a3 - v5;
      break;
    default:
LABEL_3:
      double result = 0.0;
      break;
  }
  return result;
}

id PrivacyMarker.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PrivacyMarker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B5D94DB0()
{
  uint64_t v0 = sub_1B5DB9A18();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  char v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B5DB9A48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1B5DB9A68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  double v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1B5CECC98(&qword_1EB849158);
  MEMORY[0x1F4188790](v12 - 8);
  double v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A28();
  sub_1B5DB9A58();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_1B5DB9A38();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v14, 1, v0) == 1)
  {
    sub_1B5D956BC((uint64_t)v14);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v15 = sub_1B5DB99F8();
    uint64_t v16 = v17;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v14, v0);
  }
  sub_1B5DB9A08();
  uint64_t v18 = sub_1B5DB99F8();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v16)
  {
    if (v15 == v18 && v16 == v20) {
      char v22 = 1;
    }
    else {
      char v22 = sub_1B5DBB3C8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v22 = 0;
  }
  swift_bridgeObjectRelease();
  return v22 & 1;
}

void _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(unsigned __int8 *a1, uint64_t a2)
{
  v27[1] = a2;
  uint64_t v28 = sub_1B5DB9A18();
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B5DB9A48();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B5DB9A68();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B5CECC98(&qword_1EB849158);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[0] = *a1;
  sub_1B5DB9A28();
  sub_1B5DB9A58();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v17 = v28;
  sub_1B5DB9A38();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v16, 1, v17) == 1)
  {
    sub_1B5D956BC((uint64_t)v16);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v18 = sub_1B5DB99F8();
    uint64_t v19 = v20;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v16, v17);
  }
  sub_1B5DB9A08();
  uint64_t v21 = sub_1B5DB99F8();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  if (v19)
  {
    if (v18 == v21 && v19 == v23) {
      char v24 = 1;
    }
    else {
      char v24 = sub_1B5DBB3C8();
    }
    uint64_t v25 = v27[0];
    swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = 0;
    uint64_t v25 = v27[0];
  }
  swift_bridgeObjectRelease();
  switch(v25)
  {
    case 2:
      sub_1B5D30E68(v24 & 1);
      sub_1B5D30854();
      break;
    case 3:
      sub_1B5D314B4(v24 & 1);
      unsigned __int8 v29 = 3;
      id v26 = sub_1B5D31BD8(&v29);
      objc_msgSend(v26, sel_capHeight);

      break;
    default:
      sub_1B5D30200(v24 & 1);
      sub_1B5D2FBFC();
      break;
  }
}

uint64_t type metadata accessor for PrivacyMarker()
{
  return self;
}

__n128 sub_1B5D95558@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize);
  swift_beginAccess();
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

void sub_1B5D955AC(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize);
  swift_beginAccess();
  *uint64_t v4 = v2;
  v4[1] = v3;
  sub_1B5D94950();
}

uint64_t method lookup function for PrivacyMarker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PrivacyMarker);
}

uint64_t dispatch thunk of PrivacyMarker.minimumTappableSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PrivacyMarker.minimumTappableSize.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PrivacyMarker.minimumTappableSize.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t sub_1B5D956BC(uint64_t a1)
{
  uint64_t v2 = sub_1B5CECC98(&qword_1EB849158);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B5D9571C()
{
  uint64_t v1 = OBJC_IVAR___APPrivacyMarker_markerLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v2 = OBJC_IVAR___APPrivacyMarker_markerView;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v0[OBJC_IVAR___APPrivacyMarker_privacyMarkerType] = 0;
  *(void *)&v0[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = 2;
  uint64_t v3 = &v0[OBJC_IVAR___APPrivacyMarker_minimumTappableSize];
  *uint64_t v3 = 0;
  v3[1] = 0;

  sub_1B5DBB2C8();
  __break(1u);
}

uint64_t sub_1B5D95814(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v8 = a4 >> 1;
  uint64_t v9 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_11;
  }
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v11 = v10 + v9;
  if (!__OFADD__(v10, v9)) {
    goto LABEL_4;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  uint64_t v13 = 1;
LABEL_16:
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v16 <= v11) {
    uint64_t v16 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x1BA9AB9A0](v13, v16, 1, v7);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v7;
  uint64_t v14 = v7 & 0xFFFFFFFFFFFFFF8;
  if (v8 == v5)
  {
    while (v9 > 0)
    {
      __break(1u);
LABEL_11:
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_1B5DBB2E8();
      swift_bridgeObjectRelease();
      uint64_t v11 = v15 + v9;
      if (__OFADD__(v15, v9)) {
        goto LABEL_14;
      }
LABEL_4:
      unint64_t v7 = *v4;
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *uint64_t v4 = v7;
      uint64_t v13 = 0;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v7 & 0x8000000000000000) != 0
        || (v7 & 0x4000000000000000) != 0)
      {
        goto LABEL_16;
      }
      uint64_t v14 = v7 & 0xFFFFFFFFFFFFFF8;
      if (v11 > *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_15;
      }
      if (v8 != v5) {
        goto LABEL_21;
      }
    }
    goto LABEL_28;
  }
LABEL_21:
  uint64_t v17 = *(void *)(v14 + 16);
  if ((*(void *)(v14 + 24) >> 1) - v17 < v9)
  {
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    uint64_t result = sub_1B5DBB338();
    __break(1u);
    return result;
  }
  if (v9 < 0) {
    goto LABEL_34;
  }
  unint64_t v18 = v14 + 8 * v17 + 32;
  unint64_t v19 = v6 + 8 * v5;
  if (v19 < v18 + 8 * v9 && v18 < v19 + 8 * v9) {
    goto LABEL_34;
  }
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB847EA0);
  swift_arrayInitWithCopy();
  if (v9)
  {
    uint64_t v20 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v21 = __OFADD__(v20, v9);
    uint64_t v22 = v20 + v9;
    if (!v21)
    {
      *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
      goto LABEL_28;
    }
    goto LABEL_33;
  }
LABEL_28:
  swift_unknownObjectRelease();
  return sub_1B5DBAC58();
}

uint64_t sub_1B5D95AB4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1BA9AB9A0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1B5DA21A4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1B5DBAC58();
}

uint64_t sub_1B5D95C80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_1B5D09C90(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1B5DBB338();
  __break(1u);
  return result;
}

uint64_t sub_1B5D95DC8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1BA9AB9A0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1B5DA23C4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1B5DBAC58();
}

uint64_t sub_1B5D95F94(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1BA9AB9A0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1B5DA2804(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_1B5DBAC58();
}

uint64_t sub_1B5D96160(uint64_t result)
{
  uint64_t v3 = *(void *)(result + 16);
  unint64_t v4 = *(void **)v1;
  int64_t v5 = *(void *)(*(void *)v1 + 16);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = result;
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    unint64_t v4 = sub_1B5D09A1C(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = v4[3] >> 1;
  }
  uint64_t v11 = v4[2];
  uint64_t v12 = v9 - v11;
  uint64_t result = sub_1B5DA3000((uint64_t)v38, &v4[2 * v11 + 4], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, result);
    uint64_t v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    v4[2] = v16;
  }
  if (result != v12)
  {
LABEL_13:
    uint64_t result = sub_1B5CF0094();
    *(void *)uint64_t v1 = v4;
    return result;
  }
LABEL_16:
  int64_t v2 = v4[2];
  uint64_t v3 = v38[0];
  uint64_t v37 = v38[1];
  uint64_t v13 = v39;
  int64_t v6 = v40;
  if (v41)
  {
    unint64_t v17 = (v41 - 1) & v41;
    unint64_t v18 = __clz(__rbit64(v41)) | (v40 << 6);
    int64_t v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  int64_t v32 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    goto LABEL_66;
  }
  int64_t v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36) {
    goto LABEL_13;
  }
  unint64_t v33 = *(void *)(v37 + 8 * v32);
  int64_t v34 = v6 + 1;
  if (!v33)
  {
    int64_t v34 = v6 + 2;
    if (v6 + 2 >= v36) {
      goto LABEL_13;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v34);
    if (!v33)
    {
      int64_t v34 = v6 + 3;
      if (v6 + 3 >= v36) {
        goto LABEL_13;
      }
      unint64_t v33 = *(void *)(v37 + 8 * v34);
      if (!v33)
      {
        int64_t v34 = v6 + 4;
        if (v6 + 4 >= v36) {
          goto LABEL_13;
        }
        unint64_t v33 = *(void *)(v37 + 8 * v34);
        if (!v33)
        {
          int64_t v34 = v6 + 5;
          if (v6 + 5 >= v36) {
            goto LABEL_13;
          }
          unint64_t v33 = *(void *)(v37 + 8 * v34);
          if (!v33)
          {
            int64_t v35 = v6 + 6;
            do
            {
              if (v36 == v35) {
                goto LABEL_13;
              }
              unint64_t v33 = *(void *)(v37 + 8 * v35++);
            }
            while (!v33);
            int64_t v34 = v35 - 1;
          }
        }
      }
    }
  }
  unint64_t v17 = (v33 - 1) & v33;
  unint64_t v18 = __clz(__rbit64(v33)) + (v34 << 6);
  int64_t v6 = v34;
LABEL_18:
  unint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v18);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v22 = v4[3];
    int64_t v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1) {
      break;
    }
    if (v2 < v23) {
      goto LABEL_23;
    }
LABEL_20:
    v4[2] = v2;
  }
  uint64_t result = (uint64_t)sub_1B5D09A1C((void *)(v22 > 1), v2 + 1, 1, v4);
  unint64_t v4 = (void *)result;
  int64_t v23 = *(void *)(result + 24) >> 1;
  if (v2 >= v23) {
    goto LABEL_20;
  }
  while (1)
  {
LABEL_23:
    char v24 = &v4[2 * v2 + 4];
    *char v24 = v21;
    v24[1] = v20;
    ++v2;
    if (v17)
    {
      unint64_t v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    int64_t v27 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v27 >= v36) {
      goto LABEL_45;
    }
    unint64_t v28 = *(void *)(v37 + 8 * v27);
    int64_t v29 = v6 + 1;
    if (!v28)
    {
      int64_t v29 = v6 + 2;
      if (v6 + 2 >= v36) {
        goto LABEL_45;
      }
      unint64_t v28 = *(void *)(v37 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v6 + 3;
        if (v6 + 3 >= v36) {
          goto LABEL_45;
        }
        unint64_t v28 = *(void *)(v37 + 8 * v29);
        if (!v28)
        {
          int64_t v29 = v6 + 4;
          if (v6 + 4 >= v36) {
            goto LABEL_45;
          }
          unint64_t v28 = *(void *)(v37 + 8 * v29);
          if (!v28)
          {
            int64_t v29 = v6 + 5;
            if (v6 + 5 >= v36) {
              goto LABEL_45;
            }
            unint64_t v28 = *(void *)(v37 + 8 * v29);
            if (!v28)
            {
              int64_t v30 = v6 + 6;
              while (v36 != v30)
              {
                unint64_t v28 = *(void *)(v37 + 8 * v30++);
                if (v28)
                {
                  int64_t v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              v4[2] = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    unint64_t v17 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
    int64_t v6 = v29;
LABEL_41:
    char v31 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v26);
    uint64_t v21 = *v31;
    uint64_t v20 = v31[1];
    if (v2 >= v23)
    {
      uint64_t result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    uint64_t result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_1B5D9652C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5CEF780(a1, a2, a3);
}

uint64_t sub_1B5D96554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5D965BC(a1, a2, a3, &qword_1E9DA61F8);
}

uint64_t sub_1B5D96560(uint64_t a1, uint64_t a2)
{
  return sub_1B5D96620(a1, a2, &qword_1E9DA61F8);
}

void sub_1B5D9656C()
{
}

void sub_1B5D96594()
{
}

uint64_t sub_1B5D965B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5D965BC(a1, a2, a3, &qword_1E9DA61F0);
}

uint64_t sub_1B5D965BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_1B5DBAAB8() & 1;
}

uint64_t sub_1B5D96614(uint64_t a1, uint64_t a2)
{
  return sub_1B5D96620(a1, a2, &qword_1E9DA61F0);
}

uint64_t sub_1B5D96620(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1B5DBAA98();
}

void sub_1B5D96664()
{
}

void sub_1B5D9668C()
{
}

uint64_t sub_1B5D966A8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1B5CF1C00(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x1BA9AB990](i, a1);
        sub_1B5CEF5DC(0, &qword_1EB847E98);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B5CF1C00(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1B5CF1C00(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_1B5CE93C4(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_1B5CEF5DC(0, &qword_1EB847E98);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B5CF1C00(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1B5CF1C00(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_1B5CE93C4(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5D9690C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1B5CF1CE8(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_1B5CECC98(&qword_1EB848DD0);
      sub_1B5CECC98(&qword_1EB847BA0);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B5CF1CE8(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B5CF1CE8(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      *(void *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

BOOL static CarouselAdView.CarouselStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CarouselAdView.CarouselStyle.hash(into:)()
{
  return sub_1B5DBB498();
}

uint64_t CarouselAdView.CarouselStyle.hashValue.getter()
{
  return sub_1B5DBB4B8();
}

__n128 sub_1B5D96AD8()
{
  __n128 result = *(__n128 *)MEMORY[0x1E4FB2848];
  long long v1 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  xmmword_1E9DA6178 = *MEMORY[0x1E4FB2848];
  *(_OWORD *)&qword_1E9DA6188 = v1;
  return result;
}

void sub_1B5D96AF4()
{
  qword_1EB847B68 = 0x4024000000000000;
  unk_1EB847B70 = 0;
  qword_1EB847B78 = 0;
  unk_1EB847B80 = 0;
}

id sub_1B5D96B0C()
{
  return sub_1B5D97378(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController, (uint64_t (*)(uint64_t))sub_1B5D96B2C);
}

id sub_1B5D96B2C(uint64_t a1)
{
  sub_1B5D98098();
  double v3 = v2;
  double v4 = 1.77777778;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style) != 1) {
    double v4 = 1.0;
  }
  uint64_t v5 = *(void *)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
  double v6 = v2 * v4 * (double)*(uint64_t *)(v5 + 16);
  unint64_t v7 = (objc_class *)type metadata accessor for CarouselBackgroundCollectionController();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_elements] = v5;
  uint64_t v9 = &v8[OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_contentSize];
  *(double *)uint64_t v9 = v6;
  *((double *)v9 + 1) = v3;
  v11.receiver = v8;
  v11.super_class = v7;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_1B5D96BEC()
{
  return sub_1B5D97378(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView, (uint64_t (*)(uint64_t))sub_1B5D96C0C);
}

id sub_1B5D96C0C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB15C0]), sel_init);
  objc_msgSend(v0, sel_setScrollDirection_, 1);
  objc_msgSend(v0, sel_setMinimumInteritemSpacing_, 0.0);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1568]), sel_initWithFrame_collectionViewLayout_, v0, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_setUserInteractionEnabled_, 0);
  id v2 = sub_1B5D96B0C();
  objc_msgSend(v1, sel_setDataSource_, v2);

  id v3 = sub_1B5D96B0C();
  objc_msgSend(v1, sel_setDelegate_, v3);

  objc_msgSend(v1, sel_setShowsHorizontalScrollIndicator_, 0);
  objc_msgSend(v1, sel_setShowsVerticalScrollIndicator_, 0);
  objc_msgSend(v1, sel_setDecelerationRate_, *MEMORY[0x1E4FB2EE8]);
  objc_msgSend(v1, sel_setClipsToBounds_, 0);
  objc_msgSend(v1, sel_setScrollsToTop_, 0);
  type metadata accessor for ImageCollectionViewCell();
  if (qword_1EB847858 != -1) {
    swift_once();
  }
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v5 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v1, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v5);

  return v1;
}

id sub_1B5D96DF4()
{
  uint64_t v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView);
  }
  else
  {
    id v4 = objc_msgSend(self, sel_effectWithStyle_, 18);
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v4);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

    double v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    id v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_1B5D96EB4()
{
  return sub_1B5D97134(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___headlineLabel, (uint64_t (*)(void))sub_1B5D96ED4);
}

id sub_1B5D96ED4()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v0, sel_setAccessibilityTraits_, *MEMORY[0x1E4FB2550]);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v1 = *MEMORY[0x1E4FB2908];
  id v2 = sub_1B5DA618C(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E4FB2908], 0, 1, 20.0);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB09B8];
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v1);
    id v6 = objc_msgSend(self, sel_systemFontOfSize_weight_, 20.0, v4);
    id v3 = objc_msgSend(v5, sel_scaledFontForFont_, v6);
  }
  objc_msgSend(v0, sel_setFont_, v3);

  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  id v7 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v7);

  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

id sub_1B5D9708C()
{
  uint64_t v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1B5D97114()
{
  return sub_1B5D97134(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserLabel, (uint64_t (*)(void))sub_1B5D97194);
}

id sub_1B5D97134(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = (void *)a2();
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    id v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_1B5D97194()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v0, sel_setAccessibilityTraits_, *MEMORY[0x1E4FB2550]);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v1 = *MEMORY[0x1E4FB28F0];
  id v2 = sub_1B5DA618C(0x6C61697241, 0xE500000000000000, *MEMORY[0x1E4FB28F0], 0, 1, 13.0);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    double v4 = *MEMORY[0x1E4FB09D8];
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v1);
    id v6 = objc_msgSend(self, sel_systemFontOfSize_weight_, 13.0, v4);
    id v3 = objc_msgSend(v5, sel_scaledFontForFont_, v6);
  }
  objc_msgSend(v0, sel_setFont_, v3);

  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  id v7 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v7);

  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

id sub_1B5D97358()
{
  return sub_1B5D97378(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___collectionView, (uint64_t (*)(uint64_t))sub_1B5D973DC);
}

id sub_1B5D97378(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  double v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = (void *)a2(v2);
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    double v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_1B5D973DC(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB15C0]), sel_init);
  objc_msgSend(v2, sel_setScrollDirection_, 1);
  id v3 = objc_msgSend(a1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_horizontalSizeClass);

  double v5 = 0.0;
  if (v4 == (id)1) {
    double v5 = 8.0;
  }
  if (v4 == (id)2) {
    double v5 = 10.0;
  }
  objc_msgSend(v2, sel_setMinimumLineSpacing_, v5);
  objc_msgSend(v2, sel_setSectionInset_, sub_1B5D98544());
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1568]), sel_initWithFrame_collectionViewLayout_, v2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v7 = self;
  id v8 = v6;
  id v9 = objc_msgSend(v7, sel_clearColor);
  objc_msgSend(v8, sel_setBackgroundColor_, v9);

  objc_msgSend(v8, sel_setDataSource_, a1);
  objc_msgSend(v8, sel_setDelegate_, a1);
  objc_msgSend(v8, sel_setPrefetchDataSource_, a1);
  objc_msgSend(v8, sel_setShowsHorizontalScrollIndicator_, 0);
  objc_msgSend(v8, sel_setDecelerationRate_, *MEMORY[0x1E4FB2EE8]);
  objc_msgSend(v8, sel_setClipsToBounds_, 0);
  objc_msgSend(v8, sel_setScrollsToTop_, 0);
  uint64_t v10 = qword_1EB847870;
  id v11 = v8;
  if (v10 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)sub_1B5DBAAC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setAccessibilityHint_, v12);

  type metadata accessor for SmallCarouselCollectionViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v14 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v14);

  type metadata accessor for SmallCTACarouselCollectionViewCell();
  uint64_t v15 = swift_getObjCClassFromMetadata();
  uint64_t v16 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v15, v16);

  type metadata accessor for MediumCarouselCollectionViewCell();
  uint64_t v17 = swift_getObjCClassFromMetadata();
  unint64_t v18 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v17, v18);

  type metadata accessor for MediumCTACarouselCollectionViewCell();
  uint64_t v19 = swift_getObjCClassFromMetadata();
  uint64_t v20 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v19, v20);

  type metadata accessor for LargeCarouselCollectionViewCell();
  uint64_t v21 = swift_getObjCClassFromMetadata();
  unint64_t v22 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v21, v22);

  type metadata accessor for LargeCTACarouselCollectionViewCell();
  uint64_t v23 = swift_getObjCClassFromMetadata();
  char v24 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v23, v24);

  return v11;
}

id sub_1B5D9780C()
{
  uint64_t v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
    objc_msgSend(v4, sel_setContentMode_, 1);
    objc_msgSend(v4, sel_setOpaque_, 0);
    objc_msgSend(v4, sel_setAccessibilityIgnoresInvertColors_, 1);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    double v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void *sub_1B5D978D0()
{
  uint64_t v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_1B5D97940(v0);
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_1B5D08894(v4);
  }
  sub_1B5D088A4(v2);
  return v3;
}

void *sub_1B5D97940(uint64_t a1)
{
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847728);
  MEMORY[0x1F4188790](v2 - 8);
  id v56 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B5DB9778();
  uint64_t v54 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  os_signpost_id_t v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B5DBAF48();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B5DBAFA8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v55 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v50 - v14;
  uint64_t v16 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v16 - 8);
  unint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  uint64_t v57 = a1;
  uint64_t v20 = *(void **)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (!v20) {
    return 0;
  }
  uint64_t v52 = v4;
  id v21 = v20;
  unint64_t v22 = (void *)sub_1B5DBA418();

  if (!v22) {
    return 0;
  }
  uint64_t v23 = *(void **)(v57 + v19);
  if (!v23)
  {
    uint64_t v33 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v18, 1, 1, v33);
    goto LABEL_9;
  }
  id v24 = v23;
  sub_1B5DBA448();

  uint64_t v25 = sub_1B5DB9868();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v18, 1, v25) == 1)
  {
LABEL_9:

    sub_1B5CEF924((uint64_t)v18, &qword_1EB847BD0);
    return 0;
  }
  sub_1B5CEF924((uint64_t)v18, &qword_1EB847BD0);
  sub_1B5DBAF98();
  id v51 = self;
  id v26 = objc_msgSend(v51, sel_whiteColor);
  int64_t v27 = (void (*)(id *, void))sub_1B5DBAF38();
  sub_1B5DBA948();
  v27(v58, 0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FB1200], v6);
  sub_1B5DBAF58();
  sub_1B5DBAF78();
  uint64_t v28 = sub_1B5DBA128();
  int64_t v29 = v22;
  if (v30) {
    char v31 = 7;
  }
  else {
    char v31 = sub_1B5DA916C(v28);
  }
  int64_t v34 = v53;
  uint64_t v35 = v54;
  uint64_t v36 = sub_1B5DBA148();
  sub_1B5DA937C(v36, v37, v31);
  swift_bridgeObjectRelease();
  sub_1B5DB9768();
  uint64_t KeyPath = swift_getKeyPath();
  *(&v50 - 2) = MEMORY[0x1F4188790](KeyPath);
  swift_getKeyPath();
  uint64_t v39 = *MEMORY[0x1E4FB28E0];
  id v40 = sub_1B5DA618C(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E4FB28E0], 0x402E000000000000, 0, 12.0);
  if (!v40)
  {
    double v41 = *MEMORY[0x1E4FB09B8];
    id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v39);
    id v43 = objc_msgSend(self, sel_systemFontOfSize_weight_, 12.0, v41);
    id v40 = objc_msgSend(v42, sel_scaledFontForFont_maximumPointSize_, v43, 15.0);
  }
  v58[0] = v40;
  sub_1B5D2E508();
  sub_1B5DB9758();
  uint64_t v44 = swift_getKeyPath();
  *(&v50 - 2) = MEMORY[0x1F4188790](v44);
  swift_getKeyPath();
  v58[0] = objc_msgSend(v51, sel_systemBlueColor);
  sub_1B5D2E59C();
  sub_1B5DB9758();
  char v45 = v56;
  uint64_t v46 = v52;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v56, v34, v52);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v45, 0, 1, v46);
  sub_1B5DBAF68();
  sub_1B5CEF5DC(0, &qword_1EB8478B0);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v55, v15, v10);
  int64_t v32 = (void *)sub_1B5DBAFB8();
  objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v32, sel_addTarget_action_forControlEvents_, v57, sel_didSelectActionButtonWithSender_, 64);
  id v47 = objc_msgSend(v32, sel_titleLabel);
  if (v47)
  {
    char v48 = v47;
    objc_msgSend(v47, sel_setAdjustsFontForContentSizeCategory_, 1);
  }
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v52);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  return v32;
}

double sub_1B5D98098()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize + 16) & 1) == 0) {
    return *(double *)v1;
  }
  double result = sub_1B5D980E0(v0);
  *(double *)uint64_t v1 = result;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = 0;
  return result;
}

double sub_1B5D980E0(uint64_t a1)
{
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847BD0);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v19 - v6;
  double v8 = sub_1B5D98388();
  uint64_t v9 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  uint64_t v10 = *(void **)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v10)
  {
    id v11 = v10;
    sub_1B5DBA3F8();

    uint64_t v12 = sub_1B5DB9868();
    (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v7, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }
  sub_1B5CEF924((uint64_t)v7, &qword_1EB847BD0);
  sub_1B5D98BFC();
  uint64_t v14 = *(void **)(a1 + v9);
  if (v14)
  {
    id v15 = v14;
    sub_1B5DBA3F8();

    uint64_t v16 = sub_1B5DB9868();
    (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v5, 1, v16);
  }
  else
  {
    uint64_t v17 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
  }
  sub_1B5CEF924((uint64_t)v5, &qword_1EB847BD0);
  sub_1B5D9902C();
  sub_1B5D99814();

  sub_1B5D99CFC();
  sub_1B5D99F78();
  return v8;
}

double sub_1B5D98388()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth];
  if ((v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth + 8] & 1) == 0) {
    return *(double *)v1;
  }
  double result = sub_1B5D983D0(v0);
  *(double *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

double sub_1B5D983D0(char *a1)
{
  id v2 = objc_msgSend(*(id *)&a1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation);
  if (v2)
  {
    objc_msgSend(v2, sel_adSize);
    double v4 = v3;
    swift_unknownObjectRelease();
  }
  else
  {
    double v4 = 0.0;
  }
  uint64_t v5 = sub_1B5DBA718();
  if (v5 == sub_1B5DBA718())
  {
    int v6 = a1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
    id v7 = objc_msgSend(a1, sel_traitCollection);
    id v8 = objc_msgSend(v7, sel_horizontalSizeClass);

    if (v8 == (id)2)
    {
      if (v6)
      {
        if (v6 == 1)
        {
LABEL_12:
          double v9 = 283.0;
          goto LABEL_18;
        }
        double v9 = 356.0;
      }
      else
      {
        double v9 = 260.0;
      }
    }
    else
    {
      if (v8 != (id)1)
      {
        if (v4 < 0.0) {
          return v4;
        }
LABEL_19:
        if (v4 + -32.0 < 0.0) {
          return 0.0;
        }
        else {
          return v4 + -32.0;
        }
      }
      if (v6)
      {
        if (v6 != 1)
        {
          double v9 = 297.0;
          goto LABEL_18;
        }
        goto LABEL_12;
      }
      double v9 = 148.0;
    }
LABEL_18:
    if (v4 < v9) {
      return v4;
    }
    goto LABEL_19;
  }
  return v4;
}

double sub_1B5D98544()
{
  id v1 = objc_msgSend(v0, sel_traitCollection);
  id v2 = (char *)objc_msgSend(v1, sel_horizontalSizeClass);

  if ((unint64_t)(v2 - 1) > 1)
  {
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    double v4 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v5 = swift_allocObject();
    uint64_t v6 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v5 + 16) = xmmword_1B5DBDA20;
    uint64_t v7 = MEMORY[0x1E4FBB5C8];
    *(void *)(v5 + 56) = v6;
    *(void *)(v5 + 64) = v7;
    *(void *)(v5 + 32) = v2;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return *MEMORY[0x1E4FB2848];
  }
  else
  {
    sub_1B5DBA718();
    sub_1B5DBA718();
    return 0.0;
  }
}

uint64_t sub_1B5D986C8()
{
  uint64_t v1 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v1 - 8);
  double v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v4 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v4)
  {
    id v5 = v4;
    sub_1B5DBA3F8();

    uint64_t v6 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 1, v6) != 1)
    {
      sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
      return swift_beginAccess();
    }
  }
  else
  {
    uint64_t v8 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  return sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
}

uint64_t sub_1B5D98884()
{
  uint64_t v1 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v1 - 8);
  double v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v4 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v4)
  {
    id v5 = v4;
    sub_1B5DBA3F8();

    uint64_t v6 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 1, v6) != 1)
    {
      sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
      return swift_beginAccess();
    }
  }
  else
  {
    uint64_t v8 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  return sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
}

uint64_t sub_1B5D98A40()
{
  uint64_t v1 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v1 - 8);
  double v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v4 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v4)
  {
    id v5 = v4;
    sub_1B5DBA3F8();

    uint64_t v6 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 1, v6) != 1) {
      return sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
    }
  }
  else
  {
    uint64_t v8 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
  return swift_beginAccess();
}

void sub_1B5D98BFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v2 - 8);
  double v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v6)
  {
    id v7 = v6;
    sub_1B5DBA3F8();

    uint64_t v8 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) != 1)
    {
      sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
      return;
    }
  }
  else
  {
    uint64_t v9 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  }
  sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
  uint64_t v10 = *(void **)(v1 + v5);
  if (!v10 || (id v11 = v10, v12 = sub_1B5DBA3B8(), v14 = v13, v11, !v14))
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = 0;
    unint64_t v14 = 0xE000000000000000;
  }
  if (qword_1EB848858 != -1) {
    swift_once();
  }
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v15 = swift_allocObject();
  long long v39 = xmmword_1B5DBDA20;
  *(_OWORD *)(v15 + 16) = xmmword_1B5DBDA20;
  *(void *)(v15 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v15 + 64) = sub_1B5CFD41C();
  *(void *)(v15 + 32) = v12;
  *(void *)(v15 + 40) = v14;
  swift_bridgeObjectRetain();
  sub_1B5DBAB18();
  swift_bridgeObjectRelease();
  double v16 = sub_1B5D98388() + -32.0;
  sub_1B5D98A40();
  double v18 = v16 - v17;
  uint64_t v19 = *MEMORY[0x1E4FB28F0];
  id v20 = sub_1B5DA618C(0x6C61697241, 0xE500000000000000, *MEMORY[0x1E4FB28F0], 0, 1, 13.0);
  if (v20)
  {
    id v21 = v20;
  }
  else
  {
    double v22 = *MEMORY[0x1E4FB09D8];
    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v19);
    id v24 = objc_msgSend(self, sel_systemFontOfSize_weight_, 13.0, v22);
    id v21 = objc_msgSend(v23, sel_scaledFontForFont_, v24);
  }
  sub_1B5CECC98(&qword_1EB848E68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v39;
  id v26 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = sub_1B5CEF5DC(0, &qword_1EB848E28);
  *(void *)(inited + 40) = v21;
  id v27 = v21;
  id v28 = v26;
  sub_1B5D455CC(inited);
  int64_t v29 = (void *)sub_1B5DBAAC8();
  type metadata accessor for Key(0);
  sub_1B5CF8EF8();
  char v30 = (void *)sub_1B5DBAA38();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_boundingRectWithSize_options_attributes_context_, 0, v30, 0, v18, 1.79769313e308);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  v40.origin.x = v32;
  v40.origin.y = v34;
  v40.size.width = v36;
  v40.size.height = v38;
  CGRectGetHeight(v40);
  swift_bridgeObjectRelease();
}

void sub_1B5D9902C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v2 - 8);
  double v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(v0, sel_traitCollection);
  id v6 = objc_msgSend(v5, sel_horizontalSizeClass);

  uint64_t v7 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v8)
  {
    id v9 = v8;
    sub_1B5DBA438();
    uint64_t v11 = v10;

    if (v11)
    {
      if (v6 != (id)2) {
        goto LABEL_4;
      }
LABEL_8:
      double v16 = sub_1B5D978D0();
      if (v16)
      {
        double v17 = v16;
        double v18 = *(void **)&v1[v7];
        if (v18)
        {
          id v19 = v18;
          sub_1B5DBA3F8();

          uint64_t v20 = sub_1B5DB9868();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v4, 1, v20) != 1)
          {
            sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
            objc_msgSend(v17, sel_sizeThatFits_, sub_1B5D98388() + -32.0, 24.0);
            double v22 = *(double *)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth]
                + -32.0
                - fmax(v21, 150.0)
                + -16.0;
            uint64_t v23 = *MEMORY[0x1E4FB2908];
            id v24 = sub_1B5DA618C(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E4FB2908], 0, 1, 20.0);
            if (v24)
            {
              id v25 = v24;
            }
            else
            {
              double v49 = *MEMORY[0x1E4FB09B8];
              id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v23);
              id v51 = objc_msgSend(self, sel_systemFontOfSize_weight_, 20.0, v49);
              id v25 = objc_msgSend(v50, sel_scaledFontForFont_, v51);
            }
            sub_1B5CECC98(&qword_1EB848E68);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_1B5DBDA20;
            os_signpost_id_t v53 = (void *)*MEMORY[0x1E4FB06F8];
            *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
            *(void *)(inited + 64) = sub_1B5CEF5DC(0, &qword_1EB848E28);
            *(void *)(inited + 40) = v25;
            id v37 = v25;
            id v54 = v53;
            sub_1B5D455CC(inited);
            uint64_t v55 = (void *)sub_1B5DBAAC8();
            type metadata accessor for Key(0);
            sub_1B5CF8EF8();
            id v56 = (void *)sub_1B5DBAA38();
            swift_bridgeObjectRelease();
            objc_msgSend(v55, sel_boundingRectWithSize_options_attributes_context_, 1, v56, 0, v22, 1.79769313e308);
            CGFloat v58 = v57;
            CGFloat v60 = v59;
            CGFloat v62 = v61;
            CGFloat v64 = v63;

            v67.origin.x = v58;
            v67.origin.y = v60;
            v67.size.width = v62;
            v67.size.height = v64;
            CGRectGetHeight(v67);
            swift_bridgeObjectRelease();

            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v30 = sub_1B5DB9868();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v4, 1, 1, v30);
        }

        sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
      }
      double v12 = sub_1B5D98388() + -32.0;
      uint64_t v13 = *MEMORY[0x1E4FB2908];
      id v31 = sub_1B5DA618C(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E4FB2908], 0, 1, 20.0);
      if (v31)
      {
        id v15 = v31;
        goto LABEL_20;
      }
LABEL_19:
      double v32 = *MEMORY[0x1E4FB09B8];
      id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v13);
      id v34 = objc_msgSend(self, sel_systemFontOfSize_weight_, 20.0, v32);
      id v15 = objc_msgSend(v33, sel_scaledFontForFont_, v34);

      goto LABEL_20;
    }
  }
  swift_bridgeObjectRelease();
  if (v6 == (id)2) {
    goto LABEL_8;
  }
LABEL_4:
  if (v6 != (id)1)
  {
    swift_bridgeObjectRelease();
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    id v26 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v27 + 16) = xmmword_1B5DBDA20;
    uint64_t v29 = MEMORY[0x1E4FBB5C8];
    *(void *)(v27 + 56) = v28;
    *(void *)(v27 + 64) = v29;
    *(void *)(v27 + 32) = v6;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return;
  }
  double v12 = sub_1B5D98388() + -32.0;
  uint64_t v13 = *MEMORY[0x1E4FB2908];
  id v14 = sub_1B5DA618C(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E4FB2908], 0, 1, 20.0);
  if (!v14) {
    goto LABEL_19;
  }
  id v15 = v14;
LABEL_20:
  sub_1B5CECC98(&qword_1EB848E68);
  uint64_t v35 = swift_initStackObject();
  *(_OWORD *)(v35 + 16) = xmmword_1B5DBDA20;
  CGFloat v36 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(v35 + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(v35 + 64) = sub_1B5CEF5DC(0, &qword_1EB848E28);
  *(void *)(v35 + 40) = v15;
  id v37 = v15;
  id v38 = v36;
  sub_1B5D455CC(v35);
  long long v39 = (void *)sub_1B5DBAAC8();
  type metadata accessor for Key(0);
  sub_1B5CF8EF8();
  CGRect v40 = (void *)sub_1B5DBAA38();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_boundingRectWithSize_options_attributes_context_, 1, v40, 0, v12, 1.79769313e308);
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;

  v66.origin.x = v42;
  v66.origin.y = v44;
  v66.size.width = v46;
  v66.size.height = v48;
  CGRectGetHeight(v66);
  swift_bridgeObjectRelease();
LABEL_21:
}

double sub_1B5D99814()
{
  uint64_t v1 = sub_1B5CECC98(&qword_1EB847728);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = &v43[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1B5DB9778();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v43[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements];
  uint64_t v9 = sub_1B5DA5490(v8);
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0xE000000000000000;
  }
  sub_1B5DA56F0(v8, (uint64_t)v3);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1B5DB9768();
    sub_1B5CEF924((uint64_t)v3, &qword_1EB847728);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  id v13 = objc_msgSend(v0, sel_traitCollection);
  id v14 = objc_msgSend(v13, sel_horizontalSizeClass);

  int v15 = v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
  double v16 = sub_1B5D978D0();

  if (v15)
  {
    if (v16)
    {
      type metadata accessor for CarouselCollectionViewCell();
      char v44 = v15;
      double v17 = sub_1B5CF7FB4(v11, v12, &v44, (uint64_t)v14);
    }
    else
    {
      type metadata accessor for CTACarouselCollectionViewCell();
      char v44 = v15;
      double v17 = sub_1B5CF9924(v11, v12, (uint64_t)v7, &v44, (uint64_t)v14);
    }
    double v23 = v17;
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    if (v16)
    {
      double v18 = 148.0;
      if (v14 != (id)1) {
        double v18 = 0.0;
      }
      if (v14 == (id)2) {
        double v19 = 260.0;
      }
      else {
        double v19 = v18;
      }
      uint64_t v20 = *MEMORY[0x1E4FB28D8];
      id v21 = sub_1B5DA618C(0x6C61697241, 0xE500000000000000, *MEMORY[0x1E4FB28D8], 0, 1, 13.0);
      if (v21)
      {
        id v22 = v21;
      }
      else
      {
        double v24 = *MEMORY[0x1E4FB09D8];
        id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, v20);
        id v26 = objc_msgSend(self, sel_systemFontOfSize_weight_, 13.0, v24);
        id v22 = objc_msgSend(v25, sel_scaledFontForFont_, v26);
      }
      sub_1B5CECC98(&qword_1EB848E68);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B5DBDA20;
      uint64_t v28 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
      *(void *)(inited + 64) = sub_1B5CEF5DC(0, &qword_1EB848E28);
      *(void *)(inited + 40) = v22;
      id v29 = v22;
      id v30 = v28;
      sub_1B5D455CC(inited);
      id v31 = (void *)sub_1B5DBAAC8();
      type metadata accessor for Key(0);
      sub_1B5CF8EF8();
      double v32 = (void *)sub_1B5DBAA38();
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_boundingRectWithSize_options_attributes_context_, 1, v32, 0, v19 + -12.0, 1.79769313e308);
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v40 = v39;

      v45.origin.x = v34;
      v45.origin.y = v36;
      v45.size.width = v38;
      v45.size.height = v40;
      double Height = CGRectGetHeight(v45);
      swift_bridgeObjectRelease();

      double v23 = v19 + 6.0 + ceil(Height) + 6.0;
    }
    else
    {
      char v44 = 0;
      double v23 = sub_1B5D7C5A0(v11, v12, (uint64_t)v7, &v44, (uint64_t)v14);
      swift_bridgeObjectRelease();
    }
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v23;
}

double sub_1B5D99CFC()
{
  uint64_t v1 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B5D978D0();

  double v5 = 0.0;
  if (v4)
  {
    id v6 = objc_msgSend(v0, sel_traitCollection);
    id v7 = objc_msgSend(v6, sel_horizontalSizeClass);

    double v5 = 24.0;
    if (v7 != (id)1)
    {
      if (v7 == (id)2)
      {
        uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
        if (v8)
        {
          id v9 = v8;
          sub_1B5DBA3F8();

          uint64_t v10 = sub_1B5DB9868();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v3, 1, v10) != 1)
          {
            sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
            return 0.0;
          }
        }
        else
        {
          uint64_t v15 = sub_1B5DB9868();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
        }
        sub_1B5CEF924((uint64_t)v3, &qword_1EB847BD0);
        return v5;
      }
      sub_1B5DBAD98();
      sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
      uint64_t v11 = (void *)sub_1B5DBB018();
      sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
      uint64_t v12 = swift_allocObject();
      uint64_t v13 = MEMORY[0x1E4FBB550];
      *(_OWORD *)(v12 + 16) = xmmword_1B5DBDA20;
      uint64_t v14 = MEMORY[0x1E4FBB5C8];
      *(void *)(v12 + 56) = v13;
      *(void *)(v12 + 64) = v14;
      *(void *)(v12 + 32) = v7;
      sub_1B5DBA838();

      swift_bridgeObjectRelease();
      return 0.0;
    }
  }
  return v5;
}

double sub_1B5D99F78()
{
  id v1 = objc_msgSend(v0, sel_traitCollection);
  id v2 = objc_msgSend(v1, sel_horizontalSizeClass);

  if (v2 == (id)2)
  {
    uint64_t v5 = sub_1B5DBA718();
    BOOL v4 = v5 == sub_1B5DBA718();
  }
  else
  {
    if (v2 != (id)1)
    {
      sub_1B5DBAD98();
      sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
      id v7 = (void *)sub_1B5DBB018();
      sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
      uint64_t v8 = swift_allocObject();
      uint64_t v9 = MEMORY[0x1E4FBB550];
      *(_OWORD *)(v8 + 16) = xmmword_1B5DBDA20;
      uint64_t v10 = MEMORY[0x1E4FBB5C8];
      *(void *)(v8 + 56) = v9;
      *(void *)(v8 + 64) = v10;
      *(void *)(v8 + 32) = v2;
      sub_1B5DBA838();

      swift_bridgeObjectRelease();
      return 0.0;
    }
    uint64_t v3 = sub_1B5D978D0();

    BOOL v4 = v3 == 0;
  }
  double result = 16.0;
  if (v4) {
    return 8.0;
  }
  return result;
}

uint64_t type metadata accessor for CarouselAdView()
{
  uint64_t result = qword_1EB848A68;
  if (!qword_1EB848A68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B5D9A204(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)type metadata accessor for CarouselAdView();
  v21.receiver = v4;
  v21.super_class = v9;
  objc_msgSendSuper2(&v21, sel_frame);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v20.receiver = v4;
  v20.super_class = v9;
  objc_msgSendSuper2(&v20, sel_setFrame_, a1, a2, a3, a4);
  objc_msgSend(v4, sel_frame);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  if (!CGRectEqualToRect(v22, v23))
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    objc_msgSend(v4, sel_layoutIfNeeded);
    id v18 = sub_1B5D97358();
    id v19 = objc_msgSend(v18, sel_collectionViewLayout);

    objc_msgSend(v19, sel_invalidateLayout);
  }
}

double sub_1B5D9A330()
{
  return sub_1B5D98098();
}

double sub_1B5D9A354()
{
  uint64_t v0 = sub_1B5DBA718();
  if (v0 == sub_1B5DBA718())
  {
    if (qword_1EB847B90 != -1) {
      swift_once();
    }
    id v1 = &qword_1EB847B68;
  }
  else
  {
    if (qword_1EB848A48 != -1) {
      swift_once();
    }
    id v1 = (uint64_t *)&xmmword_1E9DA6178;
  }
  return *(double *)v1;
}

void sub_1B5D9A414()
{
  id v1 = v0;
  uint64_t v2 = sub_1B5CECC98(&qword_1EB8496E0);
  MEMORY[0x1F4188790](v2 - 8);
  double v41 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5DB9868();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  CGFloat v40 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  double v12 = (char *)&v38 - v11;
  v0[OBJC_IVAR___APPCPromotedContentView_shouldCollapseOnRotation] = 1;
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 1);
  objc_msgSend(v0, sel_setOpaque_, 1);
  id v13 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v13, sel_setAllowsGroupOpacity_, 0);

  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  uint64_t v14 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  if (objc_msgSend(*(id *)&v1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation))
  {
    sub_1B5DBA458();
    uint64_t v15 = swift_dynamicCastClass();
    if (v15)
    {
      double v16 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
      *(void *)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation] = v15;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  sub_1B5D9AAA8();
  CGFloat v17 = *(void **)&v1[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v17, sel_addTarget_action_forControlEvents_, v1, sel_tappedPrivacyMarker_, 64);
  uint64_t v18 = OBJC_IVAR___APPrivacyMarker_privacyMarkerType;
  if (!*((unsigned char *)v17 + OBJC_IVAR___APPrivacyMarker_privacyMarkerType))
  {
    if (objc_msgSend(*(id *)&v1[v14], sel_isOutstreamVideoAd)) {
      char v19 = 2;
    }
    else {
      char v19 = 0;
    }
    *((unsigned char *)v17 + v18) = v19;
    sub_1B5D94950();
  }
  id v20 = objc_msgSend(v1, sel_traitCollection);
  id v21 = objc_msgSend(v20, sel_horizontalSizeClass);

  sub_1B5D9AE54(v21);
  sub_1B5D9F104((uint64_t)v21);
  CGRect v22 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_14;
  }
  id v23 = v22;
  sub_1B5DBA3F8();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_14:
    sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
    goto LABEL_15;
  }
  CGFloat v38 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  double v39 = v12;
  double v24 = v12;
  v38(v12, v6, v7);
  uint64_t v25 = sub_1B5DBACD8();
  uint64_t v26 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v41, 1, 1, v25);
  uint64_t v27 = v40;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v40, v24, v7);
  sub_1B5DBACB8();
  uint64_t v28 = v1;
  uint64_t v29 = sub_1B5DBACA8();
  unint64_t v30 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  id v31 = (char *)swift_allocObject();
  uint64_t v32 = MEMORY[0x1E4FBCFD8];
  *((void *)v31 + 2) = v29;
  *((void *)v31 + 3) = v32;
  *((void *)v31 + 4) = v28;
  v38(&v31[v30], v27, v7);
  sub_1B5CEF780(v26, (uint64_t)&unk_1E9DA61B0, (uint64_t)v31);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v39, v7);
LABEL_15:
  sub_1B5D9F50C();
  double v33 = self;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v1;
  aBlock[4] = sub_1B5DA1F6C;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B5CFFE28;
  aBlock[3] = &unk_1F0EED858;
  double v35 = _Block_copy(aBlock);
  CGFloat v36 = v1;
  swift_release();
  id v37 = objc_msgSend(v33, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v35, 1.0);
  _Block_release(v35);
}

uint64_t sub_1B5D9A9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_1B5DBACB8();
  v5[3] = sub_1B5DBACA8();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_1B5D335F4;
  return sub_1B5D9FB90(a5);
}

void sub_1B5D9AAA8()
{
  id v1 = v0;
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = sub_1B5D96BEC();
  objc_msgSend(v1, sel_addSubview_, v5);

  id v6 = sub_1B5D96DF4();
  objc_msgSend(v1, sel_addSubview_, v6);

  uint64_t v7 = *(void *)&v1[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  objc_msgSend(v1, sel_addSubview_, v7);
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v8)
  {
    id v9 = v8;
    sub_1B5DBA3F8();

    uint64_t v10 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v4, 1, v10) != 1)
    {
      sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
      id v11 = sub_1B5D9780C();
      objc_msgSend(v1, sel_addSubview_, v11);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  }
  sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
  id v13 = sub_1B5D9708C();
  objc_msgSend(v1, sel_addSubview_, v13);

  id v14 = sub_1B5D9708C();
  objc_msgSend(v14, sel_addSubview_, v7);

  id v15 = sub_1B5D9708C();
  id v11 = sub_1B5D97114();
  objc_msgSend(v15, sel_addSubview_, v11);

LABEL_6:
  id v16 = sub_1B5D96EB4();
  objc_msgSend(v1, sel_addSubview_, v16);

  id v17 = sub_1B5D97358();
  objc_msgSend(v1, sel_addSubview_, v17);

  uint64_t v18 = sub_1B5D978D0();
  if (v18)
  {
    char v19 = v18;
    objc_msgSend(v1, sel_addSubview_, v18);
  }
}

uint64_t sub_1B5D9AD3C()
{
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  unint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B5DBE830;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
  *(void *)(v1 + 32) = v2;
  id v3 = v2;
  *(void *)(v1 + 40) = sub_1B5D96EB4();
  *(void *)(v1 + 48) = sub_1B5D97358();
  unint64_t v8 = v1;
  sub_1B5DBAC58();
  uint64_t v4 = sub_1B5D978D0();
  if (v4)
  {
    id v5 = v4;
    MEMORY[0x1BA9AB370]();
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1B5DBAC68();
    }
    sub_1B5DBAC88();
    sub_1B5DBAC58();

    unint64_t v1 = v8;
  }
  uint64_t v6 = sub_1B5D966A8(v1);
  swift_bridgeObjectRelease();
  return v6;
}

void sub_1B5D9AE54(void *a1)
{
  unint64_t v2 = sub_1B5D9AFA4();
  sub_1B5D95DC8(v2);
  unint64_t v3 = sub_1B5D9B334();
  sub_1B5D95DC8(v3);
  unint64_t v4 = sub_1B5D9B534();
  sub_1B5D95DC8(v4);
  unint64_t v5 = sub_1B5D9B848((uint64_t)a1);
  sub_1B5D95DC8(v5);
  unint64_t v6 = sub_1B5D9C4AC((uint64_t)a1);
  sub_1B5D95DC8(v6);
  unint64_t v7 = sub_1B5D9BFAC((uint64_t)a1);
  sub_1B5D95DC8(v7);
  unint64_t v8 = sub_1B5D9CC80((uint64_t)a1);
  sub_1B5D95DC8(v8);
  unint64_t v9 = sub_1B5D9DB5C(a1);
  sub_1B5D95DC8(v9);
  unint64_t v10 = sub_1B5D9E5D4((uint64_t)a1);
  sub_1B5D95DC8(v10);
  id v11 = self;
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB848DF8);
  id v12 = (id)sub_1B5DBAC28();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_activateConstraints_, v12);
}

uint64_t sub_1B5D9AFA4()
{
  if (!*(void *)(*(void *)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements] + 16))
  {
    double v6 = 0.0;
    double v7 = 0.0;
    goto LABEL_20;
  }
  uint64_t v1 = v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
  id v2 = objc_msgSend(v0, sel_traitCollection);
  id v3 = objc_msgSend(v2, sel_horizontalSizeClass);

  if (v3 == (id)1)
  {
    unint64_t v5 = (double *)&unk_1B5DC0C90;
  }
  else
  {
    double v4 = 0.0;
    if (v3 != (id)2) {
      goto LABEL_8;
    }
    unint64_t v5 = (double *)&unk_1B5DC0CA8;
  }
  double v4 = v5[v1];
LABEL_8:
  id v8 = objc_msgSend(v0, sel_traitCollection);
  id v9 = objc_msgSend(v8, sel_horizontalSizeClass);

  if (v9 == (id)1)
  {
    id v11 = (double *)&unk_1B5DC0CC0;
    goto LABEL_12;
  }
  double v10 = 0.0;
  if (v9 == (id)2)
  {
    id v11 = (double *)&unk_1B5DC0CD8;
LABEL_12:
    double v10 = v11[v1];
  }
  sub_1B5D98098();
  double v13 = 1.77777778;
  if (v1 != 1) {
    double v13 = 1.0;
  }
  double v14 = v13 * v12;
  sub_1B5D98544();
  uint64_t v16 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize;
  double v17 = vabdd_f64(*(double *)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize] * 0.5, v4 + v15);
  id v18 = objc_msgSend(v0, sel_traitCollection);
  id v19 = objc_msgSend(v18, sel_horizontalSizeClass);

  double v20 = 0.0;
  if (v19 == (id)1) {
    double v20 = 8.0;
  }
  if (v19 == (id)2) {
    double v20 = 10.0;
  }
  double v7 = v17 * (v14 / (v10 + v20));
  double v6 = *(double *)&v0[v16] * 0.5 - v14 * 0.5;
LABEL_20:
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1B5DBE270;
  id v22 = sub_1B5D96BEC();
  id v23 = objc_msgSend(v22, sel_leadingAnchor);

  id v24 = objc_msgSend(v0, sel_leadingAnchor);
  id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, v6 - v7);

  *(void *)(v21 + 32) = v25;
  id v26 = sub_1B5D96BEC();
  id v27 = objc_msgSend(v26, sel_topAnchor);

  id v28 = objc_msgSend(v0, sel_topAnchor);
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(void *)(v21 + 40) = v29;
  id v30 = sub_1B5D96BEC();
  id v31 = objc_msgSend(v30, sel_trailingAnchor);

  id v32 = objc_msgSend(v0, sel_trailingAnchor);
  id v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  *(void *)(v21 + 48) = v33;
  id v34 = sub_1B5D96BEC();
  id v35 = objc_msgSend(v34, sel_bottomAnchor);

  id v36 = objc_msgSend(v0, sel_bottomAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v21 + 56) = v37;
  sub_1B5DBAC58();
  return v21;
}

uint64_t sub_1B5D9B334()
{
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B5DBE270;
  id v2 = sub_1B5D96DF4();
  id v3 = objc_msgSend(v2, sel_leadingAnchor);

  id v4 = objc_msgSend(v0, sel_leadingAnchor);
  id v5 = objc_msgSend(v3, sel_constraintEqualToAnchor_, v4);

  *(void *)(v1 + 32) = v5;
  id v6 = sub_1B5D96DF4();
  id v7 = objc_msgSend(v6, sel_topAnchor);

  id v8 = objc_msgSend(v0, sel_topAnchor);
  id v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(void *)(v1 + 40) = v9;
  id v10 = sub_1B5D96DF4();
  id v11 = objc_msgSend(v10, sel_trailingAnchor);

  id v12 = objc_msgSend(v0, sel_trailingAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(void *)(v1 + 48) = v13;
  id v14 = sub_1B5D96DF4();
  id v15 = objc_msgSend(v14, sel_bottomAnchor);

  id v16 = objc_msgSend(v0, sel_bottomAnchor);
  id v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(void *)(v1 + 56) = v17;
  sub_1B5DBAC58();
  return v1;
}

uint64_t sub_1B5D9B534()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v2 - 8);
  id v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v5)
  {
    id v6 = v5;
    sub_1B5DBA3F8();

    uint64_t v7 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v4, 1, v7) != 1)
    {
      sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
      sub_1B5CECC98((uint64_t *)&unk_1EB849888);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_1B5DBE270;
      id v9 = sub_1B5D9780C();
      id v10 = objc_msgSend(v9, sel_leadingAnchor);

      id v11 = objc_msgSend(v1, sel_leadingAnchor);
      id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_constant_, v11, 16.0);

      *(void *)(v8 + 32) = v12;
      id v13 = sub_1B5D9780C();
      id v14 = objc_msgSend(v13, sel_topAnchor);

      id v15 = objc_msgSend(v1, sel_topAnchor);
      id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 16.0);

      *(void *)(v8 + 40) = v16;
      id v17 = sub_1B5D9780C();
      id v18 = objc_msgSend(v17, sel_widthAnchor);

      id v19 = objc_msgSend(v18, sel_constraintLessThanOrEqualToConstant_, 150.0);
      *(void *)(v8 + 48) = v19;
      id v20 = sub_1B5D9780C();
      id v21 = objc_msgSend(v20, sel_heightAnchor);

      id v22 = objc_msgSend(v21, sel_constraintEqualToConstant_, 32.0);
      *(void *)(v8 + 56) = v22;
      uint64_t v26 = v8;
      sub_1B5DBAC58();
      return v26;
    }
  }
  else
  {
    uint64_t v24 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v4, 1, 1, v24);
  }
  sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
  return MEMORY[0x1E4FBC860];
}

unint64_t sub_1B5D9B848(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v56 = MEMORY[0x1E4FBC860];
  if ((unint64_t)(a1 - 1) > 1)
  {
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    id v10 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v11 + 16) = xmmword_1B5DBDA20;
    uint64_t v13 = MEMORY[0x1E4FBB5C8];
    *(void *)(v11 + 56) = v12;
    *(void *)(v11 + 64) = v13;
    *(void *)(v11 + 32) = a1;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v7)
  {
    id v8 = v7;
    sub_1B5DBA3F8();

    uint64_t v9 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9) != 1)
    {
      sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
      return MEMORY[0x1E4FBC860];
    }
  }
  else
  {
    uint64_t v15 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 1, 1, v15);
  }
  sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
  unsigned __int8 v55 = *(unsigned char *)(*(void *)&v2[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView]
                 + OBJC_IVAR___APPrivacyMarker_privacyMarkerType);
  id v16 = objc_msgSend(self, sel_sharedApplication);
  id v17 = objc_msgSend(v16, sel_preferredContentSizeCategory);

  swift_beginAccess();
  _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v55, (uint64_t)v17);
  double v19 = v18;

  sub_1B5D98BFC();
  if (v19 > v20) {
    double v21 = v19;
  }
  else {
    double v21 = v20;
  }
  sub_1B5D98BFC();
  if (v22 >= v19)
  {
    id v30 = sub_1B5D9708C();
    id v27 = objc_msgSend(v30, sel_topAnchor);

    id v28 = objc_msgSend(v2, sel_topAnchor);
    id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v28, 16.0);
  }
  else
  {
    sub_1B5D98BFC();
    double v24 = (v19 - v23) * -0.5 + 16.0;
    if (v24 < 0.0) {
      double v25 = 0.0;
    }
    else {
      double v25 = v24;
    }
    id v26 = sub_1B5D9708C();
    id v27 = objc_msgSend(v26, sel_topAnchor);

    id v28 = objc_msgSend(v2, sel_topAnchor);
    id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v28, v25);
  }
  id v31 = v29;

  id v32 = v31;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();

  id v33 = sub_1B5D9708C();
  id v34 = objc_msgSend(v33, sel_leadingAnchor);

  id v35 = objc_msgSend(v2, sel_leadingAnchor);
  id v36 = objc_msgSend(v34, sel_constraintGreaterThanOrEqualToAnchor_constant_, v35, 16.0);

  id v37 = sub_1B5D9708C();
  id v38 = objc_msgSend(v37, sel_trailingAnchor);

  id v39 = objc_msgSend(v2, sel_trailingAnchor);
  id v40 = objc_msgSend(v38, sel_constraintLessThanOrEqualToAnchor_constant_, v39, -16.0);

  id v41 = sub_1B5D9708C();
  id v42 = objc_msgSend(v41, sel_centerXAnchor);

  id v43 = objc_msgSend(v2, sel_centerXAnchor);
  id v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v43);

  id v45 = sub_1B5D9708C();
  id v46 = objc_msgSend(v45, sel_heightAnchor);

  id v47 = objc_msgSend(v46, sel_constraintEqualToConstant_, v21);
  if (!(v56 >> 62))
  {
    uint64_t v48 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v49 = v48 + 4;
    if (!__OFADD__(v48, 4)) {
      goto LABEL_21;
    }
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_1B5DBB2E8();
  swift_bridgeObjectRelease();
  uint64_t v49 = v53 + 4;
  if (__OFADD__(v53, 4)) {
    goto LABEL_31;
  }
LABEL_21:
  sub_1B5DA2A18(v49, 1);
  sub_1B5DBAC58();
  id v36 = v36;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_32:
  }
    sub_1B5DBAC68();
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v50 = v40;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v51 = v44;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v52 = v47;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();

  return v56;
}

unint64_t sub_1B5D9BFAC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v37 = MEMORY[0x1E4FBC860];
  if ((unint64_t)(a1 - 1) > 1)
  {
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v11 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v12 + 16) = xmmword_1B5DBDA20;
    uint64_t v14 = MEMORY[0x1E4FBB5C8];
    *(void *)(v12 + 56) = v13;
    *(void *)(v12 + 64) = v14;
    *(void *)(v12 + 32) = a1;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v7)
  {
    id v8 = v7;
    sub_1B5DBA3F8();

    uint64_t v9 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9) == 1)
    {
      unint64_t v10 = MEMORY[0x1E4FBC860];
      goto LABEL_7;
    }
    sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v15 = sub_1B5DB9868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 1, 1, v15);
  unint64_t v10 = v37;
LABEL_7:
  sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
  id v16 = sub_1B5D97114();
  id v17 = objc_msgSend(v16, sel_leadingAnchor);

  id v18 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                              + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView), sel_trailingAnchor));
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, -1.0);

  id v20 = sub_1B5D97114();
  id v21 = objc_msgSend(v20, sel_trailingAnchor);

  id v22 = sub_1B5D9708C();
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  id v25 = sub_1B5D97114();
  id v26 = objc_msgSend(v25, sel_centerYAnchor);

  id v27 = sub_1B5D9708C();
  id v28 = objc_msgSend(v27, sel_centerYAnchor);

  id v29 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v28);
  if (!(v10 >> 62))
  {
    uint64_t v30 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v31 = v30 + 3;
    if (!__OFADD__(v30, 3)) {
      goto LABEL_9;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_1B5DBB2E8();
  swift_bridgeObjectRelease();
  uint64_t v31 = v35 + 3;
  if (__OFADD__(v35, 3)) {
    goto LABEL_19;
  }
LABEL_9:
  sub_1B5DA2A18(v31, 1);
  sub_1B5DBAC58();
  unint64_t v10 = (unint64_t)v19;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_20:
  }
    sub_1B5DBAC68();
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v32 = v24;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v33 = v29;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();

  return v37;
}

unint64_t sub_1B5D9C4AC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v55 = MEMORY[0x1E4FBC860];
  if ((unint64_t)(a1 - 1) > 1)
  {
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    id v23 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v24 + 16) = xmmword_1B5DBDA20;
    uint64_t v26 = MEMORY[0x1E4FBB5C8];
    *(void *)(v24 + 56) = v25;
    *(void *)(v24 + 64) = v26;
    *(void *)(v24 + 32) = a1;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (!v7)
  {
    uint64_t v28 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 1, 1, v28);
    unint64_t v11 = v55;
LABEL_12:
    sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
    id v29 = *(unsigned char **)&v2[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
    unsigned __int8 v54 = v29[OBJC_IVAR___APPrivacyMarker_privacyMarkerType];
    id v30 = objc_msgSend(self, sel_sharedApplication);
    id v31 = objc_msgSend(v30, sel_preferredContentSizeCategory);

    swift_beginAccess();
    _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v54, (uint64_t)v31);
    double v33 = v32;

    id v34 = objc_msgSend(v29, sel_leadingAnchor);
    id v35 = sub_1B5D9708C();
    id v36 = objc_msgSend(v35, sel_leadingAnchor);

    id v37 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v36);
    id v38 = objc_msgSend(v29, sel_trailingAnchor);
    id v39 = sub_1B5D97114();
    id v40 = objc_msgSend(v39, sel_leadingAnchor);

    id v41 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v40, 1.0);
    id v42 = objc_msgSend(v29, sel_centerYAnchor);
    id v43 = sub_1B5D9708C();
    id v44 = objc_msgSend(v43, sel_centerYAnchor);

    id v45 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v44);
    id v46 = objc_msgSend(v29, sel_widthAnchor);
    id v47 = objc_msgSend(v46, sel_constraintEqualToConstant_, v33);

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_1B5DBB2E8();
      swift_bridgeObjectRelease();
      uint64_t v49 = v51 + 4;
      if (!__OFADD__(v51, 4))
      {
LABEL_14:
        sub_1B5DA2A18(v49, 1);
        sub_1B5DBAC58();
        id v37 = v37;
        MEMORY[0x1BA9AB370]();
        if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_15:
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v22 = v41;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v15 = v45;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v50 = v47;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();

          goto LABEL_22;
        }
LABEL_26:
        sub_1B5DBAC68();
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v48 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v49 = v48 + 4;
      if (!__OFADD__(v48, 4)) {
        goto LABEL_14;
      }
    }
    __break(1u);
    goto LABEL_26;
  }
  id v8 = v7;
  sub_1B5DBA3F8();

  uint64_t v9 = sub_1B5DB9868();
  int v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9);
  unint64_t v11 = MEMORY[0x1E4FBC860];
  if (v10 == 1) {
    goto LABEL_12;
  }
  sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
  uint64_t v12 = *(void **)&v2[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  id v13 = objc_msgSend(v12, sel_topAnchor);
  id v14 = objc_msgSend(v2, sel_topAnchor);
  sub_1B5D986C8();
  id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14);

  id v16 = objc_msgSend(v12, sel_trailingAnchor);
  id v17 = objc_msgSend(v2, sel_trailingAnchor);
  sub_1B5D98884();
  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, -v18);

  if (!(v11 >> 62))
  {
    uint64_t v20 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v21 = v20 + 2;
    if (!__OFADD__(v20, 2)) {
      goto LABEL_6;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_1B5DBB2E8();
  swift_bridgeObjectRelease();
  uint64_t v21 = v52 + 2;
  if (__OFADD__(v52, 2)) {
    goto LABEL_29;
  }
LABEL_6:
  sub_1B5DA2A18(v21, 1);
  sub_1B5DBAC58();
  id v15 = v15;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_30:
  }
    sub_1B5DBAC68();
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v22 = v19;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();
LABEL_22:

  return v55;
}

uint64_t sub_1B5D9CC80(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  int v10 = (char *)&v121 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  id v13 = (char *)&v121 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  id v16 = (char *)&v121 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  v122 = (char *)&v121 - v18;
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  v121 = (char *)&v121 - v20;
  MEMORY[0x1F4188790](v19);
  v123 = (char *)&v121 - v21;
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1B5DBE490;
  id v23 = sub_1B5D96EB4();
  id v24 = objc_msgSend(v23, sel_leadingAnchor);

  id v25 = objc_msgSend(v2, sel_leadingAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v25, 16.0);

  *(void *)(v22 + 32) = v26;
  uint64_t v124 = v22;
  sub_1B5DBAC58();
  unint64_t v27 = v124;
  if (a1 != 2)
  {
    if (a1 != 1)
    {
      swift_bridgeObjectRelease();
      sub_1B5DBAD98();
      sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
      CGRect v67 = (void *)sub_1B5DBB018();
      sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
      uint64_t v68 = swift_allocObject();
      uint64_t v69 = MEMORY[0x1E4FBB550];
      *(_OWORD *)(v68 + 16) = xmmword_1B5DBDA20;
      uint64_t v70 = MEMORY[0x1E4FBB5C8];
      *(void *)(v68 + 56) = v69;
      *(void *)(v68 + 64) = v70;
      *(void *)(v68 + 32) = a1;
      sub_1B5DBA838();

      swift_bridgeObjectRelease();
      return MEMORY[0x1E4FBC860];
    }
    id v28 = sub_1B5D96EB4();
    id v29 = objc_msgSend(v28, sel_trailingAnchor);

    id v30 = objc_msgSend(v2, sel_trailingAnchor);
    id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, -16.0);

    id v32 = sub_1B5D96EB4();
    id v33 = objc_msgSend(v32, sel_bottomAnchor);

    id v34 = sub_1B5D97358();
    id v35 = objc_msgSend(v34, sel_topAnchor);

    id v36 = objc_msgSend(v33, sel_constraintEqualToAnchor_constant_, v35, -16.0);
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1B5DBB2E8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v38 = (uint64_t)v123;
    if (__OFADD__(v37, 2))
    {
      __break(1u);
    }
    else
    {
      sub_1B5DA2A18(v37 + 2, 1);
      sub_1B5DBAC58();
      unint64_t v27 = (unint64_t)v31;
      MEMORY[0x1BA9AB370]();
      if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_7;
      }
    }
    sub_1B5DBAC68();
LABEL_7:
    sub_1B5DBAC88();
    sub_1B5DBAC58();
    id v39 = v36;
    MEMORY[0x1BA9AB370]();
    if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1B5DBAC68();
    }
    sub_1B5DBAC88();
    sub_1B5DBAC58();

    uint64_t v40 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
    id v41 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
    if (v41)
    {
      id v42 = v41;
      sub_1B5DBA3F8();

      uint64_t v43 = sub_1B5DB9868();
      uint64_t v44 = *(void *)(v43 - 8);
      id v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
      if (v45(v38, 1, v43) != 1)
      {
        sub_1B5CEF924(v38, &qword_1EB847BD0);
        id v46 = sub_1B5D96EB4();
        id v47 = objc_msgSend(v46, sel_topAnchor);

        id v48 = sub_1B5D9780C();
        id v49 = objc_msgSend(v48, sel_bottomAnchor);

        id v50 = *(void **)&v2[v40];
        if (v50)
        {
          id v51 = v50;
          uint64_t v52 = (uint64_t)v121;
          sub_1B5DBA3F8();

          if (v45(v52, 1, v43) == 1) {
            double v53 = 8.0;
          }
          else {
            double v53 = 12.0;
          }
        }
        else
        {
          uint64_t v52 = (uint64_t)v121;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v121, 1, 1, v43);
          double v53 = 8.0;
        }
        sub_1B5CEF924(v52, &qword_1EB847BD0);
        id v96 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v49, v53);

LABEL_57:
        id v120 = v96;
        MEMORY[0x1BA9AB370]();
        if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B5DBAC68();
        }
        sub_1B5DBAC88();
        sub_1B5DBAC58();

        return v124;
      }
    }
    else
    {
      uint64_t v81 = sub_1B5DB9868();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v38, 1, 1, v81);
    }
    sub_1B5CEF924(v38, &qword_1EB847BD0);
    id v82 = sub_1B5D96EB4();
    id v83 = objc_msgSend(v82, sel_topAnchor);

    id v84 = sub_1B5D97114();
    id v85 = objc_msgSend(v84, sel_bottomAnchor);

    uint64_t v86 = *(void **)&v2[v40];
    if (v86)
    {
      id v87 = v86;
      uint64_t v88 = v122;
      sub_1B5DBA3F8();

      uint64_t v89 = sub_1B5DB9868();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v89 - 8) + 48))(v88, 1, v89) == 1) {
        double v90 = 8.0;
      }
      else {
        double v90 = 12.0;
      }
    }
    else
    {
      uint64_t v95 = sub_1B5DB9868();
      uint64_t v88 = v122;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v122, 1, 1, v95);
      double v90 = 8.0;
    }
    sub_1B5CEF924((uint64_t)v88, &qword_1EB847BD0);
    id v96 = objc_msgSend(v83, sel_constraintEqualToAnchor_constant_, v85, v90);

    goto LABEL_57;
  }
  v123 = v7;
  uint64_t v54 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  unint64_t v55 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v55)
  {
    id v56 = v55;
    sub_1B5DBA3F8();

    uint64_t v57 = sub_1B5DB9868();
    uint64_t v58 = *(void *)(v57 - 8);
    double v59 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48);
    if (v59(v16, 1, v57) != 1)
    {
      sub_1B5CEF924((uint64_t)v16, &qword_1EB847BD0);
      id v60 = sub_1B5D96EB4();
      v122 = (char *)objc_msgSend(v60, sel_topAnchor);

      id v61 = sub_1B5D9780C();
      id v62 = objc_msgSend(v61, sel_bottomAnchor);

      uint64_t v63 = v54;
      CGFloat v64 = *(void **)&v2[v54];
      if (v64)
      {
        id v65 = v64;
        sub_1B5DBA3F8();

        if (v59(v13, 1, v57) == 1) {
          double v66 = 8.0;
        }
        else {
          double v66 = 12.0;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v13, 1, 1, v57);
        double v66 = 8.0;
      }
      sub_1B5CEF924((uint64_t)v13, &qword_1EB847BD0);
      unint64_t v97 = v122;
      id v98 = objc_msgSend(v122, sel_constraintEqualToAnchor_constant_, v62, v66);

      id v94 = v98;
      MEMORY[0x1BA9AB370]();
      if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1B5DBAC68();
      }
      sub_1B5DBAC88();
      v92 = &off_1E6133000;
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v72 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v16, 1, 1, v72);
  }
  sub_1B5CEF924((uint64_t)v16, &qword_1EB847BD0);
  id v73 = sub_1B5D96EB4();
  id v74 = objc_msgSend(v73, sel_topAnchor);

  id v75 = sub_1B5D97114();
  id v76 = objc_msgSend(v75, sel_bottomAnchor);

  uint64_t v63 = v54;
  uint64_t v77 = *(void **)&v2[v54];
  if (v77)
  {
    id v78 = v77;
    sub_1B5DBA3F8();

    uint64_t v79 = sub_1B5DB9868();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v79 - 8) + 48))(v10, 1, v79) == 1) {
      double v80 = 8.0;
    }
    else {
      double v80 = 12.0;
    }
  }
  else
  {
    uint64_t v91 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v10, 1, 1, v91);
    double v80 = 8.0;
  }
  v92 = &off_1E6133000;
  sub_1B5CEF924((uint64_t)v10, &qword_1EB847BD0);
  id v93 = objc_msgSend(v74, sel_constraintEqualToAnchor_constant_, v76, v80);

  id v94 = v93;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
LABEL_42:
  sub_1B5DBAC58();

  uint64_t v99 = sub_1B5D978D0();
  if (!v99)
  {
    id v110 = sub_1B5D96EB4();
    id v111 = objc_msgSend(v110, sel_trailingAnchor);

    id v112 = objc_msgSend(v2, sel_trailingAnchor);
    id v113 = objc_msgSend(v111, sel_constraintEqualToAnchor_constant_, v112, -16.0);

    id v100 = v113;
    MEMORY[0x1BA9AB370]();
    if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1B5DBAC68();
    }
    sub_1B5DBAC88();
    sub_1B5DBAC58();
    goto LABEL_54;
  }
  id v100 = v99;
  uint64_t v101 = *(void **)&v2[v63];
  if (!v101)
  {
    uint64_t v114 = sub_1B5DB9868();
    uint64_t v103 = (uint64_t)v123;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56))(v123, 1, 1, v114);
    goto LABEL_50;
  }
  id v102 = v101;
  uint64_t v103 = (uint64_t)v123;
  sub_1B5DBA3F8();

  uint64_t v104 = sub_1B5DB9868();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 48))(v103, 1, v104) == 1)
  {
LABEL_50:
    sub_1B5CEF924(v103, &qword_1EB847BD0);
    id v115 = sub_1B5D96EB4();
    id v116 = objc_msgSend(v115, sel_trailingAnchor);

    id v117 = objc_msgSend(v2, sel_trailingAnchor);
    id v118 = objc_msgSend(v116, sel_constraintEqualToAnchor_constant_, v117, -16.0);

    id v109 = v118;
    goto LABEL_51;
  }
  sub_1B5CEF924(v103, &qword_1EB847BD0);
  id v105 = sub_1B5D96EB4();
  id v106 = objc_msgSend(v105, sel_trailingAnchor);

  id v107 = [v100 (SEL)v92[488]];
  id v108 = objc_msgSend(v106, sel_constraintEqualToAnchor_constant_, v107, -16.0);

  id v109 = v108;
LABEL_51:
  v119 = v109;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();

LABEL_54:
  return v124;
}

uint64_t sub_1B5D9DB5C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B5DBF150;
  id v8 = sub_1B5D97358();
  id v9 = objc_msgSend(v8, sel_leadingAnchor);

  id v10 = objc_msgSend(v2, sel_leadingAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v7 + 32) = v11;
  id v12 = sub_1B5D97358();
  id v13 = objc_msgSend(v12, sel_trailingAnchor);

  id v14 = objc_msgSend(v2, sel_trailingAnchor);
  id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

  *(void *)(v7 + 40) = v15;
  uint64_t v77 = v7;
  sub_1B5DBAC58();
  unint64_t v16 = v77;
  if (a1 == (void *)2)
  {
    id v30 = sub_1B5D978D0();
    if (v30)
    {
      a1 = v30;
      id v31 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
      if (v31)
      {
        id v32 = v31;
        sub_1B5DBA3F8();

        uint64_t v33 = sub_1B5DB9868();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v6, 1, v33) != 1)
        {
          sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
          id v34 = sub_1B5D97358();
          id v35 = objc_msgSend(v34, sel_topAnchor);

          id v36 = sub_1B5D96EB4();
          id v37 = objc_msgSend(v36, sel_bottomAnchor);

          id v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_constant_, v37, 16.0);
          id v39 = sub_1B5D97358();
          id v40 = objc_msgSend(v39, sel_bottomAnchor);

          id v41 = objc_msgSend(v2, sel_bottomAnchor);
          id v29 = objc_msgSend(v40, sel_constraintEqualToAnchor_constant_, v41, -sub_1B5D99F78());

          if (v16 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v75 = sub_1B5DBB2E8();
            swift_bridgeObjectRelease();
            uint64_t v43 = v75 + 2;
            if (!__OFADD__(v75, 2)) {
              goto LABEL_28;
            }
          }
          else
          {
            uint64_t v42 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
            uint64_t v43 = v42 + 2;
            if (!__OFADD__(v42, 2)) {
              goto LABEL_28;
            }
          }
          __break(1u);
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v63 = sub_1B5DB9868();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v6, 1, 1, v63);
        unint64_t v16 = v77;
      }
      sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
      id v64 = sub_1B5D97358();
      id v65 = objc_msgSend(v64, sel_topAnchor);

      id v66 = objc_msgSend(a1, sel_bottomAnchor);
      id v38 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, 16.0);

      id v67 = sub_1B5D97358();
      id v68 = objc_msgSend(v67, sel_bottomAnchor);

      id v69 = objc_msgSend(v2, sel_bottomAnchor);
      id v29 = objc_msgSend(v68, sel_constraintEqualToAnchor_constant_, v69, -sub_1B5D99F78());

      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v73 = sub_1B5DBB2E8();
        swift_bridgeObjectRelease();
        uint64_t v43 = v73 + 2;
        if (!__OFADD__(v73, 2)) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v70 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v43 = v70 + 2;
        if (!__OFADD__(v70, 2))
        {
LABEL_28:
          sub_1B5DA2A18(v43, 1);
          sub_1B5DBAC58();
          id v71 = v38;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v72 = v29;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();

          return v77;
        }
      }
      __break(1u);
LABEL_37:
      sub_1B5DBAC68();
      goto LABEL_16;
    }
    id v53 = sub_1B5D97358();
    id v54 = objc_msgSend(v53, sel_topAnchor);

    id v55 = sub_1B5D96EB4();
    id v56 = objc_msgSend(v55, sel_bottomAnchor);

    id v24 = objc_msgSend(v54, sel_constraintEqualToAnchor_constant_, v56, 16.0);
    id v57 = sub_1B5D97358();
    id v58 = objc_msgSend(v57, sel_bottomAnchor);

    id v59 = objc_msgSend(v2, sel_bottomAnchor);
    id v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v59, -sub_1B5D99F78());

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_1B5DBB2E8();
      swift_bridgeObjectRelease();
      uint64_t v62 = v74 + 2;
      if (!__OFADD__(v74, 2))
      {
LABEL_19:
        sub_1B5DA2A18(v62, 1);
        sub_1B5DBAC58();
        id v24 = v24;
        MEMORY[0x1BA9AB370]();
        if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_20:
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v29 = v60;
          goto LABEL_21;
        }
LABEL_41:
        sub_1B5DBAC68();
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v61 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v62 = v61 + 2;
      if (!__OFADD__(v61, 2)) {
        goto LABEL_19;
      }
    }
    __break(1u);
    goto LABEL_41;
  }
  if (a1 != (void *)1)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v44 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v45 + 16) = xmmword_1B5DBDA20;
    uint64_t v47 = MEMORY[0x1E4FBB5C8];
    *(void *)(v45 + 56) = v46;
    *(void *)(v45 + 64) = v47;
    *(void *)(v45 + 32) = a1;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  id v17 = sub_1B5D97358();
  id v18 = objc_msgSend(v17, sel_topAnchor);

  id v19 = sub_1B5D96EB4();
  id v20 = objc_msgSend(v19, sel_bottomAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v20, 16.0);
  id v22 = v21;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();

  id v23 = sub_1B5D978D0();
  if (v23)
  {
    id v24 = v23;
    id v25 = sub_1B5D97358();
    id v26 = objc_msgSend(v25, sel_bottomAnchor);

    id v27 = objc_msgSend(v24, sel_topAnchor);
    id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_constant_, v27, -sub_1B5D99F78());

    id v29 = v28;
LABEL_21:
    MEMORY[0x1BA9AB370]();
    if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1B5DBAC68();
    }
    sub_1B5DBAC88();
    sub_1B5DBAC58();

    goto LABEL_24;
  }
  id v49 = sub_1B5D97358();
  id v50 = objc_msgSend(v49, sel_bottomAnchor);

  id v51 = objc_msgSend(v2, sel_bottomAnchor);
  id v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_constant_, v51, -sub_1B5D99F78());

  id v29 = v52;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_37;
  }
LABEL_16:
  sub_1B5DBAC88();
  sub_1B5DBAC58();
LABEL_24:

  return v77;
}

unint64_t sub_1B5D9E5D4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5D978D0();
  if (!v7) {
    return MEMORY[0x1E4FBC860];
  }
  id v8 = v7;
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1B5DBE490;
  id v10 = objc_msgSend(v8, sel_heightAnchor);
  id v11 = objc_msgSend(v10, sel_constraintEqualToConstant_, 24.0);

  *(void *)(v9 + 32) = v11;
  unint64_t v73 = v9;
  sub_1B5DBAC58();
  unint64_t v12 = v73;
  unint64_t v74 = v73;
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      id v13 = objc_msgSend(v8, sel_leadingAnchor);
      id v14 = objc_msgSend(v2, sel_leadingAnchor);
      id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, 16.0);

      id v16 = objc_msgSend(v8, sel_topAnchor);
      id v17 = sub_1B5D97358();
      id v18 = objc_msgSend(v17, sel_bottomAnchor);

      id v19 = sub_1B5D978D0();
      double v20 = 0.0;
      if (v19) {
        double v20 = 16.0;
      }
      id v21 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v18, v20);

      id v22 = objc_msgSend(v8, sel_trailingAnchor);
      id v23 = objc_msgSend(v2, sel_trailingAnchor);
      id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, -16.0);

      id v25 = objc_msgSend(v8, sel_bottomAnchor);
      id v26 = objc_msgSend(v2, sel_bottomAnchor);
      id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, -sub_1B5D99F78());

      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v72 = sub_1B5DBB2E8();
        swift_bridgeObjectRelease();
        uint64_t v29 = v72 + 4;
        if (!__OFADD__(v72, 4))
        {
LABEL_8:
          sub_1B5DA2A18(v29, 1);
          sub_1B5DBAC58();
          unint64_t v12 = (unint64_t)v15;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          {
LABEL_9:
            sub_1B5DBAC88();
            sub_1B5DBAC58();
            id v30 = v21;
            MEMORY[0x1BA9AB370]();
            if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1B5DBAC68();
            }
            sub_1B5DBAC88();
            sub_1B5DBAC58();
            id v31 = v24;
            MEMORY[0x1BA9AB370]();
            if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1B5DBAC68();
            }
            sub_1B5DBAC88();
            sub_1B5DBAC58();
            id v32 = v27;
            MEMORY[0x1BA9AB370]();
            if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_1B5DBAC68();
            }
            sub_1B5DBAC88();
            sub_1B5DBAC58();

            goto LABEL_40;
          }
LABEL_44:
          sub_1B5DBAC68();
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v28 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v29 = v28 + 4;
        if (!__OFADD__(v28, 4)) {
          goto LABEL_8;
        }
      }
      __break(1u);
      goto LABEL_44;
    }
    swift_bridgeObjectRelease();
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    id v51 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v52 = swift_allocObject();
    uint64_t v53 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v52 + 16) = xmmword_1B5DBDA20;
    uint64_t v54 = MEMORY[0x1E4FBB5C8];
    *(void *)(v52 + 56) = v53;
    *(void *)(v52 + 64) = v54;
    *(void *)(v52 + 32) = a1;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  objc_msgSend(v8, sel_sizeThatFits_, sub_1B5D98388() + -32.0, 24.0);
  double v34 = fmax(v33, 150.0);
  id v35 = objc_msgSend(v8, sel_widthAnchor);
  id v36 = objc_msgSend(v35, sel_constraintEqualToConstant_, v34);

  id v37 = v36;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();

  id v38 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (!v38)
  {
    uint64_t v56 = sub_1B5DB9868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v6, 1, 1, v56);
LABEL_29:
    sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
    id v57 = objc_msgSend(v8, sel_topAnchor);
    id v58 = sub_1B5D96EB4();
    id v59 = objc_msgSend(v58, sel_bottomAnchor);

    id v60 = sub_1B5D978D0();
    double v61 = 16.0;
    if (!v60) {
      double v61 = 0.0;
    }
    id v62 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v59, v61);

    id v63 = objc_msgSend(v8, sel_bottomAnchor);
    id v64 = sub_1B5D97358();
    id v65 = objc_msgSend(v64, sel_topAnchor);

    id v66 = objc_msgSend(v63, sel_constraintEqualToAnchor_constant_, v65, -16.0);
    id v67 = objc_msgSend(v8, sel_centerXAnchor);
    id v68 = objc_msgSend(v2, sel_centerXAnchor);
    id v69 = objc_msgSend(v67, sel_constraintEqualToAnchor_, v68);

    if (v74 >> 62)
    {
      swift_bridgeObjectRetain();
      id v70 = (id)sub_1B5DBB2E8();
      swift_bridgeObjectRelease();
      uint64_t v71 = (uint64_t)v70 + 3;
      if (!__OFADD__(v70, 3))
      {
LABEL_33:
        sub_1B5DA2A18(v71, 1);
        sub_1B5DBAC58();
        id v70 = v62;
        MEMORY[0x1BA9AB370]();
        if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_34:
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v50 = v66;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();
          id v48 = v69;
          MEMORY[0x1BA9AB370]();
          if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5DBAC68();
          }
          sub_1B5DBAC88();
          sub_1B5DBAC58();

          goto LABEL_39;
        }
LABEL_48:
        sub_1B5DBAC68();
        goto LABEL_34;
      }
    }
    else
    {
      id v70 = *(id *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v71 = (uint64_t)v70 + 3;
      if (!__OFADD__(v70, 3)) {
        goto LABEL_33;
      }
    }
    __break(1u);
    goto LABEL_48;
  }
  id v39 = v38;
  sub_1B5DBA3F8();

  uint64_t v40 = sub_1B5DB9868();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 48))(v6, 1, v40) == 1) {
    goto LABEL_29;
  }
  sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
  id v41 = objc_msgSend(v8, sel_trailingAnchor);
  id v42 = objc_msgSend(v2, sel_trailingAnchor);
  id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v42, -16.0);

  id v44 = objc_msgSend(v8, sel_centerYAnchor);
  id v45 = sub_1B5D96EB4();
  id v46 = objc_msgSend(v45, sel_centerYAnchor);

  id v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v46);
  if (!(v74 >> 62))
  {
    id v48 = *(id *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v49 = (uint64_t)v48 + 2;
    if (!__OFADD__(v48, 2)) {
      goto LABEL_22;
    }
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  swift_bridgeObjectRetain();
  id v48 = (id)sub_1B5DBB2E8();
  swift_bridgeObjectRelease();
  uint64_t v49 = (uint64_t)v48 + 2;
  if (__OFADD__(v48, 2)) {
    goto LABEL_51;
  }
LABEL_22:
  sub_1B5DA2A18(v49, 1);
  sub_1B5DBAC58();
  id v48 = v43;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_52:
  }
    sub_1B5DBAC68();
  sub_1B5DBAC88();
  sub_1B5DBAC58();
  id v50 = v47;
  MEMORY[0x1BA9AB370]();
  if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1B5DBAC68();
  }
  sub_1B5DBAC88();
  sub_1B5DBAC58();
LABEL_39:

LABEL_40:
  return v74;
}

void sub_1B5D9F104(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v33 - v8;
  if (a1 == 2)
  {
    id v14 = sub_1B5D978D0();
    if (!v14) {
      return;
    }
    id v15 = v14;
    id v16 = *(void **)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
    if (v16)
    {
      id v17 = v16;
      sub_1B5DBA3F8();

      uint64_t v18 = sub_1B5DB9868();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v7, 1, v18) != 1)
      {
        sub_1B5CEF924((uint64_t)v7, &qword_1EB847BD0);
        LODWORD(v19) = 1148846080;
        objc_msgSend(v15, sel_setContentCompressionResistancePriority_forAxis_, 0, v19);

        return;
      }
    }
    else
    {
      uint64_t v32 = sub_1B5DB9868();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v7, 1, 1, v32);
    }

    uint64_t v13 = (uint64_t)v7;
    goto LABEL_17;
  }
  if (a1 == 1)
  {
    id v10 = *(void **)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
    if (v10)
    {
      id v11 = v10;
      sub_1B5DBA3F8();

      uint64_t v12 = sub_1B5DB9868();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v9, 1, v12) != 1)
      {
        uint64_t v13 = (uint64_t)v9;
LABEL_17:
        sub_1B5CEF924(v13, &qword_1EB847BD0);
        return;
      }
    }
    else
    {
      uint64_t v24 = sub_1B5DB9868();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
    }
    sub_1B5CEF924((uint64_t)v9, &qword_1EB847BD0);
    id v25 = sub_1B5D97114();
    LODWORD(v26) = 1148846080;
    objc_msgSend(v25, sel_setContentHuggingPriority_forAxis_, 0, v26);

    id v27 = sub_1B5D97114();
    LODWORD(v28) = 1132068864;
    objc_msgSend(v27, sel_setContentCompressionResistancePriority_forAxis_, 0, v28);

    uint64_t v29 = *(void **)(v2 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
    LODWORD(v30) = 1112014848;
    objc_msgSend(v29, sel_setContentHuggingPriority_forAxis_, 0, v30);
    LODWORD(v31) = 1144750080;
    objc_msgSend(v29, sel_setContentCompressionResistancePriority_forAxis_, 0, v31);
    return;
  }
  sub_1B5DBAD98();
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
  double v20 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = MEMORY[0x1E4FBB550];
  *(_OWORD *)(v21 + 16) = xmmword_1B5DBDA20;
  uint64_t v23 = MEMORY[0x1E4FBB5C8];
  *(void *)(v21 + 56) = v22;
  *(void *)(v21 + 64) = v23;
  *(void *)(v21 + 32) = a1;
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
}

uint64_t sub_1B5D9F50C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  id v6 = objc_msgSend(*(id *)&v0[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation);
  if (v6)
  {
    id v7 = v6;
    sub_1B5DBA458();
    if (swift_dynamicCastClass())
    {
      uint64_t v8 = sub_1B5DBA3B8();
      id v10 = &off_1E6133000;
      id v11 = &off_1E6133000;
      if (v9)
      {
        uint64_t v12 = v8;
        uint64_t v13 = v9;
        id v52 = v7;
        uint64_t v14 = MEMORY[0x1E4FBB1A0];
        if (qword_1EB848858 != -1) {
          swift_once();
        }
        sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
        uint64_t v15 = swift_allocObject();
        long long v51 = xmmword_1B5DBDA20;
        *(_OWORD *)(v15 + 16) = xmmword_1B5DBDA20;
        *(void *)(v15 + 56) = v14;
        unint64_t v16 = sub_1B5CFD41C();
        *(void *)(v15 + 64) = v16;
        *(void *)(v15 + 32) = v12;
        *(void *)(v15 + 40) = v13;
        swift_bridgeObjectRetain();
        uint64_t v17 = sub_1B5DBAB18();
        uint64_t v19 = v18;
        swift_bridgeObjectRelease();
        id v20 = sub_1B5D97114();
        uint64_t v21 = (void *)sub_1B5DBAAC8();
        objc_msgSend(v20, sel_setText_, v21);

        uint64_t v22 = *(void **)&v1[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
        if (qword_1EB847898 != -1) {
          swift_once();
        }
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = v51;
        *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v23 + 64) = v16;
        *(void *)(v23 + 32) = v17;
        *(void *)(v23 + 40) = v19;
        swift_bridgeObjectRetain();
        sub_1B5DBAB18();
        swift_bridgeObjectRelease();
        uint64_t v24 = (void *)sub_1B5DBAAC8();
        swift_bridgeObjectRelease();
        id v11 = &off_1E6133000;
        objc_msgSend(v22, sel_setAccessibilityLabel_, v24);

        id v10 = &off_1E6133000;
      }
      id v25 = sub_1B5D96EB4();
      sub_1B5DBA438();
      if (v26)
      {
        id v27 = (void *)sub_1B5DBAAC8();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v27 = 0;
      }
      objc_msgSend(v25, (SEL)v10[378], v27);

      id v35 = sub_1B5D96EB4();
      id v36 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
      if (v36)
      {
        id v37 = v36;
        sub_1B5DBA3F8();

        uint64_t v38 = sub_1B5DB9868();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 48))(v4, 1, v38) == 1) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = 4;
        }
      }
      else
      {
        uint64_t v40 = sub_1B5DB9868();
        uint64_t v39 = 1;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v4, 1, 1, v40);
      }
      sub_1B5CEF924((uint64_t)v4, &qword_1EB847BD0);
      objc_msgSend(v35, sel_setTextAlignment_, v39);

      uint64_t v41 = sub_1B5DBA3E8();
      if (v42)
      {
        uint64_t v43 = v41;
        uint64_t v44 = v42;
        id v45 = sub_1B5D96EB4();
        if (qword_1EB847880 != -1) {
          swift_once();
        }
        sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
        uint64_t v46 = swift_allocObject();
        *(_OWORD *)(v46 + 16) = xmmword_1B5DBDA20;
        *(void *)(v46 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v46 + 64) = sub_1B5CFD41C();
        *(void *)(v46 + 32) = v43;
        *(void *)(v46 + 40) = v44;
        swift_bridgeObjectRetain();
        sub_1B5DBAB18();
        swift_bridgeObjectRelease();
        id v47 = (void *)sub_1B5DBAAC8();
        swift_bridgeObjectRelease();
        objc_msgSend(v45, (SEL)v11[377], v47);
      }
      id v48 = sub_1B5D97358();
      objc_msgSend(v48, sel_reloadData);

      id v49 = sub_1B5D97358();
      id v50 = objc_msgSend(v49, sel_collectionViewLayout);

      objc_msgSend(v50, sel_invalidateLayout);
      objc_msgSend(v1, sel_layoutIfNeeded);
      return swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  sub_1B5DBAD98();
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
  double v28 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1B5DBDA20;
  id v30 = objc_msgSend(*(id *)&v1[v5], sel_identifier);
  uint64_t v31 = sub_1B5DBAAF8();
  uint64_t v33 = v32;

  *(void *)(v29 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v29 + 64) = sub_1B5CFD41C();
  *(void *)(v29 + 32) = v31;
  *(void *)(v29 + 40) = v33;
  sub_1B5DBA838();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5D9FB90(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  sub_1B5DBACB8();
  v2[9] = sub_1B5DBACA8();
  uint64_t v4 = sub_1B5DBAC98();
  v2[10] = v4;
  v2[11] = v3;
  return MEMORY[0x1F4188298](sub_1B5D9FC28, v4, v3);
}

uint64_t sub_1B5D9FC28()
{
  if (qword_1EB847A10 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_1B5D9FCF4;
  uint64_t v2 = *(void *)(v0 + 56);
  return sub_1B5DADEE4(v2);
}

uint64_t sub_1B5D9FCF4(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    id v7 = sub_1B5D9FF54;
  }
  else
  {
    v4[14] = a1;
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    id v7 = sub_1B5D9FE1C;
  }
  return MEMORY[0x1F4188298](v7, v5, v6);
}

uint64_t sub_1B5D9FE1C()
{
  uint64_t v1 = *(void **)(v0 + 112);
  swift_release();
  objc_msgSend(v1, sel_size);
  double v3 = v2;
  objc_msgSend(v1, sel_size);
  if (v3 / v4 * 32.0 <= 150.0) {
    double v5 = v3 / v4 * 32.0;
  }
  else {
    double v5 = 150.0;
  }
  id v6 = sub_1B5D9780C();
  id v7 = objc_msgSend(v6, sel_widthAnchor);

  id v8 = objc_msgSend(v7, sel_constraintEqualToConstant_, v5);
  objc_msgSend(v8, sel_setActive_, 1);

  id v9 = sub_1B5D9780C();
  objc_msgSend(v9, sel_setImage_, v1);

  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_1B5D9FF54()
{
  unint64_t v16 = v0;
  swift_release();
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = sub_1B5DBA938();
  sub_1B5CEFDCC(v2, (uint64_t)qword_1EB84BA88);
  id v3 = v1;
  id v4 = v1;
  double v5 = sub_1B5DBA918();
  os_log_type_t v6 = sub_1B5DBAD98();
  BOOL v7 = os_log_type_enabled(v5, v6);
  id v8 = (void *)v0[13];
  if (v7)
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_getErrorValue();
    uint64_t v11 = sub_1B5DBB428();
    v0[6] = sub_1B5CEE4B4(v11, v12, &v15);
    sub_1B5DBB058();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1B5CE2000, v5, v6, "An error occurred while fetching logo asset: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9AC560](v10, -1, -1);
    MEMORY[0x1BA9AC560](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

id sub_1B5DA0184()
{
  objc_msgSend(v0, sel_setIsAccessibilityElement_, 0);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  uint64_t v2 = *MEMORY[0x1E4FB2540];
  return objc_msgSend(v1, sel_setAccessibilityTraits_, v2);
}

void sub_1B5DA01E0()
{
  objc_msgSend(v0, sel_setReadiness_, 303);
  uint64_t v1 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  objc_msgSend(objc_msgSend(*(id *)&v0[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_metricsHelper), sel_loaded);
  swift_unknownObjectRelease();
  id v2 = objc_msgSend(*(id *)&v0[v1], sel_bestRepresentation);
  if (v2)
  {
    objc_msgSend(v2, sel_adSize);
    double v4 = v3;
    swift_unknownObjectRelease();
  }
  else
  {
    double v4 = 0.0;
  }
  int v5 = v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
  id v6 = objc_msgSend(v0, sel_traitCollection);
  id v7 = objc_msgSend(v6, sel_horizontalSizeClass);

  if (v7 == (id)2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
LABEL_11:
        double v8 = 283.0;
        goto LABEL_17;
      }
      double v8 = 356.0;
    }
    else
    {
      double v8 = 260.0;
    }
LABEL_17:
    if (v4 >= v8) {
      return;
    }
    goto LABEL_18;
  }
  if (v7 == (id)1)
  {
    if (v5)
    {
      if (v5 != 1)
      {
        double v8 = 297.0;
        goto LABEL_17;
      }
      goto LABEL_11;
    }
    double v8 = 148.0;
    goto LABEL_17;
  }
  if (v4 >= 0.0) {
    return;
  }
LABEL_18:
  objc_msgSend(v0, sel_setReadiness_, 305);
}

void sub_1B5DA03E4(uint64_t a1)
{
  if (a1 == 100) {
    _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();
  }
}

void sub_1B5DA03F4()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR___APPCPromotedContentView_customPrivacyHandling) & 1) == 0)
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR___APPCPromotedContentView_overriddenPrivacyMarkerPosition + 8) == 1)
    {
      id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_bestRepresentation));
      if (!v1) {
        return;
      }
      id v2 = objc_msgSend(v1, sel_privacyMarkerPosition);
      swift_unknownObjectRelease();
    }
    else
    {
      id v2 = *(id *)(v0 + OBJC_IVAR___APPCPromotedContentView_overriddenPrivacyMarkerPosition);
    }
    uint64_t v3 = sub_1B5DBA338();
    uint64_t v4 = sub_1B5DBA338();
    int v5 = *(char **)(v0 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
    if (v3 == v4)
    {
      objc_msgSend(v5, sel_setHidden_, 1);
    }
    else
    {
      objc_msgSend(v5, sel_setHidden_, 0);
      *(void *)&v5[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = v2;
      sub_1B5D94950();
    }
  }
}

void sub_1B5DA0510()
{
  uint64_t v1 = sub_1B5DBA718();
  if (v1 == sub_1B5DBA718())
  {
    id v2 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v2, sel_setCornerRadius_, 8.0);

    id v3 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v3, sel_nativeScale);
    double v5 = v4;

    id v6 = objc_msgSend(v0, sel_layer);
    if (qword_1EB848258 != -1) {
      swift_once();
    }
    if (qword_1EB847BC8) {
      id v7 = objc_msgSend((id)qword_1EB847BC8, sel_CGColor);
    }
    else {
      id v7 = 0;
    }
    objc_msgSend(v6, sel_setBorderColor_, v7);

    id v8 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v8, sel_setBorderWidth_, 1.0 / v5);
  }
}

void sub_1B5DA06BC(void *a1)
{
  id v2 = v1;
  uint64_t v4 = sub_1B5CECC98(&qword_1EB847BD0);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5DB9868();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = *(void *)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements];
  if (*(void *)(v14 + 16))
  {
    uint64_t v15 = *(void *)(type metadata accessor for CarouselElement() - 8);
    unsigned __int8 v16 = *(unsigned char *)(v14 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)));
    objc_msgSend(a1, sel_center);
    objc_msgSend(v2, sel_convertPoint_toCoordinateSpace_, v2);
    uint64_t v19 = sub_1B5D88270(v17, v18);
    sub_1B5DA0AF8(v19, v21, v20 & 1, v16);
  }
  else
  {
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v22 = (void *)sub_1B5DBB018();
    sub_1B5DBA838();
  }
  uint64_t v23 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v23)
  {
    id v24 = v23;
    sub_1B5DBA448();

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      id v25 = objc_allocWithZone((Class)sub_1B5DB9F08());
      uint64_t v26 = (void *)sub_1B5DB9EF8();
      sub_1B5D88664(v26);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  sub_1B5CEF924((uint64_t)v6, &qword_1EB847BD0);
  sub_1B5DBAD98();
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
  id v27 = (void *)sub_1B5DBB018();
  sub_1B5DBA838();
}

uint64_t sub_1B5DA0AF8(uint64_t a1, uint64_t a2, char a3, unsigned __int8 a4)
{
  uint64_t v5 = v4;
  uint64_t v6 = MEMORY[0x1E4FBB1A0];
  if (a3)
  {
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v9 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1B5DBDA20;
    id v11 = objc_msgSend(*(id *)&v5[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    uint64_t v12 = sub_1B5DBAAF8();
    uint64_t v14 = v13;

    *(void *)(v10 + 56) = v6;
    *(void *)(v10 + 64) = sub_1B5CFD41C();
    *(void *)(v10 + 32) = v12;
    *(void *)(v10 + 40) = v14;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    *(double *)&a2 = -1.0;
    *(double *)&a1 = -1.0;
  }
  sub_1B5DBADA8();
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
  uint64_t v15 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1B5DC0A30;
  uint64_t v17 = MEMORY[0x1E4FBC958];
  *(void *)(v16 + 56) = MEMORY[0x1E4FBC958];
  unint64_t v18 = sub_1B5DA2150();
  *(void *)(v16 + 64) = v18;
  *(double *)(v16 + 32) = *(double *)&a1;
  *(void *)(v16 + 96) = v17;
  *(void *)(v16 + 104) = v18;
  *(double *)(v16 + 72) = *(double *)&a2;
  objc_msgSend(v5, sel_frame);
  *(void *)(v16 + 136) = v17;
  *(void *)(v16 + 144) = v18;
  *(void *)(v16 + 112) = v19;
  objc_msgSend(v5, sel_frame);
  *(void *)(v16 + 176) = v17;
  *(void *)(v16 + 184) = v18;
  *(void *)(v16 + 152) = v20;
  objc_msgSend(v5, sel_frame);
  *(void *)(v16 + 216) = v17;
  *(void *)(v16 + 224) = v18;
  *(void *)(v16 + 192) = v21;
  objc_msgSend(v5, sel_frame);
  *(void *)(v16 + 256) = v17;
  *(void *)(v16 + 264) = v18;
  *(void *)(v16 + 232) = v22;
  uint64_t v23 = MEMORY[0x1E4FBC3B0];
  *(void *)(v16 + 296) = MEMORY[0x1E4FBC358];
  *(void *)(v16 + 304) = v23;
  *(unsigned char *)(v16 + 272) = a4;
  uint64_t v24 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  id v25 = objc_msgSend(*(id *)&v5[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
  uint64_t v26 = sub_1B5DBAAF8();
  uint64_t v28 = v27;

  *(void *)(v16 + 336) = v6;
  *(void *)(v16 + 344) = sub_1B5CFD41C();
  *(void *)(v16 + 312) = v26;
  *(void *)(v16 + 320) = v28;
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(*(id *)&v5[v24], sel_metricsHelper);
  *(float *)&double v30 = *(double *)&a1;
  *(float *)&double v31 = *(double *)&a2;
  objc_msgSend(v29, sel_interactedWithElementID_atXPos_yPos_, a4, v30, v31);
  return swift_unknownObjectRelease();
}

unint64_t sub_1B5DA0E48(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v62 = sub_1B5DB9868();
  uint64_t v58 = *(void *)(v62 - 8);
  MEMORY[0x1F4188790](v62);
  uint64_t v61 = (uint64_t)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_1B5DB9AB8();
  uint64_t v5 = *(void *)(v59 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x1F4188790](v59);
  MEMORY[0x1F4188790](v7);
  uint64_t v60 = (uint64_t)&v54 - v8;
  uint64_t v9 = type metadata accessor for CarouselElement();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1B5DB9AA8();
  uint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
  if (v13 < *(void *)(v14 + 16))
  {
    unint64_t result = sub_1B5DB9AA8();
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(void *)(v14 + 16))
    {
      sub_1B5CF9608(v14+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * result, (uint64_t)v12);
      type metadata accessor for ImageCache();
      swift_initStaticObject();
      uint64_t v16 = &v12[*(int *)(v9 + 24)];
      id v17 = sub_1B5D922FC();
      id v57 = v16;
      unint64_t v18 = (void *)sub_1B5DB9818();
      id v19 = objc_msgSend(v17, sel_objectForKey_, v18);

      if (!v19)
      {
        uint64_t v20 = (uint64_t *)(v2 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_prefetchingIndexPaths);
        swift_beginAccess();
        if (!*(void *)(*v20 + 16)
          || (swift_bridgeObjectRetain(), sub_1B5D48368(a1), char v22 = v21, swift_bridgeObjectRelease(), (v22 & 1) == 0))
        {
          LODWORD(v55) = sub_1B5DBAD88();
          sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
          uint64_t v54 = sub_1B5DBB018();
          sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
          uint64_t v23 = swift_allocObject();
          *(_OWORD *)(v23 + 16) = xmmword_1B5DBDCA0;
          uint64_t v24 = sub_1B5DB9AA8();
          uint64_t v25 = MEMORY[0x1E4FBB5C8];
          *(void *)(v23 + 56) = MEMORY[0x1E4FBB550];
          *(void *)(v23 + 64) = v25;
          *(void *)(v23 + 32) = v24;
          id v26 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                                      + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier));
          uint64_t v27 = sub_1B5DBAAF8();
          uint64_t v56 = v20;
          uint64_t v29 = v28;

          *(void *)(v23 + 96) = MEMORY[0x1E4FBB1A0];
          *(void *)(v23 + 104) = sub_1B5CFD41C();
          *(void *)(v23 + 72) = v27;
          *(void *)(v23 + 80) = v29;
          double v30 = (void *)v54;
          sub_1B5DBA838();

          swift_bridgeObjectRelease();
          double v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
          id v55 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v32 = v59;
          v31(v60, a1, v59);
          uint64_t v33 = v58;
          (*(void (**)(uint64_t, char *, uint64_t))(v58 + 16))(v61, v57, v62);
          uint64_t v34 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v35 = v55;
          v31((uint64_t)v55, a1, v32);
          unint64_t v36 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
          uint64_t v37 = swift_allocObject();
          *(void *)(v37 + 16) = v34;
          (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v37 + v36, v35, v32);
          swift_retain();
          uint64_t v38 = v61;
          id v39 = sub_1B5D923D8(v61, (void (*)(id, uint64_t))sub_1B5DA3F78, v37);
          uint64_t v40 = v56;
          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v38, v62);
          swift_release();
          swift_beginAccess();
          if (v39)
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v63 = *v40;
            uint64_t *v40 = 0x8000000000000000;
            uint64_t v42 = (uint64_t)v39;
            uint64_t v43 = v60;
            sub_1B5DB24A0(v42, v60, isUniquelyReferenced_nonNull_native);
            uint64_t *v40 = v63;
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v43, v32);
          }
          else
          {
            uint64_t v52 = v60;
            uint64_t v53 = (void *)sub_1B5DB518C(v60);
            (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v52, v32);
          }
          swift_endAccess();
        }
      }
      return sub_1B5CF966C((uint64_t)v12);
    }
    __break(1u);
    return result;
  }
  sub_1B5DBAD98();
  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
  uint64_t v44 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1B5DBDCA0;
  uint64_t v46 = sub_1B5DB9AA8();
  uint64_t v47 = MEMORY[0x1E4FBB5C8];
  *(void *)(v45 + 56) = MEMORY[0x1E4FBB550];
  *(void *)(v45 + 64) = v47;
  *(void *)(v45 + 32) = v46;
  id v48 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier);
  uint64_t v49 = sub_1B5DBAAF8();
  uint64_t v51 = v50;

  *(void *)(v45 + 96) = MEMORY[0x1E4FBB1A0];
  *(void *)(v45 + 104) = sub_1B5CFD41C();
  *(void *)(v45 + 72) = v49;
  *(void *)(v45 + 80) = v51;
  sub_1B5DBA838();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DA159C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B5DB9AB8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t result = MEMORY[0x1F4188790](v8);
  if (a1)
  {
    if (a2)
    {
      sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499C0);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v8);
      unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = a3;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      *(void *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      id v14 = a1;
      swift_retain();
      sub_1B5DBADE8();
      return swift_release();
    }
  }
  return result;
}

void sub_1B5DA1730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x1BA9AC660](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = sub_1B5D97358();

    uint64_t v8 = (void *)sub_1B5DB9A78();
    id v9 = objc_msgSend(v7, sel_cellForItemAtIndexPath_, v8);

    if (v9)
    {
      type metadata accessor for CarouselCollectionViewCell();
      if (swift_dynamicCastClass())
      {
        id v10 = sub_1B5CF826C();
        objc_msgSend(v10, sel_setImage_, a3);

        id v9 = v10;
      }
    }
  }
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x1BA9AC660](v4);
  if (v11)
  {
    unint64_t v12 = (void *)v11;
    id v13 = sub_1B5D96BEC();

    id v14 = (void *)sub_1B5DB9A78();
    id v15 = objc_msgSend(v13, sel_cellForItemAtIndexPath_, v14);

    if (v15)
    {
      type metadata accessor for ImageCollectionViewCell();
      uint64_t v16 = swift_dynamicCastClass();
      if (v16) {
        objc_msgSend(*(id *)(v16 + OBJC_IVAR____TtC17PromotedContentUI23ImageCollectionViewCell_imageView), sel_setImage_, a3);
      }
    }
  }
}

void _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0()
{
  id v1 = sub_1B5D97358();
  id v2 = objc_msgSend(v1, sel_indexPathsForVisibleItems);

  sub_1B5DB9AB8();
  uint64_t v3 = sub_1B5DBAC38();

  uint64_t v4 = sub_1B5D40CBC(v3);
  swift_bridgeObjectRelease();
  id v5 = sub_1B5D97358();
  id v6 = objc_msgSend(v5, sel_visibleCells);

  sub_1B5CEF5DC(0, (unint64_t *)&unk_1EB848E00);
  unint64_t v7 = sub_1B5DBAC38();

  id v8 = v0;
  unint64_t v9 = sub_1B5DA3584(v7);
  swift_bridgeObjectRelease();

  id v10 = v8;
  unint64_t v11 = sub_1B5DA3AE0(v9);
  swift_bridgeObjectRelease();

  uint64_t v12 = sub_1B5D40CBC(v11);
  swift_bridgeObjectRelease();
  if (*(void *)(v12 + 16) <= *(void *)(v4 + 16) >> 3) {
    sub_1B5D1C3FC(v12);
  }
  else {
    uint64_t v4 = sub_1B5D1CB28(v12, v4);
  }
  id v13 = v10;
  sub_1B5DA379C(v12, (uint64_t)v13);
  swift_bridgeObjectRelease();

  id v14 = (char *)v13;
  sub_1B5DA379C(v4, (uint64_t)v14);
  swift_bridgeObjectRelease();

  id v15 = objc_msgSend(*(id *)&v14[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_metricsHelper);
  uint64_t v16 = (void *)sub_1B5DBAC28();
  swift_bridgeObjectRelease();
  id v17 = (void *)sub_1B5DBAC28();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_updateElementsShownWithShown_partiallyShown_, v16, v17);
  swift_unknownObjectRelease();
}

uint64_t sub_1B5DA1B08()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView));

  sub_1B5D08894(*(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id CarouselAdView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CarouselAdView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B5DA1C24()
{
  unint64_t result = qword_1E9DA6198;
  if (!qword_1E9DA6198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9DA6198);
  }
  return result;
}

uint64_t sub_1B5DA1D64()
{
  return type metadata accessor for CarouselAdView();
}

uint64_t sub_1B5DA1D6C()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for CarouselAdView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CarouselAdView);
}

unsigned char *storeEnumTagSinglePayload for CarouselAdView.CarouselStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B5DA1EFCLL);
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

ValueMetadata *type metadata accessor for CarouselAdView.CarouselStyle()
{
  return &type metadata for CarouselAdView.CarouselStyle;
}

uint64_t sub_1B5DA1F34()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5DA1F6C()
{
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], *(id *)(v0 + 16));
}

uint64_t sub_1B5DA1F80()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B5DA2054(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1B5DB9868() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1B5CE6DD8;
  return sub_1B5D9A9EC(a1, v5, v6, v7, v8);
}

unint64_t sub_1B5DA2150()
{
  unint64_t result = qword_1E9DA61C0;
  if (!qword_1E9DA61C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA61C0);
  }
  return result;
}

uint64_t sub_1B5DA21A4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B5DA429C(&qword_1E9DA61E8, &qword_1EB848820);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1B5CECC98(&qword_1EB848820);
          uint64_t v12 = sub_1B5D27920(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB847EA0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B5DBB338();
  __break(1u);
  return result;
}

uint64_t sub_1B5DA23C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B5DA429C(&qword_1E9DA61E0, &qword_1E9DA61D8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1B5CECC98(&qword_1E9DA61D8);
          uint64_t v12 = sub_1B5D2798C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB848DF8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B5DBB338();
  __break(1u);
  return result;
}

uint64_t sub_1B5DA25E4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B5DA429C(&qword_1E9DA6208, &qword_1E9DA6200);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1B5CECC98(&qword_1E9DA6200);
          uint64_t v12 = sub_1B5D27920(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B5CEF5DC(0, (unint64_t *)&unk_1E9DA58F0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B5DBB338();
  __break(1u);
  return result;
}

uint64_t sub_1B5DA2804(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B5DA429C((unint64_t *)&unk_1EB847E80, &qword_1EB847E78);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1B5CECC98(&qword_1EB847E78);
          uint64_t v12 = sub_1B5D279F4(v16, i, a3);
          uint64_t v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B5CECC98(&qword_1EB8498D8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1B5DBB338();
  __break(1u);
  return result;
}

uint64_t sub_1B5DA2A18(uint64_t a1, char a2)
{
  unint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v5;
  uint64_t v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1B5DBB2E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = MEMORY[0x1BA9AB9A0](v7, v9, a2 & 1, v5);
  *uint64_t v2 = result;
  return result;
}

void *sub_1B5DA2AD8(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

void *sub_1B5DA2C6C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1B5DA2E00(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
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
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B5DA3000(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
LABEL_38:
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
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B5DA3200(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  unint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1B5DA32A0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  char v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1B5DA3380;
  return v5(v2 + 32);
}

uint64_t sub_1B5DA3380()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_1B5DA3494()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B5DA34CC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B5CE6DD8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9DA61C8 + dword_1E9DA61C8);
  return v6(a1, v4);
}

uint64_t sub_1B5DA3584(unint64_t a1)
{
  uint64_t v35 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1BA9AB990](v3, a1);
LABEL_9:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        id v7 = sub_1B5D97358();
        objc_msgSend(v5, sel_frame);
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        id v16 = sub_1B5D97358();
        objc_msgSend(v7, sel_convertRect_toCoordinateSpace_, v16, v9, v11, v13, v15);
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;

        id v25 = sub_1B5D97358();
        objc_msgSend(v25, sel_bounds);
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;

        v36.origin.x = v27;
        v36.origin.y = v29;
        v36.size.width = v31;
        v36.size.height = v33;
        v37.origin.x = v18;
        v37.origin.y = v20;
        v37.size.width = v22;
        v37.size.height = v24;
        if (CGRectContainsRect(v36, v37))
        {
          sub_1B5DBB268();
          sub_1B5DBB288();
          sub_1B5DBB298();
          sub_1B5DBB278();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v35;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_1B5DBB2E8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x1E4FBC860];
}

unint64_t sub_1B5DA379C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1B5DB9AB8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  id v39 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v38 = (char *)&v28 - v9;
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = MEMORY[0x1E4FBC860];
  if (!v10) {
    return v11;
  }
  uint64_t v28 = v2;
  uint64_t v40 = MEMORY[0x1E4FBC860];
  sub_1B5CF1C20(0, v10, 0);
  uint64_t v12 = sub_1B5DA3200(a1);
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t v37 = a1 + 56;
  uint64_t v17 = *(void *)(a2 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
  uint64_t v18 = type metadata accessor for CarouselElement();
  uint64_t v20 = *(void *)(v18 - 8);
  unint64_t result = v18 - 8;
  uint64_t v30 = v17 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  uint64_t v31 = v20;
  uint64_t v36 = v6 + 16;
  uint64_t v34 = v17;
  uint64_t v35 = v6 + 32;
  CGFloat v29 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v32 = a1;
  uint64_t v33 = v5;
  while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(v37 + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_17;
    }
    if (*(_DWORD *)(a1 + 36) != v14) {
      goto LABEL_18;
    }
    double v21 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v38, *(void *)(a1 + 48) + *(void *)(v6 + 72) * v12, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v39, v21, v5);
    unint64_t result = sub_1B5DB9AA8();
    if ((result & 0x8000000000000000) != 0) {
      goto LABEL_19;
    }
    if (result >= *(void *)(v34 + 16)) {
      goto LABEL_20;
    }
    uint64_t v22 = v6;
    char v23 = *(unsigned char *)(v30 + *(void *)(v31 + 72) * result);
    (*v29)(v39, v5);
    uint64_t v11 = v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1B5CF1C20(0, *(void *)(v11 + 16) + 1, 1);
      uint64_t v11 = v40;
    }
    unint64_t v25 = *(void *)(v11 + 16);
    unint64_t v24 = *(void *)(v11 + 24);
    if (v25 >= v24 >> 1)
    {
      sub_1B5CF1C20(v24 > 1, v25 + 1, 1);
      uint64_t v11 = v40;
    }
    *(void *)(v11 + 16) = v25 + 1;
    *(unsigned char *)(v11 + v25 + 32) = v23;
    a1 = v32;
    unint64_t result = sub_1B5D08BE0(v12, v14, v16 & 1, v32);
    uint64_t v12 = result;
    uint64_t v14 = v26;
    char v16 = v27 & 1;
    --v10;
    uint64_t v5 = v33;
    uint64_t v6 = v22;
    if (!v10)
    {
      sub_1B5CF8FB8(result, v26, v27 & 1);
      return v11;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_1B5DA3AE0(unint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_1B5CECC98(qword_1EB848910);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5DB9AB8();
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v31 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  char v23 = (char *)v22 - v10;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v11; uint64_t v11 = sub_1B5DBB2E8())
  {
    v22[1] = v2;
    unint64_t v30 = a1 & 0xC000000000000001;
    uint64_t v26 = (unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
    char v27 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
    unint64_t v25 = (id *)(v24 + 32);
    unint64_t v12 = MEMORY[0x1E4FBC860];
    uint64_t v13 = 4;
    uint64_t v28 = v11;
    CGFloat v29 = (id *)a1;
    while (1)
    {
      uint64_t v14 = v30 ? (id *)MEMORY[0x1BA9AB990](v13 - 4, a1) : (id *)*(id *)(a1 + 8 * v13);
      a1 = (unint64_t)v14;
      uint64_t v15 = v13 - 3;
      if (__OFADD__(v13 - 4, 1)) {
        break;
      }
      id v2 = sub_1B5D97358();
      id v16 = objc_msgSend(v2, sel_indexPathForCell_, a1);

      if (v16)
      {
        sub_1B5DB9A88();

        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = 1;
      }
      (*v27)(v6, v17, 1, v7);

      if ((*v26)(v6, 1, v7) == 1)
      {
        sub_1B5CEF924((uint64_t)v6, qword_1EB848910);
      }
      else
      {
        id v2 = *v25;
        uint64_t v18 = v23;
        ((void (*)(char *, char *, uint64_t))*v25)(v23, v6, v7);
        ((void (*)(char *, char *, uint64_t))v2)(v31, v18, v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v12 = sub_1B5D09EB0(0, *(void *)(v12 + 16) + 1, 1, v12);
        }
        unint64_t v20 = *(void *)(v12 + 16);
        unint64_t v19 = *(void *)(v12 + 24);
        if (v20 >= v19 >> 1) {
          unint64_t v12 = sub_1B5D09EB0(v19 > 1, v20 + 1, 1, v12);
        }
        *(void *)(v12 + 16) = v20 + 1;
        ((void (*)(unint64_t, char *, uint64_t))v2)(v12+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * v20, v31, v7);
      }
      a1 = (unint64_t)v29;
      ++v13;
      if (v15 == v28)
      {
        swift_bridgeObjectRelease();
        return v12;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1B5DA3E74()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B5DA3EAC()
{
  uint64_t v1 = sub_1B5DB9AB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B5DA3F78(void *a1, char a2)
{
  uint64_t v5 = *(void *)(sub_1B5DB9AB8() - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_1B5DA159C(a1, a2, v6, v7);
}

uint64_t sub_1B5DA3FFC()
{
  uint64_t v1 = sub_1B5DB9AB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

void sub_1B5DA40E4()
{
  uint64_t v1 = *(void *)(sub_1B5DB9AB8() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1B5DA1730(v3, v0 + v2, v4);
}

void sub_1B5DA4174()
{
}

void sub_1B5DA4194()
{
}

uint64_t sub_1B5DA41BC()
{
  return 8;
}

uint64_t sub_1B5DA41C8()
{
  return swift_release();
}

uint64_t sub_1B5DA41D0(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1B5DA41DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5D965BC(a1, a2, a3, &qword_1E9DA61F8) & 1;
}

uint64_t sub_1B5DA4200(uint64_t a1, uint64_t a2)
{
  return sub_1B5D96620(a1, a2, &qword_1E9DA61F8);
}

void *sub_1B5DA420C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_1B5DA4218()
{
}

void sub_1B5DA4238()
{
}

uint64_t sub_1B5DA4260()
{
  return 8;
}

uint64_t sub_1B5DA426C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5D965BC(a1, a2, a3, &qword_1E9DA61F0) & 1;
}

uint64_t sub_1B5DA4290(uint64_t a1, uint64_t a2)
{
  return sub_1B5D96620(a1, a2, &qword_1E9DA61F0);
}

uint64_t sub_1B5DA429C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1B5CEA834(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1B5DA42FC(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t v9 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView;
  *(void *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView] = 0;
  *(void *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_videoProgressMetricThresholds] = &unk_1F0EEA3C0;
  a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webViewDebugging] = 0;
  *(void *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_outstreamVisibleThreshold] = 50;
  *(void *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_nonOutstreamVisibleThreshold] = 95;
  uint64_t v10 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_mraidActionTypes;
  uint64_t v11 = a5;
  *(void *)&a5[v10] = sub_1B5D74CC4((uint64_t)&unk_1F0EEA3F8);
  uint64_t v12 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_videoProgressMetricStatus;
  *(void *)&v11[v12] = sub_1B5D48D58(MEMORY[0x1E4FBC860]);
  uint64_t v13 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_unfairLock;
  *(void *)&v11[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F47388]), sel_initWithOptions_, 1);
  *(void *)&v11[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator] = 0;
  v11[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_isAppActive] = 1;
  v11[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_needToUpdateVisibility] = 0;
  uint64_t v14 = *(void **)&a5[v9];
  *(void *)&a5[v9] = a2;
  id v15 = a2;

  swift_getObjectType();
  id v16 = a3;
  id v17 = v15;
  id v18 = a4;
  uint64_t v19 = swift_unknownObjectRetain();
  unint64_t v20 = sub_1B5D2CBC0(v19, a3, (uint64_t)v18, v11);
  swift_unknownObjectRelease();

  sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8498A0);
  *((unsigned char *)v20 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webViewDebugging) = sub_1B5D0E520() & 1;
  return v20;
}

void *sub_1B5DA44D4(void *a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t v8 = sub_1B5CECC98(qword_1EB8477F8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CarouselElement();
  uint64_t v51 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v52 = (uint64_t)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  id v15 = (char *)v44 - v14;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___headlineLabel] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserLabel] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___collectionView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton] = 1;
  id v16 = &a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize];
  *(void *)id v16 = 0;
  *((void *)v16 + 1) = 0;
  v16[16] = 1;
  id v17 = &a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth];
  *(void *)id v17 = 0;
  v17[8] = 1;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation] = 0;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_prefetchingIndexPaths] = MEMORY[0x1E4FBC868];
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_topMargin] = 0x4030000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_advertiserViewHorizontalMargin] = 0x4030000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_headlineHorizontalMargin] = 0x4030000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_logoImageViewHeight] = 0x4040000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_logoImageViewMaxWidth] = 0x4062C00000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_logoImageViewLeadingMargin] = 0x4030000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_collectionViewTopMargin] = 0x4030000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_actionButtonHeight] = 0x4038000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_actionButtonHorizontalMargin] = 0x4030000000000000;
  *(void *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_actionButtonMinimumWidth] = 0x4062C00000000000;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v19 = a4;
  unint64_t v20 = &off_1E6133000;
  if (!objc_msgSend(a1, sel_bestRepresentation)) {
    goto LABEL_6;
  }
  sub_1B5DBA458();
  if (!swift_dynamicCastClass())
  {
    swift_unknownObjectRelease();
LABEL_6:
    char v28 = 2;
    goto LABEL_7;
  }
  double v21 = a1;
  uint64_t v22 = ObjectType;
  char v23 = a2;
  uint64_t v24 = a3;
  unint64_t v25 = v19;
  uint64_t v26 = sub_1B5DBA3C8();
  swift_unknownObjectRelease();
  unint64_t v27 = v26 - 22200;
  uint64_t v19 = v25;
  a3 = v24;
  a2 = v23;
  uint64_t ObjectType = v22;
  a1 = v21;
  unint64_t v20 = &off_1E6133000;
  char v28 = 2;
  if (v27 < 3) {
    char v28 = 2 - v27;
  }
LABEL_7:
  uint64_t v49 = v19;
  v19[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style] = v28;
  id v29 = [a1 (SEL)v20[481]];
  if (!v29)
  {
LABEL_26:
    sub_1B5DBAD98();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v41 = (void *)sub_1B5DBB018();
    uint64_t v42 = MEMORY[0x1E4FBC860];
    sub_1B5DBA838();

    uint64_t v43 = v49;
    *(void *)&v49[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements] = v42;

    return sub_1B5D2CBC0((uint64_t)a1, a2, a3, v43);
  }
  id v30 = v29;
  sub_1B5DBA458();
  if (!swift_dynamicCastClass() || (unint64_t v31 = sub_1B5DBA428()) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_26;
  }
  unint64_t v32 = v31;
  uint64_t v48 = ObjectType;
  if (!(v31 >> 62))
  {
    uint64_t v33 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v33) {
      goto LABEL_12;
    }
LABEL_29:
    swift_unknownObjectRelease();
    unint64_t v37 = MEMORY[0x1E4FBC860];
LABEL_30:
    swift_bridgeObjectRelease_n();
    uint64_t v43 = v49;
    *(void *)&v49[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements] = v37;

    return sub_1B5D2CBC0((uint64_t)a1, a2, a3, v43);
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_1B5DBB2E8();
  uint64_t v33 = (uint64_t)result;
  if (!result) {
    goto LABEL_29;
  }
LABEL_12:
  v44[1] = v30;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  if (v33 >= 1)
  {
    uint64_t v35 = 0;
    uint64_t v36 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v51 + 48);
    unint64_t v37 = MEMORY[0x1E4FBC860];
    uint64_t v50 = v11;
    do
    {
      if ((v32 & 0xC000000000000001) != 0) {
        id v38 = (id)MEMORY[0x1BA9AB990](v35, v32);
      }
      else {
        id v38 = *(id *)(v32 + 8 * v35 + 32);
      }
      sub_1B5D2DAB4(v38, v10);
      if ((*v36)(v10, 1, v11) == 1)
      {
        sub_1B5DA5144((uint64_t)v10);
      }
      else
      {
        sub_1B5DA51A4((uint64_t)v10, (uint64_t)v15);
        sub_1B5DA51A4((uint64_t)v15, v52);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v37 = sub_1B5D09EE4(0, *(void *)(v37 + 16) + 1, 1, v37);
        }
        unint64_t v40 = *(void *)(v37 + 16);
        unint64_t v39 = *(void *)(v37 + 24);
        if (v40 >= v39 >> 1) {
          unint64_t v37 = sub_1B5D09EE4(v39 > 1, v40 + 1, 1, v37);
        }
        *(void *)(v37 + 16) = v40 + 1;
        sub_1B5DA51A4(v52, v37+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(void *)(v51 + 72) * v40);
        uint64_t v11 = v50;
      }
      ++v35;
    }
    while (v33 != v35);
    swift_unknownObjectRelease();
    a2 = v46;
    a3 = v47;
    a1 = v45;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

void *sub_1B5DA4AF4(void *a1, void *a2)
{
  swift_getObjectType();
  objc_msgSend(a1, sel_serverUnfilledReason);
  uint64_t v4 = sub_1B5DB9FF8();
  if (v4 == sub_1B5DB9FF8())
  {
    if (objc_msgSend(a1, sel_bestRepresentation))
    {
      sub_1B5DBA268();
      if (swift_dynamicCastClass()) {
        sub_1B5DBA238();
      }
      swift_unknownObjectRelease();
    }
    if (objc_msgSend(a1, sel_bestRepresentation)
      && (sub_1B5DBA458(), uint64_t v17 = swift_dynamicCastClass(), swift_unknownObjectRelease(), v17))
    {
      objc_msgSend(a1, sel_adType);
      uint64_t v18 = sub_1B5DB9F48();
      BOOL v19 = v18 != sub_1B5DB9F48();
    }
    else
    {
      BOOL v19 = 0;
    }
    if (objc_msgSend(a1, sel_bestRepresentation)
      && (sub_1B5DBA458(), uint64_t v20 = swift_dynamicCastClass(), swift_unknownObjectRelease(), v20))
    {
      objc_msgSend(a1, sel_adType);
      uint64_t v21 = sub_1B5DB9F48();
      BOOL v22 = v21 == sub_1B5DB9F48();
    }
    else
    {
      BOOL v22 = 0;
    }
    objc_msgSend(a1, sel_serverUnfilledReason);
    uint64_t v23 = sub_1B5DB9FF8();
    if (v23 != sub_1B5DB9FF8()
      || (objc_msgSend(a1, sel_placeholder) & 1) != 0
      || (objc_msgSend(a1, sel_adType), uint64_t v24 = sub_1B5DB9F48(), v24 == sub_1B5DB9F48())
      || (uint64_t v25 = sub_1B5DB9F48(), v25 == sub_1B5DB9F48()))
    {
      int v26 = 0;
    }
    else
    {
      uint64_t v40 = sub_1B5DBA0D8();
      int v26 = v40 == sub_1B5DBA0D8() && !v19;
    }
    id v12 = objc_msgSend(self, sel_sharedApplication);
    if (v26)
    {
      id v27 = sub_1B5D67130(a1, (char)objc_msgSend(a1, sel_isOutstreamVideoAd));
      swift_unknownObjectRelease();
      char v28 = objc_allocWithZone((Class)type metadata accessor for WebAdView());
      id v29 = a2;
      uint64_t v30 = swift_unknownObjectRetain();
      id v16 = sub_1B5DA42FC(v30, v27, a2, v12, v28);
      swift_unknownObjectRelease();

      goto LABEL_37;
    }
    objc_msgSend(a1, sel_adType);
    uint64_t v31 = sub_1B5DB9F48();
    if (v31 == sub_1B5DB9F48())
    {
      unint64_t v32 = (char *)objc_allocWithZone((Class)type metadata accessor for NewsAdView());
      *(void *)&v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_newsAdView] = 0;
      v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_nativeArticleOnDisplay] = 0;
      uint64_t v33 = &v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_oldPercentageTimestamp];
      uint64_t v34 = sub_1B5DBA9E8();
      uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
      v35(v33, 1, 1, v34);
      v35(&v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_newPercentageTimestamp], 1, 1, v34);
LABEL_36:
      id v43 = a2;
      uint64_t v44 = swift_unknownObjectRetain();
      id v16 = sub_1B5D2CBC0(v44, a2, (uint64_t)v12, v32);
      swift_unknownObjectRelease();
      id v12 = v43;
      goto LABEL_37;
    }
    uint64_t v36 = sub_1B5DBA0D8();
    if (v36 != sub_1B5DBA0D8())
    {
      unint64_t v32 = (char *)objc_allocWithZone((Class)type metadata accessor for AppAdView());
      *(void *)&v32[OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___appView] = 0;
      *(void *)&v32[OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___topBorder] = 0;
      *(void *)&v32[OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___bottomBorder] = 0;
      goto LABEL_36;
    }
    if (v19)
    {
      unint64_t v37 = (char *)objc_allocWithZone((Class)type metadata accessor for CarouselAdView());
      id v38 = a2;
      unint64_t v39 = (void *)swift_unknownObjectRetain();
      id v16 = sub_1B5DA44D4(v39, a2, (uint64_t)v12, v37);
      swift_unknownObjectRelease();
      id v12 = v38;
      goto LABEL_37;
    }
    if (!v22)
    {
      unint64_t v32 = (char *)objc_allocWithZone((Class)type metadata accessor for PromotedContentView());
      goto LABEL_36;
    }
    uint64_t v41 = (char *)objc_allocWithZone((Class)type metadata accessor for SponsorshipAdView());
    uint64_t v42 = (void *)swift_unknownObjectRetain();
    id v15 = sub_1B5D35058(v42, v12, v41);
  }
  else
  {
    sub_1B5DBAD88();
    sub_1B5CEF5DC(0, (unint64_t *)&qword_1EB8499D0);
    uint64_t v5 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B5DBDA20;
    id v7 = objc_msgSend(a1, sel_identifier);
    uint64_t v8 = sub_1B5DBAAF8();
    uint64_t v10 = v9;

    *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v6 + 64) = sub_1B5CFD41C();
    *(void *)(v6 + 32) = v8;
    *(void *)(v6 + 40) = v10;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    uint64_t v11 = self;
    id v12 = a2;
    swift_unknownObjectRetain();
    id v13 = objc_msgSend(v11, sel_sharedApplication);
    uint64_t v14 = (char *)objc_allocWithZone((Class)type metadata accessor for PromotedContentView());
    id v15 = sub_1B5D2CBC0((uint64_t)a1, a2, (uint64_t)v13, v14);
  }
  id v16 = v15;
  swift_unknownObjectRelease();
LABEL_37:

  return v16;
}

uint64_t sub_1B5DA5144(uint64_t a1)
{
  uint64_t v2 = sub_1B5CECC98(qword_1EB8477F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5DA51A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarouselElement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5DA5208()
{
  return qword_1B5DC0DB0[*v0];
}

BOOL static AppStoreInteractionType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppStoreInteractionType.hash(into:)()
{
  return sub_1B5DBB498();
}

uint64_t AppStoreInteractionType.hashValue.getter()
{
  return sub_1B5DBB4B8();
}

unint64_t sub_1B5DA52A8()
{
  unint64_t result = qword_1E9DA6210;
  if (!qword_1E9DA6210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA6210);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppStoreInteractionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppStoreInteractionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x1B5DA5458);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppStoreInteractionType()
{
  return &type metadata for AppStoreInteractionType;
}

uint64_t sub_1B5DA5490(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarouselElement();
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v7 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v8 = *(void *)(v3 + 72);
    v23[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)MEMORY[0x1E4FBC860];
    do
    {
      sub_1B5CF9608(v7, (uint64_t)v5);
      uint64_t v11 = &v5[*(int *)(v2 + 32)];
      uint64_t v13 = *(void *)v11;
      uint64_t v12 = *((void *)v11 + 1);
      swift_bridgeObjectRetain();
      sub_1B5CF966C((uint64_t)v5);
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v9 = sub_1B5D09A1C(0, v9[2] + 1, 1, v9);
        }
        unint64_t v15 = v9[2];
        unint64_t v14 = v9[3];
        if (v15 >= v14 >> 1) {
          uint64_t v9 = sub_1B5D09A1C((void *)(v14 > 1), v15 + 1, 1, v9);
        }
        v9[2] = v15 + 1;
        uint64_t v10 = &v9[2 * v15];
        v10[4] = v13;
        v10[5] = v12;
      }
      v7 += v8;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    uint64_t v16 = v9[2];
    if (v16) {
      goto LABEL_11;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v16 = *(void *)(MEMORY[0x1E4FBC860] + 16);
  if (!v16) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v17 = v9[4];
  uint64_t v18 = v16 - 1;
  if (v16 == 1)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    BOOL v19 = v9 + 7;
    do
    {
      uint64_t v20 = *(v19 - 1);
      swift_bridgeObjectRetain();
      v19 += 2;
      uint64_t v21 = sub_1B5DBAB98();
      if (sub_1B5DBAB98() < v21) {
        uint64_t v17 = v20;
      }
      swift_bridgeObjectRelease();
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1B5DA56F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = sub_1B5DB9748();
  uint64_t v4 = *(void (***)(char *, uint64_t))(v81 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v81);
  double v80 = (char *)v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v79 = (char *)v73 - v7;
  uint64_t v91 = type metadata accessor for CarouselElement();
  uint64_t v8 = *(void *)(v91 - 8);
  MEMORY[0x1F4188790](v91);
  uint64_t v10 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B5CECC98(&qword_1EB847728);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  id v82 = (char *)v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)v73 - v15;
  MEMORY[0x1F4188790](v14);
  id v78 = (char *)v73 - v17;
  uint64_t v18 = sub_1B5DB9778();
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v19);
  double v90 = (void (*)(char *, uint64_t, uint64_t))((char *)v73 - v23);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v86 = (char *)v73 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  id v29 = (char *)v73 - v28;
  uint64_t v30 = *(void *)(a1 + 16);
  uint64_t v87 = v26;
  uint64_t v88 = v27;
  id v83 = (char *)v73 - v28;
  v73[0] = a2;
  unint64_t v74 = v4;
  if (v30)
  {
    uint64_t v76 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))a1;
    uint64_t v77 = v21;
    uint64_t v31 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v32 = *(void *)(v8 + 72);
    uint64_t v33 = (void (**)(char *, char *, uint64_t))(v27 + 16);
    uint64_t v34 = (void (**)(char *, void, uint64_t, uint64_t))(v27 + 56);
    uint64_t v35 = (unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
    uint64_t v89 = (void (**)(char *))(v27 + 32);
    swift_bridgeObjectRetain();
    unint64_t v92 = MEMORY[0x1E4FBC860];
    id v84 = v34;
    id v85 = v35;
    do
    {
      sub_1B5CF9608(v31, (uint64_t)v10);
      (*v33)(v16, &v10[*(int *)(v91 + 28)], v18);
      (*v34)(v16, 0, 1, v18);
      sub_1B5CF966C((uint64_t)v10);
      if ((*v35)(v16, 1, v18) == 1)
      {
        sub_1B5DA5F40((uint64_t)v16);
      }
      else
      {
        uint64_t v36 = v33;
        uint64_t v37 = v32;
        id v38 = v10;
        unint64_t v39 = *v89;
        uint64_t v40 = v86;
        (*v89)(v86);
        ((void (*)(void, char *, uint64_t))v39)(v90, v40, v18);
        if (swift_isUniquelyReferenced_nonNull_native()) {
          unint64_t v41 = v92;
        }
        else {
          unint64_t v41 = sub_1B5D09B4C(0, *(void *)(v92 + 16) + 1, 1, v92);
        }
        uint64_t v10 = v38;
        uint64_t v32 = v37;
        uint64_t v33 = v36;
        uint64_t v34 = v84;
        unint64_t v43 = *(void *)(v41 + 16);
        unint64_t v42 = *(void *)(v41 + 24);
        if (v43 >= v42 >> 1) {
          unint64_t v41 = sub_1B5D09B4C(v42 > 1, v43 + 1, 1, v41);
        }
        *(void *)(v41 + 16) = v43 + 1;
        unint64_t v44 = (*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
        unint64_t v92 = v41;
        unint64_t v45 = v41 + v44 + *(void *)(v88 + 72) * v43;
        uint64_t v18 = v87;
        ((void (*)(unint64_t, void, uint64_t))v39)(v45, v90, v87);
        uint64_t v35 = v85;
      }
      v31 += v32;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
    a2 = v73[0];
    unint64_t v46 = v92;
    id v29 = v83;
    uint64_t v21 = v77;
    uint64_t v47 = (uint64_t)v78;
    uint64_t v27 = v88;
  }
  else
  {
    unint64_t v46 = MEMORY[0x1E4FBC860];
    uint64_t v47 = (uint64_t)v78;
  }
  uint64_t v48 = *(void (***)(char *))(v46 + 16);
  unint64_t v92 = v46;
  uint64_t v89 = v48;
  if (!v48)
  {
    uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
    v52(v47, 1, 1, v18);
    goto LABEL_18;
  }
  uint64_t v49 = (char *)(v46 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80)));
  uint64_t v50 = (void (**)(char *, void, uint64_t, uint64_t))(v27 + 16);
  id v85 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v86 = v49;
  uint64_t v51 = (void *)v27;
  ((void (*)(uint64_t))v85)(v47);
  uint64_t v52 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v51[7];
  v52(v47, 0, 1, v18);
  uint64_t v53 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v51[6];
  if (v53(v47, 1, v18) == 1)
  {
    a2 = v73[0];
LABEL_18:
    sub_1B5DA5F40(v47);
    v52(a2, 1, 1, v18);
    return swift_bridgeObjectRelease();
  }
  uint64_t v77 = (char *)v53;
  id v78 = (char *)(v51 + 6);
  id v84 = v50;
  uint64_t v54 = v47;
  id v55 = v51 + 4;
  uint64_t v56 = v18;
  id v57 = (void (*)(char *, uint64_t, uint64_t))v51[4];
  v57(v29, v54, v56);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v59 = (uint64_t)v82;
  if (v89 == (void (**)(char *))1)
  {
LABEL_20:
    uint64_t v60 = v87;
    v52(v59, 1, 1, v87);
LABEL_21:
    swift_bridgeObjectRelease();
    sub_1B5DA5F40(v59);
    uint64_t v61 = v73[0];
    v57((char *)v73[0], (uint64_t)v83, v60);
    v52(v61, 0, 1, v60);
    return swift_bridgeObjectRelease();
  }
  unint64_t v62 = result;
  ++v74;
  uint64_t v75 = v51 + 7;
  uint64_t v60 = v87;
  uint64_t v63 = (uint64_t (**)(char *, uint64_t))(v88 + 8);
  unint64_t v64 = 1;
  double v90 = v57;
  uint64_t v76 = v52;
  v73[1] = v55;
  while (v64 < *(void *)(v62 + 16))
  {
    ((void (*)(uint64_t, char *, uint64_t))v85)(v59, &v86[*(void *)(v88 + 72) * v64], v60);
    v52(v59, 0, 1, v60);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v77)(v59, 1, v60) == 1) {
      goto LABEL_21;
    }
    v57(v21, v59, v60);
    id v65 = v79;
    sub_1B5DB9728();
    uint64_t v91 = sub_1B5DB9738();
    id v66 = *v74;
    uint64_t v67 = v81;
    (*v74)(v65, v81);
    id v68 = v80;
    id v69 = v21;
    id v70 = v83;
    sub_1B5DB9728();
    uint64_t v71 = sub_1B5DB9738();
    v66(v68, v67);
    uint64_t v72 = *v63;
    if (v71 >= v91)
    {
      uint64_t result = v72(v69, v60);
    }
    else
    {
      v72(v70, v60);
      uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v90)(v70, v69, v60);
    }
    uint64_t v21 = v69;
    ++v64;
    id v57 = v90;
    uint64_t v59 = (uint64_t)v82;
    unint64_t v62 = v92;
    uint64_t v52 = v76;
    if (v89 == (void (**)(char *))v64) {
      goto LABEL_20;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5DA5F40(uint64_t a1)
{
  uint64_t v2 = sub_1B5CECC98(&qword_1EB847728);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5DA5FA0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 80, 7);
}

uint64_t sub_1B5DA5FE8(uint64_t *a1, uint64_t *a2)
{
  return sub_1B5DA5FF4(*a1, *a2);
}

uint64_t sub_1B5DA5FF4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 16) != *(unsigned __int8 *)(a2 + 16)
    || *(unsigned __int8 *)(a1 + 17) != *(unsigned __int8 *)(a2 + 17)
    || *(double *)(a1 + 24) != *(double *)(a2 + 24)
    || *(void *)(a1 + 32) != *(void *)(a2 + 32)
    || (*(void *)(a1 + 40) != *(void *)(a2 + 40) || *(void *)(a1 + 48) != *(void *)(a2 + 48))
    && (sub_1B5DBB3C8() & 1) == 0
    || (*(void *)(a1 + 56) != *(void *)(a2 + 56) || *(void *)(a1 + 64) != *(void *)(a2 + 64))
    && (sub_1B5DBB3C8() & 1) == 0)
  {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a2 + 72);
  return sub_1B5D729B4(v4, v5);
}

uint64_t sub_1B5DA60C8()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1B5DA60D8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1B5DA6124()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TrackedInstance();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TrackedInstance()
{
  return self;
}

id sub_1B5DA618C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, double a6)
{
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB17A8]), sel_initForTextStyle_, a3);
  swift_bridgeObjectRetain();
  uint64_t v12 = (void *)sub_1B5DBAAC8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_fontWithName_size_, v12, a6);

  if (v13)
  {
    if (a5) {
      id v14 = objc_msgSend(v11, sel_scaledFontForFont_, v13);
    }
    else {
      id v14 = objc_msgSend(v11, sel_scaledFontForFont_maximumPointSize_, v13, *(double *)&a4);
    }
    id v17 = v14;
  }
  else
  {
    sub_1B5DBAD98();
    sub_1B5CEE190();
    uint64_t v15 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1B5DBDA20;
    *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v16 + 64) = sub_1B5CFD41C();
    *(void *)(v16 + 32) = a1;
    *(void *)(v16 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return 0;
  }
  return v17;
}

uint64_t destroy for AppStoreTargetingMetadata()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppStoreTargetingMetadata(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppStoreTargetingMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppStoreTargetingMetadata(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppStoreTargetingMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStoreTargetingMetadata(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppStoreTargetingMetadata(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1B5DA65A0()
{
  id v0 = sub_1B5D0A6F4(0);
  return sub_1B5D0ACF8(v0);
}

void sub_1B5DA65CC()
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    sub_1B5D15630(0, 0);
  }
  else
  {
    uint64_t v0 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_1B5D15630(sub_1B5D0BBC8, v0);
    swift_release_n();
  }
}

uint64_t sub_1B5DA6680()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B5DA66B8()
{
  uint64_t v1 = v0;
  sub_1B5DBAD78();
  sub_1B5CEE190();
  unint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B5DBDA20;
  uint64_t v4 = OBJC_IVAR___APPCMetricsView_promotedContent;
  id v5 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCMetricsView_promotedContent), sel_identifier);
  uint64_t v6 = sub_1B5DBAAF8();
  uint64_t v8 = v7;

  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 64) = sub_1B5CFD41C();
  *(void *)(v3 + 32) = v6;
  *(void *)(v3 + 40) = v8;
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  *(unsigned char *)(v1 + OBJC_IVAR___APPCMetricsView_wasTapped) = 1;
  objc_msgSend(objc_msgSend(*(id *)(v1 + v4), sel_metricsHelper), sel_adMarkerInteracted);
  return swift_unknownObjectRelease();
}

uint64_t sub_1B5DA683C()
{
  return sub_1B5DBAF28();
}

unint64_t sub_1B5DA6AB8()
{
  unint64_t result = qword_1E9DA6228;
  if (!qword_1E9DA6228)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9DA6228);
  }
  return result;
}

uint64_t sub_1B5DA6AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1B5DBB488();
    sub_1B5DBAB88();
    uint64_t v6 = sub_1B5DBB4B8();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1B5DBB3C8() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1B5DBB3C8() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_1B5DA6C30(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_1B5DBB488();
  sub_1B5DB9F68();
  sub_1B5DBB498();
  uint64_t v3 = sub_1B5DBB4B8();
  uint64_t v4 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v5 = v3 & ~v4;
  uint64_t v6 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
    return 0;
  }
  uint64_t v7 = sub_1B5DB9F68();
  if (v7 == sub_1B5DB9F68()) {
    return 1;
  }
  uint64_t v9 = ~v4;
  unint64_t v10 = (v5 + 1) & v9;
  if (((*(void *)(v6 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v11 = sub_1B5DB9F68();
    BOOL v12 = v11 == sub_1B5DB9F68();
    uint64_t result = v12;
    if (v12) {
      break;
    }
    unint64_t v10 = (v10 + 1) & v9;
  }
  while (((*(void *)(v6 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

void sub_1B5DA6D50()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator);
}

id WebAdView.__deallocating_deinit()
{
  uint64_t v1 = v0;
  sub_1B5DBAD88();
  sub_1B5CEE190();
  unint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B5DBDCA0;
  id v4 = objc_msgSend(*(id *)&v1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_journeyIdentifier);
  uint64_t v5 = sub_1B5DBAAF8();
  uint64_t v7 = v6;

  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v9 = sub_1B5CFD41C();
  *(void *)(v3 + 64) = v9;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v7;
  id v10 = objc_msgSend(v1, sel_description);
  uint64_t v11 = sub_1B5DBAAF8();
  uint64_t v13 = v12;

  *(void *)(v3 + 96) = v8;
  *(void *)(v3 + 104) = v9;
  *(void *)(v3 + 72) = v11;
  *(void *)(v3 + 80) = v13;
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (v14)
  {
    id v15 = v14;
    sub_1B5DAA198();
  }
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for WebAdView();
  return objc_msgSendSuper2(&v17, sel_dealloc);
}

uint64_t sub_1B5DA703C()
{
  uint64_t v1 = v0;
  sub_1B5DBAD88();
  sub_1B5CEE190();
  unint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B5DBDCA0;
  uint64_t v4 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  id v5 = objc_msgSend(*(id *)&v1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_journeyIdentifier);
  uint64_t v6 = sub_1B5DBAAF8();
  uint64_t v8 = v7;

  uint64_t v9 = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v10 = sub_1B5CFD41C();
  *(void *)(v3 + 64) = v10;
  *(void *)(v3 + 32) = v6;
  *(void *)(v3 + 40) = v8;
  id v11 = objc_msgSend(v1, sel_description);
  uint64_t v12 = sub_1B5DBAAF8();
  uint64_t v14 = v13;

  *(void *)(v3 + 96) = v9;
  *(void *)(v3 + 104) = v10;
  *(void *)(v3 + 72) = v12;
  *(void *)(v3 + 80) = v14;
  sub_1B5DBA838();

  swift_bridgeObjectRelease();
  uint64_t v15 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView;
  uint64_t v16 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (v16)
  {
    id v17 = v16;
    sub_1B5DAA198();

    uint64_t v18 = *(void **)&v1[v15];
    if (v18)
    {
      objc_msgSend(v18, sel_removeFromSuperview);
      uint64_t v16 = *(void **)&v1[v15];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  *(void *)&v1[v15] = 0;

  objc_msgSend(objc_msgSend(*(id *)&v1[v4], sel_metricsHelper), sel_webAdRemoved);
  return swift_unknownObjectRelease();
}

void sub_1B5DA72F0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)type metadata accessor for WebAdView();
  v21.receiver = v4;
  v21.super_class = v9;
  objc_msgSendSuper2(&v21, sel_frame);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v20.receiver = v4;
  v20.super_class = v9;
  objc_msgSendSuper2(&v20, sel_setFrame_, a1, a2, a3, a4);
  objc_msgSend(v4, sel_frame);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  if (!CGRectEqualToRect(v22, v23))
  {
    uint64_t v18 = *(void **)&v4[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
    if (v18)
    {
      id v19 = v18;
      objc_msgSend(v4, sel_bounds);
      objc_msgSend(v19, sel_setFrame_);
    }
  }
}

void sub_1B5DA73FC()
{
  sub_1B5D2B3B8();
  sub_1B5DA7424();
}

void sub_1B5DA7424()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (v1)
  {
    unint64_t v2 = (objc_class *)type metadata accessor for WebAdNavigationCoordinator();
    id v3 = objc_allocWithZone(v2);
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    v13.receiver = v3;
    v13.super_class = v2;
    uint64_t v4 = v1;
    id v5 = objc_msgSendSuper2(&v13, sel_init);
    uint64_t v6 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator;
    uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator];
    *(void *)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator] = v5;

    objc_msgSend(v4, sel_setNavigationDelegate_, *(void *)&v0[v6], v13.receiver, v13.super_class);
    uint64_t v8 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
    uint64_t v9 = *(void **)&v4[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock];
    double v10 = v0;
    objc_msgSend(v9, sel_lock);
    *(void *)&v4[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = &off_1F0EEAF78;
    swift_unknownObjectWeakAssign();
    objc_msgSend(*(id *)&v4[v8], sel_unlock);

    objc_msgSend(v4, sel_setUIDelegate_, v10);
    id v11 = objc_msgSend(*(id *)&v10[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_campaignText);
    if (v11)
    {
      double v12 = v11;
      objc_msgSend(v4, sel_setRemoteInspectionNameOverride_, v11);
    }
    objc_msgSend(v10, sel_insertSubview_belowSubview_, v4, *(void *)&v10[OBJC_IVAR___APPCPromotedContentView_dimmerView]);
  }
}

uint64_t sub_1B5DA75B0()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (!v1) {
    goto LABEL_5;
  }
  unint64_t v2 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_promotedContent];
  id v3 = v1;
  if (!objc_msgSend(v2, sel_isOutstreamVideoAd))
  {

LABEL_5:
    sub_1B5CECC98(&qword_1EB847F40);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B5DBDCA0;
    *(void *)(v4 + 56) = type metadata accessor for PromotedContentView();
    *(void *)(v4 + 32) = v0;
    id v5 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
    *(void *)(v4 + 88) = type metadata accessor for PrivacyMarker();
    *(void *)(v4 + 64) = v5;
    goto LABEL_6;
  }
  sub_1B5CECC98(&qword_1EB847F40);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B5DBE1F0;
  *(void *)(v4 + 56) = type metadata accessor for WebAdView();
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 88) = type metadata accessor for PromotedContentWebView();
  *(void *)(v4 + 64) = v3;
  id v5 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  *(void *)(v4 + 120) = type metadata accessor for PrivacyMarker();
  *(void *)(v4 + 96) = v5;
LABEL_6:
  id v6 = v5;
  uint64_t v7 = v0;
  return v4;
}

uint64_t sub_1B5DA76E4(uint64_t a1, void *a2)
{
  if (!a1) {
    return 1;
  }
  uint64_t v3 = v2;
  uint64_t v5 = sub_1B5DBA728();
  id v6 = objc_msgSend(a2, sel_tapAction);
  if (!v6) {
    return 1;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_1B5DBA728();

  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_mraidActionTypes);
  if (sub_1B5DA6C30(v5, v9)) {
    char v10 = sub_1B5DA6C30(v8, v9);
  }
  else {
    char v10 = 0;
  }
  uint64_t v12 = sub_1B5DB9F68();
  uint64_t v13 = sub_1B5DB9F68();
  uint64_t result = 1;
  if ((v10 & 1) == 0 && v12 != v13)
  {
    sub_1B5DBAD98();
    sub_1B5CEE190();
    double v14 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1B5DBDCA0;
    uint64_t v16 = sub_1B5DB9F58();
    uint64_t v18 = v17;
    uint64_t v19 = MEMORY[0x1E4FBB1A0];
    *(void *)(v15 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v20 = sub_1B5CFD41C();
    *(void *)(v15 + 64) = v20;
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v18;
    uint64_t v21 = sub_1B5DB9F58();
    *(void *)(v15 + 96) = v19;
    *(void *)(v15 + 104) = v20;
    *(void *)(v15 + 72) = v21;
    *(void *)(v15 + 80) = v22;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_1B5DA78AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___APPCPromotedContentView_visiblePercentage);
  *(void *)(v1 + OBJC_IVAR___APPCPromotedContentView_visiblePercentage) = a1;
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_isOutstreamVideoAd);
  if (result)
  {
    if (v3 <= 49)
    {
      if (a1 < 50) {
        return result;
      }
      goto LABEL_7;
    }
    if (a1 > 49) {
      return result;
    }
  }
  else
  {
    if (v3 <= 94)
    {
      if (a1 < 95) {
        return result;
      }
LABEL_7:
      if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_isAppActive) & 1) == 0)
      {
        *(unsigned char *)(v1 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_needToUpdateVisibility) = 1;
        return result;
      }
      char v5 = 1;
      goto LABEL_13;
    }
    if (a1 >= 95) {
      return result;
    }
  }
  char v5 = 0;
LABEL_13:
  return sub_1B5D6C7D8(v5);
}

void sub_1B5DA798C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView);
  if (v2 && (uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy)) != 0)
  {
    swift_unknownObjectRetain();
    id v4 = sub_1B5D936A8();
    sub_1B5D68C60((uint64_t)v4);
    swift_bridgeObjectRelease();
    id v11 = (id)sub_1B5DBAA38();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_contentSizeDidChange_, v11);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1B5DBAD98();
    sub_1B5CEE190();
    char v5 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B5DBDA20;
    id v7 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier);
    uint64_t v8 = sub_1B5DBAAF8();
    uint64_t v10 = v9;

    *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v6 + 64) = sub_1B5CFD41C();
    *(void *)(v6 + 32) = v8;
    *(void *)(v6 + 40) = v10;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for WebAdView()
{
  uint64_t result = qword_1EB8488B0;
  if (!qword_1EB8488B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5DA7CC8()
{
  return type metadata accessor for WebAdView();
}

uint64_t sub_1B5DA7CD0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for WebAdView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WebAdView);
}

uint64_t sub_1B5DA7D6C()
{
  uint64_t result = sub_1B5D7452C();
  qword_1EB84B9B8 = result;
  unk_1EB84B9C0 = v1;
  return result;
}

uint64_t sub_1B5DA7D90()
{
  uint64_t result = sub_1B5DA7DB4();
  qword_1E9DA7968 = result;
  unk_1E9DA7970 = v1;
  return result;
}

uint64_t sub_1B5DA7DB4()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA7F14()
{
  uint64_t result = sub_1B5DA7F38();
  qword_1E9DA7978 = result;
  unk_1E9DA7980 = v1;
  return result;
}

uint64_t sub_1B5DA7F38()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA80A8()
{
  uint64_t result = sub_1B5DA80CC();
  qword_1E9DA7988 = result;
  unk_1E9DA7990 = v1;
  return result;
}

uint64_t sub_1B5DA80CC()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA8234()
{
  uint64_t result = sub_1B5DA8258();
  qword_1E9DA7998 = result;
  unk_1E9DA79A0 = v1;
  return result;
}

uint64_t sub_1B5DA8258()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA83D0()
{
  uint64_t result = sub_1B5DA83F4();
  qword_1E9DA79A8 = result;
  unk_1E9DA79B0 = v1;
  return result;
}

uint64_t sub_1B5DA83F4()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA855C()
{
  uint64_t result = sub_1B5DA8580();
  qword_1EB84B980 = result;
  *(void *)algn_1EB84B988 = v1;
  return result;
}

uint64_t sub_1B5DA8580()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA86E8()
{
  uint64_t result = sub_1B5DA870C();
  qword_1EB84B9C8 = result;
  unk_1EB84B9D0 = v1;
  return result;
}

uint64_t sub_1B5DA870C()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA885C()
{
  uint64_t result = sub_1B5DA8880();
  qword_1EB84B908 = result;
  unk_1EB84B910 = v1;
  return result;
}

uint64_t sub_1B5DA8880()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA89E0()
{
  uint64_t result = sub_1B5DA8A04();
  qword_1EB84B938 = result;
  unk_1EB84B940 = v1;
  return result;
}

uint64_t sub_1B5DA8A04()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA8B5C()
{
  uint64_t result = sub_1B5DA8B80();
  qword_1EB84B918 = result;
  unk_1EB84B920 = v1;
  return result;
}

uint64_t sub_1B5DA8B80()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA8CD8()
{
  uint64_t result = sub_1B5DA8CFC();
  qword_1EB84B928 = result;
  unk_1EB84B930 = v1;
  return result;
}

uint64_t sub_1B5DA8CFC()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

uint64_t sub_1B5DA8E74()
{
  uint64_t result = sub_1B5DA8E98();
  qword_1EB84B948 = result;
  unk_1EB84B950 = v1;
  return result;
}

uint64_t sub_1B5DA8E98()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    uint64_t result = sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();

    return v4;
  }
  return result;
}

void sub_1B5DA8FF8()
{
  type metadata accessor for PromotedContentUIModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v1 = self;
  id v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  id v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B5D220F8();
  LOBYTE(v1) = sub_1B5DBAF08();

  if (v1)
  {
    sub_1B5DBB2C8();
    __break(1u);
  }
  else
  {
    uint64_t v4 = sub_1B5DB9788();
    uint64_t v6 = v5;

    qword_1E9DA79B8 = v4;
    unk_1E9DA79C0 = v6;
  }
}

uint64_t sub_1B5DA916C(uint64_t a1)
{
  if ((unint64_t)(a1 - 100000) >= 7) {
    return 7;
  }
  else {
    return a1 - 100000;
  }
}

uint64_t sub_1B5DA9184(char a1)
{
  switch(a1)
  {
    case 1:
      if (qword_1E9DA4E40 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9DA7978;
      break;
    case 2:
      if (qword_1E9DA4E48 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9DA7988;
      break;
    case 3:
      if (qword_1E9DA4E50 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9DA7998;
      break;
    case 4:
      if (qword_1E9DA4E58 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9DA79A8;
      break;
    case 5:
      if (qword_1EB847BC0 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1EB84B980;
      break;
    case 6:
      if (qword_1E9DA4E68 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9DA79B8;
      break;
    default:
      if (qword_1E9DA4E38 != -1) {
        swift_once();
      }
      uint64_t v1 = &qword_1E9DA7968;
      break;
  }
  return *v1;
}

uint64_t sub_1B5DA937C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_1B5DB9678();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
LABEL_6:
    if (a3 == 7) {
      goto LABEL_11;
    }
    uint64_t v14 = sub_1B5DA9184(a3);
    if (!v15) {
      goto LABEL_11;
    }
    uint64_t v10 = v14;
    uint64_t v16 = HIBYTE(v15) & 0xF;
    if ((v15 & 0x2000000000000000) == 0) {
      uint64_t v16 = v14 & 0xFFFFFFFFFFFFLL;
    }
    if (!v16)
    {
LABEL_11:
      if (qword_1EB847BC0 != -1) {
        swift_once();
      }
      uint64_t v10 = qword_1EB84B980;
    }
    swift_bridgeObjectRetain();
    return v10;
  }
  v18[0] = a1;
  v18[1] = a2;
  swift_bridgeObjectRetain();
  sub_1B5DB9668();
  sub_1B5DA952C();
  uint64_t v10 = sub_1B5DBB078();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  uint64_t v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
  }
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  return v10;
}

unint64_t sub_1B5DA952C()
{
  unint64_t result = qword_1EB849558;
  if (!qword_1EB849558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB849558);
  }
  return result;
}

void sub_1B5DA9580(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    uint64_t v8 = (void *)sub_1B5DBAAC8();
    if (a4)
    {
LABEL_3:
      uint64_t v9 = sub_1B5DBAA38();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_6:
  id v10 = (id)v9;
  (*(void (**)(uint64_t, void *, void))(a5 + 16))(a5, v8, a3 & 1);
}

uint64_t sub_1B5DA9634()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock), sel_lock);
  uint64_t v3 = v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate;
  uint64_t v4 = MEMORY[0x1BA9AC660](v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate);
  swift_unknownObjectRelease();
  if (!v4)
  {
    sub_1B5DBAD98();
    sub_1B5CEE190();
    uint64_t v5 = (void *)sub_1B5DBB018();
    sub_1B5DBA838();
  }
  uint64_t v6 = MEMORY[0x1BA9AC660](v3);
  objc_msgSend(*(id *)(v1 + v2), sel_unlock);
  return v6;
}

uint64_t sub_1B5DA985C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_frame);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  uint64_t result = CGRectEqualToRect(v22, v23);
  if ((result & 1) == 0)
  {
    sub_1B5DBAD88();
    sub_1B5CEE190();
    unint64_t v11 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1B5DBDCA0;
    id v13 = objc_msgSend(v5, sel_description);
    uint64_t v14 = sub_1B5DBAAF8();
    uint64_t v16 = v15;

    uint64_t v17 = MEMORY[0x1E4FBB1A0];
    *(void *)(v12 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v18 = sub_1B5CFD41C();
    *(void *)(v12 + 64) = v18;
    *(void *)(v12 + 32) = v14;
    *(void *)(v12 + 40) = v16;
    objc_msgSend(v5, sel_frame);
    uint64_t v19 = sub_1B5DBAEB8();
    *(void *)(v12 + 96) = v17;
    *(void *)(v12 + 104) = v18;
    *(void *)(v12 + 72) = v19;
    *(void *)(v12 + 80) = v20;
    sub_1B5DBA838();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B5DA9A20()
{
  uint64_t v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for PromotedContentWebView();
  objc_msgSendSuper2(&v18, sel_didMoveToSuperview);
  sub_1B5DBAD88();
  sub_1B5CEE190();
  uint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B5DBDCA0;
  id v4 = objc_msgSend(v1, sel_description);
  uint64_t v5 = sub_1B5DBAAF8();
  uint64_t v7 = v6;

  uint64_t v8 = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v9 = sub_1B5CFD41C();
  *(void *)(v3 + 64) = v9;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v7;
  id v10 = objc_msgSend(v1, sel_superview);
  if (!v10)
  {
    uint64_t v16 = (uint64_t *)(v3 + 72);
    *(void *)(v3 + 96) = v8;
    *(void *)(v3 + 104) = v9;
    goto LABEL_5;
  }
  unint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_debugDescription);

  uint64_t v13 = sub_1B5DBAAF8();
  unint64_t v15 = v14;

  uint64_t v16 = (uint64_t *)(v3 + 72);
  *(void *)(v3 + 96) = v8;
  *(void *)(v3 + 104) = v9;
  if (!v15)
  {
LABEL_5:
    *uint64_t v16 = 1701736270;
    unint64_t v15 = 0xE400000000000000;
    goto LABEL_6;
  }
  *uint64_t v16 = v13;
LABEL_6:
  *(void *)(v3 + 80) = v15;
  sub_1B5DBA838();

  return swift_bridgeObjectRelease();
}

id sub_1B5DA9C34(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8)
{
  *(void *)&v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = 0;
  uint64_t v17 = &v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface];
  *uint64_t v17 = 0u;
  v17[1] = 0u;
  v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_browserContextControllerDidLoad] = 0;
  uint64_t v18 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  id v19 = objc_allocWithZone(MEMORY[0x1E4F47388]);
  uint64_t v20 = v8;
  *(void *)&v8[v18] = objc_msgSend(v19, sel_initWithOptions_, 1);
  uint64_t v21 = &v20[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_adIdentifier];
  *(void *)uint64_t v21 = a1;
  *((void *)v21 + 1) = a2;
  *(void *)&v20[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_maxRequestCount] = a3;

  v32.receiver = v20;
  v32.super_class = (Class)type metadata accessor for PromotedContentWebView();
  id v22 = objc_msgSendSuper2(&v32, sel_initWithFrame_configuration_, a4, a5, a6, a7, a8);
  CGRect v23 = self;
  id v24 = v22;
  id v25 = objc_msgSend(v23, sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v25);

  id v26 = v24;
  uint64_t v27 = (void *)sub_1B5DBAAC8();
  objc_msgSend(v26, sel_setAccessibilityIdentifier_, v27);

  objc_msgSend(v26, sel_setAccessibilityIgnoresInvertColors_, 1);
  id v28 = objc_msgSend(v26, sel_scrollView);
  objc_msgSend(v28, sel_setScrollEnabled_, 0);

  id v29 = objc_msgSend(v26, sel_scrollView);
  objc_msgSend(v29, sel_setContentInsetAdjustmentBehavior_, 2);

  id v30 = v26;
  objc_msgSend(v30, sel_setAllowsLinkPreview_, 0);

  return v30;
}

id sub_1B5DA9EC4()
{
  uint64_t v1 = v0;
  sub_1B5DBAD88();
  sub_1B5CEE190();
  uint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5DBA838();

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for PromotedContentWebView();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_1B5DAA0D8()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface;
  swift_beginAccess();
  sub_1B5DAB204(v1, (uint64_t)v5);
  uint64_t v2 = v6;
  uint64_t result = sub_1B5D2FA70((uint64_t)v5);
  if (!v2)
  {
    id v4 = objc_msgSend(v0, sel_registerExportedObjectInterface_, v0);
    sub_1B5DBB088();
    swift_unknownObjectRelease();
    swift_beginAccess();
    sub_1B5DAB26C((uint64_t)v5, v1);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1B5DAA198()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface;
  swift_beginAccess();
  sub_1B5DAB204(v1, (uint64_t)&v3);
  if (!*((void *)&v4 + 1)) {
    return sub_1B5D2FA70((uint64_t)&v3);
  }
  sub_1B5CE93C4(&v3, &v5);
  sub_1B5D0D21C(&v5, v6);
  objc_msgSend(v0, sel_unregisterExportedObject_interface_, v0, sub_1B5DBB3B8());
  swift_unknownObjectRelease();
  long long v3 = 0u;
  long long v4 = 0u;
  swift_beginAccess();
  sub_1B5DAB26C((uint64_t)&v3, v1);
  swift_endAccess();
  return sub_1B5CEE588((uint64_t)&v5);
}

uint64_t type metadata accessor for PromotedContentWebView()
{
  return self;
}

uint64_t sub_1B5DAA2E0()
{
  uint64_t v1 = v0;
  sub_1B5DBAD78();
  sub_1B5CEE190();
  uint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5DBA838();

  id v3 = objc_msgSend(v1, sel_remoteObjectProxyWithInterface);
  uint64_t v4 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy;
  *(void *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = v3;
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v6 = *(void **)&v1[v4];
  if (v6)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1B5DBAAC8();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)sub_1B5DBAD58();
    objc_msgSend(v6, sel_setWebViewProcessAdIdentifier_maxRequestCount_, v7, v8);

    uint64_t result = swift_unknownObjectRelease();
  }
  v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_browserContextControllerDidLoad] = 1;
  return result;
}

uint64_t sub_1B5DAA48C()
{
  uint64_t v1 = v0;
  sub_1B5DBAD78();
  sub_1B5CEE190();
  uint64_t v2 = (void *)sub_1B5DBB018();
  sub_1B5DBA838();

  uint64_t v3 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock], sel_lock);
  *(void *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = 0;
  swift_unknownObjectWeakAssign();
  objc_msgSend(*(id *)&v1[v3], sel_unlock);
  *(void *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = 0;
  swift_unknownObjectRelease();
  uint64_t v4 = (uint64_t)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface];
  swift_beginAccess();
  sub_1B5DAB204(v4, (uint64_t)&v6);
  if (!v7) {
    return sub_1B5D2FA70((uint64_t)&v6);
  }
  sub_1B5CE93C4(&v6, &v8);
  sub_1B5D0D21C(&v8, v9);
  objc_msgSend(v1, sel_unregisterExportedObject_interface_, v1, sub_1B5DBB3B8());
  swift_unknownObjectRelease();
  return sub_1B5CEE588((uint64_t)&v8);
}

uint64_t sub_1B5DAABB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_1B5DBAAF8();
    uint64_t v9 = v8;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  uint64_t v9 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v4 = sub_1B5DBAA58();
LABEL_4:
  swift_retain();
  v6(v7, v9, a3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1B5DAAE24(void *a1, uint64_t a2, SEL *a3)
{
  id v6 = a1;
  uint64_t v4 = (void *)sub_1B5DA9634();
  if (v4)
  {
    long long v5 = v4;
    if (objc_msgSend(v4, sel_respondsToSelector_, *a3)) {
      [v5 *a3];
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_1B5DAAFF4(void *a1, float a2, uint64_t a3, SEL *a4)
{
  id v9 = a1;
  id v6 = (void *)sub_1B5DA9634();
  if (v6)
  {
    uint64_t v7 = v6;
    if (objc_msgSend(v6, sel_respondsToSelector_, *a4))
    {
      *(float *)&double v8 = a2;
      objc_msgSend(v7, *a4, v8);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_1B5DAB0FC(void *a1, float a2, float a3, uint64_t a4, SEL *a5)
{
  id v12 = a1;
  double v8 = (void *)sub_1B5DA9634();
  if (v8)
  {
    id v9 = v8;
    if (objc_msgSend(v8, sel_respondsToSelector_, *a5))
    {
      *(float *)&double v10 = a2;
      *(float *)&double v11 = a3;
      objc_msgSend(v9, *a5, v10, v11);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

uint64_t sub_1B5DAB1C4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5DAB1FC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1B5DA9580(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_1B5DAB204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5CECC98((uint64_t *)&unk_1EB849570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5DAB26C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5CECC98((uint64_t *)&unk_1EB849570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1B5DAB2D4()
{
  *(void *)&v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface];
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_browserContextControllerDidLoad] = 0;
  uint64_t v2 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F47388]), sel_initWithOptions_, 1);

  sub_1B5DBB2C8();
  __break(1u);
}

uint64_t sub_1B5DAB3A4(unsigned __int8 *a1, char *a2)
{
  return sub_1B5D2443C(*a1, *a2);
}

uint64_t sub_1B5DAB3B0()
{
  return sub_1B5D24724();
}

uint64_t sub_1B5DAB3B8()
{
  sub_1B5DBAB88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DAB4A0()
{
  return sub_1B5D24824();
}

uint64_t sub_1B5DAB4A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B5DAC8DC();
  *a1 = result;
  return result;
}

void sub_1B5DAB4D8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x747865746E6F63;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000074;
      uint64_t v3 = 0x6E65746E6F437061;
      goto LABEL_3;
    case 2:
      *a1 = 0x7472617473;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 0x6F724665726F7473;
      a1[1] = 0xEA0000000000746ELL;
      break;
    case 4:
      *a1 = 0xD000000000000010;
      a1[1] = 0x80000001B5DC1820;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_1B5DAB59C()
{
  unint64_t result = 0x747865746E6F63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6E65746E6F437061;
      break;
    case 2:
      unint64_t result = 0x7472617473;
      break;
    case 3:
      unint64_t result = 0x6F724665726F7473;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B5DAB650@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B5DAC8DC();
  *a1 = result;
  return result;
}

void sub_1B5DAB678(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B5DAB684(uint64_t a1)
{
  unint64_t v2 = sub_1B5DAC410();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B5DAB6C0(uint64_t a1)
{
  unint64_t v2 = sub_1B5DAC410();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1B5DAB6FC(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1B5DB99A8();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  MEMORY[0x1F4188790](v3);
  long long v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B5CECC98(&qword_1EB846B58);
  uint64_t v43 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  sub_1B5D0D21C(a1, v9);
  sub_1B5DAC410();
  double v10 = v1;
  double v11 = v45;
  sub_1B5DBB4D8();
  if (!v11)
  {
    unint64_t v45 = v5;
    LOBYTE(v50) = 0;
    uint64_t v9 = sub_1B5DAC464();
    sub_1B5DBB378();
    uint64_t v40 = v8;
    uint64_t v12 = v6;
    uint64_t v14 = v46;
    unint64_t v13 = v47;
    uint64_t v15 = sub_1B5CEF5DC(0, &qword_1EB846B40);
    sub_1B5CEF5DC(0, &qword_1EB846B48);
    uint64_t v16 = sub_1B5DBADB8();
    uint64_t v17 = v43;
    uint64_t v37 = v15;
    uint64_t v38 = v14;
    unint64_t v39 = v13;
    if (v16)
    {
      id v19 = (void *)v16;
      LOBYTE(v50) = 1;
      uint64_t v20 = v12;
      uint64_t v21 = v40;
      sub_1B5DBB368();
      unint64_t v22 = v47;
      if (v47 >> 60 != 15)
      {
        uint64_t v36 = v46;
        sub_1B5CECC98(&qword_1EB8475E0);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_1B5DBDCA0;
        *(void *)(v23 + 32) = sub_1B5CEF5DC(0, &qword_1EB8475B0);
        *(void *)(v23 + 40) = sub_1B5CEF5DC(0, &qword_1EB848230);
        unint64_t v35 = v22;
        sub_1B5DBADC8();
        unint64_t v25 = v35;
        uint64_t v24 = v36;
        swift_bridgeObjectRelease();
        if (v48)
        {
          sub_1B5CECC98(&qword_1EB846B38);
          int v26 = swift_dynamicCast();
          uint64_t v27 = v24;
          if (v26)
          {
            uint64_t v28 = v50;
            sub_1B5D92CDC(v27, v25);
LABEL_15:
            *(void *)&v10[OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_apContentData] = v28;
            id v29 = objc_allocWithZone((Class)sub_1B5DBA6F8());
            id v30 = v19;
            swift_bridgeObjectRetain();
            uint64_t v31 = sub_1B5DBA658();
            uint64_t v37 = OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_context;
            *(void *)&v10[OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_context] = v31;
            LOBYTE(v46) = 2;
            sub_1B5DAC560(&qword_1EB8468D8);
            objc_super v32 = v45;
            uint64_t v33 = v42;
            sub_1B5DBB378();
            (*(void (**)(char *, uint64_t))(v43 + 8))(v21, v20);
            sub_1B5D0F2B8(v38, v39);

            (*(void (**)(char *, char *, uint64_t))(v41 + 32))(&v10[OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_start], v32, v33);
            v49.receiver = v10;
            v49.super_class = ObjectType;
            uint64_t v9 = (uint64_t)objc_msgSendSuper2(&v49, sel_init);
            sub_1B5CEE588((uint64_t)a1);
            return v9;
          }
        }
        else
        {
          sub_1B5D2FA70((uint64_t)&v46);
          uint64_t v27 = v24;
        }
        sub_1B5D92CDC(v27, v25);
      }
      uint64_t v28 = MEMORY[0x1E4FBC860];
      goto LABEL_15;
    }
    sub_1B5DAC4B8();
    swift_allocError();
    swift_willThrow();
    sub_1B5D0F2B8(v38, v39);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v40, v12);
  }
  sub_1B5CEE588((uint64_t)a1);

  swift_deallocPartialClassInstance();
  return v9;
}

uint64_t sub_1B5DABD5C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1B5CECC98(&qword_1EB846B60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5D0D21C(a1, a1[3]);
  sub_1B5DAC410();
  sub_1B5DBB4E8();
  uint64_t v39 = v3;
  sub_1B5DBA6F8();
  if (swift_dynamicCastClass()) {
    uint64_t v9 = (void *)sub_1B5DBA6D8();
  }
  else {
    uint64_t v9 = 0;
  }
  double v10 = self;
  id v41 = v9;
  sub_1B5CECC98(&qword_1EB846B50);
  uint64_t v11 = sub_1B5DBB038();
  id v41 = 0;
  id v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 1, &v41);
  swift_unknownObjectRelease();
  id v13 = v41;
  if (v12)
  {
    uint64_t v38 = v6;
    uint64_t v14 = (void *)sub_1B5DB9898();
    unint64_t v16 = v15;

    id v41 = v14;
    unint64_t v42 = v16;
    char v40 = 0;
    sub_1B5DAC50C();
    sub_1B5DBB388();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v5);

      uint64_t v17 = (uint64_t)v14;
      unint64_t v18 = v16;
      return sub_1B5D0F2B8(v17, v18);
    }
    uint64_t v34 = v5;
    uint64_t v35 = (uint64_t)v14;
    unint64_t v36 = v16;
    id v37 = v9;
    sub_1B5CEF5DC(0, &qword_1EB848230);
    uint64_t v21 = (void *)sub_1B5DBAC28();
    id v41 = 0;
    id v22 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v21, 1, &v41);

    id v23 = v41;
    if (v22)
    {
      uint64_t v24 = (void *)sub_1B5DB9898();
      unint64_t v26 = v25;

      id v41 = v24;
      unint64_t v42 = v26;
      unint64_t v33 = v26;
      char v40 = 1;
      uint64_t v27 = v34;
      sub_1B5DBB388();
      unint64_t v29 = v36;
      id v28 = v37;
      uint64_t v30 = v38;
      LOBYTE(v41) = 2;
      sub_1B5DB99A8();
      sub_1B5DAC560(&qword_1EB8468D0);
      sub_1B5DBB388();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v27);

      sub_1B5D0F2B8((uint64_t)v24, v33);
      uint64_t v17 = v35;
      unint64_t v18 = v29;
      return sub_1B5D0F2B8(v17, v18);
    }
    uint64_t v31 = v23;
    sub_1B5DB97C8();

    swift_willThrow();
    sub_1B5D0F2B8(v35, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v8, v34);
  }
  else
  {
    uint64_t v20 = v13;
    sub_1B5DB97C8();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_1B5DAC2A0()
{
  return type metadata accessor for AppStoreSession();
}

uint64_t type metadata accessor for AppStoreSession()
{
  uint64_t result = qword_1EB8465B8;
  if (!qword_1EB8465B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5DAC2F4()
{
  uint64_t result = sub_1B5DB99A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B5DAC39C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  uint64_t result = sub_1B5DAB6FC(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1B5DAC3EC(void *a1)
{
  return sub_1B5DABD5C(a1);
}

unint64_t sub_1B5DAC410()
{
  unint64_t result = qword_1EB8468F0;
  if (!qword_1EB8468F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8468F0);
  }
  return result;
}

unint64_t sub_1B5DAC464()
{
  unint64_t result = qword_1EB8468C8;
  if (!qword_1EB8468C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8468C8);
  }
  return result;
}

unint64_t sub_1B5DAC4B8()
{
  unint64_t result = qword_1E9DA63A0;
  if (!qword_1E9DA63A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA63A0);
  }
  return result;
}

unint64_t sub_1B5DAC50C()
{
  unint64_t result = qword_1EB8468C0;
  if (!qword_1EB8468C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8468C0);
  }
  return result;
}

uint64_t sub_1B5DAC560(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1B5DB99A8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppStoreSession.SessionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B5DAC640);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppStoreSession.SessionError()
{
  return &type metadata for AppStoreSession.SessionError;
}

unsigned char *storeEnumTagSinglePayload for AppStoreSession.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B5DAC744);
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

ValueMetadata *type metadata accessor for AppStoreSession.CodingKeys()
{
  return &type metadata for AppStoreSession.CodingKeys;
}

unint64_t sub_1B5DAC780()
{
  unint64_t result = qword_1E9DA63A8;
  if (!qword_1E9DA63A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA63A8);
  }
  return result;
}

unint64_t sub_1B5DAC7D8()
{
  unint64_t result = qword_1E9DA63B0;
  if (!qword_1E9DA63B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA63B0);
  }
  return result;
}

unint64_t sub_1B5DAC830()
{
  unint64_t result = qword_1EB846900;
  if (!qword_1EB846900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB846900);
  }
  return result;
}

unint64_t sub_1B5DAC888()
{
  unint64_t result = qword_1EB8468F8;
  if (!qword_1EB8468F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8468F8);
  }
  return result;
}

uint64_t sub_1B5DAC8DC()
{
  unint64_t v0 = sub_1B5DBB358();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_1B5DAC928(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DAC988()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5DAC9D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DACA34()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5DACA80(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 64) = v3;
  *(void *)(v4 + 72) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DACAE0()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5DACB2C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 80) = v3;
  *(void *)(v4 + 88) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DACB8C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5DACBD8()
{
  if (*(void *)(v0 + 24)) {
    return sub_1B5DBA4F8();
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5DACC0C()
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = self;
  uint64_t v2 = *(void **)(v0 + 16);
  id v3 = objc_msgSend(v2, sel_transparencyDetailsDictionary);
  sub_1B5DBAA58();

  uint64_t v4 = (void *)sub_1B5DBAA38();
  swift_bridgeObjectRelease();
  v18[0] = 0;
  id v5 = objc_msgSend(v1, sel_dataWithJSONObject_options_error_, v4, 0, v18);

  id v6 = v18[0];
  if (v5)
  {
    uint64_t v7 = sub_1B5DB9898();
    unint64_t v9 = v8;

    uint64_t v10 = sub_1B5DB9888();
    sub_1B5D0F2B8(v7, v9);
  }
  else
  {
    uint64_t v11 = v6;
    id v12 = (void *)sub_1B5DB97C8();

    swift_willThrow();
    sub_1B5DBAD98();
    sub_1B5CEE190();
    id v13 = (void *)sub_1B5DBB018();
    sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B5DBDA20;
    id v15 = objc_msgSend(v2, sel_transparencyDetailsDictionary);
    uint64_t v16 = sub_1B5DBAA58();

    *(void *)(v14 + 56) = sub_1B5CECC98(&qword_1E9DA5E28);
    *(void *)(v14 + 64) = sub_1B5DAD44C();
    *(void *)(v14 + 32) = v16;
    sub_1B5DBA838();

    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

uint64_t sub_1B5DACEA0()
{
  if (*(void *)(v0 + 24)) {
    return sub_1B5DBA4D8() & 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5DACED4()
{
  return sub_1B5DACF04(MEMORY[0x1E4F93DD8]);
}

uint64_t sub_1B5DACEEC()
{
  return sub_1B5DACF04(MEMORY[0x1E4F93DD0]);
}

uint64_t sub_1B5DACF04(uint64_t (*a1)(void))
{
  if (*(void *)(v1 + 24)) {
    return a1();
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5DACF3C()
{
  if (*(void *)(v0 + 24)) {
    return sub_1B5DBA4E8();
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5DACF70(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 96) = v3;
  *(void *)(v4 + 104) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5DACFD0()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5DAD01C()
{
  return 0x203A64496D616441;
}

uint64_t sub_1B5DAD118@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 112);
  return result;
}

uint64_t sub_1B5DAD15C(char *a1)
{
  char v2 = *a1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 112) = v2;
  return result;
}

uint64_t (*sub_1B5DAD19C())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B5DAD1F0()
{
  if (*(void *)(v0 + 24)) {
    return sub_1B5DBA528();
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5DAD220()
{
  if (*(void *)(v0 + 24)) {
    return sub_1B5DBA558();
  }
  else {
    return 0;
  }
}

unint64_t sub_1B5DAD250()
{
  if (!*(void *)(v0 + 24)) {
    return 0;
  }
  unint64_t result = sub_1B5DBA4C8();
  if (result)
  {
    unint64_t v2 = result;
    sub_1B5CECC98(&qword_1EB8475D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B5DBDA20;
    sub_1B5DBB1B8();
    sub_1B5CECC98(&qword_1EB8475C8);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B5DBDA20;
    *(void *)(v4 + 32) = v2;
    *(void *)(inited + 96) = sub_1B5CECC98(&qword_1EB8475A8);
    *(void *)(inited + 72) = v4;
    return sub_1B5D460E4(inited);
  }
  return result;
}

uint64_t sub_1B5DAD330(void *a1)
{
  objc_msgSend(objc_msgSend(a1, sel_metricsHelper), sel_userReturnedFromInteractionWithIsVoiceOverEnabled_ignoreVisibilityState_, UIAccessibilityIsVoiceOverRunning(), 1);
  return swift_unknownObjectRelease();
}

uint64_t AppStoreAd.deinit()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t AppStoreAd.__deallocating_deinit()
{
  AppStoreAd.deinit();
  return MEMORY[0x1F4186488](v0, 139, 7);
}

uint64_t sub_1B5DAD428()
{
  return sub_1B5DAD01C();
}

unint64_t sub_1B5DAD44C()
{
  unint64_t result = qword_1E9DA63B8;
  if (!qword_1E9DA63B8)
  {
    sub_1B5CEA834(&qword_1E9DA5E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9DA63B8);
  }
  return result;
}

uint64_t sub_1B5DAD4A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  *a2 = *(void *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DAD4F8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *a2 = *(void *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DAD548@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 72);
  *a2 = *(void *)(v3 + 64);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DAD598@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 88);
  *a2 = *(void *)(v3 + 80);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DAD5E8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 104);
  *a2 = *(void *)(v3 + 96);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DAD638@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 112);
  return result;
}

uint64_t sub_1B5DAD680(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 112) = v2;
  return result;
}

uint64_t type metadata accessor for AppStoreAd()
{
  return self;
}

uint64_t method lookup function for AppStoreAd(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppStoreAd);
}

uint64_t dispatch thunk of AppStoreAd.adamId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AppStoreAd.metadata.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of AppStoreAd.clientRequestId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of AppStoreAd.toroId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of AppStoreAd.impressionId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AppStoreAd.privacyInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AppStoreAd.odmlSuccess.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AppStoreAd.experimentId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AppStoreAd.treatmentId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AppStoreAd.deploymentId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AppStoreAd.instanceId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AppStoreAd.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of AppStoreAd.unfilledReason.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AppStoreAd.unfilledReason.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AppStoreAd.unfilledReason.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AppStoreAd.slot.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AppStoreAd.positionInformation.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AppStoreAd.cppIds.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AppStoreAd.appMetadata.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t sub_1B5DADA4C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, int a7, uint64_t a8, uint64_t a9)
{
  int v47 = a7;
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v42 = a9;
  uint64_t v12 = sub_1B5DB99E8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  id v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *a6;
  *(void *)(a8 + 80) = 0;
  *(void *)(a8 + 88) = 0;
  sub_1B5DB99D8();
  uint64_t v17 = sub_1B5DB99B8();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  *(unsigned char *)(a8 + 112) = 3;
  *(void *)(a8 + 96) = v17;
  *(void *)(a8 + 104) = v19;
  *(void *)(a8 + 120) = 0;
  *(_WORD *)(a8 + 136) = 0;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  type metadata accessor for LeftAdDestinationTracker();
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 32) = 0;
  *(void *)(v21 + 16) = sub_1B5D4138C;
  *(void *)(v21 + 24) = v20;
  *(void *)(a8 + 128) = v21;
  *(void *)(a8 + 16) = a1;
  swift_unknownObjectRetain_n();
  sub_1B5CEF1C4();
  id v23 = v22;
  *(void *)(a8 + 24) = v22;
  if (v16 == 3)
  {
    if (objc_msgSend(a1, sel_serverUnfilledReason, v42) == (id)200) {
      LOBYTE(v16) = 3;
    }
    else {
      LOBYTE(v16) = 2;
    }
  }
  swift_beginAccess();
  *(unsigned char *)(a8 + 112) = v16;
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = sub_1B5DBA548();
    unint64_t v27 = v26;
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v27 = 0xE000000000000000;
  }
  char v28 = v47;
  *(void *)(a8 + 32) = v25;
  *(void *)(a8 + 40) = v27;
  unint64_t v29 = *(void **)(a8 + 24);
  if (!v29 || (id v30 = v29, v31 = sub_1B5DBA568(), v33 = v32, v30, !v33))
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = 0;
    unint64_t v33 = 0xE000000000000000;
  }
  *(void *)(a8 + 48) = v31;
  *(void *)(a8 + 56) = v33;
  swift_beginAccess();
  uint64_t v34 = v44;
  *(void *)(a8 + 80) = v43;
  *(void *)(a8 + 88) = v34;
  swift_bridgeObjectRelease();
  uint64_t v35 = v46;
  *(void *)(a8 + 64) = v45;
  *(void *)(a8 + 72) = v35;
  *(unsigned char *)(a8 + 138) = v28;
  if (v28 != 6)
  {
    type metadata accessor for VisibilityTimingTracker();
    swift_beginAccess();
    uint64_t v36 = *(void *)(a8 + 32);
    uint64_t v37 = *(void *)(a8 + 40);
    swift_beginAccess();
    uint64_t v38 = *(void *)(a8 + 48);
    uint64_t v39 = *(void *)(a8 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v40 = objc_msgSend(a1, sel_metricsHelper);
    swift_getObjectType();
    *(void *)(a8 + 120) = sub_1B5D24040(v36, v37, v38, v39, (uint64_t)v40, v28);
    swift_release();
  }
  if (qword_1EB848648 != -1) {
    swift_once();
  }
  sub_1B5D791D0(a8);
  return a8;
}

uint64_t sub_1B5DADDC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v17 = 3;
  type metadata accessor for AppStoreAd();
  uint64_t v15 = swift_allocObject();
  return sub_1B5DADA4C(a1, a2, a3, a4, a5, &v17, a6, v15, a8);
}

uint64_t sub_1B5DADE60()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

unint64_t sub_1B5DADE98()
{
  type metadata accessor for ImageDownloader();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  unint64_t result = sub_1B5D4578C(MEMORY[0x1E4FBC860]);
  *(void *)(v0 + 112) = result;
  qword_1EB84B958 = v0;
  return result;
}

uint64_t sub_1B5DADEE4(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  uint64_t v3 = sub_1B5DB9868();
  v2[18] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[19] = v4;
  v2[20] = *(void *)(v4 + 64);
  v2[21] = swift_task_alloc();
  sub_1B5CECC98(&qword_1EB8496E0);
  v2[22] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B5DADFDC, v1, 0);
}

uint64_t sub_1B5DADFDC()
{
  uint64_t v1 = v0[17] + 112;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  if (!*(void *)(*(void *)v1 + 16)) {
    goto LABEL_8;
  }
  uint64_t v3 = v0[16];
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1B5D48480(v3);
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    uint64_t v12 = v0[21];
    uint64_t v11 = v0[22];
    uint64_t v13 = v0[19];
    uint64_t v15 = v0[17];
    uint64_t v14 = v0[18];
    uint64_t v35 = v14;
    uint64_t v16 = v0[16];
    uint64_t v36 = v16;
    uint64_t v37 = v11;
    uint64_t v17 = sub_1B5DBACD8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    v0[26] = v18;
    v0[27] = (v13 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v18(v12, v16, v14);
    uint64_t v20 = sub_1B5DB3924(&qword_1EB847A18, v19, (void (*)(uint64_t))type metadata accessor for ImageDownloader);
    unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    id v22 = (char *)swift_allocObject();
    *((void *)v22 + 2) = v15;
    *((void *)v22 + 3) = v20;
    *((void *)v22 + 4) = v15;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(&v22[v21], v12, v35);
    swift_retain_n();
    uint64_t v23 = sub_1B5DAEBB8(v37, (uint64_t)&unk_1E9DA63E8, (uint64_t)v22);
    v0[28] = v23;
    v18(v12, v36, v35);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = *(void *)v1;
    *(void *)uint64_t v1 = 0x8000000000000000;
    sub_1B5DB27C8(v23, 0, v12, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v1 = v38;
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v0[29] = v25;
    v0[30] = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v25(v12, v35);
    swift_endAccess();
    unint64_t v26 = (void *)swift_task_alloc();
    v0[31] = v26;
    unint64_t v27 = sub_1B5DB2990();
    uint64_t v28 = sub_1B5CECC98(&qword_1EB848EF0);
    void *v26 = v0;
    v26[1] = sub_1B5DAE5CC;
    uint64_t v29 = MEMORY[0x1E4FBC0F0];
    id v30 = v0 + 14;
    uint64_t v31 = v23;
    unint64_t v32 = v27;
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(v2 + 56) + 16 * v4;
  uint64_t v7 = *(void **)v6;
  v0[23] = *(void *)v6;
  char v8 = *(unsigned char *)(v6 + 8);
  sub_1B5DAF38C(v7, v8);
  swift_bridgeObjectRelease();
  if (v8)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v9 = (uint64_t (*)(void *))v0[1];
    return v9(v7);
  }
  swift_retain();
  unint64_t v33 = (void *)swift_task_alloc();
  v0[24] = v33;
  unint64_t v34 = sub_1B5DB2990();
  uint64_t v28 = sub_1B5CECC98(&qword_1EB848EF0);
  *unint64_t v33 = v0;
  v33[1] = sub_1B5DAE410;
  uint64_t v29 = MEMORY[0x1E4FBC0F0];
  id v30 = v0 + 15;
  uint64_t v31 = (uint64_t)v7;
  unint64_t v32 = v34;
LABEL_9:
  return MEMORY[0x1F4187D90](v30, v31, v32, v28, v29);
}

uint64_t sub_1B5DAE410()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  if (v0) {
    unint64_t v4 = sub_1B5DAE834;
  }
  else {
    unint64_t v4 = sub_1B5DAE53C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1B5DAE53C()
{
  uint64_t v1 = (void *)v0[23];
  sub_1B5DAF3A8(v1, 0);
  sub_1B5DAF3A8(v1, 0);
  uint64_t v2 = v0[15];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_1B5DAE5CC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 256) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  if (v0) {
    unint64_t v4 = sub_1B5DAE8BC;
  }
  else {
    unint64_t v4 = sub_1B5DAE6F8;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1B5DAE6F8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v5 = *(void **)(v0 + 112);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 208))(v2, *(void *)(v0 + 128), v4);
  swift_beginAccess();
  id v6 = v5;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v3 + 112);
  *(void *)(v3 + 112) = 0x8000000000000000;
  sub_1B5DB27C8((uint64_t)v5, 1, v2, isUniquelyReferenced_nonNull_native);
  *(void *)(v3 + 112) = v10;
  swift_bridgeObjectRelease();
  v1(v2, v4);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  char v8 = *(uint64_t (**)(id))(v0 + 8);
  return v8(v6);
}

uint64_t sub_1B5DAE834()
{
  uint64_t v1 = *(void **)(v0 + 184);
  sub_1B5DAF3A8(v1, 0);
  sub_1B5DAF3A8(v1, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1B5DAE8BC()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_beginAccess();
  uint64_t v2 = (void *)sub_1B5DB5440(v1);
  unsigned __int8 v4 = v3;
  swift_endAccess();
  sub_1B5DB29D0(v2, v4);
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1B5DAE994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a1;
  v5[3] = a4;
  char v8 = (void *)swift_task_alloc();
  v5[4] = v8;
  *char v8 = v5;
  v8[1] = sub_1B5DAEA48;
  v8[5] = a5;
  v8[6] = a4;
  return MEMORY[0x1F4188298](sub_1B5DAED54, a4, 0);
}

uint64_t sub_1B5DAEA48(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    id v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    uint64_t v8 = *(void *)(v4 + 24);
    *(void *)(v4 + 40) = a1;
    return MEMORY[0x1F4188298](sub_1B5DAEB94, v8, 0);
  }
}

uint64_t sub_1B5DAEB94()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B5DAEBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B5DBACD8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1B5DBACC8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B5CF009C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B5DBAC98();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_1B5DB2990();
  return swift_task_create();
}

uint64_t sub_1B5DAED34(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x1F4188298](sub_1B5DAED54, v1, 0);
}

uint64_t sub_1B5DAED54()
{
  v0[7] = objc_msgSend(self, sel_sharedSession);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  void *v1 = v0;
  v1[1] = sub_1B5DAEE18;
  uint64_t v2 = v0[5];
  return MEMORY[0x1F40E6608](v2, 0);
}

uint64_t sub_1B5DAEE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v4;
  *(void *)(v5 + 72) = a1;
  *(void *)(v5 + 80) = a2;
  *(void *)(v5 + 88) = a3;
  *(void *)(v5 + 96) = v3;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v6 = *(void *)(v5 + 48);
    uint64_t v7 = sub_1B5DAF284;
  }
  else
  {
    uint64_t v8 = *(void *)(v5 + 48);

    uint64_t v7 = sub_1B5DAEF40;
    uint64_t v6 = v8;
  }
  return MEMORY[0x1F4188298](v7, v6, 0);
}

uint64_t sub_1B5DAEF40()
{
  uint64_t v26 = v0;
  self;
  uint64_t v1 = (void *)swift_dynamicCastObjCClass();
  if (v1) {
    id v2 = *(id *)(v0 + 88);
  }
  uint64_t v4 = *(void *)(v0 + 72);
  unint64_t v3 = *(void *)(v0 + 80);
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB1818]);
  sub_1B5D92E54(v4, v3);
  uint64_t v6 = (void *)sub_1B5DB9878();
  id v7 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_1B5D0F2B8(v4, v3);

  if (v7)
  {
    unint64_t v8 = *(void *)(v0 + 80);
    uint64_t v9 = *(void *)(v0 + 72);

    sub_1B5D0F2B8(v9, v8);
    uint64_t v10 = *(uint64_t (**)(id))(v0 + 8);
    return v10(v7);
  }
  else
  {
    if (qword_1EB849898 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1B5DBA938();
    sub_1B5CEFDCC(v12, (uint64_t)qword_1EB84BA88);
    id v13 = v1;
    uint64_t v14 = sub_1B5DBA918();
    os_log_type_t v15 = sub_1B5DBAD88();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v25 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      if (v1) {
        id v18 = objc_msgSend(v13, sel_statusCode, v25);
      }
      else {
        id v18 = 0;
      }
      *(void *)(v0 + 16) = v18;
      *(unsigned char *)(v0 + 24) = v1 == 0;
      sub_1B5CECC98(&qword_1E9DA63D8);
      uint64_t v19 = sub_1B5DBAB48();
      *(void *)(v0 + 32) = sub_1B5CEE4B4(v19, v20, &v25);
      sub_1B5DBB058();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B5CE2000, v14, v15, "Got %s HTTP Response Code, throwing error", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9AC560](v17, -1, -1);
      MEMORY[0x1BA9AC560](v16, -1, -1);
    }
    else
    {
    }
    unint64_t v21 = *(void *)(v0 + 80);
    id v22 = *(void **)(v0 + 88);
    uint64_t v23 = *(void *)(v0 + 72);
    sub_1B5DAF518();
    swift_allocError();
    swift_willThrow();

    sub_1B5D0F2B8(v23, v21);
    id v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_1B5DAF284()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B5DAF2E8()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for ImageDownloader()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for ImageDownloader.CacheEntry(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1B5DAF38C(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_1B5DAF38C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void destroy for ImageDownloader.CacheEntry(uint64_t a1)
{
}

void sub_1B5DAF3A8(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t assignWithCopy for ImageDownloader.CacheEntry(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_1B5DAF38C(*(id *)a2, v4);
  id v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_1B5DAF3A8(v5, v6);
  return a1;
}

uint64_t initializeWithTake for ImageDownloader.CacheEntry(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ImageDownloader.CacheEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  id v5 = *(void **)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_1B5DAF3A8(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageDownloader.CacheEntry(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageDownloader.CacheEntry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B5DAF4E8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1B5DAF4F0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ImageDownloader.CacheEntry()
{
  return &type metadata for ImageDownloader.CacheEntry;
}

uint64_t sub_1B5DAF50C()
{
  return v0;
}

unint64_t sub_1B5DAF518()
{
  unint64_t result = qword_1E9DA63D0;
  if (!qword_1E9DA63D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA63D0);
  }
  return result;
}

uint64_t sub_1B5DAF56C()
{
  uint64_t v1 = sub_1B5DB9868();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B5DAF640(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1B5DB9868() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1B5CE6DD8;
  return sub_1B5DAE994(a1, v5, v6, v7, v8);
}

uint64_t sub_1B5DAF73C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1B5CECC98(&qword_1E9DA5C98);
  uint64_t v6 = sub_1B5DBB318();
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
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1B5CE93C4(v24, v35);
      }
      else
      {
        sub_1B5CEE5D8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1B5DBB488();
      sub_1B5DBAB88();
      uint64_t result = sub_1B5DBB4B8();
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
      os_log_type_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *os_log_type_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1B5CE93C4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B5DAFA3C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1B5CECC98(&qword_1EB848E40);
  char v34 = a2;
  uint64_t result = sub_1B5DBB318();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    int64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      char v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_1B5DBB488();
      sub_1B5DBB498();
      uint64_t result = sub_1B5DBB4B8();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *unint64_t v17 = v29;
      v17[1] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B5DAFD24(uint64_t a1, int a2)
{
  return sub_1B5DB1068(a1, a2, (uint64_t (*)(void))type metadata accessor for VisibilityTiming, &qword_1EB847EE0, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
}

uint64_t sub_1B5DAFD58(uint64_t a1, char a2)
{
  return sub_1B5DB1754(a1, a2, &qword_1EB848E48);
}

uint64_t sub_1B5DAFD64(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for VisibilityTiming();
  uint64_t v38 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_1B5CECC98(&qword_1EB8468B8);
  char v9 = a2;
  uint64_t result = sub_1B5DBB318();
  uint64_t v11 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v35 = v3;
    int64_t v12 = 0;
    uint64_t v13 = *(void *)(v8 + 64);
    uint64_t v37 = (void *)(v8 + 64);
    uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & v13;
    int64_t v36 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v17 = result + 64;
    while (1)
    {
      if (v16)
      {
        unint64_t v19 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        unint64_t v20 = v19 | (v12 << 6);
      }
      else
      {
        int64_t v21 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v37;
        if (v21 >= v36) {
          goto LABEL_34;
        }
        unint64_t v22 = v37[v21];
        ++v12;
        if (!v22)
        {
          int64_t v12 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_34;
          }
          unint64_t v22 = v37[v12];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_34:
              if ((v9 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v35;
                goto LABEL_41;
              }
              uint64_t v34 = 1 << *(unsigned char *)(v8 + 32);
              if (v34 >= 64) {
                bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v37 = -1 << v34;
              }
              uint64_t v3 = v35;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v12 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_43;
                }
                if (v12 >= v36) {
                  goto LABEL_34;
                }
                unint64_t v22 = v37[v12];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v12 = v23;
          }
        }
LABEL_21:
        unint64_t v16 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v12 << 6);
      }
      uint64_t v24 = *(void *)(*(void *)(v8 + 48) + 8 * v20);
      uint64_t v25 = *(void *)(v38 + 72);
      uint64_t v26 = *(void *)(v8 + 56) + v25 * v20;
      if (v9) {
        sub_1B5D81D68(v26, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
      }
      else {
        sub_1B5DB3854(v26, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
      }
      uint64_t result = sub_1B5DBB478();
      uint64_t v27 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v11 + 48) + 8 * v18) = v24;
      uint64_t result = sub_1B5D81D68((uint64_t)v7, *(void *)(v11 + 56) + v25 * v18, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
      ++*(void *)(v11 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_1B5DB00F0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1B5DB9AB8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1B5CECC98(&qword_1EB847620);
  int v46 = a2;
  uint64_t v10 = sub_1B5DBB318();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  id v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_1B5DB3924(&qword_1EB847730, 255, MEMORY[0x1E4F27DE8]);
    uint64_t result = sub_1B5DBAA78();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_1B5DB0518(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_1B5DB99A8();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_1B5CECC98((uint64_t *)&unk_1EB8496C0);
  int v47 = a2;
  uint64_t v8 = sub_1B5DBB318();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    unint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_1B5DBB488();
    sub_1B5DBAB88();
    uint64_t result = sub_1B5DBB4B8();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_1B5DB0900(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1B5DB9868();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1B5CECC98(&qword_1EB847B50);
  int v48 = a2;
  uint64_t v10 = sub_1B5DBB318();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v42 = v2;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v44 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  int64_t v43 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v49 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v50 = v8;
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  uint64_t v46 = v9;
  uint64_t v47 = v6;
  uint64_t v51 = v5;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v43) {
      break;
    }
    unint64_t v24 = v44;
    unint64_t v25 = v44[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v25 = v44[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v44[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v43) {
              goto LABEL_34;
            }
            unint64_t v25 = v44[v18];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v6 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    uint64_t v29 = 16 * v22;
    if (v48)
    {
      (*v49)(v50, v28, v51);
      uint64_t v30 = *(void *)(v9 + 56) + v29;
      id v31 = *(id *)v30;
      char v32 = *(unsigned char *)(v30 + 8);
    }
    else
    {
      (*v45)(v50, v28, v51);
      uint64_t v33 = *(void *)(v9 + 56) + v29;
      id v31 = *(id *)v33;
      char v32 = *(unsigned char *)(v33 + 8);
      sub_1B5DAF38C(*(id *)v33, v32);
    }
    sub_1B5DB3924(&qword_1EB8479C0, 255, MEMORY[0x1E4F276F0]);
    uint64_t result = sub_1B5DBAA78();
    uint64_t v34 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v16 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v35) & ~*(void *)(v16 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v6 = v47;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      uint64_t v6 = v47;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v16 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v19 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v49)(*(void *)(v11 + 48) + v19 * v27, v50, v51);
    uint64_t v20 = *(void *)(v11 + 56) + 16 * v19;
    *(void *)uint64_t v20 = v31;
    *(unsigned char *)(v20 + 8) = v32;
    ++*(void *)(v11 + 16);
    uint64_t v9 = v46;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v24 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v9 + 32);
  if (v41 >= 64) {
    bzero(v24, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v41;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_1B5DB0D5C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1B5CECC98(a3);
  char v39 = a2;
  uint64_t v7 = sub_1B5DBB318();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  unint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_1B5DBB488();
    sub_1B5DBAB88();
    uint64_t result = sub_1B5DBB4B8();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  int64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1B5DB1068(uint64_t a1, int a2, uint64_t (*a3)(void), uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v49 = a5;
  uint64_t v7 = v5;
  uint64_t v9 = a3(0);
  uint64_t v47 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9 - 8);
  unint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = *v5;
  sub_1B5CECC98(a4);
  int v48 = a2;
  uint64_t v13 = sub_1B5DBB318();
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 64);
  uint64_t v46 = (void *)(v12 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v44 = v5;
  int64_t v45 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v19 = v13 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  while (1)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v45) {
      break;
    }
    unint64_t v27 = v46;
    unint64_t v28 = v46[v26];
    ++v21;
    if (!v28)
    {
      int64_t v21 = v26 + 1;
      if (v26 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v28 = v46[v21];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v45)
        {
LABEL_34:
          swift_release();
          uint64_t v7 = v44;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v46[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v21 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v45) {
              goto LABEL_34;
            }
            unint64_t v28 = v46[v21];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v21 << 6);
LABEL_22:
    uint64_t v30 = (uint64_t *)(*(void *)(v12 + 48) + 16 * v25);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    uint64_t v33 = *(void *)(v47 + 72);
    uint64_t v34 = *(void *)(v12 + 56) + v33 * v25;
    if (v48)
    {
      sub_1B5D81D68(v34, (uint64_t)v11, v49);
    }
    else
    {
      sub_1B5DB3854(v34, (uint64_t)v11, v49);
      swift_bridgeObjectRetain();
    }
    sub_1B5DBB488();
    sub_1B5DBAB88();
    uint64_t result = sub_1B5DBB4B8();
    uint64_t v35 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v19 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v22 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    int64_t v23 = (void *)(*(void *)(v14 + 48) + 16 * v22);
    *int64_t v23 = v31;
    v23[1] = v32;
    uint64_t result = sub_1B5D81D68((uint64_t)v11, *(void *)(v14 + 56) + v33 * v22, v49);
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v7 = v44;
  unint64_t v27 = v46;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 1 << *(unsigned char *)(v12 + 32);
  if (v42 >= 64) {
    bzero(v27, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v27 = -1 << v42;
  }
  *(void *)(v12 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v7 = v14;
  return result;
}

uint64_t sub_1B5DB141C(uint64_t a1, char a2)
{
  return sub_1B5DB1440(a1, a2, (uint64_t *)&unk_1EB847F00);
}

uint64_t sub_1B5DB1428(uint64_t a1, char a2)
{
  return sub_1B5DB1440(a1, a2, (uint64_t *)&unk_1EB847EF0);
}

uint64_t sub_1B5DB1434(uint64_t a1, char a2)
{
  return sub_1B5DB1440(a1, a2, &qword_1EB8499D8);
}

uint64_t sub_1B5DB1440(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1B5CECC98(a3);
  char v37 = a2;
  uint64_t v7 = sub_1B5DBB318();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    int64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1B5DBB488();
    sub_1B5DBAB88();
    uint64_t result = sub_1B5DBB4B8();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  int64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1B5DB1754(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1B5CECC98(a3);
  uint64_t result = sub_1B5DBB318();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v10 = (uint64_t *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v32 = -1 << v11;
    uint64_t v33 = v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    int64_t v34 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }
      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v34) {
          goto LABEL_33;
        }
        unint64_t v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v23 = v10[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v34)
            {
LABEL_33:
              if (a2)
              {
                if (v33 >= 64) {
                  bzero((void *)(v6 + 64), 8 * v34);
                }
                else {
                  *uint64_t v10 = v32;
                }
                *(void *)(v6 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v9 >= v34) {
                  goto LABEL_33;
                }
                unint64_t v23 = v10[v9];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v9 = v24;
          }
        }
LABEL_30:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(*(void *)(v6 + 48) + v29);
      uint64_t v31 = *(void *)(*(void *)(v6 + 56) + v29);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_1B5DBB478();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v8 + 48) + v19) = v30;
      *(void *)(*(void *)(v8 + 56) + v19) = v31;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1B5DB1A08(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1B5CECC98(&qword_1EB848260);
  char v42 = a2;
  uint64_t v6 = sub_1B5DBB318();
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
  unint64_t v39 = v2;
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
    int64_t v24 = (void *)(v5 + 64);
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
    int64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1B5DBB488();
    sub_1B5DBAB88();
    uint64_t result = sub_1B5DBB4B8();
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
    void *v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B5DB1D30(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1B5CECC98(a3);
  uint64_t result = sub_1B5DBB318();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    char v34 = a2;
    uint64_t v33 = v4;
    int64_t v9 = 0;
    unint64_t v10 = (uint64_t *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v31 = -1 << v11;
    uint64_t v32 = v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    int64_t v14 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v17 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v18 = v17 | (v9 << 6);
      }
      else
      {
        int64_t v19 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v14) {
          goto LABEL_31;
        }
        unint64_t v20 = v10[v19];
        ++v9;
        if (!v20)
        {
          int64_t v9 = v19 + 1;
          if (v19 + 1 >= v14) {
            goto LABEL_31;
          }
          unint64_t v20 = v10[v9];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v14)
            {
LABEL_31:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v4 = v33;
                goto LABEL_38;
              }
              if (v32 >= 64) {
                bzero((void *)(v6 + 64), 8 * v14);
              }
              else {
                *unint64_t v10 = v31;
              }
              uint64_t v4 = v33;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v20 = v10[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v9 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v9 >= v14) {
                  goto LABEL_31;
                }
                unint64_t v20 = v10[v9];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v9 = v21;
          }
        }
LABEL_21:
        unint64_t v13 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v9 << 6);
      }
      uint64_t v22 = *(void *)(*(void *)(v6 + 48) + 8 * v18);
      char v23 = *(unsigned char *)(*(void *)(v6 + 56) + v18);
      uint64_t result = sub_1B5DBB478();
      uint64_t v24 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v15 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v16 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v8 + 48) + 8 * v16) = v22;
      *(unsigned char *)(*(void *)(v8 + 56) + v16) = v23;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1B5DB1FCC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B5DB2DB8(a1, a2, a3, a4, (void (*)(void))sub_1B5DB670C, &qword_1EB846BD8);
}

uint64_t sub_1B5DB1FEC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1B5D482C0(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1B5DB6900();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      int64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      void *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    int64_t v21 = (void *)(v18[7] + 16 * v12);
    *int64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      id v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B5DAFA3C(result, a4 & 1);
  uint64_t result = sub_1B5D482C0(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    unint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1B5DBB418();
  __break(1u);
  return result;
}

uint64_t sub_1B5DB212C(char a1, uint64_t a2, char a3)
{
  return sub_1B5DB32DC(a1, a2, a3, (uint64_t (*)(uint64_t))sub_1B5D49468, (uint64_t (*)(void))sub_1B5DB6ABC, &qword_1EB848E60);
}

uint64_t sub_1B5DB2168(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1B5CE76AC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t v20 = type metadata accessor for VisibilityTiming();
      return sub_1B5DB38BC(a1, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v12, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B5DB6AC8();
    goto LABEL_7;
  }
  sub_1B5DB1068(v15, a4 & 1, (uint64_t (*)(void))type metadata accessor for VisibilityTiming, &qword_1EB847EE0, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
  unint64_t v22 = sub_1B5CE76AC(a2, a3);
  if ((v16 & 1) != (v23 & 1))
  {
LABEL_15:
    uint64_t result = sub_1B5DBB418();
    __break(1u);
    return result;
  }
  unint64_t v12 = v22;
  unint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_1B5DB375C(v12, a2, a3, a1, v18, (uint64_t (*)(void))type metadata accessor for VisibilityTiming, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DB232C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1B5DB2FC4(a1, a2, a3, (uint64_t (*)(void))sub_1B5DB6B10, &qword_1EB848E48);
}

uint64_t sub_1B5DB234C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1B5D4832C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    char v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t v18 = type metadata accessor for VisibilityTiming();
      return sub_1B5DB38BC(a1, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v10, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1B5DB6B1C();
    goto LABEL_7;
  }
  sub_1B5DAFD64(v13, a3 & 1);
  unint64_t v20 = sub_1B5D4832C(a2);
  if ((v14 & 1) != (v21 & 1))
  {
LABEL_15:
    uint64_t result = sub_1B5DBB418();
    __break(1u);
    return result;
  }
  unint64_t v10 = v20;
  char v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_1B5DB3484(v10, a2, a1, v16);
}

void sub_1B5DB24A0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_1B5DB9AB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = (void *)*v3;
  unint64_t v14 = sub_1B5D48368(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1B5DB6D98();
    goto LABEL_7;
  }
  sub_1B5DB00F0(v17, a3 & 1);
  unint64_t v22 = sub_1B5D48368(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_1B5DBB418();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  unint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_1B5DB352C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_1B5DB2648(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1B5CE76AC(a2, a3);
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
      sub_1B5DB7030();
      goto LABEL_7;
    }
    sub_1B5DB0518(v15, a4 & 1);
    unint64_t v26 = sub_1B5CE76AC(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1B5DBB418();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_1B5DB99A8();
    uint64_t v21 = *(void *)(v20 - 8);
    unint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_1B5DB35E4(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

void sub_1B5DB27C8(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v27 = a1;
  uint64_t v9 = sub_1B5DB9868();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_1B5D48480(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0) {
    goto LABEL_9;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1B5DB72F4();
    goto LABEL_9;
  }
  sub_1B5DB0900(v18, a4 & 1);
  unint64_t v21 = sub_1B5D48480(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_1B5DBB418();
    __break(1u);
    return;
  }
  unint64_t v15 = v21;
LABEL_9:
  int v23 = a2 & 1;
  uint64_t v24 = *v5;
  if (v19)
  {
    uint64_t v25 = v24[7] + 16 * v15;
    sub_1B5DAF3A8(*(id *)v25, *(unsigned char *)(v25 + 8));
    *(void *)uint64_t v25 = v27;
    *(unsigned char *)(v25 + 8) = v23 != 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
    sub_1B5DB3694(v15, (uint64_t)v12, v27, v23, v24);
  }
}

unint64_t sub_1B5DB2990()
{
  unint64_t result = qword_1EB847B40;
  if (!qword_1EB847B40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB847B40);
  }
  return result;
}

void sub_1B5DB29D0(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_1B5DAF3A8(a1, a2 & 1);
  }
}

void sub_1B5DB29E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_1B5DB2A08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

void sub_1B5DB2A28(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  uint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_1B5CE76AC(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    char v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];

      *(void *)(v23 + 8 * v16) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1B5DB0D5C(v19, a4 & 1, a6);
  unint64_t v24 = sub_1B5CE76AC(a2, a3);
  if ((v20 & 1) != (v25 & 1))
  {
LABEL_17:
    sub_1B5DBB418();
    __break(1u);
    return;
  }
  unint64_t v16 = v24;
  char v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v26 = (uint64_t *)(v22[6] + 16 * v16);
  uint64_t *v26 = a2;
  v26[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v27 = v22[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v22[2] = v29;
  swift_bridgeObjectRetain();
}

uint64_t sub_1B5DB2BB4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1B5CE76AC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    BOOL v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t v20 = type metadata accessor for PreloadedContentDiagnosticPayload();
      return sub_1B5DB38BC(a1, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v12, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B5DB779C();
    goto LABEL_7;
  }
  sub_1B5DB1068(v15, a4 & 1, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload, &qword_1EB849270, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
  unint64_t v22 = sub_1B5CE76AC(a2, a3);
  if ((v16 & 1) != (v23 & 1))
  {
LABEL_15:
    uint64_t result = sub_1B5DBB418();
    __break(1u);
    return result;
  }
  unint64_t v12 = v22;
  BOOL v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_1B5DB375C(v12, a2, a3, a1, v18, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DB2D78(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B5CE7520(a1, a2, a3, a4, (void (*)(void))sub_1B5DB7A58, &qword_1EB847EE8);
}

uint64_t sub_1B5DB2D98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B5DB2DB8(a1, a2, a3, a4, (void (*)(void))sub_1B5DB7A64, (uint64_t *)&unk_1EB847F00);
}

uint64_t sub_1B5DB2DB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  uint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_1B5CE76AC(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    unint64_t v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1B5DB1440(v19, a4 & 1, a6);
  unint64_t v25 = sub_1B5CE76AC(a2, a3);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_1B5DBB418();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  unint64_t v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 16 * v16);
  *uint64_t v27 = a2;
  v27[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v28 = v22[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v22[2] = v30;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DB2F44(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B5DB2DB8(a1, a2, a3, a4, (void (*)(void))sub_1B5DB7A70, (uint64_t *)&unk_1EB847EF0);
}

uint64_t sub_1B5DB2F64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B5CE7520(a1, a2, a3, a4, (void (*)(void))sub_1B5DB7A7C, (uint64_t *)&unk_1EB847ED0);
}

uint64_t sub_1B5DB2F84(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B5DB2DB8(a1, a2, a3, a4, (void (*)(void))sub_1B5DB7C38, &qword_1EB8499D8);
}

uint64_t sub_1B5DB2FA4(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1B5DB2FC4(a1, a2, a3, (uint64_t (*)(void))sub_1B5DB7DF4, (uint64_t *)&unk_1E9DA6400);
}

uint64_t sub_1B5DB2FC4(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(void), uint64_t *a5)
{
  uint64_t v8 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1B5D4832C(a2);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    uint64_t result = a4();
LABEL_7:
    char v20 = (void *)*v8;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    uint64_t v23 = 8 * v14;
    *(void *)(v20[6] + v23) = a2;
    *(void *)(v20[7] + v23) = a1;
    uint64_t v24 = v20[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v20[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B5DB1754(result, a3 & 1, a5);
  uint64_t result = sub_1B5D4832C(a2);
  if ((v18 & 1) == (v22 & 1))
  {
    unint64_t v14 = result;
    char v20 = (void *)*v8;
    if (v18) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1B5DBB418();
  __break(1u);
  return result;
}

uint64_t sub_1B5DB3118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1B5CE76AC(a3, a4);
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
    sub_1B5DB7F9C();
LABEL_7:
    char v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1B5DB1A08(v17, a5 & 1);
  unint64_t v23 = sub_1B5CE76AC(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1B5DBB418();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  char v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
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

uint64_t sub_1B5DB32A0(char a1, uint64_t a2, char a3)
{
  return sub_1B5DB32DC(a1, a2, a3, (uint64_t (*)(uint64_t))sub_1B5D4832C, (uint64_t (*)(void))sub_1B5DB8158, &qword_1EB846B90);
}

uint64_t sub_1B5DB32DC(char a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), uint64_t *a6)
{
  uint64_t v10 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = a4(a2);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= result && (a3 & 1) == 0)
  {
    uint64_t result = a5();
LABEL_7:
    char v22 = (void *)*v10;
    if (v20)
    {
LABEL_8:
      *(unsigned char *)(v22[7] + v16) = a1 & 1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(void *)(v22[6] + 8 * v16) = a2;
    *(unsigned char *)(v22[7] + v16) = a1 & 1;
    uint64_t v24 = v22[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      void v22[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B5DB1D30(result, a3 & 1, a6);
  uint64_t result = a4(a2);
  if ((v20 & 1) == (v23 & 1))
  {
    unint64_t v16 = result;
    char v22 = (void *)*v10;
    if (v20) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_1B5DBB418();
  __break(1u);
  return result;
}

unint64_t sub_1B5DB343C(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = 8 * result;
  *(void *)(a4[6] + v4) = a2;
  *(void *)(a4[7] + v4) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

uint64_t sub_1B5DB3484(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for VisibilityTiming();
  uint64_t result = sub_1B5D81D68(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_1B5DB352C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1B5DB9AB8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_1B5DB35E4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1B5DB99A8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_1B5DB3694(unint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = sub_1B5DB9868();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a2, v11);
  uint64_t v13 = a5[7] + 16 * a1;
  *(void *)uint64_t v13 = a3;
  *(unsigned char *)(v13 + 8) = a4 & 1;
  uint64_t v14 = a5[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a5[2] = v16;
  }
  return result;
}

uint64_t sub_1B5DB375C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v11 = (void *)(a5[6] + 16 * a1);
  *uint64_t v11 = a2;
  v11[1] = a3;
  uint64_t v12 = a5[7];
  uint64_t v13 = a6(0);
  uint64_t result = sub_1B5D81D68(a4, v12 + *(void *)(*(void *)(v13 - 8) + 72) * a1, a7);
  uint64_t v15 = a5[2];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    a5[2] = v17;
  }
  return result;
}

unint64_t sub_1B5DB380C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_1B5DB3854(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B5DB38BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B5DB3924(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ImageDownloader.ImageDownloaderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1B5DB3A08);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageDownloader.ImageDownloaderError()
{
  return &type metadata for ImageDownloader.ImageDownloaderError;
}

unint64_t sub_1B5DB3A44()
{
  unint64_t result = qword_1E9DA63F0;
  if (!qword_1E9DA63F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9DA63F0);
  }
  return result;
}

void sub_1B5DB3B80()
{
  id v1 = objc_msgSend(v0, sel_traitCollection);
  id v2 = objc_msgSend(v1, sel_horizontalSizeClass);

  double v3 = 148.0;
  if (v2 != (id)1) {
    double v3 = 0.0;
  }
  if (v2 == (id)2) {
    double v4 = 260.0;
  }
  else {
    double v4 = v3;
  }
  id v84 = self;
  sub_1B5CECC98((uint64_t *)&unk_1EB849888);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B5DBEAE0;
  id v6 = sub_1B5CF826C();
  id v7 = objc_msgSend(v6, sel_leadingAnchor);

  id v8 = objc_msgSend(v0, sel_contentView);
  id v9 = objc_msgSend(v8, (SEL)&off_1E6133238 + 2);

  id v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v9);
  *(void *)(v5 + 32) = v10;
  id v11 = sub_1B5CF826C();
  id v12 = objc_msgSend(v11, sel_topAnchor);

  id v13 = objc_msgSend(v0, sel_contentView);
  id v14 = objc_msgSend(v13, (SEL)&off_1E6133530 + 3);

  id v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(void *)(v5 + 40) = v15;
  id v16 = sub_1B5CF826C();
  id v17 = objc_msgSend(v16, sel_trailingAnchor);

  id v18 = objc_msgSend(v0, sel_contentView);
  id v19 = objc_msgSend(v18, sel_trailingAnchor);

  id v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(void *)(v5 + 48) = v20;
  id v21 = sub_1B5CF826C();
  id v22 = objc_msgSend(v21, sel_heightAnchor);

  id v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, v4);
  *(void *)(v5 + 56) = v23;
  id v24 = sub_1B5CF8384();
  id v25 = objc_msgSend(v24, (SEL)&off_1E6133238 + 2);

  id v26 = objc_msgSend(v0, sel_contentView);
  id v27 = objc_msgSend(v26, (SEL)&off_1E6133238 + 2);

  id v28 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v27);
  *(void *)(v5 + 64) = v28;
  id v29 = sub_1B5CF8384();
  id v30 = objc_msgSend(v29, (SEL)&off_1E6133530 + 3);

  id v31 = sub_1B5CF826C();
  id v32 = objc_msgSend(v31, sel_bottomAnchor);

  id v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v32);
  *(void *)(v5 + 72) = v33;
  id v34 = sub_1B5CF8384();
  id v35 = objc_msgSend(v34, sel_trailingAnchor);

  id v36 = objc_msgSend(v0, sel_contentView);
  id v37 = objc_msgSend(v36, sel_trailingAnchor);

  id v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  *(void *)(v5 + 80) = v38;
  id v39 = sub_1B5CF8384();
  id v40 = objc_msgSend(v39, sel_bottomAnchor);

  id v41 = objc_msgSend(v0, sel_contentView);
  id v42 = objc_msgSend(v41, sel_bottomAnchor);

  id v43 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v42);
  *(void *)(v5 + 88) = v43;
  id v44 = sub_1B5CF840C();
  id v45 = objc_msgSend(v44, (SEL)&off_1E6133238 + 2);

  id v46 = sub_1B5CF8384();
  id v47 = objc_msgSend(v46, (SEL)&off_1E6133238 + 2);

  id v48 = objc_msgSend(v45, sel_constraintEqualToAnchor_constant_, v47, 6.0);
  *(void *)(v5 + 96) = v48;
  id v49 = sub_1B5CF840C();
  id v50 = objc_msgSend(v49, sel_topAnchor);

  id v51 = sub_1B5CF8384();
  id v52 = objc_msgSend(v51, sel_topAnchor);

  id v53 = objc_msgSend(v50, sel_constraintEqualToAnchor_constant_, v52, 6.0);
  *(void *)(v5 + 104) = v53;
  id v54 = sub_1B5CF840C();
  id v55 = objc_msgSend(v54, sel_trailingAnchor);

  id v56 = sub_1B5CF8384();
  id v57 = objc_msgSend(v56, sel_trailingAnchor);

  id v58 = objc_msgSend(v55, sel_constraintEqualToAnchor_constant_, v57, -6.0);
  *(void *)(v5 + 112) = v58;
  id v59 = sub_1B5CF840C();
  id v60 = objc_msgSend(v59, sel_bottomAnchor);

  id v61 = sub_1B5CF8384();
  id v62 = objc_msgSend(v61, sel_bottomAnchor);

  id v63 = objc_msgSend(v60, sel_constraintLessThanOrEqualToAnchor_constant_, v62, -6.0);
  *(void *)(v5 + 120) = v63;
  id v64 = sub_1B5CF8618();
  id v65 = objc_msgSend(v64, sel_leadingAnchor);

  id v66 = sub_1B5CF8384();
  id v67 = objc_msgSend(v66, sel_leadingAnchor);

  id v68 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v67);
  *(void *)(v5 + 128) = v68;
  id v69 = sub_1B5CF8618();
  id v70 = objc_msgSend(v69, sel_topAnchor);

  id v71 = sub_1B5CF8384();
  id v72 = objc_msgSend(v71, sel_topAnchor);

  id v73 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v72);
  *(void *)(v5 + 136) = v73;
  id v74 = sub_1B5CF8618();
  id v75 = objc_msgSend(v74, sel_trailingAnchor);

  id v76 = sub_1B5CF8384();
  id v77 = objc_msgSend(v76, sel_trailingAnchor);

  id v78 = objc_msgSend(v75, sel_constraintEqualToAnchor_, v77);
  *(void *)(v5 + 144) = v78;
  id v79 = sub_1B5CF8618();
  id v80 = objc_msgSend(v79, sel_bottomAnchor);

  id v81 = sub_1B5CF8384();
  id v82 = objc_msgSend(v81, sel_bottomAnchor);

  id v83 = objc_msgSend(v80, sel_constraintEqualToAnchor_, v82);
  *(void *)(v5 + 152) = v83;
  sub_1B5DBAC58();
  sub_1B5D04734();
  id v85 = (id)sub_1B5DBAC28();
  swift_bridgeObjectRelease();
  objc_msgSend(v84, sel_activateConstraints_, v85);
}

id sub_1B5DB43B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SmallCarouselCollectionViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SmallCarouselCollectionViewCell()
{
  return self;
}

Swift::Int __swiftcall CarouselAdView.collectionView(_:numberOfItemsInSection:)(UICollectionView *_, Swift::Int numberOfItemsInSection)
{
  return *(void *)(*(void *)(v2 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements) + 16);
}

char *CarouselAdView.collectionView(_:cellForItemAt:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1B5DB9868();
  uint64_t v64 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v63 = (uint64_t)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1B5DB9AB8();
  uint64_t v69 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v69 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  id v62 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  id v13 = (char *)&v60 - v12;
  MEMORY[0x1F4188790](v11);
  id v71 = (char *)&v60 - v14;
  id v15 = (int *)type metadata accessor for CarouselElement();
  id v16 = (void *)*((void *)v15 - 1);
  MEMORY[0x1F4188790](v15);
  uint64_t v72 = (uint64_t)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = sub_1B5D978D0();
  if (v18) {

  }
  uint64_t v65 = v6;
  id v19 = (void *)sub_1B5DBAAC8();
  swift_bridgeObjectRelease();
  id v20 = (void *)sub_1B5DB9A78();
  id v21 = objc_msgSend(a1, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v19, v20);

  type metadata accessor for CarouselCollectionViewCell();
  uint64_t v22 = swift_dynamicCastClass();
  if (v22)
  {
    id v23 = (void *)v22;
    id v67 = v21;
    id v24 = *(void **)(v3 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
    unint64_t v25 = sub_1B5DB9AA8();
    if ((v25 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v25 < v24[2])
    {
      sub_1B5DB8474((uint64_t)v24+ ((*((unsigned __int8 *)v16 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v16 + 80))+ v16[9] * v25, v72, (uint64_t (*)(void))type metadata accessor for CarouselElement);
      uint64_t v26 = sub_1B5DB9AA8();
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        id v16 = v24;
        id v24 = v71;
        MEMORY[0x1BA9AA1F0](v28, 0);
        uint64_t v29 = sub_1B5DB9AA8();
        id v70 = v16;
        if (v29 < v16[2]) {
          sub_1B5DA0E48(a2);
        }
        uint64_t v30 = sub_1B5DB9AA8();
        BOOL v27 = __OFADD__(v30, 1);
        uint64_t v31 = v30 + 1;
        if (!v27)
        {
          MEMORY[0x1BA9AA1F0](v31, 0);
          if (sub_1B5DB9AA8() < v70[2]) {
            sub_1B5DA0E48((uint64_t)v13);
          }
          uint64_t v68 = v8;
          type metadata accessor for ImageCache();
          swift_initStaticObject();
          uint64_t v32 = v72 + v15[6];
          id v33 = sub_1B5D922FC();
          id v34 = (void *)sub_1B5DB9818();
          id v15 = (int *)objc_msgSend(v33, sel_objectForKey_, v34);

          id v66 = v13;
          if (v15)
          {
            id v35 = v15;
            id v36 = sub_1B5D96BEC();
            id v37 = (void *)sub_1B5DB9A78();
            id v38 = (int *)objc_msgSend(v36, sel_cellForItemAtIndexPath_, v37);

            if (v38)
            {
              type metadata accessor for ImageCollectionViewCell();
              uint64_t v39 = swift_dynamicCastClass();
              if (v39)
              {
                objc_msgSend(*(id *)(v39 + OBJC_IVAR____TtC17PromotedContentUI23ImageCollectionViewCell_imageView), sel_setImage_, v35);
                id v40 = v35;
                id v35 = v38;
              }
              else
              {
                id v40 = v38;
              }
            }
          }
          swift_beginAccess();
          id v43 = (void *)sub_1B5DB518C(a2);
          swift_endAccess();
          if (!v43)
          {
            id v43 = *(void **)((char *)v23 + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken);
            id v44 = v43;
            if (!v15 && !v43)
            {
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v63, v32, v65);
              uint64_t v61 = swift_allocObject();
              swift_unknownObjectWeakInit();
              uint64_t v46 = v68;
              uint64_t v45 = v69;
              id v47 = v62;
              (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v62, a2, v68);
              unint64_t v48 = (*(unsigned __int8 *)(v45 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
              uint64_t v49 = swift_allocObject();
              *(void *)(v49 + 16) = v61;
              (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))(v49 + v48, v47, v46);
              swift_retain();
              uint64_t v50 = v63;
              id v43 = sub_1B5D923D8(v63, (void (*)(id, uint64_t))sub_1B5DB83F0, v49);
              swift_release();
              (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v50, v65);
              swift_release();
            }
          }
          (*(void (**)(uint64_t, int *, uint64_t, _UNKNOWN **))((*MEMORY[0x1E4FBC8C8] & *v23) + 0x140))(v72, v15, v3, &off_1F0EEB588);
          id v51 = *(void **)((char *)v23 + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken);
          *(void *)((char *)v23 + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken) = v43;
          id v24 = v43;

          uint64_t v52 = qword_1EB8478A0;
          id v16 = v67;
          if (v52 == -1) {
            goto LABEL_27;
          }
          goto LABEL_33;
        }
LABEL_32:
        __break(1u);
LABEL_33:
        swift_once();
LABEL_27:
        sub_1B5CECC98((uint64_t *)&unk_1EB8499F0);
        uint64_t v53 = swift_allocObject();
        *(_OWORD *)(v53 + 16) = xmmword_1B5DBDCA0;
        swift_bridgeObjectRetain();
        unint64_t result = (char *)sub_1B5DB9AA8();
        if (__OFADD__(result, 1))
        {
          __break(1u);
        }
        else
        {
          uint64_t v54 = MEMORY[0x1E4FBB550];
          uint64_t v55 = MEMORY[0x1E4FBB5C8];
          *(void *)(v53 + 56) = MEMORY[0x1E4FBB550];
          *(void *)(v53 + 64) = v55;
          *(void *)(v53 + 32) = result + 1;
          uint64_t v56 = v70[2];
          *(void *)(v53 + 96) = v54;
          *(void *)(v53 + 104) = v55;
          *(void *)(v53 + 72) = v56;
          sub_1B5DBAB18();
          swift_bridgeObjectRelease();
          id v57 = (void *)sub_1B5DBAAC8();
          swift_bridgeObjectRelease();
          objc_msgSend(v23, sel_setAccessibilityHint_, v57);

          uint64_t v58 = v68;
          id v59 = *(void (**)(char *, uint64_t))(v69 + 8);
          v59(v66, v68);
          v59(v71, v58);
          sub_1B5CF966C(v72);
          return (char *)v23;
        }
        return result;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    __break(1u);
    goto LABEL_31;
  }

  id v41 = objc_allocWithZone(MEMORY[0x1E4FB1570]);
  return (char *)objc_msgSend(v41, sel_init);
}

uint64_t sub_1B5DB4CD8(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B5DB9AB8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t result = MEMORY[0x1F4188790](v8);
  if (a1)
  {
    if (a2)
    {
      sub_1B5DB84DC();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v8);
      unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = a3;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      *(void *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      id v14 = a1;
      swift_retain();
      sub_1B5DBADE8();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1B5DB4F70(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB5570(a1, a2, (uint64_t)&unk_1EB847238, (void (*)(uint64_t))sub_1B5DB7A88);
}

uint64_t sub_1B5DB4F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B5CE76AC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *double v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B5DB77E4((uint64_t (*)(void))type metadata accessor for VisibilityTiming, &qword_1EB847EE0, (uint64_t (*)(void))type metadata accessor for VisibilityTiming, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for VisibilityTiming();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_1B5D81D68(v12 + *(void *)(v20 + 72) * v8, a3, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
    sub_1B5DB6310(v8, v11, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
    *double v4 = v11;
    swift_bridgeObjectRelease();
    id v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for VisibilityTiming();
    id v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_1B5DB518C(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1B5D48368(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B5DB6D98();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_1B5DB9AB8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_1B5DB5D00(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B5DB5284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B5CE76AC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B5DB7030();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_1B5DB99A8();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_1B5DB6310(v8, v11, MEMORY[0x1E4F27928]);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
    id v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_1B5DB99A8();
    id v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_1B5DB5440(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1B5D48480(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B5DB72F4();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_1B5DB9868();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 16 * v4);
  sub_1B5DB5FF8(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B5DB5550(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB5570(a1, a2, (uint64_t)&qword_1EB847F10, (void (*)(uint64_t))sub_1B5DB75F0);
}

uint64_t sub_1B5DB5570(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1B5CE76AC(a1, a2);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v7;
  uint64_t v16 = *v7;
  *uint64_t v7 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a4(a3);
    uint64_t v13 = v16;
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 8 * v10);
  sub_1B5DB6530(v10, v13);
  *uint64_t v7 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1B5DB5658(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB5570(a1, a2, (uint64_t)&qword_1EB847F18, (void (*)(uint64_t))sub_1B5DB75F0);
}

uint64_t sub_1B5DB5678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B5CE76AC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B5DB77E4((uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload, &qword_1EB849270, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for PreloadedContentDiagnosticPayload();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_1B5D81D68(v12 + *(void *)(v20 + 72) * v8, a3, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
    sub_1B5DB6310(v8, v11, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for PreloadedContentDiagnosticPayload();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_1B5DB5874(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB5570(a1, a2, (uint64_t)&qword_1EB847EE8, (void (*)(uint64_t))sub_1B5DB7A88);
}

uint64_t sub_1B5DB5894(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB58AC(a1, a2, (uint64_t *)&unk_1EB847F00);
}

uint64_t sub_1B5DB58A0(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB58AC(a1, a2, (uint64_t *)&unk_1EB847EF0);
}

uint64_t sub_1B5DB58AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  char v5 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B5CE76AC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v5;
  uint64_t v14 = *v5;
  *char v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B5DB7C44(a3);
    uint64_t v11 = v14;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_1B5DB6530(v8, v11);
  *char v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1B5DB598C(uint64_t a1, uint64_t a2)
{
  return sub_1B5DB58AC(a1, a2, &qword_1EB8499D8);
}

unint64_t sub_1B5DB5998(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1B5DBB0B8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_1B5DBB478();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *uint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
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

unint64_t sub_1B5DB5B30(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1B5DBB0B8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_1B5DBB478();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(type metadata accessor for VisibilityTiming() - 8) + 72);
        int64_t v17 = v16 * v3;
        uint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B5DB5D00(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5DB9AB8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_1B5DBB0B8();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_1B5DB8604(&qword_1EB847730, MEMORY[0x1E4F27DE8]);
        uint64_t v17 = sub_1B5DBAA78();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (void *)(v22 + 8 * a1);
            uint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    BOOL v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  uint64_t *v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B5DB5FF8(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5DB9868();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_1B5DBB0B8();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_1B5DB8604(&qword_1EB8479C0, MEMORY[0x1E4F276F0]);
        uint64_t v17 = sub_1B5DBAA78();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (_OWORD *)(v22 + 16 * a1);
            uint64_t v24 = (_OWORD *)(v22 + 16 * v10);
            uint64_t v12 = v34;
            if (16 * a1 != 16 * v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    BOOL v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  uint64_t *v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B5DB62F8(unint64_t a1, uint64_t a2)
{
  return sub_1B5DB6310(a1, a2, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
}

unint64_t sub_1B5DB6310(unint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v9 = ~v6;
    unint64_t result = sub_1B5DBB0B8();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v10 = (result + 1) & v9;
      while (1)
      {
        sub_1B5DBB488();
        swift_bridgeObjectRetain();
        sub_1B5DBAB88();
        uint64_t v11 = sub_1B5DBB4B8();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v9;
        if (v4 >= (uint64_t)v10) {
          break;
        }
        if (v12 < v10) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (_OWORD *)(v13 + 16 * v4);
        uint64_t v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1) {
          *uint64_t v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(a3(0) - 8) + 72);
        int64_t v18 = v17 * v4;
        unint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v9;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v10) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B5DB6530(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_1B5DBB0B8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1B5DBB488();
        swift_bridgeObjectRetain();
        sub_1B5DBAB88();
        uint64_t v9 = sub_1B5DBB4B8();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1B5DB670C()
{
  return sub_1B5DB7C44(&qword_1EB846BD8);
}

void *sub_1B5DB6718()
{
  id v1 = v0;
  sub_1B5CECC98(&qword_1E9DA5C98);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B5DBB308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    sub_1B5CEE5D8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = v19;
    v21[1] = v18;
    sub_1B5CE93C4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    id v1 = v25;
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

void *sub_1B5DB6900()
{
  id v1 = v0;
  sub_1B5CECC98(&qword_1EB848E40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B5DBB308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    int64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *int64_t v22 = v21;
    v22[1] = v20;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_1B5DB6AB0()
{
  return sub_1B5DB7A88((uint64_t *)&unk_1EB847238);
}

void *sub_1B5DB6ABC()
{
  return sub_1B5DB8164(&qword_1EB848E60);
}

void *sub_1B5DB6AC8()
{
  return sub_1B5DB77E4((uint64_t (*)(void))type metadata accessor for VisibilityTiming, &qword_1EB847EE0, (uint64_t (*)(void))type metadata accessor for VisibilityTiming, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
}

void *sub_1B5DB6B10()
{
  return sub_1B5DB7E00(&qword_1EB848E48);
}

void *sub_1B5DB6B1C()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for VisibilityTiming();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CECC98(&qword_1EB8468B8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1B5DBB308();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  unint64_t v24 = v1;
  unint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    uint64_t v19 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_1B5DB8474(*(void *)(v5 + 56) + v20, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    unint64_t result = (void *)sub_1B5D81D68((uint64_t)v4, *(void *)(v7 + 56) + v20, (uint64_t (*)(void))type metadata accessor for VisibilityTiming);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    id v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_1B5DB6D98()
{
  uint64_t v1 = sub_1B5DB9AB8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CECC98(&qword_1EB847620);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1B5DBB308();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1B5DB7030()
{
  uint64_t v35 = sub_1B5DB99A8();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CECC98((uint64_t *)&unk_1EB8496C0);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_1B5DBB308();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    id result = (void *)swift_release();
    uint64_t v28 = v36;
    uint64_t v27 = v30;
LABEL_25:
    *uint64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  id result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    id result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    int64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *int64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

char *sub_1B5DB72F4()
{
  uint64_t v39 = sub_1B5DB9868();
  uint64_t v1 = *(void *)(v39 - 8);
  MEMORY[0x1F4188790](v39);
  id v38 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CECC98(&qword_1EB847B50);
  uint64_t v33 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_1B5DBB308();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v41 = v4;
  if (!v5)
  {
    id result = (char *)swift_release();
    uint64_t v31 = v41;
    uint64_t v30 = v33;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  id result = (char *)(v4 + 64);
  unint64_t v8 = (char *)(v3 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  uint64_t v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    id result = (char *)memmove(result, v8, 8 * v9);
    uint64_t v6 = v41;
  }
  int64_t v10 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v40 = v3;
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  uint64_t v37 = v1 + 16;
  int64_t v35 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v36 = v1 + 32;
  unint64_t v15 = v38;
  uint64_t v14 = v39;
  uint64_t v16 = v41;
  while (1)
  {
    if (v13)
    {
      unint64_t v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v18 = v17 | (v10 << 6);
      uint64_t v19 = v40;
      goto LABEL_9;
    }
    int64_t v27 = v10 + 1;
    uint64_t v19 = v40;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v34 + 8 * v27);
    ++v10;
    if (!v28)
    {
      int64_t v10 = v27 + 1;
      if (v27 + 1 >= v35) {
        goto LABEL_23;
      }
      unint64_t v28 = *(void *)(v34 + 8 * v10);
      if (!v28) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v28 - 1) & v28;
    unint64_t v18 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_9:
    unint64_t v20 = *(void *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(void *)(v19 + 48) + v20, v14);
    uint64_t v21 = *(void *)(v19 + 56);
    uint64_t v22 = 16 * v18;
    uint64_t v23 = v21 + 16 * v18;
    int64_t v24 = *(void **)v23;
    char v25 = *(unsigned char *)(v23 + 8);
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v16 + 48) + v20, v15, v14);
    uint64_t v26 = *(void *)(v16 + 56) + v22;
    *(void *)uint64_t v26 = v24;
    *(unsigned char *)(v26 + 8) = v25;
    id result = (char *)sub_1B5DAF38C(v24, v25);
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v35)
  {
LABEL_23:
    id result = (char *)swift_release();
    uint64_t v30 = v33;
    uint64_t v31 = v41;
    goto LABEL_25;
  }
  unint64_t v28 = *(void *)(v34 + 8 * v29);
  if (v28)
  {
    int64_t v10 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v10 >= v35) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v34 + 8 * v10);
    ++v29;
    if (v28) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_1B5DB75D8()
{
  return sub_1B5DB75F0(&qword_1EB847F10);
}

id sub_1B5DB75E4()
{
  return sub_1B5DB75F0(&qword_1EB847F18);
}

id sub_1B5DB75F0(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1B5CECC98(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B5DBB308();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B5DB779C()
{
  return sub_1B5DB77E4((uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload, &qword_1EB849270, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload, (uint64_t (*)(void))type metadata accessor for PreloadedContentDiagnosticPayload);
}

void *sub_1B5DB77E4(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  uint64_t v6 = v4;
  uint64_t v7 = a1(0);
  uint64_t v35 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7 - 8);
  unint64_t v9 = (char *)&v32 - v8;
  sub_1B5CECC98(a2);
  uint64_t v10 = *v4;
  uint64_t v11 = sub_1B5DBB308();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v6 = v12;
    return result;
  }
  uint64_t v33 = v6;
  id result = (void *)(v11 + 64);
  unint64_t v14 = (unint64_t)((1 << *(unsigned char *)(v12 + 32)) + 63) >> 6;
  if (v12 != v10 || (unint64_t)result >= v10 + 64 + 8 * v14) {
    id result = memmove(result, (const void *)(v10 + 64), 8 * v14);
  }
  uint64_t v34 = v10 + 64;
  int64_t v16 = 0;
  *(void *)(v12 + 16) = *(void *)(v10 + 16);
  uint64_t v17 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & *(void *)(v10 + 64);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      unint64_t v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    int64_t v29 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v29 >= v20) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v34 + 8 * v29);
    ++v16;
    if (!v30)
    {
      int64_t v16 = v29 + 1;
      if (v29 + 1 >= v20) {
        goto LABEL_26;
      }
      unint64_t v30 = *(void *)(v34 + 8 * v16);
      if (!v30) {
        break;
      }
    }
LABEL_25:
    unint64_t v19 = (v30 - 1) & v30;
    unint64_t v22 = __clz(__rbit64(v30)) + (v16 << 6);
LABEL_12:
    uint64_t v23 = 16 * v22;
    unint64_t v24 = (uint64_t *)(*(void *)(v10 + 48) + 16 * v22);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    unint64_t v27 = *(void *)(v35 + 72) * v22;
    sub_1B5DB8474(*(void *)(v10 + 56) + v27, (uint64_t)v9, v36);
    unint64_t v28 = (void *)(*(void *)(v12 + 48) + v23);
    *unint64_t v28 = v25;
    v28[1] = v26;
    sub_1B5D81D68((uint64_t)v9, *(void *)(v12 + 56) + v27, v37);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v31 = v29 + 2;
  if (v31 >= v20)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v6 = v33;
    goto LABEL_28;
  }
  unint64_t v30 = *(void *)(v34 + 8 * v31);
  if (v30)
  {
    int64_t v16 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v16 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v16 >= v20) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v34 + 8 * v16);
    ++v31;
    if (v30) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1B5DB7A58()
{
  return sub_1B5DB7A88(&qword_1EB847EE8);
}

void *sub_1B5DB7A64()
{
  return sub_1B5DB7C44((uint64_t *)&unk_1EB847F00);
}

void *sub_1B5DB7A70()
{
  return sub_1B5DB7C44((uint64_t *)&unk_1EB847EF0);
}

void *sub_1B5DB7A7C()
{
  return sub_1B5DB7A88((uint64_t *)&unk_1EB847ED0);
}

void *sub_1B5DB7A88(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1B5CECC98(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B5DBB308();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *unint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B5DB7C38()
{
  return sub_1B5DB7C44(&qword_1EB8499D8);
}

void *sub_1B5DB7C44(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1B5CECC98(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B5DBB308();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *unint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B5DB7DF4()
{
  return sub_1B5DB7E00((uint64_t *)&unk_1E9DA6400);
}

void *sub_1B5DB7E00(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1B5CECC98(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B5DBB308();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = *(void *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v17) = v18;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v14) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B5DB7F9C()
{
  uint64_t v1 = v0;
  sub_1B5CECC98(&qword_1EB848260);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B5DBB308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    unint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *unint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_1B5DB8158()
{
  return sub_1B5DB8164(&qword_1EB846B90);
}

void *sub_1B5DB8164(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_1B5CECC98(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B5DBB308();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = v21 + (v10 << 6);
LABEL_12:
    char v17 = *(unsigned char *)(*(void *)(v3 + 56) + v16);
    *(void *)(*(void *)(v5 + 48) + 8 * v16) = *(void *)(*(void *)(v3 + 48) + 8 * v16);
    *(unsigned char *)(*(void *)(v5 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B5DB82EC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B5DB8324()
{
  uint64_t v1 = sub_1B5DB9AB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B5DB83F0(void *a1, char a2)
{
  uint64_t v5 = *(void *)(sub_1B5DB9AB8() - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_1B5DB4CD8(a1, a2, v6, v7);
}

uint64_t sub_1B5DB8474(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1B5DB84DC()
{
  unint64_t result = qword_1EB8499C0;
  if (!qword_1EB8499C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB8499C0);
  }
  return result;
}

uint64_t sub_1B5DB851C()
{
  uint64_t v1 = sub_1B5DB9AB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

uint64_t sub_1B5DB8604(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B5DB864C()
{
  uint64_t v0 = sub_1B5DBA938();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1B5DBA8B8();
  sub_1B5CEFE04(v4, qword_1EB84B960);
  sub_1B5CEFDCC(v4, (uint64_t)qword_1EB84B960);
  if (qword_1EB849898 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1B5CEFDCC(v0, (uint64_t)qword_1EB84BA88);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1B5DBA888();
}

id sub_1B5DB8788()
{
  v7[1] = *(double *)MEMORY[0x1E4F143B8];
  double v6 = 0.0;
  v7[0] = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if (objc_msgSend(v0, sel_getHue_saturation_brightness_alpha_, v7, &v6, &v5, &v4))
  {
    if (v6 + 0.5 <= 1.0) {
      double v1 = v6 + 0.5;
    }
    else {
      double v1 = 1.0;
    }
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithHue_saturation_brightness_alpha_, v7[0], v1, v5 * 0.75, v4);
  }
  else
  {
    return v3;
  }
}

void sub_1B5DB889C(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(self, sel_currentTraitCollection);
  id v5 = objc_msgSend(v4, sel_userInterfaceStyle);

  if (v5 == (id)2) {
    id v6 = sub_1B5DB8788();
  }
  else {
    id v6 = a1;
  }
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR___APPrivacyMarker_markerView);
  id v8 = v6;
  objc_msgSend(v7, sel_setBackgroundColor_);
  objc_msgSend(v7, sel_setTintColor_, v8);
}

void sub_1B5DB896C(void *a1)
{
  sub_1B5DB889C(a1);
  id v2 = objc_msgSend(self, sel_currentTraitCollection);
  id v3 = objc_msgSend(v2, sel_userInterfaceStyle);

  id v4 = *(void **)(v1 + OBJC_IVAR___APPrivacyMarker_markerView);
  id v5 = objc_msgSend(v4, sel_layer);
  id v6 = self;
  uint64_t v7 = &selRef_whiteColor;
  if (v3 != (id)2) {
    uint64_t v7 = &selRef_systemPurpleColor;
  }
  id v8 = [v6 *v7];
  id v9 = objc_msgSend(v8, sel_CGColor);

  objc_msgSend(v5, sel_setBorderColor_, v9);
  id v10 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v10, sel_setBorderWidth_, 1.0);
}

uint64_t sub_1B5DB8AB4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_1B5DB8E08();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  unint64_t v15 = (void *)*a5;
  unint64_t v17 = sub_1B5CE76AC(v7, v8);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v21 = v16;
  if (v15[3] >= v20)
  {
    if (a4)
    {
      unint64_t v24 = (void *)*a5;
      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1B5DB7F9C();
      unint64_t v24 = (void *)*a5;
      if (v21) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v24[(v17 >> 6) + 8] |= 1 << v17;
    unint64_t v26 = (uint64_t *)(v24[6] + 16 * v17);
    uint64_t *v26 = v11;
    v26[1] = v12;
    int64_t v27 = (void *)(v24[7] + 16 * v17);
    *int64_t v27 = v13;
    v27[1] = v14;
    uint64_t v28 = v24[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v24[2] = v30;
LABEL_13:
    uint64_t v31 = sub_1B5DB8E08();
    if (v32)
    {
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      uint64_t v37 = v33;
      uint64_t v38 = v34;
      do
      {
        id v43 = (void *)*a5;
        unint64_t v45 = sub_1B5CE76AC(v35, v36);
        uint64_t v46 = v43[2];
        BOOL v47 = (v44 & 1) == 0;
        uint64_t v48 = v46 + v47;
        if (__OFADD__(v46, v47)) {
          goto LABEL_25;
        }
        char v49 = v44;
        if (v43[3] < v48)
        {
          sub_1B5DB1A08(v48, 1);
          unint64_t v50 = sub_1B5CE76AC(v35, v36);
          if ((v49 & 1) != (v51 & 1)) {
            goto LABEL_27;
          }
          unint64_t v45 = v50;
        }
        uint64_t v52 = (void *)*a5;
        if (v49)
        {
          swift_bridgeObjectRelease();
          uint64_t v39 = (void *)(v52[7] + 16 * v45);
          swift_bridgeObjectRelease();
          *uint64_t v39 = v37;
          v39[1] = v38;
        }
        else
        {
          v52[(v45 >> 6) + 8] |= 1 << v45;
          uint64_t v53 = (uint64_t *)(v52[6] + 16 * v45);
          *uint64_t v53 = v35;
          v53[1] = v36;
          uint64_t v54 = (void *)(v52[7] + 16 * v45);
          *uint64_t v54 = v37;
          v54[1] = v38;
          uint64_t v55 = v52[2];
          BOOL v29 = __OFADD__(v55, 1);
          uint64_t v56 = v55 + 1;
          if (v29) {
            goto LABEL_26;
          }
          v52[2] = v56;
        }
        uint64_t v35 = sub_1B5DB8E08();
        uint64_t v36 = v40;
        uint64_t v37 = v41;
        uint64_t v38 = v42;
      }
      while (v40);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1B5CF0094();
    return swift_release();
  }
  sub_1B5DB1A08(v20, a4 & 1);
  unint64_t v22 = sub_1B5CE76AC(v11, v12);
  if ((v21 & 1) == (v23 & 1))
  {
    unint64_t v17 = v22;
    unint64_t v24 = (void *)*a5;
    if ((v21 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    int64_t v25 = (void *)(v24[7] + 16 * v17);
    swift_bridgeObjectRelease();
    void *v25 = v13;
    v25[1] = v14;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_1B5DBB418();
  __break(1u);
  return result;
}

uint64_t sub_1B5DB8DC0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5DB8E08()
{
  void (*v14)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  void v23[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = 16 * v6;
    uint64_t v8 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    uint64_t v11 = (uint64_t *)(*(void *)(v1 + 56) + v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v14 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    void v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(&v22, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v22;
  }
  char v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      uint64_t v18 = v0[1];
      BOOL v19 = *(void *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        uint64_t v5 = (v19 - 1) & v19;
        unint64_t v6 = __clz(__rbit64(v19)) + (v16 << 6);
        int64_t v4 = v16;
        goto LABEL_3;
      }
      uint64_t v20 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        BOOL v19 = *(void *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          char v16 = v20;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          BOOL v19 = *(void *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            char v16 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v20 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            BOOL v19 = *(void *)(v18 + 8 * v20);
            if (v19) {
              goto LABEL_10;
            }
            char v16 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              BOOL v19 = *(void *)(v18 + 8 * v16);
              if (v19) {
                goto LABEL_7;
              }
              int64_t v4 = v17 - 1;
              char v21 = v3 + 6;
              while (v17 != v21)
              {
                BOOL v19 = *(void *)(v18 + 8 * v21++);
                if (v19)
                {
                  char v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

unint64_t sub_1B5DB8FAC()
{
  sub_1B5CECC98(&qword_1E9DA5D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5DBE2D0;
  *(void *)(inited + 32) = sub_1B5DBAAF8();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = 0x30303066666623;
  *(void *)(inited + 56) = 0xE700000000000000;
  *(void *)(inited + 64) = sub_1B5DBAAF8();
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 80) = 0x30306666303023;
  *(void *)(inited + 88) = 0xE700000000000000;
  *(void *)(inited + 96) = sub_1B5DBAAF8();
  *(void *)(inited + 104) = v3;
  *(void *)(inited + 112) = 0x66663030666623;
  *(void *)(inited + 120) = 0xE700000000000000;
  *(void *)(inited + 128) = sub_1B5DBAAF8();
  *(void *)(inited + 136) = v4;
  *(void *)(inited + 144) = 0x66663030303823;
  *(void *)(inited + 152) = 0xE700000000000000;
  return sub_1B5D45990(inited);
}

id sub_1B5DB90A0()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ((sub_1B5DBABE8() & 1) == 0 || sub_1B5DBAB98() != 7) {
    return 0;
  }
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28FE8]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_1B5DBAAC8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  sub_1B5DBABA8();
  sub_1B5DBAFE8();
  v5[0] = 0;
  objc_msgSend(v2, sel_scanHexLongLong_, v5);
  if (!((LOBYTE(v5[0]) | BYTE1(v5[0])) | BYTE2(v5[0])))
  {

    return 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithRed_green_blue_alpha_, (double)BYTE2(v5[0]) / 255.0, (double)BYTE1(v5[0]) / 255.0, (double)LOBYTE(v5[0]) / 255.0, 1.0);

  return v3;
}

uint64_t sub_1B5DB9238()
{
  uint64_t result = (uint64_t)objc_msgSend(self, sel_isAppleInternalInstall);
  if (result)
  {
    sub_1B5DBAAF8();
    id v1 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
    id v2 = (void *)sub_1B5DBAAC8();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

    if (v3)
    {
      uint64_t v4 = (void *)sub_1B5DBAAC8();
      unsigned int v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

      if (v5)
      {
        id v6 = objc_msgSend(self, sel_redColor);
        sub_1B5DB896C(v6);

LABEL_5:
        return 1;
      }
      id v7 = objc_msgSend(v3, sel_stringForKey_, *MEMORY[0x1E4F473E8]);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = sub_1B5DBAAF8();
        uint64_t v11 = v10;

        if (v9 == sub_1B5DBAAF8() && v11 == v12)
        {

          swift_bridgeObjectRelease_n();
          return 0;
        }
        char v14 = sub_1B5DBB3C8();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {
          unint64_t v15 = sub_1B5DB8FAC();
          char v16 = (void *)sub_1B5DBAAC8();
          id v17 = objc_msgSend(v3, sel_dictionaryForKey_, v16);

          if (v17)
          {
            uint64_t v18 = sub_1B5DBAA58();

            unint64_t v19 = sub_1B5D6AB18(v18);
            swift_bridgeObjectRelease();
            if (v19)
            {
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              unint64_t v23 = v15;
              sub_1B5DB8AB4(v19, (uint64_t)sub_1B5DB8DC0, 0, isUniquelyReferenced_nonNull_native, &v23);
              unint64_t v15 = v23;
              swift_bridgeObjectRelease();
            }
          }
          if (*(void *)(v15 + 16) && (sub_1B5CE76AC(v9, v11), (v21 & 1) != 0))
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            id v22 = sub_1B5DB90A0();
            swift_bridgeObjectRelease();
            if (v22)
            {
              sub_1B5DB896C(v22);
              swift_bridgeObjectRelease();

              goto LABEL_5;
            }
          }
          else
          {

            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          return 0;
        }
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1B5DB95B8()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1B5DB95C8()
{
  return MEMORY[0x1F40E2ED8]();
}

uint64_t sub_1B5DB95D8()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1B5DB95E8()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1B5DB95F8()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1B5DB9608()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1B5DB9618()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1B5DB9628()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1B5DB9638()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1B5DB9648()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1B5DB9658()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1B5DB9668()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1B5DB9678()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1B5DB9688()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1B5DB9698()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1B5DB96A8()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1B5DB96B8()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1B5DB96C8()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1B5DB96D8()
{
  return MEMORY[0x1F40E3690]();
}

uint64_t sub_1B5DB96E8()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1B5DB96F8()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1B5DB9708()
{
  return MEMORY[0x1F4165698]();
}

uint64_t sub_1B5DB9718()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1B5DB9728()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1B5DB9738()
{
  return MEMORY[0x1F40E3BE0]();
}

uint64_t sub_1B5DB9748()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1B5DB9758()
{
  return MEMORY[0x1F40E3C10]();
}

uint64_t sub_1B5DB9768()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1B5DB9778()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1B5DB9788()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1B5DB9798()
{
  return MEMORY[0x1F40E4460]();
}

uint64_t sub_1B5DB97A8()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1B5DB97B8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B5DB97C8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B5DB97D8()
{
  return MEMORY[0x1F40E4740]();
}

uint64_t sub_1B5DB97E8()
{
  return MEMORY[0x1F40E4748]();
}

uint64_t sub_1B5DB97F8()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1B5DB9808()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1B5DB9818()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B5DB9828()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B5DB9838()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1B5DB9848()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1B5DB9858()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B5DB9868()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B5DB9878()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B5DB9888()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1B5DB9898()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B5DB98A8()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1B5DB98B8()
{
  return MEMORY[0x1F40E4EF0]();
}

uint64_t sub_1B5DB98C8()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1B5DB98D8()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1B5DB98E8()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1B5DB98F8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B5DB9908()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1B5DB9918()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1B5DB9928()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1B5DB9938()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1B5DB9948()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1B5DB9958()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1B5DB9968()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B5DB9978()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1B5DB9988()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_1B5DB9998()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B5DB99A8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B5DB99B8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B5DB99C8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1B5DB99D8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B5DB99E8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B5DB99F8()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1B5DB9A08()
{
  return MEMORY[0x1F40E5568]();
}

uint64_t sub_1B5DB9A18()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1B5DB9A28()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1B5DB9A38()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1B5DB9A48()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1B5DB9A58()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1B5DB9A68()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B5DB9A78()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1B5DB9A88()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1B5DB9A98()
{
  return MEMORY[0x1F4165708]();
}

uint64_t sub_1B5DB9AA8()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1B5DB9AB8()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1B5DB9AC8()
{
  return MEMORY[0x1F41463A8]();
}

uint64_t sub_1B5DB9AD8()
{
  return MEMORY[0x1F41463B0]();
}

uint64_t sub_1B5DB9AE8()
{
  return MEMORY[0x1F41463B8]();
}

uint64_t sub_1B5DB9AF8()
{
  return MEMORY[0x1F41463C0]();
}

uint64_t sub_1B5DB9B08()
{
  return MEMORY[0x1F41463C8]();
}

uint64_t sub_1B5DB9B18()
{
  return MEMORY[0x1F41463D0]();
}

uint64_t sub_1B5DB9B28()
{
  return MEMORY[0x1F41463D8]();
}

uint64_t sub_1B5DB9B38()
{
  return MEMORY[0x1F41463E0]();
}

uint64_t sub_1B5DB9B48()
{
  return MEMORY[0x1F41463E8]();
}

uint64_t sub_1B5DB9B58()
{
  return MEMORY[0x1F41463F0]();
}

uint64_t sub_1B5DB9B68()
{
  return MEMORY[0x1F41463F8]();
}

uint64_t sub_1B5DB9B78()
{
  return MEMORY[0x1F4146400]();
}

uint64_t sub_1B5DB9B88()
{
  return MEMORY[0x1F4146408]();
}

uint64_t sub_1B5DB9B98()
{
  return MEMORY[0x1F4146410]();
}

uint64_t sub_1B5DB9BA8()
{
  return MEMORY[0x1F4146418]();
}

uint64_t sub_1B5DB9BB8()
{
  return MEMORY[0x1F4146420]();
}

uint64_t sub_1B5DB9BC8()
{
  return MEMORY[0x1F4146428]();
}

uint64_t sub_1B5DB9BD8()
{
  return MEMORY[0x1F4146430]();
}

uint64_t sub_1B5DB9BE8()
{
  return MEMORY[0x1F4146438]();
}

uint64_t sub_1B5DB9BF8()
{
  return MEMORY[0x1F4146440]();
}

uint64_t sub_1B5DB9C08()
{
  return MEMORY[0x1F4146448]();
}

uint64_t sub_1B5DB9C18()
{
  return MEMORY[0x1F4146450]();
}

uint64_t sub_1B5DB9C28()
{
  return MEMORY[0x1F4146458]();
}

uint64_t sub_1B5DB9C38()
{
  return MEMORY[0x1F4146460]();
}

uint64_t sub_1B5DB9C48()
{
  return MEMORY[0x1F4146468]();
}

uint64_t sub_1B5DB9C58()
{
  return MEMORY[0x1F4146470]();
}

uint64_t sub_1B5DB9C68()
{
  return MEMORY[0x1F4146478]();
}

uint64_t sub_1B5DB9C78()
{
  return MEMORY[0x1F4146480]();
}

uint64_t sub_1B5DB9C88()
{
  return MEMORY[0x1F4146488]();
}

uint64_t sub_1B5DB9C98()
{
  return MEMORY[0x1F4146490]();
}

uint64_t sub_1B5DB9CA8()
{
  return MEMORY[0x1F4146498]();
}

uint64_t sub_1B5DB9CB8()
{
  return MEMORY[0x1F41464A0]();
}

uint64_t sub_1B5DB9CC8()
{
  return MEMORY[0x1F41464A8]();
}

uint64_t sub_1B5DB9CD8()
{
  return MEMORY[0x1F41464B0]();
}

uint64_t sub_1B5DB9CE8()
{
  return MEMORY[0x1F41464B8]();
}

uint64_t sub_1B5DB9CF8()
{
  return MEMORY[0x1F41464C0]();
}

uint64_t sub_1B5DB9D08()
{
  return MEMORY[0x1F41464C8]();
}

uint64_t sub_1B5DB9D18()
{
  return MEMORY[0x1F41464D8]();
}

uint64_t sub_1B5DB9D28()
{
  return MEMORY[0x1F41464E0]();
}

uint64_t sub_1B5DB9D38()
{
  return MEMORY[0x1F41464E8]();
}

uint64_t sub_1B5DB9D48()
{
  return MEMORY[0x1F41464F0]();
}

uint64_t sub_1B5DB9D58()
{
  return MEMORY[0x1F4146508]();
}

uint64_t sub_1B5DB9D68()
{
  return MEMORY[0x1F4146510]();
}

uint64_t sub_1B5DB9D78()
{
  return MEMORY[0x1F4146518]();
}

uint64_t sub_1B5DB9D88()
{
  return MEMORY[0x1F4146520]();
}

uint64_t sub_1B5DB9DA8()
{
  return MEMORY[0x1F4146530]();
}

uint64_t sub_1B5DB9DB8()
{
  return MEMORY[0x1F4146538]();
}

uint64_t sub_1B5DB9DC8()
{
  return MEMORY[0x1F4146540]();
}

uint64_t sub_1B5DB9DD8()
{
  return MEMORY[0x1F4146548]();
}

uint64_t sub_1B5DB9DE8()
{
  return MEMORY[0x1F4146550]();
}

uint64_t sub_1B5DB9DF8()
{
  return MEMORY[0x1F4146558]();
}

uint64_t sub_1B5DB9E08()
{
  return MEMORY[0x1F4146560]();
}

uint64_t sub_1B5DB9E18()
{
  return MEMORY[0x1F4146588]();
}

uint64_t sub_1B5DB9E28()
{
  return MEMORY[0x1F4146598]();
}

uint64_t sub_1B5DB9E38()
{
  return MEMORY[0x1F41465A0]();
}

uint64_t sub_1B5DB9E48()
{
  return MEMORY[0x1F41465B0]();
}

uint64_t sub_1B5DB9E58()
{
  return MEMORY[0x1F41465B8]();
}

uint64_t sub_1B5DB9E68()
{
  return MEMORY[0x1F41465C0]();
}

uint64_t sub_1B5DB9E78()
{
  return MEMORY[0x1F41465C8]();
}

uint64_t sub_1B5DB9E88()
{
  return MEMORY[0x1F41465D0]();
}

uint64_t sub_1B5DB9E98()
{
  return MEMORY[0x1F41465D8]();
}

uint64_t sub_1B5DB9EA8()
{
  return MEMORY[0x1F41465E0]();
}

uint64_t sub_1B5DB9EB8()
{
  return MEMORY[0x1F41465E8]();
}

uint64_t sub_1B5DB9EC8()
{
  return MEMORY[0x1F41465F0]();
}

uint64_t sub_1B5DB9ED8()
{
  return MEMORY[0x1F41465F8]();
}

uint64_t sub_1B5DB9EE8()
{
  return MEMORY[0x1F4146600]();
}

uint64_t sub_1B5DB9EF8()
{
  return MEMORY[0x1F4146608]();
}

uint64_t sub_1B5DB9F08()
{
  return MEMORY[0x1F4146610]();
}

uint64_t sub_1B5DB9F18()
{
  return MEMORY[0x1F4146618]();
}

uint64_t sub_1B5DB9F28()
{
  return MEMORY[0x1F4146620]();
}

uint64_t sub_1B5DB9F38()
{
  return MEMORY[0x1F4146628]();
}

uint64_t sub_1B5DB9F48()
{
  return MEMORY[0x1F4146630]();
}

uint64_t sub_1B5DB9F58()
{
  return MEMORY[0x1F4146638]();
}

uint64_t sub_1B5DB9F68()
{
  return MEMORY[0x1F4146640]();
}

uint64_t sub_1B5DB9F78()
{
  return MEMORY[0x1F4146648]();
}

uint64_t sub_1B5DB9F88()
{
  return MEMORY[0x1F4146650]();
}

uint64_t sub_1B5DB9F98()
{
  return MEMORY[0x1F4146678]();
}

uint64_t sub_1B5DB9FA8()
{
  return MEMORY[0x1F4146680]();
}

uint64_t sub_1B5DB9FB8()
{
  return MEMORY[0x1F4146688]();
}

uint64_t sub_1B5DB9FC8()
{
  return MEMORY[0x1F4146690]();
}

uint64_t sub_1B5DB9FD8()
{
  return MEMORY[0x1F4146698]();
}

uint64_t sub_1B5DB9FE8()
{
  return MEMORY[0x1F41466A0]();
}

uint64_t sub_1B5DB9FF8()
{
  return MEMORY[0x1F41466B0]();
}

uint64_t sub_1B5DBA008()
{
  return MEMORY[0x1F41466C0]();
}

uint64_t sub_1B5DBA018()
{
  return MEMORY[0x1F41466C8]();
}

uint64_t sub_1B5DBA028()
{
  return MEMORY[0x1F41466D0]();
}

uint64_t sub_1B5DBA038()
{
  return MEMORY[0x1F41466D8]();
}

uint64_t sub_1B5DBA048()
{
  return MEMORY[0x1F41466E0]();
}

uint64_t sub_1B5DBA058()
{
  return MEMORY[0x1F41466E8]();
}

uint64_t sub_1B5DBA068()
{
  return MEMORY[0x1F41466F0]();
}

uint64_t sub_1B5DBA078()
{
  return MEMORY[0x1F41466F8]();
}

uint64_t sub_1B5DBA088()
{
  return MEMORY[0x1F4146700]();
}

uint64_t sub_1B5DBA098()
{
  return MEMORY[0x1F4146708]();
}

uint64_t sub_1B5DBA0A8()
{
  return MEMORY[0x1F4146710]();
}

uint64_t sub_1B5DBA0B8()
{
  return MEMORY[0x1F4146718]();
}

uint64_t sub_1B5DBA0C8()
{
  return MEMORY[0x1F4146720]();
}

uint64_t sub_1B5DBA0D8()
{
  return MEMORY[0x1F4146728]();
}

uint64_t sub_1B5DBA0E8()
{
  return MEMORY[0x1F4146730]();
}

uint64_t sub_1B5DBA0F8()
{
  return MEMORY[0x1F4146738]();
}

uint64_t sub_1B5DBA108()
{
  return MEMORY[0x1F4146740]();
}

uint64_t sub_1B5DBA118()
{
  return MEMORY[0x1F4146748]();
}

uint64_t sub_1B5DBA128()
{
  return MEMORY[0x1F4146760]();
}

uint64_t sub_1B5DBA138()
{
  return MEMORY[0x1F4146768]();
}

uint64_t sub_1B5DBA148()
{
  return MEMORY[0x1F4146770]();
}

uint64_t sub_1B5DBA158()
{
  return MEMORY[0x1F4146778]();
}

uint64_t sub_1B5DBA168()
{
  return MEMORY[0x1F4146780]();
}

uint64_t sub_1B5DBA178()
{
  return MEMORY[0x1F4146788]();
}

uint64_t sub_1B5DBA188()
{
  return MEMORY[0x1F4146790]();
}

uint64_t sub_1B5DBA198()
{
  return MEMORY[0x1F4146798]();
}

uint64_t sub_1B5DBA1A8()
{
  return MEMORY[0x1F41467A0]();
}

uint64_t sub_1B5DBA1B8()
{
  return MEMORY[0x1F41467A8]();
}

uint64_t sub_1B5DBA1C8()
{
  return MEMORY[0x1F41467B0]();
}

uint64_t sub_1B5DBA1D8()
{
  return MEMORY[0x1F41467B8]();
}

uint64_t sub_1B5DBA1E8()
{
  return MEMORY[0x1F41467C0]();
}

uint64_t sub_1B5DBA1F8()
{
  return MEMORY[0x1F41467C8]();
}

uint64_t sub_1B5DBA208()
{
  return MEMORY[0x1F41467D0]();
}

uint64_t sub_1B5DBA218()
{
  return MEMORY[0x1F41467D8]();
}

uint64_t sub_1B5DBA228()
{
  return MEMORY[0x1F41467E0]();
}

uint64_t sub_1B5DBA238()
{
  return MEMORY[0x1F41467E8]();
}

uint64_t sub_1B5DBA248()
{
  return MEMORY[0x1F41467F0]();
}

uint64_t sub_1B5DBA258()
{
  return MEMORY[0x1F41467F8]();
}

uint64_t sub_1B5DBA268()
{
  return MEMORY[0x1F4146800]();
}

uint64_t sub_1B5DBA278()
{
  return MEMORY[0x1F4146808]();
}

uint64_t sub_1B5DBA288()
{
  return MEMORY[0x1F4146810]();
}

uint64_t sub_1B5DBA298()
{
  return MEMORY[0x1F4146818]();
}

uint64_t sub_1B5DBA2A8()
{
  return MEMORY[0x1F4146820]();
}

uint64_t sub_1B5DBA2B8()
{
  return MEMORY[0x1F4146840]();
}

uint64_t sub_1B5DBA2C8()
{
  return MEMORY[0x1F4146848]();
}

uint64_t sub_1B5DBA2D8()
{
  return MEMORY[0x1F4146850]();
}

uint64_t sub_1B5DBA2E8()
{
  return MEMORY[0x1F4146858]();
}

uint64_t sub_1B5DBA2F8()
{
  return MEMORY[0x1F4146860]();
}

uint64_t sub_1B5DBA308()
{
  return MEMORY[0x1F4146868]();
}

uint64_t sub_1B5DBA318()
{
  return MEMORY[0x1F4146870]();
}

uint64_t sub_1B5DBA328()
{
  return MEMORY[0x1F4146878]();
}

uint64_t sub_1B5DBA338()
{
  return MEMORY[0x1F41468A0]();
}

uint64_t sub_1B5DBA348()
{
  return MEMORY[0x1F41468B8]();
}

uint64_t sub_1B5DBA358()
{
  return MEMORY[0x1F41468C0]();
}

uint64_t sub_1B5DBA368()
{
  return MEMORY[0x1F41468D8]();
}

uint64_t sub_1B5DBA378()
{
  return MEMORY[0x1F41469F8]();
}

uint64_t sub_1B5DBA388()
{
  return MEMORY[0x1F4146A88]();
}

uint64_t sub_1B5DBA398()
{
  return MEMORY[0x1F4146A90]();
}

uint64_t sub_1B5DBA3A8()
{
  return MEMORY[0x1F4146A98]();
}

uint64_t sub_1B5DBA3B8()
{
  return MEMORY[0x1F4146AA0]();
}

uint64_t sub_1B5DBA3C8()
{
  return MEMORY[0x1F4146AA8]();
}

uint64_t sub_1B5DBA3D8()
{
  return MEMORY[0x1F4146AB0]();
}

uint64_t sub_1B5DBA3E8()
{
  return MEMORY[0x1F4146AB8]();
}

uint64_t sub_1B5DBA3F8()
{
  return MEMORY[0x1F4146AC0]();
}

uint64_t sub_1B5DBA408()
{
  return MEMORY[0x1F4146AC8]();
}

uint64_t sub_1B5DBA418()
{
  return MEMORY[0x1F4146AD0]();
}

uint64_t sub_1B5DBA428()
{
  return MEMORY[0x1F4146AD8]();
}

uint64_t sub_1B5DBA438()
{
  return MEMORY[0x1F4146AE0]();
}

uint64_t sub_1B5DBA448()
{
  return MEMORY[0x1F4146AE8]();
}

uint64_t sub_1B5DBA458()
{
  return MEMORY[0x1F4146AF0]();
}

uint64_t sub_1B5DBA468()
{
  return MEMORY[0x1F4146AF8]();
}

uint64_t sub_1B5DBA478()
{
  return MEMORY[0x1F4146B00]();
}

uint64_t sub_1B5DBA488()
{
  return MEMORY[0x1F4146B08]();
}

uint64_t sub_1B5DBA498()
{
  return MEMORY[0x1F4146B10]();
}

uint64_t sub_1B5DBA4A8()
{
  return MEMORY[0x1F4146B18]();
}

uint64_t sub_1B5DBA4B8()
{
  return MEMORY[0x1F4146B20]();
}

uint64_t sub_1B5DBA4C8()
{
  return MEMORY[0x1F4146B28]();
}

uint64_t sub_1B5DBA4D8()
{
  return MEMORY[0x1F4146B30]();
}

uint64_t sub_1B5DBA4E8()
{
  return MEMORY[0x1F4146B38]();
}

uint64_t sub_1B5DBA4F8()
{
  return MEMORY[0x1F4146B40]();
}

uint64_t sub_1B5DBA508()
{
  return MEMORY[0x1F4146B48]();
}

uint64_t sub_1B5DBA518()
{
  return MEMORY[0x1F4146B50]();
}

uint64_t sub_1B5DBA528()
{
  return MEMORY[0x1F4146B58]();
}

uint64_t sub_1B5DBA538()
{
  return MEMORY[0x1F4146B60]();
}

uint64_t sub_1B5DBA548()
{
  return MEMORY[0x1F4146B68]();
}

uint64_t sub_1B5DBA558()
{
  return MEMORY[0x1F4146B70]();
}

uint64_t sub_1B5DBA568()
{
  return MEMORY[0x1F4146B78]();
}

uint64_t sub_1B5DBA578()
{
  return MEMORY[0x1F4146B80]();
}

uint64_t sub_1B5DBA588()
{
  return MEMORY[0x1F4146B88]();
}

uint64_t sub_1B5DBA598()
{
  return MEMORY[0x1F4146B90]();
}

uint64_t sub_1B5DBA5A8()
{
  return MEMORY[0x1F4146B98]();
}

uint64_t sub_1B5DBA5B8()
{
  return MEMORY[0x1F4146BA0]();
}

uint64_t sub_1B5DBA5C8()
{
  return MEMORY[0x1F4146BA8]();
}

uint64_t sub_1B5DBA5D8()
{
  return MEMORY[0x1F4146BB0]();
}

uint64_t sub_1B5DBA5E8()
{
  return MEMORY[0x1F4146BB8]();
}

uint64_t sub_1B5DBA5F8()
{
  return MEMORY[0x1F4146BC0]();
}

uint64_t sub_1B5DBA608()
{
  return MEMORY[0x1F4146BC8]();
}

uint64_t sub_1B5DBA618()
{
  return MEMORY[0x1F4146BD0]();
}

uint64_t sub_1B5DBA628()
{
  return MEMORY[0x1F4146BD8]();
}

uint64_t sub_1B5DBA638()
{
  return MEMORY[0x1F4146BE0]();
}

uint64_t sub_1B5DBA648()
{
  return MEMORY[0x1F4146BF0]();
}

uint64_t sub_1B5DBA658()
{
  return MEMORY[0x1F4146BF8]();
}

uint64_t sub_1B5DBA668()
{
  return MEMORY[0x1F4146C00]();
}

uint64_t sub_1B5DBA678()
{
  return MEMORY[0x1F4146C08]();
}

uint64_t sub_1B5DBA688()
{
  return MEMORY[0x1F4146C10]();
}

uint64_t sub_1B5DBA698()
{
  return MEMORY[0x1F4146C18]();
}

uint64_t sub_1B5DBA6A8()
{
  return MEMORY[0x1F4146C20]();
}

uint64_t sub_1B5DBA6B8()
{
  return MEMORY[0x1F4146C28]();
}

uint64_t sub_1B5DBA6C8()
{
  return MEMORY[0x1F4146C30]();
}

uint64_t sub_1B5DBA6D8()
{
  return MEMORY[0x1F4146C38]();
}

uint64_t sub_1B5DBA6E8()
{
  return MEMORY[0x1F4146C40]();
}

uint64_t sub_1B5DBA6F8()
{
  return MEMORY[0x1F4146C48]();
}

uint64_t sub_1B5DBA708()
{
  return MEMORY[0x1F4146C50]();
}

uint64_t sub_1B5DBA718()
{
  return MEMORY[0x1F4146C58]();
}

uint64_t sub_1B5DBA728()
{
  return MEMORY[0x1F4146C60]();
}

uint64_t sub_1B5DBA738()
{
  return MEMORY[0x1F4146C68]();
}

uint64_t sub_1B5DBA748()
{
  return MEMORY[0x1F4146C70]();
}

uint64_t sub_1B5DBA758()
{
  return MEMORY[0x1F4146C78]();
}

uint64_t sub_1B5DBA768()
{
  return MEMORY[0x1F4146C80]();
}

uint64_t sub_1B5DBA778()
{
  return MEMORY[0x1F4146C88]();
}

uint64_t sub_1B5DBA788()
{
  return MEMORY[0x1F4146C90]();
}

uint64_t sub_1B5DBA798()
{
  return MEMORY[0x1F4146C98]();
}

uint64_t sub_1B5DBA7A8()
{
  return MEMORY[0x1F4146CA0]();
}

uint64_t sub_1B5DBA7B8()
{
  return MEMORY[0x1F4146CA8]();
}

uint64_t sub_1B5DBA7C8()
{
  return MEMORY[0x1F4146CB0]();
}

uint64_t sub_1B5DBA7D8()
{
  return MEMORY[0x1F4146CB8]();
}

uint64_t sub_1B5DBA7E8()
{
  return MEMORY[0x1F4146CC0]();
}

uint64_t sub_1B5DBA7F8()
{
  return MEMORY[0x1F4146CC8]();
}

uint64_t sub_1B5DBA808()
{
  return MEMORY[0x1F4146CD0]();
}

uint64_t sub_1B5DBA818()
{
  return MEMORY[0x1F4146CD8]();
}

uint64_t sub_1B5DBA828()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1B5DBA838()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B5DBA848()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1B5DBA858()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1B5DBA868()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1B5DBA878()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1B5DBA888()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1B5DBA898()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1B5DBA8A8()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t sub_1B5DBA8B8()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1B5DBA8C8()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1B5DBA8D8()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1B5DBA8E8()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1B5DBA8F8()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1B5DBA908()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1B5DBA918()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B5DBA928()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B5DBA938()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B5DBA948()
{
  return MEMORY[0x1F4165CC8]();
}

uint64_t sub_1B5DBA958()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1B5DBA968()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B5DBA978()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1B5DBA988()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B5DBA998()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1B5DBA9A8()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1B5DBA9B8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B5DBA9C8()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1B5DBA9D8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1B5DBA9E8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1B5DBA9F8()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_1B5DBAA08()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1B5DBAA18()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1B5DBAA28()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1B5DBAA38()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B5DBAA48()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1B5DBAA58()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B5DBAA68()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1B5DBAA78()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B5DBAA88()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B5DBAA98()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1B5DBAAA8()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B5DBAAB8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B5DBAAC8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B5DBAAD8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B5DBAAE8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B5DBAAF8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B5DBAB08()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1B5DBAB18()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1B5DBAB28()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1B5DBAB38()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1B5DBAB48()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B5DBAB58()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1B5DBAB68()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1B5DBAB78()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1B5DBAB88()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B5DBAB98()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B5DBABA8()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1B5DBABB8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1B5DBABC8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B5DBABD8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B5DBABE8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1B5DBAC08()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1B5DBAC18()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B5DBAC28()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B5DBAC38()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B5DBAC48()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B5DBAC58()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B5DBAC68()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B5DBAC78()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B5DBAC88()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B5DBAC98()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B5DBACA8()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B5DBACB8()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B5DBACC8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B5DBACD8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B5DBACF8()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1B5DBAD08()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B5DBAD18()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1B5DBAD28()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B5DBAD38()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1B5DBAD48()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1B5DBAD58()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1B5DBAD78()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1B5DBAD88()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B5DBAD98()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B5DBADA8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B5DBADB8()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1B5DBADC8()
{
  return MEMORY[0x1F40E66D8]();
}

uint64_t sub_1B5DBADD8()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_1B5DBADE8()
{
  return MEMORY[0x1F4146CE0]();
}

uint64_t sub_1B5DBADF8()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1B5DBAE08()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B5DBAE18()
{
  return MEMORY[0x1F4187000]();
}

uint64_t sub_1B5DBAE28()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B5DBAE38()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1B5DBAE48()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B5DBAE58()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B5DBAE68()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1B5DBAE78()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1B5DBAE88()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1B5DBAE98()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1B5DBAEA8()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1B5DBAEB8()
{
  return MEMORY[0x1F40D9728]();
}

uint64_t sub_1B5DBAEC8()
{
  return MEMORY[0x1F40D9730]();
}

uint64_t sub_1B5DBAED8()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1B5DBAEE8()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1B5DBAEF8()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B5DBAF08()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B5DBAF18()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1B5DBAF28()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1B5DBAF38()
{
  return MEMORY[0x1F4166860]();
}

uint64_t sub_1B5DBAF48()
{
  return MEMORY[0x1F41668A0]();
}

uint64_t sub_1B5DBAF58()
{
  return MEMORY[0x1F41668B0]();
}

uint64_t sub_1B5DBAF68()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1B5DBAF78()
{
  return MEMORY[0x1F4166930]();
}

uint64_t sub_1B5DBAF88()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1B5DBAF98()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1B5DBAFA8()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1B5DBAFB8()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_1B5DBAFC8()
{
  return MEMORY[0x1F4166A48]();
}

uint64_t sub_1B5DBAFD8()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1B5DBAFE8()
{
  return MEMORY[0x1F40E6B28]();
}

uint64_t sub_1B5DBAFF8()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1B5DBB008()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1B5DBB018()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1B5DBB028()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1B5DBB038()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1B5DBB048()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B5DBB058()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B5DBB068()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B5DBB078()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1B5DBB088()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B5DBB0A8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B5DBB0B8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B5DBB0C8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1B5DBB0D8()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1B5DBB0E8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1B5DBB0F8()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1B5DBB108()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1B5DBB118()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1B5DBB128()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1B5DBB138()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1B5DBB148()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1B5DBB158()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1B5DBB168()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1B5DBB178()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1B5DBB188()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1B5DBB198()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B5DBB1A8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B5DBB1B8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1B5DBB1C8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B5DBB1D8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B5DBB1E8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1B5DBB1F8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B5DBB208()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B5DBB218()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B5DBB228()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1B5DBB238()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B5DBB248()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1B5DBB258()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B5DBB268()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B5DBB278()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B5DBB288()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B5DBB298()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B5DBB2A8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B5DBB2B8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B5DBB2C8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B5DBB2D8()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1B5DBB2E8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B5DBB2F8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1B5DBB308()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B5DBB318()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B5DBB328()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B5DBB338()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B5DBB358()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B5DBB368()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B5DBB378()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B5DBB388()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B5DBB398()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1B5DBB3A8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B5DBB3B8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B5DBB3C8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B5DBB3D8()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1B5DBB3E8()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1B5DBB3F8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1B5DBB408()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B5DBB418()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B5DBB428()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1B5DBB438()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B5DBB448()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B5DBB458()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B5DBB468()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B5DBB478()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1B5DBB488()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B5DBB498()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B5DBB4A8()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1B5DBB4B8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B5DBB4C8()
{
  return MEMORY[0x1F40E6ED8]();
}

uint64_t sub_1B5DBB4D8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B5DBB4E8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x1F41053D8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x1F41053E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4166AA0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4166B18]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4166B50]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814D8](cls, protocol);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1F4186600]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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